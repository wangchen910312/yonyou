package chn.bhmc.dms.bat.ser.svi.vo;

import java.util.Date;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatLaborCodeModelVO.java
 * @Description : 공임코드 MODEL VO
 * @author YIN XUEYUAN
 * @since 2016. 5. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 24.     YIN XUEYUAN     최초 생성
 * </pre>
 */
public class BatLaborCodeModelVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4769723799534038421L;

    /**
     * 차종코드
     */
    private String ltsModelCd;

    /**
     * 유효시작일자
     */
    private Date validStartDt;

    /**
     * 유효종료일자
     */
    private Date validEndDt;

    /**
     * 차종영문명
     */
    private String ltsEnNm;

    /**
     * 차종중문명
     */
    private String ltsChnNm;

    /**
     * 브랜트코드
     */
    private String brandCd;

    public String getLtsModelCd() {
        return ltsModelCd;
    }

    public void setLtsModelCd(String ltsModelCd) {
        this.ltsModelCd = ltsModelCd;
    }

    public String getLtsEnNm() {
        return ltsEnNm;
    }

    public void setLtsEnNm(String ltsEnNm) {
        this.ltsEnNm = ltsEnNm;
    }

    public String getLtsChnNm() {
        return ltsChnNm;
    }

    public void setLtsChnNm(String ltsChnNm) {
        this.ltsChnNm = ltsChnNm;
    }

    public String getBrandCd() {
        return brandCd;
    }

    public void setBrandCd(String brandCd) {
        this.brandCd = brandCd;
    }

    public Date getValidStartDt() {
        return validStartDt;
    }

    public void setValidStartDt(Date validStartDt) {
        this.validStartDt = validStartDt;
    }

    public Date getValidEndDt() {
        return validEndDt;
    }

    public void setValidEndDt(Date validEndDt) {
        this.validEndDt = validEndDt;
    }


}
