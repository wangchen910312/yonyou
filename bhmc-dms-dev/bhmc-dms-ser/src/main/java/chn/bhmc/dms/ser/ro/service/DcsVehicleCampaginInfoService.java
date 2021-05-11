package chn.bhmc.dms.ser.ro.service;

import java.util.List;
import chn.bhmc.dms.ser.ro.vo.DcsCampaignOfVinSearchVO;
import chn.bhmc.dms.ser.ro.vo.DcsCampaignOfVinVO;
/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PreCheckService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 3. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 29.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public interface DcsVehicleCampaginInfoService {

    /**
     * 켐페인 사용 이력 조회 (dcs)
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<DcsCampaignOfVinVO> dcsVehicleCampaginInfo(DcsCampaignOfVinSearchVO searchVO) throws Exception;

}
