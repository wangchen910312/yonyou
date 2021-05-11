package chn.bhmc.dms.par.pmm.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.par.pmm.vo.PartsVenderPriceMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.PartsVenderPriceMasterVO;

/**
 * 공급처별 부품구매가격 마스터 관리 서비스
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

public interface PartsVenderPriceMasterService {

    /**
     * 공급처별 부품구매가격 정보를 등록한다.
     * @param partsVenderPriceMasterVO - 등록할 정보가 담긴 PartsVenderPriceMasterVO
     * @return 등록된 목록수
     */
    public int insertPartsVenderPriceMaster(PartsVenderPriceMasterVO partsVenderPriceMasterVO) throws Exception;

    /**
     * 공급처별 부품구매가격 정보를 수정한다.
     * @param partsVenderPriceMasterVO - 수정할 정보가 담긴 PartsVenderPriceMasterVO
     * @return 수정된 목록수
     */
    public int updatePartsVenderPriceMaster(PartsVenderPriceMasterVO partsVenderPriceMasterVO) throws Exception;

    /**
     * 공급처별 부품구매가격 정보를 삭제한다.
     * @param partsVenderPriceMasterVO - 삭제할 정보가 담긴 PartsVenderPriceMasterVO
     * @return 삭제된 목록수
     */
    public int deletePartsVenderPriceMaster(PartsVenderPriceMasterVO partsVenderPriceMasterVO) throws Exception;

    /**
     * 공급처별 부품구매가격 정보를 등록/수정/삭제 처리한다.
     * @param itemGroupSaveVO
     */
    public void multiPartsVenderPriceMaster(BaseSaveVO<PartsVenderPriceMasterVO> obj) throws Exception;

    /**
     * Key에 해당하는 공급처별 부품구매가격 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param bpCd - 거래처코드
     * @param itemCd - 부품코드
     * @param prcTp - 가격유형
     * @param lineNo - 라인번호
     * @param delYn - 삭제유무
     * @return 조회한 공급처별 부품구매가격 정보
     */
    public PartsVenderPriceMasterVO selectPartsVenderPriceMasterByKey(String dlrCd, String bpCd, String itemCd, String prcTp, int lineNo, String delYn) throws Exception;

    // 공급처별 부품구매가격 정보를 등록/수정/삭제 처리한다.
    //public void multiPartsVenderPriceMasters(BaseSaveVO<PartsVenderPriceMasterVO> partsVenderPriceMasterSaveVO);

    /**
     * 조회 조건에 해당하는 공급처별 부품구매가격 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsVenderPriceMasterSearchVO
     * @return 조회 목록
     */
    public List<PartsVenderPriceMasterVO> selectPartsVenderPriceMastersByCondition(PartsVenderPriceMasterSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 공급처별 부품구매가격 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsVenderPriceMasterSearchVO
     * @return 조회 목록 수
     */
    public int selectPartsVenderPriceMastersByConditionCnt(PartsVenderPriceMasterSearchVO searchVO) throws Exception;
}
