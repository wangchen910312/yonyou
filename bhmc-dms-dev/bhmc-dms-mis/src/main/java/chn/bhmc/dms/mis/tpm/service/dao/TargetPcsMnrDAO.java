package chn.bhmc.dms.mis.tpm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.mis.tpm.vo.TargetPcsMnrSearchVO;

/**
 * <pre>
 * 과정 모니터링
 * </pre>
 *
 * @ClassName   : TargetPcsMnrDAO.java
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
@Mapper("targetPcsMnrDAO")
public interface TargetPcsMnrDAO {

    /**
     * 조회 조건에 해당하는 딜러현황(집객달성현황) 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetPcsMnrSearchVO
     * @return
     */
    public int selectDealerCustAchieveGridCnt(TargetPcsMnrSearchVO searchVO);

    /**
     * 과정 모니터링 - 딜러현황(집객달성현황) 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetPcsMnrSearchVO
     * @return
     */
    public List<TargetPcsMnrSearchVO> selectDealerCustAchieveGrid(TargetPcsMnrSearchVO searchVO);

    /**
     * 과정 모니터링 - 과정관리(판매) 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetPcsMnrSearchVO
     * @return
     */
    public List<TargetPcsMnrSearchVO> selectDealerSaleProcessGrid(TargetPcsMnrSearchVO searchVO);

    /**
     * 과정 모니터링 - 과정관리(집객) 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetPcsMnrSearchVO
     * @return
     */
    public List<TargetPcsMnrSearchVO> selectDealerCustProcessGrid(TargetPcsMnrSearchVO searchVO);

    /**
     * 과정 모니터링 - KPI 자료를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetPcsMnrSearchVO
     * @return
     */
    public List<TargetPcsMnrSearchVO> selectDealerKpiSearch(TargetPcsMnrSearchVO targetDcptMgmtSearchVO);

}
