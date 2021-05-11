package chn.bhmc.dms.sal.fim.vo;

import java.util.Date;

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
 * @ClassName   : FincInfoMngVO
 * @Description : 금융서비스 VO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016. 6. 09.    Kim Jin Suk           최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="dlrCd"            , mesgKey="sal.lbl.dlrCd")
   ,@ValidField(field="fincNo"           , mesgKey="sal.lbl.fincNo")
   ,@ValidField(field="fincReqAmt"       , mesgKey="sal.lbl.fincReqAmt")
   ,@ValidField(field="fincRpayPrid"     , mesgKey="sal.lbl.fincRpayPrid")
   ,@ValidField(field="fincLoanRate"     , mesgKey="sal.lbl.fincLoanRate")
   ,@ValidField(field="fincRpayDt"       , mesgKey="sal.lbl.fincRpayDt")
   ,@ValidField(field="fincRpaySeq"      , mesgKey="sal.lbl.fincRpaySeq")
   ,@ValidField(field="fincRpayAmt"      , mesgKey="sal.lbl.fincRpayAmt")
   ,@ValidField(field="fincRpayIntrAmt"  , mesgKey="sal.lbl.fincRpayIntrAmt")
   ,@ValidField(field="fincRpayTotAmt"   , mesgKey="sal.lbl.fincRpayTotAmt")
   })
public class FincInfoMngIFVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -4231002724714954141L;

     /**
     * 딜러코드
     **/
    private  String            dlrCd;

    /**
     * 금융번호
     **/
    private  String            fincNo;

    /**
     * 금융요청금액
     **/
    private  Double            fincReqAmt;

    /**
     * 금융상환기간
     **/
    private  int               fincRpayPrid;

    /**
     * 금융대출비율
     **/
    private  Double            fincLoanRate;

    /**
     * 금융상환일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              fincRpayDt;

    /**
     * 금융상환일련번호
     **/
    private  int               fincRpaySeq;

    /**
     * 금융상환금액
     **/
    private  Double            fincRpayAmt;

    /**
     * 금융상환이자금액
     **/
    private  Double            fincRpayIntrAmt;

    /**
     * 금융상환총금액
     **/
    private  Double            fincRpayTotAmt;

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
     * @return the fincNo
     */
    public String getFincNo() {
        return fincNo;
    }

    /**
     * @param fincNo the fincNo to set
     */
    public void setFincNo(String fincNo) {
        this.fincNo = fincNo;
    }

    /**
     * @return the fincReqAmt
     */
    public Double getFincReqAmt() {
        return fincReqAmt;
    }

    /**
     * @param fincReqAmt the fincReqAmt to set
     */
    public void setFincReqAmt(Double fincReqAmt) {
        this.fincReqAmt = fincReqAmt;
    }

    /**
     * @return the fincRpayPrid
     */
    public int getFincRpayPrid() {
        return fincRpayPrid;
    }

    /**
     * @param fincRpayPrid the fincRpayPrid to set
     */
    public void setFincRpayPrid(int fincRpayPrid) {
        this.fincRpayPrid = fincRpayPrid;
    }

    /**
     * @return the fincLoanRate
     */
    public Double getFincLoanRate() {
        return fincLoanRate;
    }

    /**
     * @param fincLoanRate the fincLoanRate to set
     */
    public void setFincLoanRate(Double fincLoanRate) {
        this.fincLoanRate = fincLoanRate;
    }

    /**
     * @return the fincRpayDt
     */
    public Date getFincRpayDt() {
        return fincRpayDt;
    }

    /**
     * @param fincRpayDt the fincRpayDt to set
     */
    public void setFincRpayDt(Date fincRpayDt) {
        this.fincRpayDt = fincRpayDt;
    }

    /**
     * @return the fincRpaySeq
     */
    public int getFincRpaySeq() {
        return fincRpaySeq;
    }

    /**
     * @param fincRpaySeq the fincRpaySeq to set
     */
    public void setFincRpaySeq(int fincRpaySeq) {
        this.fincRpaySeq = fincRpaySeq;
    }

    /**
     * @return the fincRpayAmt
     */
    public Double getFincRpayAmt() {
        return fincRpayAmt;
    }

    /**
     * @param fincRpayAmt the fincRpayAmt to set
     */
    public void setFincRpayAmt(Double fincRpayAmt) {
        this.fincRpayAmt = fincRpayAmt;
    }

    /**
     * @return the fincRpayIntrAmt
     */
    public Double getFincRpayIntrAmt() {
        return fincRpayIntrAmt;
    }

    /**
     * @param fincRpayIntrAmt the fincRpayIntrAmt to set
     */
    public void setFincRpayIntrAmt(Double fincRpayIntrAmt) {
        this.fincRpayIntrAmt = fincRpayIntrAmt;
    }

    /**
     * @return the fincRpayTotAmt
     */
    public Double getFincRpayTotAmt() {
        return fincRpayTotAmt;
    }

    /**
     * @param fincRpayTotAmt the fincRpayTotAmt to set
     */
    public void setFincRpayTotAmt(Double fincRpayTotAmt) {
        this.fincRpayTotAmt = fincRpayTotAmt;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
