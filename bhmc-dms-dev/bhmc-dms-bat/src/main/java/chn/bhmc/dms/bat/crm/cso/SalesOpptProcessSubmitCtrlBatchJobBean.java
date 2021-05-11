package chn.bhmc.dms.bat.crm.cso;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.crm.cso.service.BatSalesOpptProcessSubmitCtrlService;
import chn.bhmc.dms.bat.mgr.service.BaseJobBean;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SalesOpptProcessSubmitCtrlBatchJobBean
 * @Description : 판매기회 강제 전출 처리
 * @author LEE KYOJIN
 * @since 2016. 9. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 19.     LEE KYOJIN     최초 생성
 * </pre>
 */

public class SalesOpptProcessSubmitCtrlBatchJobBean extends BaseJobBean {
	
	@Autowired
	BatSalesOpptProcessSubmitCtrlService batSalesOpptProcessSubmitCtrlService;

    @Override
    protected void executeJob(JobExecutionContext context)
            throws JobExecutionException {
        try {
            //배치 업무로직을 구현한 서비스 객체를 구한다.
            //BatSalesOpptProcessSubmitCtrlService batSalesOpptProcessSubmitCtrlService = getBean(BatSalesOpptProcessSubmitCtrlService.class);

            //배치 업무로직을 구현한 서비스 객체의 메소드를 실행하여 작업을 수행한다.
            batSalesOpptProcessSubmitCtrlService.updateSalesOpptProcessSubmitCtrl();
        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}