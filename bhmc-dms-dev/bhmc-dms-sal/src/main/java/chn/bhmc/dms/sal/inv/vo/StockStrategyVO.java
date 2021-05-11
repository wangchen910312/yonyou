 package chn.bhmc.dms.sal.inv.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * @ClassName   : StockStrategyVO
 * @Description : 전략출고관리 VO
 * @author Jin Suk Kim
 * @since 2016. 3. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 11. 24.     Jin Suk Kim     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="dlrCd"        , mesgKey="sal.lbl.dlrCd")
   ,@ValidField(field="strNo"        , mesgKey="sal.lbl.strNo")
   ,@ValidField(field="carId"        , mesgKey="sal.lbl.carId")
   ,@ValidField(field="vinNo"        , mesgKey="sal.lbl.vinNo")
   ,@ValidField(field="regUsrId"     , mesgKey="sal.lbl.regUsrId")
   ,@ValidField(field="regDt"        , mesgKey="sal.lbl.regDt")
   })
public class StockStrategyVO extends BaseVO{
    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = 8393127874622307109L;

    /**
     * 딜러코드     
     **/
    private  String        dlrCd;        
    private  String        dlrNm;

    /**
     * 차량ID     
     **/
    private  String        carId;   
    
    /**
     * 전략출고 번호  
     **/
    private  String        strNo;        
     
    /**
     * 차대번호     
     **/
    private  String        vinNo;        
     
    /**
     * 전략출고 심사상태
     **/
    //STR_STAT
    private  String        strStat;
    private  String        strStatNm;
     
    /**
     * 전략출고 신청일자
     **/
    //STR_ASK_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date          strAskDt;     
     
    /**
     * 전략출고 심사일자
     **/
    //STR_CONFIRM_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date          strConfirmDt; 
     
    /**
     * 심사자      
     **/
    //CONFIRM_USR_ID
    private  String        confirmUsrId; 
     
    /**
     * 심사비고     
     **/
    //CONFIRM_REMARK
    private  String        confirmRemark;
     
    /**
     * 차종코드     
     **/
    //CARLINE_CD
    private  String        carlineCd;
    private  String        carlineNm;
    
    /**
     * 모델코드     
     **/
    //MODEL_CD
    private  String        modelCd;      
    private  String        modelNm;
    
    /**
     * OCN코드    
     **/
    //OCN_CD
    private  String        ocnCd;        
    private  String        ocnNm;
    
    /**
     * 외장색상코드   
     **/
    //EXT_COLOR_CD
    private  String        extColorCd;   
    private  String        extColorNm;
    
    /**
     * 내장색상코드   
     **/
    //INT_COLOR_CD
    private  String        intColorCd;   
    private  String        intColorNm;
    
    /**
     * 오더유형     
     **/
    //ORD_TP
    private  String        ordTp;
    private  String        ordTpNm;
     
    /**
     * 고객코드     
     **/
    //CUST_CD
    private  String        custCd;       
     
    /**
     * 고객명      
     **/
    //CUST_NM
    private  String        custNm;       
     
    /**
     * 비고       
     **/
    //REMARK
    private  String        remark;       
     
    /**
     * 계약번호     
     **/
    //CONTRACT_NO
    private  String        contractNo;   
     
    /**
     * 취소일자     
     **/
    //CANC_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date          cancDt;       
     
    /**
     * 취소사유     
     **/
    //CAANC_RESON
    private  String        caancReson;

    /**
     * 전략출고 여부
     **/
    private  String        strYn;
    
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
     * @return the carId
     */
    public String getCarId() {
        return carId;
    }

    /**
     * @param carId the carId to set
     */
    public void setCarId(String carId) {
        this.carId = carId;
    }

    /**
     * @return the strNo
     */
    public String getStrNo() {
        return strNo;
    }

    /**
     * @param strNo the strNo to set
     */
    public void setStrNo(String strNo) {
        this.strNo = strNo;
    }

    /**
     * @return the vinNo
     */
    public String getVinNo() {
        return vinNo;
    }

    /**
     * @param vinNo the vinNo to set
     */
    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }

    /**
     * @return the strStat
     */
    public String getStrStat() {
        return strStat;
    }

    /**
     * @param strStat the strStat to set
     */
    public void setStrStat(String strStat) {
        this.strStat = strStat;
    }

    /**
     * @return the strStatNm
     */
    public String getStrStatNm() {
        return strStatNm;
    }

    /**
     * @param strStatNm the strStatNm to set
     */
    public void setStrStatNm(String strStatNm) {
        this.strStatNm = strStatNm;
    }

    /**
     * @return the strAskDt
     */
    public Date getStrAskDt() {
        return strAskDt;
    }

    /**
     * @param strAskDt the strAskDt to set
     */
    public void setStrAskDt(Date strAskDt) {
        this.strAskDt = strAskDt;
    }

    /**
     * @return the strConfirmDt
     */
    public Date getStrConfirmDt() {
        return strConfirmDt;
    }

    /**
     * @param strConfirmDt the strConfirmDt to set
     */
    public void setStrConfirmDt(Date strConfirmDt) {
        this.strConfirmDt = strConfirmDt;
    }

    /**
     * @return the confirmUsrId
     */
    public String getConfirmUsrId() {
        return confirmUsrId;
    }

    /**
     * @param confirmUsrId the confirmUsrId to set
     */
    public void setConfirmUsrId(String confirmUsrId) {
        this.confirmUsrId = confirmUsrId;
    }

    /**
     * @return the confirmRemark
     */
    public String getConfirmRemark() {
        return confirmRemark;
    }

    /**
     * @param confirmRemark the confirmRemark to set
     */
    public void setConfirmRemark(String confirmRemark) {
        this.confirmRemark = confirmRemark;
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
     * @return the ordTp
     */
    public String getOrdTp() {
        return ordTp;
    }

    /**
     * @param ordTp the ordTp to set
     */
    public void setOrdTp(String ordTp) {
        this.ordTp = ordTp;
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
     * @return the caancReson
     */
    public String getCaancReson() {
        return caancReson;
    }

    /**
     * @param caancReson the caancReson to set
     */
    public void setCaancReson(String caancReson) {
        this.caancReson = caancReson;
    }
    
    /**
     * @return the strYn
     */
    public String getStrYn() {
        return strYn;
    }

    /**
     * @param strYn the strYn to set
     */
    public void setStrYn(String strYn) {
        this.strYn = strYn;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}