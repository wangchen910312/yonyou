package chn.bhmc.dms.sal.acc.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * 용품입고 문서 조회 SearchVO
 * </pre>
 *
 * @ClassName   : AccessoryItemInputSearchVO.java
 * @Description :
 * @author Kang Seok Han
 * @since 2017. 2. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since    author  description
 *  ===========    =============    ===========================
 *  2017. 2. 10.   Kang Seok Han    최초 생성
 * </pre>
 */

public class AccessoryItemInputSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -486501005218741655L;

    /**
     * 딜러코드
     **/
    private String sDlrCd;

    /**
     * 수불유형
     */
    private String sMvtTp;

    /**
     * 입고문서 상태코드
     */
    private String sStatCd;

    /**
     * 업체유형
     */
    private String sBpTp;

    /**
     * 업체코드
     */
    private String sBpCd;

    /**
     * 업체명
     */
    private String sBpNm;

    /**
     * 입고문서번호
     */
    private String sEtcGrDocNo;

    /**
     * 입고문서 업무구분
     */
    private String sEtcGrDocTp;

    /**
     * 입고일자 조회시작일
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sInvcGrDtFr;

    /**
     * 입고일자 조회종료일
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sInvcGrDtTo;

    /**
     * 입고문서 생성일자 조회시작일
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRegDtFr;

    /**
     * 입고문서 생성일자 조회종료일
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRegDtTo;

    /**
     * 용품코드
     */
    private String sItemCd;

    /**
     * 용품명
     */
    private String sItemNm;

    /**
     * 입고창고코드
     */
    private String sGrStrgeCd;

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
     * @return the sBpNm
     */
    public String getsBpNm() {
        return sBpNm;
    }

    /**
     * @param sBpNm the sBpNm to set
     */
    public void setsBpNm(String sBpNm) {
        this.sBpNm = sBpNm;
    }

    /**
     * @return the sEtcGrDocNo
     */
    public String getsEtcGrDocNo() {
        return sEtcGrDocNo;
    }

    /**
     * @param sEtcGrDocNo the sEtcGrDocNo to set
     */
    public void setsEtcGrDocNo(String sEtcGrDocNo) {
        this.sEtcGrDocNo = sEtcGrDocNo;
    }

    /**
     * @return the sEtcGrDocTp
     */
    public String getsEtcGrDocTp() {
        return sEtcGrDocTp;
    }

    /**
     * @param sEtcGrDocTp the sEtcGrDocTp to set
     */
    public void setsEtcGrDocTp(String sEtcGrDocTp) {
        this.sEtcGrDocTp = sEtcGrDocTp;
    }

    /**
     * @return the sInvcGrDtFr
     */
    public Date getsInvcGrDtFr() {
        return sInvcGrDtFr;
    }

    /**
     * @param sInvcGrDtFr the sInvcGrDtFr to set
     */
    public void setsInvcGrDtFr(Date sInvcGrDtFr) {
        this.sInvcGrDtFr = sInvcGrDtFr;
    }

    /**
     * @return the sInvcGrDtTo
     */
    public Date getsInvcGrDtTo() {
        return sInvcGrDtTo;
    }

    /**
     * @param sInvcGrDtTo the sInvcGrDtTo to set
     */
    public void setsInvcGrDtTo(Date sInvcGrDtTo) {
        this.sInvcGrDtTo = sInvcGrDtTo;
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
}
