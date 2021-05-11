package chn.bhmc.dms.mob.api.sales.service.impl;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.jxls.common.Context;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import able.com.vo.HMap;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.mob.api.sales.dao.SalesDlrOrderSearchDAO;
import chn.bhmc.dms.mob.api.sales.service.SalesDlrOrderSearchService;
import chn.bhmc.dms.mob.api.sales.vo.SumOrderCntSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.SumOrderCntVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DlrOrderSearchServiceImpl
 * @Description : 딜러주문조회
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

@Service("SalesDlrOrderSearchService")
public class SalesDlrOrderSearchServiceImpl extends HService implements SalesDlrOrderSearchService, JxlsSupport {

    /**
     * 딜러주문조회 DAO 선언
     */
    @Resource(name="SalesDlrOrderSearchDAO")
    SalesDlrOrderSearchDAO SalesDlrOrderSearchDAO;

    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    @Override
    public int selectDlrOrderSearchsByConditionCnt(SumOrderCntSearchVO searchVO) throws Exception{
        return SalesDlrOrderSearchDAO.selectDlrOrderSearchsByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 딜러주문조회 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return 조회 목록
     */
    @Override
    public List<SumOrderCntVO> selectDlrOrderSearchsByCondition(SumOrderCntSearchVO searchVO) throws Exception{
        return SalesDlrOrderSearchDAO.selectDlrOrderSearchsByCondition(searchVO);
    }


    /**
     * 엑셀 다운로드
     * @param list
     * @throws Exception
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        SumOrderCntSearchVO searchVO = new SumOrderCntSearchVO();

        String sOrdTpCd;
        String[] arrayOrdTpCdStr;
        List<String> sOrdTpCdLst = new ArrayList<String>();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        if (StringUtils.isNotEmpty((String)params.get("sOrdTpList"))) {
            sOrdTpCd = (String)params.get("sOrdTpList");
            arrayOrdTpCdStr = sOrdTpCd.split(",");
            sOrdTpCdLst = Arrays.asList(arrayOrdTpCdStr);
            searchVO.setsOrdTpList(sOrdTpCdLst);
        }

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        List<SumOrderCntVO> list = SalesDlrOrderSearchDAO.selectDlrOrderSearchsByConditionXls(searchVO);

        context.putVar("items", list);
    }

    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    @Override
    public int selectDlrOrderSumByConditionCnt(SumOrderCntSearchVO searchVO) throws Exception{
        return SalesDlrOrderSearchDAO.selectDlrOrderSumByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 딜러주문조회 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return 조회 목록
     */
    @Override
    public List<SumOrderCntVO> selectDlrOrderSumByCondition(SumOrderCntSearchVO searchVO) throws Exception{
        return SalesDlrOrderSearchDAO.selectDlrOrderSumByCondition(searchVO);
    }
}
