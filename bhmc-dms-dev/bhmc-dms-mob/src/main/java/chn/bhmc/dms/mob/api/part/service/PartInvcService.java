package chn.bhmc.dms.mob.api.part.service;

import java.util.List;

import chn.bhmc.dms.mob.api.part.vo.InvcItemVO;
import chn.bhmc.dms.mob.api.part.vo.InvcSearchVO;
import chn.bhmc.dms.mob.api.part.vo.InvcVO;






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

public interface PartInvcService {

    /**
     * 조회조건에 해당하는 구매오더  정보를 조회한다.
     * @param searchVO - 조회할 정보가 담긴 InvcSearchVO
     * @return 조회한 구매오더  정의 정보
     */
    public List<InvcVO> selectInvcsByCondition(InvcSearchVO searchVO) throws Exception;


    /**
     * 조회 조건에 해당하는 구매오더  총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록 수
     */
    public int selectInvcsByConditionCnt(InvcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 입고 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     * (采购汇总)
     */
    public List<InvcVO> selectReceivesByCondition(InvcSearchVO searchVO) throws Exception;
    
    /**
     * 조회 조건에 해당하는 입고 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     * (采购汇总)
     */
    public List<InvcVO> selectReceivesSumByCondition(InvcSearchVO searchVO) throws Exception;
    
    /**
     * 조회조건에 해당하는 입고 현황 조회 총 갯수를 조회한다.
     * @param InvcSearchVO
     * @return 조회 목록 수
     * （采购明细）
     */
    public int selectReceiveCnfmListByConditionCnt(InvcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는입고확정대상 부품 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록 수
     */
    public int selectReceiveItemByConditionCnt(InvcSearchVO searchVO) throws Exception;

    /**
     * 입고확정 대상 송장정보를 조회한다.(모바일용)
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public List<InvcVO> selectReceiveByMobile(InvcSearchVO invcSearchVO) throws Exception;


    /**
     * 입고확정 대상 송장정보 Count를 조회한다.(모바일용)
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public int selectReceiveByMobileCnt(InvcSearchVO invcSearchVO) throws Exception;

    /**
     * Key에 해당하는 입고확정대상 부품 정보를 조회한다.(모바일 바코드용)
     * @param InvcSearchVO - 조회할 정보가 담긴 InvcSearchVO
     * @return 조회한 송장  정보
     */
    public InvcItemVO selectReceiveItemByInvcItemBarcode(InvcSearchVO searchVO) throws Exception;

    /**
     * Key에 해당하는 입고확정대상 부품 정보를 조회한다.
     * @param InvcSearchVO - 조회할 정보가 담긴 InvcSearchVO
     * @return 조회한 송장  정보
     */
    public List<InvcItemVO> selectReceiveItemByCondition(InvcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 입고 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록 수
     * （采购汇总）
     */
    public int selectReceivesByConditionCnt(InvcSearchVO searchVO) throws Exception;


    /**
     * 조회조건에 해당하는 입고 현황을 조회한다.
     * @param InvcSearchVO
     * @return 조회 목록
     * （采购明细）
     */
    public List<InvcItemVO> selectReceiveCnfmListByCondition(InvcSearchVO searchVO) throws Exception;


    /**
     * Key에 해당하는 송장 부품 정보를 조회한다.
     * @param InvcSearchVO - 조회할 정보가 담긴 InvcSearchVO
     * @return 조회한 송장  정보
     */
    public List<InvcItemVO> selectInvcItemByKey(InvcSearchVO searchVO) throws Exception;
    
    /**
     * Key에 해당하는 송장관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public InvcVO selectInvcByKey(InvcVO invcVO) throws Exception;


	public List<InvcItemVO> selectReceiveCnfmItemByInvcKey(InvcSearchVO searchVO);
    
   

}
