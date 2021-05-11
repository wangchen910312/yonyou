package chn.bhmc.dms.sal.acu.service;

import java.util.List;

import chn.bhmc.dms.sal.acu.vo.ContBeforeMngSaveVO;
import chn.bhmc.dms.sal.acu.vo.ContBeforeMngSearchVO;
import chn.bhmc.dms.sal.acu.vo.ContBeforeMngVO;




/**
 *  예약판매관리 서비스
 *
 * @author Kim Jin Suk
 * @since 2017. 3. 02.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자               수정내용
 *  ----------------    ------------    ---------------------------
 *   2017.03.02         Kim Jin Suk            최초 생성
 * </pre>
 */

public interface ContBeforeMngService {

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
     * 저장, 완성 한다.
     * @param save
     * @return
     * @throws Exception
     */
    public String multiContBeforeMngs(ContBeforeMngVO save) throws Exception;
    
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
    
    /**
     * 삭제(승인전) 한다.
     */
    public String deleteContBefore(ContBeforeMngVO contVO) throws Exception;

    /**
     * 취소(승인후) 한다.
     */
    public String cancelContBefore(ContBeforeMngVO contVO) throws Exception;

    /**
     * 삭제(승인전), 취소(승인후) 한다.
     */
    public int deleteContBeforeMng(ContBeforeMngSaveVO saveVO) throws Exception;


}