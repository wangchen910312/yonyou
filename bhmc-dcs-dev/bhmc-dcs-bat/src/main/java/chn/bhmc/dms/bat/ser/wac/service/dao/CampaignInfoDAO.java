package chn.bhmc.dms.bat.ser.wac.service.dao;

import able.com.mybatis.Mapper;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CampaignInfoDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 9. 5.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 5.     Kwon ki hyun     최초 생성
 * </pre>
 */
@Mapper("campaignInfoDAO")
public interface CampaignInfoDAO {

    /**
     *
     * BWMS 캠페인정보 등록.
     *
     * @return
     * @throws Exception
     */
    public void insertCampaignInfo()throws Exception;

}
