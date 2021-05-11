package chn.bhmc.dms.bat.crm.cso.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.DateUtil;

import chn.bhmc.dms.bat.crm.cso.service.BatSalesOpptProcessMgmtService;
import chn.bhmc.dms.bat.crm.cso.service.BatSalesOpptProcessSubmitCtrlService;
import chn.bhmc.dms.bat.crm.cso.service.dao.BatSalesOpptDAO;
import chn.bhmc.dms.bat.crm.cso.service.dao.BatSalesOpptProcessMgmtDAO;
import chn.bhmc.dms.bat.crm.cso.service.dao.BatSalesOpptTraceMgmtDAO;
import chn.bhmc.dms.bat.crm.cso.vo.BatSalesOpptTraceMgmtSearchVO;
import chn.bhmc.dms.bat.crm.cso.vo.BatSalesOpptTraceMgmtVO;
import chn.bhmc.dms.cmm.cmp.service.DealerService;
import chn.bhmc.dms.cmm.nms.service.TodoInfoService;
import chn.bhmc.dms.cmm.nms.vo.TodoInfoAppendUserVO;
import chn.bhmc.dms.cmm.nms.vo.TodoInfoVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;

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
@Service("batSalesOpptProcessMgmtService")
public class BatSalesOpptProcessMgmtServiceImpl extends HService implements BatSalesOpptProcessMgmtService {

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
     * batSalesOpptTraceMgmtDAO
     */
    @Resource(name="batSalesOpptTraceMgmtDAO")
    BatSalesOpptTraceMgmtDAO batSalesOpptTraceMgmtDAO;

    /**
     * batSalesOpptProcessSubmitCtrlService
     */
    @Resource(name="batSalesOpptProcessSubmitCtrlService")
    BatSalesOpptProcessSubmitCtrlService batSalesOpptProcessSubmitCtrlService;

    @Resource(name="todoInfoService")
    TodoInfoService todoInfoService;

    /*
     * @see chn.bhmc.dms.bat.crm.cso.service.BatSalesOpptProcessMgmtService#insertSalesOpptProcessNextTraceAlm()
     */
    @Override
    public int insertSalesOpptProcessNextTraceAlm() throws Exception {
        int resultCnt = 0;

        BatSalesOpptTraceMgmtSearchVO batSalesOpptTraceMgmtSearchVO = new BatSalesOpptTraceMgmtSearchVO();
        batSalesOpptTraceMgmtSearchVO.setsAlarmSet("Y");

        resultCnt = batSalesOpptTraceMgmtDAO.selectSalesOpptTraceMgmtsByConditionCnt(batSalesOpptTraceMgmtSearchVO);

        if (resultCnt != 0) {
            List<BatSalesOpptTraceMgmtVO> lists = new ArrayList<BatSalesOpptTraceMgmtVO>();

            lists = batSalesOpptTraceMgmtDAO.selectSalesOpptTraceMgmtsByCondition(batSalesOpptTraceMgmtSearchVO);

            if (lists.size() != 0) {

                String todoMsg = "";
                String custNm = "";
                String usrId = "";
                String nextTraceDt = "";
                String nextTraceMthNm = "";
                String custNo = "";
                String leadStatCd = "";

                for (int i=0; i <lists.size() ; i++) {
                    todoMsg = "";
                    custNm = lists.get(i).getCustNm();
                    usrId = lists.get(i).getRegUsrId();
                    custNo = lists.get(i).getCustNo();
                    leadStatCd = lists.get(i).getLeadStatCd();
                    nextTraceDt = DateUtil.convertToString(lists.get(i).getNextTraceDt(), "yyyy-MM-dd HH:mm");
                    nextTraceMthNm = lists.get(i).getNextTraceMthNm();

                    todoMsg = messageSource.getMessage("crm.info.nextTraceTodo" , new String[]{ custNm, nextTraceDt, nextTraceMthNm} , Locale.CHINA );
                    //todoMsg += messageSource.getMessage("crm.info.customerCallNoti" , new String[]{ custNm } , Locale.CHINA );

                    TodoInfoVO todoInfoVO = new TodoInfoVO();
                    todoInfoVO.setTodoPolicyId("TD-P-00001");
                    todoInfoVO.setTodoDesc(todoMsg);
                    //todoInfoVO.setActionParams("param1=value1&param2=value2");
                    todoInfoVO.setActionParams("custNo="+custNo+"&leadStatCd="+leadStatCd);
                    todoInfoVO.setRegUsrId("SYSTEM");
                    todoInfoVO.getAppendUsers().add(new TodoInfoAppendUserVO(usrId));

                    todoInfoService.insertTodoInfo(todoInfoVO);

                }
            }
        }

        return resultCnt;
    }



}
