package chn.bhmc.dms.crm.dmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.cmp.service.DealerService;
import chn.bhmc.dms.cmm.cmp.vo.DealerVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.dmm.service.MembershipGradeMngSupportService;
import chn.bhmc.dms.crm.dmm.service.MembershipPointHisSupportService;
import chn.bhmc.dms.crm.dmm.service.MembershipSupportService;
import chn.bhmc.dms.crm.dmm.service.dao.MembershipPointHisSupportDAO;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeMngVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipPointHisSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipPointHisVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipPointHisSupportServiceImpl.java
 * @Description : 멤버십 포인트 이력 구현 클래스
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
@Service("membershipPointHisSupportService")
public class MembershipPointHisSupportServiceImpl extends HService implements MembershipPointHisSupportService{

    /**
     * 멤버십 포인트 히스토리 관리 DAO
     */
    @Resource(name="membershipPointHisSupportDAO")
    MembershipPointHisSupportDAO membershipPointHisSupportDAO;

    /**
     * 멤버십 서비스
     */
    @Resource(name="membershipSupportService")
    MembershipSupportService membershipSupportService;

    /**
     * 멤버십 서비스
     */
    @Resource(name="membershipPointHisSupportService")
    MembershipPointHisSupportService membershipPointHisSupportService;

    /**
     * 멤버십 등급 관리 서비스
     */
    @Resource(name="membershipGradeMngSupportService")
    MembershipGradeMngSupportService membershipGradeMngSupportService;



    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 딜러정보 서비스
     */
    @Resource(name="dealerService")
    DealerService dealerService;

    /**
     * 선불카드 사용 서비스
     *
     */
    @Override
    public String insertRechargeAmtProc(MembershipPointHisVO membershipPointHisVO) throws Exception {
        // TODO Auto-generated method stub
        membershipPointHisVO.setRegUsrId(LoginUtil.getUserId());
        //pointCd로 +인지, -인지 조회
        CommonCodeVO code = commonCodeService.selectCommonCodeByKey("CRM802",membershipPointHisVO.getPointCd());
        String pointTp = code.getRemark1();
        membershipPointHisVO.setPointTp(pointTp);
        membershipPointHisVO.setPrsnId(LoginUtil.getUserId());

        // TODO useTp / useNum validation 해야 하나?
        membershipPointHisSupportDAO.insertRechargeAmtProc(membershipPointHisVO);

        return  membershipPointHisVO.getResult();
    }

    /**
     *
     * 멤버십 카드별 가용 금액을 조회한다. ( 멤버십 양도/양수에서 사용 )
     *
     */
    @Override
    public MembershipPointHisVO selectRealTotAmtInfoByKey(MembershipPointHisSearchVO membershipPointHisSearchVO) throws Exception {

        if (StringUtils.isEmpty(membershipPointHisSearchVO.getsDlrCd())){membershipPointHisSearchVO.setsDlrCd(LoginUtil.getDlrCd());}
        MembershipPointHisVO result = new MembershipPointHisVO();
        if(StringUtil.nullConvert(membershipPointHisSearchVO.getsMembershipNo()).equals("")){
            result.setIsResult(false);
            //멤버십 번호은(는) 필수 입력사항 입니다.
            result.setResultMsg(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("global.lbl.membershipNo", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
            return result;
        }
        if(StringUtil.nullConvert(membershipPointHisSearchVO.getsCardNo()).equals("")){
            result.setIsResult(false);
            //카드번호은(는) 필수 입력사항 입니다.
            result.setResultMsg(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("crm.lbl.cardNo", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
            return result;
        }
        if(StringUtil.nullConvert(membershipPointHisSearchVO.getsCardTpCd()).equals("")){
            result.setIsResult(false);
            //카드종료(는) 필수 입력사항 입니다.
            result.setResultMsg(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("global.lbl.cardTpCd", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
            return result;
        }
        return membershipPointHisSupportDAO.selectRealTotAmtInfoByKey(membershipPointHisSearchVO);
    }

    /*  support
     * @see chn.bhmc.dms.crm.dmm.service.MembershipPointHisService#selectRealTotAmtInfoCondition(chn.bhmc.dms.crm.dmm.vo.MembershipPointHisSearchVO)
     */
    @Override
    public List<MembershipPointHisVO> selectRealTotAmtInfoCondition(MembershipPointHisSearchVO membershipPointHisSearchVO) throws Exception {
        if (StringUtils.isEmpty(membershipPointHisSearchVO.getsDlrCd())){membershipPointHisSearchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return membershipPointHisSupportDAO.selectRealTotAmtInfoCondition(membershipPointHisSearchVO);
    }


    /*  포인트 사용
     * @see chn.bhmc.dms.crm.dmm.service.MembershipPointHisService#insertPoint(chn.bhmc.dms.crm.dmm.vo.MembershipPointHisVO)
     */
    @Override
    public MembershipPointHisVO selectCallPointInterface(MembershipPointHisVO membershipPointHisVO) throws Exception {

        /*
         * [TODO] 1.포인트 사용시 양도,양수에서는 제한금액이 없다.(양도/양수 : 01, 특별포인트 : 02)
         */
        String limitPoint = LoginUtil.getMembershipPointUseMaxPoint()+"";//멤버십 포인트 상한치
        //pointCd로 +인지, -인지 조회
        CommonCodeVO code = commonCodeService.selectCommonCodeByKey("CRM802",membershipPointHisVO.getPointCd());
        String userId = LoginUtil.getUserId();
        membershipPointHisVO.setRegUsrId(userId);
        membershipPointHisVO.setPrsnId(userId);

        //파라미터로 들어온값 Validation Check
        MembershipPointHisVO result = new MembershipPointHisVO();
        if(StringUtil.nullConvert(membershipPointHisVO.getMembershipNo()).equals("")){
            result.setIsResult(false);
            //멤버십번호은(는) 필수 입력사항 입니다.
            result.setResultMsg(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("global.lbl.membershipNo", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
            return result;
        }
        if(StringUtil.nullConvert(membershipPointHisVO.getPointCd()).equals("")){
            result.setIsResult(false);
            //포인트코드은(는) 필수 입력사항 입니다.
            result.setResultMsg(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("global.lbl.pointCd", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
            return result;
        }
        if(membershipPointHisVO.getOccrPointVal() == 0){
            result.setIsResult(false);
            //발생포인트은(는) 필수 입력사항 입니다.
            result.setResultMsg(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("global.lbl.arPoint", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
            return result;
        }
        if(StringUtil.nullConvert(membershipPointHisVO.getCardNo()).equals("")){
            result.setIsResult(false);
            //카드번호은(는) 필수 입력사항 입니다.
            result.setResultMsg(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("crm.lbl.cardNo", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
            return result;
        }

        if(StringUtil.nullConvert(membershipPointHisVO.getUseTp()).equals("")){
            result.setIsResult(false);
            // 사용처 은(는) 필수 입력사항 입니다.
            result.setResultMsg(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("crm.lbl.useModule", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
            return result;
        }
        if(StringUtil.nullConvert(membershipPointHisVO.getUseNum()).equals("")){
            result.setIsResult(false);
            // 송장번호 은(는) 필수 입력사항 입니다.
            result.setResultMsg(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("crm.lbl.useNumber", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
            return result;
        }

        String pointTp = code.getRemark1();
        if(pointTp.equals("-")){//포인트코드(pointCd)의 값으로 공통코드를 조회 했을때 remark1값이 -일 경우
            //최대 사용 포인트 상한치 적용 ( 포인트 교환(용품) - 에서 사용할경우는 max 체크 안한다 )
            if("Y".equals(membershipPointHisVO.getPointMaxChk()) && membershipPointHisVO.getOccrPointVal() > Integer.parseInt(limitPoint)){
                result.setIsResult(false);
                //최대 사용할 수 있는 포인트는 {0}점 입니다.
                result.setResultMsg(messageSource.getMessage("crm.err.limitPointOver", new String[]{limitPoint}, LocaleContextHolder.getLocale()));
                return result;
            }

            MembershipSearchVO searchVO = new MembershipSearchVO();
            searchVO.setsDlrCd(membershipPointHisVO.getDlrCd());
            searchVO.setsMembershipNo(membershipPointHisVO.getMembershipNo());
            searchVO.setsCardTpCd("01");//카드 유형 01:포인트, 02:충전

            MembershipVO pointInfo = membershipSupportService.selectMembershipInfoByKey(searchVO);
            double totPoint = 0.0;
            if(pointInfo != null){
                totPoint = pointInfo.getLastPointVal();
            }
            if(totPoint < membershipPointHisVO.getOccrPointVal()){
                result.setIsResult(false);
                //잔여포인트가 없거나 부족합니다.
                result.setResultMsg(messageSource.getMessage("crm.err.lowPoint", new String[]{limitPoint}, LocaleContextHolder.getLocale()));
                return result;
            }

            membershipPointHisVO.setDlrCd(LoginUtil.getDlrCd());//딜러코드
            membershipPointHisVO.setPointTp(pointTp); //포인트 타입
            membershipPointHisVO.setExtcTargYn("N"); // 소멸대상여부
            membershipPointHisVO.setExtcTargPointVal(membershipPointHisVO.getOccrPointVal());//소멸대상포인트값
            membershipPointHisVO.setOccrPointVal(membershipPointHisVO.getOccrPointVal());//발생포인트값
            membershipPointHisVO.setCardTpCd("01"); //카드유형코드
            selectCallPoint(membershipPointHisVO);

            if ( "00".equals(membershipPointHisVO.getResult()) ) {
                result.setIsResult(true);
            } else {
                result.setIsResult(false);
            }

        }else if(pointTp.equals("+")){
            membershipPointHisVO.setDlrCd(LoginUtil.getDlrCd());//딜러코드
            membershipPointHisVO.setPointTp(pointTp); //포인트 타입
            membershipPointHisVO.setExtcTargYn("Y"); // 소멸대상여부
            membershipPointHisVO.setExtcTargPointVal(membershipPointHisVO.getOccrPointVal());//소멸대상포인트값
            membershipPointHisVO.setOccrPointVal(membershipPointHisVO.getOccrPointVal());//발생포인트값
            membershipPointHisVO.setCardTpCd("01"); //카드유형코드
            selectCallPoint(membershipPointHisVO);
            if ( "00".equals(membershipPointHisVO.getResult()) ) {
                result.setIsResult(true);
            } else {
                result.setIsResult(false);
            }
        }
            return result;

        //return membershipPointHisDAO.insertSpecialPoint(membershipPointHisVO);
    }

    /**
     * 포인트 취소 ( 예치금 사용 취소 / 포인트 사용 취소 / 포인트 적립 취소 )
     * @param MembershipPointHisSearchVO
     *
     * 필수 파라미터를 가지고 포인트 이력 테이블에서 조회후 취소처리 ( +/- 처리한다 )
     *
     * 멤버십 포인트 취소을 위한 필수 파람
     *  useTp                   -- 필수 / 전체 : 01 / 판매 : 02 / 정비 : 03 / 부품 : 04
     *  useNum                  -- 필수 / 정산번호 : 정비:roDocNo / 판매 : contractNo
     *  srcSub1                 -- 필수 / 정산 or 수납번호
     *  srcSub2                 -- 포인트 적립 취소 / 포인트 취소 [필수] / 예치금 취소시 [필요없음] / 라인번호
     *  srcSub3                 -- 포인트 적립 취소시 [필수] / 포인트 취소시 [필요없음] / 금액출처 (적립률 파라미터)
     *
     * @return String [정상:00 / 나머지는 실패]
     */

    @Override
    public MembershipPointHisVO cancelMembershipChargeInterface(MembershipPointHisSearchVO searchVO) throws Exception {

        MembershipPointHisVO resultHisVO = new MembershipPointHisVO();
        String result = "99";
        resultHisVO.setResult(result);

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        if ( StringUtils.isEmpty(searchVO.getsUseTp()) ) {
            // 사용처를 확인해주세요
            resultHisVO.setResult(result);
            resultHisVO.setResultMsg(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("crm.lbl.useModule", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
            return resultHisVO;
        }

        if ( StringUtils.isEmpty(searchVO.getsUseNum()) ) {
            // 송장번호를 확인해주세요
            resultHisVO.setResult(result);
            resultHisVO.setResultMsg(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("crm.lbl.useNumber", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
            return resultHisVO;
        }

        if ( StringUtils.isEmpty(searchVO.getsSrcSub1()) ) {
            // 취소정보를 확인해주세요
            resultHisVO.setResult(result);
            resultHisVO.setResultMsg(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("global.lbl.resvInfo", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
            return resultHisVO;
        }

        /**
         * 20161220 / 이인문 / 수정
         * 변경전 unique 한 정산 취소번호를 roDocNo에 넣었는데 수납으로 프로세스가 변경되면서 roDocNo가 unique 하지 않기 때문데
         * roDocNo로 조회하면 기존 수납/취소 목록들이 다 나온다.
         * 따라서 서비스에서 정산 취소시 아래 리스트는 조회 후 가장 최신 ROWNUM = 1을 가지고 온다.
         * 추후 n개의 멤버십 카드를 사용하게 되면 아래 로직 수정 ( unique 키를 받아야함  )
         *
         * 20170131 / 이인문 / 수정
         *  취소후 cancel_his_seq 입력
         *
         */
        List<MembershipPointHisVO>  membershipPointHisByKey = membershipPointHisSupportDAO.selectPointCancelHistorysByKey(searchVO);

        if ( membershipPointHisByKey.size() > 0 ) {

            String userId = LoginUtil.getUserId();
            for (MembershipPointHisVO membershipPointHisVO : membershipPointHisByKey) {

                //pointCd 로 취소 pointCd를 조회한다
                CommonCodeVO code = commonCodeService.selectCommonCodeByKey("CRM802",membershipPointHisVO.getPointCd());

                if (StringUtils.isNotBlank(code.getRemark4())) {
                    membershipPointHisVO.setPointCd(code.getRemark4());
                }else {
                    membershipPointHisVO.setPointCd("");
                }
                //--------- 여기까지 RO 정산번호를 가지고 취소할 대상 찾고 pointCd + 인 코드로 설정.

                // 정산번호 set
                membershipPointHisVO.setCancelHisSeq(membershipPointHisVO.getPointHisSeq());
                membershipPointHisVO.setRegUsrId(userId);

                if ( "01".equals(membershipPointHisVO.getCardTpCd()) ) {

                    // 포인트 사용 프로시저 호출.
                    selectCallPointInterface(membershipPointHisVO);
                    result = membershipPointHisVO.getResult();

                    if ( !"00".equals(result) ) {
                        resultHisVO.setResult("99");
                        return resultHisVO;

                    }

                } else if ( "02".equals(membershipPointHisVO.getCardTpCd()) ) {

                    // 멤버십 사용 프로시저 호출.
                    insertRechargeAmtProc(membershipPointHisVO);
                    result = membershipPointHisVO.getResult();

                    if ( !"00".equals(result) ) {
                        resultHisVO.setResult("99");
                        return resultHisVO;
                    }

                }

            }

        }else {
            // {취소} 정보가 없습니다.
            resultHisVO.setResult("99");
            resultHisVO.setResultMsg(messageSource.getMessage("crm.info.noinfoData", new String[]{messageSource.getMessage("global.lbl.cancel", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));

        }

        return resultHisVO;

    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipPointHisSupportService#selectCallPoint(chn.bhmc.dms.crm.dmm.vo.MembershipPointHisVO)
     */
    @Override
    public String selectCallPoint(MembershipPointHisVO membershipPointHisVO) throws Exception {

        membershipPointHisSupportDAO.selectCallPoint(membershipPointHisVO);

        return membershipPointHisVO.getResult();
    }

    /**
     * 멤버십 포인트이력 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipPointHisSearchVO
     * @return
     */
    @Override
    public int selectPointHistorysByConditionCnt(MembershipPointHisSearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if( StringUtils.isEmpty(searchVO.getsMembershipNo()) ){
            // [멤버십 번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.membershipNo", null, LocaleContextHolder.getLocale())});
        }
        if( StringUtils.isEmpty(searchVO.getsCardTpCd()) ){
            // [카드유형]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.cardType", null, LocaleContextHolder.getLocale())});
        }

        return membershipPointHisSupportDAO.selectPointHistorysByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 멤버십 포인트 이력 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipSearchVO
     * @return 조회 목록
     */
    @Override
    public List<MembershipPointHisVO> selectPointHistorysByCondition(MembershipPointHisSearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if( StringUtils.isEmpty(searchVO.getsMembershipNo()) ){
            // [멤버십 번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.membershipNo", null, LocaleContextHolder.getLocale())});
        }
        if( StringUtils.isEmpty(searchVO.getsCardTpCd()) ){
            // [카드유형]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.cardType", null, LocaleContextHolder.getLocale())});
        }

        return membershipPointHisSupportDAO.selectPointHistorysByCondition(searchVO);
    }


    /**
     * 멤버십 포인트 적립
     * @param searchVO - 조회 조건을 포함하는 MembershipPointHisVO
     *
     * 멤버십 포인트 적립을 위한 필수 파람
     *  membershipNo            -- 멤버십 번호
     *  useTp                   -- 필수 / 전체 : 01 / 판매 : 02 / 정비 : 03 / 부품 : 04
     *  useNum                  -- 필수 / 정산번호 : 정비:roDocNo / 판매 : contractNo / 부품 :
     *  srcSub3                 -- 금액출처 (적립률 파라미터)
     *  occrPointVal            -- 실 사용금액
     *
     *  선택 파람
     *  srcSub1                 -- 정산 or 수납번호
     *  srcSub2                 -- 라인번호
     *
     * @return 결과 코드
     */
    @Override
    public MembershipPointHisVO selectCallPointSaveInterface(MembershipPointHisVO membershipPointHisVO) throws Exception {

        membershipPointHisVO.setCardTpCd("01");
        membershipPointHisVO.setPointCd("17");      //포인트 적립

        if ( StringUtils.isEmpty(membershipPointHisVO.getMembershipNo()) ) {
            membershipPointHisVO.setIsResult(false);
            // 사용금액 출처 은(는) 필수 입력사항 입니다.
            membershipPointHisVO.setResultMsg(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("crm.info.srcSub3", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
            return membershipPointHisVO;
        };
        if(StringUtil.nullConvert(membershipPointHisVO.getUseTp()).equals("")){
            membershipPointHisVO.setIsResult(false);
            // 사용처 은(는) 필수 입력사항 입니다.
            membershipPointHisVO.setResultMsg(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("crm.lbl.useModule", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
            return membershipPointHisVO;
        }
        if(StringUtil.nullConvert(membershipPointHisVO.getUseNum()).equals("")){
            membershipPointHisVO.setIsResult(false);
            // 송장번호 은(는) 필수 입력사항 입니다.
            membershipPointHisVO.setResultMsg(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("crm.lbl.useNumber", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
            return membershipPointHisVO;
        }

        if ( StringUtils.isEmpty(membershipPointHisVO.getSrcSub3()) ) {
            membershipPointHisVO.setIsResult(false);
            // 사용금액 출처 은(는) 필수 입력사항 입니다.
            membershipPointHisVO.setResultMsg(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("crm.info.srcSub3", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
            return membershipPointHisVO;
        };

        Double occrPointVal = membershipPointHisVO.getOccrPointVal();
        membershipPointHisVO.setOccrPointCost(occrPointVal);

        if ( occrPointVal < 0 ) {
            membershipPointHisVO.setIsResult(false);
            // 사용금액을 확인해주세요
            membershipPointHisVO.setResultMsg(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("global.lbl.useAmt", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
            return membershipPointHisVO;
        };

        // 카드 번호를 구하기 위해 멤버십 상세정보를 조회한다.
        MembershipSearchVO searchVO = new MembershipSearchVO();
        searchVO.setsMembershipNo(membershipPointHisVO.getMembershipNo());
        MembershipVO membershipVO = membershipSupportService.selectMembershipInfoByKey(searchVO);
        if ( membershipVO != null ) {
            membershipPointHisVO.setCardNo(membershipVO.getCardNo());
        } else {
            membershipPointHisVO.setIsResult(false);
            // 카드번호은(는) 필수 입력사항 입니다.
            membershipPointHisVO.setResultMsg(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("crm.lbl.cardNo", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
            return membershipPointHisVO;
        }

        // 1. 금액 출처로 포인트 적립률을 조회한다.
        String srcSub3 = membershipPointHisVO.getSrcSub3();
        double pointAccuRate = 0.0;
        DealerVO dealerVO = dealerService.selectDealerByKey(searchVO.getsDlrCd());
        if ( dealerVO != null ) {
            if ( "RCPT_AMTS_RATE".equals(srcSub3) ) {           // 영수증 가격
                pointAccuRate = dealerVO.getRcptAmtsRate();
            } else if ( "GOODS_RATE".equals(srcSub3) ) {        // 용품
                pointAccuRate = dealerVO.getGoodsRate();
            } else if ( "INSURANCE_NEW_RATE".equals(srcSub3) ) {    // 보험(신규)
                pointAccuRate = dealerVO.getInsuranceNewRate();
            } else if ( "INSURANCE_EXTENDED_RATE".equals(srcSub3) ) {   // 보험 (연장)
                pointAccuRate = dealerVO.getInsuranceExtendedRate();
            } else if ( "FINC_RATE".equals(srcSub3) ) {                 // 금융 (수수료)
                pointAccuRate = dealerVO.getFincRate();
            } else if ( "EXECUTION_RATE".equals(srcSub3) ) {            // 대행
                pointAccuRate = dealerVO.getExecutionRate();
            } else if ( "REV_PARTS_RATE".equals(srcSub3) ) {            // 부품판매
                pointAccuRate = dealerVO.getRevPartsRate();
            } else if ( "GNL_RTE_RATE".equals(srcSub3) ) {      // RO유형-일반
                pointAccuRate = dealerVO.getGnlRteRate();
            } else if ( "WART_RTE_RATE".equals(srcSub3) ) {     // RO유형-보증
                pointAccuRate = dealerVO.getWartRteRate();
            } else if ( "INC_RTE_RATE".equals(srcSub3) ) {      // RO유형-보험현황
                pointAccuRate = dealerVO.getIncRteRate();
            } else if ( "INT_RTE_RATE".equals(srcSub3) ) {      // RO유형-내부
                pointAccuRate = dealerVO.getIntRteRate();
            } else if ( "RWRK_RTE_RATE".equals(srcSub3) ) {     // RO유형-리워크
                pointAccuRate = dealerVO.getRwrkRteRate();
            }

        }

        if ( pointAccuRate < 0 ) {

            membershipPointHisVO.setIsResult(false);
            // 포인트 적립률 은(는) 필수 입력사항 입니다.
            membershipPointHisVO.setResultMsg(messageSource.getMessage("global.info.required.field", new String[]{messageSource.getMessage("crm.lbl.pointAccuRate", null, LocaleContextHolder.getLocale())}, LocaleContextHolder.getLocale()));
            return membershipPointHisVO;

        }

        // 2. 포인트 적립포인트계수 가져오기
        searchVO.setsMembershipNo(membershipVO.getMembershipNo());
        MembershipGradeMngVO accuVO = membershipGradeMngSupportService.selectMembershipGradeInfoByKey(searchVO);

        if ( accuVO.getAccuRate() > 0 ) {

            double occrAccuVal;     // 포인트 적립금액
            double accuRate = accuVO.getAccuRate();

            // 3. 포인트 적립금 구하기
            occrAccuVal = occrPointVal * ( (pointAccuRate / 100) * (accuRate / 100) );

            // 4. 포인트 적립 ( 포인트 증가 프로시저 호출 ), 소수점 2자리에서 반올림. 0은 적립 안하기 때문에 0.50 이상인경우 만 적립프로세스 태운다.
            if ( occrAccuVal > 0.50 ) {

                membershipPointHisVO.setOccrPointVal(occrAccuVal);
                selectCallPointInterface(membershipPointHisVO);

            };

        };

        if ( "00".equals(membershipPointHisVO.getResult()) ) {
            membershipPointHisVO.setIsResult(true);
        } else {
            membershipPointHisVO.setIsResult(false);
        }

        return membershipPointHisVO;
    }

}