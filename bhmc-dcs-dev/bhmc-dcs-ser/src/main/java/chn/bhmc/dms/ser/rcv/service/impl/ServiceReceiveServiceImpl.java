package chn.bhmc.dms.ser.rcv.service.impl;


import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.ser.rcv.service.ServiceReceiveService;
import chn.bhmc.dms.ser.rcv.service.dao.ServiceReceiveDAO;
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
public class ServiceReceiveServiceImpl extends HService implements ServiceReceiveService{

    /**
    * 수납관리 DAO
    */
   @Resource(name="serviceReceiveDAO")
   ServiceReceiveDAO serviceReceiveDAO;

   /**
    * 조회 조건에 해당하는 수납관리 정보를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 ServiceReceiveSearchVO
    * @return 조회 목록
    */
   @Override
   public List<ServiceReceiveVO> selectServiceReceiveByCondition(ServiceReceiveSearchVO searchVO) throws Exception {
       searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
       return serviceReceiveDAO.selectServiceReceiveByCondition(searchVO);
   }

   /**
    * 조회 조건에 해당하는 수납관리 총 갯수를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 ServiceReceiveSearchVO
    * @return
    */
   @Override
   public int selectServiceReceiveByConditionCnt(ServiceReceiveSearchVO searchVO) throws Exception {
       searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
       return serviceReceiveDAO.selectServiceReceiveByConditionCnt(searchVO);
   }

}
