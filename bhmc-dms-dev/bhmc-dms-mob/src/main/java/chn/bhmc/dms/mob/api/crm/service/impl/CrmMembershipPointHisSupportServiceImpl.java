package chn.bhmc.dms.mob.api.crm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.crm.dao.CrmMembershipPointHisSupportDAO;
import chn.bhmc.dms.mob.api.crm.service.CrmMembershipPointHisSupportService;
import chn.bhmc.dms.mob.api.crm.vo.MembershipPointHisSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.MembershipPointHisVO;

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
@Service("CrmmembershipPointHisSupportService")
public class CrmMembershipPointHisSupportServiceImpl extends HService implements CrmMembershipPointHisSupportService{

    /**
     * 멤버십 포인트 히스토리 관리 DAO
     */
    @Resource(name="CrmmembershipPointHisSupportDAO")
    CrmMembershipPointHisSupportDAO CrmmembershipPointHisSupportDAO;

    /**
     * 멤버십 서비스
     */
    @Resource(name="CrmmembershipPointHisSupportService")
    CrmMembershipPointHisSupportService CrmmembershipPointHisSupportService;

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

        return CrmmembershipPointHisSupportDAO.selectPointHistorysByConditionCnt(searchVO);
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

        return CrmmembershipPointHisSupportDAO.selectPointHistorysByCondition(searchVO);
    }

}