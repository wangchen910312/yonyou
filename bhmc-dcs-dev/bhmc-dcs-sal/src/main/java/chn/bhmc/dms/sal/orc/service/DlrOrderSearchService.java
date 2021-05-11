package chn.bhmc.dms.sal.orc.service;

import java.util.List;

import chn.bhmc.dms.sal.orc.vo.SumOrderCntSearchVO;
import chn.bhmc.dms.sal.orc.vo.SumOrderCntSubVO;
import chn.bhmc.dms.sal.orc.vo.SumOrderCntVO;

/**
 *
 * @ClassName   : DlrOrderSearchService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Jin Suk Kim
 * @since 2016. 3. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 15.     Jin Suk Kim     최초 생성
 * </pre>
 */

public interface DlrOrderSearchService {

    /**
     * 딜러주문조회 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectDlrOrderSearchsByConditionCnt(SumOrderCntSearchVO searchVO) throws Exception;
    public List<SumOrderCntVO> selectDlrOrderSearchsByCondition(SumOrderCntSearchVO searchVO) throws Exception;

    /**
     * 딜러주문조회 세부조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectDlrOrderSearchSubsByConditionCnt(SumOrderCntSearchVO searchVO) throws Exception;
    public List<SumOrderCntSubVO> selectDlrOrderSearchSubsByCondition(SumOrderCntSearchVO searchVO) throws Exception;

}
