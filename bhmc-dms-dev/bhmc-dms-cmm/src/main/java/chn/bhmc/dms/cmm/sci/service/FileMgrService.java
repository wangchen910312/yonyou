package chn.bhmc.dms.cmm.sci.service;

import java.util.List;

import chn.bhmc.dms.cmm.sci.vo.FileDocVO;
import chn.bhmc.dms.cmm.sci.vo.FileItemVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : FileMgrService.java
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

public interface FileMgrService {

    public int insertFileDoc(FileDocVO fileDocVO) throws Exception;
    public int insertFileDocAndItem(String fileDocNo, String tempYn, String usrId, FileItemVO fileItem) throws Exception;
    public int updateFileDoc(FileDocVO fileDocVO) throws Exception;
    public int updateFileDocEnabled(FileDocVO fileDocVO) throws Exception;
    public int deleteFileDoc(String fileDocNo) throws Exception;
    public int deleteFileDocsForTemp(int elapsedDate) throws Exception;
    public FileDocVO selectFileDocByKey(String fileDocNo) throws Exception;

    public int insertFileItem(FileItemVO fileItemVO) throws Exception;
    public void deleteFileItems(List<FileItemVO> deleteFiles) throws Exception;
    public int deleteFileItem(String fileDocNo, int fileItemNo) throws Exception;
    public int deleteFileItemsByFileDocNo(String fileDocNo) throws Exception;
    public int deleteFileItemsForTemp(int elapsedDate) throws Exception;
    public int selectNextFileNo(String fileDocNo) throws Exception;
    public FileItemVO selectFileItemByKey(String fileDocNo, int fileItemNo) throws Exception;
    public List<FileItemVO> selectFileItemsByFileDocNo(String fileDocNo) throws Exception;
    public String selectNextFileDocNo() throws Exception;

}
