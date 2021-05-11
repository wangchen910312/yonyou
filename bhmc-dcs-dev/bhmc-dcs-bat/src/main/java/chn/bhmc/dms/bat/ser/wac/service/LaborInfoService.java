package chn.bhmc.dms.bat.ser.wac.service;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LaborInfoService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 8. 30.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 30.     Kwon ki hyun     최초 생성
 * </pre>
 */

public interface LaborInfoService {

    /**
     * BWMS 공임 정보를 가져온다.
     *
     */
    public void insertBwmslaborInfo()throws Exception;

    /**
     *
     * BWMS 공임 연관 데이터 정보를 가져온다.
     *
     * @throws Exception
    */
    public void insertBwmsLaborRelationInfo()throws Exception;


}
