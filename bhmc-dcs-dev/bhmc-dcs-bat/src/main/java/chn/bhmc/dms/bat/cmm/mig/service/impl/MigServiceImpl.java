package chn.bhmc.dms.bat.cmm.mig.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.joda.time.LocalDate;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.cmp.vo.DealerVO;

import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;

import chn.bhmc.dms.cmm.cmp.service.DealerService;

import chn.bhmc.dms.bat.cmm.mig.service.MigService;
import chn.bhmc.dms.bat.cmm.mig.service.dao.MigDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MigServiceImpl.java
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

@Service("migService")
public class MigServiceImpl extends HService implements MigService {
    /**
     * DCS Migration을 위한 DAO
     */
    @Resource(name = "migDAO")
    MigDAO migDAO;

    /**
     * 딜러 관리 서비스
     */
    @Resource(name="dealerService")
    DealerService dealerService;

    public List<DealerVO> selectDcsMigBatch() throws Exception {

        DealerSearchVO dealerSearchVO = new DealerSearchVO();
        dealerSearchVO.setsOpenDt(LocalDate.now().toString("yyyyMMdd"));

        List<DealerVO> arrDealerVO = new ArrayList<DealerVO>();
        arrDealerVO = dealerService.selectDealersByCondition(dealerSearchVO);

        return arrDealerVO;
    }

    public DealerVO selectDcsMigStat() throws Exception {

        DealerSearchVO dealerSearchVO = new DealerSearchVO();
        dealerSearchVO.setsDlrCd("A07AA");

        List<DealerVO> arrDealerVO = new ArrayList<DealerVO>();
        arrDealerVO = dealerService.selectDealersByCondition(dealerSearchVO);

        return arrDealerVO.get(0);
    }

    public int updateDcsMigStat(String dlrCd, String migPrgStat) throws Exception {
        DealerVO dealerVO = new DealerVO();
        dealerVO.setDlrCd(dlrCd);
        dealerVO.setMigPrgStat(migPrgStat);
        int cnt = dealerService.updateDcsMigStat(dealerVO);
        return cnt;
    }

    public void insertDcsMigBatch() throws Exception {

        DealerSearchVO dealerSearchVO = new DealerSearchVO();
        dealerSearchVO.setsOpenDt(LocalDate.now().toString("yyyyMMdd"));

        List<DealerVO> arrDealerVO = new ArrayList<DealerVO>();
        arrDealerVO = dealerService.selectDealersByCondition(dealerSearchVO);

        if(arrDealerVO.size() > 0){
            migDAO.deleteMigGdms();

            migDAO.insertMigGdms();

            migDAO.insertProcMainAll();
        }
    }
}