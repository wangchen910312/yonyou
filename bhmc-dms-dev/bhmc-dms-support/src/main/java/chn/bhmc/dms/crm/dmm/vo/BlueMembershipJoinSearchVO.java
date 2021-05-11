package chn.bhmc.dms.crm.dmm.vo;

import java.util.Date;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BlueMembershipJoinSearchVO.java
 * @Description : 블루멤버십 검색 VO
 * @author Kim Hyun Ho
 * @since 2016. 5. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 20.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public class BlueMembershipJoinSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -4901369038354791622L;

    /**
    * 딜러코드
    **/

    private  String           sDlrCd;

    /**
    * 고객번호
    **/

    private  String           sCustNo;

    /**
    * 고객명
    **/

    private  String           sCustNm;

    /**
    * 고객유형
    **/

    private  String           sCustTp;

    /**
    * 차량소유여부
    **/

    private  String           sCarOwnYn;

    /**
    * 휴대폰번호
    **/

    private  String           sHpNo;

    /**
    * 주요인증문서유형
    **/

    private  String           sMathDocTp;

    /**
    * 주민사업자등록번호
    **/

    private  String           sSsnCrnNo;

    /**
    * 성명
    **/

    private  String           sSungNm;

    /**
    * 도시명
    **/

    private  String           sCityNm;

    /**
    * 지역명
    **/

    private  String           sDistNm;

    /**
    * 우편번호
    **/

    private  String           sZipCd;

    /**
    * 확장우편번호
    **/

    private  String           sExtZipCd;

    /**
    * 주소명
    **/

    private  String           sAddrNm;

    /**
    * 주소상세내용
    **/

    private  String           sAddrDetlCont;

    /**
    * 가입딜러코드
    **/

    private  String           sJoinDlrCd;

    /**
    * 가입요청동의여부
    **/

    private  String           sJoinReqAgreeYn;

    /**
    * 정책동의여부
    **/

    private  String           sPolicyAgreeYn;

    /**
    * 가입승인여부
    **/

    private  String           sJoinApproveYn;

    /**
     * 블루멤버십번호
     */
    private String            sBlueMembershipNo;

    /**
     * 블루멤버십가입일자
     */
    private Date              sBlueMembershipJoinDt;

    /**
     * 블루멤버쉽가입딜러코드
     */
    private String            sBlueMembershipJoinDlrCd;

    //조회조건 추가
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date sStartDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date sEndDt;
    private  String           sVinNo;

    /**
    * 가입승인일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date             sJoinApproveDt;


    private String            sIdentityNumber;

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
     * @return the sCustTp
     */
    public String getsCustTp() {
        return sCustTp;
    }

    /**
     * @param sCustTp the sCustTp to set
     */
    public void setsCustTp(String sCustTp) {
        this.sCustTp = sCustTp;
    }

    /**
     * @return the sCarOwnYn
     */
    public String getsCarOwnYn() {
        return sCarOwnYn;
    }

    /**
     * @param sCarOwnYn the sCarOwnYn to set
     */
    public void setsCarOwnYn(String sCarOwnYn) {
        this.sCarOwnYn = sCarOwnYn;
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
     * @return the sMathDocTp
     */
    public String getsMathDocTp() {
        return sMathDocTp;
    }

    /**
     * @param sMathDocTp the sMathDocTp to set
     */
    public void setsMathDocTp(String sMathDocTp) {
        this.sMathDocTp = sMathDocTp;
    }

    /**
     * @return the sSsnCrnNo
     */
    public String getsSsnCrnNo() {
        return sSsnCrnNo;
    }

    /**
     * @param sSsnCrnNo the sSsnCrnNo to set
     */
    public void setsSsnCrnNo(String sSsnCrnNo) {
        this.sSsnCrnNo = sSsnCrnNo;
    }

    /**
     * @return the sSungNm
     */
    public String getsSungNm() {
        return sSungNm;
    }

    /**
     * @param sSungNm the sSungNm to set
     */
    public void setsSungNm(String sSungNm) {
        this.sSungNm = sSungNm;
    }

    /**
     * @return the sCityNm
     */
    public String getsCityNm() {
        return sCityNm;
    }

    /**
     * @param sCityNm the sCityNm to set
     */
    public void setsCityNm(String sCityNm) {
        this.sCityNm = sCityNm;
    }

    /**
     * @return the sDistNm
     */
    public String getsDistNm() {
        return sDistNm;
    }

    /**
     * @param sDistNm the sDistNm to set
     */
    public void setsDistNm(String sDistNm) {
        this.sDistNm = sDistNm;
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
     * @return the sExtZipCd
     */
    public String getsExtZipCd() {
        return sExtZipCd;
    }

    /**
     * @param sExtZipCd the sExtZipCd to set
     */
    public void setsExtZipCd(String sExtZipCd) {
        this.sExtZipCd = sExtZipCd;
    }

    /**
     * @return the sAddrNm
     */
    public String getsAddrNm() {
        return sAddrNm;
    }

    /**
     * @param sAddrNm the sAddrNm to set
     */
    public void setsAddrNm(String sAddrNm) {
        this.sAddrNm = sAddrNm;
    }

    /**
     * @return the sAddrDetlCont
     */
    public String getsAddrDetlCont() {
        return sAddrDetlCont;
    }

    /**
     * @param sAddrDetlCont the sAddrDetlCont to set
     */
    public void setsAddrDetlCont(String sAddrDetlCont) {
        this.sAddrDetlCont = sAddrDetlCont;
    }

    /**
     * @return the sJoinDlrCd
     */
    public String getsJoinDlrCd() {
        return sJoinDlrCd;
    }

    /**
     * @param sJoinDlrCd the sJoinDlrCd to set
     */
    public void setsJoinDlrCd(String sJoinDlrCd) {
        this.sJoinDlrCd = sJoinDlrCd;
    }

    /**
     * @return the sJoinReqAgreeYn
     */
    public String getsJoinReqAgreeYn() {
        return sJoinReqAgreeYn;
    }

    /**
     * @param sJoinReqAgreeYn the sJoinReqAgreeYn to set
     */
    public void setsJoinReqAgreeYn(String sJoinReqAgreeYn) {
        this.sJoinReqAgreeYn = sJoinReqAgreeYn;
    }

    /**
     * @return the sPolicyAgreeYn
     */
    public String getsPolicyAgreeYn() {
        return sPolicyAgreeYn;
    }

    /**
     * @param sPolicyAgreeYn the sPolicyAgreeYn to set
     */
    public void setsPolicyAgreeYn(String sPolicyAgreeYn) {
        this.sPolicyAgreeYn = sPolicyAgreeYn;
    }

    /**
     * @return the sJoinApproveYn
     */
    public String getsJoinApproveYn() {
        return sJoinApproveYn;
    }

    /**
     * @param sJoinApproveYn the sJoinApproveYn to set
     */
    public void setsJoinApproveYn(String sJoinApproveYn) {
        this.sJoinApproveYn = sJoinApproveYn;
    }

    /**
     * @return the sJoinApproveDt
     */
    public Date getsJoinApproveDt() {
        return sJoinApproveDt;
    }

    /**
     * @param sJoinApproveDt the sJoinApproveDt to set
     */
    public void setsJoinApproveDt(Date sJoinApproveDt) {
        this.sJoinApproveDt = sJoinApproveDt;
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
     * @return the sVinNo
     */
    public String getsVinNo() {
        return sVinNo;
    }

    /**
     * @param sVinNo the sVinNo to set
     */
    public void setsVinNo(String sVinNo) {
        this.sVinNo = sVinNo;
    }

    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return ReflectionToStringBuilder.toString(this);
    }

    /**
     * @param sBlueMembershipNo the sBlueMembershipNo to set
     */
    public void setsBlueMembershipNo(String sBlueMembershipNo) {
        this.sBlueMembershipNo = sBlueMembershipNo;
    }

    /**
     * @return the sBlueMembershipNo
     */
    public String getsBlueMembershipNo() {
        return sBlueMembershipNo;
    }

    /**
     * @return the sBlueMembershipJoinDt
     */
    public Date getsBlueMembershipJoinDt() {
        return sBlueMembershipJoinDt;
    }

    /**
     * @param sBlueMembershipJoinDt the sBlueMembershipJoinDt to set
     */
    public void setsBlueMembershipJoinDt(Date sBlueMembershipJoinDt) {
        this.sBlueMembershipJoinDt = sBlueMembershipJoinDt;
    }

    /**
     * @return the sBlueMembershipJoinDlrCd
     */
    public String getsBlueMembershipJoinDlrCd() {
        return sBlueMembershipJoinDlrCd;
    }

    /**
     * @param sBlueMembershipJoinDlrCd the sBlueMembershipJoinDlrCd to set
     */
    public void setsBlueMembershipJoinDlrCd(String sBlueMembershipJoinDlrCd) {
        this.sBlueMembershipJoinDlrCd = sBlueMembershipJoinDlrCd;
    }

    /**
     * @return the sIdentityNumber
     */
    public String getsIdentityNumber() {
        return sIdentityNumber;
    }

    /**
     * @param sIdentityNumber the sIdentityNumber to set
     */
    public void setsIdentityNumber(String sIdentityNumber) {
        this.sIdentityNumber = sIdentityNumber;
    }

}
