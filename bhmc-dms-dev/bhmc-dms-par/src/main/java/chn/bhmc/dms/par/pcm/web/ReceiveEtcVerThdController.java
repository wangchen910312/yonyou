package chn.bhmc.dms.par.pcm.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.util.fmt.StringUtil;
import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.StorageVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pcm.service.ReceiveEtcVerThdService;
import chn.bhmc.dms.par.pcm.vo.ReceiveEtcVO;
import chn.bhmc.dms.par.pcm.vo.ReceiveEtcVerThdSearchVO;

/**
 * 기초재고입고(정비수령) 컨트롤러
 *
 * @author In Bo Shim
 * @since 2017. 08. 08.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2017. 08. 08.     In Bo Shim      최초 생성
 * </pre>
 */
@Controller
public class ReceiveEtcVerThdController extends HController {

    /**
     * 기초재고입고(정비수령) 서비스
     */
    @Resource(name="receiveEtcVerThdService")
    ReceiveEtcVerThdService receiveEtcVerThdService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 창고 관리 서비스
     */
    @Resource(name="storageService")
    StorageService storageService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 기초재고입고(정비수령)
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/selectReceiveInitByVersionTrdDataMain.do", method = RequestMethod.GET)
    public String selectReceiveInitByVersionTrdDataMain(Model model)  throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        StorageSearchVO storageSearchVO = new StorageSearchVO();
        List<StorageVO> storageList = new ArrayList<StorageVO>();

        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        storageList = storageService.selectStoragesByCondition(storageSearchVO);

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", LoginUtil.getDlrCd());
        model.addAttribute("dlrNm", LoginUtil.getDlrNm());
        model.addAttribute("storageList", storageList);
        model.addAttribute("mvtTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR100", "Y", langCd));
        model.addAttribute("applyYnList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR503", "Y", langCd));

        return "/par/pcm/receive/selectReceiveInitByVersionTrdDataMain";
    }

    /**
     * 기초재고입고(정비수령) 데이타를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcVerThdSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pcm/receive/selectReceiveEtcVerThdesByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectReceiveEtcVerThdesByCondition(@RequestBody ReceiveEtcVerThdSearchVO searchVO) throws Exception
    {
        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        result.setTotal(receiveEtcVerThdService.selectReceiveEtcVerThdesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(receiveEtcVerThdService.selectReceiveEtcVerThdesByCondition(searchVO));
        }

        return result;
    }

    /**
     * 기초재고입고(정비수령)를 등록한다.
     * @return
    */
    @RequestMapping(value = "/par/pcm/receive/insertReceiveEtcVerThd.do", method = RequestMethod.POST)
    @ResponseBody
    public ReceiveEtcVO insertReceiveEtcVerThd(@Validated @RequestBody ReceiveEtcVO receiveEtcVO)  throws Exception {

        //기초재고입고 부품마스터 등록.
        ReceiveEtcVerThdSearchVO searchVO = new ReceiveEtcVerThdSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsApplyYn("N");
        searchVO.setsGrGiScheQtyZeroYn("Y");

        //1.기초재고V3 부품 부품마스터 없을 시 등록.
        if(receiveEtcVerThdService.selectReceiveEtcVerThdesItemMasterByConditionCnt(searchVO) > 0){
            receiveEtcVerThdService.insertReceiveEtcVerThdItemMaster(receiveEtcVO);
        }
        //기타입고정보 등록.
        receiveEtcVO = receiveEtcVerThdService.insertReceiveEtcVerThd(receiveEtcVO);
        //기초재고입고V3 프로시져(기타입고문서 생성 후 프로시져 실행)
        if(!StringUtil.isEmpty(receiveEtcVO.getEtcGrDocNo())){//기타입출고문서 있을 때 프로시져 실행.
            receiveEtcVerThdService.executeReceiveEtcInitProcedure(receiveEtcVO);
        }

        receiveEtcVO.setResultYn(true);

        return receiveEtcVO;
    }


}
