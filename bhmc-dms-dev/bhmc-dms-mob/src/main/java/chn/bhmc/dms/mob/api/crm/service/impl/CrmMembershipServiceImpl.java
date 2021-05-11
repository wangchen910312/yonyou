package chn.bhmc.dms.mob.api.crm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.dmm.service.CardIssueService;
import chn.bhmc.dms.crm.dmm.service.MembershipGradeChgService;
import chn.bhmc.dms.crm.dmm.service.MembershipGradeHisService;
import chn.bhmc.dms.crm.dmm.service.MembershipPointHisService;
import chn.bhmc.dms.crm.dmm.service.SpecialPointService;
import chn.bhmc.dms.mob.api.crm.dao.CrmMembershipDAO;
import chn.bhmc.dms.mob.api.crm.service.CrmMembershipService;
import chn.bhmc.dms.mob.api.crm.vo.MembershipSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.MembershipVO;
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

@Service("CrmmembershipService")
public class CrmMembershipServiceImpl extends HService implements CrmMembershipService{

    /**
     * 멤버십 관리 DAO
     */
    @Resource(name="CrmmembershipDAO")
    CrmMembershipDAO CrmmembershipDAO;

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
     * 멤버십 등록된 목록수 조회
     * [20170603] 사용처 - [CRM:고객상세, 멤버십관리, 멤버십양도/양수등록 팝업], [판매:용품판매관리], [모바일:고객상세]
     * @param searchVO - 조회 조건을 포함하는 MembershipSearchVO
     * @return 조회 목록
     */
    @Override
    public int selectMembershipsByConditionCnt(MembershipSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        searchVO.setsMembershipStan(LoginUtil.getMembershipPolicy());

        return CrmmembershipDAO.selectMembershipsByConditionCnt(searchVO);
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

        return CrmmembershipDAO.selectMembershipsByCondition(searchVO);
    }

}