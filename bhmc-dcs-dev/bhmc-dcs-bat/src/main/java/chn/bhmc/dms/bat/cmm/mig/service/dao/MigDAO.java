package chn.bhmc.dms.bat.cmm.mig.service.dao;

import able.com.mybatis.MigMapper;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MigDAO.java
 * @Description : DCS Migration을 위한 배치
 * @author Choi KyungYong
 * @since 2017. 07. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 07. 10.    Choi KyungYong         최초 생성
 * </pre>
 */

@MigMapper("migDAO")
public interface MigDAO {

    public int deleteMigGdms();

    public int insertMigGdms();

    public int deleteMigGdmsDlr(String dlrCd);

    public int insertMigGdmsDlr(String dlrCd);

    public int insertMigSiebel(String dlrCd);

    public int insertMigProcMain(String dlrCd);

    public int insertProcMainAll();

}