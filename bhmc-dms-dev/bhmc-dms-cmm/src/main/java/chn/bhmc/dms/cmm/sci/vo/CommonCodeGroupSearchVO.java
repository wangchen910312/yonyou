package chn.bhmc.dms.cmm.sci.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CommonCodeGroupSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 18.     Kang Seok Han     최초 생성
 * </pre>
 */

public class CommonCodeGroupSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6534031744201367732L;

    /**
     * 공통코드 그룹코드
     */
    private String sCmmGrpCd;

    /**
     * 공통코드 그룹명
     */
    private String sCmmGrpCdNm;

    /**
     * 사용여부
     */
    private String sUseYn;

    /**
     * 시스템코드여부
     */
    private String sSysCdYn;

    /**
     * 비고
     */
    private String sRemark;

    /**
     * @return the sCmmGrpCd
     */
    public String getsCmmGrpCd() {
        return sCmmGrpCd;
    }

    /**
     * @param sCmmGrpCd the sCmmGrpCd to set
     */
    public void setsCmmGrpCd(String sCmmGrpCd) {
        this.sCmmGrpCd = sCmmGrpCd;
    }

    /**
     * @return the sCmmGrpCdNm
     */
    public String getsCmmGrpCdNm() {
        return sCmmGrpCdNm;
    }

    /**
     * @param sCmmGrpCdNm the sCmmGrpCdNm to set
     */
    public void setsCmmGrpCdNm(String sCmmGrpCdNm) {
        this.sCmmGrpCdNm = sCmmGrpCdNm;
    }

    /**
     * @return the sUseYn
     */
    public String getsUseYn() {
        return sUseYn;
    }

    /**
     * @param sUseYn the sUseYn to set
     */
    public void setsUseYn(String sUseYn) {
        this.sUseYn = sUseYn;
    }

    /**
     * @return the sSysCdYn
     */
    public String getsSysCdYn() {
        return sSysCdYn;
    }

    /**
     * @param sSysCdYn the sSysCdYn to set
     */
    public void setsSysCdYn(String sSysCdYn) {
        this.sSysCdYn = sSysCdYn;
    }

    /**
     * @return the sRemark
     */
    public String getsRemark() {
        return sRemark;
    }

    /**
     * @param sRemark the sRemark to set
     */
    public void setsRemark(String sRemark) {
        this.sRemark = sRemark;
    }

}
