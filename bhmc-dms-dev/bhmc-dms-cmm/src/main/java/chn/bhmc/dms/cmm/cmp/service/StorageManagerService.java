package chn.bhmc.dms.cmm.cmp.service;

import java.util.List;

import chn.bhmc.dms.cmm.cmp.vo.StorageManagerVO;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * 창고담당자관리 서비스
 *
 * @author In Bo Shim
 * @since 2016. 2. 17.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2017.02.17         In Bo Shim            최초 생성
 * </pre>
 */

public interface StorageManagerService {

    /**
     * 창고담당자정보를 등록한다.
     * @param storageManagerVO - 등록할 정보가 담긴 StorageManagerVO
     * @return 등록된 목록수
     */
    public int insertStorageManager(StorageManagerVO storageManagerVO) throws Exception;

    /**
     * 창고담당자정보를 수정한다.
     * @param storageManagerVO - 수정할 정보가 담긴 StorageManagerVO
     * @return 수정된 목록수
     */
    public int updateStorageManager(StorageManagerVO storageManagerVO) throws Exception;

    /**
     * 창고담당자정보를 삭제한다.
     * @param storageManagerVO - 삭제할 정보가 담긴 StorageManagerVO
     * @return 삭제된 목록수
     */
    public int deleteStorageManager(StorageManagerVO storageManagerVO) throws Exception;

    /**
     * 창고담당자정보를 등록/수정/삭제 처리한다.
     * @param storageSaveVO
     */
    public void multiStorageManageres(BaseSaveVO<StorageManagerVO> storageManagerSaveVO) throws Exception;

    /**
     * Key에 해당하는 창고담당자정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param pltCd - 센터코드
     * @param strgeCd - 창고코드
     * @return 조회한 창고담당자정보
     */
    public StorageManagerVO selectStorageManagerByKey(String dlrCd, String strgeCd, String usrId) throws Exception;

    /**
     * 조회 조건에 해당하는 창고담당자정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StorageSearchVO
     * @return 조회 목록
     */
    public List<StorageManagerVO> selectStorageManageresByCondition(StorageSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 창고 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StorageSearchVO
     * @return
     */
    public int selectStorageManageresByConditionCnt(StorageSearchVO searchVO) throws Exception;
}
