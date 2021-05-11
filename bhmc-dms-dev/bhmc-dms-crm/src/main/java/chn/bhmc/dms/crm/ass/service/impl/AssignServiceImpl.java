package chn.bhmc.dms.crm.ass.service.impl;

import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;

import able.com.exception.BizException;
import able.com.service.HService;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.cmm.nms.service.TodoInfoService;
import chn.bhmc.dms.cmm.nms.vo.TodoInfoAppendUserVO;
import chn.bhmc.dms.cmm.nms.vo.TodoInfoVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.ass.service.AssignService;
import chn.bhmc.dms.crm.ass.service.dao.AssignDAO;
import chn.bhmc.dms.crm.ass.vo.CallCenterAssignSaveVO;
import chn.bhmc.dms.crm.ass.vo.CustomerInfoAssignSaveVO;
import chn.bhmc.dms.crm.ass.vo.LeadAssignSaveVO;
import chn.bhmc.dms.crm.ass.vo.SalesOpptProcessSaveVO;
import chn.bhmc.dms.crm.ass.vo.VocStaffAssignSaveVO;
import chn.bhmc.dms.crm.cal.vo.CallCenterActionVO;
import chn.bhmc.dms.crm.cif.service.CustomerInfoService;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoVO;
import chn.bhmc.dms.crm.crq.vo.VocMgmtVO;
import chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtOutBoundService;
import chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtService;
import chn.bhmc.dms.crm.cso.vo.SalesOpptProcessMgmtVO;
import chn.bhmc.dms.crm.slm.vo.LeadInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AssignServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In moon Lee
 * @since 2016. 3. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 24.     In moon Lee     최초 생성
 * </pre>
 */

@Service("assignService")
public class AssignServiceImpl extends HService implements AssignService {

    @Resource(name="assignDAO")
    AssignDAO assignDAO;

    /*
     * 고객정보 관리 Service
     */
    @Resource(name="customerInfoService")
    CustomerInfoService customerInfoService;

    /*
     * 판매기회 프로세스 관리 Service
     */
    @Resource(name="salesOpptProcessMgmtService")
    SalesOpptProcessMgmtService salesOpptProcessMgmtService;

    /*
     * 판매기회 프로세스 관리 Service
     */
    @Resource(name="salesOpptProcessMgmtOutBoundService")
    SalesOpptProcessMgmtOutBoundService salesOpptProcessMgmtOutBoundService;
    
    /*
     * TodoInfoService  update by sunzhiqiang 2018-01-30
     */
    @Resource(name="todoInfoService")
    TodoInfoService	todoInfoService;
     /**
     * VOC 배정
     */
    @Override
    public void updateVocStaffAssign(VocStaffAssignSaveVO saveVO) throws Exception {


        /* 저장로직은 확인 완료! 추후 메시지 만 반영하면됨. */


        List<VocMgmtVO> assignList = saveVO.getAssignList();            // 배정 목록
        List<UserVO> userList = saveVO.getUserList();                   // 배정 담당자 목록

        if(assignList.size() <= 0 ){
            // 배정목록 / 을(를) 선택해주세요.
            throw processException("global.info.chkSelectItemMsg", new String[]{messageSource.getMessage("global.btn.assignList", null, LocaleContextHolder.getLocale())});
        }

        if(userList.size() <= 0 ){
            // 배정담당자 / 을(를) 선택해주세요.
            throw processException("global.info.chkSelectItemMsg", new String[]{messageSource.getMessage("global.lbl.assignPrsNm", null, LocaleContextHolder.getLocale())});
        }

        if(assignList.size() < userList.size() ){
            // 선택된 목록보다 담당자가 많습니다.
            throw processException("global.info.assignChk");
        }

        // 배정 담당자 초기화 변수 선언
        int idx = 0;

        for (VocMgmtVO obj : assignList) {

            if(!obj.getVocStatCd().equals("01")){
                // 접수완료 상태에만 배정이 가능합니다.
                throw processException("global.info.vocAssignChk");
            }

            String scId = userList.get(idx).getUsrId();     // 배정 담당자 목록에서 배정자 set

            idx = idx+1;

            // 배정 담당자 목록수만큼 loop 돌았으면 배정 담당자 초기화
            if(idx == userList.size()){
                idx = 0;
            }

            obj.setPprocId(scId);                       // 변경 [후] SC 아이디 설정
            obj.setUpdtUsrId(LoginUtil.getUserId());
            assignDAO.updateVocStaffAssign(obj);

        }

    }


    /**
     * 고객 담당엽업사원 배정
     */
    @Override
    public void updateCustomerInfoAssign(CustomerInfoAssignSaveVO saveVO) throws Exception {

        List<CustomerInfoVO> assignList = saveVO.getAssignList();       // 배정 목록
        List<UserVO> userList = saveVO.getUserList();                   // 배정 담당자 목록

        if(assignList.size() <= 0 ){
            // 배정목록 / 을(를) 선택해주세요.
            throw processException("global.info.chkSelectItemMsg", new String[]{messageSource.getMessage("global.btn.assignList", null, LocaleContextHolder.getLocale())});
        }

        if(userList.size() <= 0 ){
            // 배정담당자 / 을(를) 선택해주세요.
            throw processException("global.info.chkSelectItemMsg", new String[]{messageSource.getMessage("global.lbl.assignPrsNm", null, LocaleContextHolder.getLocale())});
        }

        if(assignList.size() < userList.size() ){
            // 선택된 목록보다 담당자가 많습니다.
            throw processException("global.info.assignChk");
        }


        // 배정 담당자 초기화 변수 선언
        int idx = 0;

        for (CustomerInfoVO obj : assignList) {

            String scId = saveVO.getUserList().get(idx).getUsrId();     // 배정 담당자 목록에서 배정자 set

            idx = idx+1;

            // 배정 담당자 목록수만큼 loop 돌았으면 배정 담당자 초기화
            if(idx == userList.size()){
                idx = 0;
            }

            obj.setBefMngScId(obj.getMngScId());      // 변경 [전] SC 아이디 설정
            obj.setMngScId(scId);                     // 변경 [후] SC 아이디 설정
            obj.setDlrCd(LoginUtil.getDlrCd());
            obj.setPltCd(LoginUtil.getPltCd());
            obj.setCustTp(obj.getCustTp());
            obj.setPrefCommMthCd(obj.getPrefCommMthCd());
            obj.setPrefCommNo(obj.getPrefCommNo());
            obj.setOfficeTelNo(obj.getOfficeTelNo());
            obj.setCommandTp("ASSIGN");
            customerInfoService.updateCustomer(obj);

        }

    }

    /**
     * 판매기회고객 담당자 배정
     */
    @Override
    public void updateSalesOpptAssign(SalesOpptProcessSaveVO saveVO) throws Exception {

        List<SalesOpptProcessMgmtVO> assignList = saveVO.getAssignList();       // 배정 목록
        List<UserVO> userList = saveVO.getUserList();                   // 배정 담당자 목록

        if(assignList.size() <= 0 ){
            // 배정목록 / 을(를) 선택해주세요.
            throw processException("global.info.chkSelectItemMsg", new String[]{messageSource.getMessage("global.btn.assignList", null, LocaleContextHolder.getLocale())});
        }

        if(userList.size() <= 0 ){
            // 배정담당자 / 을(를) 선택해주세요.
            throw processException("global.info.chkSelectItemMsg", new String[]{messageSource.getMessage("global.lbl.assignPrsNm", null, LocaleContextHolder.getLocale())});
        }

        if(assignList.size() < userList.size() ){
            // 선택된 목록보다 담당자가 많습니다.
            throw processException("global.info.assignChk");
        }


        // 배정 담당자 초기화 변수 선언
        int idx = 0;
        String scId = "";

        for (SalesOpptProcessMgmtVO obj : assignList) {

            scId = saveVO.getUserList().get(idx).getUsrId();     // 배정 담당자 목록에서 배정자 set

            idx = idx+1;

            // 배정 담당자 목록수만큼 loop 돌았으면 배정 담당자 초기화
            if(idx == userList.size()){
                idx = 0;
            }

            obj.setDlrCd(LoginUtil.getDlrCd());
            obj.setMngScId(scId);
            //obj.setSubmitDt(submitDt);

            salesOpptProcessMgmtOutBoundService.updateSalesOpptProcessMgmt(obj);
          //update by yonyou-sunzhiqiang 2018-01-30 线索待邀约，已分配线索待负责人邀约  start;
			//判断线索状态是否为“线索邀约”并且负责人不为空;
			if ("02".equals(obj.getLeadStatCd()) && (null != obj.getMngScId()) ) {
				try {

					String todoMsg = "";
					//通过用户编码获取用户信息；
					CustomerInfoSearchVO searchVo = new CustomerInfoSearchVO();
					searchVo.setsCustNo(obj.getCustNo());
					CustomerInfoVO custInfo = customerInfoService.selectCustomerInfoByKey(searchVo);
				
					TodoInfoVO todoInfoVO = new TodoInfoVO();
					todoMsg = messageSource.getMessage("crm.info.opptToBeInvitationTodo" , new String[]{custInfo.getCustNm()} , Locale.CHINA );
				
					todoInfoVO.setTodoPolicyId("TD-P-20002");
					todoInfoVO.setTodoDesc(todoMsg);
					todoInfoVO.setActionParams("custNo="+obj.getCustNo()+"&leadStatCd="+obj.getLeadStatCd());
					todoInfoVO.setRegUsrId("SYSTEM");
					//线索待邀约，需要通知该线索负责人。无法在系统中配置职位或固定某人。以额外通知人方式添加；
					todoInfoVO.getAppendUsers().add(new TodoInfoAppendUserVO(obj.getMngScId()));
				
					todoInfoService.insertTodoInfo(todoInfoVO);
				} catch(Exception e){
					throw new BizException(e.getMessage());
				}
            }
			//update by yonyou-sunzhiqiang 2018-01-30 线索待邀约，已分配线索待负责人邀约  end;

        }

    }

    /**
     * 리드 배분
     */
    @Override
    public void updateLeadAssign(LeadAssignSaveVO saveVO) throws Exception {

        List<LeadInfoVO> assignList = saveVO.getAssignList();           // 배정 목록
        List<UserVO> userList = saveVO.getUserList();                   // 배정 담당자 목록

        if(assignList.size() <= 0 ){
            // 배정목록 / 을(를) 선택해주세요.
            throw processException("global.info.chkSelectItemMsg", new String[]{messageSource.getMessage("global.btn.assignList", null, LocaleContextHolder.getLocale())});
        }

        if(userList.size() <= 0 ){
            // 배정담당자 / 을(를) 선택해주세요.
            throw processException("global.info.chkSelectItemMsg", new String[]{messageSource.getMessage("global.lbl.assignPrsNm", null, LocaleContextHolder.getLocale())});
        }

        if(assignList.size() < userList.size() ){
            // 선택된 목록보다 담당자가 많습니다.
            throw processException("global.info.assignChk");
        }

        // 배정 담당자 초기화 변수 선언
        int idx = 0;

        for (LeadInfoVO obj : assignList) {

            String leadStat = obj.getStatCd();
            if ( leadStat.equals("03") || leadStat.equals("04") || leadStat.equals("05")) {
                // 종료 상태에는 배정이 불가능합니다.
                throw processException("global.info.leadAssignChk");
            }

            String scId = saveVO.getUserList().get(idx).getUsrId();     // 배정 담당자 목록에서 배정자 set

            idx = idx+1;

            // 배정 담당자 목록수만큼 loop 돌았으면 배정 담당자 초기화
            if(idx == userList.size()){
                idx = 0;
            }

            obj.setPrsnId(scId);     // 변경 [후] 판매고문, // 내려보내는날짜(ALLOC_DT) 는 SYSDATE로 업데이트
            obj.setUpdtUsrId(LoginUtil.getUserId());

            assignDAO.updateLeadAssign(obj);

        }

    }


    /**
     * OB배정(콜센터 배정).
     * @param CallCenterAssignSaveVO - 배정목록
     * @return
     */
    @Override
    public void updateCallCenterAssign(CallCenterAssignSaveVO saveVO) throws Exception {

        List<CallCenterActionVO> assignList = saveVO.getAssignList();           // 배정 목록
        List<UserVO> userList = saveVO.getUserList();                   // 배정 담당자 목록

        if(assignList.size() <= 0 ){
            // 배정목록 / 을(를) 선택해주세요.
            throw processException("global.info.chkSelectItemMsg", new String[]{messageSource.getMessage("global.btn.assignList", null, LocaleContextHolder.getLocale())});
        }

        if(userList.size() <= 0 ){
            // 배정담당자 / 을(를) 선택해주세요.
            throw processException("global.info.chkSelectItemMsg", new String[]{messageSource.getMessage("global.lbl.assignPrsNm", null, LocaleContextHolder.getLocale())});
        }

        if(assignList.size() < userList.size() ){
            // 선택된 목록보다 담당자가 많습니다.
            throw processException("global.info.assignChk");
        }

        // 배정 담당자 초기화 변수 선언
        int idx = 0;

        String userId = LoginUtil.getUserId();
        for (CallCenterActionVO obj : assignList) {

            String scId = saveVO.getUserList().get(idx).getUsrId();     // 배정 담당자 목록에서 배정자 set

            idx = idx+1;

            // 배정 담당자 목록수만큼 loop 돌았으면 배정 담당자 초기화
            if(idx == userList.size()){
                idx = 0;
            }

            obj.setCallPrsnId(scId); // 변경 [후] 판매고문, // 내려보내는날짜(ALLOC_DT) 는 SYSDATE로 업데이트
            obj.setCallAssignId(userId);    //배정인
            obj.setUpdtUsrId(userId);
            obj.setDlrCd(LoginUtil.getDlrCd());

            assignDAO.updateCallCenterAssign(obj);

        }

    }

}
