package chn.bhmc.dms.crm.dmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.dmm.vo.SpecialPointSearchVO;
import chn.bhmc.dms.crm.dmm.vo.SpecialPointVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SpecialPointDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Hyun Ho
 * @since 2016. 8. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 1.     Kim Hyun Ho     최초 생성
 * </pre>
 */

@Mapper("specialPointDAO")
public interface SpecialPointDAO {

    /**
     * 특별포인트 임시 저장
     * @param saveVO - 등록할 정보가 담긴 SpecialPointVO
     * @return int
     */
    public int insertSpecialPoint(SpecialPointVO saveVO) throws Exception;


    /**
     * 특별포인트 단일건 조회
     * @param searchVO - 조회할 정보가 담긴 SpecialPointSearchVO
     * @return SpecialPointVO
     */
    public SpecialPointVO selectSpecialPointByKey(SpecialPointSearchVO searchVO) throws Exception;


    /** 20160905 / 이인문
     * 조회 조건에 해당하는 특별포인트 관리 총 갯수를 조회한다.
     * @param SpecialPointSearchVO - 딜러코드, 멤버쉽번호
     * @return
     */
    public int selectSpecialPointsByConditionCnt(SpecialPointSearchVO searchVO) throws Exception;

    /** 20160905 / 이인문
     * 조회 조건에 해당하는 특별포인트 정보를 조회한다.
     * @param SpecialPointSearchVO - 딜러코드, 멤버쉽번호
     * @return 조회 목록
     */
    public List<SpecialPointVO> selectSpecialPointsByCondition(SpecialPointSearchVO searchVO) throws Exception;


}
