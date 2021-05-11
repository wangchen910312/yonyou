package chn.bhmc.dms.crm.mcm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.cmm.apr.vo.SignSearchVO;
import chn.bhmc.dms.cmm.apr.vo.SignVO;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignSaveExVO;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignSearchVO;
import chn.bhmc.dms.crm.mcm.vo.MarketingCampaignVO;

/**
 * 마케팅 캠페인에 관한 데이터처리 매퍼 클래스
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

@Mapper("marketingCampaignDAO")
public interface MarketingCampaignDAO {

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

    /**
     * 마케팅 캠페인 정보를 등록한다.
     * @param marketingCampaignVO - 등록할 정보가 담긴 MarketingCampaignVO
     * @return 등록된 목록수
     */
    public int insertMarketingCampaign(MarketingCampaignVO marketingCampaignVO) throws Exception;

    /**
     * 마케팅 캠페인 신규등록시 기본목표를 자동으로 등록한다.
     * @param marketingCampaignVO - 등록할 정보가 담긴 MarketingCampaignVO
     * @return 등록된 목록수
     */
    public int insertDefaultGoal(MarketingCampaignVO marketingCampaignVO) throws Exception;

    /**
     * 마케팅 캠페인 수정시 이전 유형과 다르면 기본목표를 삭제한다.
     * @param marketingCampaignVO - 등록할 정보가 담긴 MarketingCampaignVO
     * @return 삭제된 목록수
     */
    public int deleteDefaultGoal(MarketingCampaignVO marketingCampaignVO);

    /**
     * 마케팅 캠페인 정보를 수정한다.(기본정보 탭)
     * @param marketingCampaignVO - 수정할 정보가 담긴 MarketingCampaignVO
     * @return 수정된 목록수
     */
    public int updateMarketingCampaign(MarketingCampaignVO marketingCampaignVO) throws Exception;

    /**
     * 마케팅 캠페인 정보를 삭제한다.
     * @param marketingCampaignVO - 삭제할 정보가 담긴 MarketingCampaignVO
     * @return 삭제된 목록수
     */
    public int deleteMarketingCampaign(MarketingCampaignVO marketingCampaignVO) throws Exception;

    /**
     * 마케팅 캠페인 상세조회
     * @param marketingCampaignVO
     */
    public MarketingCampaignVO selectMarketingCampaignByKey(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 유형 Sub 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     */
    public List<MarketingCampaignVO> selectMakTpCdListByCondition(MarketingCampaignSearchVO searchVO);




    /**
     * 조회 조건에 해당하는 마케팅 캠페인(활동방안) 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return
     */
    public int selectActivesByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 마케팅 캠페인(활동방안) 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return 조회 목록
     */
    public List<MarketingCampaignVO> selectActivesByCondition(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 마케팅 캠페인 정보를 수정한다.(활동방안 탭)
     * @param marketingCampaignVO - 수정할 정보가 담긴 MarketingCampaignVO
     * @return 수정된 목록수
     */
    public int updateMarketingCampaignActive(MarketingCampaignVO marketingCampaignVO) throws Exception;

    /**
     * 마케팅 캠페인(활동방안) 정보를 등록한다.
     * @param marketingCampaignVO - 등록할 정보가 담긴 MarketingCampaignVO
     * @return 등록된 목록수
     */
    public int insertActive(MarketingCampaignVO marketingCampaignVO) throws Exception;

    /**
     * 마케팅 캠페인(활동방안) 정보를 수정한다.
     * @param marketingCampaignVO - 수정할 정보가 담긴 MarketingCampaignVO
     * @return 수정된 목록수
     */
    public int updateActive(MarketingCampaignVO marketingCampaignVO) throws Exception;

    /**
     * 마케팅 캠페인(활동방안) 정보를 삭제한다.
     * @param marketingCampaignVO - 삭제할 정보가 담긴 MarketingCampaignVO
     * @return 삭제된 목록수
     */
    public int deleteActive(MarketingCampaignVO marketingCampaignVO) throws Exception;

    /**
     * 마케팅 캠페인 화술방안 목록수를 조회한다.(팝업)
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return
     */
    public int selectTalkPlansByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 마케팅 캠페인 화술방안 목록을 조회한다.(팝업)
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return 조회 목록
     */
    public List<MarketingCampaignVO> selectTalkPlansByCondition(MarketingCampaignSearchVO searchVO) throws Exception;





    /**
     * 조회 조건에 해당하는 마케팅 캠페인(목표) 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return
     */
    public int selectGoalsByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 마케팅 캠페인(목표) 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return 조회 목록
     */
    public List<MarketingCampaignVO> selectGoalsByCondition(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 마케팅 캠페인(목표) 정보를 등록한다.
     * @param marketingCampaignVO - 등록할 정보가 담긴 MarketingCampaignVO
     * @return 등록된 목록수
     */
    public int insertGoal(MarketingCampaignVO marketingCampaignVO) throws Exception;

    /**
     * 마케팅 캠페인(목표) 정보를 수정한다.
     * @param marketingCampaignVO - 수정할 정보가 담긴 MarketingCampaignVO
     * @return 수정된 목록수
     */
    public int updateGoal(MarketingCampaignVO marketingCampaignVO) throws Exception;

    /**
     * 마케팅 캠페인(목표) 정보를 삭제한다.
     * @param marketingCampaignVO - 삭제할 정보가 담긴 MarketingCampaignVO
     * @return 삭제된 목록수
     */
    public int deleteGoal(MarketingCampaignVO marketingCampaignVO) throws Exception;





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
     * 마케팅 캠페인(대상자) 정보를 등록한다.
     * @param MarketingCampaignVO - 마케팅 캠페인
     * @return 등록된 목록수
     */
    public int insertTarget(MarketingCampaignVO activeVO) throws Exception;

    /**
     * 마케팅 캠페인(대상자) 정보를 수정한다.
     * @param MarketingCampaignVO - 마케팅 캠페인
     * @return 수정된 목록수
     */
    public int updateTarget(MarketingCampaignVO activeVO) throws Exception;

    /**
     * 마케팅 캠페인(대상자) 정보를 삭제 한다.
     * @param MarketingCampaignVO - 마케팅 캠페인
     * @return 삭제 수량
     */
    public int deleteTarget(MarketingCampaignVO activeVO) throws Exception;

    /**
     * 마케팅 캠페인(대상자 마스터 - CR_0703T) 정보를 등록한다.(엑셀 업로드를 통한 데이터 저장시에만 사용)
     * @param MarketingCampaignSaveExVO - 마케팅 캠페인
     * @return 등록된 목록수
     */
    public int insertTargetExcelMaster(MarketingCampaignSaveExVO activeVO) throws Exception;

    /**
     * 마케팅 캠페인(대상자 디테일 - CR_0710T) 정보를 등록한다.(엑셀 업로드를 통한 데이터 저장시에만 사용)
     * @param MarketingCampaignVO - 마케팅 캠페인
     * @return 등록된 목록수
     */
    public int insertTargetExcelDetail(MarketingCampaignVO activeVO) throws Exception;

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
     * 마케팅 캠페인(대상자 디테일 - CR_0710T) 정보를 삭제한다.(추출조건차수을 삭제할때 추출조건차수에 대상자가 존재하면 같이 삭제.)
     * @param MarketingCampaignVO - 마케팅 캠페인
     * @return 삭제 수량
     */
    public int deleteTargetDetailEx(MarketingCampaignVO marketingCampaignVO) throws Exception;





    /**
     * 조회 조건에 해당하는 마케팅 캠페인(예산) 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return
     */
    public int selectBudgetsByConditionCnt(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 마케팅 캠페인(예산) 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return 조회 목록
     */
    public List<MarketingCampaignVO> selectBudgetsByCondition(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 마케팅 캠페인(예산) 상세조회
     * @param marketingCampaignVO
     */
    public MarketingCampaignVO selectBudgetByKey(MarketingCampaignVO marketingCampaignVO) throws Exception;

    /**
     * 마케팅 캠페인(예산) 정보를 등록한다.
     * @param marketingCampaignVO - 등록할 정보가 담긴 MarketingCampaignVO
     * @return 등록된 목록수
     */
    public int insertBudget(MarketingCampaignVO marketingCampaignVO) throws Exception;

    /**
     * 마케팅 캠페인(예산) 정보를 수정한다.
     * @param marketingCampaignVO - 수정할 정보가 담긴 MarketingCampaignVO
     * @return 수정된 목록수
     */
    public int updateBudget(MarketingCampaignVO marketingCampaignVO) throws Exception;

    /**
     * 마케팅 캠페인(예산) 정보를 삭제한다.
     * @param marketingCampaignVO - 삭제할 정보가 담긴 MarketingCampaignVO
     * @return 삭제된 목록수
     */
    public int deleteBudget(MarketingCampaignVO marketingCampaignVO) throws Exception;





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
     * @param marketingCampaignVO - 수정할 정보가 담긴 MarketingCampaignVO
     * @return 수정된 목록수
     */
    public int updateApprDocNo(MarketingCampaignVO marketingCampaignVO) throws Exception;

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
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return 조회 목록
     */
    public List<MarketingCampaignVO> selectResultGoalsByCondition(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 마케팅 캠페인(결과-업체평가) 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
     * @return 조회 목록
     */
    public List<MarketingCampaignVO> selectResultCorpsByCondition(MarketingCampaignSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 마케팅 캠페인(결과-캠페인직원평가) 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MarketingCampaignSearchVO
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
    public int insertVinExcelData(MarketingCampaignVO activeVO) throws Exception;

    /**
     * 마케팅 캠페인(VIN정보 - SE_1073T_TMP) 정보를 등록한다.(엑셀 업로드를 통한 데이터 저장시에만 사용)
     * @param MarketingCampaignVO - 마케팅 캠페인
     * @return 등록된 목록수
     */
    public int insertVinTmpExcelData(MarketingCampaignVO activeVO) throws Exception;

    /**
     * 마케팅 캠페인(VIN정보 - SE_1073T_TMP) 정보를 삭제한다.(엑셀 업로드를 통한 데이터 저장시에만 사용)
     * @param MarketingCampaignVO - 마케팅 캠페인
     * @return
     */
    public int deleteVinTmpExcelData(MarketingCampaignVO activeVO) throws Exception;


    /**
     * 마케팅 캠페인(LTS MODEL 정보 - SE_1074T) 정보를 등록한다.(엑셀 업로드를 통한 데이터 저장시에만 사용)
     * @param MarketingCampaignVO - 마케팅 캠페인
     * @return 등록된 목록수
     */
    public int insertLtsModelExcelData(MarketingCampaignVO activeVO) throws Exception;


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
    public List<MarketingCampaignVO> selectLbrCdListByCondition(MarketingCampaignSearchVO searchVO);

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


}