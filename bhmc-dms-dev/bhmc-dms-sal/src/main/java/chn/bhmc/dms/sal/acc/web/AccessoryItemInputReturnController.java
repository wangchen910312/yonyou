package chn.bhmc.dms.sal.acc.web;

import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.StorageVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.UnitInfoService;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * 용품입고 반품 관리
 *
 * @author Kang Seok Han
 * @since 2017. 02. 06.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2017. 2. 06.     Kang Seok Han      최초 생성
 * </pre>
 */
@Controller
public class AccessoryItemInputReturnController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 단위정보 관리 서비스
     */
    @Resource(name="unitInfoService")
    UnitInfoService unitInfoService;

    /**
     * 창고 관리 서비스
     */
    @Resource(name="storageService")
    StorageService storageService;

    /**
     * 용품 입고반품 관리 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/sal/acc/itemInputReturn/selectAccessoryItemInputReturnMain.do", method = RequestMethod.GET)
    public String selectAccessoryItemInputReturnMain(Model model)  throws Exception  {
        StorageSearchVO storageSearchVO = new StorageSearchVO();
        storageSearchVO.setsPltCd(LoginUtil.getPltCd());
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        List<StorageVO> storageList = storageService.selectStoragesByCondition(storageSearchVO);

        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd",              LoginUtil.getDlrCd());
        model.addAttribute("storageList",        storageList);

        return "/sal/acc/itemInputReturn/selectAccessoryItemInputReturnMain";
    }

    /**
     * 용품 입고반품 조회 팝업 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/sal/acc/itemInputReturn/selectAccessoryItemInputReturnSearchPopup.do", method = RequestMethod.GET)
    public String selectAccessoryItemInputReturnSearchPopup(Model model) throws Exception {
        String langCd = LocaleContextHolder.getLocale().getLanguage();

        Calendar calendar = Calendar.getInstance();

        //입고문서 조회종료일
        model.addAttribute("sRegDtTo", calendar.getTime());

        calendar.add(Calendar.DATE, -30);
        //입고문서 조회시작일
        model.addAttribute("sRegDtFr", calendar.getTime());

        model.addAttribute("mvtTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR100", "Y", langCd));
        model.addAttribute("statCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR402", "Y", langCd));

        return "/sal/acc/itemInputReturn/selectAccessoryItemInputReturnSearchPopup";
    }

    /**
     * 용품입고 반품현황 화면을 출력한다.
     * @return
     */
    @RequestMapping(value="/sal/acc/itemInputReturn/selectAccessoryItemInputReturnList.do", method = RequestMethod.GET)
    public String selectAccessoryItemInputReturnList(Model model) throws Exception {

        Calendar calendar = Calendar.getInstance();

        //입고문서 조회종료일
        model.addAttribute("sRegDtTo", calendar.getTime());

        calendar.add(Calendar.DATE, -30);
        //입고문서 조회시작일
        model.addAttribute("sRegDtFr", calendar.getTime());

        return "/sal/acc/itemInputReturn/selectAccessoryItemInputReturnList";
    }
}
