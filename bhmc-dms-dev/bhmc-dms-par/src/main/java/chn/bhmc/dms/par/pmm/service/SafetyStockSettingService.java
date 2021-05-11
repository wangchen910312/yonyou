package chn.bhmc.dms.par.pmm.service;

import java.util.List;

import chn.bhmc.dms.par.pmm.vo.SaftyStockSearchVO;
import chn.bhmc.dms.par.pmm.vo.SaftyStockSettingSaveVO;
import chn.bhmc.dms.par.pmm.vo.SaftyStockSettingVO;

/**
 * SafetyStockService
 *
 * @author In Bo Shim
 * @since 2016. 5. 03.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 5. 03.     In Bo Shim      최초 생성
 * </pre>
 */
public interface SafetyStockSettingService {

    /**
     * 적정재고 산출 설정정보를 등록한다.
     * @param saftyStockSettingVO - 등록할 정보가 담긴 SaftyStockSettingVO
     * @return 등록된 목록수
     */
    public int insertSafetyStockSetting(SaftyStockSettingVO saftyStockSettingVO) throws Exception;

    /**
     * 적정재고 산출 설정정보를 저장한다.
     * @param saftyStockSettingVO - 수정할 정보가 담긴 SaftyStockSettingVO
     * @return 수정된 목록수
     */
    public void multiSafetyStockSetting(SaftyStockSettingVO saftyStockSettingVO) throws Exception;

    /**
     * 적정재고 산출 설정정보를 저장한다.
     * @param saftyStockSettingVO - 수정할 정보가 담긴 SaftyStockSettingVO
     * @return 수정된 목록수
     */
    public void multiSafetyStockSettingInfo(SaftyStockSettingSaveVO saftyStockSettingSaveVO) throws Exception;

    /**
     * 적정재고 산출 설정정보를 수정한다.
     * @param saftyStockSettingVO - 수정할 정보가 담긴 SaftyStockSettingVO
     * @return 수정된 목록수
     */
    public int updateSafetyStockSetting(SaftyStockSettingVO saftyStockSettingVO) throws Exception;

    /**
     * 적정재고 산출 설정정보를삭제한다.
     * @param venderMasterVO - 삭제할 정보가 담긴 VenderMasterVO
     * @return 삭제된 목록수
     */
    public int deleteSafetyStockSetting(SaftyStockSettingVO saftyStockSettingVO) throws Exception;

    /**
     * Key에 해당하는 적정재고 산출 설정정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param pltCd - 센터코드
     * @return 조회한 거래처 정보
     */
    public SaftyStockSettingVO selectSafetyStockSettingSingleByKey(SaftyStockSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는적정재고 산출 설정정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SaftyStockSearchVO
     * @return 조회 목록
     */
    public List<SaftyStockSettingVO> selectSafetyStockSettingsByCondition(SaftyStockSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 적정재고 산출 설정정보 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SaftyStockSearchVO
     * @return 조회 목록 수
     */
    public int selectSafetyStockSettingsByConditionCnt(SaftyStockSearchVO searchVO) throws Exception;
}
