package chn.bhmc.dms.sal.cnt.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.cnt.vo.ContractPayInfoVO;
import chn.bhmc.dms.sal.cnt.vo.ContractPromotionVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReGoodsVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReIncVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReOptionVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReSearchVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReVO;
import chn.bhmc.dms.sal.cnt.vo.ContractSearchVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ContractDAO
 * @Description : 계약 DAO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.     Kang Seok Han     최초 생성
 * </pre>
 */

@Mapper("contractReDAO")
public interface ContractReDAO {

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
     * 계약을 저장한다.
     * @param saveVO - 조회 조건을 포함하는 ContractVO
     * @return
     */
    public int insertContract(ContractReVO saveVO) throws Exception;

    /**
     * 계약 고객을 저장한다. (계약자, 실운전자)
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int insertContractCustomer(ContractReVO saveVO) throws Exception;

    /**
     * 계약고객 유효성 체크
     */
    public int selectContractCustomersChkByConditionCnt(ContractReVO searchVO) throws Exception;

    /**
     * 계약 중고차을 저장한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int insertUsedCar(ContractReVO saveVO) throws Exception;

    /**
     * 계약 탁송정보를 저장한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int insertCons(ContractReVO saveVO) throws Exception;

    /**
     * 계약 번호판을 저장한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int insertReg(ContractReVO saveVO) throws Exception;

    /**
     * 계약 보험헤더를 저장한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int insertIncHead(ContractReVO saveVO) throws Exception;

    /**
     * 계약 금융서비스를 저장한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int insertFinc(ContractReVO saveVO) throws Exception;

    /**
     * 계약을 수정한다.
     * @param saveVO - 조회 조건을 포함하는 ContractVO
     * @return
     */
    public int updateContract(ContractReVO saveVO) throws Exception;

    /**
     * 계약 고객을 수정한다. (계약자, 실운전자)
     * @param saveVO - 조회 조건을 포함하는 ContractVO
     * @return
     */
    public int updateContractCustomer(ContractReVO saveVO) throws Exception;

    /**
     * 계약 중고차을 수정한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int updateUsedCar(ContractReVO saveVO) throws Exception;

    /**
     * 계약 중고차 내역 갯수를 조회한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int selectUsedCarCnt(ContractReVO saveVO) throws Exception;

    /**
     * 계약 중고차의 내역을 삭제한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int deleteUsedCar(ContractReVO saveVO) throws Exception;

    /**
     * 계약 탁송 내역을 수정한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int updateCons(ContractReVO saveVO) throws Exception;

    /**
     * 계약 탁송 내역 갯수를 조회한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int selectConsCnt(ContractReVO saveVO) throws Exception;

    /**
     * 계약 탁송 내역을 삭제한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int deleteCons(ContractReVO saveVO) throws Exception;

    /**
     * 계약 번호판 내역을 수정한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int updateReg(ContractReVO saveVO) throws Exception;

    /**
     * 계약 번호판 내역 갯수를 조회한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int selectRegCnt(ContractReVO saveVO) throws Exception;

    /**
     * 계약 번호판 내역을 삭제한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int deleteReg(ContractReVO saveVO) throws Exception;

    /**
     * 계약 보험헤더 내역을 수정한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int updateIncHead(ContractReVO saveVO) throws Exception;

    /**
     * 계약 보험헤더 내역 갯수를 조회한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int selectIncHeadCnt(ContractReVO saveVO) throws Exception;

    /**
     * 계약 보험헤더 내역을 삭제한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int deleteIncHead(ContractReVO saveVO) throws Exception;

    /**
     * 계약 보험 아이템을 삭제한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int deleteIncAll(ContractReVO saveVO) throws Exception;

    /**
     * 계약 금융 서비스 내역을 수정한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int updateFinc(ContractReVO saveVO) throws Exception;

    /**
     * 계약 금융 서비스 내역 갯수를 조회한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int selectFincCnt(ContractReVO saveVO) throws Exception;

    /**
     * 계약 금융 서비스 내역을 삭제한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int deleteFinc(ContractReVO saveVO) throws Exception;


    /**
     * 계약별 프로모션 조회한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int selectPromotionListsByConditionCnt(ContractReSearchVO searchVO) throws Exception;
    public List<ContractPromotionVO> selectPromotionListsByCondition(ContractReSearchVO searchVO) throws Exception;

    /**
     * 계약 프로모션을 저장/수정/삭제한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int insertContractPromotions(ContractPromotionVO saveVO) throws Exception;
    public int updateContractPromotions(ContractPromotionVO saveVO) throws Exception;
    public int deleteContractPromotions(ContractPromotionVO saveVO) throws Exception;
    public int deleteContractAllPromotions(ContractPromotionVO saveVO) throws Exception;

    /**
     * 계약별 입/출금 내역 조회
     * @return
     * @throws Exception
     */
    public int selectPayInfoListsByConditionCnt(ContractReSearchVO searchVO) throws Exception;
    public List<ContractPayInfoVO> selectPayInfoListsByCondition(ContractReSearchVO searchVO) throws Exception;

    /**
     * 계약별 입/출금 내역 저장/수정/삭제한다.
     * @return
     * @throws Exception
     */
    public int insertPayInfo(ContractPayInfoVO saveVO) throws Exception;
    public int updatePayInfo(ContractPayInfoVO saveVO) throws Exception;
    public int deletePayInfo(ContractPayInfoVO saveVO) throws Exception;

    /**
     * 계약별 보험내역 조회
     * @return
     * @throws Exception
     */
    public int selectIncListsByConditionCnt(ContractReSearchVO searchVO) throws Exception;
    public List<ContractReIncVO> selectIncListsByCondition(ContractReSearchVO searchVO) throws Exception;

    /**
     * 계약별 보험내역 저장/수정/삭제한다.
     * @return
     * @throws Exception
     */
    public int insertInc(ContractReIncVO saveVO) throws Exception;
    public int updateInc(ContractReIncVO saveVO) throws Exception;
    public int deleteInc(ContractReIncVO saveVO) throws Exception;

    /**
     * 계약별 용품내역 조회
     * @return
     * @throws Exception
     */
    public int selectGoodsListsByConditionCnt(ContractReSearchVO searchVO) throws Exception;
    public List<ContractReGoodsVO> selectGoodsListsByCondition(ContractReSearchVO searchVO) throws Exception;

    /**
     * 계약별 보험내역 저장/수정/삭제한다.
     * @return
     * @throws Exception
     */
    public int insertGoods(ContractReGoodsVO saveVO) throws Exception;
    public int updateGoods(ContractReGoodsVO saveVO) throws Exception;
    public int deleteGoods(ContractReGoodsVO saveVO) throws Exception;

    /**
     * 계약별 부가비용 조회
     * @return
     * @throws Exception
     */
    public int selectOptionListsByConditionCnt(ContractReSearchVO searchVO) throws Exception;
    public List<ContractReOptionVO> selectOptionListsByCondition(ContractReSearchVO searchVO) throws Exception;

    /**
     * 계약별 부가비용 저장/수정/삭제한다.
     * @return
     * @throws Exception
     */
    public int insertOption(ContractReOptionVO saveVO) throws Exception;
    public int updateOption(ContractReOptionVO saveVO) throws Exception;
    public int deleteOption(ContractReOptionVO saveVO) throws Exception;

    /**
     *  딜러 프로모션에 대한 할인 레벨을 조회한다. [계약생성 시 체크 확인]
     * @return
     * @throws Exception
     */
    public int selectDlrDcLevelCnt(ContractReSearchVO contVO) throws Exception;
    public List<ContractReVO> selectDlrDcLevel(ContractReSearchVO searchVO) throws Exception;

    /**
     * 계약 승인확정 한다.
     * @param ContractVO
     * @return CONTRACT_NO
     * @throws Exception
     */
    public int approval(ContractReVO contVO) throws Exception;

    /**
     * 계약을 삭제(승인전) 한다.
     * @param ContractVO
     * @return
     * @throws Exception
     */
    public int deleteContract(ContractReVO contVO) throws Exception;

    /**
     * 계약을 삭제(승인후) 한다.
     * @param ContractVO
     * @return
     * @throws Exception
     */
    public int cancelContract(ContractReVO contVO) throws Exception;


    /**
     * 미배정 차량조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectContractReVinNosByConditionCnt(ContractReSearchVO searchVO) throws Exception;
    public List<VehicleMasterVO> selectContractReVinNosByCondition(ContractReSearchVO searchVO) throws Exception;

    /**
     *  임시 배정/임시 배정취소
     * @param saveVO
     * @throws Exception
     */
    public void updateCarAssign(VehicleMasterVO saveVO) throws Exception;


    /**
     * 조회 조건에 해당하는 품목팝업(판매단가용) 조회한다.
     *   : 부품모듈의 ItemMasterService 와 동일. SQL 동일.
     * @param saveVO
     * @throws Exception
     */
    public int selectItemSalePrcPopupByConditionCnt(ContractReSearchVO searchVO) throws Exception;
    public List<ContractReGoodsVO> selectItemSalePrcPopupByCondition(ContractReSearchVO searchVO) throws Exception;

    /**
     * 계약 상태 조회 (출고 처리시 조회)
     */
    public String selectContractStatCd(ContractSearchVO searchVO) throws Exception;

    //소매계약정보수신
    public int procDlrRetailContract(ContractReVO contractReVO) throws Exception;

    /**
     * 계약 가격(용품) 내역 변경
     * @param updateVO
     * @throws Exception
     */
    public int updateContractPrice(ContractReVO updateVO) throws Exception;

    /**
     * 계약 용품 수정을 위한 삭제
     *  용품관리 -> 계약의 용품을 수정한다.
     */
    public int deleteContractGoods(ContractReSearchVO searchVO) throws Exception;

    /**
     * 계약 가격(대행업무) 내역 변경
     */
    public int updateContractAapMngPrice(ContractReVO updateVO) throws Exception;

}
