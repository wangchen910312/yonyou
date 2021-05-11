package chn.bhmc.dms.sal.veh.web;

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

import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.LoginUtil;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;

import chn.bhmc.dms.sal.veh.vo.Slv2DlrOrgVO;
import chn.bhmc.dms.sal.veh.vo.Slv2DlrOrgSearchVO;
import chn.bhmc.dms.sal.veh.service.Slv2DlrOrgService;
/**
 * <pre>
 * 기준정보 > 2급딜러 관리
 * </pre>
 *
 * @ClassName   : Slv2DlrOrgController.java
 * @Description : 기준정보 > 2급딜러 관리
 * @author chibeom.song
 * @since 2017. 2. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 17.   chibeom.song     최초 생성
 * </pre>
 */
@Controller
public class Slv2DlrOrgController extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 부가세영수증관리 서비스
     */
    @Resource(name="slv2DlrOrgService")
    Slv2DlrOrgService slv2DlrOrgService;

    /**
     * 기준정보 > 2급딜러 관리
     * @return
     */
    @RequestMapping(value = "/sal/veh/receipt/selectSaleSlv2DlrOrgMgmt.do", method = RequestMethod.GET)
    public String selectSaleSlv2DlrOrgMgmt(Model model) throws Exception {

        model.addAttribute("dlrCd",    LoginUtil.getDlrCd());
        model.addAttribute("regUsrId", LoginUtil.getUserId());

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        model.addAttribute("sdlrTpList", commonCodeService.selectCommonCodesByCmmGrpCd("SAL203", null, langCd));

        return "/sal/veh/receipt/selectSaleSlv2DlrOrgMgmt";
    }

    /**
     * 기준정보 > 2급딜러 관리 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 Slv2DlrOrgSearchVO
     * @return
     */
    @RequestMapping(value = "/sal/veh/receipt/selectSaleSlv2DlrOrgMgmtSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSaleSlv2DlrOrgMgmtSearch(@RequestBody Slv2DlrOrgSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드
        searchVO.setLangCd(LocaleContextHolder.getLocale().getLanguage());

        result.setTotal(slv2DlrOrgService.selectSaleSlv2DlrOrgMgmtSearchCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(slv2DlrOrgService.selectSaleSlv2DlrOrgMgmtSearchData(searchVO));
        }

        return result;

    }

    /**
     * 기준정보 > 2급딜러 관리 데이터를 등록한다.
     * @param searchVO - 조회 조건을 포함하는 Slv2DlrOrgVO
     * @return
     */
    @RequestMapping(value = "/sal/veh/receipt/insertSaleSlv2DlrOrgMgmtSave.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertSaleSlv2DlrOrgMgmtSave(@Validated @RequestBody Slv2DlrOrgVO saveVO) throws Exception {

        saveVO.setRegUsrId(LoginUtil.getUserId());
        saveVO.setUpdtUsrId(LoginUtil.getUserId());

        slv2DlrOrgService.insertSaleSlv2DlrOrgMgmtSave(saveVO);
        return true;
    }

    /**
     * 기준정보 > 2급딜러 관리 데이터를 상세조회
     * @param searchVO - 조회 조건을 포함하는 Slv2DlrOrgVO
     * @return
     */
    @RequestMapping(value = "/sal/veh/receipt/selectSaleSlv2DlrOrgMgmtDetail.do", method = RequestMethod.POST)
    @ResponseBody
    public Slv2DlrOrgVO selectSaleSlv2DlrOrgMgmtDetail(@RequestBody Slv2DlrOrgSearchVO searchVO) throws Exception {

        Slv2DlrOrgVO result = new Slv2DlrOrgVO();

        searchVO.setLangCd(LocaleContextHolder.getLocale().getLanguage());

        result = slv2DlrOrgService.selectSaleSlv2DlrOrgMgmtDetail(searchVO);

        return result;
    }

    /**
     * 기준정보 > 2급딜러 관리 데이터를 수정한다.
     * @param searchVO - 조회 조건을 포함하는 Slv2DlrOrgVO
     * @return
     */
    @RequestMapping(value = "/sal/veh/receipt/updateSaleSlv2DlrOrgMgmtSave.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateSaleSlv2DlrOrgMgmtSave(@Validated @RequestBody Slv2DlrOrgVO saveVO) throws Exception {

        saveVO.setUpdtUsrId(LoginUtil.getUserId());

        slv2DlrOrgService.updateSaleSlv2DlrOrgMgmtSave(saveVO);
        return true;
    }

}
