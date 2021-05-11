package chn.bhmc.dms.bat.cmm.sci.service.dao;

import able.com.mybatis.Mapper;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CommonCodeIfBatchDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 10. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 10. 6.     Kang Seok Han     최초 생성
 * </pre>
 */

@Mapper("commonCodeIfBatchDAO")
public interface CommonCodeIfBatchDAO {

    /**
     * 현재일자 - 조회기간(일) 이후에 등록/수정된 공통코드그룹 목록을 공통코드그룹 송신 테이블[CM_0301IS]에 반영한다.
     * @param day 조회기간(일)
     * @return
     */
    public int insertCommonCodeGroupCodeIf(int day);

    /**
     * 현재일자 - 조회기간(일) 이후에 등록/수정된 공통코드그룹 텍스트 목록을 공통코드그룹 텍스트 송신 테이블[CM_0302IS]에 반영한다.
     * @return
     */
    public int insertCommonCodeGroupTextIf();

    /**
     * 현재일자 - 조회기간(일) 이후에 등록/수정된 공통코드 목록을 공통코드 송신 테이블[CM_0303IS]에 반영한다.
     * @param day 조회기간(일)
     * @return
     */
    public int insertCommonCodeIf(int day);

    /**
     * 현재일자 - 조회기간(일) 이후에 등록/수정된 공통코드 텍스트 목록을 공통코드 텍스트 송신 테이블[CM_0304IS]에 반영한다.
     * @return
     */
    public int insertCommonCodeTextIf();
}
