package chn.bhmc.dms.ser.cmm.service.impl;


import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService;
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

       searchVO.setsDlrCd(LoginUtil.getDlrCd());
       searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
       return vehOfCustInfoDAO.selectVehOfCustInfoByKey(searchVO);
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


       // LTS MODEL CODE
       String ltsModelCd = ltsModelMappingService.selectLtsModelMapping(searchVO.getsVinNo());

       // LTS MODEL NAME
       searchVO.setsLtsModelCd(ltsModelCd);

       return ltsModelMappingService.selectLtsModelInfosByCondition(searchVO);

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
    public void multiVehOfCustInfo(VehOfCustInfoVO vehOfCustInfoVO) throws Exception {

        String loginId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        if(StringUtil.isEmpty(vehOfCustInfoVO.getCarId())){

        } else {
            /** 차량마스터 update **/
            VehicleMasterVO masterVO = new VehicleMasterVO();
            masterVO.setCarId(vehOfCustInfoVO.getCarId());
            masterVO.setVinNo(vehOfCustInfoVO.getVinNo());
            masterVO.setCarRegNo(vehOfCustInfoVO.getCarRegNo());    //차량번호
            masterVO.setModelCd(vehOfCustInfoVO.getModelCd());
            masterVO.setCarBrandCd(vehOfCustInfoVO.getCarBrandCd());
            masterVO.setCarRunDistVal(vehOfCustInfoVO.getCarRunDistVal());
            masterVO.setUpdtUsrId(loginId);
            //vehicleMasterService.saveVehicleMasterMain(masterVO);
        }


        CustomerInfoVO returnCustomerInfoVO = null;
        VehicleMasterSaveVO saveVO = new VehicleMasterSaveVO();

        if(vehOfCustInfoVO.getSaveType().equals("owner")) {     // 소유자

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

            customerInfoVO.setOldHpNo(vehOfCustInfoVO.getCarOwnerHpNo());
            customerInfoVO.setOldCustNm(vehOfCustInfoVO.getCarOwnerNm());
            customerInfoVO.setOldMathDocTp(vehOfCustInfoVO.getCarOwnerMathDocTp());
            customerInfoVO.setOldSsnCrnNo(vehOfCustInfoVO.getCarOwnerSsnCrnNo());

            returnCustomerInfoVO = customerInfoOutBoundService.updateCustomer(customerInfoVO);

            // 주소저장
            AddressInfoVO addressInfoVO = new AddressInfoVO();
            addressInfoVO.setSeq(vehOfCustInfoVO.getCarOwnerAddrSeq());
            addressInfoVO.setRefTableNm("CR_0101T");
            addressInfoVO.setrefKeyNm(vehOfCustInfoVO.getCarOwnerId());
            addressInfoVO.setAddrTp(vehOfCustInfoVO.getCarOwnerAddrTp());
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

            addressInfoService.updateAddressInfo(addressInfoVO);

            /** 차량소유자(그리드저장[insert,update]) **/
            VehicleMasterSearchVO ownerSearchVO = new VehicleMasterSearchVO();
            ownerSearchVO.setsDlrCd(dlrCd);
            ownerSearchVO.setsCarId(vehOfCustInfoVO.getCarId());
            ownerSearchVO.setsBpCd(returnCustomerInfoVO.getCustNo());
            ownerSearchVO.setsUseYn("Y");

            List<VehicleMasterVO> ownerList = new ArrayList<VehicleMasterVO>();
            VehicleMasterVO ownerVO = new VehicleMasterVO();

            int ownerCnt = vehicleMasterService.selectVehicleMasterOwnerByConditionCnt(ownerSearchVO);

            ownerVO.setDlrCd(dlrCd);
            ownerVO.setCarId(vehOfCustInfoVO.getCarId());
            ownerVO.setVinNo(vehOfCustInfoVO.getVinNo());
            ownerVO.setSeq(vehOfCustInfoVO.getCarOwnerSeq() <= 0 ? 1 : vehOfCustInfoVO.getCarOwnerSeq());
            ownerVO.setBpCd(returnCustomerInfoVO.getCustNo());
            ownerVO.setUseYn("Y");
            ownerVO.setRegUsrId(loginId);
            ownerVO.setUpdtUsrId(loginId);
            ownerList.add(ownerVO);

/*            if(ownerCnt > 0){
               saveVO.setUpdateOwnerList(ownerList);
            } else {
               saveVO.setInsertOwnerList(ownerList);
            }*/
            vehicleMasterService.saveVehicleMasterOwner(saveVO);

        } else if(vehOfCustInfoVO.getSaveType().equals("driver")){

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

            customerInfoVO.setOldHpNo(vehOfCustInfoVO.getDriverHpNo());
            customerInfoVO.setOldCustNm(vehOfCustInfoVO.getDriverNm());
            customerInfoVO.setOldMathDocTp(vehOfCustInfoVO.getDriverMathDocTp());
            customerInfoVO.setOldSsnCrnNo(vehOfCustInfoVO.getDriverSsnCrnNo());

            CustomerInfoSearchVO searchVO = new CustomerInfoSearchVO();
            searchVO.setsCustNm(customerInfoVO.getCustNm());
            searchVO.setsHpNo(customerInfoVO.getHpNo());
            searchVO.setsOfficeTelNo(customerInfoVO.getOfficeTelNo());
            searchVO.setsMathDocTp(customerInfoVO.getMathDocTp());
            searchVO.setsSsnCrnNo(customerInfoVO.getSsnCrnNo());
            searchVO.setsCustTp(customerInfoVO.getCustTp());

            // 주소정보 셋팅
            AddressInfoVO addressInfoVO = new AddressInfoVO();
            addressInfoVO.setRefTableNm("CR_0101T");
            addressInfoVO.setrefKeyNm(vehOfCustInfoVO.getDriverId());
            addressInfoVO.setAddrTp(vehOfCustInfoVO.getDriverAddrTp());
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

            String driverBpCd="";
            // 고객정보 저장 및 수정
            if(vehOfCustInfoVO.getDriverSaveTp().equals("update")) {
                returnCustomerInfoVO = customerInfoOutBoundService.updateCustomer(customerInfoVO);
                driverBpCd = returnCustomerInfoVO.getCustNo();
                // 주소수정
                addressInfoVO.setSeq(vehOfCustInfoVO.getDriverAddrSeq());
                addressInfoService.updateAddressInfo(addressInfoVO);
            } else {
                // 고객명+핸드폰
                CustomerInfoVO obj = customerInfoOutBoundService.selectCustDupByKey(searchVO);
                CustomerInfoVO obj2 = customerInfoOutBoundService.selectCustMathDocDupByKey(searchVO);

                driverBpCd = obj.getCustNo()  == null ? obj2.getCustNo() : obj.getCustNo();
                if(obj == null || obj2 == null){
                    returnCustomerInfoVO = customerInfoOutBoundService.insertCustomer(customerInfoVO);
                    // 주소저장
                    addressInfoService.insertAddressInfo(addressInfoVO);
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

            driverVO.setDlrCd(dlrCd);
            driverVO.setCarId(vehOfCustInfoVO.getCarId());
            driverVO.setVinNo(vehOfCustInfoVO.getVinNo());
            driverVO.setSeq(vehOfCustInfoVO.getDriverSeq() <= 0 ? 1 : vehOfCustInfoVO.getDriverSeq());
            driverVO.setBpCd(driverBpCd);
            driverVO.setUseYn("Y");
            driverVO.setMdriverYn("Y");
            driverVO.setRegUsrId(loginId);
            driverVO.setUpdtUsrId(loginId);
            driverList.add(driverVO);

/*            if(vehOfCustInfoVO.getDriverSaveTp().equals("update")){
                saveVO.setUpdateDriverList(driverList);
            } else {
                saveVO.setInsertDriverList(driverList);
            }*/
            vehicleMasterService.saveVehicleMasterDriver(saveVO);
        }

    }

}
