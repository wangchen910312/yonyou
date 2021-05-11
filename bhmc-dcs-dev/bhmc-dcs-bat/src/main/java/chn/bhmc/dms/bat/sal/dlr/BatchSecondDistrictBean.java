package chn.bhmc.dms.bat.sal.dlr;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.sal.dlr.service.BatchSecondDistrictService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   :
 * @Description : 판매 - 1급/2급 심사자 정보 셋팅
 * @author Kim Jin Suk
 * @since 2018. 4. 01.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 26.     Kim Jin Suk          최초 생성
 * </pre>
 */

public class BatchSecondDistrictBean extends BaseJobBean {

	@Autowired
	BatchSecondDistrictService batchSecondDistrictService;

    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {
        try{
            batchSecondDistrictService.secondDistrictRun();
        }catch(Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}
