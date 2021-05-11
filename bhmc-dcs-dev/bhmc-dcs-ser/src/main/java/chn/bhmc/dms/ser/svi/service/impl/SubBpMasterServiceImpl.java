package chn.bhmc.dms.ser.svi.service.impl;


import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.svi.service.SubBpMasterService;
import chn.bhmc.dms.ser.svi.service.dao.SubBpMasterDAO;
import chn.bhmc.dms.ser.svi.vo.SubBpMasterSearchVO;
import chn.bhmc.dms.ser.svi.vo.SubBpMasterVO;

/**
 * <pre>
 * 외주거래처 구현 서비스
 * </pre>
 *
 * @ClassName   : SubBpMasterServiceImpl.java
 * @Description : 외주거래처 ServiceImpl
 * @author Yin Xueyuan
 * @since 2016. 2. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 24.   Yin Xueyuan      최초 생성
 * </pre>
 */

@Service("subBpMasterService")
public class SubBpMasterServiceImpl extends HService implements SubBpMasterService {

    /**
    * 외주거래처 DAO
    */
   @Resource(name="subBpMasterDAO")
   SubBpMasterDAO subBpMasterDAO;

   /**
    * 조회 조건에 해당하는 외주거래처 정보를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 SubBpMasterSearchVO
    * @return 조회 목록
    */
   @Override
   public List<SubBpMasterVO> selectSubBpMasterByCondition(SubBpMasterSearchVO searchVO) throws Exception {
       return subBpMasterDAO.selectSubBpMasterByCondition(searchVO);
   }

   /**
    * 조회 조건에 해당하는 외주거래처 총 갯수를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 SubBpMasterSearchVO
    * @return
    */
   @Override
   public int selectSubBpMasterByConditionCnt(SubBpMasterSearchVO searchVO) throws Exception {
       return subBpMasterDAO.selectSubBpMasterByConditionCnt(searchVO);
   }

    /**
     * 외주거래처 정보를 등록한다.
     * @param subBpMasterVO - 등록할 정보가 담긴 SubBpMasterVO
     * @return 등록된 목록수
     */
   @Override
   public int insertSubBpMaster(SubBpMasterVO subBpMasterVO) throws Exception {
        return subBpMasterDAO.insertSubBpMaster(subBpMasterVO);
   }

    /**
     * 외주거래처 정보를 수정한다.
     * @param subBpMasterVO - 수정할 정보가 담긴 SubBpMasterVO
     * @return 수정된 목록수
     */
   @Override
   public int updateSubBpMaster(SubBpMasterVO subBpMasterVO) throws Exception {
        return subBpMasterDAO.updateSubBpMaster(subBpMasterVO);
   }

    /**
     * 외주거래처 정보를 삭제한다.
     * @param subBpMasterVO - 삭제할 정보가 담긴 SubBpMasterVO
     * @return 삭제된 목록수
     */
   @Override
   public int deleteSubBpMaster(SubBpMasterVO subBpMasterVO) throws Exception {
        return subBpMasterDAO.deleteSubBpMaster(subBpMasterVO);
   }

	/**
     * 외주거래처 등록/수정/삭제 일괄처리
     */
   @Override
   public void multiSubBpMasters(BaseSaveVO<SubBpMasterVO> obj) throws Exception {

        for(SubBpMasterVO subBpMasterVO : obj.getInsertList()){
            subBpMasterVO.setDlrCd(LoginUtil.getDlrCd());
            subBpMasterVO.setRegUsrId(LoginUtil.getUserId());
            subBpMasterVO.setUpdtUsrId(LoginUtil.getUserId());
            subBpMasterDAO.insertSubBpMaster(subBpMasterVO);
        }

        for(SubBpMasterVO subBpMasterVO : obj.getUpdateList()){
            subBpMasterVO.setUpdtUsrId(LoginUtil.getUserId());
            subBpMasterDAO.updateSubBpMaster(subBpMasterVO);
        }

        for(SubBpMasterVO subBpMasterVO : obj.getDeleteList()){
            subBpMasterDAO.deleteSubBpMaster(subBpMasterVO);
        }
   }

}
