package chn.bhmc.dms.ser.wac.service.impl;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import able.com.vo.HMap;

import org.jxls.common.Context;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.ser.cmm.service.ServiceCommonService;
import chn.bhmc.dms.ser.wac.service.ClaimOldItemManageService;
import chn.bhmc.dms.ser.wac.service.dao.ClaimOldItemManageDAO;
import chn.bhmc.dms.ser.wac.vo.ClaimOldItemManageSaveVO;
import chn.bhmc.dms.ser.wac.vo.ClaimOldItemManageSearchVO;
import chn.bhmc.dms.ser.wac.vo.ClaimOldItemManageVO;

/**
 * <pre>
 * 고품관리 구현 서비스
 * </pre>
 *
 * @ClassName   : ClaimOldItemManageServiceImpl.java
 * @Description : 고품관리 ServiceImpl
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

@Service("claimOldItemManageService")
public class ClaimOldItemManageServiceImpl extends HService implements ClaimOldItemManageService ,JxlsSupport{

    /**
    * 고품관리 DAO
    */
   @Resource(name="claimOldItemManageDAO")
   ClaimOldItemManageDAO claimOldItemManageDAO;

    /**
    * 고품관리 SEQ
   */
   @Resource(name="claimOldItemManageDocNoIdgenService")
   TableIdGenService claimOldItemManageDocNoIdgenService;

   @Autowired
   ServiceCommonService serviceCommonService;



    /**
     * 조회 조건에 해당하는 고품요청관리 정보를 조회한다. -ok
     * @param searchVO - 조회 조건을 포함하는 ClaimOldItemManageSearchVO
     * @return 조회 목록
     */
    @Override
    public List<ClaimOldItemManageVO> selectClaimOldItemInfoByCondition(ClaimOldItemManageSearchVO searchVO) throws Exception {

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return claimOldItemManageDAO.selectClaimOldItemInfoByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 고품요청관리 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ClaimOldItemManageSearchVO
     * @return
     */
    @Override
    public int selectClaimOldItemInfoByConditionCnt(ClaimOldItemManageSearchVO searchVO) throws Exception {

        return claimOldItemManageDAO.selectClaimOldItemInfoByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 고품요청조회 현황 헤더  정보 갯수 를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ClaimOldItemManageSearchVO
     * @return 조회 목록
     */
    public int selectClaimOldItemMaterInfoByConditionCnt(ClaimOldItemManageSearchVO searchVO)throws Exception{

        return claimOldItemManageDAO.selectClaimOldItemMaterInfoByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 고품요청조회 현황 헤더  정보를 조회한다. ?
     * @param searchVO - 조회 조건을 포함하는 ClaimOldItemManageSearchVO
     * @return 조회 목록
     */
    @Override
    public List<ClaimOldItemManageVO> selectClaimOldItemMaterInfoByCondition(ClaimOldItemManageSearchVO searchVO) throws Exception {

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return claimOldItemManageDAO.selectClaimOldItemMaterInfoByCondition(searchVO);
    }

   /**
     * 조회 조건에 해당하는 고품요청조회 현황 상세  정보 갯수 를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ClaimOldItemManageSearchVO
     * @return 조회 목록
     */
    public int selectClaimOldItemDetailInfoByConditionCnt(ClaimOldItemManageSearchVO searchVO)throws Exception{

        return claimOldItemManageDAO.selectClaimOldItemDetailInfoByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 고품요청 상세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ClaimOldItemManageSearchVO
     * @return 조회 목록
     */
    public List<ClaimOldItemManageVO> selectClaimOldItemDetailInfoByCondition(ClaimOldItemManageSearchVO searchVO)throws Exception{


        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        return claimOldItemManageDAO.selectClaimOldItemDetailInfoByCondition(searchVO);
    }

    /**
    * 조회 조건에 해당하는 고품회수관리 정보를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 ClaimOldItemManageSearchVO
    * @return 조회 목록
    */
    @Override
    public List<ClaimOldItemManageVO> selectClaimOldItemRecoveryByCondition(ClaimOldItemManageSearchVO searchVO) throws Exception {

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        return claimOldItemManageDAO.selectClaimOldItemRecoveryByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 고품출고 관리 목록수
     * @param searchVO - 조회 조건을 포함하는 ClaimOldItemManageSearchVO
     * @return 조회 목록
     */
    public int selectOldItemOutManageByConditionCnt(ClaimOldItemManageSearchVO searchVO)throws Exception{

        return claimOldItemManageDAO.selectOldItemOutManageByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 고품출고 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ClaimOldItemManageSearchVO
     * @return 조회 목록
     */
    public List<ClaimOldItemManageVO> selectOldItemOutManageByCondition(ClaimOldItemManageSearchVO searchVO)throws Exception{

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        return claimOldItemManageDAO.selectOldItemOutManageByCondition(searchVO);

    }

   /**
    * 조회 조건에 해당하는 고품회수관리 총 갯수를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 ClaimOldItemManageSearchVO
    * @return
    */
   @Override
   public int selectClaimOldItemRecoveryByConditionCnt(ClaimOldItemManageSearchVO searchVO) throws Exception {
       return claimOldItemManageDAO.selectClaimOldItemRecoveryByConditionCnt(searchVO);
   }


    /**
     * 조회 조건에 해당하는 고품공제관리 목록수
     * @param searchVO - 조회 조건을 포함하는 ClaimOldItemManageSearchVO
     * @return 조회 목록
     */
    public int selectDeductOldItemManageByConditionCnt(ClaimOldItemManageSearchVO searchVO)throws Exception{

        return claimOldItemManageDAO.selectDeductOldItemManageByConditionCnt(searchVO);

    }

    /**
     * 조회 조건에 해당하는 고품공제 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ClaimOldItemManageSearchVO
     * @return 조회 목록
     */
    public List<ClaimOldItemManageVO> selectDeductOldItemManageByCondition(ClaimOldItemManageSearchVO searchVO)throws Exception{

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        return claimOldItemManageDAO.selectDeductOldItemManageByCondition(searchVO);

    }


     /**
      * 고품출고관리 정보를 수정한다.
      * @param claimOldItemManageVO - 수정할 정보가 담긴 ClaimOldItemManageVO
      * @return 수정된 목록수
      */
    @Override
    public int updateClaimOldItemOutManage(ClaimOldItemManageSaveVO saveVO) throws Exception {


        int resultCnt = 0;
        for(ClaimOldItemManageVO claimOldItemManageVO : saveVO.getClaimOldItemManageList()){

            claimOldItemManageVO.setUpdtUsrId(LoginUtil.getUserId());

            resultCnt = claimOldItemManageDAO.updateClaimOldItemOutManage(claimOldItemManageVO);

        }

         return resultCnt;


    }

     /**
      * 고품관리 정보를 삭제한다.
      * @param claimOldItemManageVO - 삭제할 정보가 담긴 ClaimOldItemManageVO
      * @return 삭제된 목록수
      */
    @Override
    public int deleteClaimOldItemManage(ClaimOldItemManageVO claimOldItemManageVO) throws Exception {
         return claimOldItemManageDAO.deleteClaimOldItemManage(claimOldItemManageVO);
    }

	 /**
      * 고품요청관리 등록/수정/삭제 일괄처리 - 사용
      */
    @Override
    public String insertClaimOldItemManage(ClaimOldItemManageSaveVO obj) throws Exception {

        String atqReqNo = "";
        String pattern = "yyyy-MM-dd HH:mm:ss";
        Date toDate = DateUtil.convertToTimestamp(DateUtil.convertToString( new Date() ,pattern) ,pattern);
        int insCnt = 0;
        int seq = 0;

        if(obj.getClaimOldItemManageList().size() > 0){
            atqReqNo = claimOldItemManageDocNoIdgenService.getNextStringId();
        }

        for(ClaimOldItemManageVO claimOldItemManageVO : obj.getClaimOldItemManageList()){
            seq++;
            claimOldItemManageVO.setAtqReqNo(atqReqNo);
            claimOldItemManageVO.setRegUsrId(LoginUtil.getUserId());
            claimOldItemManageVO.setUpdtUsrId(LoginUtil.getUserId());
            claimOldItemManageVO.setSeq(String.valueOf(seq));

            //insertClaimOldItemManage(claimOldItemManageVO);
            insCnt +=  claimOldItemManageDAO.insertClaimOldItemManage(claimOldItemManageVO);
            claimOldItemManageDAO.insertClaimToTemp(claimOldItemManageVO);

        }
        if(insCnt > 0 ){
            //Interface Data Insert
            Map<String, Object> message = new HashMap<String, Object>();
            serviceCommonService.executeEaiCall("ALL","SER020",message,"");
        }

        return atqReqNo;
    }


    /**
     * 고품회수관리  수정
     */
    @Override
    public boolean updateReceiveOldItemManage(ClaimOldItemManageSaveVO obj) throws Exception {
        String atqReqNo = "";
        String pattern = "yyyy-MM-dd HH:mm:ss";
        Date toDate = DateUtil.convertToTimestamp(DateUtil.convertToString( new Date() ,pattern) ,pattern);
        int resultCnt = 0;

        for(ClaimOldItemManageVO claimOldItemManageVO : obj.getClaimOldItemManageList()){

            claimOldItemManageVO.setRegUsrId(LoginUtil.getUserId());
            claimOldItemManageVO.setUpdtUsrId(LoginUtil.getUserId());
            claimOldItemManageVO.setCollcId(LoginUtil.getUserId());

            resultCnt = claimOldItemManageDAO.updateReceiveOldItemManage(claimOldItemManageVO);

        }

        return true;
    }

    /**
     * 고품공제관리  수정
     */
    @Override
    public boolean updateDeductOldItemManage(ClaimOldItemManageSaveVO obj) throws Exception {

        for(ClaimOldItemManageVO claimOldItemManageVO : obj.getClaimOldItemManageList()){

            claimOldItemManageVO.setUpdtUsrId(LoginUtil.getUserId());

            claimOldItemManageDAO.updateDeductOldItemManage(claimOldItemManageVO);

        }

        return true;
    }



   /**
    * 조회 조건에 해당하는 고품관리 키정보를 조회한다.
    * @param searchVO - 조회 조건을 포함하는 ClaimOldItemManageSearchVO
    * @return 조회 목록
    */
   @Override
   public ClaimOldItemManageVO selectClaimOldItemManageByKey(ClaimOldItemManageSearchVO searchVO) throws Exception {
       return claimOldItemManageDAO.selectClaimOldItemManageByKey(searchVO);
   }


   /**
    * 고품관리 정보를 삭제한다.
    * @param claimOldItemManageVO - 삭제할 정보가 담긴 ClaimOldItemManageVO
    * @return 삭제된 목록수
    */
    @Override
    public int insertClaimToTemp(ClaimOldItemManageVO claimOldItemManageVO) throws Exception {
         return claimOldItemManageDAO.insertClaimToTemp(claimOldItemManageVO);
    }


    /**
     * 고품관리 엑셀 업로드  정보를 TEMP로 삭제한다.
     * @param claimOldItemManageVO - 삭제할 정보가 담긴 ClaimOldItemManageVO
     * @return 삭제된 목록수
     */
    public int deleteClaimOldItemExcelTemp() throws Exception{

        return claimOldItemManageDAO.deleteClaimOldItemExcelTemp();
    }


    /**
     * 고품관리 엑셀 업로드  TEMP 정보를 본테이블로  등록한다.
     * @param claimOldItemManageVO - 등록할 정보가 담긴 ClaimOldItemManageVO
     * @return 삭제된 목록수
     */
    public int insertExcelData()throws Exception{

        int insCnt = 0;

        String atqReqNo = claimOldItemManageDocNoIdgenService.getNextStringId();
        insCnt = claimOldItemManageDAO.insertExcelData(atqReqNo);


        log.debug("insCnt========================="+insCnt);
        if(insCnt > 0){
           claimOldItemManageDAO.insertExcelClaimToTemp(atqReqNo);

           Map<String, Object> message = new HashMap<String, Object>();
           boolean resultIf =  serviceCommonService.executeEaiCall("ALL","SER020",message,"");

           if( resultIf ){
               deleteClaimOldItemExcelTemp();
               deleteClaimOldItemExcelTempErr();
           }

       }

        return insCnt;
    }

    /**
     * 고품관리 업로드 에러 목록
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int multiClaimOldItemExcelTemp(List<ClaimOldItemManageVO> claimOldItemManageListVO)throws Exception{

        String usrId = LoginUtil.getUserId();
        int insCnt=0;

        //temp table 삭제
        deleteClaimOldItemExcelTempErr();
        deleteClaimOldItemExcelTemp();
        int skipCnt = 0 ;
        for(ClaimOldItemManageVO claimOldItemManageVO : claimOldItemManageListVO){
            claimOldItemManageVO.setRegUsrId(usrId);
            if(
               !StringUtil.nullConvert(claimOldItemManageVO.getDlrCd()).equals("") &&                       //딜러코드
               !StringUtil.nullConvert(claimOldItemManageVO.getClaimDocNo()).equals("") &&                  //클레임번호
               !StringUtil.nullConvert(claimOldItemManageVO.getItemCd()).equals("") &&                      //부품코드
               !StringUtil.nullConvert(claimOldItemManageVO.getVinNo()).equals("") &&                       //VIN NO
               !StringUtil.nullConvert(claimOldItemManageVO.getRcipId()).equals("") &&                      //신청자
               !StringUtil.nullConvert(claimOldItemManageVO.getRcipTelNo()).equals("") &&                   //신청인연락처
               !StringUtil.nullConvert(claimOldItemManageVO.getReqTelNo()).equals("") &&                    //접수자연락처
               !StringUtil.nullConvert(claimOldItemManageVO.getRcipAddrNm()).equals("") &&                  //주소
               !StringUtil.nullConvert(String.valueOf(claimOldItemManageVO.getClaimQty())).equals("") &&    //클레임수량
               !StringUtil.nullConvert(String.valueOf(claimOldItemManageVO.getReqDt())).equals("")          //요청일
            ){
                    insCnt += insertClaimOldItemExcelTemp(claimOldItemManageVO);
             }else{

                if(
                   StringUtil.nullConvert(claimOldItemManageVO.getDlrCd()).equals("") &&                       //딜러코드
                   StringUtil.nullConvert(claimOldItemManageVO.getClaimDocNo()).equals("") &&                  //클레임번호
                   StringUtil.nullConvert(claimOldItemManageVO.getItemCd()).equals("") &&                      //부품코드
                   StringUtil.nullConvert(claimOldItemManageVO.getVinNo()).equals("")                          //VIN NO
                ){
                    skipCnt++;
                }else{

                    insertClaimOldItemExcelTempErr(claimOldItemManageVO);
                }

             }
        }

        log.debug("skipCnt:::::::::"+skipCnt);

        return insCnt;
    }

    /**
     * 고품관리 엑셀 업로드  정보를 TEMP로 등록한다.
     * @param claimOldItemManageVO - 등록할 정보가 담긴 ClaimOldItemManageVO
     * @return 삭제된 목록수
     */
    public int insertClaimOldItemExcelTemp(ClaimOldItemManageVO claimOldItemManageVO) throws Exception{

        return claimOldItemManageDAO.insertClaimOldItemExcelTemp(claimOldItemManageVO);
    }

    /**
     * 고품관리 엑셀 업로드 에러 정보를  삭제한다.
     * @param claimOldItemManageVO - 삭제할 정보가 담긴 ClaimOldItemManageVO
     * @return 삭제된 목록수
     */
    public int deleteClaimOldItemExcelTempErr() throws Exception{

        return claimOldItemManageDAO.deleteClaimOldItemExcelTempErr();
    }

    /**
     * 고품관리 엑셀 업로드 에러 정보를 TEMP로 등록한다.
     * @param claimOldItemManageVO - 등록할 정보가 담긴 ClaimOldItemManageVO
     * @return 삭제된 목록수
     */
    public int insertClaimOldItemExcelTempErr(ClaimOldItemManageVO claimOldItemManageVO) throws Exception{

        return claimOldItemManageDAO.insertClaimOldItemExcelTempErr(claimOldItemManageVO);
    }

    /**
     * 고품관리 업로드  목록수
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectClaimOldItemExcelTempByConditionCnt(ClaimOldItemManageSearchVO searchVO)throws Exception{

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        return claimOldItemManageDAO.selectClaimOldItemExcelTempByConditionCnt(searchVO);
    }

    /**
     * 고품관리 업로드  목록
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<ClaimOldItemManageVO> selectClaimOldItemExcelTempByCondition(ClaimOldItemManageSearchVO searchVO)throws Exception{

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        return claimOldItemManageDAO.selectClaimOldItemExcelTempByCondition(searchVO);
    }

    /**
     * 고품관리 업로드 에러 목록수
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectClaimOldItemExcelTempErrByConditionCnt(ClaimOldItemManageSearchVO searchVO)throws Exception{


        return claimOldItemManageDAO.selectClaimOldItemExcelTempErrByConditionCnt(searchVO);
    }

    /**
     * 고품관리 업로드 에러 목록
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<ClaimOldItemManageVO> selectClaimOldItemExcelTempErrByCondition(ClaimOldItemManageSearchVO searchVO)throws Exception{

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        return claimOldItemManageDAO.selectClaimOldItemExcelTempErrByCondition(searchVO);

    }


    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        ClaimOldItemManageSearchVO searchVO = new ClaimOldItemManageSearchVO();
        searchVO.setsReqFromDt(DateUtil.convertToDate((String)params.get("sReqFromDt")));
        searchVO.setsReqToDt(DateUtil.convertToDate((String)params.get("sReqToDt")));
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        String tabId = (String)params.get("sTabId");


        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        List<ClaimOldItemManageVO> list = new ArrayList<ClaimOldItemManageVO>();
        if(tabId.equals("REQ")){
            list = selectClaimOldItemInfoByCondition(searchVO);
        }else{
            list = selectClaimOldItemRecoveryByCondition(searchVO);

        }

        context.putVar("items", list);

    };

}

