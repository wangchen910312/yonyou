package chn.bhmc.dms.ser.wac.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.cmm.service.ServiceCommonService;
import chn.bhmc.dms.ser.wac.service.SanbaoReturnRequestService;
import chn.bhmc.dms.ser.wac.service.dao.SanbaoReturnRequestDAO;
import chn.bhmc.dms.ser.wac.vo.SanbaoReturnSearchVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoReturnVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoReturnRequestServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 7. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 26.     Kwon ki hyun     최초 생성
 * </pre>
 */
@Service("sanbaoReturnRequestService")
public class SanbaoReturnRequestServiceImpl extends HService implements SanbaoReturnRequestService {

    @Resource(name="sanbaoReturnRequestDAO")
    SanbaoReturnRequestDAO sanbaoReturnRequestDAO;

    @Autowired
    ServiceCommonService serviceCommonService;



    /**
    *
    * 삼포반품신청 목록 조회
    *
    * @param searchVO
    * @return
    * @throws Exception
    */
    public List<SanbaoReturnVO> selectSanbaoReturnRequestByCondition(SanbaoReturnSearchVO searchVO) throws Exception {

        String dlrCd = LoginUtil.getDlrCd();
        searchVO.setsDlrCd(dlrCd);
        return sanbaoReturnRequestDAO.selectSanbaoReturnRequestByCondition(searchVO);
    }


    /**
    *
    * 삼포반품신청 목록수
    *
    * @param searchVO
    * @return
    * @throws Exception
    */
    public int selectSanbaoReturnRequestByConditionCnt(SanbaoReturnSearchVO searchVO) throws Exception {

        String dlrCd = LoginUtil.getDlrCd();
        searchVO.setsDlrCd(dlrCd);

        return sanbaoReturnRequestDAO.selectSanbaoReturnRequestByConditionCnt(searchVO);
    }

    /**
     *
     * 삼포 반품승인 그리드 목록수 조회
     *
     * @return
     * @throws Exception
     */
    public int selectSanbaoReturnApproveByConditionCnt(SanbaoReturnSearchVO searchVO)throws Exception{

        if(!StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        return sanbaoReturnRequestDAO.selectSanbaoReturnApproveByConditionCnt(searchVO);
    }

    /**
     *
     * 삼포 반품승인 그리드 조회
     *
     * @return
     * @throws Exception
     */
    public List<SanbaoReturnVO> selectSanbaoReturnApproveByCondition(SanbaoReturnSearchVO searchVO)throws Exception{

        if(!StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        return sanbaoReturnRequestDAO.selectSanbaoReturnApproveByCondition(searchVO);

    }


    /**
    *
    * 삼포반품정보를 등록한다.
    *
    * @param returnVO
    * @return
    * @throws Exception
    */
    public int multiSanbaoReturnRequest(SanbaoReturnVO sanbaoReturnVO) throws Exception {
        String dlrCd = LoginUtil.getDlrCd();
        String userId = LoginUtil.getUserId();
        sanbaoReturnVO.setDlrCd(dlrCd);
        sanbaoReturnVO.setRegUsrId(userId);
        sanbaoReturnVO.setUpdtUsrId(userId);

        int cnt = 0;
        if( sanbaoReturnVO.getLineNo() == 0){
            cnt = insertSanbaoReturnRequest(sanbaoReturnVO);
        }else{

            //요청 취소전 상태
            String sanbaoReturnStatCd = sanbaoReturnRequestDAO.selectSanbaoReturnRequestStatCdByKey(sanbaoReturnVO);
            String stateCd = sanbaoReturnVO.getReturnStatCd();

            sanbaoReturnVO.setReturnStatCd(stateCd.equals("QC") ? "O" : stateCd);
            cnt = updateSanbaoReturnRequest(sanbaoReturnVO);

            if(cnt > 0 ){

                //Carmel InterFace Header Info
                Map<String, Object> message = new HashMap<String, Object>();
                message.put("DLR_CD", sanbaoReturnVO.getDlrCd());
                message.put("VIN_NO", sanbaoReturnVO.getVinNo());
                message.put("LINE_NO", sanbaoReturnVO.getLineNo());

                if(stateCd.equals("Q")){

                    sanbaoReturnRequestDAO.insertSanBaoReturnToIf(sanbaoReturnVO);
                    //int delCnt = selectSanbaoReturnRequestIfSendByConditionCnt(sanbaoReturnVO);
                    //int insCnt = sanbaoReturnRequestDAO.insertSanbaoReturnRequestIf(sanbaoReturnVO);

                    try{
                  //CamelClent Call
                  serviceCommonService.executeCamelClent(message,"SER032");
                    }catch(Exception e){

                        sanbaoReturnVO.setReturnStatCd("O");
                        sanbaoReturnRequestDAO.insertSanBaoReturnToRollBack(sanbaoReturnVO);
                        throw e;
                    }
                }
                if(stateCd.equals("QC")){

                    //요청 취소전 상태 체크
                    if(sanbaoReturnStatCd.equals("S") ||
                            sanbaoReturnStatCd.equals("A")  ){
                        throw processException("global.info.stateNotMsg", new String[]{messageSource.getMessage("ser.lbl.quest", null, LocaleContextHolder.getLocale())});
                    }

                    sanbaoReturnVO.setIfResltYn("N");
                    int delCnt = selectSanbaoReturnRequestIfSendByConditionCnt(sanbaoReturnVO);
                  //CamelClent Call
                    if(delCnt == 0 ){
                        serviceCommonService.executeCamelClent(message,"SER048");
                    }
                }
            }
          }

        return cnt;
    }

    /**
    *
    * 삼포반품신청 등록
    *
    * @param returnVO
    * @return
    * @throws Exception
    */
    public int insertSanbaoReturnRequest(SanbaoReturnVO returnVO) throws Exception {

        if( StringUtil.nullConvert(returnVO.getDlrCd()).equals("")){
            returnVO.setDlrCd(LoginUtil.getDlrCd());
        }
        return sanbaoReturnRequestDAO.insertSanbaoReturnRequest(returnVO);
    }

    /**
    *
    * 삼포반품신청 수정
    *
    * @param returnVO
    * @return
    * @throws Exception
    */
    public int updateSanbaoReturnRequest(SanbaoReturnVO returnVO) throws Exception {

        if( StringUtil.nullConvert(returnVO.getDlrCd()).equals("")){
            returnVO.setDlrCd(LoginUtil.getDlrCd());
        }
        return sanbaoReturnRequestDAO.updateSanbaoReturnRequest(returnVO);
    }

    /**
    *
    * 삼포반품신청 상세 조회
    *
    * @param searchVO
    * @return
    * @throws Exception
    */
    public SanbaoReturnVO selectSanbaoReturnRequestByKey(SanbaoReturnSearchVO searchVO) throws Exception {

        String dlrCd = LoginUtil.getDlrCd();
        searchVO.setsDlrCd(dlrCd);
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return sanbaoReturnRequestDAO.selectSanbaoReturnRequestByKey(searchVO);
    }


    /**
     *
     * 삼보 기술제출 등록
     *
     * @param sanbaoTechVO
     * @return
     * @throws Exception
     */
    public int insertSanBaoReturnToIf(SanbaoReturnVO returnVO)throws Exception{

        return sanbaoReturnRequestDAO.insertSanBaoReturnToIf(returnVO);
    }

    /**
    *
    * 삼보 return 요청 인터페이스 삭제
    *
    * @param sanbaoVO - 삼보 return 요청 인터페이스 삭제 목록을 포함하는 sanbaoVO
    * @return bindingResult
    * @throws Exception
    */
   public int deleteSanbaoReturnRequestIf(SanbaoReturnVO sanbaoReturnVO) throws Exception{

       return sanbaoReturnRequestDAO.deleteSanbaoReturnRequestIf(sanbaoReturnVO);
   }

   /**
    *
    * 삼보 return 요청 인터페이스 정보 조회
    *
    * @param sanbaoVO - 삼보 return 요청 인터페이스 정보  목록을 포함하는 sanbaoVO
    * @return bindingResult
    * @throws Exception
    */
   public int selectSanbaoReturnRequestIfSendByConditionCnt(SanbaoReturnVO sanbaoReturnVO) throws Exception{

       if( StringUtil.nullConvert(sanbaoReturnVO.getDlrCd()).equals("")){
            sanbaoReturnVO.setDlrCd(LoginUtil.getDlrCd());
        }

       int resultCnt = sanbaoReturnRequestDAO.selectSanbaoReturnRequestIfSendByConditionCnt(sanbaoReturnVO);

       if(resultCnt > 0){
           deleteSanbaoReturnRequestIf(sanbaoReturnVO);
       }

       return resultCnt;

   }

   /**
    *
    * 삼포 반품 승인 사용 여부 수정.
    *
    * @param sanbaoReturnVO
    * @return
    * @throws Exception
    */
    public int updateSanbaoReturnApprovePWA(SanbaoReturnVO sanbaoReturnVO)throws Exception{

        if( StringUtil.nullConvert(sanbaoReturnVO.getDlrCd()).equals("")){
            sanbaoReturnVO.setDlrCd(LoginUtil.getDlrCd());
        }
        return sanbaoReturnRequestDAO.updateSanbaoReturnApprovePWA(sanbaoReturnVO);
    };

}
