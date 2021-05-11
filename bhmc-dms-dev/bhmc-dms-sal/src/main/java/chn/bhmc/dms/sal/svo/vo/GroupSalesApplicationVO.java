package chn.bhmc.dms.sal.svo.vo;

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
 * @ClassName   : GroupSalesApplicationVO
 * @Description : 집단판매신청 조회 VO
 * @author Bong
 * @since 2016. 3. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016.03.20      Bong              최초 생성
 * </pre>
 */
@ValidDescriptor({

   })
public class GroupSalesApplicationVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2396054457495152808L;

    private  String          dlrCd;
    private  String          usrId;
    private  int             reqSeq;


    private  String          applyNo;
    private  int             reqQty;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            applyDt;
    private  String          approveCd;
    private  String          orgApproveCd;
    private  int             assignQty;


    private  String          dlrNm;
    private  String          dlrArea;

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

    private  double          retlAmt;
    private  double          rcptAmt;
    private  double          dcAmt;
    private  String          fileDocId;

    private double           whPrc;



    //파일관련
    private  String          contractFileNm;
    private  String          bussLicenceFileNm;
    private  String          etcFileNm;
    private  String          addFileNm;
    private  String          contractFileNo;
    private  String          bussLicenceFileNo;
    private  String          etcFileNo;
    private  String          addFileNo;
    private  String 		 headFileDocId;
    private  String          bussLicenceNo;

    private  String 		 submitGubun;
    private  String 		 telNo;

    private  String          sCallType; //신청or심사호출구분

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date             evalDt;

    private String           approveNm;
    private String           atcDstinNm;

    private String           reqSalNo;

    private String           lastApproveDt;
    private String           ordTpNm;
    private String           vinNo;
    private String           modelNm;
    private String           ocnCd;
    private String           extColorCd;
    private String           intColorCd;
    private String           msPrc;
    private String           dcRate;
    private String           carlineNm;
    private String           aldy;
  //R19082700486 集团销售申请重复提交车辆问题改善方案 贾明 2019-8-29 start
    private String           applicaNum;   //申请号码
  //R19082700486 集团销售申请重复提交车辆问题改善方案 贾明 2019-8-29 end
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
     * @return the orgApproveCd
     */
    public String getOrgApproveCd() {
        return orgApproveCd;
    }
    /**
     * @param orgApproveCd the orgApproveCd to set
     */
    public void setOrgApproveCd(String orgApproveCd) {
        this.orgApproveCd = orgApproveCd;
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
     * @return the dlrArea
     */
    public String getDlrArea() {
        return dlrArea;
    }
    /**
     * @param dlrArea the dlrArea to set
     */
    public void setDlrArea(String dlrArea) {
        this.dlrArea = dlrArea;
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
     * @return the retlAmt
     */
    public double getRetlAmt() {
        return retlAmt;
    }
    /**
     * @param retlAmt the retlAmt to set
     */
    public void setRetlAmt(double retlAmt) {
        this.retlAmt = retlAmt;
    }
    /**
     * @return the rcptAmt
     */
    public double getRcptAmt() {
        return rcptAmt;
    }
    /**
     * @param rcptAmt the rcptAmt to set
     */
    public void setRcptAmt(double rcptAmt) {
        this.rcptAmt = rcptAmt;
    }
    /**
     * @return the dcAmt
     */
    public double getDcAmt() {
        return dcAmt;
    }
    /**
     * @param dcAmt the dcAmt to set
     */
    public void setDcAmt(double dcAmt) {
        this.dcAmt = dcAmt;
    }
    /**
     * @return the fileDocId
     */
    public String getFileDocId() {
        return fileDocId;
    }
    /**
     * @param fileDocId the fileDocId to set
     */
    public void setFileDocId(String fileDocId) {
        this.fileDocId = fileDocId;
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
     * @return the headFileDocId
     */
    public String getHeadFileDocId() {
        return headFileDocId;
    }
    /**
     * @param headFileDocId the headFileDocId to set
     */
    public void setHeadFileDocId(String headFileDocId) {
        this.headFileDocId = headFileDocId;
    }
    /**
     * @return the bussLicenceNo
     */
    public String getBussLicenceNo() {
        return bussLicenceNo;
    }
    /**
     * @param bussLicenceNo the bussLicenceNo to set
     */
    public void setBussLicenceNo(String bussLicenceNo) {
        this.bussLicenceNo = bussLicenceNo;
    }
    /**
     * @return the submitGubun
     */
    public String getSubmitGubun() {
        return submitGubun;
    }
    /**
     * @param submitGubun the submitGubun to set
     */
    public void setSubmitGubun(String submitGubun) {
        this.submitGubun = submitGubun;
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
     * @return the sCallType
     */
    public String getsCallType() {
        return sCallType;
    }
    /**
     * @param sCallType the sCallType to set
     */
    public void setsCallType(String sCallType) {
        this.sCallType = sCallType;
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
     * @return the reqSalNo
     */
    public String getReqSalNo() {
        return reqSalNo;
    }
    /**
     * @param reqSalNo the reqSalNo to set
     */
    public void setReqSalNo(String reqSalNo) {
        this.reqSalNo = reqSalNo;
    }
    /**
     * @return the lastApproveDt
     */
    public String getLastApproveDt() {
        return lastApproveDt;
    }
    /**
     * @param lastApproveDt the lastApproveDt to set
     */
    public void setLastApproveDt(String lastApproveDt) {
        this.lastApproveDt = lastApproveDt;
    }
    /**
     * @return the ordTpNm
     */
    public String getOrdTpNm() {
        return ordTpNm;
    }
    /**
     * @param ordTpNm the ordTpNm to set
     */
    public void setOrdTpNm(String ordTpNm) {
        this.ordTpNm = ordTpNm;
    }
    /**
     * @return the vinNm
     */
    public String getVinNo() {
        return vinNo;
    }
    /**
     * @param vinNm the vinNm to set
     */
    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }
    /**
     * @return the modelNm
     */
    public String getModelNm() {
        return modelNm;
    }
    /**
     * @param modelNm the modelNm to set
     */
    public void setModelNm(String modelNm) {
        this.modelNm = modelNm;
    }
    /**
     * @return the ocnCd
     */
    public String getOcnCd() {
        return ocnCd;
    }
    /**
     * @param ocnCd the ocnCd to set
     */
    public void setOcnCd(String ocnCd) {
        this.ocnCd = ocnCd;
    }
    /**
     * @return the extColorCd
     */
    public String getExtColorCd() {
        return extColorCd;
    }
    /**
     * @param extColorCd the extColorCd to set
     */
    public void setExtColorCd(String extColorCd) {
        this.extColorCd = extColorCd;
    }
    /**
     * @return the intColorCd
     */
    public String getIntColorCd() {
        return intColorCd;
    }
    /**
     * @param intColorCd the intColorCd to set
     */
    public void setIntColorCd(String intColorCd) {
        this.intColorCd = intColorCd;
    }
    /**
     * @return the msPrc
     */
    public String getMsPrc() {
        return msPrc;
    }
    /**
     * @param msPrc the msPrc to set
     */
    public void setMsPrc(String msPrc) {
        this.msPrc = msPrc;
    }
    /**
     * @return the dcRate
     */
    public String getDcRate() {
        return dcRate;
    }
    /**
     * @param dcRate the dcRate to set
     */
    public void setDcRate(String dcRate) {
        this.dcRate = dcRate;
    }
    /**
     * @return the carlineNm
     */
    public String getCarlineNm() {
        return carlineNm;
    }
    /**
     * @param carlineNm the carlineNm to set
     */
    public void setCarlineNm(String carlineNm) {
        this.carlineNm = carlineNm;
    }
    /**
     * @return the aldy
     */
    public String getAldy() {
        return aldy;
    }
    /**
     * @param aldy the aldy to set
     */
    public void setAldy(String aldy) {
        this.aldy = aldy;
    }
    /**
     * @return the applicaNum
     */
	public String getApplicaNum() {
		return applicaNum;
	}
	/**
     * @param applicaNum the applicaNum to set
     */
	public void setApplicaNum(String applicaNum) {
		this.applicaNum = applicaNum;
	}



}