package chn.bhmc.dms.crm.crq.service;

import java.util.List;

import chn.bhmc.dms.crm.crq.vo.VocTpCdSummeryVO;

import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.crm.crq.vo.VocActiveSaveVO;
import chn.bhmc.dms.crm.crq.vo.VocActiveVO;
import chn.bhmc.dms.crm.crq.vo.VocMgmtSearchVO;
import chn.bhmc.dms.crm.crq.vo.VocMgmtVO;

/**
 * VOC 관리 서비스
 *
 * @author hyoung jun an
 * @since 2016. 3. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.04         hyoung jun an            최초 생성
 * </pre>
 */

public interface VocMgmtService {

    /**
     * VOC 정보를 등록한다.
     * @param saveVO - 등록할 정보가 담긴 VocMgmtVO
     * @return 등록된 목록수
     */
    public String insertVocMgmt(VocMgmtVO saveVO) throws Exception;

    /**
     * VOC 정보를 수정한다.
     * @param saveVO - 수정할 정보가 담긴 VocMgmtVO
     * @return 수정된 목록수
     */
    public int updateVocMgmt(VocMgmtVO saveVO) throws Exception;

    /**
     * SUB 유형 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     * @param searchVO - 조회 조건을 포함하는 VehicleSearchVO
     * @return 조회 목록
     */
    public List<CommonCodeVO> selectVocTpSubCdListByCondition(VocMgmtSearchVO searchVO) throws Exception;

    /**
     * 성코드 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     * @param searchVO - 조회 조건을 포함하는 VehicleSearchVO
     * @return 조회 목록
     */
    public List<CommonCodeVO> selectSungCdListByCondition(VocMgmtSearchVO searchVO) throws Exception;

    /**
     * 도시코드 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     * @param searchVO - 조회 조건을 포함하는 VehicleSearchVO
     * @return 조회 목록
     */
    public List<CommonCodeVO> selectCityCdListByCondition(VocMgmtSearchVO searchVO) throws Exception;

    public String selectNextVocNo() throws Exception;





    /**
     * 조회 조건에 해당하는 VOC활동 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignVO
     * @return
     */
    public int selectActivesByConditionCnt(VocMgmtSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 VOC활동 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignVO
     * @return 조회 목록
     */
    public List<VocActiveVO> selectActivesByCondition(VocMgmtSearchVO searchVO) throws Exception;

    /**
     * VOC활동 정보를 등록/수정 처리한다.
     * @param activeSaveVO
     */
    public void multiActives(VocActiveSaveVO saveVO) throws Exception;


    /**
     * VOC 상태 변경
     *
     * @param vocMgmtVO
     */
    public int updateVocStatCd(VocMgmtVO vocMgmtVO) throws Exception;



    /**
     * BHMC VOC 처리 정보를 수정한다.        [20161020 사용안함]
     * @param saveVO - 수정할 정보가 담긴 VocMgmtVO
     * @return 수정된 목록수
     */
//    public int updateBhmcVocProce(VocMgmtVO vocMgmtVO) throws Exception;




    /**
     * VOC 일별/월별 수량을 조회한다.
     * [일/월별 등록 수량]
     * @param VocMgmtSearchVO - sDlrCd / sDtType / sRegDt
     * @return [일/월별] 등록 수량
     */
    public int selectVocDateTpRegCnt(VocMgmtSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 VOC 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return-
     */
    public int selectVocMgmtsByConditionCnt(VocMgmtSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 VOC 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VocMgmtSearchVO
     * @return 조회 목록
     */
    public List<VocMgmtVO> selectVocMgmtsByCondition(VocMgmtSearchVO searchVO) throws Exception;

    /**
     * VOC 상세 정보를 조회한다.
     * @param VocMgmtSearchVO - VOC_NO, DLR_CD
     * @return
     */
    public VocMgmtVO selectVocMgmtByKey(VocMgmtSearchVO searchVO) throws Exception;

    /**
     * Siebel 에서 전송된 정보만 I/F 보낸다. (0601T -> 0601IS , BhmcVocNo 있는경우)
     * 무조건 삭제후 인서트
     * @param VocMgmtSearchVO - sDlrCd, sBhmcVocNo
     * @return 등록 수량
     */
    public int vocMgmtIF(VocMgmtSearchVO searchVO) throws Exception;


    /**
     * VOC text area text append
     */
    public String vocTxtAppend(String preTxt, String appendTxt)  throws Exception;


    /**
     * VOC 활동 입력
     *  -> 제조사 VOC && 상태가 처리대기 -> 처리완료 일때만 I/F에 입력
     */
    public int insertActive(VocActiveVO vocActiveVO) throws Exception;

    /**
     * VOC 요약정보 조회 ( 진행중인 상태의 전체 목록 / 검색조건이랑 상관없음 )
     * @param searchVO - 조회 조건을 포함하는 VocMgmtSearchVO
     * @return
     */
    public VocTpCdSummeryVO selectVocTpCdSummeryCnt(VocMgmtSearchVO searchVO) throws Exception;


}