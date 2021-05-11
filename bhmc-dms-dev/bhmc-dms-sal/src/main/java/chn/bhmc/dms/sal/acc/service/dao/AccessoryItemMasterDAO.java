package chn.bhmc.dms.sal.acc.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.par.pmm.service.dao.ItemMasterDAO;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemMasterSearchVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemMasterVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AccessoryItemMasterDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2017. 2. 4.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 4.     Kang Seok Han     최초 생성
 * </pre>
 */
@Mapper("accessoryItemMasterDAO")
public interface AccessoryItemMasterDAO extends ItemMasterDAO {

    /**
     * 용품마스터 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param itemCd - 품목코드
     * @return
     */
    public AccessoryItemMasterVO selectAccessoryItemMasterByKey(@Param("dlrCd") String dlrCd, @Param("itemCd") String itemCd);

    /**
     * 용품마스터 목록을 조회한다.
     * @param searchVO - 조회할 정보가 담긴 AccessoryItemMasterSearchVO
     * @return 조회한 현재고  정보
     */
    public List<AccessoryItemMasterVO> selectAccessoryItemMastersByCondition(AccessoryItemMasterSearchVO searchVO);

    /**
     * 용품마스터 목록수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 AccessoryItemMasterSearchVO
     * @return 조회 목록 수
     */
    public int selectAccessoryItemMastersByConditionCnt(AccessoryItemMasterSearchVO searchVO);

    /**
     * VAT 조회.
     * @return
     * @throws Exception
     */
    public String selectVATSearch(@Param("sApplyDate") String sApplyDate, @Param("sTypeCd") String sTypeCd) throws Exception;
}
