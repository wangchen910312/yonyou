package chn.bhmc.dms.crm.cso.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.crm.cso.service.TestDriveCarService;
import chn.bhmc.dms.crm.cso.vo.TestDriveCarSaveVO;
import chn.bhmc.dms.crm.cso.vo.TestDriveCarSearchVO;

/**
 * 시승차량 상태관리 컨트롤러
 *
 * @author in moon lee
 * @since 2016.04.26.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.04.26         in moon lee            최초 생성
 * </pre>
 */

@RequestMapping("/crm/cso/testDrive")
@Controller
public class TestDriveCarMgmtController extends HController {

    /**
     * 시승 차량 관리 서비스
     */
    @Resource(name="testDriveCarService")
    TestDriveCarService testDriveCarService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 시승차량 상태관리 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectTestDriveCarMgmtMain.do", method = RequestMethod.GET)
    public String selectTestDriveCarMgmtMain(Model model) throws Exception {
        // TODO 이인문 그냥 jsp만 만들어놈. 추후 개발 예정
        return "/crm/cso/testDrive/selectTestDriveCarMgmtMain";
    }

    /**
     * 시승차량 상태관리 목록 데이터를 조회한다.
     * @param carId
     * @return
     */
    @RequestMapping(value = "/selectTestDriveCarsMgmt.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTestDriveCarsMgmt(@RequestBody TestDriveCarSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(testDriveCarService.selectTestDriveCarsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(testDriveCarService.selectTestDriveCarsByCondition(searchVO));
        }

        return result;

    }


    /**
     * 시승차량 관리 상태를 수정한다.
     * @param TestDriveCarVO - 시승차량 정보
     * @return 수정된 목록수
     */
    @RequestMapping(value = "/updateTestDriveCarMgmt.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateTestDriveCarMgmt(@RequestBody TestDriveCarSaveVO saveVO)throws Exception {

        testDriveCarService.updateTestDriveCarMgmt(saveVO);
        return true;

    }


}