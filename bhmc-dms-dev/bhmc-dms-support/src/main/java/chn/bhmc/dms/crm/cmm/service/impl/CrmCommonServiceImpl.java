package chn.bhmc.dms.crm.cmm.service.impl;

import java.text.*;
import java.util.*;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.util.*;

import chn.bhmc.dms.cmm.ath.service.RoleMappingService;
import chn.bhmc.dms.cmm.ath.service.UserService;
import chn.bhmc.dms.cmm.ath.service.ViewMappingService;
import chn.bhmc.dms.cmm.ath.service.impl.UserServiceImpl.*;
import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cmm.service.CrmCommonService;
import chn.bhmc.dms.crm.cmm.vo.CronExpressionEx;
import chn.bhmc.dms.crm.cmm.vo.CronMakerVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CrmCommonServiceImpl.java
 * @Description : Crm 공통
 * @author In Moon Lee
 * @since 2016.06.02.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.06.02.     In Moon Lee     최초 생성
 * </pre>
 */
@Service("crmCommonService")
public class CrmCommonServiceImpl extends HService implements CrmCommonService {

    /**
     * 롤 관리 서비스
     */
    @Resource(name="roleMappingService")
    RoleMappingService roleMappingService;

    /**
     * 화면-사용자/직무/부서 매핑 서비스
     */
    @Resource(name="viewMappingService")
    ViewMappingService viewMappingService;

    /**
     * 사용자 관리 서비스
     */
    @Resource(name="userService")
    UserService userService;

    /**
     * CRON 주기 설정 ( 초,분,시,일,월,주 -> Cron 주기 변환 )
     * @param CronMakerVO
     * @return CronMakerVO
     */
    @Override
    public CronMakerVO cronExpression(CronMakerVO saveVO) throws Exception {

        CronMakerVO result = new CronMakerVO();

        try {

            if ( saveVO.getCronExpression() != "" && saveVO.getCronExpression() != null ) {

                // Cron 주기 변환 -> 초,분,시,일,월,주
                CronExpressionEx exp = new CronExpressionEx(saveVO.getCronExpression().trim());

                // 실행 주기 날짜를 가져온다.
                List<Date> cronList = new ArrayList<Date>();
                cronList = CronSchedule(saveVO.getCronExpression());
                result.setCronSchedule(cronList);

                result.setSecond(exp.getSecondsExp());
                result.setMinute(exp.getMinutesExp());
                result.setHour(exp.getHoursExp());
                result.setDay(exp.getDaysOfMonthExp());
                result.setMonth(exp.getMonthsExp());
                result.setWeek(exp.getDaysOfWeekExp());
                result.setCronExpression(saveVO.getCronExpression().trim());

            } else {

                // 초,분,시,일,월,주 -> Cron 주기 변환
                result.setSecond("0");      // 초 주기 설정

                // 분 주기 설정
                if ( saveVO.getsMinute().length == 0 ) {
                    result.setMinute("*");
                } else {

                    StringBuilder buf = new StringBuilder();
                    boolean first = true;

                    for (String minute : saveVO.getsMinute() ) {

                        if (!first) {
                            buf.append(",");
                        }

                        buf.append(minute);
                        first = false;

                    }

                    result.setMinute(buf.toString());
                }

                // 시간 주기 설정
                if ( saveVO.getsHour().length == 1 &&  saveVO.getsHour()[0].equals("ALL") ) {
                    result.setHour("*");
                } else {

                    StringBuilder buf = new StringBuilder();
                    boolean first = true;

                    for (String hour : saveVO.getsHour() ) {

                        if (!first) {
                            buf.append(",");
                        }

                        buf.append(hour);
                        first = false;

                    }

                    result.setHour(buf.toString());
                }

                // 요일 사용 여부
                if ( saveVO.getsUseWeek().equals("Y") ) {

                    result.setDay("?");

                    // 요일 주기 설정
                    if ( saveVO.getsWeek().length == 1 &&  saveVO.getsWeek()[0].equals("ALL") ) {
                        result.setWeek("*");
                    } else {

                        StringBuilder buf = new StringBuilder();
                        boolean first = true;

                        for (String week : saveVO.getsWeek() ) {

                            if (!first) {
                                buf.append(",");
                            }

                            buf.append(week);
                            first = false;

                        }
                        result.setWeek(buf.toString());
                    }

                } else {

                    result.setWeek("?");

                    // 날짜 주기 설정
                    if ( saveVO.getsDay().length == 1 &&  saveVO.getsDay()[0].equals("ALL") ) {
                        result.setDay("*");
                    } else {

                        StringBuilder buf = new StringBuilder();
                        boolean first = true;

                        for (String day : saveVO.getsDay() ) {

                            if (!first) {
                                buf.append(",");
                            }

                            buf.append(day);
                            first = false;

                        }

                        result.setDay(buf.toString());
                    }

                }

                // 월 주기 설정
                if ( saveVO.getsMonth().length == 1 &&  saveVO.getsMonth()[0].equals("ALL") ) {
                    result.setMonth("*");
                } else {

                    StringBuilder buf = new StringBuilder();
                    boolean first = true;

                    for (String month : saveVO.getsMonth() ) {

                        if (!first) {
                            buf.append(",");
                        }

                        buf.append(month);
                        first = false;

                    }

                    result.setMonth(buf.toString());
                }

                result.setCronExpression(
                        result.getSecond() + " " + result.getMinute()
                        + " " + result.getHour() + " " + result.getDay()
                        + " " + result.getMonth() + " " + result.getWeek()
                );

                // 실행 주기 날짜를 가져온다.
                List<Date> cronList = new ArrayList<Date>();
                cronList = CronSchedule(result.getCronExpression());
                result.setCronSchedule(cronList);

            }

        } catch (Exception e) {

            // {주기}을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.cronExpression", null, LocaleContextHolder.getLocale())});

        }

        return result;

    }

    /**
     * Cron 주기 스케줄 조회
     * @param cronExpression
     * @return List<Date> : Cron 주기 스케줄 조회
     */
    public List<Date> CronSchedule(String cronTxt) throws Exception {

        List<Date> cronList = new ArrayList<Date>();

        try {

            CronExpressionEx exp = new CronExpressionEx(cronTxt.trim());

            java.util.Date dd = new java.util.Date();
            for (int i = 1; i <= 8; i++) {
                dd = exp.getNextValidTimeAfter(dd);
                cronList.add(dd);
                dd = new java.util.Date(dd.getTime() + 1000);
            }

        } catch (Exception e) {

            // {주기}을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.cronExpression", null, LocaleContextHolder.getLocale())});
        }

        return cronList;
    }

    /*
     * @see chn.bhmc.dms.crm.cmm.service.CrmCommonService#selectMngScIdListByCondition()
     */
    @Override
    public List<UserVO> selectMngScIdListByCondition() throws Exception {
        //return selectCrmViewAndRoleMappingUsers("R", "VIEW-D-10322", "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);//판매고문
        return selectCrmViewAndRoleMappingUsers("R", null, "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null);//판매고문
    }

    /*
     * @see chn.bhmc.dms.crm.cmm.service.CrmCommonService#selectViewMappingUsersByViewId(java.lang.String, java.lang.String, java.lang.String, java.lang.String[], java.lang.String)
     */
    @Override
    public List<UserVO> selectCrmViewAndRoleMappingUsers(String listType, String viewId, String role, String permissionName, String[] permissionNames) throws Exception {
        // TODO Auto-generated method stub

        String dlrCd = LoginUtil.getDlrCd();
        String sysCdDlr = Constants.SYS_CD_DLR;

        List<UserVO> userList  = new ArrayList<UserVO>();
        List<UserVO> sysUserYnList = new ArrayList<UserVO>();

        if ("V".equals(listType)) {
            if ( permissionNames != null && permissionNames.length > 0 ) {
                userList = viewMappingService.selectViewMappingUsersByViewId(sysCdDlr, viewId, dlrCd, permissionNames);
            } else {
                userList = viewMappingService.selectViewMappingUsersByViewId(sysCdDlr, viewId, dlrCd, permissionName);
            }
        } else if ("R".equals(listType)) {
            userList = userService.selectUsersByRoleIdAndViewId(sysCdDlr, dlrCd, role, viewId, permissionName);
        }

        if ( userList.size() > 0) {
            for (UserVO userVO : userList) {
                if ( "ROLE_SALES_ADVISOR".equals(role) || "N".equals(userVO.getSysUserYn()) ) {
                    sysUserYnList.add(userVO);
                }
            }
        }

        return sysUserYnList;
    }

    /*
     * @see chn.bhmc.dms.crm.cmm.service.CrmCommonService#selectCrmViewPlusRoleListByCondition(java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String[])
     */
    @SuppressWarnings("unchecked")
    @Override
    public List<UserVO> selectCrmViewPlusRoleListByCondition(String viewId, String role, String permissionName, String[] permissionNames) throws Exception {

        List<UserVO> roleUserList  = new ArrayList<UserVO>();
        List<UserVO> viewUserList  = new ArrayList<UserVO>();

        roleUserList = selectCrmViewAndRoleMappingUsers("R", null, "ROLE_SALES_ADVISOR", Constants.PERMISSION_READ, null); //판매고문
        viewUserList = selectCrmViewAndRoleMappingUsers("V", "VIEW-D-10322", null, Constants.PERMISSION_READ, null); // view 목록

        List<UserVO> list = new ArrayList<UserVO>();

        list.addAll(roleUserList);
        list.addAll(viewUserList);

        Map<String, UserVO> map = new HashMap<String, UserVO>();

        for(UserVO user : list){
            if(!map.containsKey(user.getUsrId())){
                map.put(user.getUsrId(), user);
            }
        }

        List<UserVO> results = (List<UserVO>)CollectionUtils.arrayToList(map.values().toArray());

        Collections.sort(results, new UserComparator());

        return results;
    }

    public class UserComparator implements Comparator<UserVO> {
        Collator collator;

        public UserComparator(){
            collator = Collator.getInstance(java.util.Locale.SIMPLIFIED_CHINESE);
            //collator = (RuleBasedCollator)Collator.getInstance(new Locale("zh", "CN", "PINYIN"));
            //collator.setStrength(Collator.PRIMARY);
        }

        @Override
        public int compare(UserVO o1, UserVO o2) {
            return collator.compare(o1.getUsrNm(), o2.getUsrNm());
        }
    }

}
