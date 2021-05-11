package chn.bhmc.dms.par.ism.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.par.ism.vo.PartsSaleEstimateItemVO;
import chn.bhmc.dms.par.ism.vo.PartsSaleEstimateSearchVO;
import chn.bhmc.dms.par.ism.vo.PartsSaleEstimateVO;

/**
 * 부품예약 서비스
 *
 * @author Ju Won Lee
 * @since 2016. 2. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 2. 18.     Ju Won Lee      최초 생성
 * </pre>
 */

public interface PartsSaleEstimateService {

    /**
     *부품판매  정보를 등록한다.
     * @param partsSaleEstimateVO - 등록할 정보가 담긴 PartsSaleEstimateVO
     * @return 등록된 목록수
     */
    public PartsSaleEstimateVO createPartsSaleEstimate(List<PartsSaleEstimateItemVO> list, PartsSaleEstimateVO partsSaleEstimateVO) throws Exception;

    /**
     * Key에 해당하는 부품판매  정보를 조회한다.
     * @param partsSaleEstimateSearchVO - 조회할 정보가 담긴 PartsSaleEstimateSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public PartsSaleEstimateVO selectPartsSaleEstimateByKey(PartsSaleEstimateSearchVO partsSaleEstimateSearchVO) throws Exception;

    /**
     * Key에 해당하는 부품판매 부품 정보를 조회한다.
     * @param partsSaleEstimateSearchVO - 조회할 정보가 담긴 PartsSaleEstimateSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public List<PartsSaleEstimateItemVO> selectPartsSaleEstimateItemByKey(PartsSaleEstimateSearchVO partsSaleEstimateSearchVO) throws Exception;


    public String selectNextEstimateDocNo() throws Exception;

    /**
     *부품판매  정보를 수정한다.
     * @param partsSaleEstimateVO - 수정할 정보가 담긴 partsSaleEstimateVO
     * @return 수정된 목록수
     */
    public void multiPartsSaleEstimates(BaseSaveVO<PartsSaleEstimateItemVO> partsSaleEstimateSaveVO, PartsSaleEstimateVO partsSaleEstimateVO) throws Exception;

    /**
     * 부품판매  정보를 취소한다.
     * @param partsSaleEstimateVO - 취소할 정보가 담긴 PartsSaleEstimateVO
     * @return 취소된 목록수
     */
    public int cancelPartsSaleEstimate(PartsSaleEstimateVO partsSaleEstimateVO) throws Exception;

    /**
     * 조건에 해당하는 부품판매 리스트 정보를 조회한다.
     * @param partsSaleEstimateSearchVO - 조회할 정보가 담긴 PartsSaleEstimateSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public List<PartsSaleEstimateVO> selectPartsSaleEstimateList(PartsSaleEstimateSearchVO partsSaleEstimateSearchVO) throws Exception;

    /**
     * 조건에 해당하는 부품판매 리스트 정보 Count를 조회한다.
     * @param partsSaleEstimateSearchVO - 조회할 정보가 담긴 PartsSaleEstimateSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public int selectPartsSaleEstimateListCnt(PartsSaleEstimateSearchVO partsSaleEstimateSearchVO) throws Exception;

    /**
     * 조건에 해당하는 부품판매 품목리스트 정보를 조회한다.
     * @param partsSaleEstimateSearchVO - 조회할 정보가 담긴 PartsSaleEstimateSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public List<PartsSaleEstimateItemVO> selectPartsSaleEstimateItemList(PartsSaleEstimateSearchVO partsSaleEstimateSearchVO) throws Exception;

    /**
     * 조건에 해당하는 부품판매 품목리스트 정보 Count를 조회한다.
     * @param partsSaleEstimateSearchVO - 조회할 정보가 담긴 PartsSaleEstimateSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public int selectPartsSaleEstimateItemListCnt(PartsSaleEstimateSearchVO partsSaleEstimateSearchVO) throws Exception;

    /**
     * 조회조건에 해당하는 구매오더  정보를 조회한다.
     * @param purcOrdVO - 조회할 정보가 담긴 PurcOrdVO
     * @return 조회한 구매오더  정의 정보
     */
    public List<PartsSaleEstimateVO> selectEstimatesByCondition(PartsSaleEstimateSearchVO searchVO) throws Exception;


    /**
     * 조회 조건에 해당하는 구매오더  총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록 수
     */
    public int selectEstimatesByConditionCnt(PartsSaleEstimateSearchVO searchVO) throws Exception;




}
