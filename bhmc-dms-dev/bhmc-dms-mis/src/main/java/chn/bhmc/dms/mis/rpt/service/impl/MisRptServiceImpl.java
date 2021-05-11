package chn.bhmc.dms.mis.rpt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.mis.rpt.vo.MisRptVO;
import chn.bhmc.dms.mis.rpt.service.MisRptService;
import chn.bhmc.dms.mis.rpt.service.dao.MisRptDAO;
/**
 * <pre>
 * [DCS] 경영관리 레포트
 * </pre>
 *
 * @ClassName   : MisRptServiceImpl.java
 * @Description : [DCS] 경영관리 레포트
 * @author chibeom.song
 * @since 2017. 1. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 1. 12.   chibeom.song     최초 생성
 * </pre>
 */
@Service("misRptService")
public class MisRptServiceImpl extends HService implements MisRptService {

    @Resource(name="misRptDAO")
    MisRptDAO misRptDAO;

    @Override
    public List<MisRptVO> selectSdptList(MisRptVO searchVO) {
        return misRptDAO.selectSdptList(searchVO);
    }

    @Override
    public List<MisRptVO> selectOfficeList(MisRptVO searchVO) {
        return misRptDAO.selectOfficeList(searchVO);
    }

    @Override
    public List<MisRptVO> selectDealerList(MisRptVO searchVO) {
        return misRptDAO.selectDealerList(searchVO);
    }

    @Override
    public int selectOfficeListCnt(MisRptVO searchVO) throws Exception {
        return misRptDAO.selectOfficeListCnt(searchVO);
    }

    @Override
    public int selectDealerListCnt(MisRptVO searchVO) throws Exception {
        return misRptDAO.selectDealerListCnt(searchVO);
    }

    @Override
    public List<MisRptVO> selectMonthOfficeList(MisRptVO searchVO) {
        return misRptDAO.selectMonthOfficeList(searchVO);
    }

    @Override
    public List<MisRptVO> selectMonthDealerList(MisRptVO searchVO) {
        return misRptDAO.selectMonthDealerList(searchVO);
    }

}
