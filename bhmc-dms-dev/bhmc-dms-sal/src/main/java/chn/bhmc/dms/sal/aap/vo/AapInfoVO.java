package chn.bhmc.dms.sal.aap.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * @ClassName   : AapInfoVO
 * @Description : 클래스 설명을 기술합니다.
 * @author KIMJINSUK
 * @since 2016. 4. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 14.     KimJinSuk             최초 생성
 *
 * </pre>
 */

public class AapInfoVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = -3434497305317235982L;

    /**
     * 딜러코드  
     **/
    private  String      dlrCd;      
     
    /**
     * 계약번호  
     **/
    private  String      contractNo; 
    
    /**
     * 계약일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date        contractDt;
    
    /**
     * 계약고객
     */
    private  String      custNo;

    /**
     * 계약고객
     */
    private  String      custNm;
    
    /**
     * 대행업무유형
     **/
    private  String      aapWorkTp;  
     
    /**
     * 실제금액  
     **/
    private  Double      realAapAmt; 
    
    /**
     * 판매인 사번
     */
    private  String      saleEmpNo;
    
    /**
     * 비고    
     **/
    private  String      rmk;        

    /**
     * 계약금포함여부
     */
    private  String      aapImplyYn;
    
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
     * @return the aapWorkTp
     */
    public String getAapWorkTp() {
        return aapWorkTp;
    }
    /**
     * @param aapWorkTp the aapWorkTp to set
     */
    public void setAapWorkTp(String aapWorkTp) {
        this.aapWorkTp = aapWorkTp;
    }
    /**
     * @return the realAapAmt
     */
    public Double getRealAapAmt() {
        return realAapAmt;
    }
    /**
     * @param realAapAmt the realAapAmt to set
     */
    public void setRealAapAmt(Double realAapAmt) {
        this.realAapAmt = realAapAmt;
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
     * @return the rmk
     */
    public String getRmk() {
        return rmk;
    }
    /**
     * @param rmk the rmk to set
     */
    public void setRmk(String rmk) {
        this.rmk = rmk;
    }
    
    /**
     * @return the aapImplyYn
     */
    public String getAapImplyYn() {
        return aapImplyYn;
    }
    /**
     * @param aapImplyYn the aapImplyYn to set
     */
    public void setAapImplyYn(String aapImplyYn) {
        this.aapImplyYn = aapImplyYn;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }     
    
}