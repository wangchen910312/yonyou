package chn.bhmc.dms.cmm.cmp.web;

import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.cmp.service.DealerService;
import chn.bhmc.dms.cmm.cmp.service.PlantService;
import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.PlantSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.StorageSaveVO;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * 창고 관리 컨트롤러
 *
 * @author Kang Seok Han
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.29         Kang Seok Han            최초 생성
 * </pre>
 */

@Controller
public class StorageController extends HController {

    /**
     * 창고 관리 서비스
     */
    @Resource(name="storageService")
    StorageService storageService;

    /**
     * 딜러 관리 서비스
     */
    @Resource(name="dealerService")
    DealerService dealerService;

    /**
     * 센터 관리 서비스
     */
    @Resource(name="plantService")
    PlantService plantService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
     * 창고 관리 메인 화면을 출력한다. - DCS
     * @return
     */
    @RequestMapping(value = "/cmm/cmp/storage/selectStorageMain.do", method = RequestMethod.GET)
    public String selectStorageMain(Model model) throws Exception {

        //창고유형
        List<CommonCodeVO> strgeTpList = commonCodeService.selectCommonCodesByCmmGrpCd("COM022", null, LocaleContextHolder.getLocale().getLanguage());
        model.addAttribute("strgeTpList", strgeTpList);
        model.addAttribute("pltCd", LoginUtil.getPltCd());

        return "/cmm/cmp/storage/selectStorageMain";
    }

    /**
     * 창고 관리 메인 화면을 출력한다. - DMS
     * @return
     */
    @RequestMapping(value = "/cmm/cmp/storage/selectStorageMain2.do", method = RequestMethod.GET)
    public String selectStorageMain2(Model model) throws Exception {

        //센터목록
//        PlantSearchVO searchVO = new PlantSearchVO();
//        searchVO.setsDlrCd(LoginUtil.getDlrCd());
//        List<PlantVO> plantList = plantService.selectPlantsByCondition(searchVO);

        //창고유형
        List<CommonCodeVO> strgeTpList = commonCodeService.selectCommonCodesByCmmGrpCd("COM022", null, LocaleContextHolder.getLocale().getLanguage());

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("pltCd", LoginUtil.getPltCd());
//        model.addAttribute("plantList", plantList);
        model.addAttribute("strgeTpList", strgeTpList);

        return "/cmm/cmp/storage/selectStorageMain2";
    }

    /**
     * 플랜트 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DealerSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/cmp/storage/selectPlants.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectPlants(@RequestBody PlantSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        searchVO.setFirstIndex(-1);
        result.setData(plantService.selectPlantsByCondition(searchVO));
        result.setTotal(result.getData().size());

        return result;

    }

    /**
     * 딜러 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DealerSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/cmp/storage/selectDealersForSuggest.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDealersForSuggest(@RequestBody DealerSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        result.setData(dealerService.selectDealersForSuggest(searchVO.getsText(), searchVO.getRecordCountPerPage()));
        result.setTotal(result.getData().size());
        return result;
    }

    /**
     * 창고 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StorageSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/cmp/storage/selectStorages.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectStorages(@RequestBody StorageSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(storageService.selectStoragesByConditionCnt(searchVO));

        if(result.getTotal() > 0){
            result.setData(storageService.selectStoragesByCondition(searchVO));
        }

        return result;

    }

    /**
     * 창고 정보를 등록한다.
     * @param saveVO - 창고정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/cmm/cmp/storage/multiStorages.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiStorages(@Validated @RequestBody StorageSaveVO saveVO) throws Exception {
        storageService.multiStorages(saveVO);
        return true;

    }

    /**
     * 창고 정보를 등록한다.
     * @param storageVO - 창고 정보 VO
     * @return
     *
    @RequestMapping(value = "/cmm/cmp/storage/insertStorage.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertStorage(@Validated(Draft.class) @RequestBody StorageVO storageVO) throws Exception {
        storageVO.setRegUsrId(LoginUtil.getUserId());
        storageService.insertStorage(storageVO);
        return true;
    }
    */

    /**
     * 창고 정보를 수정한다.
     * @param storageVO - 창고 정보 VO
     * @return
     *
    @RequestMapping(value = "/cmm/cmp/storage/updateStorage.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateStorage(@Validated(Modify.class) @RequestBody StorageVO storageVO) throws Exception {
        storageVO.setUpdtUsrId(LoginUtil.getUserId());
        storageService.updateStorage(storageVO);
        return true;
    }
    */

    /**
     * 창고 정보를 삭제한다.
     * @param storageVO - 창고 정보 VO
     * @return
     *
    @RequestMapping(value = "/cmm/cmp/storage/deleteStorage.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteStorage(@RequestBody StorageVO storageVO) throws Exception {
        storageService.deleteStorage(storageVO);
        return true;
    }
    */

}
