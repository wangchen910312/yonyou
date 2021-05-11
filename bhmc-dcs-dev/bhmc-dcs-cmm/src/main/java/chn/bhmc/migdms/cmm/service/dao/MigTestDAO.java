package chn.bhmc.migdms.cmm.service.dao;

import able.com.mybatis.MigMapper;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AwayCustomerDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 4. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 25.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

@MigMapper("migTestDAO")
public interface MigTestDAO {

    public int selectMigTest();

}