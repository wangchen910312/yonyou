package chn.bhmc.dms.cmm.cmp.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.cmp.service.DealerService;
import chn.bhmc.dms.cmm.cmp.service.dao.DealerDAO;
import chn.bhmc.dms.cmm.cmp.vo.DateBaDmsDownReVO;
import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.DealerVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * 딜러 관리 서비스 구현 클래스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.29         Kang Seok Han            최초 생성
 * </pre>
 */

@Service("dealerService")
public class DealerServiceImpl extends HService implements DealerService {

    /**
     * 딜러 관리 DAO
     */
    @Resource(name="dealerDAO")
    DealerDAO dealerDAO;

    @Autowired
    CommonCodeService commonCodeService;
    
    /**
     * {@inheritDoc}
     */
    @Override
    public int updateDealer(DealerVO dealerVO) throws Exception {

        String userId = LoginUtil.getUserId();
        dealerVO.setUpdtUsrId(userId);

        //聚合支付 Start 
        /**
         * 当选择“Y”时，结算单的支付方式字段，出现“聚合支付”选项，并被设置为默认选项；
         * 当从“Y”调整为“N”时，结算单支付方式的“聚合支付”选项被收回
         * */
        if (dealerVO.getAggregatePaymentUseYn()!=null) {
			if ("Y".equals(dealerVO.getAggregatePaymentUseYn())) {
				//SER061
				CommonCodeVO codeVO = new CommonCodeVO();
				codeVO.setCmmGrpCd("SER061");
				//commonCodeService.updateInitRemarkByService(codeVO);
				codeVO.setCmmCd("26");//测试和生产不同
				//commonCodeService.updateRemarkByService(codeVO);
				codeVO.setUseYn("Y");
				codeVO.setUpdtUsrId(userId);
				commonCodeService.updateUseYn(codeVO);
				
				//SAL172
				CommonCodeVO codeVO1 = new CommonCodeVO();
				codeVO1.setCmmGrpCd("SAL172");
				codeVO1.setCmmCd("13");//测试和生产不同
				codeVO1.setUseYn("Y");
				codeVO1.setUpdtUsrId(userId);
				commonCodeService.updateUseYn(codeVO1);
			}else {
				//SER061
				//CommonCodeVO codeVO = new CommonCodeVO();
				//codeVO.setCmmGrpCd("SER061");
				//commonCodeService.updateInitRemarkByService(codeVO);
				//codeVO.setCmmCd("01");//测试和生产不同
				//commonCodeService.updateRemarkByService(codeVO);
				CommonCodeVO commonCodeVO = new CommonCodeVO();
				commonCodeVO.setCmmGrpCd("SER061");
				commonCodeVO.setCmmCd("26");
				commonCodeVO.setUseYn("N");
				commonCodeVO.setUpdtUsrId(userId);
				commonCodeService.updateUseYn(commonCodeVO);
				
				//SAL172
				CommonCodeVO codeVO1 = new CommonCodeVO();
				codeVO1.setCmmGrpCd("SAL172");
				codeVO1.setCmmCd("13");//测试和生产不同
				codeVO1.setUseYn("N");
				codeVO1.setUpdtUsrId(userId);
				commonCodeService.updateUseYn(codeVO1);
			}
		}
        //聚合支付 end
        
        return dealerDAO.updateDealer(dealerVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public DealerVO selectDealerByKey(String dlrCd) throws Exception {
        return dealerDAO.selectDealerByKey(dlrCd);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<DealerVO> selectDealersForSuggest(String query, int maxRows) throws Exception {
        if(StringUtils.isBlank(query)){
            return new ArrayList<DealerVO>();
        }
        return dealerDAO.selectDealersForSuggest(query, maxRows);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<DealerVO> selectDealersByCondition(DealerSearchVO searchVO) throws Exception {
        return dealerDAO.selectDealersByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectDealersByConditionCnt(DealerSearchVO searchVO) throws Exception {
        return dealerDAO.selectDealersByConditionCnt(searchVO);
    }
    
    /**
     * 经销商信息 系统选项设置 中 增加 下载 DMS 数据库备份文件功能 贾明 2019-6-20
     */
	@Override
	public int insertDatabaseDmsBackupDownRecords(
			DateBaDmsDownReVO dateBaDmsDownReVO) throws Exception {
		
		return dealerDAO.insertDatabaseDmsBackupDownRecords(dateBaDmsDownReVO);
	}

}
