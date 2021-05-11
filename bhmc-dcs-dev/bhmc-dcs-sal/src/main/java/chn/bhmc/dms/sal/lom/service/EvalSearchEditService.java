package chn.bhmc.dms.sal.lom.service;

import java.util.List;

import chn.bhmc.dms.sal.lom.vo.EvalInfoVO;
import chn.bhmc.dms.sal.lom.vo.EvalSearchEditSaveVO;
import chn.bhmc.dms.sal.lom.vo.EvalSearchEditSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : EvalSearchEditService
 * @Description : 평가조회 및 수정 서비스
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

public interface EvalSearchEditService {

    public List<EvalInfoVO> selectEvalSearchEditCondition(EvalSearchEditSearchVO searchVO) throws Exception;

    public int selectEvalSearchEditConditionCnt(EvalSearchEditSearchVO searchVO)  throws Exception;

    public void updateEvalSearchEdit(EvalSearchEditSaveVO obj) throws Exception;
}
