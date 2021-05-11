package chn.bhmc.dms.crm.cso.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cso.service.SalesOnDutyMgmtService;
import chn.bhmc.dms.crm.cso.service.dao.SalesOnDutyMgmtDAO;
import chn.bhmc.dms.crm.cso.vo.SalesOnDutyMgmtSearchVO;
import chn.bhmc.dms.crm.cso.vo.SalesOnDutyMgmtVO;


/**
 * 판매기회 관리 서비스 구현 클래스
 *
 * @author in moon lee
 * @since 2016.03.07.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.07         in moon lee            최초 생성
 * </pre>
 */

@Service("salesOnDutyMgmtService")
public class SalesOnDutyMgmtServiceImpl extends HService implements SalesOnDutyMgmtService {

    /**
     *  당직관리 DAO
     */
    @Resource(name="salesOnDutyMgmtDAO")
    SalesOnDutyMgmtDAO salesOnDutyMgmtDAO;

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOnDutyMgmtService#selectSalesOnDutyMgmtsByConditionCnt(chn.bhmc.dms.crm.cso.vo.SalesOnDutyMgmtSearchVO)
     */
    @Override
    public int selectSalesOnDutyMgmtByConditionCnt(SalesOnDutyMgmtSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return salesOnDutyMgmtDAO.selectSalesOnDutyMgmtByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOnDutyMgmtService#selectSalesOnDutyMgmtsByCondition(chn.bhmc.dms.crm.cso.vo.SalesOnDutyMgmtSearchVO)
     */
    @Override
    public List<SalesOnDutyMgmtVO> selectSalesOnDutyMgmtByCondition(SalesOnDutyMgmtSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return salesOnDutyMgmtDAO.selectSalesOnDutyMgmtByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOnDutyMgmtService#selectSalesOnDutySchedulerMgmtByCondition(chn.bhmc.dms.crm.cso.vo.SalesOnDutyMgmtSearchVO)
     */
    @Override
    public List<SalesOnDutyMgmtVO> selectSalesOnDutySchedulerMgmtByCondition(SalesOnDutyMgmtSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return salesOnDutyMgmtDAO.selectSalesOnDutySchedulerMgmtByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOnDutyMgmtService#updateSalesOnDutyCountMgmt(chn.bhmc.dms.crm.cso.vo.SalesOnDutyMgmtSearchVO)
     */
    @Override
    public int updateSalesOnDutyCountMgmt(SalesOnDutyMgmtVO salesOnDutyMgmtVO) throws Exception {
        if (StringUtils.isEmpty(salesOnDutyMgmtVO.getDlrCd())){salesOnDutyMgmtVO.setDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(salesOnDutyMgmtVO.getUpdtUsrId())) {salesOnDutyMgmtVO.setUpdtUsrId(LoginUtil.getUserId());}

        /******************************************
         *** 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        Calendar startCal = Calendar.getInstance();

        if(salesOnDutyMgmtVO.getVsitResvDt() != null){
            int year;
            int month;
            int day;

            startCal.setTime(salesOnDutyMgmtVO.getVsitResvDt());
            year = startCal.get(Calendar.YEAR);
            month = startCal.get(Calendar.MONTH);
            day = startCal.get(Calendar.DATE);
            startCal.set(year, month, day, 00, 00, 00);
            salesOnDutyMgmtVO.setVsitResvDtFrom(startCal.getTime());

            startCal.set(year, month, day+1, 00, 00, 00);
            salesOnDutyMgmtVO.setVsitResvDtTo(startCal.getTime());
        }
        /******************************************
         *** 날짜 검색 조건 종료 ***********************
         ******************************************/


        return salesOnDutyMgmtDAO.updateSalesOnDutyCountMgmt(salesOnDutyMgmtVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOnDutyMgmtService#selectSalesOpptScAssignMgmtByConditionCnt(chn.bhmc.dms.crm.cso.vo.SalesOnDutyMgmtSearchVO)
     */
    @Override
    public int selectSalesOpptScAssignMgmtByConditionCnt(SalesOnDutyMgmtSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        searchVO.setsOndutyTp("02");
        return salesOnDutyMgmtDAO.selectSalesOpptScAssignMgmtByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOnDutyMgmtService#selectSalesOpptScAssignMgmtByCondition(chn.bhmc.dms.crm.cso.vo.SalesOnDutyMgmtSearchVO)
     */
    @Override
    public List<SalesOnDutyMgmtVO> selectSalesOpptScAssignMgmtByCondition(SalesOnDutyMgmtSearchVO searchVO) throws Exception {
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        searchVO.setsOndutyTp("02");
        return salesOnDutyMgmtDAO.selectSalesOpptScAssignMgmtByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOnDutyMgmtService#insertSalesOpptScAssignMgmt(chn.bhmc.dms.crm.cso.vo.SalesOnDutyMgmtSearchVO)
     */
    @Override
    public int insertSalesOpptScAssignMgmt(SalesOnDutyMgmtVO salesOnDutyMgmtVO) throws Exception {
        if (StringUtils.isEmpty(salesOnDutyMgmtVO.getDlrCd())){salesOnDutyMgmtVO.setDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(salesOnDutyMgmtVO.getRegUsrId())) {salesOnDutyMgmtVO.setRegUsrId(LoginUtil.getUserId());}
        if (StringUtils.isEmpty(salesOnDutyMgmtVO.getUpdtUsrId())) {salesOnDutyMgmtVO.setUpdtUsrId(LoginUtil.getUserId());}
        if (salesOnDutyMgmtVO.getVsitResvDt() == null) {salesOnDutyMgmtVO.setVsitResvDt(salesOnDutyMgmtVO.getOndutyDt());}

        return salesOnDutyMgmtDAO.insertSalesOpptScAssignMgmt(salesOnDutyMgmtVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOnDutyMgmtService#deleteOnDutySetMember(chn.bhmc.dms.crm.cso.vo.SalesOnDutyMgmtVO)
     */
    @Override
    public int deleteOnDutySetMember(SalesOnDutyMgmtVO salesOnDutyMgmtVO) throws Exception {
        if (StringUtils.isEmpty(salesOnDutyMgmtVO.getDlrCd())){salesOnDutyMgmtVO.setDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(salesOnDutyMgmtVO.getRegUsrId())) {salesOnDutyMgmtVO.setRegUsrId(LoginUtil.getUserId());}
        if (StringUtils.isEmpty(salesOnDutyMgmtVO.getUpdtUsrId())) {salesOnDutyMgmtVO.setUpdtUsrId(LoginUtil.getUserId());}
        return salesOnDutyMgmtDAO.deleteOnDutySetMember(salesOnDutyMgmtVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cso.service.SalesOnDutyMgmtService#insertCopyOnDutyMbrNextMonth(chn.bhmc.dms.crm.cso.vo.SalesOnDutyMgmtVO)
     */
    @Override
    public int insertCopyOnDutyMbrNextMonth(SalesOnDutyMgmtVO salesOnDutyMgmtVO) throws Exception {
        if (StringUtils.isEmpty(salesOnDutyMgmtVO.getDlrCd())){salesOnDutyMgmtVO.setDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(salesOnDutyMgmtVO.getRegUsrId())) {salesOnDutyMgmtVO.setRegUsrId(LoginUtil.getUserId());}
        if (StringUtils.isEmpty(salesOnDutyMgmtVO.getUpdtUsrId())) {salesOnDutyMgmtVO.setUpdtUsrId(LoginUtil.getUserId());}

        // 이번달 목록이 있는지 조회한다.
        SalesOnDutyMgmtSearchVO searchVO = new SalesOnDutyMgmtSearchVO();
        searchVO.setsDlrCd(salesOnDutyMgmtVO.getDlrCd());
        searchVO.setsOndutyTp(salesOnDutyMgmtVO.getOndutyTp());
        searchVO.setsStartDt(salesOnDutyMgmtVO.getOndutyDt());
        int thisMonthCnt = salesOnDutyMgmtDAO.selectSalesOnDutyMgmtByConditionCnt(searchVO);

        if (thisMonthCnt != 0 ){
            // 다음달에 데이터가 있는지 카운트 한다.
            Calendar startDtCal = Calendar.getInstance();
            startDtCal.setTime(searchVO.getsStartDt());
            startDtCal.set(startDtCal.get(Calendar.YEAR),startDtCal.get(Calendar.MONTH)+1,startDtCal.get(Calendar.DATE), 00, 00, 00);
            searchVO.setsStartDt(startDtCal.getTime());
            thisMonthCnt = salesOnDutyMgmtDAO.selectSalesOnDutyMgmtByConditionCnt(searchVO);
            if (thisMonthCnt != 0) {
                thisMonthCnt = salesOnDutyMgmtDAO.deleteOnDutyMbrthisMonth(searchVO);
                thisMonthCnt = salesOnDutyMgmtDAO.insertCopyOnDutyMbrNextMonth(salesOnDutyMgmtVO);
            } else {
                thisMonthCnt = salesOnDutyMgmtDAO.insertCopyOnDutyMbrNextMonth(salesOnDutyMgmtVO);
            }
        }

        return thisMonthCnt;
    }


}
