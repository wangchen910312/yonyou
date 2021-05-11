package chn.bhmc.dms.ser.svi.service.impl;


import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.svi.service.ServiceSettingService;
import chn.bhmc.dms.ser.svi.service.dao.ServiceSettingDAO;
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

   /**
    * 조회 조건에 해당하는 서비스 설정 정보를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 ServiceSettingSearchVO
    * @return 조회 목록
    */
   @Override
   public List<ServiceSettingVO> selectServiceSettingByCondition(ServiceSettingSearchVO searchVO) throws Exception {
       return serviceSettingDAO.selectServiceSettingByCondition(searchVO);
   }

   /**
    * 조회 조건에 해당하는 서비스 설정 총 갯수를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 ServiceSettingSearchVO
    * @return
    */
   @Override
   public int selectServiceSettingByConditionCnt(ServiceSettingSearchVO searchVO) throws Exception {
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
   public void multiServiceSettings(BaseSaveVO<ServiceSettingVO> obj) throws Exception {

        for(ServiceSettingVO serviceSettingVO : obj.getInsertList()){
            serviceSettingVO.setDlrCd(LoginUtil.getDlrCd());
            serviceSettingVO.setRegUsrId(LoginUtil.getUserId());
            serviceSettingVO.setUpdtUsrId(LoginUtil.getUserId());
            serviceSettingDAO.insertServiceSetting(serviceSettingVO);
        }

        for(ServiceSettingVO serviceSettingVO : obj.getUpdateList()){
            serviceSettingVO.setUpdtUsrId(LoginUtil.getUserId());
            serviceSettingDAO.updateServiceSetting(serviceSettingVO);
        }

        for(ServiceSettingVO serviceSettingVO : obj.getDeleteList()){
            serviceSettingDAO.deleteServiceSetting(serviceSettingVO);
        }
   }

}
