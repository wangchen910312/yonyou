package chn.bhmc.dms.mob.api.sales.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SumOrderCntSubVO
 * @Description : 클래스 설명을 기술합니다.
 * @author Jin Suk Kim
 * @since 2016. 3. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 14.     Jin Suk Kim     최초 생성
 * </pre>
 */

public class SumOrderCntSubVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2711639633395907912L;

    /**
     *
     */
    private int totCnt;

    /**
     * 주문유형 SAL137
     */
    private String ordTp;

    /**
     * 오더상태명 SAL150
     */
    private String ordStatCd;

    /**
     *주문등록일자
     */
    private String ordDate;

    /**
     *주문자
     */
    private String chrgCd;

    /**
     *주문번호
     */
    private String ordSeq;

    /**
     *영업번호
     */
    private String salesNo;

    /**
     *하치장명  SAL152
     */
    private String vinmVloc;

    /**
     * 납기예정일
     */
    private String fndlDt;

    /**
     * 차종코드
     **/
    private  String carlineCd;

    /**
     * 차종명
     **/
    private  String carlineNm;

    /**
     * 모델코드
     **/
    private  String modelCd;

    /**
     * 모델코드
     **/
    private  String modelNm;

    /**
     * OCN코드
     **/
    private  String ocnCd;

    /**
     * OCN명
     **/
    private  String ocnNm;

    /**
     * 외장색상코드
     **/
    private  String extColorCd;

    /**
     * 외장색상명
     **/
    private  String extColorNm;

    /**
     * 내장색상코드
     **/
    private  String intColorCd;

    /**
     * 내장색상명
     **/
    private  String intColorNm;

    /**
     * PDI배정일
     **/
    private  String pdiDt;

    /**
     * VIN배정일
     **/
    private  String vinDt;

    /**
     * 출고일자
     **/
    private  String retailDt;

    /**
     * VIN NO
     **/
    private  String vinNo;

    private String ordLst;
    private String ordDt;

    private String sOrdSeq;

    private String retailDtStr;
    private String dlrGrDtStr;
    private String custSaleDtStr;

    /**
     * @return the sOrdSeq
     */
    public String getsOrdSeq() {
        return sOrdSeq;
    }

    /**
     * @param sOrdSeq the sOrdSeq to set
     */
    public void setsOrdSeq(String sOrdSeq) {
        this.sOrdSeq = sOrdSeq;
    }

    /**
     * @return the inno
     */
    public String getInno() {
        return inno;
    }

    /**
     * @param inno the inno to set
     */
    public void setInno(String inno) {
        this.inno = inno;
    }

    private  String inno;


    /**
     * @return the ordDt
     */
    public String getOrdDt() {
        return ordDt;
    }

    /**
     * @param ordDt the ordDt to set
     */
    public void setOrdDt(String ordDt) {
        this.ordDt = ordDt;
    }

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   dlrGrDt;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                   custSaleDt;

    /**
     * @return the totCnt
     */
    public int getTotCnt() {
        return totCnt;
    }

    /**
     * @param totCnt the totCnt to set
     */
    public void setTotCnt(int totCnt) {
        this.totCnt = totCnt;
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
     * @return the ordStatCd
     */
    public String getOrdStatCd() {
        return ordStatCd;
    }

    /**
     * @param ordStatCd the ordStatCd to set
     */
    public void setOrdStatCd(String ordStatCd) {
        this.ordStatCd = ordStatCd;
    }

    /**
     * @return the ordDate
     */
    public String getOrdDate() {
        return ordDate;
    }

    /**
     * @param ordDate the ordDate to set
     */
    public void setOrdDate(String ordDate) {
        this.ordDate = ordDate;
    }

    /**
     * @return the chrgCd
     */
    public String getChrgCd() {
        return chrgCd;
    }

    /**
     * @param chrgCd the chrgCd to set
     */
    public void setChrgCd(String chrgCd) {
        this.chrgCd = chrgCd;
    }


    /**
     * @return the ordSeq
     */
    public String getOrdSeq() {
        return ordSeq;
    }

    /**
     * @param ordSeq the ordSeq to set
     */
    public void setOrdSeq(String ordSeq) {
        this.ordSeq = ordSeq;
    }

    /**
     * @return the salesNo
     */
    public String getSalesNo() {
        return salesNo;
    }

    /**
     * @param salesNo the salesNo to set
     */
    public void setSalesNo(String salesNo) {
        this.salesNo = salesNo;
    }

    /**
     * @return the vinmVloc
     */
    public String getVinmVloc() {
        return vinmVloc;
    }

    /**
     * @param vinmVloc the vinmVloc to set
     */
    public void setVinmVloc(String vinmVloc) {
        this.vinmVloc = vinmVloc;
    }

    /**
     * @return the fndlDt
     */
    public String getFndlDt() {
        return fndlDt;
    }

    /**
     * @param fndlDt the fndlDt to set
     */
    public void setFndlDt(String fndlDt) {
        this.fndlDt = fndlDt;
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
     * @return the ocnCd
     */
    public String getOcnCd() {
        return ocnCd;
    }

    /**
     * @param ocnCd the ocnCd to set
     */
    public void setOcnCd(String ocnCd) {
        this.ocnCd = ocnCd;
    }

    /**
     * @return the ocnNm
     */
    public String getOcnNm() {
        return ocnNm;
    }

    /**
     * @param ocnNm the ocnNm to set
     */
    public void setOcnNm(String ocnNm) {
        this.ocnNm = ocnNm;
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
     * @return the extColorNm
     */
    public String getExtColorNm() {
        return extColorNm;
    }

    /**
     * @param extColorNm the extColorNm to set
     */
    public void setExtColorNm(String extColorNm) {
        this.extColorNm = extColorNm;
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
     * @return the intColorNm
     */
    public String getIntColorNm() {
        return intColorNm;
    }

    /**
     * @param intColorNm the intColorNm to set
     */
    public void setIntColorNm(String intColorNm) {
        this.intColorNm = intColorNm;
    }

    /**
     * @return the pdiDt
     */
    public String getPdiDt() {
        return pdiDt;
    }

    /**
     * @param pdiDt the pdiDt to set
     */
    public void setPdiDt(String pdiDt) {
        this.pdiDt = pdiDt;
    }

    /**
     * @return the vinDt
     */
    public String getVinDt() {
        return vinDt;
    }

    /**
     * @param vinDt the vinDt to set
     */
    public void setVinDt(String vinDt) {
        this.vinDt = vinDt;
    }

    /**
     * @return the retailDt
     */
    public String getRetailDt() {
        return retailDt;
    }

    /**
     * @param retailDt the retailDt to set
     */
    public void setRetailDt(String retailDt) {
        this.retailDt = retailDt;
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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    /**
     * @return the dlrGrDt
     */
    public Date getDlrGrDt() {
        return dlrGrDt;
    }

    /**
     * @param dlrGrDt the dlrGrDt to set
     */
    public void setDlrGrDt(Date dlrGrDt) {
        this.dlrGrDt = dlrGrDt;
    }

    /**
     * @return the custSaleDt
     */
    public Date getCustSaleDt() {
        return custSaleDt;
    }

    /**
     * @param custSaleDt the custSaleDt to set
     */
    public void setCustSaleDt(Date custSaleDt) {
        this.custSaleDt = custSaleDt;
    }

    /**
     * @return the ordLst
     */
    public String getOrdLst() {
        return ordLst;
    }

    /**
     * @param ordLst the ordLst to set
     */
    public void setOrdLst(String ordLst) {
        this.ordLst = ordLst;
    }

    /**
     * @return the retailDtStr
     */
    public String getRetailDtStr() {
        return retailDtStr;
    }

    /**
     * @return the dlrGrDtStr
     */
    public String getDlrGrDtStr() {
        return dlrGrDtStr;
    }

    /**
     * @return the custSaleDtStr
     */
    public String getCustSaleDtStr() {
        return custSaleDtStr;
    }

    /**
     * @param retailDtStr the retailDtStr to set
     */
    public void setRetailDtStr(String retailDtStr) {
        this.retailDtStr = retailDtStr;
    }

    /**
     * @param dlrGrDtStr the dlrGrDtStr to set
     */
    public void setDlrGrDtStr(String dlrGrDtStr) {
        this.dlrGrDtStr = dlrGrDtStr;
    }

    /**
     * @param custSaleDtStr the custSaleDtStr to set
     */
    public void setCustSaleDtStr(String custSaleDtStr) {
        this.custSaleDtStr = custSaleDtStr;
    }
}
