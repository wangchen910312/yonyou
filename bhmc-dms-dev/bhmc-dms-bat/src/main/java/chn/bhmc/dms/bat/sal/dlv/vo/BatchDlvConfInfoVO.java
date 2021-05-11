package chn.bhmc.dms.bat.sal.dlv.vo;

import chn.bhmc.dms.core.datatype.BaseVO;


/**
 * @ClassName   : BatchDlvConfInfoVO
 * @Description : 이월소매취소심사완료알림
 * @author Lee Seungmin
 * @since 2017. 3. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 3. 12.    Lee Seungmin            최초 생성
 */

public class BatchDlvConfInfoVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6566957561593005832L;


    private String vinNo;
    private String callTp;
    private String contractNo;
    private String saleEmpNo;
    private String retlTpCd;
    private String dlrCd;
    private String carId;
    private String contractCustNo;
    private String custCd;
    private String custNo;
    private String saleOpptNo;
    private String spFlag;
    private String seq;

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    /**
     * @return the vinNo
     */
    public String getVinNo() {
        return vinNo;
    }
    /**
     * @return the callTp
     */
    public String getCallTp() {
        return callTp;
    }
    /**
     * @return the contractNo
     */
    public String getContractNo() {
        return contractNo;
    }
    /**
     * @return the saleEmpNo
     */
    public String getSaleEmpNo() {
        return saleEmpNo;
    }
    /**
     * @return the retlTpCd
     */
    public String getRetlTpCd() {
        return retlTpCd;
    }
    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }
    /**
     * @return the carId
     */
    public String getCarId() {
        return carId;
    }
    /**
     * @return the contractCustNo
     */
    public String getContractCustNo() {
        return contractCustNo;
    }
    /**
     * @param vinNo the vinNo to set
     */
    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }
    /**
     * @param callTp the callTp to set
     */
    public void setCallTp(String callTp) {
        this.callTp = callTp;
    }
    /**
     * @param contractNo the contractNo to set
     */
    public void setContractNo(String contractNo) {
        this.contractNo = contractNo;
    }
    /**
     * @param saleEmpNo the saleEmpNo to set
     */
    public void setSaleEmpNo(String saleEmpNo) {
        this.saleEmpNo = saleEmpNo;
    }
    /**
     * @param retlTpCd the retlTpCd to set
     */
    public void setRetlTpCd(String retlTpCd) {
        this.retlTpCd = retlTpCd;
    }
    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }
    /**
     * @param carId the carId to set
     */
    public void setCarId(String carId) {
        this.carId = carId;
    }
    /**
     * @param contractCustNo the contractCustNo to set
     */
    public void setContractCustNo(String contractCustNo) {
        this.contractCustNo = contractCustNo;
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
     * @return the spFlag
     */
    public String getSpFlag() {
        return spFlag;
    }
    /**
     * @param spFlag the spFlag to set
     */
    public void setSpFlag(String spFlag) {
        this.spFlag = spFlag;
    }
    /**
     * @return the seq
     */
    public String getSeq() {
        return seq;
    }
    /**
     * @param seq the seq to set
     */
    public void setSeq(String seq) {
        this.seq = seq;
    }


}