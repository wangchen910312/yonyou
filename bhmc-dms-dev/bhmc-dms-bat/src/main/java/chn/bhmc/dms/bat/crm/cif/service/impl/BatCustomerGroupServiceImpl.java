package chn.bhmc.dms.bat.crm.cif.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.crm.cif.service.BatCustomerGroupService;
import chn.bhmc.dms.bat.crm.cif.service.dao.BatCustomerGroupDAO;
import chn.bhmc.dms.bat.crm.cif.vo.BatCustomerGroupSearchVO;
import chn.bhmc.dms.bat.crm.cif.vo.BatCustomerGroupVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * 고객그룹관리 관리 서비스 구현 클래스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.05         Kyo Jin Lee            최초 생성
 *
 */
@Service("batCustomerGroupService")
public class BatCustomerGroupServiceImpl extends HService implements BatCustomerGroupService {

    /**
     * 고객그룹 관리 DAO
     */
	@Resource(name="batCustomerGroupDAO")
	BatCustomerGroupDAO batCustomerGroupDAO;

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectCustomerGroupByConditionCnt(BatCustomerGroupSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */



        return batCustomerGroupDAO.selectCustomerGroupByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerGroupService#selectCustomerGroupByCondition(chn.bhmc.dms.crm.cif.vo.BatCustomerGroupSearchVO)
     */
    @Override
    public List<BatCustomerGroupVO> selectCustomerGroupByCondition(BatCustomerGroupSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */



        return batCustomerGroupDAO.selectCustomerGroupByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<BatCustomerGroupVO> selectCustomerGroupByKey(String custNo, String grpTp, String dlrCd, String pltCd) throws Exception {
        BatCustomerGroupVO customerGroupVO = new BatCustomerGroupVO();
        customerGroupVO.setCustNo(custNo);
        customerGroupVO.setGrpTp(grpTp);
        customerGroupVO.setDlrCd(dlrCd);
        customerGroupVO.setPltCd(pltCd);
        return batCustomerGroupDAO.selectCustomerGroupByKey(customerGroupVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerGroupService#multiCustomerGroup(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiCustomerGroup(BaseSaveVO<BatCustomerGroupVO> obj) throws Exception {

        String userId = "SYSTEM";

        for(BatCustomerGroupVO customerGroupVO : obj.getInsertList()){
            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */

            customerGroupVO.setUsrId(userId);
            customerGroupVO.setRegUsrId(userId);


            batCustomerGroupDAO.insertCustomerGroup(customerGroupVO);
        }

        for(BatCustomerGroupVO customerGroupVO : obj.getUpdateList()){
            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */

            customerGroupVO.setRegUsrId(userId);

            batCustomerGroupDAO.updateCustomerGroup(customerGroupVO);
        }

        for(BatCustomerGroupVO customerGroupVO : obj.getDeleteList()){
            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */

            batCustomerGroupDAO.deleteCustomerGroup(customerGroupVO);
        }
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerGroupService#multiCustomerGroup(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiCustomerGroupInfo(BaseSaveVO<BatCustomerGroupVO> obj) throws Exception {

        String userId = "SYSTEM";

        if (obj.getInsertList().size() >= 1){
            String custNo   = obj.getInsertList().get(0).getCustNo();
            String grpTp    = obj.getInsertList().get(0).getGrpTp();
            String dlrCd    = obj.getInsertList().get(0).getDlrCd();
            String pltCd    = obj.getInsertList().get(0).getPltCd();

            // 기존에 그룹,태그를 삭제 한다.
            batCustomerGroupDAO.deleteCustomerGroupInfo(custNo, grpTp, dlrCd, pltCd);

            for(BatCustomerGroupVO customerGroupVO : obj.getInsertList()){

                customerGroupVO.setUsrId(userId);
                customerGroupVO.setRegUsrId(userId);
                customerGroupVO.setCustNo(custNo);

                batCustomerGroupDAO.insertCustomerGroupInfo(customerGroupVO);
            }
        }

    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerGroupService#multiCustomerGroup(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiCustomerGroupChg(BaseSaveVO<BatCustomerGroupVO> obj) throws Exception {

        String userId = "SYSTEM";

        /*
        for(BatCustomerGroupVO customerGroupVO : obj.getInsertList()){
            customerGroupVO.setUsrId(userId);
            customerGroupVO.setRegUsrId(userId);
            batCustomerGroupDAO.insertCustomerGroup(customerGroupVO);
        }
        for(BatCustomerGroupVO customerGroupVO : obj.getDeleteList()){
            batCustomerGroupDAO.deleteCustomerGroup(customerGroupVO);
        }
        */

        for(BatCustomerGroupVO customerGroupVO : obj.getUpdateList()){

            /*
             * dlrCd, pltCd 체크해서 기본 셋팅 시작
             */

            customerGroupVO.setRegUsrId(userId);

            batCustomerGroupDAO.updateCustomerGroupChg(customerGroupVO);
        }

    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerGroupService#selectCustomerInGroupByConditionCnt(chn.bhmc.dms.crm.cif.vo.BatCustomerGroupSearchVO)
     */
    @Override
    public int selectCustomerInGroupByConditionCnt(BatCustomerGroupSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */

        String userId = "SYSTEM";
        searchVO.setsUsrId(userId);
        return batCustomerGroupDAO.selectCustomerInGroupByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerGroupService#selectCustomerInGroupByCondition(chn.bhmc.dms.crm.cif.vo.BatCustomerGroupSearchVO)
     */
    @Override
    public List<BatCustomerGroupVO> selectCustomerInGroupByCondition(BatCustomerGroupSearchVO searchVO) throws Exception {

        /*
         * dlrCd, pltCd 체크해서 기본 셋팅 시작
         */

        String userId = "SYSTEM";
        searchVO.setsUsrId(userId);
        return batCustomerGroupDAO.selectCustomerInGroupByCondition(searchVO);
    }

}
