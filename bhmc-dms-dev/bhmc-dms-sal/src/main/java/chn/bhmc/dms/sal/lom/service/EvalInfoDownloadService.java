package chn.bhmc.dms.sal.lom.service;

import java.util.List;

import chn.bhmc.dms.sal.lom.vo.EvalInfoDownloadSearchVO;
import chn.bhmc.dms.sal.lom.vo.EvalInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : EvalInfoDownloadService
 * @Description : 평가정보 다운로드 서비스
 * @author Bong
 * @since 2016. 5. 02.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 02.       Bong                 최초 생성
 * </pre>
 */

public interface EvalInfoDownloadService {

    public List<EvalInfoVO> selectEvalInfoDownloadCondition(EvalInfoDownloadSearchVO searchVO) throws Exception;

    public int selectEvalInfoDownloadConditionCnt(EvalInfoDownloadSearchVO searchVO)  throws Exception;
}
