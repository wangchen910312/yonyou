package chn.bhmc.dms.par.pmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.par.pmm.vo.ItemGroupSearchVO;
import chn.bhmc.dms.par.pmm.vo.ItemGroupVO;

/**
 * 품목그룹 데이타 매퍼 클래스
 *
 * @author In Bo Shim
 * @since 2016. 1. 5.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 6.     In Bo Shim      최초 생성
 * </pre>
 */

@Mapper("itemGroupDAO")
public interface ItemGroupDAO {

    /**
     * 품목그룹 정보를 등록한다.
     * @param itemGroupVO - 등록할 정보가 담긴 ItemGroupVO
     * @return 등록된 목록수
     */
    public int insertItemGroup(ItemGroupVO itemGroupVO);

    /**
     * 품목그룹 정보를 수정한다.
     * @param itemGroupVO - 수정할 정보가 담긴 ItemGroupVO
     * @return 수정된 목록수
     */
    public int updateItemGroup(ItemGroupVO itemGroupVO);

    /**
     * 품목그룹 정보를 삭제한다.
     * @param itemGroupVO - 삭제할 정보가 담긴 ItemGroupVO
     * @return 삭제된 목록수
     */
    public int deleteItemGroup(ItemGroupVO itemGroupVO);

    /**
     * Key에 해당하는 품목그룹 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param itemKindCd - 품목구분코드
     * @param itemGrp - 품목그룹
     * @return 조회한 품목그룹 정보
     */
    public ItemGroupVO selectItemGroupByKey(@Param("dlrCd") String dlrCd, @Param("itemKindCd") String itemKindCd, @Param("itemGrp") String itemGrp);

    /**
     * 조회 조건에 해당하는 품목그룹 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemGroupSearchVO
     * @return 조회 목록
     */
    public List<ItemGroupVO> selectItemGroupsByCondition(ItemGroupSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 품목그룹 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemGroupSearchVO
     * @return 조회 목록 수
     */
    public int selectItemGroupsByConditionCnt(ItemGroupSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 품목그룹 콤보 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemGroupSearchVO
     * @return 조회 목록
     */
    public List<ItemGroupVO> selectItemGroupCodesByCondition(ItemGroupSearchVO searchVO);
}
