package chn.bhmc.dms.par.stm.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.par.stm.vo.ToolGiItemVO;
import chn.bhmc.dms.par.stm.vo.ToolGiSearchVO;
import chn.bhmc.dms.par.stm.vo.ToolGiVO;

/**
 * 공구출고 서비스
 *
 * @author Ju Won Lee
 * @since 2016. 2. 04.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 2. 04.     Ju Won Lee      최초 생성
 * </pre>
 */

public interface ToolGiService {

    /**
     *공구출고  정보를 등록한다.
     * @param toolGiVO - 등록할 정보가 담긴 ToolGiVO
     * @return 등록된 목록수
     */
    public ToolGiVO createToolGi(List<ToolGiItemVO> list, ToolGiVO toolGiVO) throws Exception;

    /**
     *공구출고  정보를 수정한다.
     * @param toolGiVO - 수정할 정보가 담긴 ToolGiVO
     * @return 수정된 목록수
     */
    public void multiToolGis(BaseSaveVO<ToolGiItemVO> toolGiSaveVO, ToolGiVO toolGiVO) throws Exception;

    /**
     * 공구출고  정보를 취소한다.
     * @param toolGiVO - 취소할 정보가 담긴 ToolGiVO
     * @return 취소된 목록수
     */
    public int cancelToolGi(List<ToolGiItemVO> list, ToolGiVO toolGiVO) throws Exception;

    /**
     * Key에 해당하는 공구출고  정보를 조회한다.
     * @param toolGiVO - 조회할 정보가 담긴 ToolGiVO
     * @return 조회한 공구출고  정의 정보
     */
    public ToolGiVO selectToolGiByKey(ToolGiSearchVO toolGiSearchVO) throws Exception;

    /**
     * Key에 해당하는 공구출고 부품 정보를 조회한다.
     * @param toolGiVO - 조회할 정보가 담긴 ToolGiVO
     * @return 조회한 공구출고  정의 정보
     */
    public List<ToolGiItemVO> selectToolGiItemByKey(ToolGiSearchVO toolGiSearchVO) throws Exception;

    /**
     * Key에 해당하는 업로드 등록용 공구출고 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ToolGiItemVO
     * @return 조회한 공구출고 부품정보
     */
    public ToolGiItemVO selectToolGiItemExcelUploadByKey(ToolGiItemVO toolGiItemVO) throws Exception;

    /**
     * 조회조건에 해당하는 공구출고  정보를 조회한다.
     * @param toolGiVO - 조회할 정보가 담긴 ToolGiVO
     * @return 조회한 공구출고  정의 정보
     */
    public List<ToolGiVO> selectToolGisByCondition(ToolGiSearchVO searchVO) throws Exception;


    /**
     * 조회 조건에 해당하는 공구출고  총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ToolGiSearchVO
     * @return 조회 목록 수
     */
    public int selectToolGisByConditionCnt(ToolGiSearchVO searchVO) throws Exception;

    public String selectNextToolGiDocNo() throws Exception;

    /**
     * 조회 조건에 해당하는 공구출고리스트 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ToolGiSearchVO
     * @return 조회 목록
     */
    public List<ToolGiItemVO> selectToolGiItemListByKey(ToolGiSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 공구출고리스트 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ToolGiSearchVO
     * @return 조회 목록 수
     */
    public int selectToolGiItemListByKeyCnt(ToolGiSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 공구부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ToolGiSearchVO
     * @return 조회 목록
     */
    public List<ToolGiItemVO> selectSearchToolItemByCondition(ToolGiSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 공구부품 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ToolGiSearchVO
     * @return 조회 목록 수
     */
    public int selectSearchToolItemByConditionCnt(ToolGiSearchVO searchVO) throws Exception;


}
