package chn.bhmc.dms.mob.api.sales.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService;
import chn.bhmc.dms.crm.cmm.service.AddressInfoService;
import chn.bhmc.dms.crm.cso.service.SalesOpptProcessMgmtOutBoundService;
import chn.bhmc.dms.mob.api.sales.dao.SalesContractMntDAO;
import chn.bhmc.dms.mob.api.sales.service.SalesContractMntService;
import chn.bhmc.dms.mob.api.sales.vo.ContractReSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.ContractReVO;
import chn.bhmc.dms.sal.aap.service.AapInfoService;
import chn.bhmc.dms.sal.acc.service.AccessoryItemSalesService;
import chn.bhmc.dms.sal.acu.service.ContBeforeMngService;
import chn.bhmc.dms.sal.dlv.service.ContDeliveryMngService;
import chn.bhmc.dms.sal.fim.service.FincInfoMngService;
import chn.bhmc.dms.sal.fin.service.PayInfoService;
import chn.bhmc.dms.sal.inc.service.IncJoinInfoService;
import chn.bhmc.dms.sal.usc.service.PurcEvalService;

/**
 * @ClassName   : ContractMntServiceImpl
 * @Description : 계약
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

@Service("SalesContractMntService")
public class SalesContractMntServiceImpl extends HService implements SalesContractMntService {

    /**
     * 계약 DAO 선언
     */
    @Resource(name="SalesContractMntDAO")
    SalesContractMntDAO SalesContractMntDAO;

    /**
     * 금융관리 서비스
     */
    @Resource(name="fincInfoMngService")
    FincInfoMngService fincInfoMngService;

    /**
     * 보험관리 서비스
     */
    @Resource(name="incJoinInfoService")
    IncJoinInfoService incJoinInfoService;

    /**
     * CRM 판매기회 관리 서비스
     */
    @Resource(name="salesOpptProcessMgmtOutBoundService")
    SalesOpptProcessMgmtOutBoundService salesOpptProcessMgmtOutBoundService;

    /**
     * 소매판매 주문번호 생성 id gen
     */
    @Resource(name="retailContractOrdNoIdgenService")
    TableIdGenService retailContractOrdNoIdgenService;

    /**
     * 경품정보관리 서비스
     */
    //@Resource(name="accessoryMngService")
    //AccessoryMngService accessoryMngService;
    /**
     * 용품판매관리 서비스
     */
    @Resource(name="accessoryItemSalesService")
    AccessoryItemSalesService accessoryItemSalesService;

    /**
     * 대행업무 서비스
     */
//    @Resource(name="aapMngService")
//    AapMngService aapMngService;
    @Resource(name="aapInfoService")
    AapInfoService aapInfoService;


    /**
     * 고객 필수정보
     */
    @Resource(name="customerInfoOutBoundService")
    CustomerInfoOutBoundService customerInfoOutBoundService;

    /**
     * 고객 주소정보
     */
    @Resource(name="addressInfoService")
    AddressInfoService addressInfoService;

    /**
     * 중고차 매입서비스
     */
    @Resource(name="purcEvalService")
    PurcEvalService purcEvalService;

    /**
     * 수납 서비스
     */
    @Resource(name="payInfoService")
    PayInfoService payInfoService;

    /**
     * 예약판매 서비스
     */
    @Resource(name="contBeforeMngService")
    ContBeforeMngService contBeforeMngService;

    /**
     * 시스템 컨피그 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 출고 서비스
     */
    @Resource(name="contDeliveryMngService")
    ContDeliveryMngService contDeliveryMngService;

    /**
     * 조회 조건에 해당하는 계약목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return 조회 목록
     */
    @Override
    public List<ContractReVO> selectContractResByCondition(ContractReSearchVO searchVO) throws Exception{
        return SalesContractMntDAO.selectContractResByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 계약목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    @Override
    public int selectContractResByConditionCnt(ContractReSearchVO searchVO) throws Exception{
        return SalesContractMntDAO.selectContractResByConditionCnt(searchVO);
    }

    

}
