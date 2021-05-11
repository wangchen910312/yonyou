package chn.bhmc.dms.sal.veh.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.sal.veh.vo.LocalOptionMappingSearchVO;
import chn.bhmc.dms.sal.veh.vo.LocalOptionMappingVO;

/**
 * 로컬옵션가격정보 관리 서비스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.05         Kim Jin Suk            최초 생성
 * </pre>
 */

public interface LocalOptionMappingService {

	/**
     * 조회 조건에 해당하는 모델별 로컬옵션 가격 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 LocalOptionMappingSearchVO
     * @return 조회 목록
     */
	public List<LocalOptionMappingVO> selectLocalOptionMappingsByCondition(LocalOptionMappingSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 모델별 로컬옵션 가격 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 LocalOptionMappingSearchVO
     * @return
     */
	public int selectLocalOptionMappingsByConditionCnt(LocalOptionMappingSearchVO searchVO) throws Exception;

	/**
     * 모델별 로컬옵션 가격을 등록/수정/삭제 처리한다
     * @param localOptionMappingSaveVO)- 조회 조건을 포함하는 LocalOptionMappingVO
     * @return
	 * @throws Exception
     */
	public void multiLocalOptionMappings (BaseSaveVO<LocalOptionMappingVO> localOptionMappingSaveVO) throws Exception;



}
