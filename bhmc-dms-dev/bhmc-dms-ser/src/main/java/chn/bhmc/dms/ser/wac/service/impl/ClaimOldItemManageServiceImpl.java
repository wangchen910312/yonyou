package chn.bhmc.dms.ser.wac.service.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import able.com.vo.HMap;

import org.apache.commons.lang.StringUtils;
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
import chn.bhmc.dms.ser.wac.vo.*;

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
public class ClaimOldItemManageServiceImpl extends HService implements ClaimOldItemManageService , JxlsSupport{

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
     * 조회 조건에 해당하는 고품 요청 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ClaimOldItemManageSearchVO
     * @return 조회 목록
     */
    public List<ClaimOldItemManageVO> selectClaimOldItemRequestByCondition(ClaimOldItemManageSearchVO searchVO)throws Exception{


        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return claimOldItemManageDAO.selectClaimOldItemRequestByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 고품 요청 정보갯수 를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ClaimOldItemManageSearchVO
     * @return 조회 목록
     */
    public int selectClaimOldItemRequestByConditionCnt(ClaimOldItemManageSearchVO searchVO)throws Exception{


        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return claimOldItemManageDAO.selectClaimOldItemRequestByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 고품출고관리 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ClaimOldItemManageSearchVO
     * @return
     */
    @Override
    public List<ClaimOldItemManageVO> selectDlrClaimOldItemManageByCondition(ClaimOldItemManageSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
             searchVO.setsDlrCd(LoginUtil.getDlrCd());
         }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return claimOldItemManageDAO.selectDlrClaimOldItemManageByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는고품출고관리 를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ClaimOldItemManageSearchVO
     * @return
     */
    @Override
    public int selectDlrClaimOldItemManageByConditionCnt(ClaimOldItemManageSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
             searchVO.setsDlrCd(LoginUtil.getDlrCd());
         }
        return claimOldItemManageDAO.selectDlrClaimOldItemManageByConditionCnt(searchVO);
    }


     /**
      * 고품관리 정보를 수정한다.
      * @param claimOldItemManageVO - 수정할 정보가 담긴 ClaimOldItemManageVO
      * @return 수정된 목록수
      */
    @Override
    public int updateClaimOldItemManage(ClaimOldItemManageSaveVO saveVO) throws Exception {

        int upCnt = 0;

        for(ClaimOldItemManageVO claimOldItemManageVO : saveVO.getClaimOldItemManageList() ){

            claimOldItemManageVO.setUpdtUsrId(LoginUtil.getUserId());
            if(StringUtil.nullConvert(claimOldItemManageVO.getDlrCd()).equals("")){
                claimOldItemManageVO.setDlrCd(LoginUtil.getDlrCd());
            }

            upCnt =  claimOldItemManageDAO.updateClaimOldItemManage(claimOldItemManageVO);

            if(upCnt > 0){
                //Carmel InterFace Header Info
                Map<String, Object> message = new HashMap<String, Object>();
                message.put("DLR_CD", claimOldItemManageVO.getDlrCd());                         //딜러코드
                message.put("VIN_NO", claimOldItemManageVO.getVinNo());                         //VIN
                message.put("CLAIM_DOC_NO", claimOldItemManageVO.getClaimDocNo());              //클레임번호
                message.put("ATQ_REQ_NO", claimOldItemManageVO.getAtqReqNo());                  //고품분서번호
                message.put("ITEM_CD", claimOldItemManageVO.getItemCd());                       //부품번호
                message.put("STAT_CD", "08");                                                   //고품상태 (회수 대기(08)로 전송)
                message.put("EXPS_CMP_NM", claimOldItemManageVO.getExpsCmpNm());                //택배회사명
                message.put("TRSF_NO", claimOldItemManageVO.getTrsfNo());                       //운송송장번호
                message.put("NOT_SEND_CAUSE_CONT", claimOldItemManageVO.getNotSendCauseCont()); //미전송원인
                message.put("NOT_SEND_DT", DateUtil.convertToDateTimeString(claimOldItemManageVO.getNotSendDt())); //미전송일자
                message.put("SENDER_ID", claimOldItemManageVO.getSenderId());                   //부취인
                message.put("SENDER_TEL_NO", claimOldItemManageVO.getSeq());                    //seq 로 대체 사용
                message.put("OLDITEM_STAT_CD", claimOldItemManageVO.getOlditemStatCd());        //고품 부품상태코드
                message.put("TEMP1", DateUtil.convertToDateTimeString(claimOldItemManageVO.getReturnDt())); //반납일자
                message.put("TEMP2", "");
                message.put("TEMP3", "");
                message.put("TEMP4", "");
                try{

                    serviceCommonService.executeCamelClent(message,"SER095");
                }catch(Exception e){

                    throw e;
                }
            }
        }
        return upCnt;
    }


    /**
     * 조회 조건에 해당하는 고품관리 키정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ClaimOldItemManageSearchVO
     * @return 조회 목록
     */
    @Override
    public ClaimOldItemManageVO selectClaimOldItemManageByKey(ClaimOldItemManageSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
             searchVO.setsDlrCd(LoginUtil.getDlrCd());
         }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return claimOldItemManageDAO.selectClaimOldItemManageByKey(searchVO);
    }


    /**
     * 고품관리 정보를 삭제한다.
     * @param claimOldItemManageVO - 삭제할 정보가 담긴 ClaimOldItemManageVO
     * @return 삭제된 목록수
     */
    @Override
    public int insertClaimToTemp(ClaimOldItemManageVO claimOldItemManageVO) throws Exception {

        if(StringUtil.nullConvert(claimOldItemManageVO.getDlrCd()).equals("")){
              claimOldItemManageVO.setDlrCd(LoginUtil.getDlrCd());
          }
         return claimOldItemManageDAO.insertClaimToTemp(claimOldItemManageVO);
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        ClaimOldItemManageSearchVO searchVO = new ClaimOldItemManageSearchVO();
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        if(!StringUtils.isBlank(params.get("sReqFromDt").toString())){
            String sReqFromDt = params.get("sReqFromDt").toString();
            searchVO.setsReqFromDt(DateUtil.convertToDate(sReqFromDt));
        }
        if(!StringUtils.isBlank(params.get("sReqToDt").toString())){
            String sReqToDt = params.get("sReqToDt").toString();
            searchVO.setsReqToDt(DateUtil.convertToDate(sReqToDt));
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        List<ClaimOldItemManageVO> list = selectDlrClaimOldItemManageByCondition(searchVO);
        context.putVar("items", list);

    }

    /*
     * @see chn.bhmc.dms.ser.wac.service.ClaimOldItemManageService#insertDlrClaimOldItemPrint(chn.bhmc.dms.ser.wac.vo.ClaimOldItemPrintVO)
     */
    @Override
    public int insertDlrClaimOldItemPrint(List<ClaimOldItemPrintVO> claimOldItemPrintList) throws Exception {
        for(ClaimOldItemPrintVO claimOldItemPrintVO : claimOldItemPrintList){
            claimOldItemPrintVO.setRegUsrId(LoginUtil.getUserId());
            claimOldItemManageDAO.insertDlrClaimOldItemPrint(claimOldItemPrintVO);
        }
        return 1;
    }

}

