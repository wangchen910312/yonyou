package chn.bhmc.dms.cmm.sci.service.impl;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import chn.bhmc.dms.cmm.sci.service.FileMgrService;
import chn.bhmc.dms.cmm.sci.vo.FileItemVO;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.support.fileUpload.FileUploadSaveHandler;
import chn.bhmc.dms.core.support.fileUpload.FileUploadUtils;
import chn.bhmc.dms.core.support.fileUpload.ResumableInfo;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DiskFileUploadSaveHandler.java
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

public class DiskFileUploadSaveHandler implements FileUploadSaveHandler {

    private ResumableInfo resumableInfo;
    private FileMgrService fileMgrService;
    private String uploadPath;

    /*
     * @see chn.bhmc.dms.core.support.fileUpload.FileUploadSaveHandler#save(java.io.File)
     */
    @Override
    public Map<String, Object> save(File file) throws Exception {


        String dir = DateUtil.getDate("/yyyy/MM/dd");
        String dataFolderPath = uploadPath + "/" + Constants.FILE_UPLOAD_DATA_FOLDER_NAME + dir;
        String queueFolderPath = uploadPath + "/" + Constants.FILE_UPLOAD_QUEUE_FOLDER_NAME;
        String archiveFolderPath = uploadPath + "/" + Constants.FILE_UPLOAD_ARCHIVE_FOLDER_NAME + dir;

        FileUploadUtils.mkdirs(dataFolderPath);
        FileUploadUtils.mkdirs(archiveFolderPath);
        String fileName = FileUploadUtils.randomFileName(dataFolderPath);

        int fileNo = fileMgrService.selectNextFileNo(resumableInfo.resumableSessionId);

        //데이터 폴더에 파일 저장
        file.renameTo(new File(dataFolderPath + "/" + fileName));
        //큐 폴더에 Empty 파일 저장
        FileUploadUtils.createEmptyFile(queueFolderPath, dir.replaceAll("/", "") + "_" + fileName);


        FileItemVO fileItem = new FileItemVO();
        fileItem.setFileDocNo(resumableInfo.resumableSessionId);
        fileItem.setFileNo(fileNo);
        fileItem.setFileNm(resumableInfo.resumableFilename);
        fileItem.setFileSize(resumableInfo.resumableTotalSize);
        fileItem.setFileData("/" + Constants.FILE_UPLOAD_DATA_FOLDER_NAME + dir + "/" + fileName);
        fileItem.setFileTp(resumableInfo.resumableFileContentType);
        fileItem.setRegUsrId(LoginUtil.getUserId());

        fileMgrService.insertFileDocAndItem(resumableInfo.resumableSessionId, "N", LoginUtil.getUserId(), fileItem);

        Map<String, Object> data = new HashMap<String, Object>();
        data.put("FILE_DOC_NO", fileItem.getFileDocNo());
        data.put("FILE_NO", fileItem.getFileNo());
        data.put("FILE_NM", fileItem.getFileNm());
        data.put("FILE_SIZE", fileItem.getFileSize());
        data.put("FILE_PATH", fileItem.getFileData());
        data.put("FILE_ABSOLUTE_PATH", dataFolderPath + "/" + fileName);
        data.put("FILE_TP", fileItem.getFileTp());
        data.put("REG_USR_ID", fileItem.getRegUsrId());

        return data;
    }

    public void setResumableInfo(ResumableInfo resumableInfo) {
        this.resumableInfo = resumableInfo;
    }

    public void setFileMgrService(FileMgrService fileMgrService) {
        this.fileMgrService = fileMgrService;
    }

    public void setUploadPath(String uploadPath){
        this.uploadPath = uploadPath;
    }
}
