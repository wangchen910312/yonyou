package chn.bhmc.dms.sal.fin.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.fin.vo.PayInfoDetailVO;
import chn.bhmc.dms.sal.fin.vo.PayInfoSearchVO;
import chn.bhmc.dms.sal.fin.vo.PayInfoVO;

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

@Mapper("payInfoDAO")
public interface PayInfoDAO {

    /**
     * 수납관리메인 화면을 조회한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int selectPayInfosByConditionCnt(PayInfoSearchVO searchVO) throws Exception;
    public List<PayInfoVO> selectPayInfosByCondition(PayInfoSearchVO searchVO) throws Exception;

    /**
     * 수납관리 detail목록을 조회한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int selectPayInfoDetailsByConditionCnt(PayInfoSearchVO searchVO) throws Exception;
    public List<PayInfoDetailVO> selectPayInfoDetailsByCondition(PayInfoSearchVO searchVO) throws Exception;

    /**
     * 수납 완료처리 ( 해약 / 정산 완료 )
     */



    /**
     * 수납관리 헤더 정보 생성한다.
     */
    public int insertPayInfoHeader(PayInfoVO saveVO) throws Exception;
    public int updatePayInfoHeader(PayInfoVO saveVO) throws Exception;


    /**
     * 수납처리를 한다.
     */
    public int insertPayInfoDetail(PayInfoDetailVO saveVO) throws Exception;
    public int updatePayInfoTotHeader(PayInfoDetailVO saveVO) throws Exception;

    /**
     * 수납 취소 대상을 조회한다.
     **/
    public List<PayInfoDetailVO> selectCancelPayInfoSerch(PayInfoVO cancelVO) throws Exception;

    /**
     * 수납환불 처리를 한다.
     */
    public int reFundPayInfo(PayInfoDetailVO vo) throws Exception;

    /**
     * 수납을 지운다. (예약판매, 보험)
     **/
    public int deltePayinfoDetail(PayInfoVO vo) throws Exception;
    public int deltePayinfoHeader(PayInfoVO vo) throws Exception;

    /**
     * 수납관리 header 상세정보를 조회한다.
     * @param searchVO
     * @return PayInfoVO
     * @throws Exception
     */
    public PayInfoVO selectPayInfosByKey(PayInfoSearchVO searchVO) throws Exception;
    
    /**
     * 완성차의 기동차영수증 조회한다.
     **/
    public PayInfoVO selectReceiptSearchByKey (PayInfoSearchVO searchVO) throws Exception;
}