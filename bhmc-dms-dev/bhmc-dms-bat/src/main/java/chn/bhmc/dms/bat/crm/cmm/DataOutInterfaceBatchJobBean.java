package chn.bhmc.dms.bat.crm.cmm;

import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.crm.cmm.service.BatDmsDataOutService;
import chn.bhmc.dms.bat.mgr.service.BaseJobBean;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DataOutInterfaceBatchJobBean
 * @Description : DMS-DCS CRM 변경 데이터 수집 & DCS 송신
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

public class DataOutInterfaceBatchJobBean extends BaseJobBean {

	@Autowired
	BatDmsDataOutService batDmsDataOutService;

    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {
        try {

            //ALTER TABLE DMSDB.CM_0101T ADD CRM_DATA_UP_DT DATE;
            //COMMENT ON COLUMN DMSDB.CM_0101T.CRM_DATA_UP_DT IS 'CRM 전체 데이터 업로드 일';

            JobDataMap jobDataMap = context.getJobDetail().getJobDataMap();
            String fPath = jobDataMap.getString("FILE_UPLOAD_PATH");

            String strDay = context.getJobDetail().getJobDataMap().getString("day");
            String strTable = context.getJobDetail().getJobDataMap().getString("table");
            //배치 업무로직을 구현한 서비스 객체의 메소드를 실행하여 작업을 수행한다.
            batDmsDataOutService.selectDmsData(fPath, strDay, strTable);

            try{
                batDmsDataOutService.selectIF(); //딜러 IF 실행 현황
            }catch (Exception e){ }
        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}