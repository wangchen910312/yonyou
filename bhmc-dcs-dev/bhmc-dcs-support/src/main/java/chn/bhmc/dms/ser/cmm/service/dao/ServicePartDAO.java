package chn.bhmc.dms.ser.cmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.cmm.vo.ServicePartVO;
import chn.bhmc.dms.ser.cmm.vo.TabInfoSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServicePartDAO.java
 * @Description : 공통 부품 DAO
 * @author KyungMok Kim
 * @since 2016. 8. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 23.   KyungMok Kim     최초 생성
 * </pre>
 */

@Mapper("servicePartDAO")
public interface ServicePartDAO {

    /**
     * 조회 조건에 해당하는 부품 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public int selectServicePartsByConditionCnt(TabInfoSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 부품을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TabInfoSearchVO
     * @return 조회 목록
     */
    public List<ServicePartVO> selectServicePartsByCondition(TabInfoSearchVO searchVO) throws Exception;

    /**
     * 부품 정보를 등록한다.
     * @param obj - 등록할 정보가 담긴 ServicePartVO
     * @return 등록된 목록수
     */
    public void insertServicePart(ServicePartVO obj);

    /**
     * 부품 정보를 수정한다.
     * @param obj - 수정할 정보가 담긴 ServicePartVO
     * @return 수정된 목록수
     */
    public void updateServicePart(ServicePartVO obj);

    /**
     * 부품 정보를 삭제한다.
     * @param obj - 삭제할 정보가 담긴 ServicePartVO
     * @return 삭제된 목록수
     */
    public void deleteServicePart(ServicePartVO obj);

}