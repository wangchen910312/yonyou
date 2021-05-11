package chn.bhmc.dms.bat.par.pcm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.bat.par.pcm.vo.BatInvcInrSearchVO;
import chn.bhmc.dms.bat.par.pcm.vo.BatInvcInrVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatInvcInrDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Bo Shim
 * @since 2016. 5. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 17.     In Bo Shim     최초 생성
 * </pre>
 */
@Mapper("batInvcInrDAO")
public interface BatInvcInrDAO {

    /**
     * 송장 인터페이스 정보를 수정한다.
     * @param batInvcInrVO - 수정할 정보가 담긴 BatInvcInrVO
     * @return 수정된 목록수
     */
    public int updateBatInvcInr(BatInvcInrVO batInvcInrVO) throws Exception;

    /**
     * Key에 해당하는 송장 인터페이스 정보를 조회한다.
     * @param inrDlrCd - 딜러코드
     * @param inrInvNo - 송장문서번호
     * @return 조회한 송장 인터페이스 헤더 정보
     */
    public BatInvcInrVO selectBatInvcInrByKey(@Param("inrDlrCd") String inrDlrCd, @Param("inrInvNo") String inrInvNo) throws Exception;

    /**
     * 조회 조건에 해당하는 송장 인터페이스 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BatInvcInrSearchVO
     * @return 조회 목록
     */
    public List<BatInvcInrVO> selectBatInvcInrsByCondition(BatInvcInrSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 송장 인터페이스  총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BatInvcInrSearchVO
     * @return 조회 목록 수
     */
    public int selectBatInvcInrsByConditionCnt(BatInvcInrSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 송장 인터페이스 헤더 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BatInvcInrSearchVO
     * @return 조회 목록 수
     */
    public int selectInvoiceHeaderIfByConditionCnt() throws Exception;

    /**
     * 조회 조건에 해당하는 송장 인터페이스 상세 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BatInvcInrSearchVO
     * @return 조회 목록 수
     */
    public int selectInvoiceDetailIfByConditionCnt() throws Exception;

    /**
     * 조회 조건에 해당하는 송장 인터페이스 정보를 I테이블에 Insert한다.
     * @param day - 검색조건
     */
    public void insertInvoiceInfo(int day)throws Exception;
}
