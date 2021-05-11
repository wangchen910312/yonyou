package chn.bhmc.dms.mis.tds.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.mis.tds.vo.TargetDcptStepCuSaveVO;
import chn.bhmc.dms.mis.tds.vo.TargetDcptStepSaSaveVO;
import chn.bhmc.dms.mis.tds.vo.TargetDcptStepSearchVO;
import chn.bhmc.dms.mis.tds.vo.TargetDcptStepToSaveVO;
import chn.bhmc.dms.mis.tds.vo.TargetDcptStepVO;

/**
 * <pre>
 * 목표 분해 공구
 * </pre>
 *
 * @ClassName   : TargetDcptStepDAO.java
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
@Mapper("targetDcptStepDAO")
public interface TargetDcptStepDAO {

    /**
     * 조회 조건에 해당하는 목표 차종 설정 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    public int selectTargetDcptCarlineGridCnt(TargetDcptStepSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 목표 차종 설정 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepVO> selectTargetDcptCarlineGrid(TargetDcptStepSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 목표 차종 설정 데이터가 없을 경우 차종 마스터 차종 목록을 저장한다.
     * @param searchVO - 등록할 정보가 담긴 TargetDcptStepSearchVO
     * @return 등록된 목록수
     */
    public int insertTargetDcptCarlineGridSave(TargetDcptStepSearchVO searchVO);

    /**
     * Key에 해당하는 목표 차종 설정 데이터 정보를 조회한다.
     * @param
     * @return
     */
    public TargetDcptStepVO selectTargetDcptCarlineGridByKey(@Param("goalYy") String goalYy, @Param("goalMm") String goalMm, @Param("carlineCd") String carlineCd, @Param("dlrCd") String dlrCd);

    /**
     * 목표 차종 설정 데이터를 등록한다.
     * @param targetDcptStepVO - 등록할 정보가 담긴 TargetDcptStepVO
     * @return 등록된 목록수
     */
    public int insertTargetDcptCarlineGrid(TargetDcptStepVO targetDcptStepVO) throws Exception;

    /**
     * 목표 차종 설정 데이터를 수정한다.
     * @param targetDcptStepVO - 수정할 정보가 담긴 TargetDcptStepVO
     * @return 수정된 목록수
     */
    public int updateTargetDcptCarlineGrid(TargetDcptStepVO targetDcptStepVO) throws Exception;

    /**
     * 목표 차종 설정 데이터를 삭제한다.
     * @param targetDcptStepVO - 삭제할 정보가 담긴 TargetDcptStepVO
     * @return 삭제된 목록수
     */
    public int deleteTargetDcptCarlineGrid(TargetDcptStepVO targetDcptStepVO) throws Exception;

    /**
     * 목표 분해 공구 - 시장현황 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepSearchVO> selectTargetDcptMarketStatusGrid(TargetDcptStepSearchVO searchVO);

    /**
     * 목표 분해 공구 - 딜러현황 자료(기초값)를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepSearchVO> selectTargetDcptDealerStatusBasicGrid(TargetDcptStepSearchVO searchVO);

    /**
     * 목표 분해 공구 - 딜러현황 자료(채널)를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepSearchVO> selectTargetDcptDealerStatusChannelGrid(TargetDcptStepSearchVO searchVO);

    /**
     * 목표 분해 공구 - 제조사 당월 총목표를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    public List<TargetDcptStepSearchVO> selectTargetDcptManuTargetAllGrid(TargetDcptStepSearchVO searchVO);

    /**
     * 목표 분해 공구 - 조회 조건에 해당하는 제조사 목표 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    public int selectTargetDcptManuTargetChannelGridCnt(TargetDcptStepSearchVO searchVO);

    /**
     * 목표 분해 공구 - 조회 조건에 해당하는 제조사 당월 차종별 목표를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepSearchVO> selectTargetDcptManuTargetChannelGridHeader(TargetDcptStepSearchVO searchVO) throws Exception;
    public List<TargetDcptStepSearchVO> selectTargetDcptManuTargetChannelGrid(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 조회 조건에 해당하는 딜러사 목표 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    public int selectTargetDcptDealerTargetChannelGridCnt(TargetDcptStepSearchVO searchVO);

    /**
     * 목표 분해 공구 - 조회 조건에 해당하는 딜러사 당월 차종별 목표를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepSearchVO> selectTargetDcptDealerTargetChannelGridHeader(TargetDcptStepSearchVO searchVO) throws Exception;
    public List<TargetDcptStepSearchVO> selectTargetDcptDealerTargetChannelGrid(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러분해(차형) 총 목표 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepSearchVO> selectTargetDcptStepTotalResult(TargetDcptStepSearchVO searchVO);

    /**
     * 목표 분해 공구 - 딜러분해(차형) 총 목표 자료를 등록한다.
     * @param targetDcptStepSearchVO - 등록할 정보가 담긴 TargetDcptStepSearchVO
     * @return 등록된 목록수
     */
    public int insertTargetDcptStepTotalResult(TargetDcptStepSearchVO targetDcptStepSearchVO);

    /**
     * 목표 분해 공구 - 딜러사목표(당월 총 목표) 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepSearchVO> selectTargetDcptDealerTargetAllGrid(TargetDcptStepSearchVO searchVO);

    /**
     * 목표 분해 공구 - 조회 조건에 해당하는 딜러사목표(당월 총 목표) 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    public int selectTargetDcptDealerSaleTargetAllGridCnt(TargetDcptStepSearchVO searchVO);

    /**
     * 목표 분해 공구 - 딜러사목표(당월 총 목표) 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepSearchVO> selectTargetDcptDealerSaleTargetAllGrid(TargetDcptStepSearchVO searchVO);

    /**
     * 목표 분해 공구 - 딜러사 설정 차종 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepSearchVO> selectDealerCarlineCdList(TargetDcptStepSearchVO targetDcptStepSearchVO);

    /**
     * 목표 분해 공구 - 딜러분해(당월 차형별 분해 목표, 진도, 차이) 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    public int selectTargetDealerSaleDcptStatusGridCnt(TargetDcptStepSearchVO searchVO);

    /**
     * 목표 분해 공구 - 조회 조건에 해당하는 딜러사 당월 차종별 목표를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepSearchVO> selectTargetDcptDealerSaleManSearchGridHeader(TargetDcptStepSearchVO searchVO) throws Exception;
    public List<TargetDcptStepSearchVO> selectTargetDcptDealerSaleManSearchGrid(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러분해(판매고문) 목표 자료 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    public int selectTargetDcptDealerSaleManSearchGridCnt(TargetDcptStepSearchVO searchVO);

    /**
     * 목표 분해 공구 - 딜러분해(판매고문) 목표 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepSearchVO> selectTargetDealerSaleDcptStatusGridHeader(TargetDcptStepSearchVO searchVO) throws Exception;
    public List<TargetDcptStepSearchVO> selectTargetDealerSaleDcptStatusGrid(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(차형별 목표) 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepSearchVO> selectTargetDcptMgmtDealerSaleDcptCarResult(TargetDcptStepSearchVO targetDcptStepSearchVO);

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(차형별 목표) 자료를 조회한다.
     * @param targetDcptStepSearchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepSearchVO> selectTargetDcptMgmtDealerSaleDcptShopResult(TargetDcptStepSearchVO targetDcptStepSearchVO);

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(차형별 목표) 자료를 등록한다.
     * @param targetDcptStepSearchVO - 등록할 정보가 담긴 TargetDcptStepSearchVO
     * @return 등록된 목록수
     */
    public int insertTargetDcptMgmtDealerSaleDcptCarResult(TargetDcptStepSearchVO targetDcptStepSearchVO);

    /**
     * 목표 분해 공구 - 목표 분해 공구, 딜러분해(차형) 총목표를 등록/수정/삭제한다.
     * @param targetDcptStepSearchVO - 등록할 정보가 담긴 TargetDcptStepSearchVO
     * @return 등록된 목록수
     */
    public TargetDcptStepSearchVO selectDealerTargetGridSaveByKey(@Param("sMonitorDate") String sMonitorDate, @Param("sDlrCd") String sDlrCd);
    public int insertDealerTargetGridSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;
    public int updateDealerTargetIdccDealerGoalPrefValSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;
    public int updateDealerTargetShopDealerGoalPrefValSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;
    public int updateDealerTargetOrgDealerGoalPrefValSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;
    public int updateDealerTargetEtcDealerGoalPrefValSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;
    public int deleteDealerTargetGridSave(TargetDcptStepSearchVO targetDcptStepSearchVO);

    /**
     *목표 분해 공구 - 목표 분해 공구, 딜러분해(차형) 목표를 저장한다.
     */
    public int updateDealerChannelGridSave(TargetDcptStepToSaveVO saveVO) throws Exception;

    /**
     * 목표 분해 공구 - 목표 분해 공구, 집객 총 목표 저장 분기한다.
     * @param targetDcptStepSearchVO - 등록할 정보가 담긴 TargetDcptStepSearchVO
     * @return 등록된 목록수
     */
    public TargetDcptStepSearchVO selectDealerCustGridSaveByKey(@Param("sMonitorDate") String sMonitorDate);
    public int insertDealerCustGridSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;
    public int updateIdccCustDealerSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;
    public int updateShopCustDealerSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;
    public int deleteDealerCustGridSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;

    /**
     * 목표 분해 공구 - 목표 분해 공구, 과정목표 저장 분기한다.
     * @param targetDcptStepSearchVO - 등록할 정보가 담긴 TargetDcptStepSearchVO
     * @return 등록된 목록수
     */
    public TargetDcptStepSearchVO selectDealerProcessTargetByKey(@Param("sMonitorDate") String sMonitorDate);
    public int insertDealerProcessTargetSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;
    public int updateDealerProcessTargetSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;
    public int deleteDealerProcessTargetSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;

    /**
     * 목표 분해 공구 - 목표 분해 공구, 파생예측 저장 분기한다.
     * @param targetDcptStepSearchVO - 등록할 정보가 담긴 TargetDcptStepSearchVO
     * @return 등록된 목록수
     */
    public TargetDcptStepSearchVO selectProcessDerivationGridByKey(@Param("sMonitorDate") String sMonitorDate);
    public int insertProcessDerivationGridSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;
    public int updateProcessDerivationGridSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;
    public int deleteProcessDerivationGridSave(TargetDcptStepSearchVO targetDcptStepSearchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(판매고문별) 자료를 조회한다.
     * @param targetDcptStepSearchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepSearchVO> selectTargetDcptMgmtDealerSaleDcptAllStatus(TargetDcptStepSearchVO targetDcptStepSearchVO);

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(판매고문별) 자료를 조회한다.
     * @param targetDcptStepSearchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepSearchVO> selectTargetDcptMgmtDealerSaleDcptProStatus(TargetDcptStepSearchVO targetDcptStepSearchVO);

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(판매고문별) 자료를 삭제한다.
     * @param saveVO
     * @throws Exception
     */
    public int deleteTargetDcptDealerSaleManSearchGrid(TargetDcptStepSaSaveVO saveVO) throws Exception;

    /**
     *목표 분해 공구 - 딜러사 당월 목표(판매고문별) 자료를 수정한다.
     */
    public int updateTargetDcptDealerSaleManSearchGrid(TargetDcptStepSaSaveVO saveVO) throws Exception;

    /**
     *목표 분해 공구 - 딜러사 당월 목표(판매고문별) 자료를 저장한다.
     */
    public int insertTargetDcptDealerSaleManSearchGrid(TargetDcptStepSaSaveVO saveVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(집객 목표) 자료를 조회한다.
     * @param targetDcptStepSearchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepSearchVO> selectTargetDcptMgmtDealerDcptCustResult(TargetDcptStepSearchVO targetDcptStepSearchVO);

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(집객 목표) 자료를 조회한다.
     * @param targetDcptStepSearchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepSearchVO> selectTargetDcptMgmtDealerDcptCustGrid(TargetDcptStepSearchVO targetDcptStepSearchVO);

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(집객 목표) 자료 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    public int selectTargetDealerDcptCustFirstGridCnt(TargetDcptStepSearchVO searchVO);

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(집객 목표) 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepSearchVO> selectTargetDealerDcptCustFirstGridHeader(TargetDcptStepSearchVO searchVO) throws Exception;
    public List<TargetDcptStepSearchVO> selectTargetDealerDcptCustFirstGrid(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러분해(집객목표현황) 집객목표설정 집객 현황 자료 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    public int selectTargetDealerDcptCustSecondGridCnt(TargetDcptStepSearchVO searchVO);

    /**
     * 목표 분해 공구 - 딜러분해(집객목표현황) 집객목표설정 집객 현황 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepSearchVO> selectTargetDealerDcptCustSecondGridHeader(TargetDcptStepSearchVO searchVO) throws Exception;
    public List<TargetDcptStepSearchVO> selectTargetDealerDcptCustSecondGrid(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러분해(집객목표현황) 집객목표설정 집객 현황 자료 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    public int selectTargetDealerDcptCustThirdGridCnt(TargetDcptStepSearchVO searchVO);

    /**
     * 목표 분해 공구 - 딜러분해(집객목표현황) 집객목표설정 집객 현황 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepSearchVO> selectTargetDealerDcptCustThirdGridHeader(TargetDcptStepSearchVO searchVO) throws Exception;
    public List<TargetDcptStepSearchVO> selectTargetDealerDcptCustThirdGrid(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러분해(집객목표현황) 집객목표설정 집객 현황 자료를 삭제한다.
     * @param saveVO
     * @throws Exception
     */
    public int deleteTargetDealerDcptCustThirdGrid(TargetDcptStepCuSaveVO saveVO) throws Exception;

    /**
     *목표 분해 공구 - 딜러분해(집객목표현황) 집객목표설정 집객 현황 자료를 수정한다.
     */
    public int updateTargetDealerDcptCustThirdGrid(TargetDcptStepCuSaveVO saveVO) throws Exception;

    /**
     *목표 분해 공구 - 딜러분해(집객목표현황) 집객목표설정 집객 현황 자료를 저장한다.
     */
    public int insertTargetDealerDcptCustThirdGrid(TargetDcptStepCuSaveVO saveVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(집객 목표) 자료를 등록한다.
     * @param targetDcptStepSearchVO - 등록할 정보가 담긴 TargetDcptStepSearchVO
     * @return 등록된 목록수
     */
    public int insertTargetDcptMgmtDealerDcptCustResult(TargetDcptStepSearchVO targetDcptStepSearchVO);

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(파생이익) 자료를 조회한다.
     * @param targetDcptStepSearchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepSearchVO> selectTargetDcptStepProcessDerivationGrid(TargetDcptStepSearchVO searchVO);

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(파생이익) 자료를 조회한다.
     * @param targetDcptStepSearchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepSearchVO> selectTargetDcptStepProcessDerivationTarget(TargetDcptStepSearchVO targetDcptStepSearchVO);

    /**
     * 목표 분해 공구 - 딜러사 당월 목표(파생이익) 자료를 등록한다.
     * @param targetDcptStepSearchVO - 등록할 정보가 담긴 TargetDcptStepSearchVO
     * @return 등록된 목록수
     */
    public int insertTargetDcptStepProcessDerivationTarget(TargetDcptStepSearchVO targetDcptStepSearchVO);

    /**
     * 목표 분해 공구 - 딜러분해(판매고문) 목표 자료 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    public int selectTargetDcptDealerSaleManGridCnt(TargetDcptStepSearchVO searchVO);

    /**
     * 목표 분해 공구 - 딜러분해(판매고문) 목표 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepSearchVO> selectTargetDcptDealerSaleManGrid(TargetDcptStepSearchVO searchVO);

    /**
     * Key에 해당하는 딜러분해 판매고문별 목표자료 조회한다.
     * @param
     * @return
     */
    public TargetDcptStepVO selectSalesmanTargetDcptRegByKey(@Param("sMonitorSaleDate") String sMonitorSaleDate, @Param("empNo") String empNo, @Param("carlineCd") String carlineCd);

    /**
     *  딜러분해 판매고문별 목표자료를 등록한다.
     * @param targetDcptStepVO - 등록할 정보가 담긴 TargetDcptStepVO
     * @return 등록된 목록수
     */
    public int insertSalesmanTargetDcptReg(TargetDcptStepVO targetDcptStepVO) throws Exception;

    /**
     *  딜러분해 판매고문별 목표자료를 수정한다.
     * @param targetDcptStepVO - 수정할 정보가 담긴 TargetDcptStepVO
     * @return 수정된 목록수
     */
    public int updateSalesmanTargetDcptReg(TargetDcptStepVO targetDcptStepVO) throws Exception;

    /**
     * 목표 분해 공구 - 딜러분해(집객목표현황) 잠재고객수 , 최근3개월 현황 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepSearchVO> selectTargetDealerDcptCustGrid(TargetDcptStepSearchVO searchVO);

    /**
     * 목표 분해 공구 - 딜러분해(집객목표현황) 집객목표설정 집객 현황 자료를 조회한다.
     *
     * @param searchVO
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepSearchVO> selectTargetDealerDcptCustConfig(TargetDcptStepSearchVO searchVO);

    /**
     * 목표 분해 공구 - 딜러분해(집객목표현황) 저장된 집객목표설정 집객 현황 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     * @return
     */
    public List<TargetDcptStepSearchVO> selectTargetDealerDcptCustConfigVal(TargetDcptStepSearchVO searchVO);

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(차형별 이익설정) Key에 해당하는 파생업무이익지표분해 정보를 조회한다.
     * @param
     * @return
     */
    public TargetDcptStepSearchVO selectCarlineProfitGridByKey(@Param("sMonitorProfitDate") String sMonitorProfitDate);

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(차형별 이익설정) 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    public int selectCarlineProfitGridCnt(TargetDcptStepSearchVO searchVO);

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(차형별 이익설정) 정보를 조회한다.
     * @param
     * @return
     */
    public List<TargetDcptStepSearchVO> selectCarlineProfitGrid(TargetDcptStepSearchVO searchVO);

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(차형별 이익설정) 정보가 없을 경우 신규 등록한다.
     * @param targetDcptStepSearchVO - 등록할 정보가 담긴 TargetDcptStepSearchVO
     * @return 등록된 목록수
     */
    public int insertCarlineProfitGrid(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(이익목표) 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return
     */
    public int selectProfitTargetGridCnt(TargetDcptStepSearchVO searchVO);

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(이익목표) 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptStepSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptStepSearchVO> selectProfitTargetGrid(TargetDcptStepSearchVO searchVO);

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(이익목표) Key에 해당하는 파생업무이익지표분해 정보를 조회한다.
     * @param
     * @return
     */
    public TargetDcptStepSearchVO selectProfitTargetGridByKey(@Param("sMonitorProfitDate") String sMonitorProfitDate);

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(이익목표) 정보가 없을 경우 신규 등록한다.
     * @param targetDcptStepSearchVO - 등록할 정보가 담긴 TargetDcptStepSearchVO
     * @return 등록된 목록수
     */
    public int insertProfitTargetGrid(TargetDcptStepSearchVO searchVO) throws Exception;

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(차형별 이익설정)를 저장 분기한다.
     * @param
     * @return
     */
    public TargetDcptStepSearchVO selectCarlineProfitGridSaveByKey(@Param("goalProfitYy") String goalProfitYy, @Param("goalProfitMm") String goalProfitMm, @Param("carlineProfitCd") String carlineProfitCd);

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
    public int deleteCarlineProfitGridSave(TargetDcptStepSearchVO targetDcptStepSearchVO);

    /**
     * 목표 분해 공구 - 파생업무이익지표분해(이익목표)를 저장 분기한다.
     * @param
     * @return
     */
    public TargetDcptStepSearchVO selectProfitTargetGridSaveByKey(@Param("goalTargetYy") String goalTargetYy, @Param("goalTargetMm") String goalTargetMm, @Param("carlineTargetCd") String carlineTargetCd);

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
    public int deleteProfitTargetGridSave(TargetDcptStepSearchVO targetDcptStepSearchVO);






}
