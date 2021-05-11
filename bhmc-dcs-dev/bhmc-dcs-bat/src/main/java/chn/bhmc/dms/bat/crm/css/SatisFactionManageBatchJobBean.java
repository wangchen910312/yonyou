package chn.bhmc.dms.bat.crm.css;

import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.crm.css.service.BatSatisFactionManageService;
import chn.bhmc.dms.bat.crm.css.vo.BatSatisFactionManageVO;
import chn.bhmc.dms.bat.mgr.service.BaseJobBean;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SatisFactionManageBatchJobBean.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Hyun Ho
 * @since 2016. 7. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 19.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public class SatisFactionManageBatchJobBean extends BaseJobBean {
	
	@Autowired
	BatSatisFactionManageService batSatisFactionManageService;
	
    @Override
    protected void executeJob(JobExecutionContext context)
            throws JobExecutionException {

        try {

            //배치 업무로직을 구현한 서비스 객체를 구한다.
            //BatIfCustomerInfoDmsDcsService batIfCustomerInfoDmsDcsService = getBean(BatIfCustomerInfoDmsDcsService.class);
            //BatSatisFactionManageService


            //배치 업무로직을 구현한 서비스 객체의 메소드를 실행하여 작업을 수행한다.
            //batIfCustomerInfoDmsDcsService.selectCustomerInfoAddrDmsDcs();

            // 1.파라미터로 넘어온 값 Setting
            JobDataMap jobDataMap = context.getJobDetail().getJobDataMap();
            String dlrCd = jobDataMap.get("dlrCd").toString();


            //BatSatisFactionManageService batSatisFactionManageService = getBean(BatSatisFactionManageService.class);
            BatSatisFactionManageVO batStsfMngVO = new BatSatisFactionManageVO();

            //1. 만족도조사에서 배치를 돌 목록부터 조회한다.
            batStsfMngVO.setDlrCd(dlrCd);
            //batSatisFactionManageService.selectSatisFactionBatchList(batSearchVO);

            batSatisFactionManageService.selectCallRcpeExtrMapping(batStsfMngVO);


        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }

    }
}
