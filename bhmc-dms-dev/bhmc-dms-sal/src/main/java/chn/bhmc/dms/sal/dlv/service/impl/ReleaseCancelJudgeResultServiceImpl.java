package chn.bhmc.dms.sal.dlv.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.dlv.service.ReleaseCancelJudgeResultService;
import chn.bhmc.dms.sal.dlv.service.dao.ReleaseCancelJudgeResultDAO;
import chn.bhmc.dms.sal.dlv.vo.ReleaseCancelJudgeResultListVO;
import chn.bhmc.dms.sal.dlv.vo.ReleaseCancelJudgeResultVO;

/**
*
* @ClassName   : ReleaseCancelJudgeResultServiceImpl.java
* @Description : 출고취소 심사결과를 조회한다.
* @author
* @since 2016. 10. 20.
* @version 1.0
* @see
* @Modification Information
* <pre>
*       수정일                            수정자                              수정내용
*  ----------------    ------------    ---------------------------
*   2016.10.20         Choi KyungYong          최초 생성
* </pre>
*/

@Service("releaseCancelJudgeResultService")
public class ReleaseCancelJudgeResultServiceImpl extends HService implements ReleaseCancelJudgeResultService {

    /**
     * 출고취소 심사결과 DAO 선언
     */
    @Resource(name="releaseCancelJudgeResultDAO")
    ReleaseCancelJudgeResultDAO releaseCancelJudgeResultDAO;

    /**
     * 조회 조건에 해당하는 출고취소 심사결과를 조회한다.
     */
    @Override
    public List<ReleaseCancelJudgeResultListVO> selectReleaseCancelJudgeResulByCondition(ReleaseCancelJudgeResultVO searchVO) throws Exception {
        return releaseCancelJudgeResultDAO.selectReleaseCancelJudgeResulByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 출고취소 심사결과 목록 총 갯수를 조회한다.
     */
    @Override
    public int selectReleaseCancelJudgeResulByConditionCnt(ReleaseCancelJudgeResultVO searchVO) throws Exception {
        return releaseCancelJudgeResultDAO.selectReleaseCancelJudgeResulByConditionCnt(searchVO);
    }
}
