package chn.bhmc.dms.cmm.ptl.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.ptl.service.PortletService;
import chn.bhmc.dms.cmm.ptl.vo.PortletSaveVO;
import chn.bhmc.dms.cmm.ptl.vo.PortletSearchVO;
import chn.bhmc.dms.core.datatype.SearchResult;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PortletController.java
 * @Description : 포틀릿 관리 서비스 구현 클래스
 * @author Kang Seok Han
 * @since 2016. 4. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 9.     Kang Seok Han     최초 생성
 * </pre>
 */

@Controller
public class PortletController extends HController {

    /**
     * 포틀릿 관리 서비스
     */
    @Resource(name="portletService")
    PortletService portletService;

    /**
     * 포틀릿 관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/ptl/portlet/selectPortletMain.do", method = RequestMethod.GET)
    public String selectPortletMain() throws Exception {
        return "/cmm/ptl/portlet/selectPortletMain";
    }

    /**
     * 포틀릿 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PortletSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/ptl/portlet/selectPortlets.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPortlets(@RequestBody PortletSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(portletService.selectPortletsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(portletService.selectPortletsByCondition(searchVO));
        }

        return result;

    }

    /**
     * 포틀릿 정보를 등록한다.
     * @param saveVO - 포틀릿 레이아웃정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/cmm/ptl/portlet/multiPortlets.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiPortlets(@Validated @RequestBody PortletSaveVO saveVO) throws Exception {
        portletService.multiPortlets(saveVO);
        return true;

    }

    /**
     * 기본 포틀릿
     * @return
     */
    @RequestMapping(value = "/cmm/ptl/portlet/selectDefaultPortlet.do", method = RequestMethod.GET)
    public String selectDefaultPortlet(){
        return "/cmm/ptl/portlet/selectDefaultPortlet";
    }
}
