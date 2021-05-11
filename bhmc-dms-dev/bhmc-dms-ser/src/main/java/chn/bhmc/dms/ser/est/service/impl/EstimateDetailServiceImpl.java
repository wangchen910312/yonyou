package chn.bhmc.dms.ser.est.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.par.ism.service.IssueReqService;
import chn.bhmc.dms.ser.est.service.EstimateDetailService;
import chn.bhmc.dms.ser.est.service.dao.EstimateDetailDAO;
import chn.bhmc.dms.ser.est.vo.EstimateDetailVO;
import chn.bhmc.dms.ser.est.vo.EstimateSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : EstimateDetailServiceImpl.java
 * @Description : 정산 디테일 ServiceImpl
 * @author KyungMok Kim
 * @since 2016. 4. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 18.   KyungMok Kim     최초 생성
 * </pre>
 */

@Service("estimateDetailService")
public class EstimateDetailServiceImpl extends HService implements EstimateDetailService {

    /**
     * 정산 디테일 DAO
     */
    @Resource(name="estimateDetailDAO")
    EstimateDetailDAO estimateDetailDAO;

    /**
     * 부품요청 Service
     */
    @Resource(name="issueReqService")
    IssueReqService issueReqService;

    /**
     * 조회 조건에 해당하는 디테일 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 EstimateSearchVO
     * @return 조회 목록
     */
    public int selectEstimateDetailsByConditionCnt(EstimateSearchVO searchVO) throws Exception {
        return estimateDetailDAO.selectEstimateDetailsByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 디테일을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 EstimateSearchVO
     * @return 조회 목록
     */
    public List<EstimateDetailVO> selectEstimateDetailsByCondition(EstimateSearchVO searchVO) throws Exception {
        return estimateDetailDAO.selectEstimateDetailsByCondition(searchVO);
    }

    public void deleteEstimateDetail(EstimateDetailVO estimateDetailVO) throws Exception {
        estimateDetailDAO.deleteEstimateDetail(estimateDetailVO);
    }

    /*
     * @see chn.bhmc.dms.ser.ro.service.EstimateDetailService#insertEstimateDetail(chn.bhmc.dms.ser.ro.vo.EstimateDetailVO)
     */
    public void insertEstimateDetail(EstimateDetailVO estimateDetailVO) throws Exception {
        estimateDetailDAO.insertEstimateDetail(estimateDetailVO);
    }

    /*
     * @see chn.bhmc.dms.ser.ro.service.EstimateDetailService#updateEstimateDetail(chn.bhmc.dms.ser.ro.vo.EstimateDetailVO)
     */
    public void updateEstimateDetail(EstimateDetailVO estimateDetailVO) throws Exception {
        estimateDetailDAO.updateEstimateDetail(estimateDetailVO);

    }

}