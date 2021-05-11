package chn.bhmc.dms.ser.svi.vo;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * 외주거래처 VO
 * </pre>
 *
 * @ClassName   : RateMasterVO.java
 * @Description : 외주거래처 VO.
 * @author Yin Xueyuan
 * @since 2016. 2. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 24.     Yin Xueyuan     최초 생성
 * </pre>
 */

public class SubBpMasterVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5800841956681934408L;

    /**
     * 딜러코드
     */
    private String dlrCd;

    /**
     * 외주거래처코드
     */
    @NotBlank
    private String subBpCd;

    /**
     * 외주거래처명
     */
    @NotBlank
    private String subBpNm;

    /**
     * 외주공임할인율
     */
    private double subLbrDcRate;

    /**
     * 외주부품할인율
     */
    private double subParDcRate;

    /**
     * 사용여부
     */
    @NotEmpty
    private String useYn;

    public String getDlrCd() {
        return dlrCd;
    }

    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    public String getSubBpCd() {
        return subBpCd;
    }

    public void setSubBpCd(String subBpCd) {
        this.subBpCd = subBpCd;
    }

    public String getSubBpNm() {
        return subBpNm;
    }

    public void setSubBpNm(String subBpNm) {
        this.subBpNm = subBpNm;
    }

    public double getSubLbrDcRate() {
        return subLbrDcRate;
    }

    public void setSubLbrDcRate(double subLbrDcRate) {
        this.subLbrDcRate = subLbrDcRate;
    }

    public double getSubParDcRate() {
        return subParDcRate;
    }

    public void setSubParDcRate(double subParDcRate) {
        this.subParDcRate = subParDcRate;
    }

    public String getUseYn() {
        return useYn;
    }

    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }




}
