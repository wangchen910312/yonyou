package chn.bhmc.dms.crm.crq.vo;

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

public class CustomerCareExtrTargetSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -870562470961786110L;

    private  String              sDlrCd;                // 딜러코드[고객케어관리]
    private  String              sCustCareSeq;          // 고객케어일련번호

    private  String              sExtrDgreCnt;          // 추출차수
    private  String              sSmsSendYn;            // SMS 전송여부
    private  String              sCallCenSendYn;        // 콜센터 전송여부

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
    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "CustomerCareExtrTargetSearchVO [sDlrCd=" + sDlrCd + ", sCustCareSeq=" + sCustCareSeq
                + ", sExtrDgreCnt=" + sExtrDgreCnt + ", sSmsSendYn=" + sSmsSendYn + ", sCallCenSendYn="
                + sCallCenSendYn + "]";
    }

}