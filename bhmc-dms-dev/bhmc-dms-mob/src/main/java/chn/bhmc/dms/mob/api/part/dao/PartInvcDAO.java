package chn.bhmc.dms.mob.api.part.dao;

import java.util.List;

import able.com.mybatis.Mapper;
import chn.bhmc.dms.mob.api.part.vo.InvcItemVO;
import chn.bhmc.dms.mob.api.part.vo.InvcSearchVO;
import chn.bhmc.dms.mob.api.part.vo.InvcVO;




/**
 * 송장 데이타 매퍼 클래스
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
@Mapper("PartInvcDAO")
public interface PartInvcDAO {

    /**
     * 조회 조건에 해당하는 송장 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public List<InvcVO> selectInvcsByCondition(InvcSearchVO searchVO);

//    /**
//     * Key에 해당하는 업로드 등록용 기타입고 부품 정보를 조회한다.
//     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcItemVO
//     * @return 조회한 기타입고 부품정보
//     */
//    public InvcItemVO selectInvcReceiveEtcItemExcelUploadByKey(InvcItemVO invcItemVO);

    /**
     * 조회 조건에 해당하는 송장 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록 수
     */
    public int selectInvcsByConditionCnt(InvcSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 입고 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public List<InvcVO> selectReceivesByCondition(InvcSearchVO searchVO);
    
    /**
     * 조회 조건에 해당하는 입고 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public List<InvcVO> selectReceivesSumByCondition(InvcSearchVO searchVO);

    /**
     * 입고확정 대상 송장정보를 조회한다.(모바일용)
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public List<InvcVO> selectReceiveByMobile(InvcSearchVO invcSearchVO);


    /**
     * 입고확정 대상 송장정보 Count를 조회한다.(모바일용)
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public int selectReceiveByMobileCnt(InvcSearchVO invcSearchVO);

    
    /**
     * Key에 해당하는 송장관리 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public InvcVO selectInvcByKey(InvcVO invcVO);

    /**
     * 조회조건에 해당하는 입고확정대상 부품 정보를 조회한다.(모바일 바코드용)
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public InvcItemVO selectReceiveItemByInvcItemBarcode(InvcSearchVO invcSearchVO);

    /**
     * 조회조건에 해당하는 입고확정대상 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public List<InvcItemVO> selectReceiveItemByCondition(InvcSearchVO invcSearchVO);

    /**
     * 조회 조건에 해당하는입고확정대상 부품 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록 수
     */
    public int selectReceiveItemByConditionCnt(InvcSearchVO searchVO);

    /**
     * 조회조건에 해당하는 입고 현황을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회목록
     */
    public List<InvcItemVO> selectReceiveCnfmListByCondition(InvcSearchVO searchVO);

    /**
     * 조회조건에 해당하는 입고 현황 조회 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회목록 수
     */
    public int selectReceiveCnfmListByConditionCnt(InvcSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 입고 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록 수
     */
    public int selectReceivesByConditionCnt(InvcSearchVO searchVO);
    
    /**
     * Key에 해당하는 송장관리 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 InvcSearchVO
     * @return 조회 목록
     */
    public List<InvcItemVO> selectInvcItemByKey(InvcSearchVO invcSearchVO);

	public List<InvcItemVO> selectReceiveCnfmItemByInvcKey(InvcSearchVO searchVO);
}
