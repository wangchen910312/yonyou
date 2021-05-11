package chn.bhmc.dms.mob.api.part.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.part.vo.PurcOrdItemVO;
import chn.bhmc.dms.mob.api.part.vo.PurcOrdSearchVO;
import chn.bhmc.dms.mob.api.part.vo.PurcOrdVO;


/**
 * 구매오더 데이타 매퍼 클래스
 *
 * @author Ju Won Lee
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Ju Won Lee     최초 생성
 * </pre>
 */
@Mapper("PartPurcOrdDAO")
public interface PartPurcOrdDAO {

    /**
     * Key에 해당하는 구매오더 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param lvlId - 레벨ID
     * @return 조회한 구매오더 정보
     */
    public PurcOrdVO selectPurcOrdByKey(PurcOrdSearchVO purcOrdSearchVO);

    /**
     * 조회 조건에 해당하는 구매오더 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록
     */
    public List<PurcOrdVO> selectPurcOrdsByCondition(PurcOrdSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 구매오더 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록 수
     */
    public int selectPurcOrdsByConditionCnt(PurcOrdSearchVO searchVO);

    /**
     * Key에 해당하는 구매오더 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록
     */
    public List<PurcOrdItemVO> selectPurcOrdItemByKey(PurcOrdSearchVO purcOrdSearchVO);

    /**
     * 조회 조건에 해당하는 구매현황 데이타 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록
     */
    public List<PurcOrdItemVO> selectPurcOrdStatusByCondition(PurcOrdSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 구매현황 데이타 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcOrdSearchVO
     * @return 조회 목록 수
     */
    public int selectPurcOrdStatusByConditionCnt(PurcOrdSearchVO searchVO);

}
