package chn.bhmc.dms.crm.dmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.i18n.ReloadableDataSourceResourceBundleMessageSource;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.dmm.service.CardIssueService;
import chn.bhmc.dms.crm.dmm.service.MembershipPointHisService;
import chn.bhmc.dms.crm.dmm.service.dao.MembershipPointHisDAO;
import chn.bhmc.dms.crm.dmm.vo.CardIssueSearchVO;
import chn.bhmc.dms.crm.dmm.vo.CardIssueVO;
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
     * 설문 템플릿 관리 DAO
     */
    @Resource(name="membershipPointHisDAO")
    MembershipPointHisDAO membershipPointHisDAO;

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
     * 멤버십 포인트이력 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipPointHisSearchVO
     * @return
     */
    @Override
    public int selectPointHistorysByConditionCnt(MembershipPointHisSearchVO searchVO) throws Exception {
        // TODO Auto-generated method stub

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return membershipPointHisDAO.selectPointHistorysByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 멤버십 포인트 이력 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 MembershipSearchVO
     * @return 조회 목록
     */
    @Override
    public List<MembershipPointHisVO> selectPointHistorysByCondition(MembershipPointHisSearchVO searchVO) throws Exception {
        return membershipPointHisDAO.selectPointHistorysByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipPointHisService#selectPointInfosCondition(chn.bhmc.dms.crm.dmm.vo.MembershipPointHisSearchVO)
     */
    @Override
    public List<MembershipPointHisVO> selectPointInfosCondition(MembershipPointHisSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        //if (StringUtils.isEmpty(searchVO.getsCardTpCd())){searchVO.setsCardTpCd("01");}
        return membershipPointHisDAO.selectPointInfosCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipPointHisService#insertSpecialPoint(chn.bhmc.dms.crm.dmm.vo.MembershipPointHisVO)
     */
    @Override
    public int insertSpecialPoint(MembershipPointHisVO membershipPointHisVO) throws Exception {
        // TODO 특별포인트 뿐만 아니라 일반적인 포인트를 등록, 차감 할때 사용
        membershipPointHisVO.setRegUsrId(LoginUtil.getUserId());
        //멤버십 포인트 유효기간 setting
        membershipPointHisVO.setMembershipPointPeriod(systemConfigInfoService.selectStrValueByKey("membershipPointPeriod"));
        //String limitPoint = systemConfigInfoService.selectStrValueByKey("membershipPointUseLimitPoint");//멤버십 포인트 상한치

        //return membershipPointHisDAO.insertSpecialPoint(membershipPointHisVO);
        membershipPointHisVO.setPointTp("+");
        membershipPointHisDAO.selectCallPoint(membershipPointHisVO);
        return 0;
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipPointHisService#insertPoint(chn.bhmc.dms.crm.dmm.vo.MembershipPointHisVO)
     */
    @Override
    public int selectCallPoint(MembershipPointHisVO membershipPointHisVO) throws Exception {

        /*
         * [TODO] 1.포인트 사용시 양도,양수에서는 제한금액이 없다.(양도/양수 : 01, 특별포인트 : 02)
         */
        String limitPoint = systemConfigInfoService.selectStrValueByKey("membershipPointUseLimitPoint");//멤버십 포인트 상한치
        //pointCd로 +인지, -인지 조회
        CommonCodeVO code = commonCodeService.selectCommonCodeByKey(membershipPointHisVO.getPointCd(),"CRM802");
        String userId = LoginUtil.getUserId();
        String userNm = LoginUtil.getUserNm();
        membershipPointHisVO.setRegUsrId(userId);
        membershipPointHisVO.setPrsnId(userId);

        String pointTp = code.getRemark1();
        /*signVO.setReqCont("");
        String message = "※ 转让人信息 \n"
                        +"转让人(客户名) : "+ membershipTransVO.getTrsfCustNm() +"\n"
                        +"会员号码 : "+ 1 + "\n"
                        +"移动电话 : "+ 2 + "\n"
                        +"证件类型  : "+ 2 + "\n"
                        +"证件号码  : "+ 3 + "\n"
                        +"\n"
                        +"※ 转入人信息"
                        +"转入人(客户名) : "+ membershipTransVO.getTrsfCustNm() +"\n"
                        +"会员号码 : "+ 1 + "\n"
                        +"移动电话 : "+ 2 + "\n"
                        +"证件类型  : "+ 2 + "\n"
                        +"证件号码  : "+ 3 + "\n"
                        +"\n"
                        +"※ 转让信息"
                        +"转让积分  : "+ 2 + "\n"
                        +"转让原因  : "+ 2 + "\n"
                        +"关系  : "+ 3 + "\n"
                        +"* 转让人 "+ 5 +"转让以上信息给转入人"+6
                        ;
        signVO.setReqCont(message);*/

        if(pointTp.equals("-")){//포인트코드(pointCd)의 값으로 공통코드를 조회 했을때 remark1값이 -일 경우
            //최대 사용 포인트 상한치 적용
            if(membershipPointHisVO.getOccrPointVal() > Integer.parseInt(limitPoint)){
                //최대 사용할 수 있는 포인트는 {0}점 입니다.
                throw processException("crm.err.limitPointOver", new String[]{limitPoint});
            }

            MembershipPointHisSearchVO searchVO = new MembershipPointHisSearchVO();
            searchVO.setsDlrCd(membershipPointHisVO.getDlrCd());
            searchVO.setsMembershipNo(membershipPointHisVO.getMembershipNo());
            searchVO.setsCardNo(membershipPointHisVO.getCardNo());
            searchVO.setsCardTpCd(membershipPointHisVO.getCardTpCd());
            int totPoint = membershipPointHisDAO.selectTotPointByKey(searchVO);
            if(totPoint < membershipPointHisVO.getOccrPointVal()){
                //잔여포인트가 없거나 부족합니다.
                throw processException("crm.err.lowPoint");
            }

            membershipPointHisVO.setDlrCd(LoginUtil.getDlrCd());//딜러코드
            membershipPointHisVO.setPointTp(pointTp); //포인트 타입
            membershipPointHisVO.setExtcTargYn("N"); // 소멸대상여부
            membershipPointHisVO.setExtcTargPointVal(membershipPointHisVO.getOccrPointVal());//소멸대상포인트값
            membershipPointHisVO.setOccrPointVal(membershipPointHisVO.getOccrPointVal());//발생포인트값
            //membershipPointHisVO.setCardTpCd("01"); //카드유형코드
            membershipPointHisDAO.selectCallPoint(membershipPointHisVO);
            return 0;
        }else if(pointTp.equals("+")){
            membershipPointHisVO.setDlrCd(LoginUtil.getDlrCd());//딜러코드
            membershipPointHisVO.setPointTp(pointTp); //포인트 타입
            membershipPointHisVO.setExtcTargYn("Y"); // 소멸대상여부
            membershipPointHisVO.setExtcTargPointVal(membershipPointHisVO.getOccrPointVal());//소멸대상포인트값
            membershipPointHisVO.setOccrPointVal(membershipPointHisVO.getOccrPointVal());//발생포인트값
            //membershipPointHisVO.setCardTpCd("01"); //카드유형코드
            membershipPointHisDAO.selectCallPoint(membershipPointHisVO);
            return 0;
        }else{
            //특별포인트 일 경우
            return 0;
        }

        //return membershipPointHisDAO.insertSpecialPoint(membershipPointHisVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipPointHisService#insertSpecialPoint(chn.bhmc.dms.crm.dmm.vo.MembershipPointHisVO)
     */
    @Override
    public int insertRechargeAmt(MembershipPointHisVO membershipPointHisVO) throws Exception {
        // TODO 특별포인트 뿐만 아니라 일반적인 포인트를 등록, 차감 할때 사용
        membershipPointHisVO.setRegUsrId(LoginUtil.getUserId());
        //멤버십 포인트 유효기간 setting
        membershipPointHisVO.setMembershipPointPeriod(systemConfigInfoService.selectStrValueByKey("membershipPointPeriod"));
        //String limitPoint = systemConfigInfoService.selectStrValueByKey("membershipPointUseLimitPoint");//멤버십 포인트 상한치

        //충전카드 존재여부 파악
        if(membershipPointHisVO.getInsertFlag() != null &&
                membershipPointHisVO.getInsertFlag().equals("01")){//충전카드 충전일 경우
            CardIssueSearchVO searchVO = new CardIssueSearchVO();
            searchVO.setsDlrCd(membershipPointHisVO.getDlrCd());
            searchVO.setsMembershipNo(membershipPointHisVO.getMembershipNo());
            searchVO.setsCardTpCd(membershipPointHisVO.getCardTpCd());
            searchVO.setsCardNo(membershipPointHisVO.getCardNo());

            CardIssueVO issueVO = cardIssueService.selectCardIssueByKey(searchVO);

            if(issueVO == null){
                //등록되지 않은 충전카드 입니다.
                throw processException("crm.err.noCntRechargeCard");
            }
        }

        return membershipPointHisDAO.insertRechargeAmt(membershipPointHisVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipPointHisService#updatePointProcedure(chn.bhmc.dms.crm.dmm.vo.MembershipPointHisVO)
     */
    @Override
    public int updatePointProcedure(MembershipPointHisVO membershipPointHisVO) throws Exception {
        //특별한 로직없이 프로시저만 호출하기 위해서 만듬(즉, 각 업무단의 Service에서  membershipPointHisVO를 가공하고 여기서 받아서 프로시저 태움)
        membershipPointHisVO.setMembershipPointPeriod(systemConfigInfoService.selectStrValueByKey("membershipPointPeriod"));
        membershipPointHisDAO.selectCallPoint(membershipPointHisVO);
        return 0;
    }



}
