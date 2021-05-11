package chn.bhmc.dms.ser.wac.service.impl;

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

import com.ibm.icu.util.Calendar;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.ser.cmm.service.ServiceCommonService;
import chn.bhmc.dms.ser.svi.service.LtsModelMappingService;
import chn.bhmc.dms.ser.wac.service.ClaimStatusService;
import chn.bhmc.dms.ser.wac.service.PwaApproveService;
import chn.bhmc.dms.ser.wac.service.SanbaoReturnApproveService;
import chn.bhmc.dms.ser.wac.service.dao.PwaApproveDAO;
import chn.bhmc.dms.ser.wac.vo.ClaimStatusSearchVO;
import chn.bhmc.dms.ser.wac.vo.PwaLbrVO;
import chn.bhmc.dms.ser.wac.vo.PwaPartVO;
import chn.bhmc.dms.ser.wac.vo.PwaSearchVO;
import chn.bhmc.dms.ser.wac.vo.PwaVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoReturnVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PwaApproveServiceImpl.java
 * @Description : PWA 승인 구현클래스
 * @author Kwon Ki Hyun
 * @since 2016. 3. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 14.     Kwon Ki Hyun     최초 생성
 * </pre>
 */
@Service("pwaApproveService")
public class PwaApproveServiceImpl extends HService implements PwaApproveService, JxlsSupport{

    @Resource(name="pwaApproveDAO")
    PwaApproveDAO pwaApproveDAO;

    /**
     * LTS MODEL SERVICE
     */
    @Autowired
    LtsModelMappingService ltsModelMappingService;

    @Resource(name="pwaApproveNoIdgenService")
    TableIdGenService pwaApproveNoIdgenService;

    @Resource(name="claimStatusService")
    ClaimStatusService claimStatusService;


    /**
     * 삼포 반품승인 서비스
     */
    @Autowired
    SanbaoReturnApproveService sanbaoReturnApproveService;

    @Autowired
    ServiceCommonService serviceCommonService;


    /**
     * PWA 승인 상태를 수정한다.
     * Statements
     *
     * @param pwaVO
     * @return
     * @throws Exception
     */
    public PwaVO updateStatePwaApproves(PwaVO pwaVO) throws Exception {


        String pwaApproveNo = "";

        pwaVO.setUpdtUsrId(LoginUtil.getUserId());

        String pattern = "yyyy-MM-dd HH:mm:ss";
        Date toDate = DateUtil.convertToTimestamp(DateUtil.convertToString( new Date() ,pattern) ,pattern);

        if(pwaVO.getPwaStatCd().equals("A")){ //승인일경우
            pwaApproveNo = pwaApproveNoIdgenService.getNextStringId();

            pwaVO.setPwaApproveNo(pwaApproveNo);
            pwaVO.setHqApproveId(LoginUtil.getUserId());
            pwaVO.setHqApproveNm(LoginUtil.getUserNm());
            pwaVO.setHqApproveDt(toDate);
        }else if(pwaVO.getPwaStatCd().equals("R")){
            pwaVO.setReturnDt(toDate);
            pwaVO.setReturnCnt(pwaVO.getReturnCnt()+1);
            pwaVO.setHqApproveId(LoginUtil.getUserId());
            pwaVO.setHqApproveNm(LoginUtil.getUserNm());
        }else if(pwaVO.getPwaStatCd().equals("C")){
            pwaVO.setRejectDt(toDate);
            pwaVO.setHqApproveId(LoginUtil.getUserId());
            pwaVO.setHqApproveNm(LoginUtil.getUserNm());
        }else if(pwaVO.getPwaStatCd().equals("D")){ //승인취소
            pwaVO.setPwaStatCd("S"); //접수 상태
            ClaimStatusSearchVO claimStatusSearchVO = new ClaimStatusSearchVO();
            claimStatusSearchVO.setsDlrCd(pwaVO.getDlrCd());
            claimStatusSearchVO.setsVinNo(pwaVO.getVinNo());
            claimStatusSearchVO.setsPwaApproveNo(pwaVO.getPwaApproveNo());

            int claimCnt = claimStatusService.selectClaimStatusByConditionCnt(claimStatusSearchVO);

            if (claimCnt > 0){
                throw processException("ser.info.thisClaimDoc", new String[] {});
            }
        }

        updateSanboRtnApprove(pwaVO);

        int resultCnt = pwaApproveDAO.updateStatePwaApproves(pwaVO);

        if(resultCnt > 0){

          //DCS-DMS EAI InterFace Header Info
            Map<String, Object> message = new HashMap<String, Object>();

             message.put("DLR_CD", pwaVO.getDlrCd());
             message.put("VIN_NO",pwaVO.getVinNo());
             message.put("PWA_DOC_NO", pwaVO.getPwaDocNo());
             message.put("PWA_STAT_CD", pwaVO.getPwaStatCd());
             message.put("RETURN_REASON_CD", pwaVO.getReturnReasonCd());
             message.put("RETURN_REASON_CONT", pwaVO.getReturnReasonCont());
             message.put("DLR_SIGN_REQ_DT", pwaVO.getDlrSignReqDt());
             message.put("PWA_APPROVE_NO", pwaVO.getPwaApproveNo());
             message.put("HQ_APPROVE_DT", DateUtil.convertToDateTimeString(pwaVO.getHqApproveDt()));
             message.put("LBR_APPROVE_AMT", pwaVO.getLbrApproveAmt());
             message.put("ITEM_APPROVE_AMT", pwaVO.getItemApproveAmt());
             message.put("SUB_LBR_APPROVE_AMT", pwaVO.getSubLbrApproveAmt());
             message.put("HQ_APPROVE_ID", pwaVO.getHqApproveId());
             message.put("HQ_APPROVE_NM", pwaVO.getHqApproveNm());
             message.put("APPROVE_REASON_CONT", pwaVO.getApproveReasonCont());
             message.put("RETURN_CNT", pwaVO.getReturnCnt());
             message.put("RETURN_DT", DateUtil.convertToDateTimeString(pwaVO.getReturnDt()));
             message.put("REJECT_DT", DateUtil.convertToDateTimeString(pwaVO.getRejectDt()));
             message.put("UPDT_USR_ID", LoginUtil.getUserId());
             message.put("UPDT_DT", DateUtil.getDate("yyyy-MM-dd HH:mm:ss"));

             serviceCommonService.executeEaiCall(pwaVO.getDlrCd(),"SER019",message,"Y");

        }

        //이력 저장
        int seq = selectPwaReturnHistSeqByKey(pwaVO);
        pwaVO.setSeq(seq);
        insertPwaReturn(pwaVO);
        insertPwaLaborReturn(pwaVO);
        insertPwaPartReturn(pwaVO);

        return pwaVO;
    }



    public int updateSanboRtnApprove(PwaVO pwaVO)throws Exception{

        int resultCnt = 0;
        if(!StringUtil.nullConvert(pwaVO.getReturnApproveNo()).equals("")){

            /** 승인된 삼포 반품  NO 를 사용한다.**/

            SanbaoReturnVO sanbaoReturnVO = new SanbaoReturnVO();
            sanbaoReturnVO.setDlrCd(pwaVO.getDlrCd());
            sanbaoReturnVO.setVinNo(pwaVO.getVinNo());
            sanbaoReturnVO.setReturnApproveNo( pwaVO.getReturnApproveNo() );
          //  sanbaoReturnVO.setPwaUseYn( (pwaVO.getReturnApproveNo().equals("") ? "N" : "Y"));
            sanbaoReturnVO.setPwaUseYn("N");
            sanbaoReturnVO.setPwaApproveNo(pwaVO.getPwaApproveNo());
            sanbaoReturnVO.setUpdtUsrId(pwaVO.getUpdtUsrId());
            resultCnt = sanbaoReturnApproveService.updateSanbaoReturnApprovePWA(sanbaoReturnVO);
        }

        return resultCnt;
    }


    /**
     *
     * PWA 승인 데이터 목록수 조회한다.
     *
     * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
     * @return PWA 승인 데이터 목록수
     * @throws Exception
     */
    public int selectPwaApproveMainsByConditionCnt(PwaSearchVO searchVO) throws Exception {

        return pwaApproveDAO.selectPwaApproveMainsByConditionCnt(searchVO);
    }

    /**
    *
    * PWA 승인 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 승인 목록 데이터
    * @throws Exception
    */
    public List<PwaVO> selectPwaApproveMainsByCondition(PwaSearchVO searchVO) throws Exception {

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return pwaApproveDAO.selectPwaApproveMainsByCondition(searchVO);
    }


   /**
    *
    * PWA 상세 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 상세 정보 데이터
    * @throws Exception
    */
    public PwaVO selectPwaApproveByKey(PwaSearchVO searchVO) throws Exception {

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        searchVO.setsLtsModelCd(ltsModelMappingService.selectLtsModelMapping(searchVO.getsVinNo()));

         PwaVO pwaVO = pwaApproveDAO.selectPwaApproveByKey(searchVO);
         if(pwaVO == null ) pwaVO = new PwaVO();
         //新增保修结束日期查询逻辑   20200731 tjx  start
         if(!pwaVO.getVinNo().isEmpty()) {
         	//特殊车辆保修结束日期查询
         	Integer normWarrper = pwaApproveDAO.selectSpecialCarWarrantyEndInfo(pwaVO.getVinNo());
         	if(null != normWarrper) {
 	        	if(null!=pwaVO.getWartDt()) {
 	        		Date wartExpireDate = DateUtil.add(pwaVO.getWartDt(), Calendar.MONTH, normWarrper);
 	        		Date  wartExpireDt = DateUtil.add(wartExpireDate, Calendar.DATE, -1);
 	        		pwaVO.setWartExpireDt(wartExpireDt);
 	        	}
         	}else {
         		//非特殊车辆保修结束日期查询
         		if(null!=pwaVO.getWartDt()) {
         			pwaVO.setLtsModelCd(searchVO.getsLtsModelCd());
         			Date wartExpireDt = pwaApproveDAO.selectCarWarrantyEndDtByKey(pwaVO);
         			pwaVO.setWartExpireDt(wartExpireDt);
         		}
         	}
         }
       //新增保修结束日期查询逻辑   20200731 tjx  end
         return pwaVO;
    }

    /**
    *
    * PWA 공임 정보 데이터 갯수 를  조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 공임  정보 데이터 갯수
    * @throws Exception
    */
    public int selectPwaApproveLbrsByConditionCnt(PwaSearchVO searchVO) throws Exception {

        return pwaApproveDAO.selectPwaApproveLbrsByConditionCnt(searchVO);
    }

    /**
    *
    * PWA 공임 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 공임  정보 데이터
    * @throws Exception
    */
    public List<PwaLbrVO> selectPwaApproveLbrsByCondition(PwaSearchVO searchVO) throws Exception {

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return pwaApproveDAO.selectPwaApproveLbrsByCondition(searchVO);
    }

    /**
    *
    * PWA 부품 정보 데이터 갯수 를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 공임  정보 데이터 갯수
    * @throws Exception
    */
    public int selectPwaApprovePartsByConditionCnt(PwaSearchVO searchVO) throws Exception {

        return pwaApproveDAO.selectPwaApprovePartsByConditionCnt(searchVO);
    }

    /**
    *
    * PWA 부품 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 공임  정보 데이터
    * @throws Exception
    */
    public List<PwaPartVO> selectPwaApprovePartsByCondition(PwaSearchVO searchVO) throws Exception {

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return pwaApproveDAO.selectPwaApprovePartsByCondition(searchVO);
    }


    /**
     * 클레임에서 사용된 RO NO를  승인된 PWA 에 등록한다.
     * Statements
     *
     * @param pwaVO
     * @return
     * @throws Exception
     */
    public int updatePwaApproveNoInClaim(PwaVO pwaVO) throws Exception {

        return pwaApproveDAO.updatePwaApproveNoInClaim(pwaVO);
    }

    /**
    *
    * 승인 PWA 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return 승인 PWA  정보 데이터
    * @throws Exception
    */
    public List<PwaVO> selectPwaApproveClaimByCondition(PwaSearchVO searchVO) throws Exception {

        return pwaApproveDAO.selectPwaApproveClaimByCondition(searchVO);
    }

    /**
     * PWA 반력 이력 헤더 등록
     * Statements
     *
     * @param pwaVO
     * @return
     * @throws Exception
     */
    public int insertPwaReturn(PwaVO pwaVO)throws Exception{

        return pwaApproveDAO.insertPwaReturn(pwaVO);
    }

    /**
     * PWA 반력 이력 부품 등록
     * Statements
     *
     * @param pwaVO
     * @return
     * @throws Exception
     */
    public int insertPwaPartReturn(PwaVO pwaVO)throws Exception{

        return pwaApproveDAO.insertPwaPartReturn(pwaVO);
    };

    /**
     * PWA 반력 이력 공임 등록
     * Statements
     *
     * @param pwaVO
     * @return
     * @throws Exception
     */
    public int insertPwaLaborReturn(PwaVO pwaVO)throws Exception{

        return pwaApproveDAO.insertPwaLaborReturn(pwaVO);
    }

    /**
     * PWA 반력 SEQ
     * Statements
     *
     * @param pwaVO
     * @return
     * @throws Exception
     */
    public int selectPwaReturnHistSeqByKey(PwaVO pwaVO)throws Exception{

        return pwaApproveDAO.selectPwaReturnHistSeqByKey(pwaVO);
    }

    /**
    *
    * PWA 이력 데이터 목록수 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 승인 데이터 목록수
    * @throws Exception
    */
    public int selectPwaHistoryByConditionCnt(PwaSearchVO searchVO) throws Exception{

        return pwaApproveDAO.selectPwaHistoryByConditionCnt(searchVO);
    }

    /**
    *
    * PWA 이력 목록 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 PwaSearchVO
    * @return PWA 승인 목록 데이터
    * @throws Exception
    */
    public List<PwaVO> selectPwaHistoryByCondition(PwaSearchVO searchVO)throws Exception{

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return pwaApproveDAO.selectPwaHistoryByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {


        PwaSearchVO searchVO = new PwaSearchVO();

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        searchVO.setsFromDt(DateUtil.convertToDate((String)params.get("sFromDt")));
        searchVO.setsToDt(DateUtil.convertToDate((String)params.get("sToDt")));

        List<PwaVO> list = selectPwaApproveMainsByCondition(searchVO);

        context.putVar("items", list);

    }

}
