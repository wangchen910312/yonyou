package chn.bhmc.dms.par.ism.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 구매요청현황 VO
 *
 * @ClassName   : IssueReqStatusVO.java
 * @Description : IssueReqStatusVO Class
 * @author In Bo Shim
 * @since 2016. 2. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 23.     In Bo Shim     최초 생성
 * </pre>
 */
public class IssueReqResvStatusVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4480981519418159602L;

    /**
     * 딜러코드
     **/
    @NotEmpty
    private String dlrCd;

    /**
     * 센터코드
     **/
    @NotEmpty
    private String pltCd;

    /**
     * 부품요청문서번호
     **/
    @NotEmpty
    private String parReqDocNo = "";

    /**
     * 부품요청문서라인번호
     **/
    private int parReqDocLineNo = 0;

    /**
     * 부품요청상태코드
     **/
    @NotEmpty
    private String parReqStatCd = "";

    /**
     * 준비상태코드
     **/
    @NotEmpty
    private String readyStatCd = "";

    /**
     * 취소여부
     **/
    @NotEmpty
    private String cancYn = "N";

    /**
     * 부품출고유형
     **/
    @NotEmpty
    private String parGiTp = "";

    /**
     * RO일련번호
     **/
    @NotEmpty
    private String roDocNo = "";

    /**
     * RO라인번호
     **/
    private int roLineNo = 0;

    /**
     * RO유형
     **/
    @NotEmpty
    private String roTp = "";

    /**
     * RO상태
     **/
    @NotEmpty
    private String roStatCd = "";

    /**
     * 예약문서번호
     **/
    @NotEmpty
    private String resvDocNo = "";

    /**
     * 예약문서라인번호
     **/
    private int resvDocLineNo = 0;

    /**
     * 입고창고코드
     **/
    private String grStrgeCd = "";

    /**
     * 출고창고코드
     **/
    private String giStrgeCd = "";

    /**
     * 로케이션코드
     **/
    private String giLocCd = "";

    /**
     * DB저장품목코드
     **/
    private String dbItemCd = "";

    /**
     * 패키지코드
     **/
    private String pkgItemCd = "";

    /**
     * 할인율
     **/
    private double pkgDetlDcRate = 0.0;

    /**
     * 할인금액
     **/
    private double pkgDetlDcAmt = 0.0;

    /**
     * 할인총금액
     **/
    private double pkgDetlDcTotAmt = 0.0;

    /**
     * 품목코드
     **/
    private String itemCd = "";

    /**
     * 품목명
     **/
    private String itemNm = "";

    /**
     * 브랜드코드(부품품종)
     **/
    private String brandCd = "";

    /**
     * 품목단가
     **/
    private double itemPrc = 0.0;

    /**
     * 품목금액
     **/
    private double itemAmt = 0.0;

    /**
     * 요청수량
     **/
    private double reqQty = 0.0;

    /**
     * 단위코드
     **/
    private String unitCd = "";

    /**
     * 완료수량
     **/
    private double endQty = 0.0;

    /**
     * 요청창고코드
     **/
    private String reqStrgeCd = "";

    /**
     * 가용재고량
     **/
    private double avlbStockQty = 0.0;

    /**
     * 예약재고량
     **/
    private double resvStockQty = 0.0;

    /**
     * 보유재고량
     **/
    private double clamStockQty = 0.0;

    /**
     * 입고예정수량
     **/
    private double grScheQty = 0.0;

    /**
     * 출고예정수량
     **/
    private double giScheQty = 0.0;

    /**
     * 구매요청수량
     **/
    private double resvQty = 0.0;

    /**
     * 출고문서번호
     **/
    private String giDocNo = "";

    /**
     * 출고문서유형
     **/
    private String giDocTp = "";

    /**
     * 수불문서년월일자
     **/
    @NotEmpty
    private  String mvtDocYyMm = "";

    /**
     * 수불문서번호
     **/
    @NotEmpty
    private  String mvtDocNo = "";

    /**
     * 수불문서라인번호
     **/
    private  int mvtDocLineNo = 0;

    /**
     * 고객코드
     **/
    private String custCd = "";

    /**
     * 고객명
     **/
    private String custNm = "";

    /**
     * 서비스담당자ID
     **/
    private String serPrsnId = "";

    /**
     * 차량번호
     **/
    private String carNo = "";

    /**
     * 차대번호
     **/
    private String vinNo = "";

    /**
     * 차종
     **/
    private String carlineCd = "";

    /**
     * 차종명
     **/
    private String carlineNm = "";

    /**
     * 부품등급
     **/
    private String abcInd;

    /**
     * DB 저장여부
     **/
    private String dbYn;

    /**
     * 출고문서상태코드
     **/
    private String giDocStatCd;

    /**
     * 출고상태코드
     **/
    private String giStatCd;

    /**
     * 수령인ID
     **/
    private String receiveId;

    /**
     * 수령인명칭
     **/
    private String receiveNm;

    /**
     * 출고일자
     **/
    private Date giDt;

    /**
     * 수령일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date receiveDt;

    /**
     * 반환수량
     **/
    private double returnPartsQty;

    /**
     * 반품인ID
     **/
    private String returnId;

    /**
     * 반품일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date returnDt;

    /**
     * 취소인ID
     **/
    private String cancId;

    /**
     * 취소일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date cancDt;

    /**
     * 세금공제금액
     **/
    private double taxDdctAmt;

    /**
     * 세금액
     **/
    private double taxAmt;

    /**
     * 세율
     **/
    private double taxRate;

    /**
     * 출고원인명
     **/
    private String giCauNm;

    /**
     * 기타출고유형
     **/
    private String etcGiTp;

    /**
     * 이동평균단가
     **/
    private double movingAvgPrc = 0.0;

    /**
     * 이동평균금액
     **/
    private double movingAvgAmt = 0.0;

    /**
     * 이동평균금액(세금제외)
     **/
    private double movingAvgTaxDdctAmt = 0.0;

    /**
     * 부품예류번호
     **/
    private String readyDocNo = "";

    /**
     * 부품예류비고
     **/
    private String readyRemark = "";

    /**
     * 부품예류자
     **/
    private String readyUsrId = "";

    /**
     * 부품예류시간
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date readyRegDt;

    /**
     * 등록일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;

    /**
     * 등록일자
     */
    private String regDtString;

    /**
     * 수정일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;

    /**
     * 차용문서번호
     **/
    private String borrowDocNo;
    /**
     * 차용라인번호
     **/
    private int borrowLineNo;
    /**
     * 차용유형
     **/
    private String borrowTp;
    /**
     * 차용상태코드
     **/
    private String borrowStatCd;
    /**
     * 차용수량
     **/
    private double borrowQty;
    /**
     * 차용자ID
     **/
    private String borrowUsrId;
    /**
     * 차용등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date borrowRegDt;
    
    private Date calcDt;
    
    
    /**
     * 结算时间
     */
//     private String calcDtFormat;
    
     
     /**
      * @return the calcDtFormat
      */
//    public String getCalcDtFormat() {
//		return calcDtFormat;
//	}
//
//	public void setCalcDtFormat(String calcDtFormat) {
//		this.calcDtFormat = calcDtFormat;
//	}
    
    public Date getCalcDt() {
		return calcDt;
	}
	public void setCalcDt(Date calcDt) {
		this.calcDt = calcDt;
	}
	/**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }
    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }
    /**
     * @return the pltCd
     */
    public String getPltCd() {
        return pltCd;
    }
    /**
     * @param pltCd the pltCd to set
     */
    public void setPltCd(String pltCd) {
        this.pltCd = pltCd;
    }
    /**
     * @return the parReqDocNo
     */
    public String getParReqDocNo() {
        return parReqDocNo;
    }
    /**
     * @param parReqDocNo the parReqDocNo to set
     */
    public void setParReqDocNo(String parReqDocNo) {
        this.parReqDocNo = parReqDocNo;
    }
    /**
     * @return the parReqDocLineNo
     */
    public int getParReqDocLineNo() {
        return parReqDocLineNo;
    }
    /**
     * @param parReqDocLineNo the parReqDocLineNo to set
     */
    public void setParReqDocLineNo(int parReqDocLineNo) {
        this.parReqDocLineNo = parReqDocLineNo;
    }
    /**
     * @return the parReqStatCd
     */
    public String getParReqStatCd() {
        return parReqStatCd;
    }
    /**
     * @param parReqStatCd the parReqStatCd to set
     */
    public void setParReqStatCd(String parReqStatCd) {
        this.parReqStatCd = parReqStatCd;
    }
    /**
     * @return the readyStatCd
     */
    public String getReadyStatCd() {
        return readyStatCd;
    }
    /**
     * @param readyStatCd the readyStatCd to set
     */
    public void setReadyStatCd(String readyStatCd) {
        this.readyStatCd = readyStatCd;
    }
    /**
     * @return the cancYn
     */
    public String getCancYn() {
        return cancYn;
    }
    /**
     * @param cancYn the cancYn to set
     */
    public void setCancYn(String cancYn) {
        this.cancYn = cancYn;
    }
    /**
     * @return the parGiTp
     */
    public String getParGiTp() {
        return parGiTp;
    }
    /**
     * @param parGiTp the parGiTp to set
     */
    public void setParGiTp(String parGiTp) {
        this.parGiTp = parGiTp;
    }
    /**
     * @return the roDocNo
     */
    public String getRoDocNo() {
        return roDocNo;
    }
    /**
     * @param roDocNo the roDocNo to set
     */
    public void setRoDocNo(String roDocNo) {
        this.roDocNo = roDocNo;
    }
    /**
     * @return the roLineNo
     */
    public int getRoLineNo() {
        return roLineNo;
    }
    /**
     * @param roLineNo the roLineNo to set
     */
    public void setRoLineNo(int roLineNo) {
        this.roLineNo = roLineNo;
    }

    /**
     * @return the roTp
     */
    public String getRoTp() {
        return roTp;
    }

    /**
     * @param roTp the roTp to set
     */
    public void setRoTp(String roTp) {
        this.roTp = roTp;
    }

    /**
     * @return the roStatCd
     */
    public String getRoStatCd() {
        return roStatCd;
    }

    /**
     * @param roStatCd the roStatCd to set
     */
    public void setRoStatCd(String roStatCd) {
        this.roStatCd = roStatCd;
    }

    /**
     * @return the resvDocNo
     */
    public String getResvDocNo() {
        return resvDocNo;
    }

    /**
     * @param resvDocNo the resvDocNo to set
     */
    public void setResvDocNo(String resvDocNo) {
        this.resvDocNo = resvDocNo;
    }

    /**
     * @return the resvDocLineNo
     */
    public int getResvDocLineNo() {
        return resvDocLineNo;
    }

    /**
     * @param resvDocLineNo the resvDocLineNo to set
     */
    public void setResvDocLineNo(int resvDocLineNo) {
        this.resvDocLineNo = resvDocLineNo;
    }

    /**
     * @return the grStrgeCd
     */
    public String getGrStrgeCd() {
        return grStrgeCd;
    }

    /**
     * @param grStrgeCd the grStrgeCd to set
     */
    public void setGrStrgeCd(String grStrgeCd) {
        this.grStrgeCd = grStrgeCd;
    }

    /**
     * @return the giStrgeCd
     */
    public String getGiStrgeCd() {
        return giStrgeCd;
    }

    /**
     * @param giStrgeCd the giStrgeCd to set
     */
    public void setGiStrgeCd(String giStrgeCd) {
        this.giStrgeCd = giStrgeCd;
    }

    /**
     * @return the giLocCd
     */
    public String getGiLocCd() {
        return giLocCd;
    }

    /**
     * @param giLocCd the giLocCd to set
     */
    public void setGiLocCd(String giLocCd) {
        this.giLocCd = giLocCd;
    }

    /**
     * @return the dbItemCd
     */
    public String getDbItemCd() {
        return dbItemCd;
    }

    /**
     * @param dbItemCd the dbItemCd to set
     */
    public void setDbItemCd(String dbItemCd) {
        this.dbItemCd = dbItemCd;
    }

    /**
     * @return the pkgItemCd
     */
    public String getPkgItemCd() {
        return pkgItemCd;
    }

    /**
     * @param pkgItemCd the pkgItemCd to set
     */
    public void setPkgItemCd(String pkgItemCd) {
        this.pkgItemCd = pkgItemCd;
    }

    /**
     * @return the pkgDetlDcRate
     */
    public double getPkgDetlDcRate() {
        return pkgDetlDcRate;
    }

    /**
     * @param pkgDetlDcRate the pkgDetlDcRate to set
     */
    public void setPkgDetlDcRate(double pkgDetlDcRate) {
        this.pkgDetlDcRate = pkgDetlDcRate;
    }

    /**
     * @return the pkgDetlDcAmt
     */
    public double getPkgDetlDcAmt() {
        return pkgDetlDcAmt;
    }
    /**
     * @param pkgDetlDcAmt the pkgDetlDcAmt to set
     */
    public void setPkgDetlDcAmt(double pkgDetlDcAmt) {
        this.pkgDetlDcAmt = pkgDetlDcAmt;
    }

    /**
     * @return the pkgDetlDcTotAmt
     */
    public double getPkgDetlDcTotAmt() {
        return pkgDetlDcTotAmt;
    }

    /**
     * @param pkgDetlDcTotAmt the pkgDetlDcTotAmt to set
     */
    public void setPkgDetlDcTotAmt(double pkgDetlDcTotAmt) {
        this.pkgDetlDcTotAmt = pkgDetlDcTotAmt;
    }

    /**
     * @return the itemCd
     */
    public String getItemCd() {
        return itemCd;
    }

    /**
     * @param itemCd the itemCd to set
     */
    public void setItemCd(String itemCd) {
        this.itemCd = itemCd;
    }

    /**
     * @return the itemNm
     */
    public String getItemNm() {
        return itemNm;
    }

    /**
     * @param itemNm the itemNm to set
     */
    public void setItemNm(String itemNm) {
        this.itemNm = itemNm;
    }

    /**
     * @return the brandCd
     */
    public String getBrandCd() {
        return brandCd;
    }

    /**
     * @param brandCd the brandCd to set
     */
    public void setBrandCd(String brandCd) {
        this.brandCd = brandCd;
    }

    /**
     * @return the itemPrc
     */
    public double getItemPrc() {
        return itemPrc;
    }
    /**
     * @param itemPrc the itemPrc to set
     */
    public void setItemPrc(double itemPrc) {
        this.itemPrc = itemPrc;
    }

    /**
     * @return the itemAmt
     */
    public double getItemAmt() {
        return itemAmt;
    }

    /**
     * @param itemAmt the itemAmt to set
     */
    public void setItemAmt(double itemAmt) {
        this.itemAmt = itemAmt;
    }
    /**
     * @return the reqQty
     */
    public double getReqQty() {
        return reqQty;
    }

    /**
     * @param reqQty the reqQty to set
     */
    public void setReqQty(double reqQty) {
        this.reqQty = reqQty;
    }
    /**
     * @return the unitCd
     */
    public String getUnitCd() {
        return unitCd;
    }

    /**
     * @param unitCd the unitCd to set
     */
    public void setUnitCd(String unitCd) {
        this.unitCd = unitCd;
    }

    /**
     * @return the endQty
     */
    public double getEndQty() {
        return endQty;
    }

    /**
     * @param endQty the endQty to set
     */
    public void setEndQty(double endQty) {
        this.endQty = endQty;
    }
    /**
     * @return the reqStrgeCd
     */
    public String getReqStrgeCd() {
        return reqStrgeCd;
    }

    /**
     * @param reqStrgeCd the reqStrgeCd to set
     */
    public void setReqStrgeCd(String reqStrgeCd) {
        this.reqStrgeCd = reqStrgeCd;
    }

    /**
     * @return the avlbStockQty
     */
    public double getAvlbStockQty() {
        return avlbStockQty;
    }

    /**
     * @param avlbStockQty the avlbStockQty to set
     */
    public void setAvlbStockQty(double avlbStockQty) {
        this.avlbStockQty = avlbStockQty;
    }

    /**
     * @return the resvStockQty
     */
    public double getResvStockQty() {
        return resvStockQty;
    }

    /**
     * @param resvStockQty the resvStockQty to set
     */
    public void setResvStockQty(double resvStockQty) {
        this.resvStockQty = resvStockQty;
    }

    /**
     * @return the clamStockQty
     */
    public double getClamStockQty() {
        return clamStockQty;
    }

    /**
     * @param clamStockQty the clamStockQty to set
     */
    public void setClamStockQty(double clamStockQty) {
        this.clamStockQty = clamStockQty;
    }
    /**
     * @return the grScheQty
     */
    public double getGrScheQty() {
        return grScheQty;
    }

    /**
     * @param grScheQty the grScheQty to set
     */
    public void setGrScheQty(double grScheQty) {
        this.grScheQty = grScheQty;
    }

    /**
     * @return the giScheQty
     */
    public double getGiScheQty() {
        return giScheQty;
    }

    /**
     * @param giScheQty the giScheQty to set
     */
    public void setGiScheQty(double giScheQty) {
        this.giScheQty = giScheQty;
    }

    /**
     * @return the resvQty
     */
    public double getResvQty() {
        return resvQty;
    }

    /**
     * @param resvQty the resvQty to set
     */
    public void setResvQty(double resvQty) {
        this.resvQty = resvQty;
    }

    /**
     * @return the giDocNo
     */
    public String getGiDocNo() {
        return giDocNo;
    }
    /**
     * @param giDocNo the giDocNo to set
     */
    public void setGiDocNo(String giDocNo) {
        this.giDocNo = giDocNo;
    }
    /**
     * @return the giDocTp
     */
    public String getGiDocTp() {
        return giDocTp;
    }

    /**
     * @param giDocTp the giDocTp to set
     */
    public void setGiDocTp(String giDocTp) {
        this.giDocTp = giDocTp;
    }

    /**
     * @return the mvtDocYyMm
     */
    public String getMvtDocYyMm() {
        return mvtDocYyMm;
    }

    /**
     * @param mvtDocYyMm the mvtDocYyMm to set
     */
    public void setMvtDocYyMm(String mvtDocYyMm) {
        this.mvtDocYyMm = mvtDocYyMm;
    }

    /**
     * @return the mvtDocNo
     */
    public String getMvtDocNo() {
        return mvtDocNo;
    }

    /**
     * @param mvtDocNo the mvtDocNo to set
     */
    public void setMvtDocNo(String mvtDocNo) {
        this.mvtDocNo = mvtDocNo;
    }

    /**
     * @return the mvtDocLineNo
     */
    public int getMvtDocLineNo() {
        return mvtDocLineNo;
    }

    /**
     * @param mvtDocLineNo the mvtDocLineNo to set
     */
    public void setMvtDocLineNo(int mvtDocLineNo) {
        this.mvtDocLineNo = mvtDocLineNo;
    }

    /**
     * @return the custCd
     */
    public String getCustCd() {
        return custCd;
    }

    /**
     * @param custCd the custCd to set
     */
    public void setCustCd(String custCd) {
        this.custCd = custCd;
    }

    /**
     * @return the custNm
     */
    public String getCustNm() {
        return custNm;
    }

    /**
     * @param custNm the custNm to set
     */
    public void setCustNm(String custNm) {
        this.custNm = custNm;
    }

    /**
     * @return the serPrsnId
     */
    public String getSerPrsnId() {
        return serPrsnId;
    }

    /**
     * @param serPrsnId the serPrsnId to set
     */
    public void setSerPrsnId(String serPrsnId) {
        this.serPrsnId = serPrsnId;
    }

    /**
     * @return the carNo
     */
    public String getCarNo() {
        return carNo;
    }

    /**
     * @param carNo the carNo to set
     */
    public void setCarNo(String carNo) {
        this.carNo = carNo;
    }

    /**
     * @return the vinNo
     */
    public String getVinNo() {
        return vinNo;
    }

    /**
     * @param vinNo the vinNo to set
     */
    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }

    /**
     * @return the carlineCd
     */
    public String getCarlineCd() {
        return carlineCd;
    }

    /**
     * @param carlineCd the carlineCd to set
     */
    public void setCarlineCd(String carlineCd) {
        this.carlineCd = carlineCd;
    }

    /**
     * @return the carlineNm
     */
    public String getCarlineNm() {
        return carlineNm;
    }

    /**
     * @param carlineNm the carlineNm to set
     */
    public void setCarlineNm(String carlineNm) {
        this.carlineNm = carlineNm;
    }

    /**
     * @return the abcInd
     */
    public String getAbcInd() {
        return abcInd;
    }

    /**
     * @param abcInd the abcInd to set
     */
    public void setAbcInd(String abcInd) {
        this.abcInd = abcInd;
    }

    /**
     * @return the dbYn
     */
    public String getDbYn() {
        return dbYn;
    }

    /**
     * @param dbYn the dbYn to set
     */
    public void setDbYn(String dbYn) {
        this.dbYn = dbYn;
    }

    /**
     * @return the giDocStatCd
     */
    public String getGiDocStatCd() {
        return giDocStatCd;
    }

    /**
     * @param giDocStatCd the giDocStatCd to set
     */
    public void setGiDocStatCd(String giDocStatCd) {
        this.giDocStatCd = giDocStatCd;
    }

    /**
     * @return the giStatCd
     */
    public String getGiStatCd() {
        return giStatCd;
    }

    /**
     * @param giStatCd the giStatCd to set
     */
    public void setGiStatCd(String giStatCd) {
        this.giStatCd = giStatCd;
    }

    /**
     * @return the receiveId
     */
    public String getReceiveId() {
        return receiveId;
    }
    /**
     * @param receiveId the receiveId to set
     */
    public void setReceiveId(String receiveId) {
        this.receiveId = receiveId;
    }

    /**
     * @return the receiveNm
     */
    public String getReceiveNm() {
        return receiveNm;
    }

    /**
     * @param receiveNm the receiveNm to set
     */
    public void setReceiveNm(String receiveNm) {
        this.receiveNm = receiveNm;
    }

    /**
     * @return the giDt
     */
    public Date getGiDt() {
        return giDt;
    }

    /**
     * @param giDt the giDt to set
     */
    public void setGiDt(Date giDt) {
        this.giDt = giDt;
    }

    /**
     * @return the receiveDt
     */
    public Date getReceiveDt() {
        return receiveDt;
    }

    /**
     * @param receiveDt the receiveDt to set
     */
    public void setReceiveDt(Date receiveDt) {
        this.receiveDt = receiveDt;
    }

    /**
     * @return the returnPartsQty
     */
    public double getReturnPartsQty() {
        return returnPartsQty;
    }

    /**
     * @param returnPartsQty the returnPartsQty to set
     */
    public void setReturnPartsQty(double returnPartsQty) {
        this.returnPartsQty = returnPartsQty;
    }

    /**
     * @return the returnId
     */
    public String getReturnId() {
        return returnId;
    }

    /**
     * @param returnId the returnId to set
     */
    public void setReturnId(String returnId) {
        this.returnId = returnId;
    }

    /**
     * @return the returnDt
     */
    public Date getReturnDt() {
        return returnDt;
    }

    /**
     * @param returnDt the returnDt to set
     */
    public void setReturnDt(Date returnDt) {
        this.returnDt = returnDt;
    }

    /**
     * @return the cancId
     */
    public String getCancId() {
        return cancId;
    }

    /**
     * @param cancId the cancId to set
     */
    public void setCancId(String cancId) {
        this.cancId = cancId;
    }

    /**
     * @return the cancDt
     */
    public Date getCancDt() {
        return cancDt;
    }

    /**
     * @param cancDt the cancDt to set
     */
    public void setCancDt(Date cancDt) {
        this.cancDt = cancDt;
    }

    /**
     * @return the taxDdctAmt
     */
    public double getTaxDdctAmt() {
        return taxDdctAmt;
    }

    /**
     * @param taxDdctAmt the taxDdctAmt to set
     */
    public void setTaxDdctAmt(double taxDdctAmt) {
        this.taxDdctAmt = taxDdctAmt;
    }

    /**
     * @return the taxAmt
     */
    public double getTaxAmt() {
        return taxAmt;
    }

    /**
     * @param taxAmt the taxAmt to set
     */
    public void setTaxAmt(double taxAmt) {
        this.taxAmt = taxAmt;
    }

    /**
     * @return the taxRate
     */
    public double getTaxRate() {
        return taxRate;
    }
    /**
     * @param taxRate the taxRate to set
     */
    public void setTaxRate(double taxRate) {
        this.taxRate = taxRate;
    }
    /**
     * @return the giCauNm
     */
    public String getGiCauNm() {
        return giCauNm;
    }

    /**
     * @param giCauNm the giCauNm to set
     */
    public void setGiCauNm(String giCauNm) {
        this.giCauNm = giCauNm;
    }

    /**
     * @return the etcGiTp
     */
    public String getEtcGiTp() {
        return etcGiTp;
    }

    /**
     * @param etcGiTp the etcGiTp to set
     */
    public void setEtcGiTp(String etcGiTp) {
        this.etcGiTp = etcGiTp;
    }

    /**
     * @return the movingAvgPrc
     */
    public double getMovingAvgPrc() {
        return movingAvgPrc;
    }

    /**
     * @param movingAvgPrc the movingAvgPrc to set
     */
    public void setMovingAvgPrc(double movingAvgPrc) {
        this.movingAvgPrc = movingAvgPrc;
    }

    /**
     * @return the movingAvgAmt
     */
    public double getMovingAvgAmt() {
        return movingAvgAmt;
    }

    /**
     * @param movingAvgAmt the movingAvgAmt to set
     */
    public void setMovingAvgAmt(double movingAvgAmt) {
        this.movingAvgAmt = movingAvgAmt;
    }

    /**
     * @return the movingAvgTaxDdctAmt
     */
    public double getMovingAvgTaxDdctAmt() {
        return movingAvgTaxDdctAmt;
    }
    /**
     * @param movingAvgTaxDdctAmt the movingAvgTaxDdctAmt to set
     */
    public void setMovingAvgTaxDdctAmt(double movingAvgTaxDdctAmt) {
        this.movingAvgTaxDdctAmt = movingAvgTaxDdctAmt;
    }
    /**
     * @return the readyDocNo
     */
    public String getReadyDocNo() {
        return readyDocNo;
    }

    /**
     * @param readyDocNo the readyDocNo to set
     */
    public void setReadyDocNo(String readyDocNo) {
        this.readyDocNo = readyDocNo;
    }

    /**
     * @return the readyRemark
     */
    public String getReadyRemark() {
        return readyRemark;
    }

    /**
     * @param readyRemark the readyRemark to set
     */
    public void setReadyRemark(String readyRemark) {
        this.readyRemark = readyRemark;
    }

    /**
     * @return the readyUsrId
     */
    public String getReadyUsrId() {
        return readyUsrId;
    }

    /**
     * @param readyUsrId the readyUsrId to set
     */
    public void setReadyUsrId(String readyUsrId) {
        this.readyUsrId = readyUsrId;
    }

    /**
     * @return the readyRegDt
     */
    public Date getReadyRegDt() {
        return readyRegDt;
    }

    /**
     * @param readyRegDt the readyRegDt to set
     */
    public void setReadyRegDt(Date readyRegDt) {
        this.readyRegDt = readyRegDt;
    }

    /**
     * @return the regDt
     */
    public Date getRegDt() {
        return regDt;
    }

    /**
     * @param regDt the regDt to set
     */
    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }

    /**
     * @return the regDtString
     */
    public String getRegDtString() {
        return regDtString;
    }

    /**
     * @param regDtString the regDtString to set
     */
    public void setRegDtString(String regDtString) {
        this.regDtString = regDtString;
    }

    /**
     * @return the updtDt
     */
    public Date getUpdtDt() {
        return updtDt;
    }

    /**
     * @param updtDt the updtDt to set
     */
    public void setUpdtDt(Date updtDt) {
        this.updtDt = updtDt;
    }

    /**
     * @return the borrowDocNo
     */
    public String getBorrowDocNo() {
        return borrowDocNo;
    }

    /**
     * @param borrowDocNo the borrowDocNo to set
     */
    public void setBorrowDocNo(String borrowDocNo) {
        this.borrowDocNo = borrowDocNo;
    }

    /**
     * @return the borrowLineNo
     */
    public int getBorrowLineNo() {
        return borrowLineNo;
    }

    /**
     * @param borrowLineNo the borrowLineNo to set
     */
    public void setBorrowLineNo(int borrowLineNo) {
        this.borrowLineNo = borrowLineNo;
    }

    /**
     * @return the borrowTp
     */
    public String getBorrowTp() {
        return borrowTp;
    }

    /**
     * @param borrowTp the borrowTp to set
     */
    public void setBorrowTp(String borrowTp) {
        this.borrowTp = borrowTp;
    }

    /**
     * @return the borrowStatCd
     */
    public String getBorrowStatCd() {
        return borrowStatCd;
    }

    /**
     * @param borrowStatCd the borrowStatCd to set
     */
    public void setBorrowStatCd(String borrowStatCd) {
        this.borrowStatCd = borrowStatCd;
    }

    /**
     * @return the borrowQty
     */
    public double getBorrowQty() {
        return borrowQty;
    }

    /**
     * @param borrowQty the borrowQty to set
     */
    public void setBorrowQty(double borrowQty) {
        this.borrowQty = borrowQty;
    }

    /**
     * @return the borrowUsrId
     */
    public String getBorrowUsrId() {
        return borrowUsrId;
    }

    /**
     * @param borrowUsrId the borrowUsrId to set
     */
    public void setBorrowUsrId(String borrowUsrId) {
        this.borrowUsrId = borrowUsrId;
    }

    /**
     * @return the borrowRegDt
     */
    public Date getBorrowRegDt() {
        return borrowRegDt;
    }

    /**
     * @param borrowRegDt the borrowRegDt to set
     */
    public void setBorrowRegDt(Date borrowRegDt) {
        this.borrowRegDt = borrowRegDt;
    }
}
