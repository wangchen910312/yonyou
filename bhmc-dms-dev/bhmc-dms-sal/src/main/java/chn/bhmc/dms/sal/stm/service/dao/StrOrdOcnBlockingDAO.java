package chn.bhmc.dms.sal.stm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.stm.vo.StrOrdOcnBlockingSaveVO;
import chn.bhmc.dms.sal.stm.vo.StrOrdOcnBlockingSearchVO;
import chn.bhmc.dms.sal.stm.vo.StrOrdOcnBlockingVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : StrOrdOcnBlockingDAO
 * @Description : 전략오더OCN블러킹 DAO
 * @author Kim Jin Suk
 * @since 2016. 7. 26.
 * @version 1.0
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 25.     Kim Jin Suk           최초 생성
 * </pre>
 */

@Mapper("strOrdOcnBlockingDAO")
public interface StrOrdOcnBlockingDAO {

    /**
     * 전략오더OCN블러킹-헤더 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<StrOrdOcnBlockingVO> selectStrOrdOcnBlockingHeadersByCondition(StrOrdOcnBlockingSearchVO searchVO) throws Exception;

    /**
     * 전략오더OCN블러킹 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectStrOrdOcnBlockingsByConditionCnt(StrOrdOcnBlockingSearchVO searchVO) throws Exception;
    public List<StrOrdOcnBlockingVO> selectStrOrdOcnBlockingsByCondition(StrOrdOcnBlockingSearchVO searchVO) throws Exception;

    /**
     * 전략오더OCN블러킹 삭제
     * @param saveVO
     * @throws Exception
     */
    public int deleteStrOrdOcnBlockings(StrOrdOcnBlockingSaveVO saveVO) throws Exception;

    /**
     *전략오더OCN블러킹 저장
     */
    public int insertStrOrdOcnBlockings(StrOrdOcnBlockingSaveVO saveVO) throws Exception;

    /**
     * 딜러 - 딜러 복사
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int deleteStrOrdOcnBlockingDlrInfo(StrOrdOcnBlockingVO saveVO) throws Exception;
    public int insertStrOrdOcnBlockingDlrInfo(StrOrdOcnBlockingVO saveVO) throws Exception;

    /**
     * 전체딜러 복사
     */
    public int deleteStrOrdOcnBlockingAllDlrCopys(StrOrdOcnBlockingSaveVO deleteVO) throws Exception;
    public int insertStrOrdOcnBlockingAllDlrCopys(StrOrdOcnBlockingSaveVO deleteVO) throws Exception;

}
