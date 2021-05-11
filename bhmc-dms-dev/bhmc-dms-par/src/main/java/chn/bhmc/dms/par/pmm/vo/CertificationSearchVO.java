package chn.bhmc.dms.par.pmm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * 합격증 SEARCH VO
 * </pre>
 *
 * @ClassName   : CertificationSearchVO.java
 * @author Eun Jung Jang
 * @since 2016. 5. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 25.    Eun Jung Jang     최초 생성
 * </pre>
 */

public class CertificationSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -700616617120634605L;

    /**
     * 딜러코드
     **/
    private String sDlrCd;

    /**
     * 딜러코드
     **/
    private String sDlrNm;

    /**
     * 합격증번호
     **/
    private String sCertNo;

    /**
     * 합격증상태코드
     **/
    private String sCertStatCd;

    /**
     * 합격증유형
     **/
    private String sCertTp;

    /**
     * 전화번호
     **/
    private String sTelNo;

    /**
     * 휴대폰번호
     **/
    private String sHpNo;

    /**
     * 고객번호
     **/
    private String sCustNo;

    /**
     * 고객명
     **/
    private String sCustNm;

    /**
     * 품목코드
     **/
    private String sItemCd;

    /**
     * 품목명
     **/
    private String sItemNm;

    /**
     * 원차대번호
     **/
    private String sBaseVinNo;

    /**
     * 신차대번호
     **/
    private String sNewVinNo;

    /**
     * 차량바디차대번호
     **/
    private String sCarBodyVinNo;

    /**
     * 상세내용
     **/
    private String sDetlCont;

    /**
     * 심사결과명(BMP I/F)
     **/

    private String sEvalRsltNm;

    /**
     * 심사의견내용(BMP I/F)
     **/

    private String sEvalOpnCont;

    /**
     * 우편번호(BMP I/F)
     **/

    private String sZipCd;

    /**
     * 우편발송일자(BMP I/F)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sZipSendDt;

    /**
     * 처리결과상세내용(BMP I/F)
     **/
    private String sProcRsltDetlCont;

    /**
     * 운송회사코드(BMP I/F)
     **/
    private String sTrsfCmpCd;

    /**
     * 구엔진실린더사진명(BMP I/F)
     **/
    private String sOldEnginCylPhotoNm;

    /**
     * 구엔진실린더번호(BMP I/F)
     **/
    private String sOldEnginCylNo;

    /**
     * 신엔진실린더사진명(BMP I/F)
     **/
    private String sNewEnginCylPhotoNm;

    /**
     * 신엔진실린더번호(BMP I/F)
     **/
    private String sNewEnginCylNo;

    /**
     * 파일번호
     **/
    private String sFileNo;

    /**
     * 파일일련번호
     **/
    private int sFileSeq;

    /**
     * 등록자ID
     **/
    private String sRegUsrId;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRegDt;

    /**
     * 등록일자 FROM
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRegDtFr;

    /**
     * 등록일자 TO
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRegDtTo;

    /**
     * 수정자ID
     **/
    private String sUpdtUsrId;

    /**
     * 수정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sUpdtDt;

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
     * @return the sDlrNm
     */
    public String getsDlrNm() {
        return sDlrNm;
    }

    /**
     * @param sDlrNm the sDlrNm to set
     */
    public void setsDlrNm(String sDlrNm) {
        this.sDlrNm = sDlrNm;
    }

    /**
     * @return the sCertNo
     */
    public String getsCertNo() {
        return sCertNo;
    }

    /**
     * @param sCertNo the sCertNo to set
     */
    public void setsCertNo(String sCertNo) {
        this.sCertNo = sCertNo;
    }

    /**
     * @return the sCertStatCd
     */
    public String getsCertStatCd() {
        return sCertStatCd;
    }

    /**
     * @param sCertStatCd the sCertStatCd to set
     */
    public void setsCertStatCd(String sCertStatCd) {
        this.sCertStatCd = sCertStatCd;
    }

    /**
     * @return the sCertTp
     */
    public String getsCertTp() {
        return sCertTp;
    }

    /**
     * @param sCertTp the sCertTp to set
     */
    public void setsCertTp(String sCertTp) {
        this.sCertTp = sCertTp;
    }

    /**
     * @return the sTelNo
     */
    public String getsTelNo() {
        return sTelNo;
    }

    /**
     * @param sTelNo the sTelNo to set
     */
    public void setsTelNo(String sTelNo) {
        this.sTelNo = sTelNo;
    }

    /**
     * @return the sHpNo
     */
    public String getsHpNo() {
        return sHpNo;
    }

    /**
     * @param sHpNo the sHpNo to set
     */
    public void setsHpNo(String sHpNo) {
        this.sHpNo = sHpNo;
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
     * @return the sCustNm
     */
    public String getsCustNm() {
        return sCustNm;
    }

    /**
     * @param sCustNm the sCustNm to set
     */
    public void setsCustNm(String sCustNm) {
        this.sCustNm = sCustNm;
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
     * @return the sBaseVinNo
     */
    public String getsBaseVinNo() {
        return sBaseVinNo;
    }

    /**
     * @param sBaseVinNo the sBaseVinNo to set
     */
    public void setsBaseVinNo(String sBaseVinNo) {
        this.sBaseVinNo = sBaseVinNo;
    }

    /**
     * @return the sNewVinNo
     */
    public String getsNewVinNo() {
        return sNewVinNo;
    }

    /**
     * @param sNewVinNo the sNewVinNo to set
     */
    public void setsNewVinNo(String sNewVinNo) {
        this.sNewVinNo = sNewVinNo;
    }

    /**
     * @return the sCarBodyVinNo
     */
    public String getsCarBodyVinNo() {
        return sCarBodyVinNo;
    }

    /**
     * @param sCarBodyVinNo the sCarBodyVinNo to set
     */
    public void setsCarBodyVinNo(String sCarBodyVinNo) {
        this.sCarBodyVinNo = sCarBodyVinNo;
    }

    /**
     * @return the sDetlCont
     */
    public String getsDetlCont() {
        return sDetlCont;
    }

    /**
     * @param sDetlCont the sDetlCont to set
     */
    public void setsDetlCont(String sDetlCont) {
        this.sDetlCont = sDetlCont;
    }

    /**
     * @return the sEvalRsltNm
     */
    public String getsEvalRsltNm() {
        return sEvalRsltNm;
    }

    /**
     * @param sEvalRsltNm the sEvalRsltNm to set
     */
    public void setsEvalRsltNm(String sEvalRsltNm) {
        this.sEvalRsltNm = sEvalRsltNm;
    }

    /**
     * @return the sEvalOpnCont
     */
    public String getsEvalOpnCont() {
        return sEvalOpnCont;
    }

    /**
     * @param sEvalOpnCont the sEvalOpnCont to set
     */
    public void setsEvalOpnCont(String sEvalOpnCont) {
        this.sEvalOpnCont = sEvalOpnCont;
    }

    /**
     * @return the sZipCd
     */
    public String getsZipCd() {
        return sZipCd;
    }

    /**
     * @param sZipCd the sZipCd to set
     */
    public void setsZipCd(String sZipCd) {
        this.sZipCd = sZipCd;
    }

    /**
     * @return the sZipSendDt
     */
    public Date getsZipSendDt() {
        return sZipSendDt;
    }

    /**
     * @param sZipSendDt the sZipSendDt to set
     */
    public void setsZipSendDt(Date sZipSendDt) {
        this.sZipSendDt = sZipSendDt;
    }

    /**
     * @return the sProcRsltDetlCont
     */
    public String getsProcRsltDetlCont() {
        return sProcRsltDetlCont;
    }

    /**
     * @param sProcRsltDetlCont the sProcRsltDetlCont to set
     */
    public void setsProcRsltDetlCont(String sProcRsltDetlCont) {
        this.sProcRsltDetlCont = sProcRsltDetlCont;
    }

    /**
     * @return the sTrsfCmpCd
     */
    public String getsTrsfCmpCd() {
        return sTrsfCmpCd;
    }

    /**
     * @param sTrsfCmpCd the sTrsfCmpCd to set
     */
    public void setsTrsfCmpCd(String sTrsfCmpCd) {
        this.sTrsfCmpCd = sTrsfCmpCd;
    }

    /**
     * @return the sOldEnginCylPhotoNm
     */
    public String getsOldEnginCylPhotoNm() {
        return sOldEnginCylPhotoNm;
    }

    /**
     * @param sOldEnginCylPhotoNm the sOldEnginCylPhotoNm to set
     */
    public void setsOldEnginCylPhotoNm(String sOldEnginCylPhotoNm) {
        this.sOldEnginCylPhotoNm = sOldEnginCylPhotoNm;
    }

    /**
     * @return the sOldEnginCylNo
     */
    public String getsOldEnginCylNo() {
        return sOldEnginCylNo;
    }

    /**
     * @param sOldEnginCylNo the sOldEnginCylNo to set
     */
    public void setsOldEnginCylNo(String sOldEnginCylNo) {
        this.sOldEnginCylNo = sOldEnginCylNo;
    }

    /**
     * @return the sNewEnginCylPhotoNm
     */
    public String getsNewEnginCylPhotoNm() {
        return sNewEnginCylPhotoNm;
    }

    /**
     * @param sNewEnginCylPhotoNm the sNewEnginCylPhotoNm to set
     */
    public void setsNewEnginCylPhotoNm(String sNewEnginCylPhotoNm) {
        this.sNewEnginCylPhotoNm = sNewEnginCylPhotoNm;
    }

    /**
     * @return the sNewEnginCylNo
     */
    public String getsNewEnginCylNo() {
        return sNewEnginCylNo;
    }

    /**
     * @param sNewEnginCylNo the sNewEnginCylNo to set
     */
    public void setsNewEnginCylNo(String sNewEnginCylNo) {
        this.sNewEnginCylNo = sNewEnginCylNo;
    }

    /**
     * @return the sFileNo
     */
    public String getsFileNo() {
        return sFileNo;
    }

    /**
     * @param sFileNo the sFileNo to set
     */
    public void setsFileNo(String sFileNo) {
        this.sFileNo = sFileNo;
    }

    /**
     * @return the sFileSeq
     */
    public int getsFileSeq() {
        return sFileSeq;
    }

    /**
     * @param sFileSeq the sFileSeq to set
     */
    public void setsFileSeq(int sFileSeq) {
        this.sFileSeq = sFileSeq;
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
     * @return the sRegDt
     */
    public Date getsRegDt() {
        return sRegDt;
    }

    /**
     * @param sRegDt the sRegDt to set
     */
    public void setsRegDt(Date sRegDt) {
        this.sRegDt = sRegDt;
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
     * @return the sUpdtUsrId
     */
    public String getsUpdtUsrId() {
        return sUpdtUsrId;
    }

    /**
     * @param sUpdtUsrId the sUpdtUsrId to set
     */
    public void setsUpdtUsrId(String sUpdtUsrId) {
        this.sUpdtUsrId = sUpdtUsrId;
    }

    /**
     * @return the sUpdtDt
     */
    public Date getsUpdtDt() {
        return sUpdtDt;
    }

    /**
     * @param sUpdtDt the sUpdtDt to set
     */
    public void setsUpdtDt(Date sUpdtDt) {
        this.sUpdtDt = sUpdtDt;
    }
}
