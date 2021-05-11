package chn.bhmc.dms.core.web.servlet.view;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.AbstractView;

import chn.bhmc.dms.core.datatype.DownloadVO;
import chn.bhmc.dms.core.event.DefaultDownloadEvent;
import chn.bhmc.dms.core.event.DownloadEvent;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DownloadView.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 3. 2.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 2.     Kang Seok Han     최초 생성
 * </pre>
 */
@Component("downloadView")
public class DownloadView extends AbstractView {
    /*
     * @see org.springframework.web.servlet.view.AbstractView#renderMergedOutputModel(java.util.Map, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
     */
    @Override
    protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        DownloadVO fileInfo = (DownloadVO)model.get("FILE_INFO");
        DownloadEvent downloadEvent = null;
        boolean inline = false;

        try{
	        if(model.get("DOWNLOAD_EVENT") == null){
	        	downloadEvent = new DefaultDownloadEvent();
	        }else{
	        	downloadEvent = (DownloadEvent)model.get("DOWNLOAD_EVENT");
	        }

	        downloadEvent.startDownload(request, response);

	        if(model.get("INLINE") != null){
	            inline = (Boolean)model.get("INLINE");
	        }

	        String fileName = fileInfo.getFileName();
	        String contentType = fileInfo.getContentType();
	        long fileSize = fileInfo.getFileSize();

	        if(StringUtils.isBlank(contentType)){
	            inline = false;
	            contentType = "application/ocet-stream;charset=UTF-8";
	        }

	        // 파일 이름을 정상적으로 변경
	        fileName = fileName.replace("&#40;", "(");
	        fileName = fileName.replace("&#41;", ")");
	        fileName = fileName.replace(" ", "_");
	        fileName = URLEncoder.encode(fileName,"UTF-8");
	        fileName = fileName.replace("%28", "(");
	        fileName = fileName.replace("%29", ")");

	        response.setContentType(contentType);
	        response.setCharacterEncoding("UTF-8");
	        response.setContentLength((int)fileSize);

	        if(inline){
	            response.setHeader("Content-Disposition", "inline; filename=\"" + fileName + "\";");
	        }else{
	            response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
	        }

	        response.setHeader("Content-Transfer-Encoding", "binary");

	        //파일다운로드
	        if(ArrayUtils.isEmpty(fileInfo.getFileData())){

	            String filePath = fileInfo.getFilePath();

	            InputStream is = null;
	            ServletOutputStream out = null;

	            try{
	                is = new FileInputStream(filePath);
	                out = response.getOutputStream();

	                byte[] buf = new byte[1*1024*1024];
	                int n = 0;

	                while ((n = is.read(buf)) >= 0){
	                    out.write(buf, 0, n);
	                }

	                out.flush();
	            }catch(Exception e){
	                throw e;
	            }finally{
	                if(is != null){
	                    try {
	                        is.close();
	                    }catch(IOException e){ e.printStackTrace(); }
	                }

	                if(out != null){
	                    try {
	                        out.close();
	                    }catch(IOException e){ e.printStackTrace(); }
	                }
	            }

	        //바이너리 데이터 다운로드
	        }else{
	            ServletOutputStream out = null;
	            out = response.getOutputStream();
	            out.write(fileInfo.getFileData());
	            out.flush();
	        }

	        downloadEvent.endDownload(request, response);
        }catch(Exception ex){
        	throw ex;
        }finally{
        	if(downloadEvent != null){
        		downloadEvent.errorDownload(request, response);
        	}
        }
    }
}
