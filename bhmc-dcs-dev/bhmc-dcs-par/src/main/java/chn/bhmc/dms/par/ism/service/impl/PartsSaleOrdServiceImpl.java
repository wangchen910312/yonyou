package chn.bhmc.dms.par.ism.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.*;

import org.jxls.common.*;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.excel.*;
import chn.bhmc.dms.core.util.*;
import chn.bhmc.dms.par.ism.service.PartsSaleOrdService;
import chn.bhmc.dms.par.ism.service.dao.PartsSaleOrdDAO;
import chn.bhmc.dms.par.ism.vo.PartsSaleOrdSearchVO;
import chn.bhmc.dms.par.ism.vo.PartsSaleOrdVO;

/**
 * 부품판매 구현 클래스
 *
 * @author JU WON LEE
 * @since 2018. 2. 08.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2018. 2. 08.     JU WON LEE      최초 생성
 * </pre>
 */
@Service("partsSaleOrdService")
public class PartsSaleOrdServiceImpl extends HService implements PartsSaleOrdService, JxlsSupport {

    @Resource(name="partsSaleOrdDAO")
    private PartsSaleOrdDAO partsSaleOrdDAO;

    /*
     * @see chn.bhmc.dms.par.stm.service.PartsSaleOrdService#selectPartsSaleOrdByCondition(chn.bhmc.dms.par.stm.vo.PartsSaleOrdSearchVO)
     */
    @Override
    public List<PartsSaleOrdVO> selectPartsSaleOrdByCondition(PartsSaleOrdSearchVO searchVO) throws Exception {
        // TODO Auto-generated method stub
        return partsSaleOrdDAO.selectPartsSaleOrdByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.stm.service.PartsSaleOrdService#selectPartsSaleOrdByConditionCnt(chn.bhmc.dms.par.stm.vo.PartsSaleOrdSearchVO)
     */
    @Override
    public int selectPartsSaleOrdByConditionCnt(PartsSaleOrdSearchVO searchVO) throws Exception {
        // TODO Auto-generated method stub
        return partsSaleOrdDAO.selectPartsSaleOrdByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {
        PartsSaleOrdSearchVO searchVO = new PartsSaleOrdSearchVO();
        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        List<PartsSaleOrdVO> list = selectPartsSaleOrdByCondition(searchVO);
        context.putVar("items", list);
    }

}
