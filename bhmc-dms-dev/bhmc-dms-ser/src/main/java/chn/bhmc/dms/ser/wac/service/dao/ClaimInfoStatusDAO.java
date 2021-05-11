package chn.bhmc.dms.ser.wac.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.wac.vo.ClaimInfoStatusSearchVO;
import chn.bhmc.dms.ser.wac.vo.ClaimInfoStatusVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimInfoStatusDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 5. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 17.     Kwon Ki Hyun     최초 생성
 * </pre>
 */
@Mapper("claimInfoStatusDAO")
public interface ClaimInfoStatusDAO {


    /**
    *
    * 클레임 정보 현황 목록수를 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimStatusSearchVO
    * @return 클레임 정보 목록수 데이터
    * @throws Exception
    */
    public int selectClaimInfoStatusByConditionCnt(ClaimInfoStatusSearchVO searchVO)throws Exception;


    /**
    *
    * 클레임 정보 현황을 조회한다.
    *
    * @param searchVO - 조회 조건을 포함하는 ClaimStatusSearchVO
    * @return 클레임 정보 목록 데이터
    * @throws Exception
    */
    public List<ClaimInfoStatusVO> selectClaimInfoStatusByCondition(ClaimInfoStatusSearchVO searchVO)throws Exception;

}