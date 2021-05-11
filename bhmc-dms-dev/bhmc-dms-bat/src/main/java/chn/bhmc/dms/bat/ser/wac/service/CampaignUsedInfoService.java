package chn.bhmc.dms.bat.ser.wac.service;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CampaignUsedInfoService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 8. 31.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 31.     Kwon ki hyun     최초 생성
 * </pre>
 */

public interface CampaignUsedInfoService {

    /**
    *
    * 캠페인정보 dcs 로 전송
    *
    * @throws Exception
    */
   public void insertCampaignUsedReq()throws Exception;

}
