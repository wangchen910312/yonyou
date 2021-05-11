package chn.bhmc.dms.mob.api.crm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.crm.dao.CrmTraceGradeMgmtDAO;
import chn.bhmc.dms.mob.api.crm.service.CrmTraceGradeMgmtService;
import chn.bhmc.dms.mob.api.crm.vo.TraceGradeMgmtSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.TraceGradeMgmtVO;

/**
 * <pre>
 * 추적 등급별 다음 추적일 설정 서비스 구현 클래스
 * </pre>
 *
 * @ClassName   : TraceGradeMgmtServiceImpl.java
 * @Description : TraceGradeMgmtServiceImpl
 * @author Jin Choi
 * @since 2017. 2. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 6.     Jin Choi     최초 생성
 * </pre>
 */

@Service("CrmtraceGradeMgmtService")
public class CrmTraceGradeMgmtServiceImpl extends HService implements CrmTraceGradeMgmtService {

    /**
     * 추적 등급별 다음 추적일 설정 관리 DAO
     */
    @Resource(name = "CrmtraceGradeMgmtDAO")
    CrmTraceGradeMgmtDAO CrmtraceGradeMgmtDAO;


    /**
     * 추적일 설정 목록수를 조회한다.
     */
    @Override
    public int selectTraceGradeMgmtsByCnt(TraceGradeMgmtSearchVO searchVO) throws Exception {
        if (StringUtil.isEmpty(searchVO.getsDlrCd())) { searchVO.setsDlrCd(LoginUtil.getDlrCd()); };
        return CrmtraceGradeMgmtDAO.selectTraceGradeMgmtsByCnt(searchVO);
    }

    /**
     * 추적일 설정 목록을 조회한다.
     */
    @Override
    public List<TraceGradeMgmtVO> selectTraceGradeMgmts(TraceGradeMgmtSearchVO searchVO) throws Exception {
        if (StringUtil.isEmpty(searchVO.getsDlrCd())) { searchVO.setsDlrCd(LoginUtil.getDlrCd()); };
        if (StringUtil.isEmpty(searchVO.getsLangCd())) { searchVO.setsLangCd(LoginUtil.getLangCd()); };
        return CrmtraceGradeMgmtDAO.selectTraceGradeMgmts(searchVO);
    }

}
