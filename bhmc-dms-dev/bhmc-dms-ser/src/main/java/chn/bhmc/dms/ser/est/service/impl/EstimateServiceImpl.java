package chn.bhmc.dms.ser.est.service.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import able.com.vo.HMap;

import org.apache.commons.lang.StringUtils;
import org.jxls.common.Context;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.ser.cmm.vo.LbrSuggestVO;

import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.ser.cmm.service.ServiceCommonService;
import chn.bhmc.dms.ser.cmm.service.ServiceLaborService;
import chn.bhmc.dms.ser.cmm.service.ServicePartService;
import chn.bhmc.dms.ser.cmm.vo.CustDemandVO;
import chn.bhmc.dms.ser.cmm.vo.EtcIssueVO;
import chn.bhmc.dms.ser.cmm.vo.ServiceCmmVO;
import chn.bhmc.dms.ser.cmm.vo.TrobleDescVO;
import chn.bhmc.dms.ser.est.service.EstimateService;
import chn.bhmc.dms.ser.est.service.dao.EstimateDAO;
import chn.bhmc.dms.ser.est.service.dao.EstimateDetailDAO;
import chn.bhmc.dms.ser.est.vo.EstimateDetailVO;
import chn.bhmc.dms.ser.est.vo.EstimateSaveVO;
import chn.bhmc.dms.ser.est.vo.EstimateSearchVO;
import chn.bhmc.dms.ser.est.vo.EstimateVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : EstimateServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 4. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 25.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

@Service("estimateService")
public class EstimateServiceImpl extends HService implements EstimateService , JxlsSupport{

    @Resource(name="estimateDAO")
    EstimateDAO estimateDAO;

    @Resource(name="estimateDetailDAO")
    EstimateDetailDAO estimateDetailDAO;

    @Resource(name="estDocNoIdGenService")
    TableIdGenService estDocNoIdGenService;

    @Resource(name="estSubDocNoIdGenService")
    TableIdGenService estSubDocNoIdGenService;

    /**
     * 고객요구사항 및 고장설명
     */
    @Autowired
    ServiceCommonService serviceCommonService;

    /**
     * 부품공통 Service
     */
    @Resource(name="servicePartService")
    ServicePartService servicePartService;

    /**
     * 공임공통 Service
     */
    @Resource(name="serviceLaborService")
    ServiceLaborService serviceLaborService;

    /**
    *
    * 견적서 정보 목록 조회
    *
    * @param searchVO - 견적서 정보 목록 조회
    * @return
    * @throws Exception
    */
    public int selectEstimateManageByConditionCnt(EstimateSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return estimateDAO.selectEstimateManageByConditionCnt(searchVO);
    }

    /**
    *
    * 견적서 정보 조회
    *
    * @param searchVO - 견적서 정보 조회
    * @return
    * @throws Exception
    */
    public EstimateVO selectEstimateManageByKey(EstimateSearchVO searchVO) throws Exception {


        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        EstimateVO estimateVO = new EstimateVO();

        if( !StringUtil.isEmpty(searchVO.getsEstDocNo())){

            estimateVO = estimateDAO.selectEstimateManageByKey(searchVO);

        }
        return estimateVO;
    }



    /**
     *
     * 견적서 정보 리스트목록수 조회
     *
     * @param searchVO - 견적서 정보 조회
     * @return
     * @throws Exception
     */
    public int selectEstimateListByConditionCnt(EstimateSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        return estimateDAO.selectEstimateListByConditionCnt(searchVO);
    }

    /**
     *
     * 견적서 정보 리스트 조회
     *
     * @param searchVO - 견적서 정보 조회
     * @return
     * @throws Exception
     */
    public List<EstimateVO> selectEstimateListByCondition(EstimateSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        return estimateDAO.selectEstimateListByCondition(searchVO);
    }

    /**
    *
    * 견적서 항목 정보를 등록한다.
    *
    * @param saveVO - 견적서 항목 등록/수정 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public String mulitEstimates(EstimateSaveVO saveVO) throws Exception {

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        EstimateVO estVO = saveVO.getEstimateVO();
        String estDocNo = estVO.getEstDocNo();
        String estSubDocNo = "";
        String serParDstinCd = estVO.getSerParDstinCd();
        if(serParDstinCd==null) serParDstinCd = "";
        Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(new Date().getTime());

        if(!StringUtil.isEmpty(estDocNo)) {

            EstimateSearchVO searchVO = new EstimateSearchVO();
            searchVO.setsDlrCd(dlrCd);
            searchVO.setsEstDocNo(estDocNo);

            estVO.setUpdtUsrId(userId);
            estVO.setDlrCd(dlrCd);
            estimateDAO.updateEstimates(estVO);

        } else {
            /**
             * 정산번호(키생성)
             */
            estDocNo = estDocNoIdGenService.getNextStringId();

            estVO.setRegUsrId(userId);
            estVO.setEstDocNo(estDocNo);
            estVO.setDlrCd(dlrCd);
            estimateDAO.insertEstimates(estVO);
        }

        ServiceCmmVO serviceCmmVO = new ServiceCmmVO();
        serviceCmmVO.setPreFixId(estVO.getPreFixId());
        serviceCmmVO.setDocNo(estVO.getEstDocNo());

        // 부품 추가/수정/삭제
        servicePartService.multiServicePart(saveVO.getServicePartListVO(), serviceCmmVO);

        // 공임 추가/수정/삭제
        serviceLaborService.multiServiceLabor(saveVO.getServiceLaborListVO(), serviceCmmVO);

        EstimateDetailVO partVO = new EstimateDetailVO();
        partVO.setEstDocNo(estVO.getEstDocNo());
        estimateDetailDAO.deleteEstimateDetail(partVO);

        for(EstimateDetailVO estimateDetailVO : saveVO.getEstimateDetailSaveVO()){
            /**
             * 정산하위번호(키생성)
             */
            synchronized (estSubDocNoIdGenService) {
                ((EstSubDocNoIdGenStrategy)estSubDocNoIdGenService.getStrategy()).setEstDocNo(estVO.getEstDocNo());
                estSubDocNo = estSubDocNoIdGenService.getNextStringId();
            }

            estimateDetailVO.setRegUsrId(userId);
            estimateDetailVO.setDlrCd(dlrCd);
            estimateDetailVO.setEstDocNo(estVO.getEstDocNo());
            estimateDetailVO.setEstSubDocNo(estSubDocNo);
            estimateDetailDAO.insertEstimateDetail(estimateDetailVO);

        }

        List<CustDemandVO> custDemandList = saveVO.getCustDemandListVO();
        TrobleDescVO trobleDescVO = saveVO.getTrobleDescVO();
        List<EtcIssueVO> etcIssueList = saveVO.getEtcIssueListVO();
        List<LbrSuggestVO> lbrSuggestList = saveVO.getLbrSuggestListVO();

        //고객요구사항 추가/수정/삭제
        if(custDemandList.size() > 0){
            serviceCommonService.multiCustDemand(custDemandList, estDocNo, "ET");
        }
        //고장서술 추가/수정/삭제
        if(trobleDescVO != null){
            serviceCommonService.multiTrobleDesc(trobleDescVO, estDocNo);
        }
        //기타사항 추가/수정/삭제
        if(etcIssueList.size() > 0){
            serviceCommonService.multiEtcIssue(etcIssueList, estDocNo, "ET");
        }

        if(lbrSuggestList != null){
          //수리건의 추가/삭제
            if(lbrSuggestList.size() > 0){
                serviceCommonService.multiLbrSuggest(lbrSuggestList, estDocNo, "ET");
            }
        }

        /** 차량마스터 update
         *  VehicleMasterVO   -->  VehicleMasterSaveVO 바뀜.   09.29 kim yewon
         * **/
        /*VehicleMasterSaveVO masterSaveVO = new VehicleMasterSaveVO();
        VehicleMasterVO vehicleMasterVO = new VehicleMasterVO();

        vehicleMasterVO.setCarId(calVO.getCarId());
        vehicleMasterVO.setCarRunDistVal(Integer.toString(calVO.getRunDistVal()));
        vehicleMasterVO.setExpcChkDt(calVO.getExpcChkDt());
        vehicleMasterVO.setExpcChkRunDistVal(calVO.getExpcChkRunDistVal());
        vehicleMasterVO.setUpdtUsrId(userId);

        masterSaveVO.setVehicleMasterVO(vehicleMasterVO);
        vehicleMasterService.saveVehicleMasterMain(masterSaveVO); */

        /** 고객마스터 update **/
        /*CustomerInfoVO customerInfoVO = new CustomerInfoVO();
        customerInfoVO.setCommandTp("ASSIGN");
        customerInfoVO.setCustNo(calVO.getDriverId());
        customerInfoVO.setCustNm(calVO.getDriverNm());
        customerInfoVO.setPrefContactMthCd(calVO.getMainCtnoTp());
        customerInfoVO.setPrefContactTimeCd(calVO.getMainCtnoDtTp());
        customerInfoVO.setDlrCd(dlrCd);
        customerInfoVO.setUpdtUsrId(userId);

        customerInfoOutBoundService.updateCustomer(customerInfoVO);

        VehOfCustInfoVO vehOfCustInfoVO = new VehOfCustInfoVO();
        vehOfCustInfoVO.setCarId(calVO.getCarId());
        vehOfCustInfoService.vinMasterChangeCall(vehOfCustInfoVO);*/

        return estVO.getEstDocNo();
    }

    /**
    *
    * 견적서 항목 정보를 취소한다.
    *
    * @param saveVO - 견적서 항목 취소 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public void cancelEstimate(EstimateVO estimateVO) throws Exception {

        String userId = LoginUtil.getUserId();

        estimateVO.setDlrCd(LoginUtil.getDlrCd());
        estimateVO.setUpdtUsrId(userId);
        estimateVO.setEstCancId(userId);

        estimateDAO.cancelEstimate(estimateVO);

    }

    /**
     * 견적서 출력 정보를 수정한다.
     * @param estimateVO - 수정할 정보가 담긴 CalculateVO
     * @return 수정된 목록수
     */
    public void updateEstimatePrint(EstimateVO estimateVO)throws Exception{

        estimateVO.setDlrCd(LoginUtil.getDlrCd());
        estimateDAO.updateEstimatePrint(estimateVO);
    }

    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        String dlrCd = LoginUtil.getDlrCd();

        EstimateSearchVO searchVO = new EstimateSearchVO();
        searchVO.setsDlrCd(dlrCd);
        if(!StringUtils.isBlank(params.get("sEstFromDt").toString())){
            String sEstFromDt = params.get("sEstFromDt").toString();
            Date dEstFromDt = DateUtil.convertToDate(sEstFromDt);
            searchVO.setsEstFromDt(dEstFromDt);
        }
        if(!StringUtils.isBlank(params.get("sEstToDt").toString())){
            String sEstToDt = params.get("sEstToDt").toString();
            Date dEstToDt = DateUtil.convertToDate(sEstToDt);
            searchVO.setsEstToDt(dEstToDt);
        }
        if(!StringUtils.isBlank(params.get("sRoFromDt").toString())){
            String sRoFromDt = params.get("sRoFromDt").toString();
            Date dRoFromDt = DateUtil.convertToDate(sRoFromDt);
            searchVO.setsRoFromDt(dRoFromDt);
        }
        if(!StringUtils.isBlank(params.get("sRoToDt").toString())){
            String sRoToDt = params.get("sRoToDt").toString();
            Date dRoToDt = DateUtil.convertToDate(sRoToDt);
            searchVO.setsRoToDt(dRoToDt);
        }

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
        List<EstimateVO> list = selectEstimateListByCondition(searchVO);
        context.putVar("items", list);

    }



}
