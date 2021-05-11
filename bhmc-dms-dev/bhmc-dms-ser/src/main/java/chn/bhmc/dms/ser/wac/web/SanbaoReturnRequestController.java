package chn.bhmc.dms.ser.wac.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import able.com.web.HController;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.FileMgrService;
import chn.bhmc.dms.cmm.sci.vo.FileDocVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.wac.service.SanbaoInfoService;
import chn.bhmc.dms.ser.wac.service.SanbaoReturnRequestService;
import chn.bhmc.dms.ser.wac.vo.SanbaoReturnSearchVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoReturnVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoReturnRequestController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 7. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 26.     Kwon ki hyun     최초 생성
 * </pre>
 */
@Controller
public class SanbaoReturnRequestController extends HController{

    @Resource(name="sanbaoReturnRequestService")
    SanbaoReturnRequestService sanbaoReturnRequestService;

    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    /**
     * 파일관리 서비스
     */
    @Autowired
    FileMgrService fileMgrService;


    /**
     * 삼포정보 서비스
     */
    @Autowired
    SanbaoInfoService sanbaoInfoService;

    /**
     * 공통코드 관리 서비스
     */
    @Autowired
    CommonCodeService commonCodeService;

    @RequestMapping(value="/ser/wac/sanbaoRtnReq/selectSanbaoReturnRequestMain.do" , method = RequestMethod.GET)
    public String selectSanbaoReturnRequestMain(Model model, HttpServletRequest request)throws Exception{

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        Device device = DeviceUtils.getCurrentDevice(request);

        // 공통코드 : 반품구분
        model.addAttribute("returnTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER212", null, langCd));

        // 공통코드 : 상태
        model.addAttribute("returnStatDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER213", null, langCd));

        // 공통코드 : 신청구분
        model.addAttribute("reqDstinTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER217", null, langCd));

        // 공통코드 : 증서유형
        model.addAttribute("mathDocTpDs", commonCodeService.selectCommonCodesByCmmGrpCd("CRM024", null, langCd));

        // 공통코드 : 부품그룹
        model.addAttribute("itemGrpDs", commonCodeService.selectCommonCodesByCmmGrpCd("SER209", null, langCd));

        //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 start
        //model.addAttribute("isTablet", device.isTablet());
        model.addAttribute("isTablet", device.isTablet()||device.isMobile());
        //20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 end
        return "/ser/wac/sanbaoRtnReq/selectSanbaoReturnRequestMain";
    }


    /**
     *
     * 삼포 반품신청 목록 조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/wac/sanbaoRtnReq/selectSanbaoReturnRequests.do",method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSanbaoReturnRequests(@RequestBody SanbaoReturnSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setTotal(sanbaoReturnRequestService.selectSanbaoReturnRequestByConditionCnt(searchVO));
        if(result.getTotal() != 0){
            result.setData(sanbaoReturnRequestService.selectSanbaoReturnRequestByCondition(searchVO));
        }

        return result;

    }

    /**
     *
     * 삼포반품 신청 상세 정보
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/wac/sanbaoRtnReq/selectSanbaoReturnRequestByKey.do",method=RequestMethod.POST)
    @ResponseBody
    public SanbaoReturnVO selectSanbaoReturnRequestByKey(@RequestBody SanbaoReturnSearchVO searchVO)throws Exception{

        return sanbaoReturnRequestService.selectSanbaoReturnRequestByKey(searchVO);
    }

    /**
     *
     * 삼포 부품 정보
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/wac/sanbaoRtnReq/selectSanbaoReturnRequestItems.do",method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSanbaoReturnRequestItems(@RequestBody SanbaoSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setData(sanbaoInfoService.selectSanbaoItemsByCondition(searchVO));

        result.setTotal(result.getData().size());


        return result;

    }

    /**
     *
     * 삼포 작업 정보
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/ser/wac/sanbaoRtnReq/selectSanbaoReturnRequestWorkInfos.do",method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSanbaoReturnRequestWorkInfos(@RequestBody SanbaoSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setData(sanbaoInfoService.selectSanbaoWorkInfoByCondition(searchVO));

        result.setTotal(result.getData().size());

        return result;

    }

    /**
     *
     * 삼포반품정보를 등록한다.
     *
     * @param returnVO
     * @return
     * @throws Exception
     */
    @RequestMapping( value="/ser/wac/sanbaoRtnReq/multiSanbaoReturnRequest.do" , method=RequestMethod.POST)
    @ResponseBody
    public int multiSanbaoReturnRequest(@Validated @RequestBody SanbaoReturnVO returnVO)throws Exception{

        int lineNo = sanbaoReturnRequestService.multiSanbaoReturnRequest(returnVO);

        String fileNo = returnVO.getFileKeyNm();
        if(StringUtils.isNotBlank(fileNo)){
            fileMgrService.updateFileDocEnabled(new FileDocVO(fileNo, LoginUtil.getUserId()));
        }


        return lineNo;

    }

}
