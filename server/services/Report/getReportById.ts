import prisma from "../prisma/prisma";

const getReportByIdService = async (id: number) => {
	const response = await prisma.report.findUnique({
        where: {
            reportId:id
        }
    }
    );

	return response;
};

export default getReportByIdService;