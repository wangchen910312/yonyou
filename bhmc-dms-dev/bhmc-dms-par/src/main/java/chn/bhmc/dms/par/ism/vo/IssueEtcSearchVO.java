package chn.bhmc.dms.par.ism.vo;

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

public class IssueEtcSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5889788098505718469L;

    /**
     * 딜러코드
     **/
    private String sDlrCd;

    /**
     * 기타출고문서번호
     **/
    private String sEtcGiDocNo;

    /**
     * 상태코드
     **/
    private String sStatCd;

    /**
     * 수불유형
     **/
    private String sMvtTp;

    /**
     * 반환수불유형
     **/
    private String sReturnMvtTp;

    /**
     * 반환상태
     **/
    private String sReturnStat;

    /**
     * 수불유형리스트
     **/
    private List<String> sMvtTpList;

    /**
     * 센터코드
     **/
    private String sPltCd;

    /**
     * 거래처코드
     **/
    private String sBpCd;

    /**
     * 거래처명
     **/
    private String sBpNm;

    /**
     * 거래처코드리스트
     **/
    private List<String> sBpCdList;

    /**
     * 품목코드
     **/
    private String sItemCd;

    /**
     * 품목코드
     **/
    private String sItemNm;

    /**
     * 로케이션
     **/
    private String sLocCd;

    /**
     * 창고코드
     */
    private String sStrgeCd;

    /**
     * 비고
     **/
    private String sRemark;

    /**
     * 등록자
     **/
    private String sRegUsrId;

    /**
     * 등록자
     **/
    private String sRegUsrNm;

    /**
     * 출고일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sGiDtFr;

    /**
     * 출고일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sGiDtTo;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRegDtFr;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRegDtTo;

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
     * @return the sRemark
     */
    public String getsRemark() {
        return sRemark;
    }

    /**
     * @param sRemark the sRemark to set
     */
    public void setsRemark(String sRemark) {
        this.sRemark = sRemark;
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
     * @return the sMvtTpList
     */
    public List<String> getsMvtTpList() {
        return sMvtTpList;
    }

    /**
     * @param sMvtTpList the sMvtTpList to set
     */
    public void setsMvtTpList(List<String> sMvtTpList) {
        this.sMvtTpList = sMvtTpList;
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
     * @return the sBpCdList
     */
    public List<String> getsBpCdList() {
        return sBpCdList;
    }

    /**
     * @param sBpCdList the sBpCdList to set
     */
    public void setsBpCdList(List<String> sBpCdList) {
        this.sBpCdList = sBpCdList;
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
     * @return the sReturnMvtTp
     */
    public String getsReturnMvtTp() {
        return sReturnMvtTp;
    }

    /**
     * @param sReturnMvtTp the sReturnMvtTp to set
     */
    public void setsReturnMvtTp(String sReturnMvtTp) {
        this.sReturnMvtTp = sReturnMvtTp;
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
     * @return the sReturnStat
     */
    public String getsReturnStat() {
        return sReturnStat;
    }

    /**
     * @param sReturnStat the sReturnStat to set
     */
    public void setsReturnStat(String sReturnStat) {
        this.sReturnStat = sReturnStat;
    }

    /**
     * @return the sRegUsrNm
     */
    public String getsRegUsrNm() {
        return sRegUsrNm;
    }

    /**
     * @param sRegUsrNm the sRegUsrNm to set
     */
    public void setsRegUsrNm(String sRegUsrNm) {
        this.sRegUsrNm = sRegUsrNm;
    }
}
