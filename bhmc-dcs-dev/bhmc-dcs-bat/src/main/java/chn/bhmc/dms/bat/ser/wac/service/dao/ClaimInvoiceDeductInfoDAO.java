package chn.bhmc.dms.bat.ser.wac.service.dao;

import java.util.HashMap;

import able.com.mybatis.Mapper;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimInvoiceDeductInfoDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 8. 30.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 30.     Kwon ki hyun     최초 생성
 * </pre>
 */
@Mapper("claimInvoiceDeductInfoDAO")
public interface ClaimInvoiceDeductInfoDAO {

    /**
     * BWMS 인보이스 공제 정보
     *
     */
    public void insertBwmsClaimInvoiceDeductInfo(HashMap<String, Object> map)throws Exception;

}
