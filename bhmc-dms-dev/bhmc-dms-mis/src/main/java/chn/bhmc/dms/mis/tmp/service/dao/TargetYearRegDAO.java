package chn.bhmc.dms.mis.tmp.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.mis.tmp.vo.TargetYearAllRegVO;
import chn.bhmc.dms.mis.tmp.vo.TargetYearPartRegVO;
import chn.bhmc.dms.mis.tmp.vo.TargetYearRegSearchVO;
import chn.bhmc.dms.mis.tmp.vo.TargetYearRegVO;
/**
 * <pre>
 * [제조사] 년간 목표 등록
 * </pre>
 *
 * @ClassName   : TargetYearRegDAO.java
 * @Description : [제조사] 년간 목표 등록
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

@Mapper("targetYearRegDAO")
public interface TargetYearRegDAO {

    /**
     * Key에 해당하는 년간 목표 정보를 조회한다.
     * @param
     * @return
     */
    public TargetYearAllRegVO selectTargetYearAllRegByKey(@Param("goalYy") String goalYy, @Param("sdptCd") String sdptCd, @Param("officeCd") String officeCd, @Param("dlrCd") String dlrCd, @Param("carLineCd") String carLineCd);

    /**
     * 년간목표 정보를 등록한다.
     * @param targetYearAllRegVO - 등록할 정보가 담긴 TargetYearAllRegVO
     * @return 등록된 목록수
     */
    public int insertTargetYearAllReg(TargetYearAllRegVO targetYearAllRegVO) throws Exception;

    /**
     * 년간목표 정보를 수정한다.
     * @param targetYearAllRegVO - 수정할 정보가 담긴 TargetYearAllRegVO
     * @return 수정된 목록수
     */
    public int updateTargetYearAllReg(TargetYearAllRegVO targetYearAllRegVO) throws Exception;

    /**
     * 년간목표 정보를 삭제한다.
     * @param targetYearAllRegVO - 삭제할 정보가 담긴 TargetYearAllRegVO
     * @return 삭제된 목록수
     */
    public int deleteTargetYearAllReg(TargetYearAllRegVO targetYearAllRegVO);

    /**
     * 년간목표 정보를 등록한다.
     * @param targetYearAllRegVO - 등록할 정보가 담긴 TargetYearAllRegVO
     * @return 등록된 목록수
     */
    public int insertTargetYearAllRegComplete(TargetYearAllRegVO targetYearAllRegVO) throws Exception;

    /**
     * 년간목표 정보를 수정한다.
     * @param targetYearAllRegVO - 수정할 정보가 담긴 TargetYearAllRegVO
     * @return 수정된 목록수
     */
    public int updateTargetYearAllRegComplete(TargetYearAllRegVO targetYearAllRegVO) throws Exception;

    /**
     * 년간목표 정보를 삭제한다.
     * @param targetYearAllRegVO - 삭제할 정보가 담긴 TargetYearAllRegVO
     * @return 삭제된 목록수
     */
    public int deleteTargetYearAllRegComplete(TargetYearAllRegVO targetYearAllRegVO);

    /**
     * 년간목표 정보를 수정한다.
     * @param targetYearAllRegVO - 수정할 정보가 담긴 TargetYearAllRegVO
     * @return 수정된 목록수
     */
    public int multiTargetYearRegCompleteSave(TargetYearAllRegVO targetYearAllRegVO) throws Exception;

    /**
     * Key에 해당하는 년간 목표 정보를 조회한다.
     * @param
     * @return
     */
    public TargetYearPartRegVO selectTargetYearPartRegByKey(@Param("goalYy") String goalYy, @Param("dlrCd") String dlrCd, @Param("carLineCd") String carLineCd);

    /**
     * 년간목표 정보를 등록한다.
     * @param targetYearPartRegVO - 등록할 정보가 담긴 TargetYearPartRegVO
     * @return 등록된 목록수
     */
    public int insertTargetYearPartReg(TargetYearPartRegVO targetYearPartRegVO) throws Exception;

    /**
     * 년간목표 정보를 수정한다.
     * @param targetYearPartRegVO - 수정할 정보가 담긴 TargetYearPartRegVO
     * @return 수정된 목록수
     */
    public int updateTargetYearPartReg(TargetYearPartRegVO targetYearPartRegVO) throws Exception;

    /**
     * 조회 조건에 해당하는 년간목표 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetYearRegSearchVO
     * @return 조회 목록
     */
    public List<TargetYearAllRegVO> selectTargetYearAllRegByCondition(TargetYearRegSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 년간목표 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetYearRegSearchVO
     * @return
     */
    public int selectTargetYearAllRegByConditionCnt(TargetYearRegSearchVO searchVO);

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<TargetYearRegVO> selectYearSdptList(TargetYearRegSearchVO searchVO);

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<TargetYearRegVO> selectYearOfficeList(TargetYearRegSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 년간목표 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetYearRegSearchVO
     * @return
     */
    public int selectOfficeListCnt(TargetYearRegSearchVO searchVO);

    /**
     * 년간목표 정보를 수정한다.
     * @param targetYearAllRegVO - 수정할 정보가 담긴 TargetYearAllRegVO
     * @return 수정된 목록수
     */
    public int multiTargetYearRegCompleteSaveCnt(TargetYearAllRegVO targetYearAllRegVO) throws Exception;

}
