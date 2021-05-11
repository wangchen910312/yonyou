package chn.bhmc.dms.mob.api.crm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 판매기회 이력 조회
 *
 * @ClassName   : SalesOpptProcessMgmtHistSearchVO
 * @Description : SalesOpptProcessMgmtHistSearchVO
 * @author in moon lee
 * @since 2016.03.07.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.07.     in moon lee     최초 생성
 * </pre>
 */

public class SalesOpptProcessMgmtHistSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3310897330861924913L;

    /**
     * 딜러코드
     **/
    private String sDlrCd;

    /**
     * 일련번호
     **/
    private String sSeq;

    /**
     * 판매기회일련번호
     **/
    private String sSaleOpptSeq;

    /**
     * 리드상태내용
     **/
    private String sLeadStatCont;

    /**
     * 담당자ID
     **/
    private String sMngScId;

    /**
     * 시스템메시지내용
     **/
    private String sSysMesgCont;

    /**
     * 등록자ID
     **/
    private String sRegUsrId;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRegDt;

    /**
     * 수정자ID
     **/
    private String sUpdtUsrId;

    /**
     * 수정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sUpdtDt;

    private String sLangCd;

    private String sBefLeadStatCd;
    private String sLeadStatCd;
    private String sBefMngScId;

    private String sCustNo;

    /**
     * 예약판매번호
     * BEFORE_NO
     */
    private String sBeforeNo;

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
     * @return the sLeadStatCont
     */
    public String getsLeadStatCont() {
        return sLeadStatCont;
    }

    /**
     * @param sLeadStatCont the sLeadStatCont to set
     */
    public void setsLeadStatCont(String sLeadStatCont) {
        this.sLeadStatCont = sLeadStatCont;
    }

    /**
     * @return the sMngScId
     */
    public String getsMngScId() {
        return sMngScId;
    }

    /**
     * @param sMngScId the sMngScId to set
     */
    public void setsMngScId(String sMngScId) {
        this.sMngScId = sMngScId;
    }

    /**
     * @return the sSysMesgCont
     */
    public String getsSysMesgCont() {
        return sSysMesgCont;
    }

    /**
     * @param sSysMesgCont the sSysMesgCont to set
     */
    public void setsSysMesgCont(String sSysMesgCont) {
        this.sSysMesgCont = sSysMesgCont;
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
     * @return the sBefLeadStatCd
     */
    public String getsBefLeadStatCd() {
        return sBefLeadStatCd;
    }

    /**
     * @param sBefLeadStatCd the sBefLeadStatCd to set
     */
    public void setsBefLeadStatCd(String sBefLeadStatCd) {
        this.sBefLeadStatCd = sBefLeadStatCd;
    }

    /**
     * @return the sLeadStatCd
     */
    public String getsLeadStatCd() {
        return sLeadStatCd;
    }

    /**
     * @param sLeadStatCd the sLeadStatCd to set
     */
    public void setsLeadStatCd(String sLeadStatCd) {
        this.sLeadStatCd = sLeadStatCd;
    }

    /**
     * @return the sBefMngScId
     */
    public String getsBefMngScId() {
        return sBefMngScId;
    }

    /**
     * @param sBefMngScId the sBefMngScId to set
     */
    public void setsBefMngScId(String sBefMngScId) {
        this.sBefMngScId = sBefMngScId;
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
     * @return the sBeforeNo
     */
    public String getsBeforeNo() {
        return sBeforeNo;
    }

    /**
     * @param sBeforeNo the sBeforeNo to set
     */
    public void setsBeforeNo(String sBeforeNo) {
        this.sBeforeNo = sBeforeNo;
    }




}