package chn.bhmc.dms.sal.svo.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import able.com.vo.HMap;

import org.jxls.common.Context;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.dao.FileMgrDAO;
import chn.bhmc.dms.cmm.sci.vo.FileItemVO;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.sal.cmm.service.SalesCommonCamelService;
import chn.bhmc.dms.sal.svo.service.GroupSalesApplicationPopupService;
import chn.bhmc.dms.sal.svo.service.dao.GroupSalesApplicationDAO;
import chn.bhmc.dms.sal.svo.vo.GroupSalesApplicationJdgVO;
import chn.bhmc.dms.sal.svo.vo.GroupSalesApplicationPopupVO;
import chn.bhmc.dms.sal.svo.vo.GroupSalesApplicationSaveVO;
import chn.bhmc.dms.sal.svo.vo.GroupSalesApplicationSearchVO;
import chn.bhmc.dms.sal.svo.vo.GroupSalesApplicationVO;
import chn.bhmc.dms.sal.svo.vo.GroupSalesApplicationVehVO;
import chn.bhmc.dms.sal.svo.vo.IncentiveUseIFVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterPopupVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterWSIfVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : GroupSalesApplicationServiceImpl
 * @Description : 집단판매신청
 * @author
 * @since 2016. 3. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.20          최초 생성
 * </pre>
 */

@Service("groupSalesApplicationPopupService")
public class GroupSalesApplicationPopupServiceImpl extends HService implements GroupSalesApplicationPopupService , JxlsSupport{

    /**
     * 집단판매신청 DAO 선언
     */
    @Resource(name="groupSalesApplicationDAO")
    GroupSalesApplicationDAO groupSalesApplicationDAO;


    // id Gen 서비스
    @Resource(name="salHelpCarNoIdGenService")
    EgovIdGnrService salHelpCarNoIdGenService;


    @Resource(name="fileMgrDAO")
    FileMgrDAO fileMgrDAO;


    @Autowired
    SalesCommonCamelService salesCommonCamelService;


    /**
     * 조회 조건에 해당하는 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 GroupSalesApplicationSearchVO
     * @return 조회 목록
     */
    @Override
    public List<GroupSalesApplicationVO> selectGroupSalesApplicationByCondition(GroupSalesApplicationSearchVO searchVO) throws Exception{
        return groupSalesApplicationDAO.selectGroupSalesApplicationByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 GroupSalesApplicationSearchVO
     * @return
     */
    @Override
    public int selectGroupSalesApplicationByConditionCnt(GroupSalesApplicationSearchVO searchVO) throws Exception{
        return groupSalesApplicationDAO.selectGroupSalesApplicationByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 목록 상세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 GroupSalesApplicationVO
     * @return 조회 목록
     */
    @Override
    public List<GroupSalesApplicationVO> selectGroupSalesApplicationDetailByCondition(GroupSalesApplicationVO searchVO) throws Exception{
        return groupSalesApplicationDAO.selectGroupSalesApplicationDetailByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 법인 - 집단판매 신청 상세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 GroupSalesApplicationVO
     * @return 조회 목록
     */
    public GroupSalesApplicationVO selectGroupSalesApplicationDetailByKey(GroupSalesApplicationSearchVO searchVO) throws Exception{

        if( StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        if( StringUtil.nullConvert(searchVO.getsUsrId()).equals("") ){
            searchVO.setsUsrId(LoginUtil.getUserId());
        }
        return groupSalesApplicationDAO.selectGroupSalesApplicationDetailByKey(searchVO);
    }


    /**
     * 조회 조건에 해당하는  차량 상세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 GroupSalesApplicationVO
     * @return 조회 목록
     */
    @Override
    public List<GroupSalesApplicationVehVO> selectGroupSalesApplicationDetVehByCondition(GroupSalesApplicationSearchVO searchVO) throws Exception{
        return groupSalesApplicationDAO.selectGroupSalesApplicationDetVehByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는  차량심사 상세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 GroupSalesApplicationVO
     * @return 조회 목록
     */
    @Override
    public List<GroupSalesApplicationJdgVO> selectGroupSalesApplicationDetJdgByCondition(GroupSalesApplicationSearchVO searchVO) throws Exception{

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return groupSalesApplicationDAO.selectGroupSalesApplicationDetJdgByCondition(searchVO);
    }


    /**
     * 법인 - 집단 판매신청 저장/수정 (SA_0413T, SA_0414T, SA_0415T)
     */
    public GroupSalesApplicationVO multiGroupSalesApplication(GroupSalesApplicationSaveVO saveVO) throws Exception{

        GroupSalesApplicationVO grpSaleAppVO = saveVO.getGroupSalesApplicationVO();
        List<GroupSalesApplicationVehVO> vehicleListVO = saveVO.getVehicleListVO();

        grpSaleAppVO.setUsrId(LoginUtil.getUserId());

        if( StringUtil.nullConvert(grpSaleAppVO.getDlrCd()).equals("")){
            grpSaleAppVO.setDlrCd(LoginUtil.getDlrCd());
        }
        if( grpSaleAppVO.getReqSeq() > 0 ){

            grpSaleAppVO.setUpdtUsrId(LoginUtil.getUserId());
            groupSalesApplicationDAO.updateGroupSalesApplication(grpSaleAppVO);
        }else{
            grpSaleAppVO.setRegUsrId(LoginUtil.getUserId());
            groupSalesApplicationDAO.insertGroupSalesApplication(grpSaleAppVO);       //INSERT SA_0414T
        }

        //차량정보 삭제
        groupSalesApplicationDAO.deleteGroupSalesApplicationVeh(grpSaleAppVO);
        groupSalesApplicationDAO.deleteGroupSalesApplicationVehDet(grpSaleAppVO);


        for( GroupSalesApplicationVehVO vehVO : vehicleListVO ){

            vehVO.setDlrCd(grpSaleAppVO.getDlrCd());
            vehVO.setReqSeq(grpSaleAppVO.getReqSeq());
            vehVO.setRegUsrId(LoginUtil.getUserId());
            vehVO.setUsrId(LoginUtil.getUserId());

            groupSalesApplicationDAO.insertGroupSalesApplicationVeh(vehVO);      //INSERT SA_0415T
            groupSalesApplicationDAO.insertGroupSalesApplicationVehDet(vehVO);   //INSERT SA_0413T
        }

        if(grpSaleAppVO.getApproveCd().equals("B") || grpSaleAppVO.getApproveCd().equals("C")){
            //집단판매신청정보수신1
            groupSalesApplicationDAO.procFleetSaleFigureReq1(grpSaleAppVO);

            try{
                //Carmel InterFace Header Info
                Map<String, Object> message = new HashMap<String, Object>();
                salesCommonCamelService.executeCamelClent(message,"SAL087"); //집단오더 헤더  SA_0414IS
                salesCommonCamelService.executeCamelClent(message,"SAL088"); //집단판매신청정보수신 SA_0413IS
                salesCommonCamelService.executeCamelClent(message,"SAL089"); //집단판매신청정보수신 SA_0415IS

            }catch(Exception e){
                groupSalesApplicationDAO.procFleetSaleFigureReq1RollBack(grpSaleAppVO);
                log.error(e.getMessage(),e);
                throw e;
            }
        }

        GroupSalesApplicationSearchVO searchVO = new GroupSalesApplicationSearchVO();
        searchVO.setsDlrCd(grpSaleAppVO.getDlrCd());
        searchVO.setsUsrId(grpSaleAppVO.getUsrId());
        searchVO.setsReqSeq(grpSaleAppVO.getReqSeq());

        GroupSalesApplicationVO resultSaleAppVO = groupSalesApplicationDAO.selectGroupSalesApplicationDetailByKey(searchVO);

        return resultSaleAppVO;
    }




    /**
     * 법인 - 집단 판매신청 확정 (SA_0414T)
     */
    public GroupSalesApplicationVO updateGroupSalesApplicationCnfrm(GroupSalesApplicationVO saveVO) throws Exception{

        groupSalesApplicationDAO.updateGroupSalesApplicationCnfrm(saveVO);


        //집단판매신청정보수신1
        groupSalesApplicationDAO.procFleetSaleFigureReq1(saveVO);

        GroupSalesApplicationVO groupSalesApplicationVO = groupSalesApplicationDAO.selectGroupSalesApplication(saveVO);


        return groupSalesApplicationVO;
    }
    /**
     * 법인 - 집단 판매신청 삭제 (SA_0413T, SA_0414T, SA_0415T)
     */
    public int deleteGroupSalesApplication(GroupSalesApplicationVO delVO) throws Exception{

        groupSalesApplicationDAO.deleteGroupSalesApplicationVehDet(delVO);
        groupSalesApplicationDAO.deleteGroupSalesApplicationVeh(delVO);
        groupSalesApplicationDAO.deleteGroupSalesApplication(delVO);

        return 0;
    }


    /**
     * 조회 조건에 해당하는 법인 - 집단판매 신청 팝업 적용 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 GroupSalesApplicationSearchVO
     * @return 조회 목록
     */
    public List<GroupSalesApplicationPopupVO> applyGroupSalesApplicationPopup(GroupSalesApplicationSaveVO searchListVO) throws Exception{

        ArrayList<GroupSalesApplicationPopupVO> rsltList = new ArrayList<GroupSalesApplicationPopupVO>();


        for( GroupSalesApplicationPopupVO searchVO : searchListVO.getApplyList() ){

            List<GroupSalesApplicationPopupVO> checkList = groupSalesApplicationDAO.applyGroupSalesApplicationPopup(searchVO);

            if( checkList.size() < 1 ){

                // Vin No의 차량이 존재하지 않습니다.
                throw processException("global.info.confirmMsgParam2"
                                      , new String[]{messageSource.getMessage("global.lbl.vinNum", null, LocaleContextHolder.getLocale())
                                                    ,messageSource.getMessage("sal.lbl.engineNo", null, LocaleContextHolder.getLocale())
                                                    ,"(VIN NO : " + searchVO.getVinNo() + ")"});
            }else if( checkList.size() > 1 ){
                // Vin No가 중복되는 차량이 존재합니다.
                throw processException("global.err.duplicate");
            }else{

                GroupSalesApplicationPopupVO checkVO = (GroupSalesApplicationPopupVO)checkList.get(0);

                if( !checkVO.getEnginNo().equals(searchVO.getEnginNo()) ){
                    // Engine No의 차량이 존재하지 않습니다.
                    throw processException("global.info.confirmMsgParam2"
                                          , new String[]{messageSource.getMessage("global.lbl.vinNum", null, LocaleContextHolder.getLocale())
                                                        ,messageSource.getMessage("sal.lbl.engineNo", null, LocaleContextHolder.getLocale())
                                                        ,"(ENGINE NO : " + searchVO.getEnginNo() + ")"});
                }else{
                    rsltList.add(checkVO);
                }
            }
        }

        return rsltList;
    }



    /**
     * 법인 - 집단 판매신청 저장/수정 (SA_0413T, SA_0414T, SA_0415T)
     */
    public List<GroupSalesApplicationVehVO> groupSalesApplication(GroupSalesApplicationSaveVO saveVO) throws Exception{
    	List<GroupSalesApplicationVehVO> groupSalesApplicationVehVO = null;

        for( GroupSalesApplicationVehVO searchVO : saveVO.getInsertGroupSalesApplicationVehList() ){

            searchVO.setDlrCd(saveVO.getDlrCd());
            searchVO.setReqSeq(saveVO.getReqSeq());
            searchVO.setRegUsrId(LoginUtil.getUserId());
            searchVO.setUpdtUsrId(LoginUtil.getUserId());
            searchVO.setUsrId(saveVO.getUsrId());


            groupSalesApplicationDAO.insertGroupSalesApplicationVeh(searchVO);  //INSERT SA_0415T

            //집단판매신청정보수신3
            groupSalesApplicationDAO.procFleetSaleFigureReq3(searchVO);

            groupSalesApplicationDAO.insertGroupSalesApplicationVehDet(searchVO);   //INSERT SA_0413T

            //집단판매신청정보수신2
            groupSalesApplicationDAO.procFleetSaleFigureReq2(searchVO);

        }

        GroupSalesApplicationSearchVO searchVO = new GroupSalesApplicationSearchVO();
        searchVO.setsDlrCd(saveVO.getDlrCd());
        searchVO.setsUsrId(saveVO.getUsrId());
        searchVO.setsReqSeq(saveVO.getReqSeq());
        groupSalesApplicationVehVO = groupSalesApplicationDAO.selectGroupSalesApplicationDetVehByCondition(searchVO);


        return groupSalesApplicationVehVO;
    }



    /**
     * 집단판매신청시 조회할 차량(팝업)
     */
    @Override
    public int selectVehicleInfoByConditionCnt(GroupSalesApplicationSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        if(StringUtil.nullConvert(searchVO.getsUsrId()).equals("")){
            searchVO.setsUsrId(LoginUtil.getUserId());
        }

        return groupSalesApplicationDAO.selectVehicleInfoByConditionCnt(searchVO);
    }
    @Override
    public List<VehicleMasterPopupVO> selectVehicleInfoByCondition(GroupSalesApplicationSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        if(StringUtil.nullConvert(searchVO.getsUsrId()).equals("")){
            searchVO.setsUsrId(LoginUtil.getUserId());
        }

        return groupSalesApplicationDAO.selectVehicleInfoByCondition(searchVO);
    }

    @Override
    public List<VehicleMasterPopupVO> selectDcsVehicleInfoByCondition(GroupSalesApplicationSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        if(StringUtil.nullConvert(searchVO.getsUsrId()).equals("")){
            searchVO.setsUsrId(LoginUtil.getUserId());
        }

        List<VehicleMasterPopupVO> dmsVinUseYnList = groupSalesApplicationDAO.selectVehicleInfoUseYnByCondition(searchVO);
        /*List<VehicleMasterPopupVO> dmsList = groupSalesApplicationDAO.selectVehicleInfoByCondition(searchVO);
        return dmsList;
         */
        // DCS VIN 조회  WebService
        Map<String, Object> message = new HashMap<String, Object>();
        message.put("I_DLR_CD",     LoginUtil.getDlrCd());
        message.put("I_VIN_NO",     searchVO.getsVinNo());
        message.put("I_CARLINE_CD", searchVO.getsCarlineCd());
        message.put("TEMP1", "");
        message.put("TEMP2", "");
        message.put("TEMP3", "");
        message.put("TEMP4", "");

        Data receiveData = salesCommonCamelService.executeCamelClentSearchResult(message,"SAL182");
        List<VehicleMasterPopupVO> dcsVinList = new ArrayList<VehicleMasterPopupVO>();
        List<VehicleMasterWSIfVO> vehicleIfListVO = new ArrayList<VehicleMasterWSIfVO>();

        List<Map<String, Object>> vinList = new ArrayList<Map<String, Object>>();
        Map<String, Object> messages = new HashMap<String, Object>();

        if (receiveData.getFooter().getIfResult().equals("Z")) {
            vehicleIfListVO = receiveData.readMessages(VehicleMasterWSIfVO.class);

            for(VehicleMasterWSIfVO listVO : vehicleIfListVO){
                VehicleMasterPopupVO vehicleMasterVO = new VehicleMasterPopupVO();

                if(!listVO.getVinNo().equals("")){

                    vehicleMasterVO.setVinNo(listVO.getVinNo());
                    vehicleMasterVO.setCarId(listVO.getCarId());
                    vehicleMasterVO.setCarlineCd(listVO.getCarlineCd());
                    vehicleMasterVO.setCarlineNm(listVO.getCarlineNm());
                    vehicleMasterVO.setCarlineCdNm(listVO.getCarlineCdNm());
                    vehicleMasterVO.setModelCd(listVO.getModelCd());
                    vehicleMasterVO.setModelCdNm(listVO.getModelCdNm());
                    vehicleMasterVO.setModelNm(listVO.getModelNm());
                    vehicleMasterVO.setOcnCd(listVO.getOcnCd());
                    vehicleMasterVO.setOcnCdNm(listVO.getOcnCdNm());
                    vehicleMasterVO.setOcnNm(listVO.getOcnNm());
                    vehicleMasterVO.setExtColorCd(listVO.getExtColorCd());
                    vehicleMasterVO.setExtColorCdNm(listVO.getExtColorCdNm());
                    vehicleMasterVO.setExtColorNm(listVO.getExtColorNm());
                    vehicleMasterVO.setIntColorCd(listVO.getIntColorCd());
                    vehicleMasterVO.setWhPrc(Double.parseDouble(listVO.getWhPrc()));        // DCS에서 MS_PRC 로 변경. 2017.07.01 김진석. (령연요청)
                    vehicleMasterVO.setDcRate(Double.parseDouble(listVO.getTemp1()));
                    vehicleMasterVO.setAamt(Double.parseDouble(listVO.getTemp2()));
                    vehicleMasterVO.setUseYn(listVO.getUseYn());

                    dcsVinList.add(vehicleMasterVO);
                    //인센티브 받은 여부 체크 : 사용가능한  VIN
                    if(listVO.getUseYn().equals("Y")){
                        Map<String, Object> vinHmap = new HashMap<String, Object>();
                        vinHmap.put("SIGN","I");
                        vinHmap.put("OPTION","EQ");
                        vinHmap.put("LOW",listVO.getVinNo());
                        vinHmap.put("HIGH","");
                        vinList.add(vinHmap);
                    }
                }
            };
             messages.put("IM_KSCHL", "Z106");
             messages.put("IR_VIN", vinList);
             messages.put("DLR_CD", "");

            if(dmsVinUseYnList.size() > 0 &&  dcsVinList.size() > 0){
                //DMS DCS 사용여부 체크
                if(dcsVinList.size() > 0 ){
                    dcsVinList = compareToVin(dcsVinList , dmsVinUseYnList);
                }
            }
            //인센티브 ERP 체크 WebService
            List<IncentiveUseIFVO> incentiveIfList = new ArrayList<IncentiveUseIFVO>();
            List<VehicleMasterPopupVO> incetiveVinList = new ArrayList<VehicleMasterPopupVO>();
            if(vinList.size() > 0 ){

                Data receiveListData = salesCommonCamelService.executeCamelClentListResult(messages,"SAL121","ERP");
                incentiveIfList = receiveListData.readMessages(IncentiveUseIFVO.class);

                if (receiveListData.getFooter().getIfResult().equals("1")) {

                    for(IncentiveUseIFVO incentiveVO : incentiveIfList){
                        VehicleMasterPopupVO vehicleVO = new VehicleMasterPopupVO();
                        vehicleVO.setVinNo(incentiveVO.getVin());
                        vehicleVO.setUseYn("03");
                        incetiveVinList.add(vehicleVO);
                    }
                    dcsVinList = compareToVin(dcsVinList , incetiveVinList);
                }
            }
        }
        return dcsVinList;

    }

    /**
     *
     * 중복빈 제거
     *
     * @param list
     * @param list2
     * @return
     * @throws Exception
     */
    public List<VehicleMasterPopupVO> compareToVin(List<VehicleMasterPopupVO> list , List<VehicleMasterPopupVO> list2)throws Exception{

        List<VehicleMasterPopupVO> resultList = new ArrayList<VehicleMasterPopupVO>();
        VehicleMasterPopupVO masterVO = new VehicleMasterPopupVO();
        VehicleMasterPopupVO compareVO = new VehicleMasterPopupVO();

        if(list.size() > 0 ){
            for( int i = 0 ; i < list.size() ; i++){

                masterVO = list.get(i);
                for(int j = 0 ; j < list2.size() ; j++){
                    compareVO = list2.get(j);
                    if(masterVO.getVinNo().compareTo(compareVO.getVinNo()) == 0 ){

                        masterVO.setUseYn(compareVO.getUseYn());
                    }
                }
                resultList.add(masterVO);
            }
        }
        return resultList;
    }


    /**
     * 집단판매신청된 차량을 상세조회.
     */
    @Override
    public int selectDetlVehPopByConditionCnt(GroupSalesApplicationSearchVO searchVO) throws Exception {
        return groupSalesApplicationDAO.selectDetlVehPopByConditionCnt(searchVO);
    }
    @Override
    public List<GroupSalesApplicationVehVO> selectDetlVehPopByCondition(GroupSalesApplicationSearchVO searchVO) throws Exception {
        return groupSalesApplicationDAO.selectDetlVehPopByCondition(searchVO);
    }

    /**
     * 프로모션 수정.
     */
    @Override
    public void deleteGroupSalesVeh(GroupSalesApplicationSaveVO vo) throws Exception {

        for(GroupSalesApplicationVehVO veh : vo.getDeleteGroupSalesApplicationVehList()){
            groupSalesApplicationDAO.deleteGroupSalesVehDetl(veh);
            groupSalesApplicationDAO.deleteGroupSalesVehSubHead(veh);
        }
    }

    /**
     * 법인 - 집단 판매신청 확정 (SA_0414T)
     */
    public void updateGroupSalesFile(GroupSalesApplicationVehVO vehVO) throws Exception{

        vehVO.setUpdtUsrId(LoginUtil.getUserId());
        groupSalesApplicationDAO.updateGroupSalesFile(vehVO);

    }

    public void updateSaveAddFile(GroupSalesApplicationVehVO vehVO) throws Exception{

        vehVO.setUpdtUsrId(LoginUtil.getUserId());

        groupSalesApplicationDAO.deleteSaveAddFile(vehVO);
        groupSalesApplicationDAO.updateSaveAddFile(vehVO);
        groupSalesApplicationDAO.updateSaveAddFileForInterface(vehVO);
    }

    /**
    *
    * 저장된 파일 목록
    *
    * @param searchVO
    * @return
    * @throws Exception
    */
    public List<FileItemVO> selectGroupSalesFileByCondition(GroupSalesApplicationSearchVO searchVO) throws Exception{

       if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
           searchVO.setsDlrCd(LoginUtil.getDlrCd());
       }
       if(StringUtil.nullConvert(searchVO.getsUsrId()).equals("")){
           searchVO.setsUsrId(LoginUtil.getUserId());
       }
       return groupSalesApplicationDAO.selectGroupSalesFileByCondition(searchVO);
    }

    /**
    *
    * 스펙 사용여부
    *
    * @param searchVO
    * @return
    * @throws Exception
    */
    public List<VehicleMasterPopupVO> selectVehicleInfoUseYnByCondition(GroupSalesApplicationSearchVO searchVO) throws Exception{

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        return groupSalesApplicationDAO.selectVehicleInfoUseYnByCondition(searchVO);
    }

    /**
     * 엑셀 다운로드
     * @param list
     * @throws Exception
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        GroupSalesApplicationSearchVO searchVO = new GroupSalesApplicationSearchVO();

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        List<GroupSalesApplicationVehVO> list = groupSalesApplicationDAO.selectDetlVehPopByCondition(searchVO);

        context.putVar("items", list);
    }
}
