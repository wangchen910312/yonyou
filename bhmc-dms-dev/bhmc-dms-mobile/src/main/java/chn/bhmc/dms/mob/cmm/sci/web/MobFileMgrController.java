package chn.bhmc.dms.mob.cmm.sci.web;

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
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;

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

@RequestMapping("/mob")
@Controller
public class MobFileMgrController extends HController {

    @Resource(name="fileMgrService")
    FileMgrService fileMgrService;

    /**
     *
     * @return
     */
    @RequestMapping(value = "/cmm/sci/fileUpload/selectFileDocNo.do", method = RequestMethod.GET)
    @ResponseBody
    public String selectFileDocNo() throws Exception {
        return fileMgrService.selectNextFileDocNo();
    }


    /**
     * 첨부문서번호로 등록된 파일 목록 데이터를 반환한다.
     * @param fileDocNo 첨부문서번호
     * @return 첨부파일목록
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

        String uploadPath = request.getServletContext().getInitParameter("FILE_UPLOAD_PATH") + "/" + Constants.FILE_UPLOAD_DATA_FOLDER_NAME;
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


    @RequestMapping(value = "/cmm/sci/fileUpload/selectResumableFileUpload.do", method = RequestMethod.POST)
    @ResponseStatus(value = HttpStatus.OK)
    @ResponseBody
    public Map<String, Object> postUpload(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        int resumableChunkNumber = selectResumableChunkNumber(request);

        ResumableInfo info = selectResumableInfo(request);
        RandomAccessFile raf = new RandomAccessFile(info.resumableFilePath, "rw");
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
        raf.close();

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
            result.put("fileDocNo", info.resumableSessionId);
            result.put("fileNo", info.resumableFileNo);
            result.put("fileNm", info.resumableFilename);
            result.put("fileSize", info.resumableTotalSize);

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
     *
     * @return
     */
    @RequestMapping(value = "/cmm/sci/fileUpload/deleteFiles.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteFiles(@RequestBody List<FileItemVO> deleteFiles) throws Exception {
        fileMgrService.deleteFileItems(deleteFiles);
        return true;
    }


    /**
     *
     * @return
     */
    @RequestMapping(value = "/cmm/sci/fileUpload/selectFileUpload.do", method = RequestMethod.POST)
    @ResponseBody
    public synchronized boolean selectFileUpload(@RequestBody FileItemVO fileItemVO, HttpServletRequest request) throws Exception {  //synchronized로 동기화시킴 loop 처리로 인하여
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

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();

        if(fileItemVO.getRegUsrId() ==null || "".equals(fileItemVO.getRegUsrId())){ //등록유저 id가 없을경우 로그인 유저아이디로 대체
            fileItemVO.setRegUsrId(mobLoginVO.getUserId());
        }

        fileMgrService.insertFileDocAndItem(fileItemVO.getFileDocNo(), "N", mobLoginVO.getUserId(), fileItemVO);

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
