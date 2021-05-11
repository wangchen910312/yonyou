package chn.bhmc.dms.mob.ser.cmm.web;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServiceCommonPopupController.java
 * @Description : 서비스 팝업 컨트롤러
 * @author Sung sin Park
 * @since 2016. 2. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 22.     Sung sin Park     최초 생성
 * </pre>
 */
@Controller
public class MobServiceCommonSubListController extends HController{

    @RequestMapping(value="/mob/ser/cmm/selectSubListCustomerDemand.do", method = RequestMethod.GET)
    public String selectSubListCustomerDemand(Model model
            ,@RequestParam(value="fromWhere",    required = false, defaultValue="") String fromWhere) throws Exception {
        model.addAttribute("fromWhere", fromWhere);
        return "/mob/ser/cmm/selectSubListCustomerDemand";
    }
    @RequestMapping(value="/mob/ser/cmm/selectSubListLabors.do", method = RequestMethod.GET)
    public String selectSubListLabors(Model model
            ,@RequestParam(value="fromWhere",    required = false, defaultValue="") String fromWhere) throws Exception {
        String template="";
        if(fromWhere.equals("selectWorkHistoryMain")){
            template="list-template2";
        }else{
            template="list-template1";
        }
        model.addAttribute("template", template);
        model.addAttribute("fromWhere", fromWhere);
        return "/mob/ser/cmm/selectSubListLabors";
    }
    @RequestMapping(value="/mob/ser/cmm/selectSubListParts.do", method = RequestMethod.GET)
    public String selectSubListParts(Model model
            ,@RequestParam(value="fromWhere",    required = false, defaultValue="") String fromWhere) throws Exception {

        String template="";
        if(fromWhere.equals("selectReservationReceiptMain")){
            template="list-template1";
        }else if(fromWhere.equals("selectPartReservationMain")){
            template="list-template2";
        }else if(fromWhere.equals("selectWorkHistoryMain")){
            template="list-template3";
        }else if(fromWhere.equals("selectEstimateListMain")){
            template="list-template1";
        }else if(fromWhere.equals("selectCalculateMain")){
            template="list-template1";
        }
        model.addAttribute("template", template);
        model.addAttribute("fromWhere", fromWhere);
        return "/mob/ser/cmm/selectSubListParts";
    }
    @RequestMapping(value="/mob/ser/cmm/selectSubListEtcIssues", method = RequestMethod.GET)
    public String selectSubListEtcIssues(Model model
            ,@RequestParam(value="fromWhere",    required = false, defaultValue="") String fromWhere) throws Exception {
        model.addAttribute("fromWhere", fromWhere);
        return "/mob/ser/cmm/selectSubListEtcIssues";
    }


//khskhs newmobile
    @RequestMapping(value="/mob/ser/cmm/_selectSubListCustomerDemand.do", method = RequestMethod.GET)
    public String _selectSubListCustomerDemand(Model model
            ,@RequestParam(value="fromWhere",    required = false, defaultValue="") String fromWhere) throws Exception {
        model.addAttribute("fromWhere", fromWhere);
        return "/ZnewMob/ser/cmm/selectSubListCustomerDemand";
    }
    @RequestMapping(value="/mob/ser/cmm/_selectSubListLabors.do", method = RequestMethod.GET)
    public String _selectSubListLabors(Model model
            ,@RequestParam(value="fromWhere",    required = false, defaultValue="") String fromWhere) throws Exception {
        String template="";
        if(fromWhere.equals("selectWorkHistoryMain")){
            template="list-template2";
        }else{
            template="list-template1";
        }
        model.addAttribute("template", template);
        model.addAttribute("fromWhere", fromWhere);
        return "/mob/ser/cmm/selectSubListLabors";
    }
    @RequestMapping(value="/mob/ser/cmm/_selectSubListParts.do", method = RequestMethod.GET)
    public String _selectSubListParts(Model model
            ,@RequestParam(value="fromWhere",    required = false, defaultValue="") String fromWhere) throws Exception {

        String template="";
        if(fromWhere.equals("_selectReservationReceiptMain")){
            template="list-template1";
        }else if(fromWhere.equals("_selectPartReservationMain")){
            template="list-template2";
        }else if(fromWhere.equals("_selectWorkHistoryMain")){
            template="list-template3";
        }else if(fromWhere.equals("_selectEstimateListMain")){
            template="list-template1";
        }else if(fromWhere.equals("_selectCalculateMain")){
            template="list-template1";
        }
        model.addAttribute("template", template);
        model.addAttribute("fromWhere", fromWhere);
        return "/mob/ser/cmm/selectSubListParts";
    }
    @RequestMapping(value="/mob/ser/cmm/_selectSubListEtcIssues", method = RequestMethod.GET)
    public String _selectSubListEtcIssues(Model model
            ,@RequestParam(value="fromWhere",    required = false, defaultValue="") String fromWhere) throws Exception {
        model.addAttribute("fromWhere", fromWhere);
        return "/mob/ser/cmm/selectSubListEtcIssues";
    }
}
