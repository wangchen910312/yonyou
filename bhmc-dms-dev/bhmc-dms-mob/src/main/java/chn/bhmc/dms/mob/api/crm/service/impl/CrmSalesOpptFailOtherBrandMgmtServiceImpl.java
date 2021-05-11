package chn.bhmc.dms.mob.api.crm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.mob.api.crm.vo.SalesOpptFailOtherBrandMgmtSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.SalesOpptFailOtherBrandMgmtVO;
import chn.bhmc.dms.mob.api.crm.dao.CrmSalesOpptFailOtherBrandMgmtDAO;
import chn.bhmc.dms.mob.api.crm.service.CrmSalesOpptFailOtherBrandMgmtService;

/**
 * 판매기회실패브랜드 관리 서비스 구현 클래스
 *
 * @author kyo jin lee
 * @since 2016.03.07.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.07         kyo jin lee            최초 생성
 * </pre>
 */

@Service("CrmsalesOpptFailOtherBrandMgmtService")
public class CrmSalesOpptFailOtherBrandMgmtServiceImpl extends HService implements CrmSalesOpptFailOtherBrandMgmtService {


    /**
     * 판매기회 실패 브랜드 관리 DAO
     */
    @Resource(name="CrmsalesOpptFailOtherBrandMgmtDAO")
    CrmSalesOpptFailOtherBrandMgmtDAO CrmsalesOpptFailOtherBrandMgmtDAO;

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptFailBrandMgmtService#selectSalesOpptFailBrandMgmtsByConditionCnt(chn.bhmc.dms.crm.cso.vo.SalesOpptFailBrandMgmtSearchVO)
     */
    @Override
    public int selectSalesOpptFailBrandMgmtsByConditionCnt(SalesOpptFailOtherBrandMgmtSearchVO searchVO) throws Exception {
        return CrmsalesOpptFailOtherBrandMgmtDAO.selectSalesOpptFailOtherBrandMgmtsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptFailBrandMgmtService#selectSalesOpptFailBrandMgmtsByCondition(chn.bhmc.dms.crm.cso.vo.SalesOpptFailBrandMgmtSearchVO)
     */
    @Override
    public List<SalesOpptFailOtherBrandMgmtVO> selectSalesOpptFailBrandMgmtsByCondition(
            SalesOpptFailOtherBrandMgmtSearchVO searchVO) throws Exception {
        return CrmsalesOpptFailOtherBrandMgmtDAO.selectSalesOpptFailOtherBrandMgmtsByCondition(searchVO);
    }


}
