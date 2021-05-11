package chn.bhmc.dms.ser.svi.service.impl;


import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.svi.service.DcMasterService;
import chn.bhmc.dms.ser.svi.service.dao.DcMasterDAO;
import chn.bhmc.dms.ser.svi.vo.DcMasterSearchVO;
import chn.bhmc.dms.ser.svi.vo.DcMasterVO;

/**
 * <pre>
 * 할인관리 구현 서비스
 * </pre>
 *
 * @ClassName   : DcMasterServiceImpl.java
 * @Description : 할인관리 ServiceImpl
 * @author Yin Xueyuan
 * @since 2016. 1. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 27.   Yin Xueyuan      최초 생성
 * </pre>
 */

@Service("dcMasterService")
public class DcMasterServiceImpl extends HService implements DcMasterService {

    /**
    * 할인관리 DAO
    */
   @Resource(name="dcMasterDAO")
   DcMasterDAO dcMasterDAO;

   /**
    * 할인관리 SEQ
   */
   @Resource(name="dcDocNoIdgenService")
   TableIdGenService dcDocNoIdgenService;

   /**
    * 조회 조건에 해당하는 할인관리 정보를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 DcMasterSearchVO
    * @return 조회 목록
    */
   @Override
   public List<DcMasterVO> selectDcMasterByCondition(DcMasterSearchVO searchVO) throws Exception {
       return dcMasterDAO.selectDcMasterByCondition(searchVO);
   }

   /**
    * 조회 조건에 해당하는 할인관리 총 갯수를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 DcMasterSearchVO
    * @return
    */
   @Override
   public int selectDcMasterByConditionCnt(DcMasterSearchVO searchVO) throws Exception {
       return dcMasterDAO.selectDcMasterByConditionCnt(searchVO);
   }

    /**
     * 할인관리 정보를 등록한다.
     * @param dcMasterDAO - 등록할 정보가 담긴 DcMasterVO
     * @return 등록된 목록수
     */
   @Override
   public int insertDcMaster(DcMasterVO dcMasterVO) throws Exception {
       dcMasterVO.setDlrCd(LoginUtil.getDlrCd());
       dcMasterVO.setRegUsrId(LoginUtil.getUserId());
       dcMasterVO.setUpdtUsrId(LoginUtil.getUserId());
       /**
        * 할인 번호(키생성)
        */
       dcMasterVO.setDcCd(dcDocNoIdgenService.getNextStringId());
       return dcMasterDAO.insertDcMaster(dcMasterVO);
   }

    /**
     * 할인관리 정보를 수정한다.
     * @param dcMasterDAO - 수정할 정보가 담긴 DcMasterVO
     * @return 수정된 목록수
     */
   @Override
   public int  updateDcMaster(DcMasterVO dcMasterVO) throws Exception {
        dcMasterVO.setUpdtUsrId(LoginUtil.getUserId());
        return dcMasterDAO.updateDcMaster(dcMasterVO);
   }

    /**
     * 할인관리 정보를 삭제한다.
     * @param dcMasterDAO - 삭제할 정보가 담긴 DcMasterVO
     * @return 삭제된 목록수
     */
   @Override
   public int deleteDcMaster(DcMasterVO dcMasterVO) throws Exception {
        return dcMasterDAO.deleteDcMaster(dcMasterVO);
   }

	/**
     * 할인관리 등록/수정/삭제 일괄처리
     */
   @Override
   public void multiDcMasters(BaseSaveVO<DcMasterVO> obj) throws Exception {

        for(DcMasterVO dcMasterVO : obj.getInsertList()){
            insertDcMaster(dcMasterVO);
        }

        for(DcMasterVO dcMasterVO : obj.getUpdateList()){
            updateDcMaster(dcMasterVO);
        }

        for(DcMasterVO dcMasterVO : obj.getDeleteList()){
            deleteDcMaster(dcMasterVO);
        }
   }

}
