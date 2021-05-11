package chn.bhmc.dms.crm.dmm.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.dmm.service.CardIssueSupportService;
import chn.bhmc.dms.crm.dmm.service.MembershipGradeMngSupportService;
import chn.bhmc.dms.crm.dmm.service.MembershipSupportService;
import chn.bhmc.dms.crm.dmm.service.PackageCouponHisSupportService;
import chn.bhmc.dms.crm.dmm.service.dao.MembershipSupportDAO;
import chn.bhmc.dms.crm.dmm.vo.CardIssueSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipGradeMngSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipVO;
import chn.bhmc.dms.crm.dmm.vo.PackageCouponHisSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipSupportServiceImpl.java
 * @Description : 멤버십 서비스 구현 클래스
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

@Service("membershipSupportService")
public class MembershipSupportServiceImpl extends HService implements MembershipSupportService{

    /**
     * 멤버십 관리 DAO
     */
    @Resource(name="membershipSupportDAO")
    MembershipSupportDAO membershipSupportDAO;

    /**
     * 멤버십 등급 관리 DAO
     */
    @Resource(name="membershipGradeMngSupportService")
    MembershipGradeMngSupportService membershipGradeMngSupportService;

    /**
     * 멤버십 등급 관리 DAO
     */
    @Resource(name="packageCouponHisSupportService")
    PackageCouponHisSupportService packageCouponHisSupportService;

    /**
     * 멤버십 등급 관리 DAO
     */
    @Resource(name="cardIssueSupportService")
    CardIssueSupportService cardIssueSupportService;

    /**
     * 멤버십 상세 조회
     * @param searchVO - custNo, vinNo, membershipNo
     * @return
     *  파라미터에 따라서 vo 또는 list로 return
     *      param - custNo 가 있는경우 : N건 반환
     *      param - vinNo  가 있는경우 : 1건 반환
     *
     *  확인 방법
     *      membershipInfoListCnt = 1인경우 : vo에서 상세 정보 조회
     *      membershipInfoListCnt > 1인경우 : membershipInfoList 에서 상세 정보 조회
     */

    @Override
    public MembershipVO selectMembershipInfoByKey(MembershipSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsMembershipStan())){searchVO.setsMembershipStan(LoginUtil.getMembershipPolicy());}

        // 멤버십 정보 조회 파라미터 체크 ( membershipNo, vinNo, custNo )
        if ( StringUtils.isBlank(searchVO.getsVinNo()) && StringUtils.isBlank(searchVO.getsCustNo()) && StringUtils.isBlank(searchVO.getsMembershipNo()) ){
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.custInfo", null, LocaleContextHolder.getLocale())});
        }

        if("C".equals(searchVO.getsMembershipStan())){//고객기준
            if(StringUtils.isBlank(searchVO.getsMembershipNo()) && StringUtils.isBlank(searchVO.getsCustNo())){
                throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())});
            }else{
                searchVO.setsVinNo("");
            }
        }else if("V".equals(searchVO.getsMembershipStan())){//차량기준

            // 소유자가 변경될경우가 있으므로 파라미터에 vin, cust 가 같이 있으면 cust는 제거해준다.
            if( StringUtils.isBlank(searchVO.getsMembershipNo()) && StringUtils.isNotBlank(searchVO.getsCustNo()) && StringUtils.isNotBlank(searchVO.getsVinNo())){
                searchVO.setsCustNo("");
            }

        }

        MembershipVO vo = new MembershipVO();

        List<MembershipVO> membershipInfoList = membershipSupportDAO.selectMembershipInfoByKey(searchVO);

        // 1건 인경우 vo에 정보 return
        if ( membershipInfoList.size() == 1  ) {

            vo = membershipInfoList.get(0);
            vo.setMembershipInfoListCnt(membershipInfoList.size());

            MembershipSearchVO membershipSearchVO = new MembershipSearchVO();
            membershipSearchVO.setsMembershipNo(vo.getMembershipNo());
            MembershipVO membershipSubInfo = selectMembershipListInfo(membershipSearchVO);
            // 멤버십 등급 리스트 set ( param : dlrCd / 정비에서 할인율 조회시 사용 )
            if ( membershipSubInfo.getMembershipGradeMngList() != null ) {
                vo.setMembershipGradeMngList(membershipSubInfo.getMembershipGradeMngList());
            }
            // 멤버십 쿠폰 리스트 set ( param : dlrCd, membershipNo )
            if ( membershipSubInfo.getPackageCouponHisList() != null ) {
                vo.setPackageCouponHisList(membershipSubInfo.getPackageCouponHisList());
            }
            // 멤버십 선불 카드 리스트 set ( param : dlrCd, membershipNo )
            if( membershipSubInfo.getCardIssueList()  != null ) {
                vo.setCardIssueList(membershipSubInfo.getCardIssueList());
            }

            // 포인트 사용 상한치 추가
            vo.setMembershipPointUseMaxPoint(LoginUtil.getMembershipPointUseMaxPoint());

            // 멤버십 포인트 환산기준.
            vo.setMembershipPointExchgPoint(LoginUtil.getMembershipPointExchgPoint());       // 멤버십포인트 환산기준 ( 포인트 )
            vo.setMembershipPointExchgMoney(LoginUtil.getMembershipPointExchgMoney());       // 멤버십포인트 환산기준 ( 위안 )

            if(vo.getMembershipPointExchgMoney() == 0 || vo.getMembershipPointExchgPoint() == 0){
                vo.setPointExchgScale(1);
            }else{
                vo.setPointExchgScale(vo.getMembershipPointExchgMoney() / vo.getMembershipPointExchgPoint());
            }

        } else if ( membershipInfoList.size() > 1  ) {

            // 1건 이상인경우 list로 리턴.
            List<MembershipVO> membershipAddList = new ArrayList<MembershipVO>();
            for (MembershipVO listVO : membershipInfoList) {

                MembershipSearchVO membershipSearchVO = new MembershipSearchVO();
                membershipSearchVO.setsMembershipNo(vo.getMembershipNo());
                MembershipVO membershipSubInfo = selectMembershipListInfo(membershipSearchVO);

                // 멤버십 등급 리스트 set ( param : dlrCd / 정비에서 할인율 조회시 사용 )
                if ( membershipSubInfo.getMembershipGradeMngList()  != null ) {
                    listVO.setMembershipGradeMngList(membershipSubInfo.getMembershipGradeMngList());
                }
                // 멤버십 쿠폰 리스트 set ( param : dlrCd, membershipNo )
                if ( membershipSubInfo.getPackageCouponHisList() != null ) {
                    listVO.setPackageCouponHisList(membershipSubInfo.getPackageCouponHisList());
                }
                // 멤버십 선불 카드 리스트 set ( param : dlrCd, membershipNo )
                if( membershipSubInfo.getCardIssueList()  != null ) {
                    listVO.setCardIssueList(membershipSubInfo.getCardIssueList());
                }

                // 포인트 사용 상한치 추가
                listVO.setMembershipPointUseMaxPoint(LoginUtil.getMembershipPointUseMaxPoint());

                // 멤버십 포인트 환산기준.
                listVO.setMembershipPointExchgPoint(LoginUtil.getMembershipPointExchgPoint());       // 멤버십포인트 환산기준 ( 포인트 )
                listVO.setMembershipPointExchgMoney(LoginUtil.getMembershipPointExchgMoney());       // 멤버십포인트 환산기준 ( 위안 )

                if(listVO.getMembershipPointExchgMoney() == 0 || listVO.getMembershipPointExchgPoint() == 0){
                    listVO.setPointExchgScale(1);
                }else{
                    listVO.setPointExchgScale(vo.getMembershipPointExchgMoney() / vo.getMembershipPointExchgPoint());
                }

                membershipAddList.add(listVO);
            }

            vo.setMembershipInfoList(membershipAddList);
            vo.setMembershipInfoListCnt(membershipInfoList.size());

        };

        return vo;
    }

    // 멤버십 등급정보, 멤버십 포인트 정보, 멤버십 선불카드 정보 리턴.
    public MembershipVO selectMembershipListInfo(MembershipSearchVO searchVO) throws Exception {

        MembershipVO listInfo = new MembershipVO();

        String membershipNo = searchVO.getsMembershipNo();

        // 멤버십 등급 리스트 set ( param : dlrCd / 정비에서 할인율 조회시 사용 )
        MembershipGradeMngSearchVO searchGradeMngsVO = new MembershipGradeMngSearchVO();
        int gradeCnt = membershipGradeMngSupportService.selectMembershipGradeMngsByConditionCnt(searchGradeMngsVO);
        if(gradeCnt != 0){
            listInfo.setMembershipGradeMngList(membershipGradeMngSupportService.selectMembershipGradeMngsByCondition(searchGradeMngsVO));
        }

        // 멤버십 쿠폰 리스트 set ( param : dlrCd, membershipNo )
        PackageCouponHisSearchVO searchCouponHisVO = new PackageCouponHisSearchVO();
        searchCouponHisVO.setsMembershipNo(membershipNo);
        int couponHisCnt = packageCouponHisSupportService.selectPackageCouponHissByConditionCnt(searchCouponHisVO);
        if(couponHisCnt != 0){
            listInfo.setPackageCouponHisList(packageCouponHisSupportService.selectPackageCouponHissByCondition(searchCouponHisVO));
        }

        // 멤버십 선불 카드 리스트 set ( param : dlrCd, membershipNo )
        CardIssueSearchVO searchCardIssueVO = new CardIssueSearchVO();
        searchCardIssueVO.setsMembershipNo(membershipNo);
        int cardIssueCnt = cardIssueSupportService.selectRechargeCardsByConditionCnt(searchCardIssueVO);
        if(cardIssueCnt != 0){
            listInfo.setCardIssueList(cardIssueSupportService.selectRechargeCardsByCondition(searchCardIssueVO));
        }

        return listInfo;

    }


    /** 20160903 / 이인문 / support 로 이동
     * 멤버십 등록된 목록 조회
     */
    @Override
    public List<MembershipVO> selectMembershipJoinCondition(MembershipSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return membershipSupportDAO.selectMembershipJoinCondition(searchVO);
    }

    /*  20160903 / 이인문 / support 로 이동
     * @see chn.bhmc.dms.crm.dmm.service.MembershipService#selectMembershipPointInfo(chn.bhmc.dms.crm.dmm.vo.MembershipSearchVO)
     */
    @Override
    public MembershipVO selectMembershipPointInfo(MembershipSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return membershipSupportDAO.selectMembershipPointInfo(searchVO);
    }


}
