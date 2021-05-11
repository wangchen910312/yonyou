package chn.bhmc.dms.par.pmm.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.cmp.service.DealerService;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.CertificationFileService;
import chn.bhmc.dms.par.pmm.service.CertificationService;
import chn.bhmc.dms.par.pmm.vo.CertificationFileVO;
import chn.bhmc.dms.par.pmm.vo.CertificationSaveVO;
import chn.bhmc.dms.par.pmm.vo.CertificationSearchVO;
import chn.bhmc.dms.par.pmm.vo.CertificationVO;

/**
 * <pre>
 * 합격증 관리 컨트롤러
 * </pre>
 *
 * @author Eun Jung Jang
 * @since 2016. 5. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 25.     Eun Jung Jang     최초 생성
 * </pre>
 */

@Controller
public class CertificationController  extends HController {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 합격증 관리 서비스
     */
    @Resource(name="certificationService")
    CertificationService certificationService;

    /**
     * 합격증 파일 관리 서비스
     */
    @Resource(name="certificationFileService")
    CertificationFileService certificationFileService;

    /**
     * 딜러 관리 서비스
     */
    @Resource(name="dealerService")
    DealerService dealerService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 합격증 목록 데이터를 조회화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/par/pmm/certification/selectCertList.do", method = RequestMethod.GET)
    public String selectCertList(Model model) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        CertificationSearchVO certificationSearchVO = new CertificationSearchVO();
        certificationSearchVO.setsDlrCd(LoginUtil.getDlrCd());

        //합격증구분
        model.addAttribute("certTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR509", null, langCd));
        //합격증상태
        model.addAttribute("certStatList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR510", null, langCd));

        model.addAttribute("dlrCd", LoginUtil.getDlrCd());

        return "/par/pmm/certification/selectCertList";
    }

    /**
     * 합격증 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CertificationSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/certification/selectCertListByCondition.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectCertListByCondition(@RequestBody CertificationSearchVO searchVO) throws Exception  {

        SearchResult result = new SearchResult();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        result.setTotal(certificationService.selectCertListByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(certificationService.selectCertListByCondition(searchVO));
        }

        return result;
    }


    /**
     * 합격증 신청한다.
     * @return
     */
    @RequestMapping(value = "/par/pmm/certification/selectCertReqMain.do", method = RequestMethod.GET)
    public String selectCertReqMain(Model model,@RequestParam(value="pCertNo", defaultValue="") String pCertNo) throws Exception  {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        CertificationSearchVO certificationSearchVO = new CertificationSearchVO();
        certificationSearchVO.setsDlrCd(LoginUtil.getDlrCd());

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String sysDate     = DateUtil.getDate(dateFormat);
        //합격증구분
        model.addAttribute("certTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR509", null, langCd));
        //합격증상태
        model.addAttribute("certStatList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR510", null, langCd));
        //예아니오구분
        model.addAttribute("yesNoTpList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR244", null, langCd));

        model.addAttribute("preFixId",        "RE");
        model.addAttribute("dlrInfo",         dealerService.selectDealerByKey(LoginUtil.getDlrCd()));
        model.addAttribute("toDt",            sysDate);
        model.addAttribute("pCertNo",         pCertNo);
        model.addAttribute("preFixId",        "CA");
        //2018-11-27 update by weiyongjie 新增当前登陆人 start
        model.addAttribute("currentLoginName", LoginUtil.getUserNm());
       //2018-11-27 update by weiyongjie 新增当前登陆人 end

        return "/par/pmm/certification/selectCertReqMain";
    }


    /**
     * 합격증 등록한다.
     * @param searchVO - 조회 조건을 포함하는 CertificationSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/certification/insertCertReq.do", method = RequestMethod.POST)
    @ResponseBody
    public CertificationSaveVO insertCertReq(@Validated @RequestBody CertificationSaveVO saveVO) throws Exception  {

        saveVO.getCertificationVO().setDlrCd(LoginUtil.getDlrCd());
        saveVO.getCertificationVO().setRegUsrId(LoginUtil.getUserId());

        certificationService.insertCertReq(saveVO);

        return saveVO;
    }

    /**
     * 합격증 수정한다.
     * @param searchVO - 조회 조건을 포함하는 CertificationSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/certification/updateCertReq.do", method = RequestMethod.POST)
    @ResponseBody
    public CertificationSaveVO updateCertReq(@Validated @RequestBody CertificationSaveVO saveVO) throws Exception  {

        saveVO.getCertificationVO().setDlrCd(LoginUtil.getDlrCd());
        saveVO.getCertificationVO().setRegUsrId(LoginUtil.getUserId());

        certificationService.updateCertReq(saveVO);

        return saveVO;
    }

    /**
     * 합격증 신청 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CertificationSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/certification/selectCertReqByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public CertificationVO selectCertReqByKey(@RequestBody CertificationSearchVO certificationSearchVO) throws Exception  {


        CertificationVO certificationVO = new CertificationVO();
        certificationSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        certificationVO = certificationService.selectCertReqByKey(certificationSearchVO);
        //合格证申请 申请人信息默认是当前登录用户,申请人移动电话也是当前登录用户的手机号 update by lyy 2018-09-04 start 
        certificationVO.setCustNm(LoginUtil.getUserNm());
        certificationVO.setCustNo(LoginUtil.getUserId());
        //合格证申请 申请人信息默认是当前登录用户,申请人移动电话也是当前登录用户的手机号 update by lyy 2018-09-04 end
        return certificationVO;
    }

    /**
     * 합격증 신청 파일 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CertificationSearchVO
     * @return
     */
    @RequestMapping(value = "/par/pmm/certification/selectCertificationFileByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public CertificationFileVO selectCertificationFileByKey(@RequestBody CertificationSearchVO certificationSearchVO) throws Exception  {

        CertificationFileVO certificationFileVO = new CertificationFileVO();
        certificationSearchVO.setsDlrCd(LoginUtil.getDlrCd());

        certificationFileVO = certificationFileService.selectCertificationFileByKey(certificationSearchVO);

        if(certificationFileVO == null){
            certificationFileVO = new CertificationFileVO();
        }

        return certificationFileVO;
    }





}
