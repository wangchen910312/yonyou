package chn.bhmc.dms.par.pmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeSearchVO;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.SafetyStockSettingService;
import chn.bhmc.dms.par.pmm.service.SafetyStockWeightService;
import chn.bhmc.dms.par.pmm.service.SupplyRuleService;
import chn.bhmc.dms.par.pmm.service.dao.SafetyStockSettingDAO;
import chn.bhmc.dms.par.pmm.vo.SaftyStockSearchVO;
import chn.bhmc.dms.par.pmm.vo.SaftyStockSettingSaveVO;
import chn.bhmc.dms.par.pmm.vo.SaftyStockSettingVO;
import chn.bhmc.dms.par.pmm.vo.SaftyStockWeightVO;
import chn.bhmc.dms.par.pmm.vo.SupplyRulePivotVO;
import chn.bhmc.dms.par.pmm.vo.SupplyRuleSearchVO;
import chn.bhmc.dms.par.pmm.vo.SupplyRuleVO;

/**
 * SafetyStockSettingServiceImpl
 *
 * @author In Bo Shim
 * @since 2016. 5. 03.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 5. 03.     In Bo Shim      최초 생성
 * </pre>
 */
@Service("safetyStockSettingService")
public class SafetyStockSettingServiceImpl extends HService implements SafetyStockSettingService {

    /**
     * 적정재고 설정 서비스
     */
    @Resource(name="safetyStockSettingDAO")
    private SafetyStockSettingDAO safetyStockSettingDAO;

    /**
     * 적정재고 가중치 서비스
     */
    @Resource(name="safetyStockWeightService")
    SafetyStockWeightService safetyStockWeightService;

    /**
     * 공급률 서비스
     */
    @Resource(name="supplyRuleService")
    SupplyRuleService supplyRuleService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /*
     * @see chn.bhmc.dms.par.pmm.service.SafetyStockSettingService#insertSaftyStockSetting(chn.bhmc.dms.par.pmm.vo.SaftyStockSettingVO)
     */
    @Override
    public int insertSafetyStockSetting(SaftyStockSettingVO saftyStockSettingVO) throws Exception {
        saftyStockSettingVO.setDlrCd(LoginUtil.getDlrCd());
        saftyStockSettingVO.setPltCd(LoginUtil.getPltCd());
        saftyStockSettingVO.setRegUsrId(LoginUtil.getUserId());
        return safetyStockSettingDAO.insertSafetyStockSetting(saftyStockSettingVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.SafetyStockSettingService#multiSafetyStockSetting(chn.bhmc.dms.par.pmm.vo.SaftyStockSettingVO)
     */
    @Override
    public void multiSafetyStockSetting(SaftyStockSettingVO saftyStockSettingVO) throws Exception {

        saftyStockSettingVO.setDlrCd(LoginUtil.getDlrCd());
        saftyStockSettingVO.setPltCd(LoginUtil.getPltCd());
        saftyStockSettingVO.setRegUsrId(LoginUtil.getUserId());
        saftyStockSettingVO.setUpdtUsrId(LoginUtil.getUserId());

        SaftyStockSearchVO searchVO = new SaftyStockSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsStdDmndPrid(saftyStockSettingVO.getStdDmndPrid());

        if(safetyStockSettingDAO.selectSafetyStockSettingsByConditionCnt(searchVO) > 0){
            //update SaftyStockSettingVO
            safetyStockSettingDAO.updateSafetyStockSetting(saftyStockSettingVO);

        }else{
            //insert SaftyStockSettingVO
            safetyStockSettingDAO.insertSafetyStockSetting(saftyStockSettingVO);
        }
        /*
         *
         * 안전재고 파라미터 신규 추가 시 가중치 정보 추가.
         *
         * */
        SaftyStockWeightVO saftyStockWeightVO01 = new SaftyStockWeightVO();
        saftyStockWeightVO01.setDlrCd(LoginUtil.getDlrCd());
        saftyStockWeightVO01.setPltCd(LoginUtil.getPltCd());
        saftyStockWeightVO01.setDmndPrid(saftyStockSettingVO.getStdDmndPrid());//기준수요기간
        saftyStockWeightVO01.setLineNo(1);
        saftyStockWeightVO01.setRate1(0.0);
        saftyStockWeightVO01.setRate2(0.0);
        saftyStockWeightVO01.setRate3(0.0);
        saftyStockWeightVO01.setRate4(0.0);
        saftyStockWeightVO01.setRate5(0.0);
        saftyStockWeightVO01.setRate6(0.0);
        saftyStockWeightVO01.setRate7(0.0);
        saftyStockWeightVO01.setRate8(0.0);
        saftyStockWeightVO01.setRate9(0.0);
        saftyStockWeightVO01.setRate10(0.0);
        saftyStockWeightVO01.setRate11(0.0);
        saftyStockWeightVO01.setRate12(0.0);
        saftyStockWeightVO01.setRate13(0.0);
        saftyStockWeightVO01.setRate14(0.0);
        saftyStockWeightVO01.setRate15(0.0);
        saftyStockWeightVO01.setRate16(0.0);
        saftyStockWeightVO01.setRate17(0.0);
        saftyStockWeightVO01.setRate18(0.0);
        saftyStockWeightVO01.setRate19(0.0);
        saftyStockWeightVO01.setRate20(0.0);
        saftyStockWeightVO01.setRate21(0.0);
        saftyStockWeightVO01.setRate22(0.0);
        saftyStockWeightVO01.setRate23(0.0);
        saftyStockWeightVO01.setRate24(0.0);
        saftyStockWeightVO01.setUseYn("Y");
        saftyStockWeightVO01.setRegUsrId(LoginUtil.getUserId());

        //1번 가중치
        searchVO.setsLineNo(1);
        if(safetyStockWeightService.selectSafetyStockWeightsByConditionCnt(searchVO) == 0){
            safetyStockWeightService.insertSafetyStockWeight(saftyStockWeightVO01);
        }else{
            safetyStockWeightService.updateSafetyStockWeight(saftyStockWeightVO01);
        }


        saftyStockWeightVO01.setLineNo(2);

        //2번 가중치
        searchVO.setsLineNo(2);
        if(safetyStockWeightService.selectSafetyStockWeightsByConditionCnt(searchVO) == 0){
            safetyStockWeightService.insertSafetyStockWeight(saftyStockWeightVO01);
        }else{
            safetyStockWeightService.updateSafetyStockWeight(saftyStockWeightVO01);
        }

        /*
        *
        * 안전재고 파라미터 신규 추가 시 공급률 정보 추가.
        *
        * */
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");
        List<CommonCodeVO> abcClassList = commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO);

        for(CommonCodeVO abcClassVO : abcClassList){

            SupplyRuleSearchVO supplyRuleSearchVO = new SupplyRuleSearchVO();
            supplyRuleSearchVO.setsDlrCd(LoginUtil.getDlrCd());
            supplyRuleSearchVO.setsAbcInd(abcClassVO.getCmmCd());

            SupplyRuleVO supplyRuleVO = new SupplyRuleVO();
            supplyRuleVO.setDlrCd(LoginUtil.getDlrCd());
            supplyRuleVO.setPltCd(LoginUtil.getPltCd());
            supplyRuleVO.setAbcInd(abcClassVO.getCmmCd());

            if(supplyRuleService.selectSupplyRulesByConditionCnt(supplyRuleSearchVO) == 0){
                supplyRuleService.insertSupplyRule(supplyRuleVO);
            }else{
                supplyRuleService.updateSupplyRule(supplyRuleVO);
            }
        }
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.SafetyStockSettingService#multiSafetyStockSetting(chn.bhmc.dms.par.pmm.vo.SaftyStockSettingSaveVO)
     */
    @Override
    public void multiSafetyStockSettingInfo(SaftyStockSettingSaveVO saftyStockSettingSaveVO) throws Exception {

        SaftyStockSettingVO saftyStockSettingVO = new SaftyStockSettingVO();
        saftyStockSettingVO = saftyStockSettingSaveVO.getSaftyStockSettingVO();

        saftyStockSettingVO.setDlrCd(LoginUtil.getDlrCd());
        saftyStockSettingVO.setPltCd(LoginUtil.getPltCd());
        saftyStockSettingVO.setRegUsrId(LoginUtil.getUserId());
        saftyStockSettingVO.setUpdtUsrId(LoginUtil.getUserId());

        SaftyStockSearchVO searchVO = new SaftyStockSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsStdDmndPrid(saftyStockSettingVO.getStdDmndPrid());

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        //부품등급 공통코드 조회.
        CommonCodeSearchVO abcIndCdSearchVO = new CommonCodeSearchVO();
        abcIndCdSearchVO.setsLangCd(langCd);
        abcIndCdSearchVO.setsCmmGrpCd("PAR108");
        abcIndCdSearchVO.setsUseYn("Y");

        List<CommonCodeVO> abcClassList = commonCodeService.selectCommonCodesByCmmGrpCd(abcIndCdSearchVO);

        if(safetyStockSettingDAO.selectSafetyStockSettingsByConditionCnt(searchVO) > 0){
            //update SaftyStockSettingVO
            safetyStockSettingDAO.updateSafetyStockSetting(saftyStockSettingVO);

            //가중치 수정.
            double mainDmndPrid = 0;
            for(SaftyStockWeightVO saftyStockWeightVO : saftyStockSettingSaveVO.getSaftyStockWeightDetailVO()){
                saftyStockWeightVO.setDlrCd(LoginUtil.getDlrCd());
                saftyStockWeightVO.setPltCd(LoginUtil.getPltCd());
                saftyStockWeightVO.setUpdtUsrId(LoginUtil.getUserId());

                if(saftyStockWeightVO.getLineNo() == 1){
                    mainDmndPrid = saftyStockWeightVO.getDmndPrid();
                }

                if(saftyStockWeightVO.getLineNo() == 2){
                    saftyStockWeightVO.setDmndPrid(mainDmndPrid);
                }

                safetyStockWeightService.updateSafetyStockWeight(saftyStockWeightVO);
            }

            SupplyRuleVO supplyRuleA1VO = new SupplyRuleVO();
            supplyRuleA1VO.setDlrCd(LoginUtil.getDlrCd());
            supplyRuleA1VO.setPltCd(LoginUtil.getPltCd());
            supplyRuleA1VO.setAbcInd("A1");
            supplyRuleA1VO.setUpdtUsrId(LoginUtil.getUserId());

            SupplyRuleVO supplyRuleA2VO = new SupplyRuleVO();
            supplyRuleA2VO.setDlrCd(LoginUtil.getDlrCd());
            supplyRuleA2VO.setPltCd(LoginUtil.getPltCd());
            supplyRuleA2VO.setAbcInd("A2");
            supplyRuleA2VO.setUpdtUsrId(LoginUtil.getUserId());

            SupplyRuleVO supplyRuleA3VO = new SupplyRuleVO();
            supplyRuleA3VO.setDlrCd(LoginUtil.getDlrCd());
            supplyRuleA3VO.setPltCd(LoginUtil.getPltCd());
            supplyRuleA3VO.setAbcInd("A3");
            supplyRuleA3VO.setUpdtUsrId(LoginUtil.getUserId());

            SupplyRuleVO supplyRuleA4VO = new SupplyRuleVO();
            supplyRuleA4VO.setDlrCd(LoginUtil.getDlrCd());
            supplyRuleA4VO.setPltCd(LoginUtil.getPltCd());
            supplyRuleA4VO.setAbcInd("A4");
            supplyRuleA4VO.setUpdtUsrId(LoginUtil.getUserId());

            SupplyRuleVO supplyRuleB1VO = new SupplyRuleVO();
            supplyRuleB1VO.setDlrCd(LoginUtil.getDlrCd());
            supplyRuleB1VO.setPltCd(LoginUtil.getPltCd());
            supplyRuleB1VO.setAbcInd("B1");
            supplyRuleB1VO.setUpdtUsrId(LoginUtil.getUserId());

            SupplyRuleVO supplyRuleB2VO = new SupplyRuleVO();
            supplyRuleB2VO.setDlrCd(LoginUtil.getDlrCd());
            supplyRuleB2VO.setPltCd(LoginUtil.getPltCd());
            supplyRuleB2VO.setAbcInd("B2");
            supplyRuleB2VO.setUpdtUsrId(LoginUtil.getUserId());

            SupplyRuleVO supplyRuleB3VO = new SupplyRuleVO();
            supplyRuleB3VO.setDlrCd(LoginUtil.getDlrCd());
            supplyRuleB3VO.setPltCd(LoginUtil.getPltCd());
            supplyRuleB3VO.setAbcInd("B3");
            supplyRuleB3VO.setUpdtUsrId(LoginUtil.getUserId());

            SupplyRuleVO supplyRuleB4VO = new SupplyRuleVO();
            supplyRuleB4VO.setDlrCd(LoginUtil.getDlrCd());
            supplyRuleB4VO.setPltCd(LoginUtil.getPltCd());
            supplyRuleB4VO.setAbcInd("B4");
            supplyRuleB4VO.setUpdtUsrId(LoginUtil.getUserId());

            SupplyRuleVO supplyRuleC1VO = new SupplyRuleVO();
            supplyRuleC1VO.setDlrCd(LoginUtil.getDlrCd());
            supplyRuleC1VO.setPltCd(LoginUtil.getPltCd());
            supplyRuleC1VO.setAbcInd("C1");
            supplyRuleC1VO.setUpdtUsrId(LoginUtil.getUserId());

            SupplyRuleVO supplyRuleC2VO = new SupplyRuleVO();
            supplyRuleC2VO.setDlrCd(LoginUtil.getDlrCd());
            supplyRuleC2VO.setPltCd(LoginUtil.getPltCd());
            supplyRuleC2VO.setAbcInd("C2");
            supplyRuleC2VO.setUpdtUsrId(LoginUtil.getUserId());

            SupplyRuleVO supplyRuleC3VO = new SupplyRuleVO();
            supplyRuleC3VO.setDlrCd(LoginUtil.getDlrCd());
            supplyRuleC3VO.setPltCd(LoginUtil.getPltCd());
            supplyRuleC3VO.setAbcInd("C3");
            supplyRuleC3VO.setUpdtUsrId(LoginUtil.getUserId());

            SupplyRuleVO supplyRuleC4VO = new SupplyRuleVO();
            supplyRuleC4VO.setDlrCd(LoginUtil.getDlrCd());
            supplyRuleC4VO.setPltCd(LoginUtil.getPltCd());
            supplyRuleC4VO.setAbcInd("C4");
            supplyRuleC4VO.setUpdtUsrId(LoginUtil.getUserId());

            SupplyRuleVO supplyRuleD1VO = new SupplyRuleVO();
            supplyRuleD1VO.setDlrCd(LoginUtil.getDlrCd());
            supplyRuleD1VO.setPltCd(LoginUtil.getPltCd());
            supplyRuleD1VO.setAbcInd("D1");
            supplyRuleD1VO.setUpdtUsrId(LoginUtil.getUserId());

            SupplyRuleVO supplyRuleD2VO = new SupplyRuleVO();
            supplyRuleD2VO.setDlrCd(LoginUtil.getDlrCd());
            supplyRuleD2VO.setPltCd(LoginUtil.getPltCd());
            supplyRuleD2VO.setAbcInd("D2");
            supplyRuleD2VO.setUpdtUsrId(LoginUtil.getUserId());

            SupplyRuleVO supplyRuleE1VO = new SupplyRuleVO();
            supplyRuleE1VO.setDlrCd(LoginUtil.getDlrCd());
            supplyRuleE1VO.setPltCd(LoginUtil.getPltCd());
            supplyRuleE1VO.setAbcInd("E1");
            supplyRuleE1VO.setUpdtUsrId(LoginUtil.getUserId());

            SupplyRuleVO supplyRuleE2VO = new SupplyRuleVO();
            supplyRuleE2VO.setDlrCd(LoginUtil.getDlrCd());
            supplyRuleE2VO.setPltCd(LoginUtil.getPltCd());
            supplyRuleE2VO.setAbcInd("E2");
            supplyRuleE2VO.setUpdtUsrId(LoginUtil.getUserId());

            SupplyRuleVO supplyRuleE3VO = new SupplyRuleVO();
            supplyRuleE3VO.setDlrCd(LoginUtil.getDlrCd());
            supplyRuleE3VO.setPltCd(LoginUtil.getPltCd());
            supplyRuleE3VO.setAbcInd("E3");
            supplyRuleE3VO.setUpdtUsrId(LoginUtil.getUserId());

            SupplyRuleVO supplyRuleE4VO = new SupplyRuleVO();
            supplyRuleE4VO.setDlrCd(LoginUtil.getDlrCd());
            supplyRuleE4VO.setPltCd(LoginUtil.getPltCd());
            supplyRuleE4VO.setAbcInd("E4");
            supplyRuleE4VO.setUpdtUsrId(LoginUtil.getUserId());

            int iRowCnt = 0;
            for(SupplyRulePivotVO supplyRuleVO : saftyStockSettingSaveVO.getSupplyRuleDetailVO()){

                if(iRowCnt == 0){
                    supplyRuleA1VO.setReqOrdQty(supplyRuleVO.getA1());
                    supplyRuleA2VO.setReqOrdQty(supplyRuleVO.getA2());
                    supplyRuleA3VO.setReqOrdQty(supplyRuleVO.getA3());
                    supplyRuleA4VO.setReqOrdQty(supplyRuleVO.getA4());
                    supplyRuleB1VO.setReqOrdQty(supplyRuleVO.getB1());
                    supplyRuleB2VO.setReqOrdQty(supplyRuleVO.getB2());
                    supplyRuleB3VO.setReqOrdQty(supplyRuleVO.getB3());
                    supplyRuleB4VO.setReqOrdQty(supplyRuleVO.getB4());
                    supplyRuleC1VO.setReqOrdQty(supplyRuleVO.getC1());
                    supplyRuleC2VO.setReqOrdQty(supplyRuleVO.getC2());
                    supplyRuleC3VO.setReqOrdQty(supplyRuleVO.getC3());
                    supplyRuleC4VO.setReqOrdQty(supplyRuleVO.getC4());
                    supplyRuleD1VO.setReqOrdQty(supplyRuleVO.getD1());
                    supplyRuleD2VO.setReqOrdQty(supplyRuleVO.getD2());
                    supplyRuleE1VO.setReqOrdQty(supplyRuleVO.getE1());
                    supplyRuleE2VO.setReqOrdQty(supplyRuleVO.getE2());
                    supplyRuleE3VO.setReqOrdQty(supplyRuleVO.getE3());
                    supplyRuleE4VO.setReqOrdQty(supplyRuleVO.getE4());
                }

                if(iRowCnt == 1){
                    supplyRuleA1VO.setPurcOrdCycleVal(supplyRuleVO.getA1());
                    supplyRuleA2VO.setPurcOrdCycleVal(supplyRuleVO.getA2());
                    supplyRuleA3VO.setPurcOrdCycleVal(supplyRuleVO.getA3());
                    supplyRuleA4VO.setPurcOrdCycleVal(supplyRuleVO.getA4());
                    supplyRuleB1VO.setPurcOrdCycleVal(supplyRuleVO.getB1());
                    supplyRuleB2VO.setPurcOrdCycleVal(supplyRuleVO.getB2());
                    supplyRuleB3VO.setPurcOrdCycleVal(supplyRuleVO.getB3());
                    supplyRuleB4VO.setPurcOrdCycleVal(supplyRuleVO.getB4());
                    supplyRuleC1VO.setPurcOrdCycleVal(supplyRuleVO.getC1());
                    supplyRuleC2VO.setPurcOrdCycleVal(supplyRuleVO.getC2());
                    supplyRuleC3VO.setPurcOrdCycleVal(supplyRuleVO.getC3());
                    supplyRuleC4VO.setPurcOrdCycleVal(supplyRuleVO.getC4());
                    supplyRuleD1VO.setPurcOrdCycleVal(supplyRuleVO.getD1());
                    supplyRuleD2VO.setPurcOrdCycleVal(supplyRuleVO.getD2());
                    supplyRuleE1VO.setPurcOrdCycleVal(supplyRuleVO.getE1());
                    supplyRuleE2VO.setPurcOrdCycleVal(supplyRuleVO.getE2());
                    supplyRuleE3VO.setPurcOrdCycleVal(supplyRuleVO.getE3());
                    supplyRuleE4VO.setPurcOrdCycleVal(supplyRuleVO.getE4());
                }

                if(iRowCnt == 2){
                    supplyRuleA1VO.setSftyStockQty(supplyRuleVO.getA1());
                    supplyRuleA2VO.setSftyStockQty(supplyRuleVO.getA2());
                    supplyRuleA3VO.setSftyStockQty(supplyRuleVO.getA3());
                    supplyRuleA4VO.setSftyStockQty(supplyRuleVO.getA4());
                    supplyRuleB1VO.setSftyStockQty(supplyRuleVO.getB1());
                    supplyRuleB2VO.setSftyStockQty(supplyRuleVO.getB2());
                    supplyRuleB3VO.setSftyStockQty(supplyRuleVO.getB3());
                    supplyRuleB4VO.setSftyStockQty(supplyRuleVO.getB4());
                    supplyRuleC1VO.setSftyStockQty(supplyRuleVO.getC1());
                    supplyRuleC2VO.setSftyStockQty(supplyRuleVO.getC2());
                    supplyRuleC3VO.setSftyStockQty(supplyRuleVO.getC3());
                    supplyRuleC4VO.setSftyStockQty(supplyRuleVO.getC4());
                    supplyRuleD1VO.setSftyStockQty(supplyRuleVO.getD1());
                    supplyRuleD2VO.setSftyStockQty(supplyRuleVO.getD2());
                    supplyRuleE1VO.setSftyStockQty(supplyRuleVO.getE1());
                    supplyRuleE2VO.setSftyStockQty(supplyRuleVO.getE2());
                    supplyRuleE3VO.setSftyStockQty(supplyRuleVO.getE3());
                    supplyRuleE4VO.setSftyStockQty(supplyRuleVO.getE4());
                }

                if(iRowCnt == 3){
                    supplyRuleA1VO.setPurcOrdOperLvlVal(supplyRuleVO.getA1());
                    supplyRuleA2VO.setPurcOrdOperLvlVal(supplyRuleVO.getA2());
                    supplyRuleA3VO.setPurcOrdOperLvlVal(supplyRuleVO.getA3());
                    supplyRuleA4VO.setPurcOrdOperLvlVal(supplyRuleVO.getA4());
                    supplyRuleB1VO.setPurcOrdOperLvlVal(supplyRuleVO.getB1());
                    supplyRuleB2VO.setPurcOrdOperLvlVal(supplyRuleVO.getB2());
                    supplyRuleB3VO.setPurcOrdOperLvlVal(supplyRuleVO.getB3());
                    supplyRuleB4VO.setPurcOrdOperLvlVal(supplyRuleVO.getB4());
                    supplyRuleC1VO.setPurcOrdOperLvlVal(supplyRuleVO.getC1());
                    supplyRuleC2VO.setPurcOrdOperLvlVal(supplyRuleVO.getC2());
                    supplyRuleC3VO.setPurcOrdOperLvlVal(supplyRuleVO.getC3());
                    supplyRuleC4VO.setPurcOrdOperLvlVal(supplyRuleVO.getC4());
                    supplyRuleD1VO.setPurcOrdOperLvlVal(supplyRuleVO.getD1());
                    supplyRuleD2VO.setPurcOrdOperLvlVal(supplyRuleVO.getD2());
                    supplyRuleE1VO.setPurcOrdOperLvlVal(supplyRuleVO.getE1());
                    supplyRuleE2VO.setPurcOrdOperLvlVal(supplyRuleVO.getE2());
                    supplyRuleE3VO.setPurcOrdOperLvlVal(supplyRuleVO.getE3());
                    supplyRuleE4VO.setPurcOrdOperLvlVal(supplyRuleVO.getE4());
                }

               iRowCnt++;
            }

            //공급률 수정.
            supplyRuleService.updateSupplyRule(supplyRuleA1VO);
            supplyRuleService.updateSupplyRule(supplyRuleA2VO);
            supplyRuleService.updateSupplyRule(supplyRuleA3VO);
            supplyRuleService.updateSupplyRule(supplyRuleA4VO);

            supplyRuleService.updateSupplyRule(supplyRuleB1VO);
            supplyRuleService.updateSupplyRule(supplyRuleB2VO);
            supplyRuleService.updateSupplyRule(supplyRuleB3VO);
            supplyRuleService.updateSupplyRule(supplyRuleB4VO);

            supplyRuleService.updateSupplyRule(supplyRuleC1VO);
            supplyRuleService.updateSupplyRule(supplyRuleC2VO);
            supplyRuleService.updateSupplyRule(supplyRuleC3VO);
            supplyRuleService.updateSupplyRule(supplyRuleC4VO);

            supplyRuleService.updateSupplyRule(supplyRuleD1VO);
            supplyRuleService.updateSupplyRule(supplyRuleD2VO);

            supplyRuleService.updateSupplyRule(supplyRuleE1VO);
            supplyRuleService.updateSupplyRule(supplyRuleE2VO);
            supplyRuleService.updateSupplyRule(supplyRuleE3VO);
            supplyRuleService.updateSupplyRule(supplyRuleE4VO);

        }else{
            //insert SaftyStockSettingVO
            safetyStockSettingDAO.insertSafetyStockSetting(saftyStockSettingVO);

            /*
             *
             * 안전재고 파라미터 신규 추가 시 가중치 정보 추가.
             *
             * */
            SaftyStockWeightVO saftyStockWeightVO01 = new SaftyStockWeightVO();
            saftyStockWeightVO01.setDlrCd(LoginUtil.getDlrCd());
            saftyStockWeightVO01.setPltCd(LoginUtil.getPltCd());
            saftyStockWeightVO01.setDmndPrid(saftyStockSettingVO.getStdDmndPrid());//기준수요기간
            saftyStockWeightVO01.setLineNo(1);
            saftyStockWeightVO01.setRate1(0.0);
            saftyStockWeightVO01.setRate2(0.0);
            saftyStockWeightVO01.setRate3(0.0);
            saftyStockWeightVO01.setRate4(0.0);
            saftyStockWeightVO01.setRate5(0.0);
            saftyStockWeightVO01.setRate6(0.0);
            saftyStockWeightVO01.setRate7(0.0);
            saftyStockWeightVO01.setRate8(0.0);
            saftyStockWeightVO01.setRate9(0.0);
            saftyStockWeightVO01.setRate10(0.0);
            saftyStockWeightVO01.setRate11(0.0);
            saftyStockWeightVO01.setRate12(0.0);
            saftyStockWeightVO01.setRate13(0.0);
            saftyStockWeightVO01.setRate14(0.0);
            saftyStockWeightVO01.setRate15(0.0);
            saftyStockWeightVO01.setRate16(0.0);
            saftyStockWeightVO01.setRate17(0.0);
            saftyStockWeightVO01.setRate18(0.0);
            saftyStockWeightVO01.setRate19(0.0);
            saftyStockWeightVO01.setRate20(0.0);
            saftyStockWeightVO01.setRate21(0.0);
            saftyStockWeightVO01.setRate22(0.0);
            saftyStockWeightVO01.setRate23(0.0);
            saftyStockWeightVO01.setRate24(0.0);
            saftyStockWeightVO01.setUseYn("Y");
            saftyStockWeightVO01.setRegUsrId(LoginUtil.getUserId());

            //1번 가중치
            searchVO.setsLineNo(1);
            if(safetyStockWeightService.selectSafetyStockWeightsByConditionCnt(searchVO) == 0){
                safetyStockWeightService.insertSafetyStockWeight(saftyStockWeightVO01);
            }

            saftyStockWeightVO01.setLineNo(2);

            //2번 가중치
            searchVO.setsLineNo(2);
            if(safetyStockWeightService.selectSafetyStockWeightsByConditionCnt(searchVO) == 0){
                safetyStockWeightService.insertSafetyStockWeight(saftyStockWeightVO01);
            }

            /*
            *
            * 안전재고 파라미터 신규 추가 시 공급률 정보 추가.
            *
            * */

            for(CommonCodeVO abcClassVO : abcClassList){

                SupplyRuleSearchVO supplyRuleSearchVO = new SupplyRuleSearchVO();
                supplyRuleSearchVO.setsDlrCd(LoginUtil.getDlrCd());
                supplyRuleSearchVO.setsAbcInd(abcClassVO.getCmmCd());

                if(supplyRuleService.selectSupplyRulesByConditionCnt(supplyRuleSearchVO) == 0){

                    SupplyRuleVO supplyRuleVO = new SupplyRuleVO();
                    supplyRuleVO.setDlrCd(LoginUtil.getDlrCd());
                    supplyRuleVO.setPltCd(LoginUtil.getPltCd());
                    supplyRuleVO.setAbcInd(abcClassVO.getCmmCd());

                    supplyRuleService.insertSupplyRule(supplyRuleVO);

                }
            }
        }
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.SafetyStockSettingService#updateVenderMaster(chn.bhmc.dms.par.pmm.vo.SaftyStockSettingVO)
     */
    @Override
    public int updateSafetyStockSetting(SaftyStockSettingVO saftyStockSettingVO) throws Exception {
        saftyStockSettingVO.setDlrCd(LoginUtil.getDlrCd());
        saftyStockSettingVO.setPltCd(LoginUtil.getPltCd());
        saftyStockSettingVO.setUpdtUsrId(LoginUtil.getUserId());
        return safetyStockSettingDAO.updateSafetyStockSetting(saftyStockSettingVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.SafetyStockSettingService#deleteVenderMaster(chn.bhmc.dms.par.pmm.vo.SaftyStockSettingVO)
     */
    @Override
    public int deleteSafetyStockSetting(SaftyStockSettingVO saftyStockSettingVO) throws Exception {
        saftyStockSettingVO.setDlrCd(LoginUtil.getDlrCd());
        saftyStockSettingVO.setPltCd(LoginUtil.getPltCd());
        return safetyStockSettingDAO.deleteSafetyStockSetting(saftyStockSettingVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.SafetyStockSettingService#selectSaftyStockSettingByKey(java.lang.String, java.lang.String)
     */
    @Override
    public SaftyStockSettingVO selectSafetyStockSettingSingleByKey(SaftyStockSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsPltCd(LoginUtil.getPltCd());

        return safetyStockSettingDAO.selectSafetyStockSettingSingleByKey(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.SafetyStockSettingService#selectSafetyStockSettingsByCondition(chn.bhmc.dms.par.pmm.vo.SaftyStockSearchVO)
     */
    @Override
    public List<SaftyStockSettingVO> selectSafetyStockSettingsByCondition(SaftyStockSearchVO searchVO) throws Exception {
        return safetyStockSettingDAO.selectSafetyStockSettingsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.SafetyStockSettingService#selectSafetyStockSettingsByConditionCnt(chn.bhmc.dms.par.pmm.vo.SaftyStockSearchVO)
     */
    @Override
    public int selectSafetyStockSettingsByConditionCnt(SaftyStockSearchVO searchVO) throws Exception {
        return safetyStockSettingDAO.selectSafetyStockSettingsByConditionCnt(searchVO);
    }
}
