package chn.bhmc.dms.bat.crm.crq;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.crm.crq.service.BatCustomerCareBatchService;
import chn.bhmc.dms.bat.mgr.service.BaseJobBean;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustomerCareBatchJobBean
 * @Description : 고객케어관리 대상자 추출 배치
 * @author In Moon Lee
 * @since 2016.08.05.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.08.05.     In Moon Lee     최초 생성
 * </pre>
 */

public class BatCustomerCareBatchJobBean extends BaseJobBean {
	
	@Autowired
	BatCustomerCareBatchService batCustomerCareBatchService;

    @Override
    protected void executeJob(JobExecutionContext context)
            throws JobExecutionException {
        try {
            //배치 업무로직을 구현한 서비스 객체를 구한다.
            //BatCustomerCareBatchService batCustomerCareBatchService = getBean(BatCustomerCareBatchService.class);
            batCustomerCareBatchService.customerCareTargetExtract();
        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}