package chn.bhmc.dms.mis.tsp.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.mis.tsp.vo.TargetSaleProfitVO;
/**
 * <pre>
 * [딜러사] 판매이익
 * </pre>
 *
 * @ClassName   : TargetSaleProfitService.java
 * @Description : [딜러사] 판매이익
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

public interface TargetSaleProfitService {

    /**
     * 조회 조건에 해당하는 [제조사] 동종업계 참조 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetReferSameBsnsSearchVO
     * @return 조회 목록
     */
    public List<TargetSaleProfitVO> selectTargetSaleProfitByCondition(TargetSaleProfitVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 [제조사] 동종업계 참조 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetReferSameBsnsSearchVO
     * @return
     */
    public int selectTargetSaleProfitByConditionCnt(TargetSaleProfitVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 [제조사] 동종업계 참조 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetReferSameBsnsSearchVO
     * @return 조회 목록
     */
    public List<TargetSaleProfitVO> selectCarlineProfitByCondition(TargetSaleProfitVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 [제조사] 동종업계 참조 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetReferSameBsnsSearchVO
     * @return
     */
    public int selectCarlineProfitByConditionCnt(TargetSaleProfitVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 [제조사] 동종업계 참조 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetReferSameBsnsSearchVO
     * @return 조회 목록
     */
    public List<TargetSaleProfitVO> selectProfitTargetSearchByCondition(TargetSaleProfitVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 [제조사] 동종업계 참조 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetReferSameBsnsSearchVO
     * @return
     */
    public int selectProfitTargetSearchByConditionCnt(TargetSaleProfitVO searchVO) throws Exception;

    /**
     * 시장현황자료 정보를 등록한다.
     * @param targetDcptMgmtVO - 등록할 정보가 담긴 targetDcptMgmtVO
     * @return 등록된 목록수
     */
    public int insertCarlineProfitByCondition(TargetSaleProfitVO searchVO) throws Exception;

    /**
     * Key에 해당하는 시장현황자료 정보를 조회한다.
     * @param
     * @return
     */
    public TargetSaleProfitVO selectCarlineProfitByConditionByKey(String sCarlineYyMm) throws Exception;

    /**
     * 년간 목표 정보를 임시 처리한다.
     * @param TargetYearRegSaveVO
     */
    public void multiCarlineProfitSave(BaseSaveVO<TargetSaleProfitVO> targetSaleProfitVO) throws Exception;

    /**
     * [제조사] 년간 목표 정보를 등록한다.
     * @param targetYearAllRegVO - 등록할 정보가 담긴 TargetYearAllRegVO
     * @return 등록된 목록수
     */
    public int insertCarlineProfitSave(TargetSaleProfitVO targetSaleProfitVO) throws Exception;

    /**
     * [제조사] 년간 목표 정보를 수정한다.
     * @param targetYearAllRegVO - 수정할 정보가 담긴 TargetYearAllRegVO
     * @return 수정된 목록수
     */
    public int updateCarlineProfitSave(TargetSaleProfitVO targetSaleProfitVO) throws Exception;

    /**
     * [제조사] 년간 목표 정보를 삭제한다.
     * @param targetYearAllRegVO - 삭제할 정보가 담긴 TargetYearAllRegVO
     * @return 삭제된 목록수
     */
    public int deleteCarlineProfitSave(TargetSaleProfitVO targetSaleProfitVO) throws Exception;

    /**
     * [제조사] Key에 해당하는 년간 목표 정보를 조회한다.
     * @param
     * @return
     */
    public TargetSaleProfitVO selectCarlineProfitByKey(String goalYy, String goalMm, String carLineCd) throws Exception;

    /**
     * 시장현황자료 정보를 등록한다.
     * @param targetDcptMgmtVO - 등록할 정보가 담긴 targetDcptMgmtVO
     * @return 등록된 목록수
     */
    public int insertProfitTargetByCondition(TargetSaleProfitVO searchVO) throws Exception;

    /**
     * Key에 해당하는 시장현황자료 정보를 조회한다.
     * @param
     * @return
     */
    public TargetSaleProfitVO selectProfitTargetByConditionByKey(String sProfitTargetYyMm) throws Exception;

    /**
     * 년간 목표 정보를 임시 처리한다.
     * @param TargetYearRegSaveVO
     */
    public void multiProfitTargetSave(BaseSaveVO<TargetSaleProfitVO> targetSaleProfitVO) throws Exception;

    /**
     * [제조사] 년간 목표 정보를 등록한다.
     * @param targetYearAllRegVO - 등록할 정보가 담긴 TargetYearAllRegVO
     * @return 등록된 목록수
     */
    public int insertProfitTargetSave(TargetSaleProfitVO targetSaleProfitVO) throws Exception;

    /**
     * [제조사] 년간 목표 정보를 수정한다.
     * @param targetYearAllRegVO - 수정할 정보가 담긴 TargetYearAllRegVO
     * @return 수정된 목록수
     */
    public int updateProfitTargetSave(TargetSaleProfitVO targetSaleProfitVO) throws Exception;

    /**
     * [제조사] 년간 목표 정보를 삭제한다.
     * @param targetYearAllRegVO - 삭제할 정보가 담긴 TargetYearAllRegVO
     * @return 삭제된 목록수
     */
    public int deleteProfitTargetSave(TargetSaleProfitVO targetSaleProfitVO) throws Exception;

    /**
     * [제조사] Key에 해당하는 년간 목표 정보를 조회한다.
     * @param
     * @return
     */
    public TargetSaleProfitVO selectProfitTargetByKey(String goalYy, String goalMm, String carLineCd) throws Exception;


}
