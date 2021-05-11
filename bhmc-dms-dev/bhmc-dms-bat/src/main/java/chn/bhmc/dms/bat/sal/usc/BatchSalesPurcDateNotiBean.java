package chn.bhmc.dms.bat.sal.usc;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.sal.usc.service.BatchSalesPurcService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchSalesUsedVehiclePurcDateNotiBean.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Lee Seungmin
 * @since 2017. 2. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 1.     Lee Seungmin     최초 생성
 * </pre>
 */

public class BatchSalesPurcDateNotiBean extends BaseJobBean {
	
	@Autowired
	BatchSalesPurcService batchSalesPurcService;

    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {
        try {
            // 배치 업무로직을 구현한 서비스 객체를 구한다.
            //BatchSalesPurcService batchSalesPurcService = getBean(BatchSalesPurcService.class);

            //배치 업무로직을 구현한 서비스 객체의 메소드를 실행하여 작업을 수행한다.
            batchSalesPurcService.selectUscTargetItem();
        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}