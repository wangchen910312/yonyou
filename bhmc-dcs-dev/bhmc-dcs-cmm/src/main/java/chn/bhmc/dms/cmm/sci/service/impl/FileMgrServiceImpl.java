package chn.bhmc.dms.cmm.sci.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.FileMgrService;
import chn.bhmc.dms.cmm.sci.service.dao.FileMgrDAO;
import chn.bhmc.dms.cmm.sci.vo.FileDocVO;
import chn.bhmc.dms.cmm.sci.vo.FileItemVO;
import egovframework.rte.fdl.cmmn.exception.FdlException;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : FileMgrServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 25.     Kang Seok Han     최초 생성
 * </pre>
 */

@Service("fileMgrService")
public class FileMgrServiceImpl  extends HService implements FileMgrService {

    @Resource(name="fileMgrDAO")
    FileMgrDAO fileMgrDAO;

    @Resource(name="fileDocNoIdgenService")
    EgovIdGnrService fileDocNoIdgenService;

    /*
     * @see chn.bhmc.dms.cmm.sci.service.FileMgrService#insertFileDoc(chn.bhmc.dms.cmm.sci.vo.FileDocVO)
     */
    @Override
    public int insertFileDoc(FileDocVO fileDocVO)  throws Exception {
        synchronized(FileMgrServiceImpl.class){
            return fileMgrDAO.insertFileDoc(fileDocVO);
        }
    }

    /*
     * @see chn.bhmc.dms.cmm.sci.service.FileMgrService#insertFileDocAndItem(java.lang.String, java.lang.String, java.lang.String, chn.bhmc.dms.cmm.sci.vo.FileItemVO)
     */
    @Override
    public int insertFileDocAndItem(String fileDocNo, String tempYn, String usrId, FileItemVO fileItem) throws Exception {

        FileDocVO fileDocVO = selectFileDocByKey(fileDocNo);

        if(fileDocVO == null){
            fileDocVO = new FileDocVO();
            fileDocVO.setFileDocNo(fileDocNo);
            fileDocVO.setTempYn(tempYn);
            fileDocVO.setRegUsrId(usrId);

            insertFileDoc(fileDocVO);
        }

        fileItem.setFileDocNo(fileDocNo);

        return insertFileItem(fileItem);

    }

    /*
     * @see chn.bhmc.dms.cmm.sci.service.FileMgrService#updateFileDoc(chn.bhmc.dms.cmm.sci.vo.FileDocVO)
     */
    @Override
    public int updateFileDoc(FileDocVO fileDocVO)  throws Exception {
        synchronized(FileMgrServiceImpl.class){
            return fileMgrDAO.updateFileDoc(fileDocVO);
        }
    }

    /*
     * @see chn.bhmc.dms.cmm.sci.service.FileMgrService#updateFileDocEnabled(chn.bhmc.dms.cmm.sci.vo.FileDocVO)
     */
    @Override
    public int updateFileDocEnabled(FileDocVO fileDocVO)  throws Exception {
        return fileMgrDAO.updateFileDocEnabled(fileDocVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.sci.service.FileMgrService#deleteFileDoc(java.lang.String)
     */
    @Override
    public int deleteFileDoc(String fileDocNo)  throws Exception {
        synchronized(FileMgrServiceImpl.class){
            return fileMgrDAO.deleteFileDoc(fileDocNo);
        }
    }

    /*
     * @see chn.bhmc.dms.cmm.sci.service.FileMgrService#deleteFileDocsForTemp(int)
     */
    @Override
    public int deleteFileDocsForTemp(int elapsedDate)  throws Exception {
        synchronized(FileMgrServiceImpl.class){
            return fileMgrDAO.deleteFileDocsForTemp(elapsedDate);
        }
    }

    /*
     * @see chn.bhmc.dms.cmm.sci.service.FileMgrService#selectFileDocByKey(java.lang.String)
     */
    @Override
    public FileDocVO selectFileDocByKey(String fileDocNo)  throws Exception {
        synchronized(FileMgrServiceImpl.class){
            return fileMgrDAO.selectFileDocByKey(fileDocNo);
        }
    }

    /*
     * @see chn.bhmc.dms.cmm.sci.service.FileMgrService#insertFileItem(chn.bhmc.dms.cmm.sci.vo.FileItemVO)
     */
    @Override
    public int insertFileItem(FileItemVO fileItemVO)  throws Exception {
        return fileMgrDAO.insertFileItem(fileItemVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.sci.service.FileMgrService#deleteFileItem(List<FileItemVO> deleteFiles)
     */
    @Override
    public void deleteFileItems(List<FileItemVO> deleteFiles)  throws Exception {
        for(FileItemVO fileItem : deleteFiles) {
            deleteFileItem(fileItem.getFileDocNo(), fileItem.getFileNo());
        }

    }

    /*
     * @see chn.bhmc.dms.cmm.sci.service.FileMgrService#deleteFileItem(java.lang.String, int)
     */
    @Override
    public int deleteFileItem(String fileDocNo, int fileItemNo)  throws Exception {
        return fileMgrDAO.deleteFileItem(fileDocNo, fileItemNo);
    }

    /*
     * @see chn.bhmc.dms.cmm.sci.service.FileMgrService#deleteFileItemsByFileDocNo(java.lang.String)
     */
    @Override
    public int deleteFileItemsByFileDocNo(String fileDocNo)  throws Exception {
        return fileMgrDAO.deleteFileItemsByFileDocNo(fileDocNo);
    }

    /*
     * @see chn.bhmc.dms.cmm.sci.service.FileMgrService#deleteFileItemsForTemp(int)
     */
    @Override
    public int deleteFileItemsForTemp(int elapsedDate)  throws Exception {
        return fileMgrDAO.deleteFileItemsForTemp(elapsedDate);
    }

    /*
     * @see chn.bhmc.dms.cmm.sci.service.FileMgrService#selectNextFileNo(java.lang.String)
     */
    @Override
    public int selectNextFileNo(String fileDocNo) throws Exception {
        return fileMgrDAO.selectNextFileNo(fileDocNo);
    }

    /*
     * @see chn.bhmc.dms.cmm.sci.service.FileMgrService#selectFileItemByKey(java.lang.String, int)
     */
    @Override
    public FileItemVO selectFileItemByKey(String fileDocNo, int fileItemNo)  throws Exception {
        return fileMgrDAO.selectFileItemByKey(fileDocNo, fileItemNo);
    }

    /*
     * @see chn.bhmc.dms.cmm.sci.service.FileMgrService#selectFileItemsByFileDocNo(java.lang.String)
     */
    @Override
    public List<FileItemVO> selectFileItemsByFileDocNo(String fileDocNo)  throws Exception {
        return fileMgrDAO.selectFileItemsByFileDocNo(fileDocNo);
    }

    /*
     * @see chn.bhmc.dms.cmm.sci.service.FileMgrService#selectNextFileDocNo()
     */
    @Override
    public String selectNextFileDocNo() throws Exception {
        try {
            return fileDocNoIdgenService.getNextStringId();
        } catch (FdlException e) {
            throw processException("global.err.idgen", new String[]{messageSource.getMessage("global.lbl.fileDoc", null, LocaleContextHolder.getLocale())});
        }
    }
}
