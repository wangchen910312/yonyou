package chn.bhmc.dms.bat.sal.usc.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

import chn.bhmc.dms.core.datatype.BaseVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchSalesUsedVehiclePurcVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Lee Seungmin
 * @since 2017. 2. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 1.     Lee Seungmin     최초 생성
 * </pre>
 */

public class BatchSalesPurcVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1949258238699913404L;
    private String regUsrId;
    private String purcNo;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date                   amtRtnDt;
    private String purcCustNo;
    private String dlrCd;
    private String custNm;
    private String vinNo;

    /**
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }
    /**
     * @return the purcNo
     */
    public String getPurcNo() {
        return purcNo;
    }
    /**
     * @return the purcCustNo
     */
    public String getPurcCustNo() {
        return purcCustNo;
    }
    /**
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
    }
    /**
     * @param purcNo the purcNo to set
     */
    public void setPurcNo(String purcNo) {
        this.purcNo = purcNo;
    }
    /**
     * @param purcCustNo the purcCustNo to set
     */
    public void setPurcCustNo(String purcCustNo) {
        this.purcCustNo = purcCustNo;
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
     * @return the amtRtnDt
     */
    public Date getAmtRtnDt() {
        return amtRtnDt;
    }
    /**
     * @param amtRtnDt the amtRtnDt to set
     */
    public void setAmtRtnDt(Date amtRtnDt) {
        this.amtRtnDt = amtRtnDt;
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





}
