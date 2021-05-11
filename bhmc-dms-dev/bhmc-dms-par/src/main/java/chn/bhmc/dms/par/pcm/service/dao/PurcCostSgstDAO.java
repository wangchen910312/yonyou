package chn.bhmc.dms.par.pcm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.par.pcm.vo.PurcCostSgstSearchVO;
import chn.bhmc.dms.par.pcm.vo.PurcCostSgstVO;

/**
 * 구매제시 데이타 매퍼 클래스
 *
 * @author In Bo Shim
 * @since 2016. 2. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 2. 4.     In Bo Shim     최초 생성
 * </pre>
 */
@Mapper("purcCostSgstDAO")
public interface PurcCostSgstDAO {

    /**
     * 구매제시 정보를 등록한다.
     * @param purcCostSgstVO - 등록할 정보가 담긴 PurcCostSgstVO
     * @return 등록된 목록수
     */
    public int insertPurcCostSgst(PurcCostSgstVO purcCostSgstVO);

    /**
     * 구매제시 정보를 수정한다.
     * @param purcCostSgstVO - 수정할 정보가 담긴 PurcCostSgstVO
     * @return 수정된 목록수
     */
    public int updatePurcCostSgst(PurcCostSgstVO purcCostSgstVO);

    /**
     * 구매제시 부품으로 구매오더 시 구매제시 정보를 수정한다.
     * @param purcCostSgstVO - 수정할 정보가 담긴 PurcCostSgstVO
     * @return 수정된 목록수
     */
    public int updatePurcCostSgstOrdCnfm(PurcCostSgstVO purcCostSgstVO);

    /**
     * 구매제시 정보를 삭제한다.
     * @param purcCostSgstVO - 삭제할 정보가 담긴 PurcCostSgstVO
     * @return 삭제된 목록수
     */
    public int deletePurcCostSgst(PurcCostSgstVO purcCostSgstVO);

    /**
     * Key에 해당하는 구매제시 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @return 조회한 구매제시 정보
     */
    public PurcCostSgstVO selectPurcCostSgstByKey(@Param("dlrCd") String dlrCd);

    /**
     * 조회 조건에 해당하는 구매제시 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcCostSgstSearchVO
     * @return 조회 목록
     */
    public List<PurcCostSgstVO> selectPurcCostSgstesByCondition(PurcCostSgstSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 구매제시 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcCostSgstSearchVO
     * @return 조회 목록 수
     */
    public int selectPurcCostSgstesByConditionCnt(PurcCostSgstSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 추천오더 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcCostSgstSearchVO
     * @return 조회 목록
     */
    public List<PurcCostSgstVO> selectSgstPurcOrdByCondition(PurcCostSgstSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 추천오더 정보 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcCostSgstSearchVO
     * @return 조회 목록
     */
    public int selectSgstPurcOrdByConditionCnt(PurcCostSgstSearchVO searchVO);
}
