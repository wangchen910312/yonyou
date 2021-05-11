package chn.bhmc.dms.bat.cmm.bat;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.cmm.bat.service.DcsResponseDataService;
import chn.bhmc.dms.bat.mgr.service.BaseJobBean;

/**
 * <pre>
 * DCS응답메시지 전송 배치
 * </pre>
 *
 * @ClassName   : DcsResponseDataJobBean.java
 * @Description : DCS응답메시지 전송 배치
 * @author Kyung Mok Kim
 * @since 2018. 2. 13.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2018. 2. 13.   Kyung Mok Kim     최초 생성
 * </pre>
 */

public class DcsResponseDataJobBean extends BaseJobBean {

    @Autowired
    DcsResponseDataService dcsResponseDataService;

    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {
        try{
            dcsResponseDataService.insertDcsResponseData();
        }catch(Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}
