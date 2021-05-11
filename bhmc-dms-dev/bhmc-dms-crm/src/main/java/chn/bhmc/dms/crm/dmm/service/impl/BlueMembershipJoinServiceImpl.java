package chn.bhmc.dms.crm.dmm.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import able.com.exception.BizException;
import able.com.service.HService;
import able.com.vo.HMap;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.i18n.ReloadableDataSourceResourceBundleMessageSource;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoVO;
import chn.bhmc.dms.crm.dmm.service.BlueMembershipCalcService;
import chn.bhmc.dms.crm.dmm.service.BlueMembershipInterfaceService;
import chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinHistoryService;
import chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinService;
import chn.bhmc.dms.crm.dmm.service.dao.BlueMembershipJoinDAO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfConsumeListRapVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfInfoRapVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfParamVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinSearchVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BlueMembershipJoinServiceImpl.java
 * @Description : 블루멤버십 가입신청 서비스 구현체
 * @author Kim Hyun Ho
 * @since 2016. 5. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 20.     Kim Hyun Ho     최초 생성
 * </pre>
 */

@Service("blueMembershipJoinService")
public class BlueMembershipJoinServiceImpl extends HService implements BlueMembershipJoinService, JxlsSupport{

    /**
     * 블루멤버십 신청 DAO
     */
    @Resource(name="blueMembershipJoinDAO")
    BlueMembershipJoinDAO blueMembershipJoinDAO;

    /**
     * 블루멤버십 이력 서비스
     */
    @Resource(name="blueMembershipCalcService")
    BlueMembershipCalcService blueMembershipCalcService;

    /**
     * 블루멤버십 신청 DAO
     */
    @Resource(name="blueMembershipInterfaceService")
    BlueMembershipInterfaceService blueMembershipInterfaceService;

    /**
     * 고객정보 서비스
     */
    @Resource(name="customerInfoOutBoundService")
    CustomerInfoOutBoundService customerInfoOutBoundService;

    /**
     * 메시지 관리
     */
    @Resource(name="dataSourceMessageSource")
    ReloadableDataSourceResourceBundleMessageSource dataSourceMessageSource;

    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 블루멤버십 인증 히스토리 서비스
     */
    @Resource(name="blueMembershipJoinHistoryService")
    BlueMembershipJoinHistoryService blueMembershipJoinHistoryService;

    /**
     * 조회 조건에 해당하는 블루멤버십 가입 총 인원수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BlueMembershipJoinSearchVO
     * @return
     */
    @Override
    public int selectBlueMembershipJoinsByConditionCnt(BlueMembershipJoinSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return blueMembershipJoinDAO.selectBlueMembershipJoinsByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 블루멤버십 가입정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BlueMembershipJoinSearchVO
     * @return 조회 목록
     */
    @Override
    public List<BlueMembershipJoinVO> selectBlueMembershipJoinsByCondition(BlueMembershipJoinSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return blueMembershipJoinDAO.selectBlueMembershipJoinsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinService#insertBlueMembershipJoin(chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinSearchVO)
     */
    @Override
    public int insertBlueMembershipJoin(BlueMembershipJoinVO blueMembershipJoinVO) throws Exception {
        blueMembershipJoinVO.setDlrCd(LoginUtil.getDlrCd());
        blueMembershipJoinVO.setJoinDlrCd(LoginUtil.getDlrCd());

        //블루멤버십 가입되어 있는지 확인
        BlueMembershipJoinSearchVO searchVO = new BlueMembershipJoinSearchVO();
        searchVO.setsDlrCd(blueMembershipJoinVO.getDlrCd());
        searchVO.setsCustNo(blueMembershipJoinVO.getCustNo());

        BlueMembershipJoinVO mem = blueMembershipJoinDAO.selectBlueMembershipJoinByKey(searchVO);

        if(mem != null){
            //throw processException("global.info.alreadyCont", new String[]{messageSource.getMessage("global.lbl.customer", null, LocaleContextHolder.getLocale())});
            //등록된 회원일 경우 주소수정만 가능하다.
            blueMembershipJoinVO.setUpdtUsrId(LoginUtil.getUserId());
            return blueMembershipJoinDAO.updateBlueMembershipJoinAddr(blueMembershipJoinVO);
        }else{
            return blueMembershipJoinDAO.insertBlueMembershipJoin(blueMembershipJoinVO);
        }
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinService#selectBlueMembershipJoinByKey(chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinVO)
     */
    @Override
    public BlueMembershipJoinVO selectBlueMembershipJoinByKey(BlueMembershipJoinSearchVO searchVO) throws Exception {
        return blueMembershipJoinDAO.selectBlueMembershipJoinByKey(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinService#updateBlueMembershipApprove(chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinVO)
     */
    @Override
    public int updateBlueMembershipApprove(BlueMembershipJoinVO blueMembershipJoinVO) throws Exception {
        // [TODO] 승인정보를 수정할 시에는 CR_0101T 테이블의 블루멤버십 커럼도 수정해 주어야 한다.
        return blueMembershipJoinDAO.updateBlueMembershipApprove(blueMembershipJoinVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinService#updateBlueMembershipJoinAddr(chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinVO)
     */
    @Override
    public int updateBlueMembershipJoinAddr(BlueMembershipJoinVO blueMembershipJoinVO) throws Exception {
        blueMembershipJoinVO.setUpdtUsrId(LoginUtil.getUserId());
        return blueMembershipJoinDAO.updateBlueMembershipJoinAddr(blueMembershipJoinVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinService#insertCreateMembership(chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfParamVO)
     */
    @Override
    public HashMap<String,String> insertCreateMembership(BlueMembershipJoinVO joinVO) throws Exception {
        int result = 0;
        String dlrCd = LoginUtil.getDlrCd();
        BlueMembershipIfParamVO paramVO = new BlueMembershipIfParamVO();
        paramVO.setDealerId(dlrCd);         //딜러코드
        paramVO.setPhoneNumber(joinVO.getHpNo());           //핸드폰번호
        paramVO.setPaperWork(commonCodeService.selectCommonCodeByKey("CRM024", joinVO.getMathDocTp()).getRemark2());        //증거유형
        paramVO.setIdentityNumber(joinVO.getSsnCrnNo());    //증거번호
        paramVO.setAgree(("Y".equals(joinVO.getAgree()))?"1":"0");                //지불여부 : 지불 여부(1: 지불 완료, 0: 미 지불 )
        paramVO.setAmount(joinVO.getAmount());              //지불금액
        paramVO.setVin(joinVO.getVinNo());                    //vin번호

        //TODO : [블루멤버십] 회원가입시 값 셋팅
        //딜러번호 는 loginUtil 에서 가져와서 셋팅해준다.
        //I/F 후에 블루멤버십 정보를 Member 정보에 Update 해줘야함.
        //따라서, Service 메소드를 하나 만들어서 I/F 하고, update 하는 로직이 필요함. Controller 에서는 DATA값 셋팅과 validation 처리를 함.

        BlueMembershipIfInfoRapVO rapVO = blueMembershipInterfaceService.insertCreateMembership(paramVO);

        try {


            String userId = LoginUtil.getUserId();
            joinVO.setDlrCd(dlrCd);
            joinVO.setRegUsrId(userId);


            HashMap<String, String> hm = new HashMap<String, String>();

            if(rapVO.getIsSuccess()){

                Calendar startCal = Calendar.getInstance();
                int year = startCal.get(Calendar.YEAR);
                int month = startCal.get(Calendar.MONTH);
                int day = startCal.get(Calendar.DATE);
                startCal.set(year, month, day, 00, 00, 00);

                joinVO.setJoinApproveYn("Y");//가입승인여부
                joinVO.setJoinReqAgreeYn("Y");//가입요청동의여부
                joinVO.setCarOwnYn("Y");        // 차량 소유 여부
                joinVO.setJoinApproveDt(startCal.getTime()); //가입승인일자

                String amount = joinVO.getAmount();
                int getAmount = 0;
                if ( StringUtils.isNotEmpty(amount)) {
                    getAmount = Integer.parseInt(amount);
                }
                joinVO.setPayAmt(getAmount);
                //blueMembershipJoinDAO.insertBlueMembershipJoin(joinVO);

                CustomerInfoVO customerInfoVO = new CustomerInfoVO();
                customerInfoVO.setCustNo(joinVO.getCustNo());//고객번호
                customerInfoVO.setDlrCd(dlrCd);//딜러코드
                customerInfoVO.setBlueMembershipJoinDlrCd(dlrCd);//블루멤버십 가입딜러코드
                customerInfoVO.setBlueMembershipJoinDt(startCal.getTime());//블루멤버십 가입일자
                customerInfoVO.setBlueGradeNm(rapVO.getData().getmLevel());//회원 등급1- 등록 회원 10-일반 카드 11- 실버 12-골드
                customerInfoVO.setBlueGradeChgDt(rapVO.getData().getmLevelBeginDate());//블루멤버십 등급변경일자MLevelInvalidDate
                customerInfoVO.setBlueMembershipNo(rapVO.getData().getBlueMembershipNo());
                customerInfoVO.setBlueAvlbPointVal(rapVO.getData().getPoint());

                customerInfoVO.setUpdtUsrId(userId);

                result = customerInfoOutBoundService.updateBlueMemberCustomer(customerInfoVO);

                hm.put("result", "SUCCESS");
                hm.put("failMsg", "");

            }else{
                //인터페이스 의 결과 가 실패일 경우
                String failMsg = rapVO.getMessage();
                joinVO.setRemark(rapVO.getMessage());   //블루멤버십 가입 실패 사유
                joinVO.setCarOwnYn("N");        // 차량 소유 여부 : 실패 했으므로 N으로 입력
                joinVO.setJoinApproveYn("N");//가입승인여부 : 실패 했으므로 N으로 입력
                joinVO.setJoinReqAgreeYn("N");//가입요청동의여부 : 실패 했으므로 N으로 입력
                hm.put("result", "FAIL");
                hm.put("failMsg", failMsg);
            }
//            ,#{blueMembershipNo}        --블루멤버쉽번호
//            ,#{blueMembershipId}        --블루멤버쉽 아이디
//            ,#{blueGradeNm}             --블루멤버십 등급(crm806)
//            ,#{blueAvlbPointVal}        --블루멤버십 포인트-가용
//            ,#{blueMembershipJoinDt}    --블루멤버쉽가입일자
//            ,#{blueGradeChdDt}          --블루멤버십 등급변경일


            blueMembershipJoinDAO.insertBlueMembershipJoin(joinVO);

            return hm;
        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinService#selectBlueMembershipByIdentityNumber(chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinVO)
     */
    @Override
    public BlueMembershipIfInfoRapVO selectBlueMembershipByIdentityNumber(BlueMembershipJoinVO joinVO) throws Exception {
        BlueMembershipIfInfoRapVO rapVO = new BlueMembershipIfInfoRapVO();

        if(joinVO.getCustNo().equals("")){
            rapVO.setIsSuccess(false);
            //{고객번호}은 필수입력사항입니다.
            rapVO.setMessage(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
            return rapVO;
        }

        CustomerInfoVO customerInfoVO = selectCustomerByCustNo(LoginUtil.getDlrCd(), joinVO.getCustNo());
        BlueMembershipIfParamVO paramVO = new BlueMembershipIfParamVO();
        if(customerInfoVO == null){
            rapVO.setIsSuccess(false);
            //{입력하신 고객번호와 일치하는 고객이 없습니다.
            rapVO.setMessage(messageSource.getMessage("crm.err.noCustNo", null, LocaleContextHolder.getLocale()));
            return rapVO;
        }else{
            paramVO.setIdentityNumber(customerInfoVO.getSsnCrnNo());    //증거번호
            //블루멤버십 포인트 조회
            rapVO = blueMembershipInterfaceService.selectBlueMembershipByIdentityNumber(paramVO);

            if(rapVO.getIsSuccess() && "Y".equals(rapVO.getData().getBlueMembershipYN())){
                //블루멤버십 남은 포인트 수정
                CustomerInfoVO customerInfoVOBlue = new CustomerInfoVO();
                customerInfoVOBlue.setCustNo(customerInfoVO.getCustNo());                   //고객번호
                customerInfoVOBlue.setDlrCd(customerInfoVO.getDlrCd());                     //딜러코드
                customerInfoVOBlue.setBlueAvlbPointVal(rapVO.getData().getPoint());          //남은포인트
                customerInfoVOBlue.setBlueMembershipNo(rapVO.getData().getBlueMembershipNo());
                customerInfoOutBoundService.updateBlueMemberCustomer(customerInfoVOBlue);
            }
            return rapVO;
        }
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinService#insertMembershipApproval(chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinVO)
     */
    @Override
    public BlueMembershipIfInfoRapVO insertMembershipApproval(BlueMembershipJoinVO joinVO) throws Exception {
        /*
         *  딜러인증심사
         */
        int result = 0;
        String dlrCd = LoginUtil.getDlrCd();
        String userId = LoginUtil.getUserId();
        BlueMembershipIfInfoRapVO rapVO = new BlueMembershipIfInfoRapVO();

        if(joinVO.getSsnCrnNo().equals("")){
            rapVO.setIsSuccess(false);
            //{증거번호}은 필수입력사항입니다.
            rapVO.setMessage(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("global.lbl.ssnCrnNo", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
            return rapVO;

        }
        if(joinVO.getHpNo().equals("")){
            rapVO.setIsSuccess(false);
            //{휴대전화}은 필수입력사항입니다.
            rapVO.setMessage(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("global.lbl.hpNo", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
            return rapVO;
        }

        //I/F 파라미터 셋팅
        BlueMembershipIfParamVO paramVO = new BlueMembershipIfParamVO();
        paramVO.setIdentityNumber(joinVO.getSsnCrnNo());    //증거번호
        paramVO.setDealerId(dlrCd);                         //딜러코드
        paramVO.setPhoneNumber(joinVO.getHpNo());           //휴대폰번호

        rapVO = blueMembershipInterfaceService.insertMembershipApproval(paramVO);
        try {
            if(rapVO.getIsSuccess()){

                joinVO.setDlrCd(dlrCd);
                joinVO.setBlueMembershipNo(rapVO.getData().getBlueMembershipNo());
                joinVO.setBlueMembershipId(rapVO.getData().getBlueMembershipId());
                joinVO.setBlueGradeNm(rapVO.getData().getmLevel());
                joinVO.setBlueAvlbPointVal(rapVO.getData().getPoint());       //블루멤버쉽가용포인트값
                joinVO.setBlueGradeChdDt(rapVO.getData().getmLevelBeginDate());
                joinVO.setBlueMembershipJoinDtFormat(rapVO.getData().getmLevelInvalidDate());

                joinVO.setRegUsrId(userId);         //등록자ID
                // 인증완료후 히스토리 테이블에 쌓는다.
                result = blueMembershipJoinHistoryService.insertBlueMembershipJoinHistory(joinVO);
            }
            return rapVO;
        }catch(Exception e){
            e.printStackTrace();
            rapVO.setIsSuccess(false);
            //딜러인증심사를 진행할 수 없습니다.
            rapVO.setMessage(messageSource.getMessage("crm.err.insertMEmbershipApproval", null, LocaleContextHolder.getLocale()));
            return rapVO;
        }
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinService#blueMembershipIfConsumeList(chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinVO)
     */
    @Override
    public BlueMembershipIfConsumeListRapVO blueMembershipIfConsumeList(BlueMembershipJoinVO joinVO) throws Exception {

        //I/F 파라미터 셋팅
        BlueMembershipIfParamVO paramVO = new BlueMembershipIfParamVO();
        paramVO.setDealerId(LoginUtil.getDlrCd());                  //딜러코드
        paramVO.setBeginDate(paramVO.getBeginDate());               //시작날짜(yyyyMMddHHmmss)
        paramVO.setEndDate(paramVO.getEndDate());                   //완료날짜(yyyyMMddHHmmss)
        paramVO.setIdentityNumber(joinVO.getSsnCrnNo());            //증거번호
        paramVO.setBlueMembershipNo(paramVO.getBlueMembershipNo()); //블루멤버십 회원카드번호

        BlueMembershipIfConsumeListRapVO listPapVO = blueMembershipInterfaceService.selectAddORConsumeintegral(paramVO);

        return listPapVO;
    }

    private CustomerInfoVO selectCustomerByCustNo (String dlrCd, String custNo) throws Exception {
        CustomerInfoSearchVO searchVO = new CustomerInfoSearchVO();
        searchVO.setsDlrCd(dlrCd);                  //딜러코드
        searchVO.setsCustNo(custNo);                //고객번호
        List<CustomerInfoVO> custList = customerInfoOutBoundService.selectCustomerInfoByCondition(searchVO);

        if(custList == null || custList.size() == 0){
            return null;
        }else{
            return custList.get(0);
        }
    }

    public int selectBlueMembershipByConditionCnt(BlueMembershipSearchVO search) throws Exception{
        if(StringUtils.isBlank(search.getsDlrCd())){search.setsDlrCd(LoginUtil.getDlrCd());}
        return blueMembershipJoinDAO.selectBlueMembershipByConditionCnt(search);
    }

    public List<BlueMembershipJoinVO> selectBlueMembershipByCondition(BlueMembershipSearchVO search) throws Exception{
        if(StringUtils.isBlank(search.getsDlrCd())){search.setsDlrCd(LoginUtil.getDlrCd());}
        return blueMembershipJoinDAO.selectBlueMembershipByCondition(search);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {
       
       if("blueMembershipJoins".equals((String)params.get("sTypeVal"))){
    	   //CRM_蓝缤入会管理_蓝缤入会履历 新增Excel 贾明 2018-10-22 
    	   BlueMembershipJoinSearchVO  searchVO = new BlueMembershipJoinSearchVO();
    	   ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
    	   if(!StringUtils.isBlank(params.get("sStartDt").toString())){
  			 String sStartDt = params.get("sStartDt").toString();
  	         Date dStartDt = DateUtil.convertToDate(sStartDt);
  	         searchVO.setsStartDt(dStartDt);
  		    }
  		
	  		if(!StringUtils.isBlank(params.get("sEndDt").toString())){
	  			 String sEndDt = params.get("sEndDt").toString();
	  	         Date dEndDt = DateUtil.convertToDate(sEndDt);
	  	         searchVO.setsEndDt(dEndDt);
	  		}
	  		List<BlueMembershipJoinVO> list = selectBlueMembershipJoinsByCondition(searchVO);
	  		 context.putVar("items", list);
    	   
       } else {
    	   BlueMembershipSearchVO searchVO = new BlueMembershipSearchVO();
           ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
    	   if ( !"null".equals((String)params.get("sBlueMembershipJoinDtFrom")) && params.get("sBlueMembershipJoinDtFrom") != null  ) {
               searchVO.setsBlueMembershipJoinDtFrom(DateUtil.convertToDate((String)params.get("sBlueMembershipJoinDtFrom")));
           }
           if ( !"null".equals((String)params.get("sBlueMembershipJoinDtTo")) && params.get("sBlueMembershipJoinDtTo") != null ) {
               searchVO.setsBlueMembershipJoinDtTo(DateUtil.convertToDate((String)params.get("sBlueMembershipJoinDtTo")));
           }

           List<BlueMembershipJoinVO> list = selectBlueMembershipByCondition(searchVO);
           context.putVar("items", list);
       }
        
    }

}