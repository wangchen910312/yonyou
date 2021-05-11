package chn.bhmc.dms.crm.cso.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cso.service.TraceGradeMgmtService;
import chn.bhmc.dms.crm.cso.service.dao.TraceGradeMgmtDAO;
import chn.bhmc.dms.crm.cso.vo.TraceGradeMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.TraceGradeMgmtVO;

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

@Service("traceGradeMgmtService")
public class TraceGradeMgmtServiceImpl extends HService implements TraceGradeMgmtService {

    /**
     * 추적 등급별 다음 추적일 설정 관리 DAO
     */
    @Resource(name = "traceGradeMgmtDAO")
    TraceGradeMgmtDAO traceGradeMgmtDAO;

    /**
     * 추적일이 등록 된 목록수를 조회한다. (저장 시 update/insert 판단을 위함)
     */
    @Override
    public int selectTraceGradeAssigedMgmtsByCnt(TraceGradeMgmtSearchVO searchVO) throws Exception {
        if (StringUtil.isEmpty(searchVO.getsDlrCd())) { searchVO.setsDlrCd(LoginUtil.getDlrCd());};
        return traceGradeMgmtDAO.selectTraceGradeAssigedMgmtsByCnt(searchVO);
    }

    /**
     * 추적일 설정 목록수를 조회한다.
     */
    @Override
    public int selectTraceGradeMgmtsByCnt(TraceGradeMgmtSearchVO searchVO) throws Exception {
        if (StringUtil.isEmpty(searchVO.getsDlrCd())) { searchVO.setsDlrCd(LoginUtil.getDlrCd()); };
        return traceGradeMgmtDAO.selectTraceGradeMgmtsByCnt(searchVO);
    }

    /**
     * 추적일 설정 목록을 조회한다.
     */
    @Override
    public List<TraceGradeMgmtVO> selectTraceGradeMgmts(TraceGradeMgmtSearchVO searchVO) throws Exception {
        if (StringUtil.isEmpty(searchVO.getsDlrCd())) { searchVO.setsDlrCd(LoginUtil.getDlrCd()); };
        if (StringUtil.isEmpty(searchVO.getsLangCd())) { searchVO.setsLangCd(LoginUtil.getLangCd()); };
        return traceGradeMgmtDAO.selectTraceGradeMgmts(searchVO);
    }

    /**
     * 추적 등급별 다음 추적일 정보를 등록한다.
     */
    @Override
    public void multiTraceGrade(BaseSaveVO<TraceGradeMgmtVO> obj) throws Exception {

        String userId = LoginUtil.getUserId();
        int traceGradeCnt = 0;

        TraceGradeMgmtSearchVO traceGradeMgmtSearchVO = new TraceGradeMgmtSearchVO();
        for (TraceGradeMgmtVO traceGradeMgmtVO : obj.getUpdateList()) {

            traceGradeMgmtSearchVO = new TraceGradeMgmtSearchVO();

            traceGradeMgmtSearchVO.setsTraceGradeCd(traceGradeMgmtVO.getTraceGradeCd());

            traceGradeCnt = selectTraceGradeAssigedMgmtsByCnt(traceGradeMgmtSearchVO);

            if (traceGradeCnt > 0) { // UPDATE
                traceGradeMgmtVO.setUpdtUsrId(userId);
                updateTraceGrade(traceGradeMgmtVO);

            } else { // INSERT
                traceGradeMgmtVO.setRegUsrId(userId);
                insertTraceGrade(traceGradeMgmtVO);
            }
        }
    }

    /**
     * 추적일 설정 정보를 저장한다.
     */
    @Override
    public int insertTraceGrade(TraceGradeMgmtVO traceGradeMgmtVO) throws Exception {
        if (StringUtil.isEmpty(traceGradeMgmtVO.getDlrCd())) { traceGradeMgmtVO.setDlrCd(LoginUtil.getDlrCd());};
        return traceGradeMgmtDAO.insertTraceGrade(traceGradeMgmtVO);
    }

    /**
     * 추적일 설정 정보를 업데이트한다.
     */
    @Override
    public int updateTraceGrade(TraceGradeMgmtVO traceGradeMgmtVO) throws Exception {
        if (StringUtil.isEmpty(traceGradeMgmtVO.getDlrCd())) { traceGradeMgmtVO.setDlrCd(LoginUtil.getDlrCd());};
        return traceGradeMgmtDAO.updateTraceGrade(traceGradeMgmtVO);
    }
}
