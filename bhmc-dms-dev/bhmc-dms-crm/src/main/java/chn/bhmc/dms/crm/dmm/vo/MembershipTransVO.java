package chn.bhmc.dms.crm.dmm.vo;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipTransVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Hyun Ho
 * @since 2016. 5. 2.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 2.     Kim Hyun Ho     최초 생성
 * </pre>
 */

@ValidDescriptor({
    @ValidField(field="dlrCd"                , mesgKey="CR_0806T.lbl.dlrCd")
    ,@ValidField(field="trsfReceiveSeq"       , mesgKey="CR_0806T.lbl.trsfReceiveSeq")
    ,@ValidField(field="trsfMembershipNo"    , mesgKey="CR_0806T.lbl.trsfMembershipNo")
    ,@ValidField(field="receiveMembershipNo" , mesgKey="CR_0806T.lbl.receiveMembershipNo")
    ,@ValidField(field="pointVal"             , mesgKey="CR_0806T.lbl.pointVal")
    ,@ValidField(field="trsfReasonCd"         , mesgKey="CR_0806T.lbl.trsfReasonCd")
    ,@ValidField(field="trsfReceiveRelCd"     , mesgKey="CR_0806T.lbl.trsfReceiveRelCd")
    ,@ValidField(field="fileDocNo"            , mesgKey="CR_0806T.lbl.fileDocNo")
    ,@ValidField(field="signDocNo"            , mesgKey="CR_0806T.lbl.signDocNo")
    ,@ValidField(field="useYn"                , mesgKey="CR_0806T.lbl.useYn")
    ,@ValidField(field="regUsrId"             , mesgKey="CR_0806T.lbl.regUsrId")
    ,@ValidField(field="regDt"                , mesgKey="CR_0806T.lbl.regDt")
    ,@ValidField(field="updtUsrId"            , mesgKey="CR_0806T.lbl.updtUsrId")
    ,@ValidField(field="updtDt"               , mesgKey="CR_0806T.lbl.updtDt")
    })

public class MembershipTransVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -8447535267387462086L;

    /**
     * 딜러코드
     **/
     private  String dlrCd;

     /**
     * 양도양수일련번호
     **/
     private  int trsfReceiveSeq;

     /**
     * 양도멤버쉽일련번호
     **/
     private  String trsfMembershipNo;

     /**
     * 양수멤버쉽일련번호
     **/
     private  String receiveMembershipNo;

     /**
     * 포인트값
     **/
     private  Double pointVal;

     /**
     * 양도사유코드
     **/
     private  String trsfReasonCd;

     /**
     * 양도양수관계코드
     **/
     private  String trsfReceiveRelCd;

     /**
     * 첨부파일문서번호
     **/
     private  String fileDocNo;

     /**
     * 결재문서번호
     **/
     private  String  signDocNo;

     /**
     * 사용여부
     **/
     private  String useYn;

     /**
     * 양도양수상세일련번호
     **/
     private  int                   trsfReceiveDetlSeq;

     /**
     * 양도양수유형코드
     **/
     //TRSF_RECEIVE_TP_CD

     private  String                trsfReceiveTpCd;

     /**
     * 양도양수쿠폰일련번호
     **/
     //TRSF_RECEIVE_CUPN_SEQ

     private  int                   trsfReceiveCupnSeq;

     /**
     * 양도양수포인트값
     **/
     //TRSF_RECEIVE_POINT_VAL

     private  Double                   trsfReceivePointVal;

     /**
     * 양도카드유형코드
     **/
     //TRSF_CARD_TP_CD

     private  String                trsfCardTpCd;

     /**
     * 양도카드번호
     **/
     //TRSF_CARD_NO

     private  String                trsfCardNo;

     /**
     * 양도양수카드금액
     **/
     //TRSF_RECEIVE_CARD_AMT

     private  Double                   trsfReceiveCardAmt;
     private  String                trsfFailYn;//양도실패여부
     private  String                trsfFailReasonCont;//양도실패사유내용


     /**
      * 멤버십 양도.양수 기타 추가
      **/
     private  String cardNo;
     private  String trsfCustNm;
     private  String trsfCustNo;
     private  String receiveCustNo;
     private  String receiveCardNo;
     private  String receiveCustNm;
     private  String signDocId;//결재양식번호
     private  String membershipNo;
     private  int    trsfRealAmtVal;
     private  int    seq;
     private  int    cupnNo;

     /*
      * 결재관련 부분 추가
      */
     private String signStatCd;
     private String tempSaveYn;
     private String reqEmpNo  ;
     private String refDocParams  ;
     private String reqUsrNm  ;
     @JsonDeserialize(using=JsonDateDeserializer.class)
     private Date reqDt     ;
     private String reqUsrId  ;
     private String reqTitleNm;
     @JsonDeserialize(using=JsonDateDeserializer.class)
     private Date signEndDt;

     /*
      * 멤버십 양도 신청 및 관리 통합으로 인한 추가
      */
     //충전카드 양수금액 목록
     private List<MembershipTransVO> insertCardIssue;


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
      * @return the trsfReceiveSeq
      */
     public int getTrsfReceiveSeq() {
         return trsfReceiveSeq;
     }

     /**
      * @param trsfReceiveSeq the trsfReceiveSeq to set
      */
     public void setTrsfReceiveSeq(int trsfReceiveSeq) {
         this.trsfReceiveSeq = trsfReceiveSeq;
     }

    /**
     * @return the trsfMembershipNo
     */
    public String getTrsfMembershipNo() {
        return trsfMembershipNo;
    }

    /**
     * @param trsfMembershipNo the trsfMembershipNo to set
     */
    public void setTrsfMembershipNo(String trsfMembershipNo) {
        this.trsfMembershipNo = trsfMembershipNo;
    }

    /**
     * @return the receiveMembershipNo
     */
    public String getReceiveMembershipNo() {
        return receiveMembershipNo;
    }

    /**
     * @param receiveMembershipNo the receiveMembershipNo to set
     */
    public void setReceiveMembershipNo(String receiveMembershipNo) {
        this.receiveMembershipNo = receiveMembershipNo;
    }

    /**
      * @return the pointVal
      */
     public Double getPointVal() {
         return pointVal;
     }

     /**
      * @param pointVal the pointVal to set
      */
     public void setPointVal(Double pointVal) {
         this.pointVal = pointVal;
     }

     /**
      * @return the trsfReasonCd
      */
     public String getTrsfReasonCd() {
         return trsfReasonCd;
     }

     /**
      * @param trsfReasonCd the trsfReasonCd to set
      */
     public void setTrsfReasonCd(String trsfReasonCd) {
         this.trsfReasonCd = trsfReasonCd;
     }

     /**
      * @return the trsfReceiveRelCd
      */
     public String getTrsfReceiveRelCd() {
         return trsfReceiveRelCd;
     }

     /**
      * @param trsfReceiveRelCd the trsfReceiveRelCd to set
      */
     public void setTrsfReceiveRelCd(String trsfReceiveRelCd) {
         this.trsfReceiveRelCd = trsfReceiveRelCd;
     }

     /**
      * @return the fileDocNo
      */
     public String getFileDocNo() {
         return fileDocNo;
     }

     /**
      * @param fileDocNo the fileDocNo to set
      */
     public void setFileDocNo(String fileDocNo) {
         this.fileDocNo = fileDocNo;
     }

     /**
      * @return the signDocNo
      */
     public String getSignDocNo() {
         return signDocNo;
     }

     /**
      * @param signDocNo the signDocNo to set
      */
     public void setSignDocNo(String signDocNo) {
         this.signDocNo = signDocNo;
     }

     /**
      * @return the useYn
      */
     public String getUseYn() {
         return useYn;
     }

     /**
     * @return the cardNo
     */
    public String getCardNo() {
        return cardNo;
    }

    /**
     * @param cardNo the cardNo to set
     */
    public void setCardNo(String cardNo) {
        this.cardNo = cardNo;
    }

    /**
      * @param useYn the useYn to set
      */
     public void setUseYn(String useYn) {
         this.useYn = useYn;
     }

    /**
     * @return the trsfCustNm
     */
    public String getTrsfCustNm() {
        return trsfCustNm;
    }

    /**
     * @param trsfCustNm the trsfCustNm to set
     */
    public void setTrsfCustNm(String trsfCustNm) {
        this.trsfCustNm = trsfCustNm;
    }

    /**
     * @return the receiveCustNm
     */
    public String getReceiveCustNm() {
        return receiveCustNm;
    }

    /**
     * @param receiveCustNm the receiveCustNm to set
     */
    public void setReceiveCustNm(String receiveCustNm) {
        this.receiveCustNm = receiveCustNm;
    }



    /**
     * @return the signDocId
     */
    public String getSignDocId() {
        return signDocId;
    }

    /**
     * @param signDocId the signDocId to set
     */
    public void setSignDocId(String signDocId) {
        this.signDocId = signDocId;
    }

    /**
     * @return the trsfCustNo
     */
    public String getTrsfCustNo() {
        return trsfCustNo;
    }

    /**
     * @param trsfCustNo the trsfCustNo to set
     */
    public void setTrsfCustNo(String trsfCustNo) {
        this.trsfCustNo = trsfCustNo;
    }

    /**
     * @return the receiveCustNo
     */
    public String getReceiveCustNo() {
        return receiveCustNo;
    }

    /**
     * @param receiveCustNo the receiveCustNo to set
     */
    public void setReceiveCustNo(String receiveCustNo) {
        this.receiveCustNo = receiveCustNo;
    }



    /**
     * @return the signStatCd
     */
    public String getSignStatCd() {
        return signStatCd;
    }

    /**
     * @param signStatCd the signStatCd to set
     */
    public void setSignStatCd(String signStatCd) {
        this.signStatCd = signStatCd;
    }

    /**
     * @return the tempSaveYn
     */
    public String getTempSaveYn() {
        return tempSaveYn;
    }

    /**
     * @param tempSaveYn the tempSaveYn to set
     */
    public void setTempSaveYn(String tempSaveYn) {
        this.tempSaveYn = tempSaveYn;
    }

    /**
     * @return the reqEmpNo
     */
    public String getReqEmpNo() {
        return reqEmpNo;
    }

    /**
     * @param reqEmpNo the reqEmpNo to set
     */
    public void setReqEmpNo(String reqEmpNo) {
        this.reqEmpNo = reqEmpNo;
    }

    /**
     * @return the refDocParams
     */
    public String getRefDocParams() {
        return refDocParams;
    }

    /**
     * @param refDocParams the refDocParams to set
     */
    public void setRefDocParams(String refDocParams) {
        this.refDocParams = refDocParams;
    }

    /**
     * @return the reqUsrNm
     */
    public String getReqUsrNm() {
        return reqUsrNm;
    }

    /**
     * @param reqUsrNm the reqUsrNm to set
     */
    public void setReqUsrNm(String reqUsrNm) {
        this.reqUsrNm = reqUsrNm;
    }

    /**
     * @return the reqDt
     */
    public Date getReqDt() {
        return reqDt;
    }

    /**
     * @param reqDt the reqDt to set
     */
    public void setReqDt(Date reqDt) {
        this.reqDt = reqDt;
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
     * @return the reqTitleNm
     */
    public String getReqTitleNm() {
        return reqTitleNm;
    }

    /**
     * @param reqTitleNm the reqTitleNm to set
     */
    public void setReqTitleNm(String reqTitleNm) {
        this.reqTitleNm = reqTitleNm;
    }

    /**
     * @return the signEndDt
     */
    public Date getSignEndDt() {
        return signEndDt;
    }

    /**
     * @param signEndDt the signEndDt to set
     */
    public void setSignEndDt(Date signEndDt) {
        this.signEndDt = signEndDt;
    }


    /**
     * @return the insertCardIssue
     */
    public List<MembershipTransVO> getInsertCardIssue() {
        return insertCardIssue;
    }

    /**
     * @param insertCardIssue the insertCardIssue to set
     */
    public void setInsertCardIssue(List<MembershipTransVO> insertCardIssue) {
        this.insertCardIssue = insertCardIssue;
    }

    /**
     * @return the trsfReceiveDetlSeq
     */
    public int getTrsfReceiveDetlSeq() {
        return trsfReceiveDetlSeq;
    }

    /**
     * @param trsfReceiveDetlSeq the trsfReceiveDetlSeq to set
     */
    public void setTrsfReceiveDetlSeq(int trsfReceiveDetlSeq) {
        this.trsfReceiveDetlSeq = trsfReceiveDetlSeq;
    }

    /**
     * @return the trsfReceiveTpCd
     */
    public String getTrsfReceiveTpCd() {
        return trsfReceiveTpCd;
    }

    /**
     * @param trsfReceiveTpCd the trsfReceiveTpCd to set
     */
    public void setTrsfReceiveTpCd(String trsfReceiveTpCd) {
        this.trsfReceiveTpCd = trsfReceiveTpCd;
    }

    /**
     * @return the trsfReceiveCupnSeq
     */
    public int getTrsfReceiveCupnSeq() {
        return trsfReceiveCupnSeq;
    }

    /**
     * @param trsfReceiveCupnSeq the trsfReceiveCupnSeq to set
     */
    public void setTrsfReceiveCupnSeq(int trsfReceiveCupnSeq) {
        this.trsfReceiveCupnSeq = trsfReceiveCupnSeq;
    }

    /**
     * @return the trsfReceivePointVal
     */
    public Double getTrsfReceivePointVal() {
        return trsfReceivePointVal;
    }

    /**
     * @param trsfReceivePointVal the trsfReceivePointVal to set
     */
    public void setTrsfReceivePointVal(Double trsfReceivePointVal) {
        this.trsfReceivePointVal = trsfReceivePointVal;
    }

    /**
     * @return the trsfCardTpCd
     */
    public String getTrsfCardTpCd() {
        return trsfCardTpCd;
    }

    /**
     * @param trsfCardTpCd the trsfCardTpCd to set
     */
    public void setTrsfCardTpCd(String trsfCardTpCd) {
        this.trsfCardTpCd = trsfCardTpCd;
    }

    /**
     * @return the trsfCardNo
     */
    public String getTrsfCardNo() {
        return trsfCardNo;
    }

    /**
     * @param trsfCardNo the trsfCardNo to set
     */
    public void setTrsfCardNo(String trsfCardNo) {
        this.trsfCardNo = trsfCardNo;
    }

    /**
     * @return the trsfReceiveCardAmt
     */
    public Double getTrsfReceiveCardAmt() {
        return trsfReceiveCardAmt;
    }

    /**
     * @param trsfReceiveCardAmt the trsfReceiveCardAmt to set
     */
    public void setTrsfReceiveCardAmt(Double trsfReceiveCardAmt) {
        this.trsfReceiveCardAmt = trsfReceiveCardAmt;
    }



    /**
     * @return the membershipNo
     */
    public String getMembershipNo() {
        return membershipNo;
    }

    /**
     * @param membershipNo the membershipNo to set
     */
    public void setMembershipNo(String membershipNo) {
        this.membershipNo = membershipNo;
    }



    /**
     * @return the trsfRealAmtVal
     */
    public int getTrsfRealAmtVal() {
        return trsfRealAmtVal;
    }

    /**
     * @param trsfRealAmtVal the trsfRealAmtVal to set
     */
    public void setTrsfRealAmtVal(int trsfRealAmtVal) {
        this.trsfRealAmtVal = trsfRealAmtVal;
    }


    /**
     * @return the seq
     */
    public int getSeq() {
        return seq;
    }

    /**
     * @param seq the seq to set
     */
    public void setSeq(int seq) {
        this.seq = seq;
    }

    /**
     * @return the cupnNo
     */
    public int getCupnNo() {
        return cupnNo;
    }

    /**
     * @param cupnNo the cupnNo to set
     */
    public void setCupnNo(int cupnNo) {
        this.cupnNo = cupnNo;
    }



    /**
     * @return the receiveCardNo
     */
    public String getReceiveCardNo() {
        return receiveCardNo;
    }

    /**
     * @param receiveCardNo the receiveCardNo to set
     */
    public void setReceiveCardNo(String receiveCardNo) {
        this.receiveCardNo = receiveCardNo;
    }



    /**
     * @return the trsfFailYn
     */
    public String getTrsfFailYn() {
        return trsfFailYn;
    }

    /**
     * @param trsfFailYn the trsfFailYn to set
     */
    public void setTrsfFailYn(String trsfFailYn) {
        this.trsfFailYn = trsfFailYn;
    }

    /**
     * @return the trsfFailReasonCont
     */
    public String getTrsfFailReasonCont() {
        return trsfFailReasonCont;
    }

    /**
     * @param trsfFailReasonCont the trsfFailReasonCont to set
     */
    public void setTrsfFailReasonCont(String trsfFailReasonCont) {
        this.trsfFailReasonCont = trsfFailReasonCont;
    }

    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return ReflectionToStringBuilder.toString(this);
    }

}
