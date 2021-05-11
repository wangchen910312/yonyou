package chn.bhmc.dms.sal.lom.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.DateUtil;

import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.sal.lom.service.TpVehicleMonitoringService;
import chn.bhmc.dms.sal.lom.service.dao.TpVehicleMonitoringDAO;
import chn.bhmc.dms.sal.lom.vo.DistributorAbnormalInventorySearchVO;
import chn.bhmc.dms.sal.lom.vo.DistributorAbnormalInventoryVO;
import chn.bhmc.dms.sal.lom.vo.TpVehicleConditionSearchVO;
import chn.bhmc.dms.sal.lom.vo.TpVehicleConditionVO;
import chn.bhmc.dms.sal.lom.vo.TpVehicleMonitoringDlrDetailPopupVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : TpVehicleMonitoringImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Lee Seungmin
 * @since 2016. 3. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 23.     Lee Seungmin     최초 생성
 * </pre>
 */

@Service("tpVehicleMonitoringService")
public class TpVehicleMonitoringImpl extends HService implements TpVehicleMonitoringService, JxlsSupport{

    @Resource(name="tpVehicleMonitoringDAO")
    TpVehicleMonitoringDAO tpVehicleMonitoringDAO;

    @Override
    public List<TpVehicleConditionVO> selectTpVehicleMonitoringCondition(TpVehicleConditionSearchVO searchVO) throws Exception {
        return tpVehicleMonitoringDAO.selectTpVehicleMonitoringCondition(searchVO);
    }

    @Override
    public int selectTpVehicleMonitoringConditionCnt(TpVehicleConditionSearchVO searchVO)  throws Exception {
        return tpVehicleMonitoringDAO.selectTpVehicleMonitoringConditionCnt(searchVO);
    }

    @Override
    public List<TpVehicleConditionVO> selectTpVehicleMonitoringConditionPopup(TpVehicleConditionSearchVO searchVO) throws Exception {
        return tpVehicleMonitoringDAO.selectTpVehicleMonitoringConditionPopup(searchVO);
    }

    @Override
    public int selectTpVehicleMonitoringConditionPopupCnt(TpVehicleConditionSearchVO searchVO)  throws Exception {
        return tpVehicleMonitoringDAO.selectTpVehicleMonitoringConditionPopupCnt(searchVO);
    }

    /**
     * 운송내역 상세조회 팝업(TP차량모니터링 상세) 조회
     * @return
     * @throws Exception
     */
    @Override
    public int selectTpMonitoringDlrDetailSearchsByConditionCnt(TpVehicleConditionSearchVO searchVO) throws Exception {
        return tpVehicleMonitoringDAO.selectTpMonitoringDlrDetailSearchsByConditionCnt(searchVO);
    }

    /**
     * 운송내역 상세조회 팝업(TP차량모니터링 상세) 조회
     * @return
     * @throws Exception
     */
    @Override
    public List<TpVehicleMonitoringDlrDetailPopupVO> selectTpMonitoringDlrDetailSearchsByCondition(TpVehicleConditionSearchVO searchVO) throws Exception{
        return tpVehicleMonitoringDAO.selectTpMonitoringDlrDetailSearchsByCondition(searchVO);
    }

    /**
     * vin 운송정보 조회
     * @param sVinNo
     * @return
     * @throws Exception
     */
    @Override
    public TpVehicleConditionVO selectVehicleStatCdSearch(String sVinNo) throws Exception{
        return tpVehicleMonitoringDAO.selectVehicleStatCdSearch(sVinNo);
    }


    /**
     * 일괄등록 데이터를 저장 한다.
     * @param list
     * @throws Exception
     */
    @Override
    public int insertTpVehicleMonitoringUpload(List<TpVehicleConditionVO> list) throws Exception{

        for(TpVehicleConditionVO tpVO : list){
            tpVO.setRegUsrId(LoginUtil.getUserId());

            // 단일 저장
            tpVehicleMonitoringDAO.insertTpVehicleMonitoringUpload(tpVO);
            tpVehicleMonitoringDAO.insertTpVehicleMonitoringUploadIf(tpVO);
        }

        // 묶어서 저장
        //tpVehicleMonitoringDAO.insertTpVehicleMonitoringUploads(list);
        //tpVehicleMonitoringDAO.insertTpVehicleMonitoringUploadIfs(list);
        return 1;
    }


    /**
     * 엑셀 다운로드
     * @param list
     * @throws Exception
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        TpVehicleConditionSearchVO searchVO = new TpVehicleConditionSearchVO();

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        if (StringUtils.isNotEmpty((String)params.get("sSrchFrDt"))) {
            searchVO.setsSrchFrDt(DateUtil.convertToDate((String)params.get("sSrchFrDt")));
        }
        if (StringUtils.isNotEmpty((String)params.get("sSrchToDt"))) {
            searchVO.setsSrchToDt(DateUtil.convertToDate((String)params.get("sSrchToDt")));
        }

        List<TpVehicleConditionVO> list = selectTpVehicleMonitoringCondition(searchVO);
        context.putVar("items", list);
    }

	@Override
	public int selectDistributorAbnormalInventoryCnt(DistributorAbnormalInventorySearchVO searchVO) throws Exception {
		return tpVehicleMonitoringDAO.selectDistributorAbnormalInventoryCnt(searchVO);
	}

	@Override
	public List<TpVehicleConditionVO> selectDistributorAbnormalInventory(DistributorAbnormalInventorySearchVO searchVO)
			throws Exception {
		return tpVehicleMonitoringDAO.selectDistributorAbnormalInventory(searchVO);
	}


}
