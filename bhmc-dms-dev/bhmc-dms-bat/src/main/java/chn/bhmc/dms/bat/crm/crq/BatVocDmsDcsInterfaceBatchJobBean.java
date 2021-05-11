package chn.bhmc.dms.bat.crm.crq;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.crm.crq.service.BatVocDmsDcsInterfaceService;
import chn.bhmc.dms.bat.mgr.service.BaseJobBean;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatVocDmsDcsInterfaceBatchJobBean
 * @Description : DMS-DCS 고객요청 정보전송을 위한 데이터 수집
 * @author LEE IN MOON
 * @since 2016.10.10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.10.10.     LEE IN MOON     최초 생성
 * </pre>
 */

public class BatVocDmsDcsInterfaceBatchJobBean extends BaseJobBean {
	
	@Autowired
	BatVocDmsDcsInterfaceService batVocDmsDcsInterfaceService;

    @Override
    protected void executeJob(JobExecutionContext context)
            throws JobExecutionException {
        try {
            // VOC I/F ( DMS -> DCS )
            //BatVocDmsDcsInterfaceService batVocDmsDcsInterfaceService = getBean(BatVocDmsDcsInterfaceService.class);
            batVocDmsDcsInterfaceService.selectVocDmsDcs();
        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}