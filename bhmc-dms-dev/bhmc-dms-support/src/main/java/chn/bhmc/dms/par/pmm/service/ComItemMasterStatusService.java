package chn.bhmc.dms.par.pmm.service;

import java.util.List;

import chn.bhmc.dms.par.pmm.vo.ComItemMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.ComItemMasterVO;

/**
 * <pre>
 * 공용품목현황 관리 서비스
 * </pre>
 *
 * @ClassName   : ComItemMasterStatusService.java
 * @author In Bo Shim
 * @since 2016. 9. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 26.     In Bo Shim     최초 생성
 * </pre>
 */

public interface ComItemMasterStatusService {

    /**
     * 조회조건에 해당하는 공용부품마스터 현황 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ComItemMasterSearchVO
     * @return 조회 목록
     */
    public List<ComItemMasterVO> selectComItemMasterStatusByCondition(ComItemMasterSearchVO searchVO) throws Exception;

    /**
     * 조회조건에 해당하는 공용부품마스터 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ComItemMasterSearchVO
     * @return
     */
    public int selectComItemMasterStatusByConditionCnt(ComItemMasterSearchVO searchVO) throws Exception;

}
