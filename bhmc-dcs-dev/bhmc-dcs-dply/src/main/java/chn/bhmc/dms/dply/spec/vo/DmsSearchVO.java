package chn.bhmc.dms.dply.spec.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DmsSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Cheol Man Oh
 * @since 2016. 4. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 11.     Cheol Man Oh     최초 생성
 * </pre>
 */

public class DmsSearchVO extends SearchVO {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -4930195827910232003L;

    /**
     * 딜러코드
     */
    private String sDlrCd;

    /**
     * 딜러명
     */
    private String sDlrNm;


    /**
     * SPEC코드
     */
    private String sSpecCd;


    /**
     * DEPLOY버전번호
     */
    private String sDeployVerNo;

    /**
     * DEPLOY유형코드
     */
    private String sDeployTpCd;

    /**
     * 오픈일자
     */
    private String sOpenFromDt;

    /**
     * 오픈일자
     */
    private String sOpenToDt;



    /**
     * @param sDlrCd the sDlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    /**
     * @return the sDlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }

    /**
     * @param sDlrNm the sDlrNm to set
     */
    public void setsDlrNm(String sDlrNm) {
        this.sDlrNm = sDlrNm;
    }

    /**
     * @return the sDlrNm
     */
    public String getsDlrNm() {
        return sDlrNm;
    }

    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }

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
     * @param sDeployTpCd the sDeployTpCd to set
     */
    public void setsDeployTpCd(String sDeployTpCd) {
        this.sDeployTpCd = sDeployTpCd;
    }

    /**
     * @return the sDeployTpCd
     */
    public String getsDeployTpCd() {
        return sDeployTpCd;
    }

    /**
     * @return the sOpenFromDt
     */
    public String getsOpenFromDt() {
        return sOpenFromDt;
    }

    /**
     * @param sOpenFromDt the sOpenFromDt to set
     */
    public void setsOpenFromDt(String sOpenFromDt) {
        this.sOpenFromDt = sOpenFromDt;
    }

    /**
     * @return the sOpenToDt
     */
    public String getsOpenToDt() {
        return sOpenToDt;
    }

    /**
     * @param sOpenToDt the sOpenToDt to set
     */
    public void setsOpenToDt(String sOpenToDt) {
        this.sOpenToDt = sOpenToDt;
    }

}
