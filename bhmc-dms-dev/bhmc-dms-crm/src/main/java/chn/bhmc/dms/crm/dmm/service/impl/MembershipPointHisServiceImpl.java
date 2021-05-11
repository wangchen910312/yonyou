package chn.bhmc.dms.crm.dmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.i18n.ReloadableDataSourceResourceBundleMessageSource;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.dmm.service.CardIssueService;
import chn.bhmc.dms.crm.dmm.service.MembershipPointHisService;
import chn.bhmc.dms.crm.dmm.service.MembershipPointHisSupportService;
import chn.bhmc.dms.crm.dmm.service.MembershipService;
import chn.bhmc.dms.crm.dmm.service.MembershipSupportService;
import chn.bhmc.dms.crm.dmm.service.dao.MembershipPointHisDAO;
import chn.bhmc.dms.crm.dmm.vo.MembershipPointHisSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipPointHisVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipPointHisServiceImpl.java
 * @Description : 멤버십 포인트 이력 구현 클래스
 * @author Kim Hyun Ho
 * @since 2016. 4. 5.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 5.     Kim Hyun Ho     최초 생성
 * </pre>
 */
@Service("membershipPointHisService")
public class MembershipPointHisServiceImpl extends HService implements MembershipPointHisService{

    /**
     * 멤버십 포인트 이력 DAO
     */
    @Resource(name="membershipPointHisDAO")
    MembershipPointHisDAO membershipPointHisDAO;

    /**
     * 설문 템플릿 관리 Support Service
     */
    @Resource(name="membershipPointHisSupportService")
    MembershipPointHisSupportService membershipPointHisSupportService;

    /**
     * 메시지 관리
     */
    @Resource(name="dataSourceMessageSource")
    ReloadableDataSourceResourceBundleMessageSource dataSourceMessageSource;

    /**
     * 시스템 설정 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 카드발급이력 서비스
     */
    @Resource(name="cardIssueService")
    CardIssueService cardIssueService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="membershipService")
    MembershipService membershipService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="membershipSupportService")
    MembershipSupportService membershipSupportService;

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipPointHisService#insertSpecialPoint(chn.bhmc.dms.crm.dmm.vo.MembershipPointHisVO)
     */
    @Override
    public String insertSpecialPoint(MembershipPointHisVO membershipPointHisVO) throws Exception {
        // TODO 특별포인트 뿐만 아니라 일반적인 포인트를 등록, 차감 할때 사용
        if (StringUtils.isEmpty(membershipPointHisVO.getRegUsrId())){membershipPointHisVO.setRegUsrId(LoginUtil.getUserId());}
        //멤버십 포인트 유효기간 setting
        membershipPointHisVO.setMembershipPointPeriod(LoginUtil.getMembershipPointPeriod()+"");//멤버십 포인트 유효기간

        if ( StringUtil.isEmpty(membershipPointHisVO.getDlrCd())
                || StringUtil.isEmpty(membershipPointHisVO.getMembershipNo())
                || StringUtil.isEmpty(membershipPointHisVO.getPointTp())
                || StringUtil.isEmpty(membershipPointHisVO.getPointCd())
                //|| StringUtil.isEmpty(membershipPointHisVO.getOccrPointVal())
                || StringUtil.isEmpty(membershipPointHisVO.getExtcTargYn())
                || membershipPointHisVO.getRealTotAmt() < 0
                || StringUtil.isEmpty(membershipPointHisVO.getCardTpCd())
                || StringUtil.isEmpty(membershipPointHisVO.getCardNo())
                || StringUtil.isEmpty(membershipPointHisVO.getPointTp())
                || StringUtil.isEmpty(membershipPointHisVO.getPrsnId())
        ) {
            // {포인트 정보}을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.info.pointInfo", null, LocaleContextHolder.getLocale())});
        }

        membershipPointHisSupportService.selectCallPoint(membershipPointHisVO);
        String result = membershipPointHisVO.getResult();
        return result;
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipPointHisService#updatePointProcedure(chn.bhmc.dms.crm.dmm.vo.MembershipPointHisVO)
     */
    @Override
    public int updatePointProcedure(MembershipPointHisVO membershipPointHisVO) throws Exception {
        //특별한 로직없이 프로시저만 호출하기 위해서 만듬(즉, 각 업무단의 Service에서  membershipPointHisVO를 가공하고 여기서 받아서 프로시저 태움)
        membershipPointHisVO.setMembershipPointPeriod(LoginUtil.getMembershipPointPeriod()+"");
        membershipPointHisSupportService.selectCallPoint(membershipPointHisVO);
        return 0;
    }

    /**
     * 멤버십 포인트 소멸 대상 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipPointHisSearchVO
     * @return
     */
    @Override
    public int selectMembershipPointExtsByConditionCnt(MembershipPointHisSearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return membershipPointHisDAO.selectMembershipPointExtsByConditionCnt(searchVO);
    }

    /**
     * 멤버십 포인트 소멸 대상 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipPointExtSearchVO
     * @return 조회 목록
     */
    @Override
    public List<MembershipPointHisVO> selectMembershipPointExtsByCondition(MembershipPointHisSearchVO searchVO) throws Exception {

        searchVO.setsLangCd(LoginUtil.getLangCd());
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return membershipPointHisDAO.selectMembershipPointExtsByCondition(searchVO);

    }

    /**
     * 멤버십 포인트 소멸 대상 목록 요약정보를 구한다
     * @param searchVO - 조회 조건을 포함하는 MembershipPointHisSearchVO
     * @return 포인트 소멸 대상 정보
     */
    @Override
    public MembershipPointHisVO selectMembershipPointExtTotalCnt(MembershipPointHisSearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return membershipPointHisDAO.selectMembershipPointExtTotalCnt(searchVO);
    }

}