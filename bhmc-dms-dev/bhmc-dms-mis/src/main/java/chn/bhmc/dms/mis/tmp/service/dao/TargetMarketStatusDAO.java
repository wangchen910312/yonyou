package chn.bhmc.dms.mis.tmp.service.dao;


import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.mis.tmp.vo.TargetMarketStatusSearchVO;
import chn.bhmc.dms.mis.tmp.vo.TargetMarketStatusVO;
/**
 * <pre>
 * [제조사] 시장현황등록
 * </pre>
 *
 * @ClassName   : TargetMarketStatusDAO.java
 * @Description : [제조사] 시장현황등록
 * @author chibeom.song
 * @since 2016. 9. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 9.    chibeom.song     최초 생성
 * </pre>
 */
@Mapper("targetMarketStatusDAO")
public interface TargetMarketStatusDAO {

    /**
     * 성(우편번호) 목록을 조회한다.
     *
     * @param searchVO
     * @param provinceCd
     * @return
     */
    public List<TargetMarketStatusVO> selectProvinceInfoList(TargetMarketStatusSearchVO searchVO);

    /**
     * 성(우편번호) 목록을 조회한다.
     *
     * @param searchVO
     * @param provinceCd
     * @return
     */
    public List<TargetMarketStatusVO> selectCityInfoList(TargetMarketStatusSearchVO searchVO);

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<TargetMarketStatusSearchVO> selectManuMarketStatusCityList(TargetMarketStatusSearchVO searchVO);

    /**
     * 시장현황자료를 조회한다.
     *
     * @param searchVO
     * @param provinceCd
     * @return
     */
    public List<TargetMarketStatusSearchVO> selectManuMarketStatusByCondition(TargetMarketStatusSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 월간목표 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetMonthRegSearchVO
     * @return
     */
    public int selectManuMarketStatusCityCnt(TargetMarketStatusSearchVO searchVO);

    /**
     * Key에 해당하는 시장현황자료 정보를 조회한다.
     * @param
     * @return
     */
    public TargetMarketStatusVO selectManuMarketStatusRegByKey(@Param("provinceCd") String provinceCd, @Param("cityCd") String cityCd, @Param("regYear") String regYear, @Param("regMonth") String regMonth);


    /**
     * 시장현황자료 정보를 등록한다.
     * @param targetDcptMgmtVO - 등록할 정보가 담긴 TargetDcptMgmtVO
     * @return 등록된 목록수
     */
    public int insertManuMarketStatusReg(TargetMarketStatusVO targetMarketStatusVO) throws Exception;

    /**
     * 시장현황자료 정보를 수정한다.
     * @param targetDcptMgmtVO - 수정할 정보가 담긴 TargetDcptMgmtVO
     * @return 수정된 목록수
     */
    public int updateManuMarketStatusReg(TargetMarketStatusVO targetMarketStatusVO) throws Exception;

    /**
     * 조회조건에 해당하는 시장현황자료 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetMarketStatusSearchVO
     * @return
     */
    public int selectManuMarketStatusByConditionCnt(TargetMarketStatusSearchVO searchVO);

    /**
     * 시장현황자료를 조회한다.
     *
     * @param searchVO
     * @param provinceCd
     * @return
     */
    public List<TargetMarketStatusSearchVO> selectManuMarketStatusRecentByCondition(TargetMarketStatusSearchVO searchVO);

    /**
     * 조회조건에 해당하는 시장현황 상세자료 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 TargetMarketStatusSearchVO
     * @return
     */
    public int selectManuMarketDetailByConditionCnt(TargetMarketStatusSearchVO searchVO);

    /**
     * 시장현황 상세자료를 조회한다.
     *
     * @param searchVO
     * @param provinceCd
     * @return
     */
    public List<TargetMarketStatusSearchVO> selectManuMarketDetailByCondition(TargetMarketStatusSearchVO searchVO);

}
