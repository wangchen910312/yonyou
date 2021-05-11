package chn.bhmc.dms.crm.cso.vo;

import java.util.Date;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * 영업 스케쥴  VO
 *
 * @ClassName   : SalesActiveVO.java
 * @Description : SalesActiveVO Class
 * @author in moon lee
 * @since 2016.04.27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.04.27     in moon lee     최초 생성
 * </pre>
 */

@ValidDescriptor({

     @ValidField(field="dlrCd"              , mesgKey="global.lbl.dlrCd")               // 딜러코드
    ,@ValidField(field="salesActiveNo"      , mesgKey="crm.lbl.salesActiveNo")          // 영업활동번호
    ,@ValidField(field="custNo"             , mesgKey="global.lbl.custNo")              // 고객번호
    ,@ValidField(field="prefCommNo"         , mesgKey="global.lbl.prefCommNo")          // 선호연락처
    ,@ValidField(field="pconCustNo"         , mesgKey="crm.lbl.pconCustNo")             // 연계인고객번호
    ,@ValidField(field="pconPrefCommNo"     , mesgKey="crm.lbl.pconPrefCommNo")         // 연계인선호연락번호
    ,@ValidField(field="commMthCd"          , mesgKey="crm.lbl.commMthCd")              // 연락방식
    ,@ValidField(field="salesActiveTpCd"    , mesgKey="crm.lbl.salesActiveTpCd")      // 영업활동유형
    ,@ValidField(field="salesActiveStatCd"  , mesgKey="crm.lbl.salesActiveStatCd")      // 영업활동상태
    ,@ValidField(field="planStartDt"        , mesgKey="crm.lbl.planStartDt")            // 계획시작일자
    ,@ValidField(field="planEndDt"          , mesgKey="crm.lbl.planEndDt")              // 계획종료일자
    ,@ValidField(field="activeStartDt"      , mesgKey="global.lbl.startDt")             // 시작일
    ,@ValidField(field="activeEndDt"        , mesgKey="global.lbl.endDt")               // 종료일자
    ,@ValidField(field="scId"               , mesgKey="crm.lbl.scId")                   // 판매고문
    ,@ValidField(field="saleOpptNo"         , mesgKey="global.lbl.saleOpptSeq")         // 판매기회번호
    ,@ValidField(field="activeCont"         , mesgKey="crm.lbl.activeCont")             // 활동내용
    ,@ValidField(field="activeRsltCont"     , mesgKey="global.lbl.activeRsltCont")      // 활동결과
    ,@ValidField(field="guideCmmtCont"      , mesgKey="crm.lbl.guideCmmtCont")          // 지도평어내용
    ,@ValidField(field="mngId"              , mesgKey="crm.lbl.mngId")                  // 관리ID
    ,@ValidField(field="regUsrId"           , mesgKey="global.lbl.regUsrId")            // 등록자
    ,@ValidField(field="regDt"              , mesgKey="global.lbl.regDt")               // 등록일
    ,@ValidField(field="updtUsrId"          , mesgKey="global.lbl.updtUsrId")           // 수정자
    ,@ValidField(field="updtDt"             , mesgKey="global.lbl.updtDt")              // 수정일


})

public class SalesActiveVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7340524612443656237L;

    /**
     * 딜러코드
     **/
    private  String              dlrCd;

    /**
     * 영업활동번호
     **/
    private  String              salesActiveNo;

    /**
     * 고객번호
     **/
    @NotEmpty
    private  String              custNo;

    /**
     * 선호연락번호
     **/
    @NotEmpty
    private  String              prefCommNo;

    /**
     * 연계인고객번호
     **/
    private  String              pconCustNo;

    /**
     * 연계인선호연락번호
     **/
    private  String              pconPrefCommNo;

    /**
     * 연락방식코드
     **/
    @NotEmpty
    private  String              commMthCd;

    /**
     * 영업활동유형코드
     **/
    @NotEmpty
    private  String              salesActiveTpCd;

    /**
     * 영업활동상태코드
     **/
    @NotEmpty
    private  String              salesActiveStatCd;

    /**
     * 계획시작일자
     **/
    @NotNull
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                planStartDt;

    /**
     * 계획종료일자
     **/
    @NotNull
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                planEndDt;

    /**
     * 시작일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                activeStartDt;

    /**
     * 종료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                activeEndDt;

    /**
     * SCID
     **/
    @NotEmpty
    private  String              scId;

    /**
     * 판매기회번호
     **/
    private  String              saleOpptNo;

    /**
     * 활동내용
     **/
    @NotEmpty
    private  String              activeCont;

    /**
     * 활동결과내용
     **/
    private  String              activeRsltCont;

    /**
     * 지도평어내용
     **/
    private  String              guideCmmtCont;

    /**
     * 관리ID
     **/
    private  String              mngId;

    /**
     * 등록자ID
     **/
    private  String              regUsrId;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                regDt;

    /**
     * 수정자ID
     **/
    private  String              updtUsrId;

    /**
     * 수정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                updtDt;


    // 판매기회 개술
    private  String              remark;
    private  String              custNm;
    private  String              custCd;
    private  String              scNm;
    private  String              pconCustNm;
    private  String              regUsrNm;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                startDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                endDt;

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
     * @return the salesActiveNo
     */
    public String getSalesActiveNo() {
        return salesActiveNo;
    }

    /**
     * @param salesActiveNo the salesActiveNo to set
     */
    public void setSalesActiveNo(String salesActiveNo) {
        this.salesActiveNo = salesActiveNo;
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
     * @return the prefCommNo
     */
    public String getPrefCommNo() {
        return prefCommNo;
    }

    /**
     * @param prefCommNo the prefCommNo to set
     */
    public void setPrefCommNo(String prefCommNo) {
        this.prefCommNo = prefCommNo;
    }

    /**
     * @return the pconCustNo
     */
    public String getPconCustNo() {
        return pconCustNo;
    }

    /**
     * @param pconCustNo the pconCustNo to set
     */
    public void setPconCustNo(String pconCustNo) {
        this.pconCustNo = pconCustNo;
    }

    /**
     * @return the pconPrefCommNo
     */
    public String getPconPrefCommNo() {
        return pconPrefCommNo;
    }

    /**
     * @param pconPrefCommNo the pconPrefCommNo to set
     */
    public void setPconPrefCommNo(String pconPrefCommNo) {
        this.pconPrefCommNo = pconPrefCommNo;
    }

    /**
     * @return the commMthCd
     */
    public String getCommMthCd() {
        return commMthCd;
    }

    /**
     * @param commMthCd the commMthCd to set
     */
    public void setCommMthCd(String commMthCd) {
        this.commMthCd = commMthCd;
    }

    /**
     * @return the salesActiveTpCd
     */
    public String getSalesActiveTpCd() {
        return salesActiveTpCd;
    }

    /**
     * @param salesActiveTpCd the salesActiveTpCd to set
     */
    public void setSalesActiveTpCd(String salesActiveTpCd) {
        this.salesActiveTpCd = salesActiveTpCd;
    }

    /**
     * @return the salesActiveStatCd
     */
    public String getSalesActiveStatCd() {
        return salesActiveStatCd;
    }

    /**
     * @param salesActiveStatCd the salesActiveStatCd to set
     */
    public void setSalesActiveStatCd(String salesActiveStatCd) {
        this.salesActiveStatCd = salesActiveStatCd;
    }

    /**
     * @return the planStartDt
     */
    public Date getPlanStartDt() {
        return planStartDt;
    }

    /**
     * @param planStartDt the planStartDt to set
     */
    public void setPlanStartDt(Date planStartDt) {
        this.planStartDt = planStartDt;
    }

    /**
     * @return the planEndDt
     */
    public Date getPlanEndDt() {
        return planEndDt;
    }

    /**
     * @param planEndDt the planEndDt to set
     */
    public void setPlanEndDt(Date planEndDt) {
        this.planEndDt = planEndDt;
    }

    /**
     * @return the activeStartDt
     */
    public Date getActiveStartDt() {
        return activeStartDt;
    }

    /**
     * @param activeStartDt the activeStartDt to set
     */
    public void setActiveStartDt(Date activeStartDt) {
        this.activeStartDt = activeStartDt;
    }

    /**
     * @return the activeEndDt
     */
    public Date getActiveEndDt() {
        return activeEndDt;
    }

    /**
     * @param activeEndDt the activeEndDt to set
     */
    public void setActiveEndDt(Date activeEndDt) {
        this.activeEndDt = activeEndDt;
    }

    /**
     * @return the scId
     */
    public String getScId() {
        return scId;
    }

    /**
     * @param scId the scId to set
     */
    public void setScId(String scId) {
        this.scId = scId;
    }

    /**
     * @return the saleOpptNo
     */
    public String getSaleOpptNo() {
        return saleOpptNo;
    }

    /**
     * @param saleOpptNo the saleOpptNo to set
     */
    public void setSaleOpptNo(String saleOpptNo) {
        this.saleOpptNo = saleOpptNo;
    }

    /**
     * @return the activeCont
     */
    public String getActiveCont() {
        return activeCont;
    }

    /**
     * @param activeCont the activeCont to set
     */
    public void setActiveCont(String activeCont) {
        this.activeCont = activeCont;
    }

    /**
     * @return the activeRsltCont
     */
    public String getActiveRsltCont() {
        return activeRsltCont;
    }

    /**
     * @param activeRsltCont the activeRsltCont to set
     */
    public void setActiveRsltCont(String activeRsltCont) {
        this.activeRsltCont = activeRsltCont;
    }

    /**
     * @return the guideCmmtCont
     */
    public String getGuideCmmtCont() {
        return guideCmmtCont;
    }

    /**
     * @param guideCmmtCont the guideCmmtCont to set
     */
    public void setGuideCmmtCont(String guideCmmtCont) {
        this.guideCmmtCont = guideCmmtCont;
    }

    /**
     * @return the mngId
     */
    public String getMngId() {
        return mngId;
    }

    /**
     * @param mngId the mngId to set
     */
    public void setMngId(String mngId) {
        this.mngId = mngId;
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
     * @return the scNm
     */
    public String getScNm() {
        return scNm;
    }

    /**
     * @param scNm the scNm to set
     */
    public void setScNm(String scNm) {
        this.scNm = scNm;
    }

    /**
     * @return the pconCustNm
     */
    public String getPconCustNm() {
        return pconCustNm;
    }

    /**
     * @param pconCustNm the pconCustNm to set
     */
    public void setPconCustNm(String pconCustNm) {
        this.pconCustNm = pconCustNm;
    }

    /**
     * @return the regUsrNm
     */
    public String getRegUsrNm() {
        return regUsrNm;
    }

    /**
     * @param regUsrNm the regUsrNm to set
     */
    public void setRegUsrNm(String regUsrNm) {
        this.regUsrNm = regUsrNm;
    }

    /**
     * @return the startDt
     */
    public Date getStartDt() {
        return startDt;
    }

    /**
     * @param startDt the startDt to set
     */
    public void setStartDt(Date startDt) {
        this.startDt = startDt;
    }

    /**
     * @return the endDt
     */
    public Date getEndDt() {
        return endDt;
    }

    /**
     * @param endDt the endDt to set
     */
    public void setEndDt(Date endDt) {
        this.endDt = endDt;
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

    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "SalesActiveVO [dlrCd=" + dlrCd + ", salesActiveNo=" + salesActiveNo + ", custNo=" + custNo
                + ", prefCommNo=" + prefCommNo + ", pconCustNo=" + pconCustNo + ", pconPrefCommNo=" + pconPrefCommNo
                + ", commMthCd=" + commMthCd + ", salesActiveTpCd=" + salesActiveTpCd + ", salesActiveStatCd="
                + salesActiveStatCd + ", planStartDt=" + planStartDt + ", planEndDt=" + planEndDt + ", activeStartDt="
                + activeStartDt + ", activeEndDt=" + activeEndDt + ", scId=" + scId + ", saleOpptNo=" + saleOpptNo
                + ", activeCont=" + activeCont + ", activeRsltCont=" + activeRsltCont + ", guideCmmtCont="
                + guideCmmtCont + ", mngId=" + mngId + ", regUsrId=" + regUsrId + ", regDt=" + regDt + ", updtUsrId="
                + updtUsrId + ", updtDt=" + updtDt + ", remark=" + remark + ", custNm=" + custNm + ", custCd=" + custCd
                + ", scNm=" + scNm + ", pconCustNm=" + pconCustNm + ", regUsrNm=" + regUsrNm + ", startDt=" + startDt
                + ", endDt=" + endDt + "]";
    }


}