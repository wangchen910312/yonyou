package chn.bhmc.dms.mob.api.sales.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.jxls.common.Context;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import able.com.vo.HMap;
import chn.bhmc.dms.core.i18n.ReloadableDataSourceResourceBundleMessageSource;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.mob.api.sales.dao.SalesDBMessageSourceDAO;
import chn.bhmc.dms.mob.api.sales.service.SalesDBMessageSourceService;
import chn.bhmc.dms.mob.api.sales.vo.DBMessageSourceSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.DBMessageSourceVO;

/**
 * 메세지소스 관리 서비스 구현 클래스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.18         Kang Seok Han            최초 생성
 * </pre>
 */

@Service("SalesDBMessageSourceService")
public class SalesDBMessageSourceServiceImpl extends HService implements SalesDBMessageSourceService, JxlsSupport {

    /**
     * 메세지소스 관리 DAO
     */
	@Resource(name="SalesDBMessageSourceDAO")
	SalesDBMessageSourceDAO SalesDBMessageSourceDAO;
	
	/**
	 * 메세지소스 
	 */
	@Resource(name="dataSourceMessageSource")
	ReloadableDataSourceResourceBundleMessageSource dataSourceMessageSource;

	/**
     * {@inheritDoc}
     */
    @Override
    public List<DBMessageSourceVO> selectDBMessageSourcesByCondition(DBMessageSourceSearchVO searchVO) throws Exception {
        return SalesDBMessageSourceDAO.selectDBMessageSourcesByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {
        DBMessageSourceSearchVO searchVO = new DBMessageSourceSearchVO();

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
        
        searchVO.setsMesgKey(searchVO.getsMesgKey().replaceAll("&#42;", "*"));
        searchVO.setsMesgTxt(searchVO.getsMesgTxt().replaceAll("&#42;", "*"));

        List<DBMessageSourceVO> list = selectDBMessageSourcesByCondition(searchVO);
        context.putVar("items", list);
    }
}
