package chn.bhmc.dms.dply.spec.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.jxls.common.Context;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.dply.spec.service.DplySpecListService;
import chn.bhmc.dms.dply.spec.service.dao.DplySpecListDAO;
import chn.bhmc.dms.dply.spec.vo.DplySpecListSearchVO;
import chn.bhmc.dms.dply.spec.vo.DplySpecListVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DplySpecListServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 3. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 22.     Kang Seok Han     최초 생성
 * </pre>
 */

@Service("dplySpecListService")
public class DplySpecListServiceImpl  extends HService  implements DplySpecListService, JxlsSupport {

    /**
     * Spec 리스트 DAO
     */
    @Resource(name="dplySpecListDAO")
    DplySpecListDAO dplySpecListDAO;

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {
        // TODO Auto-generated method stub

    }

    /*
     * @see chn.bhmc.dms.dply.spec.service.DplySpecListService#selectSpecListByCondition(chn.bhmc.dms.dply.spec.vo.DplySpecListSearchVO)
     */
    @Override
    public List<DplySpecListVO> selectSpecListByCondition(DplySpecListSearchVO searchVO) throws Exception {
        return dplySpecListDAO.selectSpecListByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.dply.spec.service.DplySpecListService#selectSpecListByConditionCnt(chn.bhmc.dms.dply.spec.vo.DplySpecListSearchVO)
     */
    @Override
    public int selectSpecListByConditionCnt(DplySpecListSearchVO searchVO) throws Exception {
        return dplySpecListDAO.selectSpecListByConditionCnt(searchVO);
    }

}
