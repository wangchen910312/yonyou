package chn.bhmc.dms.par.pmm.vo;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 수불 조회 SearchVO
 *
 * @ClassName   : MvtDocSearchVO.java
 * @Description : MvtDocSearchVO Class
 * @author Ju Won Lee
 * @since 2016. 1. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 7.     Ju Won Lee     최초 생성
 * </pre>
 */

public class MvtDocSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1L;

    /**
     * 딜러코드
     **/
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
     * 품목구분코드
     **/
    private String sItemDstinCd;

    /**
     * 품목그룹코드
     **/
    private String sItemGrpCd;

    /**
     * 차종
     **/
    private String sCarlineCd;

    /**
     * 창고코드
     **/
    private String sStrgeCd;

    /**
     * 입고창고코드
     **/
    private String sGrStrgeCd;

    /**
     * 출고창고코드
     **/
    private String sGiStrgeCd;

    /**
     * ABC CLASS
     **/
    private String sAbcInd;

    /**
     * 거래처코드
     **/
    private String sBpCd;

    /**
     * 수불문서년월일자
     **/
    private String sMvtDocYyMm;

    /**
     * 수불문서번호
     **/
    private String sMvtDocNo;

    /**
     * 전표처리일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStmtProcDt;

    /**
     * 시스템처리일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sSysProcDt;

    /**
     * 전표처리일자시작일
     **/
    private String sStmtProcDtFr;

    /**
     * 전표처리일자종료일
     **/
    private String sStmtProcDtTo;

    /**
     * 출고일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sGiDt;

    /**
     * 출고일자시작일
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sGiDtFr;

    /**
     * 출고일자종료일
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sGiDtTo;

    /**
     * 입고일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sGrDt;

    /**
     * 입고일자시작일
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sGrDtFr;

    /**
     * 입고일자종료일
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sGrDtTo;

    /**
     * 수불유형
     **/
    private String sMvtTp;

    /**
     * 입출고유형
     **/
    private String sMvtGrGiTp;

    /**
     * 수불유형리스트
     **/
    private  List<String> sMvtTpLst;

    /**
     * 사업장코드
     **/
    private String sBizAreaCd;

    /**
     * 고객번호
     **/
    private String sCustNo;

    /**
     * 전표텍스트
     **/
    private String sStmtTxt;

    /**
     * 참조문서유형
     **/
    private String sRefDocTp;

    /**
     * 참조문서번호
     **/
    private String sRefDocNo;

    /**
     * 출고문서번호
     **/
    private String sGiDocNo;

    /**
     * 입고문서번호
     **/
    private String sGrDocNo;

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
     * @return the sItemGrpCd
     */
    public String getsItemGrpCd() {
        return sItemGrpCd;
    }

    /**
     * @param sItemGrpCd the sItemGrpCd to set
     */
    public void setsItemGrpCd(String sItemGrpCd) {
        this.sItemGrpCd = sItemGrpCd;
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
     * @return the sMvtDocYyMm
     */
    public String getsMvtDocYyMm() {
        return sMvtDocYyMm;
    }

    /**
     * @param sMvtDocYyMm the sMvtDocYyMm to set
     */
    public void setsMvtDocYyMm(String sMvtDocYyMm) {
        this.sMvtDocYyMm = sMvtDocYyMm;
    }

    /**
     * @return the sMvtDocNo
     */
    public String getsMvtDocNo() {
        return sMvtDocNo;
    }

    /**
     * @param sMvtDocNo the sMvtDocNo to set
     */
    public void setsMvtDocNo(String sMvtDocNo) {
        this.sMvtDocNo = sMvtDocNo;
    }

    /**
     * @return the sStmtProcDt
     */
    public Date getsStmtProcDt() {
        return sStmtProcDt;
    }

    /**
     * @param sStmtProcDt the sStmtProcDt to set
     */
    public void setsStmtProcDt(Date sStmtProcDt) {
        this.sStmtProcDt = sStmtProcDt;
    }

    /**
     * @return the sSysProcDt
     */
    public Date getsSysProcDt() {
        return sSysProcDt;
    }

    /**
     * @param sSysProcDt the sSysProcDt to set
     */
    public void setsSysProcDt(Date sSysProcDt) {
        this.sSysProcDt = sSysProcDt;
    }

    /**
     * @return the sStmtProcDtFr
     */
    public String getsStmtProcDtFr() {
        return sStmtProcDtFr;
    }

    /**
     * @param sStmtProcDtFr the sStmtProcDtFr to set
     */
    public void setsStmtProcDtFr(String sStmtProcDtFr) {
        this.sStmtProcDtFr = sStmtProcDtFr;
    }

    /**
     * @return the sStmtProcDtTo
     */
    public String getsStmtProcDtTo() {
        return sStmtProcDtTo;
    }

    /**
     * @param sStmtProcDtTo the sStmtProcDtTo to set
     */
    public void setsStmtProcDtTo(String sStmtProcDtTo) {
        this.sStmtProcDtTo = sStmtProcDtTo;
    }

    /**
     * @return the sGiDt
     */
    public Date getsGiDt() {
        return sGiDt;
    }

    /**
     * @param sGiDt the sGiDt to set
     */
    public void setsGiDt(Date sGiDt) {
        this.sGiDt = sGiDt;
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
     * @return the sGrDt
     */
    public Date getsGrDt() {
        return sGrDt;
    }

    /**
     * @param sGrDt the sGrDt to set
     */
    public void setsGrDt(Date sGrDt) {
        this.sGrDt = sGrDt;
    }

    /**
     * @return the sGrDtFr
     */
    public Date getsGrDtFr() {
        return sGrDtFr;
    }

    /**
     * @param sGrDtFr the sGrDtFr to set
     */
    public void setsGrDtFr(Date sGrDtFr) {
        this.sGrDtFr = sGrDtFr;
    }

    /**
     * @return the sGrDtTo
     */
    public Date getsGrDtTo() {
        return sGrDtTo;
    }

    /**
     * @param sGrDtTo the sGrDtTo to set
     */
    public void setsGrDtTo(Date sGrDtTo) {
        this.sGrDtTo = sGrDtTo;
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
     * @return the sMvtGrGiTp
     */
    public String getsMvtGrGiTp() {
        return sMvtGrGiTp;
    }

    /**
     * @param sMvtGrGiTp the sMvtGrGiTp to set
     */
    public void setsMvtGrGiTp(String sMvtGrGiTp) {
        this.sMvtGrGiTp = sMvtGrGiTp;
    }

    /**
     * @return the sMvtTpLst
     */
    public List<String> getsMvtTpLst() {
        return sMvtTpLst;
    }

    /**
     * @param sMvtTpLst the sMvtTpLst to set
     */
    public void setsMvtTpLst(List<String> sMvtTpLst) {
        this.sMvtTpLst = sMvtTpLst;
    }

    /**
     * @return the sBizAreaCd
     */
    public String getsBizAreaCd() {
        return sBizAreaCd;
    }

    /**
     * @param sBizAreaCd the sBizAreaCd to set
     */
    public void setsBizAreaCd(String sBizAreaCd) {
        this.sBizAreaCd = sBizAreaCd;
    }

    /**
     * @return the sCustNo
     */
    public String getsCustNo() {
        return sCustNo;
    }

    /**
     * @param sCustNo the sCustNo to set
     */
    public void setsCustNo(String sCustNo) {
        this.sCustNo = sCustNo;
    }

    /**
     * @return the sStmtTxt
     */
    public String getsStmtTxt() {
        return sStmtTxt;
    }

    /**
     * @param sStmtTxt the sStmtTxt to set
     */
    public void setsStmtTxt(String sStmtTxt) {
        this.sStmtTxt = sStmtTxt;
    }

    /**
     * @return the sRefDocTp
     */
    public String getsRefDocTp() {
        return sRefDocTp;
    }

    /**
     * @param sRefDocTp the sRefDocTp to set
     */
    public void setsRefDocTp(String sRefDocTp) {
        this.sRefDocTp = sRefDocTp;
    }

    /**
     * @return the sRefDocNo
     */
    public String getsRefDocNo() {
        return sRefDocNo;
    }

    /**
     * @param sRefDocNo the sRefDocNo to set
     */
    public void setsRefDocNo(String sRefDocNo) {
        this.sRefDocNo = sRefDocNo;
    }

    /**
     * @return the sGiDocNo
     */
    public String getsGiDocNo() {
        return sGiDocNo;
    }

    /**
     * @param sGiDocNo the sGiDocNo to set
     */
    public void setsGiDocNo(String sGiDocNo) {
        this.sGiDocNo = sGiDocNo;
    }

    /**
     * @return the sGrDocNo
     */
    public String getsGrDocNo() {
        return sGrDocNo;
    }

    /**
     * @param sGrDocNo the sGrDocNo to set
     */
    public void setsGrDocNo(String sGrDocNo) {
        this.sGrDocNo = sGrDocNo;
    }
}
