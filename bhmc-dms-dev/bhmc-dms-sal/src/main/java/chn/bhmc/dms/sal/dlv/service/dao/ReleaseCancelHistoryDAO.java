package chn.bhmc.dms.sal.dlv.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.dlv.vo.ReleaseCancelHistoryListVO;
import chn.bhmc.dms.sal.dlv.vo.ReleaseCancelHistoryVO;

/**
 * 출고취소 심사결과를 조회한다.
 *
 * @author Choi KyungYong
 * @since 2016. 10. 20
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                              수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.10.20         Choi KyungYong          최초 생성
 * </pre>
 */

@Mapper("releaseCancelHistoryDAO")
public interface ReleaseCancelHistoryDAO {

    /**
      * 조회 조건에 해당하는 고객인도 정보를 조회한다.
      */
    public List<ReleaseCancelHistoryListVO> selectReleaseCancelHistoryByCondition(ReleaseCancelHistoryVO searchVO);

    /**
     *  조회 조건에 해당하는 고객인도목록 총 갯수를 조회한다.
     */
    public int selectReleaseCancelHistoryByConditionCnt(ReleaseCancelHistoryVO searchVO);
}
