package chn.bhmc.dms.mis.rpt.service;

import java.util.List;

import chn.bhmc.dms.mis.rpt.vo.MisRptVO;

/**
 * <pre>
 * [DCS] 경영관리 레포트
 * </pre>
 *
 * @ClassName   : MisRptService.java
 * @Description : [DCS] 경영관리 레포트
 * @author chibeom.song
 * @since 2017. 1. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 1. 12.   chibeom.song     최초 생성
 * </pre>
 */

public interface MisRptService {

    public List<MisRptVO> selectSdptList(MisRptVO searchVO);

    public List<MisRptVO> selectOfficeList(MisRptVO searchVO);

    public List<MisRptVO> selectDealerList(MisRptVO searchVO);

    public int selectOfficeListCnt(MisRptVO searchVO) throws Exception;

    public int selectDealerListCnt(MisRptVO searchVO) throws Exception;

    public List<MisRptVO> selectMonthOfficeList(MisRptVO searchVO);

    public List<MisRptVO> selectMonthDealerList(MisRptVO searchVO);

}
