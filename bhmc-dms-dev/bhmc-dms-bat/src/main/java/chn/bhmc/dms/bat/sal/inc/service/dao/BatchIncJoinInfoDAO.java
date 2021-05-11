package chn.bhmc.dms.bat.sal.inc.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.bat.sal.inc.vo.BatSysOwnerDlrVO;
import chn.bhmc.dms.bat.sal.inc.vo.BatchIncJoinInfoVO;
import chn.bhmc.dms.bat.sal.inc.vo.BatchIncProcessVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchSalesCamelDAO
 * @Description : 판매배치 DAO
 * @author Kim Jin Suk
 * @since 2016. 7. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.     Kang Seok Han     최초 생성
 * </pre>
 */

@Mapper("batchIncJoinInfoDAO")
public interface BatchIncJoinInfoDAO {

    // 보험 고객추적 배치
    public List<BatchIncProcessVO> selectBatchIncProcessByCondition(BatchIncProcessVO vo) throws Exception;
    
    // 보험내역중 만료 알람배치
    public List<BatchIncJoinInfoVO> selectBatchIncExpireByCondition(BatchIncJoinInfoVO vo) throws Exception;
    
    
    // 시스템 딜러정보 조회
    public List<BatSysOwnerDlrVO> selectSysOwnerDlrByCondition(@Param("sSysOwnerYn") String sSysOwnerYn, @Param("sUseCenterDmsYn") String sUseCenterDmsYn) throws Exception;
    
    
}
