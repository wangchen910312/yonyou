package chn.bhmc.dms.sal.lom.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.jxls.common.Context;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.DateUtil;

import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.sal.lom.service.EvalSearchEditService;
import chn.bhmc.dms.sal.lom.service.dao.EvalSearchEditDAO;
import chn.bhmc.dms.sal.lom.vo.EvalInfoVO;
import chn.bhmc.dms.sal.lom.vo.EvalSearchEditSaveVO;
import chn.bhmc.dms.sal.lom.vo.EvalSearchEditSearchVO;
import chn.bhmc.dms.sal.sti.service.dao.ConfirmWearingVehicleDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : EvalInfoDownloadImpl.java
 * @Description : 평가정보 다운로드 Impl
 * @author Bong
 * @since 2016. 5. 02.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 02.       Bong                최초 생성
 * </pre>
 */

@Service("evalSearchEditService")
public class EvalSearchEditImpl extends HService implements EvalSearchEditService, JxlsSupport {

    @Resource(name="evalSearchEditDAO")
    EvalSearchEditDAO evalSearchEditDAO;

    /**
     * 완성차 입고확정 DAO 선언
     */
    @Resource(name="confirmWearingVehicleDAO")
    ConfirmWearingVehicleDAO confirmWearingVehicleDAO;

    @Override
    public List<EvalInfoVO> selectEvalSearchEditCondition(EvalSearchEditSearchVO searchVO) throws Exception {
        return evalSearchEditDAO.selectEvalSearchEditCondition(searchVO);
    }

    @Override
    public int selectEvalSearchEditConditionCnt(EvalSearchEditSearchVO searchVO)  throws Exception {
        return evalSearchEditDAO.selectEvalSearchEditConditionCnt(searchVO);
    }

    @Override
    public void updateEvalSearchEdit(EvalSearchEditSaveVO obj) throws Exception {

        String pattern = "yyyy-MM-dd HH:mm:ss";
        Date dlrEvlDt = DateUtil.convertToTimestamp(DateUtil.convertToString( new Date() ,pattern) ,pattern);

        for(EvalInfoVO evalInfoVO : obj.getUpdateList()){

            obj.getPopupVO().setVinNo(evalInfoVO.getVinNo());
            obj.getPopupVO().setDlrEvalDt(evalInfoVO.getDlrEvalDt());
            obj.getPopupVO().setUpdtUsrId(LoginUtil.getUserId());
            obj.getPopupVO().setRegUsrId(LoginUtil.getUserId());
            obj.getPopupVO().setDlrCd(LoginUtil.getDlrCd());
            obj.getPopupVO().setDlrEvalDt( dlrEvlDt );

            evalSearchEditDAO.updateEvalSearchEdit(obj.getPopupVO());

            //프로시저 추가
            confirmWearingVehicleDAO.procDlrEvalResult(obj.getPopupVO());              // 딜러평가결과수신 IF
       }
    }

    @Override
    public List<EvalInfoVO> selectEvalHistorySrchCondition(EvalSearchEditSearchVO searchVO) throws Exception {
        return evalSearchEditDAO.selectEvalHistorySrchCondition(searchVO);
    }

    @Override
    public int selectEvalHistorySrchConditionCnt(EvalSearchEditSearchVO searchVO)  throws Exception {
        return evalSearchEditDAO.selectEvalHistorySrchConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initContext(org.jxls.common.Context, able.com.vo.HMap)
     * Excel Export
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        EvalSearchEditSearchVO searchVO = new EvalSearchEditSearchVO();

/*        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
        String sPltGiDtS = params.get("sPltGiDtS").toString();
        String sPltGiDtE = params.get("sPltGiDtE").toString();

        if(!sPltGiDtS.equals("null") && !sPltGiDtE.equals("null")){

            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            searchVO.setsPltGiDtS(format.parse(sPltGiDtS));
            searchVO.setsPltGiDtE(format.parse(sPltGiDtE));

            int year;
            int month;
            int day;

            Calendar startCal = Calendar.getInstance();
            Calendar endCal = Calendar.getInstance();

*/
            /******************************************
             *** 날짜 검색 조건 시작  ( 날짜 검색 조건이 있는경우 )kimhh
             ******************************************/
/*                // 시작일
                startCal.setTime(searchVO.getsPltGiDtS());
                year = startCal.get(Calendar.YEAR);
                month = startCal.get(Calendar.MONTH);
                day = startCal.get(Calendar.DATE);
                startCal.set(year, month, day, 00, 00, 00);
                searchVO.setsPltGiDtS(startCal.getTime());

                // 종료일
                endCal.setTime(searchVO.getsPltGiDtE());
                year = endCal.get(Calendar.YEAR);
                month = endCal.get(Calendar.MONTH);
                day = endCal.get(Calendar.DATE);
                endCal.set(year, month, day, 23, 59, 59);
                searchVO.setsPltGiDtE(endCal.getTime());*/
            /******************************************V
             *** 날짜 검색 조건 끝 ***********************
             ******************************************/
//        }


        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        List<EvalInfoVO> list = evalSearchEditDAO.selectEvalSearchEditCondition(searchVO);

        context.putVar("items", list);

        //List<EvalInfoVO> list = evalSearchEditDAO.selectEvalSearchEditCondition(searchVO);

        //context.putVar("items", list);




    }

}
