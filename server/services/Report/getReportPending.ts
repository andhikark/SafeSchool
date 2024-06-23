import prisma from "../prisma/prisma";

const getReportPendingService = async () => {
	const response = await prisma.report.findMany({
        where: {
            status: 'pending'
        },
        orderBy: {
            dateOfIncident: 'asc' // Order by dateOfIncident ascending
        }
    }
    );

	return response;
};

export default getReportPendingService;