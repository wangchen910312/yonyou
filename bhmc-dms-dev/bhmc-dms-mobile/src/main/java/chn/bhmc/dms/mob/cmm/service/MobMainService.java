package chn.bhmc.dms.mob.cmm.service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * <pre>
 * 모바일메인화면 데이터 조회 서비스
 * </pre>
 *
 * @ClassName   : MobMainService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2017. 5. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 5. 18.     Kang Seok Han     최초 생성
 * </pre>
 */

public interface MobMainService {

    /**
     * 월별 판매수량 조회
     *
     * 총판매 수량 : 일반판매(J1)+전략출고(J3)+전략출고일반판매전환(J5)
     * 전략출고  수량: 전략출고(J3)
     *
     * @param dlrCd 딜러코드
     * @param yyyymm 기준년월
     * @param kmoptList 구분코드목록
     * @return
     * @throws Exception
     */
    public int selectSalesCount(String dlrCd, String yyyymm, List<String> kmoptList) throws Exception;

    /**
     * 기간별 소매판매 수량 조회
     * @param dlrCd 딜러코드
     * @param startCustSaleDt 고객판매일자 조회시작일
     * @param endCustSaleDt 고객판매일자 조회종료일
     * @return
     * @throws Exception
     */
    public int selectCustSalesCount(String dlrCd, Date startCustSaleDt, Date endCustSaleDt) throws Exception;

    /**
     * 일별 소매판매 수량 조회
     * 일별 소매판매 차트 출력용 데이터
     * @param dlrCd 딜러코드
     * @param yyyymm 기준월
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectDailyCustSalesList(String dlrCd, String yyyymm) throws Exception;

    /**
     * 차종별 소매판매 수량 조회
     * 차종별 소매판매 차트 출력용 데이터
     * @param dlrCd 딜러코드
     * @param yyyymm
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectCustSalesListByCarline(String dlrCd, String yyyymm) throws Exception;

    /**
     * 전시장 방문자수 조회
     * @param dlrCd 딜러코드
     * @param startVsitDt 방문일자 조회 시작일
     * @param endVsitDt 방문일자 조회 종료일
     * @return
     * @throws Exception
     */
    public int selectVisitCount(String dlrCd, Date startVsitDt, Date endVsitDt) throws Exception;

    /**
     * 판매기회 수량 조회
     *
     * 01 : 업로드/집객
     * 02 : 추출/예약
     * 03 : 방문/면담
     * 04 : 추적/추진
     *
     * @param dlrCd 딜러코드
     * @param leadStatCdList 리드상태코드 목록
     * @param befLeadStatCd 이전리드상태코드
     * @return
     * @throws Exception
     */
    public int selectLeadCount(String dlrCd, List<String> leadStatCdList, String befLeadStatCd) throws Exception;

    /**
     * 판매기회 당일 예약수
     *
     * @param dlrCd 딜러코드
     * @param startVsitResvDt 예약일자 조회 시작일
     * @param endVsitResvDt 예약일자 조회 종료일
     * @return
     * @throws Exception
     */
    public int selectReservedLeadCount(String dlrCd, Date startVsitResvDt, Date endVsitResvDt) throws Exception;

    /**
     * 판매기회 예약후 당일 방문수
     *
     * @param dlrCd 딜러코드
     * @param startVsitDt 방문일자 조회 시작일
     * @param endVsitDt 방문일자 조회 종료일
     * @return
     * @throws Exception
     */
    public int selectVisitReservedLeadCount(String dlrCd, Date startVsitDt, Date endVsitDt) throws Exception;

    /**
     * 제조사클레임 목록수 조회
     * @param dlrCd 딜러코드
     * @return
     * @throws Exception
     */
    public int selectOutstandingVocClaimCount(String dlrCd) throws Exception;

    /**
     * 진행중인 캠페인 목록수 조회
     * @param dlrCd 딜러코드
     * @return
     * @throws Exception
     */
    public int selectOutstandingCampaignCount(String dlrCd) throws Exception;

    /**
     * 장면금액, 재고금액 조회
     * @param dlrCd 딜러코드
     * @return
     * @throws Exception
     */
    public Map<String, BigDecimal> selectStockInOutAmtSummary(String dlrCd) throws Exception;

    /**
     * 부품 입고금액 조회
     *
     * @param dlrCd 딜러코드
     * @param startGrDt 전표처리일자 조회시작일
     * @param endGrDt 전표처리일자 조회종료일
     * @return
     * @throws Exception
     */
    public double selectItemGrAmt(String dlrCd, Date startGrDt, Date endGrDt) throws Exception;

    /**
     * 부품 출고금액 조회
     *
     * @param dlrCd 딜러코드
     * @param startGiDt 전표처리일자 조회시작일
     * @param endGiDt 전표처리일자 조회종료일
     * @return
     * @throws Exception
     */
    public double selectItemGiAmt(String dlrCd, Date startGiDt, Date endGiDt) throws Exception;

    /**
     * 부품 판매금액 조회
     * @param dlrCd 딜러코드
     * @param startStmtProcDt 전표처리일자 조회시작일
     * @param endStmtProcDt 전표처리일자 조회종료일
     * @return
     */
    public double selectItemSalesAmt(String dlrCd, Date startStmtProcDt, Date endStmtProcDt) throws Exception;

    /**
     * 구매오더 수량 조회
     * @param dlrCd 딜러코드
     * @param purcOrdStatCd 구매오더상태코드 : 발송(02), 처리(03)
     * @return
     * @throws Exception
     */
    public int selectPurcharsOrderCount(String dlrCd, String purcOrdStatCd) throws Exception;

    /**
     * 공사중 금액(선수금 사용액)
     * @param dlrCd 딜러코드
     * @return
     * @throws Exception
     */
    public double selectUsedAmtReceivedInAdvanced(String dlrCd) throws Exception;

    /**
     * 정비위탁대차 수량 조회
     * @param dlrCd 딜러코드
     * @param startRoDt RO일자 조회시작일
     * @param endRoDt RO일자 조회종료일
     * @return
     */
    public int selectRepairOrderCount(String dlrCd, Date startRoDt, Date endRoDt) throws Exception;

    /**
     * 정비생산금액 조회
     * @param dlrCd 딜러코드
     * @param startCalcDt 정산일자 조회시작일
     * @param endCalcDt 정산일자 조회종료일
     * @return
     */
    public double selectCalcTotAmt(String dlrCd, Date startCalcDt, Date endCalcDt) throws Exception;

    /**
     * 정비매출 조회
     * @param dlrCd 딜러코드
     * @param startCalcDt 정산일자 조회시작일
     * @param endCalcDt 정산일자 조회종료일
     * @return
     */
    public double selectCalcSales(String dlrCd, Date startCalcDt, Date endCalcDt) throws Exception;

    /**
     * 월별 서비스생산액 데이터 조회
     * 월별 서비스생산액 차트출력용 데이터 조회
     * @param dlrCd 딜러코드
     * @param prevYyyy 기준년도[전년]
     * @param currYyyy 기준년도[당년]
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectMonthlyCalcTotAmtList(String dlrCd, String prevYyyy, String currYyyy) throws Exception;

    /**
     * 정비금액집계정보 조회
     * 정비생산액 : calcTotAmt
     * 서비스정산대차 : calcDocCnt
     * 한대차생산액 : calcDocAvgAmt
     * 한대당생산액 : calcVinAvgAmt
     * @param dlrCd 딜러코드
     * @param startCalcDt 정산일자 조회시작일
     * @param endCalcDt 정산일자 조회종료일
     * @return
     * @throws Exception
     */
    public Map<String, BigDecimal> selectRepairOrderAmtSummary(String dlrCd, Date startCalcDt, Date endCalcDt) throws Exception;

    /**
     * 당월 차종별 서비스 정산 대차 데이터 조회
     * 당월 차종별 서비스 정산 대차 차트출력용 데이터 조회
     * @param dlrCd 딜러코드
     * @param startCalcDt 정산일자 조회시작일
     * @param endCalcDt 정산일자 조회종료일
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectCalcDocListByCarline(String dlrCd, Date startCalcDt, Date endCalcDt) throws Exception;

    /**
     * 당월 수리유형별 서비스 정산 대차 데이터 조회
     * 당월 수리유형별 서비스 정산 대차 차트출력용 데이터 조회
     * @param dlrCd 딜러코드
     * @param startCalcDt 정산일자 조회시작일
     * @param endCalcDt 정산일자 조회종료일
     * @param langCd 언어코드
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> selectCalcDocListByRepairOrderType(String dlrCd, Date startCalcDt, Date endCalcDt, String langCd) throws Exception;


}
