package chn.bhmc.dms.bat.mgr.service;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.time.DateFormatUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.quartz.CronTrigger;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : QuartzCronExpressionTestUtils.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 3. 18.
 * @version 1.0
 * @see
 * @Modification Information
 *
 *               <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 18.     Kang Seok Han     최초 생성
 * </pre>
 */

public class QuartzCronExpressionTestUtils {

    public static void assertSchedule(CronTrigger trigger, String initialTime, List<String> expectedTimeList,
            String datePattern) throws ParseException {
        Date previousStartTime = DateUtils.parseDate(initialTime, new String[] { datePattern });

        for (String expectedTime : expectedTimeList) {
            Date nextExecutionTime = trigger.getFireTimeAfter(previousStartTime);
            String actualTime = DateFormatUtils.format(nextExecutionTime, datePattern);
            assertThat("executed on expected time", actualTime, is(expectedTime));
            previousStartTime = nextExecutionTime;
        }
    }

}
