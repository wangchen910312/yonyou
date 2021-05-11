package chn.bhmc.dms.sal.cnt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.cnt.service.ContractBeforeService;
import chn.bhmc.dms.sal.cnt.service.dao.ContractBeforeDAO;
import chn.bhmc.dms.sal.cnt.vo.ContractBeforeItemVO;
import chn.bhmc.dms.sal.cnt.vo.ContractBeforeSaveVO;
import chn.bhmc.dms.sal.cnt.vo.ContractBeforeSearchVO;
import chn.bhmc.dms.sal.cnt.vo.ContractBeforeVO;

/**
 * @ClassName   : ContractBeforeServiceImpl
 * @Description : 전략출고(선출고관리)
 * @author Kim Jin Suk
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

@Service("contractBeforeService")
public class ContractBeforeServiceImpl extends HService implements ContractBeforeService {

    /**
     * 전략출고(선출고관리) DAO 선언
     */
    @Resource(name="contractBeforeDAO")
    ContractBeforeDAO contractBeforeDAO;

    /**
     * 전략출고 번호 생성 id gen
     */
    @Resource(name="contractBeforeNoIdgenService")
    TableIdGenService contractBeforeNoIdgenService;

    /**
     * 조회 조건에 해당하는 전략출고 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return
     */
    public int selectcontractBeforesByConditionCnt(ContractBeforeSearchVO searchVO) throws Exception{
        return contractBeforeDAO.selectcontractBeforesByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 전략출고 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContractSearchVO
     * @return 조회 목록
     */
    public List<ContractBeforeVO> selectcontractBeforesByCondition(ContractBeforeSearchVO searchVO) throws Exception{
        return contractBeforeDAO.selectcontractBeforesByCondition(searchVO);
    }

    /**
     * 전략출고 대상 목록 갯수를 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectcontractBeforeItemSearchCnt(ContractBeforeSearchVO searchVO) throws Exception{
        return contractBeforeDAO.selectcontractBeforeItemSearchCnt(searchVO);
    }

    /**
     * 전략출고 대상 목록을 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<ContractBeforeItemVO> selectcontractBeforeItemSearch(ContractBeforeSearchVO searchVO) throws Exception{
        return contractBeforeDAO.selectcontractBeforeItemSearch(searchVO);
    }

    /**
     * 전략출고를 진행한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public String multiContractBefore(ContractBeforeSaveVO saveVO)throws Exception{

        String beContractNo = contractBeforeNoIdgenService.getNextStringId();

        ContractBeforeVO headerVO = saveVO.getBeforeVO();
        headerVO.setBeContractNo( beContractNo );

        contractBeforeDAO.insertContractBeforeHeader(headerVO);

        //차종의 전략출고를 저장한다.
        for(ContractBeforeItemVO carVO : saveVO.getInsertList() ){
            carVO.setRegUsrId(LoginUtil.getUserId());     // 사용자
            carVO.setUpdtUsrId(LoginUtil.getUserId());    // 사용자
            carVO.setDlrCd(LoginUtil.getDlrCd());
            carVO.setBeContractNo( beContractNo );

            contractBeforeDAO.insertContractBeforeCarItem(carVO);
        }

        return beContractNo;
    }


}
