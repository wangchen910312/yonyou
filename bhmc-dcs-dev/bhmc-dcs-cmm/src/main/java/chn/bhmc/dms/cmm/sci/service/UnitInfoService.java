package chn.bhmc.dms.cmm.sci.service;

import java.util.List;

import chn.bhmc.dms.cmm.sci.vo.UnitInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.UnitInfoVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * 단위 관리 서비스
 *
 * @author Kang Seok Han
 * @since 2016. 2. 17.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.02.17         Kang Seok Han            최초 생성
 * </pre>
 */

public interface UnitInfoService {

    /**
     * 단위 정보를 등록한다.
     * @param unitInfoVO - 등록할 정보가 담긴 UnitInfoVO
     * @return 등록된 목록수
     */
    public int insertUnitInfo(UnitInfoVO unitInfoVO) throws Exception;

    /**
     * 단위 정보를 수정한다.
     * @param unitInfoVO - 수정할 정보가 담긴 UnitInfoVO
     * @return 수정된 목록수
     */
    public int updateUnitInfo(UnitInfoVO unitInfoVO) throws Exception;

    /**
     * 단위 정보를 삭제한다.
     * @param unitSeq - 삭제할 단위일련번호
     * @return 삭제된 목록수
     */
    public int deleteUnitInfo(int unitSeq) throws Exception;

    /**
     * Key에 해당하는 단위 정보를 조회한다.
     * @param unitSeq - 단위일련번호
     * @return 조회한 단위 정보
     */
    public UnitInfoVO selectUnitInfoByKey(int unitSeq) throws Exception;

    /**
     * 단위 정보를 등록/수정/삭제 처리한다.
     * @param unitInfoSaveVO
     */
	public void multiUnitInfos(BaseSaveVO<UnitInfoVO> unitInfoSaveVO) throws Exception;

	/**
     * 조회 조건에 해당하는 단위 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 UnitInfoSearchVO
     * @return 조회 목록
     */
	public List<UnitInfoVO> selectUnitInfosByCondition(UnitInfoSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 단위 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 UnitInfoSearchVO
     * @return
     */
	public int selectUnitInfosByConditionCnt(UnitInfoSearchVO searchVO) throws Exception;
}
