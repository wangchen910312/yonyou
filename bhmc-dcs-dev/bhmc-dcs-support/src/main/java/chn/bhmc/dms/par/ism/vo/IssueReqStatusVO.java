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
public class IssueReqStatusVO extends BaseVO {

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
    private String parReqDocNo;

    /**
     * 부품요청문서라인번호
     **/
    private int parReqDocLineNo;

    /**
     * 부품요청상태코드
     **/
    @NotEmpty
    private String parReqStatCd;

    /**
     * 구매요청문서번호
     **/
    private String purcReqNo = "";

    /**
     * 구매요청일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date purcReqDt;

    /**
     * 취소여부
     **/
    @NotEmpty
    private String cancYn;

    /**
     * 부품출고유형
     **/
    @NotEmpty
    private String parGiTp;

    /**
     * RO일련번호
     **/
    @NotEmpty
    private String roDocNo;

    /**
     * RO라인번호
     **/
    private int roLineNo;

    /**
     * 예약문서번호
     **/
    @NotEmpty
    private String resvDocNo;

    /**
     * 예약문서라인번호
     **/
    private int resvDocLineNo;

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
     * 품목코드
     **/
    private String itemCd = "";

    /**
     * 품목명
     **/
    private String itemNm = "";

    /**
     * 품목단가
     **/
    private double itemPrc;

    /**
     * 품목금액
     **/
    private double itemAmt;

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
    private double endQty;

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
    private String giDocNo;

    /**
     * 출고문서유형
     **/
    private String giDocTp;

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
     * 출고원인명
     **/
    private String giCauNm;

    /**
     * 기타출고유형
     **/
    private String etcGiTp;

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
     * @return the purcReqNo
     */
    public String getPurcReqNo() {
        return purcReqNo;
    }

    /**
     * @param purcReqNo the purcReqNo to set
     */
    public void setPurcReqNo(String purcReqNo) {
        this.purcReqNo = purcReqNo;
    }

    /**
     * @return the purcReqDt
     */
    public Date getPurcReqDt() {
        return purcReqDt;
    }

    /**
     * @param purcReqDt the purcReqDt to set
     */
    public void setPurcReqDt(Date purcReqDt) {
        this.purcReqDt = purcReqDt;
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
}
