package chn.bhmc.dms.ser.wac.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * 고품 조회 SearchVO
 * </pre>
 *
 * @ClassName   : RateMasterSearchVO.java
 * @Description : 고품 조회 SearchVO.
 * @author Yin Xueyuan
 * @since 2016. 6. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 6.     Yin Xueyuan     최초 생성
 * </pre>
 */

public class ClaimOldItemManageSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6947437255468486983L;

    /**
     * 조회조건 - 딜러코드
     */
    private String sDlrCd;

    /**
     * 조회조건 - 차대번호
     */
    private String sVinNo;

    /**
     * 조회조건 - 클레임문서번호
     */
    private String sClaimDocNo;

    /**
     * 조회조건 - 고품신청번호
     */
    private String sAtqReqNo;

    /**
     * 조회조건 - 상태코드
     */
    private String sStatCd;

    /**
     * 조회조건 - 품목코드
     */
    private String sItemCd;

    /**
     * 조회조건 - 품목명
     */
    private String sItemNm;

    /**
     * 조회조건 - 신청자
     */
    private String sReqNm;

    /**
     * 조회조건 - 요청일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sReqFromDt;

    /**
     * 조회조건 - 요청일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sReqToDt;

    /**
     * 조회조건 - 부품상태 코드
     */
    private String sOlditemStatCd;

    /**
     * 조회조건 - 공제여부
     */
    private String sDdctYn;

    /**
     * @return the sReqNm
     */
    public String getsReqNm() {
        return sReqNm;
    }

    /**
     * @param sReqNm the sReqNm to set
     */
    public void setsReqNm(String sReqNm) {
        this.sReqNm = sReqNm;
    }

    public String getsDlrCd() {
        return sDlrCd;
    }

    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    public String getsVinNo() {
        return sVinNo;
    }

    public void setsVinNo(String sVinNo) {
        this.sVinNo = sVinNo;
    }

    public String getsClaimDocNo() {
        return sClaimDocNo;
    }

    public void setsClaimDocNo(String sClaimDocNo) {
        this.sClaimDocNo = sClaimDocNo;
    }

    public String getsStatCd() {
        return sStatCd;
    }

    public void setsStatCd(String sStatCd) {
        this.sStatCd = sStatCd;
    }

    public String getsItemCd() {
        return sItemCd;
    }

    public void setsItemCd(String sItemCd) {
        this.sItemCd = sItemCd;
    }

    public String getsItemNm() {
        return sItemNm;
    }

    public void setsItemNm(String sItemNm) {
        this.sItemNm = sItemNm;
    }

    public Date getsReqFromDt() {
        return sReqFromDt;
    }

    public void setsReqFromDt(Date sReqFromDt) {
        this.sReqFromDt = sReqFromDt;
    }

    public Date getsReqToDt() {
        return sReqToDt;
    }

    public void setsReqToDt(Date sReqToDt) {
        this.sReqToDt = sReqToDt;
    }

    public String getsAtqReqNo() {
        return sAtqReqNo;
    }

    public void setsAtqReqNo(String sAtqReqNo) {
        this.sAtqReqNo = sAtqReqNo;
    }

    /**
     * @return the sOlditemStatCd
     */
    public String getsOlditemStatCd() {
        return sOlditemStatCd;
    }

    /**
     * @param sOlditemStatCd the sOlditemStatCd to set
     */
    public void setsOlditemStatCd(String sOlditemStatCd) {
        this.sOlditemStatCd = sOlditemStatCd;
    }

    /**
     * @return the sDdctYn
     */
    public String getsDdctYn() {
        return sDdctYn;
    }

    /**
     * @param sDdctYn the sDdctYn to set
     */
    public void setsDdctYn(String sDdctYn) {
        this.sDdctYn = sDdctYn;
    }

}
