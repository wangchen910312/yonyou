package chn.bhmc.dms.bat.crm.css;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.crm.css.service.BatMembershipPointDelService;
import chn.bhmc.dms.bat.crm.css.vo.BatMembershipPointDelVO;
import chn.bhmc.dms.bat.mgr.service.BaseJobBean;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipPointDelBatchJobBean.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Hyun Ho
 * @since 2016. 6. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 24.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public class MembershipPointDelBatchJobBean extends BaseJobBean {
	
	@Autowired
	BatMembershipPointDelService batMembershipPointDelService;

    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {
        try {
            //배치 업무로직을 구현한 서비스 객체를 구한다.
            //BatMembershipPointDelService batMembershipPointDelService = getBean(BatMembershipPointDelService.class);

            //배치 업무로직을 구현한 서비스 객체의 메소드를 실행하여 작업을 수행한다.
            BatMembershipPointDelVO delVO = new BatMembershipPointDelVO();
            batMembershipPointDelService.deleteMembershipPointDel(delVO);
        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}