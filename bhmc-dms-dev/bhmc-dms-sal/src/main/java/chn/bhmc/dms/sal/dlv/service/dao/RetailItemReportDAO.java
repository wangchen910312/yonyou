package chn.bhmc.dms.sal.dlv.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.dlv.vo.RetailItemReportSearchVO;
import chn.bhmc.dms.sal.dlv.vo.RetailItemReportVO;

/**
 * <pre>
 * 소매 명세 레포트
 * </pre>
 *
 * @ClassName   : RetailItemReportDAO.java
 * @Description : 소매 명세 레포트
 * @author chibeom.song
 * @since 2016. 10. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.10.25.    chibeom.song     최초 생성
 * </pre>
 */
@Mapper("retailItemReportDAO")
public interface RetailItemReportDAO {

   /*이력명세*/
   public int selectRetailItemReportByConditionCnt(RetailItemReportSearchVO searchVO);
   public List<RetailItemReportVO> selectRetailItemReportByCondition(RetailItemReportSearchVO searchVO);

   /*최종정보*/
   public List<RetailItemReportVO> selectRetailItemLastReportByCondition(RetailItemReportSearchVO searchVO);
   public int selectRetailItemLastReportByConditionCnt(RetailItemReportSearchVO searchVO);

   /*팝업상세*/
   public List<RetailItemReportVO> selectRetailItemReportDetailCondition(RetailItemReportSearchVO searchVO);
   public int selectRetailItemReportDetailConditionCnt(RetailItemReportSearchVO searchVO);
}
