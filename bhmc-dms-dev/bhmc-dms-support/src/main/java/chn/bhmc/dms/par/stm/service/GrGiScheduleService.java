package chn.bhmc.dms.par.stm.service;

import chn.bhmc.dms.par.stm.vo.GrGiScheduleVO;

/**
 * 입출고 예정정보 서비스
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

public interface GrGiScheduleService {

    /**
     *입출고 예정  정보를 등록한다.
     * @param GrGiScheduleVO - 등록할 정보가 담긴 GrGiScheduleVO
     * @return 등록된 목록수
     */
    public int createGrGiSchedule(GrGiScheduleVO grGiScheduleVO) throws Exception;

    /**
     * 원본 입출고 예정수량을 조회한다.
     * @param GrGiScheduleVO - 등록할 정보가 담긴 GrGiScheduleVO
     * @return 등록된 목록수
     */
    public double selectGrGiDocOrgQty(GrGiScheduleVO grGiScheduleVO) throws Exception;

    /**
     * 입출고 예정에 해당하는 원본정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 GrGiScheduleVO
     * @return 조회 목록 수
     */
    public GrGiScheduleVO selectBefGrGiDocInfo(GrGiScheduleVO grGiScheduleVO) throws Exception;


}
