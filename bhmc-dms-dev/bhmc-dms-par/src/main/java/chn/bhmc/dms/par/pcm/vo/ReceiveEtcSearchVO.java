package chn.bhmc.dms.par.pcm.vo;

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
 * @ClassName   : ReceiveEtcSearchVO.java
 * @Description : ReceiveEtcSearchVO.class
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

public class ReceiveEtcSearchVO extends SearchVO {


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
     * 기타입고문서번호
     **/
    private  String       sEtcGrDocNo;

    /**
     * 기타입고문서번호
     **/
    private  String       sRefDocNo;

    /**
     * 상태코드
     **/
    private  String       sStatCd;

    /**
     * 수불유형
     **/
    private  String       sMvtTp;

    /**
     * 반환수불유형
     **/
    private  String       sReturnMvtTp;

    /**
     * 반환상태
     **/
    private  String       sReturnStat;

    /**
     * 수불유형리스트
     **/
    private  List<String> sMvtTpList;

    /**
     * 센터코드
     **/
    private  String       sPltCd;

    /**
     * 거래처코드
     **/
    private  String       sBpCd;

    /**
     * 거래처 유형
     **/
    private  String       sBpTp;

    /**
     * 거래처명
     **/
    private  String       sBpNm;

    /**
     * 거래처코드리스트
     **/
    private  List<String> sBpCdList;

    /**
     * 품목코드
     **/
    private  String       sItemCd;

    /**
     * 품목명
     **/
   private  String        sItemNm;

    /**
     * 로케이션
     **/
    private  String       sLocCd;


    /**
     * 창고코드
     */
    private  String       sStrgeCd;


    /**
     * 비고
     **/
    private  String       sRemark;

    /**
     * 등록자
     **/
    private  String       sRegUsrId;

    /**
     * 등록자
     **/
    private  String       sRegUsrNm;

    /**
     * 기초데이터여부
     **/
    private  String       sInitDataYn;

    /**
     * 입고작업유형('부품',판매(악세사리)
     * ETC_GR_DOC_TP
     **/
    private  String       sEtcGrDocTp;

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
     * 반품일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            sReturnDtFr;

    /**
     * 반품일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date            sReturnDtTo;

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
     * @return the sReturnDtFr
     */
    public Date getsReturnDtFr() {
        return sReturnDtFr;
    }

    /**
     * @param sRegDtFr the sRegDtFr to set
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
     * @param sRegDtTo the sReturnDtTo to set
     */
    public void setsReturnDtTo(Date sReturnDtTo) {
        this.sReturnDtTo = sReturnDtTo;
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

    /**
     * @return the sInitDataYn
     */
    public String getsInitDataYn() {
        return sInitDataYn;
    }

    /**
     * @param sInitDataYn the sInitDataYn to set
     */
    public void setsInitDataYn(String sInitDataYn) {
        this.sInitDataYn = sInitDataYn;
    }

}
