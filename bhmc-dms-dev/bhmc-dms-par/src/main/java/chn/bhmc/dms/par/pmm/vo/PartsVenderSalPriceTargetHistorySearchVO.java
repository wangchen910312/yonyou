package chn.bhmc.dms.par.pmm.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 판매가 히스토리 검색 VO
 *
 * @ClassName   : PartsVenderSalPriceTargetHistorySearchVO.java
 * @Description : PartsVenderSalPriceTargetHistorySearchVO Class
 * @author In Bo Shim
 * @since 2016. 4. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 19.     In Bo Shim     최초 생성
 * </pre>
 */

public class PartsVenderSalPriceTargetHistorySearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1139416256531361528L;

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
     * 품목번호
     */
    private String sItemCd;

    /**
     * 품목명
     */
    private String sItemNm;

    /**
     * 판매가유형
     **/
    private String sPrcTp;

    /**
     * 품목구분코드
     **/
    private String sItemDstinCd;

    /**
     * 차종
     **/
    private String sCarlineCd;

    /**
     * ABC Class
     **/
    private String sAbcInd;

    /**
     * 적용시작일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sApplyStartDt;

    /**
     * 적용종료일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sApplyEndDt;

    /**
     * 생성자 ID
     **/
    private String sRegUsrId;

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
     * @return the sItemNm
     */
    public String getsItemNm() {
        return sItemNm;
    }

    /**
     * @param sItemNm the sItemNm to set
     */
    public void setsItemNm(String sItemNm) {
        this.sItemNm = sItemNm;
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
     * @return the sItemDstinCd
     */
    public String getsItemDstinCd() {
        return sItemDstinCd;
    }

    /**
     * @param sItemDstinCd the sItemDstinCd to set
     */
    public void setsItemDstinCd(String sItemDstinCd) {
        this.sItemDstinCd = sItemDstinCd;
    }

    /**
     * @return the sCarlineCd
     */
    public String getsCarlineCd() {
        return sCarlineCd;
    }

    /**
     * @param sCarlineCd the sCarlineCd to set
     */
    public void setsCarlineCd(String sCarlineCd) {
        this.sCarlineCd = sCarlineCd;
    }

    /**
     * @return the sAbcInd
     */
    public String getsAbcInd() {
        return sAbcInd;
    }

    /**
     * @param sAbcInd the sAbcInd to set
     */
    public void setsAbcInd(String sAbcInd) {
        this.sAbcInd = sAbcInd;
    }

    /**
     * @return the sApplyStartDt
     */
    public Date getsApplyStartDt() {
        return sApplyStartDt;
    }

    /**
     * @param sApplyStartDt the sApplyStartDt to set
     */
    public void setsApplyStartDt(Date sApplyStartDt) {
        this.sApplyStartDt = sApplyStartDt;
    }

    /**
     * @return the sApplyEndDt
     */
    public Date getsApplyEndDt() {
        return sApplyEndDt;
    }

    /**
     * @param sApplyEndDt the sApplyEndDt to set
     */
    public void setsApplyEndDt(Date sApplyEndDt) {
        this.sApplyEndDt = sApplyEndDt;
    }

    /**
     * @return the sRegUsrId
     */
    public String getsRegUsrId() {
        return sRegUsrId;
    }

    /**
     * @param sRegUsrId the sRegUsrId to set
     */
    public void setsRegUsrId(String sRegUsrId) {
        this.sRegUsrId = sRegUsrId;
    }

}
