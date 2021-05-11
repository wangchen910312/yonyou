package chn.bhmc.dms.bat.ser.ro.service.dao;

import able.com.mybatis.Mapper;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RepairOrderInfoReqDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 8. 31.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 31.     Kwon ki hyun     최초 생성
 * </pre>
 */
@Mapper("repairOrderInfoReqDAO")
public interface RepairOrderInfoReqDAO {

    /**
     *
     * RO 정보 인터페이스 테이블 에 등록
     *
     * @throws Exception
     */
    public void insertRepairOrderReq(int day)throws Exception;

    public int selectRepairOrderIfByConditionCnt()throws Exception;

    public int selectRepairOrderPartIfByConditionCnt()throws Exception;

    public int selectRepairOrderLaborIfByConditionCnt()throws Exception;

    public int selectRepairInfoIfByConditionCnt() throws Exception;

}
