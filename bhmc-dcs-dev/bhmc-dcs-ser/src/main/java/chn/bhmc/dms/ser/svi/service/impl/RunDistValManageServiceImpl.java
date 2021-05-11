package chn.bhmc.dms.ser.svi.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;

import chn.bhmc.dms.ser.cmm.service.ServiceCommonService;

import chn.bhmc.dms.ser.svi.service.RunDistValManageService;
import chn.bhmc.dms.ser.svi.service.dao.RunDistValManageDAO;
import chn.bhmc.dms.ser.svi.vo.RunDistValManageVO;
import chn.bhmc.dms.ser.svi.vo.RunDistValSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RunDistValManageServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ki hyun Kwon
 * @since 2017. 3. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 3. 12.     Ki hyun Kwon     최초 생성
 * </pre>
 */
@Service("runDistValManageService")
public class RunDistValManageServiceImpl extends HService implements RunDistValManageService {

    @Resource(name="runDistValManageDAO")
    RunDistValManageDAO runDistValManageDAO;

    @Autowired
    ServiceCommonService serviceCommonService;

    /**
    *
    * 주행거리 목록수
    *
    * @param searchVO
    * @return
    * @throws Exception
    */
   public int selectRunDistValManagesByConditionCnt(RunDistValSearchVO searchVO) throws Exception{

       return runDistValManageDAO.selectRunDistValManagesByConditionCnt(searchVO);
   }

   /**
    *
    * 주행거리 목록
    *
    * @param searchVO
    * @return
    * @throws Exception
    */
   public List<RunDistValManageVO> selectRunDistValManagesByCondition(RunDistValSearchVO searchVO) throws Exception{

       searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
       return runDistValManageDAO.selectRunDistValManagesByCondition(searchVO);

   }

   /**
    *
    * VIN 마스터 주행거리 업데이트
    *
    * @param runDistValManageVO
    * @return
    * @throws Exception
    */
   public int updateVinRunDistVal(RunDistValManageVO runDistValManageVO)throws Exception{


       boolean result = true;

       //DCS-DMS EAI InterFace Header Info
       Map<String, Object> message = new HashMap<String, Object>();

       message.put("DLR_CD", runDistValManageVO.getDlrCd());
       message.put("VIN_NO",runDistValManageVO.getVinNo());
       message.put("RO_DOC_NO", runDistValManageVO.getRoDocNo());
       message.put("RUN_DIST_VAL", runDistValManageVO.getRunDistVal());
       message.put("LAST_RUN_DIST_VAL", runDistValManageVO.getLastRunDistVal());

       // RO 이력이 있는 모든 딜러에서 최종 주행거리 전송
       List<RunDistValManageVO> targetDealerList = runDistValManageDAO.selectTargetDealerList(runDistValManageVO);
       for(int i=0; i<targetDealerList.size(); i++){
           result = serviceCommonService.executeEaiCall(targetDealerList.get(i).getDlrCd(),"SER109",message,"Y");
       }

       //result = serviceCommonService.executeEaiCall(runDistValManageVO.getDlrCd(),"SER109",message,"Y");

       if(result){

           runDistValManageVO.setRegUsrId(LoginUtil.getUserId());
           runDistValManageVO.setUpdtUsrId(LoginUtil.getUserId());
           runDistValManageDAO.insertVinRunDistVal(runDistValManageVO);
           runDistValManageDAO.updateRunDistVal(runDistValManageVO);
       }

       return 1;

   }



}
