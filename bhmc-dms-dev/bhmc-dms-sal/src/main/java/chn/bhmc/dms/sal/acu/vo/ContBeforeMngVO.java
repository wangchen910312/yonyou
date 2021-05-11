package chn.bhmc.dms.sal.acu.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ContBeforeMngVO
 * @Description : 예약판매 조회 VO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016. 5. 12.    Kim Jin Suk           최초 생성
 * </pre>
 */

public class ContBeforeMngVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = -11277084450514986L;

    /**
     * 딜러코드        
     **/
    private  String            dlrCd;            
     
    /**
     * 예약판매번호      
     **/
    private  String            beforeNo;         
     
    /**
     * 예약판매상태코드    
     **/
    private  String            beforeStatCd; 
    
    /**
     * 수납정산여부
     */
    private  String            compYn;
     
    /**
     * 예약일자        
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              beforeDt;         

    /**
     * 계약일자        
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              contractDt;
    
    /**
     * 계약예정일자      
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              beforeContractDt; 
     
    /**
     * 판매기회
     */
    private  String            saleOpptNo;
    
    /**
     * 판매기회 일련번호
     **/
    private  String             saleOpptSeq;

    /**
     * 판매사원번호
     */
    private  String            saleEmpNo;
    private  String            saleEmpNm;
    
    /**
     * 차종코드        
     **/
    private  String            carlineCd;        
     
    /**
     * 모델코드        
     **/
    private  String            modelCd;
    
    /**
     * 차관코드
     */
    private  String            fscCd;
     
    /**
     * OCN코드       
     **/
    private  String            ocnCd;            
     
    /**
     * 외장색코드       
     **/
    private  String            extColorCd;       
     
    /**
     * 내장색코드       
     **/
    private  String            intColorCd;       
     
    private  String            carlineNm;
    private  String            modelNm;
    private  String            fscNm;
    private  String            ocnNm;
    private  String            extColorNm;
    private  String            intColorNm;
    
    /**
     * 지도가         
     **/
    private  double            retlAmt;          
     
    /**
     * 예약금액        
     **/
    private  double            beforeAmt;        
     
    /**
     * 수납여부        
     **/
    private  String            implyYn;          
     
    /**
     * 대출은행        
     **/
    private  String            fincBank;         
     
    /**
     * 고객번호        
     **/
    private  String            custNo;           
     
    /**
     * 고객명         
     **/
    private  String            custNm;           
     
    /**
     * 고객유형        
     **/
    private  String            custTp;           
     
    /**
     * 납세번호        
     **/
    private  String            taxpayerNo;       
     
    /**
     * 구매담당자       
     **/
    private  String            purcMngNm;        
     
    /**
     * 신분증유형       
     **/
    private  String            ssnCrnTp;         
     
    /**
     * 신분증번호       
     **/
    private  String            ssnCrnNo;         
     
    /**
     * 전화번호1       
     **/
    private  String            telNo1;           
     
    /**
     * 전화번호2       
     **/
    private  String            telNo2;           
     
    /**
     * 이메일명        
     **/
    private  String            emailNm;          
     
    /**
     * 성코드         
     **/
    private  String            sungCd;           
     
    /**
     * 도시코드        
     **/
    private  String            cityCd;           
     
    /**
     * 지역코드        
     **/
    private  String            distCd;           
     
    /**
     * 성명          
     **/
    private  String            sungNm;           
     
    /**
     * 도시명         
     **/
    private  String            cityNm;           
     
    /**
     * 지역명         
     **/
    private  String            distNm;           
     
    /**
     * 주소명         
     **/
    private  String            addrNm;           
     
    /**
     * 주소상세내용      
     **/
    private  String            addrDetlCont;     
     
    /**
     * 주소유형(CRM033)
     **/
    private  String            addrTp;           
    
    /**
     * 우편번호
     **/
    private  String            zipCd;  
    
    /**
     * 계약번호
     **/
    private  String            contractNo;
    
    /**
     * 등록자ID       
     **/
    private  String            regUsrId;         
     
    /**
     * 등록일자        
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              regDt;            
     
    /**
     * 수정자ID       
     **/
    private  String            updtUsrId;        
     
    /**
     * 수정일자        
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              updtDt;

    
    private  String            mFlag;
    
    
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
     * @return the beforeNo
     */
    public String getBeforeNo() {
        return beforeNo;
    }

    /**
     * @param beforeNo the beforeNo to set
     */
    public void setBeforeNo(String beforeNo) {
        this.beforeNo = beforeNo;
    }

    /**
     * @return the beforeStatCd
     */
    public String getBeforeStatCd() {
        return beforeStatCd;
    }

    /**
     * @param beforeStatCd the beforeStatCd to set
     */
    public void setBeforeStatCd(String beforeStatCd) {
        this.beforeStatCd = beforeStatCd;
    }

    /**
     * @return the compYn
     */
    public String getCompYn() {
        return compYn;
    }

    /**
     * @param compYn the compYn to set
     */
    public void setCompYn(String compYn) {
        this.compYn = compYn;
    }

    /**
     * @return the beforeDt
     */
    public Date getBeforeDt() {
        return beforeDt;
    }

    /**
     * @param beforeDt the beforeDt to set
     */
    public void setBeforeDt(Date beforeDt) {
        this.beforeDt = beforeDt;
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
     * @return the beforeContractDt
     */
    public Date getBeforeContractDt() {
        return beforeContractDt;
    }

    /**
     * @param beforeContractDt the beforeContractDt to set
     */
    public void setBeforeContractDt(Date beforeContractDt) {
        this.beforeContractDt = beforeContractDt;
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
     * @return the saleOpptSeq
     */
    public String getSaleOpptSeq() {
        return saleOpptSeq;
    }

    /**
     * @param saleOpptSeq the saleOpptSeq to set
     */
    public void setSaleOpptSeq(String saleOpptSeq) {
        this.saleOpptSeq = saleOpptSeq;
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
     * @return the carlineCd
     */
    public String getCarlineCd() {
        return carlineCd;
    }

    /**
     * @param carlineCd the carlineCd to set
     */
    public void setCarlineCd(String carlineCd) {
        this.carlineCd = carlineCd;
    }

    /**
     * @return the modelCd
     */
    public String getModelCd() {
        return modelCd;
    }

    /**
     * @param modelCd the modelCd to set
     */
    public void setModelCd(String modelCd) {
        this.modelCd = modelCd;
    }

    /**
     * @return the fscCd
     */
    public String getFscCd() {
        return fscCd;
    }

    /**
     * @param fscCd the fscCd to set
     */
    public void setFscCd(String fscCd) {
        this.fscCd = fscCd;
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
     * @return the fscNm
     */
    public String getFscNm() {
        return fscNm;
    }

    /**
     * @param fscNm the fscNm to set
     */
    public void setFscNm(String fscNm) {
        this.fscNm = fscNm;
    }

    /**
     * @return the ocnNm
     */
    public String getOcnNm() {
        return ocnNm;
    }

    /**
     * @param ocnNm the ocnNm to set
     */
    public void setOcnNm(String ocnNm) {
        this.ocnNm = ocnNm;
    }

    /**
     * @return the extColorNm
     */
    public String getExtColorNm() {
        return extColorNm;
    }

    /**
     * @param extColorNm the extColorNm to set
     */
    public void setExtColorNm(String extColorNm) {
        this.extColorNm = extColorNm;
    }

    /**
     * @return the intColorNm
     */
    public String getIntColorNm() {
        return intColorNm;
    }

    /**
     * @param intColorNm the intColorNm to set
     */
    public void setIntColorNm(String intColorNm) {
        this.intColorNm = intColorNm;
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
     * @return the beforeAmt
     */
    public double getBeforeAmt() {
        return beforeAmt;
    }

    /**
     * @param beforeAmt the beforeAmt to set
     */
    public void setBeforeAmt(double beforeAmt) {
        this.beforeAmt = beforeAmt;
    }

    /**
     * @return the implyYn
     */
    public String getImplyYn() {
        return implyYn;
    }

    /**
     * @param implyYn the implyYn to set
     */
    public void setImplyYn(String implyYn) {
        this.implyYn = implyYn;
    }

    /**
     * @return the fincBank
     */
    public String getFincBank() {
        return fincBank;
    }

    /**
     * @param fincBank the fincBank to set
     */
    public void setFincBank(String fincBank) {
        this.fincBank = fincBank;
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
     * @return the taxpayerNo
     */
    public String getTaxpayerNo() {
        return taxpayerNo;
    }

    /**
     * @param taxpayerNo the taxpayerNo to set
     */
    public void setTaxpayerNo(String taxpayerNo) {
        this.taxpayerNo = taxpayerNo;
    }

    /**
     * @return the purcMngNm
     */
    public String getPurcMngNm() {
        return purcMngNm;
    }

    /**
     * @param purcMngNm the purcMngNm to set
     */
    public void setPurcMngNm(String purcMngNm) {
        this.purcMngNm = purcMngNm;
    }

    /**
     * @return the ssnCrnTp
     */
    public String getSsnCrnTp() {
        return ssnCrnTp;
    }

    /**
     * @param ssnCrnTp the ssnCrnTp to set
     */
    public void setSsnCrnTp(String ssnCrnTp) {
        this.ssnCrnTp = ssnCrnTp;
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
     * @return the emailNm
     */
    public String getEmailNm() {
        return emailNm;
    }

    /**
     * @param emailNm the emailNm to set
     */
    public void setEmailNm(String emailNm) {
        this.emailNm = emailNm;
    }

    /**
     * @return the sungCd
     */
    public String getSungCd() {
        return sungCd;
    }

    /**
     * @param sungCd the sungCd to set
     */
    public void setSungCd(String sungCd) {
        this.sungCd = sungCd;
    }

    /**
     * @return the cityCd
     */
    public String getCityCd() {
        return cityCd;
    }

    /**
     * @param cityCd the cityCd to set
     */
    public void setCityCd(String cityCd) {
        this.cityCd = cityCd;
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
     * @return the sungNm
     */
    public String getSungNm() {
        return sungNm;
    }

    /**
     * @param sungNm the sungNm to set
     */
    public void setSungNm(String sungNm) {
        this.sungNm = sungNm;
    }

    /**
     * @return the cityNm
     */
    public String getCityNm() {
        return cityNm;
    }

    /**
     * @param cityNm the cityNm to set
     */
    public void setCityNm(String cityNm) {
        this.cityNm = cityNm;
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
     * @return the addrNm
     */
    public String getAddrNm() {
        return addrNm;
    }

    /**
     * @param addrNm the addrNm to set
     */
    public void setAddrNm(String addrNm) {
        this.addrNm = addrNm;
    }

    /**
     * @return the addrDetlCont
     */
    public String getAddrDetlCont() {
        return addrDetlCont;
    }

    /**
     * @param addrDetlCont the addrDetlCont to set
     */
    public void setAddrDetlCont(String addrDetlCont) {
        this.addrDetlCont = addrDetlCont;
    }

    /**
     * @return the addrTp
     */
    public String getAddrTp() {
        return addrTp;
    }

    /**
     * @param addrTp the addrTp to set
     */
    public void setAddrTp(String addrTp) {
        this.addrTp = addrTp;
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
     * @return the mFlag
     */
    public String getmFlag() {
        return mFlag;
    }

    /**
     * @param mFlag the mFlag to set
     */
    public void setmFlag(String mFlag) {
        this.mFlag = mFlag;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }           
}