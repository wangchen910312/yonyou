package chn.bhmc.dms.sal.usc.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.sal.usc.vo.PurcEvalImageVO;
import chn.bhmc.dms.sal.usc.vo.PurcEvalSearchVO;
import chn.bhmc.dms.sal.usc.vo.PurcEvalVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PurcEvalDAO.java
 * @Description : 중고차매입평가관리 DAO
 * @author Kim yewon
 * @since 2016. 6. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 9.     Kim yewon              최초 생성
 * </pre>
 */

@Mapper("purcEvalDAO")
public interface PurcEvalDAO {


    /**
     * 조회 조건에 해당하는  정보를 조회한다.
     */
    public List<PurcEvalVO> selectPurcByCondition(PurcEvalSearchVO searchVO);

    /**
     *  조회 조건에 해당하는  총 갯수를 조회한다.
     */
    public int selectPurcByConditionCnt(PurcEvalSearchVO searchVO);


    //중고차평가매입정보(단건) 조회
    public PurcEvalVO selectPurcEvalInfo(@Param("purcNo") String carId);
    //중고차평가매입 - 경매(위탁)정보(단건) 조회
    public PurcEvalVO selectAuctInfo(@Param("purcNo") String carId);

    //중고차매입관리 - 경매(위탁)목록 조회
    public List<PurcEvalVO> selectAuctInfoByCondition(PurcEvalSearchVO searchVO);
    //중고차매입관리 - 경매(위탁)목록 총 갯수 조회
    public int selectAuctInfoByConditionCnt(PurcEvalSearchVO searchVO);


    //중고차평가매입 신규저장
    public int insertPurcEvalMng(PurcEvalVO vo) throws Exception;
    //중고차평가매입 수정
    public void updatePurcEvalMng(PurcEvalVO saveVO) throws Exception;



    /**
     * 중고차평가관리 - 경매정보를 등록한다.
     * @param PurcEvalVO - 등록할 정보가 담긴 PurcEvalVO
     * @return 등록된 목록수
     */
    public int insertAuctInfo(PurcEvalVO vo) throws Exception;



    /**
     * 중고차평가관리 - 경매정보를 주키로 검색한다.
     * @param PurcEvalVO - 등록할 정보가 담긴 PurcEvalVO
     * @return 검색된 목록수
     */
    public PurcEvalVO selectAuctInfoByKey(PurcEvalVO vo) throws Exception;



    /**
     * 중고차평가관리 - 경매정보를 수정한다.
     * @param PurcEvalVO - 등록할 정보가 담긴 PurcEvalVO
     * @return 수정된 목록수
     */
    public int updateAuctInfo(PurcEvalVO vo) throws Exception;


    /**
     * 중고차평가관리 - 경매정보를 삭제한다.
     * @param PurcEvalVO - 등록할 정보가 담긴 PurcEvalVO
     * @return 수정된 목록수
     */
    public int deleteAuctInfo(PurcEvalVO vo) throws Exception;


    //중고차매입/평가관리 - 평가용 이미지 데이터 조회.
    public PurcEvalImageVO selectImageEvalVal(PurcEvalSearchVO searchVO);


    //중고차매입/평가관리 - 평가용 이미지 데이터 조회.
    public int selectImageEvalValCnt(PurcEvalSearchVO searchVO);


    //중고차매입/평가관리 - 평가용 이미지의 평가데이터를 저장.
    public int insertImageEval(PurcEvalImageVO vo) throws Exception;
    public void updateImageEval(PurcEvalImageVO saveVO) throws Exception;

}