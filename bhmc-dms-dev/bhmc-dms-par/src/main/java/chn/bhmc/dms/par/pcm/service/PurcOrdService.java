package chn.bhmc.dms.par.pcm.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.par.pcm.vo.PurcOrdItemVO;
import chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO;
import chn.bhmc.dms.par.pcm.vo.PurcOrdVO;

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

public interface PurcOrdService {

    /**
     *구매오더  정보를 등록한다.
     * @param purcOrdVO - 등록할 정보가 담긴 PurcOrdVO
     * @return 등록된 목록수
     */
    public PurcOrdVO createOrd(List<PurcOrdItemVO> list, PurcOrdVO purcOrdVO) throws Exception;


    /**
     *구매오더  정보를 수정한다.
     * @param purcOrdVO - 수정할 정보가 담긴 PurcOrdVO
     * @return 수정된 목록수
     */
    public void multiPurcOrds(BaseSaveVO<PurcOrdItemVO> purcOrdSaveVO, PurcOrdVO purcOrdVO) throws Exception;


    /**
     * 구매오더  정보를 전송한다.
     * @param purcOrdVO - 전송할 정보가 담긴 PurcOrdVO
     * @return 전송된 목록수
     */
    public int sendPurcOrd(PurcOrdVO purcOrdVO) throws Exception;

    /**
     * 구매오더  정보를 수정한다.
     * @param purcOrdVO - 수정할 정보가 담긴 PurcOrdVO
     * @return 취소된 목록수
     */
    public int updatePurcOrd(PurcOrdVO purcOrdVO) throws Exception;

    /**
     * 구매오더  정보를 취소한다.
     * @param purcOrdVO - 취소할 정보가 담긴 PurcOrdVO
     * @return 취소된 목록수
     */
    public int cancelPurcOrd(List<PurcOrdItemVO> list, PurcOrdVO purcOrdVO) throws Exception;

    /**
     *구매오더  정보를 수정 후 확정한다.(로컬업체 대상)
     * @param purcOrdVO - 수정할 정보가 담긴 PurcOrdVO
     * @return 수정된 목록수
     */
    public void multiConfirmPurcOrd(BaseSaveVO<PurcOrdItemVO> purcOrdSaveVO, PurcOrdVO purcOrdVO) throws Exception;

    /**
     * 구매오더  정보를 확정한다.(로컬업체 대상)
     * @param purcOrdVO - 취소할 정보가 담긴 PurcOrdVO
     * @return 확정된 목록수
     */
    public int confirmPurcOrd(PurcOrdVO purcOrdVO) throws Exception;

    /**
     * 송장등록 시구매오더   정보를 완료한다.(로컬업체 대상)
     * @param purcOrdVO - 완료할 정보가 담긴 PurcOrdVO
     * @return 확정된 목록수
     */
    public int invcRegLocalPurcOrd(PurcOrdVO purcOrdVO) throws Exception;

    /**
     *로컬 구매오더를 반환한다.(수불발생X)
     * @param purcOrdItemVO - 등록할 정보가 담긴 purcOrdItemVO
     * @return 등록된 목록수
     */
    public int returnPurcOrdItems(List<PurcOrdItemVO> list) throws Exception;

    /**
     *로컬 구매오더를 반환정보를 수정한다.(수불발생X)
     * @param purcOrdVO - 수정할 정보가 담긴 PurcOrdVO
     * @return 수정된 목록수
     */
    public void multiReturnPurcOrdItems(BaseSaveVO<PurcOrdItemVO> purcOrdSaveVO) throws Exception;

    /**
     * Key에 해당하는 구매오더  정보를 조회한다.
     * @param purcOrdVO - 조회할 정보가 담긴 PurcOrdVO
     * @return 조회한 구매오더  정의 정보
     */
    public PurcOrdVO selectPurcOrdByKey(PurcOrdSearchVO purcOrdSearchVO) throws Exception;

    /**
     * Key에 해당하는 구매오더 서머리 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param lvlId - 레벨ID
     * @return 조회한 구매오더 정보
     */
    public PurcOrdVO selectPurcOrdSummaryByKey(PurcOrdSearchVO purcOrdSearchVO) throws Exception;

    /**
     * Key에 해당하는 구매오더 부품 정보를 조회한다.
     * @param purcOrdVO - 조회할 정보가 담긴 PurcOrdVO
     * @return 조회한 구매오더  정의 정보
     */
    public List<PurcOrdItemVO> selectPurcOrdItemByKey(PurcOrdSearchVO purcOrdSearchVO) throws Exception;

    /**
     * Key에 해당하는 반품구매오더 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록
     */
    public List<PurcOrdItemVO> selectReturnPurcOrdItemByKey(PurcOrdSearchVO purcOrdSearchVO) throws Exception;

    /**
     * Key에 해당하는 업로드 등록용 구매오더 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdItemVO
     * @return 조회한 구매오더 부품정보
     */
    public PurcOrdItemVO selectPurcOrdItemExcelUploadByKey(PurcOrdItemVO purcOrdItemVO) throws Exception;

    /**
     * 구매오더 정보에 해당하는 구매오더 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdItemVO
     * @return 조회한 구매오더 부품정보
     */
    public PurcOrdItemVO selectItemInfoByPurcOrderInfo(PurcOrdItemVO purcOrdItemVO) throws Exception;

    /**
     * 조회조건에 해당하는 구매오더  정보를 조회한다.
     * @param purcOrdVO - 조회할 정보가 담긴 PurcOrdVO
     * @return 조회한 구매오더  정의 정보
     */
    public List<PurcOrdVO> selectPurcOrdsByCondition(PurcOrdSearchVO searchVO) throws Exception;


    /**
     * 조회 조건에 해당하는 구매오더  총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록 수
     */
    public int selectPurcOrdsByConditionCnt(PurcOrdSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 구매오더부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록
     */
    public List<PurcOrdVO> selectPurcOrdItemCondition(PurcOrdSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 구매오더부품 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록 수
     */
    public int selectPurcOrdItemConditionCnt(PurcOrdSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 반품구매오더부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록
     */
    public List<PurcOrdItemVO> selectReturnPurcOrdItemCondition(PurcOrdSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 반품구매오더부품 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록 수
     */
    public int selectReturnPurcOrdItemConditionCnt(PurcOrdSearchVO searchVO) throws Exception;

    public String selectNextPurcOrdNo() throws Exception;

    /**
     * 조회조건에 해당하는 구매오더  정보를 조회한다.
     * @param purcOrdVO - 조회할 정보가 담긴 PurcOrdVO
     * @return 조회한 구매오더  정의 정보
     */
    public List<PurcOrdItemVO> selectInvcItemsByCondition(PurcOrdSearchVO searchVO) throws Exception;


    /**
     * 조회 조건에 해당하는 구매오더  총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록 수
     */
    public int selectInvcItemsByConditionCnt(PurcOrdSearchVO searchVO) throws Exception;

    /**
     * 입고  확정 시 구매오더 정보를 수정한다.(입고 수량)
     * @param purcOrdItemVO - 수정할 정보가 담긴 PurcOrdItemVO
     * @return 확정된 목록수
     */
    public int updatePurcOrdCnfmItemByReceive(PurcOrdItemVO purcOrdItemVO) throws Exception;

    /**
     * 입고  확정 시 구매오더 정보를 수정한다.(입고 수량, 입고여부)
     * @param purcOrdItemVO - 수정할 정보가 담긴 PurcOrdItemVO
     * @return 확정된 목록수
     */
    public int updatePurcOrdCnfmEndItemByReceive(PurcOrdItemVO purcOrdItemVO) throws Exception;

    /**
     * 조건에 해당하는 구매현황 데이타 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록
     */
    public List<PurcOrdItemVO> selectPurcOrdStatusByCondition(PurcOrdSearchVO searchVO) throws Exception;

    /**
     * 조건에 해당하는 구매현황 데이타 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return
     */
    public int selectPurcOrdStatusByConditionCnt(PurcOrdSearchVO searchVO) throws Exception;

    /**
     * 조건에 해당하는 B/O 데이타 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록
     */
    public List<PurcOrdItemVO> selectPurcOrdStatusListSummary(PurcOrdSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 구매현황 데이타 정보를 조회한다.(구매현황용)
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록
     */
    public List<PurcOrdItemVO> selectPurcOrdStatusByConditionForPurcOrdSummary(PurcOrdSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 구매현황 데이타 총 갯수를 조회한다.(구매현황용)
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록 수
     */
    public int selectPurcOrdStatusByConditionForPurcOrdSummaryCnt(PurcOrdSearchVO searchVO) throws Exception;


    /**
     * Key에 해당하는 부품구매의 수정일자 정보를 체크한다.
     * @param purcOrdVO - 조회 조건을 포함하는 PurcOrdVO
     * @return 체크완료여부
     */
    public boolean fnChkPurcOrdNoUpdateSomebody(PurcOrdVO purcOrdVO) throws Exception;

    /**
     * 조회 조건에 해당하는 구매오더  총 갯수를 조회한다.(모바일)
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록 수
     */
    public int selectMobilePurcOrdsByConditionCnt(PurcOrdSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 구매상태 데이타 SUMMARY 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록
     */
    public List<PurcOrdItemVO> selectPurcOrdStatusSummary(PurcOrdSearchVO searchVO) throws Exception;

    /**
     * 조건에 해당하는 실시간 구매현황 데이타(AMOS) 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록
     */
    public SearchResult selectPurcOrdStatusInterfaceRealTime(PurcOrdSearchVO searchVO) throws Exception;

    /**
	 * 合格证申请修改弹出配件选择窗口 add by lyy 2018-09-07
	 * @param searchVO - PurcOrdSearchVO
	 * @return 조회 목록
	 */
	public List<PurcOrdItemVO> selectPurcOrdByCondition(PurcOrdSearchVO searchVO) throws Exception;

	/**
	 * 合格证申请修改弹出配件选择窗口 add by lyy 2018-09-07
	 * @param searchVO - PurcOrdSearchVO
	 * @return
	 */
	public int selectPurcOrdByConditionCnt(PurcOrdSearchVO searchVO) throws Exception;
	
}
