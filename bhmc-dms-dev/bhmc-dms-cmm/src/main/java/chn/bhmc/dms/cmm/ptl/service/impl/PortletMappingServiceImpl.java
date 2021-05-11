package chn.bhmc.dms.cmm.ptl.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.cmm.ptl.service.PortletMappingService;
import chn.bhmc.dms.cmm.ptl.service.dao.PortletMappingDAO;
import chn.bhmc.dms.cmm.ptl.vo.PortletMappingSaveVO;
import chn.bhmc.dms.cmm.ptl.vo.PortletMappingSearchVO;
import chn.bhmc.dms.cmm.ptl.vo.PortletMappingVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PortletMappingServiceImpl.java
 * @Description : 포틀릿-직무/사용자 매핑 관리 서비스 구현클래스
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

@Service("portletMappingService")
public class PortletMappingServiceImpl extends HService implements PortletMappingService {

    /**
     * 포틀릿-직무/사용자 매핑 관리 DAO
     */
	@Resource(name="portletMappingDAO")
	PortletMappingDAO portletMappingDAO;

	/**
     * {@inheritDoc}
     */
    @Override
    public void deleteAndInsertPortletMapping(PortletMappingSaveVO portletMappingSaveVO) throws Exception {
        portletMappingDAO.deletePortletMappingByRefTp(portletMappingSaveVO);

        for(String portletId : portletMappingSaveVO.getPortlets()){
            portletMappingDAO.insertPortletMapping(new PortletMappingVO(portletId, portletMappingSaveVO.getRefTp(), portletMappingSaveVO.getRefId(), portletMappingSaveVO.getUsrId()));
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<PortletMappingVO> selectPortletMappingByCondition(PortletMappingSearchVO portletMappingSearchVO) throws Exception {
        return portletMappingDAO.selectPortletMappingByCondition(portletMappingSearchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectPortletMappingByConditionCnt(PortletMappingSearchVO portletMappingSearchVO) throws Exception {
        return portletMappingDAO.selectPortletMappingByConditionCnt(portletMappingSearchVO);
    }

	@Override
	public List<PortletMappingVO> selectPortletMappingByUser(PortletMappingSearchVO portletMappingSearchVO)
			throws Exception {
		return portletMappingDAO.selectPortletMappingByUser(portletMappingSearchVO);
	}
}
