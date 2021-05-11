package chn.bhmc.dms.bat.ser.svi;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.ser.svi.service.BatLaborCodeManageService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LaborInterfaceBatchJobBean.java
 * @Description : DCS-DMS dms에서 공임정보 수신.
 * @author YIN XUEYUAN
 * @since 2016. 5. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 19.     YIN XUEYUAN     최초 생성
 * </pre>
 */

public class LaborInterfaceBatchJobBean extends BaseJobBean {
	
	@Autowired
	BatLaborCodeManageService batLaborCodeManageService;

    @Override
    protected void executeJob(JobExecutionContext context)
            throws JobExecutionException {
        try {
            //배치 업무로직을 구현한 서비스 객체를 구한다.
            //BatLaborCodeManageService batLaborCodeManageService = getBean(BatLaborCodeManageService.class);

            //배치 업무로직을 구현한 서비스 객체의 메소드를 실행하여 작업을 수행한다.
            batLaborCodeManageService.multiLabor();
        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}