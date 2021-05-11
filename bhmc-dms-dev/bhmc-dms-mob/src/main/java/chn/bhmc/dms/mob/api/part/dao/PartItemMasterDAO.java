package chn.bhmc.dms.mob.api.part.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.part.vo.ItemMasterExcelDownVO;
import chn.bhmc.dms.mob.api.part.vo.ItemMasterSearchVO;
import chn.bhmc.dms.mob.api.part.vo.ItemMasterVO;

/**
 * 부품마스터에 관한 데이터처리 매퍼 클래스
 *
 * @author Ju Won Lee
 * @since 2016. 1. 7.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.07         Ju Won Lee            최초 생성
 * </pre>
 */

@Mapper("PartItemMasterDAO")
public interface PartItemMasterDAO {


    /**
     * Key에 해당하는 부품마스터 정보를 조회한다.
     * @param cntryCd - 부품마스터(2자리)
     * @param langCd - 언어코드
     * @return 조회한 부품마스터 정보
     */
    public ItemMasterVO selectItemMasterByKey(ItemMasterSearchVO itemMasterSearchVO);


    /**
     * 조회 조건에 해당하는 부품마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return 조회 목록
     */
    public List<ItemMasterVO> selectItemMastersByCondition(ItemMasterSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 부품마스터 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return
     */
    public int selectItemMastersByConditionCnt(ItemMasterSearchVO searchVO);

    /**
     * 부품번호의 수정일시를 조회한다.
     * @param ItemMasterVO itemMasterVO
     * @return 조회한 수정일시
     */
    public String selectItemMasterUpdtDtByKey(ItemMasterVO itemMasterVO);

    /**
     * 조회 조건에 해당하는 부품마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ItemMasterSearchVO
     * @return 조회 목록
     */
    public List<ItemMasterExcelDownVO> selectItemMastersExcelDownByCondition(ItemMasterSearchVO searchVO);

}
