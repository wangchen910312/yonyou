package chn.bhmc.dms.cmm.sci.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.GridIndividualizationService;
import chn.bhmc.dms.cmm.sci.service.dao.GridIndividualizationDAO;
import chn.bhmc.dms.cmm.sci.vo.GridIndividualizationSearchVO;
import chn.bhmc.dms.cmm.sci.vo.GridIndividualizationVO;

/**
 * <pre>
 * 그리드 개인화 관리 서비스 구현 클래스
 * </pre>
 *
 * @ClassName   : GridIndividualizationServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 7. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 6.     Kang Seok Han     최초 생성
 * </pre>
 */
@Service("gridIndividualizationService")
public class GridIndividualizationServiceImpl extends HService implements GridIndividualizationService {

    @Resource(name="gridIndividualizationDAO")
    GridIndividualizationDAO gridIndividualizationDAO;

    /**
     * {@inheritDoc}
     */
    @Override
    @CacheEvict(value="gridIndvCache", allEntries=true)
    public synchronized int insertOrUpdateGridIndividualization(GridIndividualizationVO gridIndividualizationVO) throws Exception {
        GridIndividualizationVO old = selectGridIndividualizationByKey(gridIndividualizationVO.getGridId(), gridIndividualizationVO.getUsrId(), gridIndividualizationVO.getGridIndvTp());

        if(old == null) {
            return gridIndividualizationDAO.insertGridIndividualization(gridIndividualizationVO);
        }

        return gridIndividualizationDAO.updateGridIndividualization(gridIndividualizationVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @CacheEvict(value="gridIndvCache", allEntries=true)
    public int deleteGridIndividualization(GridIndividualizationVO gridIndividualizationVO) throws Exception {
        return gridIndividualizationDAO.deleteGridIndividualization(gridIndividualizationVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @Cacheable(value="gridIndvCache")
    public GridIndividualizationVO selectGridIndividualizationByKey(String gridId, String usrId, String gridIndvTp)
            throws Exception {
        return gridIndividualizationDAO.selectGridIndividualizationByKey(gridId, usrId, gridIndvTp);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @Cacheable(value="gridIndvCache")
    public List<GridIndividualizationVO> selectGridIndividualizationsByCondition(GridIndividualizationSearchVO searchVO)
            throws Exception {
        return gridIndividualizationDAO.selectGridIndividualizationsByCondition(searchVO);
    }
}
