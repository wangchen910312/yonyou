package chn.bhmc.dms.cmm.sci.service;

import java.util.List;

import chn.bhmc.dms.cmm.sci.vo.GridIndividualizationSearchVO;
import chn.bhmc.dms.cmm.sci.vo.GridIndividualizationVO;

/**
 * Grid 개인화 관리 서비스
 *
 * @author Kang Seok Han
 * @since 2016. 7. 6.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.07.06         Kang Seok Han            최초 생성
 * </pre>
 */

public interface GridIndividualizationService {

    /**
     * Grid 개인화 정보를 등록 또는 수정한다.
     * 주어진 Grid 개인화 정보가 이미 등록되어 있다면 수정하고 그렇지 않다면 등록한다.
     * @param gridIndividualizationVO 수정할 정보가 담긴 GridIndividualizationVO
     * @return 수정된 목록수
     */
    public int insertOrUpdateGridIndividualization(GridIndividualizationVO gridIndividualizationVO) throws Exception;

    /**
     * Grid 개인화 정보를 삭제한다.
     * @param gridIndividualizationVO 삭제할 정보가 담긴 GridIndividualizationVO
     * @return 삭제된 목록수
     */
    public int deleteGridIndividualization(GridIndividualizationVO gridIndividualizationVO) throws Exception;

    /**
     * Key에 해당하는 Grid 개인화 정보를 조회한다.
     * @param gridId 그리드 ID
     * @param usrId 사용자 ID
     * @param gridIndvTp 그리드 개인화 구분
     * @return 조회한 Grid 개인화 정보
     */
    public GridIndividualizationVO selectGridIndividualizationByKey(String gridId, String usrId, String gridIndvTp) throws Exception;


    /**
     * 조회 조건에 해당하는 Grid 개인화 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 GridIndividualizationSearchVO
     * @return 조회 목록
     */
    public List<GridIndividualizationVO> selectGridIndividualizationsByCondition(GridIndividualizationSearchVO searchVO) throws Exception;
}
