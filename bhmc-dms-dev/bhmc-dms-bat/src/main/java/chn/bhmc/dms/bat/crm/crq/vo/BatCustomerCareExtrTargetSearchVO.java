package chn.bhmc.dms.bat.crm.crq.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * 대상자 목록 조회 SearchVO
 *
 * @ClassName   : CustomerCareExtrTargetSearchVO.java
 * @Description : CustomerCareExtrTargetSearchVO.Class
 * @author in moon lee
 * @since 2016.05.25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.05.25.     in moon lee     최초 생성
 * </pre>
 */

public class BatCustomerCareExtrTargetSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -870562470961786110L;

    private  String              sDlrCd;            // 딜러코드[고객케어관리]
    private  String              sCustCareSeq;      // 고객케어일련번호

    private  String              sExtrDgreCnt;      // 추출차수
    private  String              sSmsSendYn;        // SMS 전송여부
    private  String              sCallCenSendYn;    // 콜센터 전송여부

    private String sCust;                           // 고객정보 like 검색 [고객케어대상자리스트]
    private  String              sCustNm;           // 고객명        [고객케어대상자리스트]
    private  String              sHpNo;             // 휴대전화     [고객케어대상자리스트]
    private  String              sTelNo;            // 집전화        [고객케어대상자리스트]

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
     * @return the sCustCareSeq
     */
    public String getsCustCareSeq() {
        return sCustCareSeq;
    }
    /**
     * @param sCustCareSeq the sCustCareSeq to set
     */
    public void setsCustCareSeq(String sCustCareSeq) {
        this.sCustCareSeq = sCustCareSeq;
    }
    /**
     * @return the sExtrDgreCnt
     */
    public String getsExtrDgreCnt() {
        return sExtrDgreCnt;
    }
    /**
     * @param sExtrDgreCnt the sExtrDgreCnt to set
     */
    public void setsExtrDgreCnt(String sExtrDgreCnt) {
        this.sExtrDgreCnt = sExtrDgreCnt;
    }
    /**
     * @return the sSmsSendYn
     */
    public String getsSmsSendYn() {
        return sSmsSendYn;
    }
    /**
     * @param sSmsSendYn the sSmsSendYn to set
     */
    public void setsSmsSendYn(String sSmsSendYn) {
        this.sSmsSendYn = sSmsSendYn;
    }
    /**
     * @return the sCallCenSendYn
     */
    public String getsCallCenSendYn() {
        return sCallCenSendYn;
    }
    /**
     * @param sCallCenSendYn the sCallCenSendYn to set
     */
    public void setsCallCenSendYn(String sCallCenSendYn) {
        this.sCallCenSendYn = sCallCenSendYn;
    }

    /**
     * @return the sCust
     */
    public String getsCust() {
        return sCust;
    }
    /**
     * @param sCust the sCust to set
     */
    public void setsCust(String sCust) {
        this.sCust = sCust;
    }
    /**
     * @return the sCustNm
     */
    public String getsCustNm() {
        return sCustNm;
    }
    /**
     * @param sCustNm the sCustNm to set
     */
    public void setsCustNm(String sCustNm) {
        this.sCustNm = sCustNm;
    }
    /**
     * @return the sHpNo
     */
    public String getsHpNo() {
        return sHpNo;
    }
    /**
     * @param sHpNo the sHpNo to set
     */
    public void setsHpNo(String sHpNo) {
        this.sHpNo = sHpNo;
    }
    /**
     * @return the sTelNo
     */
    public String getsTelNo() {
        return sTelNo;
    }
    /**
     * @param sTelNo the sTelNo to set
     */
    public void setsTelNo(String sTelNo) {
        this.sTelNo = sTelNo;
    }
    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "CustomerCareExtrTargetSearchVO [sDlrCd=" + sDlrCd + ", sCustCareSeq=" + sCustCareSeq
                + ", sExtrDgreCnt=" + sExtrDgreCnt + ", sSmsSendYn=" + sSmsSendYn + ", sCallCenSendYn="
                + sCallCenSendYn + ", sCust=" + sCust + ", sCustNm=" + sCustNm + ", sHpNo=" + sHpNo + ", sTelNo="
                + sTelNo + "]";
    }

}