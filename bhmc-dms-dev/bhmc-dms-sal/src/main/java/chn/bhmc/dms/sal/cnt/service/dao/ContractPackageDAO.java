package chn.bhmc.dms.sal.cnt.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.cnt.vo.ContractPackageItemVO;
import chn.bhmc.dms.sal.cnt.vo.ContractPackageSearchVO;
import chn.bhmc.dms.sal.cnt.vo.ContractPackageVO;
import chn.bhmc.dms.sal.cnt.vo.ContractPromotionVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ContractPackageDAO
 * @Description : 집단판매 DAO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 25.     Kang Seok Han     최초 생성
 * </pre>
 */

@Mapper("contractPackageDAO")
public interface ContractPackageDAO {

    /**
     * 조회 조건에 해당하는 집단판매 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractPackageSearchVO
     * @return
     */
    public int selectContractPackagesByConditionCnt(ContractPackageSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 집단판매 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractPackageSearchVO
     * @return 조회 목록
     */
    public List<ContractPackageVO> selectContractPackagesByCondition(ContractPackageSearchVO searchVO) throws Exception;

    /**
     * 집단판매 내역을 저장한다.
     * @param saveVO - 조회 조건을 포함하는 ContractPackageVO
     * @return
     */
    public int insertContractPackage(ContractPackageVO saveVO) throws Exception;

    /**
     * 집단판매 내역을 수정한다.
     * @param saveVO - 조회 조건을 포함하는 ContractPackageVO
     * @return
     */
    public int updateContractPackage(ContractPackageVO saveVO) throws Exception;

    /**
     * 집단판매 확정 한다.
     * @param ContractPackageVO
     * @return
     * @throws Exception
     */
    public void approvalPackage(ContractPackageVO contVO) throws Exception;

    /**
     * 집단판매 삭제(승인전) 한다.
     * @param ContractVO
     * @return
     * @throws Exception
     */
    public int deleteContractPackage(ContractPackageVO contVO) throws Exception;

    /**
     * 집단판매 차량 item 내역 조회
     * @param ContractPackageSearchVO
     * @return
     * @throws Exception
     */
    public int selectPackageItemSearchCnt(ContractPackageSearchVO searchVO) throws Exception;
    public List<ContractPackageItemVO> selectPackageItemSearch(ContractPackageSearchVO searchVO) throws Exception;

    /**
     * 집단판매 차량 item 저장
     * @param itemVO
     * @return
     * @throws Exception
     */
    public int insertContractPackageItem(ContractPackageItemVO itemVO) throws Exception;

    /**
     * 집단판매 차량 item 수정
     * @param itemVO
     * @return
     * @throws Exception
     */
    public int updateContractPackageItem(ContractPackageItemVO itemVO) throws Exception;

    /**
     * 집단판매 차량 item 삭제
     * @param itemVO
     * @return
     * @throws Exception
     */
    public int deleteContractPackageItem(ContractPackageItemVO itemVO) throws Exception;


    /**
     * 집단판매 - 프로모션 팝업 조회
     */
    public int selectCntPackagePromotionSearchCnt(ContractReSearchVO searchVO) throws Exception;
    public List<ContractPromotionVO> selectCntPackagePromotionSearch(ContractReSearchVO searchVO) throws Exception;

}
