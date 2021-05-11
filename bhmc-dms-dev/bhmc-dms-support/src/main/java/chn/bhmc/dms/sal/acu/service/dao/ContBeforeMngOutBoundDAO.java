package chn.bhmc.dms.sal.acu.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.acu.vo.ContBeforeMngOutBoundVO;
import chn.bhmc.dms.sal.acu.vo.ContBeforeMngSupportSearchVO;

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

@Mapper("contBeforeMngOutBoundDAO")
public interface ContBeforeMngOutBoundDAO {

    /**
     * 예약판매 내역을 조회한다.
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<ContBeforeMngOutBoundVO> selectContBeforeMngsByCondition(ContBeforeMngSupportSearchVO searchVO) throws Exception;
    
    /**
     * 예약판매 고객정보 수정한다. 
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int updateContBeforeMngCustInfo(ContBeforeMngOutBoundVO saveVO) throws Exception;
    
    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ContBeforeMngSearchVO
     * @return
     */
    public int selectOpptBeforeCountsByConditionCnt(ContBeforeMngOutBoundVO searchVO) throws Exception;
    
    
    /**
     * 생성한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int insertContBeforeMng(ContBeforeMngOutBoundVO saveVO) throws Exception;

    
}
