package chn.bhmc.dms.ser.cal.vo;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CalculateSearchVO.java
 * @Description : 정산 SearchVO
 * @author KyungMok Kim
 * @since 2016. 3. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 18.    KyungMok Kim     최초 생성
 * </pre>
 */

public class CalculateSearchVO extends SearchVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8942495421671858205L;

    /**
     * 딜러코드
     **/
    private String sDlrCd;

    /**
     *  정산번호
     **/
    private String sCalcDocNo;

    /**
     *  RO번호
     **/
    private String sRoDocNo;

    /**
     *  VIN
     **/
    private String sVinNo;

    /**
     *  운전자명
     **/
    private String sDriverNm;

    /**
     *  소유자명
     **/
    private String sCarOwnerNm;

    /**
     *  차량번호
     **/
    private String sCarRegNo;

    /**
     * RO 유형
     */
    private String sRoTp;

    /**
     * RO 유형
     */
    private List<String> sRoTpList;

    /**
     * 서비스이력 조회여부
     */
    private String sSerHistYn;

    /**
     *  정산일자(From)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCalcFromDt;

    /**
     *  정산일자(To)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCalcToDt;

    /**
     *  RO일자(From)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRoFromDt;

    /**
     *  RO일자(To)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRoToDt;

    /**
     *  정산등록일자(From)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCalcRegFromDt;

    /**
     *  정산등록일자(To)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCalcRegToDt;

    private String sRoStatCd;

    private String sRcvStatCd;

    private String sCalcStatCd;

    private String sCalcCancYn;

    private String sRegUsrNm;

    private String sScreenGb;

    /**
     * RO발행자
     */
    private String sRoUsrNm;

    /**
     * 자체RO유형
     */
    private String sDlrRoTp;

    /**
     * @return the sCarOwnerNm
     */
    public String getsCarOwnerNm() {
        return sCarOwnerNm;
    }
    /**
     * @param sCarOwnerNm the sCarOwnerNm to set
     */
    public void setsCarOwnerNm(String sCarOwnerNm) {
        this.sCarOwnerNm = sCarOwnerNm;
    }
    /**
     * @return the sRoTp
     */
    public String getsRoTp() {
        return sRoTp;
    }
    /**
     * @param sRoTp the sRoTp to set
     */
    public void setsRoTp(String sRoTp) {
        this.sRoTp = sRoTp;
    }

    /**
     * @return the sRoTpList
     */
    public List<String> getsRoTpList() {
        return sRoTpList;
    }
    /**
     * @param sRoTpList the sRoTpList to set
     */
    public void setsRoTpList(List<String> sRoTpList) {
        this.sRoTpList = sRoTpList;
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
     * @return the sCalcDocNo
     */
    public String getsCalcDocNo() {
        return sCalcDocNo;
    }
    /**
     * @param sCalcDocNo the sCalcDocNo to set
     */
    public void setsCalcDocNo(String sCalcDocNo) {
        this.sCalcDocNo = sCalcDocNo;
    }
    /**
     * @return the sRoDocNo
     */
    public String getsRoDocNo() {
        return sRoDocNo;
    }
    /**
     * @param sRoDocNo the sRoDocNo to set
     */
    public void setsRoDocNo(String sRoDocNo) {
        this.sRoDocNo = sRoDocNo;
    }
    /**
     * @return the sVinNo
     */
    public String getsVinNo() {
        return sVinNo;
    }
    /**
     * @param sVinNo the sVinNo to set
     */
    public void setsVinNo(String sVinNo) {
        this.sVinNo = sVinNo;
    }
    /**
     * @return the sDriverNm
     */
    public String getsDriverNm() {
        return sDriverNm;
    }
    /**
     * @param sDriverNm the sDriverNm to set
     */
    public void setsDriverNm(String sDriverNm) {
        this.sDriverNm = sDriverNm;
    }
    /**
     * @return the sCarRegNo
     */
    public String getsCarRegNo() {
        return sCarRegNo;
    }
    /**
     * @param sCarRegNo the sCarRegNo to set
     */
    public void setsCarRegNo(String sCarRegNo) {
        this.sCarRegNo = sCarRegNo;
    }
    /**
     * @return the sCalcFromDt
     */
    public Date getsCalcFromDt() {
        return sCalcFromDt;
    }
    /**
     * @param sCalcFromDt the sCalcFromDt to set
     */
    public void setsCalcFromDt(Date sCalcFromDt) {
        this.sCalcFromDt = sCalcFromDt;
    }
    /**
     * @return the sCalcToDt
     */
    public Date getsCalcToDt() {
        return sCalcToDt;
    }
    /**
     * @param sCalcToDt the sCalcToDt to set
     */
    public void setsCalcToDt(Date sCalcToDt) {
        this.sCalcToDt = sCalcToDt;
    }
    /**
     * @return the sRoFromDt
     */
    public Date getsRoFromDt() {
        return sRoFromDt;
    }
    /**
     * @param sRoFromDt the sRoFromDt to set
     */
    public void setsRoFromDt(Date sRoFromDt) {
        this.sRoFromDt = sRoFromDt;
    }
    /**
     * @return the sRoToDt
     */
    public Date getsRoToDt() {
        return sRoToDt;
    }
    /**
     * @param sRoToDt the sRoToDt to set
     */
    public void setsRoToDt(Date sRoToDt) {
        this.sRoToDt = sRoToDt;
    }
    /**
     * @return the sRoStatCd
     */
    public String getsRoStatCd() {
        return sRoStatCd;
    }
    /**
     * @param sRoStatCd the sRoStatCd to set
     */
    public void setsRoStatCd(String sRoStatCd) {
        this.sRoStatCd = sRoStatCd;
    }
    /**
     * @return the sRcvStatCd
     */
    public String getsRcvStatCd() {
        return sRcvStatCd;
    }
    /**
     * @param sRcvStatCd the sRcvStatCd to set
     */
    public void setsRcvStatCd(String sRcvStatCd) {
        this.sRcvStatCd = sRcvStatCd;
    }
    public String getsCalcStatCd() {
        return sCalcStatCd;
    }
    public void setsCalcStatCd(String sCalcStatCd) {
        this.sCalcStatCd = sCalcStatCd;
    }
    public String getsCalcCancYn() {
        return sCalcCancYn;
    }
    public void setsCalcCancYn(String sCalcCancYn) {
        this.sCalcCancYn = sCalcCancYn;
    }
    public String getsSerHistYn() {
        return sSerHistYn;
    }
    public void setsSerHistYn(String sSerHistYn) {
        this.sSerHistYn = sSerHistYn;
    }
    public String getsRegUsrNm() {
        return sRegUsrNm;
    }
    public void setsRegUsrNm(String sRegUsrNm) {
        this.sRegUsrNm = sRegUsrNm;
    }
    /**
     * @return the sScreenGb
     */
    public String getsScreenGb() {
        return sScreenGb;
    }
    /**
     * @param sScreenGb the sScreenGb to set
     */
    public void setsScreenGb(String sScreenGb) {
        this.sScreenGb = sScreenGb;
    }
    /**
     * @return the sCalcRegFromDt
     */
    public Date getsCalcRegFromDt() {
        return sCalcRegFromDt;
    }
    /**
     * @param sCalcRegFromDt the sCalcRegFromDt to set
     */
    public void setsCalcRegFromDt(Date sCalcRegFromDt) {
        this.sCalcRegFromDt = sCalcRegFromDt;
    }
    /**
     * @return the sCalcRegToDt
     */
    public Date getsCalcRegToDt() {
        return sCalcRegToDt;
    }
    /**
     * @param sCalcRegToDt the sCalcRegToDt to set
     */
    public void setsCalcRegToDt(Date sCalcRegToDt) {
        this.sCalcRegToDt = sCalcRegToDt;
    }
    /**
     * @param sRoUsrNm the sRoUsrNm to set
     */
    public void setsRoUsrNm(String sRoUsrNm) {
        this.sRoUsrNm = sRoUsrNm;
    }
    /**
     * @return the sRoUsrNm
     */
    public String getsRoUsrNm() {
        return sRoUsrNm;
    }
    /**
     * @param sDlrRoTp the sDlrRoTp to set
     */
    public void setsDlrRoTp(String sDlrRoTp) {
        this.sDlrRoTp = sDlrRoTp;
    }
    /**
     * @return the sDlrRoTp
     */
    public String getsDlrRoTp() {
        return sDlrRoTp;
    }

}