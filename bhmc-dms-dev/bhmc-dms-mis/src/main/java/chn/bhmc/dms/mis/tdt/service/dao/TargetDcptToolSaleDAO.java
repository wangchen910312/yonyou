package chn.bhmc.dms.mis.tdt.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.mis.tdt.vo.TargetDcptToolCustVO;
import chn.bhmc.dms.mis.tdt.vo.TargetDcptToolSaleVO;

/**
 * <pre>
 * [딜러사] 목표분해도구(판매고문)
 * </pre>
 *
 * @ClassName   : TargetDcptToolSaleDAO.java
 * @Description : [딜러사] 목표분해도구(판매고문)
 * @author chibeom.song
 * @since 2016. 7. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 22.   chibeom.song     최초 생성
 * </pre>
 */
@Mapper("targetDcptToolSaleDAO")
public interface TargetDcptToolSaleDAO {

    /**
     * 시장현황자료를 조회한다.
     *
     * @param searchVO
     * @param provinceCd
     * @return
     */
    public List<TargetDcptToolSaleVO> selectTargetDcptToolSaleAll(TargetDcptToolSaleVO targetDcptToolSaleVO);

    /**
     * 조회 조건에 해당하는 년간목표 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetYearRegSearchVO
     * @return 조회 목록
     */
    public List<TargetDcptToolCustVO> selectTargetDcptToolCustGoal(TargetDcptToolCustVO searchVO);

    /**
     * 조회 조건에 해당하는 년간목표 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetYearRegSearchVO
     * @return
     */
    public int selectTargetDcptToolCustGoalCnt(TargetDcptToolCustVO searchVO);

}
