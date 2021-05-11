package chn.bhmc.dms.ser.wac.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.wac.vo.SanbaoTechSearchVO;
import chn.bhmc.dms.ser.wac.vo.SanbaoTechVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoTechRequestDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 5. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 10.     Kwon Ki Hyun     최초 생성
 * </pre>
 */
@Mapper("sanbaoTechRequestDAO")
public interface SanbaoTechRequestDAO {

    /**
    *
    * 삼보 기술제출 목록수 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoTechSearchVO
    * @return 삼보 기술제출 목록수 데이터
    * @throws Exception
    */
    public int selectSanbaoTechRequestByConditionCnt(SanbaoTechSearchVO searchVO)throws Exception;

    /**
     *
     * 삼보 기술제출 목록 데이터를 조회한다.
     *
     * @param searchVO - 조회 조건을 포함하는 SanbaoTechSearchVO
     * @return 삼보 기술제출 목록 데이터
     * @throws Exception
     */
    public List<SanbaoTechVO> selectSanbaoTechRequestByCondition(SanbaoTechSearchVO searchVO)throws Exception;

    /**
    *
    * 삼보 기술제출  상세 정보 데이터를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 SanbaoTechSearchVO
    * @return 삼보 기술제출 상세 정보 데이터
    * @throws Exception
    */
    public SanbaoTechVO selectSanbaoTechRequestByKey(SanbaoTechSearchVO searchVO)throws Exception;

    /**
     *
     * 삼보 기술제출 등록
     *
     * @param sanbaoTechVO
     * @return
     * @throws Exception
     */
    public int insertSanbaoTechRequest(SanbaoTechVO sanbaoTechVO) throws Exception;

    /**
     *
     * 삼보 기술제출 수정
     *
     * @param sanbaoTechVO
     * @return
     * @throws Exception
     */
    public int updateSanbaoTechRequest(SanbaoTechVO sanbaoTechVO)throws Exception;

    /**
     *
     * 삼보 기술제출 삭제
     *
     * @param sanbaoTechVO
     * @return
     * @throws Exception
     */
    public int deleteSanbaoTechRequest(SanbaoTechVO sanbaoTechVO)throws Exception;

    /**
     *
     * 삼보 tech 요청을 Temp로 저장.
     *
     * @param sanbaoVO - 삼보 요청  목록을 포함하는 sanbaoVO
     * @return bindingResult
     * @throws Exception
     */
    public int insertSanBaoTechkToIf(SanbaoTechVO sanbaoTechVO) throws Exception;

    /**
     *
     * 삼보 tech Rollback
     *
     * @param sanbaoVO - 삼보 요청  목록을 포함하는 sanbaoVO
     * @return bindingResult
     * @throws Exception
     */
    public int insertSanBaoTechkRollBack(SanbaoTechVO sanbaoTechVO) throws Exception;

    /**
     *
     * 삼보 tech 요청 인터페이스 등록
     *
     * @param sanbaoVO - 삼보 tech 요청 인터페이스 등록 목록을 포함하는 sanbaoVO
     * @return bindingResult
     * @throws Exception
     */
    public int insertSanbaoTechRequestIf(SanbaoTechVO sanbaoTechVO) throws Exception;

    /**
     *
     * 삼보 tech 요청 인터페이스 삭제
     *
     * @param sanbaoVO - 삼보 tech 요청 인터페이스 삭제 목록을 포함하는 sanbaoVO
     * @return bindingResult
     * @throws Exception
     */
    public int deleteSanbaoTechRequestIf(SanbaoTechVO sanbaoTechVO) throws Exception;

    /**
     *
     * 삼보 tech 요청 인터페이스 정보
     *
     * @param sanbaoVO - 삼보 tech 요청 인터페이스 정보 목록을 포함하는 sanbaoVO
     * @return bindingResult
     * @throws Exception
     */
    public int selectSanbaoTechRequestIfByConditionCnt(SanbaoTechVO sanbaoTechVO) throws Exception;

    /**
     *
     * 삼보 tech 요청 상태 정보
     *
     * @param sanbaoVO - 삼보 tech 요청 상태 정보 목록을 포함하는 sanbaoVO
     * @return bindingResult
     * @throws Exception
     */
    public String selectSanbaoTechRequestStstCdByKey(SanbaoTechVO sanbaoTechVO) throws Exception;

    /**
     *
     * 삼보 기술처리 사용여부 수정
     *
     * @param saveVO - 삼보 기술처리 사용여부 수정 목록을 포함하는 SanbaoTechVO
     * @return bindingResult
     * @throws Exception
     */
    public int updateSanbaoTechApproveUseYn(SanbaoTechVO sanbaoTechVO)throws Exception;

}
