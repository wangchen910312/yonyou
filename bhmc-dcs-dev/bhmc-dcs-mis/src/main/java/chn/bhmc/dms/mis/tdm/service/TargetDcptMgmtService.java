package chn.bhmc.dms.mis.tdm.service;

import java.util.List;
import java.util.Map;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.mis.tdm.vo.TargetDcptMgmtSalemanVO;
import chn.bhmc.dms.mis.tdm.vo.TargetDcptMgmtSearchVO;
import chn.bhmc.dms.mis.tdm.vo.TargetDcptMgmtVO;
import chn.bhmc.dms.mis.tmp.vo.TargetMarketStatusVO;

/**
 * <pre>
 * [딜러사] 목표분해도
 * </pre>
 *
 * @ClassName   : TargetDcptMgmtService.java
 * @Description : [딜러사] 목표분해도
 * @author chibeom.song
 * @since 2016. 7. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 21.   chibeom.song     최초 생성
 * </pre>
 */

public interface TargetDcptMgmtService {

    /**
     * 성(우편번호) 목록을 조회한다.
     *
     * @param provinceCd 성(우편번호)
     * @return
     * @throws Exception
     */
    public List<TargetDcptMgmtVO> selectProvinceInfoList(TargetDcptMgmtSearchVO searchVO) throws Exception;

    /**
     * 성(우편번호) 목록을 조회한다.
     *
     * @param provinceCd 성(우편번호)
     * @return
     * @throws Exception
     */
    public List<TargetDcptMgmtVO> selectProvinceInfoList(String provinceCd) throws Exception;

    /**
     * 시(우편번호) 목록을 조회한다.
     *
     * @param provinceCd 성(우편번호)
     * @return
     * @throws Exception
     */
    public List<TargetDcptMgmtVO> selectCityInfoList(TargetDcptMgmtSearchVO searchVO) throws Exception;

    /**
     * 시(우편번호) 목록을 조회한다.
     *
     * @param provinceCd 성(우편번호)
     * @return
     * @throws Exception
     */
    public List<TargetDcptMgmtVO> selectCityInfoList(String provinceCd) throws Exception;

    /**
     * 시(우편번호) 목록을 조회한다.
     *
     * @param searchVO
     * @return
     */
    public List<TargetDcptMgmtSearchVO> selectMarketStatusCityList(TargetDcptMgmtSearchVO searchVO);

    /**
     * 시(우편번호) 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetYearRegSearchVO
     * @return
     */
    public int selectMarketStatusCityCnt(TargetDcptMgmtSearchVO searchVO) throws Exception;

    /**
     * 시장현황자료 엑셀 일괄 데이터 저장 한다.
     *
     * @param list
     * @throws Exception
     */
    public void insertTargetDcptMgmtRegUploadSave(List<TargetMarketStatusVO> list) throws Exception;


    /**
     * MS0107T 테이블 전용으로 같은 서비스를 하나 더 생성함 .
     * 시장현황자료 엑셀 일괄 데이터 저장 한다.
     *
     * @param list
     * @throws Exception
     */
    public void insertTargetDcptMgmtRegUploadSaveI(List<TargetMarketStatusVO> list) throws Exception;


    /**
     * Key에 해당하는 시장현황자료 정보를 조회한다.
     * @param
     * @return
     */
    public TargetDcptMgmtVO selectTargetDcptMgmtRegByKey(String provinceCd, String cityCd, String regYear, String regMonth) throws Exception;

    /** MS0107 T 테이블 전용으로 하나 더 생성
     * Key에 해당하는 시장현황자료 정보를 조회한다.
     * @param
     * @return
     */
    public TargetDcptMgmtVO selectTargetDcptMgmtRegByKeyI(String provinceCd, String cityCd, String regYear, String regMonth) throws Exception;

    /**
     * 시장현황자료 정보를 등록한다.
     * @param targetDcptMgmtVO - 등록할 정보가 담긴 targetDcptMgmtVO
     * @return 등록된 목록수
     */
    public int insertTargetDcptMgmtReg(TargetMarketStatusVO targetDcptMgmtVO) throws Exception;


    /** MS0107 I 테이블 전용
     * 시장현황자료 정보를 등록한다.
     * @param targetDcptMgmtVO - 등록할 정보가 담긴 targetDcptMgmtVO
     * @return 등록된 목록수
     */
    public int insertTargetDcptMgmtRegI(TargetMarketStatusVO targetDcptMgmtVO) throws Exception;

    /**
     * 시장현황자료 정보를 수정한다.
     * @param targetDcptMgmtVO - 수정할 정보가 담긴 targetDcptMgmtVO
     * @return 수정된 목록수
     */
    public int updateTargetDcptMgmtReg(TargetMarketStatusVO targetDcptMgmtVO) throws Exception;


    /**
     * 시장현황자료 정보를 수정한다.
     * @param targetDcptMgmtVO - 수정할 정보가 담긴 targetDcptMgmtVO
     * @return 수정된 목록수
     */
    public int updateTargetDcptMgmtRegI(TargetMarketStatusVO targetDcptMgmtVO) throws Exception;



    /**
     * 시장현황자료 정보를 삭제한다.
     * @param targetDcptMgmtVO - 삭제할 정보가 담긴 targetDcptMgmtVO
     * @return 삭제된 목록수
     */
    public int deleteTargetDcptMgmtReg(TargetDcptMgmtVO targetDcptMgmtVO) throws Exception;

    /**
     * 시장현황자료를 조회한다.
     *
     * @param targetDcptMgmtSearchVO
     * @return
     * @throws Exception
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtByCondition(TargetDcptMgmtSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 시장현황자료 정보 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return
     */
    public int selectTargetDcptMgmtByConditionCnt(TargetDcptMgmtSearchVO searchVO) throws Exception;

    /**
     * 딜러현황자료(기초값)를 조회한다.
     *
     * @param targetDcptMgmtSearchVO
     * @return
     * @throws Exception
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealerStatusBasicGrid(TargetDcptMgmtSearchVO searchVO) throws Exception;


    /**
     * 딜러현황자료(채널별 정보)를 조회한다.
     *
     * @param targetDcptMgmtSearchVO
     * @return
     * @throws Exception
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealerStatusDetailGrid(TargetDcptMgmtSearchVO searchVO) throws Exception;

    /**
     * 제조사 당월 차종별 목표를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtManuTargetGridByCondition(TargetDcptMgmtSearchVO searchVO) throws Exception;

    /**
     * 제조사 당월 차종별 목표 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return
     */
    public int selectTargetDcptMgmtManuTargetGridCnt(TargetDcptMgmtSearchVO searchVO) throws Exception;

    /**
     * 제조사 당월 총목표를 조회한다.
     *
     * @param targetDcptMgmtSearchVO
     * @return
     * @throws Exception
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtManuTargetSearch(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception;

    /**
     * 제조사 당월 총목표를 조회한다.
     *
     * @param targetDcptMgmtSearchVO
     * @return
     * @throws Exception
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtManuTargetAllGrid(TargetDcptMgmtSearchVO searchVO) throws Exception;

    /**
     * 딜러분해 자료  총 갯수를 조회한다.(당월 총목표 그리드)
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return
     */
    public int selectTargetDcptMgmtDealerSaleDcptTotalCnt(TargetDcptMgmtSearchVO searchVO) throws Exception;

    /**
     * 딜러분해 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealerSaleDcptTotalResult(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception;

    /**
     * 딜러분해 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptMgmtVO> selectTargetDcptMgmtDealerSaleDcptTotalBasic(TargetDcptMgmtSearchVO searchVO) throws Exception;

    /**
     * 딜러분해 자료  총 갯수를 조회한다.(차종별 목표 그리드)
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return
     */
    public int selectTargetDcptMgmtDealerSaleDcptCarCnt(TargetDcptMgmtSearchVO searchVO) throws Exception;

    /**
     * 딜러분해 자료  총  목표자료를 등록한다.
     * @param targetDcptMgmtSearchVO - 등록할 정보가 담긴 TargetDcptMgmtSearchVO
     * @return 등록된 목록수
     */
    public int insertTargetDcptMgmtDealerSaleDcptTotalResult(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception;

    /**
     * 딜러분해 차종별 목표자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealerSaleDcptCarResult(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception;

    /**
     * 딜러분해 차종별 목표자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealerSaleDcptShopResult(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception;


    /**
     * 딜러분해 차종별 목표자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptMgmtVO> selectTargetDcptMgmtDealerSaleDcptCarBasic(TargetDcptMgmtSearchVO searchVO) throws Exception;

    /**
     * 딜러분해 차종별 목표자료를 등록한다.
     * @param targetDcptMgmtSearchVO - 등록할 정보가 담긴 TargetDcptMgmtSearchVO
     * @return 등록된 목록수
     */
    public int insertTargetDcptMgmtDealerSaleDcptCarResult(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception;

    /**
     * 딜러분해 자료  총 갯수를 조회한다.(당월 집객 그리드)
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return
     */
    public int selectTargetDcptMgmtDealerDcptCustCnt(TargetDcptMgmtSearchVO searchVO) throws Exception;

    /**
     * 딜러분해 집객 목표자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealerDcptCustResult(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception;

    /**
     * 딜러분해 자료 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("rawtypes")
    public Map<String, List> selectTargetDcptMgmtDealerDcptCarViewByCondition(TargetDcptMgmtSearchVO searchVO) throws Exception; //selectStrOrdOcnBlockingsByCondition
    public int selectTargetDcptMgmtDealerDcptCarViewByConditionCnt(TargetDcptMgmtSearchVO searchVO) throws Exception;//selectStrOrdOcnBlockingsByConditionCnt

    /**
     * 딜러분해 집객 목표자료를 등록한다.
     * @param targetDcptMgmtSearchVO - 등록할 정보가 담긴 TargetDcptMgmtSearchVO
     * @return 등록된 목록수
     */
    public int insertTargetDcptMgmtDealerDcptCustResult(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception;

    /**
     * 목표분해도 - 딜러분해 자료를 등록한다.
     * @param targetDcptMgmtVO - 수정할 정보가 담긴 TargetDcptMgmtVO
     * @return 수정된 목록수
     */
    public void updateTargetDcptMgmtDealerDcptCar(BaseSaveVO<TargetDcptMgmtSearchVO> saveVO) throws Exception;

    /**
     * 목표분해도 - 딜러분해 자료를 등록한다.
     * @param targetDcptMgmtVO - 수정할 정보가 담긴 TargetDcptMgmtVO
     * @return 수정된 목록수
     */
    public void updateTargetDcptMgmtDealerDcptCust(BaseSaveVO<TargetDcptMgmtSearchVO> saveVO) throws Exception;

    /**
     * 딜러분해 집객 목표자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealerDcptSaleManAllData(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception;

    /**
     * 딜러분해 집객 목표자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealerDcptSaleManAllStatus(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception;

    /**
     * 딜러분해 집객 목표자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealerDcptSaleManProStatus(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception;

    /**
     * 목표분해도 - 딜러분해(판매고문) 엑셀 업로드 저장 한다.
     *
     * @param list
     * @param object
     * @throws Exception
     */
    public void insertSalesmanDcptRegUploadSave(List<TargetDcptMgmtSalemanVO> list, TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception;

    /**
     * 목표분해도 - 딜러분해(판매고문) 엑셀 업로드 저장 한다.
     * @param targetDcptMgmtSalemanVO - 등록할 정보가 담긴 TargetDcptMgmtSalemanVO
     * @return 등록된 목록수
     */
    public int insertSalesmanDcptReg(TargetDcptMgmtSalemanVO targetDcptMgmtSalemanVO) throws Exception;

    /**
     * 목표분해도 - 딜러분해(판매고문) 엑셀 업로드 저장 한다.
     * @param targetDcptMgmtSalemanVO - 수정할 정보가 담긴 TargetDcptMgmtSalemanVO
     * @return 수정된 목록수
     */
    public int updateSalesmanDcptReg(TargetDcptMgmtSalemanVO targetDcptMgmtSalemanVO) throws Exception;

    /**
     * 목표분해도 - 딜러분해(판매고문) 정보를 조회한다.
     * @param
     * @return
     */
    public TargetDcptMgmtSalemanVO selectSalesmanDcptRegByKey(String sDealerSaleManDcptYyMm, String empNo, String carlineCd) throws Exception;

    /**
     * 목표분해도 - 딜러분해(판매고문) 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetYearRegSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealerSalemanDcpt(TargetDcptMgmtSearchVO searchVO) throws Exception;

    /**
     * 목표분해도 - 딜러분해(판매고문) 정보 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetYearRegSearchVO
     * @return
     */
    public int selectTargetDcptMgmtDealerSalemanDcptCnt(TargetDcptMgmtSearchVO searchVO) throws Exception;

    /**
     * 과정관리 자료를 조회한다.
     *
     * @param targetDcptMgmtSearchVO
     * @return
     * @throws Exception
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtProcessMgmtSale(TargetDcptMgmtSearchVO searchVO) throws Exception;

    /**
     * KPI 자료를 조회한다.
     *
     * @param targetDcptMgmtSearchVO
     * @return
     * @throws Exception
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtKpi(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception;

    public int updateTargetDcptMgmtDealerDcptSaleAll(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception;

    public int updateTargetDcptMgmtDealerDcptSaleComplete(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception;

    /**
     * 목표분해도 - 딜러분해(판매고문) 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetYearRegSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtPotenCustCnt(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception;

    /**
     * 목표분해도 - 딜러분해(판매고문) 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetYearRegSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealRate(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception;

    /**
     * 목표분해도 - 딜러분해(판매고문) 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetYearRegSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtTargetConfig(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception;

    /**
     * 딜러현황자료(기초값)를 조회한다.
     *
     * @param targetDcptMgmtSearchVO
     * @return
     * @throws Exception
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealerTargetAchieveGrid(TargetDcptMgmtSearchVO searchVO) throws Exception;

    /**
     * 딜러현황자료(기초값)를 조회한다.
     *
     * @param targetDcptMgmtSearchVO
     * @return
     * @throws Exception
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealerTargetAchieveIdccGrid(TargetDcptMgmtSearchVO searchVO) throws Exception;

    /**
     * 딜러현황자료(기초값)를 조회한다.
     *
     * @param targetDcptMgmtSearchVO
     * @return
     * @throws Exception
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealerTargetAchieveShopGrid(TargetDcptMgmtSearchVO searchVO) throws Exception;

    public int updateTargetDcptMgmtTargetStatusSave(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception;

    public int updateTargetDcptMgmtDealerDcptCustComplete(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO) throws Exception;

    /**
     * 딜러현황자료(기초값)를 조회한다.
     *
     * @param targetDcptMgmtSearchVO
     * @return
     * @throws Exception
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtProcessMgmtGrid(TargetDcptMgmtSearchVO searchVO) throws Exception;

    /**
     * 딜러현황자료(기초값)를 조회한다.
     *
     * @param targetDcptMgmtSearchVO
     * @return
     * @throws Exception
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtProcessCustConfig(TargetDcptMgmtSearchVO searchVO) throws Exception;

    /**
     * 딜러현황자료(기초값)를 조회한다.
     *
     * @param targetDcptMgmtSearchVO
     * @return
     * @throws Exception
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtProcessCustConfigVal(TargetDcptMgmtSearchVO searchVO) throws Exception;

    /**
     * 년간 목표 정보를 임시 처리한다.
     * @param TargetDcptMgmtCustConfigSaveVO
     */
    public void multiTargetCustConfigRegTempSave(BaseSaveVO<TargetDcptMgmtVO> targetDcptMgmtCustConfigSaveVO) throws Exception;

    /**
     * [제조사] 년간 목표 정보를 등록한다.
     * @param targetDcptMgmtVO - 등록할 정보가 담긴 TargetDcptMgmtVO
     * @return 등록된 목록수
     */
    public int insertCustConfigReg(TargetDcptMgmtVO targetDcptMgmtVO) throws Exception;

    /**
     * [제조사] 년간 목표 정보를 수정한다.
     * @param targetDcptMgmtVO - 수정할 정보가 담긴 TargetDcptMgmtVO
     * @return 수정된 목록수
     */
    public int updateCustConfigReg(TargetDcptMgmtVO targetDcptMgmtVO) throws Exception;

    /**
     * [제조사] 년간 목표 정보를 삭제한다.
     * @param targetDcptMgmtVO - 삭제할 정보가 담긴 TargetDcptMgmtVO
     * @return 삭제된 목록수
     */
    public int deleteCustConfigReg(TargetDcptMgmtVO targetDcptMgmtVO) throws Exception;

    /**
     * [제조사] Key에 해당하는 년간 목표 정보를 조회한다.
     * @param
     * @return
     */
    public TargetDcptMgmtVO selectCustConfigRegByKey(String custGubnVal, String custChannelVal) throws Exception;

    /**
     * 딜러현황자료(기초값)를 조회한다.
     *
     * @param targetDcptMgmtSearchVO
     * @return
     * @throws Exception
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtProcessMgmtSaleGrid(TargetDcptMgmtSearchVO searchVO) throws Exception;

    /**
     * 딜러현황자료(기초값)를 조회한다.
     *
     * @param targetDcptMgmtSearchVO
     * @return
     * @throws Exception
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtProcessMgmtCustGrid(TargetDcptMgmtSearchVO searchVO) throws Exception;


}
