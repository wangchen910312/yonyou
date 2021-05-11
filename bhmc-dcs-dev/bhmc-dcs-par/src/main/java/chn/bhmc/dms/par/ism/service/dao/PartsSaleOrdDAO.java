package chn.bhmc.dms.par.ism.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.par.ism.vo.PartsSaleOrdSearchVO;
import chn.bhmc.dms.par.ism.vo.PartsSaleOrdVO;

/**
 * 부품판매 데이타 매퍼 클래스
 *
 * @author Ju Won Lee
 * @since 2018. 2. 08.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2018. 2. 08.     Ju Won Lee      최초 생성
 * </pre>
 */

@Mapper("partsSaleOrdDAO")
public interface PartsSaleOrdDAO {

    /**
     * 조회 조건에 해당하는 부품판매 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsSaleOrdSearchVO
     * @return 조회 목록
     */
    public List<PartsSaleOrdVO> selectPartsSaleOrdByCondition(PartsSaleOrdSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 부품판매정보 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 PartsSaleOrdSearchVO
     * @return 조회 목록 수
     */
    public int selectPartsSaleOrdByConditionCnt(PartsSaleOrdSearchVO searchVO);

}
