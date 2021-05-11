package chn.bhmc.dms.par.cpm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.cpm.service.SalePlanService;
import chn.bhmc.dms.par.cpm.service.dao.SalePlanDAO;
import chn.bhmc.dms.par.cpm.vo.SalePlanActVO;
import chn.bhmc.dms.par.cpm.vo.SalePlanSearchVO;
import chn.bhmc.dms.par.cpm.vo.SalePlanVO;

/**
 * 판매계획 구현 클래스
 *
 * @author In Bo Shim
 * @since 2016. 7. 15.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 7. 15.     In Bo Shim      최초 생성
 * </pre>
 */
@Service("salePlanService")
public class SalePlanServiceImpl extends HService implements SalePlanService {

    @Resource(name="salePlanDAO")
    private SalePlanDAO salePlanDAO;

    /*
     * @see chn.bhmc.dms.par.cpm.service.SalePlanService#insertSalePlan(chn.bhmc.dms.par.cpm.vo.SalePlanVO)
     */
    @Override
    public int insertSalePlan(SalePlanVO salePlanVO) throws Exception {
        return salePlanDAO.insertSalePlan(salePlanVO);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.SalePlanService#updateSalePlan(chn.bhmc.dms.par.cpm.vo.SalePlanVO)
     */
    @Override
    public int updateSalePlan(SalePlanVO salePlanVO) throws Exception {
        return salePlanDAO.updateSalePlan(salePlanVO);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.SalePlanService#deleteSalePlan(chn.bhmc.dms.par.cpm.vo.SalePlanVO)
     */
    @Override
    public int deleteSalePlan(SalePlanVO salePlanVO) throws Exception {
        return salePlanDAO.deleteSalePlan(salePlanVO);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.SalePlanService#multiSaleInsertPlans(java.lang.String, java.util.List)
     */
    @Override
    public void multiSaleInsertPlans(String yyyy, List<CommonCodeVO> itemDstinCdList) throws Exception {

        /*
         * 임무관리 부품유형, 부품임무관리유형별 년 / 월 정보를 추가한다.
         */

        //부품유형 리스트
        for(CommonCodeVO commonCodeVO : itemDstinCdList){

            //부품유형 사용가능 항목.
            if("Y".equals(commonCodeVO.getUseYn())){
                String itemDstinCd = commonCodeVO.getCmmCd();

                SalePlanSearchVO searchVO = new SalePlanSearchVO();
                searchVO.setsDlrCd(LoginUtil.getDlrCd());
                searchVO.setsDstDstinCd(itemDstinCd);
                searchVO.setsYy(yyyy);

                //월 리스트.
                String yyyyMM = "";
                for(int i = 1;i <= 12; i++){

                    if(i < 10){
                        yyyyMM = searchVO.getsYy()+"0"+String.valueOf(i);
                    }else{
                        yyyyMM = searchVO.getsYy()+String.valueOf(i);
                    }

                    searchVO.setsYyMm(yyyyMM);
                    searchVO.setsDstDstinTp("01");

                    // 부품임무관리유형 01 확인
                    if(salePlanDAO.selectSalePlansByConditionCnt(searchVO) == 0){
                        SalePlanVO salePlanVO01 = new SalePlanVO();
                        salePlanVO01.setDlrCd(LoginUtil.getDlrCd());
                        salePlanVO01.setCmpDstinCd("H");
                        salePlanVO01.setYyMm(yyyyMM);
                        salePlanVO01.setSaleTp("N");
                        salePlanVO01.setSalePlanAmt(0.0);
                        salePlanVO01.setItemDstinCd(itemDstinCd);
                        salePlanVO01.setDstDstinCd(itemDstinCd);
                        salePlanVO01.setDstDstinTp(searchVO.getsDstDstinTp());
                        salePlanVO01.setRegUsrId(LoginUtil.getUserId());
                        //판매계획
                        salePlanDAO.insertSalePlan(salePlanVO01);
                        salePlanVO01.setSaleTp("Y");
                        //판매목표
                        salePlanDAO.insertSalePlan(salePlanVO01);
                    }

                    // 부품임무관리유형 02 확인
                    searchVO.setsDstDstinTp("02");
                    if(salePlanDAO.selectSalePlansByConditionCnt(searchVO) == 0){
                        SalePlanVO salePlanVO02 = new SalePlanVO();
                        salePlanVO02.setDlrCd(LoginUtil.getDlrCd());
                        salePlanVO02.setCmpDstinCd("H");
                        salePlanVO02.setYyMm(yyyyMM);
                        salePlanVO02.setSaleTp("N");
                        salePlanVO02.setSalePlanAmt(0.0);
                        salePlanVO02.setItemDstinCd(itemDstinCd);
                        salePlanVO02.setDstDstinCd(itemDstinCd);
                        salePlanVO02.setDstDstinTp(searchVO.getsDstDstinTp());
                        salePlanVO02.setRegUsrId(LoginUtil.getUserId());

                        //판매계획
                        salePlanDAO.insertSalePlan(salePlanVO02);
                        salePlanVO02.setSaleTp("Y");
                        //판매목표
                        salePlanDAO.insertSalePlan(salePlanVO02);
                    }

                    // 부품임무관리유형 03 확인
                    searchVO.setsDstDstinTp("03");
                    if(salePlanDAO.selectSalePlansByConditionCnt(searchVO) == 0){
                        SalePlanVO salePlanVO03 = new SalePlanVO();
                        salePlanVO03.setDlrCd(LoginUtil.getDlrCd());
                        salePlanVO03.setCmpDstinCd("H");
                        salePlanVO03.setYyMm(yyyyMM);
                        salePlanVO03.setSaleTp("N");
                        salePlanVO03.setSalePlanAmt(0.0);
                        salePlanVO03.setItemDstinCd(itemDstinCd);
                        salePlanVO03.setDstDstinCd(itemDstinCd);
                        salePlanVO03.setDstDstinTp(searchVO.getsDstDstinTp());
                        salePlanVO03.setRegUsrId(LoginUtil.getUserId());

                        //판매계획
                        salePlanDAO.insertSalePlan(salePlanVO03);
                        salePlanVO03.setSaleTp("Y");
                        //판매목표
                        salePlanDAO.insertSalePlan(salePlanVO03);
                    }
                }
            }
        }
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.SalePlanService#multiSalePlan(chn.bhmc.dms.par.cpm.vo.SalePlanSaveVO)
     */
    @Override
    public void multiSalePlans(BaseSaveVO<SalePlanActVO> salePlanSaveVO) throws Exception {

        //salePlanAct insert list
        for(SalePlanActVO salePlanActVO : salePlanSaveVO.getUpdateList()){

            //1Month Start
            SalePlanSearchVO searchVO = new SalePlanSearchVO();
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            String strYyMm01 = salePlanActVO.getThisYear()+"01";
            searchVO.setsYyMm(strYyMm01);
            searchVO.setsDstDstinCd(salePlanActVO.getDstDstinCd());

            SalePlanVO salePlanMonth01VO = new SalePlanVO();
            salePlanMonth01VO.setDlrCd(LoginUtil.getDlrCd());
            salePlanMonth01VO.setCmpDstinCd("H");
            salePlanMonth01VO.setYyMm(strYyMm01);
            salePlanMonth01VO.setSaleTp("N");
            salePlanMonth01VO.setSalePlanAmt(salePlanActVO.getMonth01());
            salePlanMonth01VO.setDstDstinCd(salePlanActVO.getDstDstinCd());
            salePlanMonth01VO.setItemDstinCd(salePlanActVO.getItemDstinCd());
            salePlanMonth01VO.setDstDstinTp(salePlanActVO.getDstDstinTp());
            salePlanMonth01VO.setRegUsrId(LoginUtil.getUserId());
            salePlanMonth01VO.setUpdtUsrId(LoginUtil.getUserId());

            if(salePlanDAO.selectSalePlansByConditionCnt(searchVO) > 0){
                // month01 cost changed
                if(salePlanActVO.getMonth01() != salePlanActVO.getMonth01Cost()){
                    salePlanDAO.updateSalePlan(salePlanMonth01VO);
                }
            }else{
                salePlanDAO.insertSalePlan(salePlanMonth01VO);
            }
            //1Month End
            //2Month Start
            String strYyMm02 = salePlanActVO.getThisYear()+"02";
            searchVO.setsYyMm(strYyMm02);

            SalePlanVO salePlanMonth02VO = new SalePlanVO();
            salePlanMonth02VO.setDlrCd(LoginUtil.getDlrCd());
            salePlanMonth02VO.setCmpDstinCd("H");
            salePlanMonth02VO.setYyMm(strYyMm02);
            salePlanMonth02VO.setSaleTp("N");
            salePlanMonth02VO.setSalePlanAmt(salePlanActVO.getMonth02());
            salePlanMonth02VO.setDstDstinCd(salePlanActVO.getDstDstinCd());
            salePlanMonth02VO.setItemDstinCd(salePlanActVO.getItemDstinCd());
            salePlanMonth02VO.setDstDstinTp(salePlanActVO.getDstDstinTp());
            salePlanMonth02VO.setRegUsrId(LoginUtil.getUserId());
            salePlanMonth02VO.setUpdtUsrId(LoginUtil.getUserId());

            if(salePlanDAO.selectSalePlansByConditionCnt(searchVO) > 0){
                // month02 cost changed
                if(salePlanActVO.getMonth02() != salePlanActVO.getMonth02Cost()){
                    salePlanDAO.updateSalePlan(salePlanMonth02VO);
                }
            }else{
                salePlanDAO.insertSalePlan(salePlanMonth02VO);
            }
            //2Month End
            //3Month Start
            String strYyMm03 = salePlanActVO.getThisYear()+"03";
            searchVO.setsYyMm(strYyMm03);

            SalePlanVO salePlanMonth03VO = new SalePlanVO();
            salePlanMonth03VO.setDlrCd(LoginUtil.getDlrCd());
            salePlanMonth03VO.setCmpDstinCd("H");
            salePlanMonth03VO.setYyMm(strYyMm03);
            salePlanMonth03VO.setSaleTp("N");
            salePlanMonth03VO.setSalePlanAmt(salePlanActVO.getMonth03());
            salePlanMonth03VO.setDstDstinCd(salePlanActVO.getDstDstinCd());
            salePlanMonth03VO.setItemDstinCd(salePlanActVO.getItemDstinCd());
            salePlanMonth03VO.setDstDstinTp(salePlanActVO.getDstDstinTp());
            salePlanMonth03VO.setRegUsrId(LoginUtil.getUserId());
            salePlanMonth03VO.setUpdtUsrId(LoginUtil.getUserId());

            if(salePlanDAO.selectSalePlansByConditionCnt(searchVO) > 0){
                // month03 cost changed
                if(salePlanActVO.getMonth03() != salePlanActVO.getMonth03Cost()){
                    salePlanDAO.updateSalePlan(salePlanMonth03VO);
                }
            }else{
                salePlanDAO.insertSalePlan(salePlanMonth03VO);
            }
            //3Month End
            //4Month Start
            String strYyMm04 = salePlanActVO.getThisYear()+"04";
            searchVO.setsYyMm(strYyMm04);

            SalePlanVO salePlanMonth04VO = new SalePlanVO();
            salePlanMonth04VO.setDlrCd(LoginUtil.getDlrCd());
            salePlanMonth04VO.setCmpDstinCd("H");
            salePlanMonth04VO.setYyMm(strYyMm04);
            salePlanMonth04VO.setSaleTp("N");
            salePlanMonth04VO.setSalePlanAmt(salePlanActVO.getMonth04());
            salePlanMonth04VO.setDstDstinCd(salePlanActVO.getDstDstinCd());
            salePlanMonth04VO.setItemDstinCd(salePlanActVO.getItemDstinCd());
            salePlanMonth04VO.setDstDstinTp(salePlanActVO.getDstDstinTp());
            salePlanMonth04VO.setRegUsrId(LoginUtil.getUserId());
            salePlanMonth04VO.setUpdtUsrId(LoginUtil.getUserId());

            if(salePlanDAO.selectSalePlansByConditionCnt(searchVO) > 0){
                // month04 cost changed
                if(salePlanActVO.getMonth04() != salePlanActVO.getMonth04Cost()){
                    salePlanDAO.updateSalePlan(salePlanMonth04VO);
                }
            }else{
                salePlanDAO.insertSalePlan(salePlanMonth04VO);
            }
            //4Month End
            //5Month Start
            String strYyMm05 = salePlanActVO.getThisYear()+"05";
            searchVO.setsYyMm(strYyMm05);

            SalePlanVO salePlanMonth05VO = new SalePlanVO();
            salePlanMonth05VO.setDlrCd(LoginUtil.getDlrCd());
            salePlanMonth05VO.setCmpDstinCd("H");
            salePlanMonth05VO.setYyMm(strYyMm05);
            salePlanMonth05VO.setSaleTp("N");
            salePlanMonth05VO.setSalePlanAmt(salePlanActVO.getMonth05());
            salePlanMonth05VO.setDstDstinCd(salePlanActVO.getDstDstinCd());
            salePlanMonth05VO.setItemDstinCd(salePlanActVO.getItemDstinCd());
            salePlanMonth05VO.setDstDstinTp(salePlanActVO.getDstDstinTp());
            salePlanMonth05VO.setRegUsrId(LoginUtil.getUserId());
            salePlanMonth05VO.setUpdtUsrId(LoginUtil.getUserId());

            if(salePlanDAO.selectSalePlansByConditionCnt(searchVO) > 0){
                // month05 cost changed
                if(salePlanActVO.getMonth05() != salePlanActVO.getMonth05Cost()){
                    salePlanDAO.updateSalePlan(salePlanMonth05VO);
                }
            }else{
                salePlanDAO.insertSalePlan(salePlanMonth05VO);
            }
            //5Month End
            //6Month Start
            String strYyMm06 = salePlanActVO.getThisYear()+"06";
            searchVO.setsYyMm(strYyMm06);

            SalePlanVO salePlanMonth06VO = new SalePlanVO();
            salePlanMonth06VO.setDlrCd(LoginUtil.getDlrCd());
            salePlanMonth06VO.setCmpDstinCd("H");
            salePlanMonth06VO.setYyMm(strYyMm06);
            salePlanMonth06VO.setSaleTp("N");
            salePlanMonth06VO.setSalePlanAmt(salePlanActVO.getMonth06());
            salePlanMonth06VO.setDstDstinCd(salePlanActVO.getDstDstinCd());
            salePlanMonth06VO.setItemDstinCd(salePlanActVO.getItemDstinCd());
            salePlanMonth06VO.setDstDstinTp(salePlanActVO.getDstDstinTp());
            salePlanMonth06VO.setRegUsrId(LoginUtil.getUserId());
            salePlanMonth06VO.setUpdtUsrId(LoginUtil.getUserId());

            if(salePlanDAO.selectSalePlansByConditionCnt(searchVO) > 0){
                // month06 cost changed
                if(salePlanActVO.getMonth06() != salePlanActVO.getMonth06Cost()){
                    salePlanDAO.updateSalePlan(salePlanMonth06VO);
                }
            }else{
                salePlanDAO.insertSalePlan(salePlanMonth06VO);
            }
            //6Month End
            //7Month Start
            String strYyMm07 = salePlanActVO.getThisYear()+"07";
            searchVO.setsYyMm(strYyMm07);

            SalePlanVO salePlanMonth07VO = new SalePlanVO();
            salePlanMonth07VO.setDlrCd(LoginUtil.getDlrCd());
            salePlanMonth07VO.setCmpDstinCd("H");
            salePlanMonth07VO.setYyMm(strYyMm07);
            salePlanMonth07VO.setSaleTp("N");
            salePlanMonth07VO.setSalePlanAmt(salePlanActVO.getMonth07());
            salePlanMonth07VO.setDstDstinCd(salePlanActVO.getDstDstinCd());
            salePlanMonth07VO.setItemDstinCd(salePlanActVO.getItemDstinCd());
            salePlanMonth07VO.setDstDstinTp(salePlanActVO.getDstDstinTp());
            salePlanMonth07VO.setRegUsrId(LoginUtil.getUserId());
            salePlanMonth07VO.setUpdtUsrId(LoginUtil.getUserId());

            if(salePlanDAO.selectSalePlansByConditionCnt(searchVO) > 0){
                // month07 cost changed
                if(salePlanActVO.getMonth07() != salePlanActVO.getMonth07Cost()){
                    salePlanDAO.updateSalePlan(salePlanMonth07VO);
                }
            }else{
                salePlanDAO.insertSalePlan(salePlanMonth07VO);
            }
            //7Month End
            //8Month Start
            String strYyMm08 = salePlanActVO.getThisYear()+"08";
            searchVO.setsYyMm(strYyMm08);

            SalePlanVO salePlanMonth08VO = new SalePlanVO();
            salePlanMonth08VO.setDlrCd(LoginUtil.getDlrCd());
            salePlanMonth08VO.setCmpDstinCd("H");
            salePlanMonth08VO.setYyMm(strYyMm08);
            salePlanMonth08VO.setSaleTp("N");
            salePlanMonth08VO.setSalePlanAmt(salePlanActVO.getMonth08());
            salePlanMonth08VO.setDstDstinCd(salePlanActVO.getDstDstinCd());
            salePlanMonth08VO.setItemDstinCd(salePlanActVO.getItemDstinCd());
            salePlanMonth08VO.setDstDstinTp(salePlanActVO.getDstDstinTp());
            salePlanMonth08VO.setRegUsrId(LoginUtil.getUserId());
            salePlanMonth08VO.setUpdtUsrId(LoginUtil.getUserId());

            if(salePlanDAO.selectSalePlansByConditionCnt(searchVO) > 0){
                // month08 cost changed
                if(salePlanActVO.getMonth08() != salePlanActVO.getMonth08Cost()){
                    salePlanDAO.updateSalePlan(salePlanMonth08VO);
                }
            }else{
                salePlanDAO.insertSalePlan(salePlanMonth08VO);
            }
            //8Month End
            //9Month Start
            String strYyMm09 = salePlanActVO.getThisYear()+"09";
            searchVO.setsYyMm(strYyMm09);

            SalePlanVO salePlanMonth09VO = new SalePlanVO();
            salePlanMonth09VO.setDlrCd(LoginUtil.getDlrCd());
            salePlanMonth09VO.setCmpDstinCd("H");
            salePlanMonth09VO.setYyMm(strYyMm09);
            salePlanMonth09VO.setSaleTp("N");
            salePlanMonth09VO.setSalePlanAmt(salePlanActVO.getMonth09());
            salePlanMonth09VO.setDstDstinCd(salePlanActVO.getDstDstinCd());
            salePlanMonth09VO.setItemDstinCd(salePlanActVO.getItemDstinCd());
            salePlanMonth09VO.setDstDstinTp(salePlanActVO.getDstDstinTp());
            salePlanMonth09VO.setRegUsrId(LoginUtil.getUserId());
            salePlanMonth09VO.setUpdtUsrId(LoginUtil.getUserId());

            if(salePlanDAO.selectSalePlansByConditionCnt(searchVO) > 0){
                // month09 cost changed
                if(salePlanActVO.getMonth09() != salePlanActVO.getMonth09Cost()){
                    salePlanDAO.updateSalePlan(salePlanMonth09VO);
                }
            }else{
                salePlanDAO.insertSalePlan(salePlanMonth09VO);
            }
            //9Month End
            //10Month Start
            String strYyMm10 = salePlanActVO.getThisYear()+"10";
            searchVO.setsYyMm(strYyMm10);

            SalePlanVO salePlanMonth10VO = new SalePlanVO();
            salePlanMonth10VO.setDlrCd(LoginUtil.getDlrCd());
            salePlanMonth10VO.setCmpDstinCd("H");
            salePlanMonth10VO.setYyMm(strYyMm10);
            salePlanMonth10VO.setSaleTp("N");
            salePlanMonth10VO.setSalePlanAmt(salePlanActVO.getMonth10());
            salePlanMonth10VO.setDstDstinCd(salePlanActVO.getDstDstinCd());
            salePlanMonth10VO.setItemDstinCd(salePlanActVO.getItemDstinCd());
            salePlanMonth10VO.setDstDstinTp(salePlanActVO.getDstDstinTp());
            salePlanMonth10VO.setRegUsrId(LoginUtil.getUserId());
            salePlanMonth10VO.setUpdtUsrId(LoginUtil.getUserId());

            if(salePlanDAO.selectSalePlansByConditionCnt(searchVO) > 0){
                // month10 cost changed
                if(salePlanActVO.getMonth10() != salePlanActVO.getMonth10Cost()){
                    salePlanDAO.updateSalePlan(salePlanMonth10VO);
                }
            }else{
                salePlanDAO.insertSalePlan(salePlanMonth10VO);
            }
            //10Month End
            //11Month Start
            String strYyMm11 = salePlanActVO.getThisYear()+"11";
            searchVO.setsYyMm(strYyMm11);

            SalePlanVO salePlanMonth11VO = new SalePlanVO();
            salePlanMonth11VO.setDlrCd(LoginUtil.getDlrCd());
            salePlanMonth11VO.setCmpDstinCd("H");
            salePlanMonth11VO.setYyMm(strYyMm11);
            salePlanMonth11VO.setSaleTp("N");
            salePlanMonth11VO.setSalePlanAmt(salePlanActVO.getMonth11());
            salePlanMonth11VO.setDstDstinCd(salePlanActVO.getDstDstinCd());
            salePlanMonth11VO.setItemDstinCd(salePlanActVO.getItemDstinCd());
            salePlanMonth11VO.setDstDstinTp(salePlanActVO.getDstDstinTp());
            salePlanMonth11VO.setRegUsrId(LoginUtil.getUserId());
            salePlanMonth11VO.setUpdtUsrId(LoginUtil.getUserId());

            if(salePlanDAO.selectSalePlansByConditionCnt(searchVO) > 0){
                // month11 cost changed
                if(salePlanActVO.getMonth11() != salePlanActVO.getMonth11Cost()){
                    salePlanDAO.updateSalePlan(salePlanMonth11VO);
                }
            }else{
                salePlanDAO.insertSalePlan(salePlanMonth11VO);
            }
            //11Month End
            //12Month Start
            String strYyMm12 = salePlanActVO.getThisYear()+"12";
            searchVO.setsYyMm(strYyMm12);

            SalePlanVO salePlanMonth12VO = new SalePlanVO();
            salePlanMonth12VO.setDlrCd(LoginUtil.getDlrCd());
            salePlanMonth12VO.setCmpDstinCd("H");
            salePlanMonth12VO.setYyMm(strYyMm12);
            salePlanMonth12VO.setSaleTp("N");
            salePlanMonth12VO.setSalePlanAmt(salePlanActVO.getMonth12());
            salePlanMonth12VO.setDstDstinCd(salePlanActVO.getDstDstinCd());
            salePlanMonth12VO.setItemDstinCd(salePlanActVO.getItemDstinCd());
            salePlanMonth12VO.setDstDstinTp(salePlanActVO.getDstDstinTp());
            salePlanMonth12VO.setRegUsrId(LoginUtil.getUserId());
            salePlanMonth12VO.setUpdtUsrId(LoginUtil.getUserId());

            if(salePlanDAO.selectSalePlansByConditionCnt(searchVO) > 0){
                // month12 cost changed
                if(salePlanActVO.getMonth12() != salePlanActVO.getMonth12Cost()){
                    salePlanDAO.updateSalePlan(salePlanMonth12VO);
                }
            }else{
                salePlanDAO.insertSalePlan(salePlanMonth12VO);
            }
            //12Month End
        }

    }



    /*
     * @see chn.bhmc.dms.par.cpm.service.SalePlanService#selectSalePlanByKey(java.lang.String, java.lang.String)
     */
    @Override
    public SalePlanVO selectSalePlanByKey(String dlrCd, String itemCd) throws Exception {
        return salePlanDAO.selectSalePlanByKey(dlrCd);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.SalePlanService#selectSalePlansByCondition(chn.bhmc.dms.par.cpm.vo.SalePlanSearchVO)
     */
    @Override
    public List<SalePlanActVO> selectSalePlansByCondition(SalePlanSearchVO searchVO) throws Exception {
        return salePlanDAO.selectSalePlansByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.SalePlanService#selectSalePlansByConditionCnt(chn.bhmc.dms.par.cpm.vo.SalePlanSearchVO)
     */
    @Override
    public int selectSalePlansByConditionCnt(SalePlanSearchVO searchVO) throws Exception {
        return salePlanDAO.selectSalePlansByConditionCnt(searchVO);
    }
}
