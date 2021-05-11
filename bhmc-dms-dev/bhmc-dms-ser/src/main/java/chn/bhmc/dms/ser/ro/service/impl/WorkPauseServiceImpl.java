package chn.bhmc.dms.ser.ro.service.impl;


import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.nms.service.NotificationMessageService;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.ro.service.RepairOrderService;
import chn.bhmc.dms.ser.ro.service.WorkAssignService;
import chn.bhmc.dms.ser.ro.service.WorkPauseService;
import chn.bhmc.dms.ser.ro.service.dao.WorkPauseDAO;
import chn.bhmc.dms.ser.ro.vo.WorkPauseSearchVO;
import chn.bhmc.dms.ser.ro.vo.WorkPauseVO;

/**
 * <pre>
 * 작업중지 구현 서비스
 * </pre>
 *
 * @ClassName   : WorkPauseServiceImpl.java
 * @Description : 작업중지 ServiceImpl
 * @author Yin Xueyuan
 * @since 2016. 7. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 22.   Yin Xueyuan      최초 생성
 * </pre>
 */

@Service("workPauseService")
public class WorkPauseServiceImpl extends HService implements WorkPauseService {

    /**
    * 작업중지 DAO
    */
   @Resource(name="workPauseDAO")
   WorkPauseDAO workPauseDAO;

   @Resource(name="workAssignService")
   WorkAssignService workAssignService;

   /**
    * 푸쉬알림 service
    */
   @Autowired
   NotificationMessageService notificationMessageService;

   @Autowired
   RepairOrderService repairOrderService;

   /**
    * 조회 조건에 해당하는 작업중지 정보를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 WorkPauseSearchVO
    * @return 조회 목록
    */
   @Override
   public List<WorkPauseVO> selectWorkPauseByCondition(WorkPauseSearchVO searchVO) throws Exception {

       if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
           searchVO.setsDlrCd(LoginUtil.getDlrCd());
       }
       searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
       return workPauseDAO.selectWorkPauseByCondition(searchVO);
   }

   /**
    * 조회 조건에 해당하는 작업중지 총 갯수를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 WorkPauseSearchVO
    * @return
    */
   @Override
   public int selectWorkPauseByConditionCnt(WorkPauseSearchVO searchVO) throws Exception {

       if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
           searchVO.setsDlrCd(LoginUtil.getDlrCd());
       }

       return workPauseDAO.selectWorkPauseByConditionCnt(searchVO);
   }

    /**
     * 작업중지 정보를 등록한다.
     * @param workPauseVO - 등록할 정보가 담긴 WorkPauseVO
     * @return 등록된 목록수
     */
   @Override
   public int insertWorkPause(WorkPauseVO workPauseVO) throws Exception {


        return workPauseDAO.insertWorkPause(workPauseVO);
   }

   /**
    * 작업중지 정보를 등록한다.
    * @param workPauseVO - 등록할 정보가 담긴 WorkPauseVO
    * @return 등록된 목록수
    */
   @Override
   public int insertWorkPauses(List<WorkPauseVO> workPauseListVO) throws Exception {
       WorkPauseVO workPauseVO = new WorkPauseVO();
       workPauseVO.setDlrCd(LoginUtil.getDlrCd());
       workPauseVO.setRoDocNo(workPauseListVO.get(0).getRoDocNo());

       workPauseDAO.deleteWorkPause(workPauseVO);

       for(WorkPauseVO vo : workPauseListVO){
           vo.setDlrCd(LoginUtil.getDlrCd());
           vo.setRegUsrId(LoginUtil.getUserId());
           workPauseDAO.insertWorkPause(vo);
       }

       return 1;
   }

    /**
     * 작업중지 정보를 수정한다.
     * @param workPauseVO - 수정할 정보가 담긴 WorkPauseVO
     * @return 수정된 목록수
     */
   @Override
   public int updateWorkPause(WorkPauseVO workPauseVO) throws Exception {
        workPauseVO.setUpdtUsrId(LoginUtil.getUserId());
        return workPauseDAO.updateWorkPause(workPauseVO);
   }

    /**
     * 작업중지 정보를 삭제한다.
     * @param workPauseVO - 삭제할 정보가 담긴 WorkPauseVO
     * @return 삭제된 목록수
     */
   @Override
   public int deleteWorkPause(WorkPauseVO workPauseVO) throws Exception {
        return workPauseDAO.deleteWorkPause(workPauseVO);
   }

	/**
     * 작업중지 등록/수정/삭제 일괄처리
     */
   @Override
   public void multiWorkPauses(BaseSaveVO<WorkPauseVO> obj) throws Exception {

        for(WorkPauseVO workPauseVO : obj.getInsertList()){
            insertWorkPause(workPauseVO);
        }

        for(WorkPauseVO workPauseVO : obj.getUpdateList()){
            updateWorkPause(workPauseVO);
        }

        for(WorkPauseVO workPauseVO : obj.getDeleteList()){
            deleteWorkPause(workPauseVO);
        }
   }

   /**
    * 조회 조건에 해당하는 작업중지 키정보를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 WorkPauseSearchVO
    * @return 조회 목록
    */
   @Override
   public WorkPauseVO selectWorkPauseByKey(WorkPauseSearchVO searchVO) throws Exception {

       if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
           searchVO.setsDlrCd(LoginUtil.getDlrCd());
       }

       return workPauseDAO.selectWorkPauseByKey(searchVO);
   }

    /**
     * 작업중지 별 데이터 정보
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<WorkPauseVO> selectRates(WorkPauseSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return workPauseDAO.selectRates(searchVO);
    }

    /**
     * 조회 조건에 해당하는 작업중지 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 WorkPauseSearchVO
     * @return 조회 목록
     */
    public List<WorkPauseVO> selectWorkPauseHistByCondition(WorkPauseSearchVO searchVO)throws Exception{

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return workPauseDAO.selectWorkPauseHistByCondition(searchVO);

    }

}

