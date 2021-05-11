package chn.bhmc.dms.bat.crm.cmm;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.crm.cmm.service.BatIfCarLineDmsDcsService;
import chn.bhmc.dms.bat.mgr.service.BaseJobBean;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CarLineDmsDcsInterfaceBatchJobBean
 * @Description : DMS-DCS 고객정보전송을 위한 데이터 수집
 * @author LEE KYOJIN
 * @since 2016. 5. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 19.     LEE KYOJIN     최초 생성
 * </pre>
 */

public class CarLineDmsDcsInterfaceBatchJobBean extends BaseJobBean {
	
	@Autowired
	BatIfCarLineDmsDcsService batIfCarLineDmsDcsService;

    @Override
    protected void executeJob(JobExecutionContext context)
            throws JobExecutionException {
        try {

            //배치 업무로직을 구현한 서비스 객체를 구한다.
            //BatIfCarLineDmsDcsService batIfCarLineDmsDcsService = getBean(BatIfCarLineDmsDcsService.class);

            //배치 업무로직을 구현한 서비스 객체의 메소드를 실행하여 작업을 수행한다.
            batIfCarLineDmsDcsService.selectCarLineDmsDcs();
        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}