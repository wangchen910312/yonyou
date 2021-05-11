package chn.bhmc.dms.dply.spec.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.dply.spec.vo.DplySpecListSearchVO;
import chn.bhmc.dms.dply.spec.vo.DplySpecListVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DplySpecListDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 3. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 22.     Kang Seok Han     최초 생성
 * </pre>
 */


@Mapper("dplySpecListDAO")
public interface DplySpecListDAO {

    /**
     * 조회 조건에 해당하는 SPEC 리스트 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DplySpecListSearchVO
     * @return 조회 목록
     */
    public List<DplySpecListVO> selectSpecListByCondition(DplySpecListSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 SPEC 리스트 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DplySpecListSearchVO
     * @return
     */
    public int selectSpecListByConditionCnt(DplySpecListSearchVO searchVO);
}
