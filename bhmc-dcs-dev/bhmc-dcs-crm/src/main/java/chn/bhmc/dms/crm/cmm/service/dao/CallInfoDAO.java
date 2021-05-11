package chn.bhmc.dms.crm.cmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.crm.cmm.vo.CallInfoSearchVO;
import chn.bhmc.dms.crm.cmm.vo.CallInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CallInfoDAO.java
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

@Mapper("callInfoDAO")
public interface CallInfoDAO {

    public int selectCallInfoByConditionCnt(CallInfoSearchVO searchVO);

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<CallInfoVO> selectCallInfoByCondition(CallInfoSearchVO searchVO);


    /**
     * 콜정보를 입력 한다.
     *
     * @param CallInfoVO
     * @return 등록된 목록수
     */
    public int insertCallInfo(CallInfoVO callInfoVO);

    /**
     * 콜정보를 수정한다.
     *
     * @param CallInfoVO
     * @return 등록된 목록수
     */
    public int updateCallInfo(CallInfoVO callInfoVO);

    /**
     * 콜정보를 삭제한다.
     *
     * @param CallInfoVO
     * @return 등록된 목록수
     */
    public int deleteCallInfo(CallInfoVO callInfoVO);

    /**
     * Key에 해당하는 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param pltCd - 센터코드
     * @param callListNo -
     * @return 조회한 정보
     */
    public CallInfoVO selectCallInfoByKey(@Param("dlrCd") String dlrCd, @Param("pltCd") String pltCd, @Param("callListNo") String callListNo);

    /**
     * 콜번호를 채번한다.
     *
     * @param null
     * @return Call List No
     */
    public String selectNextCallListNo();

}
