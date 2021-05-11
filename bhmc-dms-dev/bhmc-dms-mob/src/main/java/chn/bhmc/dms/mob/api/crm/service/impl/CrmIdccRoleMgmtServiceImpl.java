package chn.bhmc.dms.mob.api.crm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.crm.dao.CrmIdccRoleMgmtDAO;
import chn.bhmc.dms.mob.api.crm.service.CrmIdccRoleMgmtService;
import chn.bhmc.dms.mob.api.crm.vo.IdccRoleMgmtSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.IdccRoleMgmtVO;
 
/**
 * IDCC 역활 관리 서비스 구현 클래스
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

@Service("CrmidccRoleMgmtService")
public class CrmIdccRoleMgmtServiceImpl extends HService implements CrmIdccRoleMgmtService {

    /**
     * Customer Management
     */
    @Resource(name = "commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * IDCC 역활 관리 DAO
     */
    @Resource(name = "CrmidccRoleMgmtDAO")
    CrmIdccRoleMgmtDAO CrmidccRoleMgmtDAO;


    /*
     * @see chn.bhmc.dms.crm.cso.service.IdccRoleMgmtService#
     * selectIdccRoleMgmtsByCondition
     * (chn.bhmc.dms.crm.cso.vo.IdccRoleMgmtSearchVO)
     */
    @Override
    public List<IdccRoleMgmtVO> selectIdccRoleMgmtsByCondition(IdccRoleMgmtSearchVO searchVO) throws Exception {
        if (StringUtil.isEmpty(searchVO.getsDlrCd())) { searchVO.setsDlrCd(LoginUtil.getDlrCd()); };

        return CrmidccRoleMgmtDAO.selectIdccRoleMgmtsByCondition(searchVO);
    }
    
    /*
     * @see chn.bhmc.dms.crm.cso.service.IdccRoleMgmtService#selectIdccRoleMgmtsByRole(chn.bhmc.dms.crm.cso.vo.IdccRoleMgmtSearchVO)
     */
    @Override
    public List<IdccRoleMgmtVO> selectIdccRoleMgmtsByRole(IdccRoleMgmtSearchVO searchVO) throws Exception {

        if (StringUtil.isEmpty(searchVO.getsDlrCd())) { searchVO.setsDlrCd(LoginUtil.getDlrCd()); };
        return CrmidccRoleMgmtDAO.selectIdccRoleMgmtsByRole(searchVO);

    }

 
}
