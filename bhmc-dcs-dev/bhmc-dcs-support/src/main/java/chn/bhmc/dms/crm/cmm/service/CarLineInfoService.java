package chn.bhmc.dms.crm.cmm.service;

import java.util.List;

import able.com.vo.HMap;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.crm.cmm.vo.CarLineInfoSearchVO;
import chn.bhmc.dms.crm.cmm.vo.CarLineInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CarLineInfoService.java
 * @Description : 관심차종 Service
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

public interface CarLineInfoService {

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int selectCarLineInfoByConditionCnt(CarLineInfoSearchVO searchVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<CarLineInfoVO> selectCarLineInfoByCondition(CarLineInfoSearchVO searchVO) throws Exception;

    /**
     * 관신차량정보를 정보를 등록/수정/삭제 처리한다.
     * @param CarLineInfoVO
     */
    public void multiCarLine(BaseSaveVO<CarLineInfoVO> carLineInfoVO) throws Exception;

    /**
     * 관신차량정보를 입력 한다.
     *
     * @param LeadInfoVO - 등록 정보가 담긴 CarLineInfoVO
     * @return 등록된 목록수
     */
    public int insertCarLine(CarLineInfoVO carLineInfoVO) throws Exception;

    /**
     * 관신차량정보를 수정한다.
     *
     * @param LeadInfoVO - 등록 정보가 담긴 CarLineInfoVO
     * @return 등록된 목록수
     */
    public int updateCarLine(CarLineInfoVO carLineInfoVO) throws Exception;

    /**
     * 관신차량정보를 수정한다.
     *
     * @param LeadInfoVO - 등록 정보가 담긴 CarLineInfoVO
     * @return 등록된 목록수
     */
    public int deleteCarLine(CarLineInfoVO carLineInfoVO) throws Exception;

    /**
     * Key에 해당하는 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param pltCd - 센터코드
     * @param seq - CR_0203T의 SEQ
     * @return 조회한 정보
     */
    public CarLineInfoVO selectCarLineByKey(String dlrCd, String pltCd, String seq) throws Exception;

    /**
     * 관신차량번호를 채번한다.
     *
     * @param null
     * @return 관신차량번호
     */
    public String selectNextCarLine() throws Exception;

    /**
     * 대표관심차 확인
     * @param String
     * @return 등록된 대표차량 수
     */
    public int carLineFlagYnChk(HMap hm)throws Exception;

}
