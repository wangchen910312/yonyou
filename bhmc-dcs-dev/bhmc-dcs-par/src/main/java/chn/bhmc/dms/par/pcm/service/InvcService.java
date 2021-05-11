package chn.bhmc.dms.par.pcm.service;

import java.util.List;

import chn.bhmc.dms.par.pcm.vo.*;




/**
 * 구매오더 서비스
 *
 * @author Ju Won Lee
 * @since 2016. 2. 04.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 2. 04.     Ju Won Lee      최초 생성
 * </pre>
 */

public interface InvcService {

    /**
     * 조회조건에 해당하는 송장  정보를 조회한다.
     * @param searchVO - 조회할 정보가 담긴 InvcSearchVO
     * @return 조회한 구매오더  정의 정보
     */
    public List<InvcVO> selectInvcsByCondition(InvcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 송장  총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록 수
     */
    public int selectInvcsByConditionCnt(InvcSearchVO searchVO) throws Exception;

    /**
     * 조회조건에 해당하는 구매오더  정보를 조회한다.
     * @param searchVO - 조회할 정보가 담긴 InvcSearchVO
     * @return 조회한 구매오더  정의 정보
     */
    public List<InvcItemVO> selectInvcsDetailByCondition(InvcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 구매오더  총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록 수
     */
    public int selectInvcsDetailByConditionCnt(InvcSearchVO searchVO) throws Exception;

}
