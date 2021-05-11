package chn.bhmc.dms.sal.orc.service.impl;

import java.util.*;

import javax.annotation.*;

import org.apache.commons.lang3.*;
import org.jxls.common.*;
import org.springframework.context.i18n.*;
import org.springframework.stereotype.*;

import able.com.service.*;
import able.com.vo.*;
import chn.bhmc.dms.core.support.excel.*;
import chn.bhmc.dms.core.util.*;
import chn.bhmc.dms.sal.orc.service.*;
import chn.bhmc.dms.sal.orc.service.dao.*;
import chn.bhmc.dms.sal.orc.vo.*;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SumOrderCntServiceImpl
 * @Description : 종합오더현황
 * @author
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.15          최초 생성
 * </pre>
 */

@Service("sumOrderCntService")
public class SumOrderCntServiceImpl extends HService implements SumOrderCntService, JxlsSupport {

    /**
     * 종합오더현황 DAO 선언
     */
    @Resource(name="sumOrderCntDAO")
    SumOrderCntDAO sumOrderCntDAO;


    /**
     * 조회 조건에 해당하는 종합오더현황-딜러 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return 조회 목록
     */
    @Override
    public List<SumOrderCntVO> selectSumOrderCntDlrsByCondition(SumOrderCntSearchVO searchVO) throws Exception{
        return sumOrderCntDAO.selectSumOrderCntDlrsByCondition(searchVO);
    }
    
    /**
     * 新增订单综合现况新统计逻辑service
     * @param searchVO 
     * @return 조회 목록
     */
    @Override
    public List<SumOrderCntVO> selectSumOrderCntDlrsByConditionForNew(SumOrderCntSearchVO searchVO) throws Exception{
        return sumOrderCntDAO.selectSumOrderCntDlrsByConditionForNew(searchVO);
    }

    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    @Override
    public int selectSumOrderCntDlrsByConditionCnt(SumOrderCntSearchVO searchVO) throws Exception{
        return sumOrderCntDAO.selectSumOrderCntDlrsByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 종합오더현황-딜러 세부 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return 조회 목록
     */
    @Override
    public List<SumOrderCntSubVO> selectSumOrderCntDlrSubsByCondition(SumOrderCntSearchVO searchVO) throws Exception{
        return sumOrderCntDAO.selectSumOrderCntDlrSubsByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    @Override
    public int selectSumOrderCntDlrSubsByConditionCnt(SumOrderCntSearchVO searchVO) throws Exception{
        return sumOrderCntDAO.selectSumOrderCntDlrSubsByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 종합오더현황-딜러 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return 조회 목록
     */
    @Override
    public List<SumOrderCntVO> selectSumOrderCntDlrsAsByCondition(SumOrderCntSearchVO searchVO) throws Exception{
        return sumOrderCntDAO.selectSumOrderCntDlrsAsByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    @Override
    public int selectSumOrderCntDlrsAsByConditionCnt(SumOrderCntSearchVO searchVO) throws Exception{
        return sumOrderCntDAO.selectSumOrderCntDlrsAsByConditionCnt(searchVO);
    }

    /**
     * 엑셀다운로드
     **/
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {
        SumOrderCntSearchVO searchVO = new SumOrderCntSearchVO();

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
         }


        if(searchVO.issMainSubDivision()==true){ // true 일때가 메인 그리드 데이터 export
        	//20180919订单综合现况统计逻辑变更_下载逻辑变更 update by sunzq start
             /*if(searchVO.getStrOrdTp().equals("N1")||searchVO.getStrOrdTp().equals("AD")||searchVO.getStrOrdTp().equals("NS")||searchVO.getStrOrdTp().equals("N7")||searchVO.getStrOrdTp().equals("N5")){
                  List<SumOrderCntVO> list = selectSumOrderCntDlrsByCondition(searchVO); // 메인
                  context.putVar("items", list);
               }else{
                   List<SumOrderCntVO> list = selectSumOrderCntDlrsAsByCondition(searchVO); // 메인
                   context.putVar("items", list);
               }*/
        	List<SumOrderCntVO> list = selectSumOrderCntDlrsByConditionForNew(searchVO); // 메인
            context.putVar("items", list);
        	//20180919订单综合现况统计逻辑变更_下载逻辑变更 update by sunzq end
            }else{
            	//R19092902175 订单综合详情  明细查询修改 贾明 2019-10-9  详细情况 下载功能  start
            	if(!StringUtils.isBlank(params.get("sOrdStartDt").toString())){
                    String sOrdStartDt = params.get("sOrdStartDt").toString();
                    Date ordStartDt = DateUtil.convertToDate(sOrdStartDt);
                    searchVO.setsOrdStartDt(ordStartDt);
                }
                if(!StringUtils.isBlank(params.get("sOrdEndDt").toString())){
                    String sOrdEndDt = params.get("sOrdEndDt").toString();
                    Date ordEndDt = DateUtil.convertToDate(sOrdEndDt);
                    searchVO.setsOrdEndDt(ordEndDt);
                }
              //R19092902175 订单综合详情  明细查询修改 贾明 2019-10-9  详细情况 下载功能 end
            	List<SumOrderCntSubVO> list = selectSumOrderCntDlrSubsByCondition(searchVO);  // 서브
                context.putVar("items", list);
            }

    }


}
