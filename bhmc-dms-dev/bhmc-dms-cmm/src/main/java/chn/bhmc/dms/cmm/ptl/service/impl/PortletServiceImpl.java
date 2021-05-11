package chn.bhmc.dms.cmm.ptl.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.ptl.service.PortletService;
import chn.bhmc.dms.cmm.ptl.service.dao.PortletDAO;
import chn.bhmc.dms.cmm.ptl.vo.PortletSearchVO;
import chn.bhmc.dms.cmm.ptl.vo.PortletVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;

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

@Service("portletService")
public class PortletServiceImpl extends HService implements PortletService {

    /**
     * 포틀릿 관리 DAO
     */
	@Resource(name="portletDAO")
	PortletDAO portletDAO;

	/**
	 * {@inheritDoc}
	 */
    @Override
    public int insertPortlet(PortletVO portletVO)  throws Exception {

        PortletVO obj = selectPortletByKey(portletVO.getPortletId());

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        return portletDAO.insertPortlet(portletVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updatePortlet(PortletVO portletVO)  throws Exception {
        return portletDAO.updatePortlet(portletVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deletePortlet(PortletVO portletVO)  throws Exception {
        return portletDAO.deletePortlet(portletVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public PortletVO selectPortletByKey(String langCd)  throws Exception {
        return portletDAO.selectPortletByKey(langCd);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiPortlets(BaseSaveVO<PortletVO> obj)  throws Exception {

        String userId = LoginUtil.getUserId();

        for(PortletVO portletVO : obj.getInsertList()){
            portletVO.setRegUsrId(userId);
            insertPortlet(portletVO);
        }

        for(PortletVO portletVO : obj.getUpdateList()){
            portletVO.setRegUsrId(userId);
            updatePortlet(portletVO);
        }

        for(PortletVO portletVO : obj.getDeleteList()){
            deletePortlet(portletVO);
        }
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public List<PortletVO> selectPortletsByCondition(PortletSearchVO searchVO)  throws Exception {
        return portletDAO.selectPortletsByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectPortletsByConditionCnt(PortletSearchVO searchVO)  throws Exception {
        return portletDAO.selectPortletsByConditionCnt(searchVO);
    }




}
