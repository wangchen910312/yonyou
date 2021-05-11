package chn.bhmc.dms.cmm.sci.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.cmm.sci.vo.DBMessageSourceSearchVO;
import chn.bhmc.dms.cmm.sci.vo.DBMessageSourceVO;

/**
 * 메세지소스에 관한 데이터처리 매퍼 클래스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.05         Kang Seok Han            최초 생성
 * </pre>
 */

@Mapper("dbMessageSourceDAO")
public interface DBMessageSourceDAO {

    /**
     * 메세지소스 정보를 등록한다.
     * @param dbMessageSourceVO - 등록할 정보가 담긴 DBMessageSourceVO
     * @return 등록된 목록수
     */
    public int insertDBMessageSource(DBMessageSourceVO dbMessageSourceVO);

    /**
     * 메세지소스 정보를 수정한다.
     * @param dbMessageSourceVO - 수정할 정보가 담긴 DBMessageSourceVO
     * @return 수정된 목록수
     */
    public int updateDBMessageSource(DBMessageSourceVO dbMessageSourceVO);

    /**
     * 메세지소스 정보를 삭제한다.
     * @param dbMessageSourceVO - 삭제할 정보가 담긴 DBMessageSourceVO
     * @return 삭제된 목록수
     */
    public int deleteDBMessageSource(DBMessageSourceVO dbMessageSourceVO);

    /**
     * Key에 해당하는 메세지소스 정보를 조회한다.
     * @param mesgKey - 메세지키
     * @return 조회한 메세지소스 정보
     */
    public DBMessageSourceVO selectDBMessageSourceByKey(@Param("langCd") String langCd, @Param("cntryCd") String cntryCd, @Param("mesgKey") String mesgKey);

    /**
     * 조회 조건에 해당하는 메세지소스 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DBMessageSourceSearchVO
     * @return 조회 목록
     */
    public List<DBMessageSourceVO> selectDBMessageSourcesByCondition(DBMessageSourceSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 메세지소스 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DBMessageSourceSearchVO
     * @return
     */
    public int selectDBMessageSourcesByConditionCnt(DBMessageSourceSearchVO searchVO);
}
