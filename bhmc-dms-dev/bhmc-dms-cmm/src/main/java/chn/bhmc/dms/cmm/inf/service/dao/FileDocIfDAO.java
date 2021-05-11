package chn.bhmc.dms.cmm.inf.service.dao;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

/**
 * 첨부문서 IF 관리 DAO
 *
 * @author Kang Seok Han
 * @since 2016. 1. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.18         Kang Seok Han            최초 생성
 * </pre>
 */
@Mapper("fileDocIfDAO")
public interface FileDocIfDAO {

    /**
     * 첨부문서 정보를 인터페이스 테이블에 등록한다.
     * @param fileDocVO 첨부문서 번호
     * @return 등록된 목록수
     */
    int insertFileDoc(String fileDocNo);

    /**
     * 변경된 첨부문서 정보를 인터페이스 테이블에 반영한다.
     * @param fileDocVO 첨부문서 번호
     * @return 변경된 목록수
     */
    int updateFileDoc(String fileDocNo);

    /**
     * 삭제된 첨부문서 정보를 인터페이스 테이블에 반영한다.
     * 첨부문서 번호에 해당하는 첨부문서의 삭제여부 필드를 'Y'로 변경한다.
     * @param fileDocVO 첨부문서 번호
     * @return 삭제된 목록수
     */
    int deleteFileDoc(String fileDocNo);

    /**
     * 첨부파일 정보를 인터페이스 테이블에 등록한다.
     * @param fileDocVO 첨부문서 번호
     * @param fileNo 파일번호
     * @return 등록된 목록수
     */
    int insertFileItem(@Param("fileDocNo") String fileDocNo, @Param("fileNo") int fileNo);

    /**
     * 삭제된 첨부파일 정보를 인터페이스 테이블에 반영한다.
     * 첨부파일 번호에 해당하는 첨부파일의 삭제여부 필드를 'Y'로 변경한다.
     * @param fileDocVO 첨부문서 번호
     * @param fileNo 파일번호
     * @return 삭제된 목록수
     */
    int deleteFileItem(@Param("fileDocNo") String fileDocNo, @Param("fileNo") int fileNo);

    /**
     * 삭제된 첨부문서에 해당하는 첨부파일 정보를 인터페이스 테이블에 반영한다.
     * 첨부문서 번호에 해당하는 첨부파일의 삭제여부 필드를 'Y'로 변경한다.
     * @param fileDocNo 첨부문서 번호
     * @return 삭제된 목록수
     */
    int deleteFileItemsByFileDocNo(String fileDocNo);

}
