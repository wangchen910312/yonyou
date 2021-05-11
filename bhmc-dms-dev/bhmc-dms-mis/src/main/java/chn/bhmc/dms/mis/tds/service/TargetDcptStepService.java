package chn.bhmc.dms.mis.tds.service;

import java.util.List;
import java.util.Map;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.mis.tds.vo.TargetDcptStepSearchVO;
import chn.bhmc.dms.mis.tds.vo.TargetDcptStepVO;

/**
 * <pre>
 * 목표 분해 공구
 * </pre>
 *
 * @ClassName   : TargetDcptStepService.java
 * @Description : 목표 분해 공구
 * @author chibeom.song
 * @since 2016. 9. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 20.   chibeom.song     최초 생성
 * </pre>
 */

public interface TargetDcptStepService {

    /**
     * 조회 조건에 해당하는 목표 차종 설정 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    public int selectTargetDcptCarlineGridCnt(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 목표 차종 설정 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepVO> selectTargetDcptCarlineGrid(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 목표 차종 설정 데이터가 없을 경우 차종 마스터 차종 목록을 저장한다.
     * @param targetDcptMgmtSearchVO - 등록할 정보가 담긴 TargetDcptMgmtSearchVO
     * @return 등록된 목록수
     */
    public int insertTargetDcptCarlineGridSave(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 차종 설정 데이터 저장 분기한다.
     * @param  분기할 정보가 담긴 TargetDcptStepVO
     * @return 분기된 목록수
     */
    public void multiTargetDcptCarlineGrid(BaseSaveVO<TargetDcptStepVO> TargetDcptStepSaveVO) throws Exception;

    /**
     * Key에 해당하는 목표 차종 설정 데이터 정보를 조회한다.
     * @param
     * @return
     */
    public TargetDcptStepVO selectTargetDcptCarlineGridByKey(String goalYy, String goalMm, String carLineCd, String dlrCd) throws Exception;

    /**
     * 목표 차종 설정 데이터 정보를 등록한다.
     * @param targetDcptStepVO - 등록할 정보가 담긴 TargetDcptStepVO
     * @return 등록된 목록수
     */
    public int insertTargetDcptCarlineGrid(TargetDcptStepVO targetDcptStepVO) throws Exception;

    /**
     * 목표 차종 설정 데이터 정보를 수정한다.
     * @param targetDcptStepVO - 수정할 정보가 담긴 TargetDcptStepVO
     * @return 수정된 목록수
     */
    public int updateTargetDcptCarlineGrid(TargetDcptStepVO targetDcptStepVO) throws Exception;

    /**
     * 목표 차종 설정 데이터 정보를 삭제한다.
     * @param targetDcptStepVO - 삭제할 정보가 담긴 TargetDcptStepVO
     * @return 삭제된 목록수
     */
    public int deleteTargetDcptCarlineGrid(TargetDcptStepVO targetDcptStepVO) throws Exception;

    /**
     * 목표 분해 공구 - 시장현황 자료를 조회한다.
     *
     * @param TargetDcptStepSearchVO
     * @return
     * @throws Exception
     */
    public List<TargetDcptStepSearchVO> selectTargetDcptMarketStatusGrid(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러현황 자료(기초값)를 조회한다.
     *
     * @param TargetDcptStepSearchVO
     * @return
     * @throws Exception
     */
    public List<TargetDcptStepSearchVO> selectTargetDcptDealerStatusBasicGrid(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러현황 자료(채널)를 조회한다.
     *
     * @param TargetDcptStepSearchVO
     * @return
     * @throws Exception
     */
    public List<TargetDcptStepSearchVO> selectTargetDcptDealerStatusChannelGrid(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 제조사 당월 총목표를 조회한다.
     *
     * @param TargetDcptStepSearchVO
     * @return
     * @throws Exception
     */
    public List<TargetDcptStepSearchVO> selectTargetDcptManuTargetAllGrid(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 제조사 당월 차종별 목표 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    public int selectTargetDcptManuTargetChannelGridCnt(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 제조사 당월 차종별 목표를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    @SuppressWarnings("rawtypes")
    public Map<String, List> selectTargetDcptManuTargetChannelGrid(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러분해(차형) 총 목표 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepSearchVO> selectTargetDcptStepTotalResult(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러분해(차형) 총 목표 자료가 없을 경우 등록한다.
     * @param TargetDcptStepSearchVO - 등록할 정보가 담긴 TargetDcptStepSearchVO
     * @return 등록된 목록수
     */
    public int insertTargetDcptStepTotalResult(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(당월 총 목표) 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepSearchVO> selectTargetDcptDealerTargetAllGrid(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(당월 총 목표) 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    public int selectTargetDcptDealerSaleTargetAllGridCnt(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(당월 총 목표) 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    public int selectTargetDcptDealerTargetChannelGridCnt(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(당월 총 목표) 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    @SuppressWarnings("rawtypes")
    public Map<String, List> selectTargetDcptDealerTargetChannelGrid(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(당월 총 목표) 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepSearchVO> selectTargetDcptDealerSaleTargetAllGrid(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 목표 분해 공구, 딜러분해(차형) 총목표 저장 분기한다.
     * @param  분기할 정보가 담긴 TargetDcptStepVO
     * @return 분기된 목록수
     */
    public void multiDealerTargetGridSave(BaseSaveVO<TargetDcptStepSearchVO> targetDcptStepSearchVO) throws Exception;
    public TargetDcptStepSearchVO selectDealerTargetGridSaveByKey(String sMonitorDate, String sDlrCd) throws Exception;
    public int insertDealerTargetGridSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;
    public int updateDealerTargetIdccDealerGoalPrefValSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;
    public int updateDealerTargetShopDealerGoalPrefValSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;
    public int updateDealerTargetOrgDealerGoalPrefValSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;
    public int updateDealerTargetEtcDealerGoalPrefValSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;
    public int deleteDealerTargetGridSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;

    /**
     * 목표 분해 공구 - 목표 분해 공구, 개별목표 저장 분기한다.
     * @param saveVO
     * @throws Exception
     */
    public int multiDealerChannelGridSave(Map<?,?> saveVO) throws Exception;

    /**
     * 목표 분해 공구 - 목표 분해 공구, 딜러분해(차형) 채널별 목표 저장 분기한다.
     * @param  분기할 정보가 담긴 TargetDcptStepVO
     * @return 분기된 목록수
     */
    //public void multiDealerChannelGridSave(BaseSaveVO<TargetDcptStepVO> TargetDcptStepToSaveVO) throws Exception;

    /**
     * 목표 분해 공구 - 목표 분해 공구, 집객 총 목표 저장 분기한다.
     * @param  분기할 정보가 담긴 TargetDcptStepVO
     * @return 분기된 목록수
     */
    public void multiDealerCustGridSave(BaseSaveVO<TargetDcptStepSearchVO> targetDcptStepSearchVO) throws Exception;
    public TargetDcptStepSearchVO selectDealerCustGridSaveByKey(String sMonitorDate) throws Exception;
    public int insertDealerCustGridSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;
    public int updateIdccCustDealerSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;
    public int updateShopCustDealerSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;
    public int deleteDealerCustGridSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;

    /**
     * 목표 분해 공구 - 목표 분해 공구, 과정목표 저장 분기한다.
     * @param  분기할 정보가 담긴 TargetDcptStepVO
     * @return 분기된 목록수
     */
    public void multiDealerProcessTargetSave(BaseSaveVO<TargetDcptStepSearchVO> targetDcptStepSearchVO) throws Exception;
    public TargetDcptStepSearchVO selectDealerProcessTargetByKey(String sMonitorDate) throws Exception;
    public int insertDealerProcessTargetSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;
    public int updateDealerProcessTargetSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;
    public int deleteDealerProcessTargetSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;

    /**
     * 목표 분해 공구 - 목표 분해 공구, 파생예측 저장 분기한다.
     * @param  분기할 정보가 담긴 TargetDcptStepVO
     * @return 분기된 목록수
     */
    public void multiProcessDerivationGridSave(BaseSaveVO<TargetDcptStepSearchVO> targetDcptStepSearchVO) throws Exception;
    public TargetDcptStepSearchVO selectProcessDerivationGridByKey(String sMonitorDate) throws Exception;
    public int insertProcessDerivationGridSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;
    public int updateProcessDerivationGridSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;
    public int deleteProcessDerivationGridSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;


    /**
     * 목표 분해 공구 - 딜러사 설정 차종 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepSearchVO> selectDealerCarlineCdList(TargetDcptStepSearchVO TargetDcptStepSearchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러분해(당월 차형별 분해 목표, 진도, 차이) 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    public int selectTargetDealerSaleDcptStatusGridCnt(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러분해(당월 차형별 분해 목표, 진도, 차이) 목표 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    @SuppressWarnings("rawtypes")
    public Map<String, List> selectTargetDealerSaleDcptStatusGrid(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러분해(판매고문) 목표 자료 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    public int selectTargetDcptDealerSaleManSearchGridCnt(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러분해(판매고문) 목표 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    @SuppressWarnings("rawtypes")
    public Map<String, List> selectTargetDcptDealerSaleManSearchGrid(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(차형별 목표) 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepSearchVO> selectTargetDcptMgmtDealerSaleDcptCarResult(TargetDcptStepSearchVO TargetDcptStepSearchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(차형별 목표) 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepSearchVO> selectTargetDcptMgmtDealerSaleDcptShopResult(TargetDcptStepSearchVO TargetDcptStepSearchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(차형별 목표) 자료를 등록한다.
     * @param TargetDcptStepSearchVO - 등록할 정보가 담긴 TargetDcptStepSearchVO
     * @return 등록된 목록수
     */
    public int insertTargetDcptMgmtDealerSaleDcptCarResult(TargetDcptStepSearchVO TargetDcptStepSearchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(차형별 목표) 자료를 등록한다.
     * @param saveVO
     * @throws Exception
     */
    public int multiTargetDcptDealerSaleManSearchGrid(Map<?,?> saveVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(집객 목표) 자료 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    public int selectTargetDealerDcptCustFirstGridCnt(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(집객 목표) 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    @SuppressWarnings("rawtypes")
    public Map<String, List> selectTargetDealerDcptCustFirstGrid(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러분해(집객목표현황) 집객목표설정 집객 현황 자료 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    public int selectTargetDealerDcptCustSecondGridCnt(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러분해(집객목표현황) 집객목표설정 집객 현황 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    @SuppressWarnings("rawtypes")
    public Map<String, List> selectTargetDealerDcptCustSecondGrid(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러분해(집객목표현황) 저장된 집객목표설정 집객 현황 자료 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    public int selectTargetDealerDcptCustThirdGridCnt(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러분해(집객목표현황) 저장된 집객목표설정 집객 현황 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    @SuppressWarnings("rawtypes")
    public Map<String, List> selectTargetDealerDcptCustThirdGrid(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러분해(집객목표현황) 저장된 집객목표설정 집객 현황 자료를 저장한다.
     * @param saveVO
     * @throws Exception
     */
    public int multiTargetDealerDcptCustThirdGrid(Map<?,?> saveVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(집객 목표) 자료를 조회한다.
     * @param TargetDcptStepSearchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepSearchVO> selectTargetDcptMgmtDealerDcptCustResult(TargetDcptStepSearchVO TargetDcptStepSearchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(집객 목표) 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepSearchVO> selectTargetDcptMgmtDealerDcptCustGrid(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(집객 목표) 자료를 등록한다.
     * @param TargetDcptStepSearchVO - 등록할 정보가 담긴 TargetDcptStepSearchVO
     * @return 등록된 목록수
     */
    public int insertTargetDcptMgmtDealerDcptCustResult(TargetDcptStepSearchVO TargetDcptStepSearchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(파생이익) 자료를 조회한다.
     * @param TargetDcptStepSearchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepSearchVO> selectTargetDcptStepProcessDerivationTarget(TargetDcptStepSearchVO TargetDcptStepSearchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(파생이익) 자료를 조회한다.
     * @param TargetDcptStepSearchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepSearchVO> selectTargetDcptStepProcessDerivationGrid(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(파생이익) 자료를 등록한다.
     * @param TargetDcptStepSearchVO - 등록할 정보가 담긴 TargetDcptStepSearchVO
     * @return 등록된 목록수
     */
    public int insertTargetDcptStepProcessDerivationTarget(TargetDcptStepSearchVO TargetDcptStepSearchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(판매고문별) 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepSearchVO> selectTargetDcptMgmtDealerSaleDcptAllStatus(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(판매고문별) 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepSearchVO> selectTargetDcptMgmtDealerSaleDcptProStatus(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러분해(판매고문) 목표 자료 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    public int selectTargetDcptDealerSaleManGridCnt(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러분해(판매고문) 목표 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepSearchVO> selectTargetDcptDealerSaleManGrid(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러분해(판매고문) 목표 자료를 저장 한다.
     *
     * @param list
     * @param object
     * @throws Exception
     */
    public void insertSalesmanTargetDcptRegUploadSave(List<TargetDcptStepVO> list, TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;

    /**
     * 목표분해도 - 딜러분해(판매고문) 정보를 조회한다.
     * @param
     * @return
     */
    public TargetDcptStepVO selectSalesmanTargetDcptRegByKey(String sMonitorSaleDate, String empNo, String carlineCd) throws Exception;

    /**
     * 목표분해도 - 딜러분해(판매고문) 엑셀 업로드 저장 한다.
     * @param targetDcptStepVO - 등록할 정보가 담긴 TargetDcptStepVO
     * @return 등록된 목록수
     */
    public int insertSalesmanTargetDcptReg(TargetDcptStepVO targetDcptStepVO) throws Exception;

    /**
     * 목표분해도 - 딜러분해(판매고문) 엑셀 업로드 저장 한다.
     * @param targetDcptStepVO - 수정할 정보가 담긴 TargetDcptStepVO
     * @return 수정된 목록수
     */
    public int updateSalesmanTargetDcptReg(TargetDcptStepVO targetDcptStepVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러분해(집객목표현황) 잠재고객수 , 최근3개월 현황 자료를 조회한다.
     *
     * @param TargetDcptStepSearchVO
     * @return
     * @throws Exception
     */
    public List<TargetDcptStepSearchVO> selectTargetDealerDcptCustGrid(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러분해(집객목표현황) 집객목표설정 집객 현황 자료를 조회한다.
     *
     * @param TargetDcptStepSearchVO
     * @return
     * @throws Exception
     */
    public List<TargetDcptStepSearchVO> selectTargetDealerDcptCustConfig(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러분해(집객목표현황) 저장된 집객목표설정 집객 현황 자료를 조회한다.
     *
     * @param TargetDcptStepSearchVO
     * @return
     * @throws Exception
     */
    public List<TargetDcptStepSearchVO> selectTargetDealerDcptCustConfigVal(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(차형별 이익설정) 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    public int selectCarlineProfitGridCnt(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(차형별 이익설정) 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepSearchVO> selectCarlineProfitGrid(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(차형별 이익설정) 정보가 없을 경우 신규 등록한다.
     * @param searchVO - 등록할 정보가 담긴 TargetDcptStepSearchVO
     * @return 등록된 목록수
     */
    public int insertCarlineProfitGrid(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(차형별 이익설정) Key에 해당하는 파생업무이익지표분해 정보를 조회한다.
     * @param
     * @return
     */
    public TargetDcptStepSearchVO selectCarlineProfitGridByKey(String sMonitorProfitDate) throws Exception;

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(이익목표) 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    public int selectProfitTargetGridCnt(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(이익목표) 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepSearchVO> selectProfitTargetGrid(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(이익목표) Key에 해당하는 파생업무이익지표분해 정보를 조회한다.
     * @param
     * @return
     */
    public TargetDcptStepSearchVO selectProfitTargetGridByKey(String sMonitorProfitDate) throws Exception;

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(이익목표) 정보가 없을 경우 신규 등록한다.
     * @param targetDcptStepSearchVO - 등록할 정보가 담긴 TargetDcptStepSearchVO
     * @return 등록된 목록수
     */
    public int insertProfitTargetGrid(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(차형별 이익설정)를 저장한다.
     * @param TargetYearRegSaveVO
     */
    public void multiCarlineProfitGridSave(BaseSaveVO<TargetDcptStepSearchVO> targetDcptStepSearchVO) throws Exception;

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(차형별 이익설정)를 저장 전 조회한다.
     * @param
     * @return
     */
    public TargetDcptStepSearchVO selectCarlineProfitGridSaveByKey(String goalProfitYy, String goalProfitMm, String carlineProfitCd) throws Exception;

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(차형별 이익설정)를 저장한다.
     * @param targetDcptStepVO - 등록할 정보가 담긴 TargetDcptStepVO
     * @return 등록된 목록수
     */
    public int insertCarlineProfitGridSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(차형별 이익설정)를 수정한다.
     * @param targetDcptStepVO - 수정할 정보가 담긴 TargetDcptStepVO
     * @return 수정된 목록수
     */
    public int updateCarlineProfitGridSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(차형별 이익설정)를 삭제한다.
     * @param targetDcptStepVO - 삭제할 정보가 담긴 TargetDcptStepVO
     * @return 삭제된 목록수
     */
    public int deleteCarlineProfitGridSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(이익목표)를 저장한다.
     * @param TargetDcptStepVO
     */
    public void multiProfitTargetGridSave(BaseSaveVO<TargetDcptStepSearchVO> targetDcptStepSearchVO) throws Exception;

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(이익목표)를 저장 전 조회한다.
     * @param
     * @return
     */
    public TargetDcptStepSearchVO selectProfitTargetGridSaveByKey(String goalTargetYy, String goalTargetMm, String carlineTargetCd) throws Exception;

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(이익목표)를 저장한다.
     * @param targetDcptStepVO - 등록할 정보가 담긴 TargetDcptStepVO
     * @return 등록된 목록수
     */
    public int insertProfitTargetGridSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(이익목표)를 수정한다.
     * @param targetDcptStepVO - 수정할 정보가 담긴 TargetDcptStepVO
     * @return 수정된 목록수
     */
    public int updateProfitTargetGridSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(이익목표)를 삭제한다.
     * @param targetDcptStepVO - 삭제할 정보가 담긴 TargetDcptStepVO
     * @return 삭제된 목록수
     */
    public int deleteProfitTargetGridSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;


}
