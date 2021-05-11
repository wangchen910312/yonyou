package chn.bhmc.dms.security.vo;

import java.io.Serializable;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustomUserVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 7. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 12.     Kang Seok Han     최초 생성
 * </pre>
 */

public class CustomUserVO implements Serializable {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -832290369504446480L;

    /**
     * 아이디
     */
    private String usrId;

    /**
     * 이름
     */
    private String usrNm;

    /**
     * 비밀번호
     */
    private String usrPw;

    /**
     * 활성여부
     * Y : 활성
     * N : 비활성
     */
    private String enabledYn;

    /**
     * 삭제여부
     * Y : 활성
     * N : 비활성
     */
    private String delYn;

    /**
     * 언어코드
     */
    private String langCd;

    /**
     * 사원번호
     */
    private String empNo;

    /**
     * 테마 ID
     */
    private String themeId;

    /**
     * 직무코드
     */
    private String tskCd;

    /**
     * 딜러 코드
     */
    private String dlrCd;

    /**
     * 딜러명
     */
    private String dlrNm;

    /**
     * 사업부 코드
     */
    private String sdptCd;

    /**
     * 지역사무소 코드
     */
    private String distOfficeCd;

    /**
     * 생일
     */
    private String birthday;

    /**
     * 성별
     * M:남자
     * F:여자
     */
    private String gndrCd;

    /**
     * 직무상세
     */
    private String tskDetl;

    //시스템-옵션
    /**
     * 시스템 딜러여부
     */
    private String sysOwnerYn;

    /**
     * 센터 DMS 사용딜러 여부
     */
    private String useCenterDmsYn;

    /**
     * 오픈일자(시스템 오픈 일자)
     */
    private String openDt;

    //CRM-멥버십 옵션
    /**
     * 멤버십 운영기준
     */
    private String membershipPolicy;

    /**
     * 멤버십 포인트 유효기간
     */
    private int membershipPointPeriod;

   /**
    * 멤버십 포인트 사용 상한치
    */
   private int membershipPointUseMaxPoint;

    /**
     * 회원등급 수동 변경여부
     */
    private String membershipGradeNoneAutoYn;

    /**
     * 멤버십 포인트환산 기준포인트
     */
    private int membershipPointExchgPoint;

    /**
     * 멤버십 포인트환산 기준금액
     */
    private int membershipPointExchgMoney;

    //CRM-판매기회 옵션
    /**
     * 자동배정기준
     */
    private String autoAssignCd;

    /**
     * OB 배정 자동여부
     */
    private String obAssignAutoYn;

    /**
     * 자동전출설정(일)
     */
    private String autoTrsfConf;

    /**
     * 판매기회 비밀번호 설정여부
     */
    private String salesOpptPwYn;

    //CRM-콜센터 옵션
    /**
     * 딜러 콜센터 Max 콜수
     */
    private int callcenterMaxCall;

    /**
     * 유효통화시간(초)
     */
    private int validCheckCallSecond;


    //부품-옵션
    /**
     * BMP거래처코드
     */
    private String bmpBpCd;

    /**
     * PREFIX고객번호
     */
    private String prefixCustNo;

    //정비-옵션
    /**
     * 클레임 신청 권한 여부
     */
    private String claimReqPermYn;

    /**
     * @return the usrId
     */
    public String getUsrId() {
        return usrId;
    }

    /**
     * @param usrId the usrId to set
     */
    public void setUsrId(String usrId) {
        this.usrId = usrId;
    }

    /**
     * @return the usrNm
     */
    public String getUsrNm() {
        return usrNm;
    }

    /**
     * @param usrNm the usrNm to set
     */
    public void setUsrNm(String usrNm) {
        this.usrNm = usrNm;
    }

    /**
     * @return the usrPw
     */
    public String getUsrPw() {
        return usrPw;
    }

    /**
     * @param usrPw the usrPw to set
     */
    public void setUsrPw(String usrPw) {
        this.usrPw = usrPw;
    }

    /**
     * @return the enabledYn
     */
    public String getEnabledYn() {
        return enabledYn;
    }

    /**
     * @param enabledYn the enabledYn to set
     */
    public void setEnabledYn(String enabledYn) {
        this.enabledYn = enabledYn;
    }

    /**
     * @return the delYn
     */
    public String getDelYn() {
        return delYn;
    }

    /**
     * @param delYn the delYn to set
     */
    public void setDelYn(String delYn) {
        this.delYn = delYn;
    }

    /**
     * @return the langCd
     */
    public String getLangCd() {
        return langCd;
    }

    /**
     * @param langCd the langCd to set
     */
    public void setLangCd(String langCd) {
        this.langCd = langCd;
    }

    /**
     * @return the empNo
     */
    public String getEmpNo() {
        return empNo;
    }

    /**
     * @param empNo the empNo to set
     */
    public void setEmpNo(String empNo) {
        this.empNo = empNo;
    }

    /**
     * @return the themeId
     */
    public String getThemeId() {
        return themeId;
    }

    /**
     * @param themeId the themeId to set
     */
    public void setThemeId(String themeId) {
        this.themeId = themeId;
    }

    /**
     * @return the tskCd
     */
    public String getTskCd() {
        return tskCd;
    }

    /**
     * @param tskCd the tskCd to set
     */
    public void setTskCd(String tskCd) {
        this.tskCd = tskCd;
    }

    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }

    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    /**
     * @return the dlrNm
     */
    public String getDlrNm() {
        return dlrNm;
    }

    /**
     * @param dlrNm the dlrNm to set
     */
    public void setDlrNm(String dlrNm) {
        this.dlrNm = dlrNm;
    }

    /**
     * @return the sdptCd
     */
    public String getSdptCd() {
        return sdptCd;
    }

    /**
     * @param sdptCd the sdptCd to set
     */
    public void setSdptCd(String sdptCd) {
        this.sdptCd = sdptCd;
    }

    /**
     * @return the distOfficeCd
     */
    public String getDistOfficeCd() {
        return distOfficeCd;
    }

    /**
     * @param distOfficeCd the distOfficeCd to set
     */
    public void setDistOfficeCd(String distOfficeCd) {
        this.distOfficeCd = distOfficeCd;
    }

    /**
     * @return the birthday
     */
    public String getBirthday() {
        return birthday;
    }

    /**
     * @param birthday the birthday to set
     */
    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    /**
     * @return the gndrCd
     */
    public String getGndrCd() {
        return gndrCd;
    }

    /**
     * @param gndrCd the gndrCd to set
     */
    public void setGndrCd(String gndrCd) {
        this.gndrCd = gndrCd;
    }

    /**
     * @return the tskDetl
     */
    public String getTskDetl() {
        return tskDetl;
    }

    /**
     * @param tskDetl the tskDetl to set
     */
    public void setTskDetl(String tskDetl) {
        this.tskDetl = tskDetl;
    }

    /**
     * @return the sysOwnerYn
     */
    public String getSysOwnerYn() {
        return sysOwnerYn;
    }

    /**
     * @param sysOwnerYn the sysOwnerYn to set
     */
    public void setSysOwnerYn(String sysOwnerYn) {
        this.sysOwnerYn = sysOwnerYn;
    }

    /**
     * @return the useCenterDmsYn
     */
    public String getUseCenterDmsYn() {
        return useCenterDmsYn;
    }

    /**
     * @param useCenterDmsYn the useCenterDmsYn to set
     */
    public void setUseCenterDmsYn(String useCenterDmsYn) {
        this.useCenterDmsYn = useCenterDmsYn;
    }

    /**
     * @return the openDt
     */
    public String getOpenDt() {
        return openDt;
    }

    /**
     * @param openDt the openDt to set
     */
    public void setOpenDt(String openDt) {
        this.openDt = openDt;
    }

    /**
     * @return the membershipPolicy
     */
    public String getMembershipPolicy() {
        return membershipPolicy;
    }

    /**
     * @param membershipPolicy the membershipPolicy to set
     */
    public void setMembershipPolicy(String membershipPolicy) {
        this.membershipPolicy = membershipPolicy;
    }

    /**
     * @return the membershipPointPeriod
     */
    public int getMembershipPointPeriod() {
        return membershipPointPeriod;
    }

    /**
     * @param membershipPointPeriod the membershipPointPeriod to set
     */
    public void setMembershipPointPeriod(int membershipPointPeriod) {
        this.membershipPointPeriod = membershipPointPeriod;
    }

    /**
     * @return the membershipPointUseMaxPoint
     */
    public int getMembershipPointUseMaxPoint() {
        return membershipPointUseMaxPoint;
    }

    /**
     * @param membershipPointUseMaxPoint the membershipPointUseMaxPoint to set
     */
    public void setMembershipPointUseMaxPoint(int membershipPointUseMaxPoint) {
        this.membershipPointUseMaxPoint = membershipPointUseMaxPoint;
    }

    /**
     * @return the membershipGradeNoneAutoYn
     */
    public String getMembershipGradeNoneAutoYn() {
        return membershipGradeNoneAutoYn;
    }

    /**
     * @param membershipGradeNoneAutoYn the membershipGradeNoneAutoYn to set
     */
    public void setMembershipGradeNoneAutoYn(String membershipGradeNoneAutoYn) {
        this.membershipGradeNoneAutoYn = membershipGradeNoneAutoYn;
    }

    /**
     * @return the membershipPointExchgPoint
     */
    public int getMembershipPointExchgPoint() {
        return membershipPointExchgPoint;
    }

    /**
     * @param membershipPointExchgPoint the membershipPointExchgPoint to set
     */
    public void setMembershipPointExchgPoint(int membershipPointExchgPoint) {
        this.membershipPointExchgPoint = membershipPointExchgPoint;
    }

    /**
     * @return the membershipPointExchgMoney
     */
    public int getMembershipPointExchgMoney() {
        return membershipPointExchgMoney;
    }

    /**
     * @param membershipPointExchgMoney the membershipPointExchgMoney to set
     */
    public void setMembershipPointExchgMoney(int membershipPointExchgMoney) {
        this.membershipPointExchgMoney = membershipPointExchgMoney;
    }

    /**
     * @return the autoAssignCd
     */
    public String getAutoAssignCd() {
        return autoAssignCd;
    }

    /**
     * @param autoAssignCd the autoAssignCd to set
     */
    public void setAutoAssignCd(String autoAssignCd) {
        this.autoAssignCd = autoAssignCd;
    }

    /**
     * @return the obAssignAutoYn
     */
    public String getObAssignAutoYn() {
        return obAssignAutoYn;
    }

    /**
     * @param obAssignAutoYn the obAssignAutoYn to set
     */
    public void setObAssignAutoYn(String obAssignAutoYn) {
        this.obAssignAutoYn = obAssignAutoYn;
    }

    /**
     * @return the autoTrsfConf
     */
    public String getAutoTrsfConf() {
        return autoTrsfConf;
    }

    /**
     * @param autoTrsfConf the autoTrsfConf to set
     */
    public void setAutoTrsfConf(String autoTrsfConf) {
        this.autoTrsfConf = autoTrsfConf;
    }

    /**
     * @return the salesOpptPwYn
     */
    public String getSalesOpptPwYn() {
        return salesOpptPwYn;
    }

    /**
     * @param salesOpptPwYn the salesOpptPwYn to set
     */
    public void setSalesOpptPwYn(String salesOpptPwYn) {
        this.salesOpptPwYn = salesOpptPwYn;
    }

    /**
     * @return the callcenterMaxCall
     */
    public int getCallcenterMaxCall() {
        return callcenterMaxCall;
    }

    /**
     * @param callcenterMaxCall the callcenterMaxCall to set
     */
    public void setCallcenterMaxCall(int callcenterMaxCall) {
        this.callcenterMaxCall = callcenterMaxCall;
    }

    /**
     * @return the validCheckCallSecond
     */
    public int getValidCheckCallSecond() {
        return validCheckCallSecond;
    }

    /**
     * @param validCheckCallSecond the validCheckCallSecond to set
     */
    public void setValidCheckCallSecond(int validCheckCallSecond) {
        this.validCheckCallSecond = validCheckCallSecond;
    }

    /**
     * @return the bmpBpCd
     */
    public String getBmpBpCd() {
        return bmpBpCd;
    }

    /**
     * @param bmpBpCd the bmpBpCd to set
     */
    public void setBmpBpCd(String bmpBpCd) {
        this.bmpBpCd = bmpBpCd;
    }

    /**
     * @return the prefixCustNo
     */
    public String getPrefixCustNo() {
        return prefixCustNo;
    }

    /**
     * @param prefixCustNo the prefixCustNo to set
     */
    public void setPrefixCustNo(String prefixCustNo) {
        this.prefixCustNo = prefixCustNo;
    }

    /**
     * @return the claimReqPermYn
     */
    public String getClaimReqPermYn() {
        return claimReqPermYn;
    }

    /**
     * @param claimReqPermYn the claimReqPermYn to set
     */
    public void setClaimReqPermYn(String claimReqPermYn) {
        this.claimReqPermYn = claimReqPermYn;
    }
}
