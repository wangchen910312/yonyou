package chn.bhmc.dms.sal.veh.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.veh.vo.Slv2DlrOrgVO;
import chn.bhmc.dms.sal.veh.vo.Slv2DlrOrgSearchVO;

/**
 * <pre>
 * 기준정보 > 2급딜러 관리
 * </pre>
 *
 * @ClassName   : Slv2DlrOrgDAO.java
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
@Mapper("slv2DlrOrgDAO")
public interface Slv2DlrOrgDAO {

    /**
     * 조회 조건에 해당하는 기준정보 > 2급딜러 관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 Slv2DlrOrgSearchVO
     * @return 조회 목록
     */
    public List<Slv2DlrOrgVO> selectSaleSlv2DlrOrgMgmtSearchData(Slv2DlrOrgSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 기준정보 > 2급딜러 관리 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 Slv2DlrOrgSearchVO
     * @return
     */
    public int selectSaleSlv2DlrOrgMgmtSearchCnt(Slv2DlrOrgSearchVO searchVO);

    /**
     * 기준정보 > 2급딜러 관리 데이터를 등록한다.
     * @param searchVO - 조회 조건을 포함하는 Slv2DlrOrgVO
     * @return
     */
    public int insertSaleSlv2DlrOrgMgmtSave(Slv2DlrOrgVO slv2DlrOrgVO);

    /**
     * 기준정보 > 2급딜러 관리 데이터를 상세조회
     * @param searchVO - 조회 조건을 포함하는 Slv2DlrOrgVO
     * @return
     */
    public Slv2DlrOrgVO selectSaleSlv2DlrOrgMgmtDetail(Slv2DlrOrgSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 기준정보 > 납세자식별번호 중복체크
     * @param searchVO - 조회 조건을 포함하는 Slv2DlrOrgVO
     * @return
     */
    public int selectDupTaxpayerIdCdCnt(Slv2DlrOrgVO slv2DlrOrgVO);

    /**
     * 기준정보 > 2급딜러 관리 데이터를 수정한다.
     * @param searchVO - 조회 조건을 포함하는 Slv2DlrOrgVO
     * @return
     */
    public int updateSaleSlv2DlrOrgMgmtSave(Slv2DlrOrgVO slv2DlrOrgVO);

}
