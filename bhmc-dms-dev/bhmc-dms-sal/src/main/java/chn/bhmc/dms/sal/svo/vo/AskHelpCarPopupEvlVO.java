package chn.bhmc.dms.sal.svo.vo;

import java.util.Date;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AskHelpCarPopupApplyVO
 * @Description : 구원차/대부차 팝업 심사정보 조회 VO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016.02.25      Kim Jin Suk        최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="dlrCd"      , mesgKey="sal.lbl.dlrCd")
   ,@ValidField(field="usrId"      , mesgKey="sal.lbl.usrId")
   ,@ValidField(field="reqNo"      , mesgKey="sal.lbl.reqNo")
   ,@ValidField(field="spcOrdSeq"  , mesgKey="sal.lbl.spcOrdSeq")
   ,@ValidField(field="evalRsltYn" , mesgKey="sal.lbl.evalRsltYn")
   ,@ValidField(field="pevalId"    , mesgKey="sal.lbl.pevalId")
   ,@ValidField(field="evalDt"     , mesgKey="sal.lbl.evalDt")
   ,@ValidField(field="remark"     , mesgKey="sal.lbl.remark")
   ,@ValidField(field="regUsrId"   , mesgKey="sal.lbl.regUsrId")
   ,@ValidField(field="regDt"      , mesgKey="sal.lbl.regDt")
   ,@ValidField(field="updtUsrId"  , mesgKey="sal.lbl.updtUsrId")
   ,@ValidField(field="updtDt"     , mesgKey="sal.lbl.updtDt")
   })
public class AskHelpCarPopupEvlVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8671549643712990809L;


    /**
     * 딜러코드
     **/
    private  String      dlrCd;

    /**
     * 사용자ID
     **/
    private  String      usrId;

    /**
     * 요청번호
     **/
    private  int         reqNo;

    /**
     * 특수오더일련번호
     **/
    private  int         spcOrdSeq;

    /**
     * 심사결과여부
     **/
    private  String      evalRsltYn;

    /**
     * 심사자ID
     **/
    private  String      pevalId;

    /**
     * 심사일자
     **/
    private  Date        evalDt;

    /**
     * 비고
     **/
    private  String      remark;

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
     * @return the usrId
     */
    public String getUsrId() {
        return usrId;
    }

    /**
     * @param usrId the usrId to set
     */
    public void setUsrId(String usrId) {
        this.usrId = usrId;
    }

    /**
     * @return the reqNo
     */
    public int getReqNo() {
        return reqNo;
    }

    /**
     * @param reqNo the reqNo to set
     */
    public void setReqNo(int reqNo) {
        this.reqNo = reqNo;
    }

    /**
     * @return the spcOrdSeq
     */
    public int getSpcOrdSeq() {
        return spcOrdSeq;
    }

    /**
     * @param spcOrdSeq the spcOrdSeq to set
     */
    public void setSpcOrdSeq(int spcOrdSeq) {
        this.spcOrdSeq = spcOrdSeq;
    }

    /**
     * @return the evalRsltYn
     */
    public String getEvalRsltYn() {
        return evalRsltYn;
    }

    /**
     * @param evalRsltYn the evalRsltYn to set
     */
    public void setEvalRsltYn(String evalRsltYn) {
        this.evalRsltYn = evalRsltYn;
    }

    /**
     * @return the pevalId
     */
    public String getPevalId() {
        return pevalId;
    }

    /**
     * @param pevalId the pevalId to set
     */
    public void setPevalId(String pevalId) {
        this.pevalId = pevalId;
    }

    /**
     * @return the evalDt
     */
    public Date getEvalDt() {
        return evalDt;
    }

    /**
     * @param evalDt the evalDt to set
     */
    public void setEvalDt(Date evalDt) {
        this.evalDt = evalDt;
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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
