package chn.bhmc.dms.mob.api.part.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.part.vo.ComItemMasterSearchVO;
import chn.bhmc.dms.mob.api.part.vo.ComItemMasterVO;

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

@Mapper("PartComItemMasterDAO")
public interface PartComItemMasterDAO {

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

   


}
