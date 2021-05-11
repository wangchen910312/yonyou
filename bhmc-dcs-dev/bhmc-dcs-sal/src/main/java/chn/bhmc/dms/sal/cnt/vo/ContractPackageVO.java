package chn.bhmc.dms.sal.cnt.vo;

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
 * @ClassName   : ContractPackageVO
 * @Description : 집단계약 헤더 VO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016. 5. 26.    Kim Jin Suk           최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="dlrCd"          , mesgKey="sal.lbl.dlrCd")
   ,@ValidField(field="grpContractNo"  , mesgKey="sal.lbl.grpContractNo")
   })
public class ContractPackageVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1003615340486902418L;

   /**
    * 딜러코드
    **/
   private  String          dlrCd;

   /**
    * 그룹계약번호
    **/
   private  String          grpContractNo;

   /**
    * 계약유형
    **/
   //CONTRACT_TP
   private  String          contractTp;

   /**
    * 계약상태코드
    **/
   //CONTRACT_STAT_CD

   private  String          contractStatCd;

   /**
    * 계약일자
    **/
   //CONTRACT_DT
   @JsonDeserialize(using=JsonDateDeserializer.class)
   private  Date            contractDt;

   /**
    * 판매사원번호
    **/
   //SALE_EMP_NO

   private  String          saleEmpNo;
   private  String          saleEmpNm;

   /**
    * 판매관리번호
    **/
   //SALE_MNG_NM

   private  String          saleMngNm;

   /**
    * 계약고객번호
    **/
   //CONTRACT_CUST_NO

   private  String          contractCustNo;

   /**
    * 고객명
    **/
   //CUST_NM

   private  String          custNm;

   /**
    * 고객유형
    **/
   //CUST_TP

   private  String          custTp;

   /**
    * 전화번호1
    **/
   //TEL_NO1

   private  String          telNo1;

   /**
    * 전화번호2
    **/
   //TEL_NO2

   private  String          telNo2;

   /**
    * 주요인증문서유형
    **/
   //MATH_DOC_TP

   private  String          mathDocTp;

   /**
    * 주민사업자등록번호
    **/
   //SSN_CRN_NO

   private  String          ssnCrnNo;

   /**
    * 인도요청일자
    **/
   //DL_REQ_DT
   @JsonDeserialize(using=JsonDateDeserializer.class)
   private  Date            dlReqDt;

   /**
    * 확정일자
    **/
   //CONFIRM_DT
   @JsonDeserialize(using=JsonDateDeserializer.class)
   private  Date            confirmDt;

   /**
    * 취소일자
    **/
   //CANC_DT
   @JsonDeserialize(using=JsonDateDeserializer.class)
   private  Date            cancDt;

   /**
    * 판매기회번호
    **/
   //SALE_OPPT_SEQ

   private  int             saleOpptSeq;

   /**
    * 지불유형
    **/
   //PAY_TP

   private  String          payTp;

   /**
    * 차종수량
    **/
   //CARLINE_CNT

   private  Double          carlineCnt;

   /**
    * 차량수량
    **/
   //CAR_CNT

   private  Double          carCnt;

   /**
    * 총판매금액
    **/
   //TOT_SALE_AMT

   private  Double          totSaleAmt;

   /**
    * 2급딜러여부
    **/
   private  String          lv2DlrYn;

   /**
    * 2급딜러조직코드
    **/
   //LV2_DLR_ORG_CD

   private  String          lv2DlrOrgCd;
   private  String          lv2DlrOrgNm;

   /**
    * 비고
    **/
   //REMARK

   private  String          remark;

   /**
    * 등록자ID
    **/
   private  String          regUsrId;

   /**
    * 등록일자
    **/
   @JsonDeserialize(using=JsonDateDeserializer.class)
   private  Date            regDt;

   /**
    * 수정자ID
    **/
   //UPDT_USR_ID
   private  String          updtUsrId;

   /**
    * 수정일자
    **/
   //UPDT_DT
   @JsonDeserialize(using=JsonDateDeserializer.class)
   private  Date            updtDt;


   private  long          oResult;

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
     * @return the grpContractNo
     */
    public String getGrpContractNo() {
        return grpContractNo;
    }

    /**
     * @param grpContractNo the grpContractNo to set
     */
    public void setGrpContractNo(String grpContractNo) {
        this.grpContractNo = grpContractNo;
    }

    /**
     * @return the contractTp
     */
    public String getContractTp() {
        return contractTp;
    }

    /**
     * @param contractTp the contractTp to set
     */
    public void setContractTp(String contractTp) {
        this.contractTp = contractTp;
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
     * @return the contractDt
     */
    public Date getContractDt() {
        return contractDt;
    }

    /**
     * @param contractDt the contractDt to set
     */
    public void setContractDt(Date contractDt) {
        this.contractDt = contractDt;
    }

    /**
     * @return the saleEmpNo
     */
    public String getSaleEmpNo() {
        return saleEmpNo;
    }

    /**
     * @param saleEmpNo the saleEmpNo to set
     */
    public void setSaleEmpNo(String saleEmpNo) {
        this.saleEmpNo = saleEmpNo;
    }

    /**
     * @return the saleEmpNm
     */
    public String getSaleEmpNm() {
        return saleEmpNm;
    }

    /**
     * @param saleEmpNm the saleEmpNm to set
     */
    public void setSaleEmpNm(String saleEmpNm) {
        this.saleEmpNm = saleEmpNm;
    }

    /**
     * @return the saleMngNm
     */
    public String getSaleMngNm() {
        return saleMngNm;
    }

    /**
     * @param saleMngNm the saleMngNm to set
     */
    public void setSaleMngNm(String saleMngNm) {
        this.saleMngNm = saleMngNm;
    }

    /**
     * @return the contractCustNo
     */
    public String getContractCustNo() {
        return contractCustNo;
    }

    /**
     * @param contractCustNo the contractCustNo to set
     */
    public void setContractCustNo(String contractCustNo) {
        this.contractCustNo = contractCustNo;
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
     * @return the custTp
     */
    public String getCustTp() {
        return custTp;
    }

    /**
     * @param custTp the custTp to set
     */
    public void setCustTp(String custTp) {
        this.custTp = custTp;
    }

    /**
     * @return the telNo1
     */
    public String getTelNo1() {
        return telNo1;
    }

    /**
     * @param telNo1 the telNo1 to set
     */
    public void setTelNo1(String telNo1) {
        this.telNo1 = telNo1;
    }

    /**
     * @return the telNo2
     */
    public String getTelNo2() {
        return telNo2;
    }

    /**
     * @param telNo2 the telNo2 to set
     */
    public void setTelNo2(String telNo2) {
        this.telNo2 = telNo2;
    }

    /**
     * @return the mathDocTp
     */
    public String getMathDocTp() {
        return mathDocTp;
    }

    /**
     * @param mathDocTp the mathDocTp to set
     */
    public void setMathDocTp(String mathDocTp) {
        this.mathDocTp = mathDocTp;
    }

    /**
     * @return the ssnCrnNo
     */
    public String getSsnCrnNo() {
        return ssnCrnNo;
    }

    /**
     * @param ssnCrnNo the ssnCrnNo to set
     */
    public void setSsnCrnNo(String ssnCrnNo) {
        this.ssnCrnNo = ssnCrnNo;
    }

    /**
     * @return the dlReqDt
     */
    public Date getDlReqDt() {
        return dlReqDt;
    }

    /**
     * @param dlReqDt the dlReqDt to set
     */
    public void setDlReqDt(Date dlReqDt) {
        this.dlReqDt = dlReqDt;
    }

    /**
     * @return the confirmDt
     */
    public Date getConfirmDt() {
        return confirmDt;
    }

    /**
     * @param confirmDt the confirmDt to set
     */
    public void setConfirmDt(Date confirmDt) {
        this.confirmDt = confirmDt;
    }

    /**
     * @return the cancDt
     */
    public Date getCancDt() {
        return cancDt;
    }

    /**
     * @param cancDt the cancDt to set
     */
    public void setCancDt(Date cancDt) {
        this.cancDt = cancDt;
    }

    /**
     * @return the saleOpptSeq
     */
    public int getSaleOpptSeq() {
        return saleOpptSeq;
    }

    /**
     * @param saleOpptSeq the saleOpptSeq to set
     */
    public void setSaleOpptSeq(int saleOpptSeq) {
        this.saleOpptSeq = saleOpptSeq;
    }

    /**
     * @return the payTp
     */
    public String getPayTp() {
        return payTp;
    }

    /**
     * @param payTp the payTp to set
     */
    public void setPayTp(String payTp) {
        this.payTp = payTp;
    }

    /**
     * @return the carlineCnt
     */
    public Double getCarlineCnt() {
        return carlineCnt;
    }

    /**
     * @param carlineCnt the carlineCnt to set
     */
    public void setCarlineCnt(Double carlineCnt) {
        this.carlineCnt = carlineCnt;
    }

    /**
     * @return the carCnt
     */
    public Double getCarCnt() {
        return carCnt;
    }

    /**
     * @param carCnt the carCnt to set
     */
    public void setCarCnt(Double carCnt) {
        this.carCnt = carCnt;
    }

    /**
     * @return the totSaleAmt
     */
    public Double getTotSaleAmt() {
        return totSaleAmt;
    }

    /**
     * @param totSaleAmt the totSaleAmt to set
     */
    public void setTotSaleAmt(Double totSaleAmt) {
        this.totSaleAmt = totSaleAmt;
    }

    /**
     * @return the lv2DlrYn
     */
    public String getLv2DlrYn() {
        return lv2DlrYn;
    }

    /**
     * @param lv2DlrYn the lv2DlrYn to set
     */
    public void setLv2DlrYn(String lv2DlrYn) {
        this.lv2DlrYn = lv2DlrYn;
    }

    /**
     * @return the lv2DlrOrgCd
     */
    public String getLv2DlrOrgCd() {
        return lv2DlrOrgCd;
    }

    /**
     * @param lv2DlrOrgCd the lv2DlrOrgCd to set
     */
    public void setLv2DlrOrgCd(String lv2DlrOrgCd) {
        this.lv2DlrOrgCd = lv2DlrOrgCd;
    }

    /**
     * @return the lv2DlrOrgNm
     */
    public String getLv2DlrOrgNm() {
        return lv2DlrOrgNm;
    }

    /**
     * @param lv2DlrOrgNm the lv2DlrOrgNm to set
     */
    public void setLv2DlrOrgNm(String lv2DlrOrgNm) {
        this.lv2DlrOrgNm = lv2DlrOrgNm;
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
     * @return the oResult
     */
    public long getoResult() {
        return oResult;
    }

    /**
     * @param oResult the oResult to set
     */
    public void setoResult(long oResult) {
        this.oResult = oResult;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
