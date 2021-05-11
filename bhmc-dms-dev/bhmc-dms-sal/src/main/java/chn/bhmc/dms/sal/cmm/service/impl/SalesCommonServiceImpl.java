package chn.bhmc.dms.sal.cmm.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.veh.vo.CarInfoSearchVO;

import chn.bhmc.dms.ser.cmm.service.dao.VehOfCustInfoDAO;

import chn.bhmc.dms.ser.cmm.vo.VehOfCustInfoSearchVO;

import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.DealerVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoVO;
import chn.bhmc.dms.crm.cmm.service.AddressInfoService;
import chn.bhmc.dms.crm.cmm.vo.AddressInfoVO;
import chn.bhmc.dms.sal.cmm.service.SalesCommonService;
import chn.bhmc.dms.sal.cmm.service.dao.SalesCommonDAO;
import chn.bhmc.dms.sal.cmm.vo.MobileSumSrchVO;
import chn.bhmc.dms.sal.cmm.vo.MobileSumVO;
import chn.bhmc.dms.sal.veh.service.VehicleMasterService;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterSaveVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterVO;
import chn.bhmc.dms.ser.cmm.vo.VehOfCustInfoVO;
import chn.bhmc.dms.sal.veh.vo.CarInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : SalesCommonServiceImpl
 * @Description : 판매 공통
 * @author
 * @since 2016. 9. 27.
 * @version 1.0
 * @see
 * @Modification Information
 *
 *               <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 27.      KIM YEWON            최초 생성
 * </pre>
 */

@Service("salesCommonService")
public class SalesCommonServiceImpl extends HService implements SalesCommonService {

    /**
     * 판매공통 DAO 선언
     */
    @Resource(name = "salesCommonDAO")
    SalesCommonDAO salesCommonDAO;

    /**
     * 서비스 공통용 고객및차량정보 DAO
     */
    @Resource(name = "vehOfCustInfoDAO")
    VehOfCustInfoDAO vehOfCustInfoDAO;

    /**
     * 차량마스터 Master 정보
     */
    @Autowired
    VehicleMasterService vehicleMasterService;

    /**
     * CRM 고객정보
     */
    @Autowired
    CustomerInfoOutBoundService customerInfoOutBoundService;

    /**
     * CRM 주소정보
     */
    @Autowired
    AddressInfoService addressInfoService;

    /**
     * 로그인된 딜러로 사업부,사업소,성,시를 조회.
     */
    @Override
    public DealerVO selectDealerInfo(DealerSearchVO searchVO) throws Exception {
        return salesCommonDAO.selectDealerInfo(searchVO);
    }

    /**
     * 딜러마스터에서 사업부를 그룹핑하여 조회(COUNT).
     */
    @Override
    public int selectDealerSdptCnt(DealerSearchVO searchVO) throws Exception {
        return salesCommonDAO.selectDealerSdptCnt(searchVO);
    }

    /**
     * 딜러마스터에서 사업부를 그룹핑하여 조회.
     */
    @Override
    public List<DealerVO> selectDealerSdpt(DealerSearchVO searchVO) throws Exception {
        return salesCommonDAO.selectDealerSdpt(searchVO);
    }

    /**
     * 딜러마스터에서 사무소를 그룹핑하여 조회(COUNT).
     */
    @Override
    public int selectDealerOfficeCnt(DealerSearchVO searchVO) throws Exception {
        return salesCommonDAO.selectDealerOfficeCnt(searchVO);
    }

    /**
     * 딜러마스터에서 사무소를 그룹핑하여 조회.
     */
    @Override
    public List<DealerVO> selectDealerOffice(DealerSearchVO searchVO) throws Exception {
        return salesCommonDAO.selectDealerOffice(searchVO);
    }

    /**
     * 딜러마스터에서 성을 그룹핑하여 조회(COUNT).
     */
    @Override
    public int selectDealerSungCnt(DealerSearchVO searchVO) throws Exception {
        return salesCommonDAO.selectDealerSungCnt(searchVO);
    }

    /**
     * 딜러마스터에서 사무소를 그룹핑하여 조회.
     */
    @Override
    public List<DealerVO> selectDealerSung(DealerSearchVO searchVO) throws Exception {
        return salesCommonDAO.selectDealerSung(searchVO);
    }

    /**
     * 딜러마스터에서 도시를 그룹핑하여 조회(COUNT).
     */
    @Override
    public int selectDealerCityCnt(DealerSearchVO searchVO) throws Exception {
        return salesCommonDAO.selectDealerCityCnt(searchVO);
    }

    /**
     * 딜러마스터에서 사무소를 그룹핑하여 조회.
     */
    @Override
    public List<DealerVO> selectDealerCity(DealerSearchVO searchVO) throws Exception {
        return salesCommonDAO.selectDealerCity(searchVO);
    }

    /**
     * 딜러마스터에서 딜러를 조회(COUNT).
     */
    @Override
    public int selectDealerCnt(DealerSearchVO searchVO) throws Exception {
        return salesCommonDAO.selectDealerCnt(searchVO);
    }

    /**
     * 딜러마스터에서 사무소를 그룹핑하여 조회.
     */
    @Override
    public List<DealerVO> selectDealer(DealerSearchVO searchVO) throws Exception {
        return salesCommonDAO.selectDealer(searchVO);
    }

    /**
     * 로그인한 USER의 심사등급을 가져온다.
     */
    @Override
    public String selectUserEvalGrade(String dlrCd, String usrId, String wrkDstinCd) throws Exception {
        return salesCommonDAO.selectUserEvalGrade(dlrCd, usrId, wrkDstinCd);
    }

    /**
     * 모바일메인화면 조회
     */
    @Override
    public List<MobileSumVO> selectMobileMainSum(MobileSumSrchVO searchVO) throws Exception {
        // searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return salesCommonDAO.selectMobileMainSum(searchVO);
    }

    /**
     * 타사차량 고객등록
     **/
    @Override
    public String multiVehOfCustInfo(VehOfCustInfoVO vehOfCustInfoVO) throws Exception {

        String loginId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();
        String carId = "";
        String ownerBpCd = "";

        if (!StringUtil.isEmpty(vehOfCustInfoVO.getVinNo())) {

            VehOfCustInfoSearchVO vehOfCustInfoSearchVO = new VehOfCustInfoSearchVO();
            vehOfCustInfoSearchVO.setsDlrCd(LoginUtil.getDlrCd());
            vehOfCustInfoSearchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
            vehOfCustInfoSearchVO.setsVinNo(vehOfCustInfoVO.getVinNo());

            if (!StringUtil.isEmpty(vehOfCustInfoVO.getVinNo())) {
                String vinNo = vehOfCustInfoVO.getVinNo();

                if (vinNo.length() == 17) {
                    vehOfCustInfoSearchVO.setsFullVinNo(vinNo);
                } else if (vinNo.length() == 6) {
                    vehOfCustInfoSearchVO.setsVinNo2(vinNo);
                }
            }
            int cnt = vehOfCustInfoDAO.selectVehOfCustInfoByConditionCnt(vehOfCustInfoSearchVO);

            VehicleMasterSearchVO searchVO = new VehicleMasterSearchVO();
            searchVO.setsVinNo(vehOfCustInfoVO.getVinNo());
            // searchVO.setsCarlineCd(vehOfCustInfoVO.getCarlineCd());
            // searchVO.setsCarRegNo(vehOfCustInfoVO.getCarRegNo());
            List<VehicleMasterVO> vehicleList = vehicleMasterService.selectDcsVehicleInfo(searchVO);

            if (cnt <= 0 && vehicleList.size() > 0) {
                throw processException("ser.lbl.existVinVerify");
            }
        }

        VehicleMasterSaveVO masterSaveVO = new VehicleMasterSaveVO();
        VehicleMasterVO vehicleMasterVO = new VehicleMasterVO();

        if (vehOfCustInfoVO.getNcarDstinCd().equals("O")) { // 타사차량
            vehicleMasterVO.setCarId(vehOfCustInfoVO.getCarId());
            vehicleMasterVO.setVinNo(vehOfCustInfoVO.getVinNo());
            vehicleMasterVO.setCarBrandCd(vehOfCustInfoVO.getCarBrandCd());
            vehicleMasterVO.setManufactYyMmDt(StringUtil.nullConvert(vehOfCustInfoVO.getManufactYyMmDt()).replaceAll(
                    "-", ""));
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

            carId = vehicleMasterService.saveNewCar(vehicleMasterVO);
            vehOfCustInfoVO.setCarId(carId);
        } else {
            /**
             * 차량마스터 update
             * VehicleMasterVO --> VehicleMasterSaveVO 바뀜. 09.29 kim yewon
             * **/
            vehicleMasterVO.setCarId(vehOfCustInfoVO.getCarId());
            vehicleMasterVO.setVinNo(vehOfCustInfoVO.getVinNo());
            vehicleMasterVO.setCarRegNo(vehOfCustInfoVO.getCarRegNo()); // 차량번호
            vehicleMasterVO.setModelCd(vehOfCustInfoVO.getModelCd());
            vehicleMasterVO.setCarBrandCd(vehOfCustInfoVO.getCarBrandCd());
            vehicleMasterVO.setCarRunDistVal(vehOfCustInfoVO.getCarRunDistVal());
            vehicleMasterVO.setEnginSerialNo(vehOfCustInfoVO.getEnginNo());
            vehicleMasterVO.setGrteEndDt(vehOfCustInfoVO.getGrteEndDt());
            vehicleMasterVO.setCustSaleDt(vehOfCustInfoVO.getCustSaleDt());
            vehicleMasterVO.setUpdtUsrId(loginId);
            // vehicleMasterVO.setOrdDlrCd(dlrCd);

            masterSaveVO.setVehicleMasterVO(vehicleMasterVO);
            vehicleMasterService.saveVehicleMasterMain(masterSaveVO);

            carId = vehOfCustInfoVO.getCarId();
        }

        CustomerInfoVO returnCustomerInfoVO = new CustomerInfoVO();
        VehicleMasterSaveVO saveVO = new VehicleMasterSaveVO();

        if (!StringUtil.isEmpty(vehOfCustInfoVO.getCarOwnerNm())) { // 소유자

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
            customerInfoVO.setCustCollSrcCd("02");

            if (StringUtil.nullConvert(vehOfCustInfoVO.getCarOwnerRelCd()).equals("01")) { // 차량소유자와
                                                                                           // 동일할경우는
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

            // String ownerBpCd="";

            // 고객정보 저장 및 수정
            // 고객명+핸드폰
            CustomerInfoVO obj2 = customerInfoOutBoundService.selectCustMathDocDupByKey(searchVO);

            if (obj2 == null) {
                returnCustomerInfoVO = customerInfoOutBoundService.insertCustomer(customerInfoVO);
                ownerBpCd = returnCustomerInfoVO.getCustNo();
            } else {
                customerInfoVO.setCommandTp("ASSIGN");
                if (StringUtil.isEmpty(customerInfoVO.getCustNo())) {
                    if (obj2 != null) {
                        customerInfoVO.setCustNo(obj2.getCustNo());
                    }
                }
                returnCustomerInfoVO = customerInfoOutBoundService.updateCustomer(customerInfoVO);
                ownerBpCd = returnCustomerInfoVO.getCustNo();
            }

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

            if (StringUtil.isEmpty(vehOfCustInfoVO.getCarOwnerAddrTp())) {
                addressInfoVO.setAddrTp("01"); // 우편번호 - CRM033
            }

            if (!StringUtil.isEmpty(vehOfCustInfoVO.getCarOwnerSungCd())
                    && !StringUtil.isEmpty(vehOfCustInfoVO.getCarOwnerCityCd())
                    && !StringUtil.isEmpty(vehOfCustInfoVO.getCarOwnerDistCd())) {
                if (StringUtil.nullConvert(vehOfCustInfoVO.getCarOwnerAddrSeq()) == "") {
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

            if (ownerCnt > 0) {
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

        if (!StringUtil.isEmpty(vehOfCustInfoVO.getDriverNm())) {

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

            String driverBpCd = vehOfCustInfoVO.getDriverId();
            // 고객정보 저장 및 수정

            if (!StringUtil.nullConvert(vehOfCustInfoVO.getCarOwnerRelCd()).equals("01")) { // 차량소유자와
                                                                                            // 동일할경우는
                                                                                            // 제외

                CustomerInfoVO obj = null;

                if (vehOfCustInfoVO.getDriverCustCd().equals("01")) {
                    obj = customerInfoOutBoundService.selectCustDupByKey(searchVO);
                } else {
                    obj = customerInfoOutBoundService.selectCustMathDocDupByKey(searchVO);
                }

                if (obj == null) {
                    returnCustomerInfoVO = customerInfoOutBoundService.insertCustomer(customerInfoVO);
                    driverBpCd = returnCustomerInfoVO.getCustNo();
                } else {
                    customerInfoVO.setCommandTp("ASSIGN");
                    if (StringUtil.isEmpty(customerInfoVO.getCustNo())) {
                        if (obj != null) {
                            customerInfoVO.setCustNo(obj.getCustNo());
                        }
                    }
                    returnCustomerInfoVO = customerInfoOutBoundService.updateCustomer(customerInfoVO);
                    driverBpCd = returnCustomerInfoVO.getCustNo();
                }

                if (StringUtil.isEmpty(vehOfCustInfoVO.getDriverAddrTp())) {
                    addressInfoVO.setAddrTp("01"); // 우편번호 - CRM033
                }

                if (!StringUtil.isEmpty(vehOfCustInfoVO.getDriverSungCd())
                        && !StringUtil.isEmpty(vehOfCustInfoVO.getDriverCityCd())
                        && !StringUtil.isEmpty(vehOfCustInfoVO.getDriverDistCd())) {
                    if (StringUtil.nullConvert(vehOfCustInfoVO.getDriverAddrSeq()) == "") {
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

            if (ownerCnt > 0) {
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

        return ownerBpCd;

    }

    /**
     * 차종 조건으로 차관(모델명) 검색
     */
    @Override
    public List<CarInfoVO> selectCarLooksFscListForCom(CarInfoSearchVO carInfoSearchVO) throws Exception {
        return salesCommonDAO.selectCarLooksFscListForCom(carInfoSearchVO);
    }

    /**
     * 모델 조건으로 OCN 검색 - 전체
     */
    @Override
    public List<CarInfoVO> selectOcnListForCom(CarInfoSearchVO carInfoSearchVO) throws Exception {
        return salesCommonDAO.selectOcnListForCom(carInfoSearchVO);
    }

    /**
     * 모델 조건으로 OCN 검색 - 정규오더
     */
    @Override
    public List<CarInfoVO> selectBtoOcnListForCom(CarInfoSearchVO carInfoSearchVO) throws Exception {
        return salesCommonDAO.selectBtoOcnListForCom(carInfoSearchVO);
    }

    /**
     * 모델 조건으로 OCN 검색 - 전략오더
     */
    @Override
    public List<CarInfoVO> selectStrOcnListForCom(CarInfoSearchVO carInfoSearchVO) throws Exception {
        return salesCommonDAO.selectStrOcnListForCom(carInfoSearchVO);
    }

    /**
     * OCN 조건으로 외장색 검색
     */
    @Override
    public List<CarInfoVO> selectExtColorListForCom(CarInfoSearchVO carInfoSearchVO) throws Exception {
        return salesCommonDAO.selectExtColorListForCom(carInfoSearchVO);
    }

    /**
     * 외장색 조건으로 내장색 검색
     */
    @Override
    public List<CarInfoVO> selectIntColorListForCom(CarInfoSearchVO carInfoSearchVO) throws Exception {
        return salesCommonDAO.selectIntColorListForCom(carInfoSearchVO);
    }

}