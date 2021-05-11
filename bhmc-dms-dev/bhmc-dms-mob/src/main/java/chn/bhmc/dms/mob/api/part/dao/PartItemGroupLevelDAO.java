package chn.bhmc.dms.mob.api.part.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.part.vo.ItemGroupLevelVO;
import chn.bhmc.dms.mob.api.part.vo.ItemGroupSearchVO;


/**
 * 품목그룹 레벨 데이타 매퍼 클래스
 *
 * @author In Bo Shim
 * @since 2016. 6. 16.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 6. 16.     In Bo Shim      최초 생성
 * </pre>
 */

@Mapper("PartItemGroupLevelDAO")
public interface PartItemGroupLevelDAO {

   
    /**
     * 조회 조건에 해당하는 품목그룹 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemGroupSearchVO
     * @return 조회 목록
     */
    public List<ItemGroupLevelVO> selectItemGroupLevelsByCondition(ItemGroupSearchVO searchVO);
    /**
     * 조회 조건에 해당하는 품목그룹 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemGroupSearchVO
     * @return 조회 목록
     */
    public List<ItemGroupLevelVO> selectItemGroupLevelsItemGroupByCondition(ItemGroupSearchVO searchVO);

    
}
