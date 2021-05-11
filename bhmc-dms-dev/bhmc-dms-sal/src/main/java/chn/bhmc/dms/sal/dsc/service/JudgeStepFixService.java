package chn.bhmc.dms.sal.dsc.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.sal.dsc.vo.JudgeStepFixVO;




/**
 *  심사단계설정
 *
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.04.21         Kim Jin Suk            최초 생성
 * </pre>
 */

public interface JudgeStepFixService {

    /**
     * 조회 조건에 해당하는 심사단계설정을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 JudgeStepFixVO
     * @return 조회 목록
     */
    public List<JudgeStepFixVO> selectJudgeStepFixsByCondition() throws Exception;

    /**
     * 심사단계설정 적용
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int multiJudgeStepFixs(BaseSaveVO<JudgeStepFixVO> saveVO) throws Exception;

}