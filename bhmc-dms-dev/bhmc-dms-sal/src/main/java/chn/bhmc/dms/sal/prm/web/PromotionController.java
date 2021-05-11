package chn.bhmc.dms.sal.prm.web;


import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelReader;
import chn.bhmc.dms.core.support.excel.ExcelUploadStatus;
import chn.bhmc.dms.sal.prm.service.PromotionService;
import chn.bhmc.dms.sal.prm.vo.PromotionSaveVO;
import chn.bhmc.dms.sal.prm.vo.PromotionSearchVO;
import chn.bhmc.dms.sal.prm.vo.PromotionUploadSaveDTO;
import chn.bhmc.dms.sal.prm.vo.PromotionVO;
import chn.bhmc.dms.sal.veh.service.CarInfoService;
import chn.bhmc.dms.sal.veh.service.VehicleSpecModelService;
import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;



/**
 * 프로모션관리 처리화면
 *
 * @author Kim yewon
 * @since 2016. 2. 15
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  -------------    ------------    ---------------------------
 *   2016.02.15       Kim yewon             최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/prm/promotion")
public class PromotionController extends HController {

    /**
     * 프로모션 서비스
     */
    @Resource(name="promotionService")
    PromotionService promotionService;


    /**
     * 차량,모델,OCN, 로컬옵션 정보 서비스
     */
    @Resource(name="carInfoService")
    CarInfoService carInfoService;


    /**
     * 모델 서비스
     */
    @Resource(name="vehicleSpecModelService")
    VehicleSpecModelService vehicleSpecModelService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
     * 프로모션  View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectPromotionMain.do", method = RequestMethod.GET)
    public String selectPromotionMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        // 프로모션 유형 SAL010
        model.addAttribute("promotionTpInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL010", null, langCd));
        // 승인여부 SAL141
        model.addAttribute("approveCdInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL141", null, langCd));
        // 적용방법 SAL132
        model.addAttribute("applyTpInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL132", null, langCd));
        // 대상계약유형 SAL003
        model.addAttribute("contractTpInfo", commonCodeService.selectCommonCodesByCmmGrpCd("SAL003", null, langCd));
        // 프로모션주관 SAL026
        model.addAttribute("promotionOwnList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL026", null, langCd));

        //차종
        CarInfoSearchVO carInfoSearchVO = new CarInfoSearchVO();
        model.addAttribute("carlineNames", carInfoService.selectCarListsByCondition(carInfoSearchVO));


        return "/sal/prm/promotion/selectPromotionMain";
    }


    /**
     * 프로모션 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PromotionSearchVO
     * @return
     */
    @RequestMapping(value = "/selectPromotion.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPromotion(@RequestBody PromotionSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(promotionService.selectPromotionByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(promotionService.selectPromotionByCondition(searchVO));
        }

        return result;
    }


    /**
     * 프로모션 대상 고객을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PromotionSearchVO
     * @return
     */
    @RequestMapping(value = "/selectPromotionCust.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPromotionCust(@RequestBody PromotionSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        //result.setTotal(promotionService.selectPromotionByConditionCnt(searchVO));

        //if(result.getTotal() != 0){
            result.setData(promotionService.selectPromotionCustByCondition(searchVO));
        //}

        return result;
    }



    /**
     * 프로모션 조회차종 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PromotionSearchVO
     * @return
     */
    @RequestMapping(value = "/selectPromotionModel.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPromotionModel(@RequestBody CarInfoSearchVO searchVO) throws Exception {

        //searchVO.setUseYn("Y");                       // 사용여부

        SearchResult result = new SearchResult();
        result.setTotal(carInfoService.selectModelListsByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(carInfoService.selectModelListsByCondition(searchVO));
        }
        return result;
    }



    /**
     * 프로모션 대상차종 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PromotionSearchVO
     * @return
     */
    @RequestMapping(value = "/selectPromotionTargetModel.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPromotionTargetModel(@RequestBody PromotionSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        //result.setTotal(promotionService.selectPromotionByConditionCnt(searchVO));

        //if(result.getTotal() != 0){
            result.setData(promotionService.selectPromotionTargetModelByCondition(searchVO));
        //}

        return result;
    }


    /**
     * 프로모션 승인.
     * @param <PromotionVO>
     * @param PromotionVO promotionVO
     * @return SearchResult result
     */
    @RequestMapping(value = "/approvalReqPromotion.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean approvelReqPromotion(@RequestBody PromotionVO vo) throws Exception {

        promotionService.approvalReqPromotion(vo);

        return true;
    }



    /**
     * 프로모션 승인.
     * @param <PromotionVO>
     * @param PromotionVO promotionVO
     * @return SearchResult result
     */
    @RequestMapping(value = "/promotionApproval.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean promotionApproval(@RequestBody PromotionVO vo) throws Exception {

        promotionService.promotionApproval(vo);

        return true;
    }


    /**
     * 프로모션 삭제.
     * @param <PromotionVO>
     * @param PromotionVO promotionVO
     * @return SearchResult result
     */
    @RequestMapping(value = "/deletePromotion.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean deletePromotion(@RequestBody PromotionVO vo) throws Exception {

        promotionService.deletePromotion(vo);

        return true;
    }


    /**
     * 프로모션 정보 저장.
     * @param saveVO - Bay관리 정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/multiSavePromotion.do", method = RequestMethod.POST)
    public @ResponseBody boolean multiSavePromotion(@RequestBody PromotionSaveVO vo) throws Exception {

        if(vo.getPromotionVO().getPromotionCd().equals("")){
            promotionService.insertSavePromotion(vo);
        }else {
            promotionService.updateSavePromotion(vo);
        }
        return true;

    }


    /**
     * excel import popup
     * @param
     * @return String viewName
     */
    @RequestMapping(value="/uploadPopupMain.do", method = RequestMethod.GET)
    public String uploadMain(Model model) throws Exception {


        return "/sal/prm/promotion/uploadPopupMain";
    }



    @RequestMapping(value = "/insertPromotionCustUploadFile.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertMembershipCardUploadFile(
            @RequestParam("uploadFile") MultipartFile uploadFile,
            @RequestParam("progressId") String progressId,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        SearchResult result = new SearchResult();
        List<PromotionVO> list = new ArrayList<PromotionVO>();
        ExcelUploadStatus status = new ExcelUploadStatus();

        //업로드상태 정보를 세션에 저장한다.
        WebUtils.setSessionAttribute(request, progressId, status);
        if(uploadFile.getSize() > 0){

            try{
                ExcelReader<PromotionVO> excelReader = new ExcelReader<PromotionVO>(PromotionVO.class, uploadFile.getInputStream(), 0);
                excelReader.setMessageSource(messageSource);
                excelReader.setSkipRows(0);

                list = excelReader.readExcelData(status);

                result.setTotal(list.size());
                result.setData(list);

                status.setStep(ExcelUploadStatus.COMPLETED);
            }catch(ExcelDataBindingException e){
                log.error(e.getMessage(), e);
                status.addError(e.getRowNo(), e.getColNo(), e.getFieldValue(), e.getMessage());
            }catch(Exception e){
                log.error(e.getMessage(), e);
                status.addError(e.getMessage());
            }
        }

        return result;

    }






    /**
     * 메세지소스 일괄등록 데이터를 저장 한다.
     * @return
     */
    @RequestMapping(value = "/insertPromotionCustSave.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertPromotionCustSave(@RequestBody PromotionUploadSaveDTO promotionCustList) throws Exception {

        List<PromotionVO> list = promotionCustList.getPromotionCustList();
        String dlrCd = promotionCustList.getDlrCd();
        String promotionCd = promotionCustList.getPromotionCd();
        promotionService.insertPromotionCustUpload(list,dlrCd,promotionCd);

        return true;

    }




}
