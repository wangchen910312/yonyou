package chn.bhmc.dms.par.pmm.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 공급처별 부품판매가격 마스터 관리 검색 VO
 *
 * @ClassName   : PartsVenderSalPriceMasterSearchVO.java
 * @Description : PartsVenderSalPriceMasterSearchVO Class
 * @author In Bo Shim
 * @since 2016. 2. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 16.     In Bo Shim     최초 생성
 * </pre>
 */

public class PartsVenderSalPriceMasterSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3371526599085643012L;

    /**
     * 딜러코드
     */
    @NotEmpty
    private String sDlrCd;

    /**
     * 거래처코드
     */
    private String sBpCd;

    /**
     * 창고코드
     */
    private String sStrgeCd;

    /**
     * 부품코드
     */
    private String sItemCd;

    /**
     * 부품코드만
     */
    private String sItemCdOnly;

    /**
     * 구매단가유형
     */
    private String sPrcTp;

    /**
     * 라인번호
     */
    private int sLineNo;

    /**
     * 삭제유무
     */
    private String sDelYn;

    /**
     * 지불유형(서비스관련)
     */
    private String sPayTp;

    /**
     * 효력시작일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartDt;

    /**
     * 효력종료일
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndDt;

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
     * @return the sBpCd
     */
    public String getsBpCd() {
        return sBpCd;
    }

    /**
     * @param sBpCd the sBpCd to set
     */
    public void setsBpCd(String sBpCd) {
        this.sBpCd = sBpCd;
    }


    /**
     * @return the sStrgeCd
     */
    public String getsStrgeCd() {
        return sStrgeCd;
    }

    /**
     * @param sStrgeCd the sStrgeCd to set
     */
    public void setsStrgeCd(String sStrgeCd) {
        this.sStrgeCd = sStrgeCd;
    }

    /**
     * @return the sItemCd
     */
    public String getsItemCd() {
        return sItemCd;
    }

    /**
     * @param sItemCd the sItemCd to set
     */
    public void setsItemCd(String sItemCd) {
        this.sItemCd = sItemCd;
    }

    /**
     * @return the sItemCdOnly
     */
    public String getsItemCdOnly() {
        return sItemCdOnly;
    }

    /**
     * @param sItemCdOnly the sItemCdOnly to set
     */
    public void setsItemCdOnly(String sItemCdOnly) {
        this.sItemCdOnly = sItemCdOnly;
    }

    /**
     * @return the sPrcTp
     */
    public String getsPrcTp() {
        return sPrcTp;
    }

    /**
     * @param sPrcTp the sPrcTp to set
     */
    public void setsPrcTp(String sPrcTp) {
        this.sPrcTp = sPrcTp;
    }

    /**
     * @return the sLineNo
     */
    public int getsLineNo() {
        return sLineNo;
    }

    /**
     * @param sLineNo the sLineNo to set
     */
    public void setsLineNo(int sLineNo) {
        this.sLineNo = sLineNo;
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

    /**
     * @return the sStartDt
     */
    public Date getsStartDt() {
        return sStartDt;
    }

    /**
     * @param sStartDt the sStartDt to set
     */
    public void setsStartDt(Date sStartDt) {
        this.sStartDt = sStartDt;
    }

    /**
     * @return the sEndDt
     */
    public Date getsEndDt() {
        return sEndDt;
    }

    /**
     * @param sEndDt the sEndDt to set
     */
    public void setsEndDt(Date sEndDt) {
        this.sEndDt = sEndDt;
    }

    /**
     * @return the sPayTp
     */
    public String getsPayTp() {
        return sPayTp;
    }

    /**
     * @param sPayTp the sPayTp to set
     */
    public void setsPayTp(String sPayTp) {
        this.sPayTp = sPayTp;
    }

}
