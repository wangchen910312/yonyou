package chn.bhmc.dms.bat.sal.cmm;

import org.apache.commons.lang3.StringUtils;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.bat.sal.cmm.service.BatchSalesAddresService;

/**
 *
 * @ClassName   :
 * @Description : 판매 - Address 정보 수집
 * @author Kim Jin Suk
 * @since 2018. 3. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2018. 3. 27.     Kim Jin Suk          최초 생성
 * </pre>
 */

public class BatchSalesAddresBean extends BaseJobBean {

    @Autowired
    BatchSalesAddresService batchSalesAddresService;

    @Override
    protected void executeJob(JobExecutionContext context)
        throws JobExecutionException {
        try{
            String url = context.getJobDetail().getJobDataMap().getString("sUrl");
            int timeOut = 1000;
            String time = context.getJobDetail().getJobDataMap().getString("sTime");

            if(StringUtils.isNoneBlank(time)){
                timeOut = Integer.parseInt(time);
            }

            batchSalesAddresService.pingSearch(url, timeOut);


        }catch(Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }




}