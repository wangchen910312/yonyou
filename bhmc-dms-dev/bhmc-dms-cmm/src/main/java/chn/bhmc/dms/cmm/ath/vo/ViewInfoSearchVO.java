package chn.bhmc.dms.cmm.ath.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ViewInfoSearchVO.java
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

public class ViewInfoSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -8986954560204039634L;

    /**
     * 시스템코드
     * 'D':딜러
     * 'I':임포터
     */
     private String sSysCd;

    /**
     * 화면ID
     */
    private String sViewId;

    /**
     * 화면명
     */
    private String sViewNm;

    /**
     * 화면유형
     * 공통코드 그룹 참조 COM007
     * '01':화면
     * '02':버튼
     */
    private String sViewTp;

    /**
     * 출력여부
     * 'Y':출력
     * 'N':출력안함
     */
    private String sDisplayYn;

    /**
     * 참조유형
     */
    private String sRefTp;

    /**
     * 참조ID
     */
    private String sRefId;

    /**
     * 역할ID
     */
    private String sRoleId;

    /**
     * 상위화면ID
     */
    private String sParentViewId;

    /**
     * 모바일 구분
     */
    private String sWebMobileDstinCd;

    /**
     * 사용자ID
     */
    private String sUsrId;

    /**
     * 사용여부
     */
    private String sUseYn;

    /**
     * T코드
     */
    private String sTCd;

    /**
     * @return the sSysCd
     */
    public String getsSysCd() {
        return sSysCd;
    }

    /**
     * @param sSysCd the sSysCd to set
     */
    public void setsSysCd(String sSysCd) {
        this.sSysCd = sSysCd;
    }

    /**
     * @return the sViewId
     */
    public String getsViewId() {
        return sViewId;
    }

    /**
     * @param sViewId the sViewId to set
     */
    public void setsViewId(String sViewId) {
        this.sViewId = sViewId;
    }

    /**
     * @return the sViewNm
     */
    public String getsViewNm() {
        return sViewNm;
    }

    /**
     * @param sViewNm the sViewNm to set
     */
    public void setsViewNm(String sViewNm) {
        this.sViewNm = sViewNm;
    }

    /**
     * @return the sViewTp
     */
    public String getsViewTp() {
        return sViewTp;
    }

    /**
     * @param sViewTp the sViewTp to set
     */
    public void setsViewTp(String sViewTp) {
        this.sViewTp = sViewTp;
    }

    /**
     * @return the sDisplayYn
     */
    public String getsDisplayYn() {
        return sDisplayYn;
    }

    /**
     * @param sDisplayYn the sDisplayYn to set
     */
    public void setsDisplayYn(String sDisplayYn) {
        this.sDisplayYn = sDisplayYn;
    }

    /**
     * @return the sRefTp
     */
    public String getsRefTp() {
        return sRefTp;
    }

    /**
     * @param sRefTp the sRefTp to set
     */
    public void setsRefTp(String sRefTp) {
        this.sRefTp = sRefTp;
    }

    /**
     * @return the sRefId
     */
    public String getsRefId() {
        return sRefId;
    }

    /**
     * @param sRefId the sRefId to set
     */
    public void setsRefId(String sRefId) {
        this.sRefId = sRefId;
    }

    /**
     * @return the sRoleId
     */
    public String getsRoleId() {
        return sRoleId;
    }

    /**
     * @param sRoleId the sRoleId to set
     */
    public void setsRoleId(String sRoleId) {
        this.sRoleId = sRoleId;
    }

    /**
     * @return the sParentViewId
     */
    public String getsParentViewId() {
        return sParentViewId;
    }

    /**
     * @param sParentViewId the sParentViewId to set
     */
    public void setsParentViewId(String sParentViewId) {
        this.sParentViewId = sParentViewId;
    }

    /**
     * @return the sWebMobileDstinCd
     */
    public String getsWebMobileDstinCd() {
        return sWebMobileDstinCd;
    }

    /**
     * @param sWebMobileDstinCd the sWebMobileDstinCd to set
     */
    public void setsWebMobileDstinCd(String sWebMobileDstinCd) {
        this.sWebMobileDstinCd = sWebMobileDstinCd;
    }

    /**
     * @return the sUsrId
     */
    public String getsUsrId() {
        return sUsrId;
    }

    /**
     * @param sUsrId the sUsrId to set
     */
    public void setsUsrId(String sUsrId) {
        this.sUsrId = sUsrId;
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
     * @return the sTCd
     */
    public String getsTCd() {
        return sTCd;
    }

    /**
     * @param sTCd the sTCd to set
     */
    public void setsTCd(String sTCd) {
        this.sTCd = sTCd;
    }
}
