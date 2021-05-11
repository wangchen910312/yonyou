package chn.bhmc.dms.bat.sal.rcp.service.dao;

import able.com.mybatis.Mapper;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchSecondDistrictDAO
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Jin Suk
 * @since 2017. 6. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 6. 6.      Kim Jin Suk    최초 생성
 * </pre>
 */
@Mapper("batchInvCertInfoDAO")
public interface BatchInvCertInfoDAO {

    /**
     * BIMS에 보낼 영수증 정보를 담는다.
     * @throws Exception
     */
    public void InvCertInfoRun() throws Exception;

}
