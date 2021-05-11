package chn.bhmc.dms.mob.api.sales.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.mob.api.sales.dao.SalesDealerDAO;
import chn.bhmc.dms.mob.api.sales.service.SalesDealerService;
import chn.bhmc.dms.mob.api.sales.vo.DealerSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.DealerVO;

/**
 * 딜러 관리 서비스 구현 클래스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 29.
 * @version 1.0
 * @see
 * 
 *      <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.29         Kang Seok Han            최초 생성
 *      </pre>
 */

@Service("SalesDealerService")
public class SalesDealerServiceImpl extends HService implements SalesDealerService {

	/**
	 * 딜러 관리 DAO
	 */
	@Resource(name = "SalesDealerDAO")
	SalesDealerDAO SalesDealerDAO;

	
	/**
	 * {@inheritDoc}
	 */
	@Override
	public List<DealerVO> selectDealersByCondition(DealerSearchVO searchVO) throws Exception {
		return SalesDealerDAO.selectDealersByCondition(searchVO);
	}

	

}
