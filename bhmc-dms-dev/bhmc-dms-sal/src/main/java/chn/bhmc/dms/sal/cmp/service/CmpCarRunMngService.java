package chn.bhmc.dms.sal.cmp.service;

import java.util.List;

import chn.bhmc.dms.sal.cmp.vo.CmpCarRunMngSaveVO;
import chn.bhmc.dms.sal.cmp.vo.CmpCarRunMngSearchVO;
import chn.bhmc.dms.sal.cmp.vo.CmpCarRunMngVO;

/**
 * 회사차운행관리 서비스
 *
 * @author Kim yewon
 * @since 2016. 4. 19.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                       수정자                              수정내용
 *  ----------------   ------------    ---------------------------
 *   2016.04.19         Kim yewon            최초 생성
 * </pre>
 */

public interface CmpCarRunMngService {


	/**
     * 조회 조건에 해당하는 회사차운행관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CmpCarRunMngSearchVO
     * @return 조회 목록
     */
	public List<CmpCarRunMngVO> selectCmpCarRunMngByCondition(CmpCarRunMngSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 회사차운행관리 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CmpCarRunMngSearchVO
     * @return
     */
	public int selectCmpCarRunMngByConditionCnt(CmpCarRunMngSearchVO searchVO) throws Exception;

	public int selectCmpCarRunMngSubCnt(CmpCarRunMngSearchVO searchVO) throws Exception;
	public List<CmpCarRunMngVO> selectCmpCarRunMngSub(CmpCarRunMngSearchVO searchVO) throws Exception;

	/**
     * 회사차운행내용 저장한다.
     * @param saveVO
     */
    public String saveCmpCarRunMng(CmpCarRunMngVO saveVO) throws Exception;

    /**
     * 회사차운행내용 삭제한다.
     * @param saveVO
     */
    public boolean deleteCmpCarRunMng(CmpCarRunMngVO saveVO) throws Exception;


    public String selectUseKmVal(String sVinNo) throws Exception;

    /*회사차운행메인을 저장, 수정한다.*/
    public void saveCmpCarRunMngMain(CmpCarRunMngSaveVO saveVO) throws Exception;
    public int insertCmpCarRunMngMain(CmpCarRunMngVO saveVO) throws Exception;
    public int deleteCmpCarRunMngMain(CmpCarRunMngVO saveVO) throws Exception;

    /*회사차운행서브를 저장, 수정한다.*/
    public void saveCmpCarRunMngSub(CmpCarRunMngSaveVO saveVO) throws Exception;
    public int insertCmpCarRunMngSub(CmpCarRunMngVO saveVO) throws Exception;
    public int deleteCmpCarRunMngSub(CmpCarRunMngVO saveVO) throws Exception;

    public int selectVehicleMasterPopupSrchCnt(CmpCarRunMngSearchVO searchVO) throws Exception;
    public List<CmpCarRunMngVO> selectVehicleMasterPopupSrch(CmpCarRunMngSearchVO searchVO) throws Exception;

    public int updateCmpCarMngDoneVheicle() throws Exception;
}
