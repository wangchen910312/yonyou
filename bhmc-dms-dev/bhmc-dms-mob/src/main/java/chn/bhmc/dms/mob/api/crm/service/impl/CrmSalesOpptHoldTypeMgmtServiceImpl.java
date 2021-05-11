package chn.bhmc.dms.mob.api.crm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.crm.dao.CrmSalesOpptHoldTypeMgmtDAO;
import chn.bhmc.dms.mob.api.crm.service.CrmSalesOpptHoldTypeMgmtService;
import chn.bhmc.dms.mob.api.crm.vo.SalesOpptHoldTypeMgmtSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.SalesOpptHoldTypeMgmtVO;

/**
 * 판매기회유입유형 관리 서비스 구현 클래스
 *
 * @author in moon lee
 * @since 2016.03.07.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.07         in moon lee            최초 생성
 * </pre>
 */

@Service("CrmsalesOpptHoldTypeMgmtService")
public class CrmSalesOpptHoldTypeMgmtServiceImpl extends HService implements CrmSalesOpptHoldTypeMgmtService {



    /**
     * 판매기회유입유형 관리 DAO
     */
    @Resource(name="CrmsalesOpptHoldTypeMgmtDAO")
    CrmSalesOpptHoldTypeMgmtDAO CrmsalesOpptHoldTypeMgmtDAO;


    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptHoldTypeMgmtService#selectSalesOpptHoldTypeMgmtsByConditionCnt(chn.bhmc.dms.crm.cso.vo.SalesOpptHoldTypeMgmtSearchVO)
     */
    @Override
    public int selectSalesOpptHoldTypeMgmtsByConditionCnt(SalesOpptHoldTypeMgmtSearchVO searchVO) throws Exception {
        if (StringUtil.isEmpty(searchVO.getsDlrCd())) { searchVO.setsDlrCd(LoginUtil.getDlrCd());};

        return CrmsalesOpptHoldTypeMgmtDAO.selectSalesOpptHoldTypeMgmtsByConditionCnt(searchVO);
    }


    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptHoldTypeMgmtService#selectSalesOpptHoldTypeMgmtsByCondition(chn.bhmc.dms.crm.cso.vo.SalesOpptHoldTypeMgmtSearchVO)
     */
    @Override
    public List<SalesOpptHoldTypeMgmtVO> selectSalesOpptHoldTypeMgmtsByCondition(SalesOpptHoldTypeMgmtSearchVO searchVO)
            throws Exception {
        if (StringUtil.isEmpty(searchVO.getsDlrCd())) { searchVO.setsDlrCd(LoginUtil.getDlrCd());};

        return CrmsalesOpptHoldTypeMgmtDAO.selectSalesOpptHoldTypeMgmtsByCondition(searchVO);
    }




}
