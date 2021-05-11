package chn.bhmc.dms.core.event;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface DownloadEvent {
	public static final int DOWNLOAD_STATUS_NONE = 0;
	public static final int DOWNLOAD_STATUS_INIT = 1;
	public static final int DOWNLOAD_STATUS_START = 2;
	public static final int DOWNLOAD_STATUS_END = 3;
	public static final int DOWNLOAD_STATUS_ERROR = 4;
	
	public void startDownload(HttpServletRequest request, HttpServletResponse response);
	public void endDownload(HttpServletRequest request, HttpServletResponse response);
	public void errorDownload(HttpServletRequest request, HttpServletResponse response);
}
