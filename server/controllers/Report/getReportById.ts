import { Context } from "hono";
import getReportByIdService from "../../services/Report/getReportById";





const getReportById = async (c: Context) => {
    try {
		const reportId = Number(c.req.param('reportId'));
        const response = await getReportByIdService(reportId);
        return c.json({payload: response});
    }
    catch (e) {
		console.error(e);
		return c.json(
			{
				success: false,
				payload: [],
				message: e,
			},
			200
		);
	}
}

export default getReportById;