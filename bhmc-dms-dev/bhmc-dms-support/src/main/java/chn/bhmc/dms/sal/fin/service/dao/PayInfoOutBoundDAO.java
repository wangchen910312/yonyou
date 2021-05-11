package chn.bhmc.dms.sal.fin.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.fin.vo.PayInfoOutBoundDetailVO;
import chn.bhmc.dms.sal.fin.vo.PayInfoOutBoundSearchVO;
import chn.bhmc.dms.sal.fin.vo.PayInfoOutBoundVO;

/**
 * 수납관리
 * 
 * @ClassName   : PayInfoDAO
 * @Description : 수납관리 DAO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 09.    Kim Jin Suk            최초 생성
 * </pre>
 */

@Mapper("payInfoOutBoundDAO")
public interface PayInfoOutBoundDAO {

    /**
     * 수납관리메인 화면을 조회한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public List<PayInfoOutBoundVO> selectPayInfosByCondition(PayInfoOutBoundSearchVO searchVO) throws Exception;

    /**
     * 수납관리 헤더 정보 생성한다.
     */
    public int insertPayInfoHeader(PayInfoOutBoundVO saveVO) throws Exception;
    public int updatePayInfoHeader(PayInfoOutBoundVO saveVO) throws Exception;
    
    /**
     * 수납처리를 한다.
     */
    public int updatePayInfoTotHeader(PayInfoOutBoundDetailVO saveVO) throws Exception;
}