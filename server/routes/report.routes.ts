import { Hono } from "hono";
import getAllReport from "../controllers/Report/getAllReport";
import getReportByType from "../controllers/Report/getReportByTypes";
import getReportByRegion from "../controllers/Report/getReportByRegion";
import updateReportApproved from "../controllers/Report/updateReport";
import updateReportRejected from "../controllers/Report/updateReportRejected";
import createReport from "../controllers/Report/createReport";
import getReportPending from "../controllers/Report/getReportPending";
import getReportReviewed from "../controllers/Report/getReportReviewed";
import getReportById from "../controllers/Report/getReportById";






const report = new Hono({ strict: false });

report.get("/allReport",getAllReport);
report.get("/reportByType",getReportByType);
report.get("/reportByRegion",getReportByRegion);
report.get("/reportPending",getReportPending);
report.get("/reportReviewed",getReportReviewed);
report.get("/reportById/:reportId",getReportById);

report.patch("/updateReportApproved/:reportId",updateReportApproved);
report.patch("/updateReportRejected/:reportId",updateReportRejected);

report.post("/createReport",createReport);

export default report;

