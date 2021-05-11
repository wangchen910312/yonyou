package chn.bhmc.dms.mob.cmm.web;

import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.ath.service.ViewInfoService;
import chn.bhmc.dms.cmm.ath.vo.FavoritesVO;
import chn.bhmc.dms.core.Constants;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;


/**
 * 모바일 공통 관리 컨트롤러
 *
 * @author Kim In
 * @since 2016. 3. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *  수정일                        수정자                      수정내용
 *  -------------    ------------    ---------------------------
 *  2016.03.18       Kim In          최초 생성
 * </pre>
 */
@Controller
@RequestMapping(value = "/mob/cmm/common")
public class MobCommonController extends HController {

    /**
     * 화면정보 관리 서비스
     */
    @Resource(name="viewInfoService")
    ViewInfoService viewInfoService;


    /**
     * 달력 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectCalendarPopup.do", method = RequestMethod.GET)
    public String selectCalendarPopup(Model model) throws Exception  {

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());

        return "/mob/cmm/common/selectCalendarPopup";
    }

    /**
     * 월 선택용 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectMonthPopup.do", method = RequestMethod.GET)
    public String selectMonthPopup(Model model) throws Exception  {
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());

        return "/mob/cmm/common/selectMonthPopup";
    }

    /**
     * 시간 선택용 팝업 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectTimePopup.do", method = RequestMethod.GET)
    public String selectTimePopup(Model model) throws Exception  {

        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        // 로그인 정보: 딜러코드
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());

        return "/mob/cmm/common/selectTimePopup";
    }


    /**
     * 준비중입니다. 화면 로드
     * @return
     */
    @RequestMapping(value = "/selectWorking.do", method = RequestMethod.GET)
    public String selectWorking(Model model) throws Exception  {
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        model.addAttribute("userId", mobLoginVO.getUserId());
        model.addAttribute("userNm", mobLoginVO.getUserNm());
        model.addAttribute("dlrCd", mobLoginVO.getDlrCd());
        model.addAttribute("dlrNm", mobLoginVO.getDlrNm());

        return "/mob/cmm/common/selectWorking";
    }




    /*
    * 즐겨찾기 정보를 등록한다.
    * @param favoriteVO - 즐겨찾기 정보
    * @param bindingResult
    * @return
    */
   @RequestMapping(value = "/insertFavorite.do", method = RequestMethod.POST)
   @ResponseBody
   public boolean insertFavorite(@RequestParam("viewId") String viewId) throws Exception {
       MobLoginVO mobLoginVO = MobUtil.getLoginVO();
       viewInfoService.insertFavorite(viewId, mobLoginVO.getUserId());

       return true;
   }

   /**
    * 즐겨찾기 정보를 삭제한다.
    * @param favoritesVO - 즐겨찾기 정보
    * @param bindingResult
    * @return
    */
   @RequestMapping(value = "/deleteFavorite.do", method = RequestMethod.POST)
   @ResponseBody
   public boolean deleteFavorite(@RequestParam("viewId") String viewId) throws Exception {
       MobLoginVO mobLoginVO = MobUtil.getLoginVO();
       viewInfoService.deleteFavorite(viewId, mobLoginVO.getUserId());
       return true;
   }

   /**
    * 즐겨찾기 목록 데이터를 조회한다.
    * @param viewInfoVO - 조회 조건을 포함하는 ViewInfoVO
    * @return
    */
   @RequestMapping(value = "/selectFavorites.do", method = RequestMethod.POST)
   @ResponseBody
   public List<FavoritesVO> selectFavorites(@RequestParam(value="webMobileDstinCd", defaultValue=Constants.WEB_MOBILE_DSTIN_CD_WEB) String webMobileDstinCd) throws Exception {
       MobLoginVO mobLoginVO = MobUtil.getLoginVO();
       List<FavoritesVO> list = viewInfoService.selectFavorites(webMobileDstinCd, mobLoginVO.getUserId(), LocaleContextHolder.getLocale().getLanguage());

       for(FavoritesVO favoritesVO : list){
           if(!StringUtils.isBlank(favoritesVO.getMesgKey())){
               favoritesVO.setViewNm(messageSource.getMessage(favoritesVO.getMesgKey(), null, favoritesVO.getViewNm(), LocaleContextHolder.getLocale()));
           }
       }

       return list;
   }


}
