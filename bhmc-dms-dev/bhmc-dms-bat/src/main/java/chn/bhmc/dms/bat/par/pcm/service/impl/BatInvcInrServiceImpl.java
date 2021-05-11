package chn.bhmc.dms.bat.par.pcm.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.par.pcm.service.BatInvcDetailService;
import chn.bhmc.dms.bat.par.pcm.service.BatInvcInrService;
import chn.bhmc.dms.bat.par.pcm.service.BatInvcService;
import chn.bhmc.dms.bat.par.pcm.service.dao.BatInvcInrDAO;
import chn.bhmc.dms.bat.par.pcm.vo.BatInvcInrSearchVO;
import chn.bhmc.dms.bat.par.pcm.vo.BatInvcInrVO;
import chn.bhmc.dms.bat.par.cmm.service.BatPartsCmmCamelService;

/**
 * BatInvcInrServiceImpl Implement class
 *
 * @author In Bo Shim
 * @since 2016. 5. 17.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 5. 17.     In Bo Shim      최초 생성
 * </pre>
 */
@Service("batInvcInrService")
public class BatInvcInrServiceImpl extends HService implements BatInvcInrService {

    @Resource(name="batInvcInrDAO")
    private BatInvcInrDAO batInvcInrDAO;

    /**
     * 송장 헤더 서비스
     */
    @Resource(name="batInvcService")
    BatInvcService batInvcService;

    /**
     * 송장 상세 서비스
     */
    @Resource(name="batInvcDetailService")
    BatInvcDetailService batInvcDetailService;

    @Autowired
    BatPartsCmmCamelService batPartsCmmCamelService;

    /*
     * @see chn.bhmc.dms.bat.par.pcm.service.BatInvcInrService#updateBatInvcInr(chn.bhmc.dms.bat.par.pcm.vo.BatInvcInrVO)
     */
    @Override
    public int updateBatInvcInr(BatInvcInrVO batInvcInrVO) throws Exception {
        return batInvcInrDAO.updateBatInvcInr(batInvcInrVO);
    }

    /*
     * @see chn.bhmc.dms.bat.par.pcm.service.BatInvcInrService#multiBatInvcInr(chn.bhmc.dms.bat.par.pcm.vo.BatInvcInrSearchVO)
     */
    @Override
    public void multiBatInvcInr(BatInvcInrSearchVO searchVO) throws Exception {


    }

    /*
     * @see chn.bhmc.dms.bat.par.pcm.service.BatInvcInrService#selectBatInvcInrByKey(java.lang.String, java.lang.String)
     */
    @Override
    public BatInvcInrVO selectBatInvcInrByKey(String inrDlrCd, String inrInvNo) throws Exception {
        return batInvcInrDAO.selectBatInvcInrByKey(inrDlrCd, inrInvNo);
    }

    /*
     * @see chn.bhmc.dms.bat.par.pcm.service.BatInvcInrService#selectBatInvcInrsByCondition(chn.bhmc.dms.bat.par.pcm.vo.BatInvcInrSearchVO)
     */
    @Override
    public List<BatInvcInrVO> selectBatInvcInrsByCondition(BatInvcInrSearchVO searchVO) throws Exception {
        return batInvcInrDAO.selectBatInvcInrsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.bat.par.pcm.service.BatInvcInrService#selectStockMovStorageHeadersByConditionCnt(chn.bhmc.dms.bat.par.pcm.vo.BatInvcInrSearchVO)
     */
    @Override
    public int selectBatInvcInrsByConditionCnt(BatInvcInrSearchVO searchVO) throws Exception {
        return batInvcInrDAO.selectBatInvcInrsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.bat.par.pcm.service.BatInvcInrService#insertInvoiceInfo(int)
     */
    @Override
    public void insertInvoiceInfo(int day) throws Exception {
        // TODO Auto-generated method stub
        batInvcInrDAO.insertInvoiceInfo(day);

        HashMap<String, Object> message = new HashMap<String, Object>();

        //int headerCnt = batInvcInrDAO.selectInvoiceHeaderIfByConditionCnt();
        //int detailCnt = batInvcInrDAO.selectInvoiceDetailIfByConditionCnt();

        //if(headerCnt > 0){
            batPartsCmmCamelService.executeCamelClient(message, "PTS105");
        //}
        //if(detailCnt > 0){
            batPartsCmmCamelService.executeCamelClient(message, "PTS106");
        //}
    }

}
