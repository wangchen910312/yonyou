package chn.bhmc.dms.dply.dms.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.dply.dms.vo.BundleDeployHistorySearchVO;
import chn.bhmc.dms.dply.dms.vo.BundleDeployHistoryVO;
import chn.bhmc.dms.dply.dms.vo.DmsProfileSearchVO;
import chn.bhmc.dms.dply.dms.vo.DmsProfileVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DmsProfileDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 3. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 18.     Kang Seok Han     최초 생성
 * </pre>
 */

@Mapper("dmsProfileDAO")
public interface DmsProfileDAO {

    /**
     * 조회 조건에 해당하는 DMS 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DmsProfileSearchVO
     * @return 조회 목록
     */
    public List<DmsProfileVO> selectDmsProfileByCondition(DmsProfileSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 DMS 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DmsProfileSearchVO
     * @return
     */
    public int selectDmsProfileByConditionCnt(DmsProfileSearchVO searchVo);

    /**
     * 조회 조건에 해당하는 BundleDeployHistory 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BundleDeployHistorySearchVO
     * @return 조회 목록
     */
    public List<BundleDeployHistoryVO> selectBundleDeployHistoryByKey(BundleDeployHistorySearchVO searchVO);

    /**
     * DMS Profile Target 대상 여부 'E'로 변경
     * @param saveVO
     * @return
     */
    public int updateDeployTargetToE(DmsProfileVO saveVO) throws Exception;

    /**
     * DMS Profile Target 대상 여부 'Y'로 변경
     * @param saveVO
     * @return
     */
    public int updateDeployTargetToY(DmsProfileVO saveVO) throws Exception;

}
