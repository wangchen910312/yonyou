package chn.bhmc.dms.crm.cso.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cso.service.IdccRoleMgmtService;
import chn.bhmc.dms.crm.cso.service.dao.IdccRoleMgmtDAO;
import chn.bhmc.dms.crm.cso.vo.IdccRoleMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.IdccRoleMgmtVO;

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

@Service("idccRoleMgmtService")
public class IdccRoleMgmtServiceImpl extends HService implements IdccRoleMgmtService {

    /**
     * Customer Management
     */
    @Resource(name = "commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * IDCC 역활 관리 DAO
     */
    @Resource(name = "idccRoleMgmtDAO")
    IdccRoleMgmtDAO idccRoleMgmtDAO;

    /*
     * @see chn.bhmc.dms.crm.cso.service.IdccRoleMgmtService#
     * selectIdccRoleMgmtsByConditionCnt
     * (chn.bhmc.dms.crm.cso.vo.IdccRoleMgmtSearchVO)
     */
    @Override
    public int selectIdccRoleAssigedMgmtsByConditionCnt(IdccRoleMgmtSearchVO searchVO) throws Exception {
        if (StringUtil.isEmpty(searchVO.getsDlrCd())) { searchVO.setsDlrCd(LoginUtil.getDlrCd()); };

        return idccRoleMgmtDAO.selectIdccRoleAssigedMgmtsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.IdccRoleMgmtService#
     * selectIdccRoleMgmtsByConditionCnt
     * (chn.bhmc.dms.crm.cso.vo.IdccRoleMgmtSearchVO)
     */
    @Override
    public int selectIdccRoleMgmtsByConditionCnt(IdccRoleMgmtSearchVO searchVO) throws Exception {
        if (StringUtil.isEmpty(searchVO.getsDlrCd())) { searchVO.setsDlrCd(LoginUtil.getDlrCd()); };

        return idccRoleMgmtDAO.selectIdccRoleMgmtsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.IdccRoleMgmtService#
     * selectIdccRoleMgmtsByCondition
     * (chn.bhmc.dms.crm.cso.vo.IdccRoleMgmtSearchVO)
     */
    @Override
    public List<IdccRoleMgmtVO> selectIdccRoleMgmtsByCondition(IdccRoleMgmtSearchVO searchVO) throws Exception {
        if (StringUtil.isEmpty(searchVO.getsDlrCd())) { searchVO.setsDlrCd(LoginUtil.getDlrCd()); };

        return idccRoleMgmtDAO.selectIdccRoleMgmtsByCondition(searchVO);
    }

    /*
     * @see
     * chn.bhmc.dms.crm.cso.service.IdccRoleMgmtService#multiIdccRole(chn.bhmc
     * .dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiIdccRole(BaseSaveVO<IdccRoleMgmtVO> obj) throws Exception {

        String userId = LoginUtil.getUserId();
        int idccRoleCnt = 0;

        for (IdccRoleMgmtVO idccRoleMgmtVO : obj.getInsertList()) {
            idccRoleMgmtVO.setRegUsrId(userId);
            idccRoleMgmtVO.setUpdtUsrId(userId);
            insertIdccRole(idccRoleMgmtVO);
        }

        IdccRoleMgmtSearchVO idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();
        for (IdccRoleMgmtVO idccRoleMgmtVO : obj.getUpdateList()) {

            idccRoleMgmtSearchVO = new IdccRoleMgmtSearchVO();

            idccRoleMgmtSearchVO.setsUsrId(idccRoleMgmtVO.getUsrId());

            idccRoleCnt = selectIdccRoleAssigedMgmtsByConditionCnt(idccRoleMgmtSearchVO);

            if (idccRoleCnt > 0) {
                idccRoleMgmtVO.setUpdtUsrId(userId);
                updateIdccRole(idccRoleMgmtVO);
            } else {
                idccRoleMgmtVO.setRegUsrId(userId);
                idccRoleMgmtVO.setUpdtUsrId(userId);
                insertIdccRole(idccRoleMgmtVO);
            }

        }

    }

    /*
     * @see
     * chn.bhmc.dms.crm.cso.service.IdccRoleMgmtService#insertIdccRole(chn.bhmc
     * .dms.crm.cso.vo.IdccRoleMgmtVO)
     */
    @Override
    public int insertIdccRole(IdccRoleMgmtVO idccRoleMgmtVO) throws Exception {
        if (StringUtil.isEmpty(idccRoleMgmtVO.getDlrCd())) { idccRoleMgmtVO.setDlrCd(LoginUtil.getDlrCd());};
        if (StringUtil.isEmpty(idccRoleMgmtVO.getRegUsrId())) { idccRoleMgmtVO.setRegUsrId(LoginUtil.getUserId());};
        if (StringUtil.isEmpty(idccRoleMgmtVO.getUpdtUsrId())) { idccRoleMgmtVO.setUpdtUsrId(LoginUtil.getUserId());};

        return idccRoleMgmtDAO.insertIdccRole(idccRoleMgmtVO);
    }

    /*
     * @see
     * chn.bhmc.dms.crm.cso.service.IdccRoleMgmtService#updateIdccRole(chn.bhmc
     * .dms.crm.cso.vo.IdccRoleMgmtVO)
     */
    @Override
    public int updateIdccRole(IdccRoleMgmtVO idccRoleMgmtVO) throws Exception {
        if (StringUtil.isEmpty(idccRoleMgmtVO.getDlrCd())) {
            idccRoleMgmtVO.setDlrCd(LoginUtil.getDlrCd());
        };
        return idccRoleMgmtDAO.updateIdccRole(idccRoleMgmtVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.IdccRoleMgmtService#selectIdccRoleMgmtsByRole(chn.bhmc.dms.crm.cso.vo.IdccRoleMgmtSearchVO)
     */
    @Override
    public List<IdccRoleMgmtVO> selectIdccRoleMgmtsByRole(IdccRoleMgmtSearchVO searchVO) throws Exception {

        if (StringUtil.isEmpty(searchVO.getsDlrCd())) { searchVO.setsDlrCd(LoginUtil.getDlrCd()); };
        return idccRoleMgmtDAO.selectIdccRoleMgmtsByRole(searchVO);

    }

}
