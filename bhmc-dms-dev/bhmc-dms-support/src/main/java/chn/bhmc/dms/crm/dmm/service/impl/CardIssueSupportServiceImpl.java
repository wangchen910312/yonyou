package chn.bhmc.dms.crm.dmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.dmm.service.CardIssueSupportService;
import chn.bhmc.dms.crm.dmm.service.dao.CardIssueSupportDAO;
import chn.bhmc.dms.crm.dmm.vo.CardIssueSearchVO;
import chn.bhmc.dms.crm.dmm.vo.CardIssueVO;

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
@Service("cardIssueSupportService")
public class CardIssueSupportServiceImpl extends HService implements CardIssueSupportService{

    /**
     * 카드발급 관리 DAO
     */
    @Resource(name="cardIssueSupportDAO")
    CardIssueSupportDAO cardIssueSupportDAO;


    /*
     * @see chn.bhmc.dms.crm.dmm.service.CardIssueService#selectRechargeCardsByConditionCnt(chn.bhmc.dms.crm.dmm.vo.CardIssueSearchVO)
     */
    @Override
    public int selectRechargeCardsByConditionCnt(CardIssueSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return cardIssueSupportDAO.selectRechargeCardsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.CardIssueService#selectRechargeCardsByCondition(chn.bhmc.dms.crm.dmm.vo.CardIssueSearchVO)
     */
    @Override
    public List<CardIssueVO> selectRechargeCardsByCondition(CardIssueSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return cardIssueSupportDAO.selectRechargeCardsByCondition(searchVO);
    }

}
