package chn.bhmc.dms.bat.ser.wac.service;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimApproveService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 8. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 26.     Kwon ki hyun     최초 생성
 * </pre>
 */

public interface ClaimApproveService {

    /**
     * 클레임 판정 결과 반영 후 DMS 로 전송
     */
    public void insertClaimApprove(int day)throws Exception;

    /**
     * 클레임 판정 결과 DMS 로 재전송
     */
    public void insertReClaimApprove(int day, String dlrCd)throws Exception;

}
