package chn.bhmc.dms.ser.cmm.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.apache.commons.lang3.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.cmm.service.ServiceCommonService;
import chn.bhmc.dms.ser.cmm.service.ServiceLaborService;
import chn.bhmc.dms.ser.cmm.service.dao.ServiceLaborDAO;
import chn.bhmc.dms.ser.cmm.vo.ServiceCmmVO;
import chn.bhmc.dms.ser.cmm.vo.ServiceLaborIfVO;
import chn.bhmc.dms.ser.cmm.vo.ServiceLaborVO;
import chn.bhmc.dms.ser.cmm.vo.TabInfoSearchVO;
import chn.bhmc.dms.ser.svi.service.LtsModelMappingService;
import chn.bhmc.dms.ser.svi.vo.LtsModelMappingVO;
import chn.bhmc.dms.ser.svi.vo.LtsModelSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServiceLaborServiceImpl.java
 * @Description : 공통 공임 ServiceImpl
 * @author KyungMok Kim
 * @since 2016. 8. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 23.   KyungMok Kim     최초 생성
 * </pre>
 */

@Service("serviceLaborService")
public class ServiceLaborServiceImpl extends HService implements ServiceLaborService {

    /**
     * RO접수 공임 DAO
     */
    @Resource(name="serviceLaborDAO")
    ServiceLaborDAO serviceLaborDAO;

    @Autowired
    ServiceCommonService serviceCommonService;

    @Autowired
    LtsModelMappingService ltsModelMappingService;


    /**
     * 조회 조건에 해당하는 공임 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public int selectServiceLaborsByConditionCnt(TabInfoSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return serviceLaborDAO.selectServiceLaborsByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 공임을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public List<ServiceLaborVO> selectServiceLaborsByCondition(TabInfoSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        if(StringUtil.nullConvert(searchVO.getsLtsModelCd()).equals("") &&
                !StringUtil.nullConvert(searchVO.getsVinNo()).equals("")
                ){
            LtsModelSearchVO ltsModelsearchVO = new LtsModelSearchVO();
            ltsModelsearchVO.setsVinNo(searchVO.getsVinNo());
            LtsModelMappingVO ltsMappingVO =  ltsModelMappingService.selectMappingLtsModelCdByKey(ltsModelsearchVO);
            searchVO.setsLtsModelCd(ltsMappingVO.getLtsModelCd());
        }

        return serviceLaborDAO.selectServiceLaborsByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 공임 히스토리 (DCS )을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public List<ServiceLaborVO> selectServiceLaborsHistByCondition(TabInfoSearchVO searchVO) throws Exception {

        List<ServiceLaborVO> roLborList = new ArrayList<ServiceLaborVO>();
        List<ServiceLaborIfVO> roLborIfList = new ArrayList<ServiceLaborIfVO>();

        if(searchVO.getsDlrCd().equals(LoginUtil.getDlrCd())){
            roLborList = serviceLaborDAO.selectServiceLaborsByCondition(searchVO);
        } else {
            Map<String, Object> message = new HashMap<String, Object>();
            message.put("PREFIX_ID", "RO");
            message.put("DLR_CD", searchVO.getsDlrCd());
            message.put("DOC_NO", searchVO.getsDocNo());

            Data receiveData = serviceCommonService.executeCamelClentSearchResult(message,"SER056");

            if (receiveData.getFooter().getIfResult().equals("Z")) {
                roLborIfList = receiveData.readMessages(ServiceLaborIfVO.class);
                ServiceLaborVO roLaborVO = new ServiceLaborVO();

                for(int i = 0 ; i <  roLborIfList.size() ; i++){
                    roLaborVO = new ServiceLaborVO();

                    roLaborVO.setDlrCd(StringUtil.isNullToString(roLborIfList.get(i).getDlrCd()));
                    roLaborVO.setPreFixId(StringUtil.isNullToString(roLborIfList.get(i).getPreFixId()));
                    roLaborVO.setDocNo(StringUtil.isNullToString(roLborIfList.get(i).getDocNo()));
                    roLaborVO.setLineNo( Integer.parseInt(roLborIfList.get(i).getLineNo() ));
                    roLaborVO.setRoTp(StringUtil.isNullToString(roLborIfList.get(i).getRoTp()));
                    roLaborVO.setLbrCd(StringUtil.isNullToString(roLborIfList.get(i).getLbrCd()));
                    roLaborVO.setLbrNm(StringUtil.isNullToString(roLborIfList.get(i).getLbrNm()));
                    roLaborVO.setLbrTp(StringUtil.isNullToString(roLborIfList.get(i).getLbrTp()));
                    roLaborVO.setLbrPrc( Double.parseDouble(  roLborIfList.get(i).getLbrPrc() ));
                    roLaborVO.setLbrQty( Double.parseDouble( roLborIfList.get(i).getLbrQty() ));
                    roLaborVO.setLbrHm( Double.parseDouble(roLborIfList.get(i).getLbrHm()));
                   // roLaborVO.setDstbHm( Double.parseDouble(roLborIfList.get(i).getDstbHm()));
                    roLaborVO.setDcAmt( Double.parseDouble( roLborIfList.get(i).getDcAmt()));
                    roLaborVO.setDcRate( Double.parseDouble( roLborIfList.get(i).getDcRate()));
                    roLaborVO.setLbrTotAmt( Double.parseDouble( roLborIfList.get(i).getLbrTotAmt()));
                    roLaborVO.setCrNo( StringUtil.isNullToString(roLborIfList.get(i).getCrNo()));
                    roLaborVO.setCrNm( StringUtil.isNullToString(roLborIfList.get(i).getCrNm()));
                    roLaborVO.setCrTp( StringUtil.isNullToString(roLborIfList.get(i).getCrTp()));

                    roLborList.add(roLaborVO);

                }

            } else {
                throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
            }
        }

        return roLborList;
    }

    /**
     * RO접수 공임을 등록/수정/삭제한다.
     * @param serviceLaborSaveVO - 공임정보를 포함하는 ServiceLaborVO
     * @return
     */
    public void multiServiceLabor(List<ServiceLaborVO> serviceLaborSaveVO, ServiceCmmVO serviceCmmVO) throws Exception {

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        ServiceLaborVO laborVO = new ServiceLaborVO();
        laborVO.setPreFixId(serviceCmmVO.getPreFixId());
        laborVO.setDocNo(serviceCmmVO.getDocNo());
        laborVO.setDlrCd(dlrCd);
        serviceLaborDAO.deleteServiceLabor(laborVO);

        if(!StringUtil.isNullToString(serviceCmmVO.getDelStatCd()).equals("C")){
            int lineNo = 1;

            for(ServiceLaborVO serviceLaborVO : serviceLaborSaveVO){
                // 캠페인 사용 여부 체크
                if(!StringUtil.isEmpty(serviceLaborVO.getCrNo())){
                    laborVO = new ServiceLaborVO();
                    laborVO.setDlrCd(dlrCd);
                    laborVO.setVinNo(serviceCmmVO.getVinNo());
                    laborVO.setCrNo(serviceLaborVO.getCrNo());
                    int useCampaignCnt = serviceLaborDAO.selectCampaignCnt(laborVO);
                    //20191010  tianjx  选择自店服务活动（不是车厂的批量活动）的情况下， 工单上能用设置活动的所有内容
//                    if(useCampaignCnt > 0 && ! StringUtils.defaultString(serviceLaborVO.getLbrCd(), "").endsWith("ZZ")){
//                        // 이미 등록된 캠페인입니다.
//                        throw processException("global.info.alreadyCont", new String[]{messageSource.getMessage("ser.lbl.campaign", null, LocaleContextHolder.getLocale())});
//                    }
                }

                //작업배정에서 배정공임 값 존재시 업데이트
                TabInfoSearchVO searchVO = new TabInfoSearchVO();
                searchVO.setsDlrCd(dlrCd);
                searchVO.setsRoDocNo(serviceCmmVO.getDocNo());
                searchVO.setsLbrCd(serviceLaborVO.getLbrCd());
                int dstbHmCnt = serviceLaborDAO.selectDstbHmCnt(searchVO);
                if(dstbHmCnt > 0){
                    List<ServiceLaborVO> list = serviceLaborDAO.selectWrkAllocHmByCondition(searchVO);
                    serviceLaborVO.setDstbHm(list.get(0).getAllocHm());
                }

                serviceLaborVO.setRegUsrId(userId);
                serviceLaborVO.setDlrCd(dlrCd);
                serviceLaborVO.setPreFixId(serviceCmmVO.getPreFixId());
                serviceLaborVO.setDocNo(serviceCmmVO.getDocNo());
                serviceLaborVO.setLineNo(lineNo++);
                serviceLaborDAO.insertServiceLabor(serviceLaborVO);
            }
        }
    }

    /**
     * RO접수 공임을 등록/수정/삭제한다.
     * @param serviceLaborSaveVO - 공임정보를 포함하는 ServiceLaborVO
     * @return
     */
    public void updateServiceLabor(List<ServiceLaborVO> serviceLaborSaveVO, ServiceCmmVO serviceCmmVO) throws Exception {

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        for(ServiceLaborVO serviceLaborVO : serviceLaborSaveVO){
            serviceLaborVO.setRegUsrId(userId);
            serviceLaborVO.setDlrCd(dlrCd);
            serviceLaborVO.setPreFixId(serviceCmmVO.getPreFixId());
            serviceLaborVO.setDocNo(serviceCmmVO.getDocNo());
            serviceLaborVO.setLineNo(serviceLaborVO.getLineNo());
            serviceLaborDAO.updateServiceLabor(serviceLaborVO);
        }
    }

    /**
     * 배분공임을 수정한다.
     * @param serviceLaborVO - 공임정보를 포함하는 ServiceLaborVO
     * @return
     */
    public void updateDstbHm(ServiceLaborVO serviceLaborVO) throws Exception {
        serviceLaborVO.setDlrCd(LoginUtil.getDlrCd());
        serviceLaborDAO.updateDstbHm(serviceLaborVO);
    }

    /**
     * 배분공임을 수정한다.
     * @param serviceLaborVO - 공임정보를 포함하는 ServiceLaborVO
     * @return
     */
    public void updateDstbHmBack(ServiceLaborVO serviceLaborVO) throws Exception {
        serviceLaborVO.setDlrCd(LoginUtil.getDlrCd());
        serviceLaborDAO.updateDstbHmBack(serviceLaborVO);
    }

    /**
     * 조회 조건에 해당하는 작업 진도 공임 상태를  조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public List<ServiceLaborVO> selectRoChkWorkStatByCondition(TabInfoSearchVO searchVO) throws Exception{

        if( StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        return serviceLaborDAO.selectRoChkWorkStatByCondition(searchVO);
    }

    /**
     *
     * RO화면에서 공임 삭제시 작업배분 공임 데이터 삭제
     *
     * @param repairOrderVO
     * @return
     * @throws Exception
     */
    public int deleteLaborWorkAssign(ServiceLaborVO serviceLaborVO)throws Exception{

        if( StringUtil.nullConvert(serviceLaborVO.getDlrCd()).equals("")){
            serviceLaborVO.setDlrCd(LoginUtil.getDlrCd());
        }

        return serviceLaborDAO.deleteLaborWorkAssign(serviceLaborVO);
    }

    /**
     *
     * RO화면에서 공임 삭제시 정비진도 공임 데이터 삭제
     *
     * @param repairOrderVO
     * @return
     * @throws Exception
     */
    public int deleteLaborWorkProcess(ServiceLaborVO serviceLaborVO)throws Exception{

        if( StringUtil.nullConvert(serviceLaborVO.getDlrCd()).equals("")){
            serviceLaborVO.setDlrCd(LoginUtil.getDlrCd());
        }

        return serviceLaborDAO.deleteLaborWorkProcess(serviceLaborVO);
    }

    public void deleteServiceLabor(ServiceLaborVO serviceLaborVO) throws Exception {

        if( StringUtil.nullConvert(serviceLaborVO.getDlrCd()).equals("")){
            serviceLaborVO.setDlrCd(LoginUtil.getDlrCd());
        }
        serviceLaborDAO.deleteServiceLabor(serviceLaborVO);
    }


    /**
     * 캠페인 사용이력을 등록한다.
     * @param serviceLaborVO - 공임정보를 포함하는 ServiceLaborVO
     * @return
     */
    public void insertCampaignUseConfirm(ServiceLaborVO serviceLaborVO) throws Exception {
        serviceLaborVO.setDlrCd(LoginUtil.getDlrCd());
        serviceLaborVO.setRegUsrId(LoginUtil.getUserId());
        serviceLaborDAO.insertCampaignUseConfirm(serviceLaborVO);
    }

    /**
     * 캠페인 사용이력을 수정한다.
     * @param serviceLaborVO - 공임정보를 포함하는 ServiceLaborVO
     * @return
     */
    public void updateCampaignUseConfirm(ServiceLaborVO serviceLaborVO) throws Exception {
        serviceLaborVO.setDlrCd(LoginUtil.getDlrCd());
        serviceLaborVO.setUpdtUsrId(LoginUtil.getUserId());
        serviceLaborDAO.updateCampaignUseConfirm(serviceLaborVO);
    }

    /**
     * 캠페인 사용이력을 조회한다.
     * @param serviceLaborVO - 공임정보를 포함하는 ServiceLaborVO
     * @return
     */
    public void selectCampaignUseConfirm(TabInfoSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        serviceLaborDAO.selectCampaignUseConfirm(searchVO);
    }
}