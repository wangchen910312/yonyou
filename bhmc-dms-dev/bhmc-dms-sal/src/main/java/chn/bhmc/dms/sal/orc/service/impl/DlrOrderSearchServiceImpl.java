package chn.bhmc.dms.sal.orc.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.apache.commons.lang.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.sal.orc.service.DlrOrderSearchService;
import chn.bhmc.dms.sal.orc.service.dao.DlrOrderSearchDAO;
import chn.bhmc.dms.sal.orc.vo.SumOrderCntSearchVO;
import chn.bhmc.dms.sal.orc.vo.SumOrderCntSubVO;
import chn.bhmc.dms.sal.orc.vo.SumOrderCntVO;

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

@Service("dlrOrderSearchService")
public class DlrOrderSearchServiceImpl extends HService implements DlrOrderSearchService, JxlsSupport {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 딜러주문조회 DAO 선언
     */
    @Resource(name="dlrOrderSearchDAO")
    DlrOrderSearchDAO dlrOrderSearchDAO;

    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    @Override
    public int selectDlrOrderSearchsByConditionCnt(SumOrderCntSearchVO searchVO) throws Exception{
        return dlrOrderSearchDAO.selectDlrOrderSearchsByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 딜러주문조회 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return 조회 목록
     */
    @Override
    public List<SumOrderCntVO> selectDlrOrderSearchsByCondition(SumOrderCntSearchVO searchVO) throws Exception{
        return dlrOrderSearchDAO.selectDlrOrderSearchsByCondition(searchVO);
    }


    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    @Override
    public int selectDlrOrderSearchSubsByConditionCnt(SumOrderCntSearchVO searchVO) throws Exception{
        return dlrOrderSearchDAO.selectDlrOrderSearchSubsByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 딜러주문조회 세부 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AskHelpCarSearchVO
     * @return 조회 목록
     */
    @Override
    public List<SumOrderCntSubVO> selectDlrOrderSearchSubsByCondition(SumOrderCntSearchVO searchVO) throws Exception{
        return dlrOrderSearchDAO.selectDlrOrderSearchSubsByCondition(searchVO);
    }

    @Override
    public List<SumOrderCntSubVO> selectMonthDlrOrderTypes(SumOrderCntSearchVO searchVO) throws Exception{
        return dlrOrderSearchDAO.selectMonthDlrOrderTypes(searchVO);
    }

    /**
     * 엑셀 다운로드
     * @param list
     * @throws Exception
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {
        String langCd = LocaleContextHolder.getLocale().getLanguage();
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

        List<SumOrderCntVO> list = dlrOrderSearchDAO.selectDlrOrderSearchsByCondition(searchVO);

        HashMap<String, String> ordStatMap = new HashMap<String, String>();
        for(CommonCodeVO vo : commonCodeService.selectCommonCodesByCmmGrpCd("SAL150", null, langCd)){
            ordStatMap.put(vo.getCmmCd(), vo.getCmmCdNm());
        }
        HashMap<String, String> vinmVlocMap = new HashMap<String, String>();
        for(CommonCodeVO vo : commonCodeService.selectCommonCodesByCmmGrpCd("SAL211", null, langCd)){
            vinmVlocMap.put(vo.getCmmCd(), vo.getCmmCdNm());
        }
        HashMap<String, String> ordTpMap = new HashMap<String, String>();
        for(CommonCodeVO vo : commonCodeService.selectCommonCodesByCmmGrpCd("SAL137", null, langCd)){
            ordTpMap.put(vo.getCmmCd(), vo.getCmmCdNm());
        }

        for(SumOrderCntVO vo : list){
            vo.setOrdStatCd(ordStatMap.get(vo.getOrdStatCd()));
            vo.setVinmVloc(vinmVlocMap.get(vo.getVinmVloc()));
            vo.setOrdTp(ordTpMap.get(vo.getOrdTp()));
        }

        context.putVar("items", list);
    }
}
