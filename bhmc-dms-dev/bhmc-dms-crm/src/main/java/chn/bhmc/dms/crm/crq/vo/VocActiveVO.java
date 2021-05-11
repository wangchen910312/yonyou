package chn.bhmc.dms.crm.crq.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * 마케팅 캠패인  VO
 *
 * @ClassName   : MarketingCampaignVO.java
 * @Description : MarketingCampaignVO Class
 * @author hyoung jun an
 * @since 2016.03.04.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.04     hyoung jun an    최초 생성
 * </pre>
 */

@ValidDescriptor({
     @ValidField(field="vocActiveNo"           , mesgKey="global.lbl.vocActiveNo")         //VOC활동번호
    ,@ValidField(field="dlrCd"                 , mesgKey="global.lbl.dlrCd")
    ,@ValidField(field="vocNo"                 , mesgKey="global.lbl.vocNo")               //VOC번호
    ,@ValidField(field="custNo"                , mesgKey="global.lbl.customer")            //고객번호
    ,@ValidField(field="pconCustNo"            , mesgKey="global.lbl.pconCustInfo")        //연계인고객번호
    ,@ValidField(field="activeStatCd"          , mesgKey="global.lbl.activeStatCd")        //활동상태코드
    ,@ValidField(field="activeTpCd"            , mesgKey="global.lbl.activeTpCd")          //활동유형코드
    ,@ValidField(field="activeTpSubCd"         , mesgKey="global.lbl.activeTpSubCd")       //활동유형하위코드
    ,@ValidField(field="activeRsltCont"        , mesgKey="global.lbl.activeRsltCont")      //활동결과내용
    ,@ValidField(field="activeCd"              , mesgKey="global.lbl.activeCd")            //활동코드
    ,@ValidField(field="startDt"               , mesgKey="global.lbl.startDt")             //시작일자
    ,@ValidField(field="endDt"                 , mesgKey="global.lbl.endDt")               //종료일자
    ,@ValidField(field="pgssHm"                , mesgKey="global.lbl.pgssHm")              //진행시간
    ,@ValidField(field="expcStartDt"           , mesgKey="global.lbl.expcStartDt")         //예정시작일자
    ,@ValidField(field="expcEndDt"             , mesgKey="global.lbl.expcEndDt")           //예정종료일자
    ,@ValidField(field="regDeptNm"             , mesgKey="global.lbl.regDeptNm")           //등록부서명
    ,@ValidField(field="custNm"                , mesgKey="global.lbl.customer")            //고객명
    ,@ValidField(field="pconCustNm"            , mesgKey="global.lbl.pconCustInfo")        //연계인고객명
    ,@ValidField(field="regUsrId"              , mesgKey="global.lbl.regUsrId")            //등록자ID
    ,@ValidField(field="regDt"                 , mesgKey="global.lbl.regDt")               //등록일자
    ,@ValidField(field="updtUsrId"             , mesgKey="global.lbl.updtUsrId")           //수정자ID
    ,@ValidField(field="updtDt"                , mesgKey="global.lbl.updtDt")              //수정일자

   })

public class VocActiveVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1147237320428771906L;

    private int vocActiveNo;    //VOC활동번호
    private String vocNo;   //VOC번호
    private String bhmcVocNo;
    private String vocStatCd; // voc 마스터 상태
    private String dlrCd;   //딜러코드
    private String custNo;  //고객번호
    private String custNm;  //고객명
    private String pconCustNo;  //연계인고객번호
    private String pconCustNm;  //연계인고객명
    private String activeStatCd;    //활동상태코드
    private String activeTpCd;  //활동유형코드
    private String activeTpSubCd;   //활동유형하위코드
    private String activeTpSubCdNm; //활동유형하위코드
    private String activeRsltCont;  //활동결과내용
    private String activeCd;    //활동코드
    private String prorCd;  //우선순위코드
    private String regDeptNm;   //등록부서명
    private String regUsrId;    //등록자ID
    private String regUsrNm;    //등록자명
    private String updtUsrId;   //수정자ID
    private String bhmcVocActiveNo; //BHMC VOC활동번호
    private String activeCont;  //활동내용
    private String alrtCd;  //알람코드
    private String callSeq; //콜일련번호
    private String stsfCont;    //만족도내용
    private String emailSenderNm;   //이메일전송자명
    private String emailSenderAddrNm;   //이메일전송자주소명
    private String emailActiveCd;   //이메일활동코드
    private String ownerId; //소유자ID
    private String ownerNm; //소유자명

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date startDt;   //시작일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date endDt; //종료일자
    private Date pgssHm;    //진행시간
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date expcStartDt;   //예정시작일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date expcEndDt; //예정종료일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt; //등록일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;    //수정일자

    private int callHisSeq;     // 콜히스토리
    private String recFileId;   //녹취파일
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date callStartDt;   //콜시작시간
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date callEndDt;     //콜종료시간

    private String callDialNum;

    /**
     * @return the vocActiveNo
     */
    public int getVocActiveNo() {
        return vocActiveNo;
    }

    /**
     * @param vocActiveNo the vocActiveNo to set
     */
    public void setVocActiveNo(int vocActiveNo) {
        this.vocActiveNo = vocActiveNo;
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
     * @return the vocNo
     */
    public String getVocNo() {
        return vocNo;
    }

    /**
     * @param vocNo the vocNo to set
     */
    public void setVocNo(String vocNo) {
        this.vocNo = vocNo;
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
     * @return the activeStatCd
     */
    public String getActiveStatCd() {
        return activeStatCd;
    }

    /**
     * @param activeStatCd the activeStatCd to set
     */
    public void setActiveStatCd(String activeStatCd) {
        this.activeStatCd = activeStatCd;
    }

    /**
     * @return the activeTpCd
     */
    public String getActiveTpCd() {
        return activeTpCd;
    }

    /**
     * @param activeTpCd the activeTpCd to set
     */
    public void setActiveTpCd(String activeTpCd) {
        this.activeTpCd = activeTpCd;
    }

    /**
     * @return the activeTpSubCd
     */
    public String getActiveTpSubCd() {
        return activeTpSubCd;
    }

    /**
     * @param activeTpSubCd the activeTpSubCd to set
     */
    public void setActiveTpSubCd(String activeTpSubCd) {
        this.activeTpSubCd = activeTpSubCd;
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
     * @return the activeCd
     */
    public String getActiveCd() {
        return activeCd;
    }

    /**
     * @param activeCd the activeCd to set
     */
    public void setActiveCd(String activeCd) {
        this.activeCd = activeCd;
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
     * @return the pgssHm
     */
    public Date getPgssHm() {
        return pgssHm;
    }

    /**
     * @param pgssHm the pgssHm to set
     */
    public void setPgssHm(Date pgssHm) {
        this.pgssHm = pgssHm;
    }

    /**
     * @return the expcStartDt
     */
    public Date getExpcStartDt() {
        return expcStartDt;
    }

    /**
     * @param expcStartDt the expcStartDt to set
     */
    public void setExpcStartDt(Date expcStartDt) {
        this.expcStartDt = expcStartDt;
    }

    /**
     * @return the expcEndDt
     */
    public Date getExpcEndDt() {
        return expcEndDt;
    }

    /**
     * @param expcEndDt the expcEndDt to set
     */
    public void setExpcEndDt(Date expcEndDt) {
        this.expcEndDt = expcEndDt;
    }

    /**
     * @return the prorCd
     */
    public String getProrCd() {
        return prorCd;
    }

    /**
     * @param prorCd the prorCd to set
     */
    public void setProrCd(String prorCd) {
        this.prorCd = prorCd;
    }

    /**
     * @return the regDeptNm
     */
    public String getRegDeptNm() {
        return regDeptNm;
    }

    /**
     * @param regDeptNm the regDeptNm to set
     */
    public void setRegDeptNm(String regDeptNm) {
        this.regDeptNm = regDeptNm;
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
     * @return the bhmcVocActiveNo
     */
    public String getBhmcVocActiveNo() {
        return bhmcVocActiveNo;
    }

    /**
     * @param bhmcVocActiveNo the bhmcVocActiveNo to set
     */
    public void setBhmcVocActiveNo(String bhmcVocActiveNo) {
        this.bhmcVocActiveNo = bhmcVocActiveNo;
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
     * @return the alrtCd
     */
    public String getAlrtCd() {
        return alrtCd;
    }

    /**
     * @param alrtCd the alrtCd to set
     */
    public void setAlrtCd(String alrtCd) {
        this.alrtCd = alrtCd;
    }

    /**
     * @return the callSeq
     */
    public String getCallSeq() {
        return callSeq;
    }

    /**
     * @param callSeq the callSeq to set
     */
    public void setCallSeq(String callSeq) {
        this.callSeq = callSeq;
    }

    /**
     * @return the stsfCont
     */
    public String getStsfCont() {
        return stsfCont;
    }

    /**
     * @param stsfCont the stsfCont to set
     */
    public void setStsfCont(String stsfCont) {
        this.stsfCont = stsfCont;
    }

    /**
     * @return the emailSenderNm
     */
    public String getEmailSenderNm() {
        return emailSenderNm;
    }

    /**
     * @param emailSenderNm the emailSenderNm to set
     */
    public void setEmailSenderNm(String emailSenderNm) {
        this.emailSenderNm = emailSenderNm;
    }

    /**
     * @return the emailSenderAddrNm
     */
    public String getEmailSenderAddrNm() {
        return emailSenderAddrNm;
    }

    /**
     * @param emailSenderAddrNm the emailSenderAddrNm to set
     */
    public void setEmailSenderAddrNm(String emailSenderAddrNm) {
        this.emailSenderAddrNm = emailSenderAddrNm;
    }

    /**
     * @return the emailActiveCd
     */
    public String getEmailActiveCd() {
        return emailActiveCd;
    }

    /**
     * @param emailActiveCd the emailActiveCd to set
     */
    public void setEmailActiveCd(String emailActiveCd) {
        this.emailActiveCd = emailActiveCd;
    }

    /**
     * @return the ownerId
     */
    public String getOwnerId() {
        return ownerId;
    }

    /**
     * @param ownerId the ownerId to set
     */
    public void setOwnerId(String ownerId) {
        this.ownerId = ownerId;
    }


    /**
     * @return the bhmcVocNo
     */
    public String getBhmcVocNo() {
        return bhmcVocNo;
    }

    /**
     * @param bhmcVocNo the bhmcVocNo to set
     */
    public void setBhmcVocNo(String bhmcVocNo) {
        this.bhmcVocNo = bhmcVocNo;
    }


    /**
     * @return the activeTpSubCdNm
     */
    public String getActiveTpSubCdNm() {
        return activeTpSubCdNm;
    }

    /**
     * @param activeTpSubCdNm the activeTpSubCdNm to set
     */
    public void setActiveTpSubCdNm(String activeTpSubCdNm) {
        this.activeTpSubCdNm = activeTpSubCdNm;
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
     * @return the ownerNm
     */
    public String getOwnerNm() {
        return ownerNm;
    }

    /**
     * @param ownerNm the ownerNm to set
     */
    public void setOwnerNm(String ownerNm) {
        this.ownerNm = ownerNm;
    }



    /**
     * @return the vocStatCd
     */
    public String getVocStatCd() {
        return vocStatCd;
    }

    /**
     * @param vocStatCd the vocStatCd to set
     */
    public void setVocStatCd(String vocStatCd) {
        this.vocStatCd = vocStatCd;
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
     * @return the recFileId
     */
    public String getRecFileId() {
        return recFileId;
    }

    /**
     * @param recFileId the recFileId to set
     */
    public void setRecFileId(String recFileId) {
        this.recFileId = recFileId;
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
     * @return the callEndDt
     */
    public Date getCallEndDt() {
        return callEndDt;
    }

    /**
     * @param callEndDt the callEndDt to set
     */
    public void setCallEndDt(Date callEndDt) {
        this.callEndDt = callEndDt;
    }

    /**
     * @return the callDialNum
     */
    public String getCallDialNum() {
        return callDialNum;
    }

    /**
     * @param callDialNum the callDialNum to set
     */
    public void setCallDialNum(String callDialNum) {
        this.callDialNum = callDialNum;
    }

}