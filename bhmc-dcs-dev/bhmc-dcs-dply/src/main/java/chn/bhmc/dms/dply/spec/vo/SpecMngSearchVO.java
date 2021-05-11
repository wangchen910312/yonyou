package chn.bhmc.dms.dply.spec.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SpecMngSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 3. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 29.     Kang Seok Han     최초 생성
 * </pre>
 */

public class SpecMngSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5993052574400776921L;

    /**
     * SPEC코드
     */
    private String sSpecCd;


    /**
     * SPEC유형명
     */
    private String sSpecTpNm;

    private String sDeployVerNo;

    private String sDeployGrpId;


    /**
     * @param sSpecCd the sSpecCd to set
     */
    public void setsSpecCd(String sSpecCd) {
        this.sSpecCd = sSpecCd;
    }


    /**
     * @return the sSpecCd
     */
    public String getsSpecCd() {
        return sSpecCd;
    }


    /**
     * @param sSpecTpNm the sSpecTpNm to set
     */
    public void setsSpecTpNm(String sSpecTpNm) {
        this.sSpecTpNm = sSpecTpNm;
    }


    /**
     * @return the sSpecTpNm
     */
    public String getsSpecTpNm() {
        return sSpecTpNm;
    }


    /**
     * @param sDeployVerNo the sDeployVerNo to set
     */
    public void setsDeployVerNo(String sDeployVerNo) {
        this.sDeployVerNo = sDeployVerNo;
    }


    /**
     * @return the sDeployVerNo
     */
    public String getsDeployVerNo() {
        return sDeployVerNo;
    }


    /**
     * @param sDeployGrpId the sDeployGrpId to set
     */
    public void setsDeployGrpId(String sDeployGrpId) {
        this.sDeployGrpId = sDeployGrpId;
    }


    /**
     * @return the sDeployGrpId
     */
    public String getsDeployGrpId() {
        return sDeployGrpId;
    }


}
