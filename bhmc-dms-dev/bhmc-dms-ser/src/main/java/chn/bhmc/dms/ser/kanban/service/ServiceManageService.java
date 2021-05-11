package chn.bhmc.dms.ser.kanban.service;

import java.util.List;

import chn.bhmc.dms.ser.kanban.vo.ServiceManageVO;
import chn.bhmc.dms.ser.kanban.vo.ServiceManageSearchVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServiceManageService.java
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

public interface ServiceManageService {

    /**
     * 정비대기 내역 조회
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<ServiceManageVO> selectServiceWaitListByCondition(ServiceManageSearchVO searchVO)throws Exception;

    /**
     * 차량점검 내역 리스트 건수조회
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectServiceManageByConditionCnt(ServiceManageSearchVO searchVO)throws Exception;

    /**
     * 차량점검 상세 내역 조회
     * Statements
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<ServiceManageVO> selectServiceManageByCondition(ServiceManageSearchVO searchVO)throws Exception;

}
