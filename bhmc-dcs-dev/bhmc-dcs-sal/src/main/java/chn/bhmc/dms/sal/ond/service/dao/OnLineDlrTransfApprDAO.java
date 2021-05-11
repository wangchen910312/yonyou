package chn.bhmc.dms.sal.ond.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.ond.vo.OnLineDlrTransfApprSearchVO;
import chn.bhmc.dms.sal.ond.vo.OnLineDlrTransfApprVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : OnLineDlrTransfApprDAO
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

@Mapper("onLineDlrTransfApprDAO")
public interface OnLineDlrTransfApprDAO {

    /**
      * 조회 조건에 해당하는 차량조달신청관리 정보를 조회한다.
      */
    public List<OnLineDlrTransfApprVO> selectOnLineDlrTransfAppr(OnLineDlrTransfApprSearchVO searchVO);

    /**
     *  조회 조건에 해당하는 전상운송신청 목록 총 갯수를 조회한다.
     */
    public int selectOnLineDlrTransfApprCnt(OnLineDlrTransfApprSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 전상운송신청 가능 차종정보를 조회한다.
     */
   public List<OnLineDlrTransfApprVO> selectOndCarListsByCondition(OnLineDlrTransfApprSearchVO searchVO);

   /**
    * 조회 조건에 해당하는 전상운송신청 가능 모델정보를 조회한다.
    */
   public List<OnLineDlrTransfApprVO> selectOndModelListsByCondition(OnLineDlrTransfApprSearchVO searchVO);

   /**
    * 조회 조건에 해당하는 전상운송신청 가능 OCN정보를 조회한다.
    */
   public List<OnLineDlrTransfApprVO> selectOndOcnListsByCondition(OnLineDlrTransfApprSearchVO searchVO);

   /**
    * 조회 조건에 해당하는 전상운송신청 가능 배기등급목록을 조회한다.
    */
   public List<OnLineDlrTransfApprVO> selectOndFscpRegGradeListsByCondition(OnLineDlrTransfApprSearchVO searchVO);

   /**
    * 조회 조건에 해당하는 전상운송신청 가능 외색정보를 조회한다.
    */
   public List<OnLineDlrTransfApprVO> selectOndExtClrListsByCondition(OnLineDlrTransfApprSearchVO searchVO);

   /**
    * 조회 조건에 해당하는 전상운송신청 가능 내색정보를 조회한다.
    */
   public List<OnLineDlrTransfApprVO> selectOndIntClrListsByCondition(OnLineDlrTransfApprSearchVO searchVO);

   /**
    * 조회 조건에 해당하는 전상운송가능지 정보를 조회한다.
    */
   public List<OnLineDlrTransfApprVO> selectOndRecevDlrListsByCondition(OnLineDlrTransfApprSearchVO searchVO);

   /**
    * 전상운송심사 수정내용 저장
    */
   public int updateOnLineDlrTransfAppr(OnLineDlrTransfApprVO vo) throws Exception;

   /**
    * 전상운송심사 상태저장
    */
   public int updateOnLineDlrTransfApprStatus(OnLineDlrTransfApprVO vo) throws Exception;

   /**
    * 전상운송심사 인터페이스 저장용 프로시저
    */
   public int procOnLineDlrTransfAppr(OnLineDlrTransfApprVO vo) throws Exception;
}