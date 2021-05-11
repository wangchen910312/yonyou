package chn.bhmc.dms.mob.api.crm.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustomerRelInfoSearchVO
 * @Description : 고객 연계인 정보를 조회한다.
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



public class CustomerRelInfoSearchVO extends SearchVO {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6019058606642121678L;

    /**
     * 일련번호 (SEQ_CR_0111T_T)
     **/
    // @NotEmpty
    private  int          sSeq;

    /**
     * 연계인고객번호
     **/
    @NotEmpty
    private  String       sPconCustNo;

    /**
     * 상위고객번호
     **/
    //UPPER_CUST_NO
    private  String       sUpperCustNo;

    /**
     * 연계인유형
     **/
    //PCON_TP
    private  String       sPconTp;

    /**
     * 등록자ID
     **/
    @NotEmpty
    private  String       sRegUsrId;

    /**
     * 등록일자
     **/
    //@NotEmpty
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date         sRegDt;

    /**
     * 수정자ID
     **/
    //UPDT_USR_ID
    private  String       sUpdtUsrId;

    /**
     * 수정일자
     **/
    //UPDT_DT
    private  Date         sUpdtDt;

    private  String       sDlrCd;

    private  String       sCustNm;
    private  String       sMathDocTp;
    private  String       sCertiNum;
    private  String       sTelNo;
    private  String       sHpNo;
    private  String       sEmailNm;
    private  String       sPrefCommMthCd;
    private  String       sPrefCommNo;
    private  String       sPrefContactMthCd;
    private  String       sPrefContactTimeCd;

    private  String       sPltCd;
    private  String       sFlagYn;
    private  String       sRelNm;
    private  String       sWechatId;

    /**
     * @return the sSeq
     */
    public int getsSeq() {
        return sSeq;
    }

    /**
     * @param sSeq the sSeq to set
     */
    public void setsSeq(int sSeq) {
        this.sSeq = sSeq;
    }

    /**
     * @return the sPconCustNo
     */
    public String getsPconCustNo() {
        return sPconCustNo;
    }

    /**
     * @param sPconCustNo the sPconCustNo to set
     */
    public void setsPconCustNo(String sPconCustNo) {
        this.sPconCustNo = sPconCustNo;
    }

    /**
     * @return the sUpperCustNo
     */
    public String getsUpperCustNo() {
        return sUpperCustNo;
    }

    /**
     * @param sUpperCustNo the sUpperCustNo to set
     */
    public void setsUpperCustNo(String sUpperCustNo) {
        this.sUpperCustNo = sUpperCustNo;
    }

    /**
     * @return the sPconTp
     */
    public String getsPconTp() {
        return sPconTp;
    }

    /**
     * @param sPconTp the sPconTp to set
     */
    public void setsPconTp(String sPconTp) {
        this.sPconTp = sPconTp;
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
     * @return the sCustNm
     */
    public String getsCustNm() {
        return sCustNm;
    }

    /**
     * @param sCustNm the sCustNm to set
     */
    public void setsCustNm(String sCustNm) {
        this.sCustNm = sCustNm;
    }

    /**
     * @return the sMathDocTp
     */
    public String getsMathDocTp() {
        return sMathDocTp;
    }

    /**
     * @param sMathDocTp the sMathDocTp to set
     */
    public void setsMathDocTp(String sMathDocTp) {
        this.sMathDocTp = sMathDocTp;
    }

    /**
     * @return the sCertiNum
     */
    public String getsCertiNum() {
        return sCertiNum;
    }

    /**
     * @param sCertiNum the sCertiNum to set
     */
    public void setsCertiNum(String sCertiNum) {
        this.sCertiNum = sCertiNum;
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
     * @return the sHpNo
     */
    public String getsHpNo() {
        return sHpNo;
    }

    /**
     * @param sHpNo the sHpNo to set
     */
    public void setsHpNo(String sHpNo) {
        this.sHpNo = sHpNo;
    }

    /**
     * @return the sEmailNm
     */
    public String getsEmailNm() {
        return sEmailNm;
    }

    /**
     * @param sEmailNm the sEmailNm to set
     */
    public void setsEmailNm(String sEmailNm) {
        this.sEmailNm = sEmailNm;
    }

    /**
     * @return the sPrefCommMthCd
     */
    public String getsPrefCommMthCd() {
        return sPrefCommMthCd;
    }

    /**
     * @param sPrefCommMthCd the sPrefCommMthCd to set
     */
    public void setsPrefCommMthCd(String sPrefCommMthCd) {
        this.sPrefCommMthCd = sPrefCommMthCd;
    }

    /**
     * @return the sPrefCommNo
     */
    public String getsPrefCommNo() {
        return sPrefCommNo;
    }

    /**
     * @param sPrefCommNo the sPrefCommNo to set
     */
    public void setsPrefCommNo(String sPrefCommNo) {
        this.sPrefCommNo = sPrefCommNo;
    }

    /**
     * @return the sPrefContactMthCd
     */
    public String getsPrefContactMthCd() {
        return sPrefContactMthCd;
    }

    /**
     * @param sPrefContactMthCd the sPrefContactMthCd to set
     */
    public void setsPrefContactMthCd(String sPrefContactMthCd) {
        this.sPrefContactMthCd = sPrefContactMthCd;
    }

    /**
     * @return the sPrefContactTimeCd
     */
    public String getsPrefContactTimeCd() {
        return sPrefContactTimeCd;
    }

    /**
     * @param sPrefContactTimeCd the sPrefContactTimeCd to set
     */
    public void setsPrefContactTimeCd(String sPrefContactTimeCd) {
        this.sPrefContactTimeCd = sPrefContactTimeCd;
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
     * @return the sFlagYn
     */
    public String getsFlagYn() {
        return sFlagYn;
    }

    /**
     * @param sFlagYn the sFlagYn to set
     */
    public void setsFlagYn(String sFlagYn) {
        this.sFlagYn = sFlagYn;
    }

    /**
     * @return the sRelNm
     */
    public String getsRelNm() {
        return sRelNm;
    }

    /**
     * @param sRelNm the sRelNm to set
     */
    public void setsRelNm(String sRelNm) {
        this.sRelNm = sRelNm;
    }

    /**
     * @return the sWechatId
     */
    public String getsWechatId() {
        return sWechatId;
    }

    /**
     * @param sWechatId the sWechatId to set
     */
    public void setsWechatId(String sWechatId) {
        this.sWechatId = sWechatId;
    }


}
