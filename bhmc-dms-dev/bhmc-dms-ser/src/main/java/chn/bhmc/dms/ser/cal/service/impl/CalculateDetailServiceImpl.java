package chn.bhmc.dms.ser.cal.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.ism.service.IssueReqService;
import chn.bhmc.dms.ser.cal.service.CalculateDetailService;
import chn.bhmc.dms.ser.cal.service.dao.CalculateDetailDAO;
import chn.bhmc.dms.ser.cal.vo.CalculateDetailVO;
import chn.bhmc.dms.ser.cal.vo.CalculateSearchVO;
import chn.bhmc.dms.ser.cal.vo.CalculateVO;
import chn.bhmc.dms.ser.rcv.service.impl.RcvSubDocNoIdGenStrategy;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CalculateDetailServiceImpl.java
 * @Description : 정산 디테일 ServiceImpl
 * @author KyungMok Kim
 * @since 2016. 4. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 18.   KyungMok Kim     최초 생성
 * </pre>
 */

@Service("calculateDetailService")
public class CalculateDetailServiceImpl extends HService implements CalculateDetailService {

    /**
     * 정산 디테일 DAO
     */
    @Resource(name="calculateDetailDAO")
    CalculateDetailDAO calculateDetailDAO;

    /**
     * 부품요청 Service
     */
    @Resource(name="issueReqService")
    IssueReqService issueReqService;

    @Resource(name="calcSubDocNoIdGenService")
    TableIdGenService calcSubDocNoIdGenService;

    @Resource(name="rcvSubDocNoIdGenService")
    TableIdGenService rcvSubDocNoIdGenService;

    /**
     * 조회 조건에 해당하는 디테일 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CalculateSearchVO
     * @return 조회 목록
     */
    public int selectCalculateDetailsByConditionCnt(CalculateSearchVO searchVO) throws Exception {
        return calculateDetailDAO.selectCalculateDetailsByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 디테일을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CalculateSearchVO
     * @return 조회 목록
     */
    public List<CalculateDetailVO> selectCalculateDetailsByCondition(CalculateSearchVO searchVO) throws Exception {
        return calculateDetailDAO.selectCalculateDetailsByCondition(searchVO);
    }

    /**
     * 정산 디테일을 등록/수정/삭제한다.
     * @param calculateDetailSaveVO - 디테일정보를 포함하는 CalculateDetailVO
     * @return
     */
    public void multiCalculateDetail(List<CalculateDetailVO> calculateDetailSaveVO, CalculateVO calVO) throws Exception {

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        CalculateDetailVO partVO = new CalculateDetailVO();
        partVO.setCalcDocNo(calVO.getCalcDocNo());
        partVO.setRcvDocNo(calVO.getRcvDocNo());
        calculateDetailDAO.deleteCalculateDetail(partVO);

        calculateDetailDAO.deleteServiceReceiveDetailByCalc(partVO);

        if(!StringUtil.isNullToString(calVO.getCalcStatCd()).equals("C")){
            for(CalculateDetailVO calculateDetailVO : calculateDetailSaveVO){
                String calcSubDocNo;
                String rcvSubDocNo;

                /**
                 * 정산하위번호(키생성)
                 */
                synchronized (calcSubDocNoIdGenService) {
                    ((CalcSubDocNoIdGenStrategy)calcSubDocNoIdGenService.getStrategy()).setCalcDocNo(calVO.getCalcDocNo());
                    calcSubDocNo = calcSubDocNoIdGenService.getNextStringId();
                }

                calculateDetailVO.setRegUsrId(userId);
                calculateDetailVO.setDlrCd(dlrCd);
                calculateDetailVO.setCalcDocNo(calVO.getCalcDocNo());
                calculateDetailVO.setCalcSubDocNo(calcSubDocNo);
                calculateDetailDAO.insertCalculateDetail(calculateDetailVO);

                /**
                 * 수납하위번호(키생성)
                 */
                synchronized (rcvSubDocNoIdGenService) {
                    ((RcvSubDocNoIdGenStrategy)rcvSubDocNoIdGenService.getStrategy()).setRcvDocNo(calVO.getRcvDocNo());
                    rcvSubDocNo = rcvSubDocNoIdGenService.getNextStringId();
                }

                if(StringUtil.isNullToString(calVO.getCalcStatCd()).equals("04")){
                    calculateDetailVO.setRcvDocNo(calVO.getRcvDocNo());
                    calculateDetailVO.setRcvSubDocNo(rcvSubDocNo);
                    calculateDetailDAO.insertServiceReceiveDetailByCalc(calculateDetailVO);
                }

            }
        }

    }

    public void deleteCalculateDetail(CalculateDetailVO calculateDetailVO) throws Exception {
        calculateDetailVO.setDlrCd(LoginUtil.getDlrCd());
        calculateDetailDAO.deleteCalculateDetail(calculateDetailVO);
    }

    /*
     * @see chn.bhmc.dms.ser.ro.service.CalculateDetailService#insertCalculateDetail(chn.bhmc.dms.ser.ro.vo.CalculateDetailVO)
     */
    public void insertCalculateDetail(CalculateDetailVO calculateDetailVO) throws Exception {
        calculateDetailVO.setDlrCd(LoginUtil.getDlrCd());
        calculateDetailDAO.insertCalculateDetail(calculateDetailVO);
    }

    /*
     * @see chn.bhmc.dms.ser.ro.service.CalculateDetailService#updateCalculateDetail(chn.bhmc.dms.ser.ro.vo.CalculateDetailVO)
     */
    public void updateCalculateDetail(CalculateDetailVO calculateDetailVO) throws Exception {
        calculateDetailVO.setDlrCd(LoginUtil.getDlrCd());
        calculateDetailDAO.updateCalculateDetail(calculateDetailVO);

    }

    /**
     * 수납 디테일을 삭제한다.
     * @param resvDocNo
     * @return
     */
    public void deleteServiceReceiveDetailByCalc(CalculateDetailVO calculateDetailVO) throws Exception{
        calculateDetailVO.setDlrCd(LoginUtil.getDlrCd());
        calculateDetailDAO.deleteServiceReceiveDetailByCalc(calculateDetailVO);
    }
    
    /**
     * 수납 디테일이력을 삭제한다.
     * @param resvDocNo
     * @return
     */
    public void deleteServiceReceiveHistDetailByCalc(CalculateDetailVO calculateDetailVO) throws Exception{
        calculateDetailVO.setDlrCd(LoginUtil.getDlrCd());
        calculateDetailDAO.deleteServiceReceiveHistDetailByCalc(calculateDetailVO);
    }


}