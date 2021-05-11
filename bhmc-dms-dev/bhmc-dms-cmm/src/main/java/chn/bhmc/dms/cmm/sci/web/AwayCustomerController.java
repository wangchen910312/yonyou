package chn.bhmc.dms.cmm.sci.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.AwayCustomerService;
import chn.bhmc.dms.cmm.sci.vo.AwayCustomerSaveVO;
import chn.bhmc.dms.cmm.sci.vo.AwayCustomerSearchVO;
import chn.bhmc.dms.cmm.sci.vo.AwayCustomerVO;
import chn.bhmc.dms.core.datatype.SearchResult;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AwayCustomerController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 4. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 22.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

@Controller
public class AwayCustomerController extends HController {
    /**
     * 자리 비움 예약 서비스
     */
    @Resource(name="awayCustomerService")
    AwayCustomerService awayCustomerService;

    /**
     * 자리 비움 예약  메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/sci/awayCustomer/selectAwayCustomerMain.do", method = RequestMethod.GET)
    public String selectAwayCustomerMain(Model model) throws Exception {
        return "/cmm/sci/awayCustomer/selectAwayCustomerMain";
    }

    @RequestMapping(value = "/cmm/sci/awayCustomer/selectAwayCustomer.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAwayCustomer(@RequestBody AwayCustomerSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        int loop = 0;
        int revStartH = 0;
        int revEndH = 0;

        String revDt = "";

        Map<String, Object> map = new HashMap<String, Object>();

        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        List<AwayCustomerVO> customer = new ArrayList<AwayCustomerVO>();

        result.setTotal(awayCustomerService.selectAwayCustomerByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            customer = awayCustomerService.selectAwayCustomerByCondition(searchVO);

            for (AwayCustomerVO item : customer) {
                if ("".equals(revDt)) {
                    revDt = item.getStrRevDt();
                }

                if (!(revDt).equals(item.getStrRevDt()) ) {
                    revDt = item.getStrRevDt();
                    list.add(loop, map);

                    map = new HashMap<String, Object>();

                    loop++;
                }

                revStartH = Integer.parseInt(item.getRevStartHm().split(":")[0]);
                revEndH = Integer.parseInt(item.getRevEndHm().split(":")[0]);

                map.put("rnum", loop + 1);
                map.put("revDt", item.getStrRevDt());

                for (int i = revStartH; i < revEndH; i++) {
                    map.put(item.getStrRevDt() + " " + i, item.getStrRevDt() + " " + item.getRevStartHm() + "~" + item.getRevEndHm());
                }
            }

            list.add(loop, map);

            result.setData(list);
        }

        return result;
    }

    @RequestMapping(value = "/cmm/sci/awayCustomer/selectAwayCustomerWritePopup.do", method = RequestMethod.GET)
    public String selectAwayCustomerWritePopup(Model model) throws Exception {
        return "/cmm/sci/awayCustomer/selectAwayCustomerWritePopup";
    }

    @RequestMapping(value = "/cmm/sci/awayCustomer/selectAwayCustomerByPk.do", method = RequestMethod.POST)
    @ResponseBody
    public AwayCustomerVO selectAwayCustomerByPk(@RequestBody AwayCustomerSearchVO searchVO) throws Exception {
        AwayCustomerVO result = new AwayCustomerVO();

        result = awayCustomerService.selectAwayCustomerByPk(searchVO);

        return result;
    }

    @RequestMapping(value = "/cmm/sci/awayCustomer/insertAwayCustomer.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertAwayCustomer(@Validated @RequestBody AwayCustomerVO saveVO) throws Exception {
        AwayCustomerSearchVO searchVO = new AwayCustomerSearchVO();

        searchVO.setsRevDt(saveVO.getRevNewDt());
        searchVO.setsRevStartHm(saveVO.getRevNewStartHm().substring(0, 2));
        searchVO.setsRevEndHm(saveVO.getRevNewEndHm().substring(0, 2));

        if (awayCustomerService.selectAwayCustomerByOverLap(searchVO) > 0) {
            return false;
        }

        awayCustomerService.insertAwayCustomer(saveVO);

        return true;
    }

    @RequestMapping(value = "/cmm/sci/awayCustomer/updateAwayCustomer.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateAwayCustomer(@Validated @RequestBody AwayCustomerVO saveVO) throws Exception {
        AwayCustomerSearchVO searchVO = new AwayCustomerSearchVO();

        searchVO.setsRevDt(saveVO.getRevNewDt());
        searchVO.setsRevStartHm(saveVO.getRevNewStartHm().substring(0, 2));
        searchVO.setsRevEndHm(saveVO.getRevNewEndHm().substring(0, 2));

        if (awayCustomerService.selectAwayCustomerByOverLap(searchVO) > 0) {
            return false;
        }

        awayCustomerService.updateAwayCustomer(saveVO);

        return true;
    }

    @RequestMapping(value = "/cmm/sci/awayCustomer/deleteAwayCustomer.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteAwayCustomer(@Validated @RequestBody AwayCustomerVO saveVO) throws Exception {
        boolean result = false;

        result = awayCustomerService.deleteAwayCustomer(saveVO);

        return result;
    }

    @RequestMapping(value = "/cmm/sci/awayCustomer/multiAwayCustomer.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiAwayCustomer(@Validated @RequestBody AwayCustomerSaveVO saveVO) throws Exception {
        boolean result = false;

        result = awayCustomerService.multiAwayCustomer(saveVO);

        return result;
    }
}