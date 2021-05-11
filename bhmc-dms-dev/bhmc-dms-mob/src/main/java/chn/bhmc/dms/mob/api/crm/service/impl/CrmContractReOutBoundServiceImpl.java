package chn.bhmc.dms.mob.api.crm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService;
import chn.bhmc.dms.mob.api.crm.dao.CrmContractReOutBoundDAO;
import chn.bhmc.dms.mob.api.crm.service.CrmContractReOutBoundService;
import chn.bhmc.dms.mob.api.crm.vo.ContractReSupportSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.ContractReSupportVO;
import chn.bhmc.dms.sal.acu.service.ContBeforeMngOutBoundService;
import chn.bhmc.dms.sal.fin.service.PayInfoOutBoundService;
import chn.bhmc.dms.sal.inc.service.IncJoinInfoService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ContractReServiceImpl
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

@Service("CrmcontractReOutBoundService")
public class CrmContractReOutBoundServiceImpl extends HService implements CrmContractReOutBoundService {

    /**
     * 소매판매 주문번호 생성 id gen
     */
    @Resource(name="retailContractOrdNoIdgenService")
    TableIdGenService retailContractOrdNoIdgenService;


    /**
     * 고객 필수정보
     */
    @Resource(name="customerInfoOutBoundService")
    CustomerInfoOutBoundService customerInfoOutBoundService;

    /**
     * 수납 서비스
     */
    @Resource(name="payInfoOutBoundService")
    PayInfoOutBoundService payInfoOutBoundService;

    /**
     * 계약 DAO 선언
     */
    @Resource(name="CrmcontractReOutBoundDAO")
    CrmContractReOutBoundDAO CrmcontractReOutBoundDAO;

    /**
     * 예약판매 서비스
     */
    @Resource(name="contBeforeMngOutBoundService")
    ContBeforeMngOutBoundService contBeforeMngOutBoundService;

    // 시스템 설정 서비스
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    // 보험서비스
    @Resource(name="incJoinInfoService")
    IncJoinInfoService incJoinInfoService;


    /**
     * [CRM 조회용]:계약자 - 중고차 치환을 통한 계약자의 최신 차량정보
     * @param searchVO
     * @return
     * @throws Exception
     */
    @Override
    public List<ContractReSupportVO> selectCustContractUseCarInfoSearch(ContractReSupportSearchVO searchVO) throws Exception{
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return CrmcontractReOutBoundDAO.selectCustContractUseCarInfoSearch(searchVO);
    }

}
