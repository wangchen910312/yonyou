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
     * 조회조건 - 요청 부서코드
     */
    private String sReqDeptCd;
    
    /**
     * 조회조건 - 출고 부서코드
     */
    private String sGiDeptCd;
    
    private String sScreenId;
    
    /**
     * 조회조건 - 부품상태코드
     */
    private String sOlditemStatCd;
    
    /**
     * 조회조건 - 접수여부
     */
    private String sAcceptYn;
    
    
    
    

    public String getsScreenId() {
        return sScreenId;
    }

    public void setsScreenId(String sScreenId) {
        this.sScreenId = sScreenId;
    }

    /**
     * @return the sReqDeptCd
     */
    public String getsReqDeptCd() {
        return sReqDeptCd;
    }

    /**
     * @param sReqDeptCd the sReqDeptCd to set
     */
    public void setsReqDeptCd(String sReqDeptCd) {
        this.sReqDeptCd = sReqDeptCd;
    }

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

    public String getsOlditemStatCd() {
        return sOlditemStatCd;
    }

    public void setsOlditemStatCd(String sOlditemStatCd) {
        this.sOlditemStatCd = sOlditemStatCd;
    }

    public String getsAcceptYn() {
        return sAcceptYn;
    }

    public void setsAcceptYn(String sAcceptYn) {
        this.sAcceptYn = sAcceptYn;
    }

    public String getsGiDeptCd() {
        return sGiDeptCd;
    }

    public void setsGiDeptCd(String sGiDeptCd) {
        this.sGiDeptCd = sGiDeptCd;
    }
    



}
