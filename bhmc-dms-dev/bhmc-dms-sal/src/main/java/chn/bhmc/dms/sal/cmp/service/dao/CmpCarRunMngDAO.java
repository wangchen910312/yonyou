package chn.bhmc.dms.sal.cmp.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.cmp.vo.CmpCarRunMngSearchVO;
import chn.bhmc.dms.sal.cmp.vo.CmpCarRunMngVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CmpCarRunMngDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim yewon
 * @since 2016. 4. 19
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 19      Kim yewon              최초 생성
 * </pre>
 */

@Mapper("cmpCarRunMngDAO")
public interface CmpCarRunMngDAO {

    /**
      * 조회 조건에 해당하는 회사차운행관리 정보를 조회한다.
      */
    public List<CmpCarRunMngVO> selectCmpCarRunMngByCondition(CmpCarRunMngSearchVO searchVO);

    /**
     *  조회 조건에 해당하는 회사차운행관리목록 총 갯수를 조회한다.
     */
    public int selectCmpCarRunMngByConditionCnt(CmpCarRunMngSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 회사차운행관리 정보를 조회한다.
     */
    public List<CmpCarRunMngVO> selectCmpCarRunMngSub(CmpCarRunMngSearchVO searchVO);

   /**
    *  조회 조건에 해당하는 회사차운행관리목록 총 갯수를 조회한다.
    */
    public int selectCmpCarRunMngSubCnt(CmpCarRunMngSearchVO searchVO);

    /**
     * 회사차운행관리정보를 수정한다.
     */
    public void updateCmpCarRunMng(CmpCarRunMngVO saveVO) throws Exception;


    /**
     * 대행업무를 신규 등록
     */
    public int insertCmpCarRunMng(CmpCarRunMngVO vo) throws Exception;


    //pk 중복체크
    public int selectByPkChk(CmpCarRunMngVO vo) throws Exception;

    /**
     * 시작일시 ~ 종료일시를 체크하여 중복차량 체크
     */
    public int selectUseDtChkCnt(CmpCarRunMngVO vo) throws Exception;

    /**
     * 차량의 이전 종료km 가져오기
     */
    public String selectUseKmChkCnt(CmpCarRunMngVO vo) throws Exception;

    /**
     * 회사차운행관리 내용을 삭제한다.
     */
    public boolean deleteCmpCarRunMng(CmpCarRunMngVO vo);

    public int insertCmpCarRunMngMain(CmpCarRunMngVO saveVO);

    public int deleteCmpCarRunMngMain(CmpCarRunMngVO saveVO);

    public int updateMasterVheicleRemoveUpdate(CmpCarRunMngVO saveVO);

    public List<CmpCarRunMngVO> selectVehicleMasterPopupSrch(CmpCarRunMngSearchVO searchVO);

    public int selectVehicleMasterPopupSrchCnt(CmpCarRunMngSearchVO searchVO);

    public int insertCmpCarRunMngSub(CmpCarRunMngVO saveVO);

    public int deleteCmpCarRunMngSub(CmpCarRunMngVO saveVO);

    public int updateCmpCarMngDoneVheicle();

    public int updateMasterVheicleUpdate(CmpCarRunMngVO saveVO);

    public int selectStartKmChk(CmpCarRunMngVO saveVO);

    public int selectSubDataChk(CmpCarRunMngVO saveVO);
}
