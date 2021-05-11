package chn.bhmc.dms.sal.cnt.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;


/**
 * @ClassName   : ContractBeforeVO
 * @Description : 전략출고(선출고관리) 헤더 조회 VO
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
    @ValidField(field="dlrCd"        , mesgKey="sal.lbl.dlrCd")
   ,@ValidField(field="beContractNo" , mesgKey="sal.lbl.beContractNo")
   })
public class ContractBeforeVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 913028022795765912L;


    /**
     * 딜러코드
     **/
    private  String        dlrCd;

    /**
     * 선출고계약번호
     **/
    private  String        beContractNo;

    /**
     * 계약유형
     **/
    private  String        contractTp;

    /**
     * 계약일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date          contractDt;

    /**
     * 고객코드
     **/
    private  String        custCd;

    /**
     * 고객유형
     **/
    private  String        custTp;

    /**
     * 고객명
     **/
    private  String        custNm;

    /**
     * 전화번호1
     **/
    private  String        telNo1;

    /**
     * 전화번호2
     **/
    private  String        telNo2;

    /**
     * 이메일명
     **/
    private  String        emailNm;

    /**
     * 신분증번호
     **/
    private  String        ssnCrnNo;

    /**
     * 우편번호
     **/
    private  String        zipCd;

    /**
     * 주요인증문서유형
     **/
    private  String        mathDoc;

    /**
     * 성코드
     **/
    private  String        sungCd;

    /**
     * 도시코드
     **/
    private  String        cityCd;

    /**
     * 지역코드
     **/
    private  String        distCd;

    /**
     * 성명
     **/
    private  String        sungNm;

    /**
     * 도시명
     **/
    private  String        cityNm;

    /**
     * 지역명
     **/
    private  String        distNm;

    /**
     * 주소명
     **/
    private  String        addrNm;

    /**
     * 주소상세내용
     **/
    private  String        addrDetlCont;

    /**
     * 지불유형
     **/
    private  String        payTp;

    /**
     * 인도요청일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date          dlReqDt;

    /**
     * 판매담당자
     **/
    private  String        saleEmpNo;

    /**
     * 비고
     **/
    private  String        remark;

    /**
     * 차량수
     */
    private  int           carCnt;

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
     * @return the beContractNo
     */
    public String getBeContractNo() {
        return beContractNo;
    }

    /**
     * @param beContractNo the beContractNo to set
     */
    public void setBeContractNo(String beContractNo) {
        this.beContractNo = beContractNo;
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
     * @return the custCd
     */
    public String getCustCd() {
        return custCd;
    }

    /**
     * @param custCd the custCd to set
     */
    public void setCustCd(String custCd) {
        this.custCd = custCd;
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
     * @return the mathDoc
     */
    public String getMathDoc() {
        return mathDoc;
    }

    /**
     * @param mathDoc the mathDoc to set
     */
    public void setMathDoc(String mathDoc) {
        this.mathDoc = mathDoc;
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
     * @return the carCnt
     */
    public int getCarCnt() {
        return carCnt;
    }

    /**
     * @param carCnt the carCnt to set
     */
    public void setCarCnt(int carCnt) {
        this.carCnt = carCnt;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}
