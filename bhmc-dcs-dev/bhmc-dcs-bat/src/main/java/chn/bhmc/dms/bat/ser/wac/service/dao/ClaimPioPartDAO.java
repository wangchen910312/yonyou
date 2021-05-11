package chn.bhmc.dms.bat.ser.wac.service.dao;

import able.com.mybatis.Mapper;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimPioPartDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 9. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 10.     Kwon ki hyun     최초 생성
 * </pre>
 */

@Mapper("claimPioPartDAO")
public interface ClaimPioPartDAO {

    /**
     *
     * PIO 부품 인테페이스 테이블에 저잗
     *
     * @throws Exception
     */
    public void insertClaimPioPart()throws Exception;
}
