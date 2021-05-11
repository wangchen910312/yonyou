package chn.bhmc.dms.ser.kanban.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.kanban.vo.ServiceManageVO;
import chn.bhmc.dms.ser.kanban.vo.ServiceManageSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServiceManageDAO.java
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
@Mapper("serviceManageDAO")
public interface ServiceManageDAO {

    /**
    *
    * 정비대기 정보 리스트 조회
    *
    * @param searchVO - 사전점검 간반보드 정보 조회
    * @return
    * @throws Exception
    */
    public List<ServiceManageVO> selectServiceWaitListByCondition(ServiceManageSearchVO searchVO) throws Exception;

    /**
     * 기전수리 정보 리스트 수 조회
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectServiceManageByConditionCnt(ServiceManageSearchVO searchVO) throws Exception;

    /**
    *
    * 기전수리 정보 리스트 조회
    *
    * @param searchVO - 사전점검 간반보드 정보 조회
    * @return
    * @throws Exception
    */
    public List<ServiceManageVO> selectServiceManageByCondition(ServiceManageSearchVO searchVO) throws Exception;

}
