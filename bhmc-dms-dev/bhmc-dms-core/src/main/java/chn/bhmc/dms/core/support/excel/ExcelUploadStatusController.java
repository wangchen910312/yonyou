package chn.bhmc.dms.core.support.excel;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

@Controller
public class ExcelUploadStatusController extends HController {

	@RequestMapping(value = "/cmm/excelUpload/selectExcelUploadStatus.do", method=RequestMethod.POST)
	@ResponseBody
	public  Map<String, Object> selectExcelUploadStatus(
			@RequestParam("progressId") String progressId,
			@RequestParam(value="delYn", defaultValue="N") String delYn,
			HttpServletRequest request){

		Map<String, Object> result = new HashMap<String, Object>();

		Object obj = WebUtils.getSessionAttribute(request, progressId);
		if(obj == null){
			result.put("status", "FAIL");
		}else{
			ExcelUploadStatus status = (ExcelUploadStatus)obj;

			result.put("status", "SUCCESS");
			result.put("step", status.getStep());
			result.put("progress", status.getProgressRate());
			result.put("totalRowsCount", status.getTotalRowsCount());
			result.put("currentRowNum", status.getCurrentRowNum());
			result.put("errorsCount", status.getErrorsCount());
			result.put("errors", status.getErrors());
		}

		if("Y".equals(delYn)){
			WebUtils.setSessionAttribute(request, progressId, null);
		}

		return result;
	}

}
