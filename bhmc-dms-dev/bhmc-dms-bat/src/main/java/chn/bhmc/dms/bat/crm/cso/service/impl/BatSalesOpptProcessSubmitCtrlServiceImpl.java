package chn.bhmc.dms.bat.crm.cso.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;

import able.com.exception.BizException;
import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;

import chn.bhmc.dms.bat.crm.cso.service.BatSalesOpptProcessSubmitCtrlService;
import chn.bhmc.dms.bat.crm.cso.service.dao.BatSalesOpptDAO;
import chn.bhmc.dms.bat.crm.cso.service.dao.BatSalesOpptProcessMgmtDAO;
import chn.bhmc.dms.bat.crm.cso.vo.BatSalesOpptProcessMgmtHistVO;
import chn.bhmc.dms.bat.crm.cso.vo.BatSalesOpptProcessMgmtSearchVO;
import chn.bhmc.dms.bat.crm.cso.vo.BatSalesOpptProcessMgmtVO;
import chn.bhmc.dms.cmm.ath.service.ViewMappingService;
import chn.bhmc.dms.cmm.ath.vo.UserVO;
import chn.bhmc.dms.cmm.cmp.service.DealerService;
import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.DealerVO;
import chn.bhmc.dms.cmm.nms.service.TodoInfoService;
import chn.bhmc.dms.cmm.nms.vo.TodoInfoAppendUserVO;
import chn.bhmc.dms.cmm.nms.vo.TodoInfoVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.Constants;

/**
 * BatIfSalesActiveDmsDcsServiceImpl
 *
 * @author Kyo Jin LEE
 * @since 2016. 5. 17.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 5. 17.     Kyo Jin LEE      최초 생성
 * </pre>
 */
@Service("batSalesOpptProcessSubmitCtrlService")
public class BatSalesOpptProcessSubmitCtrlServiceImpl extends HService implements BatSalesOpptProcessSubmitCtrlService {

    /**
     * Customer Management
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * batSalesOpptDAO
     */
    @Resource(name="batSalesOpptDAO")
    BatSalesOpptDAO batSalesOpptDAO;

    /**
     * DealerService
     */
    @Resource(name="dealerService")
    DealerService dealerService;

    /**
     * batSalesOpptProcessMgmtDAO
     */
    @Resource(name="batSalesOpptProcessMgmtDAO")
    BatSalesOpptProcessMgmtDAO batSalesOpptProcessMgmtDAO;

    /**
     * 화면-역할/사용자 매핑 관리 서비스
     */
    @Resource(name="viewMappingService")
    ViewMappingService viewMappingService;

    /**
     * TO-DO 관리 서비스
     */
    @Resource(name="todoInfoService")
    TodoInfoService todoInfoService;

    /*
     * @see chn.bhmc.dms.bat.crm.cso.service.BatSalesOpptProcessSubmitCtrlService#updateSalesOpptProcessMgmt()
     */
    @Override
    public int updateSalesOpptProcessSubmitCtrl() throws Exception {
        // 딜러 시스템 확인
        int resultCnt = 0;
        int i = 0;
        String dlrCd = "";
        String autoTrsfConf = "";

        DealerSearchVO dealerSearchVO = new DealerSearchVO();
        DealerVO dealerVO = new DealerVO();
        List<DealerVO> dealerVOList = new ArrayList<DealerVO>();

        dealerSearchVO.setsSysOwnerYn("Y");

        resultCnt = dealerService.selectDealersByConditionCnt(dealerSearchVO);

        if (resultCnt != 0 ) {  // DMS 시스템 보유 딜러
            dealerVOList = dealerService.selectDealersByCondition(dealerSearchVO);

            for ( i = 0; i < dealerVOList.size() ; i++) {
                dlrCd = dealerVOList.get(i).getDlrCd();
                dealerVO = dealerService.selectDealerByKey(dlrCd);

                autoTrsfConf = dealerVO.getAutoTrsfConf();

                // 자동전출 실행
                updateSalesOpptLeadStat(dlrCd , autoTrsfConf);

            }
        } else {  // DMS 시스템 미보유 딜러
            dealerSearchVO.setsSysOwnerYn("");
            dealerSearchVO.setsUseCenterDmsYn("Y");
            resultCnt = 0;
            resultCnt = dealerService.selectDealersByConditionCnt(dealerSearchVO);

            if (resultCnt != 0) {
                dealerVOList = dealerService.selectDealersByCondition(dealerSearchVO);

                for ( i = 0; i < dealerVOList.size() ; i++) {
                    dlrCd = dealerVOList.get(i).getDlrCd();
                    dealerVO = dealerService.selectDealerByKey(dlrCd);

                    autoTrsfConf = dealerVO.getAutoTrsfConf();

                    // 자동전출 실행
                    updateSalesOpptLeadStat(dlrCd , autoTrsfConf);
                }
            }
        }

        return resultCnt;
    }

    public int updateSalesOpptLeadStat(String dlrCd , String autoTrsfConf) throws Exception {

        int resultCnt = 0;
        int salesOpptProcessCnt = 0;
        if ( !("0".equals(autoTrsfConf)) ) {
            BatSalesOpptProcessMgmtSearchVO batSalesOpptProcessMgmtSearchVO = new BatSalesOpptProcessMgmtSearchVO();

            batSalesOpptProcessMgmtSearchVO.setsDlrCd(dlrCd);
            batSalesOpptProcessMgmtSearchVO.setsAutoTrsfConf(autoTrsfConf);
            batSalesOpptProcessMgmtSearchVO.setsLeadStatCd("04");

            salesOpptProcessCnt = batSalesOpptProcessMgmtDAO.selectSalesOpptProcessMgmtsByConditionCnt(batSalesOpptProcessMgmtSearchVO);

            if (salesOpptProcessCnt != 0 ){
                List<BatSalesOpptProcessMgmtVO> lists = new ArrayList<BatSalesOpptProcessMgmtVO>();
                lists = batSalesOpptProcessMgmtDAO.selectSalesOpptProcessMgmtsByCondition(batSalesOpptProcessMgmtSearchVO);

                BatSalesOpptProcessMgmtHistVO batsalesOpptProcessMgmtHistVO = new BatSalesOpptProcessMgmtHistVO();

                // lists의 사용자의 변경 이력 추가.
                for (int i = 0; i < lists.size() ; i++) {
                    batsalesOpptProcessMgmtHistVO = new BatSalesOpptProcessMgmtHistVO();

                    batsalesOpptProcessMgmtHistVO.setDlrCd(lists.get(i).getDlrCd());
                    batsalesOpptProcessMgmtHistVO.setSaleOpptSeq(lists.get(i).getSeq());

                    batsalesOpptProcessMgmtHistVO.setBefLeadStatCd(lists.get(i).getLeadStatCd());
                    batsalesOpptProcessMgmtHistVO.setLeadStatCd("08");
                    batsalesOpptProcessMgmtHistVO.setBefMngScId(lists.get(i).getMngScId());
                    batsalesOpptProcessMgmtHistVO.setMngScId(lists.get(i).getMngScId());

                    batsalesOpptProcessMgmtHistVO.setRegUsrId("SYSTEM");
                    batsalesOpptProcessMgmtHistVO.setUpdtUsrId("SYSTEM");

                    batsalesOpptProcessMgmtHistVO.setContractNo(lists.get(i).getContractNo());
                    batsalesOpptProcessMgmtHistVO.setBeforeNo(lists.get(i).getBeforeNo());
                    batsalesOpptProcessMgmtHistVO.setcSeq(lists.get(i).getcSeq());

                    batSalesOpptProcessMgmtDAO.insertSalesOpptProcessMgmtHist(batsalesOpptProcessMgmtHistVO);

                    // 판매기회 담당자에게 TO-DO 추가.
                    insertSalesOpptProcessFailTodoToMngSc(lists.get(i).getCustNm(), lists.get(i).getCustNo(), lists.get(i).getLeadStatCd(), lists.get(i).getMngScId());

                    // 잠재고객 DB 담당자에게 TO-DO 추가.
                    insertSalesOpptProcessFailTodo(lists.get(i).getCustNm(), lists.get(i).getCustNo(), lists.get(i).getLeadStatCd(), lists.get(i).getDlrCd());

                }

                // dlrCd, autoTrsfConf로 LeadStatCd 상태 업데이트.
                Date toDay = new Date();
                BatSalesOpptProcessMgmtVO batSalesOpptProcessMgmtVO = new BatSalesOpptProcessMgmtVO();
                batSalesOpptProcessMgmtVO.setDlrCd(dlrCd);
                batSalesOpptProcessMgmtVO.setAutoTrsfConf(autoTrsfConf);
                batSalesOpptProcessMgmtVO.setLeadStatCd("08");
                batSalesOpptProcessMgmtVO.setTrsfTp("01");
                batSalesOpptProcessMgmtVO.setEvalCd("01");
                batSalesOpptProcessMgmtVO.setSubmitDt(toDay);
                batSalesOpptProcessMgmtVO.setBefLeadStatCd("04");  // 이전단계
                resultCnt = batSalesOpptProcessMgmtDAO.updateSalesOpptProcessMgmt(batSalesOpptProcessMgmtVO);

            }

        }
        return resultCnt;
    }

    /**
     * TO-DO를 등록한다. (잠재고객DB 'S' 권한자에게)
     */
    public void insertSalesOpptProcessFailTodo(String custNm, String custNo, String leadStatCd, String dlrCd) throws Exception {
        try {

            List<UserVO> lists = viewMappingService.selectViewMappingUsersByViewId(Constants.SYS_CD_DLR, "VIEW-D-10141", dlrCd, Constants.PERMISSION_SEARCHALL);

            if (lists !=null && lists.size() > 0) {

                List<UserVO> sysUserYnList = new ArrayList<UserVO>();
                for (UserVO userVO : lists) {
                    if ( "N".equals(userVO.getSysUserYn()) ) {
                        sysUserYnList.add(userVO);
                    }
                }

                String todoMsg = messageSource.getMessage("crm.info.failSubmitTodo" , new String[]{custNm} , Locale.CHINA );

                TodoInfoVO todoInfoVO = new TodoInfoVO();
                todoInfoVO.setTodoPolicyId("TD-P-00004");   // CRM0208
                todoInfoVO.setTodoDesc(todoMsg);
                todoInfoVO.setActionParams("custNo="+custNo+"&leadStatCd="+leadStatCd);
                todoInfoVO.setRegUsrId("SYSTEM");
                for (int i=0; i <sysUserYnList.size() ; i++) {
                    todoInfoVO.getAppendUsers().add(new TodoInfoAppendUserVO(sysUserYnList.get(i).getUsrId()));
                }

                todoInfoService.insertTodoInfo(todoInfoVO);

            }

        } catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }
    /**
     * TO-DO를 등록한다. (판매기회 담당자에게 TO-DO)
     */
    public void insertSalesOpptProcessFailTodoToMngSc(String custNm, String custNo, String leadStatCd, String mngScId) throws Exception {
        try {

            String todoMsg = "";

            TodoInfoVO todoInfoVO = new TodoInfoVO();
            todoMsg = messageSource.getMessage("crm.info.autoFailSubmitTodo" , new String[]{custNm} , Locale.CHINA );

            todoInfoVO.setTodoPolicyId("TD-P-00005");   // CRM0208
            todoInfoVO.setTodoDesc(todoMsg);
            todoInfoVO.setActionParams("custNo="+custNo+"&leadStatCd="+leadStatCd);
            todoInfoVO.setRegUsrId("SYSTEM");
            todoInfoVO.getAppendUsers().add(new TodoInfoAppendUserVO(mngScId));

            todoInfoService.insertTodoInfo(todoInfoVO);
        } catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }



}
