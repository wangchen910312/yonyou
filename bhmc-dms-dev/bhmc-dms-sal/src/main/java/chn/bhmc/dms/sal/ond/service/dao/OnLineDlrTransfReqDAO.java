package chn.bhmc.dms.sal.ond.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.ond.vo.OnLineDlrTransfReqSaveVO;
import chn.bhmc.dms.sal.ond.vo.OnLineDlrTransfReqSearchVO;
import chn.bhmc.dms.sal.ond.vo.OnLineDlrTransfReqVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : OnLineDlrTransfReqDAO
 * @Description : 전상운송신청
 * @author Lee Seungmin
 * @since 2017. 03. 04
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 03. 04     Lee Seungmin         최초 생성
 * </pre>
 */

@Mapper("onLineDlrTransfReqDAO")
public interface OnLineDlrTransfReqDAO {

    /**
      * 조회 조건에 해당하는 차량조달신청관리 정보를 조회한다.
      */
    public List<OnLineDlrTransfReqVO> selectOnLineDlrTransfReq(OnLineDlrTransfReqSearchVO searchVO);

    /**
     *  조회 조건에 해당하는 전상운송신청 목록 총 갯수를 조회한다.
     */
    public int selectOnLineDlrTransfReqCnt(OnLineDlrTransfReqSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 전상운송신청 가능 차종정보를 조회한다.
     */
   public List<OnLineDlrTransfReqVO> selectOndCarListsByCondition(OnLineDlrTransfReqSearchVO searchVO);

   /**
    * 조회 조건에 해당하는 전상운송신청 가능 모델정보를 조회한다.
    */
   public List<OnLineDlrTransfReqVO> selectOndModelListsByCondition(OnLineDlrTransfReqSearchVO searchVO);

   /**
    * 조회 조건에 해당하는 전상운송신청 가능 OCN정보를 조회한다.
    */
   public List<OnLineDlrTransfReqVO> selectOndOcnListsByCondition(OnLineDlrTransfReqSearchVO searchVO);

   /**
    * 조회 조건에 해당하는 전상운송신청 가능 배기등급목록을 조회한다.
    */
   public List<OnLineDlrTransfReqVO> selectOndFscpRegGradeListsByCondition(OnLineDlrTransfReqSearchVO searchVO);

   /**
    * 조회 조건에 해당하는 전상운송신청 가능 외색정보를 조회한다.
    */
   public List<OnLineDlrTransfReqVO> selectOndExtClrListsByCondition(OnLineDlrTransfReqSearchVO searchVO);

   /**
    * 조회 조건에 해당하는 전상운송신청 가능 내색정보를 조회한다.
    */
   public List<OnLineDlrTransfReqVO> selectOndIntClrListsByCondition(OnLineDlrTransfReqSearchVO searchVO);

   /**
    * 조회 조건에 해당하는 전상운송가능지 정보를 조회한다.
    */
   public List<OnLineDlrTransfReqVO> selectOndRecevDlrListsByCondition(OnLineDlrTransfReqSearchVO searchVO);

   /**
    * 전상운송신청 신규/수정/삭제
    */
   public int insertOnLineDlrTransfReq(OnLineDlrTransfReqSaveVO vo) throws Exception;
   public int updateOnLineDlrTransfReq(OnLineDlrTransfReqSaveVO vo) throws Exception;
   public int deleteOnLineDlrTransfReq(OnLineDlrTransfReqSaveVO vo) throws Exception;

   /**
    * 전상운송신청 폐기
    */
   public int deleteScrapOnLineDlrTransfReq(OnLineDlrTransfReqSaveVO vo) throws Exception;

   /**
    * 전상운송신청 인터페이스 저장용 프로시저
    */
   public int procOnLineDlrTransfReq(OnLineDlrTransfReqSaveVO vo) throws Exception;

}