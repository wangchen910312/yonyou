package chn.bhmc.dms.sal.usc.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;

import chn.bhmc.dms.ser.cmm.service.ServiceCommonService;

import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.ser.cmm.vo.RepairOrderIfVO;
import chn.bhmc.dms.ser.ro.vo.RepairOrderVO;

import chn.bhmc.dms.sal.usc.vo.PurcEvalVO;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.usc.service.PurcEvalService;
import chn.bhmc.dms.sal.usc.service.UsedCarMasterService;
import chn.bhmc.dms.sal.usc.service.dao.UsedCarMasterDAO;
import chn.bhmc.dms.sal.usc.vo.TopSelectionUsedCarVO;
import chn.bhmc.dms.sal.usc.vo.UsedCarMasterSaveVO;
import chn.bhmc.dms.sal.usc.vo.UsedCarMasterSearchVO;
import chn.bhmc.dms.sal.usc.vo.UsedCarMasterVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UsedCarMasterServiceImpl
 * @Description : 중고차량마스터관리
 * @author
 * @since 2016. 6. 2.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 2.      Kim yewon              최초 생성
 * </pre>
 */

@Service("usedCarMasterService")
public class UsedCarMasterServiceImpl extends HService implements UsedCarMasterService {

    /**
     * 중고 DAO 선언
     */
    @Resource(name="usedCarMasterDAO")
    UsedCarMasterDAO usedCarMasterDAO;

    @Resource(name="purcEvalService")
    PurcEvalService purcEvalService;

    @Autowired
    ServiceCommonService serviceCommonService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;


    /**
     * 조회 조건에 해당하는  정보를 조회한다.
     */
    @Override
    public List<UsedCarMasterVO> selectUsedCarMasterByCondition(UsedCarMasterSearchVO searchVO){

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return usedCarMasterDAO.selectUsedCarMasterByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 총 갯수를 조회한다.
     */
    @Override
    public int selectUsedCarMasterByConditionCnt(UsedCarMasterSearchVO searchVO) {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return usedCarMasterDAO.selectUsedCarMasterByConditionCnt(searchVO);
    }

    /**
     * 중고차량정보(단건) 조회
     */
    @Override
    public UsedCarMasterVO selectUsedCar(UsedCarMasterSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return usedCarMasterDAO.selectUsedCar(searchVO);
    }


    /**
     * 수선차량정보(단건) 조회
     */
    @Override
    public TopSelectionUsedCarVO selectTopSelectionCar(String sVinNo) throws Exception {
        return usedCarMasterDAO.selectTopSelectionCar(sVinNo);
    }


    /**
     * 중고차량 정보를 멀티저장..
     */
    @Override
    public void multiSaveUsedCar(UsedCarMasterSaveVO saveVO) throws Exception{

        saveVO.getUsedCarMasterVO().setUpdtUsrId(LoginUtil.getUserId());

        //차량상세정보
        usedCarMasterDAO.updateUsedCar(saveVO.getUsedCarMasterVO());

        PurcEvalVO purcEvalVO = new PurcEvalVO();

        purcEvalVO.setDlrCd(saveVO.getUsedCarMasterVO().getDlrCd());
        purcEvalVO.setPurcNo(saveVO.getUsedCarMasterVO().getPurcNo());
        purcEvalVO.setPlatNo(saveVO.getUsedCarMasterVO().getLicenseno());
        purcEvalService.updatePurcEvalMng(purcEvalVO);

        //차량소유자 정보
        if(saveVO.getOwnerGridVO() != null){
            saveUsedCarOwner(saveVO.getOwnerGridVO(),saveVO.getUsedCarMasterVO());
        }

        //차량운전자 정보
        if(saveVO.getDriverGridVO() != null){
            saveUsedCarDriver(saveVO.getDriverGridVO(),saveVO.getUsedCarMasterVO());
        }
    }


    /**
     * 조회 조건에 해당하는 차량소유자 정보를 조회한다.
     */
    @Override
    public int selectUsedCarOwnerByConditionCnt(UsedCarMasterSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return usedCarMasterDAO.selectUsedCarOwnerByConditionCnt(searchVO);
    }

    @Override
    public List<UsedCarMasterVO> selectUsedCarOwnerByCondition(UsedCarMasterSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return usedCarMasterDAO.selectUsedCarOwnerByCondition(searchVO);
    }

    /**
     * 차량소유자 저장한다.
     */
    @Override
    public void saveUsedCarOwner(BaseSaveVO<UsedCarMasterVO> obj,UsedCarMasterVO usedCarMasterVO) throws Exception{

        // 저장
        for(UsedCarMasterVO vo : obj.getInsertList()){
            vo.setUpdtUsrId(LoginUtil.getUserId());     // 사용자
            vo.setRegUsrId(LoginUtil.getUserId());

            usedCarMasterDAO.updateUsedCarOwnerNonUsed(vo);    // 차량소유자의 사용여부 N으로 변경.
            usedCarMasterDAO.insertUsedCarOwner(vo);
        }

        // 수정
        for(UsedCarMasterVO vo : obj.getUpdateList()){
            vo.setUpdtUsrId(LoginUtil.getUserId());     // 사용자
            vo.setRegUsrId(LoginUtil.getUserId());

            if(vo.getSeq() < 1){
                usedCarMasterDAO.updateUsedCarOwnerNonUsed(vo);    // 차량소유자의 사용여부 N으로 변경.
                usedCarMasterDAO.insertUsedCarOwner(vo);
            }else{
                usedCarMasterDAO.updateUsedCarOwner(vo);
            }
        }
    }


    /**
     * 조회 조건에 해당하는 차량운전자 정보를 조회한다.
     */
    @Override
    public int selectUsedCarDriverByConditionCnt(UsedCarMasterSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return usedCarMasterDAO.selectUsedCarDriverByConditionCnt(searchVO);
    }

    @Override
    public List<UsedCarMasterVO> selectUsedCarDriverByCondition(UsedCarMasterSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return usedCarMasterDAO.selectUsedCarDriverByCondition(searchVO);
    }

    /**
     * 차량운전자 저장한다.
     */
    @Override
    public void saveUsedCarDriver(BaseSaveVO<UsedCarMasterVO> obj,UsedCarMasterVO usedCarMasterVO) throws Exception{

        // 저장
        for(UsedCarMasterVO vo : obj.getInsertList()){
            vo.setUpdtUsrId(LoginUtil.getUserId());     // 사용자
            vo.setRegUsrId(LoginUtil.getUserId());

            usedCarMasterDAO.insertUsedCarDriver(vo);
        }

        // 수정
        for(UsedCarMasterVO vo : obj.getUpdateList()){
            vo.setUpdtUsrId(LoginUtil.getUserId());     // 사용자
            vo.setRegUsrId(LoginUtil.getUserId());


            if(vo.getSeq() < 1){
                usedCarMasterDAO.insertUsedCarDriver(vo);
            }else{
                usedCarMasterDAO.updateUsedCarDriver(vo);
            }
        }
    }

    /**
     * 중고차 - 계약 차량목록 조회
     */
    @Override
    public int selectUsedCarContsByConditionCnt(UsedCarMasterSearchVO searchVO) throws Exception{

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return usedCarMasterDAO.selectUsedCarContsByConditionCnt(searchVO);
    }

    @Override
    public List<UsedCarMasterVO> selectUsedCarContsByCondition(UsedCarMasterSearchVO searchVO) throws Exception{

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return usedCarMasterDAO.selectUsedCarContsByCondition(searchVO);
    }

    /**
     *
     *  수선 중고차 여부
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectUsedCarRepairOrderByConditionCnt(UsedCarMasterSearchVO searchVO) throws Exception{

        return usedCarMasterDAO.selectUsedCarRepairOrderByConditionCnt(searchVO);
    }

    /**
     *
     * DCS 정비 이력 조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<RepairOrderVO> selectUsedCarRepairOrderByCondition(UsedCarMasterSearchVO searchVO) throws Exception{


        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        List<RepairOrderVO> roList = new ArrayList<RepairOrderVO>();
        List<RepairOrderIfVO> roIfList = new ArrayList<RepairOrderIfVO>();

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        String pattern = dateFormat + " HH:mm:ss";

        //Carmel InterFace Header Info
        Map<String, Object> message = new HashMap<String, Object>();

        message.put("VIN_NO", searchVO.getsVinNo());
        message.put("RO_START_DT", "");
        message.put("RO_END_DT", "");
        message.put("RO_DOC_NO", "");
        message.put("LBR_NM", "");
        message.put("CAR_REG_NO", "");
        message.put("DRIVER_NM", "");
        message.put("RO_TP", "");
        message.put("ITEM_NM", "");

        Data receiveData = serviceCommonService.executeCamelClentSearchResult(message,"SER055");

        if (receiveData.getFooter().getIfResult().equals("Z")) {
            roIfList = receiveData.readMessages(RepairOrderIfVO.class);
            RepairOrderVO roVO = new RepairOrderVO();

            for(int i = 0 ; i <  roIfList.size() ; i++){
                roVO = new RepairOrderVO();

                //roVO.setDlrCd("*****");
                roVO.setDlrCd(roIfList.get(i).getDlrCd());
                roVO.setRoDocNo(roIfList.get(i).getRoDocNo());
                roVO.setRoTpNm(roIfList.get(i).getRoTpNm());
                roVO.setVinNo(roIfList.get(i).getVinNo());
                roVO.setCarRegNo(roIfList.get(i).getCarRegNo());
                roVO.setCarOwnerId(roIfList.get(i).getCarOwnerId());
                roVO.setCarOwnerNm(roIfList.get(i).getCarOwnerNm());
                roVO.setDriverId(roIfList.get(i).getDriverId());
                roVO.setDriverNm(roIfList.get(i).getDriverNm());
                roVO.setRunDistVal(Integer.parseInt(roIfList.get(i).getRunDistVal()));
                roVO.setLastRunDistVal(Integer.parseInt(roIfList.get(i).getLastRunDistVal()));
                roVO.setRoStatCd(roIfList.get(i).getRoStatCd());
                roVO.setRoStatNm(roIfList.get(i).getRoStatNm());
                roVO.setRoDt(DateUtil.convertToTimestamp( roIfList.get(i).getRoDt() ,pattern));
                roVO.setRoGrpNo(roIfList.get(i).getRoGrpNo());
                roVO.setRoStartDt(DateUtil.convertToTimestamp( roIfList.get(i).getRoStartDt() ,pattern));
                roVO.setRoEndDt(DateUtil.convertToTimestamp( roIfList.get(i).getRoEndDt() ,pattern));
                roVO.setCarlineNm(roIfList.get(i).getCarlineNm());
                roVO.setModelNm(roIfList.get(i).getModelNm());
                roList.add(roVO);
            }
        }

        log.info(roList);
        return roList;
    }

}
