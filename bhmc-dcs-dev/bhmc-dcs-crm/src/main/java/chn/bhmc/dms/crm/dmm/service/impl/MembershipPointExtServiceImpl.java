package chn.bhmc.dms.crm.dmm.service.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.i18n.ReloadableDataSourceResourceBundleMessageSource;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.crm.dmm.service.MembershipPointExtService;
import chn.bhmc.dms.crm.dmm.service.dao.MembershipPointExtDAO;
import chn.bhmc.dms.crm.dmm.vo.MembershipPointExtSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipPointExtVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipPointExtServiceImpl.java
 * @Description : 포인트 소멸 구현클래스
 * @author Kim Hyun Ho
 * @since 2016. 5. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 10.     Kim Hyun Ho     최초 생성
 * </pre>
 */
@Service("membershipPointExtService")
public class MembershipPointExtServiceImpl  extends HService implements MembershipPointExtService, JxlsSupport{
    /**
     * 포인트 소멸예정  DAO
     */
    @Resource(name="membershipPointExtDAO")
    MembershipPointExtDAO membershipPointExtDAO;

    /**
     * 메시지 관리
     */
    @Resource(name="dataSourceMessageSource")
    ReloadableDataSourceResourceBundleMessageSource dataSourceMessageSource;

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipPointExtService#selectMembershipPointExtsByConditionCnt(chn.bhmc.dms.crm.dmm.vo.MembershipPointExtSearchVO)
     */
    @Override
    public int selectMembershipPointExtsByConditionCnt(MembershipPointExtSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return membershipPointExtDAO.selectMembershipPointExtsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipPointExtService#selectMembershipPointExtsByCondition(chn.bhmc.dms.crm.dmm.vo.MembershipPointExtSearchVO)
     */
    @Override
    public List<MembershipPointExtVO> selectMembershipPointExtsByCondition(MembershipPointExtSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return membershipPointExtDAO.selectMembershipPointExtsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipPointExtService#selectMembershipPointExtTotalScore(chn.bhmc.dms.crm.dmm.vo.MembershipPointExtSearchVO)
     */
    @Override
    public MembershipPointExtVO selectMembershipPointExtTotalScore(MembershipPointExtSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return membershipPointExtDAO.selectMembershipPointExtTotalScore(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipPointExtService#updateMembershipPointExtSmsYn(chn.bhmc.dms.crm.dmm.vo.MembershipPointExtVO)
     */
    @Override
    public int updateMembershipPointExtSmsYn(MembershipPointExtVO membershipPointExtVO) {
        // TODO Auto-generated method stub
        if (StringUtils.isEmpty(membershipPointExtVO.getDlrCd())){membershipPointExtVO.setDlrCd(LoginUtil.getDlrCd());}
        return membershipPointExtDAO.updateMembershipPointExtSmsYn(membershipPointExtVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipPointExtService#updateMembershipPointExtSmsYnGroup(chn.bhmc.dms.crm.dmm.vo.MembershipPointExtVO)
     */
    @Override
    public int updateMembershipPointExtSmsYnGroup(MembershipPointExtVO membershipPointExtVO) {
        // TODO Auto-generated method stub
        if (StringUtils.isEmpty(membershipPointExtVO.getDlrCd())){membershipPointExtVO.setDlrCd(LoginUtil.getDlrCd());}
        return membershipPointExtDAO.updateMembershipPointExtSmsYnGroup(membershipPointExtVO);
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        MembershipPointExtSearchVO searchVO = new MembershipPointExtSearchVO();

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        String expcDt = params.get("sPointExtcExpcDt").toString();

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date t = format.parse(expcDt);
        searchVO.setsPointExtcExpcDt(t);

        int year;
        int month;
        int day;

        Calendar startCal = Calendar.getInstance();
        Calendar endCal = Calendar.getInstance();

        /******************************************
         *** 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )kimhh
         ******************************************/
        if(searchVO.getsPointExtcExpcDt() != null){

            // 시작일
            startCal.setTime(searchVO.getsPointExtcExpcDt());
            year = startCal.get(Calendar.YEAR);
            month = startCal.get(Calendar.MONTH);
            day = startCal.get(Calendar.DATE);
            startCal.set(year, month, day, 00, 00, 00);
            searchVO.setsStartDt(startCal.getTime());

            // 종료일
            endCal.setTime(searchVO.getsPointExtcExpcDt());
            year = endCal.get(Calendar.YEAR);
            month = endCal.get(Calendar.MONTH);
            day = endCal.get(Calendar.DATE);
            endCal.set(year, month, day, 23, 59, 59);
            searchVO.setsEndDt(endCal.getTime());
        }
        /******************************************
         *** 날짜 검색 조건 끝 ***********************
         ******************************************/

        List<MembershipPointExtVO> list = selectMembershipPointExtsByCondition(searchVO);
        context.putVar("items", list);
    }

}
