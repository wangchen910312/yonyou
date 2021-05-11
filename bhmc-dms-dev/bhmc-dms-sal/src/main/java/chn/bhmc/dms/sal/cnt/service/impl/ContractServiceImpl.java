package chn.bhmc.dms.sal.cnt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.cnt.service.ContractService;
import chn.bhmc.dms.sal.cnt.service.dao.ContractDAO;
import chn.bhmc.dms.sal.cnt.vo.ContractLocalOptionVO;
import chn.bhmc.dms.sal.cnt.vo.ContractPromotionVO;
import chn.bhmc.dms.sal.cnt.vo.ContractSaveVO;
import chn.bhmc.dms.sal.cnt.vo.ContractSearchVO;
import chn.bhmc.dms.sal.cnt.vo.ContractVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LocalOptionMappingServiceImpl
 * @Description : 로컬옵션 모델 맵핑
 * @author
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.          최초 생성
 * </pre>
 */

@Service("contractService")
public class ContractServiceImpl extends HService implements ContractService {

    /**
     * 로컬옵션 가격정보 DAO 선언
     */
    @Resource(name="contractDAO")
    ContractDAO contractDAO;

    @Resource(name="contractService")
    ContractService contractService;


    /**
     * 소매판매 주문번호 생성 id gen
     */
    @Resource(name="retailContractOrdNoIdgenService")
    TableIdGenService retailContractOrdNoIdgenService;


    /**
     * 조회 조건에 해당하는 계약목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return 조회 목록
     */
    @Override
    public List<ContractVO> selectContractsByCondition(ContractSearchVO searchVO) throws Exception{
        return contractDAO.selectContractsByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 계약목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    @Override
    public int selectContractsByConditionCnt(ContractSearchVO searchVO) throws Exception{
        return contractDAO.selectContractsByConditionCnt(searchVO);
    }


    /**
     * 계약을 생성/저장 한다.
     */
    @Override
    public String multiContracts(ContractSaveVO saveVO) throws Exception{
        String contractNo = "";
        ContractVO cntVO = saveVO.getContractVO();

        cntVO.setRegUsrId(LoginUtil.getUserId());     // 생성자
        cntVO.setUpdtUsrId(LoginUtil.getUserId());    // 수정자

        if( "create".equals(saveVO.getMultiFlag()) ){   // 생성

            /**
             * 계약번호(키생성)
             * B + 년월 + 5자리seq
             * carline을 넣어서 id gen 을 시킬시, Prefix를 재호출로 넣어줘야 줌.
             */
            synchronized (retailContractOrdNoIdgenService) {
                ((RetailContractOrdNoIdGenStrategy)retailContractOrdNoIdgenService.getStrategy()).setCarlineCd(cntVO.getCarlineCd());
                ((RetailContractOrdNoTableNameStrategy)retailContractOrdNoIdgenService.getTableNameStrategy()).setCarlineCd(cntVO.getCarlineCd());
                contractNo = retailContractOrdNoIdgenService.getNextStringId();
            }

            // 주문번호를 넣는다.
            cntVO.setContractNo(contractNo);

            // SA_0201T : 계약 헤더 저장
            contractDAO.insertContract(cntVO);

            // SA_0202 : 계약고객 저장
            cntVO.setPartnerTp("C");          // 계약자
            contractDAO.insertContractCustomer(cntVO);

            // SA_0202 : 실운전자 저장
            cntVO.setPartnerTp("D");          // 실운전자
            cntVO.setCustCd(cntVO.getDrvCustCd());     // 고객코드
            cntVO.setCustTp(cntVO.getDrvCustTp());     // 고객유형
            cntVO.setCustNm(cntVO.getDrvCustNm());     // 고객명
            cntVO.setTelNo1(cntVO.getDrvTelNo1());     // 고객연락처1
            cntVO.setTelNo2(cntVO.getDrvTelNo2());     // 고객연락처2
            cntVO.setEmailNm(cntVO.getDrvEmailNm());   // 이메일주소
            cntVO.setCrnNo(cntVO.getDrvCrnNo());       // 사업자등록번호
            cntVO.setZipCd(cntVO.getDrvZipCd());       // 우편번호
            cntVO.setAddr1(cntVO.getDrvAddr1());       // 주소1
            cntVO.setAddr2(cntVO.getDrvAddr2());       // 주소2
            contractDAO.insertContractCustomer(cntVO);

            // SA_0205 : 중고차 저장
            if("Y".equals(cntVO.getUatcCarPurcYn())){
                contractDAO.insertUsedCar(cntVO);
            }
        }else{

            contractNo = cntVO.getContractNo();

            // SA_0201T : 계약 헤더 수정
            contractDAO.updateContract(saveVO.getContractVO());

            // SA_0202 : 계약고객 수정
            cntVO.setPartnerTp("C");          // 계약자
            contractDAO.updateContractCustomer(cntVO);

            // SA_0202 : 실운전자 수정
            cntVO.setPartnerTp("D");          // 실운전자
            cntVO.setCustCd(cntVO.getDrvCustCd());     // 고객코드
            cntVO.setCustTp(cntVO.getDrvCustTp());     // 고객유형
            cntVO.setCustNm(cntVO.getDrvCustNm());     // 고객명
            cntVO.setTelNo1(cntVO.getDrvTelNo1());     // 고객연락처1
            cntVO.setTelNo2(cntVO.getDrvTelNo2());     // 고객연락처2
            cntVO.setEmailNm(cntVO.getDrvEmailNm());   // 이메일주소
            cntVO.setCrnNo(cntVO.getDrvCrnNo());       // 사업자등록번호
            cntVO.setZipCd(cntVO.getDrvZipCd());       // 우편번호
            cntVO.setAddr1(cntVO.getDrvAddr1());       // 주소1
            cntVO.setAddr2(cntVO.getDrvAddr2());       // 주소2
            contractDAO.updateContractCustomer(cntVO);

            // SA_0205 : 중고차 저장
            if("Y".equals(cntVO.getUatcCarPurcYn())){

                // 최초저장 시, 중고차 저장을 안했을 경우.
                if(contractDAO.selectUsedCarCnt(cntVO) > 0){
                    contractDAO.updateUsedCar(cntVO);
                }else{
                    contractDAO.insertUsedCar(cntVO);
                }
            }else{
                // 수정 시, 체크를 해제했을 경우 지움
                contractDAO.deleteUsedCar(cntVO);
            }

            // 할인가가 없을 경우. - 기 저장중이던 프로모션 지움.
            if ( cntVO.getDcAmt() <= 0 ){
                contractDAO.deleteContractAllPromotions(cntVO);
            }else{
                // 할인가가 있으면서, 프로모션 수정사항이 발생한다면 - 기 저장중이던 프로모션 지움.
                if( saveVO.getPromotionVO().getUpdatePromotionList().size() > 0 ){
                    contractDAO.deleteContractAllPromotions(cntVO);
                }
            }
        }

        // SA_0204 : 계약용품 저장/수정/삭제 Grid
        for(ContractLocalOptionVO optionVO : saveVO.getLocalOptionVO().getInsertOptionList()){
            optionVO.setRegUsrId(LoginUtil.getUserId());     // 사용자
            optionVO.setUpdtUsrId(LoginUtil.getUserId());    // 사용자

            // 신규 계약시, 주문번호(계약번호)를 넣는다.
            if( "create".equals(saveVO.getMultiFlag()) ){
                optionVO.setContractNo(contractNo);
            }
            contractDAO.insertContractLocalOptions(optionVO);
        }

        for(ContractLocalOptionVO optionVO : saveVO.getLocalOptionVO().getUpdateOptionList()){
            optionVO.setRegUsrId(LoginUtil.getUserId());     // 사용자
            optionVO.setUpdtUsrId(LoginUtil.getUserId());    // 사용자

            // 신규 계약시, 주문번호(계약번호)를 넣는다.
            if( "create".equals(saveVO.getMultiFlag()) ){
                optionVO.setContractNo(contractNo);
            }
            contractDAO.updateContractLocalOptions(optionVO);
        }

        for(ContractLocalOptionVO optionVO : saveVO.getLocalOptionVO().getDeleteOptionList()){
            optionVO.setRegUsrId(LoginUtil.getUserId());     // 사용자
            optionVO.setUpdtUsrId(LoginUtil.getUserId());    // 사용자

            contractDAO.deleteContractLocalOptions(optionVO);
        }


        // SA_0203 : 계약프로모션 저장/수정 Grid
        /*
       for(ContractPromotionVO promotionVO : saveVO.getPromotionVO().getInsertPromotionList()){
            promotionVO.setRegUsrId(LoginUtil.getUserId());     // 사용자
            promotionVO.setUpdtUsrId(LoginUtil.getUserId());    // 사용자

            // 신규 계약시, 주문번호(계약번호)를 넣는다.
            if( "create".equals(saveVO.getMultiFlag()) ){
                promotionVO.setContractNo(contractNo);
            }

            if ("Y".equals( promotionVO.getUseYn() )){
                contractDAO.insertContractPromotions(promotionVO);
            }else{
                contractDAO.deleteContractPromotions(promotionVO);
            }
        }
       */

        for(ContractPromotionVO promotionVO : saveVO.getPromotionVO().getUpdatePromotionList()){
            promotionVO.setRegUsrId(LoginUtil.getUserId());     // 사용자
            promotionVO.setUpdtUsrId(LoginUtil.getUserId());    // 사용자

            // 신규 계약시, 주문번호(계약번호)를 넣는다.
            promotionVO.setContractNo(contractNo);

            //contractDAO.updateContractPromotions(promotionVO);

            if ("Y".equals( promotionVO.getChkYn() )){
                contractDAO.insertContractPromotions(promotionVO);
            }else{
                contractDAO.deleteContractPromotions(promotionVO);
            }

        }

        /*for(ContractPromotionVO promotionVO : saveVO.getPromotionVO().getDeletePromotionList()){
            promotionVO.setRegUsrId(LoginUtil.getUserId());     // 사용자
            promotionVO.setUpdtUsrId(LoginUtil.getUserId());    // 사용자

            contractDAO.deleteContractPromotions(promotionVO);
        }
         */

        return contractNo;
    }

    /**
     * 계약을 삭제(승인전) 한다.
     */
    public int deleteContract (ContractVO contVO) throws Exception{
        return contractDAO.deleteContract(contVO);
    }

    /**
     * 계약 승인요청 한다.
     */
    public String conRequestAppr (ContractVO contVO) throws Exception{
        contractDAO.conRequestAppr(contVO);
        return contVO.getContractNo();
    }

    /**
     * 계약 승인확정 한다.
     */
    public String approval (ContractVO contVO) throws Exception{
        contractDAO.approval(contVO);
        return contVO.getContractNo();
    }

    /**
     * 계약 승인반려 한다.
     */
    public String approvalRollback (ContractVO contVO) throws Exception{
        contractDAO.approvalRollback(contVO);
        return contVO.getContractNo();
    }



    /**
     * 계약별 로컬옵션 조회
     */
    public int selectLocalOptionListsByConditionCnt(ContractSearchVO searchVO) throws Exception{
        return contractDAO.selectLocalOptionListsByConditionCnt(searchVO);
    }
    public List<ContractLocalOptionVO> selectLocalOptionListsByCondition(ContractSearchVO searchVO) throws Exception{
        return contractDAO.selectLocalOptionListsByCondition(searchVO);
    }

    /**
     * 계약별 프로모션 조회
     */
    public int selectPromotionListsByConditionCnt(ContractSearchVO searchVO) throws Exception{
        return contractDAO.selectPromotionListsByConditionCnt(searchVO);
    }
    public List<ContractPromotionVO> selectPromotionListsByCondition(ContractSearchVO searchVO) throws Exception{
        return contractDAO.selectPromotionListsByCondition(searchVO);
    }

    /**
     * 계약 상태 조회(출고 처리시 조회)
     */
    public String selectContractStatCd(ContractSearchVO searchVO) throws Exception{
        return contractDAO.selectContractStatCd(searchVO);
    }


}
