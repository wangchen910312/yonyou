package chn.bhmc.dms.crm.dmm.vo;

import java.util.Date;

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
     private  int pointVal;

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
      * 멤버십 양도.양수 기타 추가
      **/
     private  String cardNo;
     private  String trsfCustNm;
     private  String trsfCustNo;
     private  String receiveCustNo;
     private  String receiveCustNm;
     private  String signDocId;//결재양식번호

     /*
      * 결재관련 부분 추가
      */
     private String signStatCd;
     private String tempSaveYn;
     private String reqEmpNo;
     private String refDocParams;
     private String reqUsrNm;
     @JsonDeserialize(using=JsonDateDeserializer.class)
     private Date reqDt;
     private String reqCont;
     private String reqUsrId;
     private String reqTitleNm;
     @JsonDeserialize(using=JsonDateDeserializer.class)
     private Date signEndDt;


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
     public int getPointVal() {
         return pointVal;
     }

     /**
      * @param pointVal the pointVal to set
      */
     public void setPointVal(int pointVal) {
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
     * @return the reqCont
     */
    public String getReqCont() {
        return reqCont;
    }

    /**
     * @param reqCont the reqCont to set
     */
    public void setReqCont(String reqCont) {
        this.reqCont = reqCont;
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

    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return ReflectionToStringBuilder.toString(this);
    }

}
