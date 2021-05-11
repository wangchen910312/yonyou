package chn.bhmc.dms.bat.crm.cso.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * 판매기회추적
 *
 * @ClassName   : BatSalesOpptTraceMgmtSearchVO
 * @Description : BatSalesOpptTraceMgmtSearchVO
 * @author kyo jin lee
 * @since 2016.03.07.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.07     kyo jin lee      Created First
 * </pre>
 */


public class BatSalesOpptTraceMgmtSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7572580090584543899L;

    /**
     * 딜러코드
     **/
    private  String           sDlrCd;

    /**
     * 일련번호
     **/
    private  String           sSeq;

    /**
     * 판매기회일련번호
     **/
    private  String           sSaleOpptSeq;

    /**
     * 추적내용
     **/
    private  String           sTraceCont;

    /**
     * 추적등급코드
     **/
    private  String           sTraceGradeCd;

    /**
     * 추적일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date             sTraceDt;

    /**
     * 추적방법코드
     **/
    private  String           sTraceMthCd;

    /**
     * 다음추적일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date             sNextTraceDt;

    /**
     * 다음추적방법코드
     **/
    private  String           sNextTraceMthCd;

    /**
     * 유효등급코드
     **/
    private  String           sValidGradeCd;

    /**
     * 무효원인코드
     **/
    private  String           sInvalidCauCd;

    /**
     * 삭제여부
     **/
    private  String           sDelYn;

    /**
     * 등록자ID
     **/
    private  String           sRegUsrId;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date             sRegDt;

    /**
     * 수정자ID
     **/

    private  String           sUpdtUsrId;

    /**
     * 수정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date             sUpdtDt;

    private  String           sLangCd;

    private  String           sCustNo;

    private  String           sAlarmSet;


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
     * @return the sSeq
     */
    public String getsSeq() {
        return sSeq;
    }

    /**
     * @param sSeq the sSeq to set
     */
    public void setsSeq(String sSeq) {
        this.sSeq = sSeq;
    }

    /**
     * @return the sSaleOpptSeq
     */
    public String getsSaleOpptSeq() {
        return sSaleOpptSeq;
    }

    /**
     * @param sSaleOpptSeq the sSaleOpptSeq to set
     */
    public void setsSaleOpptSeq(String sSaleOpptSeq) {
        this.sSaleOpptSeq = sSaleOpptSeq;
    }

    /**
     * @return the sTraceCont
     */
    public String getsTraceCont() {
        return sTraceCont;
    }

    /**
     * @param sTraceCont the sTraceCont to set
     */
    public void setsTraceCont(String sTraceCont) {
        this.sTraceCont = sTraceCont;
    }

    /**
     * @return the sTraceGradeCd
     */
    public String getsTraceGradeCd() {
        return sTraceGradeCd;
    }

    /**
     * @param sTraceGradeCd the sTraceGradeCd to set
     */
    public void setsTraceGradeCd(String sTraceGradeCd) {
        this.sTraceGradeCd = sTraceGradeCd;
    }

    /**
     * @return the sTraceDt
     */
    public Date getsTraceDt() {
        return sTraceDt;
    }

    /**
     * @param sTraceDt the sTraceDt to set
     */
    public void setsTraceDt(Date sTraceDt) {
        this.sTraceDt = sTraceDt;
    }

    /**
     * @return the sTraceMthCd
     */
    public String getsTraceMthCd() {
        return sTraceMthCd;
    }

    /**
     * @param sTraceMthCd the sTraceMthCd to set
     */
    public void setsTraceMthCd(String sTraceMthCd) {
        this.sTraceMthCd = sTraceMthCd;
    }

    /**
     * @return the sNextTraceDt
     */
    public Date getsNextTraceDt() {
        return sNextTraceDt;
    }

    /**
     * @param sNextTraceDt the sNextTraceDt to set
     */
    public void setsNextTraceDt(Date sNextTraceDt) {
        this.sNextTraceDt = sNextTraceDt;
    }

    /**
     * @return the sNextTraceMthCd
     */
    public String getsNextTraceMthCd() {
        return sNextTraceMthCd;
    }

    /**
     * @param sNextTraceMthCd the sNextTraceMthCd to set
     */
    public void setsNextTraceMthCd(String sNextTraceMthCd) {
        this.sNextTraceMthCd = sNextTraceMthCd;
    }

    /**
     * @return the sValidGradeCd
     */
    public String getsValidGradeCd() {
        return sValidGradeCd;
    }

    /**
     * @param sValidGradeCd the sValidGradeCd to set
     */
    public void setsValidGradeCd(String sValidGradeCd) {
        this.sValidGradeCd = sValidGradeCd;
    }

    /**
     * @return the sInvalidCauCd
     */
    public String getsInvalidCauCd() {
        return sInvalidCauCd;
    }

    /**
     * @param sInvalidCauCd the sInvalidCauCd to set
     */
    public void setsInvalidCauCd(String sInvalidCauCd) {
        this.sInvalidCauCd = sInvalidCauCd;
    }

    /**
     * @return the sDelYn
     */
    public String getsDelYn() {
        return sDelYn;
    }

    /**
     * @param sDelYn the sDelYn to set
     */
    public void setsDelYn(String sDelYn) {
        this.sDelYn = sDelYn;
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
     * @return the sLangCd
     */
    public String getsLangCd() {
        return sLangCd;
    }

    /**
     * @param sLangCd the sLangCd to set
     */
    public void setsLangCd(String sLangCd) {
        this.sLangCd = sLangCd;
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
     * @return the sAlarmSet
     */
    public String getsAlarmSet() {
        return sAlarmSet;
    }

    /**
     * @param sAlarmSet the sAlarmSet to set
     */
    public void setsAlarmSet(String sAlarmSet) {
        this.sAlarmSet = sAlarmSet;
    }


}