package chn.bhmc.dms.mis.tpm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.mis.tpm.service.TargetPcsMnrService;
import chn.bhmc.dms.mis.tpm.service.dao.TargetPcsMnrDAO;
import chn.bhmc.dms.mis.tpm.vo.TargetPcsMnrSearchVO;

/**
 * <pre>
 * 과정 모니터링
 * </pre>
 *
 * @ClassName   : TargetPcsMnrServiceImpl.java
 * @Description : 과정 모니터링
 * @author chibeom.song
 * @since 2016. 9. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 20.   chibeom.song     최초 생성
 * </pre>
 */
@Service("targetPcsMnrService")
public class TargetPcsMnrServiceImpl extends HService implements TargetPcsMnrService {

    /**
     * 과정 모니터링 DAO
     */
    @Resource(name="targetPcsMnrDAO")
    TargetPcsMnrDAO targetPcsMnrDAO;

    /**
     * 과정 모니터링 - 딜러현황(집객달성현황) 자료를 조회한다.
     */
    @Override
    public int selectDealerCustAchieveGridCnt(TargetPcsMnrSearchVO searchVO) throws Exception {
        return targetPcsMnrDAO.selectDealerCustAchieveGridCnt(searchVO);
    }

    /**
     * 과정 모니터링 - 딜러현황(집객달성현황) 자료를 조회한다.
     */
    @Override
    public List<TargetPcsMnrSearchVO> selectDealerCustAchieveGrid(TargetPcsMnrSearchVO searchVO) throws Exception {

        return targetPcsMnrDAO.selectDealerCustAchieveGrid(searchVO);
    }

    /**
     * 과정 모니터링 - 과정관리(판매) 자료를 조회한다.
     */
    @Override
    public List<TargetPcsMnrSearchVO> selectDealerSaleProcessGrid(TargetPcsMnrSearchVO searchVO) throws Exception {

        return targetPcsMnrDAO.selectDealerSaleProcessGrid(searchVO);
    }

    /**
     * 과정 모니터링 - 과정관리(집객) 자료를 조회한다.
     */
    @Override
    public List<TargetPcsMnrSearchVO> selectDealerCustProcessGrid(TargetPcsMnrSearchVO searchVO) throws Exception {

        return targetPcsMnrDAO.selectDealerCustProcessGrid(searchVO);
    }

    /**
     * 과정 모니터링 - KPI 자료를 조회한다.
     */
    @Override
    public List<TargetPcsMnrSearchVO> selectDealerKpiSearch(TargetPcsMnrSearchVO targetDcptMgmtSearchVO) throws Exception {

        return targetPcsMnrDAO.selectDealerKpiSearch(targetDcptMgmtSearchVO);
    }

}
