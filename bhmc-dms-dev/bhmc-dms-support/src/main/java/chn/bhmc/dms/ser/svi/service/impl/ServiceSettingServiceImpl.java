package chn.bhmc.dms.ser.svi.service.impl;


import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.util.*;
import chn.bhmc.dms.ser.svi.service.ServiceSettingService;
import chn.bhmc.dms.ser.svi.service.dao.ServiceSettingDAO;
import chn.bhmc.dms.ser.svi.vo.ServiceSettingSaveVO;
import chn.bhmc.dms.ser.svi.vo.ServiceSettingSearchVO;
import chn.bhmc.dms.ser.svi.vo.ServiceSettingVO;

/**
 * <pre>
 * 서비스 설정 구현 서비스
 * </pre>
 *
 * @ClassName   : ServiceSettingServiceImpl.java
 * @Description : 서비스 설정 ServiceImpl
 * @author Yin Xueyuan
 * @since 2016. 7. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 7.   Yin Xueyuan      최초 생성
 * </pre>
 */

@Service("serviceSettingService")
public class ServiceSettingServiceImpl extends HService implements ServiceSettingService {

    /**
    * 서비스 설정 DAO
    */
   @Resource(name="serviceSettingDAO")
   ServiceSettingDAO serviceSettingDAO;

   @Resource(name="commonCodeService")
   CommonCodeService commonCodeService;

   /**
    * 조회 조건에 해당하는 서비스 설정 정보를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 ServiceSettingSearchVO
    * @return 조회 목록
    */
   @Override
   public List<ServiceSettingVO> selectServiceSettingByCondition(ServiceSettingSearchVO searchVO) throws Exception {
       searchVO.setsDlrCd(LoginUtil.getDlrCd());
       return serviceSettingDAO.selectServiceSettingByCondition(searchVO);
   }

   /**
    * 조회 조건에 해당하는 서비스 설정 총 갯수를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 ServiceSettingSearchVO
    * @return
    */
   @Override
   public int selectServiceSettingByConditionCnt(ServiceSettingSearchVO searchVO) throws Exception {
       searchVO.setsDlrCd(LoginUtil.getDlrCd());
       return serviceSettingDAO.selectServiceSettingByConditionCnt(searchVO);
   }

    /**
     * 서비스 설정 정보를 등록한다.
     * @param serviceSettingVO - 등록할 정보가 담긴 ServiceSettingVO
     * @return 등록된 목록수
     */
   @Override
   public int insertServiceSetting(ServiceSettingVO serviceSettingVO) throws Exception {
       serviceSettingVO.setRegUsrId(LoginUtil.getUserId());
       serviceSettingVO.setUpdtUsrId(LoginUtil.getUserId());
       serviceSettingVO.setDlrCd(LoginUtil.getDlrCd());
       deleteServiceSetting(serviceSettingVO);
       return serviceSettingDAO.insertServiceSetting(serviceSettingVO);
   }

    /**
     * 서비스 설정 정보를 수정한다.
     * @param serviceSettingVO - 수정할 정보가 담긴 ServiceSettingVO
     * @return 수정된 목록수
     */
   @Override
   public int updateServiceSetting(ServiceSettingVO serviceSettingVO) throws Exception {
       serviceSettingVO.setDlrCd(LoginUtil.getDlrCd());
       serviceSettingVO.setUpdtUsrId(LoginUtil.getUserId());
       return serviceSettingDAO.updateServiceSetting(serviceSettingVO);
   }

    /**
     * 서비스 설정 정보를 삭제한다.
     * @param serviceSettingVO - 삭제할 정보가 담긴 ServiceSettingVO
     * @return 삭제된 목록수
     */
   @Override
   public int deleteServiceSetting(ServiceSettingVO serviceSettingVO) throws Exception {
        return serviceSettingDAO.deleteServiceSetting(serviceSettingVO);
   }

	/**
     * 서비스 설정 등록/수정/삭제 일괄처리
     */
   @Override
   public void multiServiceSettings(ServiceSettingSaveVO saveVO) throws Exception {

       saveVO.getServiceSettingVO().setRegUsrId(LoginUtil.getUserId());
       saveVO.getServiceSettingVO().setUpdtUsrId(LoginUtil.getUserId());
       saveVO.getServiceSettingVO().setDlrCd(LoginUtil.getDlrCd());
       deleteServiceSetting(saveVO.getServiceSettingVO());
       serviceSettingDAO.insertServiceSetting(saveVO.getServiceSettingVO());

       serviceSettingDAO.updateSerDlrInfo(saveVO.getServiceSettingVO());

       for(CommonCodeVO codeVO : saveVO.getCmmCodeListVO()){
            codeVO.setUpdtUsrId(LoginUtil.getUserId());
            codeVO.setUseYn("Y");
            commonCodeService.updateInitRemarkByService(codeVO);
            commonCodeService.updateRemarkByService(codeVO);
       }
   }

   /**
    * 조회 조건에 해당하는 서비스 설정을 조회한다.
    * @param searchVO - 조회 조건을 포함하는 ServiceSettingSearchVO
    * @return
    */
   public ServiceSettingVO selectServiceSettingByKey(ServiceSettingSearchVO searchVO) throws Exception {
        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return serviceSettingDAO.selectServiceSettingByKey(searchVO);
   }

   /**
    * 서비스 설정값에 프린트지역타입에 따라 적절한 리포트네임을 가져온다.
    * @param pageNo - (1:RO문서, 2:정비정산서)
    * @return 리포트네임
    */
   @Override
   public String getRptNm(int pageNo) throws Exception {
       ServiceSettingSearchVO searchVO = new ServiceSettingSearchVO();
       searchVO.setsDlrCd(LoginUtil.getDlrCd());
       ServiceSettingVO serviceSettingVO = selectServiceSettingByKey(searchVO);
       String rptNm = "";

       if(!ObjectUtil.isNull(serviceSettingVO)){
           CommonCodeVO commonCodeVO = commonCodeService.selectCommonCodeByKey("SER993", serviceSettingVO.getPrintAreaTp());
           if(!ObjectUtil.isNull(commonCodeVO)){
               switch(pageNo){
                   case 1: //1:RO문서
                       rptNm = commonCodeVO.getRemark1();
                       break;
                   case 2: //2:정비정산서
                       rptNm = commonCodeVO.getRemark2();
                       break;
                   default:
                       break;
               }
           }
       }
       return rptNm;
   }
}
