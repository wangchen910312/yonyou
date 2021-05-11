package chn.bhmc.dms.mis.tdm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.mis.tdm.vo.TargetDcptMgmtBaseVO;
import chn.bhmc.dms.mis.tdm.vo.TargetDcptMgmtSalemanVO;
import chn.bhmc.dms.mis.tdm.vo.TargetDcptMgmtSearchVO;
import chn.bhmc.dms.mis.tdm.vo.TargetDcptMgmtVO;
/**
 * <pre>
 * [딜러사] 목표분해도
 * </pre>
 *
 * @ClassName   : TargetDcptMgmtDAO.java
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
@Mapper("targetDcptMgmtDAO")
public interface TargetDcptMgmtDAO {

    /**
     * 성(우편번호) 목록을 조회한다.
     *
     * @param searchVO
     * @param provinceCd
     * @return
     */
    public List<TargetDcptMgmtVO> selectProvinceInfoList(TargetDcptMgmtSearchVO searchVO);

    /**
     * 성(우편번호) 목록을 조회한다.
     *
     * @param searchVO
     * @param provinceCd
     * @return
     */
    public List<TargetDcptMgmtVO> selectCityInfoList(TargetDcptMgmtSearchVO searchVO);

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<TargetDcptMgmtSearchVO> selectMarketStatusCityList(TargetDcptMgmtSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 월간목표 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetMonthRegSearchVO
     * @return
     */
    public int selectMarketStatusCityCnt(TargetDcptMgmtSearchVO searchVO);

    /**
     * Key에 해당하는 시장현황자료 정보를 조회한다.
     * @param
     * @return
     */
    public TargetDcptMgmtVO selectTargetDcptMgmtRegByKey(@Param("provinceCd") String provinceCd, @Param("cityCd") String cityCd, @Param("regYear") String regYear, @Param("regMonth") String regMonth);


    /**
     * 시장현황자료 정보를 등록한다.
     * @param targetDcptMgmtVO - 등록할 정보가 담긴 TargetDcptMgmtVO
     * @return 등록된 목록수
     */
    public int insertTargetDcptMgmtReg(TargetDcptMgmtVO targetDcptMgmtVO) throws Exception;

    /**
     * 시장현황자료 정보를 수정한다.
     * @param targetDcptMgmtVO - 수정할 정보가 담긴 TargetDcptMgmtVO
     * @return 수정된 목록수
     */
    public int updateTargetDcptMgmtReg(TargetDcptMgmtVO targetDcptMgmtVO) throws Exception;

    /**
     * 시장현황자료 정보를 삭제한다.
     * @param targetDcptMgmtVO - 삭제할 정보가 담긴 TargetDcptMgmtVO
     * @return 삭제된 목록수
     */
    public int deleteTargetDcptMgmtReg(TargetDcptMgmtVO targetDcptMgmtVO) throws Exception;

    /**
     * 시장현황자료를 조회한다.
     *
     * @param searchVO
     * @param provinceCd
     * @return
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtByCondition(TargetDcptMgmtSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 년간목표 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetYearRegSearchVO
     * @return
     */
    public int selectTargetDcptMgmtByConditionCnt(TargetDcptMgmtSearchVO searchVO);


    /**
     * 딜러현황자료(기초값)를 조회한다.
     *
     * @param searchVO
     * @param provinceCd
     * @return
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealerStatusBasicGrid(TargetDcptMgmtSearchVO searchVO);

    /**
     * 딜러현황자료(채널별 정보)를 조회한다.
     *
     * @param searchVO
     * @param provinceCd
     * @return
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealerStatusDetailGrid(TargetDcptMgmtSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 제조사 목표 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtManuTargetGridByCondition(TargetDcptMgmtSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 제조사 목표 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return
     */
    public int selectTargetDcptMgmtManuTargetGridCnt(TargetDcptMgmtSearchVO searchVO);

    /**
     * 제조사 당월 총목표를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtManuTargetSearch(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);

    /**
     * 제조사 당월 총목표를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtManuTargetAllGrid(TargetDcptMgmtSearchVO searchVO);

    /**
     * 딜러분해 자료  총 갯수를 조회한다.(당월 총목표 그리드)
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return
     */
    public int selectTargetDcptMgmtDealerSaleDcptTotalCnt(TargetDcptMgmtSearchVO searchVO);

    /**
     * 딜러분해 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealerSaleDcptTotalResult(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);

    /**
     * 딜러분해 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptMgmtVO> selectTargetDcptMgmtDealerSaleDcptTotalBasic(TargetDcptMgmtSearchVO searchVO);

    /**
     * 딜러분해 자료  총 갯수를 조회한다.(차종별 목표 그리드)
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return
     */
    public int selectTargetDcptMgmtDealerSaleDcptCarCnt(TargetDcptMgmtSearchVO searchVO);

    /**
     * 딜러분해 차종별 목표자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealerSaleDcptCarResult(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);

    /**
     * 딜러분해 차종별 목표자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealerSaleDcptShopResult(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);

    /**
     * 딜러분해 차종별 목표자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptMgmtVO> selectTargetDcptMgmtDealerSaleDcptCarBasic(TargetDcptMgmtSearchVO searchVO);

    /**
     * 딜러분해 차종별 목표자료를 등록한다.
     * @param targetDcptMgmtSearchVO - 등록할 정보가 담긴 TargetDcptMgmtSearchVO
     * @return 등록된 목록수
     */
    public int insertTargetDcptMgmtDealerDcptCarResult(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);


    public int insertTargetDcptMgmtDealerSaleDcptCarResult(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    /**
     * 딜러분해 자료  총 갯수를 조회한다.(집객 목표 그리드)
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return
     */
    public int selectTargetDcptMgmtDealerDcptCustCnt(TargetDcptMgmtSearchVO searchVO);

    /**
     * 딜러분해 집객 목표자료를 등록한다.
     * @param targetDcptMgmtSearchVO - 등록할 정보가 담긴 TargetDcptMgmtSearchVO
     * @return 등록된 목록수
     */
    public int insertTargetDcptMgmtDealerSaleDcptTotalResult(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);

    /**
     * 딜러분해 집객 목표자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealerDcptCustResult(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);

    /**
     * 딜러분해 자료 -헤더 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<TargetDcptMgmtBaseVO> selectTargetDcptMgmtDealerDcptCarHeadersByCondition(TargetDcptMgmtSearchVO searchVO) throws Exception; // selectStrOrdOcnBlockingHeadersByCondition

    /**
     * 딜러분해 자료  조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectTargetDcptMgmtDealerDcptCarViewByConditionCnt(TargetDcptMgmtSearchVO searchVO) throws Exception; // selectStrOrdOcnBlockingsByConditionCnt
    public List<TargetDcptMgmtBaseVO> selectTargetDcptMgmtDealerDcptCarViewByCondition(TargetDcptMgmtSearchVO searchVO) throws Exception; // selectStrOrdOcnBlockingsByCondition

    /**
     * 딜러분해 집객 목표자료를 등록한다.
     * @param targetDcptMgmtSearchVO - 등록할 정보가 담긴 TargetDcptMgmtSearchVO
     * @return 등록된 목록수
     */
    public int insertTargetDcptMgmtDealerDcptCustResult(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);

    /**
     * 딜러분해 차종별 목표자료를 수정한다.
     * @param targetDcptMgmtVO - 수정할 정보가 담긴 TargetDcptMgmtVO
     * @return 수정된 목록수
     */
    public int updateTargetDcptMgmtDealerDcptCar(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);

    /**
     * 딜러분해 차종별 목표자료를 수정한다.
     * @param targetDcptMgmtVO - 수정할 정보가 담긴 TargetDcptMgmtVO
     * @return 수정된 목록수
     */
    public int updateTargetDcptMgmtDealerDcptCust(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);

    /**
     * 딜러분해 집객 목표자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealerDcptSaleManAllData(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);

    /**
     * 딜러분해 집객 목표자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealerDcptSaleManAllStatus(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);

    /**
     * 딜러분해 집객 목표자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealerDcptSaleManProStatus(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);

    /**
     * Key에 해당하는 딜러분해 판매고문별 목표자료 조회한다.
     * @param
     * @return
     */
    public TargetDcptMgmtSalemanVO selectSalesmanDcptRegByKey(@Param("sDealerSaleManDcptYyMm") String sDealerSaleManDcptYyMm, @Param("empNo") String empNo, @Param("carlineCd") String carlineCd);

    /**
     *  딜러분해 판매고문별 목표자료를 등록한다.
     * @param targetDcptMgmtSalemanVO - 등록할 정보가 담긴 TargetDcptMgmtSalemanVO
     * @return 등록된 목록수
     */
    public int insertSalesmanDcptReg(TargetDcptMgmtSalemanVO targetDcptMgmtSalemanVO) throws Exception;

    /**
     *  딜러분해 판매고문별 목표자료를 수정한다.
     * @param targetDcptMgmtSalemanVO - 수정할 정보가 담긴 TargetDcptMgmtSalemanVO
     * @return 수정된 목록수
     */
    public int updateSalesmanDcptReg(TargetDcptMgmtSalemanVO targetDcptMgmtSalemanVO) throws Exception;

    /**
     * 딜러분해 판매고문별 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetYearRegSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealerSalemanDcpt(TargetDcptMgmtSearchVO searchVO);

    /**
     * 딜러분해 판매고문별 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetYearRegSearchVO
     * @return
     */
    public int selectTargetDcptMgmtDealerSalemanDcptCnt(TargetDcptMgmtSearchVO searchVO);

    /**
     * 과정관리 자료를 조회한다.
     *
     * @param searchVO
     * @param provinceCd
     * @return
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtProcessMgmtSale(TargetDcptMgmtSearchVO searchVO);

    /**
     * KPI 자료를 조회한다.
     *
     * @param searchVO
     * @param provinceCd
     * @return
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtKpi(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);

    public int updateTargetDcptMgmtDealerDcptSaleIdcc(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleShop(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleCarNo1(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleCarNo2(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleCarNo3(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleCarNo4(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleCarNo5(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleCarNo6(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleCarNo7(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleCarNo8(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleCarNo9(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleCarNo10(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleCarNo11(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleCarNo12(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleCarNo13(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleCarNo14(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleCarNo15(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleCarNo16(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleCarNo17(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleCarNo18(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleCarNo19(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleCarNo20(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleCarNo21(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);

    public int updateTargetDcptMgmtDealerDcptSaleCarNo22(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleCarNo23(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleCarNo24(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleCarNo25(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleCarNo26(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleCarNo27(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleCarNo28(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleCarNo29(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleCarNo30(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleCarNo31(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleCarNo32(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleCarNo33(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleCarNo34(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleCarNo35(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleCarNo36(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleCarNo37(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleCarNo38(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleCarNo39(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleCarNo40(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleCarNo41(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptSaleCarNo42(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);

    public int updateTargetDcptMgmtDealerDcptCustIdcc(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtDealerDcptCustShop(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);

    public int updateTargetDcptMgmtDealerDcptSaleComplete(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);

    /**
     * 딜러분해 집객 목표자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtPotenCustCnt(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);

    /**
     * 딜러분해 집객 목표자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealRate(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);

    /**
     * 딜러분해 집객 목표자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetDcptMgmtSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtTargetConfig(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);

    /**
     * 딜러현황자료(기초값)를 조회한다.
     *
     * @param searchVO
     * @param provinceCd
     * @return
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealerTargetAchieveGrid(TargetDcptMgmtSearchVO searchVO);

    /**
     * 딜러현황자료(기초값)를 조회한다.
     *
     * @param searchVO
     * @param provinceCd
     * @return
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealerTargetAchieveIdccGrid(TargetDcptMgmtSearchVO searchVO);

    /**
     * 딜러현황자료(기초값)를 조회한다.
     *
     * @param searchVO
     * @param provinceCd
     * @return
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtDealerTargetAchieveShopGrid(TargetDcptMgmtSearchVO searchVO);

    public int updateTargetDcptMgmtTargetStatuspotenCustCnt1(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtTargetStatuspotenCustCnt2(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtTargetStatuspotenCustCnt3(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtTargetStatuspotenCustCnt4(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtTargetStatuspotenCustCnt5(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtTargetStatuspotenCustCnt6(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtTargetStatuspotenCustCnt7(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtTargetStatuspotenCustCnt8(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtTargetStatuspotenCustCnt9(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtTargetStatuspotenCustCnt10(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtTargetStatuspotenCustCnt11(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtTargetStatuspotenCustCnt12(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtTargetStatuspotenCustCnt13(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtTargetStatuspotenCustCnt14(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtTargetStatuspotenCustCnt15(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtTargetStatuspotenCustCnt16(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtTargetStatuspotenCustCnt17(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtTargetStatuspotenCustCnt18(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtTargetStatuspotenCustCnt19(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtTargetStatuspotenCustCnt20(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtTargetStatuspotenCustCnt21(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);

    public int updateTargetDcptMgmtTargetStatuspotenCustCnt22(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtTargetStatuspotenCustCnt23(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtTargetStatuspotenCustCnt24(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtTargetStatuspotenCustCnt25(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtTargetStatuspotenCustCnt26(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtTargetStatuspotenCustCnt27(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtTargetStatuspotenCustCnt28(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtTargetStatuspotenCustCnt29(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtTargetStatuspotenCustCnt30(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtTargetStatuspotenCustCnt31(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtTargetStatuspotenCustCnt32(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtTargetStatuspotenCustCnt33(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtTargetStatuspotenCustCnt34(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtTargetStatuspotenCustCnt35(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtTargetStatuspotenCustCnt36(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtTargetStatuspotenCustCnt37(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtTargetStatuspotenCustCnt38(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtTargetStatuspotenCustCnt39(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtTargetStatuspotenCustCnt40(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtTargetStatuspotenCustCnt41(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);
    public int updateTargetDcptMgmtTargetStatuspotenCustCnt42(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);

    public int updateTargetDcptMgmtDealerDcptCustComplete(TargetDcptMgmtSearchVO targetDcptMgmtSearchVO);

    /**
     * 딜러현황자료(기초값)를 조회한다.
     *
     * @param searchVO
     * @param provinceCd
     * @return
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtProcessMgmtGrid(TargetDcptMgmtSearchVO searchVO);

    /**
     * 딜러현황자료(기초값)를 조회한다.
     *
     * @param searchVO
     * @param provinceCd
     * @return
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtProcessCustConfig(TargetDcptMgmtSearchVO searchVO);

    /**
     * 딜러현황자료(기초값)를 조회한다.
     *
     * @param searchVO
     * @param provinceCd
     * @return
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtProcessCustConfigVal(TargetDcptMgmtSearchVO searchVO);

    /**
     * Key에 해당하는 년간 목표 정보를 조회한다.
     * @param
     * @return
     */
    public TargetDcptMgmtVO selectCustConfigRegByKey(@Param("custGubnVal") String custGubnVal, @Param("custChannelVal") String custChannelVal);

    /**
     * 년간목표 정보를 등록한다.
     * @param targetDcptMgmtVO - 등록할 정보가 담긴 TargetDcptMgmtVO
     * @return 등록된 목록수
     */
    public int insertCustConfigReg(TargetDcptMgmtVO targetDcptMgmtVO) throws Exception;

    /**
     * 년간목표 정보를 수정한다.
     * @param targetDcptMgmtVO - 수정할 정보가 담긴 TargetDcptMgmtVO
     * @return 수정된 목록수
     */
    public int updateCustConfigReg(TargetDcptMgmtVO targetDcptMgmtVO) throws Exception;

    /**
     * 년간목표 정보를 삭제한다.
     * @param targetDcptMgmtVO - 삭제할 정보가 담긴 TargetDcptMgmtVO
     * @return 삭제된 목록수
     */
    public int deleteCustConfigReg(TargetDcptMgmtVO targetDcptMgmtVO);

    /**
     * 딜러현황자료(기초값)를 조회한다.
     *
     * @param searchVO
     * @param provinceCd
     * @return
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtProcessMgmtSaleGrid(TargetDcptMgmtSearchVO searchVO);

    /**
     * 딜러현황자료(기초값)를 조회한다.
     *
     * @param searchVO
     * @param provinceCd
     * @return
     */
    public List<TargetDcptMgmtSearchVO> selectTargetDcptMgmtProcessMgmtCustGrid(TargetDcptMgmtSearchVO searchVO);


}
