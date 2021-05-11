package chn.bhmc.dms.mob.api.part.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.mob.api.part.vo.PurcOrdItemVO;
import chn.bhmc.dms.mob.api.part.vo.PurcOrdSearchVO;
import chn.bhmc.dms.mob.api.part.vo.PurcOrdVO;



/**
 * 구매오더 서비스
 *
 * @author Ju Won Lee
 * @since 2016. 2. 04.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 2. 04.     Ju Won Lee      최초 생성
 * </pre>
 */

public interface PartPurcOrdService {


    /**
     * Key에 해당하는 구매오더  정보를 조회한다.
     * @param purcOrdVO - 조회할 정보가 담긴 PurcOrdVO
     * @return 조회한 구매오더  정의 정보
     */
    public PurcOrdVO selectPurcOrdByKey(PurcOrdSearchVO purcOrdSearchVO) throws Exception;

    /**
     * 조회조건에 해당하는 구매오더  정보를 조회한다.
     * @param purcOrdVO - 조회할 정보가 담긴 PurcOrdVO
     * @return 조회한 구매오더  정의 정보
     */
    public List<PurcOrdVO> selectPurcOrdsByCondition(PurcOrdSearchVO searchVO) throws Exception;


    /**
     * 조회 조건에 해당하는 구매오더  총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록 수
     */
    public int selectPurcOrdsByConditionCnt(PurcOrdSearchVO searchVO) throws Exception;

    /**
     * Key에 해당하는 구매오더 부품 정보를 조회한다.
     * @param purcOrdVO - 조회할 정보가 담긴 PurcOrdVO
     * @return 조회한 구매오더  정의 정보
     */
    public List<PurcOrdItemVO> selectPurcOrdItemByKey(PurcOrdSearchVO purcOrdSearchVO) throws Exception;

    /**
     * 조건에 해당하는 구매현황 데이타 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록
     */
    public List<PurcOrdItemVO> selectPurcOrdStatusByCondition(PurcOrdSearchVO searchVO) throws Exception;

    /**
     * 조건에 해당하는 구매현황 데이타 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return
     */
    public int selectPurcOrdStatusByConditionCnt(PurcOrdSearchVO searchVO) throws Exception;

    /**
     * 조건에 해당하는 실시간 구매현황 데이타(AMOS) 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록
     */
    public SearchResult selectPurcOrdStatusInterfaceRealTime(PurcOrdSearchVO searchVO) throws Exception;

}
