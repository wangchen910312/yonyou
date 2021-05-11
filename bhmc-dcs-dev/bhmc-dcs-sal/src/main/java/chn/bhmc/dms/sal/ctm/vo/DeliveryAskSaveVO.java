package chn.bhmc.dms.sal.ctm.vo;


import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

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
 * @ClassName   : AskHelpCarVO
 * @Description : 구원차/대부차신청 조회 VO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016.02.23      Kim Jin Suk        최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="dlrCd"          , mesgKey="sal.lbl.dlrCd")
   ,@ValidField(field="usrId"          , mesgKey="sal.lbl.usrId")
   ,@ValidField(field="reqNo"          , mesgKey="sal.lbl.reqNo")
   })
public class DeliveryAskSaveVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1423985165370102387L;

    /**
     * 딜러코드
     **/
    @NotEmpty
    private  String          dlrCd;

    /**
     * 계약번호
     **/
    @NotEmpty
    private  String          contractNo;

    /**
     * 출고상태코드 : SAL_048
     **/
    private  String          giStatCd;

    /**
     * 출고요청일
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date          giReqDt;

    // 계약상태 (30:배정, 40:출고요청, 41:출고확정)
    private  String        contractStatCd;

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
     * @return the contractNo
     */
    public String getContractNo() {
        return contractNo;
    }

    /**
     * @param contractNo the contractNo to set
     */
    public void setContractNo(String contractNo) {
        this.contractNo = contractNo;
    }

    /**
     * @return the giStatCd
     */
    public String getGiStatCd() {
        return giStatCd;
    }

    /**
     * @param giStatCd the giStatCd to set
     */
    public void setGiStatCd(String giStatCd) {
        this.giStatCd = giStatCd;
    }

    /**
     * @return the giReqDt
     */
    public Date getGiReqDt() {
        return giReqDt;
    }

    /**
     * @param giReqDt the giReqDt to set
     */
    public void setGiReqDt(Date giReqDt) {
        this.giReqDt = giReqDt;
    }

    /**
     * @return the contractStatCd
     */
    public String getContractStatCd() {
        return contractStatCd;
    }

    /**
     * @param contractStatCd the contractStatCd to set
     */
    public void setContractStatCd(String contractStatCd) {
        this.contractStatCd = contractStatCd;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
