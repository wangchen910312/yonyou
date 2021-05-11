package chn.bhmc.dms.par.pcm.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.par.pcm.vo.InvcItemVO;
import chn.bhmc.dms.par.pcm.vo.InvcSearchVO;
import chn.bhmc.dms.par.pcm.vo.InvcVO;




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
     *송장  정보를 등록한다.
     * @param purcOrdVO - 등록할 정보가 담긴 PurcOrdVO
     * @return 등록된 목록수
     */
    public InvcVO createInvc(List<InvcItemVO> list, InvcVO invcVO) throws Exception;

    public String selectNextInvcDocNo() throws Exception;

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
     */
    public List<InvcVO> selectReceivesByCondition(InvcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 입고 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록 수
     */
    public int selectReceivesByConditionCnt(InvcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 입고 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public List<InvcVO> selectReceivesByConditionForPopup(InvcSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 입고 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록 수
     */
    public int selectReceivesByConditionForPopupCnt(InvcSearchVO searchVO) throws Exception;


    /**
     * Key에 해당하는 송장 부품 정보를 조회한다.
     * @param InvcSearchVO - 조회할 정보가 담긴 InvcSearchVO
     * @return 조회한 송장  정보
     */
    public List<InvcItemVO> selectInvcItemByKey(InvcSearchVO searchVO) throws Exception;

    /**
     * 구매Key에 해당하는 송장관리 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public List<InvcVO> selectInvcItemByPurcKey(InvcSearchVO invcSearchVO) throws Exception;


    /**
     * 송장Key에 해당하는 송장관리 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public List<InvcItemVO> selectReceiveCnfmItemByInvcKey(InvcSearchVO invcSearchVO) throws Exception;

    /**
     * 기타입고Key에 해당하는 송장관리 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public List<InvcItemVO> selectReceiveCnfmItemByEtcGrKey(InvcSearchVO invcSearchVO) throws Exception;

    /**
     * 입고확정  SUMMARY 정보를 조회한다.(송장번호로 인한)
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public InvcVO selectReceiveCnfmItemSummaryByInvcKey(InvcSearchVO search) throws Exception;
    /**
     * 입고확정  정보를 조회한다.(송장번호로 인한)
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public InvcVO selectReceiveCnfmItemSummaryByEtcGrKey(InvcSearchVO search) throws Exception;


    /**
     * Key에 해당하는 송장관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public InvcVO selectInvcByKey(InvcVO invcVO) throws Exception;


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
     * 송장  정보를 확정한다.
     * @param invcVO - 수정할 정보가 담긴 InvcVO
     * @return 확정된 목록수
     */
    public int updateInvcCnfm(InvcVO invcVO) throws Exception;

    /**
     * 송장확정 정보를 취소한다.
     * @param invcVO - 취소할 정보가 담긴 InvcVO
     * @return 취소된 목록수
     */
    public int cancelInvcCnfm(InvcVO invcVO) throws Exception;

    /**
     * 송장 정보를 삭제한다.
     * @param invcVO - 삭제할 정보가 담긴 InvcVO
     * @return 삭제된 목록수
     */
    public int deleteInvcDoc(InvcVO invcVO, List<InvcItemVO> list) throws Exception;

    /**
     * 입고  정보를 대기한다.
     * @param invcVO - 수정할 정보가 담긴 InvcVO
     * @return 확정된 목록수
     */
    public InvcVO updateReceiveRgst(InvcVO invcVO, List<InvcItemVO> list) throws Exception;

    /**
     * 로컬 입고  정보를 등록한다.
     * @param invcVO - 수정할 정보가 담긴 InvcVO
     * @return 확정된 목록수
     */
    public InvcVO createReceiveRgst(InvcVO invcVO, List<InvcItemVO> list) throws Exception;

    /**
     *로컬입고  정보를 수정한다.
     * @param invcVO - 수정할 정보가 담긴 InvcVO
     * @return 수정된 목록수
     */
    public void multiReceiveEtcRgst(BaseSaveVO<InvcItemVO> invcSaveVO, InvcVO invcVO) throws Exception;

    /**
     *송장입고  정보를 수정한다.
     * @param invcVO - 수정할 정보가 담긴 InvcVO
     * @return 수정된 목록수
     */
    public void multiReceiveRgst(BaseSaveVO<InvcItemVO> invcSaveVO, InvcVO invcVO) throws Exception;


    /**
     * 입고  정보를 확정한다.
     * @param invcVO - 수정할 정보가 담긴 InvcVO
     * @return 확정된 목록수
     */
    public InvcVO updateReceiveCnfm(InvcVO invcVO, List<InvcItemVO> list) throws Exception;

    /**
     * 입고  정보를 확정한다.(모바일용)
     * @param invcVO - 수정할 정보가 담긴 InvcVO
     * @return 확정된 목록수
     */
    public InvcVO updateReceiveCnfmForMobile(InvcVO invcVO, List<InvcItemVO> list) throws Exception;


    /**
     * 입고  정보를 취소한다.
     * @param invcVO - 취소할 정보가 담긴 InvcVO
     * @return 취소된 목록수
     */
    public InvcVO cancelReceiveEtc(List<InvcItemVO> list, InvcVO invcVO) throws Exception;

    /**
     * 입고 등록  정보를 취소한다.
     * @param invcVO - 취소할 정보가 담긴 InvcVO
     * @return 취소된 목록수
     */
    public InvcVO cancelReceiveRegEtc(List<InvcItemVO> list, InvcVO invcVO) throws Exception;


    /**
     * 조회조건에 해당하는 입고 현황을 조회한다.
     * @param InvcSearchVO
     * @return 조회 목록
     */
    public List<InvcItemVO> selectReceiveCnfmListByCondition(InvcSearchVO searchVO) throws Exception;

    /**
     * 조회조건에 해당하는 입고 현황 조회 총 갯수를 조회한다.
     * @param InvcSearchVO
     * @return 조회 목록 수
     */
    public int selectReceiveCnfmListByConditionCnt(InvcSearchVO searchVO) throws Exception;

    /**
     * 조회조건에 해당하는 부품별 입고 내역 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회목록
     */
    public List<InvcItemVO> selectReceiveHistoryByItemCd(InvcSearchVO searchVO) throws Exception;

    /**
     * 조회조건에 해당하는 부품별 입고 내역 정보 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회목록 수
     */
    public int selectReceiveHistoryByItemCdCnt(InvcSearchVO searchVO) throws Exception;

    /**
     * Key에 해당하는 업로드 등록용 기타입고 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcItemVO
     * @return 조회한 기타입고 부품정보
     */
    public InvcItemVO selectInvcReceiveEtcItemExcelUploadByKey(InvcItemVO invcItemVO) throws Exception;


    /**
     * Key에 해당하는 부품송장의 수정일자 정보를 체크한다.
     * @param invcItemVO - 조회 조건을 포함하는 InvcVO
     * @return 체크완료여부
     */
    public boolean fnChkMobisInvcDocNoUpdateSomebody(InvcVO invcVO) throws Exception;


    /**
     * Key에 해당하는 DMS송장 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public InvcVO selectDmsInvcByKey(InvcSearchVO searchVO) throws Exception;

    /**
     * 조회조건에 해당하는 부품별 입고 대상 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회목록
     */
    public List<InvcItemVO> selectInvcItemByKeyForRgst(InvcSearchVO searchVO) throws Exception;

    /**
     * 조회조건에 해당하는 부품별 입고 대상 정보 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회목록 수
     */
    public int selectInvcItemByKeyForRgstCnt(InvcSearchVO searchVO) throws Exception;

}
