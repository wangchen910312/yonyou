package chn.bhmc.dms.sal.cnt.service;

import java.util.List;

import chn.bhmc.dms.sal.aap.vo.AapInfoVO;
import chn.bhmc.dms.sal.cnt.vo.ChnInfoVO;
import chn.bhmc.dms.sal.cnt.vo.ContractMntSaveVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReGoodsVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReIncVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReSaveVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReSearchVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReVO;
import chn.bhmc.dms.sal.cnt.vo.ContractSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterVO;



/**
 *  계약관리 서비스
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

public interface ContractMntService {

    /**
     * 조회 조건에 해당하는 계약목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return 조회 목록
     */
    public List<ContractReVO> selectContractResByCondition(ContractReSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 계약목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    public int selectContractResByConditionCnt(ContractReSearchVO searchVO) throws Exception;


    /**
     * 계약목록(V.3) 목록 갯수 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectContractMntsByConditionCnt(ContractReSearchVO searchVO) throws Exception;

    /**
     * 계약목록(V.3) 목록 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<ContractReVO> selectContractMntsByCondition(ContractReSearchVO searchVO) throws Exception;

    /**
     * 저장/수정 한다.
     */
    public String multiContractMnts(ContractReSaveVO saveVO) throws Exception;

    /**
     * 계약생성 한다.
     */
    //public String approval(ContractReVO contVO) throws Exception;
    public String approvalContractMnts(ContractReSaveVO saveVO) throws Exception;

    /**
     * 계약을 삭제(승인전) 한다.
     */
    public String deleteContract(ContractReVO contVO) throws Exception;

    /**
     * 계약을 취소(승인후) 한다.
     */
    public String cancelContract(ContractReVO contVO) throws Exception;

    /**
     * 계약을 삭제(승인전), 취소(승인후) 한다.
     */
    public int deleteContractMnt(ContractMntSaveVO saveVO) throws Exception;

    /**
     * 딜러 프로모션에 대한 할인 레벨을 조회한다. [계약생성 시 체크 확인]
     */
    public int selectDlrDcLevelCnt(ContractReSearchVO searchVO) throws Exception;
    public List<ContractReVO> selectDlrDcLevel(ContractReSearchVO searchVO) throws Exception;

    /**
     * 계약별 보험내역 조회
     */
    public int selectIncListsByConditionCnt(ContractReSearchVO searchVO) throws Exception;
    public List<ContractReIncVO> selectIncListsByCondition(ContractReSearchVO searchVO) throws Exception;

    /**
     * 계약별 용품 조회
     */
    public int selectGoodsListsByConditionCnt(ContractReSearchVO searchVO) throws Exception;
    public List<ContractReGoodsVO> selectGoodsListsByCondition(ContractReSearchVO searchVO) throws Exception;

    /**
     * 계약 대행업무 조회
     */
    public int selectAapsListsByConditionCnt(ContractReSearchVO searchVO) throws Exception;
    public List<AapInfoVO> selectAapsListsByCondition(ContractReSearchVO searchVO) throws Exception;

    /**
     * 미배정 차량 조회
     */
    public int selectContractReVinNosByConditionCnt(ContractReSearchVO searchVO) throws Exception;
    public List<VehicleMasterVO> selectContractReVinNosByCondition(ContractReSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 품목팝업(판매단가용) 조회한다.
     *   : 부품모듈의 ItemMasterService 와 동일. SQL 동일.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    public int selectItemSalePrcPopupByConditionCnt(ContractReSearchVO searchVO) throws Exception;
    public List<ContractReGoodsVO> selectItemSalePrcPopupByCondition(ContractReSearchVO searchVO) throws Exception;

    /**
     * 계약 상태 조회 (출고 처리시 조회?)
     */
    public String selectContractStatCd(ContractSearchVO searchVO) throws Exception;

    /**
     * 용품관리 내역을 계약에 반영하여 저장
     */
    public int contractGoodsApply(ContractReVO contVO, List<ContractReGoodsVO> goodsItemVO) throws Exception;

    /**
     * 계약 용품 내역을 삭제한다.
     * @param deleteVO
     * @return
     * @throws Exception
     */
    public int deleteContractGoods(ContractReSearchVO deleteVO) throws Exception;

    /**
     * 금융관리 내역을 계약에 반영하여 저장
     */
    public int contractFincApply(ContractReVO contVO) throws Exception;

    /**
     * 중고차 차량가격 반영
     */
    public int updateContractUsedCar(ContractReVO cnt) throws Exception;

    /**
     * 기타업무 [완성]상태 조회 - 출고사용
     **/
    public List<ContractReVO> selectContractEtcWorkCheck(String dlrCd, String contractNo) throws Exception;

    /**
     * 중고차 완성내역 상태조회
     * @param dlrCd
     * @param contractNo
     * @return Y:정상, N:상태이상
     * @throws Exception
     */
    public String selectContractUsedCarCheck(String dlrCd, String contractNo) throws Exception;
    public int selectContractUsedCarIsCheck(String dlrCd, String contractNo) throws Exception;

    /**
     * 임시 배정/임시 배정취소
     * @param saveVO
     * @throws Exception
     */
    public void updateCarAssign(VehicleMasterVO saveVO) throws Exception;

    /**
     * 계약의 컬럼을 개별을 수정한다.
     * @param saveVO - 조회 조건을 포함하는 ContractVO
     * @return
     */
    public int updateContractEach(ContractReVO saveVO) throws Exception;

    /**
     * 사용자의 채널유형 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<ChnInfoVO> selectSaleEmpChannelTupeSearch(ContractReSearchVO searchVO) throws Exception;

    /**
     * 해당 딜러의 2급딜러를 조회한다.
     * @param dlrCd
     * @return
     * @throws Exception
     */
    public List<ChnInfoVO> selectlvTwoDlrOrgsByCondition(String dlrCd) throws Exception;
}