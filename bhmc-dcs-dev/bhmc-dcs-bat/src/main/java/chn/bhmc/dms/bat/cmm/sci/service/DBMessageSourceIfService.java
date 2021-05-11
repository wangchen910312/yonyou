package chn.bhmc.dms.bat.cmm.sci.service;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DBMessageSourceIfDAO.java
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

public interface DBMessageSourceIfService {

    /**
     * 현재일자 - 조회기간(일) 이후에 등록/수정된 메세지소스 목록을 메세지소스 송신 테이블[CM_0501IS]에 반영한다.
     * @param day 조회기간(일)
     * @return
     */
    public int insertDBMessageSourceIf(int day) throws Exception;
}
