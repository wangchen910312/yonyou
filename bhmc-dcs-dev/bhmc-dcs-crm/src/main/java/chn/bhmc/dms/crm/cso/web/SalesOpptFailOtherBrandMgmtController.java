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
import chn.bhmc.dms.core.support.eai.EaiClient;
import chn.bhmc.dms.core.support.eai.EaiSimpleMessage;
import chn.bhmc.dms.core.support.eai.schema.CommDMSDoc;
import chn.bhmc.dms.crm.cso.service.SalesOpptFailOtherBrandMgmtService;
import chn.bhmc.dms.crm.cso.vo.SalesOpptFailOtherBrandMgmtSaveVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptFailOtherBrandMgmtSearchVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

/**
 * 판매기회 타브랜드 실패 차량 관리 컨트롤러
 *
 * @author liu jing
 * @since 2016.12.12.
 * @version 1.0
 * @see <pre>
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.12.12                  liu jing                    최초 생성
 * </pre>
 */

@Controller
public class SalesOpptFailOtherBrandMgmtController extends HController {
    /**
     * 판매기회 타브랜드 실패 차량 관리 서비스
     */
    @Resource(name="salesOpptFailOtherBrandMgmtService")
    SalesOpptFailOtherBrandMgmtService salesOpptFailOtherBrandMgmtService;
    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;

    @Resource(name="eaiClient")
    EaiClient eaiClient;

    /**
     * 판매기회 실패관리 차량 관리 상세 목록 update, insert, delete(no use).
     * 4.4.10.001-01
     * @param searchVO - 조회 조건을 포함하는 SalesOpptFailOtherBrandMgmtSaveVO
     * @return true/false
     */
    @RequestMapping(value = "/crm/cso/salesOpptFailOtherBrandMgmt/multiSalesOpptFailOtherBrandMgmtMain.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiSalesOpptFailOtherBrandMgmtMain(@Validated @RequestBody SalesOpptFailOtherBrandMgmtSaveVO saveVO) throws Exception {
        salesOpptFailOtherBrandMgmtService.multiSalesOpptFailOtherBrandMgmtMain(saveVO);
        return true;
    }

    /**
     * 판매기회 실패관리 차량 관리 상세 목록 상세정보 조회 한다.
     * 4.4.10.001-01
     * @param Model
     * @return URL
     */
    @RequestMapping(value = "/crm/cso/salesOpptFailOtherBrandMgmt/selectSalesOpptFailOtherBrandMgmtMain.do", method = RequestMethod.GET)
    public String selectSalesOpptFailOtherBrandMgmtMain(Model model) throws Exception {

        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        return "/crm/cso/salesOpptFailOtherBrandMgmt/selectSalesOpptFailOtherBrandMgmtMain";
    }



    /**
     * 만족도조사결과 배포한다.
     *
     * @param searchVO
     *            - 조회 조건을 포함하는 SatisFactionResultMgmtVO
     * @param model
     * @return
     */
    @RequestMapping(value = "/crm/cso/salesOpptFailOtherBrandMgmt/updateDistOpptFailOtherBrand.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateDistOpptFailOtherBrand() throws Exception {

        //프로시저 호출
        salesOpptFailOtherBrandMgmtService.updateDistOpptFailOtherBrand();

        //EAI 호출
        CommDMSDoc reqCommDMSDoc = new EaiSimpleMessage.Builder()
                                    .ifId("CRM422")
                                    .company("H")
                                    .sender("CRM")
                                    .build()
                                    .buildCommDMSDoc();
        eaiClient.sendRequest(reqCommDMSDoc);

        return 0;//satisFactionResultMgmtService.updateSatisFactionResultMgmt(saveVO);
    }



    /**
     * 판매기회 실패관리 상세 목록 데이터를 조회한다.
     * 4.4.10.001-01
     * @param searchVO - 조회 조건을 포함하는 SalesOpptFailOtherBrandMgmtSearchVO
     * @return VO
     */
    @RequestMapping(value = "/crm/cso/salesOpptFailOtherBrandMgmt/selectSalesOpptFailOtherBrandMgmts.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSalesOpptFailOtherBrandMgmts(Model model, @RequestBody SalesOpptFailOtherBrandMgmtSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setTotal(salesOpptFailOtherBrandMgmtService.selectSalesOpptFailOtherBrandMgmtsByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(salesOpptFailOtherBrandMgmtService.selectSalesOpptFailOtherBrandMgmtsByCondition(searchVO));
        }
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        carInfoSearchVO.setUseYn("Y");                       // 사용여부
        model.addAttribute("carlineCdList", carInfoService.selectCarListsByCondition(carInfoSearchVO));

        return result;
    }
}