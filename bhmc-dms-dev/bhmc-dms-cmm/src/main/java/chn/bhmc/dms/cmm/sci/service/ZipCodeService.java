package chn.bhmc.dms.cmm.sci.service;

import java.util.List;

import chn.bhmc.dms.cmm.sci.vo.ZipCodeSaveVO;
import chn.bhmc.dms.cmm.sci.vo.ZipCodeSearchVO;
import chn.bhmc.dms.cmm.sci.vo.ZipCodeVO;

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

public interface ZipCodeService {

    /**
     * 우편번호 정보를 등록한다.
     * @param zipCodeVO - 등록할 정보가 담긴 ZipCodeVO
     * @return 등록된 목록수
     */
    public int insertZipCode(ZipCodeVO zipCodeVO) throws Exception;

    /**
     * 우편번호 정보를 수정한다.
     * @param zipCodeVO - 수정할 정보가 담긴 ZipCodeVO
     * @return 수정된 목록수
     */
    public int updateZipCode(ZipCodeVO zipCodeVO) throws Exception;

    /**
     * 우편번호 정보를 삭제한다.
     * @param zipCodeVO - 삭제할 정보가 담긴 ZipCodeVO
     * @return 삭제된 목록수
     */
    public int deleteZipCode(ZipCodeVO zipCodeVO) throws Exception;

    /**
     * Key에 해당하는 우편번호 정보를 조회한다.
     * @param mesgKey - 메세지키
     * @return 조회한 우편번호 정보
     */
    public ZipCodeVO selectZipCodeByKey(String sungCd, String cityCd, String distCd) throws Exception;

    /**
     * 우편번호 정보를 등록/수정/삭제 처리한다.
     * @param zipCodeSaveVO
     */
	public void multiZipCodes(ZipCodeSaveVO zipCodeSaveVO) throws Exception;

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

    /**
     * 우편번호 일괄등록 처리를 수행한다.
     *
     * @param list
     * @throws Exception
     */
    public void insertZipCodeBatchUpload(List<ZipCodeVO> list) throws Exception;

    /**
     * 성 목록을 조회한다.
     * @return
     * @throws Exception
     */
    public List<ZipCodeVO> selectSungList() throws Exception;

    /**
     * 도시 목록을 조회한다.
     * @return
     * @throws Exception
     */
	public List<ZipCodeVO> selectCityList() throws Exception;

	/**
	 * 구 목록을 조회한다.
	 * @return
	 * @throws Exception
	 */
	public List<ZipCodeVO> selectDistList() throws Exception;

	/**
     * 조회 조건에 해당하는 dist_cd 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ZipCodeSearchVO
     * @return 조회 목록
     */
    public List<ZipCodeVO> selectDistCdsByCondition(ZipCodeSearchVO searchVO) throws Exception;
}
