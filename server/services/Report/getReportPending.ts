import prisma from "../prisma/prisma";

const getReportPendingService = async () => {
	const response = await prisma.report.findMany({
        where: {
            status: 'pending'
        }
    }
    );

	return response;
};

export default getReportPendingService;