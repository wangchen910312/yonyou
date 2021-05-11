package chn.bhmc.dms.cmm.cmp.vo;

import java.util.ArrayList;
import java.util.List;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DealerSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Kang Seok Han     최초 생성
 * </pre>
 */

public class DealerSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5176985495158352695L;

    /**
    * 딜러코드                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                1
    **/
    private String sDlrCd;

    /**
    * 딜러명                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 2
    **/
    private String sDlrNm;

    /**
     * 딜러그룹 코드
     */
    private String sDlrGrpCd;

    /**
     * DMS 사용여부
     */
    private String sDmsUseYn;

    /**
     * 사업부 코드
     */
    private String sSdptCd;

    /**
     * 지역사무소 코드
     */
    private String sDistOfficeCd;

    /**
     * 판매딜러 성코드
     */
    private String sSaleDlrSungCd;

    /**
     * 판매딜러 도시코드
     */
    private String sSaleDlrCityCd;

    private List<String> sDlrCdList = new ArrayList<String>();

    /**
     * 시스템 딜러 여부
     */
    private String sSysOwnerYn;

    /**
     * 센터 DMS 사용딜러 여부
     */
    private String sUseCenterDmsYn;

    /**
     * 삭제여부
     */
    private String sDelYn;

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
     * @return the sDlrNm
     */
    public String getsDlrNm() {
        return sDlrNm;
    }

    /**
     * @param sDlrNm the sDlrNm to set
     */
    public void setsDlrNm(String sDlrNm) {
        this.sDlrNm = sDlrNm;
    }

    /**
     * @return the sDlrGrpCd
     */
    public String getsDlrGrpCd() {
        return sDlrGrpCd;
    }

    /**
     * @param sDlrGrpCd the sDlrGrpCd to set
     */
    public void setsDlrGrpCd(String sDlrGrpCd) {
        this.sDlrGrpCd = sDlrGrpCd;
    }

    /**
     * @return the sDmsUseYn
     */
    public String getsDmsUseYn() {
        return sDmsUseYn;
    }

    /**
     * @param sDmsUseYn the sDmsUseYn to set
     */
    public void setsDmsUseYn(String sDmsUseYn) {
        this.sDmsUseYn = sDmsUseYn;
    }

    /**
     * @return the sSdptCd
     */
    public String getsSdptCd() {
        return sSdptCd;
    }

    /**
     * @param sSdptCd the sSdptCd to set
     */
    public void setsSdptCd(String sSdptCd) {
        this.sSdptCd = sSdptCd;
    }

    /**
     * @return the sDistOfficeCd
     */
    public String getsDistOfficeCd() {
        return sDistOfficeCd;
    }

    /**
     * @param sDistOfficeCd the sDistOfficeCd to set
     */
    public void setsDistOfficeCd(String sDistOfficeCd) {
        this.sDistOfficeCd = sDistOfficeCd;
    }

    /**
     * @return the sSaleDlrSungCd
     */
    public String getsSaleDlrSungCd() {
        return sSaleDlrSungCd;
    }

    /**
     * @param sSaleDlrSungCd the sSaleDlrSungCd to set
     */
    public void setsSaleDlrSungCd(String sSaleDlrSungCd) {
        this.sSaleDlrSungCd = sSaleDlrSungCd;
    }

    /**
     * @return the sSaleDlrCityCd
     */
    public String getsSaleDlrCityCd() {
        return sSaleDlrCityCd;
    }

    /**
     * @param sSaleDlrCityCd the sSaleDlrCityCd to set
     */
    public void setsSaleDlrCityCd(String sSaleDlrCityCd) {
        this.sSaleDlrCityCd = sSaleDlrCityCd;
    }

    /**
     * @return the sDlrCdList
     */
    public List<String> getsDlrCdList() {
        return sDlrCdList;
    }

    /**
     * @param sDlrCdList the sDlrCdList to set
     */
    public void setsDlrCdList(List<String> sDlrCdList) {
        this.sDlrCdList = sDlrCdList;
    }

    /**
     * @return the sSysOwnerYn
     */
    public String getsSysOwnerYn() {
        return sSysOwnerYn;
    }

    /**
     * @param sSysOwnerYn the sSysOwnerYn to set
     */
    public void setsSysOwnerYn(String sSysOwnerYn) {
        this.sSysOwnerYn = sSysOwnerYn;
    }

    /**
     * @return the sUseCenterDmsYn
     */
    public String getsUseCenterDmsYn() {
        return sUseCenterDmsYn;
    }

    /**
     * @param sUseCenterDmsYn the sUseCenterDmsYn to set
     */
    public void setsUseCenterDmsYn(String sUseCenterDmsYn) {
        this.sUseCenterDmsYn = sUseCenterDmsYn;
    }

    /**
     * @return the sDelYn
     */
    public String getsDelYn() {
        return sDelYn;
    }

    /**
     * @param sDelYn the sDelYn to set
     */
    public void setsDelYn(String sDelYn) {
        this.sDelYn = sDelYn;
    }

}