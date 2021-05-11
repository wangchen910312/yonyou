package chn.bhmc.dms.bat.mgr;

import static chn.bhmc.dms.bat.mgr.service.QuartzCronExpressionTestUtils.assertSchedule;

import java.text.ParseException;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.joda.time.DateTimeZone;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.quartz.CronScheduleBuilder;
import org.quartz.CronTrigger;
import org.quartz.Job;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;

import chn.bhmc.dms.core.util.DateUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SampleQuartzScheduleTest.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 3. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 18.     Kang Seok Han     최초 생성
 * </pre>
 */

public class SampleQuartzScheduleTest {

    private static final String DATE_PATTERN = "yyyy/MM/dd hh:mm:ss";

    private Scheduler scheduler;
    private Trigger trigger;
    private JobDetail jobDetail;

    @SuppressWarnings("unchecked")
    @Before
    public void setUp() throws SchedulerException, ClassNotFoundException{
        String batchScheduleId = "BAT-TEST-001";
        String cronExpression = "0 * * * * ?";

        jobDetail = JobBuilder.newJob((Class<? extends Job>) Class.forName("chn.bhmc.dms.bat.SimpleBatchJobBean"))
        .withIdentity(batchScheduleId)
        //.storeDurably()
        .requestRecovery()
        .build();

        trigger = TriggerBuilder.newTrigger()
        .withIdentity(batchScheduleId)
        .withSchedule(CronScheduleBuilder.cronSchedule(cronExpression).inTimeZone(DateTimeZone.forID("Asia/Seoul").toTimeZone()))
        .forJob(jobDetail.getKey().getName())
        .build();

        SchedulerFactory schedulerFactory = new org.quartz.impl.StdSchedulerFactory();
        scheduler = schedulerFactory.getScheduler();

        scheduler.scheduleJob(jobDetail, trigger);
        scheduler.start();
    }

    @After
    public void destroy() throws SchedulerException{
        scheduler.clear();
        scheduler.shutdown();
    }

    @Test
    public void testQuartzJobExecute() throws SchedulerException {

        //배치작업을 임의로 실행하고 결과를 확인한다.
        scheduler.triggerJob(jobDetail.getKey());

    }

    @Test
    public void testQuartzCronExpression() throws ParseException {

        //현재 시간을 기준으로 trigger의 수행 시간을 체크하여 유효성을 검증한다.
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.SECOND, 0);

        Date currentDate = calendar.getTime();

        String initialTime = DateUtil.getDate(currentDate, "yyyy/MM/dd HH:mm:00");
        List<String> expectedTimeList = Arrays.asList(
                DateUtil.getDate(currentDate, "yyyy/MM/dd HH:mm:00", Calendar.MINUTE, 1)
                ,DateUtil.getDate(currentDate, "yyyy/MM/dd HH:mm:00", Calendar.MINUTE, 2)
        );

        assertSchedule((CronTrigger)trigger, initialTime, expectedTimeList, DATE_PATTERN);
    }

}
