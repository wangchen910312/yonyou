package chn.bhmc.dms.crm.cso.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.core.util.LoginUtil;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.crm.cso.service.TraceGradeMgmtService;
import chn.bhmc.dms.crm.cso.vo.TraceGradeMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.TraceGradeMgmtVO;

/**
 * <pre>
 * 추적 등급별 다음 추적일 설정 컨트롤러
 * </pre>
 *
 * @ClassName   : TraceGradeMgmtController.java
 * @Description : TraceGradeMgmtController
 * @author Jin Choi
 * @since 2017. 2. 2.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 2.     Jin Choi     최초 생성
 * </pre>
 */

@Controller
public class TraceGradeMgmtController extends HController {

    /**
     * 추적 등급별 다음 추적일 관리 서비스
     */
    @Resource(name="traceGradeMgmtService")
    TraceGradeMgmtService traceGradeMgmtService;

    /**
     * 추적 등급별 다음 추적일 설정 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/cso/traceGradeMgmt/selectTraceGradeMgmtMain.do", method = RequestMethod.GET)
    public String selectTraceGradeMgmtMain (Model model ) throws Exception {

        return "/crm/cso/traceGradeMgmt/selectTraceGradeMgmtMain";
    }

    @RequestMapping(value = "/crm/cso/traceGradeMgmt/selectTraceGrade.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTraceGrade(@RequestBody TraceGradeMgmtSearchVO searchVO) throws Exception {
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        searchVO.setsLangCd(langCd);
        SearchResult result = new SearchResult();

        // 딜러셋팅
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        result.setTotal(traceGradeMgmtService.selectTraceGradeMgmtsByCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(traceGradeMgmtService.selectTraceGradeMgmts(searchVO));
        }

        return result;
    }

    @RequestMapping(value = "/crm/cso/traceGradeMgmt/multiTraceGrade.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multitraceGrade(@RequestBody BaseSaveVO<TraceGradeMgmtVO> saveVO) throws Exception {
        traceGradeMgmtService.multiTraceGrade(saveVO);
        return true;
    }

}
