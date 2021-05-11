package chn.bhmc.dms.sal.inc.service;

import java.util.List;

import chn.bhmc.dms.sal.inc.vo.IncJoinInfoSaveVO;
import chn.bhmc.dms.sal.inc.vo.IncJoinInfoSearchVO;
import chn.bhmc.dms.sal.inc.vo.IncJoinInfoVO;
import chn.bhmc.dms.sal.inc.vo.IncProcessSearchVO;
import chn.bhmc.dms.sal.inc.vo.IncProcessVO;

/**
 * 보험가입정보관리 서비스
 *
 * @author Kim yewon
 * @since 2016. 5. 03.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                       수정자                              수정내용
 *  ----------------   ------------    ---------------------------
 *   2016.05.03         Kim yewon            최초 생성
 * </pre>
 */

public interface IncJoinInfoService {


	/**
     * 조회 조건에 해당하는 보험가입정보관리를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IncJoinInfoSearchVO
     * @return 조회 목록
     */
	public List<IncJoinInfoVO> selectIncJoinInfoByCondition(IncJoinInfoSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 보험가입정보관리를 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IncJoinInfoSearchVO
     * @return
     */
	public int selectIncJoinInfoByConditionCnt(IncJoinInfoSearchVO searchVO) throws Exception;


	//성코드
	public List<IncJoinInfoVO> selectSungCd(IncJoinInfoVO vo) throws Exception;

	//도시코드
    public List<IncJoinInfoVO> selectCityCd(IncJoinInfoVO vo) throws Exception;

    //지역코드
    public List<IncJoinInfoVO> selectDistCd(IncJoinInfoVO vo) throws Exception;


    /**
     * 보험가입정보 저장한다.
     * @param saveVO
     */
    public IncJoinInfoVO multiSaveIncJoinInfo(IncJoinInfoSaveVO saveVO) throws Exception;
    
    /**
     * 고객인도 시, 보험정보의 vin번호 update
     */
    public void updateVinNoIncJoinInfo(IncJoinInfoSaveVO saveVO) throws Exception;
    
    /**
     * 보험가입정보관리상태를 변경한다.
     **/
    public String updateSateIncJoinInfo(IncJoinInfoVO saveVO) throws Exception;

    /**
     * 계약과 연계된 보험가입자의 고객정보를 변경한다. 
     */
    public int updateIncCustInfo(IncJoinInfoVO saveVO) throws Exception;
    
    
    //선택한 고객이 인도한 차량 VIN NO 조회.
    public List<IncJoinInfoVO> selectCustContractNo(IncJoinInfoSearchVO searchVO) throws Exception;
    public int selectCustContractNoCnt(IncJoinInfoSearchVO searchVO) throws Exception;


    //보험신청명세(ITEM)목록 데이터를 조회한다.
    public List<IncJoinInfoVO> selectIncDetailItem(IncJoinInfoSearchVO searchVO) throws Exception;
    public int selectIncDetailItemCnt(IncJoinInfoSearchVO searchVO) throws Exception;


    //보험가입정보관리 상세 POP-UP
    public IncJoinInfoVO selectIncDetail(IncJoinInfoSearchVO searchVO) throws Exception;

    //보험가입정보 COUNT조회(DLR_CD,CUST_NO,CONTRACT_NO 별)
    public IncJoinInfoVO selectIncNo(IncJoinInfoSearchVO vo) throws Exception;
    
    /**
     * 보험 추적 이력을 조회한다.
     **/
    public int selectIncProcessByConditionCnt(IncProcessSearchVO vo) throws Exception;
    public List<IncProcessVO> selectIncProcessByCondition(IncProcessSearchVO vo) throws Exception;
    
    /**
     * 보험 추적을 저장한다.
     **/
    public int multiIncProcess(IncProcessVO vo) throws Exception;

    /**
     * 소매계약건의 보험가입정보를 삭제한다.
     */
    public int deleteContractSaleIncInfo(String contractNo) throws Exception;
    
    /**
     * 소매계약번호로 보험가입정보 문서번호를 조회한다.
     * @param contractNo
     * @return
     * @throws Exception
     */
    public String selectContractIncNo(String contractNo) throws Exception;
}
