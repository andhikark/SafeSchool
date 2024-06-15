import { Context } from "hono";
import getReportPendingService from "../../services/Report/getReportPending";



const getReportPending = async (c: Context) => {
    try {
        const response = await getReportPendingService();
        return c.json({success: true, payload: response, message: "Pending report  fetched successfully"});
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

export default getReportPending;