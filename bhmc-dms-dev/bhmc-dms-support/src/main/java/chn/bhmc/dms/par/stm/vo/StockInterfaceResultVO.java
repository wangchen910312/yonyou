package chn.bhmc.dms.par.stm.vo;

import com.fasterxml.jackson.annotation.JsonProperty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * 현재고 VO
 *
 * @ClassName   : StockInOutVO.java
 * @Description : StockInOutVO Class
 * @author Ju Won Lee
 * @since 2016. 1. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 21.     Ju Won Lee     최초 생성
 * </pre>
 */

public class StockInterfaceResultVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3974860811306749868L;

    /**
     * PDC CODE
     */
    @JsonProperty("IVR_PDC")
    private String ivrPdc;

    /**
     * Company
     */
    @JsonProperty("IVR_CMP_KND")
    private String ivrCmpKnd;

    /**
     * Part Number
     */
    @JsonProperty("IVR_PNO")
    private String ivrPno;

    /**
     * General On-Hand
     */
    @JsonProperty("IVR_GEN_OHAD")
    private double ivrGenOhad;

    /**
     * @return the ivrPdc
     */
    public String getIvrPdc() {
        return ivrPdc;
    }

    /**
     * @param ivrPdc the ivrPdc to set
     */
    public void setIvrPdc(String ivrPdc) {
        this.ivrPdc = ivrPdc;
    }

    /**
     * @return the ivrCmpKnd
     */
    public String getIvrCmpKnd() {
        return ivrCmpKnd;
    }

    /**
     * @param ivrCmpKnd the ivrCmpKnd to set
     */
    public void setIvrCmpKnd(String ivrCmpKnd) {
        this.ivrCmpKnd = ivrCmpKnd;
    }

    /**
     * @return the ivrPno
     */
    public String getIvrPno() {
        return ivrPno;
    }

    /**
     * @param ivrPno the ivrPno to set
     */
    public void setIvrPno(String ivrPno) {
        this.ivrPno = ivrPno;
    }

    /**
     * @return the ivrGenOhad
     */
    public double getIvrGenOhad() {
        return ivrGenOhad;
    }

    /**
     * @param ivrGenOhad the ivrGenOhad to set
     */
    public void setIvrGenOhad(double ivrGenOhad) {
        this.ivrGenOhad = ivrGenOhad;
    }

}
