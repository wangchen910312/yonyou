package chn.bhmc.dms.par.pcm.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.par.pcm.vo.PurcCostSgstSearchVO;
import chn.bhmc.dms.par.pcm.vo.PurcCostSgstVO;

/**
 * 구매제시 서비스
 *
 * @author In Bo Shim
 * @since 2016. 2. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 2. 4.     In Bo Shim      최초 생성
 * </pre>
 */

public interface PurcCostSgstService {

    /**
     *구매제시  정보를 등록한다.
     * @param purcCostSgstVO - 등록할 정보가 담긴 PurcCostSgstVO
     * @return 등록된 목록수
     */
    public int insertPurcCostSgst(PurcCostSgstVO purcCostSgstVO) throws Exception;

    /**
     *구매제시  정보를 수정한다.
     * @param purcCostSgstVO - 수정할 정보가 담긴 PurcCostSgstVO
     * @return 수정된 목록수
     */
    public int updatePurcCostSgst(PurcCostSgstVO purcCostSgstVO) throws Exception;

    /**
     * 구매제시 부품으로 구매오더 시 구매제시 정보를 수정한다.
     * @param purcCostSgstVO - 수정할 정보가 담긴 PurcCostSgstVO
     * @return 수정된 목록수
     */
    public int updatePurcCostSgstOrdCnfm(PurcCostSgstVO purcCostSgstVO) throws Exception;

    /**
     * 구매제시  정보를 삭제한다.
     * @param purcCostSgstVO - 삭제할 정보가 담긴 PurcCostSgstVO
     * @return 삭제된 목록수
     */
    public int deletePurcCostSgst(PurcCostSgstVO purcCostSgstVO) throws Exception;

    /**
     * 구매제시  정보를 추가/수정/삭제한다.
     * @param purcCostSgstVO - 추가/수정/삭제할 정보가 담긴 PurcCostSgstVO
     * @return 삭제된 목록수
     */
    public void multiPurcCostesSgst(BaseSaveVO<PurcCostSgstVO> purcCostSgstSaveVO) throws Exception;

    /**
     * Key에 해당하는 구매제시  정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @return 조회한 구매제시  정의 정보
     */
    public PurcCostSgstVO selectPurcCostSgstByKey(String dlrCd) throws Exception;

    /**
     * 조회 조건에 해당하는구매제시  정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcCostSgstSearchVO
     * @return 조회 목록
     */
    public List<PurcCostSgstVO> selectPurcCostSgstesByCondition(PurcCostSgstSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 구매제시  총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcCostSgstSearchVO
     * @return 조회 목록 수
     */
    public int selectPurcCostSgstesByConditionCnt(PurcCostSgstSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 추천오더 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcCostSgstSearchVO
     * @return 조회 목록
     */
    public List<PurcCostSgstVO> selectSgstPurcOrdByCondition(PurcCostSgstSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 추천오더 정보 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcCostSgstSearchVO
     * @return 조회 목록
     */
    public int selectSgstPurcOrdByConditionCnt(PurcCostSgstSearchVO searchVO) throws Exception;
}
