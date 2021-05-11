package chn.bhmc.dms.ser.ins.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.ins.vo.InsRegDetailVO;
import chn.bhmc.dms.ser.ins.vo.InsRegSearchVO;
import chn.bhmc.dms.ser.ins.vo.InsRegVO;
import chn.bhmc.dms.ser.svi.vo.InsuranceManageSearchVO;
import chn.bhmc.dms.ser.svi.vo.InsuranceManageVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : InsRegManageDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 8. 8.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 8.     Kwon ki hyun     최초 생성
 * </pre>
 */
@Mapper("insRegManageDAO")
public interface InsRegManageDAO {

    /**
    *
    * 보험등록 관리 등록
    *
    * @param insRegVO
    * @return
    * @throws Exception
    */
   public int insertInsRegManage(InsRegVO insRegVO)throws Exception;

   /**
    *
    * 보험등록 관리 수정
    *
    * @param insRegVO
    * @return
    * @throws Exception
    */
   public int updateInsRegManage(InsRegVO insRegVO)throws Exception;

   /**
    *
    * 보험등록 관리 삭제
    *
    * @param insRegVO
    * @return
    * @throws Exception
    */
   public int deleteInsRegManage(InsRegVO insRegVO)throws Exception;

   /**
    *
    * 보험등록관리 상세 등록
    *
    * @param insRegVO
    * @return
    * @throws Exception
    */
   public int insertInsRegDetailManage(InsRegDetailVO insRegDetailVO)throws Exception;


   /**
    *
    * 보험등록관리 상세 수정
    *
    * @param insRegVO
    * @return
    * @throws Exception
    */
   public int updateInsRegDetailManage(InsRegDetailVO insRegDetailVO)throws Exception;

   /**
    *
    * 보험등록관리 상세 삭제
    *
    * @param insRegVO
    * @return
    * @throws Exception
    */
   public int deleteInsRegDetailManage(InsRegDetailVO insRegDetailVO)throws Exception;


   /**
    *
    * 보험등록관리 목록수
    *
    * @param insRegVO
    * @return
    * @throws Exception
    */
   public int selectInsRegManagesByConditionCnt(InsRegSearchVO searchVO)throws Exception;

   /**
    *
    * 보험등록관리 목록
    *
    * @param insRegVO
    * @return
    * @throws Exception
    */
   public List<InsRegVO> selectInsRegManagesByCondition(InsRegSearchVO searchVO)throws Exception;


   /**
    *
    * 보험등록관리 상세 목록수
    *
    * @param insRegVO
    * @return
    * @throws Exception
    */
   public int selectInsRegDetailManagesByConditionCnt(InsRegSearchVO searchVO)throws Exception;

   /**
    *
    * 보험등록관리 상세 목록
    *
    * @param insRegVO
    * @return
    * @throws Exception
    */
   public List<InsRegDetailVO> selectInsRegDetailManagesByCondition(InsRegSearchVO searchVO)throws Exception;


   /**
    *
    * 보험등록관리 현황 목록수
    *
    * @param insRegVO
    * @return
    * @throws Exception
    */
   public int selectInsRegListByConditionCnt(InsRegSearchVO searchVO)throws Exception;

   /**
    *
    * 보험등록관리 현황 목록
    *
    * @param insRegVO
    * @return
    * @throws Exception
    */
   public List<InsRegVO> selectInsRegListByCondition(InsRegSearchVO searchVO)throws Exception;

   /**
    *
    * 보험팝업  목록
    *
    * @param insRegVO
    * @return
    * @throws Exception
    */
   public List<InsuranceManageVO> selectInsuManagesByCondition(InsuranceManageSearchVO searchVO)throws Exception;
   
   /**
    *
    * 보험팝업  목록수
    *
    * @param insRegVO
    * @return
    * @throws Exception
    */
   public int selectInsuManagesByConditionCnt(InsuranceManageSearchVO searchVO)throws Exception;
   


}
