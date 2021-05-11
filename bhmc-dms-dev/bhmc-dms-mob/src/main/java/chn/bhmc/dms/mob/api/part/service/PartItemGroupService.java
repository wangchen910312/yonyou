package chn.bhmc.dms.mob.api.part.service;

import java.util.List;

import chn.bhmc.dms.mob.api.part.vo.ItemGroupSearchVO;
import chn.bhmc.dms.mob.api.part.vo.ItemGroupVO;


/**
 * 품목그룹 서비스
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

public interface PartItemGroupService {

//    /**
//     * Key에 해당하는 품목그룹 정보를 조회한다.
//     * @param dlrCd - 딜러코드
//     * @param itemKindCd - 품목구분코드
//     * @param itemGrp - 품목그룹
//     * @return 조회한 품목그룹 정보
//     */
//    public ItemGroupVO selectItemGroupByKey(String dlrCd, String itemKindCd, String itemGrp) throws Exception;
//    
//    /**
//     * 조회 조건에 해당하는 품목그룹 정보를 조회한다.
//     * @param searchVO - 조회 조건을 포함하는 ItemGroupSearchVO
//     * @return 조회 목록
//     */
//    public List<ItemGroupVO> selectItemGroupsByCondition(ItemGroupSearchVO searchVO) throws Exception;
//
//
//    /**
//     * 조회 조건에 해당하는 품목그룹 총 갯수를 조회한다.
//     * @param searchVO - 조회 조건을 포함하는 ItemGroupSearchVO
//     * @return 조회 목록 수
//     */
//    public int selectItemGroupsByConditionCnt(ItemGroupSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 품목그룹 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemGroupSearchVO
     * @return 조회 목록
     */
    public List<ItemGroupVO> selectItemGroupCodesByCondition(ItemGroupSearchVO searchVO) throws Exception;
}
