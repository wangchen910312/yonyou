package chn.bhmc.dms.sal.cnt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.cnt.service.ContractPackageService;
import chn.bhmc.dms.sal.cnt.service.dao.ContractPackageDAO;
import chn.bhmc.dms.sal.cnt.vo.ContractPackageItemVO;
import chn.bhmc.dms.sal.cnt.vo.ContractPackageSaveVO;
import chn.bhmc.dms.sal.cnt.vo.ContractPackageSearchVO;
import chn.bhmc.dms.sal.cnt.vo.ContractPackageVO;
import chn.bhmc.dms.sal.cnt.vo.ContractPromotionVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ContractPackageServiceImpl
 * @Description : 집단판매 계약
 * @author
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 25.                            최초 생성
 * </pre>
 */

@Service("contractPackageService")
public class ContractPackageServiceImpl extends HService implements ContractPackageService {

    /**
     * 집단판매 DAO 선언
     */
    @Resource(name="contractPackageDAO")
    ContractPackageDAO contractPackageDAO;

    /**
     * 소매판매 주문번호 생성 id gen
     */
    @Resource(name="retailContractPackageIdgenService")
    TableIdGenService retailContractPackageIdgenService;

    /**
     * 조회 조건에 해당하는 계약목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    @Override
    public int selectContractPackagesByConditionCnt(ContractPackageSearchVO searchVO) throws Exception{
        return contractPackageDAO.selectContractPackagesByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 계약목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return 조회 목록
     */
    @Override
    public List<ContractPackageVO> selectContractPackagesByCondition(ContractPackageSearchVO searchVO) throws Exception{
        return contractPackageDAO.selectContractPackagesByCondition(searchVO);
    }

    /**
     * 계약을 생성/저장 한다.
     */
    @Override
    public String multiContractPackages(ContractPackageSaveVO saveVO) throws Exception{
        String grpContractNo = "";
        ContractPackageVO cntVO = saveVO.getPackageVO();

        cntVO.setRegUsrId(LoginUtil.getUserId());     // 생성자
        cntVO.setUpdtUsrId(LoginUtil.getUserId());    // 수정자

        if( "create".equals(saveVO.getMultiFlag()) ){   // 생성
            /**
             * 집단번호(키생성)
             * G + 년 + 7자리seq
             */
            grpContractNo = retailContractPackageIdgenService.getNextStringId();

            // 주문번호를 넣는다.
            cntVO.setGrpContractNo(grpContractNo);

            // SA_0231T : 집단판매계약 헤더 저장
            contractPackageDAO.insertContractPackage(cntVO);

        }else{

            grpContractNo = cntVO.getGrpContractNo();

            // SA_0231T : 계약 헤더 수정
            contractPackageDAO.updateContractPackage(cntVO);
        }

        // SA_0232T : item
        for(ContractPackageItemVO itemVO : saveVO.getInsertList()){
            itemVO.setDlrCd(LoginUtil.getDlrCd());
            itemVO.setGrpContractNo(grpContractNo);
            itemVO.setRegUsrId(LoginUtil.getUserId());
            itemVO.setUpdtUsrId(LoginUtil.getUserId());
            contractPackageDAO.insertContractPackageItem(itemVO);
        }
        for(ContractPackageItemVO itemVO : saveVO.getUpdateList()){
            itemVO.setRegUsrId(LoginUtil.getUserId());
            itemVO.setUpdtUsrId(LoginUtil.getUserId());
            contractPackageDAO.updateContractPackageItem(itemVO);
        }
        for(ContractPackageItemVO itemVO : saveVO.getDeleteList()){
            contractPackageDAO.deleteContractPackageItem(itemVO);
        }




        return grpContractNo;
    }

    /**
     * 집단판매 확정 한다.
     */
    public String approvalPackage (ContractPackageVO contVO) throws Exception{
        contractPackageDAO.approvalPackage(contVO);
        return contVO.getGrpContractNo();
    }

    /**
     * 집단판매을 삭제(승인전) 한다.
     */
    public int deleteContractPackage (ContractPackageVO contVO) throws Exception{
        contVO.setRegUsrId(LoginUtil.getUserId());
        contVO.setUpdtUsrId(LoginUtil.getUserId());
        return contractPackageDAO.deleteContractPackage(contVO);
    }

    /**
     * 집단판매 차량 item 내역 조회
     */
    public int selectPackageItemSearchCnt(ContractPackageSearchVO searchVO) throws Exception{
        return contractPackageDAO.selectPackageItemSearchCnt(searchVO);
    }
    public List<ContractPackageItemVO> selectPackageItemSearch(ContractPackageSearchVO searchVO) throws Exception{
        return contractPackageDAO.selectPackageItemSearch(searchVO);
    }

    /**
     * 집단판매 - 프로모션 팝업 조회
     */
    public int selectCntPackagePromotionSearchCnt(ContractReSearchVO searchVO) throws Exception{
        return contractPackageDAO.selectCntPackagePromotionSearchCnt(searchVO);
    }
    public List<ContractPromotionVO> selectCntPackagePromotionSearch(ContractReSearchVO searchVO) throws Exception{
        return contractPackageDAO.selectCntPackagePromotionSearch(searchVO);
    }


}
