package chn.bhmc.dms.bat.crm.css;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.crm.css.service.BatSatisFactionManageService;
import chn.bhmc.dms.bat.mgr.service.BaseJobBean;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SatisFactionManageBatchJobBean.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Hyun Ho
 * @since 2016. 7. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 19.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public class SatisFactionManageBatchJobBean extends BaseJobBean {

	@Autowired
	BatSatisFactionManageService batSatisFactionManageService;

    @Override
    protected void executeJob(JobExecutionContext context)
            throws JobExecutionException {

        try {

            batSatisFactionManageService.selectCallRcpeExtrMapping();

        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}