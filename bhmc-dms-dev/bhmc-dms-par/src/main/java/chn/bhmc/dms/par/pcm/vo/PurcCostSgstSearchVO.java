package chn.bhmc.dms.par.pcm.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 구매제시(구매소요량관리) 검색 VO
 *
 * @ClassName   : PurcCostSgstSearchVO.java
 * @Description : PurcCostSgstSearchVO Class
 * @author In Bo Shim
 * @since 2016. 2. 4.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 4.     In Bo Shim     최초 생성
 * </pre>
 */

public class PurcCostSgstSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -333243541933172835L;

    /**
     * 딜러코드
     **/
    @NotEmpty
    private String sDlrCd;

    /**
     * 품목코드
    **/
    private String sItemCd;

    /**
     * 품목명
    **/
    private String sItemNm;

    /**
     * 공급처코드
    **/
    private String sBpCd;

    /**
     * 센터코드
    **/
    private String sPltCd;

    /**
     * 차종코드
    **/
    private String sCarlineCd;

    /**
     * ABC Class
    **/
    private String sAbcInd;

    /**
     * 창고
     **/
    private String sStrgeCd;

    /**
     * 로케이션
     **/
    private String sLocCd;

    /**
     * 거래처유형
     **/
    private String sBpTp;

    /**
     * 차형
     **/
    private String sModelCd;

    /**
     * 품목구분코드
     **/
    private String sItemDstinCd;

    /**
     * 기준시작일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStdDtFr;

    /**
     * 기준종료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStdDtTo;

    /**
     * 최근입고시작일자(최종입고일자)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sLastGrStartDt;

    /**
     * 최근입고종료일자(최종입고일자)
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sLastGrEndDt;

    /**
     * 최근출고시작일자(최종출고일자)
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sLastGiStartDt;

    /**
     * 최근출고종료일자(최종출고일자)
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sLastGiEndDt;

    /**
     * 대상여부
     **/
    @NotEmpty
    private  String sTargYn;

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
     * @return the sPltCd
     */
    public String getsPltCd() {
        return sPltCd;
    }

    /**
     * @param sPltCd the sPltCd to set
     */
    public void setsPltCd(String sPltCd) {
        this.sPltCd = sPltCd;
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
    public void setsCarLineCd(String sCarlineCd) {
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
     * @return the sLastGrStartDt
     */
    public Date getsLastGrStartDt() {
        return sLastGrStartDt;
    }

    /**
     * @param sLastGrStartDt the sLastGrStartDt to set
     */
    public void setsLastGrStartDt(Date sLastGrStartDt) {
        this.sLastGrStartDt = sLastGrStartDt;
    }

    /**
     * @return the sLastGrEndDt
     */
    public Date getsLastGrEndDt() {
        return sLastGrEndDt;
    }

    /**
     * @param sLastGrEndDt the sLastGrEndDt to set
     */
    public void setsLastGrEndDt(Date sLastGrEndDt) {
        this.sLastGrEndDt = sLastGrEndDt;
    }

    /**
     * @return the sLastGiStartDt
     */
    public Date getsLastGiStartDt() {
        return sLastGiStartDt;
    }

    /**
     * @param sLastGiStartDt the sLastGiStartDt to set
     */
    public void setsLastGiStartDt(Date sLastGiStartDt) {
        this.sLastGiStartDt = sLastGiStartDt;
    }

    /**
     * @return the sLastGiEndDt
     */
    public Date getsLastGiEndDt() {
        return sLastGiEndDt;
    }

    /**
     * @param sLastGiEndDt the sLastGiEndDt to set
     */
    public void setsLastGiEndDt(Date sLastGiEndDt) {
        this.sLastGiEndDt = sLastGiEndDt;
    }

    /**
     * @return the sTargYn
     */
    public String getsTargYn() {
        return sTargYn;
    }

    /**
     * @param sTargYn the sTargYn to set
     */
    public void setsTargYn(String sTargYn) {
        this.sTargYn = sTargYn;
    }

    /**
     * @return the sStdDtFr
     */
    public Date getsStdDtFr() {
        return sStdDtFr;
    }

    /**
     * @param sStdDtFr the sStdDtFr to set
     */
    public void setsStdDtFr(Date sStdDtFr) {
        this.sStdDtFr = sStdDtFr;
    }

    /**
     * @return the sStdDtTo
     */
    public Date getsStdDtTo() {
        return sStdDtTo;
    }

    /**
     * @param sStdDtTo the sStdDtTo to set
     */
    public void setsStdDtTo(Date sStdDtTo) {
        this.sStdDtTo = sStdDtTo;
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
     * @param sCarlineCd the sCarlineCd to set
     */
    public void setsCarlineCd(String sCarlineCd) {
        this.sCarlineCd = sCarlineCd;
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
     * @return the sLocCd
     */
    public String getsLocCd() {
        return sLocCd;
    }

    /**
     * @param sLocCd the sLocCd to set
     */
    public void setsLocCd(String sLocCd) {
        this.sLocCd = sLocCd;
    }

    /**
     * @return the sBpTp
     */
    public String getsBpTp() {
        return sBpTp;
    }

    /**
     * @param sBpTp the sBpTp to set
     */
    public void setsBpTp(String sBpTp) {
        this.sBpTp = sBpTp;
    }

    /**
     * @return the sModelCd
     */
    public String getsModelCd() {
        return sModelCd;
    }

    /**
     * @param sModelCd the sModelCd to set
     */
    public void setsModelCd(String sModelCd) {
        this.sModelCd = sModelCd;
    }
}
