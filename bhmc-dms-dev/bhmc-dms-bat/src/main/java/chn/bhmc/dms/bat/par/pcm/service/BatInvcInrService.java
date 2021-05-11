package chn.bhmc.dms.bat.par.pcm.service;

import java.util.List;

import chn.bhmc.dms.bat.par.pcm.vo.BatInvcInrSearchVO;
import chn.bhmc.dms.bat.par.pcm.vo.BatInvcInrVO;

/**
 * BatchInvoiceInterface Service
 *
 * @author In Bo Shim
 * @since 2016. 5. 17.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 5. 17.     In Bo Shim      최초 생성
 * </pre>
 */
public interface BatInvcInrService {

    /**
     * 송장 정보를 수정한다.
     * @param batInvcInrVO - 수정할 정보가 담긴 BatInvcInrVO
     * @return 수정된 목록수
     */
    public int updateBatInvcInr(BatInvcInrVO batInvcInrVO) throws Exception;

    /**
     * Key에 해당하는 송장 정보를 조회한다.
     * @param inrDlrCd - 딜러코드
     * @param inrInvNo - 송장문서번호
     * @return 조회한 송장 인터페이스 헤더 정보
     */
    public BatInvcInrVO selectBatInvcInrByKey(String inrDlrCd, String inrInvNo) throws Exception;

    /**
     * 송장 인터페이스 정보를 조회/추가/수정한다.
     * @param searchVO - 조회 조건을 포함하는 BatInvcInrSearchVO
     * @return
     */
    public void multiBatInvcInr(BatInvcInrSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 송장 인터페이스 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BatInvcInrSearchVO
     * @return 조회 목록
     */
    public List<BatInvcInrVO> selectBatInvcInrsByCondition(BatInvcInrSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 송장 인터페이스 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BatInvcInrSearchVO
     * @return 조회 목록 수
     */
    public int selectBatInvcInrsByConditionCnt(BatInvcInrSearchVO searchVO) throws Exception;

    /**
    *
    * 송장 정보 인터페이스 테이블 에 등록
    *
    * @throws Exception
    */
   public void insertInvoiceInfo(int day)throws Exception;

}
