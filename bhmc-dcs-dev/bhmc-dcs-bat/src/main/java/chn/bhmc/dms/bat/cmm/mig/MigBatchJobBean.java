package chn.bhmc.dms.bat.cmm.mig;

import java.util.ArrayList;
import java.util.List;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.cmm.mig.service.impl.ThreadMigServiceImpl;

import chn.bhmc.dms.bat.cmm.mig.service.MigService;
import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.cmm.cmp.vo.DealerVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DcsMigBatchJobBean.java
 * @Description : DCS Migration을 위한 배치
 * @author Choi KyungYong
 * @since 2017. 7. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since             author              description
 *  ============    ===============    ========================
 *  2017. 07. 10.    Choi KyungYong            최초 생성
 * </pre>
 */

public class MigBatchJobBean extends BaseJobBean {

	@Autowired
	MigService dcsMigService;

	public static final Logger logger = LoggerFactory.getLogger("chn.bhmc.dms.app.log.error");

    @Override
    protected void executeJob(JobExecutionContext context)
            throws JobExecutionException {

        try {
            DealerVO dealerVO = dcsMigService.selectDcsMigStat();
            String dlrCd = "";
            if(!"P".equals(dealerVO.getMigPrgStat())){
                List<DealerVO> arrDealerVO = new ArrayList<DealerVO>();
                arrDealerVO = dcsMigService.selectDcsMigBatch();
                if(arrDealerVO != null){
                    if(arrDealerVO.size() > 0){

                        dcsMigService.updateDcsMigStat("A07AA", "P");
                        try{
                            dcsMigService.insertDcsMigBatch();
                        }catch (Exception e){
                            dcsMigService.updateDcsMigStat("A07AA", "E");
                            throw new JobExecutionException(e.getMessage(), e);
                        }
                        int iSize = arrDealerVO.size();
                        int iRRFlag = 0;
                        for(int i = 0; i < iSize; i++){
                            dlrCd = arrDealerVO.get(i).getDlrCd();

                            //쓰레드가 2번 실행하는 오류가 있어 count 체크
                            logger.debug("ThreadMigServiceImpl call dealer = " + dlrCd);
                            ThreadMigServiceImpl threadMigServiceImpl = new ThreadMigServiceImpl(dlrCd, iRRFlag);
                            new Thread (threadMigServiceImpl).start();
                            iRRFlag++;
                        }
                        dcsMigService.updateDcsMigStat("A07AA", "Z");
                    }
                }
            }
        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }

    }
}
