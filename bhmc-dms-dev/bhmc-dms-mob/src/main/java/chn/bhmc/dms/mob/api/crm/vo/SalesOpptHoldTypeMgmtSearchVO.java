package chn.bhmc.dms.mob.api.crm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 국가코드 조회 SearchVO
 *
 * @ClassName   : SalesOpptHoldTypeMgmtSearchVO.java
 * @Description : SalesOpptHoldTypeMgmtSearchVO
 * @author in moon lee
 * @since 2016.03.07.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.07.     in moon lee     최초 생성
 * </pre>
 */

public class SalesOpptHoldTypeMgmtSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2707710124316443029L;

    /**
     * 딜러코드
     **/
    private  String         sDlrCd;

    /**
     * 확보일련번호
     **/
    private  int            sHoldSeq;

    /**
     * 확보유형(CRM008)
     **/
    private  String         sHoldTp;

    /**
     * 확보상세유형명
     **/
    private  String         sHoldDetlTpNm;

    /**
     * 비고
     **/
    private  String         sRemark;

    /**
     * 정렬순서
     **/
    private  int            sSortOrder;

    /**
     * 삭제여부
     **/
    private  String         sDelYn;

    /**
     * 등록자ID
     **/
    private  String         sRegUsrId;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date           sRegDt;

    /**
     * 수정자ID
     **/
    private  String         sUpdtUsrId;

    /**
     * 수정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date           sUpdtDt;

    /**
     * 시작일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date           sStartDt;

    /**
     * 종료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date           sEndDt;

    /**
     * flag
     **/
    private  String           flag;

    /**
     * sDtSearchFlag 고객출처 화면조회
     **/
    private  String           sDtSearchFlag;

    /**
     * Siebel 확보 유무
     **/
    private  String           sSiebelHoldRowIdYn;

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
     * @return the sHoldSeq
     */
    public int getsHoldSeq() {
        return sHoldSeq;
    }

    /**
     * @param sHoldSeq the sHoldSeq to set
     */
    public void setsHoldSeq(int sHoldSeq) {
        this.sHoldSeq = sHoldSeq;
    }

    /**
     * @return the sHoldTp
     */
    public String getsHoldTp() {
        return sHoldTp;
    }

    /**
     * @param sHoldTp the sHoldTp to set
     */
    public void setsHoldTp(String sHoldTp) {
        this.sHoldTp = sHoldTp;
    }

    /**
     * @return the sHoldDetlTpNm
     */
    public String getsHoldDetlTpNm() {
        return sHoldDetlTpNm;
    }

    /**
     * @param sHoldDetlTpNm the sHoldDetlTpNm to set
     */
    public void setsHoldDetlTpNm(String sHoldDetlTpNm) {
        this.sHoldDetlTpNm = sHoldDetlTpNm;
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
     * @return the sSortOrder
     */
    public int getsSortOrder() {
        return sSortOrder;
    }

    /**
     * @param sSortOrder the sSortOrder to set
     */
    public void setsSortOrder(int sSortOrder) {
        this.sSortOrder = sSortOrder;
    }

    /**
     * @return the sDelYn
     */
    public String getsDelYn() {
        return sDelYn;
    }

    /**
     * @param sDelYn the sDelYn to set
     */
    public void setsDelYn(String sDelYn) {
        this.sDelYn = sDelYn;
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

    /**
     * @return the sStartDt
     */
    public Date getsStartDt() {
        return sStartDt;
    }

    /**
     * @param sStartDt the sStartDt to set
     */
    public void setsStartDt(Date sStartDt) {
        this.sStartDt = sStartDt;
    }

    /**
     * @return the sEndDt
     */
    public Date getsEndDt() {
        return sEndDt;
    }

    /**
     * @param sEndDt the sEndDt to set
     */
    public void setsEndDt(Date sEndDt) {
        this.sEndDt = sEndDt;
    }

    /**
     * @param flag the flag to set
     */
    public void setFlag(String flag) {
        this.flag = flag;
    }

    /**
     * @return the flag
     */
    public String getFlag() {
        return flag;
    }

    /**
     * @return the sDtSearchFlag
     */
    public String getsDtSearchFlag() {
        return sDtSearchFlag;
    }

    /**
     * @param sDtSearchFlag the sDtSearchFlag to set
     */
    public void setsDtSearchFlag(String sDtSearchFlag) {
        this.sDtSearchFlag = sDtSearchFlag;
    }

    /**
     * @return the sSiebelHoldRowIdYn
     */
    public String getsSiebelHoldRowIdYn() {
        return sSiebelHoldRowIdYn;
    }

    /**
     * @param sSiebelHoldRowIdYn the sSiebelHoldRowIdYn to set
     */
    public void setsSiebelHoldRowIdYn(String sSiebelHoldRowIdYn) {
        this.sSiebelHoldRowIdYn = sSiebelHoldRowIdYn;
    }

}