package chn.bhmc.dms.bat.crm.crq;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.crm.crq.service.BatVocActiveDmsDcsInterfaceService;
import chn.bhmc.dms.bat.mgr.service.BaseJobBean;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatVocActiveDmsDcsInterfaceBatchJobBean
 * @Description : DMS-DCS 고객요청 활동 정보전송을 위한 데이터 수집
 * @author LEE IN MOON
 * @since 2016.10.27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.10.27.     LEE IN MOON     최초 생성
 * </pre>
 */

public class BatVocActiveDmsDcsInterfaceBatchJobBean extends BaseJobBean {
	
	@Autowired
	BatVocActiveDmsDcsInterfaceService batVocActiveDmsDcsIFService;

    @Override
    protected void executeJob(JobExecutionContext context)
            throws JobExecutionException {
        try {
            // VOC Active I/F ( DMS -> DCS )
            //BatVocActiveDmsDcsInterfaceService batVocActiveDmsDcsIFService = getBean(BatVocActiveDmsDcsInterfaceService.class);
            batVocActiveDmsDcsIFService.selectVocActiveDmsDcs();
        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}