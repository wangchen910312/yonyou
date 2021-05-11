package chn.bhmc.dms.sal.lom.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.lom.service.EvalInfoDownloadService;
import chn.bhmc.dms.sal.lom.service.dao.EvalInfoDownloadDAO;
import chn.bhmc.dms.sal.lom.vo.EvalInfoDownloadSearchVO;
import chn.bhmc.dms.sal.lom.vo.EvalInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : EvalInfoDownloadImpl.java
 * @Description : 평가정보 다운로드 Impl
 * @author Bong
 * @since 2016. 5. 02.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 02.       Bong                최초 생성
 * </pre>
 */

@Service("evalInfoDownloadService")
public class EvalInfoDownloadImpl extends HService implements EvalInfoDownloadService{

    @Resource(name="evalInfoDownloadDAO")
    EvalInfoDownloadDAO evalInfoDownloadDAO;

    @Override
    public List<EvalInfoVO> selectEvalInfoDownloadCondition(EvalInfoDownloadSearchVO searchVO) throws Exception {
        return evalInfoDownloadDAO.selectEvalInfoDownloadCondition(searchVO);
    }

    @Override
    public int selectEvalInfoDownloadConditionCnt(EvalInfoDownloadSearchVO searchVO)  throws Exception {
        return evalInfoDownloadDAO.selectEvalInfoDownloadConditionCnt(searchVO);
    }
}
