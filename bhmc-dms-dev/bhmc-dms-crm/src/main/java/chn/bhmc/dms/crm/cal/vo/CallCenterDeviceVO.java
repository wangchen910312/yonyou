package chn.bhmc.dms.crm.cal.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * 콜센터 전화 상태 VO
 *
 * @ClassName   : CallCenterStatusVO.java
 * @Description : CallCenterStatusVO Class
 * @author in moon lee
 * @since 2016.11.08.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.11.08     in moon lee     최초 생성
 * </pre>
 */

@ValidDescriptor({

     @ValidField(field="dlrCd"              , mesgKey="crm.lbl.dlrCd")
    ,@ValidField(field="callHisSeq"         , mesgKey="crm.lbl.callHisSeq")
    ,@ValidField(field="callStatCd"         , mesgKey="crm.lbl.callStatCd")
    ,@ValidField(field="callHisLineNo"      , mesgKey="crm.lbl.callHisLineNo")
    ,@ValidField(field="callDeviceId"       , mesgKey="crm.lbl.callDeviceId")
    ,@ValidField(field="callDeviceIpNo"     , mesgKey="crm.lbl.callDeviceIpNo")
    ,@ValidField(field="callDevicePortVal"  , mesgKey="crm.lbl.callDevicePortVal")
    ,@ValidField(field="callTelNo"          , mesgKey="crm.lbl.callTelNo")
    ,@ValidField(field="callRingCnt"        , mesgKey="crm.lbl.callRingCnt")
    ,@ValidField(field="callPassHm"         , mesgKey="crm.lbl.callPassHm")
    ,@ValidField(field="callHm"             , mesgKey="crm.lbl.callHm")
    ,@ValidField(field="callFileNm"         , mesgKey="crm.lbl.callFileNm")
    ,@ValidField(field="callStartDt"        , mesgKey="crm.lbl.callStartDt")
    ,@ValidField(field="regUsrId"           , mesgKey="crm.lbl.regUsrId")
    ,@ValidField(field="regDt"              , mesgKey="crm.lbl.regDt")
    ,@ValidField(field="updtUsrId"          , mesgKey="crm.lbl.updtUsrId")
    ,@ValidField(field="updtDt"             , mesgKey="crm.lbl.updtDt")

})

public class CallCenterDeviceVO extends BaseVO {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -8032966107844159388L;


    private  boolean             isCallDevicePc = false;    // 전화 응답 PC와 콜센터 PC와 동일한 아이피 인지 확인.

    /**
     * 딜러코드
     **/
    private  String              dlrCd;

    private  String              callOBSeq;         //EXE 보내는 obSeq
    private  String              callIBSeq;         //EXE 보내는 ibSeq


    /**
     * 콜이력일련번호
     **/
    private  int                 callHisSeq;
    private  int                 callHisInitSeq;

    /**
     * 콜상태코드
     **/
    private  String              callStatCd;

    /**
     * 콜이력라인번호
     **/
    private  int                 callHisLineNo;

    /**
     * 콜디바이스ID
     **/
    private  String              callDeviceId;
    private  String              callDevicePcId;

    /**
     * 콜디바이스IP번호
     **/
    private  String              callDeviceIpNo;
    private  String              callDevicePcIpNo;

    /**
     * 콜디바이스포트값
     **/
    private  int                 callDevicePortVal;

    /**
     * 콜전화번호
     **/
    private  String              callTelNo;

    /**
     * 콜링횟수
     **/
    private  int                 callRingCnt;

    /**
     * 콜경과시간
     **/
    private  String              callPassHm;

    /**
     * 콜시간
     **/
    private  String              callHm;

    /**
     * 콜파일명
     **/
    private  String              callFileNm;
    
    /**
     * 콜센터 담당자 화면 ID
     **/
    private  String              callViewId;

    /**
     * 콜시작일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                callStartDt;

    /**
     * 콜디바이스 ID
     **/
    private  String              userId;

    /**
     * @return the isCallDevicePc
     */
    public boolean isCallDevicePc() {
        return isCallDevicePc;
    }

    /**
     * @param isCallDevicePc the isCallDevicePc to set
     */
    public void setCallDevicePc(boolean isCallDevicePc) {
        this.isCallDevicePc = isCallDevicePc;
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
     * @return the callHisSeq
     */
    public int getCallHisSeq() {
        return callHisSeq;
    }

    /**
     * @param callHisSeq the callHisSeq to set
     */
    public void setCallHisSeq(int callHisSeq) {
        this.callHisSeq = callHisSeq;
    }

    /**
     * @return the callHisInitSeq
     */
    public int getCallHisInitSeq() {
        return callHisInitSeq;
    }

    /**
     * @param callHisInitSeq the callHisInitSeq to set
     */
    public void setCallHisInitSeq(int callHisInitSeq) {
        this.callHisInitSeq = callHisInitSeq;
    }

    /**
     * @return the callStatCd
     */
    public String getCallStatCd() {
        return callStatCd;
    }

    /**
     * @param callStatCd the callStatCd to set
     */
    public void setCallStatCd(String callStatCd) {
        this.callStatCd = callStatCd;
    }

    /**
     * @return the callHisLineNo
     */
    public int getCallHisLineNo() {
        return callHisLineNo;
    }

    /**
     * @param callHisLineNo the callHisLineNo to set
     */
    public void setCallHisLineNo(int callHisLineNo) {
        this.callHisLineNo = callHisLineNo;
    }

    /**
     * @return the callDeviceId
     */
    public String getCallDeviceId() {
        return callDeviceId;
    }

    /**
     * @param callDeviceId the callDeviceId to set
     */
    public void setCallDeviceId(String callDeviceId) {
        this.callDeviceId = callDeviceId;
    }

    /**
     * @return the callDevicePcId
     */
    public String getCallDevicePcId() {
        return callDevicePcId;
    }

    /**
     * @param callDevicePcId the callDevicePcId to set
     */
    public void setCallDevicePcId(String callDevicePcId) {
        this.callDevicePcId = callDevicePcId;
    }

    /**
     * @return the callDeviceIpNo
     */
    public String getCallDeviceIpNo() {
        return callDeviceIpNo;
    }

    /**
     * @param callDeviceIpNo the callDeviceIpNo to set
     */
    public void setCallDeviceIpNo(String callDeviceIpNo) {
        this.callDeviceIpNo = callDeviceIpNo;
    }

    /**
     * @return the callDevicePcIpNo
     */
    public String getCallDevicePcIpNo() {
        return callDevicePcIpNo;
    }

    /**
     * @param callDevicePcIpNo the callDevicePcIpNo to set
     */
    public void setCallDevicePcIpNo(String callDevicePcIpNo) {
        this.callDevicePcIpNo = callDevicePcIpNo;
    }

    /**
     * @return the callDevicePortVal
     */
    public int getCallDevicePortVal() {
        return callDevicePortVal;
    }

    /**
     * @param callDevicePortVal the callDevicePortVal to set
     */
    public void setCallDevicePortVal(int callDevicePortVal) {
        this.callDevicePortVal = callDevicePortVal;
    }

    /**
     * @return the callTelNo
     */
    public String getCallTelNo() {
        return callTelNo;
    }

    /**
     * @param callTelNo the callTelNo to set
     */
    public void setCallTelNo(String callTelNo) {
        this.callTelNo = callTelNo;
    }

    /**
     * @return the callRingCnt
     */
    public int getCallRingCnt() {
        return callRingCnt;
    }

    /**
     * @param callRingCnt the callRingCnt to set
     */
    public void setCallRingCnt(int callRingCnt) {
        this.callRingCnt = callRingCnt;
    }

    /**
     * @return the callPassHm
     */
    public String getCallPassHm() {
        return callPassHm;
    }

    /**
     * @param callPassHm the callPassHm to set
     */
    public void setCallPassHm(String callPassHm) {
        this.callPassHm = callPassHm;
    }

    /**
     * @return the callHm
     */
    public String getCallHm() {
        return callHm;
    }

    /**
     * @param callHm the callHm to set
     */
    public void setCallHm(String callHm) {
        this.callHm = callHm;
    }

    /**
     * @return the callFileNm
     */
    public String getCallFileNm() {
        return callFileNm;
    }

    /**
     * @param callFileNm the callFileNm to set
     */
    public void setCallFileNm(String callFileNm) {
        this.callFileNm = callFileNm;
    }

    /**
     * @return the callStartDt
     */
    public Date getCallStartDt() {
        return callStartDt;
    }

    /**
     * @param callStartDt the callStartDt to set
     */
    public void setCallStartDt(Date callStartDt) {
        this.callStartDt = callStartDt;
    }

    /**
     * @return the callOBSeq
     */
    public String getCallOBSeq() {
        return callOBSeq;
    }

    /**
     * @param callOBSeq the callOBSeq to set
     */
    public void setCallOBSeq(String callOBSeq) {
        this.callOBSeq = callOBSeq;
    }

    /**
     * @return the callIBSeq
     */
    public String getCallIBSeq() {
        return callIBSeq;
    }

    /**
     * @param callIBSeq the callIBSeq to set
     */
    public void setCallIBSeq(String callIBSeq) {
        this.callIBSeq = callIBSeq;
    }
    
    

    /**
     * @return the callViewId
     */
    public String getCallViewId() {
        return callViewId;
    }

    /**
     * @param callViewId the callViewId to set
     */
    public void setCallViewId(String callViewId) {
        this.callViewId = callViewId;
    }

    /**
     * @return the userId
     */
    public String getUserId() {
        return userId;
    }

    /**
     * @param userId the userId to set
     */
    public void setUserId(String userId) {
        this.userId = userId;
    }

}