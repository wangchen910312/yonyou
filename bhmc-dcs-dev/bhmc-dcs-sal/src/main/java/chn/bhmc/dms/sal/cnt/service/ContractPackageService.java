package chn.bhmc.dms.sal.cnt.service;

import java.util.List;

import chn.bhmc.dms.sal.cnt.vo.ContractPackageItemVO;
import chn.bhmc.dms.sal.cnt.vo.ContractPackageSaveVO;
import chn.bhmc.dms.sal.cnt.vo.ContractPackageSearchVO;
import chn.bhmc.dms.sal.cnt.vo.ContractPackageVO;
import chn.bhmc.dms.sal.cnt.vo.ContractPromotionVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReSearchVO;



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

public interface ContractPackageService {

    /**
     * 조회 조건에 해당하는 계약목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    public int selectContractPackagesByConditionCnt(ContractPackageSearchVO searchVO) throws Exception;
    /**
     * 조회 조건에 해당하는 계약목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return 조회 목록
     */
    public List<ContractPackageVO> selectContractPackagesByCondition(ContractPackageSearchVO searchVO) throws Exception;

    /**
     * 저장/수정 한다.
     */
    public String multiContractPackages(ContractPackageSaveVO saveVO) throws Exception;

    /**
     * 집단판매 확정 한다.
     */
    public String approvalPackage(ContractPackageVO contVO) throws Exception;

    /**
     * 계약을 삭제(승인전) 한다.
     */
    public int deleteContractPackage(ContractPackageVO contVO) throws Exception;


    /**
     * 집단판매 차량 item 내역 조회
     */
    public int selectPackageItemSearchCnt(ContractPackageSearchVO searchVO) throws Exception;
    public List<ContractPackageItemVO> selectPackageItemSearch(ContractPackageSearchVO searchVO) throws Exception;


    /**
     * 집단판매 - 프로모션 팝업 조회
     */
    public int selectCntPackagePromotionSearchCnt(ContractReSearchVO searchVO) throws Exception;
    public List<ContractPromotionVO> selectCntPackagePromotionSearch(ContractReSearchVO searchVO) throws Exception;


}
