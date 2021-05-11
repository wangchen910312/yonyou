package chn.bhmc.dms.mob.api.crm.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.mob.api.crm.dao.CrmDealerDAO;
import chn.bhmc.dms.mob.api.crm.service.CrmDealerService;
import chn.bhmc.dms.mob.api.crm.vo.DealerVO;

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

@Service("CrmdealerService")
public class CrmDealerServiceImpl extends HService implements CrmDealerService {

    /**
     * 딜러 관리 DAO
     */
    @Resource(name="CrmdealerDAO")
    CrmDealerDAO CrmdealerDAO;

    /**
     * {@inheritDoc}
     */
    @Override
    public DealerVO selectDealerByKey(String dlrCd) throws Exception {
        return CrmdealerDAO.selectDealerByKey(dlrCd);
    }

}
