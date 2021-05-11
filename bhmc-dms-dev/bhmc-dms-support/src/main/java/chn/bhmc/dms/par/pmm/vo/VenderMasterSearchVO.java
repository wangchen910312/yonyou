package chn.bhmc.dms.par.pmm.vo;

import java.util.List;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * 거래처 관리 검색 VO
 *
 * @ClassName   : VendorMasterSearchVO.java
 * @Description : VendorMasterSearchVO Class
 * @author In Bo Shim
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.     In Bo Shim     최초 생성
 * </pre>
 */

public class VenderMasterSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6117714782582426643L;

    /**
     * 딜러코드
     */
    @NotEmpty
    private String sDlrCd;

    /**
     * 거래처코드
     */
    private String sBpCd;

    /**
     * 거래처유형리스트
     **/
    private  List<String> sBpTpLst;

    /**
     * 거래처명
     */
    private String sBpNm;

    /**
     * 거래처전명
     */
    private String sBpFullNm;

    /**
     * 거래처유형
     */
    private String sBpTp;

    /**
     * 거래중지여부
     */
    private String sEndYn;

    /**
     * 거래처구분
     */
    private String sBpDstinCd = "N";

    /**
     * @return the sDlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }

    /**
     * @param sDlrCd the sDlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    /**
     * @return the sBpCd
     */
    public String getsBpCd() {
        return sBpCd;
    }

    /**
     * @param sBpCd the sBpCd to set
     */
    public void setsBpCd(String sBpCd) {
        this.sBpCd = sBpCd;
    }

    /**
     * @return the sBpTpLst
     */
    public List<String> getsBpTpLst() {
        return sBpTpLst;
    }

    /**
     * @param sBpTpLst the sBpTpLst to set
     */
    public void setsBpTpLst(List<String> sBpTpLst) {
        this.sBpTpLst = sBpTpLst;
    }

    /**
     * @return the sBpNm
     */
    public String getsBpNm() {
        return sBpNm;
    }

    /**
     * @param sBpNm the sBpNm to set
     */
    public void setsBpNm(String sBpNm) {
        this.sBpNm = sBpNm;
    }

    /**
     * @return the sBpFullNm
     */
    public String getsBpFullNm() {
        return sBpFullNm;
    }

    /**
     * @param sBpFullNm the sBpFullNm to set
     */
    public void setsBpFullNm(String sBpFullNm) {
        this.sBpFullNm = sBpFullNm;
    }

    /**
     * @return the sBpTp
     */
    public String getsBpTp() {
        return sBpTp;
    }

    /**
     * @param sBpTp the sBpTp to set
     */
    public void setsBpTp(String sBpTp) {
        this.sBpTp = sBpTp;
    }

    /**
     * @return the sEndYn
     */
    public String getsEndYn() {
        return sEndYn;
    }

    /**
     * @param sEndYn the sEndYn to set
     */
    public void setsEndYn(String sEndYn) {
        this.sEndYn = sEndYn;
    }

    /**
     * @return the sBpDstinCd
     */
    public String getsBpDstinCd() {
        return sBpDstinCd;
    }

    /**
     * @param sBpDstinCd the sBpDstinCd to set
     */
    public void setsBpDstinCd(String sBpDstinCd) {
        this.sBpDstinCd = sBpDstinCd;
    }
}
