package chn.bhmc.dms.crm.cmm.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import able.com.service.HService;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

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


}
