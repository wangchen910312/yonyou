package chn.bhmc.dms.bat.crm.dmm;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.crm.dmm.service.BatMembershipGradeChgService;
import chn.bhmc.dms.bat.crm.dmm.vo.BatMembershipGradeChgVO;
import chn.bhmc.dms.bat.mgr.service.BaseJobBean;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipGradeChgBatchJobBean.java
 * @Description : 멤버십 등듭변경 예상 추출 배치
 * @author Kim Hyun Ho
 * @since 2016. 8. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 12.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public class MembershipGradeChgBatchJobBean extends BaseJobBean {
	
	@Autowired
	BatMembershipGradeChgService batMembershipGradeChgService;

    /*
     * @see chn.bhmc.dms.bat.mgr.service.BaseJobBean#executeJob(org.quartz.JobExecutionContext)
     */
    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {
        try {
            // 1.파라미터로 넘어온 값 Setting
            //JobDataMap jobDataMap = context.getJobDetail().getJobDataMap();
            //String dlrCd = jobDataMap.get("dlrCd").toString();

            //배치 업무로직을 구현한 서비스 객체를 구한다.
            //BatMembershipGradeChgService batMembershipGradeChgService = getBean(BatMembershipGradeChgService.class);

            //배치 업무로직을 구현한 서비스 객체의 메소드를 실행하여 작업을 수행한다.
            BatMembershipGradeChgVO saveVO = new BatMembershipGradeChgVO();
            //searchVO.setDlrCd(dlrCd);
            
            batMembershipGradeChgService.selectCallMembershipGradeChg(saveVO);
        } catch (Exception e) {
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}
