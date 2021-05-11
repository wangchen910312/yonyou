package chn.bhmc.dms.sal.cmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.DealerVO;
import chn.bhmc.dms.crm.cif.service.CustomerInfoOutBoundService;
import chn.bhmc.dms.crm.cmm.service.AddressInfoService;
import chn.bhmc.dms.sal.cmm.service.SalesCommonService;
import chn.bhmc.dms.sal.cmm.service.dao.SalesCommonDAO;
import chn.bhmc.dms.sal.cmm.vo.MobileSumSrchVO;
import chn.bhmc.dms.sal.cmm.vo.MobileSumVO;
import chn.bhmc.dms.sal.veh.service.VehicleMasterService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SalesCommonServiceImpl
 * @Description : 판매 공통
 * @author
 * @since 2016. 9. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 27.      KIM YEWON            최초 생성
 * </pre>
 */

@Service("salesCommonService")
public class SalesCommonServiceImpl extends HService implements SalesCommonService {


    /**
     * 판매공통 DAO 선언
     */
    @Resource(name="salesCommonDAO")
    SalesCommonDAO salesCommonDAO;

    /**
     * 차량마스터 Master 정보
     */
    @Autowired
    VehicleMasterService vehicleMasterService;

    /**
     * CRM 고객정보
     */
    @Autowired
    CustomerInfoOutBoundService customerInfoOutBoundService;

    /**
     * CRM 주소정보
     */
    @Autowired
    AddressInfoService addressInfoService;

    /**
     * 로그인된 딜러로 사업부,사업소,성,시를 조회.
     */
    @Override
    public DealerVO selectDealerInfo(DealerSearchVO searchVO) throws Exception {
        return salesCommonDAO.selectDealerInfo(searchVO);
    }

    /**
     * 딜러마스터에서 사업부를 그룹핑하여 조회(COUNT).
     */
    @Override
    public int selectDealerSdptCnt(DealerSearchVO searchVO) throws Exception {
        return salesCommonDAO.selectDealerSdptCnt(searchVO);
    }
    /**
     * 딜러마스터에서 사업부를 그룹핑하여 조회.
     */
    @Override
    public List<DealerVO> selectDealerSdpt(DealerSearchVO searchVO) throws Exception {
        return salesCommonDAO.selectDealerSdpt(searchVO);
    }

    /**
     * 딜러마스터에서 사무소를 그룹핑하여 조회(COUNT).
     */
    @Override
    public int selectDealerOfficeCnt(DealerSearchVO searchVO) throws Exception {
        return salesCommonDAO.selectDealerOfficeCnt(searchVO);
    }
    /**
     * 딜러마스터에서 사무소를 그룹핑하여 조회.
     */
    @Override
    public List<DealerVO> selectDealerOffice(DealerSearchVO searchVO) throws Exception {
        return salesCommonDAO.selectDealerOffice(searchVO);
    }

    /**
     * 딜러마스터에서 전체 사무소 조회
     */
    public List<DealerVO> selectAllDealerOffice(String sUsrId) throws Exception{

        return salesCommonDAO.selectAllDealerOffice(sUsrId);
    }

    /**
     * 딜러마스터에서 성을 그룹핑하여 조회(COUNT).
     */
    @Override
    public int selectDealerSungCnt(DealerSearchVO searchVO) throws Exception {
        return salesCommonDAO.selectDealerSungCnt(searchVO);
    }
    /**
     * 딜러마스터에서 사무소를 그룹핑하여 조회.
     */
    @Override
    public List<DealerVO> selectDealerSung(DealerSearchVO searchVO) throws Exception {
        return salesCommonDAO.selectDealerSung(searchVO);
    }

    /**
     * 딜러마스터에서 도시를  그룹핑하여 조회(COUNT).
     */
    @Override
    public int selectDealerCityCnt(DealerSearchVO searchVO) throws Exception {
        return salesCommonDAO.selectDealerCityCnt(searchVO);
    }
    /**
     * 딜러마스터에서 사무소를 그룹핑하여 조회.
     */
    @Override
    public List<DealerVO> selectDealerCity(DealerSearchVO searchVO) throws Exception {
        return salesCommonDAO.selectDealerCity(searchVO);
    }

    /**
     * 딜러마스터에서 딜러를  조회(COUNT).
     */
    @Override
    public int selectDealerCnt(DealerSearchVO searchVO) throws Exception {
        return salesCommonDAO.selectDealerCnt(searchVO);
    }
    /**
     * 딜러마스터에서 사무소를 그룹핑하여 조회.
     */
    @Override
    public List<DealerVO> selectDealer(DealerSearchVO searchVO) throws Exception {
        return salesCommonDAO.selectDealer(searchVO);
    }

    /**
     * 로그인한 USER의 심사등급을 가져온다.
     */
    @Override
    public String selectUserEvalGrade(String dlrCd,String usrId, String wrkDstinCd) throws Exception {
        return salesCommonDAO.selectUserEvalGrade(dlrCd,usrId,wrkDstinCd);
    }

    /**
     * 모바일메인화면 조회
     */
    @Override
    public List<MobileSumVO> selectMobileMainSum(MobileSumSrchVO searchVO) throws Exception {
        //searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return salesCommonDAO.selectMobileMainSum(searchVO);
    }

}