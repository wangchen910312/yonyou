package chn.bhmc.dms.mob.api.crm.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cmm.vo.CronExpressionEx;
import chn.bhmc.dms.mob.api.crm.service.CrmCrmCommonService;
import chn.bhmc.dms.mob.api.crm.service.CrmRoleMappingService;
import chn.bhmc.dms.mob.api.crm.service.CrmUserService;
import chn.bhmc.dms.mob.api.crm.service.CrmViewMappingService;
import chn.bhmc.dms.mob.api.crm.vo.UserVO;

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
@Service("CrmcrmCommonService")
public class CrmCrmCommonServiceImpl extends HService implements CrmCrmCommonService {

    /**
     * 롤 관리 서비스
     */
    @Resource(name="CrmroleMappingService")
    CrmRoleMappingService CrmroleMappingService;

    /**
     * 화면-사용자/직무/부서 매핑 서비스
     */
    @Resource(name="CrmviewMappingService")
    CrmViewMappingService CrmviewMappingService;

    /**
     * 사용자 관리 서비스
     */
    @Resource(name="CrmuserService")
    CrmUserService CrmuserService;
    
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

        List<UserVO> userRoleMappingList = CrmroleMappingService.selectUsersByRoleId("D", LoginUtil.getDlrCd(), null, null, "ROLE_SALES_ADVISOR");
        /*List<UserVO> sysUserRoleMappingList = new ArrayList<UserVO>();
        if ( userRoleMappingList.size() > 0 ) {
            for (UserVO userVO : userRoleMappingList) {
                if ( "N".equals(userVO.getSysUserYn()) ) {
                    sysUserRoleMappingList.add(userVO);
                }
            }
        }

        // 판매고문 목록
        return sysUserRoleMappingList;*/
        return userRoleMappingList;
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
                userList = CrmviewMappingService.selectViewMappingUsersByViewId(sysCdDlr, viewId, dlrCd, permissionNames);
            } else {
                userList = CrmviewMappingService.selectViewMappingUsersByViewId(sysCdDlr, viewId, dlrCd, permissionName);
            }
        } else if ("R".equals(listType)) {
            userList = CrmuserService.selectUsersByRoleIdAndViewId(sysCdDlr, dlrCd, role, viewId, permissionName);
        }

        if ( userList.size() > 0 ) {
            for (UserVO userVO : userList) {
                if ( "N".equals(userVO.getSysUserYn()) ) {
                    sysUserYnList.add(userVO);
                }
            }
        }

        return sysUserYnList;
    }

}
