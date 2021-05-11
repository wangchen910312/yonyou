package chn.bhmc.dms.sal.inc.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.inc.vo.IncJoinInfoSearchVO;
import chn.bhmc.dms.sal.inc.vo.IncJoinInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : IncJoinInfoDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim yewon
 * @since 2016. 5. 03
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 03      Kim yewon              최초 생성
 * </pre>
 */

@Mapper("incJoinInfoDAO")
public interface IncJoinInfoDAO {

    /**
      * 조회 조건에 해당하는 보험가입정보를 조회한다.
      */
    public List<IncJoinInfoVO> selectIncJoinInfoByCondition(IncJoinInfoSearchVO searchVO);

    /**
     *  조회 조건에 해당하는 마감시간통제 총 갯수를 조회한다.
     */
    public int selectIncJoinInfoByConditionCnt(IncJoinInfoSearchVO searchVO);


    //성코드
    public List<IncJoinInfoVO> selectSungCd(IncJoinInfoVO vo) throws Exception;

    //도시코드
    public List<IncJoinInfoVO> selectCityCd(IncJoinInfoVO vo) throws Exception;

    //지역코드
    public List<IncJoinInfoVO> selectDistCd(IncJoinInfoVO vo) throws Exception;


    /**
     * 보험정보 신규 등록
     */
    public boolean insertIncJoinInfo(IncJoinInfoVO vo) throws Exception;


    /**
     * 보험정보 수정
     */
    public boolean updateIncJoinInfo(IncJoinInfoVO vo) throws Exception;


    //선택한 고객이 인도한 차량 VIN NO 조회.
    public List<IncJoinInfoVO> selectCustContractNo(IncJoinInfoSearchVO searchVO);
    public int selectCustContractNoCnt(IncJoinInfoSearchVO searchVO);



    //보험신청명세(ITEM)목록 데이터를 조회한다.
    public List<IncJoinInfoVO> selectIncDetailItem(IncJoinInfoSearchVO searchVO);
    public int selectIncDetailItemCnt(IncJoinInfoSearchVO searchVO);


    //보험신청명세 내용 저장.
    public boolean insertIncDetailItem(IncJoinInfoVO vo) throws Exception;
    public boolean updateIncDetailItem(IncJoinInfoVO vo) throws Exception;
    public boolean deleteIncDetailItem(IncJoinInfoVO vo) throws Exception;


    //보험가입정보관리 상세 POP-UP
    public IncJoinInfoVO selectIncDetail(IncJoinInfoSearchVO searchVO) throws Exception;


}
