package chn.bhmc.dms.core.event;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DefaultDownloadEvent implements DownloadEvent {

	@Override
	public void startDownload(HttpServletRequest request, HttpServletResponse response) {
	}

	@Override
	public void endDownload(HttpServletRequest request, HttpServletResponse response) {
	}

	@Override
	public void errorDownload(HttpServletRequest request, HttpServletResponse response) {
	}

}
