package chn.bhmc.dms.sal.stm.service.dao;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.stm.vo.CorporateAvailabilityVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CorporateAvailabilityDAO
 * @Description : 법인재고현황 DAO
 * @author Kim Jin Suk
 * @since 2016. 8. 16.
 * @version 1.0
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 16.     Kim Jin Suk           최초 생성
 * </pre>
 */

@Mapper("corporateAvailabilityDAO")
public interface CorporateAvailabilityDAO {

    /**
     * 차정보 명칭 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public CorporateAvailabilityVO selectCorporateAvailabilityCarNmSearch(CorporateAvailabilityVO searchVO) throws Exception;


}
