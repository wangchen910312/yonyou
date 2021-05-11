package chn.bhmc.dms.par.ism.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.par.ism.vo.IssueEtcItemVO;
import chn.bhmc.dms.par.ism.vo.IssueEtcSearchVO;
import chn.bhmc.dms.par.ism.vo.IssueEtcVO;
import chn.bhmc.dms.par.pcm.vo.ReceiveEtcItemVO;

/**
 * 기타출고 데이타 매퍼 클래스
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
@Mapper("issueEtcDAO")
public interface IssueEtcDAO {

    /**
     * 기타출고 정보를 등록한다.
     * @param issueEtcVO - 등록할 정보가 담긴 IssueEtcVO
     * @return 등록된 목록수
     */
    public int insertIssueEtc(IssueEtcVO issueEtcVO);

    /**
     * 기타출고 부품 정보를 등록한다.
     * @param issueEtcVO - 등록할 정보가 담긴 IssueEtcItemVO
     * @return 등록된 목록수
     */
    public int insertIssueEtcItem(IssueEtcItemVO issueEtcItemVO);

    /**
     * 기타출고 부품 정보를 확정한다.
     * @param issueEtcVO - 등록할 정보가 담긴 IssueEtcItemVO
     * @return 등록된 목록수
     */
    public int updateCnfmIssueEtcItem(IssueEtcItemVO issueEtcItemVO);

    /**
     * 기타출고 부품 정보(인터페이스)를 등록한다.
     * @param issueEtcVO - 등록할 정보가 담긴 IssueEtcItemVO
     * @return 등록된 목록수
     */
    public int insertIssueEtcInterfaceItem(IssueEtcItemVO issueEtcItemVO);

    /**
     * 기타출고 정보를 수정한다.
     * @param issueEtcVO - 수정할 정보가 담긴 IssueEtcVO
     * @return 수정된 목록수
     */
    public int updateIssueEtc(IssueEtcVO issueEtcVO);

    /**
     * 기타출고 정보를 수정일자를 수정한다.
     * @param issueEtcVO - 수정할 정보가 담긴 IssueEtcVO
     * @return 수정된 목록수
     */
    public int updateIssueEtcUpdtDt(IssueEtcVO issueEtcVO);


    /**
     * 기타출고 부품 정보를 수정한다.
     * @param issueEtcVO - 등록할 정보가 담긴 IssueEtcItemVO
     * @return 수정된 목록수
     */
    public int updateIssueEtcItem(IssueEtcItemVO issueEtcItemVO);

    /**
     * 기타출고 부품 정보를 취소한다.
     * @param issueEtcVO - 등록할 정보가 담긴 IssueEtcItemVO
     * @return 취소된 목록수
     */
    public int cancelIssueEtcItemAll(IssueEtcItemVO issueEtcItemVO);

    /**
     * 기타출고 부품 정보를 수정한다.(수불정보)
     * @param issueEtcVO - 등록할 정보가 담긴 IssueEtcItemVO
     * @return 수정된 목록수
     */
    public int updateIssueEtcItemMvtInfo(IssueEtcItemVO issueEtcItemVO);

    /**
     * 기타출고 부품 정보를 수정한다.(인터페이스)
     * @param issueEtcVO - 등록할 정보가 담긴 IssueEtcItemVO
     * @return 수정된 목록수
     */
    public int updateIssueEtcItemInfc(IssueEtcItemVO issueEtcItemVO);


    /**
     * 기타출고 정보를 취소한다.
     * @param issueEtcVO - 전송할 정보가 담긴 IssueEtcVO
     * @return 취소된 목록수
     */
    public int cancelIssueEtc(IssueEtcVO issueEtcVO);

    /**
     * 기타출고 부품 정보를 삭제한다.
     * @param issueEtcVO - 전송할 정보가 담긴 IssueEtcItemVO
     * @return 삭제된 목록수
     */
    public int deleteIssueEtcItem(IssueEtcItemVO issueEtcItemVO);

    /**
     * 기타출고 부품 정보를 삭제한다.(수불발생안한 등록한 부품 삭제)
     * @param issueEtcVO - 전송할 정보가 담긴 IssueEtcItemVO
     * @return 삭제된 목록수
     */
    public int deleteRegIssueEtcItem(IssueEtcItemVO issueEtcItemVO);

    /**
     * Key에 해당하는 기타출고 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param lvlId - 레벨ID
     * @return 조회한 기타출고 정보
     */
    public IssueEtcVO selectIssueEtcByKey(IssueEtcSearchVO issueEtcSearchVO);

    /**
     * Key에 해당하는 기타출고 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueEtcSearchVO
     * @return 조회 목록
     */
    public List<IssueEtcItemVO> selectIssueEtcItemByKey(IssueEtcSearchVO issueEtcSearchVO);

    /**
     * Key에 해당하는 차입출고 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueEtcSearchVO
     * @return 조회 목록
     */
    public List<ReceiveEtcItemVO> selectRentalItemByKey(IssueEtcSearchVO issueEtcSearchVO);

    /**
     * Key에 해당하는 업로드 등록용 기타출고 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueEtcItemVO
     * @return 조회한 기타출고 부품정보
     */
    public IssueEtcItemVO selectIssueEtcItemExcelUploadByKey(IssueEtcItemVO issueEtcItemVO);

    /**
     * 기타출고 정보에 해당하는 기타출고 부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueEtcItemVO
     * @return 조회한 기타출고 부품정보
     */
    public IssueEtcItemVO selectItemInfoByIssueEtcerInfo(IssueEtcItemVO issueEtcItemVO);

    /**
     * 조회 조건에 해당하는 기타출고 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueEtcSearchVO
     * @return 조회 목록
     */
    public List<IssueEtcVO> selectIssueEtcsByCondition(IssueEtcSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 기타출고 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectIssueEtcsByConditionCnt(IssueEtcSearchVO searchVO);

    /**
     * 구매번호에 해당하는 구매라인 Max값을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectIssueEtcMaxLineNo(IssueEtcVO issueEtcVO);


    /**
     * 조회 조건에 해당하는 기타출고부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueEtcSearchVO
     * @return 조회 목록
     */
    public List<IssueEtcItemVO> selectInvcItemsByCondition(IssueEtcSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 기타출고 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectInvcItemsByConditionCnt(IssueEtcSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 기타출고부품렌탈 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueEtcSearchVO
     * @return 조회 목록
     */
    public List<IssueEtcItemVO> selectIssueEtcRentalPop(IssueEtcSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 기타출고부품렌탈 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectIssueEtcRentalPopCnt(IssueEtcSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 기타출고(대여반환) 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueEtcSearchVO
     * @return 조회 목록
     */
    public List<IssueEtcItemVO> selectIssueEtcReturnPop(IssueEtcSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 기타출고(대여반환) 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectIssueEtcReturnPopCnt(IssueEtcSearchVO searchVO);

    /**
     * 기타입고(조달출고)부품 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueEtcSearchVO
     * @return 조회 목록
     */
    public List<IssueEtcItemVO> selectIssueEtcFundsByCondition(IssueEtcSearchVO searchVO);

    /**
     * 기타입고(조달출고)팝업 부품 정보 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectIssueEtcFundsByConditionCnt(IssueEtcSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 기타출고집계 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록
     */
    public List<IssueEtcVO> selectIssueEtcListByCondition(IssueEtcSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 기타출고집계 총 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ReceiveEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectIssueEtcListByConditionCnt(IssueEtcSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 기타출고명세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueEtcSearchVO
     * @return 조회 목록
     */
    public List<IssueEtcItemVO> selectIssueEtcDetailListByCondition(IssueEtcSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 기타출고명세 총 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectIssueEtcDetailListByConditionCnt(IssueEtcSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 기타출고(차출출고)명세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueEtcSearchVO
     * @return 조회 목록
     */
    public List<IssueEtcItemVO> selectIssueEtcRentalDetailListByCondition(IssueEtcSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 기타출고(차출출고)명세 총 Count를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueEtcSearchVO
     * @return 조회 목록 수
     */
    public int selectIssueEtcRentalDetailListByConditionCnt(IssueEtcSearchVO searchVO);


    /**
     * 기타출고Key에 해당하는 수정일자  정보를 조회한다.
     * @param issueEtcVO - 조회할 정보가 담긴 IssueEtcVO
     * @return 조회한 기타출고  정의 정보
     */
    public String selectIssueEtcUpdtDtByKey(IssueEtcVO issueEtcVO);


}
