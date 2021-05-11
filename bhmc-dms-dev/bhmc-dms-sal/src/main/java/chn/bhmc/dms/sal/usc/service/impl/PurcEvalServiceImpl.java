package chn.bhmc.dms.sal.usc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerInfoService;
import chn.bhmc.dms.sal.cnt.service.ContractMntService;
import chn.bhmc.dms.sal.ctl.service.DeadlineCtrlMngService;
import chn.bhmc.dms.sal.usc.service.PurcEvalService;
import chn.bhmc.dms.sal.usc.service.dao.PurcEvalDAO;
import chn.bhmc.dms.sal.usc.vo.PurcEvalImageVO;
import chn.bhmc.dms.sal.usc.vo.PurcEvalSaveVO;
import chn.bhmc.dms.sal.usc.vo.PurcEvalSearchVO;
import chn.bhmc.dms.sal.usc.vo.PurcEvalVO;
import chn.bhmc.dms.sal.veh.service.VehicleMasterService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PurcEvalServiceImpl
 * @Description : 중고차 - 매입평가관리
 * @author
 * @since 2016. 6. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 9.      Kim yewon              최초 생성
 * </pre>
 */

@Service("purcEvalService")
public class PurcEvalServiceImpl extends HService implements PurcEvalService {

    /**
     * 중고차 - 매입평가관리 DAO 선언
     */
    @Resource(name="purcEvalDAO")
    PurcEvalDAO purcEvalDAO;


    /**
     * 마감시간 체크
     */
    @Resource(name="deadlineCtrlMngService")
    DeadlineCtrlMngService deadlineCtrlMngService;

    /**
     * 계약관리 서비스
     */
    @Resource(name="contractMntService")
    ContractMntService contractMntService;

    //중고차매입관리
    @Resource(name="purcEvalIdgenService")
    TableIdGenService purcEvalIdgenService;

    //중고차평가매입 번호
    @Resource(name="purcEvalUsedCarIdgenService")
    TableIdGenService purcEvalUsedCarIdgenService;

    @Resource(name="vehicleMasterService")
    VehicleMasterService vehicleMasterService;

    @Resource(name="customerInfoService")
    CustomerInfoService customerInfoService;


    /**
     * 조회 조건에 해당하는  정보를 조회한다.
     */
    @Override
    public List<PurcEvalVO> selectPurcByCondition(PurcEvalSearchVO searchVO){

        if( StringUtils.isEmpty(searchVO.getsDlrCd())){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return purcEvalDAO.selectPurcByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 총 갯수를 조회한다.
     */
    @Override
    public int selectPurcByConditionCnt(PurcEvalSearchVO searchVO) {

        if( StringUtils.isEmpty(searchVO.getsDlrCd())){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return purcEvalDAO.selectPurcByConditionCnt(searchVO);
    }


    /**
     * 중고차평가매입정보(단건) 조회
     */
    @Override
    public PurcEvalVO selectPurcEvalInfo(PurcEvalSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return purcEvalDAO.selectPurcEvalInfo(searchVO);
    }
    /**
     * 중고차평가매입 - 경매(위탁)정보(단건) 조회
     */
    @Override
    public PurcEvalVO selectAuctInfo(String purcNo) throws Exception {
        return purcEvalDAO.selectAuctInfo(purcNo);
    }


    /**
     * 중고매입관리 - 경매(위탁)목록 조회
     */
    @Override
    public List<PurcEvalVO> selectAuctInfoByCondition(PurcEvalSearchVO searchVO){

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return purcEvalDAO.selectAuctInfoByCondition(searchVO);
    }

    /**
     * 중고매입관리 - 경매(위탁)목록 총 갯수 조회
     */
    @Override
    public int selectAuctInfoByConditionCnt(PurcEvalSearchVO searchVO) {
        return purcEvalDAO.selectAuctInfoByConditionCnt(searchVO);
    }


    /**
     * 중고차평가매입 정보를 저장한다.
     */
    @Override
    public String savePurcEvalMng(PurcEvalVO purcEvalVO) throws Exception{
        String result = null;

        if(purcEvalVO.getManufactYyMmDt() != null){purcEvalVO.setManufactYyMmDt(purcEvalVO.getManufactYyMmDt().replaceAll("-", ""));}
        if(purcEvalVO.getFceIncPrid() != null){purcEvalVO.setFceIncPrid(purcEvalVO.getFceIncPrid().replaceAll("-", ""));}
        if(purcEvalVO.getCarTaxPrid() != null){purcEvalVO.setCarTaxPrid(purcEvalVO.getCarTaxPrid().replaceAll("-", ""));}
        if(purcEvalVO.getYyTestPrid() != null){purcEvalVO.setYyTestPrid(purcEvalVO.getYyTestPrid().replaceAll("-", ""));}
        if(purcEvalVO.getCmcIncPrid() != null){purcEvalVO.setCmcIncPrid(purcEvalVO.getCmcIncPrid().replaceAll("-", ""));}

        purcEvalVO.setRegUsrId(LoginUtil.getUserId());          // 등록자
        purcEvalVO.setDlrCd(LoginUtil.getDlrCd());              // 딜러
        purcEvalVO.setUpdtUsrId(LoginUtil.getUserId());         // 수정자

        String purcNo = "";
        String carId = "";
        //신규 건일경우
        if((StringUtil.nullConvert(purcEvalVO.getPurcNo()).equals(""))){
            purcNo = purcEvalIdgenService.getNextStringId();
            purcEvalVO.setPurcNo(purcNo);
            purcEvalDAO.insertPurcEvalMng(purcEvalVO);       //중고차평가매입 정보
        }else{
            updatePurcEvalMng(purcEvalVO);       //중고차평가매입 정보 수정
            if(purcEvalVO.getPurcStatCd().equals("04")){     //상태 : 성공

                if((StringUtil.nullConvert(purcEvalVO.getCarId()).equals(""))){
                    carId = purcEvalUsedCarIdgenService.getNextStringId();
                    purcEvalVO.setCarId(carId);
                    purcEvalDAO.insertPurcEvalMaster(purcEvalVO);
                }else{
                    purcEvalDAO.updatePurcEvalMaster(purcEvalVO);
                }

                /*소유자정보변경 안하기로 crm과 협의 함. 2017.09.08 Lee.K*/
                /*if(!StringUtil.isNullToString(purcEvalVO.getVinCarId()).equals("")){

                    // 소유자정보 변경(useYn = 'N')
                    VehicleMasterSaveVO saveOwnerVO = new VehicleMasterSaveVO();
                    List<VehicleMasterVO> updateOwnerList = new ArrayList<VehicleMasterVO>();
                    VehicleMasterVO vo = null;
                    VehicleMasterSearchVO cSearchVO = new VehicleMasterSearchVO();
                    cSearchVO.setsDlrCd(purcEvalVO.getDlrCd());
                    cSearchVO.setsCustNo(purcEvalVO.getPurcCustNo());
                    cSearchVO.setsCarId(purcEvalVO.getVinCarId());
                    cSearchVO.setsNcarDstinCd("N");

                    List<VehicleMasterVO> vehicleList = vehicleMasterService.selectVehicleMasterOwnerByCondition(cSearchVO);
                    if( vehicleList.size() > 0 ){
                        for(VehicleMasterVO mVO : vehicleList){
                            vo = new VehicleMasterVO();
                            vo.setBpCd(mVO.getBpCd());
                            vo.setUseYn("N");
                            vo.setUpdtUsrId(LoginUtil.getUserId());
                            vo.setCarId(purcEvalVO.getVinCarId());
                            vo.setDlrCd(purcEvalVO.getDlrCd());
                            vo.setSeq(mVO.getSeq());
                            updateOwnerList.add(vo);
                        }
                        saveOwnerVO.getOwnerGridVO().setUpdateList(updateOwnerList);
                        vehicleMasterService.saveVehicleMasterOwner(saveOwnerVO);
                    }
                }*/
            }
        }
        purcEvalDAO.updateScrapVehicle(purcEvalVO); //치환상태체크 후 업데이트

        /*
        if(purcEvalVO.getPurcStatCd().equals("01")){
            purcEvalDAO.insertPurcEvalMng(purcEvalVO);
            purcEvalDAO.updatePurcEvalMng2ndTab(purcEvalVO);
        }else if(purcEvalVO.getPurcStatCd().equals("04")){
            updatePurcEvalMng(purcEvalVO);
            purcEvalDAO.insertPurcEvalMaster(purcEvalVO);
        }else{
            updatePurcEvalMng(purcEvalVO);
        }

        purcEvalDAO.updateScrapVehicle(purcEvalVO); //치환상태체크 후 업데이트
        */

        /**
        // 중고차내역은 체크만 한다.
        ContractReVO contractReVO = new ContractReVO();
        contractReVO.setUsrVinNo(saveVO.getVinNo());
        contractReVO.setUsrSbstAmt(saveVO.getPurcTotAmt());
        contractReVO.setPurcNo(saveVO.getPurcNo());
        contractReVO.setDlrCd(saveVO.getDlrCd());
        contractReVO.setContractNo(saveVO.getContractNo());
        contractMntService.updateContractUsedCar(contractReVO);
        */

        return result;
    }


    /**
     * {@inheritDoc}
     * @throws Exception
     */
    @Override
    public void multiSaveAuctInfo(PurcEvalSaveVO obj) throws Exception {

        String userId = LoginUtil.getUserId();

        for(PurcEvalVO vo : obj.getInsertList()){
            vo.setRegUsrId(userId);
            insertAuctInfo(vo);
        }

        for(PurcEvalVO vo : obj.getUpdateList()){
            vo.setUpdtUsrId(userId);
            updateAuctInfo(vo);
        }

        for(PurcEvalVO vo : obj.getDeleteList()){
            deleteAuctInfo(vo);
        }

    }

    /**
     * {@inheritDoc}
     */
    @Override
    public PurcEvalVO selectAuctInfoByKey(PurcEvalVO vo) throws Exception {
        return purcEvalDAO.selectAuctInfoByKey(vo);
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public int insertAuctInfo(PurcEvalVO vo) throws Exception {

        PurcEvalVO obj = selectAuctInfoByKey(vo);

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        return purcEvalDAO.insertAuctInfo(vo);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updatePurcEvalMng(PurcEvalVO vo) throws Exception {


        vo.setRegUsrId(LoginUtil.getUserId());          // 등록자
        vo.setDlrCd(LoginUtil.getDlrCd());              // 딜러
        vo.setUpdtUsrId(LoginUtil.getUserId());         // 수정자

        return purcEvalDAO.updatePurcEvalMng(vo);
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public int updateAuctInfo(PurcEvalVO vo) throws Exception {
        return purcEvalDAO.updateAuctInfo(vo);
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteAuctInfo(PurcEvalVO vo) throws Exception {


        return purcEvalDAO.deleteAuctInfo(vo);
    }

    //중고차매입/평가관리 - 평가용 이미지 데이터 조회.
    @Override
    public PurcEvalImageVO selectImageEvalVal(PurcEvalSearchVO searchVO){

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return purcEvalDAO.selectImageEvalVal(searchVO);
    }

    //중고차매입/평가관리 - 평가용 이미지 데이터 조회.(초기값)
    @Override
    public PurcEvalImageVO selectImageEvalInitVal(PurcEvalSearchVO searchVO){

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return purcEvalDAO.selectImageEvalInitVal(searchVO);
    }

    //중고차매입/평가관리 - 평가용 이미지 데이터 조회.
    @Override
    public int selectImageEvalValCnt(PurcEvalSearchVO searchVO) {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return purcEvalDAO.selectImageEvalValCnt(searchVO);
    }



    //중고차매입/평가관리 - 평가용 이미지의 평가데이터를 저장.
    @Override
    public String saveImageEval(PurcEvalImageVO saveVO) throws Exception{
        String result = null;

        PurcEvalSearchVO searchVO = new PurcEvalSearchVO();
        searchVO.setsDlrCd(saveVO.getDlrCd());
        searchVO.setsPurcNo(saveVO.getPurcNo());

        int getByKey = purcEvalDAO.selectImageEvalValCnt(searchVO);

        saveVO.setRegUsrId(LoginUtil.getUserId());
        saveVO.setUpdtUsrId(LoginUtil.getUserId());

        if(getByKey == 0){
            purcEvalDAO.insertImageEval(saveVO);
        }else {
            purcEvalDAO.updateImageEval(saveVO);
        }

        return result;
    }

    // 계약 - 치환판매 데이터 처리
    @Override
    public int saveContractPurcEval(PurcEvalVO vo) throws Exception {

        if( StringUtils.isEmpty(vo.getPurcNo())){
            // [매입번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("sal.lbl.documentNo", null, LocaleContextHolder.getLocale())});
        }
        if( StringUtils.isEmpty(vo.getContractNo())){
            // [계약번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.contractNo", null, LocaleContextHolder.getLocale())});
        }
        /*
        if( StringUtils.isEmpty(vo.getExchYn()) || "N".equals(vo.getExchYn())){
            // [치환여부]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("sal.lbl.uatcCarPurc", null, LocaleContextHolder.getLocale())});
        }
         */

        if( StringUtils.isEmpty(vo.getDlrCd())){
            vo.setDlrCd(LoginUtil.getDlrCd());
        }

        PurcEvalSearchVO searchVO = new PurcEvalSearchVO();
        searchVO.setsPurcNo(vo.getPurcNo());
        searchVO.setsDlrCd(vo.getDlrCd());
        List<PurcEvalVO> purcList = purcEvalDAO.selectPurcByCondition(searchVO);

        if(purcList == null || purcList.size() < 1){
            // [매입번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("sal.lbl.documentNo", null, LocaleContextHolder.getLocale())});
        }

        PurcEvalVO purcVO = purcList.get(0);

        if( StringUtils.isNotEmpty( purcVO.getContractNo())
                && !vo.getContractNo().equals(purcVO.getContractNo()) ){
            // 다른 계약과 연계된 매입번호는 저장할 수 없습니다.
            throw processException("sal.info.oitherPurcContractMsg");
        }

        if("05".equals(purcVO.getPurcStatCd())){
            // 해당 내역은 {저장}상태가 아닙니다.
            //throw processException("global.info.stateNotMsg", new String[]{messageSource.getMessage("global.lbl.save", null, LocaleContextHolder.getLocale())});

            // 삭제된 내역은 처리할 수 없습니다.
            throw processException("sal.info.cancelCheckMsg");
        }

        vo.setUpdtUsrId(LoginUtil.getUserId());         // 수정자

        purcEvalDAO.updateContractNoPurcEval(vo);

        return 1;
    }

    // 계약 - 계약에서 수정했던 내역을 초기화 해준다.
    @Override
    public int initContractPurcEval(PurcEvalVO vo) throws Exception {
        if( StringUtils.isEmpty(vo.getPurcNo())){
            // [매입번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("sal.lbl.documentNo", null, LocaleContextHolder.getLocale())});
        }
        if( StringUtils.isEmpty(vo.getDlrCd())){
            vo.setDlrCd(LoginUtil.getDlrCd());
        }

        PurcEvalSearchVO searchVO = new PurcEvalSearchVO();
        searchVO.setsPurcNo(vo.getPurcNo());
        searchVO.setsDlrCd(vo.getDlrCd());
        List<PurcEvalVO> purcList = purcEvalDAO.selectPurcByCondition(searchVO);

        if(purcList == null || purcList.size() < 1){
            // [매입번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("sal.lbl.documentNo", null, LocaleContextHolder.getLocale())});
        }

        //PurcEvalVO purcVO = purcList.get(0);

        //if(!"01".equals(purcVO.getPurcStatCd())){
            // 해당 내역은 {저장}상태가 아닙니다.
        //    throw processException("global.info.stateNotMsg", new String[]{messageSource.getMessage("global.lbl.save", null, LocaleContextHolder.getLocale())});
        //}

        vo.setUpdtUsrId(LoginUtil.getUserId());         // 수정자

        //vo.setExchYn("N");        // 치환여부 - 변경하지 말것. (2017.04.09 구상우)
        vo.setContractNo("");       // 계약번호

        purcEvalDAO.updateNonContractNoPurcEval(vo);
        return 1;
    }

    public int deleteContractPurcEval(PurcEvalVO vo) throws Exception {
        if( StringUtils.isEmpty(vo.getContractNo())){
            // [계약번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.contractNo", null, LocaleContextHolder.getLocale())});
        }
        if( StringUtils.isEmpty(vo.getDlrCd())){
            vo.setDlrCd(LoginUtil.getDlrCd());
        }

        PurcEvalSearchVO searchVO = new PurcEvalSearchVO();
        searchVO.setsDlrCd(vo.getDlrCd());
        searchVO.setsContractNo(vo.getContractNo());
        //List<PurcEvalVO> purcList = purcEvalDAO.selectPurcByCondition(searchVO);
        //if(purcList != null && purcList.size() > 0){
            //PurcEvalVO purcVO = purcList.get(0);

            //if(!"01".equals(purcVO.getPurcStatCd())){
                // 해당 내역은 {저장}상태가 아닙니다.
            //    throw processException("global.info.stateNotMsg", new String[]{messageSource.getMessage("global.lbl.save", null, LocaleContextHolder.getLocale())});
            //}

            vo.setUpdtUsrId(LoginUtil.getUserId());         // 수정자
            //vo.setExchYn("N");        // 치환여부 - 변경하지 말것. (2017.04.09 구상우)
            purcEvalDAO.deleteContractPurcEval(vo);
        //}
        return 1;
    }

    /* 브랜드 조회
    public List<UsedCarBrandListVO> searchUsedCarBrand() throws Exception{
        List<UsedCarBrandListVO> arrUsedCarBrandListVO = new ArrayList<UsedCarBrandListVO>();
        String url = Constants.USED_CAR_URL + "/cmm/usc/usedCar/selectUsedCarBrandList.do";
        HttpGet request =  new HttpGet(url);
        CloseableHttpClient httpClient = HttpClientBuilder.create().build();

        try{

            request.addHeader("content-type", "application/x-www-form-urlencoded");
            HttpResponse response = httpClient.execute(request);
            HttpEntity responseEntity = response.getEntity();
            String responseText = EntityUtils.toString(responseEntity, "UTF-8");

            log.debug("==RECEIVE DATA==");
            log.debug(responseText);

            Object obj = JSONValue.parseWithException(responseText);
            JSONObject jsonRecvData = (JSONObject)obj;
            String sCmmCd = "";
            String sCmmCdNm = "";

            JSONArray array = (JSONArray) jsonRecvData.get("data");
            JSONObject jobj = null;
            UsedCarBrandListVO usedCarBrandListVO = new UsedCarBrandListVO();

            if(array != null){
                int iSize = array.size();

                for(int j = 0; j < iSize; j++){
                    jobj = (JSONObject) array.get(j);

                    //BranList response 저장
                    sCmmCd = jobj.get("cmmCd").toString();
                    sCmmCdNm = jobj.get("cmmCdNm").toString();
                    usedCarBrandListVO = new UsedCarBrandListVO();
                    usedCarBrandListVO.setCmmCd(sCmmCd);
                    usedCarBrandListVO.setCmmCdNm(sCmmCdNm);
                    usedCarBrandListVO.setUseYn("Y");

                    arrUsedCarBrandListVO.add(usedCarBrandListVO);
                }
            }

        }catch (Exception e) {
            log.error(e.getMessage(), e);
            //throw e;
        }finally{
            httpClient.close();
        }

        return arrUsedCarBrandListVO;
    }
    */

    /* 차종 조회
    public List<UsedCarModelListVO> SearchUsedCarCarLine(CarInfoSearchVO searchVO) throws Exception{

        List<UsedCarModelListVO> arrUsedCarModelListVO = new ArrayList<UsedCarModelListVO>();
        String url = Constants.USED_CAR_URL + "/cmm/usc/usedCar/selectUsedCarModelList.do?manufacturerid=" + searchVO.getCarlineCd();
        HttpGet request =  new HttpGet(url);
        CloseableHttpClient httpClient = HttpClientBuilder.create().build();
        try{

            request.addHeader("content-type", "application/x-www-form-urlencoded");
            HttpResponse response = httpClient.execute(request);
            HttpEntity responseEntity = response.getEntity();
            String responseText = EntityUtils.toString(responseEntity, "UTF-8");

            log.debug("==RECEIVE DATA==");
            log.debug(responseText);

            Object obj = JSONValue.parseWithException(responseText);
            JSONObject jsonRecvData = (JSONObject)obj;
            String sCarlineCd = "";
            String sCarlineNm = "";

            JSONArray array = (JSONArray) jsonRecvData.get("data");
            JSONObject jobj = null;
            UsedCarModelListVO usedCarModelListVO = new UsedCarModelListVO();

            if(array != null){
                int iSize = array.size();

                for(int j = 0; j < iSize; j++){
                    jobj = (JSONObject) array.get(j);

                    //BranList response 저장
                    sCarlineCd = jobj.get("carlineCd").toString();
                    sCarlineNm = jobj.get("carlineNm").toString();
                    usedCarModelListVO = new UsedCarModelListVO();
                    usedCarModelListVO.setCarlineCd(sCarlineCd);
                    usedCarModelListVO.setCarlineNm(sCarlineNm);

                    arrUsedCarModelListVO.add(usedCarModelListVO);
                }
            }

        }catch (Exception e) {
            log.error(e.getMessage(), e);
            //throw e;
        }finally{
            httpClient.close();
        }

        return arrUsedCarModelListVO;
    }
    */

    /* 모델 조회
    public List<CarInfoVO> SearchUsedCarModel(CarInfoSearchVO searchVO) throws Exception{
        List<CarInfoVO> arrCarInfoVO = new ArrayList<CarInfoVO>();
        String url = Constants.USED_CAR_URL + "/cmm/usc/usedCar/selectUsedCarLineList.do?modelid=" + searchVO.getCarlineCd();
        HttpGet request =  new HttpGet(url);
        CloseableHttpClient httpClient = HttpClientBuilder.create().build();
        try{

            request.addHeader("content-type", "application/x-www-form-urlencoded");
            HttpResponse response = httpClient.execute(request);
            HttpEntity responseEntity = response.getEntity();
            String responseText = EntityUtils.toString(responseEntity, "UTF-8");

            log.debug("==RECEIVE DATA==");
            log.debug(responseText);

            Object obj = JSONValue.parseWithException(responseText);
            JSONObject jsonRecvData = (JSONObject)obj;
            String sModelCd = "";
            String sModelNm = "";

            JSONArray array = (JSONArray) jsonRecvData.get("data");
            JSONObject jobj = null;
            CarInfoVO carInfoVO = new CarInfoVO();

            if(array != null){
                int iSize = array.size();

                for(int j = 0; j < iSize; j++){
                    jobj = (JSONObject) array.get(j);

                    //BranList response 저장
                    sModelCd = jobj.get("styleCd").toString();
                    sModelNm = jobj.get("styleNm").toString();
                    carInfoVO = new CarInfoVO();
                    carInfoVO.setModelCd(sModelCd);
                    carInfoVO.setModelNm(sModelNm);

                    arrCarInfoVO.add(carInfoVO);
                }
            }

        }catch (Exception e) {
            log.error(e.getMessage(), e);
            //throw e;
        }finally{
            httpClient.close();
        }

        return arrCarInfoVO;
    }
    */

    @Override
    public String checkingVinNoDupWhether(PurcEvalSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return purcEvalDAO.checkingVinNoDupWhether(searchVO);
    }

    @Override
    public int purchaseCancel(PurcEvalVO vo) throws Exception {

        vo.setDlrCd(LoginUtil.getDlrCd());

        if("F".equals(purcEvalDAO.checkingContract(vo))){
            //게약에 치환선택되었음. 취소불가.
            throw processException("sal.info.usedCarPurchaseCancel");
        }
        purcEvalDAO.purchaseCancelHeader(vo);
        purcEvalDAO.purchaseCancelStock(vo);

        return 1;
    }
}