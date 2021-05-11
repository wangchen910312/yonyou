package chn.bhmc.dms.ser.cmm.service.impl;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import chn.bhmc.dms.core.util.DateUtil;
import javax.annotation.Resource;
import java.util.Calendar;
import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerGroupService;
import chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService;
import chn.bhmc.dms.crm.cif.service.CustomerRelInfoService;
import chn.bhmc.dms.crm.cif.vo.CustomerGroupVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoVO;
import chn.bhmc.dms.crm.cmm.service.AddressInfoService;
import chn.bhmc.dms.crm.cmm.vo.AddressInfoVO;
import chn.bhmc.dms.sal.veh.service.VehicleMasterService;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterSaveVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterVO;
import chn.bhmc.dms.ser.cmm.service.VehOfCustInfoService;
import chn.bhmc.dms.ser.cmm.service.dao.VehOfCustInfoDAO;
import chn.bhmc.dms.ser.cmm.vo.SpeVehiWarrDeadVO;
import chn.bhmc.dms.ser.cmm.vo.VehOfCustInfoSearchVO;
import chn.bhmc.dms.ser.cmm.vo.VehOfCustInfoVO;
import chn.bhmc.dms.ser.cmm.vo.VehOfReseveInfoSearchVO;
import chn.bhmc.dms.ser.cmm.vo.VehOfReseveInfoVO;
import chn.bhmc.dms.ser.svi.service.LtsModelMappingService;
import chn.bhmc.dms.ser.svi.vo.LtsModelMappingVO;
import chn.bhmc.dms.ser.svi.vo.LtsModelSearchVO;

/**
 * <pre>
 * 서비스 공통용 고객및차량정보 구현 서비스
 * </pre>
 *
 * @ClassName   : VehOfCustInfoServiceImpl.java
 * @Description : 서비스 공통용 고객및차량정보 ServiceImpl
 * @author Yin Xueyuan
 * @since 2016. 3. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 7.   Yin Xueyuan      최초 생성
 * </pre>
 */

@Service("vehOfCustInfoService")
public class VehOfCustInfoServiceImpl extends HService implements VehOfCustInfoService {

    /**
    * 서비스 공통용 고객및차량정보 DAO
    */
    @Resource(name="vehOfCustInfoDAO")
    VehOfCustInfoDAO vehOfCustInfoDAO;

    /**
     * VIN Master 정보
     */
    @Autowired
    VehicleMasterService vehicleMasterService;

    /**
     * LTS MODEL SERVICE
     */
    @Autowired
    LtsModelMappingService ltsModelMappingService;

    @Autowired
    CustomerInfoOutBoundService customerInfoOutBoundService;

    @Autowired
    AddressInfoService addressInfoService;

    @Autowired
    CustomerGroupService customerGroupService;

    @Autowired
    CustomerRelInfoService customerRelInfoService;

   /**
    * 조회 조건에 해당하는 서비스 공통용 고객및차량정보 정보를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 VehOfCustInfoSearchVO
    * @return 조회 목록
    */
   @Override
   public List<VehOfCustInfoVO> selectVehOfCustInfoByCondition(VehOfCustInfoSearchVO searchVO) throws Exception {

       searchVO.setsDlrCd(LoginUtil.getDlrCd());
       searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

       if(!StringUtil.isEmpty(searchVO.getsVinNo())){
           String vinNo = searchVO.getsVinNo();

           if( vinNo.length() == 17 ){
               searchVO.setsFullVinNo(vinNo);
           }else if( vinNo.length() == 6 ){
               searchVO.setsVinNo2(vinNo);
           }
       }

       return vehOfCustInfoDAO.selectVehOfCustInfoByCondition(searchVO);
   }



   /**
    * 조회 조건에 해당하는 서비스 공통용 고객및차량정보 총 갯수를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 VehOfCustInfoSearchVO
    * @return
    */
   @Override
   public int selectVehOfCustInfoByConditionCnt(VehOfCustInfoSearchVO searchVO) throws Exception {
       searchVO.setsDlrCd(LoginUtil.getDlrCd());

       if(!StringUtil.isEmpty(searchVO.getsVinNo())){
           String vinNo = searchVO.getsVinNo();

           if( vinNo.length() == 17 ){
               searchVO.setsFullVinNo(vinNo);
           }else if( vinNo.length() == 6 ){
               searchVO.setsVinNo2(vinNo);
           }
       }
       return vehOfCustInfoDAO.selectVehOfCustInfoByConditionCnt(searchVO);
   }

   /**
    * 조회 조건에 해당하는 서비스 공통용 고객및차량 정보를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 VehOfCustInfoSearchVO
    * @return 조회 목록
    */
   public List<VehOfCustInfoVO> selectVehInfoByCondition(VehOfCustInfoSearchVO searchVO) throws Exception {
       searchVO.setsDlrCd(LoginUtil.getDlrCd());
       searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

       return vehOfCustInfoDAO.selectVehInfoByCondition(searchVO);
   }

   /**
    * 조회 조건에 해당하는 서비스 공통용 고객및차량 총 갯수를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 VehOfCustInfoSearchVO
    * @return
    */
   public int selectVehInfoByConditionCnt(VehOfCustInfoSearchVO searchVO) throws Exception {
       searchVO.setsDlrCd(LoginUtil.getDlrCd());
       return vehOfCustInfoDAO.selectVehInfoByConditionCnt(searchVO);
   }

   /**
    * 조회 조건에 해당하는 서비스 공통용 삼포 고객및차량정보 정보를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 VehOfCustInfoSearchVO
    * @return 조회 목록
    */
    @Override
    public List<VehOfCustInfoVO> selectSanbaoVehOfCustInfoByCondition(VehOfCustInfoSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());


        return vehOfCustInfoDAO.selectSanbaoVehOfCustInfoByCondition(searchVO);

    }



    /**
     * 조회 조건에 해당하는 서비스 공통용 삼포 고객및차량정보 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehOfCustInfoSearchVO
     * @return
     */
    @Override
    public int selectSanbaoVehOfCustInfoByConditionCnt(VehOfCustInfoSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return vehOfCustInfoDAO.selectSanbaoVehOfCustInfoByConditionCnt(searchVO);

    }



   @Override
   public List<VehOfCustInfoVO> selectVehOfCustInfoByKey(VehOfCustInfoSearchVO searchVO) throws Exception {

       VehicleMasterSearchVO vehSearchVO = new VehicleMasterSearchVO();
       vehSearchVO.setsDlrCd(LoginUtil.getDlrCd());
       vehSearchVO.setsVinNo(searchVO.getsVinNo());
       vehSearchVO.setsCarId(searchVO.getsCarId());
       vehSearchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
       vehSearchVO.setsUseYn("Y");

/*       List<VehicleMasterVO> vehVO = vehicleMasterService.selectVehicleMasterByCondition(vehSearchVO);
       if(vehVO.size() > 0 ){
           vehSearchVO.setsCarId(vehVO.get(0).getCarId());
       }*/

       int cnt = vehicleMasterService.selectVehicleMasterOwnerByConditionCnt(vehSearchVO);

       if(cnt <= 0){
           searchVO.setsQueryJoin("RIGHT");
       }
       searchVO.setsDlrCd(LoginUtil.getDlrCd());
       searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());



       List<VehOfCustInfoVO> vehOfCustInfoList = vehOfCustInfoDAO.selectVehOfCustInfoByKey(searchVO);

       //보증 만료일자 계산
       //보증 시작일자가 없을시 skip
       if(vehOfCustInfoList.size() > 0 && StringUtil.nullConvert(searchVO.getsVinNo()) != ""){
    	   //增加特殊车辆维修工单信息 保修截止日期计算方式 贾明 2019-3-11 start
    	   List<SpeVehiWarrDeadVO> speVehiWaDeVO = vehOfCustInfoDAO.selectSpecialVehicleWarrDeadInfo(searchVO);
    	   if(speVehiWaDeVO.size() > 0){
    		   int normWarrper = speVehiWaDeVO.get(0).getNormWarrPer();//正常保修保修期 月份
    		   if(vehOfCustInfoList.get(0).getGrteStartDt() != null){
    			   Date  grteEndDate = DateUtil.add(vehOfCustInfoList.get(0).getGrteStartDt(), Calendar.MONTH, normWarrper);
    			   Date  grteEndDt = DateUtil.add(grteEndDate, Calendar.DATE, -1);
    			   vehOfCustInfoList.get(0).setGrteEndDt(grteEndDt);
    		   }
    		   
    	   } else {
    	   //增加特殊车辆维修工单信息 保修截止日期计算方式 贾明 2019-3-11 end
           if(vehOfCustInfoList.get(0).getGrteStartDt() != null){
               VehOfCustInfoSearchVO wartSearchVO = new VehOfCustInfoSearchVO();
               wartSearchVO.setsLtsModelCd(StringUtil.nullConvert(vehOfCustInfoList.get(0).getLtsModelCd()));
               wartSearchVO.setsCarDstinCd(StringUtil.nullConvert(vehOfCustInfoList.get(0).getCarDstinCd()));
               wartSearchVO.setGrteStartDt(vehOfCustInfoList.get(0).getGrteStartDt());

               VehOfCustInfoVO grteDtVO = vehOfCustInfoDAO.selectVehOfWartEndDtByKey(wartSearchVO);
               if(grteDtVO != null){
                   if(grteDtVO.getGrteEndDt() != null){
                       vehOfCustInfoList.get(0).setGrteEndDt(grteDtVO.getGrteEndDt());
                   }
               }
           }
         }
       }
       if(!StringUtil.nullConvert(searchVO.getsCarId()).equals("")){

           if(vehOfCustInfoList.size() > 0 ){

               //고객 태그
               List<CustomerGroupVO> CustomerGroupListVO = customerGroupService.selectCustomerGroupByKey(vehOfCustInfoList.get(0).getCarOwnerId(), "002",
                       vehSearchVO.getsDlrCd(), "");

               StringBuffer sb = new StringBuffer("");
               int grpCnt=0;
               for(CustomerGroupVO customerGroupVO : CustomerGroupListVO){
                   if(grpCnt == 0 ) {
                       sb.append(customerGroupVO.getGrpNm());
                   }
                   else {
                       sb.append(",");
                       sb.append(customerGroupVO.getGrpNm());
                   }
                   grpCnt++;
               }
               vehOfCustInfoList.get(0).setCustTag(sb.toString());
           }
       }
       //2021.03.31 update by tjx 校验是否需要发送保修app start
       if("Y".equals(vehOfCustInfoList.get(0).getCarlineYn()) && "Y".equals(vehOfCustInfoList.get(0).getPcYn())) {
    	   vehOfCustInfoList.get(0).setWarrantyYn("Y");
       }else {
    	   vehOfCustInfoList.get(0).setWarrantyYn("N");
       }
       //2021.03.31 update by tjx 校验是否需要发送保修app end
       return vehOfCustInfoList;
   }



    @Override
    public VehOfCustInfoVO selectVehOfWartEndDtByKey(VehOfCustInfoSearchVO vehOfCustInfoSearchVO) throws Exception {

       VehOfCustInfoSearchVO wartSearchVO = new VehOfCustInfoSearchVO();

       LtsModelSearchVO ltsSearchVO = new LtsModelSearchVO();
       ltsSearchVO.setsVinNo(vehOfCustInfoSearchVO.getsVinNo());

       LtsModelMappingVO ltsModelMappingVO = ltsModelMappingService.selectMappingLtsModelCdByKey(ltsSearchVO);
       wartSearchVO.setsLtsModelCd(StringUtil.nullConvert(ltsModelMappingVO.getLtsModelCd())); // LTS MODEL CD
       wartSearchVO.setGrteStartDt(vehOfCustInfoSearchVO.getGrteStartDt()); //보증시작일
       wartSearchVO.setsCarDstinCd(vehOfCustInfoSearchVO.getsCarDstinCd()); //차량유형(승용 : P , 택시 : C)

        return vehOfCustInfoDAO.selectVehOfWartEndDtByKey(vehOfCustInfoSearchVO);
    }



    @Override
    public List<VehOfCustInfoVO> selectSanbaoVehOfCustInfoByKey(VehOfCustInfoSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return vehOfCustInfoDAO.selectSanbaoVehOfCustInfoByKey(searchVO);
    }



    /*
     * {@inheritDoc}
     */
    @Override
    public LtsModelMappingVO selectLtsModelInfosByCondition(LtsModelSearchVO searchVO) throws Exception {

        return ltsModelMappingService.selectMappingLtsModelCdByKey(searchVO);

    }

    /**
     * 서비스 공통용 : 다건의 당일 예약 정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignSearchVO
     * @return 당일 예약 정보 목록 데이터
     */
    public List<VehOfReseveInfoVO> selectVehOfReseveInfoByCondition(VehOfReseveInfoSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return vehOfCustInfoDAO.selectVehOfReseveInfoByCondition(searchVO);
    }

    /**
     * 서비스 공통용 : 차량, 소유자, 운전자 등록/수정
     * @param VehOfCustInfoVO
     */
    public Map<String, String> multiVehOfCustInfo(VehOfCustInfoVO vehOfCustInfoVO) throws Exception {

        String loginId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();
        String carId = "";
        String ownerBpCd="";
        Map<String, String> map = new HashMap<String, String>();

        log.info("########### VIN && CUST INFO START ####################");
        log.info("VIN NO : " + vehOfCustInfoVO.getVinNo());
        log.info("CAR_ID : " + vehOfCustInfoVO.getCarId());
        log.info("CAR_ONWER_CUST_CD : " + vehOfCustInfoVO.getCarOwnerCustCd());
        log.info("CAR_ONWER_CUST_ID : " + vehOfCustInfoVO.getCarOwnerId());
        log.info("DRIVER_CUST_CD : " + vehOfCustInfoVO.getDriverCustCd());
        log.info("DRIVER_CUST_ID : " + vehOfCustInfoVO.getDriverId());
        log.info("########### VIN && CUST INFO END ####################");

        if(!StringUtil.isEmpty(vehOfCustInfoVO.getVinNo())){

            VehOfCustInfoSearchVO vehOfCustInfoSearchVO = new VehOfCustInfoSearchVO();
            vehOfCustInfoSearchVO.setsDlrCd(LoginUtil.getDlrCd());
            vehOfCustInfoSearchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
            vehOfCustInfoSearchVO.setsVinNo(vehOfCustInfoVO.getVinNo());

            if(!StringUtil.isEmpty(vehOfCustInfoVO.getVinNo())){
                String vinNo = vehOfCustInfoVO.getVinNo();

                if( vinNo.length() == 17 ){
                    vehOfCustInfoSearchVO.setsFullVinNo(vinNo);
                }else if( vinNo.length() == 6 ){
                    vehOfCustInfoSearchVO.setsVinNo2(vinNo);
                }
            }
            int cnt = vehOfCustInfoDAO.selectVehOfCustInfoByConditionCnt(vehOfCustInfoSearchVO);

            VehicleMasterSearchVO searchVO = new VehicleMasterSearchVO();
            searchVO.setsVinNo(vehOfCustInfoVO.getVinNo());
            List<VehicleMasterVO> vehicleList = vehicleMasterService.selectDcsVehicleInfo(searchVO);

            if(cnt <= 0 && vehicleList.size() > 0){
                throw processException("ser.lbl.existVinVerify");
            }
        }

        VehicleMasterSaveVO masterSaveVO = new VehicleMasterSaveVO();
        VehicleMasterVO vehicleMasterVO = new VehicleMasterVO();

        if(vehOfCustInfoVO.getNcarDstinCd().equals("O")){ //타사차량
            vehicleMasterVO.setCarId(vehOfCustInfoVO.getCarId());
            vehicleMasterVO.setVinNo(vehOfCustInfoVO.getVinNo());
            vehicleMasterVO.setCarBrandCd(vehOfCustInfoVO.getCarBrandCd());
            vehicleMasterVO.setManufactYyMmDt(StringUtil.nullConvert(vehOfCustInfoVO.getManufactYyMmDt()).replaceAll("-", ""));
            vehicleMasterVO.setDlrCd(LoginUtil.getDlrCd());
            vehicleMasterVO.setCarRegNo(vehOfCustInfoVO.getCarRegNo());
            vehicleMasterVO.setTemp1(vehOfCustInfoVO.getModelNm());
            vehicleMasterVO.setCarRunDistVal(vehOfCustInfoVO.getCarRunDistVal());
            vehicleMasterVO.setCarStatCd("70");
            vehicleMasterVO.setCarDispQty(vehOfCustInfoVO.getCarDispQty());
            vehicleMasterVO.setOrdDlrCd(LoginUtil.getDlrCd());
            vehicleMasterVO.setEnginSerialNo(vehOfCustInfoVO.getEnginNo());
            vehicleMasterVO.setGrteEndDt(vehOfCustInfoVO.getGrteEndDt());
            vehicleMasterVO.setCustSaleDt(vehOfCustInfoVO.getCustSaleDt());

            masterSaveVO.setVehicleMasterVO(vehicleMasterVO);

            carId = vehicleMasterService.saveNewCar(vehicleMasterVO);
            vehOfCustInfoVO.setCarId(carId);


        } else {
            /** 차량마스터 update
             *  VehicleMasterVO   -->  VehicleMasterSaveVO 바뀜.   09.29 kim yewon
             * **/
            vehicleMasterVO.setCarId(vehOfCustInfoVO.getCarId());
            vehicleMasterVO.setVinNo(vehOfCustInfoVO.getVinNo());
            vehicleMasterVO.setCarRegNo(vehOfCustInfoVO.getCarRegNo());    //차량번호
            vehicleMasterVO.setModelCd(vehOfCustInfoVO.getModelCd());
            vehicleMasterVO.setCarBrandCd(vehOfCustInfoVO.getCarBrandCd());
            vehicleMasterVO.setCarRunDistVal(vehOfCustInfoVO.getCarRunDistVal());
            vehicleMasterVO.setEnginSerialNo(vehOfCustInfoVO.getEnginNo());
            vehicleMasterVO.setGrteEndDt(vehOfCustInfoVO.getGrteEndDt());
            vehicleMasterVO.setCustSaleDt(vehOfCustInfoVO.getCustSaleDt());
            vehicleMasterVO.setUpdtUsrId(loginId);
            //vehicleMasterVO.setOrdDlrCd(dlrCd);

            masterSaveVO.setVehicleMasterVO(vehicleMasterVO);
            vehicleMasterService.saveVehicleMasterMain(masterSaveVO);
            vinMasterChangeCall(vehOfCustInfoVO);

            carId = vehOfCustInfoVO.getCarId();
        }

        CustomerInfoVO returnCustomerInfoVO = new CustomerInfoVO();
        VehicleMasterSaveVO saveVO = new VehicleMasterSaveVO();

        if(!StringUtil.isEmpty(vehOfCustInfoVO.getCarOwnerNm()) && !StringUtil.isEmpty(vehOfCustInfoVO.getCarId())) {     // 소유자

            CustomerInfoVO customerInfoVO = new CustomerInfoVO();
            customerInfoVO.setCustNo(vehOfCustInfoVO.getCarOwnerId());
            customerInfoVO.setCustNm(vehOfCustInfoVO.getCarOwnerNm());
            customerInfoVO.setHpNo(vehOfCustInfoVO.getCarOwnerHpNo());
            customerInfoVO.setSsnCrnNo(vehOfCustInfoVO.getCarOwnerSsnCrnNo());
            customerInfoVO.setTelNo(vehOfCustInfoVO.getCarOwnerTelNo());
            customerInfoVO.setEmailNm(vehOfCustInfoVO.getCarOwnerMailNm());
            customerInfoVO.setCustTp(vehOfCustInfoVO.getCarOwnerCustTp());
            customerInfoVO.setCustCd(vehOfCustInfoVO.getCarOwnerCustCd());
            customerInfoVO.setPrefCommMthCd(vehOfCustInfoVO.getCarOwnerPrefCommMthCd());
            customerInfoVO.setPrefCommNo(vehOfCustInfoVO.getCarOwnerPrefCommNo());
            customerInfoVO.setOfficeTelNo(vehOfCustInfoVO.getCarOwnerOfficeTelNo());
            customerInfoVO.setMathDocTp(vehOfCustInfoVO.getCarOwnerMathDocTp());
            customerInfoVO.setSexCd(vehOfCustInfoVO.getCarOwnerSexCd());

            customerInfoVO.setOldHpNo(vehOfCustInfoVO.getCarOwnerHpNo());
            customerInfoVO.setOldCustNm(vehOfCustInfoVO.getCarOwnerNm());
            customerInfoVO.setOldMathDocTp(vehOfCustInfoVO.getCarOwnerMathDocTp());
            customerInfoVO.setOldSsnCrnNo(vehOfCustInfoVO.getCarOwnerSsnCrnNo());
            customerInfoVO.setCustTp(vehOfCustInfoVO.getCarOwnerCustTp());
            customerInfoVO.setBirthDt(vehOfCustInfoVO.getCarOwnerBirthDt());
            customerInfoVO.setPurcMngNm(vehOfCustInfoVO.getCarOwnerPurcMngNm());
            customerInfoVO.setCustCollSrcCd("02");


            if(StringUtil.nullConvert(vehOfCustInfoVO.getCarOwnerRelCd()).equals("01")){  // 차량소유자와 동일할경우는
                customerInfoVO.setPrefContactMthCd(vehOfCustInfoVO.getDriverPrefContactMthCd());
            }

            CustomerInfoSearchVO searchVO = new CustomerInfoSearchVO();
            searchVO.setsCustNm(customerInfoVO.getCustNm());
            searchVO.setsHpNo(customerInfoVO.getHpNo());
            searchVO.setsOfficeTelNo(customerInfoVO.getOfficeTelNo());
            searchVO.setsMathDocTp(customerInfoVO.getMathDocTp());
            searchVO.setsSsnCrnNo(customerInfoVO.getSsnCrnNo());
            searchVO.setsCustTp(customerInfoVO.getCustTp());
            searchVO.setsCustCd(customerInfoVO.getCustCd());


            // 고객정보 저장 및 수정
            // 고객명+핸드폰
            if( (StringUtil.nullConvert(customerInfoVO.getCustNo()).equals(""))){
                returnCustomerInfoVO = customerInfoOutBoundService.insertCustomer(customerInfoVO);
                ownerBpCd = returnCustomerInfoVO.getCustNo();
            } else {
                customerInfoVO.setCommandTp("SERVICE");
                returnCustomerInfoVO = customerInfoOutBoundService.updateCustomer(customerInfoVO);
                ownerBpCd = returnCustomerInfoVO.getCustNo();
            }

            // 주소저장
            AddressInfoVO addressInfoVO = new AddressInfoVO();
            addressInfoVO.setSeq(vehOfCustInfoVO.getCarOwnerAddrSeq());
            addressInfoVO.setRefTableNm("CR_0101T");
            addressInfoVO.setrefKeyNm(vehOfCustInfoVO.getCarOwnerId());
            addressInfoVO.setAddrTp(StringUtil.isEmpty(vehOfCustInfoVO.getCarOwnerAddrTp()) ? "09" : vehOfCustInfoVO.getCarOwnerAddrTp());
            addressInfoVO.setSungCd(vehOfCustInfoVO.getCarOwnerSungCd());
            addressInfoVO.setSungNm(vehOfCustInfoVO.getCarOwnerSungNm());
            addressInfoVO.setCityCd(vehOfCustInfoVO.getCarOwnerCityCd());
            addressInfoVO.setCityNm(vehOfCustInfoVO.getCarOwnerCityNm());
            addressInfoVO.setDistCd(vehOfCustInfoVO.getCarOwnerDistCd());
            addressInfoVO.setDistNm(vehOfCustInfoVO.getCarOwnerDistNm());
            addressInfoVO.setZipCd(vehOfCustInfoVO.getCarOwnerZipCd());
            addressInfoVO.setAddrDetlCont(vehOfCustInfoVO.getCarOwnerAddrDetlCont());
            addressInfoVO.setFlagYn("Y");
            addressInfoVO.setUseYn("Y");

            if(!StringUtil.isEmpty(vehOfCustInfoVO.getCarOwnerSungCd()) && !StringUtil.isEmpty(vehOfCustInfoVO.getCarOwnerCityCd()) && !StringUtil.isEmpty(vehOfCustInfoVO.getCarOwnerDistCd())){
                if(StringUtil.nullConvert(vehOfCustInfoVO.getCarOwnerAddrSeq()) == ""){
                    // 주소저장
                    addressInfoService.insertAddressInfo(addressInfoVO);
                } else {
                    // 주소수정
                    addressInfoVO.setSeq(vehOfCustInfoVO.getCarOwnerAddrSeq());
                    addressInfoService.updateAddressInfo(addressInfoVO);
                }
            }

            /** 차량소유자(그리드저장[insert,update]) **/
            VehicleMasterSearchVO ownerSearchVO = new VehicleMasterSearchVO();
            ownerSearchVO.setsDlrCd(dlrCd);
            ownerSearchVO.setsCarId(vehOfCustInfoVO.getCarId());
            ownerSearchVO.setsBpCd(ownerBpCd);
            ownerSearchVO.setsUseYn("Y");

            List<VehicleMasterVO> ownerList = new ArrayList<VehicleMasterVO>();
            VehicleMasterVO ownerVO = new VehicleMasterVO();

            int ownerCnt = vehicleMasterService.selectVehicleMasterOwnerByConditionCnt(ownerSearchVO);

            ownerVO.setDlrCd(dlrCd);
            ownerVO.setCarId(vehOfCustInfoVO.getCarId());
            ownerVO.setVinNo(vehOfCustInfoVO.getVinNo());
            ownerVO.setSeq(vehOfCustInfoVO.getCarOwnerSeq() <= 0 ? 1 : vehOfCustInfoVO.getCarOwnerSeq());
            ownerVO.setBpCd(ownerBpCd);
            ownerVO.setUseYn("Y");
            ownerVO.setRegUsrId(loginId);
            ownerVO.setUpdtUsrId(loginId);
            ownerList.add(ownerVO);

            BaseSaveVO<VehicleMasterVO> ownerGridVO = new BaseSaveVO<VehicleMasterVO>();

            if(ownerCnt > 0){
                ownerGridVO.setUpdateList(ownerList);
                saveVO.setOwnerGridVO(ownerGridVO);
                saveVO.setVehicleMasterVO(vehicleMasterVO);
            } else {
                ownerGridVO.setInsertList(ownerList);
                saveVO.setOwnerGridVO(ownerGridVO);
                saveVO.setVehicleMasterVO(vehicleMasterVO);
            }
            vehicleMasterService.saveVehicleMasterOwner(saveVO);

        }

        if(!StringUtil.isEmpty(vehOfCustInfoVO.getDriverNm()) && !StringUtil.isEmpty(vehOfCustInfoVO.getCarId())){

            CustomerInfoVO customerInfoVO = new CustomerInfoVO();
            customerInfoVO.setCustNo(vehOfCustInfoVO.getDriverId());
            customerInfoVO.setCustNm(vehOfCustInfoVO.getDriverNm());
            customerInfoVO.setSsnCrnNo(vehOfCustInfoVO.getDriverSsnCrnNo());
            customerInfoVO.setHpNo(vehOfCustInfoVO.getDriverHpNo());
            customerInfoVO.setTelNo(vehOfCustInfoVO.getDriverTelNo());
            customerInfoVO.setEmailNm(vehOfCustInfoVO.getDriverMailNm());
            customerInfoVO.setCustTp(vehOfCustInfoVO.getDriverCustTp());
            customerInfoVO.setCustCd(vehOfCustInfoVO.getDriverCustCd());
            customerInfoVO.setPrefCommMthCd(vehOfCustInfoVO.getDriverPrefCommMthCd());
            customerInfoVO.setPrefCommNo(vehOfCustInfoVO.getDriverPrefCommNo());
            customerInfoVO.setOfficeTelNo(vehOfCustInfoVO.getDriverOfficeTelNo());
            customerInfoVO.setMathDocTp(vehOfCustInfoVO.getDriverMathDocTp());
            customerInfoVO.setSexCd(vehOfCustInfoVO.getDriverSexCd());

            customerInfoVO.setOldHpNo(vehOfCustInfoVO.getDriverHpNo());
            customerInfoVO.setOldCustNm(vehOfCustInfoVO.getDriverNm());
            customerInfoVO.setOldMathDocTp(vehOfCustInfoVO.getDriverMathDocTp());
            customerInfoVO.setOldSsnCrnNo(vehOfCustInfoVO.getDriverSsnCrnNo());
            customerInfoVO.setCustCollSrcCd("02");

            customerInfoVO.setBirthDt(vehOfCustInfoVO.getDriverBirthDt());
            customerInfoVO.setPrefContactMthCd(vehOfCustInfoVO.getDriverPrefContactMthCd());

            CustomerInfoSearchVO searchVO = new CustomerInfoSearchVO();
            searchVO.setsCustNm(customerInfoVO.getCustNm());
            searchVO.setsHpNo(customerInfoVO.getHpNo());
            searchVO.setsOfficeTelNo(customerInfoVO.getOfficeTelNo());
            searchVO.setsMathDocTp(customerInfoVO.getMathDocTp());
            searchVO.setsSsnCrnNo(customerInfoVO.getSsnCrnNo());
            searchVO.setsCustTp(customerInfoVO.getCustTp());
            searchVO.setsCustCd(customerInfoVO.getCustCd());

            // 주소정보 셋팅
            AddressInfoVO addressInfoVO = new AddressInfoVO();
            addressInfoVO.setRefTableNm("CR_0101T");
            addressInfoVO.setrefKeyNm(vehOfCustInfoVO.getDriverId());
            addressInfoVO.setAddrTp(StringUtil.isEmpty(vehOfCustInfoVO.getDriverAddrTp()) ? "09" : vehOfCustInfoVO.getDriverAddrTp());
            addressInfoVO.setSungCd(vehOfCustInfoVO.getDriverSungCd());
            addressInfoVO.setSungNm(vehOfCustInfoVO.getDriverSungNm());
            addressInfoVO.setCityCd(vehOfCustInfoVO.getDriverCityCd());
            addressInfoVO.setCityNm(vehOfCustInfoVO.getDriverCityNm());
            addressInfoVO.setDistCd(vehOfCustInfoVO.getDriverDistCd());
            addressInfoVO.setDistNm(vehOfCustInfoVO.getDriverDistNm());
            addressInfoVO.setZipCd(vehOfCustInfoVO.getDriverZipCd());
            addressInfoVO.setAddrDetlCont(vehOfCustInfoVO.getDriverAddrDetlCont());
            addressInfoVO.setFlagYn("Y");
            addressInfoVO.setUseYn("Y");

            String driverBpCd = vehOfCustInfoVO.getDriverId();

            // 고객정보 저장 및 수정
            if(StringUtil.nullConvert(vehOfCustInfoVO.getCarOwnerRelCd()).equals("01")){  // 차량소유자와 동일할경우
                driverBpCd = ownerBpCd;
            } else {
//                CustomerInfoVO obj = null;
//                if(vehOfCustInfoVO.getDriverCustCd().equals("01")){
//                    obj = customerInfoOutBoundService.selectCustDupByKey(searchVO);
//                } else {
//                    obj = customerInfoOutBoundService.selectCustMathDocDupByKey(searchVO);
//                }
                //if(obj == null){
                if(StringUtil.isEmpty(vehOfCustInfoVO.getDriverId())){ // driverID(CustNo) 없을 시 insert 탄다
                    returnCustomerInfoVO = customerInfoOutBoundService.insertCustomer(customerInfoVO);
                    driverBpCd = returnCustomerInfoVO.getCustNo();
                } else {
                    customerInfoVO.setCommandTp("SERVICE");

//                    if(StringUtil.isEmpty(customerInfoVO.getCustNo())){
//                        if(obj != null){
//                            customerInfoVO.setCustNo(obj.getCustNo());
//                        }
//                    }
                    returnCustomerInfoVO = customerInfoOutBoundService.updateCustomer(customerInfoVO);
                    driverBpCd = returnCustomerInfoVO.getCustNo();
                }

                if(!StringUtil.isEmpty(vehOfCustInfoVO.getDriverSungCd()) && !StringUtil.isEmpty(vehOfCustInfoVO.getDriverCityCd()) && !StringUtil.isEmpty(vehOfCustInfoVO.getDriverDistCd())){
                    if(StringUtil.nullConvert(vehOfCustInfoVO.getDriverAddrSeq()) == ""){
                        // 주소저장
                        addressInfoService.insertAddressInfo(addressInfoVO);
                    } else {
                        // 주소수정
                        addressInfoVO.setSeq(vehOfCustInfoVO.getDriverAddrSeq());
                        addressInfoService.updateAddressInfo(addressInfoVO);
                    }
                }
            }

            /** 차량운전자(그리드저장(insert,update) **/
            VehicleMasterSearchVO driverSearchVO = new VehicleMasterSearchVO();
            driverSearchVO.setsDlrCd(dlrCd);
            driverSearchVO.setsCarId(vehOfCustInfoVO.getCarId());
            driverSearchVO.setsBpCd(driverBpCd);
            driverSearchVO.setsUseYn("Y");

            List<VehicleMasterVO> driverList = new ArrayList<VehicleMasterVO>();
            VehicleMasterVO driverVO = new VehicleMasterVO();

            int ownerCnt = vehicleMasterService.selectVehicleMasterDriverByConditionCnt(driverSearchVO);

            driverVO.setDlrCd(dlrCd);
            driverVO.setCarId(vehOfCustInfoVO.getCarId());
            driverVO.setVinNo(vehOfCustInfoVO.getVinNo());
            driverVO.setSeq(vehOfCustInfoVO.getDriverSeq() <= 0 ? 1 : vehOfCustInfoVO.getDriverSeq());
            driverVO.setBpCd(driverBpCd);
            driverVO.setUseYn("Y");
            driverVO.setMdriverYn("Y");
            driverVO.setRegUsrId(loginId);
            driverVO.setUpdtUsrId(loginId);
            driverVO.setCarOwnerRelCd(vehOfCustInfoVO.getCarOwnerRelCd());
            driverList.add(driverVO);

            BaseSaveVO<VehicleMasterVO> driverGridVO = new BaseSaveVO<VehicleMasterVO>();

            if(ownerCnt > 0){
                driverGridVO.setUpdateList(driverList);
                saveVO.setDriverGridVO(driverGridVO);
                saveVO.setVehicleMasterVO(vehicleMasterVO);
            } else {
                driverGridVO.setInsertList(driverList);
                saveVO.setDriverGridVO(driverGridVO);
                saveVO.setVehicleMasterVO(vehicleMasterVO);
            }
            vehicleMasterService.saveVehicleMasterDriver(saveVO);
        }

        map.put("carId", carId);
        map.put("carOwnerId", ownerBpCd);

        return map;
    }

    /**
     * 삼포 대상 빈 등록
     */
    public void insertSanbaoVinInfo(HashMap<String, Object> map)throws Exception{

        vehOfCustInfoDAO.insertSanbaoVinInfo(map);
    }

    /**
     * 차량마스터 수정후 호출 프로시져
     */
    public void vinMasterChangeCall(VehOfCustInfoVO vehOfCustInfoVO)throws Exception {
        vehOfCustInfoDAO.vinMasterChangeCall(vehOfCustInfoVO);
    }

    /**
     * PDI 여부 체크
     */
    public String selectVehOfPdiChkByKey(VehOfCustInfoSearchVO vehOfCustInfoSearchVO)throws Exception{

        return vehOfCustInfoDAO.selectVehOfPdiChkByKey(vehOfCustInfoSearchVO);

    }

    /**
     *
     * 차량검증(DCS)
     *
     * @param vehOfCustInfoSearchVO
     * @return
     * @throws Exception
     */
    public List<VehicleMasterVO> verifyDcsVinMasterInfo(VehOfCustInfoSearchVO vehOfCustInfoSearchVO)throws Exception {


        vehOfCustInfoSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        vehOfCustInfoSearchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        if(!StringUtil.isEmpty(vehOfCustInfoSearchVO.getsVinNo())){
           String vinNo = vehOfCustInfoSearchVO.getsVinNo();

           if( vinNo.length() == 17 ){
               vehOfCustInfoSearchVO.setsFullVinNo(vinNo);
           }else if( vinNo.length() == 6 ){
               vehOfCustInfoSearchVO.setsVinNo2(vinNo);
           }
       }

        int cnt = vehOfCustInfoDAO.selectVehOfCustInfoByConditionCnt(vehOfCustInfoSearchVO);

        if(cnt > 0){
            throw processException("sal.info.registedVehicleMasterVinNo");
        }

        VehicleMasterSearchVO searchVO = new VehicleMasterSearchVO();
        searchVO.setsVinNo(vehOfCustInfoSearchVO.getsVinNo());
        searchVO.setsCarlineCd(vehOfCustInfoSearchVO.getsCarlineCd());
        searchVO.setsCarRegNo(vehOfCustInfoSearchVO.getsCarNo());

        List<VehicleMasterVO> vehicleList = vehicleMasterService.selectDcsVehicleInfo(searchVO);

        return vehicleList;
    }


    /**
     * 车辆销售日期查询
     * @param vehOfCustInfoSearchVO
     * @return
     */
	@Override
	public VehOfCustInfoSearchVO selectCustSaleDt(VehOfCustInfoSearchVO vehOfCustInfoSearchVO) {
		return vehOfCustInfoDAO.selectCustSaleDt(vehOfCustInfoSearchVO);
	}

}
