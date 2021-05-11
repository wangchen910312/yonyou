package chn.bhmc.dms.crm.cmm.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CallInfoVO.java.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kyo Jin Lee
 * @since 2016. 1. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Kyo Jin Lee     최초 생성
 * </pre>
 */


public class CallInfoVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 440218569093690269L;


    private String          dlrCd;
    private String          pltCd;
    /**
     * 콜리스트번호
     **/
    private  String          callListNo;

    /**
     * 고객번호
     **/
    //CUST_NO
    private  String          custNo;

    /**
     * 차대번호1
     **/
    //VIN_NO1
    private  String          vinNo1;

    /**
     * 차대번호2
     **/
    //VIN_NO2
    private  String          vinNo2;

    /**
     * 연락처
     **/
    //TEL_NO
    private  String          telNo;

    /**
     * 콜리스트코드 정비(SERVICE), 만족도조사(SURVEY), 캠페인(CAMPAIGN), IDCC리드(IDCCLEAD)
     **/
    //CALL_LIST_CD
    private  String          callListCd;

    /**
     * 콜리스트요청번호
     **/
    //CALL_LIST_REQ_NO
    private  String          callListReqNo;

    /**
     * 요청부서코드
     **/
    //REQ_DEPT_CD
    private  String          reqDeptCd;

    /**
     * 요청사용자ID
     **/
    //REQ_USR_ID
    private  String          reqUsrId;

    /**
     * 비고
     **/
    //REMARK
    private  String          remark;

    /**
     * 녹취URL
     **/
    //REG_URL
    private  String          regUrl;

    /**
     * 통화결과 CRM608
     **/
    //STAT_CD
    private  String          statCd;

    /**
     * 다음콜일자
     **/
    //NEXT_CALL_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            nextCallDt;

    /**
     * 등록자ID
     **/
    @NotEmpty
    private  String          regUsrId;

    /**
     * 등록일자
     **/
    private  Date            regDt;

    /**
     * 수정자ID
     **/
    //UPDT_USR_ID
    private  String          updtUsrId;

    /**
     * 수정일자
     **/
    //UPDT_DT
    private  Date            updtDt;

    /**
     * @return the callListNo
     */
    public String getCallListNo() {
        return callListNo;
    }

    /**
     * @param callListNo the callListNo to set
     */
    public void setCallListNo(String callListNo) {
        this.callListNo = callListNo;
    }

    /**
     * @return the custNo
     */
    public String getCustNo() {
        return custNo;
    }

    /**
     * @param custNo the custNo to set
     */
    public void setCustNo(String custNo) {
        this.custNo = custNo;
    }

    /**
     * @return the vinNo1
     */
    public String getVinNo1() {
        return vinNo1;
    }

    /**
     * @param vinNo1 the vinNo1 to set
     */
    public void setVinNo1(String vinNo1) {
        this.vinNo1 = vinNo1;
    }

    /**
     * @return the vinNo2
     */
    public String getVinNo2() {
        return vinNo2;
    }

    /**
     * @param vinNo2 the vinNo2 to set
     */
    public void setVinNo2(String vinNo2) {
        this.vinNo2 = vinNo2;
    }

    /**
     * @return the telNo
     */
    public String getTelNo() {
        return telNo;
    }

    /**
     * @param telNo the telNo to set
     */
    public void setTelNo(String telNo) {
        this.telNo = telNo;
    }

    /**
     * @return the callListCd
     */
    public String getCallListCd() {
        return callListCd;
    }

    /**
     * @param callListCd the callListCd to set
     */
    public void setCallListCd(String callListCd) {
        this.callListCd = callListCd;
    }

    /**
     * @return the callListReqNo
     */
    public String getCallListReqNo() {
        return callListReqNo;
    }

    /**
     * @param callListReqNo the callListReqNo to set
     */
    public void setCallListReqNo(String callListReqNo) {
        this.callListReqNo = callListReqNo;
    }

    /**
     * @return the reqDeptCd
     */
    public String getReqDeptCd() {
        return reqDeptCd;
    }

    /**
     * @param reqDeptCd the reqDeptCd to set
     */
    public void setReqDeptCd(String reqDeptCd) {
        this.reqDeptCd = reqDeptCd;
    }

    /**
     * @return the reqUsrId
     */
    public String getReqUsrId() {
        return reqUsrId;
    }

    /**
     * @param reqUsrId the reqUsrId to set
     */
    public void setReqUsrId(String reqUsrId) {
        this.reqUsrId = reqUsrId;
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
     * @return the regUrl
     */
    public String getRegUrl() {
        return regUrl;
    }

    /**
     * @param regUrl the regUrl to set
     */
    public void setRegUrl(String regUrl) {
        this.regUrl = regUrl;
    }

    /**
     * @return the statCd
     */
    public String getStatCd() {
        return statCd;
    }

    /**
     * @param statCd the statCd to set
     */
    public void setStatCd(String statCd) {
        this.statCd = statCd;
    }

    /**
     * @return the nextCallDt
     */
    public Date getNextCallDt() {
        return nextCallDt;
    }

    /**
     * @param nextCallDt the nextCallDt to set
     */
    public void setNextCallDt(Date nextCallDt) {
        this.nextCallDt = nextCallDt;
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


}
