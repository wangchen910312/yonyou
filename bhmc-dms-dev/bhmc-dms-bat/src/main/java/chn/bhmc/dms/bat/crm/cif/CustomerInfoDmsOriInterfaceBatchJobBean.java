package chn.bhmc.dms.bat.crm.cif;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.crm.cif.service.BatIfCustomerInfoDmsService;
import chn.bhmc.dms.bat.mgr.service.BaseJobBean;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustomerInfoDmsOriInterfaceBatchJobBean
 * @Description : DMS-Original 고객정보 입력
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

public class CustomerInfoDmsOriInterfaceBatchJobBean extends BaseJobBean {
	
	@Autowired
	BatIfCustomerInfoDmsService batIfCustomerInfoDmsService;

    @Override
    protected void executeJob(JobExecutionContext context)
            throws JobExecutionException {
        try {

            //배치 업무로직을 구현한 서비스 객체를 구한다.
            //BatIfCustomerInfoDmsService batIfCustomerInfoDmsService = getBean(BatIfCustomerInfoDmsService.class);

            //배치 업무로직을 구현한 서비스 객체의 메소드를 실행하여 작업을 수행한다.
            batIfCustomerInfoDmsService.selectCustomerInfoDmsOriginal();

        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}