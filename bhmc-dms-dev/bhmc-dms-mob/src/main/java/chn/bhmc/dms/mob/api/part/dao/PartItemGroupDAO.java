package chn.bhmc.dms.mob.api.part.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.part.vo.ItemGroupSearchVO;
import chn.bhmc.dms.mob.api.part.vo.ItemGroupVO;


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

@Mapper("PartItemGroupDAO")
public interface PartItemGroupDAO {

    
    /**
     * 조회 조건에 해당하는 품목그룹 콤보 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemGroupSearchVO
     * @return 조회 목록
     */
    public List<ItemGroupVO> selectItemGroupCodesByCondition(ItemGroupSearchVO searchVO);
}
