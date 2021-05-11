package chn.bhmc.dms.cmm.ptl.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.ath.vo.DistributorArrearsRemindVO;
import chn.bhmc.dms.cmm.ptl.service.PortletLayoutService;
import chn.bhmc.dms.cmm.ptl.service.dao.PortletLayoutDAO;
import chn.bhmc.dms.cmm.ptl.vo.PortletDeployVO;
import chn.bhmc.dms.cmm.ptl.vo.PortletLayoutSearchVO;
import chn.bhmc.dms.cmm.ptl.vo.PortletLayoutVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PortletLayoutServiceImpl.java
 * @Description : 포틀릿 레이아웃 관리 서비스 구현 클래스
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

@Service("portletLayoutService")
public class PortletLayoutServiceImpl extends HService implements PortletLayoutService {

    /**
     * 포틀릿 레이아웃 관리 DAO
     */
	@Resource(name="portletLayoutDAO")
	PortletLayoutDAO portletLayoutDAO;

	/**
	 * {@inheritDoc}
	 */
    @Override
    public int insertPortletLayout(PortletLayoutVO portletLayoutVO)  throws Exception {

        PortletLayoutVO obj = selectPortletLayoutByKey(portletLayoutVO.getPortletLayoutId());

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        return portletLayoutDAO.insertPortletLayout(portletLayoutVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updatePortletLayout(PortletLayoutVO portletLayoutVO)  throws Exception {
        return portletLayoutDAO.updatePortletLayout(portletLayoutVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deletePortletLayout(PortletLayoutVO portletLayoutVO)  throws Exception {
        return portletLayoutDAO.deletePortletLayout(portletLayoutVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public PortletLayoutVO selectPortletLayoutByKey(String langCd)  throws Exception {
        return portletLayoutDAO.selectPortletLayoutByKey(langCd);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiPortletLayouts(BaseSaveVO<PortletLayoutVO> obj)  throws Exception {

        String userId = LoginUtil.getUserId();

        for(PortletLayoutVO portletLayoutVO : obj.getInsertList()){
            portletLayoutVO.setRegUsrId(userId);
            insertPortletLayout(portletLayoutVO);

            //디폴트 포틀릿을 설정한다.
            for(int i=1, j=portletLayoutVO.getRowCnt(); i<=j; i++){

                for(int k=1, v=portletLayoutVO.getColumnCnt(); k<=v; k++){

                    PortletDeployVO portletDeployVO = new PortletDeployVO(
                            portletLayoutVO.getPortletLayoutId(),
                            "PTL-000-00",
                            i,
                            k,
                            userId
                    );

                    insertDefaultPortletDeploy(portletDeployVO);
                }
            }
        }

        for(PortletLayoutVO portletLayoutVO : obj.getUpdateList()){
            portletLayoutVO.setRegUsrId(userId);
            updatePortletLayout(portletLayoutVO);
        }

        for(PortletLayoutVO portletLayoutVO : obj.getDeleteList()){
            deletePortletLayout(portletLayoutVO);
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<PortletLayoutVO> selectPortletLayoutsByCondition(PortletLayoutSearchVO searchVO)  throws Exception {
        return portletLayoutDAO.selectPortletLayoutsByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectPortletLayoutsByConditionCnt(PortletLayoutSearchVO searchVO)  throws Exception {
        return portletLayoutDAO.selectPortletLayoutsByConditionCnt(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public PortletLayoutVO selectDefaultPortletLayout() {
        return portletLayoutDAO.selectDefaultPortletLayout();
    }

    /*
     * @see chn.bhmc.dms.cmm.ptl.service.PortletLayoutService#selectDefaultPortletDeploies(java.lang.String)
     */
    @Override
    public List<PortletDeployVO> selectDefaultPortletDeploies(String portletLayoutId) throws Exception {
        return portletLayoutDAO.selectDefaultPortletDeploies(portletLayoutId);
    }

    /*
     * @see chn.bhmc.dms.cmm.ptl.service.PortletLayoutService#insertDefaultPortletDeploy(chn.bhmc.dms.cmm.ptl.vo.PortletDeployVO)
     */
    @Override
    public int insertDefaultPortletDeploy(PortletDeployVO portletDeployVO) throws Exception {
        return portletLayoutDAO.insertDefaultPortletDeploy(portletDeployVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.ptl.service.PortletLayoutService#updateDefaultPortletDeploy(chn.bhmc.dms.cmm.ptl.vo.PortletDeployVO)
     */
    @Override
    public int updateDefaultPortletDeploy(PortletDeployVO portletDeployVO) throws Exception {
        return portletLayoutDAO.updateDefaultPortletDeploy(portletDeployVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.ptl.service.PortletLayoutService#selectDefaultPortletDeploy(chn.bhmc.dms.cmm.ptl.vo.PortletDeployVO)
     */
    @Override
    public PortletDeployVO selectDefaultPortletDeploy(PortletDeployVO portletDeployVO) throws Exception {
        return portletLayoutDAO.selectDefaultPortletDeploy(portletDeployVO);
    }


    /*
     * @see chn.bhmc.dms.cmm.ptl.service.PortletLayoutService#insertUserPortletLayout(chn.bhmc.dms.cmm.ptl.vo.PortletLayoutVO)
     */
    @Override
    public int insertUserPortletLayout(PortletLayoutVO portletLayoutVO) throws Exception {
        String userId = LoginUtil.getUserId();
        portletLayoutVO.setUsrId(userId);
        portletLayoutVO.setRegUsrId(userId);

        return portletLayoutDAO.insertUserPortletLayout(portletLayoutVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.ptl.service.PortletLayoutService#updateUserPortletLayout(chn.bhmc.dms.cmm.ptl.vo.PortletLayoutVO)
     */
    @Override
    public int updateUserPortletLayout(PortletLayoutVO portletLayoutVO) throws Exception {

        String userId = LoginUtil.getUserId();
        portletLayoutVO.setUsrId(userId);
        portletLayoutVO.setUpdtUsrId(userId);

        return portletLayoutDAO.updateUserPortletLayout(portletLayoutVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.ptl.service.PortletLayoutService#selectUserPortletLayout(java.lang.String)
     */
    @Override
    public PortletLayoutVO selectUserPortletLayout(String usrId) throws Exception {
        return portletLayoutDAO.selectUserPortletLayout(usrId);
    }

    /*
     * @see chn.bhmc.dms.cmm.ptl.service.PortletLayoutService#insertUserPortletDeploy(chn.bhmc.dms.cmm.ptl.vo.PortletDeployVO)
     */
    @Override
    public int insertUserPortletDeploy(PortletDeployVO portletDeployVO) throws Exception {
        String usrId = LoginUtil.getUserId();

        portletDeployVO.setUsrId(usrId);
        portletDeployVO.setRegUsrId(usrId);

        return portletLayoutDAO.insertUserPortletDeploy(portletDeployVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.ptl.service.PortletLayoutService#updateUserPortletDeploy(chn.bhmc.dms.cmm.ptl.vo.PortletDeployVO)
     */
    @Override
    public int updateUserPortletDeploy(PortletDeployVO portletDeployVO) throws Exception {

        String usrId = LoginUtil.getUserId();

        portletDeployVO.setUsrId(usrId);
        portletDeployVO.setUpdtUsrId(usrId);

        return portletLayoutDAO.updateUserPortletDeploy(portletDeployVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.ptl.service.PortletLayoutService#selectUserPortletDeploy(chn.bhmc.dms.cmm.ptl.vo.PortletDeployVO)
     */
    @Override
    public PortletDeployVO selectUserPortletDeploy(PortletDeployVO portletDeployVO) throws Exception {

        String usrId = LoginUtil.getUserId();

        portletDeployVO.setUsrId(usrId);

        return portletLayoutDAO.selectUserPortletDeploy(portletDeployVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.ptl.service.PortletLayoutService#selectUserPortletDeploies(java.lang.String)
     */
    @Override
    public List<PortletDeployVO> selectUserPortletDeploies(String portletLayoutId, String usrId) throws Exception {
        return portletLayoutDAO.selectUserPortletDeploies(portletLayoutId, usrId);
    }

    /*
     * @see chn.bhmc.dms.cmm.ptl.service.PortletLayoutService#selectDistributorArrearsByCondition()
     */
	@Override
	public List<DistributorArrearsRemindVO> selectDistributorArrearsByCondition()
			throws Exception {
		return portletLayoutDAO.selectDistributorArrearsByCondition();
	}

}
