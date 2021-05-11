package chn.bhmc.dms.cmm.cmp.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.cmp.service.DealerService;
import chn.bhmc.dms.cmm.cmp.service.PlantService;
import chn.bhmc.dms.cmm.cmp.service.StorageManagerService;
import chn.bhmc.dms.cmm.cmp.vo.StorageManagerSaveVO;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * 창고담당자관리 컨트롤러
 *
 * @author In Bo Shim
 * @since 2017. 2. 17.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.02.17         In Bo Shim            최초 생성
 * </pre>
 */

@Controller
public class StorageManagerController extends HController {

    /**
     * 창고 관리 서비스
     */
    @Resource(name="storageManagerService")
    StorageManagerService storageManagerService;

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
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;


    /**
     * 창고관리자 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DealerSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/cmp/storage/selectStorgeManageres.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectStorgeManageres(@RequestBody StorageSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(storageManagerService.selectStorageManageresByConditionCnt(searchVO));

        if(result.getTotal() > 0){
            result.setData(storageManagerService.selectStorageManageresByCondition(searchVO));
        }

        return result;

    }

    /**
     * 창고 정보를 등록한다.
     * @param saveVO - 창고정보 등록/수정/삭제 목록을 포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/cmm/cmp/storage/multiStorageManageres.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiStorageManageres(@Validated @RequestBody StorageManagerSaveVO storageManagerSaveVO) throws Exception {
        storageManagerService.multiStorageManageres(storageManagerSaveVO);
        return true;

    }
}
