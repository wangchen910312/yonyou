package chn.bhmc.dms.cmm.cmp.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.cmp.service.DealerService;
import chn.bhmc.dms.cmm.cmp.service.dao.DealerDAO;
import chn.bhmc.dms.cmm.cmp.vo.BossSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.DealerVO;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * 딜러 관리 서비스 구현 클래스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.29         Kang Seok Han            최초 생성
 * </pre>
 */

@Service("dealerService")
public class DealerServiceImpl extends HService implements DealerService {

    /**
     * 딜러 관리 DAO
     */
    @Resource(name="dealerDAO")
    DealerDAO dealerDAO;

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateDealer(DealerVO dealerVO) throws Exception {

        String userId = LoginUtil.getUserId();
        dealerVO.setUpdtUsrId(userId);

        return dealerDAO.updateDealer(dealerVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public DealerVO selectDealerByKey(String dlrCd) throws Exception {
        return dealerDAO.selectDealerByKey(dlrCd);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<DealerVO> selectDealersForSuggest(String query, int maxRows) throws Exception {
        if(StringUtils.isBlank(query)){
            return new ArrayList<DealerVO>();
        }
        return dealerDAO.selectDealersForSuggest(query, maxRows);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<DealerVO> selectDealersByCondition(DealerSearchVO searchVO) throws Exception {
        return dealerDAO.selectDealersByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectDealersByConditionCnt(DealerSearchVO searchVO) throws Exception {
        return dealerDAO.selectDealersByConditionCnt(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    public int updateDcsMigStat(DealerVO dealerVO) throws Exception{
        return dealerDAO.updateDcsMigStat(dealerVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<DealerVO> selectDealerListByCondition(DealerSearchVO searchVO) throws Exception {
        return dealerDAO.selectDealerListByCondition(searchVO);
    }
    
    /**
     * {@inheritDoc}
     */
	@Override
	public int selectDealerListByConditionCnt(DealerSearchVO searchVO)
			throws Exception {
		return dealerDAO.selectDealerListByConditionCnt(searchVO);
	}
	/**
	 * 根据id查询是否为大区主任(部门科长)  2020-9-20
	 */
	@Override
	public BossSearchVO selectTskListByCondition(String userId) throws Exception{
		return  dealerDAO.selectTskListByCondition(userId);
	}
    
    
}
