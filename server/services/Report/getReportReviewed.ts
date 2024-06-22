import prisma from "../prisma/prisma";

const getReportReviewedService = async () => {
	const response = await prisma.report.findMany({
        where: {
            status: {
                in: ['approved', 'rejected']
            }
        }
    }
    );

	return response;
};

export default getReportReviewedService;