import { Context } from "hono";
import getReportReviewedService from "../../services/Report/getReportReviewed";




const getReportReviewed = async (c: Context) => {
    try {
        const response = await getReportReviewedService();
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

export default getReportReviewed;