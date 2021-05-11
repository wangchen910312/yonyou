package chn.bhmc.dms.crm.cmm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CallInfoSearchVO
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


public class CallInfoSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7429119070585795380L;

    /**
     * DLR_CD
     **/

    private  String          sDlrCd;

    /**
     * PLT_CD
     **/

    private  String          sPltCd;

    /**
     * 콜리스트번호
     **/

    private  String          sCallListNo;

    /**
     * 고객번호
     **/

    private  String          sCustNo;

    /**
     * 차대번호1
     **/

    private  String          sVinNo1;

    /**
     * 차대번호2
     **/

    private  String          sVinNo2;

    /**
     * 연락처
     **/

    private  String          sTelNo;

    /**
     * 콜리스트코드 정비(SERVICE), 만족도조사(SURVEY), 캠페인(CAMPAIGN), IDCC리드(IDCCLEAD)
     **/

    private  String          sCallListCd;

    /**
     * 콜리스트요청번호
     **/

    private  String          sCallListReqNo;

    /**
     * 요청부서코드
     **/

    private  String          sReqDeptCd;

    /**
     * 요청사용자ID
     **/

    private  String          sReqUsrId;

    /**
     * 비고
     **/

    private  String          sRemark;

    /**
     * 녹취URL
     **/

    private  String          sRegUrl;

    /**
     * 통화결과 CRM608
     **/

    private  String          sStatCd;

    /**
     * 다음콜일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            sNextCallDt;

    /**
     * 등록자ID
     **/

    private  String          sRegUsrId;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            sRegDt;

    /**
     * 수정자ID
     **/

    private  String          sUpdtUsrId;

    /**
     * 수정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            sUpdtDt;

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
     * @return the sCallListNo
     */
    public String getsCallListNo() {
        return sCallListNo;
    }

    /**
     * @param sCallListNo the sCallListNo to set
     */
    public void setsCallListNo(String sCallListNo) {
        this.sCallListNo = sCallListNo;
    }

    /**
     * @return the sCustNo
     */
    public String getsCustNo() {
        return sCustNo;
    }

    /**
     * @param sCustNo the sCustNo to set
     */
    public void setsCustNo(String sCustNo) {
        this.sCustNo = sCustNo;
    }

    /**
     * @return the sVinNo1
     */
    public String getsVinNo1() {
        return sVinNo1;
    }

    /**
     * @param sVinNo1 the sVinNo1 to set
     */
    public void setsVinNo1(String sVinNo1) {
        this.sVinNo1 = sVinNo1;
    }

    /**
     * @return the sVinNo2
     */
    public String getsVinNo2() {
        return sVinNo2;
    }

    /**
     * @param sVinNo2 the sVinNo2 to set
     */
    public void setsVinNo2(String sVinNo2) {
        this.sVinNo2 = sVinNo2;
    }

    /**
     * @return the sTelNo
     */
    public String getsTelNo() {
        return sTelNo;
    }

    /**
     * @param sTelNo the sTelNo to set
     */
    public void setsTelNo(String sTelNo) {
        this.sTelNo = sTelNo;
    }

    /**
     * @return the sCallListCd
     */
    public String getsCallListCd() {
        return sCallListCd;
    }

    /**
     * @param sCallListCd the sCallListCd to set
     */
    public void setsCallListCd(String sCallListCd) {
        this.sCallListCd = sCallListCd;
    }

    /**
     * @return the sCallListReqNo
     */
    public String getsCallListReqNo() {
        return sCallListReqNo;
    }

    /**
     * @param sCallListReqNo the sCallListReqNo to set
     */
    public void setsCallListReqNo(String sCallListReqNo) {
        this.sCallListReqNo = sCallListReqNo;
    }

    /**
     * @return the sReqDeptCd
     */
    public String getsReqDeptCd() {
        return sReqDeptCd;
    }

    /**
     * @param sReqDeptCd the sReqDeptCd to set
     */
    public void setsReqDeptCd(String sReqDeptCd) {
        this.sReqDeptCd = sReqDeptCd;
    }

    /**
     * @return the sReqUsrId
     */
    public String getsReqUsrId() {
        return sReqUsrId;
    }

    /**
     * @param sReqUsrId the sReqUsrId to set
     */
    public void setsReqUsrId(String sReqUsrId) {
        this.sReqUsrId = sReqUsrId;
    }

    /**
     * @return the sRemark
     */
    public String getsRemark() {
        return sRemark;
    }

    /**
     * @param sRemark the sRemark to set
     */
    public void setsRemark(String sRemark) {
        this.sRemark = sRemark;
    }

    /**
     * @return the sRegUrl
     */
    public String getsRegUrl() {
        return sRegUrl;
    }

    /**
     * @param sRegUrl the sRegUrl to set
     */
    public void setsRegUrl(String sRegUrl) {
        this.sRegUrl = sRegUrl;
    }

    /**
     * @return the sStatCd
     */
    public String getsStatCd() {
        return sStatCd;
    }

    /**
     * @param sStatCd the sStatCd to set
     */
    public void setsStatCd(String sStatCd) {
        this.sStatCd = sStatCd;
    }

    /**
     * @return the sNextCallDt
     */
    public Date getsNextCallDt() {
        return sNextCallDt;
    }

    /**
     * @param sNextCallDt the sNextCallDt to set
     */
    public void setsNextCallDt(Date sNextCallDt) {
        this.sNextCallDt = sNextCallDt;
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
     * @return the sUpdtDt
     */
    public Date getsUpdtDt() {
        return sUpdtDt;
    }

    /**
     * @param sUpdtDt the sUpdtDt to set
     */
    public void setsUpdtDt(Date sUpdtDt) {
        this.sUpdtDt = sUpdtDt;
    }



}
