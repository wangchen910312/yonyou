package chn.bhmc.dms.cmm.sci.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.cmm.sci.vo.FileDocVO;
import chn.bhmc.dms.cmm.sci.vo.FileItemVO;

/**
 * <pre>
 * 첨부파일 관리 데이터처리 매퍼 클래스
 * </pre>
 *
 * @ClassName   : FileMgrDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 22.     Kang Seok Han     최초 생성
 * </pre>
 */
@Mapper("fileMgrDAO")
public interface FileMgrDAO {

    public int insertFileDoc(FileDocVO fileDocVO);
    public int updateFileDoc(FileDocVO fileDocVO);
    public int updateFileDocEnabled(FileDocVO fileDocVO);
    public int deleteFileDoc(String fileDocNo);
    public int deleteFileDocsForTemp(int elapsedDate);
    public FileDocVO selectFileDocByKey(String fileDocNo);

    public int insertFileItem(FileItemVO fileItemVO);
    public int deleteFileItem(@Param("fileDocNo") String fileDocNo, @Param("fileNo") int fileItemNo);
    public int deleteFileItemsByFileDocNo(String fileDocNo);
    public int deleteFileItemsForTemp(int elapsedDate);
    public int selectNextFileNo(String fileDocNo);
    public FileItemVO selectFileItemByKey(@Param("fileDocNo") String fileDocNo, @Param("fileNo") int fileItemNo);
    public List<FileItemVO> selectFileItemsByFileDocNo(String fileDocNo);

}
