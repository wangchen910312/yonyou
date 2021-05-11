package chn.bhmc.dms.sal.usc.service;

import java.util.List;

import chn.bhmc.dms.sal.usc.vo.ExchResultSearchVO;
import chn.bhmc.dms.sal.usc.vo.ExchResultVO;

/**
 * 중고차치환판매심사결과조회
 *
 * @author Kimyewon
 * @since 2016. 6. 10.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                     수정자                       수정내용
 *  ----------------    ------------    ---------------------------
 *   2016. 6. 10.       Kim yewon         최초 생성
 * </pre>
 */

public interface ExchResultService {

	/**
     * 조회 조건에 해당하는 중고차치환판매심사결과를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcEvalSearchVO
     * @return 조회 목록
     */
	public List<ExchResultVO> selectExchResultByCondition(ExchResultSearchVO searchVO) throws Exception;


	/**
     * 조회 조건에 해당하는  중고차치환판매심사결과 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ExchResultSearchVO
     * @return
     */
    public int selectExchResultByConditionCnt(ExchResultSearchVO searchVO);


    /**
     * 중고차치환판매심사결과등록 - 엑셀 업로드.
     * @param VO -  PromotionSaveVO
     * @return
     */
    public void insertExchRegistUpload(List<ExchResultVO> list) throws Exception;


    //파일업로드시 추가 Validation check
    public List<ExchResultVO> selectExchResultValidate(List<ExchResultVO> list) throws Exception;

}
