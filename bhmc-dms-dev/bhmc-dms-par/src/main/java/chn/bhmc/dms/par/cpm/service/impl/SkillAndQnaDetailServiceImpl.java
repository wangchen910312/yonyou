package chn.bhmc.dms.par.cpm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.cpm.service.SkillAndQnaDetailService;
import chn.bhmc.dms.par.cpm.service.dao.SkillAndQnaDetailDAO;
import chn.bhmc.dms.par.cpm.vo.SkillAndQnaDetailVO;
import chn.bhmc.dms.par.cpm.vo.SkillAndQnaSearchVO;

/**
 * 기술자문부품 구현 클래스
 *
 * @author In Bo Shim
 * @since 2016. 8. 24.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 8. 24.     In Bo Shim      최초 생성
 * </pre>
 */
@Service("skillAndQnaDetailService")
public class SkillAndQnaDetailServiceImpl extends HService implements SkillAndQnaDetailService {

    @Resource(name="skillAndQnaDetailDAO")
    private SkillAndQnaDetailDAO skillAndQnaDetailDAO;

    /*
     * @see chn.bhmc.dms.par.cpm.service.SkillAndQnaDetailService#insertSkillAndQnaDetail(chn.bhmc.dms.par.cpm.vo.SkillAndQnaDetailVO)
     */
    @Override
    public int insertSkillAndQnaDetail(SkillAndQnaDetailVO skillAndQnaDetailVO) throws Exception {
        skillAndQnaDetailVO.setDlrCd(LoginUtil.getDlrCd());
        skillAndQnaDetailVO.setRegUsrId(LoginUtil.getUserId());
        return skillAndQnaDetailDAO.insertSkillAndQnaDetail(skillAndQnaDetailVO);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.SkillAndQnaDetailService#updateSkillAndQnaDetail(chn.bhmc.dms.par.cpm.vo.SkillAndQnaDetailVO)
     */
    @Override
    public int updateSkillAndQnaDetail(SkillAndQnaDetailVO skillAndQnaDetailVO) throws Exception {
        skillAndQnaDetailVO.setDlrCd(LoginUtil.getDlrCd());
        skillAndQnaDetailVO.setUpdtUsrId(LoginUtil.getUserId());
        return skillAndQnaDetailDAO.updateSkillAndQnaDetail(skillAndQnaDetailVO);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.SkillAndQnaDetailService#deleteSkillAndQnaDetail(chn.bhmc.dms.par.cpm.vo.SkillAndQnaDetailVO)
     */
    @Override
    public int deleteSkillAndQnaDetail(SkillAndQnaDetailVO skillAndQnaDetailVO) throws Exception {
        return skillAndQnaDetailDAO.deleteSkillAndQnaDetail(skillAndQnaDetailVO);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.SkillAndQnaDetailService#selectSkillAndQnaDetailByKey(java.lang.String, java.lang.String)
     */
    @Override
    public SkillAndQnaDetailVO selectSkillAndQnaDetailByKey(String dlrCd, String pblmNo) throws Exception {
        return skillAndQnaDetailDAO.selectSkillAndQnaDetailByKey(dlrCd, pblmNo);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.SkillAndQnaDetailService#selectSkillAndQnaDetailsByCondition(chn.bhmc.dms.par.cpm.vo.SkillAndQnaSearchVO)
     */
    @Override
    public List<SkillAndQnaDetailVO> selectSkillAndQnaDetailsByCondition(SkillAndQnaSearchVO searchVO) throws Exception {
        return skillAndQnaDetailDAO.selectSkillAndQnaDetailsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.SkillAndQnaDetailService#selectSkillAndQnaDetailsByConditionCnt(chn.bhmc.dms.par.cpm.vo.SkillAndQnaSearchVO)
     */
    @Override
    public int selectSkillAndQnaDetailsByConditionCnt(SkillAndQnaSearchVO searchVO) throws Exception {
        return skillAndQnaDetailDAO.selectSkillAndQnaDetailsByConditionCnt(searchVO);
    }



}
