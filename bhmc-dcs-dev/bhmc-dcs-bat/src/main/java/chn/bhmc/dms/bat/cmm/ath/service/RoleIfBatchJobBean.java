package chn.bhmc.dms.bat.cmm.ath.service;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import chn.bhmc.dms.bat.mgr.service.BaseJobBean;
import chn.bhmc.dms.core.support.eai.EaiClient;
import chn.bhmc.dms.core.support.eai.EaiSimpleMessage;
import chn.bhmc.dms.core.support.eai.schema.CommDMSDoc;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RoleIfBatchJobBean.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 9. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 10.     Kang Seok Han     최초 생성
 * </pre>
 */

public class RoleIfBatchJobBean extends BaseJobBean{

	@Autowired
	EaiClient eaiClient;

	@Autowired
	RoleIfService roleIfService;

    @Override
    protected void executeJob(JobExecutionContext context) throws JobExecutionException {

        int day = 1;

        String strDay = context.getJobDetail().getJobDataMap().getString("day");
        if(strDay != null){
            day = Integer.parseInt(strDay);
        }

        try{

            //EAI 클라이언트
            //EaiClient eaiClient = getBean(EaiClient.class);
            //권한/화면 인터페이스 서비스
            //RoleIfService roleIfService = getBean(RoleIfService.class);

            //역할정보 송신테이블 적용
            roleIfService.insertRoleIf(day);
            //역할정보 전송
            CommDMSDoc roleDoc = new EaiSimpleMessage.Builder()
            .ifId("COM014")
            .company("H")
            .sender("DCS")
            .receiver("ALL")
            .build()
            .buildCommDMSDoc();
            eaiClient.sendRequest(roleDoc);

            //역할계층정보 송신테이블 적용
            roleIfService.insertRoleHierarchyIf(day);
            //역할계층정보 전송
            CommDMSDoc roleHierarchyDoc = new EaiSimpleMessage.Builder()
            .ifId("COM031")
            .company("H")
            .sender("DCS")
            .receiver("ALL")
            .build()
            .buildCommDMSDoc();
            eaiClient.sendRequest(roleHierarchyDoc);

            /*
            //역할-직무매핑정보 송신테이블 적용
            roleIfService.insertRoleAuthoritiesIf(day);
            //역할-직무매핑정보 전송
            CommDMSDoc roleAuthoritiesDoc = new EaiSimpleMessage.Builder()
            .ifId("COM030")
            .company("H")
            .sender("DCS")
            .receiver("ALL")
            .build()
            .buildCommDMSDoc();
            eaiClient.sendRequest(roleAuthoritiesDoc);
            */

            //화면정보 송신테이블 적용
            roleIfService.insertViewInfoIf(day);
            //화면정보 전송
            CommDMSDoc viewInfoDoc = new EaiSimpleMessage.Builder()
            .ifId("COM032")
            .company("H")
            .sender("DCS")
            .receiver("ALL")
            .build()
            .buildCommDMSDoc();
            eaiClient.sendRequest(viewInfoDoc);

            //화면계층정보 송신테이블 적용
            roleIfService.insertViewHierarchyIf(day);
            //화면계층정보 전송
            CommDMSDoc viewHierarchyDoc = new EaiSimpleMessage.Builder()
            .ifId("COM038")
            .company("H")
            .sender("DCS")
            .receiver("ALL")
            .build()
            .buildCommDMSDoc();
            eaiClient.sendRequest(viewHierarchyDoc);

            //화면-직무 정보 송신테이블 적용
            roleIfService.insertViewAuthoritiesIf(day);
            //화면-직무 정보 전송
            CommDMSDoc viewAuthoritiesDoc = new EaiSimpleMessage.Builder()
            .ifId("COM033")
            .company("H")
            .sender("DCS")
            .receiver("ALL")
            .build()
            .buildCommDMSDoc();
            eaiClient.sendRequest(viewAuthoritiesDoc);

        }catch(Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
    }
}
