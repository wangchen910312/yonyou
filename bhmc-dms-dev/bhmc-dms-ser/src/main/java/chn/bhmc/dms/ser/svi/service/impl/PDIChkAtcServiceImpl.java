package chn.bhmc.dms.ser.svi.service.impl;


import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.svi.service.PDIChkAtcService;
import chn.bhmc.dms.ser.svi.service.dao.PDIChkAtcDAO;
import chn.bhmc.dms.ser.svi.vo.PDIChkAtcSearchVO;
import chn.bhmc.dms.ser.svi.vo.PDIChkAtcVO;

/**
 * <pre>
 * PDI점검항목 구현 서비스
 * </pre>
 *
 * @ClassName   : PDIChkAtcServiceImpl.java
 * @Description : PDI점검항목 ServiceImpl
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

@Service("pDIChkAtcService")
public class PDIChkAtcServiceImpl extends HService implements PDIChkAtcService {

    /**
    * PDI점검항목 DAO
    */
   @Resource(name="pDIChkAtcDAO")
   PDIChkAtcDAO pDIChkAtcDAO;

   /**
    * 조회 조건에 해당하는 PDI점검항목 정보를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 PDIChkAtcSearchVO
    * @return 조회 목록
    */
   @Override
   public List<PDIChkAtcVO> selectPDIChkAtcByCondition(PDIChkAtcSearchVO searchVO) throws Exception {
       //searchVO.setsDlrCd(LoginUtil.getDlrCd());
       return pDIChkAtcDAO.selectPDIChkAtcByCondition(searchVO);
   }

   /**
    * 조회 조건에 해당하는 PDI점검항목 총 갯수를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 PDIChkAtcSearchVO
    * @return
    */
   @Override
   public int selectPDIChkAtcByConditionCnt(PDIChkAtcSearchVO searchVO) throws Exception {
       //searchVO.setsDlrCd(LoginUtil.getDlrCd());
       return pDIChkAtcDAO.selectPDIChkAtcByConditionCnt(searchVO);
   }

    /**
     * PDI점검항목 정보를 등록한다.
     * @param pDIChkAtcDAO - 등록할 정보가 담긴 PDIChkAtcVO
     * @return 등록된 목록수
     */
   @Override
   public int insertPDIChkAtc(PDIChkAtcVO pDIChkAtcVO) throws Exception {
       pDIChkAtcVO.setDlrCd(LoginUtil.getDlrCd());
       pDIChkAtcVO.setRegUsrId(LoginUtil.getUserId());
       pDIChkAtcVO.setUpdtUsrId(LoginUtil.getUserId());
       return pDIChkAtcDAO.insertPDIChkAtc(pDIChkAtcVO);
   }

    /**
     * PDI점검항목 정보를 수정한다.
     * @param pDIChkAtcDAO - 수정할 정보가 담긴 PDIChkAtcVO
     * @return 수정된 목록수
     */
   @Override
   public int  updatePDIChkAtc(PDIChkAtcVO pDIChkAtcVO) throws Exception {
        pDIChkAtcVO.setUpdtUsrId(LoginUtil.getUserId());
        return pDIChkAtcDAO.updatePDIChkAtc(pDIChkAtcVO);
   }

    /**
     * PDI점검항목 정보를 삭제한다.
     * @param pDIChkAtcDAO - 삭제할 정보가 담긴 PDIChkAtcVO
     * @return 삭제된 목록수
     */
   @Override
   public int deletePDIChkAtc(PDIChkAtcVO pDIChkAtcVO) throws Exception {
        return pDIChkAtcDAO.deletePDIChkAtc(pDIChkAtcVO);
   }

	/**
     * PDI점검항목 등록/수정/삭제 일괄처리
     */
   @Override
   public void multiPDIChkAtcs(BaseSaveVO<PDIChkAtcVO> obj) throws Exception {

        for(PDIChkAtcVO pDIChkAtcVO : obj.getInsertList()){
            insertPDIChkAtc(pDIChkAtcVO);
        }

        for(PDIChkAtcVO pDIChkAtcVO : obj.getUpdateList()){
            updatePDIChkAtc(pDIChkAtcVO);
        }

        for(PDIChkAtcVO pDIChkAtcVO : obj.getDeleteList()){
            deletePDIChkAtc(pDIChkAtcVO);
        }
   }

}
