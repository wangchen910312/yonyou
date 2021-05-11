package chn.bhmc.dms.sal.sti.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.sti.vo.ConfirmWearingVehiclePopupVO;
import chn.bhmc.dms.sal.sti.vo.ConfirmWearingVehicleSearchVO;
import chn.bhmc.dms.sal.sti.vo.ConfirmWearingVehicleVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ConfirmWearingVehicleDAO
 * @Description : 완성차 입고확정 DAO
 * @author Bong
 * @since 2016. 3. 14.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.14         Bong            최초 생성
 * </pre>
 */

@Mapper("confirmWearingVehicleDAO")
public interface ConfirmWearingVehicleDAO {


    /**
      * 조회 조건에 해당하는  정보를 조회한다.
      */
    public List<ConfirmWearingVehicleVO> selectConfirmWearingVehicleByCondition(ConfirmWearingVehicleSearchVO searchVO) throws Exception;

    /**
     *  조회 조건에 해당하는  총 갯수를 조회한다.
     */
    public int selectConfirmWearingVehicleByConditionCnt(ConfirmWearingVehicleSearchVO searchVO) throws Exception;

    /**
     * 완성차 입고확정 및 확정취소 한다.
     * @param ConfirmWearingVehicleVO
     * @return
     */
    public int updateConfirmWearingVehicle(ConfirmWearingVehicleVO LocalVO) throws Exception;
    /**
     * 완성차 입고확정 및 확정취소 한다.
     * @param ConfirmWearingVehicleVO
     * @return
     */
    public int updateConfirmWearingVehicle2(ConfirmWearingVehicleVO LocalVO) throws Exception;

    /**
     * 입고확정 팝업  정보를 조회한다.
     */
    public List<ConfirmWearingVehiclePopupVO> selectConfirmWearingVehiclePopup(ConfirmWearingVehicleSearchVO searchVO) throws Exception;

    /**
     * 완성차 입고확정 팝업 정보를 저장한다.
     * @param ConfirmWearingVehiclePopupVO
     * @return
     */
    public int insertConfirmWearingVehicle(ConfirmWearingVehiclePopupVO LocalVO) throws Exception;

    /**
     * ERP 전송시 seq 확인
     * @param dlrCd
     * @return
     * @throws Exception
     */
    public int selectKmSeqSearch(String sDlrCd) throws Exception;

    public int selectContractCnt(String sVinNo) throws Exception;


    /**
    *
    * 완성차입고 정보를 프로시져로 등록한다.
    * 딜러입고정보수신 IF
    *
    * @param ConfirmWearingVehicleVO
    * @return bindingResult
    * @throws Exception
    */
    public int procDlrArrival(ConfirmWearingVehicleVO LocalVO) throws Exception;


    /**
    *
    * 완성차입고 정보를 프로시져로 등록한다.
    * 딜러인수보고수신 IF
    *
    * @param ConfirmWearingVehicleVO
    * @return bindingResult
    * @throws Exception
    */
    public int procDlrArrival2(ConfirmWearingVehicleVO LocalVO) throws Exception;


    /**
    *
    * 완성차입고 정보를 프로시져로 등록한다.
    * 딜러평가결과수신 IF
    *
    * @param ConfirmWearingVehiclePopupVO
    * @return bindingResult
    * @throws Exception
    */
    public int procDlrEvalResult(ConfirmWearingVehiclePopupVO LocalVO) throws Exception;
    
    
    /**
     * 오더주문한 판매고문을 조회한다. 
     */
    public String selectCarEmpNo(ConfirmWearingVehicleSearchVO vo) throws Exception; 

    /**
     * 완성차 입고 - 모바일에서 바코드정보를 넘겨주면, 해당하는 차량정보를 반환해준다.
     */
    public int retVehicleInfosByConditionCnt(ConfirmWearingVehicleSearchVO searchVO) throws Exception;
    public List<ConfirmWearingVehicleVO> retVehicleInfosByCondition(ConfirmWearingVehicleSearchVO searchVO) throws Exception;
}
