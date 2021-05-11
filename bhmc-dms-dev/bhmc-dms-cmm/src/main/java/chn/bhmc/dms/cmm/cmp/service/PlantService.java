package chn.bhmc.dms.cmm.cmp.service;

import java.util.List;

import chn.bhmc.dms.cmm.cmp.vo.PlantSaveVO;
import chn.bhmc.dms.cmm.cmp.vo.PlantSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.PlantVO;

/**
 * 센터 관리 서비스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.29         Kang Seok Han            최초 생성
 * </pre>
 */

public interface PlantService {

    /**
     * 센터 정보를 등록한다.
     * @param plantVO - 등록할 정보가 담긴 PlantVO
     * @return 등록된 목록수
     */
    public int insertPlant(PlantVO plantVO) throws Exception;

    /**
     * 센터 정보를 수정한다.
     * @param plantVO - 수정할 정보가 담긴 PlantVO
     * @return 수정된 목록수
     */
    public int updatePlant(PlantVO plantVO) throws Exception;

    /**
     * 센터 정보를 삭제한다.
     * @param plantVO - 삭제할 정보가 담긴 PlantVO
     * @return 삭제된 목록수
     */
    public int deletePlant(PlantVO plantVO) throws Exception;

    /**
     * 센터 정보를 등록/수정/삭제 처리한다.
     * @param plantSaveVO
     */
    public void multiPlants(PlantSaveVO plantSaveVO) throws Exception;

    /**
     * Key에 해당하는 센터 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param pltCd - 센터코드
     * @return 조회한 센터 정보
     */
    public PlantVO selectPlantByKey(String dlrCd, String pltCd) throws Exception;

    /**
     * 조회 조건에 해당하는 센터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PlantSearchVO
     * @return 조회 목록
     */
    public List<PlantVO> selectPlantsByCondition(PlantSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 센터 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PlantSearchVO
     * @return
     */
    public int selectPlantsByConditionCnt(PlantSearchVO searchVO) throws Exception;
}
