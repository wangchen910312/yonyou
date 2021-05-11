package chn.bhmc.dms.crm.mcm.service;

import java.util.List;

import chn.bhmc.dms.cmm.apr.vo.SignSearchVO;
import chn.bhmc.dms.cmm.apr.vo.SignVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignSaveExVO;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignSearchVO;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignVO;

/**
 * 마케팅 캠페인 관리 서비스
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

public interface MarketingCampaignService {

    /**
     * 조회 조건에 해당하는 마케팅 캠페인 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return
     */
    public int selectMarketingCampaignsByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 마케팅 캠페인 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return 조회 목록
     */
    public List<MarketingCampaignVO> selectMarketingCampaignsByCondition(MarketingCampaignSearchVO searchVO) throws Exception;

    public String selectNextMakNo() throws Exception;



    /**
     * 마케팅 캠페인 정보를 등록한다.
     * @param visitCustomerVO - 등록할 정보가 담긴 MarketingCampaignVO
     * @return 등록된 목록수
     */
    public String insertMarketingCampaign(MarketingCampaignVO visitCustomerVO) throws Exception;

    /**
     * 마케팅 캠페인 정보를 수정한다.
     * @param visitCustomerVO - 수정할 정보가 담긴 MarketingCampaignVO
     * @return 수정된 목록수
     */
    public String updateMarketingCampaign(MarketingCampaignVO visitCustomerVO) throws Exception;

    /**
     * 마케팅 캠페인 정보를 삭제한다.
     * @param visitCustomerVO - 삭제할 정보가 담긴 MarketingCampaignVO
     * @return 삭제된 목록수
     */
    public int deleteMarketingCampaign(MarketingCampaignVO visitCustomerVO) throws Exception;

    /**
     * 마케팅 캠페인 상세 조회
     * @param marketingCampaignVO
     *
     */
    public MarketingCampaignVO selectMarketingCampaignByKey(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 유형 Sub 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     * @param searchVO - 조회 조건을 포함하는 VehicleSearchVO
     * @return 조회 목록
     */
    public List<MarketingCampaignVO> selectMakTpCdListByCondition(MarketingCampaignSearchVO searchVO) throws Exception;




    /**
     * 조회 조건에 해당하는 마케팅 캠페인(활동방안) 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignVO
     * @return
     */
    public int selectActivesByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 마케팅 캠페인(활동방안) 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignVO
     * @return 조회 목록
     */
    public List<MarketingCampaignVO> selectActivesByCondition(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 마케팅 캠페인(활동방안) 정보를 등록/수정/삭제 처리한다.
     * @param budgetSaveVO
     */
    public void multiActives(MarketingCampaignSaveExVO budgetSaveVO) throws Exception;

    /**
     * 마케팅 캠페인(활동방안) 정보를 등록/수정/삭제 처리한다.
     * @param budgetSaveVO
     */
    public void multiActiveExs(MarketingCampaignSaveExVO budgetSaveVO) throws Exception;

    /**
     * 마케팅 캠페인 정보를 수정한다.(활동방안 탭)
     * @param visitCustomerVO - 수정할 정보가 담긴 MarketingCampaignVO
     * @return 수정된 목록수
     */
    public int updateMarketingCampaignActive(MarketingCampaignVO visitCustomerVO) throws Exception;

    /**
     * 마케팅 캠페인(활동방안) 정보를 등록한다.
     * @param visitCustomerVO - 등록할 정보가 담긴 MarketingCampaignVO
     * @return 등록된 목록수
     */
    public int insertActive(MarketingCampaignVO visitCustomerVO) throws Exception;

    /**
     * 마케팅 캠페인(활동방안) 정보를 수정한다.
     * @param visitCustomerVO - 수정할 정보가 담긴 MarketingCampaignVO
     * @return 수정된 목록수
     */
    public int updateActive(MarketingCampaignVO visitCustomerVO) throws Exception;

    /**
     * 마케팅 캠페인(활동방안) 정보를 삭제한다.
     * @param visitCustomerVO - 삭제할 정보가 담긴 MarketingCampaignVO
     * @return 삭제된 목록수
     */
    public int deleteActive(MarketingCampaignVO visitCustomerVO) throws Exception;

    /**
     * 마케팅 캠페인 화술방안 목록수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return
     */
    public int selectTalkPlansByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 마케팅 캠페인 화술방안 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return 조회 목록
     */
    public List<MarketingCampaignVO> selectTalkPlansByCondition(MarketingCampaignSearchVO searchVO) throws Exception;





    /**
     * 조회 조건에 해당하는 마케팅 캠페인(목표) 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignVO
     * @return
     */
    public int selectGoalsByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 마케팅 캠페인(목표) 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignVO
     * @return 조회 목록
     */
    public List<MarketingCampaignVO> selectGoalsByCondition(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 마케팅 캠페인(목표) 정보를 등록/수정/삭제 처리한다.
     * @param budgetSaveVO
     */
    public void multiGoals(BaseSaveVO<MarketingCampaignVO> budgetSaveVO) throws Exception;

    /**
     * 마케팅 캠페인(목표) 정보를 등록한다.
     * @param visitCustomerVO - 등록할 정보가 담긴 MarketingCampaignVO
     * @return 등록된 목록수
     */
    public int insertGoal(MarketingCampaignVO visitCustomerVO) throws Exception;

    /**
     * 마케팅 캠페인(목표) 정보를 수정한다.
     * @param visitCustomerVO - 수정할 정보가 담긴 MarketingCampaignVO
     * @return 수정된 목록수
     */
    public int updateGoal(MarketingCampaignVO visitCustomerVO) throws Exception;

    /**
     * 마케팅 캠페인(목표) 정보를 삭제한다.
     * @param visitCustomerVO - 삭제할 정보가 담긴 MarketingCampaignVO
     * @return 삭제된 목록수
     */
    public int deleteGoal(MarketingCampaignVO visitCustomerVO) throws Exception;





    /**
     * 조회 조건에 해당하는 마케팅 캠페인(대상자) 총 갯수를 조회한다.
     * @param MarketingCampaignSearchVO - 마케팅 캠페인
     * @return
     */
    public int selectTargetsByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 마케팅 캠페인(대상자) 정보를 조회한다.
     * @param MarketingCampaignSearchVO - 마케팅 캠페인
     * @return 조회 목록
     */
    public List<MarketingCampaignVO> selectTargetsByCondition(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 마케팅 캠페인(대상자) 정보를 저장한다.
     * @param MarketingCampaignVO - 마케팅 캠페인
     * @return 등록된 목록수
     */
    public int multiTargets(MarketingCampaignVO activeVO) throws Exception;

    /**
     * 마케팅 캠페인(대상자) 정보를 삭제 한다.
     * @param MarketingCampaignVO - 마케팅 캠페인
     * @return 삭제 수량
     */
    public int deleteTarget(MarketingCampaignVO activeVO) throws Exception;

    /**
     * 마케팅 캠페인(대상자) 정보를 등록한다.(엑셀 업로드를 통한 데이터 저장시에만 사용)
     * @param MarketingCampaignSaveExVO
     * @return 등록된 목록수
     */
    public int insertTargetExcelData(MarketingCampaignSaveExVO saveVO) throws Exception;

    /**
     * 캠페인에 따른 추출대상자 데이터를 추출차수별로 삭제한다
     *
     * @param saveVO - 삭제 데이터가 포함된 MarketingCampaignSaveVO
     * @return
     */
    public void multiCrmTargExtractDetails(BaseSaveVO<MarketingCampaignVO> saveVO) throws Exception;

    /**
     * 마케팅 캠페인(대상자 디테일 - CR_0710T) 정보를 삭제한다.
     * @param MarketingCampaignVO - 마케팅 캠페인
     * @return 삭제 수량
     */
    public int deleteTargetDetail(MarketingCampaignVO activeVO) throws Exception;

    /**
     * 마케팅 캠페인(대상자 디테일 - CR_0710T) 정보를 등록한다.(수동으로 대상자 추출버튼을 통해 생성)
     * @param marketingCampaignVO - 등록할 정보가 담긴 MarketingCampaignVO
     * @return 등록된 목록수
     */
    public int insertTargetExtractSave(MarketingCampaignVO marketingCampaignVO) throws Exception;

    /**
     * 마케팅 캠페인(대상자) 정보를 수정한다.(대상자 추출버튼을 통한 대상자 마스터 업데이트)
     * @param marketingCampaignVO - 등록할 정보가 담긴 MarketingCampaignVO
     * @return 등록된 목록수
     */
    public int updateTargetExtractMaster(MarketingCampaignVO marketingCampaignVO) throws Exception;

    /**
     * 마케팅 캠페인(대상자 마스터/디테일) 정보를 삭제한다.(추출조건차수을 삭제할때 추출조건차수에 대상자가 존재하면 같이 삭제.)
     * @param MarketingCampaignVO - 마케팅 캠페인
     * @return 삭제 수량
     */
    public int deleteTargetEx(MarketingCampaignVO activeVO) throws Exception;





    /**
     * 조회 조건에 해당하는 마케팅 캠페인(예산) 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignVO
     * @return
     */
    public int selectBudgetsByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 마케팅 캠페인(예산) 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignVO
     * @return 조회 목록
     */
    public List<MarketingCampaignVO> selectBudgetsByCondition(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * Key에 해당하는 마케팅 캠페인(예산) 정보를 조회한다.
     * @param mesgKey - 메세지키
     * @return 조회한 마케팅 캠페인(예산) 정보
     */
    public MarketingCampaignVO selectBudgetByKey(MarketingCampaignVO searchVO) throws Exception;

    /**
     * 마케팅 캠페인(예산) 정보를 등록/수정/삭제 처리한다.
     * @param budgetSaveVO
     */
    public void multiBudgets(BaseSaveVO<MarketingCampaignVO> budgetSaveVO) throws Exception;

    /**
     * 마케팅 캠페인(예산) 정보를 등록한다.
     * @param visitCustomerVO - 등록할 정보가 담긴 MarketingCampaignVO
     * @return 등록된 목록수
     */
    public int insertBudget(MarketingCampaignVO visitCustomerVO) throws Exception;

    /**
     * 마케팅 캠페인(예산) 정보를 수정한다.
     * @param visitCustomerVO - 수정할 정보가 담긴 MarketingCampaignVO
     * @return 수정된 목록수
     */
    public int updateBudget(MarketingCampaignVO visitCustomerVO) throws Exception;

    /**
     * 마케팅 캠페인(예산) 정보를 삭제한다.
     * @param visitCustomerVO - 삭제할 정보가 담긴 MarketingCampaignVO
     * @return 삭제된 목록수
     */
    public int deleteBudget(MarketingCampaignVO visitCustomerVO) throws Exception;





    /**
     * 조회 조건에 해당하는 마케팅 캠페인(대상자) 총 갯수를 조회한다.(심사진도 탭에서 심사요청 시 대상자 추출조건이 있는지 체크)
     * @param MarketingCampaignSearchVO - 마케팅 캠페인
     * @return
     */
    public int selectTargetExsByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 마케팅 캠페인(작업정보 및 부품정보) 목록수를 조회한다.(공임코드별로 부품이 등록되어 있으면 원인부품코드도 등록되어야 하는데 등록되어 있는지 체크)
     * @param MarketingCampaignSearchVO - 마케팅 캠페인
     * @return
     */
    public int selectWorkItemsByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 마케팅 캠페인에 결재문서번호를 수정한다.(심사진도 탭 - 마케팅캠페인 진행상태를 '심사중'으로 변경)
     * @param visitCustomerVO - 수정할 정보가 담긴 MarketingCampaignVO
     * @return 수정된 목록수
     */
    public int updateApprDocNo(MarketingCampaignVO visitCustomerVO) throws Exception;

    /**
     * 결재할 사람에게 알람을 보낸다.
     * @param signVO
     */
    //public void pushSignAlarms(SignVO signVO) throws Exception;

    /**
     * 결제정보 조회
     * @param SignSearchVO
     */
    public SignVO selectSignExByKey(SignSearchVO searchVO) throws Exception;

    /**
     * 마케팅캠페인코드 조회
     * @param SignSearchVO
     */
    public MarketingCampaignVO selectMakCdByKey(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 마케팅 캠페인 진행상태를 수정한다.(심사진도 탭)
     * @param marketingCampaignVO - 수정할 정보가 담긴 MarketingCampaignVO
     * @return 수정된 목록수
     */
    public int updateStatCd(MarketingCampaignVO marketingCampaignVO) throws Exception;




    /**
     * 조회 조건에 해당하는 마케팅 캠페인(결과-목표) 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignVO
     * @return 조회 목록
     */
    public List<MarketingCampaignVO> selectResultGoalsByCondition(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 마케팅 캠페인(결과-업체평가) 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignVO
     * @return 조회 목록
     */
    public List<MarketingCampaignVO> selectResultCorpsByCondition(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 마케팅 캠페인(결과-캠페인직원평가) 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignVO
     * @return 조회 목록
     */
    public List<MarketingCampaignVO> selectResultPersonsByCondition(MarketingCampaignSearchVO searchVO) throws Exception;





    /**
     * 캠페인 대상 작업정보 목록수를 조회한다.(정비 캠페인)
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return
     */
    public int selectWorkByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 캠페인 대상 작업정보 목록을 조회한다.(정비 캠페인)
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return 조회 목록
     */
    public List<MarketingCampaignVO> selectWorkByCondition(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 캠페인 대상 작업정보를 등록/수정/삭제 처리한다.(정비 캠페인)
     * @param budgetSaveVO
     */
    public void multiWorks(BaseSaveVO<MarketingCampaignVO> budgetSaveVO) throws Exception;

    /**
     * 캠페인 대상 작업정보를 등록한다.(정비 캠페인)
     * @param marketingCampaignVO - 등록할 정보가 담긴 MarketingCampaignVO
     * @return 등록된 목록수
     */
    public int insertWork(MarketingCampaignVO marketingCampaignVO) throws Exception;

    /**
     * 캠페인 대상 작업정보를 수정한다.(정비 캠페인)
     * @param marketingCampaignVO - 수정할 정보가 담긴 MarketingCampaignVO
     * @return 수정된 목록수
     */
    public int updateWork(MarketingCampaignVO marketingCampaignVO) throws Exception;

    /**
     * 캠페인 대상 작업정보를 삭제한다.(정비 캠페인)
     * @param marketingCampaignVO - 삭제할 정보가 담긴 MarketingCampaignVO
     * @return 삭제된 목록수
     */
    public int deleteWork(MarketingCampaignVO marketingCampaignVO) throws Exception;





    /**
     * 캠페인 대상 VIN정보 목록수를 조회한다.(정비 캠페인)
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return
     */
    public int selectVinByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 캠페인 대상 VIN정보 목록을 조회한다.(정비 캠페인)
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return 조회 목록
     */
    public List<MarketingCampaignVO> selectVinByCondition(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 캠페인 대상 VIN TMP 정보 목록수를 조회한다.(정비 캠페인)
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return
     */
    public int selectVinTmpByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 캠페인 대상 VIN TMP 정보 목록을 조회한다.(정비 캠페인)
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return 조회 목록
     */
    public List<MarketingCampaignVO> selectVinTmpByCondition(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 마케팅 캠페인(VIN정보 - SE_1073T) 정보를 등록한다.(엑셀 업로드를 통한 데이터 저장시에만 사용)
     * @param MarketingCampaignVO - 마케팅 캠페인
     * @return 등록된 목록수
     */
    public int insertVinExcelData(MarketingCampaignSaveExVO activeVO) throws Exception;

    /**
     * 마케팅 캠페인(VIN정보 - SE_1073T_TMP) 정보를 등록한다.(엑셀 업로드를 통한 데이터 저장시에만 사용)
     * @param MarketingCampaignVO - 마케팅 캠페인
     * @return 등록된 목록수
     */
    public int insertVinTmpExcelData(MarketingCampaignVO activeVO) throws Exception;

    /**
     * 마케팅 캠페인(VIN정보 - SE_1073T_TMP) 정보를 삭제한다.(엑셀 업로드를 통한 데이터 저장시에만 사용)
     * @param MarketingCampaignVO - 마케팅 캠페인
     * @return 등록된 목록수
     */
    public int deleteVinTmpExcelData(MarketingCampaignVO activeVO) throws Exception;

    /**
     * 마케팅 캠페인(LTS MODEL 정보 - SE_1074T) 정보를 등록한다.(엑셀 업로드를 통한 데이터 저장시에만 사용)
     * @param MarketingCampaignVO - 마케팅 캠페인
     * @return 등록된 목록수
     */
    public int insertLtsModelExcelData(MarketingCampaignSaveExVO activeVO) throws Exception;


    /**
     * 캠페인 대상 공임정보 목록수를 조회한다.(정비 캠페인)
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return
     */
    public int selectLaborByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 캠페인 대상 공임정보 목록을 조회한다.(정비 캠페인)
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return 조회 목록
     */
    public List<MarketingCampaignVO> selectLaborByCondition(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 캠페인 대상 공임정보를 등록/수정/삭제 처리한다.(정비 캠페인)
     * @param budgetSaveVO
     */
    public void multiLabor(BaseSaveVO<MarketingCampaignVO> budgetSaveVO) throws Exception;

    /**
     * 캠페인 대상 공임정보를 수정한다.(정비 캠페인)
     * @param marketingCampaignVO - 수정할 정보가 담긴 MarketingCampaignVO
     * @return 수정된 목록수
     */
    public int updateLabor(MarketingCampaignVO marketingCampaignVO) throws Exception;





    /**
     * 캠페인 대상 부품정보 목록수를 조회한다.(정비 캠페인)
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return
     */
    public int selectItemsByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 캠페인 대상 부품정보 목록을 조회한다.(정비 캠페인)
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return 조회 목록
     */
    public List<MarketingCampaignVO> selectItemsByCondition(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 딜러 캠페인 대상 부품정보 목록수를 조회한다.(정비 캠페인)
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return
     */
    public int selectDlrItemsByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 딜러 캠페인 대상 부품정보 목록을 조회한다.(정비 캠페인)
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return 조회 목록
     */
    public List<MarketingCampaignVO> selectDlrItemsByCondition(MarketingCampaignSearchVO searchVO) throws Exception;


    /**
     * 공임코드 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     */
    public List<MarketingCampaignVO> selectLbrCdListByCondition(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 캠페인 대상 부품정보를 등록/수정/삭제 처리한다.(정비 캠페인)
     * @param budgetSaveVO
     */
    public void multiItems(BaseSaveVO<MarketingCampaignVO> budgetSaveVO) throws Exception;

    /**
     * 캠페인 대상 부품정보를 등록한다.(정비 캠페인)
     * @param marketingCampaignVO - 등록할 정보가 담긴 MarketingCampaignVO
     * @return 등록된 목록수
     */
    public int insertItems(MarketingCampaignVO marketingCampaignVO) throws Exception;

    /**
     * 캠페인 대상 부품정보를 삭제한다.(정비 캠페인)
     * @param marketingCampaignVO - 삭제할 정보가 담긴 MarketingCampaignVO
     * @return 삭제된 목록수
     */
    public int deleteItems(MarketingCampaignVO marketingCampaignVO) throws Exception;


    /**
     * 캠페인 대상 부품정보를 수정한다.(정비 캠페인)
     * @param marketingCampaignVO - 수정할 정보가 담긴 MarketingCampaignVO
     * @return 수정된 목록수
     */
    public int updateItems(MarketingCampaignVO marketingCampaignVO) throws Exception;

    /**
     * 조회 조건에 해당하는 전체 딜러 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return
     */
    public int selectDealersByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 전체 딜러 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return 조회 목록
     */
    public List<MarketingCampaignVO> selectDealersByCondition(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 대상 딜러 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return
     */
    public int selectDlrsByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 대상 딜러 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return 조회 목록
     */
    public List<MarketingCampaignVO> selectDlrsByCondition(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 마케팅 캠페인(대상 딜러) 정보를 등록한다.(삭제 및 신규저장)
     * @param MarketingCampaignSaveExVO
     * @return 등록된 목록수
     */
    public int saveDlrCdData(MarketingCampaignSaveExVO saveVO) throws Exception;

    /**
     * 마케팅 캠페인(대상 딜러) 정보를 등록한다.
     * @param MarketingCampaignVO - 마케팅 캠페인
     * @return 등록된 목록수
     */
    public int insertDlr(MarketingCampaignVO saveVO) throws Exception;

    /**
     * 마케팅 캠페인(대상 딜러) 정보를 삭제한다.
     * @param MarketingCampaignVO - 마케팅 캠페인
     * @return 삭제 수량
     */
    public int deleteDlr(MarketingCampaignVO saveVO) throws Exception;


    /**
     * 조회 조건에 해당하는 마케팅 캠페인 대상자 총 갯수를 조회한다.(팝업)
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return
     */
    public int selectCrmTargExtractPopupsByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 마케팅 캠페인 대상자 정보를 조회한다.(팝업)
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return 조회 목록
     */
    public List<MarketingCampaignVO> selectCrmTargExtractPopupsByCondition(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 대상고객 엑셀 업로드시 고객정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return 조회 목록
     */
    public List<MarketingCampaignVO> selectCustomerInfoChkByExcelImp(List<MarketingCampaignVO> list) throws Exception;

    /**
     * 마케팅 캠페인 정보를 복사 한다.
     * @param searchVO - makCd
     * @return 캠페인 번호
     */
    public String copyMarketingCampaign(MarketingCampaignVO marketingCampaignVO) throws Exception;


}