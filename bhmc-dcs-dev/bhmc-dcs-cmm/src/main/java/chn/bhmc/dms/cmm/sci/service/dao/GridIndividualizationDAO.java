package chn.bhmc.dms.cmm.sci.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.cmm.sci.vo.GridIndividualizationSearchVO;
import chn.bhmc.dms.cmm.sci.vo.GridIndividualizationVO;

/**
 * <pre>
 * 그리드 개인화 DAO
 * </pre>
 *
 * @ClassName   : GridIndividualizationDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 7. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 6.     Kang Seok Han     최초 생성
 * </pre>
 */
@Mapper("gridIndividualizationDAO")
public interface GridIndividualizationDAO {

    /**
     * Grid 개인화 정보를 등록한다.
     * @param gridIndividualizationVO 등록할 정보가 담긴 GridIndividualizationVO
     * @return 등록된 목록수
     */
    public int insertGridIndividualization(GridIndividualizationVO gridIndividualizationVO);

    /**
     * Grid 개인화 정보를 수정한다.
     * @param gridIndividualizationVO 수정할 정보가 담긴 GridIndividualizationVO
     * @return 수정된 목록수
     */
    public int updateGridIndividualization(GridIndividualizationVO gridIndividualizationVO);

    /**
     * Grid 개인화 정보를 삭제한다.
     * @param gridIndividualizationVO 삭제할 정보가 담긴 GridIndividualizationVO
     * @return 삭제된 목록수
     */
    public int deleteGridIndividualization(GridIndividualizationVO gridIndividualizationVO);

    /**
     * Key에 해당하는 Grid 개인화 정보를 조회한다.
     * @param gridId 그리드 ID
     * @param usrId 사용자 ID
     * @param gridIndvTp 그리드 개인화 구분
     * @return 조회한 Grid 개인화 정보
     */
    public GridIndividualizationVO selectGridIndividualizationByKey(
            @Param("gridId") String gridId, @Param("usrId") String usrId, @Param("gridIndvTp") String gridIndvTp);


    /**
     * 조회 조건에 해당하는 Grid 개인화 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 GridIndividualizationSearchVO
     * @return 조회 목록
     */
    public List<GridIndividualizationVO> selectGridIndividualizationsByCondition(GridIndividualizationSearchVO searchVO);
}
