package chn.bhmc.dms.crm.cmm.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.crm.cmm.service.CrmTargExtractService;
import chn.bhmc.dms.crm.cmm.service.dao.CrmTargExtractDAO;
import chn.bhmc.dms.crm.cmm.vo.CrmTargExtractSaveVO;
import chn.bhmc.dms.crm.cmm.vo.CrmTargExtractSearchVO;
import chn.bhmc.dms.crm.cmm.vo.CrmTargExtractVO;
import egovframework.rte.fdl.cmmn.exception.FdlException;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * 고객추출 관리 서비스 구현 클래스
 *
 * @author hyoung jun an
 * @since 2016. 3. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.04         hyoung jun an            최초 생성
 * </pre>
 */

@Service("crmTargExtractService")
public class CrmTargExtractServiceImpl extends HService implements CrmTargExtractService, JxlsSupport {

    @Resource(name="extrTermNoIdgenService")
    EgovIdGnrService extrTermNoIdgenService;

    /**
     * 대상자 고객 추출 관리 DAO
     */
    @Resource(name="crmTargExtractDAO")
    CrmTargExtractDAO crmTargExtractDAO;

    /**
     * 마케팅 캠페인 목록 수량 조회
     */
    @Override
    public int selectCrmTargExtractMastersByConditionCnt(CrmTargExtractSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
//        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

        return crmTargExtractDAO.selectCrmTargExtractMastersByConditionCnt(searchVO);
    }

    /**
     * 마케팅 캠페인 목록 조회
     */
    @Override
    public List<CrmTargExtractVO> selectCrmTargExtractMastersByCondition(CrmTargExtractSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
//        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

//        String langCd = LocaleContextHolder.getLocale().getLanguage();
//        searchVO.setLangCd(langCd);

        return crmTargExtractDAO.selectCrmTargExtractMastersByCondition(searchVO);
    }

    /**
     * 마케팅 캠페인 목록 수량 조회
     */
    @Override
    public int selectCrmTargExtractDetailsByConditionCnt(CrmTargExtractSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
//        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        searchVO.setLangCd(langCd);

        return crmTargExtractDAO.selectCrmTargExtractDetailsByConditionCnt(searchVO);
    }

    /**
     * 마케팅 캠페인 목록 조회
     */
    @Override
    public List<CrmTargExtractVO> selectCrmTargExtractDetailsByCondition(CrmTargExtractSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
//        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

//        String langCd = LocaleContextHolder.getLocale().getLanguage();
//        searchVO.setLangCd(langCd);

        return crmTargExtractDAO.selectCrmTargExtractDetailsByCondition(searchVO);
    }

    /**
     * 고객추출 상세 페이지 키 조회
     */
    @Override
    public List<CrmTargExtractVO> selectCrmTargExtractDetailKeys(CrmTargExtractSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
//        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

//        String langCd = LocaleContextHolder.getLocale().getLanguage();
//        searchVO.setLangCd(langCd);

        return crmTargExtractDAO.selectCrmTargExtractDetailKeys(searchVO);
    }

    /**
     * 고객추출 상세 페이지 값 조회
     */
    @Override
    public List<CrmTargExtractVO> selectCrmTargExtractDetails(CrmTargExtractSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
//        if (StringUtils.isEmpty(searchVO.getsPltCd())){searchVO.setsPltCd(LoginUtil.getPltCd());}

//        String langCd = LocaleContextHolder.getLocale().getLanguage();
//        searchVO.setLangCd(langCd);

        return crmTargExtractDAO.selectCrmTargExtractDetails(searchVO);
    }

    /**
     * 도시코드 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     */
    @Override
    public List<CrmTargExtractVO> selectCityListByCondition(CrmTargExtractSearchVO searchVO) throws Exception {
        return crmTargExtractDAO.selectCityListByCondition(searchVO);
    }

    /**
     * 지역코드 데이터를 조회한다. 공통으로 DropdownList에서 쓰기위함. (중복 모델 display 방지)
     */
    @Override
    public List<CrmTargExtractVO> selectDistListByCondition(CrmTargExtractSearchVO searchVO) throws Exception {
        return crmTargExtractDAO.selectDistListByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectNextPurcOrdNo()
     */
    @Override
    public String selectNextExtrTermNo() throws Exception {
        try {
            return extrTermNoIdgenService.getNextStringId();
        } catch (FdlException e) {
            throw processException("global.err.idgen", new String[]{messageSource.getMessage("par.lbl.purcOrd", null, LocaleContextHolder.getLocale())});
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public CrmTargExtractVO multiTargExtracts(CrmTargExtractSaveVO saveVO) throws Exception {

        CrmTargExtractVO   crmTargExtractVO = saveVO.getExtractList();
        CrmTargExtractVO   crmTargExtractRlt = new CrmTargExtractVO();

        String userId = LoginUtil.getUserId();

        crmTargExtractVO.setRegUsrId(userId);
        crmTargExtractVO.setUpdtUsrId(userId);

        Map<String,Object> map = selectCrmTargExtractDetailDupByCondition(saveVO);          // 중복된 추출조건 조회
        //String crmTargDup = selectCrmTargExtractDetailDupByCondition(saveVO);          // 중복된 추출조건 조회
        String crmTargDup = (String) map.get("custExtrTermNo");
        String chkDigit = String.valueOf(map.get("chkDigit"));

        // 중복된 추출조건 조회
        crmTargExtractRlt.setDetlExtrTermCdTermVal(chkDigit);
        if (!"EXTRTERMNO".equals(crmTargDup)) {
            //throw processException("crm.info.dupMsg", new String[]{messageSource.getMessage("crm.lbl.rcpeExtrSeqCondition", null, LocaleContextHolder.getLocale())});
            crmTargExtractRlt.setCustExtrTermNo(crmTargDup);
            //crmTargExtractRlt.setDetlExtrTermCdTermVal("DUPLICATION");
        } else {
            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(crmTargExtractVO.getDlrCd())){crmTargExtractVO.setDlrCd(LoginUtil.getDlrCd());}

            if("".equals(crmTargExtractVO.getCustExtrTermNo())){
                crmTargExtractVO.setCustExtrTermNo(selectNextExtrTermNo());
                crmTargExtractDAO.insertCrmTargExtractMaster(crmTargExtractVO);
            }else{
                crmTargExtractDAO.updateCrmTargExtractMaster(crmTargExtractVO);
            }

            multiTargExtractExs(saveVO, crmTargExtractVO.getCustExtrTermNo(), crmTargExtractVO.getDlrCd());

            crmTargExtractRlt.setCustExtrTermNo(crmTargExtractVO.getCustExtrTermNo());
        }
        return crmTargExtractRlt;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiTargExtractExs(CrmTargExtractSaveVO saveVO, String gsCustExtrTermNo, String gsDlrCd) throws Exception {

        String userId = LoginUtil.getUserId();
        List<CrmTargExtractVO>  obj = saveVO.getExtractSaveList();

        CrmTargExtractVO tempVO = new CrmTargExtractVO();

        tempVO.setDlrCd(gsDlrCd);
        tempVO.setCustExtrTermNo(gsCustExtrTermNo);

        //추출조건번호에 해당하는 데이터를 삭제한다
        crmTargExtractDAO.deleteCrmTargExtractDetail(tempVO);

        for(CrmTargExtractVO crmTargExtractVO : obj){

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */
            if (StringUtils.isEmpty(crmTargExtractVO.getDlrCd())){crmTargExtractVO.setDlrCd(LoginUtil.getDlrCd());}

            if(!"CRM7500102".equals(crmTargExtractVO.getDetlExtrTermCd()) && !"CRM7500105".equals(crmTargExtractVO.getDetlExtrTermCd()) && !"CRM7500106".equals(crmTargExtractVO.getDetlExtrTermCd()) &&
               !"CRM7500108".equals(crmTargExtractVO.getDetlExtrTermCd()) && !"CRM7500110".equals(crmTargExtractVO.getDetlExtrTermCd()) && !"CRM7500150".equals(crmTargExtractVO.getDetlExtrTermCd()) &&
               !"CRM7500212".equals(crmTargExtractVO.getDetlExtrTermCd()) && !"CRM7500213".equals(crmTargExtractVO.getDetlExtrTermCd()) && !"CRM7500214".equals(crmTargExtractVO.getDetlExtrTermCd()) &&
               !"CRM7500319".equals(crmTargExtractVO.getDetlExtrTermCd()) && !"CRM7500323".equals(crmTargExtractVO.getDetlExtrTermCd()) && !"CRM7500355".equals(crmTargExtractVO.getDetlExtrTermCd()) &&
               !"CRM7500351".equals(crmTargExtractVO.getDetlExtrTermCd()) && !"CRM7500352".equals(crmTargExtractVO.getDetlExtrTermCd()) &&
               !"CRM7500425".equals(crmTargExtractVO.getDetlExtrTermCd()) && !"CRM7500457".equals(crmTargExtractVO.getDetlExtrTermCd()) &&
               !"CRM7500426".equals(crmTargExtractVO.getDetlExtrTermCd()) && !"CRM7500428".equals(crmTargExtractVO.getDetlExtrTermCd()) && !"CRM7500432".equals(crmTargExtractVO.getDetlExtrTermCd()) &&
               !"CRM7500533".equals(crmTargExtractVO.getDetlExtrTermCd()) && !"CRM7500534".equals(crmTargExtractVO.getDetlExtrTermCd()) && !"CRM7500535".equals(crmTargExtractVO.getDetlExtrTermCd()) &&
               !"CRM7500536".equals(crmTargExtractVO.getDetlExtrTermCd()) && !"CRM7500537".equals(crmTargExtractVO.getDetlExtrTermCd()) && !"CRM7500538".equals(crmTargExtractVO.getDetlExtrTermCd()) &&
               !"CRM7500539".equals(crmTargExtractVO.getDetlExtrTermCd()) && !"CRM7500640".equals(crmTargExtractVO.getDetlExtrTermCd()) && !"CRM7500748".equals(crmTargExtractVO.getDetlExtrTermCd()) &&
               !"CRM7500153".equals(crmTargExtractVO.getDetlExtrTermCd()) && !"CRM7500154".equals(crmTargExtractVO.getDetlExtrTermCd()) && !"CRM7500456".equals(crmTargExtractVO.getDetlExtrTermCd())
               ){

                if("CRM7500104".equals(crmTargExtractVO.getDetlExtrTermCd())){
                    StringTokenizer st = new StringTokenizer(crmTargExtractVO.getTermVal1(),"|");
                    while(st.hasMoreTokens()){
                        crmTargExtractVO.setTermVal1(st.nextToken());
                        crmTargExtractVO.setTermVal2(st.nextToken());
                        crmTargExtractVO.setTermVal3(st.nextToken());
                        crmTargExtractVO.setTermVal4(st.nextToken());
                    }
                }else if("CRM7500359".equals(crmTargExtractVO.getDetlExtrTermCd())){
                    StringTokenizer st = new StringTokenizer(crmTargExtractVO.getTermVal1(),"|");
                    while(st.hasMoreTokens()){
                        crmTargExtractVO.setTermVal1(st.nextToken());
                        crmTargExtractVO.setTermVal2(st.nextToken());
                        crmTargExtractVO.setTermVal3(st.nextToken());
                    }
                }else{
                    StringTokenizer st = new StringTokenizer(crmTargExtractVO.getTermVal1(),"|");
                    while(st.hasMoreTokens()){
                        crmTargExtractVO.setTermVal1(st.nextToken());
                        crmTargExtractVO.setTermVal2(st.nextToken());
                    }
                }
            }

            crmTargExtractVO.setCustExtrTermNo(gsCustExtrTermNo);
            crmTargExtractVO.setRegUsrId(userId);
            crmTargExtractVO.setUpdtUsrId(userId);

            //추출조건번호에 해당하는 조건데이터를 신규생성한다.
            crmTargExtractDAO.insertCrmTargExtractDetail(crmTargExtractVO);
/*
            // 신규데이터 유무 판별
            if("Y".equals(gsNew)){
                crmTargExtractVO.setCustExtrTermNo(gsCustExtrTermNo);
                crmTargExtractVO.setRegUsrId(userId);
                crmTargExtractVO.setUpdtUsrId(userId);

                crmTargExtractDAO.insertCrmTargExtractDetail(crmTargExtractVO);
            }else{
                CrmTargExtractSearchVO searchVO = new CrmTargExtractSearchVO();

                searchVO.setsDlrCd(crmTargExtractVO.getDlrCd());
                searchVO.setsCustExtrTermNo(gsCustExtrTermNo);
                searchVO.setsDetlExtrTermCd(crmTargExtractVO.getDetlExtrTermCd());

                //신규데이터가 아니더라도 상세조건이 존재하는지 체크한다.
                int cnt = crmTargExtractDAO.selectCrmTargExtractDetailSavesByConditionCnt(searchVO);

                //기존에 조건이 존재하면 업데이트. 조건이 없으면 신규생성 한다.
                if(cnt > 0){
                    crmTargExtractVO.setCustExtrTermNo(gsCustExtrTermNo);
                    crmTargExtractVO.setUpdtUsrId(userId);

                    crmTargExtractDAO.updateCrmTargExtractDetail(crmTargExtractVO);
                }else{
                    crmTargExtractVO.setCustExtrTermNo(gsCustExtrTermNo);
                    crmTargExtractVO.setRegUsrId(userId);
                    crmTargExtractVO.setUpdtUsrId(userId);

                    crmTargExtractDAO.insertCrmTargExtractDetail(crmTargExtractVO);
                }
            }
*/
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void deleteTargExtract(CrmTargExtractVO crmTargExtractVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(crmTargExtractVO.getDlrCd())){crmTargExtractVO.setDlrCd(LoginUtil.getDlrCd());}

        CrmTargExtractSearchVO searchVO = new CrmTargExtractSearchVO();

        searchVO.setsDlrCd(crmTargExtractVO.getDlrCd());
        searchVO.setsCustExtrTermNo(crmTargExtractVO.getCustExtrTermNo());

        int cnt = crmTargExtractDAO.selectCrmTargExtractDeleteByConditionCnt(searchVO);

        if(cnt > 0){
            //해당 추출조건은 다른업무에서 사용하고 있으므로 삭제할 수 없습니다.
            throw processException("crm.err.noDelCustTargExtrNo");
        }else{
            crmTargExtractDAO.deleteCrmTargExtractMaster(crmTargExtractVO);
            crmTargExtractDAO.deleteCrmTargExtractDetail(crmTargExtractVO);
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public CrmTargExtractVO selectTargetExtractSaveExcel(CrmTargExtractVO crmTargExtractVO) throws Exception {

        crmTargExtractDAO.selectTargetExtractSaveExcel(crmTargExtractVO);

        return crmTargExtractVO;
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        CrmTargExtractSearchVO searchVO = new CrmTargExtractSearchVO();

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        List<CrmTargExtractVO> list = selectTargExtractsByCondition(searchVO);

        crmTargExtractDAO.deleteTemp01(searchVO);
        crmTargExtractDAO.deleteTemp02(searchVO);

        context.putVar("items", list);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectTargExtractsByConditionCnt(CrmTargExtractSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return crmTargExtractDAO.selectTargExtractsByConditionCnt(searchVO);
    }
    /**
     * {@inheritDoc}
     */
    @Override
    public List<CrmTargExtractVO> selectTargExtractsByCondition(CrmTargExtractSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        searchVO.setLangCd(LoginUtil.getLangCd());

        return crmTargExtractDAO.selectTargExtractsByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<CrmTargExtractVO> selectTargExtractListByCondition(CrmTargExtractSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return crmTargExtractDAO.selectTargExtractListByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<CrmTargExtractVO> selectCampaignListByCondition(CrmTargExtractSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return crmTargExtractDAO.selectCampaignListByCondition(searchVO);
    }





    /**
     * {@inheritDoc}
     */
    @Override
    public void deleteTempList(CrmTargExtractSearchVO searchVO) throws Exception {

        crmTargExtractDAO.deleteTemp01(searchVO);
        crmTargExtractDAO.deleteTemp02(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cmm.service.CrmTargExtractService#selectCrmTargExtractDetailDupByCondition(chn.bhmc.dms.crm.cmm.vo.CrmTargExtractSearchVO)
     */
    @Override
    public Map<String, Object> selectCrmTargExtractDetailDupByCondition(CrmTargExtractSaveVO saveVO)
            throws Exception {

        CrmTargExtractSearchVO crmTargExtractSearchVO = new CrmTargExtractSearchVO();

        //if (StringUtils.isEmpty(salesOpptProcessMgmtHistVO.getDlrCd())){salesOpptProcessMgmtHistVO.setDlrCd(LoginUtil.getDlrCd());}
        String custExtrTermNo = "EXTRTERMNO";
        String detlExtrTermCdTermValSrc;
        String detlExtrTermCdTermValTarg;
        String dlrCd = LoginUtil.getDlrCd();
        int cnt;
        int chkCnt = 0;
        boolean chkYn = true;
        int chkDigit = 0;   // 0 중복없음       1: 제목중복      2: 상세설정중복        3:제목+상세설정 중복
        List<CrmTargExtractVO> crmTargExtractVOList = new ArrayList<CrmTargExtractVO>();

        // 제목 중복 체크
        crmTargExtractSearchVO.setsDlrCd(dlrCd);
        crmTargExtractSearchVO.setsCustExtrTermNmDup(saveVO.getExtractList().getCustExtrTermNm());
        if(StringUtils.isNotEmpty(saveVO.getExtractList().getCustExtrTermNo())) {
            crmTargExtractSearchVO.setsCustExtrTermNo(saveVO.getExtractList().getCustExtrTermNo());
            crmTargExtractSearchVO.setsCustExtrTermNoDeny(saveVO.getExtractList().getCustExtrTermNo());
        }

        // 1. 제목 중복 체크
        int custExtrTermNmCnt = selectCrmTargExtractMastersByConditionCnt(crmTargExtractSearchVO);

        if (custExtrTermNmCnt != 0){
            // 제목 중복
            crmTargExtractVOList = selectCrmTargExtractMastersByCondition(crmTargExtractSearchVO);
            custExtrTermNo = crmTargExtractVOList.get(0).getCustExtrTermNo();
            chkDigit = 1; // 제목중복
        }

        // 2. 상세조건 중복 체크
        List<CrmTargExtractVO>  obj = saveVO.getExtractSaveList();

        cnt = obj.size();

        crmTargExtractSearchVO.setConditionCnt(cnt);
        crmTargExtractSearchVO.setsDlrCd(dlrCd);

        // 추출조건의 개수와 동일한 개수의 추출 조건을 조회한다.
        crmTargExtractVOList = crmTargExtractDAO.selectCrmTargExtractDetailDupByCondition(crmTargExtractSearchVO);

        for(CrmTargExtractVO crmTargExtractVO : crmTargExtractVOList){   // for crmTargExtractVOList Start
            cnt = crmTargExtractVO.getCnt();
            detlExtrTermCdTermValTarg = crmTargExtractVO.getDetlExtrTermCdTermVal();  // 추출코드+값

            chkYn = true;
            for(CrmTargExtractVO crmTargExtractObjList : obj){   // for crmTargExtractObjList Start. 화면에서 선택한 추출 조건

                if (chkYn) {
                    detlExtrTermCdTermValSrc = crmTargExtractObjList.getDetlExtrTermCd()+crmTargExtractObjList.getTermVal1();
                    if (StringUtils.isNotBlank(crmTargExtractObjList.getTermVal2())) {
                        detlExtrTermCdTermValSrc += crmTargExtractObjList.getTermVal2();
                    }
                    if (StringUtils.isNotBlank(crmTargExtractObjList.getTermVal3())) {
                        detlExtrTermCdTermValSrc += crmTargExtractObjList.getTermVal3();
                    }
                    if (StringUtils.isNotBlank(crmTargExtractObjList.getTermVal4())) {
                        detlExtrTermCdTermValSrc += crmTargExtractObjList.getTermVal4();
                    }
                    if (StringUtils.isNotBlank(crmTargExtractObjList.getTermVal5())) {
                        detlExtrTermCdTermValSrc += crmTargExtractObjList.getTermVal5();
                    }

                    detlExtrTermCdTermValSrc = detlExtrTermCdTermValSrc.replace("|", "");
                    detlExtrTermCdTermValSrc = detlExtrTermCdTermValSrc.replace("-", "");

                    if (detlExtrTermCdTermValSrc.equals(detlExtrTermCdTermValTarg)) {  // 저정된 조건과 화면에서 선택한 조건의 비교
                        crmTargExtractVO.setUseYn("T");
                        chkYn = false;
                    } else {
                        crmTargExtractVO.setUseYn("F");
                        chkYn = true;
                    }
                }
            }  // for crmTargExtractObjList End
        }   // for crmTargExtractVOList End

        chkYn = true;
        for(CrmTargExtractVO crmTargExtractVO : crmTargExtractVOList){   // for crmTargExtractVOList Start

            if (chkYn) {
                if("T".equals(crmTargExtractVO.getUseYn())){
                    chkCnt++;
                } else {
                    chkCnt = 0;
                }
                if (cnt == chkCnt) {
                    custExtrTermNo = crmTargExtractVO.getCustExtrTermNo();
                    chkYn = false;
                    if (chkDigit == 0) {
                        chkDigit = 2; // 상세정보중복
                    } else {
                        chkDigit = chkDigit + 2; // 제목중복
                    }

                }
            }
        }    // for crmTargExtractVOList End

        Map<String,Object> map = new HashMap<String,Object>();

        map.put("custExtrTermNo", custExtrTermNo);
        map.put("chkDigit", chkDigit);

        return map;
    }

    /**
     * 추출 조건 사용카운트
     */
    @Override
    public int selectCrmTargExtractDeleteByConditionCnt(CrmTargExtractSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return crmTargExtractDAO.selectCrmTargExtractDeleteByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cmm.service.CrmTargExtractService#updateCrmTargExtractMaster(chn.bhmc.dms.crm.cmm.vo.CrmTargExtractVO)
     */
    @Override
    public int updateCrmTargExtractMaster(CrmTargExtractVO crmTargExtractVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */
        if (StringUtils.isEmpty(crmTargExtractVO.getDlrCd())){crmTargExtractVO.setDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(crmTargExtractVO.getUpdtUsrId())){crmTargExtractVO.setUpdtUsrId(LoginUtil.getUserId());}

        // 제목 중복 체크
        CrmTargExtractSearchVO crmTargExtractSearchVO = new CrmTargExtractSearchVO();
        crmTargExtractSearchVO.setsCustExtrTermNm(crmTargExtractVO.getCustExtrTermNm());
        int custExtrTermNmCnt = selectCrmTargExtractMastersByConditionCnt(crmTargExtractSearchVO);

        if (custExtrTermNmCnt != 0){
            throw processException("crm.info.dupMsg", new String[]{messageSource.getMessage("crm.lbl.custExtrTermTitle", null, LocaleContextHolder.getLocale())});
        }

        return crmTargExtractDAO.updateCrmTargExtractMaster(crmTargExtractVO);
    }

    /**
     * 만족도 조사 - 정비 대상자를 추출한다.
     * @param CrmTargExtractVO - saveVO
     * @return 프로시저 결과
     */
    @Override
    public CrmTargExtractVO selectTargetExtractSaveFromService(CrmTargExtractVO saveVO) {

        crmTargExtractDAO.selectTargetExtractSaveFromService(saveVO);

        return saveVO;
    }

}