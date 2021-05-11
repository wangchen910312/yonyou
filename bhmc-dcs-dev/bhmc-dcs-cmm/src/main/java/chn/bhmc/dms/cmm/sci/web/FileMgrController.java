package chn.bhmc.dms.cmm.sci.web;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.RandomAccessFile;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import able.com.web.HController;

import org.apache.commons.io.FileUtils;
import org.apache.commons.net.util.Base64;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import chn.bhmc.dms.cmm.sci.service.FileMgrService;
import chn.bhmc.dms.cmm.sci.service.impl.DiskFileUploadSaveHandler;
import chn.bhmc.dms.cmm.sci.vo.FileItemSearchVO;
import chn.bhmc.dms.cmm.sci.vo.FileItemVO;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.datatype.DownloadVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.support.fileUpload.FileUploadUtils;
import chn.bhmc.dms.core.support.fileUpload.HttpUtils;
import chn.bhmc.dms.core.support.fileUpload.ResumableInfo;
import chn.bhmc.dms.core.support.fileUpload.ResumableInfoStorage;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : FileMgrController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 3. 4.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 4.     Kang Seok Han     최초 생성
 * </pre>
 */
@Controller
public class FileMgrController extends HController {

    @Resource(name="fileMgrService")
    FileMgrService fileMgrService;

    /**
     * 신규 첨부문서 번호를 반환한다.
     * @return
     */
    @RequestMapping(value = "/cmm/sci/fileUpload/selectFileDocNo.do", method = RequestMethod.GET)
    @ResponseBody
    public String selectFileDocNo() throws Exception {
        return fileMgrService.selectNextFileDocNo();
    }


    /**
     * 첨부문서 번호로 등록된 파일 목록을 조회한다.
     * @param fileDocNo 첨부문서번호
     * @return 파일 목록
     */
    @RequestMapping(value = "/cmm/sci/fileUpload/selectFiles.do")
    @ResponseBody
    public SearchResult selectFiles(@RequestBody FileItemSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        String fileDocNo = searchVO.getsFileDocNo();

        List<FileItemVO> list = null;

        if(StringUtils.isEmpty(fileDocNo)){
            list = new ArrayList<FileItemVO>();
        } else {
            list = fileMgrService.selectFileItemsByFileDocNo(searchVO.getsFileDocNo());
        }

        result.setTotal(list.size());
        result.setData(list);

        return result;
    }

    /**
     * 첨부파일을 다운로드 한다.
     * @param fileDocNo
     * @param fileNo
     * @return
     */
    @RequestMapping(value = "/cmm/sci/fileUpload/selectFileDownload.do")
    public ModelAndView selectFileDownload(
            @RequestParam("fileDocNo") String fileDocNo,
            @RequestParam("fileNo") int fileNo,
            @RequestParam(value="inline", required=false, defaultValue="false") boolean inline,
            HttpServletRequest request) throws Exception {

        String uploadPath = request.getServletContext().getInitParameter("FILE_UPLOAD_PATH");
        FileItemVO fileItem = fileMgrService.selectFileItemByKey(fileDocNo, fileNo);

        DownloadVO downloadVO = new DownloadVO();
        downloadVO.setFileName(fileItem.getFileNm());
        downloadVO.setFilePath(uploadPath + fileItem.getFileData());
        downloadVO.setFileSize(fileItem.getFileSize());
        downloadVO.setContentType(fileItem.getFileTp());

        ModelAndView mav = new ModelAndView("downloadView");
        mav.addObject("FILE_INFO", downloadVO);
        mav.addObject("INLINE", inline);

        return mav;
    }

    /**
     * 첨부파일을 존재 여부를 체크한다.
     * @param fileDocNo
     * @param fileNo
     * @return
     */
    @RequestMapping(value = "/cmm/sci/fileUpload/selectExistFile.do")
    @ResponseBody
    public boolean selectExistFile(
            @RequestParam("fileDocNo") String fileDocNo,
            @RequestParam("fileNo") int fileNo,
            HttpServletRequest request) throws Exception {

        FileItemVO fileItem = fileMgrService.selectFileItemByKey(fileDocNo, fileNo);

        if(fileItem == null){
            return false;
        }

        File file = new File(request.getServletContext().getInitParameter("FILE_UPLOAD_PATH") + fileItem.getFileData());

        return file.exists();
    }

    @RequestMapping(value = "/cmm/sci/fileUpload/selectResumableFileUpload.do", method = RequestMethod.POST)
    @ResponseStatus(value = HttpStatus.OK)
    @ResponseBody
    public Map<String, Object> postUpload(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        int resumableChunkNumber = selectResumableChunkNumber(request);

        ResumableInfo info = selectResumableInfo(request);
        RandomAccessFile raf = null;

        try{
            raf = new RandomAccessFile(info.resumableFilePath, "rw");
            raf.seek((resumableChunkNumber - 1) * (long)info.resumableChunkSize);

            InputStream is = request.getInputStream();
            long readed = 0;
            long contentLength = request.getContentLength();
            byte[] bytes = new byte[1024 * 100];
            while(readed < contentLength) {
                int r = is.read(bytes);
                if (r < 0)  {
                    break;
                }
                raf.write(bytes, 0, r);
                readed += r;
            }
        }finally{
            if(raf != null){
                try{
                    raf.close();
                }catch(Exception e){}
            }
        }

        info.uploadedChunks.add(new ResumableInfo.ResumableChunkNumber(resumableChunkNumber));

        DiskFileUploadSaveHandler fileUploadSaveHandler = new DiskFileUploadSaveHandler();
        fileUploadSaveHandler.setResumableInfo(info);
        fileUploadSaveHandler.setFileMgrService(fileMgrService);
        fileUploadSaveHandler.setUploadPath(request.getServletContext().getInitParameter("FILE_UPLOAD_PATH"));

        info.setDataSaveStrategy(fileUploadSaveHandler);

        if (info.checkIfUploadFinished()) {
            ResumableInfoStorage.getInstance().remove(info);

            Map<String, Object> result = new HashMap<String, Object>();
            result.put("status", "finished");
            result.put("fileDocNo", info.saveFileInfo.get("FILE_DOC_NO"));
            result.put("fileNo", info.saveFileInfo.get("FILE_NO"));
            result.put("fileNm", info.saveFileInfo.get("FILE_NM"));
            result.put("filePath", info.saveFileInfo.get("FILE_PATH"));
            result.put("fileSize", info.saveFileInfo.get("FILE_SIZE"));

            return result;
        } else {
            Map<String, Object> result = new HashMap<String, Object>();
            result.put("status", "upload");

            return result;
        }
    }

    @RequestMapping(value = "/cmm/sci/fileUpload/selectResumableFileUpload.do", method = RequestMethod.GET)
    public void getUpload(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        int resumableChunkNumber = selectResumableChunkNumber(request);

        ResumableInfo info = selectResumableInfo(request);

        if (info.uploadedChunks.contains(new ResumableInfo.ResumableChunkNumber(resumableChunkNumber))) {
            response.setStatus(HttpServletResponse.SC_OK);
            Map<String, Object> result = new HashMap<String, Object>();
            result.put("status", "upload");
        } else {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    /**
     * 첨부문서를 삭제한다.
     * @return
     */
    @RequestMapping(value = "/cmm/sci/fileUpload/deleteFileDoc.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> deleteFileDoc(@RequestParam("fileDocNo") String fileDocNo) throws Exception {
        Map<String, String> result = new HashMap<String, String>();
        String resultCd = "S";
        String resultMessage = "";

        try{
            fileMgrService.deleteFileDoc(fileDocNo);
        }catch(Exception e){
            resultCd = "F";
            //TODO [한강석] 첨부문서삭제 오류 에러메세지 다국어 처리 필요
            resultMessage = "";
        }

        result.put("resultCd", resultCd);
        result.put("resultMessage", resultMessage);

        return result;
    }

    /**
     * 첨부파일을 삭제한다.
     * @return
     */
    @RequestMapping(value = "/cmm/sci/fileUpload/deleteFiles.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteFiles(@RequestBody List<FileItemVO> deleteFiles) throws Exception {
        fileMgrService.deleteFileItems(deleteFiles);
        return true;
    }


    /**
     * 첨부파일을 등록한다.
     * @return
     */
    @RequestMapping(value = "/cmm/sci/fileUpload/selectFileUpload.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean selectFileUpload(@RequestBody FileItemVO fileItemVO, HttpServletRequest request) throws Exception {

        String uploadPath = request.getServletContext().getInitParameter("FILE_UPLOAD_PATH");

        String dir = DateUtil.getDate("/yyyy/MM/dd");
        String dataFolderPath = uploadPath + "/" + Constants.FILE_UPLOAD_DATA_FOLDER_NAME + dir;
        String queueFolderPath = uploadPath + "/" + Constants.FILE_UPLOAD_QUEUE_FOLDER_NAME;
        String archiveFolderPath = uploadPath + "/" + Constants.FILE_UPLOAD_ARCHIVE_FOLDER_NAME + dir;

        FileUploadUtils.mkdirs(dataFolderPath);
        FileUploadUtils.mkdirs(archiveFolderPath);
        String fileName = FileUploadUtils.randomFileName(dataFolderPath);

        int fileNo = fileMgrService.selectNextFileNo(fileItemVO.getFileDocNo());

        //FileUtils.writeStringToFile(new File(uploadPath + filePath), DigestUtils.decodeBase64(fileItemVO.getFileData()));
        byte[] fileData = Base64.decodeBase64(fileItemVO.getFileData());
        FileUtils.writeByteArrayToFile(new File(dataFolderPath + "/" + fileName), fileData);

        //큐 폴더에 Empty 파일 저장
        FileUploadUtils.createEmptyFile(queueFolderPath, dir.replaceAll("/", "") + "_" + fileName);

        fileItemVO.setFileNo(fileNo);
        fileItemVO.setFileData("/" + Constants.FILE_UPLOAD_DATA_FOLDER_NAME + dir + "/" + fileName);
        fileItemVO.setFileSize(fileData.length);
        fileMgrService.insertFileDocAndItem(fileItemVO.getFileDocNo(), "N", LoginUtil.getUserId(), fileItemVO);

        return true;
    }

    private int selectResumableChunkNumber(HttpServletRequest request) {
        return HttpUtils.toInt(request.getParameter("resumableChunkNumber"), -1);
    }

    private ResumableInfo selectResumableInfo(HttpServletRequest request) throws ServletException {
        String uploadTempPath = request.getServletContext().getInitParameter("FILE_UPLOAD_TEMP_PATH");

        String resumableSessionId = request.getParameter("resumableSessionId");
        int resumableChunkSize = HttpUtils.toInt(request.getParameter("resumableChunkSize"), -1);
        long resumableTotalSize = HttpUtils.toLong(request.getParameter("resumableTotalSize"), -1);
        String resumableIdentifier = request.getParameter("resumableIdentifier");
        String resumableFilename = request.getParameter("resumableFilename");
        String resumableFileContentType = request.getParameter("resumableFileContentType");
        String resumableRelativePath = request.getParameter("resumableRelativePath");

        new File(uploadTempPath).mkdir();
        String resumableFilePath = new File(uploadTempPath, resumableFilename).getAbsolutePath() + ".temp";

        ResumableInfoStorage storage = ResumableInfoStorage.getInstance();

        ResumableInfo info = storage.get(
            resumableSessionId, resumableChunkSize, resumableTotalSize,
            resumableIdentifier, resumableFilename, resumableFileContentType,
            resumableRelativePath, resumableFilePath
        );

        if (!info.vaild()) {
            storage.remove(info);
            throw new ServletException("Invalid request params.");
        }
        return info;
    }
}
