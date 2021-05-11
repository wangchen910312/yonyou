package chn.bhmc.dms.ser.wac.service.impl;

import java.util.Date;
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

import chn.bhmc.dms.cmm.sci.service.FileMgrService;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.ser.cmm.service.ServiceCommonService;
import chn.bhmc.dms.ser.wac.service.SanbaoTechRequestService;
import chn.bhmc.dms.ser.wac.service.dao.SanbaoTechRequestDAO;
import chn.bhmc.dms.ser.wac.vo.SanbaoTechSearchVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoTechVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoTechRequestServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 5. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 10.     Kwon Ki Hyun     최초 생성
 * </pre>
 */
@Service("sanbaoTechRequestService")
public class SanbaoTechRequestServiceImpl extends HService implements SanbaoTechRequestService, JxlsSupport{

    @Resource(name="sanbaoTechRequestDAO")
    SanbaoTechRequestDAO sanbaoTechRequestDAO;

    @Autowired
    FileMgrService fileMgrService;

    /**
     * 삼보 기술제출 SEQ
     */
    @Resource(name="sanbaoTechDocNoIdgenService")
    TableIdGenService sanbaoTechDocNoIdgenService;

    @Autowired
    ServiceCommonService serviceCommonService;


    /**
    *
    * 삼보 기술제출 목록수 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoTechSearchVO
    * @return 삼보 기술제출 목록수 데이터
    * @throws Exception
    */
    public int selectSanbaoTechRequestByConditionCnt(SanbaoTechSearchVO searchVO)throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return sanbaoTechRequestDAO.selectSanbaoTechRequestByConditionCnt(searchVO);
    }

    /**
     *
     * 삼보 기술제출 목록 데이터를 조회한다.
     *
     * @param searchVO - 조회 조건을 포함하는 SanbaoTechSearchVO
     * @return 삼보 기술제출 목록 데이터
     * @throws Exception
     */
    public List<SanbaoTechVO> selectSanbaoTechRequestByCondition(SanbaoTechSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return sanbaoTechRequestDAO.selectSanbaoTechRequestByCondition(searchVO);
    }

    /**
    *
    * 삼보 기술제출  상세 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoTechSearchVO
    * @return 삼보 기술제출 상세 정보 데이터
    * @throws Exception
    */
    public SanbaoTechVO selectSanbaoTechRequestByKey(SanbaoTechSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return sanbaoTechRequestDAO.selectSanbaoTechRequestByKey(searchVO);
    }

    /**
    *
    * 삼보 기술제출 정보를 등록/수정 한다.
    *
    * @param saveVO - 삼보 기술제출 등록/수정 목록을 포함하는 SanbaoTechVO
    * @return bindingResult
    * @throws Exception
    */
    public String multiSanbaoTechRequest(SanbaoTechVO sanbaoTechVO) throws Exception {

        sanbaoTechVO.setDlrCd(LoginUtil.getDlrCd());
        sanbaoTechVO.setUpdtUsrId(LoginUtil.getUserId());
        sanbaoTechVO.setRegUsrId(LoginUtil.getUserId());
        String docNo="";
        if( StringUtil.nullConvert(sanbaoTechVO.getDocNo()).equals("")){
            docNo = sanbaoTechDocNoIdgenService.getNextStringId();
            sanbaoTechVO.setDocNo(docNo);
            insertSanbaoTechRequest(sanbaoTechVO);
        }else{

            //요청 취소전 상태 체크
            String sanbaoTechStatCd = sanbaoTechRequestDAO.selectSanbaoTechRequestStstCdByKey(sanbaoTechVO);

            String statCd = sanbaoTechVO.getStatCd();
            sanbaoTechVO.setStatCd( (statCd.equals("QC") ? "O" : statCd));

            int resultCnt = updateSanbaoTechRequest(sanbaoTechVO);

           //Carmel InterFace Header Info
            Map<String, Object> message = new HashMap<String, Object>();
            message.put("DLR_CD", sanbaoTechVO.getDlrCd());
            message.put("VIN_NO", sanbaoTechVO.getVinNo());
            message.put("DOC_NO", sanbaoTechVO.getDocNo());


            if(resultCnt > 0){
                if(statCd.equals("Q")){

                    sanbaoTechRequestDAO.insertSanBaoTechkToIf(sanbaoTechVO);
                    //int delCnt = selectSanbaoTechRequestIfByConditionCnt(sanbaoTechVO);
                    //int insCnt = sanbaoTechRequestDAO.insertSanbaoTechRequestIf(sanbaoTechVO);

                    try{
                  //CamelClent Call
                   serviceCommonService.executeCamelClent(message,"SER033");
                    }catch(Exception e){

                        sanbaoTechVO.setStatCd("O");
                        sanbaoTechRequestDAO.insertSanBaoTechkRollBack(sanbaoTechVO);
                        throw e;
                    }
                }
                if(statCd.equals("QC")){

                    if( sanbaoTechStatCd.equals("A") ||//승인
                            sanbaoTechStatCd.equals("W") //접수

                    ){
                        throw processException("global.info.stateNotMsg", new String[]{messageSource.getMessage("ser.lbl.quest", null, LocaleContextHolder.getLocale())});
                    }
                    sanbaoTechVO.setIfResltYn("N");
                    int delCnt = selectSanbaoTechRequestIfByConditionCnt(sanbaoTechVO);
                    if(delCnt == 0 ){
                        serviceCommonService.executeCamelClent(message,"SER049");
                    }

                }
            }
        }
        return sanbaoTechVO.getDocNo();
    }


    /**
    *
    * 삼보 tech 요청 인터페이스 정보
    *
    * @param sanbaoVO - 삼보 tech 요청 인터페이스 정보 목록을 포함하는 sanbaoVO
    * @return bindingResult
    * @throws Exception
    */
    public int selectSanbaoTechRequestIfByConditionCnt(SanbaoTechVO sanbaoTechVO) throws Exception{

        int resultCnt = sanbaoTechRequestDAO.selectSanbaoTechRequestIfByConditionCnt(sanbaoTechVO);
        if(resultCnt > 0 ){
            deleteSanbaoTechRequestIf(sanbaoTechVO);
        }

        return resultCnt;

    }

    /**
    *
    * 삼보 tech 요청 인터페이스 삭제
    *
    * @param sanbaoVO - 삼보 tech 요청 인터페이스 삭제 목록을 포함하는 sanbaoVO
    * @return bindingResult
    * @throws Exception
   */
   public int deleteSanbaoTechRequestIf(SanbaoTechVO sanbaoTechVO) throws Exception{

       return sanbaoTechRequestDAO.deleteSanbaoTechRequestIf(sanbaoTechVO);

   }


    /**
     *
     * 삼보 기술제출 등록
     *
     * @param sanbaoTechVO
     * @return
     * @throws Exception
     */
    public int insertSanbaoTechRequest(SanbaoTechVO sanbaoTechVO)throws Exception{

        return sanbaoTechRequestDAO.insertSanbaoTechRequest(sanbaoTechVO);
    }

    /**
     *
     * 삼보 기술제출 수정
     *
     * @param sanbaoTechVO
     * @return
     * @throws Exception
     */
    public int updateSanbaoTechRequest(SanbaoTechVO sanbaoTechVO)throws Exception{

        return sanbaoTechRequestDAO.updateSanbaoTechRequest(sanbaoTechVO);
    }

    /**
     *
     * 삼보 기술제출 삭제
     *
     * @param sanbaoTechVO
     * @return
     * @throws Exception
     */
    public void deleteSanbaoTechRequest(SanbaoTechVO sanbaoTechVO)throws Exception{

        sanbaoTechVO.setDlrCd(LoginUtil.getDlrCd());

        int cnt = sanbaoTechRequestDAO.deleteSanbaoTechRequest(sanbaoTechVO);

        if(cnt > 0) deleteFileInfo(sanbaoTechVO.getFileKeyNm());

        int delCnt = selectSanbaoTechRequestIfByConditionCnt(sanbaoTechVO);
        if(delCnt > 0 ){
          //Carmel InterFace Header Info
            Map<String, Object> message = new HashMap<String, Object>();
            message.put("DLR_CD", sanbaoTechVO.getDlrCd());
            message.put("VIN_NO", sanbaoTechVO.getVinNo());
            message.put("DOC_NO", sanbaoTechVO.getDocNo());

            serviceCommonService.executeCamelClent(message,"SER049");
        }
    }

    public int deleteFileInfo(String fileDocNo)throws Exception{

        int cnt = 0;
        if( fileMgrService.deleteFileItemsByFileDocNo(fileDocNo) >0 ){
           cnt =  fileMgrService.deleteFileDoc(fileDocNo);
        }

        return cnt;
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        SanbaoTechSearchVO searchVO = new SanbaoTechSearchVO();

        if(!StringUtils.isBlank(params.get("sFromDt").toString())){
            String sFromDt = params.get("sFromDt").toString();
            Date dFromDt = DateUtil.convertToDate(sFromDt);
            searchVO.setsFromDt(dFromDt);
        }
        if(!StringUtils.isBlank(params.get("sToDt").toString())){
            String sToDt = params.get("sToDt").toString();
            Date dToDt = DateUtil.convertToDate(sToDt);
            searchVO.setsToDt(dToDt);
        }

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        List<SanbaoTechVO> list = selectSanbaoTechRequestByCondition(searchVO);
        context.putVar("items", list);

    }

    /**
    *
    * 삼보 기술처리 사용여부 수정
    *
    * @param saveVO - 삼보 기술처리 사용여부 수정 목록을 포함하는 SanbaoTechVO
    * @return bindingResult
    * @throws Exception
    */
    public int updateSanbaoTechApproveUseYn(SanbaoTechVO sanbaoTechVO) throws Exception {

        if( StringUtil.nullConvert(sanbaoTechVO.getDlrCd()).equals("")){
            sanbaoTechVO.setDlrCd(LoginUtil.getDlrCd());
        }

        return sanbaoTechRequestDAO.updateSanbaoTechApproveUseYn(sanbaoTechVO);
    }



}
