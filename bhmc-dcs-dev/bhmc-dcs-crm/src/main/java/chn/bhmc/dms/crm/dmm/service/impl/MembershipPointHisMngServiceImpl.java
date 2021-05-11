package chn.bhmc.dms.crm.dmm.service.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.crm.dmm.service.MembershipPointHisMngService;
import chn.bhmc.dms.crm.dmm.service.dao.MembershipPointHisMngDAO;
import chn.bhmc.dms.crm.dmm.vo.MembershipPointHisMngSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipPointHisMngVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipPointHisMngServiceImpl.java
 * @Description : 포인트 소멸이력 구현 클리스(CR_0812T)
 * @author Kim Hyun Ho
 * @since 2016. 5. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 28.     Kim Hyun Ho     최초 생성
 * </pre>
 */

@Service("membershipPointHisMngService")
public class MembershipPointHisMngServiceImpl extends HService implements MembershipPointHisMngService, JxlsSupport{

    /**
     * 소인트 소멸 이력 DAO
     */
    @Resource(name="membershipPointHisMngDAO")
    MembershipPointHisMngDAO membershipPointHisMngDAO;

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipPointHisMngService#selectMembershipPointHisMngsByConditionCnt(chn.bhmc.dms.crm.dmm.vo.MembershipPointHisMngSearchVO)
     */
    @Override
    public int selectMembershipPointHisMngsByConditionCnt(MembershipPointHisMngSearchVO searchVO) throws Exception {
        // TODO Auto-generated method stub
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return membershipPointHisMngDAO.selectMembershipPointHisMngsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipPointHisMngService#selectMembershipPointHisMngsByCondition(chn.bhmc.dms.crm.dmm.vo.MembershipPointHisMngSearchVO)
     */
    @Override
    public List<MembershipPointHisMngVO> selectMembershipPointHisMngsByCondition(MembershipPointHisMngSearchVO searchVO) throws Exception {
        // TODO Auto-generated method stub
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return membershipPointHisMngDAO.selectMembershipPointHisMngsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipPointHisMngService#selectMembershipPointHisMngUsrsByConditionCnt(chn.bhmc.dms.crm.dmm.vo.MembershipPointHisMngSearchVO)
     */
    @Override
    public int selectMembershipPointHisMngUsrsByConditionCnt(MembershipPointHisMngSearchVO searchVO) throws Exception {
        // TODO Auto-generated method stub
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return membershipPointHisMngDAO.selectMembershipPointHisMngUsrsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.dmm.service.MembershipPointHisMngService#selectMembershipPointHisMngUsrsByCondition(chn.bhmc.dms.crm.dmm.vo.MembershipPointHisMngSearchVO)
     */
    @Override
    public List<MembershipPointHisMngVO> selectMembershipPointHisMngUsrsByCondition( MembershipPointHisMngSearchVO searchVO) throws Exception {
        // TODO Auto-generated method stub
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return membershipPointHisMngDAO.selectMembershipPointHisMngUsrsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        MembershipPointHisMngSearchVO searchVO = new MembershipPointHisMngSearchVO();

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        String sPointExtcDt = params.get("sPointExtcDt").toString();

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        searchVO.setsPointExtcDt(format.parse(sPointExtcDt));

        int year;
        int month;
        int day;

        Calendar startCal = Calendar.getInstance();
        Calendar endCal = Calendar.getInstance();

        /******************************************
         *** 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )kimhh
         ******************************************/
            // 시작일
            startCal.setTime(searchVO.getsPointExtcDt());
            year = startCal.get(Calendar.YEAR);
            month = startCal.get(Calendar.MONTH);
            day = startCal.get(Calendar.DATE);
            startCal.set(year, month, day, 00, 00, 00);
            searchVO.setsStartDt(startCal.getTime());

            // 종료일
            endCal.setTime(searchVO.getsPointExtcDt());
            year = endCal.get(Calendar.YEAR);
            month = endCal.get(Calendar.MONTH);
            day = endCal.get(Calendar.DATE);
            endCal.set(year, month, day, 23, 59, 59);
            searchVO.setsEndDt(endCal.getTime());
        /******************************************
         *** 날짜 검색 조건 끝 ***********************
         ******************************************/

        List<MembershipPointHisMngVO> list = selectMembershipPointHisMngUsrsByCondition(searchVO);
        context.putVar("items", list);
    }

}
