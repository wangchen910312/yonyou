package chn.bhmc.dms.par.pcm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.par.pcm.vo.PurcCostSearchVO;
import chn.bhmc.dms.par.pcm.vo.PurcCostVO;



/**
 * 구매소요량 계산 데이타 매퍼 클래스
 *
 * @author In Bo Shim
 * @since 2016. 2. 3.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 2. 3.     In Bo Shim     최초 생성
 * </pre>
 */
@Mapper("purcCostDAO")
public interface PurcCostDAO {

    /**
     * 조회 조건에 해당하는 구매소요량계산 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcCostSearchVO
     * @return 조회 목록
     */
    public List<PurcCostVO> selectPurcCostesByCondition(PurcCostSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 구매요청 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PurcCostSearchVO
     * @return 조회 목록 수
     */
    public int selectPurcCostesByConditionCnt(PurcCostSearchVO searchVO);
}
