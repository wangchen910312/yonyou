package chn.bhmc.dms.ser.svi.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * PDI점검항목 VO
 * </pre>
 *
 * @ClassName   : PDIChkAtcVO.java
 * @Description : PDI점검항목 VO.
 * @author Yin Xueyuan
 * @since 2016. 1. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 27.     Yin Xueyuan     최초 생성
 * </pre>
 */

public class PDIChkAtcVO extends BaseVO {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1861707542021943126L;

    /**
     * 딜러코드
     */
    private String  dlrCd;

    /**
     * PDI유형코드
     */
    @NotEmpty
    private String carTpCd;

    /**
     * PDI점검항목코드
     */
    @NotEmpty
    private String carChkAtcCd;

    /**
     * PDI점검항목유형명
     */
    private String carChkAtcTpNm;

    /**
     * PDI점검항목명
     */
    private String carChkAtcLocalNm;

    /**
     * PDI점검항목영문명
     */
    private String carChkAtcEnNm;

    /**
     * 비고
     */
    private String remark;

    /**
     * 사용여부
     */
    private String useYn;

    /**
     * 차량점검코드
     */
    private String carChkCd;

    public String getDlrCd() {
        return dlrCd;
    }

    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    public String getCarTpCd() {
        return carTpCd;
    }

    public void setCarTpCd(String carTpCd) {
        this.carTpCd = carTpCd;
    }

    public String getCarChkAtcCd() {
        return carChkAtcCd;
    }

    public void setCarChkAtcCd(String carChkAtcCd) {
        this.carChkAtcCd = carChkAtcCd;
    }

    public String getCarChkAtcTpNm() {
        return carChkAtcTpNm;
    }

    public void setCarChkAtcTpNm(String carChkAtcTpNm) {
        this.carChkAtcTpNm = carChkAtcTpNm;
    }

    public String getCarChkAtcLocalNm() {
        return carChkAtcLocalNm;
    }

    public void setCarChkAtcLocalNm(String carChkAtcLocalNm) {
        this.carChkAtcLocalNm = carChkAtcLocalNm;
    }

    public String getCarChkAtcEnNm() {
        return carChkAtcEnNm;
    }

    public void setCarChkAtcEnNm(String carChkAtcEnNm) {
        this.carChkAtcEnNm = carChkAtcEnNm;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getUseYn() {
        return useYn;
    }

    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }

    /**
     * @return the carChkCd
     */
    public String getCarChkCd() {
        return carChkCd;
    }

    /**
     * @param carChkCd the carChkCd to set
     */
    public void setCarChkCd(String carChkCd) {
        this.carChkCd = carChkCd;
    }

}
