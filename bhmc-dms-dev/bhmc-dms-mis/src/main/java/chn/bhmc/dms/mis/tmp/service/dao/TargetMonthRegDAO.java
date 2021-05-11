package chn.bhmc.dms.mis.tmp.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.mis.tmp.vo.TargetMonthAllRegVO;
import chn.bhmc.dms.mis.tmp.vo.TargetMonthPartRegVO;
import chn.bhmc.dms.mis.tmp.vo.TargetMonthRegSearchVO;
import chn.bhmc.dms.mis.tmp.vo.TargetMonthRegVO;
/**
 * <pre>
 * [제조사] 월간 목표 등록
 * </pre>
 *
 * @ClassName   : TargetMonthRegDAO.java
 * @Description : [제조사] 월간 목표 등록
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

@Mapper("targetMonthRegDAO")
public interface TargetMonthRegDAO {

    /**
     * Key에 해당하는 월간 목표 정보를 조회한다.
     * @param
     * @return
     */
    public TargetMonthAllRegVO selectTargetMonthAllRegByKey(@Param("goalYyMm") String goalYyMm, @Param("goalYy") String goalYy, @Param("goalMm") String goalMm, @Param("sdptCd") String sdptCd, @Param("officeCd") String officeCd, @Param("dlrCd") String dlrCd, @Param("carLineCd") String carLineCd);

    /**
     * 조회 조건에 해당하는 월간목표 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetMonthRegSearchVO
     * @return 조회 목록
     */
    public List<TargetMonthAllRegVO> selectTargetMonthAllRegByCondition(TargetMonthRegSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 월간목표 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetMonthRegSearchVO
     * @return
     */
    public int selectTargetMonthAllRegByConditionCnt(TargetMonthRegSearchVO searchVO);


    /**
     * 월간목표 정보를 등록한다.
     * @param targetMonthAllRegVO - 등록할 정보가 담긴 TargetMonthAllRegVO
     * @return 등록된 목록수
     */
    public int insertTargetMonthAllReg(TargetMonthAllRegVO targetMonthAllRegVO) throws Exception;

    /**
     * 월간목표 정보를 수정한다.
     * @param targetMonthAllRegVO - 수정할 정보가 담긴 TargetMonthAllRegVO
     * @return 수정된 목록수
     */
    public int updateTargetMonthAllReg(TargetMonthAllRegVO targetMonthAllRegVO) throws Exception;

    /**
     * 월간목표 정보를 삭제한다.
     * @param targetMonthAllRegVO - 삭제할 정보가 담긴 TargetMonthAllRegVO
     * @return 삭제된 목록수
     */
    public int deleteTargetMonthAllReg(TargetMonthAllRegVO targetMonthAllRegVO);

    /**
     * 월간목표 정보를 수정한다.
     * @param targetMonthAllRegVO - 수정할 정보가 담긴 TargetMonthAllRegVO
     * @return 수정된 목록수
     */
    public int multiTargetMonthRegCompleteSave(TargetMonthAllRegVO targetMonthAllRegVO) throws Exception;

    /**
     * Key에 해당하는 월간 목표 정보를 조회한다.
     * @param
     * @return
     */
    public TargetMonthPartRegVO selectTargetMonthPartRegByKey(@Param("goalYy") String goalYy, @Param("goalMm") String goalMm, @Param("dlrCd") String dlrCd, @Param("carLineCd") String carLineCd);

    /**
     * 월간목표 정보를 등록한다.
     * @param targetMonthPartRegVO - 등록할 정보가 담긴 TargetMonthPartRegVO
     * @return 등록된 목록수
     */
    public int insertTargetMonthPartReg(TargetMonthPartRegVO targetMonthPartRegVO) throws Exception;

    /**
     * 월간목표 정보를 수정한다.
     * @param targetMonthPartRegVO - 수정할 정보가 담긴 TargetMonthPartRegVO
     * @return 수정된 목록수
     */
    public int updateTargetMonthPartReg(TargetMonthPartRegVO targetMonthPartRegVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<TargetMonthRegVO> selectSdptList(TargetMonthRegSearchVO searchVO);

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<TargetMonthRegVO> selectOfficeList(TargetMonthRegSearchVO searchVO);

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<TargetMonthRegVO> selectDealerList(TargetMonthRegSearchVO searchVO);

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<TargetMonthRegVO> selectMonthOfficeList(TargetMonthRegSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 월간목표 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetMonthRegSearchVO
     * @return
     */
    public int selectOfficeListCnt(TargetMonthRegSearchVO searchVO);

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<TargetMonthRegVO> selectMonthDealerList(TargetMonthRegSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 월간목표 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetMonthRegSearchVO
     * @return
     */
    public int selectDealerListCnt(TargetMonthRegSearchVO searchVO);

}
