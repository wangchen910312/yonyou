package chn.bhmc.dms.par.stm.service.dao;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.par.stm.vo.GrGiScheduleVO;

/**
 * 입출고예정정보 데이타 매퍼 클래스
 *
 * @author Ju Won Lee
 * @since 2016. 1. 20.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 20.     Ju Won Lee      최초 생성
 * </pre>
 */

@Mapper("grGiScheduleDAO")
public interface GrGiScheduleDAO {

    /**
     * 입출고 예정 정보를 등록한다.
     * @param grGiScheduleVO - 등록할 정보가 담긴 GrGiScheduleVO
     * @return 등록된 목록수
     */
    public int insertGrGiSchedule(GrGiScheduleVO grGiScheduleVO);



    /**
     * 입출고 예정에 해당하는 입출고문서라인 Max값을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 GrGiScheduleVO
     * @return 조회 목록 수
     */
    public int selectGrGiDocMaxLineNo(GrGiScheduleVO grGiScheduleVO);

    /**
     * 입출고 예정에 해당하는 원본 입출고 예정 수량을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 GrGiScheduleVO
     * @return 조회 목록 수
     */
    public double selectGrGiDocOrgQty(GrGiScheduleVO grGiScheduleVO);

    /**
     * 입출고 예정에 해당하는 원본정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 GrGiScheduleVO
     * @return 조회 목록 수
     */
    public GrGiScheduleVO selectBefGrGiDocInfo(GrGiScheduleVO grGiScheduleVO);

}
