package chn.bhmc.dms.bat.crm.cso;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.crm.cso.service.BatIfSalesOpptDmsDcsService;
import chn.bhmc.dms.bat.mgr.service.BaseJobBean;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SalesOpptDmsDcsInterfaceBatchJobBean
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

public class SalesOpptDmsDcsInterfaceBatchJobBean extends BaseJobBean {

    @Autowired
    BatIfSalesOpptDmsDcsService batIfSalesOpptDmsDcsService;

    @Override
    protected void executeJob(JobExecutionContext context)
            throws JobExecutionException {
        try {
            //배치 업무로직을 구현한 서비스 객체를 구한다.
            //BatIfSalesOpptDmsDcsService batIfSalesOpptDmsDcsService = getBean(BatIfSalesOpptDmsDcsService.class);

            //배치 업무로직을 구현한 서비스 객체의 메소드를 실행하여 작업을 수행한다.
            //int cntChk =

            // DMS IR to DMS T로 데이터 처리
            batIfSalesOpptDmsDcsService.selectSalesOpptDmsOri();

            // DMS에서 DCS로 데이터를 보내기 위한 취합
            batIfSalesOpptDmsDcsService.selectSalesOpptDmsDcs();

            // DMS에서 DCS로 데이터를 보낸다.
            batIfSalesOpptDmsDcsService.selectSalesOpptProcessCallCamel();

        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}
