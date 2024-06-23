import { Context } from "hono";
import createReportService from "../../services/Report/createReport";
import checkRegionService from "../../services/Report/checkRegion";
import { Report_province, Report_gradeLevel, Report_typeOfBullying, Report_region } from "@prisma/client";
import { initializeApp } from 'firebase/app';
import { getStorage, ref, getDownloadURL, uploadBytesResumable } from 'firebase/storage';
import config from '../../config/firebase.config';

// Initialize a firebase application
initializeApp(config.firebaseConfig);

// Initialize Cloud Storage and get a reference to the service
const storage = getStorage();

const createReport = async (c: Context) => {
  const startTime = new Date().getTime();

  try {
    const formData = await c.req.formData(); // Assuming Context.req supports formData()

    // Extract fields from FormData
    const dateOfIncident = formData.get("dateOfIncident")?.toString();
    const schoolName = formData.get("schoolName")?.toString();
    const province = formData.get("province")?.toString();
    const gradeLevel = formData.get("gradeLevel")?.toString();
    const typeOfBullying = formData.get("typeOfBullying")?.toString();
    const whatHappened = formData.get("whatHappened")?.toString();
    const picture = ""; // Assuming picture is handled separately

    // Validate input data
    if (!dateOfIncident || !schoolName || !province || !gradeLevel || !typeOfBullying || !whatHappened) {
      return c.json({
        success: false,
        message: 'Missing required fields',
      }, 400);
    }

    const region = checkRegionService(province) as keyof typeof Report_region;

    // Upload image file
    let downloadURL = '';
    const file = formData.get('file') as File;

    if (file) {
      const dateTime = giveCurrentDateTime();
      const storageRef = ref(storage, `files/${file.name + ' ' + dateTime}`);

      // Create file metadata including the content type
      const metadata = {
        contentType: file.type,
      };

      // Convert the file to a buffer
      const buffer = await file.arrayBuffer();
      const uint8Array = new Uint8Array(buffer);

      // Upload the file to bucket storage
      const snapshot = await uploadBytesResumable(storageRef, uint8Array, metadata);

      // Get the download URL
      downloadURL = await getDownloadURL(snapshot.ref);
    }

    // Convert the input values to the correct enum values and create report
    const newReport = await createReportService({
      dateOfIncident,
      schoolName,
      province: province as Report_province,
      gradeLevel: gradeLevel as Report_gradeLevel,
      typeOfBullying: typeOfBullying as Report_typeOfBullying,
      whatHappened,
      picture: downloadURL, // Assign the download URL here
      region,
    });

    const endTime = new Date().getTime();
    const executionTime = endTime - startTime;

    console.log(`${executionTime} ms to handle the request`);

    return c.json({
      success: true,
      payload: newReport,
      message: "Report created successfully",
      executionTime: `${executionTime} ms`
    });
  } catch (e) {
    const endTime = new Date().getTime();
    const executionTime = endTime - startTime;

    console.error(e);
    return c.json({
      success: false,
      message: e instanceof Error ? e.message : 'An unknown error occurred',
      executionTime: `${executionTime} ms`
    }, 500);
  }
};

const giveCurrentDateTime = () => {
  const today = new Date();
  const date = `${today.getFullYear()}-${today.getMonth() + 1}-${today.getDate()}`;
  const time = `${today.getHours()}:${today.getMinutes()}:${today.getSeconds()}`;
  const dateTime = `${date} ${time}`;
  return dateTime;
};

export default createReport;
