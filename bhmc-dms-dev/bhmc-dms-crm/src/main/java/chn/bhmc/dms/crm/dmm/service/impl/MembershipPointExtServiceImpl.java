package chn.bhmc.dms.crm.dmm.service.impl;

import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.jxls.common.Context;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.i18n.ReloadableDataSourceResourceBundleMessageSource;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.crm.dmm.service.MembershipPointExtService;
import chn.bhmc.dms.crm.dmm.service.MembershipPointHisService;
import chn.bhmc.dms.crm.dmm.service.dao.MembershipPointExtDAO;
import chn.bhmc.dms.crm.dmm.vo.MembershipPointHisSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipPointHisVO;

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
     * 포인트 소멸예정  DAO
     */
    @Resource(name="membershipPointHisService")
    MembershipPointHisService membershipPointHisService;

    /**
     * 메시지 관리
     */
    @Resource(name="dataSourceMessageSource")
    ReloadableDataSourceResourceBundleMessageSource dataSourceMessageSource;


    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        MembershipPointHisSearchVO searchVO = new MembershipPointHisSearchVO();

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        if ( !"null".equals((String)params.get("sStartPointExtcExpcDt")) && params.get("sStartPointExtcExpcDt") != null  ) {
            searchVO.setsExtcDt(DateUtil.convertToDate((String)params.get("sStartPointExtcExpcDt")));
        }
        if ( !"null".equals((String)params.get("sEndPointExtcExpcDt")) && params.get("sEndPointExtcExpcDt") != null  ) {
            searchVO.setsExtcEndDt(DateUtil.convertToDate((String)params.get("sEndPointExtcExpcDt")));
        }

        /******************************************
         *** 날짜 검색 조건 시작 ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        if (searchVO.getsExtcDt() != null || searchVO.getsExtcEndDt() != null) {
            Calendar startCal = Calendar.getInstance();
            Calendar endCal = Calendar.getInstance();

            int year;
            int month;
            int day;

            // 시작일
            startCal.setTime(searchVO.getsExtcDt());
            year = startCal.get(Calendar.YEAR);
            month = startCal.get(Calendar.MONTH);
            day = startCal.get(Calendar.DATE);
            startCal.set(year, month, day, 00, 00, 00);
            searchVO.setsExtcDt(startCal.getTime());

            // 종료일
            endCal.setTime(searchVO.getsExtcEndDt());
            year = endCal.get(Calendar.YEAR);
            month = endCal.get(Calendar.MONTH);
            day = endCal.get(Calendar.DATE);
            endCal.set(year, month, day, 23, 59, 59);
            searchVO.setsExtcEndDt(endCal.getTime());
        }
        /******************************************
         *** 날짜 검색 조건 끝 ***********************
         ******************************************/


        List<MembershipPointHisVO> list = membershipPointHisService.selectMembershipPointExtsByCondition(searchVO);
        context.putVar("items", list);
    }

}
