package chn.bhmc.dms.core.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;

import chn.bhmc.dms.security.userdetails.util.UserDetailsHelper;
import chn.bhmc.dms.security.vo.CustomUserVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : LoginUtil.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 20.
 * @version 1.0
 * @see
 * @Modification Information
 *
 *               <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 20.     Kang Seok Han     최초 생성
 * </pre>
 */

public class LoginUtil {

    /**
     * 로그인 사용자 ID
     *
     * @return
     */
    public static String getUserId() {
        return getUser().getUsrId();
    }

    /**
     * 로그인 사용자명
     *
     * @return
     */
    public static String getUserNm() {
        return getUser().getUsrNm();
    }

    /**
     * 로그인 사용자 딜러코드
     *
     * @return
     */
    public static String getDlrCd() {
        return getUser().getDlrCd();
    }

    /**
     * 로그인 사용자 사업부 코드
     *
     * @return
     */
    public static String getSdptCd() {
        return getUser().getSdptCd();
    }

    /**
     * 로그인 사용자 지역사무소 코드
     *
     * @return
     */
    public static String getDistOfficeCd() {
        return getUser().getDistOfficeCd();
    }

    /**
     * 로그인 사용자 딜러명
     *
     * @return
     */
    public static String getDlrNm() {
        return getUser().getDlrNm();
    }

    /**
     * 로그인 사용자 언어코드
     *
     * @return
     */
    public static String getLangCd() {
        return getUser().getLangCd();
    }

    /**
     * 로그인 사용자 플랜트 코드
     *
     * @return
     */
    public static String getPltCd() {
        return "1000";
    }

    /**
     * 오픈일자(시스템 오픈일자)
     * @return
     */
    public static String getOpenDt() {
        return getUser().getOpenDt();
    }

    /**
     * 로그인 사용자 사원번호
     *
     * @return
     */
    public static String getEmpNo() {
        return getUser().getEmpNo();
    }

    /**
     * 로그인 사용자 직무 코드
     *
     * @return
     */
    public static String getTskCd() {
        return getUser().getTskCd();
    }

    // CRM-멤버십 옵션
    /**
     * 멤버십 운영기준
     *
     * @return
     */
    public static String getMembershipPolicy() {
        return getUser().getMembershipPolicy();
    }

    /**
     * 멤버십 포인트 유효기간
     *
     * @return
     */
    public static int getMembershipPointPeriod() {
        return getUser().getMembershipPointPeriod();
    }

    /**
     * 멤버십 포인트 사용 상한치
     *
     * @return
     */
    public static int getMembershipPointUseMaxPoint() {
        return getUser().getMembershipPointUseMaxPoint();
    }

    /**
     * 회원등급 수동 변경여부
     *
     * @return
     */
    public static String getMembershipGradeNoneAutoYn() {
        return getUser().getMembershipGradeNoneAutoYn();
    }

    /**
     * 멤버십 포인트환산 기준포인트
     *
     * @return
     */
    public static int getMembershipPointExchgPoint() {
        return getUser().getMembershipPointExchgPoint();
    }

    /**
     * 멤버십 포인트환산 기준금액
     *
     * @return
     */
    public static int getMembershipPointExchgMoney() {
        return getUser().getMembershipPointExchgMoney();
    }

    //시스템-옵션
    /**
     * 시스템 딜러여부
     *
     * @return
     */
    public static String getSysOwnerYn() {
        return getUser().getSysOwnerYn();
    }

    /**
     * 센터 DMS 사용딜러 여부
     *
     * @return
     */
    public static String getUseCenterDmsYn() {
        return getUser().getUseCenterDmsYn();
    }

    // CRM-판매기회 옵션
    /**
     * 자동배정기준
     *
     * @return
     */
    public static String getAutoAssignCd() {
        return getUser().getAutoAssignCd();
    }

    /**
     * OB 배정 자동여부
     *
     * @return
     */
    public static String getObAssignAutoYn() {
        return getUser().getObAssignAutoYn();
    }

    /**
     * 자동전출설정(일)
     *
     * @return
     */
    public static String getAutoTrsfConf() {
        return getUser().getAutoTrsfConf();
    }

    /**
     * 판매기회 비밀번호 설정여부
     *
     * @return
     */
    public static String getSalesOpptPwYn() {
        return getUser().getSalesOpptPwYn();
    }

    //CRM-콜센터 옵션
    /**
     * 딜러 콜센터 Max 콜수
     *
     * @return
     */
    public static int getCallcenterMaxCall() {
        return getUser().getCallcenterMaxCall();
    }

    /**
     * 유효통과시간(초)
     *
     * @return
     */
    public static int getValidCheckCallSecond(){
        return getUser().getValidCheckCallSecond();
    }

    //부품-옵션
    /**
     * BMP거래처코드
     *
     * @return
     */
    public static String getBmpBpCd() {
        return getUser().getBmpBpCd();
    }

    /**
     * PREFIX고객번호
     *
     * @return
     */
    public static String getPrefixCustNo() {
        return getUser().getPrefixCustNo();
    }

    /**
     * 클레임 청구가능 여부
     * @return
     */
    public static String getClaimYn(){
        return getUser().getClaimReqPermYn();
    }

    // TODO[이교진] 삭제필요 임시조치임
    public static String getOnDutyYn() {
        return "N";
    }

    /**
     * 로그인 사용자 정보
     *
     * @return
     */
    public static CustomUserVO getUser() {
        return (CustomUserVO) UserDetailsHelper.getAuthenticatedUser();
    }

    /**
     * 로그인 사용자 권한 체크
     *
     * @param roleId
     * @return
     */
    @SuppressWarnings("unchecked")
    public static boolean hasRole(final String roleId) {
        Collection<GrantedAuthority> lstAuth = (Collection<GrantedAuthority>) SecurityContextHolder.getContext()
                .getAuthentication().getAuthorities();
        SimpleGrantedAuthority gauth = new SimpleGrantedAuthority(roleId);
        return lstAuth.contains(gauth);
    }

    /**
     * 로그인 사용자 권한 목록
     *
     * @param roleId
     * @return
     */
    @SuppressWarnings("unchecked")
    public static List<String> getRoles() {
        List<String> roles = new ArrayList<String>();
        Collection<GrantedAuthority> authorties = (Collection<GrantedAuthority>) SecurityContextHolder.getContext()
                .getAuthentication().getAuthorities();

        for (GrantedAuthority authority : authorties) {
            roles.add(authority.getAuthority());
        }

        return roles;
    }
}
