package chn.bhmc.dms.par.pcm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.par.pcm.vo.*;


/**
 * 송장 데이타 매퍼 클래스
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
@Mapper("invcDAO")
public interface InvcDAO {

    /**
     * 조회 조건에 해당하는 송장 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public List<InvcVO> selectInvcsByCondition(InvcSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 송장 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록 수
     */
    public int selectInvcsByConditionCnt(InvcSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 구매 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public List<InvcItemVO> selectInvcsDetailByCondition(InvcSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 구매 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록 수
     */
    public int selectInvcsDetailByConditionCnt(InvcSearchVO searchVO);

}
