package chn.bhmc.dms.par.stm.vo;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 수불유형 검색 VO
 *
 * @ClassName   : StockInOutSearchVO.java
 * @Description : StockInOutSearchVO.Class
 * @author Ju Won Lee
 * @since 2016. 1. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 21.     Ju Won Lee     최초 생성
 * </pre>
 */

public class StockInOutSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2986116251690187907L;

    /**
     * 딜러코드
     **/

    private String sDlrCd;

    /**
     * 언어코드
     **/

    private String sLangCd;

    /**
     * 센터코드
     **/

    private String sPltCd;

    /**
     * 공급상
     **/
    private String sSpyrCd;

    /**
     * 창고코드
     **/

    private String sStrgeCd;

    /**
     * 창고코드 리스트
     **/
    private List<String> sStrgeCdList;

    /**
     * 업체코드 리스트
     **/
    private List<String> sBpCdList;

    /**
     * 품목코드
     **/

    private String sItemCd;

    /**
     * 품목코드(equal 검색용)
     **/

    private String sEquiItemCd;

    /**
     * 부품명
     */
    private String sItemNm;

    /**
     * 거래처코드
     */
    private String sBpCd;

    /**
     * 거래처명
     */
    private String sBpNm;

    /**
     * 가용재고량
     **/

    private Double sAvlbStockQty;

    /**
     * 예약재고량
     **/

    private Double sResvStockQty;

    /**
     * 보류재고량
     **/

    private Double sClamStockQty;

    /**
     * 입고예정수량
     **/

    private Double sGrScheQty;

    /**
     * 출고예정수량
     **/

    private Double sGiScheQty;

    /**
     * 품목구분코드
     */
    private String sItemDstinCd;

    /**
     * 품목그룹코드
     */
    private String sItemGrpCd;

    /***
     * 단종여부
     */
    private String sEndYn;

    /**
     * ABC CLASS
     */
    private String sAbcInd;

    /***
     * 차종코드
     */
    private String sCarlineCd;

    /***
     * 차형코드
     */
    private String sModelCd;

    /***
     * NONMOVINGSTOCK
     */
    private String sNonMovingFlg;

    /***
     * 가용재고 체크
     */
    private String sAvailQtyFlg;

    /***
     * 재고상태
     */
    private String sStockStatCd;

    /***
     * 로케이션 레벨1
     */
    private String sLocLvl1;

    /***
     * 로케이션 레벨1
     */
    private String sLocLvl2;

    /***
     * 로케이션 레벨1
     */
    private String sLocLvl3;

    /***
     * 로케이션 레벨1
     */
    private String sLocLvl4;

    /***
     * 로케이션 레벨1
     */
    private String sLocLvl5;

    /***
     * 로케이션
     */
    private String sLocCd;

    /***
     * 로케이션 2
     */
    private String sLocCdMig;

    /***
     * 년월
     */
    private String sYyMm;

    /***
     * 업체구분
     */
    private String sBpTp;

    /**
     * 최근입고시작일자(최종입고일자)
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sLastGrDtFr;

    /**
     * 최근입고종료일자(최종입고일자)
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sLastGrDtTo;

    /**
     * 최근출고시작일자(최종출고일자)
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sLastGiDtFr;

    /**
     * 최근출고종료일자(최종출고일자)
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sLastGiDtTo;

    /**
     * 재고원가 시작
    **/
    private double sStockCostFrom;

    /**
     * 재고원가 종료
    **/
    private double sStockCostTo;

    /**
     * 등록자ID
     **/
    private String sRegUsrId;

    /**
     * 창고유형
     */
    private String sStrgeTp;

    /**
     * 기타 참조 코드1
     */
    private String sEtcCd1;

    /**
     * 기타 참조 코드2
     */
    private String sEtcCd2;

    /**
     * 브랜드
     */
    private String sBrandCd;

    /**
     * 재고통제여부
     */
    private String sStockLockYn;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRegDt;

    /**
     * 수정자ID
     **/
    private String sUpdtUsrId;

    /**
     * 재고대기일수시작
     */
    private double sStockStayDayStart = 0.0;
    /**
     * 재고대기일수종료
     */
    private double sStockStayDayEnd = 0.0;

    /**
     * 품목그룹코드1
     **/
    private String sItemGrpCd1;

    /**
     * 품목그룹코드2
     **/
    private String sItemGrpCd2;

    /**
     * 품목그룹코드3
     **/
    private String sItemGrpCd3;

    /**
     * 품목그룹코드4
     **/
    private String sItemGrpCd4;

    /**
     * @return the sDlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }
    /**
     * @param sDlrCd the sDlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }
    /**
     * @return the sLangCd
     */
    public String getsLangCd() {
        return sLangCd;
    }
    /**
     * @param sLangCd the sLangCd to set
     */
    public void setsLangCd(String sLangCd) {
        this.sLangCd = sLangCd;
    }
    /**
     * @return the sPltCd
     */
    public String getsPltCd() {
        return sPltCd;
    }
    /**
     * @param sPltCd the sPltCd to set
     */
    public void setsPltCd(String sPltCd) {
        this.sPltCd = sPltCd;
    }
    /**
     * @return the sSpyrCd
     */
    public String getsSpyrCd() {
        return sSpyrCd;
    }
    /**
     * @param sSpyrCd the sSpyrCd to set
     */
    public void setsSpyrCd(String sSpyrCd) {
        this.sSpyrCd = sSpyrCd;
    }
    /**
     * @return the sStrgeCd
     */
    public String getsStrgeCd() {
        return sStrgeCd;
    }
    /**
     * @param sStrgeCd the sStrgeCd to set
     */
    public void setsStrgeCd(String sStrgeCd) {
        this.sStrgeCd = sStrgeCd;
    }
    /**
     * @return the sStrgeCdList
     */
    public List<String> getsStrgeCdList() {
        return sStrgeCdList;
    }
    /**
     * @param sStrgeCdList the sStrgeCdList to set
     */
    public void setsStrgeCdList(List<String> sStrgeCdList) {
        this.sStrgeCdList = sStrgeCdList;
    }
    /**
     * @return the sBpCdList
     */
    public List<String> getsBpCdList() {
        return sBpCdList;
    }
    /**
     * @param sBpCdList the sBpCdList to set
     */
    public void setsBpCdList(List<String> sBpCdList) {
        this.sBpCdList = sBpCdList;
    }
    /**
     * @return the sItemCd
     */
    public String getsItemCd() {
        return sItemCd;
    }
    /**
     * @param sItemCd the sItemCd to set
     */
    public void setsItemCd(String sItemCd) {
        this.sItemCd = sItemCd;
    }
    /**
     * @return the sItemNm
     */
    public String getsItemNm() {
        return sItemNm;
    }
    /**
     * @param sItemNm the sItemNm to set
     */
    public void setsItemNm(String sItemNm) {
        this.sItemNm = sItemNm;
    }
    /**
     * @return the sBpCd
     */
    public String getsBpCd() {
        return sBpCd;
    }
    /**
     * @param sBpCd the sBpCd to set
     */
    public void setsBpCd(String sBpCd) {
        this.sBpCd = sBpCd;
    }
    /**
     * @return the sBpNm
     */
    public String getsBpNm() {
        return sBpNm;
    }
    /**
     * @param sBpNm the sBpNm to set
     */
    public void setsBpNm(String sBpNm) {
        this.sBpNm = sBpNm;
    }
    /**
     * @return the sAvlbStockQty
     */
    public Double getsAvlbStockQty() {
        return sAvlbStockQty;
    }
    /**
     * @param sAvlbStockQty the sAvlbStockQty to set
     */
    public void setsAvlbStockQty(Double sAvlbStockQty) {
        this.sAvlbStockQty = sAvlbStockQty;
    }
    /**
     * @return the sResvStockQty
     */
    public Double getsResvStockQty() {
        return sResvStockQty;
    }
    /**
     * @param sResvStockQty the sResvStockQty to set
     */
    public void setsResvStockQty(Double sResvStockQty) {
        this.sResvStockQty = sResvStockQty;
    }
    /**
     * @return the sClamStockQty
     */
    public Double getsClamStockQty() {
        return sClamStockQty;
    }
    /**
     * @param sClamStockQty the sClamStockQty to set
     */
    public void setsClamStockQty(Double sClamStockQty) {
        this.sClamStockQty = sClamStockQty;
    }
    /**
     * @return the sGrScheQty
     */
    public Double getsGrScheQty() {
        return sGrScheQty;
    }
    /**
     * @param sGrScheQty the sGrScheQty to set
     */
    public void setsGrScheQty(Double sGrScheQty) {
        this.sGrScheQty = sGrScheQty;
    }
    /**
     * @return the sGiScheQty
     */
    public Double getsGiScheQty() {
        return sGiScheQty;
    }
    /**
     * @param sGiScheQty the sGiScheQty to set
     */
    public void setsGiScheQty(Double sGiScheQty) {
        this.sGiScheQty = sGiScheQty;
    }
    /**
     * @return the sItemDstinCd
     */
    public String getsItemDstinCd() {
        return sItemDstinCd;
    }
    /**
     * @param sItemDstinCd the sItemDstinCd to set
     */
    public void setsItemDstinCd(String sItemDstinCd) {
        this.sItemDstinCd = sItemDstinCd;
    }
    /**
     * @return the sItemGrpCd
     */
    public String getsItemGrpCd() {
        return sItemGrpCd;
    }
    /**
     * @param sItemGrpCd the sItemGrpCd to set
     */
    public void setsItemGrpCd(String sItemGrpCd) {
        this.sItemGrpCd = sItemGrpCd;
    }
    /**
     * @return the sEndYn
     */
    public String getsEndYn() {
        return sEndYn;
    }
    /**
     * @param sEndYn the sEndYn to set
     */
    public void setsEndYn(String sEndYn) {
        this.sEndYn = sEndYn;
    }
    /**
     * @return the sAbcInd
     */
    public String getsAbcInd() {
        return sAbcInd;
    }
    /**
     * @param sAbcInd the sAbcInd to set
     */
    public void setsAbcInd(String sAbcInd) {
        this.sAbcInd = sAbcInd;
    }
    /**
     * @return the sCarlineCd
     */
    public String getsCarlineCd() {
        return sCarlineCd;
    }
    /**
     * @param sCarlineCd the sCarlineCd to set
     */
    public void setsCarlineCd(String sCarlineCd) {
        this.sCarlineCd = sCarlineCd;
    }
    /**
     * @return the sModelCd
     */
    public String getsModelCd() {
        return sModelCd;
    }
    /**
     * @param sModelCd the sModelCd to set
     */
    public void setsModelCd(String sModelCd) {
        this.sModelCd = sModelCd;
    }
    /**
     * @return the sNonMovingFlg
     */
    public String getsNonMovingFlg() {
        return sNonMovingFlg;
    }
    /**
     * @param sNonMovingFlg the sNonMovingFlg to set
     */
    public void setsNonMovingFlg(String sNonMovingFlg) {
        this.sNonMovingFlg = sNonMovingFlg;
    }
    /**
     * @return the sAvailQtyFlg
     */
    public String getsAvailQtyFlg() {
        return sAvailQtyFlg;
    }
    /**
     * @param sAvailQtyFlg the sAvailQtyFlg to set
     */
    public void setsAvailQtyFlg(String sAvailQtyFlg) {
        this.sAvailQtyFlg = sAvailQtyFlg;
    }
    /**
     * @return the sStockStatCd
     */
    public String getsStockStatCd() {
        return sStockStatCd;
    }
    /**
     * @param sStockStatCd the sStockStatCd to set
     */
    public void setsStockStatCd(String sStockStatCd) {
        this.sStockStatCd = sStockStatCd;
    }
    /**
     * @return the sLocLvl1
     */
    public String getsLocLvl1() {
        return sLocLvl1;
    }
    /**
     * @param sLocLvl1 the sLocLvl1 to set
     */
    public void setsLocLvl1(String sLocLvl1) {
        this.sLocLvl1 = sLocLvl1;
    }
    /**
     * @return the sLocLvl2
     */
    public String getsLocLvl2() {
        return sLocLvl2;
    }
    /**
     * @param sLocLvl2 the sLocLvl2 to set
     */
    public void setsLocLvl2(String sLocLvl2) {
        this.sLocLvl2 = sLocLvl2;
    }
    /**
     * @return the sLocLvl3
     */
    public String getsLocLvl3() {
        return sLocLvl3;
    }
    /**
     * @param sLocLvl3 the sLocLvl3 to set
     */
    public void setsLocLvl3(String sLocLvl3) {
        this.sLocLvl3 = sLocLvl3;
    }
    /**
     * @return the sLocLvl4
     */
    public String getsLocLvl4() {
        return sLocLvl4;
    }
    /**
     * @param sLocLvl4 the sLocLvl4 to set
     */
    public void setsLocLvl4(String sLocLvl4) {
        this.sLocLvl4 = sLocLvl4;
    }
    /**
     * @return the sLocLvl5
     */
    public String getsLocLvl5() {
        return sLocLvl5;
    }
    /**
     * @param sLocLvl5 the sLocLvl5 to set
     */
    public void setsLocLvl5(String sLocLvl5) {
        this.sLocLvl5 = sLocLvl5;
    }
    /**
     * @return the sYyMm
     */
    public String getsYyMm() {
        return sYyMm;
    }
    /**
     * @param sYyMm the sYyMm to set
     */
    public void setsYyMm(String sYyMm) {
        this.sYyMm = sYyMm;
    }
    /**
     * @return the sBpTp
     */
    public String getsBpTp() {
        return sBpTp;
    }
    /**
     * @param sBpTp the sBpTp to set
     */
    public void setsBpTp(String sBpTp) {
        this.sBpTp = sBpTp;
    }
    /**
     * @return the sLastGrDtFr
     */
    public Date getsLastGrDtFr() {
        return sLastGrDtFr;
    }
    /**
     * @param sLastGrDtFr the sLastGrDtFr to set
     */
    public void setsLastGrDtFr(Date sLastGrDtFr) {
        this.sLastGrDtFr = sLastGrDtFr;
    }
    /**
     * @return the sLastGrDtTo
     */
    public Date getsLastGrDtTo() {
        return sLastGrDtTo;
    }
    /**
     * @param sLastGrDtTo the sLastGrDtTo to set
     */
    public void setsLastGrDtTo(Date sLastGrDtTo) {
        this.sLastGrDtTo = sLastGrDtTo;
    }
    /**
     * @return the sLastGiDtFr
     */
    public Date getsLastGiDtFr() {
        return sLastGiDtFr;
    }
    /**
     * @param sLastGiDtFr the sLastGiDtFr to set
     */
    public void setsLastGiDtFr(Date sLastGiDtFr) {
        this.sLastGiDtFr = sLastGiDtFr;
    }
    /**
     * @return the sLastGiDtTo
     */
    public Date getsLastGiDtTo() {
        return sLastGiDtTo;
    }
    /**
     * @param sLastGiDtTo the sLastGiDtTo to set
     */
    public void setsLastGiDtTo(Date sLastGiDtTo) {
        this.sLastGiDtTo = sLastGiDtTo;
    }
    /**
     * @return the sStockCostFrom
     */
    public double getsStockCostFrom() {
        return sStockCostFrom;
    }
    /**
     * @param sStockCostFrom the sStockCostFrom to set
     */
    public void setsStockCostFrom(double sStockCostFrom) {
        this.sStockCostFrom = sStockCostFrom;
    }
    /**
     * @return the sStockCostTo
     */
    public double getsStockCostTo() {
        return sStockCostTo;
    }
    /**
     * @param sStockCostTo the sStockCostTo to set
     */
    public void setsStockCostTo(double sStockCostTo) {
        this.sStockCostTo = sStockCostTo;
    }
    /**
     * @return the sRegUsrId
     */
    public String getsRegUsrId() {
        return sRegUsrId;
    }
    /**
     * @param sRegUsrId the sRegUsrId to set
     */
    public void setsRegUsrId(String sRegUsrId) {
        this.sRegUsrId = sRegUsrId;
    }
    /**
     * @return the sStrgeTp
     */
    public String getsStrgeTp() {
        return sStrgeTp;
    }
    /**
     * @param sStrgeTp the sStrgeTp to set
     */
    public void setsStrgeTp(String sStrgeTp) {
        this.sStrgeTp = sStrgeTp;
    }
    /**
     * @return the sEtcCd1
     */
    public String getsEtcCd1() {
        return sEtcCd1;
    }
    /**
     * @param sEtcCd1 the sEtcCd1 to set
     */
    public void setsEtcCd1(String sEtcCd1) {
        this.sEtcCd1 = sEtcCd1;
    }
    /**
     * @return the sEtcCd2
     */
    public String getsEtcCd2() {
        return sEtcCd2;
    }
    /**
     * @param sEtcCd2 the sEtcCd2 to set
     */
    public void setsEtcCd2(String sEtcCd2) {
        this.sEtcCd2 = sEtcCd2;
    }
    /**
     * @return the sBrandCd
     */
    public String getsBrandCd() {
        return sBrandCd;
    }
    /**
     * @param sBrandCd the sBrandCd to set
     */
    public void setsBrandCd(String sBrandCd) {
        this.sBrandCd = sBrandCd;
    }
    /**
     * @return the sRegDt
     */
    public Date getsRegDt() {
        return sRegDt;
    }
    /**
     * @param sRegDt the sRegDt to set
     */
    public void setsRegDt(Date sRegDt) {
        this.sRegDt = sRegDt;
    }
    /**
     * @return the sUpdtUsrId
     */
    public String getsUpdtUsrId() {
        return sUpdtUsrId;
    }
    /**
     * @param sUpdtUsrId the sUpdtUsrId to set
     */
    public void setsUpdtUsrId(String sUpdtUsrId) {
        this.sUpdtUsrId = sUpdtUsrId;
    }
    /**
     * @return the sStockStayDayStart
     */
    public double getsStockStayDayStart() {
        return sStockStayDayStart;
    }
    /**
     * @param sStockStayDayStart the sStockStayDayStart to set
     */
    public void setsStockStayDayStart(double sStockStayDayStart) {
        this.sStockStayDayStart = sStockStayDayStart;
    }
    /**
     * @return the sStockStayDayEnd
     */
    public double getsStockStayDayEnd() {
        return sStockStayDayEnd;
    }
    /**
     * @param sStockStayDayEnd the sStockStayDayEnd to set
     */
    public void setsStockStayDayEnd(double sStockStayDayEnd) {
        this.sStockStayDayEnd = sStockStayDayEnd;
    }
    /**
     * @return the sItemGrpCd1
     */
    public String getsItemGrpCd1() {
        return sItemGrpCd1;
    }
    /**
     * @param sItemGrpCd1 the sItemGrpCd1 to set
     */
    public void setsItemGrpCd1(String sItemGrpCd1) {
        this.sItemGrpCd1 = sItemGrpCd1;
    }
    /**
     * @return the sItemGrpCd2
     */
    public String getsItemGrpCd2() {
        return sItemGrpCd2;
    }
    /**
     * @param sItemGrpCd2 the sItemGrpCd2 to set
     */
    public void setsItemGrpCd2(String sItemGrpCd2) {
        this.sItemGrpCd2 = sItemGrpCd2;
    }
    /**
     * @return the sItemGrpCd3
     */
    public String getsItemGrpCd3() {
        return sItemGrpCd3;
    }
    /**
     * @param sItemGrpCd3 the sItemGrpCd3 to set
     */
    public void setsItemGrpCd3(String sItemGrpCd3) {
        this.sItemGrpCd3 = sItemGrpCd3;
    }
    /**
     * @return the sItemGrpCd4
     */
    public String getsItemGrpCd4() {
        return sItemGrpCd4;
    }
    /**
     * @param sItemGrpCd4 the sItemGrpCd4 to set
     */
    public void setsItemGrpCd4(String sItemGrpCd4) {
        this.sItemGrpCd4 = sItemGrpCd4;
    }
    /**
     * @return the sStockLockYn
     */
    public String getsStockLockYn() {
        return sStockLockYn;
    }
    /**
     * @param sStockLockYn the sStockLockYn to set
     */
    public void setsStockLockYn(String sStockLockYn) {
        this.sStockLockYn = sStockLockYn;
    }
    /**
     * @return the sLocCd
     */
    public String getsLocCd() {
        return sLocCd;
    }
    /**
     * @param sLocCd the sLocCd to set
     */
    public void setsLocCd(String sLocCd) {
        this.sLocCd = sLocCd;
    }
    /**
     * @return the sLocCdMig
     */
    public String getsLocCdMig() {
        return sLocCdMig;
    }
    /**
     * @param sLocCdMig the sLocCdMig to set
     */
    public void setsLocCdMig(String sLocCdMig) {
        this.sLocCdMig = sLocCdMig;
    }
    /**
     * @return the sEquiItemCd
     */
    public String getsEquiItemCd() {
        return sEquiItemCd;
    }
    /**
     * @param sEquiItemCd the sEquiItemCd to set
     */
    public void setsEquiItemCd(String sEquiItemCd) {
        this.sEquiItemCd = sEquiItemCd;
    }


}
