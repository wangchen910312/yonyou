package chn.bhmc.dms.crm.cso.vo;

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

public class IdccRoleMgmtSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3608287957525954388L;

    /**
     * 딜러코드
     **/
    private  String         sDlrCd;

    private  String         sUsrId;

    private  String         sRemark;

    private  String         sUsrNm;

    private  String         sUsrNmRemark;

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

    private  String         sRoleId;

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
     * @return the sUsrId
     */
    public String getsUsrId() {
        return sUsrId;
    }

    /**
     * @param sUsrId the sUsrId to set
     */
    public void setsUsrId(String sUsrId) {
        this.sUsrId = sUsrId;
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
     * @return the sUsrNm
     */
    public String getsUsrNm() {
        return sUsrNm;
    }

    /**
     * @param sUsrNm the sUsrNm to set
     */
    public void setsUsrNm(String sUsrNm) {
        this.sUsrNm = sUsrNm;
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
     * @return the sUsrNmRemark
     */
    public String getsUsrNmRemark() {
        return sUsrNmRemark;
    }

    /**
     * @param sUsrNmRemark the sUsrNmRemark to set
     */
    public void setsUsrNmRemark(String sUsrNmRemark) {
        this.sUsrNmRemark = sUsrNmRemark;
    }

    /**
     * @return the sRoleId
     */
    public String getsRoleId() {
        return sRoleId;
    }

    /**
     * @param sRoleId the sRoleId to set
     */
    public void setsRoleId(String sRoleId) {
        this.sRoleId = sRoleId;
    }

}