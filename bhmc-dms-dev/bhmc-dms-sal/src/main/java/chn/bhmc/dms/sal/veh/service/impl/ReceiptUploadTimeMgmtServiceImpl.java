package chn.bhmc.dms.sal.veh.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;

import chn.bhmc.dms.sal.veh.vo.ReceiptUploadTimeMgmtVO;
import chn.bhmc.dms.sal.veh.vo.ReceiptUploadTimeMgmtSearchVO;
import chn.bhmc.dms.sal.veh.service.ReceiptUploadTimeMgmtService;
import chn.bhmc.dms.sal.veh.service.dao.ReceiptUploadTimeMgmtDAO;

/**
 * <pre>
 * 기준정보 > 영수증업로드시간대관리
 * </pre>
 *
 * @ClassName   : ReceiptUploadTimeMgmtServiceImpl.java
 * @Description : 기준정보 > 영수증업로드시간대관리
 * @author chibeom.song
 * @since 2017. 2. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 17.   chibeom.song     최초 생성
 * </pre>
 */
@Service("receiptUploadTimeMgmtService")
public class ReceiptUploadTimeMgmtServiceImpl extends HService implements ReceiptUploadTimeMgmtService {
    
    /**
     * 기준정보 > 영수증업로드시간대관리 DAO
     */
    @Resource(name="receiptUploadTimeMgmtDAO")
    ReceiptUploadTimeMgmtDAO receiptUploadTimeMgmtDAO;
    
    /**
     * 조회 조건에 해당하는 기준정보 > 영수증업로드시간대관리 정보를 조회한다.
     */
    @Override
    public List<ReceiptUploadTimeMgmtVO> selectSalesReceiptUploadTimeMgmtSearchData(ReceiptUploadTimeMgmtSearchVO searchVO) throws Exception {
        return receiptUploadTimeMgmtDAO.selectSalesReceiptUploadTimeMgmtSearchData(searchVO);
    }

    /**
     * 조회 조건에 해당하는 기준정보 > 영수증업로드시간대관리 총 갯수를 조회한다.
     */
    @Override
    public int selectSalesReceiptUploadTimeMgmtSearchCnt(ReceiptUploadTimeMgmtSearchVO searchVO) throws Exception {
        return receiptUploadTimeMgmtDAO.selectSalesReceiptUploadTimeMgmtSearchCnt(searchVO);
    }
    
    /**
     * 기준정보 > 영수증업로드시간대관리 정보를 등록/수정/삭제 처리한다.
     */
    @Override
    public void multiSalesReceiptUploadTimeSave(BaseSaveVO<ReceiptUploadTimeMgmtVO> obj) throws Exception {

        String userId = LoginUtil.getUserId();

        for(ReceiptUploadTimeMgmtVO receiptUploadTimeMgmtVO : obj.getInsertList()){
            receiptUploadTimeMgmtVO.setRegUsrId(userId);
            insertSalesReceiptUploadTimeSave(receiptUploadTimeMgmtVO);
        }

        for(ReceiptUploadTimeMgmtVO receiptUploadTimeMgmtVO : obj.getUpdateList()){
            receiptUploadTimeMgmtVO.setUpdtUsrId(userId);
            updateSalesReceiptUploadTimeSave(receiptUploadTimeMgmtVO);
        }

        for(ReceiptUploadTimeMgmtVO receiptUploadTimeMgmtVO : obj.getDeleteList()){
            deleteSalesReceiptUploadTimeSave(receiptUploadTimeMgmtVO);
        }
    }
    
    /**
     * {@inheritDoc}
     */
    @Override
    public ReceiptUploadTimeMgmtVO selectSalesReceiptUploadTimeSaveByKey(String rSeq) throws Exception {
        return receiptUploadTimeMgmtDAO.selectSalesReceiptUploadTimeSaveByKey(rSeq);
    }
    
    /**
     * {@inheritDoc}
     */
    @Override
    public int insertSalesReceiptUploadTimeSave(ReceiptUploadTimeMgmtVO receiptUploadTimeMgmtVO) throws Exception {
        
        ReceiptUploadTimeMgmtVO obj = selectSalesReceiptUploadTimeSaveByKey(receiptUploadTimeMgmtVO.getrSeq());

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        return receiptUploadTimeMgmtDAO.insertSalesReceiptUploadTimeSave(receiptUploadTimeMgmtVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateSalesReceiptUploadTimeSave(ReceiptUploadTimeMgmtVO receiptUploadTimeMgmtVO) throws Exception {

        return receiptUploadTimeMgmtDAO.updateSalesReceiptUploadTimeSave(receiptUploadTimeMgmtVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteSalesReceiptUploadTimeSave(ReceiptUploadTimeMgmtVO receiptUploadTimeMgmtVO) throws Exception {

        return receiptUploadTimeMgmtDAO.deleteSalesReceiptUploadTimeSave(receiptUploadTimeMgmtVO);
    }

}
