package chn.bhmc.dms.cmm.cmp.service;

import java.util.List;

import chn.bhmc.dms.cmm.cmp.vo.OfficeSaveVO;
import chn.bhmc.dms.cmm.cmp.vo.OfficeSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.OfficeVO;

/**
 * 사무소 관리 서비스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.29         Kang Seok Han            최초 생성
 * </pre>
 */

public interface OfficeService {

    /**
     * 사무소 정보를 등록한다.
     * @param officeVO - 등록할 정보가 담긴 OfficeVO
     * @return 등록된 목록수
     */
    public int insertOffice(OfficeVO officeVO) throws Exception;

    /**
     * 사무소 정보를 수정한다.
     * @param officeVO - 수정할 정보가 담긴 OfficeVO
     * @return 수정된 목록수
     */
    public int updateOffice(OfficeVO officeVO) throws Exception;

    /**
     * 사무소 정보를 삭제한다.
     * @param officeVO - 삭제할 정보가 담긴 OfficeVO
     * @return 삭제된 목록수
     */
    public int deleteOffice(OfficeVO officeVO) throws Exception;

    /**
     * 사무소 정보를 등록/수정/삭제 처리한다.
     * @param officeSaveVO
     */
    public void multiOffices(OfficeSaveVO officeSaveVO) throws Exception;

    /**
     * Key에 해당하는 사무소 정보를 조회한다.
     * @param diviCd 사업부코드
     * @param offCd 사무소코드
     * @return 조회한 사무소 정보
     */
    public OfficeVO selectOfficeByKey(String diviCd, String offCd) throws Exception;

    /**
     * 조회 조건에 해당하는 사무소 정보를 조회한다.
     * @param searchVO 조회 조건을 포함하는 OfficeSearchVO
     * @return 조회 목록
     */
    public List<OfficeVO> selectOfficesByCondition(OfficeSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 사무소 총 갯수를 조회한다.
     * @param searchVO 조회 조건을 포함하는 OfficeSearchVO
     * @return
     */
    public int selectOfficesByConditionCnt(OfficeSearchVO searchVO) throws Exception;
}
