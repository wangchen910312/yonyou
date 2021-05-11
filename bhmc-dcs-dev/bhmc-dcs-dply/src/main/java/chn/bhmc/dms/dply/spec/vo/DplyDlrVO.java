package chn.bhmc.dms.dply.spec.vo;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DplyDlrVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 4. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 11.     Kang Seok Han     최초 생성
 * </pre>
 */

public class DplyDlrVO extends BaseVO implements Serializable {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7002349268026719682L;


    /** SPEC코드               **/
    private String specCd                ;

    /** DEPLOY버전번호         **/
    private String deployVerNo           ;

    /** DEPLOY그룹ID           **/
    private String deployGrpId           ;

    /** 딜러코드               **/
    private String dlrCd                 ;

    /** 딜러명               **/
    private String dlrNm                 ;

    /** DEPLOY제외여부         **/
    private String deployExcpYn          ;

    /** DEPLOY제외사유내용     **/
    private String deployExcpReasonCont  ;

    /** 등록자ID               **/
    private String regUsrId              ;

    /** 등록일자               **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt                   ;

    /** 수정자ID               **/
    private String updtUsrId             ;

    /** 수정일자               **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt                  ;

    /** DEPLOY처리횟수         **/
    private int deployProcCnt         ;

    /** 최종DEPLOY처리일자     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date lastDeployProcDt        ;

    /** DEPLOY요청완료여부     **/
    private String deployReqEndYn        ;


    /** DEPLOY 결과 코드     **/
    private String deployRsltCd          ;



    /**
     * @param specCd the specCd to set
     */
    public void setSpecCd(String specCd) {
        this.specCd = specCd;
    }

    /**
     * @return the specCd
     */
    public String getSpecCd() {
        return specCd;
    }

    /**
     * @param deployVerNo the deployVerNo to set
     */
    public void setDeployVerNo(String deployVerNo) {
        this.deployVerNo = deployVerNo;
    }

    /**
     * @return the deployVerNo
     */
    public String getDeployVerNo() {
        return deployVerNo;
    }

    /**
     * @param deployGrpId the deployGrpId to set
     */
    public void setDeployGrpId(String deployGrpId) {
        this.deployGrpId = deployGrpId;
    }

    /**
     * @return the deployGrpId
     */
    public String getDeployGrpId() {
        return deployGrpId;
    }

    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }

    /**
     * @param deployExcpYn the deployExcpYn to set
     */
    public void setDeployExcpYn(String deployExcpYn) {
        this.deployExcpYn = deployExcpYn;
    }

    /**
     * @return the deployExcpYn
     */
    public String getDeployExcpYn() {
        return deployExcpYn;
    }

    /**
     * @param deployExcpReasonCont the deployExcpReasonCont to set
     */
    public void setDeployExcpReasonCont(String deployExcpReasonCont) {
        this.deployExcpReasonCont = deployExcpReasonCont;
    }

    /**
     * @return the deployExcpReasonCont
     */
    public String getDeployExcpReasonCont() {
        return deployExcpReasonCont;
    }

    /**
     * @param deployProcCnt the deployProcCnt to set
     */
    public void setDeployProcCnt(int deployProcCnt) {
        this.deployProcCnt = deployProcCnt;
    }

    /**
     * @return the deployProcCnt
     */
    public int getDeployProcCnt() {
        return deployProcCnt;
    }

    /**
     * @param lastDeployProcDt the lastDeployProcDt to set
     */
    public void setLastDeployProcDt(Date lastDeployProcDt) {
        this.lastDeployProcDt = lastDeployProcDt;
    }

    /**
     * @return the lastDeployProcDt
     */
    public Date getLastDeployProcDt() {
        return lastDeployProcDt;
    }

    /**
     * @param deployReqEndYn the deployReqEndYn to set
     */
    public void setDeployReqEndYn(String deployReqEndYn) {
        this.deployReqEndYn = deployReqEndYn;
    }

    /**
     * @return the deployReqEndYn
     */
    public String getDeployReqEndYn() {
        return deployReqEndYn;
    }

    /**
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
    }

    /**
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }

    /**
     * @param regDt the regDt to set
     */
    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }

    /**
     * @return the regDt
     */
    public Date getRegDt() {
        return regDt;
    }

    /**
     * @param updtUsrId the updtUsrId to set
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
    }

    /**
     * @return the updtUsrId
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }
    /**
     * @param updtDt the updtDt to set
     */
    public void setUpdtDt(Date updtDt) {
        this.updtDt = updtDt;
    }

    /**
     * @return the updtDt
     */
    public Date getUpdtDt() {
        return updtDt;
    }

    /**
     * @param dlrNm the dlrNm to set
     */
    public void setDlrNm(String dlrNm) {
        this.dlrNm = dlrNm;
    }

    /**
     * @return the dlrNm
     */
    public String getDlrNm() {
        return dlrNm;
    }

    /**
     * @param deployRsltCd the deployRsltCd to set
     */
    public void setDeployRsltCd(String deployRsltCd) {
        this.deployRsltCd = deployRsltCd;
    }

    /**
     * @return the deployRsltCd
     */
    public String getDeployRsltCd() {
        return deployRsltCd;
    }

}
