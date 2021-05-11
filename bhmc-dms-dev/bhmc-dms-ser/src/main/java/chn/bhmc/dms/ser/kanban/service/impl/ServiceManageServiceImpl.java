package chn.bhmc.dms.ser.kanban.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.ser.kanban.vo.ServiceManageVO;
import chn.bhmc.dms.ser.kanban.service.dao.ServiceManageDAO;
import chn.bhmc.dms.ser.kanban.vo.ServiceManageSearchVO;
import chn.bhmc.dms.ser.kanban.service.ServiceManageService;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServiceManageServiceImpl.java
 * @Description : 정비관리칸반
 * @author Kim Yun Seung
 * @since 2017. 4. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 4. 26.   Kim Yun Seung    최초 생성
 * </pre>
 */
@Service("serviceManageService")
public class ServiceManageServiceImpl extends HService implements ServiceManageService {

    @Resource(name="serviceManageDAO")
    ServiceManageDAO serviceManageDAO;

    /**
     * {@inheritDoc}
     */
    @Override
    public List<ServiceManageVO> selectServiceWaitListByCondition(ServiceManageSearchVO searchVO) throws Exception {
        return serviceManageDAO.selectServiceWaitListByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectServiceManageByConditionCnt(ServiceManageSearchVO searchVO) throws Exception {
        return serviceManageDAO.selectServiceManageByConditionCnt(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<ServiceManageVO> selectServiceManageByCondition(ServiceManageSearchVO searchVO) throws Exception {
        return serviceManageDAO.selectServiceManageByCondition(searchVO);
    }




}
