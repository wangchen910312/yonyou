package chn.bhmc.dms.sal.veh.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;

import chn.bhmc.dms.sal.veh.vo.Slv2DlrOrgVO;
import chn.bhmc.dms.sal.veh.vo.Slv2DlrOrgSearchVO;
import chn.bhmc.dms.sal.veh.service.Slv2DlrOrgService;
import chn.bhmc.dms.sal.veh.service.dao.Slv2DlrOrgDAO;
/**
 * <pre>
 * 기준정보 > 2급딜러 관리
 * </pre>
 *
 * @ClassName   : Slv2DlrOrgServiceImpl.java
 * @Description : 기준정보 > 2급딜러 관리
 * @author chibeom.song
 * @since 2017. 2. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 17.   chibeom.song     최초 생성
 * </pre>
 */
@Service("slv2DlrOrgService")
public class Slv2DlrOrgServiceImpl extends HService implements Slv2DlrOrgService {

    /**
     * 기준정보 > 2급딜러 관리 DAO
     */
    @Resource(name="slv2DlrOrgDAO")
    Slv2DlrOrgDAO slv2DlrOrgDAO;

    /**
     * 조회 조건에 해당하는 기준정보 > 2급딜러 관리 정보를 조회한다.
     */
    @Override
    public List<Slv2DlrOrgVO> selectSaleSlv2DlrOrgMgmtSearchData(Slv2DlrOrgSearchVO searchVO) throws Exception {
        return slv2DlrOrgDAO.selectSaleSlv2DlrOrgMgmtSearchData(searchVO);
    }

    /**
     * 조회 조건에 해당하는 기준정보 > 2급딜러 관리 총 갯수를 조회한다.
     */
    @Override
    public int selectSaleSlv2DlrOrgMgmtSearchCnt(Slv2DlrOrgSearchVO searchVO) throws Exception {
        return slv2DlrOrgDAO.selectSaleSlv2DlrOrgMgmtSearchCnt(searchVO);
    }

    /**
     * 기준정보 > 2급딜러 관리 데이터를 등록한다.
     */
    @Override
    public int insertSaleSlv2DlrOrgMgmtSave(Slv2DlrOrgVO slv2DlrOrgVO) throws Exception {
        String userId = LoginUtil.getUserId();
        slv2DlrOrgVO.setRegUsrId(userId);
        slv2DlrOrgVO.setUpdtUsrId(userId);

        // 납세자 식별번호 중복 체크
        int dupTaxpayerIdCdCnt = slv2DlrOrgDAO.selectDupTaxpayerIdCdCnt(slv2DlrOrgVO);
        if(dupTaxpayerIdCdCnt > 0){
            throw processException("global.err.duplicate");
        }

        return slv2DlrOrgDAO.insertSaleSlv2DlrOrgMgmtSave(slv2DlrOrgVO);
    }

    /**
     * 기준정보 > 2급딜러 관리 데이터를 상세조회
     */
    @Override
    public Slv2DlrOrgVO selectSaleSlv2DlrOrgMgmtDetail(Slv2DlrOrgSearchVO searchVO) throws Exception {
        return slv2DlrOrgDAO.selectSaleSlv2DlrOrgMgmtDetail(searchVO);
    }

    /**
     * 기준정보 > 2급딜러 관리 데이터를 수정한다.
     */
    @Override
    public int updateSaleSlv2DlrOrgMgmtSave(Slv2DlrOrgVO slv2DlrOrgVO) throws Exception {
        String userId = LoginUtil.getUserId();
        slv2DlrOrgVO.setRegUsrId(userId);
        slv2DlrOrgVO.setUpdtUsrId(userId);

        // 납세자 식별번호 중복 체크
        int dupTaxpayerIdCdCnt = slv2DlrOrgDAO.selectDupTaxpayerIdCdCnt(slv2DlrOrgVO);
        if(dupTaxpayerIdCdCnt > 0){
            throw processException("global.err.duplicate");
        }

        return slv2DlrOrgDAO.updateSaleSlv2DlrOrgMgmtSave(slv2DlrOrgVO);
    }

}
