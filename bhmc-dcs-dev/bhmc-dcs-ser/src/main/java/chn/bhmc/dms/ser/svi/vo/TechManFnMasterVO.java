package chn.bhmc.dms.ser.svi.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * 테크멘 기능관리 VO
 * </pre>
 *
 * @ClassName   : TechManFnMasterVO.java
 * @Description : 테크멘 기능관리 VO.
 * @author Yin Xueyuan
 * @since 2016. 2. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 11.     Yin Xueyuan     최초 생성
 * </pre>
 */

public class TechManFnMasterVO extends BaseVO {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3447232715620214035L;

    /**
     * 딜러코드
     */
    @NotEmpty
    private String dlrCd;

    /**
     * TechManId
     */
    @NotEmpty
    private String tecId;

    /**
     * TechMan 명
     */
    private String tecNm;

    /**
     * TechMan 주기능명
     */
    private String tecMfnNm;

    /**
     * TechMan 부기능명1
     */
    private String tecSfnNm1;

    /**
     * TechMan 부기능명2
     */
    private String tecSfnNm2;

    /**
     * TechMan 부기능명3
     */
    private String tecSfnNm3;

    private String bayGrpTp;       // bay그룹유형

    public String getDlrCd() {
        return dlrCd;
    }

    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    public String getTecId() {
        return tecId;
    }

    public void setTecId(String tecId) {
        this.tecId = tecId;
    }

    public String getTecNm() {
        return tecNm;
    }

    public void setTecNm(String tecNm) {
        this.tecNm = tecNm;
    }

    public String getTecMfnNm() {
        return tecMfnNm;
    }

    public void setTecMfnNm(String tecMfnNm) {
        this.tecMfnNm = tecMfnNm;
    }

    public String getTecSfnNm1() {
        return tecSfnNm1;
    }

    public void setTecSfnNm1(String tecSfnNm1) {
        this.tecSfnNm1 = tecSfnNm1;
    }

    public String getTecSfnNm2() {
        return tecSfnNm2;
    }

    public void setTecSfnNm2(String tecSfnNm2) {
        this.tecSfnNm2 = tecSfnNm2;
    }

    public String getTecSfnNm3() {
        return tecSfnNm3;
    }

    public void setTecSfnNm3(String tecSfnNm3) {
        this.tecSfnNm3 = tecSfnNm3;
    }

    /**
     * @return the bayGrpTp
     */
    public String getBayGrpTp() {
        return bayGrpTp;
    }

    /**
     * @param bayGrpTp the bayGrpTp to set
     */
    public void setBayGrpTp(String bayGrpTp) {
        this.bayGrpTp = bayGrpTp;
    }

}
