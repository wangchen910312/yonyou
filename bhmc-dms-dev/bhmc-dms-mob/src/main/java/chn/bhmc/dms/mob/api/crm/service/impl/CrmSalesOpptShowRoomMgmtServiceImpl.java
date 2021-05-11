package chn.bhmc.dms.mob.api.crm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.crm.dao.CrmSalesOpptShowRoomMgmtDAO;
import chn.bhmc.dms.mob.api.crm.service.CrmSalesOpptShowRoomMgmtService;
import chn.bhmc.dms.mob.api.crm.vo.SalesOpptShowRoomMgmtSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.SalesOpptShowRoomMgmtVO;


/**
 * 전시장 관리 서비스 구현 클래스
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

@Service("CrmSalesOpptShowRoomMgmtService")
public class CrmSalesOpptShowRoomMgmtServiceImpl extends HService implements CrmSalesOpptShowRoomMgmtService{

    @Resource(name="CrmSalesOpptShowRoomMgmtDAO")
    CrmSalesOpptShowRoomMgmtDAO CrmsalesOpptShowRoomMgmtDAO;


    @Override
    public int selectSalesOpptShowRoomMgmtsByConditionCnt(SalesOpptShowRoomMgmtSearchVO searchVO) throws Exception {
        /*
         * dlrCd, 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())){searchVO.setsLangCd(LoginUtil.getLangCd());}
        return CrmsalesOpptShowRoomMgmtDAO.selectSalesOpptShowRoomMgmtsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOpptShowRoomMgmtService#selectSalesOpptShowRoomMgmtsByCondition(chn.bhmc.dms.crm.cso.vo.SalesOpptShowRoomMgmtSearchVO)
     */
    @Override
    public List<SalesOpptShowRoomMgmtVO> selectSalesOpptShowRoomMgmtsByCondition(SalesOpptShowRoomMgmtSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())){searchVO.setsLangCd(LoginUtil.getLangCd());}
        return CrmsalesOpptShowRoomMgmtDAO.selectSalesOpptShowRoomMgmtsByCondition(searchVO);
    }

   
}
