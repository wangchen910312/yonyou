package chn.bhmc.dms.bat.crm.css;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.crm.css.service.BatMembershipPointExpService;
import chn.bhmc.dms.bat.crm.css.vo.BatMembershipPointExpVO;
import chn.bhmc.dms.bat.mgr.service.BaseJobBean;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipPointExpBatchJobBean.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Hyun Ho
 * @since 2016. 6. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 22.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public class MembershipPointExpBatchJobBean extends BaseJobBean {

	@Autowired
	BatMembershipPointExpService batMembershipPointExpService;

    @Override
    protected void executeJob(JobExecutionContext context)
            throws JobExecutionException {
        try {
            //배치 업무로직을 구현한 서비스 객체를 구한다.
            //BatIfCustomerInfoDmsDcsService batIfCustomerInfoDmsDcsService = getBean(BatIfCustomerInfoDmsDcsService.class);
            //BatMembershipPointExpService batMembershipPointExpService = getBean(BatMembershipPointExpService.class);

            //배치 업무로직을 구현한 서비스 객체의 메소드를 실행하여 작업을 수행한다.
            //batIfCustomerInfoDmsDcsService.selectCustomerInfoAddrDmsDcs();

            /*
            20170601 / 이인문 / 사용안함. 삭제 예정
            */
            BatMembershipPointExpVO expVO = new BatMembershipPointExpVO();
            batMembershipPointExpService.insertMembershipPointExp(expVO);
        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}
