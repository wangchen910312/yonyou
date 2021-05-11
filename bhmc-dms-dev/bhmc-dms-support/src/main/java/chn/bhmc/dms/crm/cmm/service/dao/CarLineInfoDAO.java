package chn.bhmc.dms.crm.cmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import able.com.vo.HMap;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.crm.cmm.vo.CarLineInfoSearchVO;
import chn.bhmc.dms.crm.cmm.vo.CarLineInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CarLineInfoDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kyo Jin Lee
 * @since 2016. 1. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 27.     Kyo Jin Lee     최초 생성
 * </pre>
 */

@Mapper("carLineInfoDAO")
public interface CarLineInfoDAO {

    public int selectCarLineInfoByConditionCnt(CarLineInfoSearchVO searchVO);

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<CarLineInfoVO> selectCarLineInfoByCondition(CarLineInfoSearchVO searchVO);


    /**
     * 관신차량정보를 입력 한다.
     *
     * @param CarLineInfoVO - 등록 정보가 담긴 CarLineInfoVO
     * @return 등록된 목록수
     */
    public int insertCarLine(CarLineInfoVO carLineInfoVO);

    /**
     * 관신차량정보를 수정한다.
     *
     * @param CarLineInfoVO - 등록 정보가 담긴 CarLineInfoVO
     * @return 등록된 목록수
     */
    public int updateCarLine(CarLineInfoVO carLineInfoVO);

    /**
     * 관신차량정보를 수정한다.
     *
     * @param CarLineInfoVO - 등록 정보가 담긴 CarLineInfoVO
     * @return 등록된 목록수
     */
    public int deleteCarLine(CarLineInfoVO carLineInfoVO);

    /**
     * Key에 해당하는 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param pltCd - 센터코드
     * @param seq - CR_0203T의 SEQ
     * @return 조회한 정보
     */
    public CarLineInfoVO selectCarLineByKey(@Param("dlrCd") String dlrCd, @Param("pltCd") String pltCd, @Param("seq") String seq);

    /**
     * 관신차량번호를 채번한다.
     *
     * @param null
     * @return 관신차량번호
     */
    public String selectNextCarLine();

    /**
     * 대표관심차 확인
     * @param HMap
     * @return 등록된 대표차량 수
     */
    public int carLineFlagYnChk(HMap hm);

}
