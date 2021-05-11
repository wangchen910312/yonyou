package chn.bhmc.dms.ser.ro.service.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import able.com.vo.HMap;

import org.apache.commons.lang.StringUtils;
import org.jxls.common.Context;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.ser.cmm.service.ServiceCommonService;
import chn.bhmc.dms.ser.cmm.vo.CustDemandVO;
import chn.bhmc.dms.ser.cmm.vo.LbrSuggestVO;
import chn.bhmc.dms.ser.cmm.vo.TrobleDescVO;
import chn.bhmc.dms.ser.rev.service.ReservationReceiptService;
import chn.bhmc.dms.ser.ro.service.PreCheckService;
import chn.bhmc.dms.ser.ro.service.dao.PreCheckDAO;
import chn.bhmc.dms.ser.ro.vo.PreCheckDetailVO;
import chn.bhmc.dms.ser.ro.vo.PreCheckSaveVO;
import chn.bhmc.dms.ser.ro.vo.PreCheckSearchVO;
import chn.bhmc.dms.ser.ro.vo.PreCheckVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PreCheckServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 3. 29.
 * @version 1.0gv
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 29.     Kwon Ki Hyun     최초 생성
 * </pre>
 */
@Service("preCheckService")
public class PreCheckServiceImpl extends HService implements PreCheckService, JxlsSupport{

    @Resource(name="preCheckDAO")
    PreCheckDAO preCheckDAO;

    @Resource(name="reservationReceiptService")
    ReservationReceiptService reservationReceiptService;

    @Resource(name="preCheckIdGenService")
    TableIdGenService preCheckIdGenService;

    @Resource(name="roGrpNoIdGenService")
    TableIdGenService roGrpNoIdGenService;

    /**
     * 고객요구사항 및 고장설명
     */
    @Autowired
    ServiceCommonService serviceCommonService;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 사전점검 내역 조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public PreCheckVO selectPreCheckByKey(PreCheckSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return preCheckDAO.selectPreCheckByKey(searchVO);
    }


    /**
     * 사전점검 내역 리스트 수 조회
     *
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectPreCheckListByConditionCnt(PreCheckSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return preCheckDAO.selectPreCheckListByConditionCnt(searchVO);
    }

    /**
     * 사전점검 내역 리스트 조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<PreCheckVO> selectPreCheckListByCondition(PreCheckSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return preCheckDAO.selectPreCheckListByCondition(searchVO);
    }

    /**
     * 사전점검 상세 내역 조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<PreCheckDetailVO> selectReserveDetailInfoByKey(PreCheckSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        return preCheckDAO.selectReserveDetailInfoByKey(searchVO);
    }


    /**
    *
    * 사전점검 간반보드 정보 조회
    *
    * @param searchVO - 사전점검 간반보드 정보 조회
    * @return
    * @throws Exception
    */
    public List<PreCheckVO> selectPreChkKanbanByCondition(PreCheckSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return preCheckDAO.selectPreChkKanbanByCondition(searchVO);
    }

    /**
    *
    * 사전점검 항목 정보를 등록한다.
    *
    * @param saveVO - 사전점검 항목 등록/수정 목록을 포함하는 SaveVO
    * @return bindingResult
    * @throws Exception
    */
    public String multiPreChecks(PreCheckSaveVO saveVO,String useEqui) throws Exception {

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        String user_id = LoginUtil.getUserId();
        PreCheckVO preCheckVO = saveVO.getPreCheckVO();
        preCheckVO.setDlrCd(LoginUtil.getDlrCd());

        preCheckVO.setRegUsrId(user_id);
        preCheckVO.setUpdtUsrId(user_id);
        int resultCnt = 0;
        String roGrpNo = "";
        String diagDocNo = "";
        /*20201028 update by TJX 接车检查验证是否存在预约单 start
        if(!StringUtil.isEmpty(preCheckVO.getResvDocNo())) {
        	//查询预约单状态
        	String resvStatCd = preCheckDAO.selectResvDocNoInfoByKey(preCheckVO);
        	//存在则判断是否是确认状态CM_0304T SER011;
        	if(!"O".equals(resvStatCd)) {
        		throw processException("ser.err.resvStatCd");
        	}
        }
      20201028 update by TJX 接车检查验证是否存在预约单 end*/
        if( (StringUtil.isEmpty(preCheckVO.getDiagDocNo()))){

            //사전점검 번호 생성
            diagDocNo = preCheckIdGenService.getNextStringId();
            preCheckVO.setDiagDocNo(diagDocNo);

            String pattern = dateFormat + " HH:mm:ss";
            Date startDt = DateUtil.convertToTimestamp(DateUtil.convertToString( new Date() ,pattern) ,pattern);

            // 차량접수가 안됐을 경우 자동 차량접수
            if(StringUtil.isEmpty(preCheckVO.getRoGrpNo())){
                /**
                 * RO그룹번호(키생성)
                 */
                roGrpNo = roGrpNoIdGenService.getNextStringId();
            }

            preCheckVO.setSerResvStartDt(startDt);
            preCheckVO.setRoGrpNo(roGrpNo);
            preCheckVO.setDiagDocNo(diagDocNo);
            //增加字段 pad pc jmm 2018-1-31 start
            preCheckVO.setUseEqui(useEqui);
          //增加字段 pad pc jmm 2018-1-31 start
            resultCnt = insertPreCheck(preCheckVO);

        }else{
            resultCnt = updatePreCheck(preCheckVO);
        }
        //입고점검(사전점검) 상세데이터 입력
        if(resultCnt > 0){
            deletePreCheckDetail(preCheckVO);
            insertPreCheckDetail(saveVO);
        }

        List<CustDemandVO> custDemandList = saveVO.getCustDemandListVO();
        TrobleDescVO trobleDescVO = saveVO.getTrobleDescVO();

        List<LbrSuggestVO> lbrSuggestList = saveVO.getLbrSuggestListVO();

        //고객요구사항 추가/수정/삭제
        multiCustDemand(custDemandList , preCheckVO.getDiagDocNo());
        //고장서술 추가/수정/삭제
        multiTrobleDesc(trobleDescVO, preCheckVO.getDiagDocNo());

        //수리건의 추가/삭제
        serviceCommonService.multiLbrSuggest(lbrSuggestList, preCheckVO.getDiagDocNo(), "PC");

        return preCheckVO.getDiagDocNo();
    }

    /**
     *
     * 고객요구사항 저장
     *
     * @param custDemandList
     * @param estDocNo
     * @throws Exception
     */
    public void multiCustDemand( List<CustDemandVO> custDemandList,String diagDocNo  )throws Exception{

        serviceCommonService.multiCustDemand(custDemandList,diagDocNo , "PC");

    }

    /**
     *
     * 고장설명 저장
     *
     * @param trobleDescVO
     * @param estDocNo
     * @throws Exception
     */
    public void multiTrobleDesc(TrobleDescVO trobleDescVO,String diagDocNo )throws Exception{

        if(StringUtil.nullConvert(trobleDescVO.getDlrCd()).equals("") ){
            trobleDescVO.setDlrCd(LoginUtil.getDlrCd());
        }
        serviceCommonService.multiTrobleDesc(trobleDescVO,diagDocNo);
    }

    /**
     *
     * 사전점검 항목을 등록한다.
     *
     * @param preCheckVO
     * @throws Exception
     */
    public int insertPreCheck(PreCheckVO preCheckVO)throws Exception{

        return preCheckDAO.insertPreCheck(preCheckVO);
    }

    /**
     *
     * 사전점검 항목을 수정한다.
     *
     * @param preCheckVO
     * @throws Exception
     */
    public int updatePreCheck(PreCheckVO preCheckVO)throws Exception{

        preCheckVO.setDlrCd(LoginUtil.getDlrCd());
        preCheckVO.setUpdtUsrId(LoginUtil.getUserId());

        if(StringUtil.nullConvert(preCheckVO.getDiagStatCd()).equals("C")){
            Calendar calendar = Calendar.getInstance();
            calendar.setTimeInMillis(new Date().getTime());
            preCheckVO.setPreChkCancDt(calendar.getTime());
            preCheckVO.setPreChkCancPrsnId(LoginUtil.getUserId());
            preCheckVO.setPreChkCancPrsnNm(LoginUtil.getUserNm());
        }

        if(StringUtil.nullConvert(preCheckVO.getPrintYn()).equals("Y")){
            Calendar calendar = Calendar.getInstance();
            calendar.setTimeInMillis(new Date().getTime());
            preCheckVO.setPreChkPrintDt(calendar.getTime());
        }

        return preCheckDAO.updatePreCheck(preCheckVO);
    }

    /**
     *
     * 사전점검 항목을 삭제한다.
     *
     * @param preCheckVO
     * @throws Exception
     */
    public int deletePreCheck(PreCheckVO preCheckVO)throws Exception{


        preCheckVO.setDlrCd(LoginUtil.getDlrCd());
        int delCnt = preCheckDAO.deletePreCheck(preCheckVO);

        log.debug("delCnt = " + delCnt);
        if(delCnt > 0)
           deletePreCheckDetail(preCheckVO);


        return delCnt;
    }

    /**
     *
     * 사전점검 상세 항목을 등록한다.
     *
     * @param preCheckDetailVO
     * @return
     * @throws Exception
     */
    public int insertPreCheckDetail(PreCheckSaveVO saveVO) throws Exception{

        List<PreCheckDetailVO>  objVO = saveVO.getPreCheckDetailVO();
        int inCnt=0;
        String user_id = LoginUtil.getUserId();

        if(objVO.size() > 0){

            for(PreCheckDetailVO preCheckDetailVO : objVO ){
                preCheckDetailVO.setDlrCd(LoginUtil.getDlrCd());
                preCheckDetailVO.setRegUsrId(user_id);
                preCheckDetailVO.setDiagDocNo(saveVO.getPreCheckVO().getDiagDocNo());

               inCnt +=  preCheckDAO.insertPreCheckDetail(preCheckDetailVO);
            }
        }
        return inCnt;
    }


    /**
     *
     * 사전점검 상세 항목을 삭제한다.
     *
     * @param preCheckDetailVO
     * @return
     * @throws Exception
     */
    public int deletePreCheckDetail(PreCheckVO preCheckVO) throws Exception{

        return preCheckDAO.deletePreCheckDetail(preCheckVO);
    }




    /**
     * 서비스 공통용 : 다건의 당일 차량점검 정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PreCheckSearchVO
     * @return 당일 예약 정보 목록 데이터
     */
    public List<PreCheckVO> selectVehOfPreCheckInfoByCondition(PreCheckSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        return preCheckDAO.selectVehOfPreCheckInfoByCondition(searchVO);
    }

    /**
     * 칸반 사전점검 컬럼 조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<PreCheckVO> selectPreChkKanbanRowsByCondition(PreCheckSearchVO searchVO) throws Exception{

        return preCheckDAO.selectPreChkKanbanRowsByCondition(searchVO);
    }

    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        PreCheckSearchVO searchVO = new PreCheckSearchVO();

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

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

        List<PreCheckVO> list = selectPreCheckListByCondition(searchVO);
        context.putVar("items", list);

    }
}
