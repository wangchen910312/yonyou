package chn.bhmc.dms.crm.cso.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.crm.cso.service.TestDriveClineService;
import chn.bhmc.dms.crm.cso.vo.TestDriveClineSaveVO;
import chn.bhmc.dms.crm.cso.vo.TestDriveClineSearchVO;

/**
 * 시승노선관리 컨트롤러
 *
 * @author in moon lee
 * @since 2016.05.12
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.05.12         in moon lee            최초 생성
 * </pre>
 */

@RequestMapping("/crm/cso/testDrive")
@Controller
public class TestDriveClineMgmtController extends HController {

    /**
     * 시승노선관리 서비스
     */
    @Resource(name="testDriveClineService")
    TestDriveClineService testDriveClineService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 시승노선관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectTestDriveClineMgmtMain.do", method = RequestMethod.GET)
    public String selectTestDriveClineMgmtMain(Model model) throws Exception {

        return "/crm/cso/testDrive/selectTestDriveClineMgmtMain";
    }

    /**
     * 시승노선관리 목록 데이터를 조회한다.
     * @return
     */
    @RequestMapping(value = "/selectTestDriveClines.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTestDriveClines(@RequestBody TestDriveClineSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        // TODO 목록
        result.setTotal(testDriveClineService.selectTestDriveClinesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(testDriveClineService.selectTestDriveClinesByCondition(searchVO));
        }

        return result;

    }

    /**
     * 시승노선관리를 저장한다.
     * @param TestDriveClineSaveVO - 시승노선정보
     * @return 저장된 목록수
     */
    @RequestMapping(value = "/multiTestDriveClineMgmt.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiTestDriveClineMgmt(@Validated @RequestBody TestDriveClineSaveVO saveVO)throws Exception {

        testDriveClineService.multiTestDriveClineMgmt(saveVO);
        return true;

    }


}