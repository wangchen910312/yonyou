package chn.bhmc.dms.par.ism.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * 구매요청헤더 VO
 *
 * @ClassName   : IssueReqVO.java
 * @Description : IssueReqVO Class
 * @author In Bo Shim
 * @since 2016. 2. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 15.     In Bo Shim     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="dlrCd", mesgKey="par.lbl.dlrCd")
    ,@ValidField(field="parReqDocNo", mesgKey="par.lbl.parReqDocNo")
    ,@ValidField(field="parGiTp", mesgKey="par.lbl.parGiTp")
    ,@ValidField(field="parReqStatCd", mesgKey="par.lbl.parReqStatCd")
    ,@ValidField(field="cancYn", mesgKey="par.lbl.cancYn")
    ,@ValidField(field="roDocNo", mesgKey="par.lbl.roDocNo")
    ,@ValidField(field="resvDocNo", mesgKey="par.lbl.resvDocNo")
    ,@ValidField(field="pltCd", mesgKey="par.lbl.pltCd")
    ,@ValidField(field="serPrsnId", mesgKey="par.lbl.serPrsnId")
    ,@ValidField(field="custCd", mesgKey="par.lbl.custCd")
    ,@ValidField(field="custNm", mesgKey="par.lbl.custNm")
    ,@ValidField(field="vinNo", mesgKey="par.lbl.vinNo")
    ,@ValidField(field="carNo", mesgKey="par.lbl.carNo")
})
public class IssueReqVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6300404273163251411L;

    /**
     * 딜러코드
     **/
    @NotEmpty
    private String dlrCd;

    /**
     * 부품요청문서번호
     **/
    private String parReqDocNo = "";

    /**
     * 부품출고유형
     **/
    private String parGiTp = "";

    /**
     * 부품요청상태코드
     **/
    @NotEmpty
    private String parReqStatCd = "";

    /**
     * 준비문서번호
     **/
    @NotEmpty
    private String readyDocNo = "";

    /**
     * 준비상태코드
     **/
    @NotEmpty
    private String readyStatCd = "";

    /**
     * 취소여부
     **/
    private String cancYn = "";

    /**
     * RO일련번호
     **/
    private String roDocNo = "";

    /**
     * RO유형
     **/
    private String roTp = "";

    /**
     * 작업상태코드
     **/
    private String wrkStatCd = "";

    /**
     * 예약문서번호
     **/
    private String resvDocNo = "";

    /**
     * 엔진번호
     **/
    private String enginNo = "";

    /**
     * 센터코드
     **/
    private String pltCd;

    /**
     * 서비스담당자ID
     **/
    private String serPrsnId = "";

    /**
     * 고객코드
     **/
    private String custCd = "";

    /**
     * 고객명
     **/
    private String custNm = "";

    /**
     * 차대번호
     **/
    private String vinNo = "";

    /**
     * 차량번호
     **/
    private String carNo = "";

    /**
     * 차종
     **/
    private String carlineCd = "";

    /**
     * 출고문서번호
     **/
    private String giDocNo = "";

    /**
     * 출고문서유형
     **/
    private String giDocTp = "";

    /**
     * 출고문서상태코드
     **/
    private String giDocStatCd = "";

    /**
     * 출고상태코드
     **/
    private String giStatCd = "";

    /**
     * 차용문서번호
     **/
    private String borrowDocNo = "";

    /**
     * 저장 차용문서번호
     **/
    private String borrowDocNoDb= "";

    /**
     * 차용상태코드
     **/
    private String borrowStatCd = "";

    /**
     * 기타예류문서번호
     **/
    private String etcRvDocNo = "";

    /**
     * 기타예류상태코드
     **/
    private String etcRvStatCd = "";

    /**
     * 수불문서년월일자
     **/
    private  String mvtDocYyMm = "";

    /**
     * 수불문서번호
     **/
    private  String mvtDocNo = "";

    /**
     * RO일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date roDt;

    /**
     * 등록일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;

    /**
     * 수정일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt = null;

    /**
     * 부품요청상세 부품 카운트 수.
     */
    private int itemCnt = 0;

    /**
     * 정비 예약 상태
     * O : 예약접수, F : 예약완성, C : 예약취소, S : 접수대기
     */
    private String resvStatCd = "O";

    /**
     * 정비 RO 공임 상태
     * 01 : 위탁확인, 02 : 수리서비스, 03 : 정산대기, 04 : 정산확인 , 05 : 수납완성, 06 : 취소
     */
    private String roStatCd = "01";

    /**
     * 정비 인도 상태
     * 01 : 대기, 02 : 인도확인, 03 : 취소
     */
    private String dlStatCd = "01";

    /**
     * 선수금(예치금)
     *
     */
    private double preAmt = 0.0;

    /**
     * 부품예약비고
     */
    private String parResvRemark = "";

    /**
     * 부품요청비고
     */
    private String remark = "";

    /**
     * 운전자아이디
     */
    private String driverId = "";

    /**
     * 운전자명
     */
    private String driverNm = "";

    /**
     * 차량소유자아이디
     */
    private String carOwnerId = "";

    /**
     * 차량소유자명
     */
    private String carOwnerNm = "";

    /**
     * 차종명
     */
    private String carlineNm = "";

    /**
     * 모델명칭
     *
     */
    private String modelNm = "";

    /**
     * 누적주행거리
     */
    private double carRunDistVal = 0.0;

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
     * @return the wrkStatCd
     */
    public String getWrkStatCd() {
        return wrkStatCd;
    }

    /**
     * @param wrkStatCd the wrkStatCd to set
     */
    public void setWrkStatCd(String wrkStatCd) {
        this.wrkStatCd = wrkStatCd;
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
     * @return the enginNo
     */
    public String getEnginNo() {
        return enginNo;
    }

    /**
     * @param enginNo the enginNo to set
     */
    public void setEnginNo(String enginNo) {
        this.enginNo = enginNo;
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
     * @return the borrowDocNoDb
     */
    public String getBorrowDocNoDb() {
        return borrowDocNoDb;
    }

    /**
     * @param borrowDocNoDb the borrowDocNoDb to set
     */
    public void setBorrowDocNoDb(String borrowDocNoDb) {
        this.borrowDocNoDb = borrowDocNoDb;
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
     * @return the etcRvDocNo
     */
    public String getEtcRvDocNo() {
        return etcRvDocNo;
    }

    /**
     * @param etcRvDocNo the etcRvDocNo to set
     */
    public void setEtcRvDocNo(String etcRvDocNo) {
        this.etcRvDocNo = etcRvDocNo;
    }

    /**
     * @return the etcRvStatCd
     */
    public String getEtcRvStatCd() {
        return etcRvStatCd;
    }

    /**
     * @param etcRvStatCd the etcRvStatCd to set
     */
    public void setEtcRvStatCd(String etcRvStatCd) {
        this.etcRvStatCd = etcRvStatCd;
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
     * @return the roDt
     */
    public Date getRoDt() {
        return roDt;
    }

    /**
     * @param roDt the roDt to set
     */
    public void setRoDt(Date roDt) {
        this.roDt = roDt;
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
     * @return the itemCnt
     */
    public int getItemCnt() {
        return itemCnt;
    }

    /**
     * @param itemCnt the itemCnt to set
     */
    public void setItemCnt(int itemCnt) {
        this.itemCnt = itemCnt;
    }

    /**
     * @return the resvStatCd
     */
    public String getResvStatCd() {
        return resvStatCd;
    }

    /**
     * @param resvStatCd the resvStatCd to set
     */
    public void setResvStatCd(String resvStatCd) {
        this.resvStatCd = resvStatCd;
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
     * @return the dlStatCd
     */
    public String getDlStatCd() {
        return dlStatCd;
    }

    /**
     * @param dlStatCd the dlStatCd to set
     */
    public void setDlStatCd(String dlStatCd) {
        this.dlStatCd = dlStatCd;
    }

    /**
     * @return the preAmt
     */
    public double getPreAmt() {
        return preAmt;
    }

    /**
     * @param preAmt the preAmt to set
     */
    public void setPreAmt(double preAmt) {
        this.preAmt = preAmt;
    }

    /**
     * @return the parResvRemark
     */
    public String getParResvRemark() {
        return parResvRemark;
    }

    /**
     * @param parResvRemark the parResvRemark to set
     */
    public void setParResvRemark(String parResvRemark) {
        this.parResvRemark = parResvRemark;
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
     * @return the driverId
     */
    public String getDriverId() {
        return driverId;
    }

    /**
     * @param driverId the driverId to set
     */
    public void setDriverId(String driverId) {
        this.driverId = driverId;
    }

    /**
     * @return the driverNm
     */
    public String getDriverNm() {
        return driverNm;
    }

    /**
     * @param driverNm the driverNm to set
     */
    public void setDriverNm(String driverNm) {
        this.driverNm = driverNm;
    }

    /**
     * @return the carOwnerId
     */
    public String getCarOwnerId() {
        return carOwnerId;
    }

    /**
     * @param carOwnerId the carOwnerId to set
     */
    public void setCarOwnerId(String carOwnerId) {
        this.carOwnerId = carOwnerId;
    }

    /**
     * @return the carOwnerNm
     */
    public String getCarOwnerNm() {
        return carOwnerNm;
    }

    /**
     * @param carOwnerNm the carOwnerNm to set
     */
    public void setCarOwnerNm(String carOwnerNm) {
        this.carOwnerNm = carOwnerNm;
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
     * @return the carRunDistVal
     */
    public double getCarRunDistVal() {
        return carRunDistVal;
    }

    /**
     * @param carRunDistVal the carRunDistVal to set
     */
    public void setCarRunDistVal(double carRunDistVal) {
        this.carRunDistVal = carRunDistVal;
    }
}
