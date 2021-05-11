package chn.bhmc.dms.bat.sal.svi;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.sal.svi.service.SpecialVehicleGdmsToDcsService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SpecialVehicleGdmsToDcsBatchJobBean.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ki hyun Kwon
 * @since 2017. 6. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 6. 28.     Ki hyun Kwon     최초 생성
 * </pre>
 */

public class SpecialVehicleGdmsToDcsBatchJobBean extends BaseJobBean{


    @Autowired
    SpecialVehicleGdmsToDcsService specialVehicleGdmsToDcsService;

    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {

        try{
            specialVehicleGdmsToDcsService.migSalSpecialVehicle();

        }catch(Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}
