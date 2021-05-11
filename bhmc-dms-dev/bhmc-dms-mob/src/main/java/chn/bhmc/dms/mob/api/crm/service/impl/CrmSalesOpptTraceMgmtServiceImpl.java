package chn.bhmc.dms.mob.api.crm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;	

import able.com.service.HService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtOutBoundService;
import chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtService;
import chn.bhmc.dms.mob.api.crm.dao.CrmSalesOpptTraceMgmtDAO;
import chn.bhmc.dms.mob.api.crm.service.CrmSalesOpptTraceMgmtService;
import chn.bhmc.dms.mob.api.crm.vo.SalesOpptTraceMgmtSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.SalesOpptTraceMgmtVO;


/**
 * 추적 관리 서비스 구현 클래스
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

@Service("CrmsalesOpptTraceMgmtService")
public class CrmSalesOpptTraceMgmtServiceImpl extends HService implements CrmSalesOpptTraceMgmtService {

    /**
     * 추적프로세스 관리 DAO
     */
    @Resource(name="CrmsalesOpptTraceMgmtDAO")
    CrmSalesOpptTraceMgmtDAO CrmsalesOpptTraceMgmtDAO;

    /**
     * salesOpptProcessMgmtOutBoundService 관리 DAO
     */
    @Resource(name="salesOpptProcessMgmtOutBoundService")
    SalesOpptProcessMgmtOutBoundService salesOpptProcessMgmtOutBoundService;

    /**
     * 추적프로세스 관리 DAO
     */
    @Resource(name="salesOpptProcessMgmtService")
    SalesOpptProcessMgmtService salesOpptProcessMgmtService;

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptTraceMgmtService#selectSalesOpptTraceMgmtsByConditionCnt(chn.bhmc.dms.crm.cso.vo.SalesOpptTraceMgmtSearchVO)
     */
    @Override
    public int selectSalesOpptTraceMgmtsByConditionCnt(SalesOpptTraceMgmtSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())){searchVO.setsLangCd(LoginUtil.getLangCd());}
        return CrmsalesOpptTraceMgmtDAO.selectSalesOpptTraceMgmtsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptTraceMgmtService#selectSalesOpptTraceMgmtsByCondition(chn.bhmc.dms.crm.cso.vo.SalesOpptTraceMgmtSearchVO)
     */
    @Override
    public List<SalesOpptTraceMgmtVO> selectSalesOpptTraceMgmtsByCondition(SalesOpptTraceMgmtSearchVO searchVO)
            throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())){searchVO.setsLangCd(LoginUtil.getLangCd());}
        return CrmsalesOpptTraceMgmtDAO.selectSalesOpptTraceMgmtsByCondition(searchVO);
    }



}
