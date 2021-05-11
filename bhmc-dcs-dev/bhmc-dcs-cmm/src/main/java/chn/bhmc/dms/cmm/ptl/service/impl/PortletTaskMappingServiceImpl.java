package chn.bhmc.dms.cmm.ptl.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.ptl.vo.PortletTaskMappingSearchVO;

import chn.bhmc.dms.cmm.ptl.service.PortletTaskMappingService;
import chn.bhmc.dms.cmm.ptl.service.dao.PortletTaskMappingDAO;
import chn.bhmc.dms.cmm.ptl.vo.PortletTaskMappingSaveVO;
import chn.bhmc.dms.cmm.ptl.vo.PortletTaskMappingVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PortletServiceImpl.java
 * @Description : 포틀릿 관리 서비스 구현클래스
 * @author Kang Seok Han
 * @since 2016. 4. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 9.     Kang Seok Han     최초 생성
 * </pre>
 */

@Service("portletTaskMappingService")
public class PortletTaskMappingServiceImpl extends HService implements PortletTaskMappingService {

    /**
     * 포틀릿-직무 매핑 관리 DAO
     */
	@Resource(name="portletTaskMappingDAO")
	PortletTaskMappingDAO portletTaskMappingDAO;


	/**
     * {@inheritDoc}
     */
    @Override
    public List<PortletTaskMappingVO> selectPortlets() throws Exception {
        return portletTaskMappingDAO.selectPortlets();
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<PortletTaskMappingVO> selectPortletTaskMappingsByTskCd(String tskCd) throws Exception {
        return portletTaskMappingDAO.selectPortletTaskMappingsByTskCd(tskCd);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<PortletTaskMappingVO> selectPortletTaskMappingByCondition(PortletTaskMappingSearchVO portletTaskMappingSearchVO) throws Exception {
        return portletTaskMappingDAO.selectPortletTaskMappingByCondition(portletTaskMappingSearchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectPortletTaskMappingByConditionCnt(PortletTaskMappingSearchVO portletTaskMappingSearchVO) throws Exception {
        return portletTaskMappingDAO.selectPortletTaskMappingByConditionCnt(portletTaskMappingSearchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void deleteAndInsertPortletTaskMapping(PortletTaskMappingSaveVO portletTaskMappingSaveVO) throws Exception {
        portletTaskMappingDAO.deletePortletTaskMappingByTskCd(portletTaskMappingSaveVO.getTskCd());

        for(String portletId : portletTaskMappingSaveVO.getPortlets()){
            portletTaskMappingDAO.insertPortletTaskMapping(new PortletTaskMappingVO(portletTaskMappingSaveVO.getTskCd(), portletId, portletTaskMappingSaveVO.getUsrId()));
        }
    }
}
