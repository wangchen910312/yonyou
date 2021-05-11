package chn.bhmc.dms.par.stm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.par.stm.vo.ToolGiItemVO;
import chn.bhmc.dms.par.stm.vo.ToolGiSearchVO;
import chn.bhmc.dms.par.stm.vo.ToolGiVO;


/**
 * 공구출고 데이타 매퍼 클래스
 *
 * @author Ju Won Lee
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Ju Won Lee     최초 생성
 * </pre>
 */
@Mapper("toolGiDAO")
public interface ToolGiDAO {

    /**
     * 공구출고 정보를 등록한다.
     * @param toolGiVO - 등록할 정보가 담긴 ToolGiVO
     * @return 등록된 목록수
     */
    public int insertToolGi(ToolGiVO toolGiVO);

    /**
     * 공구출고 부품 정보를 등록한다.
     * @param toolGiVO - 등록할 정보가 담긴 ToolGiItemVO
     * @return 등록된 목록수
     */
    public int insertToolGiItem(ToolGiItemVO toolGiItemVO);

    /**
     * 공구출고 부품 정보(인터페이스)를 등록한다.
     * @param toolGiVO - 등록할 정보가 담긴 ToolGiItemVO
     * @return 등록된 목록수
     */
    public int insertToolGiInterfaceItem(ToolGiItemVO toolGiItemVO);

    /**
     * 공구출고 정보를 수정한다.
     * @param toolGiVO - 수정할 정보가 담긴 ToolGiVO
     * @return 수정된 목록수
     */
    public int updateToolGi(ToolGiVO toolGiVO);


    /**
     * 공구출고 부품 정보를 수정한다.
     * @param toolGiVO - 등록할 정보가 담긴 ToolGiItemVO
     * @return 수정된 목록수
     */
    public int updateToolGiItem(ToolGiItemVO toolGiItemVO);

    /**
     * 공구폐기 부품 정보를 수정한다.(수불정보)
     * @param toolGiVO - 등록할 정보가 담긴 ToolGiItemVO
     * @return 수정된 목록수
     */
    public int updateToolGiItemMvtInfo(ToolGiItemVO toolGiItemVO);

    /**
     * 공구폐기  정보를 수정한다.(수불정보)
     * @param toolGiVO - 등록할 정보가 담긴 ToolGiItemVO
     * @return 수정된 목록수
     */
    public int updateToolGiMvtInfo(ToolGiVO toolGiVO);

    /**
     * 공구출고  상태 정보를 수정한다.
     * @param toolGiVO - 등록할 정보가 담긴 ToolGiItemVO
     * @return 수정된 목록수
     */
    public int updateToolGiStat(ToolGiVO toolGiVO);

    /**
     * 공구출고  정보를 취소처리다.
     * @param toolGiVO - 등록할 정보가 담긴 ToolGiItemVO
     * @return 수정된 목록수
     */
    public int updateToolGiCancel(ToolGiVO toolGiVO);

    /**
     * 공구출고  반품 시 반품 미완료 부품을 COUNT한다.
     * @param toolGiSearchVO - 등록할 정보가 담긴 ToolGiSearchVO
     * @return 수정된 목록수
     */
    public int selectReturnUnCompleteItemCntByKey(ToolGiVO toolGiVO);

    /**
     * 공구출고 품목 반품 시 원 출고 정보를 수정한다.
     * @param toolGiVO - 등록할 정보가 담긴 ToolGiItemVO
     * @return 수정된 목록수
     */
    public int updateToolGiItemReturn(ToolGiItemVO toolGiItemVO);


    /**
     * 공구출고 정보를 취소한다.
     * @param toolGiVO - 전송할 정보가 담긴 ToolGiVO
     * @return 취소된 목록수
     */
    public int cancelToolGi(ToolGiVO toolGiVO);

    /**
     * 공구출고 부품 정보를 삭제한다.
     * @param toolGiVO - 전송할 정보가 담긴 ToolGiItemVO
     * @return 삭제된 목록수
     */
    public int deleteToolGiItem(ToolGiItemVO toolGiItemVO);

    /**
     * Key에 해당하는 공구출고 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param lvlId - 레벨ID
     * @return 조회한 공구출고 정보
     */
    public ToolGiVO selectToolGiByKey(ToolGiSearchVO toolGiSearchVO);

    /**
     * Key에 해당하는 공구출고 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ToolGiSearchVO
     * @return 조회 목록
     */
    public List<ToolGiItemVO> selectToolGiItemByKey(ToolGiSearchVO toolGiSearchVO);

    /**
     * Key에 해당하는 업로드 등록용 공구출고 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ToolGiItemVO
     * @return 조회한 공구출고 부품정보
     */
    public ToolGiItemVO selectToolGiItemExcelUploadByKey(ToolGiItemVO toolGiItemVO);

    /**
     * 공구출고 정보에 해당하는 공구출고 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ToolGiItemVO
     * @return 조회한 공구출고 부품정보
     */
    public ToolGiItemVO selectToolGiLineByKey(ToolGiItemVO toolGiItemVO);

    /**
     * 조회 조건에 해당하는 공구출고 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ToolGiSearchVO
     * @return 조회 목록
     */
    public List<ToolGiVO> selectToolGisByCondition(ToolGiSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 공구출고 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ToolGiSearchVO
     * @return 조회 목록 수
     */
    public int selectToolGisByConditionCnt(ToolGiSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 공구부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ToolGiSearchVO
     * @return 조회 목록
     */
    public List<ToolGiItemVO> selectSearchToolItemByCondition(ToolGiSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 공구부품 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ToolGiSearchVO
     * @return 조회 목록 수
     */
    public int selectSearchToolItemByConditionCnt(ToolGiSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 공구출고리스트 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ToolGiSearchVO
     * @return 조회 목록
     */
    public List<ToolGiItemVO> selectToolGiItemListByKey(ToolGiSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 공구출고리스트 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ToolGiSearchVO
     * @return 조회 목록 수
     */
    public int selectToolGiItemListByKeyCnt(ToolGiSearchVO searchVO);

    /**
     * 공구출고에 해당하는 공구출고라인 Max값을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ToolGiSearchVO
     * @return 조회 목록 수
     */
    public int selectToolGiMaxLineNo(ToolGiVO toolGiVO);

    /**
     * 공구출고번호에 해당하는 수정일자  정보를 조회한다.
     * @param toolGiVO - 조회 조건을 포함하는 ToolGiVO
     * @return 조회한 공구출고의 수정일시정보
     */
    public String selectToolGiUpdtDtByKey(ToolGiVO toolGiVO);


}
