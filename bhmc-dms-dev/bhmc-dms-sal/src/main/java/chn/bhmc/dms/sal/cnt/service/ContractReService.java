package chn.bhmc.dms.sal.cnt.service;

import java.util.List;

import chn.bhmc.dms.sal.aap.vo.AapMngVO;
import chn.bhmc.dms.sal.cnt.vo.ContractPayInfoVO;
import chn.bhmc.dms.sal.cnt.vo.ContractPromotionVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReGoodsVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReIncVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReOptionVO;
import chn.bhmc.dms.sal.cnt.vo.ContractRePayInfoSaveVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReSaveVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReSearchVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReVO;
import chn.bhmc.dms.sal.cnt.vo.ContractSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterVO;



/**
 *  관리 서비스
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

public interface ContractReService {

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
     * 저장/수정 한다.
     */
    public String multiContracts(ContractReSaveVO saveVO) throws Exception;

    /**
     * 계약생성 한다.
     */
    public String approval(ContractReVO contVO) throws Exception;

    /**
     * 계약을 삭제(승인전) 한다.
     */
    public String deleteContract(ContractReVO contVO) throws Exception;

    /**
     * 계약을 삭제(승인후) 한다.
     */
    public String cancelContract(ContractReVO contVO) throws Exception;


    /**
     * 딜러 프로모션에 대한 할인 레벨을 조회한다. [계약생성 시 체크 확인]
     */
    public int selectDlrDcLevelCnt(ContractReSearchVO searchVO) throws Exception;
    public List<ContractReVO> selectDlrDcLevel(ContractReSearchVO searchVO) throws Exception;

    /**
     * 계약별 프로모션 조회
     */
    public int selectPromotionListsByConditionCnt(ContractReSearchVO searchVO) throws Exception;
    public List<ContractPromotionVO> selectPromotionListsByCondition(ContractReSearchVO searchVO) throws Exception;


    /**
     * 계약별 입/출금내역 조회
     */
    public int selectPayInfoListsByConditionCnt(ContractReSearchVO searchVO) throws Exception;
    public List<ContractPayInfoVO> selectPayInfoListsByCondition(ContractReSearchVO searchVO) throws Exception;

    /**
     * 계약별 입/출금내역 저장
     */
    public int savePayInfo(ContractRePayInfoSaveVO payInfoVO) throws Exception;


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
     * 계약별 부가비용 조회
     */
    public int selectOptionListsByConditionCnt(ContractReSearchVO searchVO) throws Exception;
    public List<ContractReOptionVO> selectOptionListsByCondition(ContractReSearchVO searchVO) throws Exception;

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
     * 대행업무 내역을 계약에 반영하여 저장
     */
    public int contractAapMngApply(AapMngVO aapMngVO) throws Exception;

}