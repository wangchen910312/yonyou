package chn.bhmc.dms.dply.dms.service;

import java.util.List;

import chn.bhmc.dms.dply.dms.vo.BundleDeployHistorySearchVO;
import chn.bhmc.dms.dply.dms.vo.BundleDeployHistoryVO;
import chn.bhmc.dms.dply.dms.vo.DmsProfileSaveVO;
import chn.bhmc.dms.dply.dms.vo.DmsProfileSearchVO;
import chn.bhmc.dms.dply.dms.vo.DmsProfileVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DmsProfileService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 3. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 21.     Kang Seok Han     최초 생성
 * </pre>
 */

public interface DmsProfileService {


    /**
     * 조회 조건에 해당하는 메세지소스 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DBMessageSourceSearchVO
     * @return 조회 목록
     */
    public List<DmsProfileVO> selectDmsProfileByCondition(DmsProfileSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 메세지소스 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DBMessageSourceSearchVO
     * @return
     */
    public int selectDmsProfileByConditionCnt(DmsProfileSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 BundleDeployHistory 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BundleDeployHistorySearchVO
     * @return 조회 목록
     */
    public List<BundleDeployHistoryVO> selectBundleDeployHistoryByKey(BundleDeployHistorySearchVO searchVO) throws Exception;

    /**
     * DMS Profile Deploy Target 여부를 update한다.
     * @param saveVO - DmsProfileSaveVO
     * @return
     */
    public int updateDeployTargetYN(DmsProfileSaveVO saveVO)throws Exception;



}
