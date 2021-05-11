package chn.bhmc.dms.crm.dmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.i18n.ReloadableDataSourceResourceBundleMessageSource;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.dmm.service.MembershipCardService;
import chn.bhmc.dms.crm.dmm.service.dao.MembershipCardDAO;
import chn.bhmc.dms.crm.dmm.vo.MembershipCardSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipCardVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipCardServiceImpl.java
 * @Description : 멤버십 카드관리 서비스 구현체
 * @author Kim Hyun Ho
 * @since 2016. 4. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 6.     Kim Hyun Ho     최초 생성
 * </pre>
 */

@Service("membershipCardService")
public class MembershipCardServiceImpl extends HService implements MembershipCardService{

    /**
     * 멤버십 카드 관리 DAO
     */
    @Resource(name="membershipCardDAO")
    MembershipCardDAO membershipCardDAO;

    /**
     * 메시지 관리
     */
    @Resource(name="dataSourceMessageSource")
    ReloadableDataSourceResourceBundleMessageSource dataSourceMessageSource;


    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipCardService#selectMembershipsByConditionCnt(chn.bhmc.dms.crm.dmm.vo.MembershipCardSearchVO)
     */
    @Override
    public int selectMembershipsByConditionCnt(MembershipCardSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return membershipCardDAO.selectMembershipCardsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipCardService#selectMembershipsByCondition(chn.bhmc.dms.crm.dmm.vo.MembershipCardSearchVO)
     */
    @Override
    public List<MembershipCardVO> selectMembershipsByCondition(MembershipCardSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return membershipCardDAO.selectMembershipCardsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipCardService#multiMembershipCards(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiMembershipCards(BaseSaveVO<MembershipCardVO> obj) throws Exception {
        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        for(MembershipCardVO membershipCardVO : obj.getInsertList()){
            membershipCardVO.setRegUsrId(userId);
            membershipCardVO.setDlrCd(dlrCd);

            MembershipCardVO membershipCard = selectMembershipCardByKey(membershipCardVO.getDlrCd(), membershipCardVO.getCardTpCd(), membershipCardVO.getCardNo());

            if(membershipCard == null) {
                insertMembershipCard(membershipCardVO);
            }
        }

        for(MembershipCardVO membershipCardVO  : obj.getUpdateList()){
            membershipCardVO.setUpdtUsrId(userId);
            updateMembershipCard(membershipCardVO);
        }

        for(MembershipCardVO membershipCardVO  : obj.getDeleteList()){
            deleteMembershipCard(membershipCardVO);
        }
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipCardService#insertMembershipCard(chn.bhmc.dms.crm.dmm.vo.MembershipCardVO)
     */
    @Override
    public int insertMembershipCard(MembershipCardVO membershipCardVO) throws Exception {
        membershipCardVO.setDlrCd(LoginUtil.getDlrCd());
        dataSourceMessageSource.clearCache();
        return membershipCardDAO.insertMembershipCard(membershipCardVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipCardService#updateMembershipCard(chn.bhmc.dms.crm.dmm.vo.MembershipCardVO)
     */
    @Override
    public int updateMembershipCard(MembershipCardVO membershipCardVO) throws Exception {
        dataSourceMessageSource.clearCache();
        return membershipCardDAO.updateMembershipCard(membershipCardVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipCardService#deleteMembershipCard(chn.bhmc.dms.crm.dmm.vo.MembershipCardVO)
     */
    @Override
    public int deleteMembershipCard(MembershipCardVO membershipCardVO) throws Exception {
        dataSourceMessageSource.clearCache();
        return membershipCardDAO.deleteMembershipCard(membershipCardVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public MembershipCardVO selectMembershipCardByKey(String dlrCd, String cardTpCd, String cardNo) throws Exception {
        return membershipCardDAO.selectMembershipCardByKey(dlrCd, cardTpCd, cardNo);
    }


    /*
     * @see chn.bhmc.dms.cmm.sci.service.DBMessageSourceService#insertDBMessageSourceBatchUpload(java.util.List)
     */
    @Override
    public void insertMembershipCardSave(List<MembershipCardVO> list) throws Exception {

        String userId = LoginUtil.getUserId();


        for(MembershipCardVO membershipCardVO : list){
            if (StringUtils.isEmpty(membershipCardVO.getDlrCd())){membershipCardVO.setDlrCd(LoginUtil.getDlrCd());}
            membershipCardVO.setRegUsrId(userId);

            MembershipCardVO membershipCard = selectMembershipCardByKey(membershipCardVO.getDlrCd(), membershipCardVO.getCardTpCd(), membershipCardVO.getCardNo());

            if(membershipCard == null) {
                insertMembershipCard(membershipCardVO);
            }
            /*else{
                updateMembershipCard(membershipCardVO);
            }*/
        }
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipCardService#selectMembershipCardPopupsByConditionCnt(chn.bhmc.dms.crm.dmm.vo.MembershipCardSearchVO)
     */
    @Override
    public int selectMembershipCardPopupsByConditionCnt(MembershipCardSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return membershipCardDAO.selectMembershipCardPopupsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipCardService#selectMembershipCardPopupsByCondition(chn.bhmc.dms.crm.dmm.vo.MembershipCardSearchVO)
     */
    @Override
    public List<MembershipCardVO> selectMembershipCardPopupsByCondition(MembershipCardSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return membershipCardDAO.selectMembershipCardPopupsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipCardService#selectMembershipCardOnesByCondition(chn.bhmc.dms.crm.dmm.vo.MembershipCardSearchVO)
     */
    @Override
    public MembershipCardVO selectMembershipCardOnesByCondition(MembershipCardSearchVO searchVO) throws Exception {
        // TODO Auto-generated method stub
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        List<MembershipCardVO> data = membershipCardDAO.selectMembershipCardPopupsByCondition(searchVO);
        if(data != null && data.size() != 0){
            MembershipCardVO cardVO = new MembershipCardVO();
            cardVO.setDlrCd(data.get(0).getDlrCd());
            cardVO.setCardNo(data.get(0).getCardNo());
            return cardVO;
        }else{
            if(searchVO.getsCardTpCd().equals("01")){
                //등록할 포인트카드가 없습니다.
                throw processException("crm.err.noPointCard");
            }else if(searchVO.getsCardTpCd().equals("02")){
                //등록할 충전카드가 없습니다.
                throw processException("crm.err.noRechargeCard");
            }else{
                //등록이 불가능 합니다.
                throw processException("crm.err.noCardReg");
            }
        }
    }

}
