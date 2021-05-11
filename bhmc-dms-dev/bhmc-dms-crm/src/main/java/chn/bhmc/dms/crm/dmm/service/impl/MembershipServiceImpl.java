package chn.bhmc.dms.crm.dmm.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.crm.dmm.service.CardIssueService;
import chn.bhmc.dms.crm.dmm.service.MembershipGradeChgService;
import chn.bhmc.dms.crm.dmm.service.MembershipGradeHisService;
import chn.bhmc.dms.crm.dmm.service.MembershipPointHisService;
import chn.bhmc.dms.crm.dmm.service.MembershipService;
import chn.bhmc.dms.crm.dmm.service.SpecialPointService;
import chn.bhmc.dms.crm.dmm.service.dao.MembershipDAO;
import chn.bhmc.dms.crm.dmm.vo.CardIssueSearchVO;
import chn.bhmc.dms.crm.dmm.vo.CardIssueVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeHisVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipVO;
import egovframework.rte.fdl.cmmn.exception.FdlException;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipServiceImpl.java
 * @Description : 멤버십 서비스 구현 클래스
 * @author Kim Hyun Ho
 * @since 2016. 3. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 22.     Kim Hyun Ho     최초 생성
 * </pre>
 */

@Service("membershipService")
public class MembershipServiceImpl extends HService implements MembershipService , JxlsSupport{

    /**
     * 멤버십 관리 DAO
     */
    @Resource(name="membershipDAO")
    MembershipDAO membershipDAO;

    /**
     * 카드 발급이력 서비스
     */
    @Resource(name="cardIssueService")
    CardIssueService cardIssueService;

    /**
     * 멤버십 IdGen 서비스
     */
    @Resource(name="membershipNoIdgenService")
    EgovIdGnrService membershipNoIdgenService;

    /**
     * 멤버십 등급변경 서비스
     */
    @Resource(name="membershipGradeChgService")
    MembershipGradeChgService membershipGradeChgService;

    /**
     * 멤버십 등급이력 서비스
     */
    @Resource(name="membershipGradeHisService")
    MembershipGradeHisService membershipGradeHisService;

    /**
     * 멤버십  포인트이력 서비스
     */
    @Resource(name="membershipPointHisService")
    MembershipPointHisService membershipPointHisService;

    /**
     * 특별포인트 서비스
     */
    @Resource(name="specialPointService")
    SpecialPointService specialPointService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 멤버십 등록
     */
    @Override
    public int insertMembership(MembershipVO membershipVO) throws Exception {

            String userId = LoginUtil.getUserId();
            membershipVO.setRegUsrId(userId);

            if ( StringUtils.isEmpty(membershipVO.getPointYn()) ){
                membershipVO.setPointYn("N");
            }
            if ( StringUtils.isEmpty(membershipVO.getRechargeYn()) ){
                membershipVO.setRechargeYn("N");
            }

            CardIssueSearchVO searchVO = new CardIssueSearchVO();
            searchVO.setsDlrCd(membershipVO.getDlrCd());
            if(membershipVO.getCardTpCd() == null || membershipVO.getCardTpCd() == ""){
                searchVO.setsCardTpCd("01"); //01:포인트카드 , 02:충전카드
            }else{
                searchVO.setsCardTpCd(membershipVO.getCardTpCd());
            }
            searchVO.setsCardNo(membershipVO.getCardNo());

            if(membershipVO.getCardNo() != null && membershipVO.getCardNo() != "" ){
                // 등록된 포인트 카드 번호 조회
                int cardIssue = cardIssueService.selectCardIssueByConditionCnt(searchVO);

                if (cardIssue == 0) {
                    CardIssueVO cardIssueVO = new CardIssueVO();
                    cardIssueVO.setDlrCd(membershipVO.getDlrCd());
                    cardIssueVO.setMembershipNo(membershipVO.getMembershipNo());
                    cardIssueVO.setCardTpCd(membershipVO.getCardTpCd());
                    cardIssueVO.setCardNo(membershipVO.getCardNo());
                    cardIssueVO.setUseYn("Y");
                    cardIssueVO.setRegUsrId(userId);
                    cardIssueService.insertCardIssue(cardIssueVO);
                }else{
                    // 이미 등록된 카드입니다.
                    throw processException("global.info.alreadyCont", new String[]{messageSource.getMessage("global.lbl.pointCardNo", null, LocaleContextHolder.getLocale())});
                }

            }

            int result = membershipDAO.insertMembership(membershipVO);

            // 20160919 / 이인문 추가 / 멤버십 등록후 이력 테이블에 등록.
            if ( result == 1 ) {
                MembershipGradeHisVO membershipGradeHisVO = new MembershipGradeHisVO();
                membershipGradeHisVO.setDlrCd(LoginUtil.getDlrCd());
                membershipGradeHisVO.setMembershipNo(membershipVO.getMembershipNo());
                membershipGradeHisVO.setBefGradeCd(membershipVO.getBefGradeCd());
                membershipGradeHisVO.setAftGradeCd(membershipVO.getGradeCd());
                membershipGradeHisVO.setUseYn("Y");
                membershipGradeHisVO.setRegUsrId(userId);
                result += membershipGradeHisService.insertMembershipGradeHis(membershipGradeHisVO);
            }


            return result;

    }

    /**
     * 멤버십 수정
     */
    @Override
    public int updateMembership(MembershipVO membershipVO) throws Exception {
        String userId = LoginUtil.getUserId();
        String membershipNo = membershipVO.getMembershipNo();
        membershipVO.setUpdtUsrId(userId);

        MembershipSearchVO membershipSearchVO = new MembershipSearchVO();
        membershipSearchVO.setsMembershipNo(membershipNo);

        // 멤버십 번호로 멤버십 가입여부 체크.
        if ( selectMembershipsByConditionCnt(membershipSearchVO) < 1 ) {
            // {멤버십 번호}이(가) 없습니다.
            throw processException("global.info.emptyParamInfo", new String[]{messageSource.getMessage("global.lbl.membershipNo", null, LocaleContextHolder.getLocale())});
        }

        int result = 0;

        //카드번호가 존재하는지 조회
        CardIssueSearchVO searchVO = new CardIssueSearchVO();
        searchVO.setsDlrCd(membershipVO.getDlrCd());
        searchVO.setsCardTpCd(membershipVO.getCardTpCd());
        searchVO.setsCardNo(membershipVO.getCardNo());

        // 포인트 카드 번호가 변경되었으면....
        if (!membershipVO.getCardNo().equals(membershipVO.getBfCardNo())) {

            //멤버십 가입시 카드번호가 있으면 포인트카드는 등록또는 수정
            if(membershipVO.getCardNo() != null && membershipVO.getCardNo() != "" ){
                int cardIssue = cardIssueService.selectCardIssueByConditionCnt(searchVO);

                //포인트카드 조회시 등록된 카드가 없으면
                if (cardIssue == 0) {
                    CardIssueVO cardIssueVO = new CardIssueVO();
                    cardIssueVO.setDlrCd(membershipVO.getDlrCd());
                    cardIssueVO.setMembershipNo(membershipNo);
                    cardIssueVO.setCardTpCd(membershipVO.getCardTpCd());

                    if("01".equals(membershipVO.getCardTpCd())){
                        cardIssueVO.setUseYn("N");
                        cardIssueVO.setUpdtUsrId(userId);
                        cardIssueService.updateCardIssue(cardIssueVO);
                    }
                    cardIssueVO.setCardNo(membershipVO.getCardNo());
                    cardIssueVO.setUseYn("Y");
                    cardIssueVO.setRegUsrId(userId);
                    //멤버십 가입카드 이력 등록
                    cardIssueService.insertCardIssue(cardIssueVO);

                } else {
                    // 이미 등록된 카드입니다.
                    throw processException("crm.btn.rchgUsedCardNo");
                }

            }

        }

        result = membershipDAO.updateMembership(membershipVO);

        if(result > 0 && !(membershipVO.getGradeCd().equals(membershipVO.getBefGradeCd()))){
            MembershipGradeHisVO membershipGradeHisVO = new MembershipGradeHisVO();
            membershipGradeHisVO.setDlrCd(LoginUtil.getDlrCd());
            membershipGradeHisVO.setMembershipNo(membershipVO.getMembershipNo());
            membershipGradeHisVO.setBefGradeCd(membershipVO.getBefGradeCd());
            membershipGradeHisVO.setAftGradeCd(membershipVO.getGradeCd());
            membershipGradeHisVO.setUseYn("Y");
            membershipGradeHisVO.setRegUsrId(userId);
            membershipGradeHisService.insertMembershipGradeHis(membershipGradeHisVO);
        }

        return result;

    }

    /**
     * 멤버십 등록된 목록수 조회
     * [20170603] 사용처 - [CRM:고객상세, 멤버십관리, 멤버십양도/양수등록 팝업], [판매:용품판매관리], [모바일:고객상세]
     * @param searchVO - 조회 조건을 포함하는 MembershipSearchVO
     * @return 조회 목록
     */
    @Override
    public int selectMembershipsByConditionCnt(MembershipSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        searchVO.setsMembershipStan(LoginUtil.getMembershipPolicy());

        return membershipDAO.selectMembershipsByConditionCnt(searchVO);
    }

    /**
     * 멤버십 등록된 목록 조회
     * [20170603] 사용처 - [CRM:고객상세, 멤버십관리, 멤버십양도/양수등록 팝업], [판매:용품판매관리], [모바일:고객상세]
     * sListTarget :  T:멤버십양도양수팝업, 양도,양수에서는 sum데이터(금액 등) 을 볼필요가 없으므로 파라미터 받아서 분기처리
     * @param searchVO - 조회 조건을 포함하는 MembershipSearchVO
     * @return 조회 목록
     */
    @Override
    public List<MembershipVO> selectMembershipsByCondition(MembershipSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        searchVO.setsMembershipStan(LoginUtil.getMembershipPolicy());
        //会员管理功能 增加 会员类型展示值 为下载excel数据 贾明 2018-9-28 start
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
      //会员管理功能 增加 会员类型展示值 为下载excel数据 贾明 2018-9-28 end
        return membershipDAO.selectMembershipsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectNextPurcOrdNo()
     */
    @Override
    public String selectNextMembershipNo() throws Exception {
        try {
            return membershipNoIdgenService.getNextStringId();
        } catch (FdlException e) {
            //멤버십 번호를 생성할수 없기 때문에 입력해 주시기 바랍니다.
            throw processException("global.err.idgen", new String[]{messageSource.getMessage("crm.err.noMembershipNoCreate", null, LocaleContextHolder.getLocale())});
        }
    }

    /**
     * 会员管理下载excel 贾明 2018-9-28 
     */
	@Override
	public void initJxlsContext(Context context, HMap params) throws Exception {
		MembershipSearchVO searchVO = new MembershipSearchVO();
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
		List<MembershipVO>  list = selectMembershipsByCondition(searchVO);
		 context.putVar("items", list);
	}

}