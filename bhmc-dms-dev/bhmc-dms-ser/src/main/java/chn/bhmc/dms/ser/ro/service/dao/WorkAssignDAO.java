package chn.bhmc.dms.ser.ro.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.ser.ro.vo.VedioChannelApplyVO;
import chn.bhmc.dms.ser.ro.vo.VedioChannelBayVO;
import chn.bhmc.dms.ser.ro.vo.WorkAssignSearchVO;
import chn.bhmc.dms.ser.ro.vo.WorkAssignVO;

/**
 * <pre>
 * 작업배정 처리에 대한 mapper class
 * </pre>
 *
 * @ClassName   : WorkAssignDAO.java
 * @Description : 작업배정 DAO
 * @author Yin Xueyuan
 * @since 2016. 4. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 1.   Yin Xueyuan      최초 생성
 * </pre>
 */

@Mapper("workAssignDAO")
public interface WorkAssignDAO {

    /**
     * 작업배정 정보를 등록한다.
     * @param workAssignVO - 등록할 정보가 담긴 WorkAssignVO
     * @return 등록된 목록수
     */
    public int insertWorkAssign(WorkAssignVO workAssignVO);

    /**
     * 작업배정 정보를 수정한다.
     * @param workAssignVO - 수정할 정보가 담긴 WorkAssignVO
     * @return 수정된 목록수
     */
    public int updateWorkAssign(WorkAssignVO workAssignVO);

    /**
     * 작업배정 정보를 삭제한다.
     * @param workAssignVO - 삭제할 정보가 담긴 WorkAssignVO
     * @return 삭제된 목록수
     */
    public int deleteWorkAssign(WorkAssignVO workAssignVO);

    /**
     * 조회 조건에 해당하는 작업배정 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 WorkAssignSearchVO
     * @return 조회 목록
     */
    public List<WorkAssignVO> selectWorkAssignByCondition(WorkAssignSearchVO searchVO);

    /**
     * 배정 작업 체크 로직 정보
     * @param searchVO - 조회 조건을 포함하는 WorkAssignSearchVO
     * @return 조회 목록
     */
    public WorkAssignVO selectWorkAssignChkStatByKey(WorkAssignSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 작업배정 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 WorkAssignSearchVO
     * @return
     */
    public int selectWorkAssignByConditionCnt(WorkAssignSearchVO searchVO);

     /**
     * 조회 조건에 해당하는 작업배정 키정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 WorkAssignSearchVO
     * @return 조회 목록
     */
    public WorkAssignVO selectWorkAssignByKey(WorkAssignSearchVO searchVO);
    
    /**
     * 根据工位查询摄像头
     * @param searchVO - VedioChannelBayVO
     * @return VedioChannelBayVO
     */
    public List<VedioChannelBayVO> selectChannelAddrByCondition(VedioChannelBayVO searchVO);
    
    /**
     * 根据工位号查询是否存在通道地址(粉丝平台使用)
     * @param searchVO
     * @return
     */
    public String selectFlagForExistChanel(String bayNo);
    public int selectFlagExistChannelApply(VedioChannelApplyVO vedioChannelApplyVO);

}
