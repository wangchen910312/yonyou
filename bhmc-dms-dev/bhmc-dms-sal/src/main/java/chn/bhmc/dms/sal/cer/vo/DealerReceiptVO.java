package chn.bhmc.dms.sal.cer.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DealerReceiptVO
 * @Description : 딜러 영수증  VO ( 딜러 영수증 등록, 딜러 영수증 조회 및 수정 )
 * @author Bong
 * @since 2016. 5. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016. 5. 20.       Bong              최초 생성
 * </pre>
 */

public class DealerReceiptVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1247714202992521448L;

    private String dstinCd;       // 구분코드
    private String yy;             // 년도
    private String mm;             // 월

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date assgnDt;         // 지정일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date approveDt;       // 승인일자

    private String dlrCd;         // 딜러코드
    private String ordTp;         // 오더유형
    private String modelCd;       // 모델코드
    private String modelNm;       // 모델명
    private int ordQty;           // 오더수량
    private String carlineCd;     // 차종코드
    private double guideAmt;      // 가이드금액
    private double dcRate;        // 할인율
    private double invcAmt;       // 인보이스금액
    private String vinNo;         // 차대번호
    private String extColorCd;   // 외장색상코드
    private String intColorCd;   // 내장색상코드
    private String officeNm;      // 사무소명
    private String reqNo;         // 요청번호
    private String rsltCont;      // 결과내용
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date uploadDt;        // 업로드일자

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date ddlnDt;          // 마감일자

    private String updtYn;        // 수정여부
    private String custNm;        // 고객명
    private String remark;         // 비고
    private String stockYn;       // 재고여부
    private String stockVinNo;   // 재고VIN

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date incvDt;          // 인보이스일자

    private String incvYn;        // 인보이스여부
    private String drivingYn;     // 운전면허증여부
    private String docYn;         // 문서여부
    private String incbYn;        // 재직여부
    private String remark2;        // 비고


    /**
     * @return the dstinCd
     */
    public String getDstinCd() {
        return dstinCd;
    }


    /**
     * @param dstinCd the dstinCd to set
     */
    public void setDstinCd(String dstinCd) {
        this.dstinCd = dstinCd;
    }


    /**
     * @return the yy
     */
    public String getYy() {
        return yy;
    }


    /**
     * @param yy the yy to set
     */
    public void setYy(String yy) {
        this.yy = yy;
    }


    /**
     * @return the mm
     */
    public String getMm() {
        return mm;
    }


    /**
     * @param mm the mm to set
     */
    public void setMm(String mm) {
        this.mm = mm;
    }


    /**
     * @return the assgnDt
     */
    public Date getAssgnDt() {
        return assgnDt;
    }


    /**
     * @param assgnDt the assgnDt to set
     */
    public void setAssgnDt(Date assgnDt) {
        this.assgnDt = assgnDt;
    }


    /**
     * @return the approveDt
     */
    public Date getApproveDt() {
        return approveDt;
    }


    /**
     * @param approveDt the approveDt to set
     */
    public void setApproveDt(Date approveDt) {
        this.approveDt = approveDt;
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
     * @return the ordTp
     */
    public String getOrdTp() {
        return ordTp;
    }


    /**
     * @param ordTp the ordTp to set
     */
    public void setOrdTp(String ordTp) {
        this.ordTp = ordTp;
    }


    /**
     * @return the modelCd
     */
    public String getModelCd() {
        return modelCd;
    }


    /**
     * @param modelCd the modelCd to set
     */
    public void setModelCd(String modelCd) {
        this.modelCd = modelCd;
    }


    /**
     * @return the modelNm
     */
    public String getModelNm() {
        return modelNm;
    }


    /**
     * @param modelNm the modelNm to set
     */
    public void setModelNm(String modelNm) {
        this.modelNm = modelNm;
    }


    /**
     * @return the ordQty
     */
    public int getOrdQty() {
        return ordQty;
    }


    /**
     * @param ordQty the ordQty to set
     */
    public void setOrdQty(int ordQty) {
        this.ordQty = ordQty;
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
     * @return the guideAmt
     */
    public double getGuideAmt() {
        return guideAmt;
    }


    /**
     * @param guideAmt the guideAmt to set
     */
    public void setGuideAmt(double guideAmt) {
        this.guideAmt = guideAmt;
    }


    /**
     * @return the dcRate
     */
    public double getDcRate() {
        return dcRate;
    }


    /**
     * @param dcRate the dcRate to set
     */
    public void setDcRate(double dcRate) {
        this.dcRate = dcRate;
    }


    /**
     * @return the invcAmt
     */
    public double getInvcAmt() {
        return invcAmt;
    }


    /**
     * @param invcAmt the invcAmt to set
     */
    public void setInvcAmt(double invcAmt) {
        this.invcAmt = invcAmt;
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
     * @return the extColorCd
     */
    public String getExtColorCd() {
        return extColorCd;
    }


    /**
     * @param extColorCd the extColorCd to set
     */
    public void setExtColorCd(String extColorCd) {
        this.extColorCd = extColorCd;
    }


    /**
     * @return the intColorCd
     */
    public String getIntColorCd() {
        return intColorCd;
    }


    /**
     * @param intColorCd the intColorCd to set
     */
    public void setIntColorCd(String intColorCd) {
        this.intColorCd = intColorCd;
    }


    /**
     * @return the officeNm
     */
    public String getOfficeNm() {
        return officeNm;
    }


    /**
     * @param officeNm the officeNm to set
     */
    public void setOfficeNm(String officeNm) {
        this.officeNm = officeNm;
    }


    /**
     * @return the reqNo
     */
    public String getReqNo() {
        return reqNo;
    }


    /**
     * @param reqNo the reqNo to set
     */
    public void setReqNo(String reqNo) {
        this.reqNo = reqNo;
    }


    /**
     * @return the rsltCont
     */
    public String getRsltCont() {
        return rsltCont;
    }


    /**
     * @param rsltCont the rsltCont to set
     */
    public void setRsltCont(String rsltCont) {
        this.rsltCont = rsltCont;
    }


    /**
     * @return the uploadDt
     */
    public Date getUploadDt() {
        return uploadDt;
    }


    /**
     * @param uploadDt the uploadDt to set
     */
    public void setUploadDt(Date uploadDt) {
        this.uploadDt = uploadDt;
    }


    /**
     * @return the ddlnDt
     */
    public Date getDdlnDt() {
        return ddlnDt;
    }


    /**
     * @param ddlnDt the ddlnDt to set
     */
    public void setDdlnDt(Date ddlnDt) {
        this.ddlnDt = ddlnDt;
    }


    /**
     * @return the updtYn
     */
    public String getUpdtYn() {
        return updtYn;
    }


    /**
     * @param updtYn the updtYn to set
     */
    public void setUpdtYn(String updtYn) {
        this.updtYn = updtYn;
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
     * @return the remark
     */
    public String getRemark() {
        return remark;
    }


    /**
     * @param remark the remark to set
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }


    /**
     * @return the stockYn
     */
    public String getStockYn() {
        return stockYn;
    }


    /**
     * @param stockYn the stockYn to set
     */
    public void setStockYn(String stockYn) {
        this.stockYn = stockYn;
    }


    /**
     * @return the stockVinNo
     */
    public String getStockVinNo() {
        return stockVinNo;
    }


    /**
     * @param stockVinNo the stockVinNo to set
     */
    public void setStockVinNo(String stockVinNo) {
        this.stockVinNo = stockVinNo;
    }


    /**
     * @return the incvDt
     */
    public Date getIncvDt() {
        return incvDt;
    }


    /**
     * @param incvDt the incvDt to set
     */
    public void setIncvDt(Date incvDt) {
        this.incvDt = incvDt;
    }


    /**
     * @return the incvYn
     */
    public String getIncvYn() {
        return incvYn;
    }


    /**
     * @param incvYn the incvYn to set
     */
    public void setIncvYn(String incvYn) {
        this.incvYn = incvYn;
    }


    /**
     * @return the drivingYn
     */
    public String getDrivingYn() {
        return drivingYn;
    }


    /**
     * @param drivingYn the drivingYn to set
     */
    public void setDrivingYn(String drivingYn) {
        this.drivingYn = drivingYn;
    }


    /**
     * @return the docYn
     */
    public String getDocYn() {
        return docYn;
    }


    /**
     * @param docYn the docYn to set
     */
    public void setDocYn(String docYn) {
        this.docYn = docYn;
    }


    /**
     * @return the incbYn
     */
    public String getIncbYn() {
        return incbYn;
    }


    /**
     * @param incbYn the incbYn to set
     */
    public void setIncbYn(String incbYn) {
        this.incbYn = incbYn;
    }


    /**
     * @return the remark2
     */
    public String getRemark2() {
        return remark2;
    }


    /**
     * @param remark2 the remark2 to set
     */
    public void setRemark2(String remark2) {
        this.remark2 = remark2;
    }


    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
