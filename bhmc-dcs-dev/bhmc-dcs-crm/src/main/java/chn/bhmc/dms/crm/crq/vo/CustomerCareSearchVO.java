package chn.bhmc.dms.crm.crq.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 고객케어미션 조회 SearchVO
 *
 * @ClassName   : CustomerCareSearchVO.java
 * @Description : CustomerCareSearchVO.Class
 * @author in moon lee
 * @since 2016.05.02.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.05.02.     in moon lee     최초 생성
 * </pre>
 */

public class CustomerCareSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -870562470961786110L;


    private  String              sDlrCd;                // 딜러코드[고객케어관리]
    private  String              sCustCareNm;           // 고객캐어미션 명[고객케어관리]
    private  String              sActiveTpCd;           // 실행방법[고객케어관리]
    private  int                 sCustCareSeq;          // 고객케어번호[고객캐어상세조회]
    private  String              sCustExtrTermNo;       // 대상자추출조건번호[대상자추출]
    private  String              sAutoActiveYn;         // 자동실행여부[고객케어실행]



    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                sStartStartDt;              // 시작일기준 검색조건[고객케어관리]
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date                sStartEndDt;                // 시작일기준 검색조건[고객케어관리]

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
     * @return the sCustCareNm
     */
    public String getsCustCareNm() {
        return sCustCareNm;
    }
    /**
     * @param sCustCareNm the sCustCareNm to set
     */
    public void setsCustCareNm(String sCustCareNm) {
        this.sCustCareNm = sCustCareNm;
    }
    /**
     * @return the sActiveTpCd
     */
    public String getsActiveTpCd() {
        return sActiveTpCd;
    }
    /**
     * @param sActiveTpCd the sActiveTpCd to set
     */
    public void setsActiveTpCd(String sActiveTpCd) {
        this.sActiveTpCd = sActiveTpCd;
    }
    /**
     * @return the sCustCareSeq
     */
    public int getsCustCareSeq() {
        return sCustCareSeq;
    }
    /**
     * @param sCustCareSeq the sCustCareSeq to set
     */
    public void setsCustCareSeq(int sCustCareSeq) {
        this.sCustCareSeq = sCustCareSeq;
    }
    /**
     * @return the sCustExtrTermNo
     */
    public String getsCustExtrTermNo() {
        return sCustExtrTermNo;
    }
    /**
     * @param sCustExtrTermNo the sCustExtrTermNo to set
     */
    public void setsCustExtrTermNo(String sCustExtrTermNo) {
        this.sCustExtrTermNo = sCustExtrTermNo;
    }

    /**
     * @return the sAutoActiveYn
     */
    public String getsAutoActiveYn() {
        return sAutoActiveYn;
    }
    /**
     * @param sAutoActiveYn the sAutoActiveYn to set
     */
    public void setsAutoActiveYn(String sAutoActiveYn) {
        this.sAutoActiveYn = sAutoActiveYn;
    }
    /**
     * @return the sStartStartDt
     */
    public Date getsStartStartDt() {
        return sStartStartDt;
    }
    /**
     * @param sStartStartDt the sStartStartDt to set
     */
    public void setsStartStartDt(Date sStartStartDt) {
        this.sStartStartDt = sStartStartDt;
    }
    /**
     * @return the sStartEndDt
     */
    public Date getsStartEndDt() {
        return sStartEndDt;
    }
    /**
     * @param sStartEndDt the sStartEndDt to set
     */
    public void setsStartEndDt(Date sStartEndDt) {
        this.sStartEndDt = sStartEndDt;
    }
    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "CustomerCareSearchVO [sDlrCd=" + sDlrCd + ", sCustCareNm=" + sCustCareNm + ", sActiveTpCd="
                + sActiveTpCd + ", sCustCareSeq=" + sCustCareSeq + ", sCustExtrTermNo=" + sCustExtrTermNo
                + ", sAutoActiveYn=" + sAutoActiveYn + ", sStartStartDt=" + sStartStartDt + ", sStartEndDt="
                + sStartEndDt + "]";
    }

}