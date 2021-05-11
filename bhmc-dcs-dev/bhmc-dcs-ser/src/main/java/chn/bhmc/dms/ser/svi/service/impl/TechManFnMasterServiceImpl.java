package chn.bhmc.dms.ser.svi.service.impl;


import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.svi.service.TechManFnMasterService;
import chn.bhmc.dms.ser.svi.service.dao.TechManFnMasterDAO;
import chn.bhmc.dms.ser.svi.vo.TechManFnMasterSearchVO;
import chn.bhmc.dms.ser.svi.vo.TechManFnMasterVO;

/**
 * <pre>
 * 테크멘 기능관리 구현 서비스
 * </pre>
 *
 * @ClassName   : TechManFnMasterServiceImpl.java
 * @Description : 테크멘 기능관리 ServiceImpl
 * @author Yin Xueyuan
 * @since 2016. 2. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 11.   Yin Xueyuan      최초 생성
 * </pre>
 */

@Service("techManFnMasterService")
public class TechManFnMasterServiceImpl extends HService implements TechManFnMasterService {

    /**
    * 테크멘 기능관리 DAO
    */
   @Resource(name="techManFnMasterDAO")
   TechManFnMasterDAO techManFnMasterDAO;

   /**
    * 조회 조건에 해당하는 테크멘 기능관리 정보를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 TechManFnMasterSearchVO
    * @return 조회 목록
    */
   @Override
   public List<TechManFnMasterVO> selectTechManFnMasterByCondition(TechManFnMasterSearchVO searchVO) throws Exception {
       return techManFnMasterDAO.selectTechManFnMasterByCondition(searchVO);
   }

   /**
    * 조회 조건에 해당하는 테크멘 기능관리 총 갯수를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 TechManFnMasterSearchVO
    * @return
    */
   @Override
   public int selectTechManFnMasterByConditionCnt(TechManFnMasterSearchVO searchVO) throws Exception {
       return techManFnMasterDAO.selectTechManFnMasterByConditionCnt(searchVO);
   }

    /**
     * 테크멘 기능관리 정보를 등록한다.
     * @param techManFnMasterVO - 등록할 정보가 담긴 TechManFnMasterVO
     * @return 등록된 목록수
     */
   @Override
   public int insertTechManFnMaster(TechManFnMasterVO techManFnMasterVO) throws Exception {
       return techManFnMasterDAO.insertTechManFnMaster(techManFnMasterVO);
   }

    /**
     * 테크멘 기능관리 정보를 수정한다.
     * @param techManFnMasterVO - 수정할 정보가 담긴 TechManFnMasterVO
     * @return 수정된 목록수
     */
   @Override
   public int updateTechManFnMaster(TechManFnMasterVO techManFnMasterVO) throws Exception {
        return techManFnMasterDAO.updateTechManFnMaster(techManFnMasterVO);
   }

    /**
     * 테크멘 기능관리 정보를 삭제한다.
     * @param techManFnMasterVO - 삭제할 정보가 담긴 TechManFnMasterVO
     * @return 삭제된 목록수
     */
   @Override
   public int deleteTechManFnMaster(TechManFnMasterVO techManFnMasterVO) throws Exception {
        return techManFnMasterDAO.deleteTechManFnMaster(techManFnMasterVO);
   }

	/**
     * 테크멘 기능관리 등록/수정/삭제 일괄처리
     */
   @Override
   public void multiTechManFnMasters(BaseSaveVO<TechManFnMasterVO> obj) throws Exception {

        for(TechManFnMasterVO techManFnMasterVO : obj.getInsertList()){
            techManFnMasterVO.setDlrCd(LoginUtil.getDlrCd());
            techManFnMasterVO.setRegUsrId(LoginUtil.getUserId());
            techManFnMasterVO.setUpdtUsrId(LoginUtil.getUserId());
            techManFnMasterDAO.insertTechManFnMaster(techManFnMasterVO);
        }

        for(TechManFnMasterVO techManFnMasterVO : obj.getUpdateList()){
            techManFnMasterVO.setUpdtUsrId(LoginUtil.getUserId());
            techManFnMasterDAO.updateTechManFnMaster(techManFnMasterVO);
        }

        for(TechManFnMasterVO techManFnMasterVO : obj.getDeleteList()){
            techManFnMasterDAO.deleteTechManFnMaster(techManFnMasterVO);
        }
   }

}
