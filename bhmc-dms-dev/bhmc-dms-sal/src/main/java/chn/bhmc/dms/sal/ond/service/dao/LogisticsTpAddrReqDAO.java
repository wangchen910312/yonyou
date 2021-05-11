package chn.bhmc.dms.sal.ond.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.ond.vo.LogisticsTpAddrReqSearchVO;
import chn.bhmc.dms.sal.ond.vo.LogisticsTpAddrReqSpVO;
import chn.bhmc.dms.sal.ond.vo.LogisticsTpAddrReqVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LogisticsTpAddrReqDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author HG
 * @since 2017. 3. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 3. 3.         HG                  최초 생성
 * </pre>
 */

@Mapper("logisticsTpAddrReqDAO")
public interface LogisticsTpAddrReqDAO {

    /**
     * 조회 조건에 해당하는 물류운송주소 정보를 조회한다.
     */
    public List<LogisticsTpAddrReqVO> selectLogisticsTpAddrReqList(LogisticsTpAddrReqSearchVO searchVO);

     /**
     * 조회 조건에 해당하는 물류운송주소 정보를 저장한다.
     */
    public int insertLogisticsTpAddrReqList(LogisticsTpAddrReqVO logisticsTpAddrReqVO) throws Exception;

     /**
     * 조회 조건에 해당하는 물류운송주소 정보를 변경한다.
     */
    public int updateLogisticsTpAddrReqList(LogisticsTpAddrReqVO logisticsTpAddrReqVO) throws Exception;

     /**
     * 조회 조건에 해당하는 물류운송주소 정보를 삭제한다.
     */
    public int deleteLogisticsTpAddrReqList(LogisticsTpAddrReqVO logisticsTpAddrReqVO) throws Exception;

         /**
     * 조회 조건에 해당하는 물류운송주소 프로시저를 호출한다.
     */
    public int callProcedureLogisticsTpAddrReqList(LogisticsTpAddrReqSpVO procVO) throws Exception;

}
