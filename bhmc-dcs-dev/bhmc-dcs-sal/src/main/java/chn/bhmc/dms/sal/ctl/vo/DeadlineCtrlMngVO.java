package chn.bhmc.dms.sal.ctl.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DeadlineCtrlMngVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author kim yewon
 * @since 2016. 4. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 28.     Kim yewon             최초 생성
 *
 * </pre>
 */

public class DeadlineCtrlMngVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

    private String auctPk;
    //HEAD
    private String ctrlSeq;                                 //통제일련번호
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   ctrlStartYyMmDt;                         //통제시작년월일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date   ctrlEndYyMmDt;                           //통제종료년월일자
    private String ctrlGrpCd;                               //통제그룹코드
    private String ctrlTargCd;                              //통제대상코드
    private String dlrCtrlRangeCd;                          //딜러통제범위코드
    private String ctrlYn;                                  //통제여부
    private String remark;                                  //비고
    private String regUsrId;                                //등록자ID
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;                                     //등록일자
    private String updtUsrId;                               //수정자ID
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;                                    //수정일자
    private String ctrlPk;                                  //년월+그룹+대상 pk값


    //DETAIL
    private String ctrlDlrCd;                               //통제딜러코드
    private String ctrlDlrNm;                               //통제딜러명
    private String ctrlDetailPk;                            //년월+그룹+대상+딜러 pk값




    /**
     * @return the ctrlStartYyMmDt
     */
    public Date getCtrlStartYyMmDt() {
        return ctrlStartYyMmDt;
    }

    /**
     * @param ctrlStartYyMmDt the ctrlStartYyMmDt to set
     */
    public void setCtrlStartYyMmDt(Date ctrlStartYyMmDt) {
        this.ctrlStartYyMmDt = ctrlStartYyMmDt;
    }

    /**
     * @return the ctrlEndYyMmDt
     */
    public Date getCtrlEndYyMmDt() {
        return ctrlEndYyMmDt;
    }

    /**
     * @param ctrlEndYyMmDt the ctrlEndYyMmDt to set
     */
    public void setCtrlEndYyMmDt(Date ctrlEndYyMmDt) {
        this.ctrlEndYyMmDt = ctrlEndYyMmDt;
    }

    /**
     * @return the ctrlSeq
     */
    public String getCtrlSeq() {
        return ctrlSeq;
    }

    /**
     * @param ctrlSeq the ctrlSeq to set
     */
    public void setCtrlSeq(String ctrlSeq) {
        this.ctrlSeq = ctrlSeq;
    }

    /**
     * @return the auctPk
     */
    public String getAuctPk() {
        return auctPk;
    }

    /**
     * @param auctPk the auctPk to set
     */
    public void setAuctPk(String auctPk) {
        this.auctPk = auctPk;
    }

    /**
     * @return the updtUsrId
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }

    /**
     * @param updtUsrId the updtUsrId to set
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
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
     * @return the ctrlDlrCd
     */
    public String getCtrlDlrCd() {
        return ctrlDlrCd;
    }

    /**
     * @param ctrlDlrCd the ctrlDlrCd to set
     */
    public void setCtrlDlrCd(String ctrlDlrCd) {
        this.ctrlDlrCd = ctrlDlrCd;
    }

    /**
     * @return the ctrlDlrNm
     */
    public String getCtrlDlrNm() {
        return ctrlDlrNm;
    }

    /**
     * @param ctrlDlrNm the ctrlDlrNm to set
     */
    public void setCtrlDlrNm(String ctrlDlrNm) {
        this.ctrlDlrNm = ctrlDlrNm;
    }

    /**
     * @return the ctrlDetailPk
     */
    public String getCtrlDetailPk() {
        return ctrlDetailPk;
    }

    /**
     * @param ctrlDetailPk the ctrlDetailPk to set
     */
    public void setCtrlDetailPk(String ctrlDetailPk) {
        this.ctrlDetailPk = ctrlDetailPk;
    }

    /**
     * @return the ctrlGrpCd
     */
    public String getCtrlGrpCd() {
        return ctrlGrpCd;
    }

    /**
     * @param ctrlGrpCd the ctrlGrpCd to set
     */
    public void setCtrlGrpCd(String ctrlGrpCd) {
        this.ctrlGrpCd = ctrlGrpCd;
    }

    /**
     * @return the ctrlTargCd
     */
    public String getCtrlTargCd() {
        return ctrlTargCd;
    }

    /**
     * @param ctrlTargCd the ctrlTargCd to set
     */
    public void setCtrlTargCd(String ctrlTargCd) {
        this.ctrlTargCd = ctrlTargCd;
    }

    /**
     * @return the dlrCtrlRangeCd
     */
    public String getDlrCtrlRangeCd() {
        return dlrCtrlRangeCd;
    }

    /**
     * @param dlrCtrlRangeCd the dlrCtrlRangeCd to set
     */
    public void setDlrCtrlRangeCd(String dlrCtrlRangeCd) {
        this.dlrCtrlRangeCd = dlrCtrlRangeCd;
    }

    /**
     * @return the ctrlYn
     */
    public String getCtrlYn() {
        return ctrlYn;
    }

    /**
     * @param ctrlYn the ctrlYn to set
     */
    public void setCtrlYn(String ctrlYn) {
        this.ctrlYn = ctrlYn;
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
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }

    /**
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
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
     * @return the ctrlPk
     */
    public String getCtrlPk() {
        return ctrlPk;
    }

    /**
     * @param ctrlPk the ctrlPk to set
     */
    public void setCtrlPk(String ctrlPk) {
        this.ctrlPk = ctrlPk;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }


}
