package chn.bhmc.dms.ser.delivery.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.apache.commons.lang.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.ser.delivery.service.DeliveryCheckService;
import chn.bhmc.dms.ser.ro.service.dao.RepairOrderDAO;
import chn.bhmc.dms.ser.ro.vo.RepairOrderSearchVO;
import chn.bhmc.dms.ser.ro.vo.RepairOrderVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RepairOrderServiceImpl.java
 * @Description : RO ServiceImpl
 * @author KyungMok Kim
 * @since 2016. 3. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 14.   KyungMok Kim     최초 생성
 * </pre>
 */

@Service("deliveryCheckService")
public class DeliveryCheckServiceImpl extends HService implements DeliveryCheckService, JxlsSupport {

    /**
     * 예약접수 DAO
     */
    @Resource(name="repairOrderDAO")
    RepairOrderDAO repairOrderDAO;

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        RepairOrderSearchVO searchVO = new RepairOrderSearchVO();
        if(!StringUtils.isBlank(params.get("sRoFromDt").toString())){
            String sRoFromDt = params.get("sRoFromDt").toString();
            Date dRoFromDt = DateUtil.convertToDate(sRoFromDt);
            searchVO.setsRoFromDt(dRoFromDt);
        }
        if(!StringUtils.isBlank(params.get("sRoToDt").toString())){
            String sRoToDt = params.get("sRoToDt").toString();
            Date dRoToDt = DateUtil.convertToDate(sRoToDt);
            searchVO.setsRoToDt(dRoToDt);
        }
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        List<RepairOrderVO> list = repairOrderDAO.selectRepairOrderByCondition(searchVO);
        context.putVar("items", list);

    }
}