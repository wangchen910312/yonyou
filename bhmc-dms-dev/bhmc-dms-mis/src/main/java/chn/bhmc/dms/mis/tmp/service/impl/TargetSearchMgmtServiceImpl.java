package chn.bhmc.dms.mis.tmp.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.jxls.common.Context;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.mis.tmp.service.TargetSearchMgmtService;
import chn.bhmc.dms.mis.tmp.service.dao.TargetSearchMgmtDAO;
import chn.bhmc.dms.mis.tmp.vo.TargetSearchMgmtVO;
/**
 * <pre>
 * [제조사] 년월간 목표 조회
 * </pre>
 *
 * @ClassName   : TargetSearchMgmtServiceImpl.java
 * @Description : [제조사] 년월간 목표 조회
 * @author chibeom.song
 * @since 2016. 7. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 22.   chibeom.song     최초 생성
 * </pre>
 */
@Service("targetSearchMgmtService")
public class TargetSearchMgmtServiceImpl extends HService implements TargetSearchMgmtService, JxlsSupport {

    /**
     * 단위 관리 DAO
     */
    @Resource(name="targetSearchMgmtDAO")
    TargetSearchMgmtDAO targetSearchMgmtDAO;

    /**
     * {@inheritDoc}
     */
    @Override
    public List<TargetSearchMgmtVO> selectTargetSearchMgmtByCondition(TargetSearchMgmtVO searchVO) throws Exception {
        return targetSearchMgmtDAO.selectTargetSearchMgmtByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectTargetSearchMgmtByConditionCnt(TargetSearchMgmtVO searchVO) throws Exception {
        return targetSearchMgmtDAO.selectTargetSearchMgmtByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        TargetSearchMgmtVO searchVO = new TargetSearchMgmtVO();

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        List<TargetSearchMgmtVO> list = selectTargetSearchMgmtByCondition(searchVO);
        context.putVar("items", list);
    }

    /*
     * @see chn.bhmc.dms.mis.tmp.service.TargetMonthRegService#selectDealerList(chn.bhmc.dms.mis.tmp.vo.TargetMonthRegSearchVO)
     */
    @Override
    public List<TargetSearchMgmtVO> selectSdptList(TargetSearchMgmtVO searchVO) {

        return targetSearchMgmtDAO.selectSdptList(searchVO);
    }

    /*
     * @see chn.bhmc.dms.mis.tmp.service.TargetMonthRegService#selectDealerList(chn.bhmc.dms.mis.tmp.vo.TargetMonthRegSearchVO)
     */
    @Override
    public List<TargetSearchMgmtVO> selectOfficeList(TargetSearchMgmtVO searchVO) {

        return targetSearchMgmtDAO.selectOfficeList(searchVO);
    }

    /*
     * @see chn.bhmc.dms.mis.tmp.service.TargetMonthRegService#selectDealerList(chn.bhmc.dms.mis.tmp.vo.TargetMonthRegSearchVO)
     */
    @Override
    public List<TargetSearchMgmtVO> selectDealerList(TargetSearchMgmtVO searchVO) {

        return targetSearchMgmtDAO.selectDealerList(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectOfficeListCnt(TargetSearchMgmtVO searchVO) throws Exception {
        return targetSearchMgmtDAO.selectOfficeListCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.mis.tmp.service.TargetMonthRegService#selectDealerList(chn.bhmc.dms.mis.tmp.vo.TargetMonthRegSearchVO)
     */
    @Override
    public List<TargetSearchMgmtVO> selectMonthOfficeList(TargetSearchMgmtVO searchVO) {

        return targetSearchMgmtDAO.selectMonthOfficeList(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectDealerListCnt(TargetSearchMgmtVO searchVO) throws Exception {
        return targetSearchMgmtDAO.selectDealerListCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.mis.tmp.service.TargetMonthRegService#selectDealerList(chn.bhmc.dms.mis.tmp.vo.TargetMonthRegSearchVO)
     */
    @Override
    public List<TargetSearchMgmtVO> selectMonthDealerList(TargetSearchMgmtVO searchVO) {

        return targetSearchMgmtDAO.selectMonthDealerList(searchVO);
    }

}
