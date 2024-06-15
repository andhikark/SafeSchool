import prisma from "../prisma/prisma";

const getReportReviewedService = async () => {
	const response = await prisma.report.findMany({
        where: {
            status: 'approved' || 'rejected'
        }
    }
    );

	return response;
};

export default getReportReviewedService;