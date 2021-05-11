package chn.bhmc.dms.par.pmm.service;

import java.util.List;

import chn.bhmc.dms.par.pmm.vo.ItemMasterGroupSearchVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterGroupVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterSaveVO;

/**
 * 부품정보관리 부품유형 서비스
 *
 * @author In Bo Shim
 * @since 2016. 8. 05.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 8. 05.     In Bo Shim      최초 생성
 * </pre>
 */

public interface ItemMasterGroupService {

    /**
     * 부품정보관리 부품유형 정보를 등록한다.
     * @param itemMasterGroupVO - 등록할 정보가 담긴 ItemMasterGroupVO
     * @return 등록된 목록수
     */
    public int insertItemMasterGroup(ItemMasterGroupVO itemMasterGroupVO) throws Exception;

    /**
     * 부품정보관리 부품유형 정보를 수정한다.
     * @param itemMasterGroupVO - 수정할 정보가 담긴 ItemMasterGroupVO
     * @return 수정된 목록수
     */
    public int updateItemMasterGroup(ItemMasterGroupVO itemMasterGroupVO) throws Exception;

    /**
     * 부품정보관리 부품유형 정보를 삭제한다.
     * @param itemMasterGroupVO - 삭제할 정보가 담긴 ItemMasterGroupVO
     * @return 삭제된 목록수
     */
    public int deleteItemMasterGroup(ItemMasterGroupVO itemMasterGroupVO) throws Exception;

    /**
     * Key에 해당하는 부품정보부품유형 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param itemCd - 부품코드
     * @return 조회한 부품정보부품유형 정보
     */
    public ItemMasterGroupVO selectItemMasterGroupByKey(String dlrCd, String itemCd) throws Exception;

    /**
     * 부품정보부품유형 정보를 등록/수정/삭제 처리한다.
     * @param itemMasterGroupVOSaveVO
     */
    public void multiItemMasterGroups(ItemMasterSaveVO itemMasterSaveVO) throws Exception;

    /**
     * 조회 조건에 해당하는 부품정보부품유형 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterGroupSearchVO
     * @return 조회 목록
     */
    public List<ItemMasterGroupVO> selectItemMasterGroupsByCondition(ItemMasterGroupSearchVO searchVO) throws Exception;


    /**
     * 조회 조건에 해당하는 부품정보부품유형 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterGroupSearchVO
     * @return 조회 목록 수
     */
    public int selectItemMasterGroupsByConditionCnt(ItemMasterGroupSearchVO searchVO) throws Exception;

}
