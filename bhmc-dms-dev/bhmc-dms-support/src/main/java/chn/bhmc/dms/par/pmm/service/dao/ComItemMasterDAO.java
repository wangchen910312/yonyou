package chn.bhmc.dms.par.pmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.par.pmm.vo.ComItemMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.ComItemMasterVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterVO;

/**
 * <pre>
 * 공용품목마스터에 관한 데이터처리 매퍼 클래스
 * </pre>
 *
 * @ClassName   : ComItemMasterDAO.java
 * @author Eun Jung Jang
 * @since 2016. 5. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 16.     Eun Jung Jang     최초 생성
 * </pre>
 */

@Mapper("comItemMasterDAO")
public interface ComItemMasterDAO {

    /**
     * Key에 해당하는 공용부품마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ComItemMasterSearchVO
     * @return 조회 목록
     */
    public List<ComItemMasterVO> comItemMasterByKey(ComItemMasterSearchVO searchVO);

    /**
     * Key에 해당하는 공용부품마스터 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ComItemMasterSearchVO
     * @return
     */
    public int comItemMasterByKeyCnt(ComItemMasterSearchVO searchVO);

    /**
     * 조회조건에 해당하는 공용부품마스터 재고정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ComItemMasterSearchVO
     * @return 조회 목록
     */
    public List<ItemMasterVO> comItemMasterStockByCondition(ItemMasterSearchVO searchVO);

    /**
     * 조회조건에 해당하는 공용부품마스터 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ComItemMasterSearchVO
     * @return
     */
    public int comItemMasterStockByConditionCnt(ItemMasterSearchVO searchVO);

    /**
     * 조회조건에 해당하는 공용부품마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ComItemMasterSearchVO
     * @return 조회 목록
     */
    public List<ComItemMasterVO> comItemMasterByCondition(ComItemMasterSearchVO searchVO);

    /**
     * 조회조건에 해당하는 공용부품마스터 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ComItemMasterSearchVO
     * @return
     */
    public int comItemMasterByConditionCnt(ComItemMasterSearchVO searchVO);

    /**
     * 공용부품마스터 정보를 등록한다.
     * @param comItemMasterVO - 등록할 정보가 담긴 ComItemMasterVO
     * @return 등록된 목록수
     */
    public int insertComItemCd(ComItemMasterVO comItemMasterVO);

    /**
     * 공용부품마스터 정보를 수정한다.
     * @param comItemMasterVO - 수정할 정보가 담긴 ComItemMasterVO
     * @return 수정된 목록수
     */
    public int updateComItemCd(ComItemMasterVO comItemMasterVO);

    /**
     * 공용부품마스터 정보를 삭제한다.
     * @param comItemMasterVO - 삭제할 정보가 담긴 ComItemMasterVO
     * @return 삭제된 목록수
     */
    public int deleteComItemCd(ComItemMasterVO comItemMasterVO);



}
