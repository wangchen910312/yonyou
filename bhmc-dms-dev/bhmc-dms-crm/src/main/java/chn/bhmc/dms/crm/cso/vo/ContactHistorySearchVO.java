package chn.bhmc.dms.crm.cso.vo;

import chn.bhmc.dms.core.datatype.SearchVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ContactHistorySearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Moon Lee
 * @since 2016.04.05.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.04.05.     In Moon Lee     최초 생성
 * </pre>
 */

public class ContactHistorySearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4002025039930084572L;

    private  String        sDlrCd;


    private  String        sContactBizCd;       // 업무구분 (고객:01,리드:02,기회:03,VOC:04,만족도:05,캠페인:06,멤버십:07,??:08,고객케어:09,콜센터:10)

    private  String        sRefTableNm;       // 출처테이블

    private  String        sRefKeyNm;         // 출처 키

    private  String        sCustNo;         // 고객번호[캠페인]

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
     * @return the sContactBizCd
     */
    public String getsContactBizCd() {
        return sContactBizCd;
    }

    /**
     * @param sContactBizCd the sContactBizCd to set
     */
    public void setsContactBizCd(String sContactBizCd) {
        this.sContactBizCd = sContactBizCd;
    }

    /**
     * @return the sRefTableNm
     */
    public String getsRefTableNm() {
        return sRefTableNm;
    }

    /**
     * @param sRefTableNm the sRefTableNm to set
     */
    public void setsRefTableNm(String sRefTableNm) {
        this.sRefTableNm = sRefTableNm;
    }

    /**
     * @return the sRefKeyNm
     */
    public String getsRefKeyNm() {
        return sRefKeyNm;
    }

    /**
     * @param sRefKeyNm the sRefKeyNm to set
     */
    public void setsRefKeyNm(String sRefKeyNm) {
        this.sRefKeyNm = sRefKeyNm;
    }



    /**
     * @return the sCustNo
     */
    public String getsCustNo() {
        return sCustNo;
    }

    /**
     * @param sCustNo the sCustNo to set
     */
    public void setsCustNo(String sCustNo) {
        this.sCustNo = sCustNo;
    }

    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "ContactHistorySearchVO [sDlrCd=" + sDlrCd + ", sContactBizCd=" + sContactBizCd + ", sRefTableNm="
                + sRefTableNm + ", sRefKeyNm=" + sRefKeyNm + ", sCustNo=" + sCustNo + "]";
    }




}