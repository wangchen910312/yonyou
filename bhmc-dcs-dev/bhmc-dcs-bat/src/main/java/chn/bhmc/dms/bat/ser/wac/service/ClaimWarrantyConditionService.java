package chn.bhmc.dms.bat.ser.wac.service;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimWarrantyConditionService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 10. 4.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 10. 4.     Kwon ki hyun     최초 생성
 * </pre>
 */

public interface ClaimWarrantyConditionService {

    /**
    *
    * BWMS 차종별 보증 정보
    *
    * @throws Exception
    */
    public void insertBwmsLtsWtyConditionInfo()throws Exception;

    /**
     *
     *  BWMS 빈별 보증 정보
     *
     * @throws Exception
     */
    public void insertBwmsVinConditionInfo()throws Exception;

    /**
     *
     * BWMS 스페셜빈별 정보
     *
     * @throws Exception
     */
    public void insertBwmsSpecialVinInfo()throws Exception;

}
