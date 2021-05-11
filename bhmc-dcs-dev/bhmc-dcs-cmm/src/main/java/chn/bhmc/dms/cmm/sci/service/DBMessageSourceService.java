package chn.bhmc.dms.cmm.sci.service;

import java.util.List;

import chn.bhmc.dms.cmm.sci.vo.DBMessageSourceSearchVO;
import chn.bhmc.dms.cmm.sci.vo.DBMessageSourceVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * 메세지소스 관리 서비스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.18         Kang Seok Han            최초 생성
 * </pre>
 */

public interface DBMessageSourceService {

    /**
     * 메세지소스 정보를 등록한다.
     * @param dbMessageSourceVO - 등록할 정보가 담긴 DBMessageSourceVO
     * @return 등록된 목록수
     */
    public int insertDBMessageSource(DBMessageSourceVO dbMessageSourceVO) throws Exception;

    /**
     * 메세지소스 정보를 수정한다.
     * @param dbMessageSourceVO - 수정할 정보가 담긴 DBMessageSourceVO
     * @return 수정된 목록수
     */
    public int updateDBMessageSource(DBMessageSourceVO dbMessageSourceVO) throws Exception;

    /**
     * 메세지소스 정보를 삭제한다.
     * @param dbMessageSourceVO - 삭제할 정보가 담긴 DBMessageSourceVO
     * @return 삭제된 목록수
     */
    public int deleteDBMessageSource(DBMessageSourceVO dbMessageSourceVO) throws Exception;

    /**
     * 메세지소스 정보를 등록/수정/삭제 처리한다.
     * @param dbMessageSourceSaveVO
     */
    public void multiDBMessageSources(BaseSaveVO<DBMessageSourceVO> dbMessageSourceSaveVO) throws Exception;

    /**
     * 메세지소스 일괄등록 처리를 수행한다.
     *
     * @param list
     * @throws Exception
     */
    public void insertDBMessageSourceBatchUpload(List<DBMessageSourceVO> list) throws Exception;

    /**
     * Key에 해당하는 메세지소스 정보를 조회한다.
     * @param mesgKey - 메세지키
     * @return 조회한 메세지소스 정보
     */
    public DBMessageSourceVO selectDBMessageSourceByKey(String langCd, String cntryCd, String mesgKey) throws Exception;

	/**
     * 조회 조건에 해당하는 메세지소스 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DBMessageSourceSearchVO
     * @return 조회 목록
     */
	public List<DBMessageSourceVO> selectDBMessageSourcesByCondition(DBMessageSourceSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 메세지소스 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DBMessageSourceSearchVO
     * @return
     */
	public int selectDBMessageSourcesByConditionCnt(DBMessageSourceSearchVO searchVO) throws Exception;
}
