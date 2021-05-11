package chn.bhmc.dms.sal.svi.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : GroupSalesReviewVO
 * @Description : 집단판매심사 조회 VO
 * @author Bong
 * @since 2016. 4. 08.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016.04.08      Bong              최초 생성
 * </pre>
 */
@ValidDescriptor({

   })
public class GroupSalesReviewVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2396054457495152808L;

    private  String          dlrCd;
    private  String          usrId;
    private  int             reqSeq;
    private  int             reqNo;


    private  String          applyNo;
    private  int             reqQty;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            applyDt;
    private  String          approveCd;
    private  int             assignQty;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            evalDt;
    private  String          evalRsltYn;
    private  String          remark;

    private  String          dlrNm;
    private  String          distCd;

    private  String          custNm;
    private  String          prsnId;
    private  String          zipCd;

    private  String          addr;

    private  String          hpNo;
    private  String          faxNo;

    private  String          atcDstinCd;
    private  String          atcCont;

    private  String          carUseTp;
    private  String          prsnDlrCd;
    private  String          prsnDlrTelNo;

    private  String          longDcssYn;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            carAllocHopeDt;

    private  String          regUsrId;
    private  String          updtUsrId;


    private  String          approveNm;
    private  String          atcDstinNm;
    private  String          distNm;
    private  String          evalRsltYnNm;
    private  String          evalYn;
    private  String          pevalId;

    private double          realAmt;
    private String          contractDocSeq;
    private String          crnDocSeq;
    private String          etcDocSeq;
    private String          addFileSeq;
    private String          telNo;
    private String          officeNm;

    private String contractFileNm;
    private String bussLicenceFileNm;
    private String etcFileNm;
    private String addFileNm;
    private String contractFileNo;
    private String bussLicenceFileNo;
    private String etcFileNo;
    private String addFileNo;

    private double aamt;
    private double damt;
    private double dcRate;
    private double whPrc;

    public String getPevalId() {
        return pevalId;
    }

    public void setPevalId(String pevalId) {
        this.pevalId = pevalId;
    }

    public String getEvalYn() {
        return evalYn;
    }

    public void setEvalYn(String evalYn) {
        this.evalYn = evalYn;
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
     * @return the reqSeq
     */
    public int getReqSeq() {
        return reqSeq;
    }

    /**
     * @param reqSeq the reqSeq to set
     */
    public void setReqSeq(int reqSeq) {
        this.reqSeq = reqSeq;
    }

    /**
     * @return the applyNo
     */
    public String getApplyNo() {
        return applyNo;
    }

    /**
     * @param applyNo the applyNo to set
     */
    public void setApplyNo(String applyNo) {
        this.applyNo = applyNo;
    }

    /**
     * @return the reqQty
     */
    public int getReqQty() {
        return reqQty;
    }

    /**
     * @param reqQty the reqQty to set
     */
    public void setReqQty(int reqQty) {
        this.reqQty = reqQty;
    }

    /**
     * @return the applyDt
     */
    public Date getApplyDt() {
        return applyDt;
    }

    /**
     * @param applyDt the applyDt to set
     */
    public void setApplyDt(Date applyDt) {
        this.applyDt = applyDt;
    }

    /**
     * @return the approveCd
     */
    public String getApproveCd() {
        return approveCd;
    }

    /**
     * @param approveCd the approveCd to set
     */
    public void setApproveCd(String approveCd) {
        this.approveCd = approveCd;
    }

    /**
     * @return the assignQty
     */
    public int getAssignQty() {
        return assignQty;
    }

    /**
     * @param assignQty the assignQty to set
     */
    public void setAssignQty(int assignQty) {
        this.assignQty = assignQty;
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
     * @return the distCd
     */
    public String getDistCd() {
        return distCd;
    }

    /**
     * @param distCd the distCd to set
     */
    public void setDistCd(String distCd) {
        this.distCd = distCd;
    }

    /**
     * @return the dlrNm
     */
    public String getDlrNm() {
        return dlrNm;
    }

    /**
     * @param dlrNm the dlrNm to set
     */
    public void setDlrNm(String dlrNm) {
        this.dlrNm = dlrNm;
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
     * @return the prsnId
     */
    public String getPrsnId() {
        return prsnId;
    }

    /**
     * @param prsnId the prsnId to set
     */
    public void setPrsnId(String prsnId) {
        this.prsnId = prsnId;
    }

    /**
     * @return the zipCd
     */
    public String getZipCd() {
        return zipCd;
    }

    /**
     * @param zipCd the zipCd to set
     */
    public void setZipCd(String zipCd) {
        this.zipCd = zipCd;
    }

    /**
     * @return the addr
     */
    public String getAddr() {
        return addr;
    }

    /**
     * @param addr the addr to set
     */
    public void setAddr(String addr) {
        this.addr = addr;
    }

    /**
     * @return the hpNo
     */
    public String getHpNo() {
        return hpNo;
    }

    /**
     * @param hpNo the hpNo to set
     */
    public void setHpNo(String hpNo) {
        this.hpNo = hpNo;
    }

    /**
     * @return the faxNo
     */
    public String getFaxNo() {
        return faxNo;
    }

    /**
     * @param faxNo the faxNo to set
     */
    public void setFaxNo(String faxNo) {
        this.faxNo = faxNo;
    }

    /**
     * @return the atcDstinCd
     */
    public String getAtcDstinCd() {
        return atcDstinCd;
    }

    /**
     * @param atcDstinCd the atcDstinCd to set
     */
    public void setAtcDstinCd(String atcDstinCd) {
        this.atcDstinCd = atcDstinCd;
    }

    /**
     * @return the atcCont
     */
    public String getAtcCont() {
        return atcCont;
    }

    /**
     * @param atcCont the atcCont to set
     */
    public void setAtcCont(String atcCont) {
        this.atcCont = atcCont;
    }

    /**
     * @return the carUseTp
     */
    public String getCarUseTp() {
        return carUseTp;
    }

    /**
     * @param carUseTp the carUseTp to set
     */
    public void setCarUseTp(String carUseTp) {
        this.carUseTp = carUseTp;
    }

    /**
     * @return the prsnDlrCd
     */
    public String getPrsnDlrCd() {
        return prsnDlrCd;
    }

    /**
     * @param prsnDlrCd the prsnDlrCd to set
     */
    public void setPrsnDlrCd(String prsnDlrCd) {
        this.prsnDlrCd = prsnDlrCd;
    }

    /**
     * @return the prsnDlrTelNo
     */
    public String getPrsnDlrTelNo() {
        return prsnDlrTelNo;
    }

    /**
     * @param prsnDlrTelNo the prsnDlrTelNo to set
     */
    public void setPrsnDlrTelNo(String prsnDlrTelNo) {
        this.prsnDlrTelNo = prsnDlrTelNo;
    }

    /**
     * @return the longDcssYn
     */
    public String getLongDcssYn() {
        return longDcssYn;
    }

    /**
     * @param longDcssYn the longDcssYn to set
     */
    public void setLongDcssYn(String longDcssYn) {
        this.longDcssYn = longDcssYn;
    }

    /**
     * @return the carAllocHopeDt
     */
    public Date getCarAllocHopeDt() {
        return carAllocHopeDt;
    }

    /**
     * @param carAllocHopeDt the carAllocHopeDt to set
     */
    public void setCarAllocHopeDt(Date carAllocHopeDt) {
        this.carAllocHopeDt = carAllocHopeDt;
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
     * @return the approveNm
     */
    public String getApproveNm() {
        return approveNm;
    }

    /**
     * @param approveNm the approveNm to set
     */
    public void setApproveNm(String approveNm) {
        this.approveNm = approveNm;
    }

    /**
     * @return the atcDstinNm
     */
    public String getAtcDstinNm() {
        return atcDstinNm;
    }

    /**
     * @param atcDstinNm the atcDstinNm to set
     */
    public void setAtcDstinNm(String atcDstinNm) {
        this.atcDstinNm = atcDstinNm;
    }

    /**
     * @return the distNm
     */
    public String getDistNm() {
        return distNm;
    }

    /**
     * @param distNm the distNm to set
     */
    public void setDistNm(String distNm) {
        this.distNm = distNm;
    }

    /**
     * @return the evalRsltYnNm
     */
    public String getEvalRsltYnNm() {
        return evalRsltYnNm;
    }

    /**
     * @param evalRsltYnNm the evalRsltYnNm to set
     */
    public void setEvalRsltYnNm(String evalRsltYnNm) {
        this.evalRsltYnNm = evalRsltYnNm;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }


    /**
     * @return the realAmt
     */
    public double getRealAmt() {
        return realAmt;
    }

    /**
     * @param realAmt the realAmt to set
     */
    public void setRealAmt(double realAmt) {
        this.realAmt = realAmt;
    }

    /**
     * @return the contractDocSeq
     */
    public String getContractDocSeq() {
        return contractDocSeq;
    }

    /**
     * @param contractDocSeq the contractDocSeq to set
     */
    public void setContractDocSeq(String contractDocSeq) {
        this.contractDocSeq = contractDocSeq;
    }

    /**
     * @return the crnDocSeq
     */
    public String getCrnDocSeq() {
        return crnDocSeq;
    }

    /**
     * @param crnDocSeq the crnDocSeq to set
     */
    public void setCrnDocSeq(String crnDocSeq) {
        this.crnDocSeq = crnDocSeq;
    }

    /**
     * @return the etcDocSeq
     */
    public String getEtcDocSeq() {
        return etcDocSeq;
    }

    /**
     * @param etcDocSeq the etcDocSeq to set
     */
    public void setEtcDocSeq(String etcDocSeq) {
        this.etcDocSeq = etcDocSeq;
    }

    /**
     * @return the addFileSeq
     */
    public String getAddFileSeq() {
        return addFileSeq;
    }

    /**
     * @param addFileSeq the addFileSeq to set
     */
    public void setAddFileSeq(String addFileSeq) {
        this.addFileSeq = addFileSeq;
    }

    /**
     * @return the telNo
     */
    public String getTelNo() {
        return telNo;
    }

    /**
     * @param telNo the telNo to set
     */
    public void setTelNo(String telNo) {
        this.telNo = telNo;
    }

    /**
     * @return the officeNm
     */
    public String getOfficeNm() {
        return officeNm;
    }

    /**
     * @param officeNm the officeNm to set
     */
    public void setOfficeNm(String officeNm) {
        this.officeNm = officeNm;
    }

    /**
     * @return the contractFileNm
     */
    public String getContractFileNm() {
        return contractFileNm;
    }

    /**
     * @param contractFileNm the contractFileNm to set
     */
    public void setContractFileNm(String contractFileNm) {
        this.contractFileNm = contractFileNm;
    }

    /**
     * @return the bussLicenceFileNm
     */
    public String getBussLicenceFileNm() {
        return bussLicenceFileNm;
    }

    /**
     * @param bussLicenceFileNm the bussLicenceFileNm to set
     */
    public void setBussLicenceFileNm(String bussLicenceFileNm) {
        this.bussLicenceFileNm = bussLicenceFileNm;
    }

    /**
     * @return the etcFileNm
     */
    public String getEtcFileNm() {
        return etcFileNm;
    }

    /**
     * @param etcFileNm the etcFileNm to set
     */
    public void setEtcFileNm(String etcFileNm) {
        this.etcFileNm = etcFileNm;
    }

    /**
     * @return the addFileNm
     */
    public String getAddFileNm() {
        return addFileNm;
    }

    /**
     * @param addFileNm the addFileNm to set
     */
    public void setAddFileNm(String addFileNm) {
        this.addFileNm = addFileNm;
    }

    /**
     * @return the contractFileNo
     */
    public String getContractFileNo() {
        return contractFileNo;
    }

    /**
     * @param contractFileNo the contractFileNo to set
     */
    public void setContractFileNo(String contractFileNo) {
        this.contractFileNo = contractFileNo;
    }

    /**
     * @return the bussLicenceFileNo
     */
    public String getBussLicenceFileNo() {
        return bussLicenceFileNo;
    }

    /**
     * @param bussLicenceFileNo the bussLicenceFileNo to set
     */
    public void setBussLicenceFileNo(String bussLicenceFileNo) {
        this.bussLicenceFileNo = bussLicenceFileNo;
    }

    /**
     * @return the etcFileNo
     */
    public String getEtcFileNo() {
        return etcFileNo;
    }

    /**
     * @param etcFileNo the etcFileNo to set
     */
    public void setEtcFileNo(String etcFileNo) {
        this.etcFileNo = etcFileNo;
    }

    /**
     * @return the addFileNo
     */
    public String getAddFileNo() {
        return addFileNo;
    }

    /**
     * @param addFileNo the addFileNo to set
     */
    public void setAddFileNo(String addFileNo) {
        this.addFileNo = addFileNo;
    }

    /**
     * @return the aamt
     */
    public double getAamt() {
        return aamt;
    }

    /**
     * @return the damt
     */
    public double getDamt() {
        return damt;
    }

    /**
     * @return the dcRate
     */
    public double getDcRate() {
        return dcRate;
    }

    /**
     * @param aamt the aamt to set
     */
    public void setAamt(double aamt) {
        this.aamt = aamt;
    }

    /**
     * @param damt the damt to set
     */
    public void setDamt(double damt) {
        this.damt = damt;
    }

    /**
     * @param dcRate the dcRate to set
     */
    public void setDcRate(double dcRate) {
        this.dcRate = dcRate;
    }

    /**
     * @return the whPrc
     */
    public double getWhPrc() {
        return whPrc;
    }

    /**
     * @param whPrc the whPrc to set
     */
    public void setWhPrc(double whPrc) {
        this.whPrc = whPrc;
    }

}