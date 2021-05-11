package chn.bhmc.dms.ser.svi.service.impl;


import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.svi.service.RateMasterService;
import chn.bhmc.dms.ser.svi.service.dao.RateMasterDAO;
import chn.bhmc.dms.ser.svi.vo.RateMasterSearchVO;
import chn.bhmc.dms.ser.svi.vo.RateMasterVO;

/**
 * <pre>
 * 임률관리 구현 서비스
 * </pre>
 *
 * @ClassName   : RateMasterServiceImpl.java
 * @Description : 임률관리 ServiceImpl
 * @author Yin Xueyuan
 * @since 2016. 1. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 25.   Yin Xueyuan      최초 생성
 * </pre>
 */

@Service("rateMasterService")
public class RateMasterServiceImpl extends HService implements RateMasterService {

    /**
    * 임률관리 DAO
    */
   @Resource(name="rateMasterDAO")
   RateMasterDAO rateMasterDAO;

    /**
    * 임률관리 SEQ
   */
   @Resource(name="rateDocNoIdgenService")
   TableIdGenService rateDocNoIdgenService;

   /**
    * 조회 조건에 해당하는 임률관리 정보를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 RateMasterSearchVO
    * @return 조회 목록
    */
   @Override
   public List<RateMasterVO> selectRateMasterByCondition(RateMasterSearchVO searchVO) throws Exception {
       return rateMasterDAO.selectRateMasterByCondition(searchVO);
   }

   /**
    * 조회 조건에 해당하는 임률관리 총 갯수를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 RateMasterSearchVO
    * @return
    */
   @Override
   public int selectRateMasterByConditionCnt(RateMasterSearchVO searchVO) throws Exception {
       return rateMasterDAO.selectRateMasterByConditionCnt(searchVO);
   }

    /**
     * 임률관리 정보를 등록한다.
     * @param rateMasterVO - 등록할 정보가 담긴 RateMasterVO
     * @return 등록된 목록수
     */
   @Override
   public int insertRateMaster(RateMasterVO rateMasterVO) throws Exception {
       //임률키 중복 체크
        RateMasterSearchVO rateMasterKey = new RateMasterSearchVO();
        rateMasterKey.setsDlrCd(LoginUtil.getDlrCd());
        rateMasterKey.setsRoTp(rateMasterVO.getRoTp());
        rateMasterKey.setsBrandCd(rateMasterVO.getBrandCd());
        RateMasterVO vo = rateMasterDAO.selectRateMasterByKey(rateMasterKey);
        if(vo != null){
            throw processException("global.err.duplicate");
        }

        //임률seq 체크
        RateMasterSearchVO rateMasterSearchVO = new RateMasterSearchVO();
        rateMasterSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        rateMasterSearchVO.setsBrandCd(rateMasterVO.getBrandCd());
        List<RateMasterVO> rateMasterVOs = rateMasterDAO.selectRateMasterByCondition(rateMasterSearchVO);
        if(rateMasterVOs.size() > 0){
            rateMasterVO.setRteCd(rateMasterVOs.get(0).getRteCd());
        }else{
             /**
              * 임률 번호(키생성)
              */
            rateMasterVO.setRteCd(rateDocNoIdgenService.getNextStringId());
        }


        rateMasterVO.setDlrCd(LoginUtil.getDlrCd());
        rateMasterVO.setRegUsrId(LoginUtil.getUserId());
        rateMasterVO.setUpdtUsrId(LoginUtil.getUserId());
        return rateMasterDAO.insertRateMaster(rateMasterVO);
   }

    /**
     * 임률관리 정보를 수정한다.
     * @param rateMasterVO - 수정할 정보가 담긴 RateMasterVO
     * @return 수정된 목록수
     */
   @Override
   public int updateRateMaster(RateMasterVO rateMasterVO) throws Exception {
        rateMasterVO.setUpdtUsrId(LoginUtil.getUserId());
        return rateMasterDAO.updateRateMaster(rateMasterVO);
   }

    /**
     * 임률관리 정보를 삭제한다.
     * @param rateMasterVO - 삭제할 정보가 담긴 RateMasterVO
     * @return 삭제된 목록수
     */
   @Override
   public int deleteRateMaster(RateMasterVO rateMasterVO) throws Exception {
        return rateMasterDAO.deleteRateMaster(rateMasterVO);
   }

	/**
     * 임률관리 등록/수정/삭제 일괄처리
     */
   @Override
   public void multiRateMasters(BaseSaveVO<RateMasterVO> obj) throws Exception {

        for(RateMasterVO rateMasterVO : obj.getInsertList()){
            insertRateMaster(rateMasterVO);
        }

        for(RateMasterVO rateMasterVO : obj.getUpdateList()){
            updateRateMaster(rateMasterVO);
        }

        for(RateMasterVO rateMasterVO : obj.getDeleteList()){
            deleteRateMaster(rateMasterVO);
        }
   }

   /**
    * 조회 조건에 해당하는 임률관리 키정보를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 RateMasterSearchVO
    * @return 조회 목록
    */
   @Override
   public RateMasterVO selectRateMasterByKey(RateMasterSearchVO searchVO) throws Exception {
       return rateMasterDAO.selectRateMasterByKey(searchVO);
   }
   
   /**
    * 조회 조건에 해당하는 딜러별 임률관리 정보를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 RateMasterSearchVO
    * @return 조회 목록
    */
   public RateMasterVO selectDlrRateByKey(RateMasterSearchVO searchVO) throws Exception {
       return rateMasterDAO.selectDlrRateByKey(searchVO);
   }
    
    /**
     * 임률 코드 별 데이터 정보
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<RateMasterVO> selectRates(RateMasterSearchVO searchVO) throws Exception {
        
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return rateMasterDAO.selectRates(searchVO);
    }

}

