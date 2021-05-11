package chn.bhmc.dms.mob.api.main.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.main.vo.ViewMappingSearchVO;
import chn.bhmc.dms.mob.api.main.vo.ViewMappingVO;


/**
 * <pre>
 * 화면-사용자/직무/부서 매핑 DAO
 * </pre>
 *
 * @ClassName   : ViewMappingDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 8. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 9.     Kang Seok Han     최초 생성
 * </pre>
 */
@Mapper("MainViewMappingDAO")
public interface MainViewMappingDAO {

    public List<ViewMappingVO> selectViewMappingsWithPermission(ViewMappingSearchVO viewMappingSearchVO);

}
