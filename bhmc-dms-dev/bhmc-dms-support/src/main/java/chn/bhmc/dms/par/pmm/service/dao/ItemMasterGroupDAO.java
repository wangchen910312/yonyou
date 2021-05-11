package chn.bhmc.dms.par.pmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.par.pmm.vo.ItemMasterGroupSearchVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterGroupVO;

/**
 * 부품정보관리 부품유형 데이타 매퍼 클래스
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

@Mapper("itemMasterGroupDAO")
public interface ItemMasterGroupDAO {

    /**
     * 부품정보관리 부품유형 정보를 등록한다.
     * @param itemMasterGroupVO - 등록할 정보가 담긴 ItemMasterGroupVO
     * @return 등록된 목록수
     */
    public int insertItemMasterGroup(ItemMasterGroupVO itemMasterGroupVO);

    /**
     * 부품정보관리 부품유형 정보를 수정한다.
     * @param itemMasterGroupVO - 수정할 정보가 담긴 ItemMasterGroupVO
     * @return 수정된 목록수
     */
    public int updateItemMasterGroup(ItemMasterGroupVO itemMasterGroupVO);

    /**
     * 부품정보관리 부품유형 정보를 삭제한다.
     * @param itemMasterGroupVO - 삭제할 정보가 담긴 ItemMasterGroupVO
     * @return 삭제된 목록수
     */
    public int deleteItemMasterGroup(ItemMasterGroupVO itemMasterGroupVO);

    /**
     * Key에 해당하는 부품정보관리 부품유형 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param itemCd - 부품코드
     * @return 조회한 부품정보관리 부품유형 정보
     */
    public ItemMasterGroupVO selectItemMasterGroupByKey(@Param("dlrCd") String dlrCd, @Param("itemCd") String itemCd);

    /**
     * 조회 조건에 해당하는 부품정보관리 부품유형 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterGroupSearchVO
     * @return 조회 목록
     */
    public List<ItemMasterGroupVO> selectItemMasterGroupsByCondition(ItemMasterGroupSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 부품정보관리 부품유형 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterGroupSearchVO
     * @return 조회 목록 수
     */
    public int selectItemMasterGroupsByConditionCnt(ItemMasterGroupSearchVO searchVO);

}
