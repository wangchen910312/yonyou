package chn.bhmc.dms.ser.rcv.service.impl;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import able.com.vo.HMap;

import org.apache.commons.lang.StringUtils;
import org.jxls.common.Context;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.ser.cmm.service.ServiceCommonService;
import chn.bhmc.dms.ser.rcv.service.ServiceReceiveService;
import chn.bhmc.dms.ser.rcv.service.dao.ServiceReceiveDAO;
import chn.bhmc.dms.ser.rcv.service.dao.ServiceReceiveDetailDAO;
import chn.bhmc.dms.ser.rcv.vo.ServicePackageReceiveSaveVO;
import chn.bhmc.dms.ser.rcv.vo.ServicePackageReceiveVO;
import chn.bhmc.dms.ser.rcv.vo.ServiceReceiveDetailVO;
import chn.bhmc.dms.ser.rcv.vo.ServiceReceiveSearchVO;
import chn.bhmc.dms.ser.rcv.vo.ServiceReceiveVO;

/**
 * <pre>
 * 수납관리 구현 서비스
 * </pre>
 *
 * @ClassName   : ServiceReceiveServiceImpl.java
 * @Description : 수납관리 ServiceImpl
 * @author Yin Xueyuan
 * @since 2016. 4. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.4. 20.   Yin Xueyuan      최초 생성
 * </pre>
 */

@Service("serviceReceiveService")
public class ServiceReceiveServiceImpl extends HService implements ServiceReceiveService, JxlsSupport{

    /**
    * 수납관리 DAO
    */
   @Resource(name="serviceReceiveDAO")
   ServiceReceiveDAO serviceReceiveDAO;

   /**
    * 수납관리 DAO
    */
   @Resource(name="serviceReceiveDetailDAO")
   ServiceReceiveDetailDAO serviceReceiveDetailDAO;

   /**
    * 수납관리 SEQ
   */
   @Resource(name="serviceReceiveDocNoIdgenService")
   TableIdGenService serviceReceiveDocNoIdgenService;

   /**
    * 
    */
   @Autowired
   ServiceCommonService serviceCommonService;
   /**
    * 조회 조건에 해당하는 수납관리 정보를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 ServiceReceiveSearchVO
    * @return 조회 목록
    */
   @Override
   public List<ServiceReceiveVO> selectServiceReceiveByCondition(ServiceReceiveSearchVO searchVO) throws Exception {
	   String dlrCd = LoginUtil.getDlrCd();
       if( StringUtil.isNullToString(searchVO.getsDlrCd()).equals("") || searchVO.getsDlrCd().equals(dlrCd)){
           searchVO.setsDlrCd(dlrCd);
           return serviceReceiveDAO.selectServiceReceiveByCondition(searchVO);
       }
	   //服务历史结算费用(付款类型查询)
       Map<String, Object> message = new HashMap<String, Object>();
       List<ServiceReceiveVO> ServiceReceiveList = new ArrayList<>();
       message.put("I_LANG_CD", searchVO.getsLangCd());
       message.put("I_DLR_CD", searchVO.getsDlrCd());
       message.put("I_RO_DOC_NO",searchVO.getsRoDocNo());
       Data receiveData = serviceCommonService.executeCamelClentSearchResult(message, "SER119");
       if("Z".equals(receiveData.getFooter().getIfResult())) {
    	   	ServiceReceiveList = receiveData.readMessages(ServiceReceiveVO.class);
       }
       return ServiceReceiveList;
   }

   /**
    * 조회 조건에 해당하는 수납관리 총 갯수를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 ServiceReceiveSearchVO
    * @return
    */
   @Override
   public int selectServiceReceiveByConditionCnt(ServiceReceiveSearchVO searchVO) throws Exception {
       searchVO.setsDlrCd(LoginUtil.getDlrCd());
       return serviceReceiveDAO.selectServiceReceiveByConditionCnt(searchVO);
   }

    /**
     * 수납관리 정보를 등록한다.
     * @param serviceReceiveVO - 등록할 정보가 담긴 ServiceReceiveVO
     * @return 등록된 목록수
     */
   @Override
   public int insertServiceReceive(ServiceReceiveVO serviceReceiveVO) throws Exception {

        serviceReceiveVO.setRcvDocNo(serviceReceiveDocNoIdgenService.getNextStringId());
        serviceReceiveVO.setDlrCd(LoginUtil.getDlrCd());
        serviceReceiveVO.setRegUsrId(LoginUtil.getUserId());
        serviceReceiveVO.setUpdtUsrId(LoginUtil.getUserId());
        return serviceReceiveDAO.insertServiceReceive(serviceReceiveVO);
   }

    /**
     * 수납관리 정보를 수정한다.
     * @param serviceReceiveVO - 수정할 정보가 담긴 ServiceReceiveVO
     * @return 수정된 목록수
     */
   @Override
   public int updateServiceReceive(ServiceReceiveVO serviceReceiveVO) throws Exception {
        serviceReceiveVO.setUpdtUsrId(LoginUtil.getUserId());
        return serviceReceiveDAO.updateServiceReceive(serviceReceiveVO);
   }

    /**
     * 수납관리 정보를 삭제한다.
     * @param serviceReceiveVO - 삭제할 정보가 담긴 ServiceReceiveVO
     * @return 삭제된 목록수
     */
   @Override
   public int deleteServiceReceive(ServiceReceiveVO serviceReceiveVO) throws Exception {
        serviceReceiveVO.setDlrCd(LoginUtil.getDlrCd());
        return serviceReceiveDAO.deleteServiceReceive(serviceReceiveVO);
   }

	/**
     * 수납관리 등록/수정/삭제 일괄처리
     */
   @Override
   public void multiServiceReceives(BaseSaveVO<ServiceReceiveVO> obj) throws Exception {

        for(ServiceReceiveVO serviceReceiveVO : obj.getInsertList()){
            serviceReceiveVO.setDlrCd(LoginUtil.getDlrCd());
            insertServiceReceive(serviceReceiveVO);
        }

        for(ServiceReceiveVO serviceReceiveVO : obj.getUpdateList()){
            serviceReceiveVO.setDlrCd(LoginUtil.getDlrCd());
            updateServiceReceive(serviceReceiveVO);
        }

        for(ServiceReceiveVO serviceReceiveVO : obj.getDeleteList()){
            serviceReceiveVO.setDlrCd(LoginUtil.getDlrCd());
            deleteServiceReceive(serviceReceiveVO);
        }
   }

   /**
    * 조회 조건에 해당하는 수납관리 키정보를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 ServiceReceiveSearchVO
    * @return 조회 목록
    */
   @Override
   public ServiceReceiveVO selectServiceReceiveByKey(ServiceReceiveSearchVO searchVO) throws Exception {
       searchVO.setsDlrCd(LoginUtil.getDlrCd());
       return serviceReceiveDAO.selectServiceReceiveByKey(searchVO);
   }

   /**
    * 조회 조건에 해당하는 수납현황 정보를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 ServiceReceiveSearchVO
    * @return 조회 목록
    */
   @Override
   public List<ServiceReceiveVO> selectServiceReceiveStatusByCondition(ServiceReceiveSearchVO searchVO) throws Exception {

       searchVO.setsDlrCd(LoginUtil.getDlrCd());
       searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
       return serviceReceiveDAO.selectServiceReceiveStatusByCondition(searchVO);
   }

   /**
    * 조회 조건에 해당하는 수납현황 총 갯수를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 ServiceReceiveSearchVO
    * @return
    */
   @Override
   public int selectServiceReceiveStatusByConditionCnt(ServiceReceiveSearchVO searchVO) throws Exception {
       searchVO.setsDlrCd(LoginUtil.getDlrCd());
       searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
       return serviceReceiveDAO.selectServiceReceiveStatusByConditionCnt(searchVO);
   }

   /**
    * 조회 조건에 해당하는 일괄수납관리 정보를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 ServiceReceiveSearchVO
    * @return 조회 목록
    */
   public List<ServicePackageReceiveVO> selectServicePackageReceiveByCondition(ServiceReceiveSearchVO searchVO) throws Exception {
       searchVO.setsDlrCd(LoginUtil.getDlrCd());
       searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
       return serviceReceiveDAO.selectServicePackageReceiveByCondition(searchVO);
   }

   /**
    * 조회 조건에 해당하는 일괄수납관리 총 갯수를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 ServiceReceiveSearchVO
    * @return
    */
   public int selectServicePackageReceiveByConditionCnt(ServiceReceiveSearchVO searchVO) throws Exception {
       searchVO.setsDlrCd(LoginUtil.getDlrCd());
       return serviceReceiveDAO.selectServicePackageReceiveByConditionCnt(searchVO);
   }

   /**
    * 일괄수납 정보를 등록/수정/삭제 처리한다.
    * @param serviceReceiveSaveVO
    */
   public void multiServicePackageReceives(ServicePackageReceiveSaveVO saveVO) throws Exception {

       ServiceReceiveDetailVO detailVO = new ServiceReceiveDetailVO();
       for(ServicePackageReceiveVO rcvVO : saveVO.getServicePackageReceiveSaveVO()){
           detailVO.setDlrCd(LoginUtil.getDlrCd());
           detailVO.setUpdtUsrId(LoginUtil.getUserId());
           detailVO.setRcvSubDocNo(rcvVO.getRcvSubDocNo());
           detailVO.setRcptNo(saveVO.getServiceReceiveDetailVO().getRcptNo());
           detailVO.setRcptTp(saveVO.getServiceReceiveDetailVO().getRcptTp());
           detailVO.setRcvAmt(rcvVO.getPaymAmt());
           detailVO.setRcvStatCd(saveVO.getServiceReceiveDetailVO().getRcvStatCd());

           serviceReceiveDetailDAO.updateServiceReceiveDetail(detailVO);
       }
   }

    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        ServiceReceiveSearchVO searchVO = new ServiceReceiveSearchVO();

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        String sTabId = (String)params.get("sTabId");
        if(StringUtil.nullConvert(sTabId).equals("LIST")){
            if(!StringUtils.isBlank(params.get("sRcvCpltFromDt").toString())){
                String sRcvCpltFromDt = params.get("sRcvCpltFromDt").toString();
                Date dRcvCpltFromDt = DateUtil.convertToDate(sRcvCpltFromDt);
                searchVO.setsRcvCpltFromDt(dRcvCpltFromDt);
            }
            if(!StringUtils.isBlank(params.get("sRcvCpltToDt").toString())){
                String sRcvCpltToDt = params.get("sRcvCpltToDt").toString();
                Date dRcvCpltToDt = DateUtil.convertToDate(sRcvCpltToDt);
                searchVO.setsRcvCpltToDt(dRcvCpltToDt);
            }

            List<ServiceReceiveVO> list = selectServiceReceiveStatusByCondition(searchVO);
            context.putVar("items", list);

        }else{
            if(!StringUtils.isBlank(params.get("sCalcFromDt").toString())){
                String sCalcFromDt = params.get("sCalcFromDt").toString();
                Date dCalcFromDt = DateUtil.convertToDate(sCalcFromDt);
                searchVO.setsCalcFromDt(dCalcFromDt);
            }
            if(!StringUtils.isBlank(params.get("sCalcToDt").toString())){
                String sCalcToDt = params.get("sCalcToDt").toString();
                Date dCalcToDt = DateUtil.convertToDate(sCalcToDt);
                searchVO.setsCalcToDt(dCalcToDt);
            }

            List<ServiceReceiveVO> list = selectServiceReceiveByCondition(searchVO);
            context.putVar("items", list);
        }


    }

}
