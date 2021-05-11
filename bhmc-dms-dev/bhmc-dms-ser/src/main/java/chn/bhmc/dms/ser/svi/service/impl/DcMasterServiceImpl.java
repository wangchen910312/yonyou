package chn.bhmc.dms.ser.svi.service.impl;


import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.svi.service.DcMasterService;
import chn.bhmc.dms.ser.svi.service.dao.DcMasterDAO;
import chn.bhmc.dms.ser.svi.vo.DcDetailVO;
import chn.bhmc.dms.ser.svi.vo.DcMasterSearchVO;
import chn.bhmc.dms.ser.svi.vo.DcMasterVO;
import chn.bhmc.dms.ser.svi.vo.DcSaveVO;

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
       searchVO.setsDlrCd(LoginUtil.getDlrCd());
       return dcMasterDAO.selectDcMasterByCondition(searchVO);
   }

   /**
    * 조회 조건에 해당하는 할인관리 총 갯수를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 DcMasterSearchVO
    * @return
    */
   @Override
   public int selectDcMasterByConditionCnt(DcMasterSearchVO searchVO) throws Exception {
       searchVO.setsDlrCd(LoginUtil.getDlrCd());
       return dcMasterDAO.selectDcMasterByConditionCnt(searchVO);
   }



    @Override
    public int selectDcAuthByConditionCnt(DcMasterSearchVO searchVO) throws Exception {

        return dcMasterDAO.selectDcAuthByConditionCnt(searchVO);
    }

    @Override
    public List<DcMasterVO> selectDcAuthByCondition(DcMasterSearchVO searchVO) throws Exception {

        return dcMasterDAO.selectDcAuthByCondition(searchVO);
    }

    /**
     * 할인관리 정보를 등록한다.
     * @param dcMasterDAO - 등록할 정보가 담긴 DcMasterVO
     * @return 등록된 목록수
     */
   @Override
   public int insertDcMaster(DcMasterVO dcMasterVO) throws Exception {

       return dcMasterDAO.insertDcMaster(dcMasterVO);
   }

    /**
     * 할인관리 정보를 수정한다.
     * @param dcMasterDAO - 수정할 정보가 담긴 DcMasterVO
     * @return 수정된 목록수
     */
   @Override
   public int  updateDcMaster(DcMasterVO dcMasterVO) throws Exception {

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
   public String multiDcMasters(DcSaveVO saveVO) throws Exception {

       DcMasterVO dcMasterVO = new DcMasterVO();
       BaseSaveVO<DcMasterVO> dcMasterVOList = saveVO.getDcMasterVOList();

       dcMasterVOList.getInsertList();
       dcMasterVOList.getUpdateList();

       for(int i=0;i<dcMasterVOList.getInsertList().size();i++){
           dcMasterVO = dcMasterVOList.getInsertList().get(i);
           dcMasterVO.setDlrCd(LoginUtil.getDlrCd());
           dcMasterVO.setRegUsrId(LoginUtil.getUserId());
           dcMasterVO.setUpdtUsrId(LoginUtil.getUserId());
           /** 할인 번호(키생성) **/
           dcMasterVO.setDcCd(dcDocNoIdgenService.getNextStringId());
           insertDcMaster(dcMasterVO);
       }

       for(int i=0;i<dcMasterVOList.getUpdateList().size();i++){
           dcMasterVO = dcMasterVOList.getUpdateList().get(i);
           dcMasterVO.setDlrCd(LoginUtil.getDlrCd());
           dcMasterVO.setRegUsrId(LoginUtil.getUserId());
           dcMasterVO.setUpdtUsrId(LoginUtil.getUserId());
           updateDcMaster(dcMasterVO);
       }

       /*dcMasterVO.setDlrCd(LoginUtil.getDlrCd());
       dcMasterVO.setRegUsrId(LoginUtil.getUserId());
       dcMasterVO.setUpdtUsrId(LoginUtil.getUserId());

       if(dcMasterVO.getDcCd().equals("")){
           *//** 할인 번호(키생성) **//*
           dcMasterVO.setDcCd(dcDocNoIdgenService.getNextStringId());
           insertDcMaster(dcMasterVO);
       }else{
           updateDcMaster(dcMasterVO);
       }

       saveVO.setDcCd(dcMasterVO.getDcCd());

       multiSaDcDetail(saveVO);
       //multiCustDcDetail(saveVO);

       return dcMasterVO.getDcCd();*/
       return "";

   }

   /**
    * SA 할인관리 상세 등록/수정/삭제 일괄처리
    */
   @Override
   public String multiDcDetails(DcSaveVO saveVO) throws Exception {
       DcMasterVO dcMasterVO = saveVO.getDcMasterVO();
       BaseSaveVO<DcDetailVO> obj= saveVO.getDcSaDetailVO();

       for(DcDetailVO dcDetailVO : obj.getInsertList()){
           dcDetailVO.setDlrCd(LoginUtil.getDlrCd());
           dcDetailVO.setRegUsrId(LoginUtil.getUserId());
           dcDetailVO.setDcCd(dcMasterVO.getDcCd());
           insertDcDetail(dcDetailVO);
       }

       for(DcDetailVO dcDetailVO : obj.getUpdateList()){
           dcDetailVO.setDlrCd(LoginUtil.getDlrCd());
           dcDetailVO.setUpdtUsrId(LoginUtil.getUserId());
           dcDetailVO.setDcCd(dcMasterVO.getDcCd());
           updateDcDetail(dcDetailVO);
       }

       for(DcDetailVO dcDetailVO : obj.getDeleteList()){
           dcDetailVO.setDlrCd(LoginUtil.getDlrCd());
           dcDetailVO.setDcCd(dcMasterVO.getDcCd());
           deleteDcDetail(dcDetailVO);
       }
       return "";
   }

   /**
    * 할인관리 등록/수정/삭제 일괄처리
    */
  @Override
  public String multiDcMastersForParts(DcSaveVO saveVO) throws Exception {

      DcMasterVO dcMasterVO= saveVO.getDcMasterVO();

      dcMasterVO.setDlrCd(LoginUtil.getDlrCd());
      dcMasterVO.setRegUsrId(LoginUtil.getUserId());
      dcMasterVO.setUpdtUsrId(LoginUtil.getUserId());

      if(dcMasterVO.getDcCd().equals("")){
          /** 할인 번호(키생성) **/
          dcMasterVO.setDcCd(dcDocNoIdgenService.getNextStringId());
          insertDcMaster(dcMasterVO);
      }else{
          updateDcMaster(dcMasterVO);
      }

      saveVO.setDcCd(dcMasterVO.getDcCd());

      multiSaDcDetail(saveVO);
      //multiCustDcDetail(saveVO);

      return dcMasterVO.getDcCd();

  }

   /**
    * 할인관리 등록/수정/삭제 일괄처리
    */
  public String multiDcMasters_20170418(DcSaveVO saveVO) throws Exception {

      DcMasterVO dcMasterVO= saveVO.getDcMasterVO();

      dcMasterVO.setDlrCd(LoginUtil.getDlrCd());
      dcMasterVO.setRegUsrId(LoginUtil.getUserId());
      dcMasterVO.setUpdtUsrId(LoginUtil.getUserId());

      if(dcMasterVO.getDcCd().equals("")){
          /** 할인 번호(키생성) **/
          dcMasterVO.setDcCd(dcDocNoIdgenService.getNextStringId());
          insertDcMaster(dcMasterVO);
      }else{
          updateDcMaster(dcMasterVO);
      }

      saveVO.setDcCd(dcMasterVO.getDcCd());

      multiSaDcDetail(saveVO);
      //multiCustDcDetail(saveVO);

      return dcMasterVO.getDcCd();

  }

   /**
    * SA 할인관리 상세 등록/수정/삭제 일괄처리
    */
   public void multiSaDcDetail(DcSaveVO saveVO) throws Exception {

       BaseSaveVO<DcDetailVO> obj= saveVO.getDcSaDetailVO();

       for(DcDetailVO dcDetailVO : obj.getInsertList()){
           dcDetailVO.setDlrCd(LoginUtil.getDlrCd());
           dcDetailVO.setRegUsrId(LoginUtil.getUserId());
           dcDetailVO.setDcCd(saveVO.getDcCd());
           insertDcDetail(dcDetailVO);
       }

       for(DcDetailVO dcDetailVO : obj.getUpdateList()){
           dcDetailVO.setDlrCd(LoginUtil.getDlrCd());
           dcDetailVO.setUpdtUsrId(LoginUtil.getUserId());
           updateDcDetail(dcDetailVO);
       }

       for(DcDetailVO dcDetailVO : obj.getDeleteList()){
           dcDetailVO.setDlrCd(LoginUtil.getDlrCd());
           deleteDcDetail(dcDetailVO);
       }
   }

   /**
    * SA 할인관리 상세 등록/수정/삭제 일괄처리
    */
   public void multiCustDcDetail(DcSaveVO saveVO) throws Exception {

       BaseSaveVO<DcDetailVO> obj= saveVO.getDcCustDetailVO();

       for(DcDetailVO dcDetailVO : obj.getInsertList()){

           dcDetailVO.setDlrCd(LoginUtil.getDlrCd());
           dcDetailVO.setRegUsrId(LoginUtil.getUserId());
           dcDetailVO.setDcCd(saveVO.getDcCd());

           insertDcDetail(dcDetailVO);
       }

       for(DcDetailVO dcDetailVO : obj.getUpdateList()){

           dcDetailVO.setDlrCd(LoginUtil.getDlrCd());
           dcDetailVO.setUpdtUsrId(LoginUtil.getUserId());

           updateDcDetail(dcDetailVO);
       }

       for(DcDetailVO dcDetailVO : obj.getDeleteList()){

           dcDetailVO.setDlrCd(LoginUtil.getDlrCd());
           deleteDcDetail(dcDetailVO);
       }
   }

   /**
    * 할인관리 상세 정보를 등록한다.
    * @param dcMasterVO - 등록할 정보가 담긴 dcMasterVO
    * @return
    */
    @Override
    public int insertDcDetail(DcDetailVO dcDetailVO) throws Exception {

        return dcMasterDAO.insertDcDetail(dcDetailVO);
    }

    /**
     * 할인관리 상세  정보를 수정한다.
     * @param dcMasterVO - 수정할 정보가 담긴 dcMasterVO
     * @return
     */
    @Override
    public int updateDcDetail(DcDetailVO dcDetailVO) throws Exception {

        return dcMasterDAO.updateDcDetail(dcDetailVO);
    }

    /**
     * 할인관리 상세 정보를 삭제한다.
     * @param dcMasterVO - 삭제할 정보가 담긴 dcMasterVO
     * @return 삭제된 목록수
     */
    @Override
    public int deleteDcDetail(DcDetailVO dcDetailVO) throws Exception {

        return dcMasterDAO.deleteDcDetail(dcDetailVO);
    }

    /**
     * 조회 조건에 해당하는 할인관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DcMasterSearchVO
     * @return 조회 목록
     */
    @Override
    public List<DcDetailVO> selectDcDetailByCondition(DcMasterSearchVO searchVO) throws Exception {


        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return dcMasterDAO.selectDcDetailByCondition(searchVO);
    }


    /**
     * 조회 조건에 해당하는 할인관리 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DcMasterSearchVO
     * @return
     */
    @Override
    public int selectDcDetailByConditionCnt(DcMasterSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return dcMasterDAO.selectDcDetailByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 기타할인 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DcMasterSearchVO
     * @return
     */
    public List<DcMasterVO> selectEtcDcTargetByCondition(DcMasterSearchVO searchVO)throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return dcMasterDAO.selectEtcDcTargetByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 기타할인 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DcMasterSearchVO
     * @return
     */
    public int selectEtcDcTargetByConditionCnt(DcMasterSearchVO searchVO)throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return dcMasterDAO.selectEtcDcTargetByConditionCnt(searchVO);
    }

    public DcDetailVO selectDcDetailByKey(DcMasterSearchVO searchVO)throws Exception {
        return dcMasterDAO.selectDcDetailByKey(searchVO);
    }

    /*
     * @see chn.bhmc.dms.ser.svi.service.DcMasterService#selectParMaxDcRateByCondition(chn.bhmc.dms.ser.svi.vo.DcMasterSearchVO)
     */
    @Override
    public List<DcMasterVO> selectParMaxDcRateByCondition(DcMasterSearchVO searchVO) throws Exception {
        // TODO Auto-generated method stub
        return dcMasterDAO.selectParMaxDcRateByCondition(searchVO);
    }
}
