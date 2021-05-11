package chn.bhmc.dms.crm.dmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfConsAndCopnRapVO;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoVO;
import chn.bhmc.dms.crm.dmm.service.BlueMembershipCalcSupportService;
import chn.bhmc.dms.crm.dmm.service.BlueMembershipInterfaceService;
import chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinSupportService;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipCalcVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfConsumeRapVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfCouponRapVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfInfoRapVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipIfParamVO;
import chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinVO;

/**insertAddMembersConsume
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BlueMembershipJoinSupportServiceImpl.java
 * @Description : 블루멤버십 가입신청 서비스 구현체
 * @author Lee In Moon
 * @since 2016.09.03.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.09.03.     Lee In Moon     최초 생성
 * </pre>
 */

@Service("blueMembershipJoinSupportService")
public class BlueMembershipJoinSupportServiceImpl extends HService implements BlueMembershipJoinSupportService{

    /**
     * 블루멤버십 이력 서비스
     */
    @Resource(name="blueMembershipCalcSupportService")
    BlueMembershipCalcSupportService blueMembershipCalcSupportService;

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


    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinService#selectMemberUserIntegralInfo(chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinVO)
     */
    @Override
    public BlueMembershipIfInfoRapVO selectMemberUserIntegralInfo(BlueMembershipJoinVO joinVO) throws Exception {
        /*1. 포인트 조회
         *Param : custNo
         *Return : mLevel (등급)
         *         , mLebelInvalidDate (회원유효기간)
         *         , point(가용포인트)
         *         , blueMembershipYN(BM여부)
         *         , isSuccess (true, false)
         */
        BlueMembershipIfInfoRapVO rapVO = new BlueMembershipIfInfoRapVO();
        if(StringUtils.isEmpty(joinVO.getCustNo())){
            rapVO.setIsSuccess(false);
            //{고객번호}은 필수입력사항입니다.
            rapVO.setMessage(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
            return rapVO;
        }
        CustomerInfoVO customerInfoVO = selectCustomerByCustNo(LoginUtil.getDlrCd(), joinVO.getCustNo());

        BlueMembershipIfParamVO paramVO = new BlueMembershipIfParamVO();
        if(customerInfoVO == null){
            rapVO.setIsSuccess(false);
            //{입력하신 고객번호화 일치하는 고객이 없습니다.
            rapVO.setMessage(messageSource.getMessage("crm.err.noCustNo", null, LocaleContextHolder.getLocale()));
            return rapVO;
        }else{
            paramVO.setIdentityNumber(customerInfoVO.getSsnCrnNo());    //증거번호
            paramVO.setVin(joinVO.getVin());//vin 번호
            // 블루멤버십 포인트 조회
            rapVO = blueMembershipInterfaceService.selectMemberUserIntegralInfo(paramVO);

            if( rapVO != null ) {
                if(rapVO.getIsSuccess() && "Y".equals(rapVO.getData().getBlueMembershipYN())){
                    //블루멤버십 남은 포인트 수정
                    CustomerInfoVO customerInfoVOBlue = new CustomerInfoVO();
                    customerInfoVOBlue.setCustNo(customerInfoVO.getCustNo());                   //고객번호
                    customerInfoVOBlue.setDlrCd(customerInfoVO.getDlrCd());                     //딜러코드
                    customerInfoVOBlue.setBlueAvlbPointVal(rapVO.getData().getPoint());          //남은포인트
                    customerInfoVOBlue.setBlueMembershipNo(rapVO.getData().getBlueMembershipNo());
                    customerInfoVOBlue.setBlueMembershipId(rapVO.getData().getBlueMembershipId());
                    customerInfoVOBlue.setBlueMembershipJoinDt(rapVO.getData().getRegDt());//rapVO.getData().getRegDt();
                    customerInfoVOBlue.setBlueGradeNm(rapVO.getData().getmLevel());//BM 회원등급
                    customerInfoVOBlue.setBlueGradeChgDt(rapVO.getData().getmLevelBeginDate());
                    customerInfoVOBlue.setBlueLoginId(rapVO.getData().getUserName()); // BM 사이트 로그인 아이디
                    customerInfoOutBoundService.updateBlueMemberCustomer(customerInfoVOBlue);
                }
            }
            return rapVO;
        }
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinService#insertAddMembersConsume(chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinVO)
     */
    @Override
    public BlueMembershipIfConsumeRapVO insertAddMembersConsume(BlueMembershipJoinVO joinVO) throws Exception {
        /*2. 포인트 적립&사용
         * Param : custNo
         *    , vin (VIN 번호)
         *    , consumeType(0:사고차 수리(보통), 1:첫 정비, 2:차량구매, 3:정기정비, 8:판금)
         *    , consumePoints(사용포인트)
         *    , totalCost (총 비용)
         * Return : point ( 가용포인트 )
         *    , pointSeq ( 적립포인트 )
         *    , isSuccess (true, false)
         */

        BlueMembershipIfConsumeRapVO rapVO =  new BlueMembershipIfConsumeRapVO();
        if(StringUtils.isBlank(joinVO.getCustNo())){
            rapVO.setIsSuccess(false);
            //{고객번호}은 필수입력사항입니다.
            rapVO.setMessage(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
            return rapVO;
        }
//        if(joinVO.getVin().equals("")){   이전까지는 VIN 번호 필수였다가 20170401 삭제
//            rapVO.setIsSuccess(false);
//            //{VIN번호}은 필수입력사항입니다.
//            rapVO.setMessage(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("global.lbl.vinNo", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
//            return rapVO;
//        }
        if(StringUtils.isBlank(joinVO.getConsumeType())){//(0:사고차 수리(보통), 1:첫 정비, 2:차량구매, 3:정기정비, 8:판금, 9:부품, 10:용품)
            rapVO.setIsSuccess(false);
            //{수리유형}은 필수입력사항입니다.
            rapVO.setMessage(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("crm.lbl.consumeType", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
            return rapVO;
        }
        if(StringUtils.isBlank(joinVO.getConsumePoints())){
            rapVO.setIsSuccess(false);
            //{소비포인트}은 필수입력사항입니다.
            rapVO.setMessage(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("crm.lbl.consumePoints", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
            return rapVO;
        } else {
            if ( !StringUtils.isNumeric(joinVO.getConsumePoints()) ) {
                rapVO.setIsSuccess(false);
                //{소비포인트}은(는) 정수 이여야만 합니다.
                rapVO.setMessage(messageSource.getMessage("crm.info.intCheck", new String[]{messageSource.getMessage("crm.lbl.consumePoints", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
                return rapVO;
            };
        }
        if(StringUtils.isBlank(joinVO.getTotalCost())){
            rapVO.setIsSuccess(false);
            //{총비용}은 필수입력사항입니다.
            rapVO.setMessage(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("crm.lbl.totalCost", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
            return rapVO;
        }

        CustomerInfoVO customerInfoVO = selectCustomerByCustNo (LoginUtil.getDlrCd(), joinVO.getCustNo());
        BlueMembershipIfParamVO paramVO = new BlueMembershipIfParamVO();
        if(customerInfoVO == null){
            rapVO.setIsSuccess(false);
            //{입력하신 고객번호와 일치하는 고객이 없습니다.
            rapVO.setMessage(messageSource.getMessage("crm.err.noCustNo", null, LocaleContextHolder.getLocale()));
            return rapVO;
        }
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
        java.util.Date nowDate = new java.util.Date();

        //I/F 파라미터 셋팅
        paramVO.setIdentityNumber(customerInfoVO.getSsnCrnNo());    //증거번호
        paramVO.setPhoneNumber(customerInfoVO.getHpNo());           //핸드폰번호
        paramVO.setDealerId(customerInfoVO.getDlrCd());             //딜러코드
        paramVO.setConsumeType(joinVO.getConsumeType());            //소비 유형(0:사고차 수리(보통), 1:첫 정비, 2: 차량 구매, 3: 정기 정비, 8:판금 )
        paramVO.setConsumePoints(joinVO.getConsumePoints());        //소비 포인트 ( 적립인 경우 값을 0 )
        paramVO.setTotalCost(joinVO.getTotalCost());                //총 비용 ( 할인 전  )
        paramVO.setPaymentCost(joinVO.getPaymentCost());            //총 지불비용 ( 할인 후 )
        paramVO.setOperatorDate(sdf.format(nowDate));               //입력날짜(yyyyMMddHHmmss)
        paramVO.setConsumeDate(sdf.format(nowDate));                //소비시간(yyyyMMddHHmmss)
        paramVO.setVin(joinVO.getVin());                            //vin번호
        paramVO.setOperator(LoginUtil.getUserId());                 //입력인 id
        if(StringUtils.isNotBlank(joinVO.getRoDocNo())){            //소비번호
            paramVO.setUseNum(joinVO.getRoDocNo());
        }else if(StringUtils.isNotBlank(joinVO.getContractNo())){
            paramVO.setUseNum(joinVO.getContractNo());
        }

        //[필수] 위 인터페이스용 data말고도  블루멤버십 이력때문에 DLR_CD, BLUE_MEMBERSHIP_NO, CUST_NO 이 세가지는 무조건 필수이다.
        rapVO = blueMembershipInterfaceService.insertAddMembersConsume(paramVO);

        if(rapVO.getIsSuccess()){
            BlueMembershipCalcVO calcVO = new BlueMembershipCalcVO();
            //멤버십 포인트 적립
            calcVO.setDlrCd(LoginUtil.getDlrCd());                      //딜러코드
            calcVO.setCustNo(joinVO.getCustNo());                       //고객번호
            calcVO.setBlueMembershipNo(customerInfoVO.getBlueMembershipNo());   //블루멤버십 번호--???? 없을수도 있는데
            calcVO.setPrsnDeptNm("");                                   //발생부서
            calcVO.setPrsnId(LoginUtil.getUserId());                    //담당자ID
            calcVO.setRegUsrId(LoginUtil.getUserId());                  //등록자ID
            calcVO.setRoDocNo(joinVO.getRoDocNo());                     //RO 번호
            calcVO.setContractNo(joinVO.getContractNo());               //계약 번호
            calcVO.setOccrPointVal(Integer.parseInt(paramVO.getConsumePoints()));       // 발생 포인트 비용
            calcVO.setLastPointVal(Integer.parseInt(rapVO.getData().getPoint()));       // 최종 포인트
            calcVO.setAccuPointVal(Integer.parseInt(rapVO.getData().getAddPoint()));    // 적립 포인트
            calcVO.setTotAmt(Double.parseDouble(joinVO.getPaymentCost()));              // 총 지불비용 ( 할인 후 )
            calcVO.setPointCd(paramVO.getConsumeType());
            calcVO.setOrderNo(rapVO.getData().getConsumeNo());
            calcVO.setOccrPointCost(Double.valueOf(joinVO.getConsumePointsCost()));     // 발생 포인트 비용
            calcVO.setPointTp("-");

            //발생일자(occrDt)는 파라미터 데이터 형식이(yyyyMMddHHmmss)넘어오는데 짤라서 날짜형으로 맞추기보단 DB에서 SYSDATA로 해결함
            blueMembershipCalcSupportService.insertBlueMembershipHis(calcVO);

            //블루멤버십 남은 포인트 수정
            /*
            //  2018.01.09 : CR_0101T JDBC-12032:Deadlock detected. 에러 가 종종 발생.
            //  일배치 등으로 최종 포인트가 적용 되므로, 실시간 적용은 임시적으로 막음.
            CustomerInfoVO customerInfoVOBM = new CustomerInfoVO();
            customerInfoVOBM.setCustNo(joinVO.getCustNo());                   //고객번호
            customerInfoVOBM.setDlrCd(LoginUtil.getDlrCd());                  //딜러코드
            customerInfoVOBM.setBlueAvlbPointVal(rapVO.getData().getPoint()); //남은포인트
            customerInfoVOBM.setUpdtUsrId(LoginUtil.getUserId());//수정자ID
            customerInfoOutBoundService.updateBlueMemberCustomer(customerInfoVOBM);
            */
        }

        return rapVO;
    }


    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinService#selectCustomCardCodeInfoByDMSInfo(chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinVO)
     */
    @Override
    public BlueMembershipIfCouponRapVO selectCustomCardCodeInfoByDMSInfo(BlueMembershipJoinVO joinVO) throws Exception {
        /*3. 쿠폰 사용 여부 조회
         * Param : custNo
         *    , vin (VIN 번호)
         *    , cardType (쿠폰유형)
         *    , cardNo (쿠폰번호)
         *  Return : ifResult (사용여부 S / F )
         *    , msg ( 사용불가능 원인 )
         *    , isSuccess (true, false)
         */

        BlueMembershipIfCouponRapVO couponRapVO = new BlueMembershipIfCouponRapVO();
        //I/F 파라미터 셋팅(파라미터로 custNo가 넘어오면 ssnCrnNo를 조회한다.)
        if(StringUtils.isBlank(joinVO.getCustNo())){
            couponRapVO.setIsSuccess(false);
            //{고객번호}은 필수입력사항입니다.
            couponRapVO.setMessage(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
            return couponRapVO;
        }
        if(StringUtils.isBlank(joinVO.getVin())){
            couponRapVO.setIsSuccess(false);
            //{VIN번호}은 필수입력사항입니다.
            couponRapVO.setMessage(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("global.lbl.vinNo", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
            return couponRapVO;
        }
        if(StringUtils.isBlank(joinVO.getCardNo())){
            couponRapVO.setIsSuccess(false);
            //{카드번호}은 필수입력사항입니다.
            couponRapVO.setMessage(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("crm.lbl.cupnNo", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
            return couponRapVO;
        } else {
            // 20170708 쿠폰번호 대문자로 변경. 정비 요청.
            joinVO.setCardNo(joinVO.getCardNo().toUpperCase());
        };

        CustomerInfoVO customerInfoVO = selectCustomerByCustNo (LoginUtil.getDlrCd(), joinVO.getCustNo());
        if(customerInfoVO == null){
            couponRapVO.setIsSuccess(false);
            //{입력하신 고객번호와 일치하는 고객이 없습니다.
            couponRapVO.setMessage(messageSource.getMessage("crm.err.noCustNo", null, LocaleContextHolder.getLocale()));
            return couponRapVO;
        }

        //I/F 파라미터 셋팅
        BlueMembershipIfParamVO paramVO = new BlueMembershipIfParamVO();
        paramVO.setDealerId(customerInfoVO.getDlrCd());      //딜러코드
        paramVO.setIdentityNumber(customerInfoVO.getSsnCrnNo());//증거번호
        paramVO.setCardNo(joinVO.getCardNo());          //쿠폰유형 인증번호
        paramVO.setVin(joinVO.getVin());                //Vin번호

        couponRapVO = blueMembershipInterfaceService.selectCustomCardCodeInfoByDMSInfo(paramVO);

        return couponRapVO;
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinService#updateUserAwardCustomCardInfo(chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinVO)
     */
    @Override
    public BlueMembershipIfCouponRapVO updateUserAwardCustomCardInfo(BlueMembershipJoinVO joinVO) throws Exception {
        /*4. 쿠폰 사용
         * Param : custNo - 필수
         *    , vin (VIN 번호) - 필수
         *    , cardNo (쿠폰번호) - 필수
         *    , cardType (쿠폰유형)
         *    , carcategory (차형)
         *    , mileAge (주행거리)
         *  Return : ifResult (사용여부 S / F )
         *    , msg ( 사용불가능 원인 )
         *    , isSuccess (true, false)
         */

        BlueMembershipIfCouponRapVO couponRapVO = new BlueMembershipIfCouponRapVO();
        //I/F 파라미터 셋팅(파라미터로 custNo가 넘어오면 ssnCrnNo를 조회한다.)
        if(StringUtils.isBlank(joinVO.getCustNo())){
            couponRapVO.setIsSuccess(false);
            //{고객번호}은 필수입력사항입니다.
            couponRapVO.setMessage(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
            return couponRapVO;
        }
        if(StringUtils.isBlank(joinVO.getCardNo())){
            couponRapVO.setIsSuccess(false);
            //{쿠폰번호}은 필수입력사항입니다.
            couponRapVO.setMessage(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("crm.lbl.cupnNo", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
            return couponRapVO;
        }
        if(StringUtils.isBlank(joinVO.getVin())){
            couponRapVO.setIsSuccess(false);
            //{VIN번호}은 필수입력사항입니다.
            couponRapVO.setMessage(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("global.lbl.vinNo", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
            return couponRapVO;
        }
//        if(StringUtils.isBlank(joinVO.getCarCategory())){
//            couponRapVO.setIsSuccess(false);
//            //{차형}은 필수입력사항입니다.
//            couponRapVO.setMessage(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("global.lbl.carLine", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
//            return couponRapVO;
//        }
//        if(StringUtils.isBlank(joinVO.getMileAge())){
//            couponRapVO.setIsSuccess(false);
//            //{주행거리}은 필수입력사항입니다.
//            couponRapVO.setMessage(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("crm.lbl.mileAge", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
//            return couponRapVO;
//        }

        CustomerInfoVO customerInfoVO = selectCustomerByCustNo (LoginUtil.getDlrCd(), joinVO.getCustNo());
        if(customerInfoVO == null){
            couponRapVO.setIsSuccess(false);
            //{입력하신 고객번호와 일치하는 고객이 없습니다.
            couponRapVO.setMessage(messageSource.getMessage("crm.err.noCustNo", null, LocaleContextHolder.getLocale()));
            return couponRapVO;
        }

        //I/F 파라미터 셋팅
        BlueMembershipIfParamVO paramVO = new BlueMembershipIfParamVO();
        paramVO.setDealerId(LoginUtil.getDlrCd());      //딜러코드
        paramVO.setIdentityNumber(customerInfoVO.getSsnCrnNo());//증거번호
        paramVO.setCardNo(joinVO.getCardNo());          //쿠폰유형 인증번호
        paramVO.setVin(joinVO.getVin());                //Vin번호
        paramVO.setCarCategory(joinVO.getCarCategory());//차형
        paramVO.setCustName(customerInfoVO.getCustNm());//이름
        paramVO.setMileAge(joinVO.getMileAge());        //주행거리
        paramVO.setUseNum(joinVO.getRoDocNo());         //소비번호

        couponRapVO = blueMembershipInterfaceService.updateUserAwardCustomCardInfo(paramVO);

        //TO-DO 쿠폰 사용이력 남겨야함.
        if(couponRapVO.getIsSuccess() && couponRapVO.getData().isUseStat()){
            BlueMembershipCalcVO calcVO = new BlueMembershipCalcVO();
            //멤버십 포인트 적립
            calcVO.setDlrCd(LoginUtil.getDlrCd());                      //딜러코드
            calcVO.setCustNo(joinVO.getCustNo());                       //고객번호
            calcVO.setBlueMembershipNo(customerInfoVO.getBlueMembershipNo());   //블루멤버십 번호--???? 없을수도 있는데
            calcVO.setPrsnDeptNm("");                                   //발생부서
            calcVO.setPrsnId(LoginUtil.getUserId());                    //담당자ID
            calcVO.setRegUsrId(LoginUtil.getUserId());                  //등록자ID
            calcVO.setRoDocNo(joinVO.getRoDocNo());                     //RO 번호
            calcVO.setContractNo(joinVO.getContractNo());               //계약 번호

            calcVO.setCupnCertNo(paramVO.getCardNo());//쿠폰 번호
            calcVO.setVinNo(paramVO.getVin());//VIN 번호
            calcVO.setRunDistVal(Integer.parseInt(paramVO.getMileAge()));//주행거리
            calcVO.setCupnUseCost(joinVO.getCardConsumeCost());//쿠폰사용 금액
            calcVO.setCupnCost(joinVO.getCardCost());//쿠폰금액 TO-DO : 테이블에 넣을것.!

            //발생일자(occrDt)는 파라미터 데이터 형식이(yyyyMMddHHmmss)넘어오는데 짤라서 날짜형으로 맞추기보단 DB에서 SYSDATA로 해결함
            blueMembershipCalcSupportService.insertBlueMembershipCouponHis(calcVO);
        }

        return couponRapVO;
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

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinSupportService#updateBlueMembershipInfoSync(chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinSearchVO)
     */
    @Override
    public boolean updateBlueMembershipInfoSync() throws Exception {

        boolean syncResult = false;

        // 고객테이블 확인
        CustomerInfoSearchVO searchVO = new CustomerInfoSearchVO();
        if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getLangCd());}
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        searchVO.setsBlueMembershipJoinYn("Y");     // 블루멤버십 가입된 고객목록
        List<CustomerInfoVO> bmJoinList = customerInfoOutBoundService.selectCustomerListByCondition(searchVO);

        if ( bmJoinList.size() > 0 ) {

            for (CustomerInfoVO customerInfoVO : bmJoinList) {

                BlueMembershipJoinVO joinVO = new BlueMembershipJoinVO();

                joinVO.setCustNo(customerInfoVO.getCustNo());

                BlueMembershipIfInfoRapVO bmInfo = selectMemberUserIntegralInfo(joinVO);

                if ( !bmInfo.getIsSuccess() ) {

                    // TODO 싱크 실패.
                    return syncResult;

                } else {
                    syncResult = true;
                }

            }

        };

        return syncResult;

    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.BlueMembershipJoinSupportService#updateUseCardAndAddConsume(chn.bhmc.dms.crm.dmm.vo.BlueMembershipJoinVO)
     */
    @Override
    public BlueMembershipIfConsAndCopnRapVO updateUseCardAndAddConsume(BlueMembershipJoinVO joinVO) throws Exception {
        /*4. 쿠폰 사용
         * Param : custNo - 필수
         *    DealerId（필수）
         *    ConsumeType（필수）
         *    ConsumePoints（필수）
         *    PurchaseCost  （필수）
         *    TotalCost（필수）
         *    ConsumeDate（필수）
         *    PhoneNumber（필수）
         *    IdentityNumber（필수）
         *    CardNo（필수）
         *    Vin（필수）
         *    DMSOrderNo（필수）
         *    Operator（可为空）
         *    OperatorDate（可为空）
         *    CarCategory（可为空）
         *    CustName（可为空）
         *    MileAge（可为空）
         *  Return : ifResult (사용여부 S / F )
         *    msg ( 사용불가능 원인 )
         *    isSuccess (true, false)
         *    Data
         *      Point
         *      PointSeq
         *      Status
         *      ResultMsg
         */

        BlueMembershipIfConsAndCopnRapVO couponRapVO = new BlueMembershipIfConsAndCopnRapVO();
        //I/F 파라미터 셋팅(파라미터로 custNo가 넘어오면 ssnCrnNo를 조회한다.)
        if(StringUtils.isBlank(joinVO.getCustNo())){
            couponRapVO.setIsSuccess(false);
            //{고객번호}은 필수입력사항입니다.
            couponRapVO.setMessage(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
            return couponRapVO;
        }

        if(StringUtils.isBlank(joinVO.getConsumeType())){//(0:사고차 수리(보통), 1:첫 정비, 2:차량구매, 3:정기정비, 8:판금, 9:부품, 10:용품)
            couponRapVO.setIsSuccess(false);
            //{수리유형}은 필수입력사항입니다.
            couponRapVO.setMessage(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("crm.lbl.consumeType", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
            return couponRapVO;
        }

        if(StringUtils.isBlank(joinVO.getConsumePoints())){
            couponRapVO.setIsSuccess(false);
            //{소비포인트}은 필수입력사항입니다.
            couponRapVO.setMessage(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("crm.lbl.consumePoints", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
            return couponRapVO;
        } else {
            if ( !StringUtils.isNumeric(joinVO.getConsumePoints()) ) {
                couponRapVO.setIsSuccess(false);
                //{소비포인트}은(는) 정수 이여야만 합니다.
                couponRapVO.setMessage(messageSource.getMessage("crm.info.intCheck", new String[]{messageSource.getMessage("crm.lbl.consumePoints", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
                return couponRapVO;
            };
        }

        if(StringUtils.isBlank(joinVO.getPaymentCost())){   // 총 지불비용 ( 할인 후 )
            couponRapVO.setIsSuccess(false);
            //{수납금액}은 필수입력사항입니다.
            couponRapVO.setMessage(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("sal.lbl.payAmt", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
            return couponRapVO;
        }

        if(StringUtils.isBlank(joinVO.getTotalCost())){
            couponRapVO.setIsSuccess(false);
            //{총비용}은 필수입력사항입니다.
            couponRapVO.setMessage(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("crm.lbl.totalCost", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
            return couponRapVO;
        }

        // 소비시간 : 기본셋팅

        CustomerInfoVO customerInfoVO = selectCustomerByCustNo (LoginUtil.getDlrCd(), joinVO.getCustNo());
        if(customerInfoVO == null){
            couponRapVO.setIsSuccess(false);
            //{입력하신 고객번호와 일치하는 고객이 없습니다.
            couponRapVO.setMessage(messageSource.getMessage("crm.err.noCustNo", null, LocaleContextHolder.getLocale()));
            return couponRapVO;
        } else {
            if(StringUtils.isBlank(customerInfoVO.getHpNo())) {
                couponRapVO.setIsSuccess(false);
                //{총비용}은 필수입력사항입니다.
                couponRapVO.setMessage(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("global.lbl.hpNo", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
                return couponRapVO;
            }

            if(StringUtils.isBlank(customerInfoVO.getSsnCrnNo())) {
                couponRapVO.setIsSuccess(false);
                //{증서번호}은 필수입력사항입니다.
                couponRapVO.setMessage(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("global.lbl.ssnCrnNo", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
                return couponRapVO;
            }
        }

        if(StringUtils.isBlank(joinVO.getCardNo())){
            couponRapVO.setIsSuccess(false);
            //{쿠폰번호}은 필수입력사항입니다.
            couponRapVO.setMessage(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("crm.lbl.cupnNo", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
            return couponRapVO;
        }

        if(StringUtils.isBlank(joinVO.getVin())){
            couponRapVO.setIsSuccess(false);
            //{VIN번호}은 필수입력사항입니다.
            couponRapVO.setMessage(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("global.lbl.vinNo", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
            return couponRapVO;
        }

        if(StringUtils.isBlank(joinVO.getRoDocNo()) && StringUtils.isBlank(joinVO.getContractNo()) ) {
            couponRapVO.setIsSuccess(false);
            //{RO번호}은 필수입력사항입니다.
            couponRapVO.setMessage(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("ser.lbl.roDocNo", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
            return couponRapVO;
        }


        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
        java.util.Date nowDate = new java.util.Date();

        //I/F 파라미터 셋팅
        BlueMembershipIfParamVO paramVO = new BlueMembershipIfParamVO();
        paramVO.setDealerId(LoginUtil.getDlrCd());      //딜러코드
        paramVO.setConsumeType(joinVO.getConsumeType());            //소비 유형(0:사고차 수리(보통), 1:첫 정비, 2: 차량 구매, 3: 정기 정비, 8:판금 )
        paramVO.setConsumePoints(joinVO.getConsumePoints());        //소비 포인트 ( 적립인 경우 값을 0 )
        paramVO.setPaymentCost(joinVO.getPaymentCost());            //총 지불비용 ( 할인 후 )
        paramVO.setTotalCost(joinVO.getTotalCost());                //총 비용 ( 할인 전  )
        paramVO.setConsumeDate(sdf.format(nowDate));                //소비시간(yyyyMMddHHmmss)
        paramVO.setPhoneNumber(customerInfoVO.getHpNo());           //핸드폰번호
        paramVO.setOperator(LoginUtil.getUserId());                 //입력인 id
        paramVO.setOperatorDate(sdf.format(nowDate));               //입력날짜(yyyyMMddHHmmss)
        paramVO.setIdentityNumber(customerInfoVO.getSsnCrnNo());    //증거번호
        paramVO.setCardNo(joinVO.getCardNo());          //쿠폰유형 인증번호
        paramVO.setVin(joinVO.getVin());                //Vin번호
        paramVO.setCarCategory(joinVO.getCarCategory());//차형
        paramVO.setCustName(customerInfoVO.getCustNm());//이름
        paramVO.setMileAge(joinVO.getMileAge());        //주행거리
        if(StringUtils.isNotBlank(joinVO.getRoDocNo())){            //소비번호
            paramVO.setUseNum(joinVO.getRoDocNo());
        }else if(StringUtils.isNotBlank(joinVO.getContractNo())){
            paramVO.setUseNum(joinVO.getContractNo());
        }

        couponRapVO = blueMembershipInterfaceService.updateUseCardAndAddConsume(paramVO);

        BlueMembershipCalcVO calcVO = new BlueMembershipCalcVO();

        if(couponRapVO.getIsSuccess()){
            //멤버십 포인트 적립
            calcVO.setDlrCd(LoginUtil.getDlrCd());                      //딜러코드
            calcVO.setCustNo(joinVO.getCustNo());                       //고객번호
            calcVO.setBlueMembershipNo(customerInfoVO.getBlueMembershipNo());   //블루멤버십 번호--???? 없을수도 있는데
            calcVO.setPrsnDeptNm("");                                   //발생부서
            calcVO.setPrsnId(LoginUtil.getUserId());                    //담당자ID
            calcVO.setRegUsrId(LoginUtil.getUserId());                  //등록자ID
            calcVO.setRoDocNo(joinVO.getRoDocNo());                     //RO 번호
            calcVO.setContractNo(joinVO.getContractNo());               //계약 번호
            calcVO.setOccrPointVal(Integer.parseInt(paramVO.getConsumePoints()));       // 발생 포인트 비용
            calcVO.setLastPointVal(Integer.parseInt(couponRapVO.getData().getPoint()));       // 최종 포인트
            calcVO.setAccuPointVal(Integer.parseInt(couponRapVO.getData().getAddPoint()));    // 적립 포인트
            calcVO.setTotAmt(Double.parseDouble(joinVO.getPaymentCost()));              // 총 지불비용 ( 할인 후 )
            calcVO.setPointCd(paramVO.getConsumeType());
            calcVO.setOrderNo(couponRapVO.getData().getConsumeNo());
            calcVO.setOccrPointCost(Double.valueOf(joinVO.getConsumePointsCost()));     // 발생 포인트 비용
            calcVO.setPointTp("-");

            //발생일자(occrDt)는 파라미터 데이터 형식이(yyyyMMddHHmmss)넘어오는데 짤라서 날짜형으로 맞추기보단 DB에서 SYSDATA로 해결함
            blueMembershipCalcSupportService.insertBlueMembershipHis(calcVO);

            //쿠폰 사용이력 남겨야함.
            if(couponRapVO.getData().isUseStat()){
                calcVO.setCupnCertNo(paramVO.getCardNo());//쿠폰 번호
                calcVO.setVinNo(paramVO.getVin());//VIN 번호
                calcVO.setRunDistVal(Integer.parseInt(paramVO.getMileAge()));//주행거리
                calcVO.setCupnUseCost(joinVO.getCardConsumeCost());//쿠폰사용 금액
                calcVO.setCupnCost(joinVO.getCardCost());//쿠폰금액 TO-DO : 테이블에 넣을것.!

                //발생일자(occrDt)는 파라미터 데이터 형식이(yyyyMMddHHmmss)넘어오는데 짤라서 날짜형으로 맞추기보단 DB에서 SYSDATA로 해결함
                blueMembershipCalcSupportService.insertBlueMembershipCouponHis(calcVO);
            }

            //블루멤버십 남은 포인트 수정
            /*
            //  2018.01.09 : CR_0101T JDBC-12032:Deadlock detected. 에러 가 종종 발생.
            //  일배치 등으로 최종 포인트가 적용 되므로, 실시간 적용은 임시적으로 막음.
            CustomerInfoVO customerInfoVOBM = new CustomerInfoVO();
            customerInfoVOBM.setCustNo(joinVO.getCustNo());                   //고객번호
            customerInfoVOBM.setDlrCd(LoginUtil.getDlrCd());                  //딜러코드
            customerInfoVOBM.setBlueAvlbPointVal(couponRapVO.getData().getPoint()); //남은포인트
            customerInfoVOBM.setUpdtUsrId(LoginUtil.getUserId());//수정자ID
            customerInfoOutBoundService.updateBlueMemberCustomer(customerInfoVOBM);
            */
        }
        return couponRapVO;
    }

}