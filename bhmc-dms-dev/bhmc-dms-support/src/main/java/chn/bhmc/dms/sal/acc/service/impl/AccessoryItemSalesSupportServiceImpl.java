package chn.bhmc.dms.sal.acc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.DateUtil;

import chn.bhmc.dms.core.util.LoginUtil;

import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.sal.acc.service.AccessoryItemSalesSupportService;
import chn.bhmc.dms.sal.acc.service.dao.AccessoryItemSalesSupportDAO;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemSalesItemSupportVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemSalesSearchSupportVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemSalesSupportVO;

/**
 * <pre>
 * 포인트 교환 집계 정보관리 서비스
 * </pre>
 *
 * @ClassName   : AccessoryItemSalesServiceImplSupport
 * @Description : 포인트 교환 집계
 * @author
 * @since 2016. 6. 09.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 5. 19.    LIU JING            최초 생성
 * </pre>
 */

@Service("accessoryItemSalesSupportService")
public class AccessoryItemSalesSupportServiceImpl extends HService implements AccessoryItemSalesSupportService, JxlsSupport {

    /**
     * 용품판매관리 DAO 선언
     */
    @Resource(name="accessoryItemSalesSupportDAO")
    AccessoryItemSalesSupportDAO accessoryItemSalesSupportDAO;

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectAccessoryItemSalesSupportByConditionCnt(AccessoryItemSalesSearchSupportVO searchVO) throws Exception {
        return accessoryItemSalesSupportDAO.selectAccessoryItemSalesSupportByConditionCnt(searchVO);
    }
    /**
     * {@inheritDoc}
     */
    @Override
    public List<AccessoryItemSalesSupportVO> selectAccessoryItemSalesSupportByCondition(AccessoryItemSalesSearchSupportVO searchVO) throws Exception {
        return accessoryItemSalesSupportDAO.selectAccessoryItemSalesSupportByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectAccessoryItemSalesItemsSupportByConditionCnt(AccessoryItemSalesSearchSupportVO searchVO) throws Exception{
        return accessoryItemSalesSupportDAO.selectAccessoryItemSalesItemsSupportByConditionCnt(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<AccessoryItemSalesItemSupportVO> selectAccessoryItemSalesItemsSupportByCondition(AccessoryItemSalesSearchSupportVO searchVO) throws Exception{
        return accessoryItemSalesSupportDAO.selectAccessoryItemSalesItemsSupportByCondition(searchVO);
    }
    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {
        AccessoryItemSalesSearchSupportVO searchVO = new AccessoryItemSalesSearchSupportVO();
        if ( "H".equals((String)params.get("type"))) {
            ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
            if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
            if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getPltCd());}

            if (StringUtils.isNotEmpty((String)params.get("sStartRegDt"))) {
                searchVO.setsStartRegDt(DateUtil.convertToDate((String)params.get("sStartRegDt")));
            }
            if (StringUtils.isNotEmpty((String)params.get("sEndRegDt"))) {
                searchVO.setsEndRegDt(DateUtil.convertToDate((String)params.get("sEndRegDt")));
            }

            List<AccessoryItemSalesSupportVO> list = selectAccessoryItemSalesSupportByCondition(searchVO);
                context.putVar("items", list);
        }
        if ( "D".equals((String)params.get("type"))) {
            ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
            if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
            if (StringUtils.isEmpty(searchVO.getsLangCd())) {searchVO.setsLangCd(LoginUtil.getPltCd());}

            if (StringUtils.isNotEmpty((String)params.get("sStartRegDt"))) {
                searchVO.setsStartRegDt(DateUtil.convertToDate((String)params.get("sStartRegDt")));
            }
            if (StringUtils.isNotEmpty((String)params.get("sEndRegDt"))) {
                searchVO.setsEndRegDt(DateUtil.convertToDate((String)params.get("sEndRegDt")));
            }

            List<AccessoryItemSalesItemSupportVO> list = selectAccessoryItemSalesItemsSupportByCondition(searchVO);
                context.putVar("items", list);
        }
    }
}
