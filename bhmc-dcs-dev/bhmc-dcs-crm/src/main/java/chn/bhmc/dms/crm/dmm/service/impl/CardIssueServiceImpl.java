package chn.bhmc.dms.crm.dmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.dmm.service.CardIssueService;
import chn.bhmc.dms.crm.dmm.service.MembershipCardService;
import chn.bhmc.dms.crm.dmm.service.MembershipPointHisService;
import chn.bhmc.dms.crm.dmm.service.dao.CardIssueDAO;
import chn.bhmc.dms.crm.dmm.vo.CardIssueSearchVO;
import chn.bhmc.dms.crm.dmm.vo.CardIssueVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipCardVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipPointHisVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CardIssueServiceImpl.java
 * @Description : 카드발급 이력 구현체
 * @author Kim Hyun Ho
 * @since 2016. 5. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 12.     Kim Hyun Ho     최초 생성
 * </pre>
 */
@Service("cardIssueService")
public class CardIssueServiceImpl extends HService implements CardIssueService{

    /**
     * 카드발급 관리 DAO
     */
    @Resource(name="cardIssueDAO")
    CardIssueDAO cardIssueDAO;

    /**
     * 멤버십 이력 서비스
     */
    @Resource(name="membershipPointHisService")
    MembershipPointHisService membershipPointHisService;

    /**
     * 멤버십 카드 서비스
     */
    @Resource(name="membershipCardService")
    MembershipCardService membershipCardService;

    /*
     * @see chn.bhmc.dms.crm.dmm.service.CardIssueService#insertCardIssue(chn.bhmc.dms.crm.dmm.vo.MembershipVO)
     */
    @Override
    public int insertCardIssue(CardIssueVO cardIssueVO) throws Exception {
        return cardIssueDAO.insertCardIssue(cardIssueVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.CardIssueService#insertCardIssue(chn.bhmc.dms.crm.dmm.vo.MembershipVO)
     */
    @Override
    public int insertRechargeCardIssue(CardIssueVO cardIssueVO) throws Exception {

        //멤버십카드 에서 실물 또는 가상카드 번호가 등록되어 있는지 확인
        if (StringUtils.isEmpty(cardIssueVO.getDlrCd())){cardIssueVO.setDlrCd(LoginUtil.getDlrCd());}
        MembershipCardVO mcVO = membershipCardService.selectMembershipCardByKey(cardIssueVO.getDlrCd(), cardIssueVO.getCardTpCd(), cardIssueVO.getCardNo());

        if(mcVO != null){
            int result = 0;
            //카드발급이력에 등록
            result = cardIssueDAO.insertCardIssue(cardIssueVO);

            if(result > 0){

                MembershipPointHisVO hisVO = new MembershipPointHisVO();
                hisVO.setDlrCd(cardIssueVO.getDlrCd());
                hisVO.setMembershipNo(cardIssueVO.getMembershipNo());
                hisVO.setCardTpCd(cardIssueVO.getCardTpCd());
                hisVO.setCardNo(cardIssueVO.getCardNo());
                hisVO.setOccrPointVal(cardIssueVO.getOccrPointVal());
                hisVO.setRealTotAmt(cardIssueVO.getOccrPointVal());
                if (StringUtils.isEmpty(cardIssueVO.getExtcTargYn())){hisVO.setExtcTargYn("Y");}
                hisVO.setPointTp("+");

                //입력한 충전금액 등록
                result = membershipPointHisService.insertRechargeAmt(hisVO);
            }
            return result;
        }else{
            //등록이 불가능 합니다.
            throw processException("crm.err.noCardReg");
        }
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.CardIssueService#selectCardIssueByKey(java.lang.String, java.lang.String, java.lang.String)
     */
    @Override
    public CardIssueVO selectCardIssueByKey(CardIssueSearchVO cardIssueSearchVO) throws Exception {
        return cardIssueDAO.selectCardIssueByKey(cardIssueSearchVO) ;
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipCardService#selectMembershipCardHissByConditionCnt(chn.bhmc.dms.crm.dmm.vo.MembershipCardSearchVO)
     */
    @Override
    public int selectCardHissByConditionCnt(CardIssueSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return cardIssueDAO.selectCardHissByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipCardService#selectMembershipCardHissByCondition(chn.bhmc.dms.crm.dmm.vo.MembershipCardSearchVO)
     */
    @Override
    public List<CardIssueVO> selectCardHissByCondition(CardIssueSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return cardIssueDAO.selectCardHissByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.CardIssueService#selectRechargeCardsByConditionCnt(chn.bhmc.dms.crm.dmm.vo.CardIssueSearchVO)
     */
    @Override
    public int selectRechargeCardsByConditionCnt(CardIssueSearchVO searchVO) throws Exception {
        // TODO Auto-generated method stub
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return cardIssueDAO.selectRechargeCardsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.CardIssueService#selectRechargeCardsByCondition(chn.bhmc.dms.crm.dmm.vo.CardIssueSearchVO)
     */
    @Override
    public List<CardIssueVO> selectRechargeCardsByCondition(CardIssueSearchVO searchVO) throws Exception {
        // TODO Auto-generated method stub
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return cardIssueDAO.selectRechargeCardsByCondition(searchVO);
    }

}
