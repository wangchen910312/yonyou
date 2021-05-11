package chn.bhmc.dms.par.ism.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.par.ism.vo.PartCalculateVO;
import chn.bhmc.dms.par.ism.vo.PartsSaleOrdItemVO;
import chn.bhmc.dms.par.ism.vo.PartsSaleOrdSearchVO;
import chn.bhmc.dms.par.ism.vo.PartsSaleOrdVO;

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

public interface PartsSaleOrdService {

    /**
     *부품판매  정보를 등록한다.
     * @param partsSaleOrdVO - 등록할 정보가 담긴 PartsSaleOrdVO
     * @return 등록된 목록수
     */
    public PartsSaleOrdVO createPartsSaleOrd(List<PartsSaleOrdItemVO> list, PartsSaleOrdVO partsSaleOrdVO) throws Exception;

    /**
     *부품판매  정보를 반품처리한다.
     * @param partsSaleOrdVO - 반품할 정보가 담긴 PartsSaleOrdVO
     * @return 등록된 목록수
     */
    public PartsSaleOrdVO returnPartsSaleOrd(List<PartsSaleOrdItemVO> list, PartsSaleOrdVO partsSaleOrdVO) throws Exception;


    /**
     * Key에 해당하는 부품판매  정보를 조회한다.
     * @param partsSaleOrdSearchVO - 조회할 정보가 담긴 PartsSaleOrdSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public PartsSaleOrdVO selectPartsSaleOrdByKey(PartsSaleOrdSearchVO partsSaleOrdSearchVO) throws Exception;

    /**
     * Key에 해당하는 부품판매 부품 정보를 조회한다.
     * @param partsSaleOrdSearchVO - 조회할 정보가 담긴 PartsSaleOrdSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public List<PartsSaleOrdItemVO> selectPartsSaleOrdItemByKey(PartsSaleOrdSearchVO partsSaleOrdSearchVO) throws Exception;

    /**
     * Key에 해당하는 부품판매 부품 정보를 조회한다.(정산용)
     * @param partsSaleOrdSearchVO - 조회할 정보가 담긴 PartsSaleOrdSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public List<PartCalculateVO> selectPartsSaleOrdCalcItemByKey(PartsSaleOrdSearchVO partsSaleOrdSearchVO) throws Exception;


    public String selectNextPartsSaleOrdNo() throws Exception;

    /**
     * 견적Key에 해당하는 부품판매  정보를 조회한다.
     * @param partsSaleOrdSearchVO - 조회할 정보가 담긴 PartsSaleOrdSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public PartsSaleOrdVO selectPartsSaleOrdByEstimateKey(String dlrCd, String estimateDocNo) throws Exception;

    /**
     * 견적Key에 해당하는 부품판매 부품 정보를 조회한다.
     * @param partsSaleOrdSearchVO - 조회할 정보가 담긴 PartsSaleOrdSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public List<PartsSaleOrdItemVO> selectPartsSaleOrdItemByEstimateKey(String dlrCd, String estimateDocNo) throws Exception;



    /**
     *부품판매  정보를 수정한다.
     * @param partsSaleOrdVO - 수정할 정보가 담긴 partsSaleOrdVO
     * @return 수정된 목록수
     */
    public void multiPartsSaleOrds(BaseSaveVO<PartsSaleOrdItemVO> partsSaleOrdSaveVO, PartsSaleOrdVO partsSaleOrdVO) throws Exception;

    /**
     *부품판매  정보 중 할인률을 수정한다.
     * @param partsSaleOrdVO - 수정할 정보가 담긴 partsSaleOrdVO
     * @return 수정된 목록수
     */
    public void modifyPartsSaleOrdDcRates(BaseSaveVO<PartCalculateVO> partCalculateSaveVO, PartsSaleOrdVO partsSaleOrdVO) throws Exception;

    /**
     * 부품판매  정보를 취소한다.
     * @param partsSaleOrdVO - 취소할 정보가 담긴 PartsSaleOrdVO
     * @return 취소된 목록수
     */
    public int cancelPartsSaleOrd(List<PartsSaleOrdItemVO> list, PartsSaleOrdVO partsSaleOrdVO) throws Exception;

    /**
     *부품판매  정보를 정산처리한다.
     * @param partsSaleOrdVO - 등록할 정보가 담긴 PartsSaleOrdVO
     * @return 등록된 목록수
     */
    public int updateCalculateInfo(PartsSaleOrdVO partsSaleOrdVO) throws Exception;

    /**
     * 부품판매 정보 상태를 변경한다.
     * @param partsSaleOrdVO - 전송할 정보가 담긴 PartsSaleOrdVO
     * @return 변경된 목록수
     */
    public int modifyPartsSaleOrdStat(PartsSaleOrdVO partsSaleOrdVO) throws Exception;


    /**
     *부품판매  정보를 확정처리한다.
     * @param partsSaleOrdVO - 등록할 정보가 담긴 PartsSaleOrdVO
     * @return 등록된 목록수
     */
    public PartsSaleOrdVO cnfmPartsSaleOrd(List<PartsSaleOrdItemVO> list, PartsSaleOrdVO partsSaleOrdVO) throws Exception;

    /**
     *용품판매  정보를 확정처리한다.
     * @param partsSaleOrdVO - 등록할 정보가 담긴 PartsSaleOrdVO
     * @return 등록된 목록수
     */
    public PartsSaleOrdVO cnfmPartsItemSaleOrd(List<PartsSaleOrdItemVO> list, PartsSaleOrdVO partsSaleOrdVO) throws Exception;

    /**
     * 조건에 해당하는 부품판매 리스트 정보를 조회한다.
     * @param partsSaleOrdSearchVO - 조회할 정보가 담긴 PartsSaleOrdSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public List<PartsSaleOrdVO> selectPartsSaleOrdList(PartsSaleOrdSearchVO partsSaleOrdSearchVO) throws Exception;

    /**
     * 조건에 해당하는 부품판매 리스트 정보 Count를 조회한다.
     * @param partsSaleOrdSearchVO - 조회할 정보가 담긴 PartsSaleOrdSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public int selectPartsSaleOrdListCnt(PartsSaleOrdSearchVO partsSaleOrdSearchVO) throws Exception;

    /**
     * 조건에 해당하는 부품판매(팝업) 리스트 정보를 조회한다.
     * @param partsSaleOrdSearchVO - 조회할 정보가 담긴 PartsSaleOrdSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public List<PartsSaleOrdVO> selectPartsSaleOrdPopList(PartsSaleOrdSearchVO partsSaleOrdSearchVO) throws Exception;

    /**
     * 조건에 해당하는 부품판매(팝업) 리스트 정보 Count를 조회한다.
     * @param partsSaleOrdSearchVO - 조회할 정보가 담긴 PartsSaleOrdSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public int selectPartsSaleOrdPopListCnt(PartsSaleOrdSearchVO partsSaleOrdSearchVO) throws Exception;

    /**
     * 조건에 해당하는 부품판매 리스트(정산위주) 정보를 조회한다.
     * @param partsSaleOrdSearchVO - 조회할 정보가 담긴 PartsSaleOrdSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public List<PartsSaleOrdVO> selectPartsSaleOrdForCalcList(PartsSaleOrdSearchVO partsSaleOrdSearchVO) throws Exception;

    /**
     * 조건에 해당하는 부품판매 리스트(정산위주) 정보 Count를 조회한다.
     * @param partsSaleOrdSearchVO - 조회할 정보가 담긴 PartsSaleOrdSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public int selectPartsSaleOrdForCalcListCnt(PartsSaleOrdSearchVO partsSaleOrdSearchVO) throws Exception;

    /**
     * 조건에 해당하는 부품판매 품목리스트 정보를 조회한다.
     * @param partsSaleOrdSearchVO - 조회할 정보가 담긴 PartsSaleOrdSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public List<PartsSaleOrdItemVO> selectPartsSaleOrdItemList(PartsSaleOrdSearchVO partsSaleOrdSearchVO) throws Exception;

    /**
     * 조건에 해당하는 부품판매 품목리스트 정보 Count를 조회한다.
     * @param partsSaleOrdSearchVO - 조회할 정보가 담긴 PartsSaleOrdSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public int selectPartsSaleOrdItemListCnt(PartsSaleOrdSearchVO partsSaleOrdSearchVO) throws Exception;

    /**
     * 조건에 해당하는 부품판매 명세 정보를 조회한다.
     * @param partsSaleOrdSearchVO - 조회할 정보가 담긴 PartsSaleOrdSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public List<PartsSaleOrdItemVO> selectPartsSaleOrdItemByCondition(PartsSaleOrdSearchVO partsSaleOrdSearchVO) throws Exception;

    /**
     * 조건에 해당하는 부품판매 명세 정보 Count를 조회한다.
     * @param partsSaleOrdSearchVO - 조회할 정보가 담긴 PartsSaleOrdSearchVO
     * @return 조회한 부품판매  정의 정보
     */
    public int selectPartsSaleOrdItemByConditionCnt(PartsSaleOrdSearchVO partsSaleOrdSearchVO) throws Exception;


    /**
     * Key에 해당하는 업로드 등록용 기타입고 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcItemVO
     * @return 조회한 기타입고 부품정보
     */
    public PartsSaleOrdItemVO selectPartsSaleOrdItemExcelUploadByKey(PartsSaleOrdItemVO partsSaleOrdItemVO) throws Exception;

    /**
     * Key에 해당하는 부품판매의 수정일자 정보를 체크한다.
     * @param searchVO - 조회 조건을 포함하는 PartsSaleOrdVO
     * @return 체크완료여부
     */
    public boolean fnChkPartsSaleOrdNoUpdateSomebody(PartsSaleOrdVO partsSaleOrdVO) throws Exception;

}
