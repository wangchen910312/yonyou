package chn.bhmc.dms.core.event;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ExcelDownloadEvent implements DownloadEvent {
	
	private String excelExportId;  

	public ExcelDownloadEvent(HttpServletRequest request, HttpServletResponse response, String excelExportId){
		this.excelExportId = excelExportId;
		
		request.getSession().setAttribute(excelExportId, DownloadEvent.DOWNLOAD_STATUS_INIT);
	}

	@Override
	public void startDownload(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().setAttribute(excelExportId, DownloadEvent.DOWNLOAD_STATUS_START);
	}

	@Override
	public void endDownload(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().setAttribute(excelExportId, DownloadEvent.DOWNLOAD_STATUS_END);
	}

	@Override
	public void errorDownload(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().setAttribute(excelExportId, DownloadEvent.DOWNLOAD_STATUS_ERROR);
	}
}
