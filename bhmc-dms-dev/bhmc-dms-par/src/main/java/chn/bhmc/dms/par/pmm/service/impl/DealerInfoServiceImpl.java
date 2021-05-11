package chn.bhmc.dms.par.pmm.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.par.pmm.service.DealerInfoService;
import chn.bhmc.dms.par.pmm.service.dao.DealerInfoDAO;
import chn.bhmc.dms.par.pmm.vo.DealerInfoSearchVO;
import chn.bhmc.dms.par.pmm.vo.DealerInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DealerInfoServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Lee Hyeong Gyun
 * @since 2017. 7. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 7. 28.     Lee Hyeong Gyun     최초 생성
 * </pre>
 */

@Service("dealerInfoService")
public class DealerInfoServiceImpl extends HService implements DealerInfoService{

    /**
     * 딜러정보 관리 DAO
     */
    @Resource(name="dealerInfoDAO")
    DealerInfoDAO dealerInfoDAO;

    @Override
    public int selectDealerInfoListCnt(DealerInfoSearchVO searchVO) throws Exception {
        return dealerInfoDAO.selectDealerInfoListCnt(searchVO);
    }

    @Override
    public DealerInfoVO selectDealerInfoList(DealerInfoSearchVO searchVO) throws Exception {
        return dealerInfoDAO.selectDealerInfoList(searchVO);
    }

}
