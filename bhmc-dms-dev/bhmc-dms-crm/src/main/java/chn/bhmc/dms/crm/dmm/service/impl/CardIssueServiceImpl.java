package chn.bhmc.dms.crm.dmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.dmm.service.CardIssueService;
import chn.bhmc.dms.crm.dmm.service.MembershipPointHisService;
import chn.bhmc.dms.crm.dmm.service.MembershipPointHisSupportService;
import chn.bhmc.dms.crm.dmm.service.dao.CardIssueDAO;
import chn.bhmc.dms.crm.dmm.vo.CardIssueSearchVO;
import chn.bhmc.dms.crm.dmm.vo.CardIssueVO;
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
     * 멤버십 이력 서비스
     */
    @Resource(name="membershipPointHisSupportService")
    MembershipPointHisSupportService membershipPointHisSupportService;

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
    public int updateCardIssue(CardIssueVO cardIssueVO) throws Exception {
        return cardIssueDAO.updateCardIssue(cardIssueVO);
    }

    /**
     * 충전 카드 등록 및 금액 충전
     */
    @Override
    public int insertRechargeCardIssue(CardIssueVO cardIssueVO) throws Exception {

        //카드발급 이력에서 등록된 카드가 있는지여부 확인
        if (StringUtils.isEmpty(cardIssueVO.getDlrCd())){cardIssueVO.setDlrCd(LoginUtil.getDlrCd());}
        CardIssueSearchVO cardIssueSearchVO = new CardIssueSearchVO();
        cardIssueSearchVO.setsDlrCd(cardIssueVO.getDlrCd());
        cardIssueSearchVO.setsCardNo(cardIssueVO.getCardNo());
        if(cardIssueVO.getCardTpCd() == null || cardIssueVO.getCardTpCd() == ""){
            cardIssueSearchVO.setsCardTpCd("02");
        }else{
            cardIssueSearchVO.setsCardTpCd(cardIssueVO.getCardTpCd());
        }

        CardIssueVO ciVO = cardIssueDAO.selectCardIssueByKey(cardIssueSearchVO);

        if(ciVO == null){//등록된 카드가 없을경우
            int result = 0;

            //카드발급이력에 등록
            result = cardIssueDAO.insertCardIssue(cardIssueVO);

            if(result > 0){

                MembershipPointHisVO hisVO = new MembershipPointHisVO();
                hisVO.setDlrCd(cardIssueVO.getDlrCd());
                hisVO.setMembershipNo(cardIssueVO.getMembershipNo());
                if(cardIssueVO.getCardTpCd() == null || cardIssueVO.getCardTpCd() == ""){
                    hisVO.setCardTpCd("02");
                }else{
                    hisVO.setCardTpCd(cardIssueVO.getCardTpCd());
                }
                hisVO.setCardNo(cardIssueVO.getCardNo());
                hisVO.setOccrPointVal(cardIssueVO.getOccrPointVal());
                hisVO.setPointCd(cardIssueVO.getPointCd());

                membershipPointHisSupportService.insertRechargeAmtProc(hisVO);
            }
            return result;
        }else{
            //이미 등록된 카드입니다.
            throw processException("crm.btn.rchgUsedCardNo");
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
     * @see chn.bhmc.dms.crm.dmm.service.CardIssueService#selectTransCardsByCondition(chn.bhmc.dms.crm.dmm.vo.CardIssueSearchVO)
     */
    @Override
    public List<CardIssueVO> selectTransCardsByCondition(CardIssueSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return cardIssueDAO.selectTransCardsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.CardIssueService#selectTransCardsByConditionCnt(chn.bhmc.dms.crm.dmm.vo.CardIssueSearchVO)
     */
    @Override
    public int selectTransCardsByConditionCnt(CardIssueSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return cardIssueDAO.selectTransCardsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.CardIssueService#selectTrsfCardNoByCondition(chn.bhmc.dms.crm.dmm.vo.CardIssueSearchVO)
     */
    @Override
    public List<CardIssueVO> selectTrsfCardNoByCondition(CardIssueSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return cardIssueDAO.selectTrsfCardNoByCondition(searchVO);
    }

    /**
     * 포인트 카드번호 수량 확인
     * @param cardIssueSearchVO - sDlrCd, sCardTpCd(01), sCardNo
     * @return 등록된 카드번호 수량
     */
    @Override
    public int selectCardIssueByConditionCnt(CardIssueSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return cardIssueDAO.selectCardIssueByConditionCnt(searchVO);
    }

}
