package chn.bhmc.dms.ser.wac.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseSearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : InvoiceMonthlySearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 8. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 17.     Kwon ki hyun     최초 생성
 * </pre>
 */

public class InvoiceMonthlySearchVO extends BaseSearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -649974668986261249L;

    /**
     * 딜러코드
     **/
    private String sDlrCd;

    /**
     * 인보이스번호
     **/
    private String sInvcNo;

    /**
     * 공제번호
     **/
    @NotEmpty
    private String sDdctNo;


    /**
     * 조회 시작일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sFromDt;

    /**
     * 조회 종료일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sToDt;

    /**
     * 클레임 유형
     */
    private String sClaimTp;

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
     * @return the sInvcNo
     */
    public String getsInvcNo() {
        return sInvcNo;
    }

    /**
     * @param sInvcNo the sInvcNo to set
     */
    public void setsInvcNo(String sInvcNo) {
        this.sInvcNo = sInvcNo;
    }

    /**
     * @return the sDdctNo
     */
    public String getsDdctNo() {
        return sDdctNo;
    }

    /**
     * @param sDdctNo the sDdctNo to set
     */
    public void setsDdctNo(String sDdctNo) {
        this.sDdctNo = sDdctNo;
    }

    /**
     * @return the sFromDt
     */
    public Date getsFromDt() {
        return sFromDt;
    }

    /**
     * @param sFromDt the sFromDt to set
     */
    public void setsFromDt(Date sFromDt) {
        this.sFromDt = sFromDt;
    }

    /**
     * @return the sToDt
     */
    public Date getsToDt() {
        return sToDt;
    }

    /**
     * @param sToDt the sToDt to set
     */
    public void setsToDt(Date sToDt) {
        this.sToDt = sToDt;
    }

    /**
     * @return the sClaimTp
     */
    public String getsClaimTp() {
        return sClaimTp;
    }

    /**
     * @param sClaimTp the sClaimTp to set
     */
    public void setsClaimTp(String sClaimTp) {
        this.sClaimTp = sClaimTp;
    }



}
