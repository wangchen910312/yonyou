package chn.bhmc.dms.bat.sal.cmm;

import java.util.Map;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.sal.cmm.service.BatchSalesService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   :
 * @Description : 판매 - Camel 호출 데이터 수집
 * @author Kim Jin Suk
 * @since 2016. 7. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 26.     Kim Jin Suk          최초 생성
 * </pre>
 */

public class BatchSalesProcedureBean extends BaseJobBean {
	
	@Autowired
	BatchSalesService salesService;
	
    @Override
    protected void executeJob(JobExecutionContext context)
            throws JobExecutionException {
        try {
            //배치 업무로직을 구현한 서비스 객체를 구한다.
            //BatchSalesService salesService = getBean(BatchSalesService.class);
            String sid = context.getJobDetail().getJobDataMap().getString("sID");

            Map<String, ?> sMap = context.getJobDetail().getJobDataMap();
            int size = sMap.size();

            switch (size){
                case 1:
                    if(sid != null){
                        //배치 업무로직을 구현한 서비스 객체의 메소드를 실행하여 작업을 수행한다.
                        salesService.executeSalesProcedure(sid);
                    }
                    break;
                default:
                    salesService.executeSalesProcedure(sid, sMap);
                    break;
            }
        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}