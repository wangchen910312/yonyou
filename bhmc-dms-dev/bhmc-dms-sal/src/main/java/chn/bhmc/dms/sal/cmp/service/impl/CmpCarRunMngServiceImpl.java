package chn.bhmc.dms.sal.cmp.service.impl;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.cmp.service.CmpCarRunMngService;
import chn.bhmc.dms.sal.cmp.service.dao.CmpCarRunMngDAO;
import chn.bhmc.dms.sal.cmp.vo.CmpCarRunMngSaveVO;
import chn.bhmc.dms.sal.cmp.vo.CmpCarRunMngSearchVO;
import chn.bhmc.dms.sal.cmp.vo.CmpCarRunMngVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AapMngServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author
 * @since 2016. 4. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 15.      Kim yewon              최초 생성
 * </pre>
 */

@Service("cmpCarRunMngService")
public class CmpCarRunMngServiceImpl extends HService implements CmpCarRunMngService{

    /**
     * 회사차운행관리 DAO 선언
     */
    @Resource(name="cmpCarRunMngDAO")
    CmpCarRunMngDAO cmpCarRunMngDAO;

    /**
     * 조회 조건에 해당하는 회사차운행관리 정보를 조회한다.
     */
    @Override
    public List<CmpCarRunMngVO> selectCmpCarRunMngByCondition(CmpCarRunMngSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return cmpCarRunMngDAO.selectCmpCarRunMngByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 회사차운행관리 총 갯수를 조회한다.
     */
    @Override
    public int selectCmpCarRunMngByConditionCnt(CmpCarRunMngSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return cmpCarRunMngDAO.selectCmpCarRunMngByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 회사차운행관리 총 갯수를 조회한다.
     */
    @Override
    public int selectCmpCarRunMngSubCnt(CmpCarRunMngSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return cmpCarRunMngDAO.selectCmpCarRunMngSubCnt(searchVO);
    }


    /**
     * 조회 조건에 해당하는 회사차운행관리 정보를 조회한다.
     */
    @Override
    public List<CmpCarRunMngVO> selectCmpCarRunMngSub(CmpCarRunMngSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return cmpCarRunMngDAO.selectCmpCarRunMngSub(searchVO);
    }



    /**
     * 회사차관리 메인을 저장한다.
     */
    @Override
    public String saveCmpCarRunMng(CmpCarRunMngVO saveVO) throws Exception{


        //시작시간 ~ 종료시간 중복체크
        int useDtChkCnt = cmpCarRunMngDAO.selectUseDtChkCnt(saveVO);
        String result = null;

        //시간중복 없음.
        if(useDtChkCnt == 0 ){
            //시작~종료 주행거리체크
            String chkKmVl = cmpCarRunMngDAO.selectUseKmChkCnt(saveVO);
            //해당 VIN_NO 마지막주행거리
            int chkUseEndKm = Integer.parseInt(chkKmVl);
            //해당 VIN_NO의 신규 시작거리.
            int useStartKmVal = Integer.parseInt(saveVO.getUseStartKmVal());

            if(chkUseEndKm <= useStartKmVal){
                if(saveVO.getGb().equals("I")){
                    saveVO.setRegUsrId(LoginUtil.getUserId());          // 등록자
                    int pkChk = cmpCarRunMngDAO.selectByPkChk(saveVO);
                    if(pkChk == 0){
                        cmpCarRunMngDAO.insertCmpCarRunMng(saveVO);
                        result = "1";
                    }else {
                        result = "3";
                    }
                }else {
                    saveVO.setUpdtUsrId(LoginUtil.getUserId());         // 수정자
                    cmpCarRunMngDAO.updateCmpCarRunMng(saveVO);
                    result = "1";
                }
            }else {
                result = "2";
            }
        }
        //시간중복있음.
        else {
            result = "0";

        }

        return result;
    }



    /**
     * 회사차관리 메인을 삭제한다.
     */
    @Override
    public boolean deleteCmpCarRunMng(CmpCarRunMngVO saveVO) throws Exception{

        return cmpCarRunMngDAO.deleteCmpCarRunMng(saveVO);

    }


    @Override
    public String selectUseKmVal(String sVinNo)  throws Exception {

        CmpCarRunMngVO saveVO = new CmpCarRunMngVO();
        saveVO.setVinNo(sVinNo);
        return cmpCarRunMngDAO.selectUseKmChkCnt(saveVO);
    }

    @Override
    public void saveCmpCarRunMngMain(CmpCarRunMngSaveVO obj) throws Exception {

        String dlrCd = LoginUtil.getDlrCd();
        String userId = LoginUtil.getUserId();

        SimpleDateFormat formatterForNumber = new SimpleDateFormat("yyyyMMdd");

        for(CmpCarRunMngVO saveVO : obj.getInsertList()){

            if(saveVO.getCpnCarTp() == ""){
                throw processException("global.info.required.field", new String[]{messageSource.getMessage("global.lbl.cmpCarDstinCd", null, LocaleContextHolder.getLocale())});
            }

            if(saveVO.getStartDt() == null){
                throw processException("global.info.required.field", new String[]{messageSource.getMessage("sal.lbl.orgStartDt", null, LocaleContextHolder.getLocale())});
            }

            if(saveVO.getEndDt() == null){
                throw processException("global.info.required.field", new String[]{messageSource.getMessage("global.lbl.fincEndDt", null, LocaleContextHolder.getLocale())});
            }

            String startDtStr = formatterForNumber.format(saveVO.getStartDt());
            String endDtStr = formatterForNumber.format(saveVO.getEndDt());

            int startInt =  Integer.valueOf(startDtStr);
            int endInt =  Integer.valueOf(endDtStr);

            if(startInt > endInt){
                //시작사용일자가 만기일자보다 크면 않됨
                throw processException("sal.err.fromDateSmall");
            }
            //System.out.println("startInt & endInt :::::::::::::::: "+ startInt + "::::::" + endInt);

            saveVO.setDlrCd(dlrCd);
            saveVO.setUpdtUsrId(userId);
            insertCmpCarRunMngMain(saveVO);
            cmpCarRunMngDAO.updateMasterVheicleUpdate(saveVO);
        }

        for(CmpCarRunMngVO saveVO : obj.getUpdateList()){

            if(saveVO.getCpnCarTp() == ""){
                throw processException("global.info.required.field", new String[]{messageSource.getMessage("global.lbl.cmpCarDstinCd", null, LocaleContextHolder.getLocale())});
            }

            if(saveVO.getStartDt() == null){
                throw processException("global.info.required.field", new String[]{messageSource.getMessage("sal.lbl.orgStartDt", null, LocaleContextHolder.getLocale())});
            }

            if(saveVO.getEndDt() == null){
                throw processException("global.info.required.field", new String[]{messageSource.getMessage("global.lbl.fincEndDt", null, LocaleContextHolder.getLocale())});
            }

            String startDtStr = formatterForNumber.format(saveVO.getStartDt());
            String endDtStr = formatterForNumber.format(saveVO.getEndDt());

            int startInt =  Integer.valueOf(startDtStr);
            int endInt =  Integer.valueOf(endDtStr);

            if(startInt > endInt){
                //시작사용일자가 만기일자보다 크면 않됨
                throw processException("sal.err.fromDateSmall");
            }

            saveVO.setDlrCd(dlrCd);
            saveVO.setUpdtUsrId(userId);
            insertCmpCarRunMngMain(saveVO);
            cmpCarRunMngDAO.updateMasterVheicleUpdate(saveVO);
        }

        for(CmpCarRunMngVO saveVO : obj.getDeleteList()){

            int subDataSrch = cmpCarRunMngDAO.selectSubDataChk(saveVO);

            if(subDataSrch == 0){
                saveVO.setDlrCd(dlrCd);
                saveVO.setUpdtUsrId(userId);

                cmpCarRunMngDAO.updateMasterVheicleRemoveUpdate(saveVO);
                deleteCmpCarRunMngMain(saveVO);
            }else{
                //todo 주행기록이 있어 삭제 할 수 없습니다.
                throw processException("sal.err.detailDataLocNoDelete");
            }

        }
    }

    @Override
    public int insertCmpCarRunMngMain(CmpCarRunMngVO saveVO) throws Exception {
        return cmpCarRunMngDAO.insertCmpCarRunMngMain(saveVO);
    }

    @Override
    public List<CmpCarRunMngVO> selectVehicleMasterPopupSrch(CmpCarRunMngSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return cmpCarRunMngDAO.selectVehicleMasterPopupSrch(searchVO);
    }

    @Override
    public int selectVehicleMasterPopupSrchCnt(CmpCarRunMngSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return cmpCarRunMngDAO.selectVehicleMasterPopupSrchCnt(searchVO);
    }

    @Override
    public void saveCmpCarRunMngSub(CmpCarRunMngSaveVO obj) throws Exception {

        String dlrCd = LoginUtil.getDlrCd();
        String procUserId = LoginUtil.getUserId();

        for(CmpCarRunMngVO saveVO : obj.getInsertList()){

            if(saveVO.getUserId() == "" || saveVO.getUserId() == null){
                throw processException("global.info.required.field", new String[]{messageSource.getMessage("global.lbl.usrNm", null, LocaleContextHolder.getLocale())});
            }

            if(saveVO.getUseStartDt() == null){
                throw processException("global.info.required.field", new String[]{messageSource.getMessage("sal.lbl.usingStartDt", null, LocaleContextHolder.getLocale())});
            }

            if(saveVO.getUseEndDt() == null){
                throw processException("global.info.required.field", new String[]{messageSource.getMessage("sal.lbl.usingEndDt", null, LocaleContextHolder.getLocale())});
            }

            if(saveVO.getEndKm() == 0){
                throw processException("global.info.required.field", new String[]{messageSource.getMessage("global.lbl.endKmVal", null, LocaleContextHolder.getLocale())});
            }

            if(saveVO.getUseEndDt().before(saveVO.getUseStartDt())){
                //시작 시간이 종료 시간보다 크거나 같을 수 없습니다.
                throw processException("sal.err.compFromDateSmall");
            }

            //int startKmChk = cmpCarRunMngDAO.selectStartKmChk(saveVO);

/*            if(startKmChk > saveVO.getStartKm()){
                //선택된 차량은 이미 입력한 시작km보다 더 운행되였습니다. 시작 km를 확인해주세요.
                throw processException("sal.err.fromMileSmall");
            }*/

            if(saveVO.getStartKm() > saveVO.getEndKm()){
                //시작마일리지는 완료마일리지보다 크면 않됨
                throw processException("sal.err.fromMileSmall");
            }

            if(saveVO.getUsedOil() < 0.001){
                throw processException("global.info.required.field", new String[]{messageSource.getMessage("sal.lbl.usedOil", null, LocaleContextHolder.getLocale())});
            }

            saveVO.setDlrCd(dlrCd);
            saveVO.setRegUsrId(procUserId);
            saveVO.setUpdtUsrId(procUserId);
            insertCmpCarRunMngSub(saveVO);

        }

        for(CmpCarRunMngVO saveVO : obj.getDeleteList()){
            deleteCmpCarRunMngSub(saveVO);
        }
    }

    @Override
    public int deleteCmpCarRunMngMain(CmpCarRunMngVO saveVO) throws Exception {
        return cmpCarRunMngDAO.deleteCmpCarRunMngMain(saveVO);
    }

    @Override
    public int insertCmpCarRunMngSub(CmpCarRunMngVO saveVO) throws Exception {
        return cmpCarRunMngDAO.insertCmpCarRunMngSub(saveVO);
    }

    @Override
    public int deleteCmpCarRunMngSub(CmpCarRunMngVO saveVO) throws Exception {
        return cmpCarRunMngDAO.deleteCmpCarRunMngSub(saveVO);
    }

    @Override
    public int updateCmpCarMngDoneVheicle() throws Exception {
        return cmpCarRunMngDAO.updateCmpCarMngDoneVheicle();
    }
}
