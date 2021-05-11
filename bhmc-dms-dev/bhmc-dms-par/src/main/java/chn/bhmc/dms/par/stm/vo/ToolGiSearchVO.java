package chn.bhmc.dms.par.stm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PartsSaleOrdSearchVO.java
 * @Description : PartsSaleOrdSearchVO.class
 * @author Ju Won Lee
 * @since 2016. 2. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 3.     Ju Won Lee     최초 생성
 * </pre>
 */

public class ToolGiSearchVO extends SearchVO {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5889788098505718469L;

    /**
     * 딜러코드
     **/

    private  String       sDlrCd;

    /**
     * 상태코드
     **/
    private  String       sStatCd;

    /**
     * 거래처코드
     **/
    private  String       sBpCd;

    /**
     * 품목코드
     **/
    //ITEM_CD
    private  String       sItemCd;

    /**
     * 품목코드
     **/
    //ITEM_CD
    private  String       sItemNm;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            sRegDtFr;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            sRegDtTo;

    /**
     * 출고일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            sGiDtFr;

    /**
     * 출고일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            sGiDtTo;

    /**
     * 반환일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            sReturnDtFr;

    /**
     * 반환일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            sReturnDtTo;


    /**
     * 공구출고문서번호
     **/

    private  String        sToolGiDocNo;

    /**
     * RO문서번호
     **/

    private  String        sRoDocNo;


    /**
     * 공구출고유형
     **/

    private  String        sToolGiTp;

    /**
     * 수리공ID
     **/
    //TECH_ID

    private  String             sTechId;

    /**
     * 출고담당ID
     **/
    //GI_PRSN_ID

    private  String             sGiPrsnId;

    /**
     * 반환담당ID
     **/
    //RETURN_PRSN_ID

    private  String             sReturnPrsnId;


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
     * @return the sStatCd
     */
    public String getsStatCd() {
        return sStatCd;
    }

    /**
     * @param sStatCd the sStatCd to set
     */
    public void setsStatCd(String sStatCd) {
        this.sStatCd = sStatCd;
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
     * @return the sRegDtFr
     */
    public Date getsRegDtFr() {
        return sRegDtFr;
    }

    /**
     * @param sRegDtFr the sRegDtFr to set
     */
    public void setsRegDtFr(Date sRegDtFr) {
        this.sRegDtFr = sRegDtFr;
    }

    /**
     * @return the sRegDtTo
     */
    public Date getsRegDtTo() {
        return sRegDtTo;
    }

    /**
     * @param sRegDtTo the sRegDtTo to set
     */
    public void setsRegDtTo(Date sRegDtTo) {
        this.sRegDtTo = sRegDtTo;
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
     * @return the sReturnDtFr
     */
    public Date getsReturnDtFr() {
        return sReturnDtFr;
    }

    /**
     * @param sReturnDtFr the sReturnDtFr to set
     */
    public void setsReturnDtFr(Date sReturnDtFr) {
        this.sReturnDtFr = sReturnDtFr;
    }

    /**
     * @return the sReturnDtTo
     */
    public Date getsReturnDtTo() {
        return sReturnDtTo;
    }

    /**
     * @param sReturnDtTo the sReturnDtTo to set
     */
    public void setsReturnDtTo(Date sReturnDtTo) {
        this.sReturnDtTo = sReturnDtTo;
    }

    /**
     * @return the sToolGiDocNo
     */
    public String getsToolGiDocNo() {
        return sToolGiDocNo;
    }

    /**
     * @param sToolGiDocNo the sToolGiDocNo to set
     */
    public void setsToolGiDocNo(String sToolGiDocNo) {
        this.sToolGiDocNo = sToolGiDocNo;
    }

    /**
     * @return the sToolGiTp
     */
    public String getsToolGiTp() {
        return sToolGiTp;
    }

    /**
     * @param sToolGiTp the sToolGiTp to set
     */
    public void setsToolGiTp(String sToolGiTp) {
        this.sToolGiTp = sToolGiTp;
    }

    /**
     * @return the sGiDtFr
     */
    public Date getsGiDtFr() {
        return sGiDtFr;
    }

    /**
     * @param sGiDtFr the sGiDtFr to set
     */
    public void setsGiDtFr(Date sGiDtFr) {
        this.sGiDtFr = sGiDtFr;
    }

    /**
     * @return the sGiDtTo
     */
    public Date getsGiDtTo() {
        return sGiDtTo;
    }

    /**
     * @param sGiDtTo the sGiDtTo to set
     */
    public void setsGiDtTo(Date sGiDtTo) {
        this.sGiDtTo = sGiDtTo;
    }

    /**
     * @return the sTechId
     */
    public String getsTechId() {
        return sTechId;
    }

    /**
     * @param sTechId the sTechId to set
     */
    public void setsTechId(String sTechId) {
        this.sTechId = sTechId;
    }

    /**
     * @return the sGiPrsnId
     */
    public String getsGiPrsnId() {
        return sGiPrsnId;
    }

    /**
     * @param sGiPrsnId the sGiPrsnId to set
     */
    public void setsGiPrsnId(String sGiPrsnId) {
        this.sGiPrsnId = sGiPrsnId;
    }

    /**
     * @return the sReturnPrsnId
     */
    public String getsReturnPrsnId() {
        return sReturnPrsnId;
    }

    /**
     * @param sReturnPrsnId the sReturnPrsnId to set
     */
    public void setsReturnPrsnId(String sReturnPrsnId) {
        this.sReturnPrsnId = sReturnPrsnId;
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

}
