package chn.bhmc.dms.sal.acu.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.acu.vo.ContBeforeMngSearchVO;
import chn.bhmc.dms.sal.acu.vo.ContBeforeMngVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ContBeforeMngDAO
 * @Description : 예약판매 DAO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.     Kang Seok Han     최초 생성
 * </pre>
 */

@Mapper("contBeforeMngDAO")
public interface ContBeforeMngDAO {

    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContBeforeMngSearchVO
     * @return
     */
    public int selectContBeforeMngsByConditionCnt(ContBeforeMngSearchVO searchVO) throws Exception;
    
    /**
     * 조회 조건에 해당하는 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContBeforeMngSearchVO
     * @return
     */
    public List<ContBeforeMngVO> selectContBeforeMngsByCondition(ContBeforeMngSearchVO searchVO) throws Exception;
    
    /**
     * 생성한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int insertContBeforeMng(ContBeforeMngVO saveVO) throws Exception;

    /**
     * 수정한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int updateContBeforeMng(ContBeforeMngVO saveVO) throws Exception;
    
    /**
     * 상태를 변경한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int changeStat(ContBeforeMngVO saveVO) throws Exception;
    
    /**
     * 판매기회 일련번호 변경. 
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int changeOpptSeq(ContBeforeMngVO saveVO) throws Exception;
    
}
