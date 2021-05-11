package chn.bhmc.dms.cmm.mig.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.mig.vo.MigVO;

import chn.bhmc.dms.cmm.mig.service.MigService;
import chn.bhmc.dms.cmm.mig.service.dao.MigDAO;
import chn.bhmc.dms.cmm.mig.vo.MigCheckSearchVO;
import chn.bhmc.dms.cmm.mig.vo.MigNdmsComInitLogVO;
import chn.bhmc.dms.cmm.mig.vo.MigProcLogVO;
import chn.bhmc.dms.cmm.mig.vo.MigTgtInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MigServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 12. 7.
 * @version 1.0
 * @see
 * @Modification Information * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 12. 7.     Kang Seok Han     최초 생성
 * </pre>
 */
@Service("migService")
public class MigServiceImpl extends HService implements MigService {

    @Resource(name="migDAO")
    MigDAO migDAO;

    /*
     * @see chn.bhmc.dms.cmm.mig.service.MigService#updateMigNdmsComInit(java.lang.String, java.lang.String)
     */
    @Override
    public void updateMigNdmsComInit(MigVO migVO) throws Exception {
        migDAO.updateMigNdmsComInit(migVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.mig.service.MigService#selectMigProcLogList(java.lang.String)
     */
    @Override
    public List<MigProcLogVO> selectMigProcLogList(String dlrCd, int skipRows) throws Exception {
        return migDAO.selectMigProcLogList(dlrCd, skipRows);
    }

    /*
     * @see chn.bhmc.dms.cmm.mig.service.MigService#updateMigNdmsInsert(java.lang.String)
     */
    @Override
    public void updateMigNdmsInsert(MigVO migVO) throws Exception {
        String dlrCd = migVO.getDlrCd();

        String migPrgStat = migDAO.selectMigPrgStat(dlrCd);
        if("P".equals(migPrgStat)){
            throw processException("Progress GDMS Mig.");
        }else{
            //Migration이 늦은 테이블만 별도로 Thread 실행
            int[] threadPid = {117, 118, 151, 152, 153, 154};
            int cnt = 0;
            for(int i = 0; i < threadPid.length; i++){
                if(migVO.getPartRunNum() <= threadPid[i] && migVO.getPartRunNum2() >= threadPid[i]){
                    MigVO tMigVO = new MigVO();
                    tMigVO.setDlrCd(migVO.getDlrCd());
                    tMigVO.setPartRunNum(threadPid[i]);
                    tMigVO.setPartRunNum2(threadPid[i]);
                    tMigVO.setMembershipPolicy(migVO.getMembershipPolicy());

                    ThreadMigServiceImpl threadMigServiceImpl = new ThreadMigServiceImpl(tMigVO);
                    new Thread (threadMigServiceImpl).start();
                    cnt++;
                }
            }
            /* ex: 117로 들어오는 경우에 Thread로 실행되기 때문에 아래 로직 수행 불필요*/
            if(!(cnt == 1 && migVO.getPartRunNum() == migVO.getPartRunNum2())){
                migDAO.updateMigNdmsInsert(migVO);
            }
        }
    }

    /*
     * @see chn.bhmc.dms.cmm.mig.service.updateMigAfeterProcInsert(java.lang.String)
     */
    @Override
    public void updateMigAfeterProcInsert(MigVO migVO) throws Exception {
        migDAO.updateMigAfeterProcInsert(migVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.mig.service.updateMigDcsDmsProcInsert(java.lang.String)
     */
    @Override
    public void updateMigDcsDmsProcInsert(MigVO mivVO) throws Exception {
        migDAO.updateMigDcsDmsProcInsert(mivVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.mig.service.selectMigTargetList(java.lang.String)
     */
    public List<MigTgtInfoVO> selectMigTargetList(MigTgtInfoVO migTgtInfoVO) throws Exception{
        return migDAO.selectMigTargetList(migTgtInfoVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.mig.service.MigService#selectMigNdmsInsertLogList(int)
     */
    @Override
    public List<MigNdmsComInitLogVO> selectMigNdmsLogList(int skipRows) throws Exception {
        return migDAO.selectMigNdmsLogList(skipRows);
    }

    /*
     * @see chn.bhmc.dms.cmm.mig.service.MigService#selectMigNdmsInsertLogList(int)
     */
    @Override
    public List<MigNdmsComInitLogVO> selectMigCheckList(MigCheckSearchVO searchVO) throws Exception {
        return migDAO.selectMigCheckList(searchVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.mig.service.MigService#multiMigCheckInfo(migVO)
     */
    @Override
    public void multiMigCheckInfo(MigVO migVO) throws Exception{
        migDAO.multiMigCheckInfo(migVO);
    }
}
