package chn.bhmc.dms.sal.stm.service;

import java.util.List;

import chn.bhmc.dms.sal.stm.vo.CorporateAvailabilitySearchVO;
import chn.bhmc.dms.sal.stm.vo.CorporateAvailabilityVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CorporateAvailabilityService
 * @Description : 법인 재고현황 서비스
 * @author Kim Jin Suk
 * @since 2016. 8. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 16.    Kim Jin Suk                최초 생성
 * </pre>
 */

public interface CorporateAvailabilityService {

    public List<CorporateAvailabilityVO> selectCorporateAvailabilityByCondition(CorporateAvailabilitySearchVO searchVO) throws Exception;

}
