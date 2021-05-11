package chn.bhmc.dms.sal.cer.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DealerReceiptSearchVO
 * @Description : 딜러 영수증 조회 조건 VO(딜러 영수증 등록, 딜러 영수증 조회 및 수정)
 * @author Bong
 * @since 2016. 5. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 20.       Bong                 최초 생성
 * </pre>
 */

public class DealerReceiptSearchVO extends SearchVO{
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6464036928442564755L;

    private String sOfficeNm;      // 사무소명
    private String sReqNo;         // 요청번호
    private String sVinNo;         // 차대번호
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sUploadDtS;        // 업로드일자(시작일)
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sUploadDtE;        // 업로드일자(종료일)

    private String sUpdtYn;        // 수정여부
    private String sDlrCd;         // 딜러코드

    /**
     * @return the sOfficeNm
     */
    public String getsOfficeNm() {
        return sOfficeNm;
    }



    /**
     * @param sOfficeNm the sOfficeNm to set
     */
    public void setsOfficeNm(String sOfficeNm) {
        this.sOfficeNm = sOfficeNm;
    }



    /**
     * @return the sReqNo
     */
    public String getsReqNo() {
        return sReqNo;
    }



    /**
     * @param sReqNo the sReqNo to set
     */
    public void setsReqNo(String sReqNo) {
        this.sReqNo = sReqNo;
    }



    /**
     * @return the sVinN
     */
    public String getsVinNo() {
        return sVinNo;
    }



    /**
     * @param sVinN the sVinN to set
     */
    public void setsVinNo(String sVinNo) {
        this.sVinNo = sVinNo;
    }



    /**
     * @return the sUploadDtS
     */
    public Date getsUploadDtS() {
        return sUploadDtS;
    }



    /**
     * @param sUploadDtS the sUploadDtS to set
     */
    public void setsUploadDtS(Date sUploadDtS) {
        this.sUploadDtS = sUploadDtS;
    }



    /**
     * @return the sUploadDtE
     */
    public Date getsUploadDtE() {
        return sUploadDtE;
    }



    /**
     * @param sUploadDtE the sUploadDtE to set
     */
    public void setsUploadDtE(Date sUploadDtE) {
        this.sUploadDtE = sUploadDtE;
    }



    /**
     * @return the sUpdtYn
     */
    public String getsUpdtYn() {
        return sUpdtYn;
    }



    /**
     * @param sUpdtYn the sUpdtYn to set
     */
    public void setsUpdtYn(String sUpdtYn) {
        this.sUpdtYn = sUpdtYn;
    }



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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}
