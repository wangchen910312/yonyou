package chn.bhmc.dms.cmm.sci.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.ChangeHistoryService;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.ChangeHistorySearchVO;
import chn.bhmc.dms.cmm.sci.vo.ChangeHistoryVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.datatype.SearchResult;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ChangeHistoryController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 5. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 12.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

@Controller
public class ChangeHistoryController extends HController {
    /**
     * 이력 관리 서비스
     */
    @Resource(name="changeHistoryService")
    ChangeHistoryService changeHistoryService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 시스템 변경 이력 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/sci/changeHistory/selectChangeHistoryMain.do", method = RequestMethod.GET)
    public String selectChangeHistoryMain(Model model) throws Exception {
        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 시스템
        List<CommonCodeVO> arrSystemTp = commonCodeService.selectCommonCodesByCmmGrpCd("COM036", null, langCd);
        // 작업 유형 (등록, 변경, 삭제)
        List<CommonCodeVO> arrWorkTp = commonCodeService.selectCommonCodesByCmmGrpCd("COM015", null, langCd);

        model.addAttribute("arrSystemTp", arrSystemTp);
        model.addAttribute("arrWorkTp", arrWorkTp);

        return "/cmm/sci/changeHistory/selectChangeHistoryMain";
    }

    @RequestMapping(value = "/cmm/sci/changeHistory/selectChangeHistory.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectChangeHistory(@RequestBody ChangeHistorySearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(changeHistoryService.selectChangeHistoryByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(changeHistoryService.selectChangeHistoryByCondition(searchVO));
        }

        return result;
    }

    @RequestMapping(value = "/cmm/sci/changeHistory/selectChangeHistoryDetailPopup.do", method = RequestMethod.GET)
    public String selectChangeHistoryDetailPopup(Model model) throws Exception {
        return "/cmm/sci/changeHistory/selectChangeHistoryDetailPopup";
    }

    @RequestMapping(value = "/cmm/sci/changeHistory/selectChangeHistoryByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectChangeHistoryByKey(@RequestBody ChangeHistorySearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        int loop = 0;

        List<ChangeHistoryVO> changeHistoryListVO = new ArrayList<ChangeHistoryVO>();
        ChangeHistoryVO changeHistoryVO = new ChangeHistoryVO();

        JSONObject json = new JSONObject();

        changeHistoryVO = changeHistoryService.selectChangeHistoryByKey(searchVO);

        if ("B".equals(searchVO.getsFlag())) {
            // 변경 전
            if (changeHistoryVO.getChgBefDataVal() != null) {
                Object obj = JSONValue.parse(changeHistoryVO.getChgBefDataVal());
                json = (JSONObject)obj;
            }
        }
        else {
            // 변경 후
            if (changeHistoryVO.getChgAftDataVal() != null) {
                Object obj = JSONValue.parse(changeHistoryVO.getChgAftDataVal());
                json = (JSONObject)obj;
            }
        }

        for (Object key : json.keySet()) {
            changeHistoryVO = new ChangeHistoryVO();

            String keyStr = (String)key;
            Object valueStr = json.get(keyStr);

            changeHistoryVO.setRnum(loop + 1);
            changeHistoryVO.setChgKey(keyStr);
            changeHistoryVO.setChgValue(valueStr.toString());

            changeHistoryListVO.add(changeHistoryVO);

            loop++;
        }

        result.setTotal(loop);

        if(result.getTotal() != 0){
            result.setData(changeHistoryListVO);
        }

        return result;
    }
}