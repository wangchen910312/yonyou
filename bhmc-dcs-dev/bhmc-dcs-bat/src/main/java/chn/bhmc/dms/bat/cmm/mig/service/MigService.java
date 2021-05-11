package chn.bhmc.dms.bat.cmm.mig.service;

import java.util.List;

import chn.bhmc.dms.cmm.cmp.vo.DealerVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MigService.java
 * @Description : DCS Migration을 위한 배치
 * @author Choi KyungYong
 * @since 2017. 07. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since             author              description
 *  ============    ===============    ========================
 *  2017. 07. 10.    Choi KyungYong            최초 생성
 * </pre>
 */

public interface MigService {

    List<DealerVO> selectDcsMigBatch() throws Exception;

    DealerVO selectDcsMigStat() throws Exception;

    int updateDcsMigStat(String dlrCd, String migPrgStat) throws Exception;

    void insertDcsMigBatch() throws Exception;

}