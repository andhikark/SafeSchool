import prisma from "../prisma/prisma";

const getReportReviewedService = async () => {
	const response = await prisma.report.findMany({
        where: {
            status: {
                in: ['approved', 'rejected']
            }
        },
        orderBy: {
            dateOfIncident: 'desc' // Order by dateOfIncident ascending
        }
    }
    );

	return response;
};

export default getReportReviewedService;