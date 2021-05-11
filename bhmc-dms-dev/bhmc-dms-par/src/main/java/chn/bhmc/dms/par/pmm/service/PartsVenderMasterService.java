package chn.bhmc.dms.par.pmm.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.par.pmm.vo.PartsVenderMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.PartsVenderMasterVO;

/**
 * 공급처별 부품 마스터 관리 서비스
 *
 * @author In Bo Shim
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 11.     In Bo Shim      최초 생성
 * </pre>
 */

public interface PartsVenderMasterService {

    /**
     * 공급처별 부품 정보를 등록한다.
     * @param partsVenderMasterVO - 등록할 정보가 담긴 PartsVenderMasterVO
     * @return 등록된 목록수
     */
    public int insertPartsVenderMaster(PartsVenderMasterVO partsVenderMasterVO) throws Exception;

    /**
     * 공급처별 부품 정보를 수정한다.
     * @param partsPartsVenderMasterVO - 수정할 정보가 담긴 PartsVenderMasterVO
     * @return 수정된 목록수
     */
    public int updatePartsVenderMaster(PartsVenderMasterVO partsVenderMasterVO) throws Exception;

    /**
     * 공급처별 부품 정보를 삭제한다.
     * @param partsPartsVenderMasterVO - 삭제할 정보가 담긴 PartsVenderMasterVO
     * @return 삭제된 목록수
     */
    public int deletePartsVenderMaster(PartsVenderMasterVO partsVenderMasterVO) throws Exception;

    /**
     * 공급처별 부품 정보를 등록/수정/삭제 처리한다.
     * @param itemGroupSaveVO
     */
    public void multiPartsVenderMasters(BaseSaveVO<PartsVenderMasterVO> obj) throws Exception;

    /**
     * Key에 해당하는 공급처별 부품 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param bpCd - 공급처별 부품코드
     * @return 조회한 공급처별 부품 정보
     */
    public PartsVenderMasterVO selectPartsVenderMasterByKey(String dlrCd, String bpCd) throws Exception;

    // 공급처별 부품 정보를 등록/수정/삭제 처리한다.
    //public void multiPartsVenderMasters(BaseSaveVO<PartsVenderMasterVO> partsVenderMasterSaveVO);

    /**
     * 조회 조건에 해당하는 공급처별 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsVenderMasterSearchVO
     * @return 조회 목록
     */
    public List<PartsVenderMasterVO> selectPartsVenderMastersByCondition(PartsVenderMasterSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 공급처별 부품 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsVenderMasterSearchVO
     * @return 조회 목록 수
     */
    public int selectPartsVenderMastersByConditionCnt(PartsVenderMasterSearchVO searchVO) throws Exception;
}
