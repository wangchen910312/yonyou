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
 * @ClassName   : StockMovStorageSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Bo Shim
 * @since 2016. 5. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 12.     In Bo Shim     최초 생성
 * </pre>
 */

public class StockMovStorageSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1805680604606866327L;

    /**
     * 딜러코드
     **/
    private String sDlrCd;

    /**
     * 센터코드
     **/
    private String sPltCd;

    /**
     * 기타출고문서번호
     **/

    private String sEtcGiDocNo;

    /**
     * 입고창고
     **/

    private String sGrStrgeCd;

    /**
     * 출고창고
     **/

    private String sGiStrgeCd;

    /**
     * 기타출고유형
     **/

    private String sMvtTp;

    /**
     * 기타출고상태
     **/

    private String sStatCd;

    /**
     * 등록자
     **/

    private String sRegUsrId;

    /**
     * 기타출고문서라인번호
     **/

    private int sEtcGiDocLineNo;


    /**
     * 부품번호
     **/

    private String sItemCd;

    /**
     * 부품명
     **/

    private String sItemNm;

    /**
     * 등록일자(시작)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRegDtFr;

    /**
     * 등록일자(종료)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRegDtTo;

    /**
     * 재고이동 헤더/디데일 구분
     **/
    private boolean sStockMovStorageHeaderFlag = false;

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
     * @return the sEtcGiDocNo
     */
    public String getsEtcGiDocNo() {
        return sEtcGiDocNo;
    }

    /**
     * @param sEtcGiDocNo the sEtcGiDocNo to set
     */
    public void setsEtcGiDocNo(String sEtcGiDocNo) {
        this.sEtcGiDocNo = sEtcGiDocNo;
    }

    /**
     * @return the sEtcGiDocLineNo
     */
    public int getsEtcGiDocLineNo() {
        return sEtcGiDocLineNo;
    }

    /**
     * @param sEtcGiDocLineNo the sEtcGiDocLineNo to set
     */
    public void setsEtcGiDocLineNo(int sEtcGiDocLineNo) {
        this.sEtcGiDocLineNo = sEtcGiDocLineNo;
    }

    /**
     * @return the sMvtTp
     */
    public String getsMvtTp() {
        return sMvtTp;
    }

    /**
     * @param sMvtTp the sMvtTp to set
     */
    public void setsMvtTp(String sMvtTp) {
        this.sMvtTp = sMvtTp;
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
     * @return the sGrStrgeCd
     */
    public String getsGrStrgeCd() {
        return sGrStrgeCd;
    }

    /**
     * @param sGrStrgeCd the sGrStrgeCd to set
     */
    public void setsGrStrgeCd(String sGrStrgeCd) {
        this.sGrStrgeCd = sGrStrgeCd;
    }

    /**
     * @return the sGiStrgeCd
     */
    public String getsGiStrgeCd() {
        return sGiStrgeCd;
    }

    /**
     * @param sGiStrgeCd the sGiStrgeCd to set
     */
    public void setsGiStrgeCd(String sGiStrgeCd) {
        this.sGiStrgeCd = sGiStrgeCd;
    }

    /**
     * @return the sStockMovStorageHeaderFlag
     */
    public boolean issStockMovStorageHeaderFlag() {
        return sStockMovStorageHeaderFlag;
    }

    /**
     * @param sStockMovStorageHeaderFlag the sStockMovStorageHeaderFlag to set
     */
    public void setsStockMovStorageHeaderFlag(boolean sStockMovStorageHeaderFlag) {
        this.sStockMovStorageHeaderFlag = sStockMovStorageHeaderFlag;
    }
}
