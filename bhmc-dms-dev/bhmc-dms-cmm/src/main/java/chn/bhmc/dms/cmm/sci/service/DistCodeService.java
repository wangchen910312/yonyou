package chn.bhmc.dms.cmm.sci.service;

import java.util.List;

import chn.bhmc.dms.cmm.sci.vo.DistCodeSaveVO;
import chn.bhmc.dms.cmm.sci.vo.DistCodeSearchVO;
import chn.bhmc.dms.cmm.sci.vo.DistCodeVO;

/**
 * 지역코드 관리 서비스
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

public interface DistCodeService {

    /**
     * 지역코드 정보를 등록한다.
     * @param distCodeVO - 등록할 정보가 담긴 DistCodeVO
     * @return 등록된 목록수
     */
    public int insertDistCode(DistCodeVO distCodeVO) throws Exception;

    /**
     * 지역코드 정보를 수정한다.
     * @param distCodeVO - 수정할 정보가 담긴 DistCodeVO
     * @return 수정된 목록수
     */
    public int updateDistCode(DistCodeVO distCodeVO) throws Exception;

    /**
     * Key에 해당하는 지역코드 정보를 조회한다.
     * @param distCd - 지역코드
     * @return 조회한 지역코드 정보
     */
    public DistCodeVO selectDistCodeByKey(String distCd) throws Exception;

    /**
     * 지역코드 정보를 등록/수정/삭제 처리한다.
     * @param distCodeSaveVO
     */
	public void multiDistCodes(DistCodeSaveVO distCodeSaveVO) throws Exception;

	/**
     * 조회 조건에 해당하는 지역코드 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DistCodeSearchVO
     * @return 조회 목록
     */
	public List<DistCodeVO> selectDistCodesByCondition(DistCodeSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 지역코드 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DistCodeSearchVO
     * @return
     */
	public int selectDistCodesByConditionCnt(DistCodeSearchVO searchVO) throws Exception;
}
