package chn.bhmc.dms.mob.api.crm.service;

import java.util.List;

import chn.bhmc.dms.mob.api.crm.vo.ZipCodeSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.ZipCodeVO;

/**
 * 우편번호 관리 서비스
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

public interface CrmZipCodeService {

    /**
     * 조회 조건에 해당하는 우편번호 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ZipCodeSearchVO
     * @return 조회 목록
     */
	public List<ZipCodeVO> selectZipCodesByCondition(ZipCodeSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 우편번호 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ZipCodeSearchVO
     * @return
     */
	public int selectZipCodesByConditionCnt(ZipCodeSearchVO searchVO) throws Exception;
}
