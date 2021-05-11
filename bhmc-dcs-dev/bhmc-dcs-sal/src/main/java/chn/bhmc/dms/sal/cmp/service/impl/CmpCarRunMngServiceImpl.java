package chn.bhmc.dms.sal.cmp.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.cmp.service.CmpCarRunMngService;
import chn.bhmc.dms.sal.cmp.service.dao.CmpCarRunMngDAO;
import chn.bhmc.dms.sal.cmp.vo.CmpCarRunMngSearchVO;
import chn.bhmc.dms.sal.cmp.vo.CmpCarRunMngVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AapMngServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author
 * @since 2016. 4. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 15.      Kim yewon              최초 생성
 * </pre>
 */

@Service("cmpCarRunMngService")
public class CmpCarRunMngServiceImpl extends HService implements CmpCarRunMngService{

    /**
     * 회사차운행관리 DAO 선언
     */
    @Resource(name="cmpCarRunMngDAO")
    CmpCarRunMngDAO cmpCarRunMngDAO;

    /**
     * 조회 조건에 해당하는 회사차운행관리 정보를 조회한다.
     */
    @Override
    public List<CmpCarRunMngVO> selectCmpCarRunMngByCondition(CmpCarRunMngSearchVO searchVO) throws Exception {
        return cmpCarRunMngDAO.selectCmpCarRunMngByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 배정목록 총 갯수를 조회한다.
     */
    @Override
    public int selectCmpCarRunMngByConditionCnt(CmpCarRunMngSearchVO searchVO) throws Exception {
        return cmpCarRunMngDAO.selectCmpCarRunMngByConditionCnt(searchVO);
    }


    /**
     * 대행업무를 저장한다.
     */
    @Override
    public String saveCmpCarRunMng(CmpCarRunMngVO saveVO) throws Exception{


        int useDtChkCnt = cmpCarRunMngDAO.selectUseDtChkCnt(saveVO);
        String result = null;

        if(useDtChkCnt == 0 ){
            String chkKmVl = cmpCarRunMngDAO.selectUseKmChkCnt(saveVO);
            int chkUseEndKm = Integer.parseInt(chkKmVl);
            int useStartKmVal = Integer.parseInt(saveVO.getUseStartKmVal());

            if(chkUseEndKm <= useStartKmVal){
                if(saveVO.getGb().equals("I")){
                    saveVO.setRegUsrId(LoginUtil.getUserId());          // 등록자
                    cmpCarRunMngDAO.insertCmpCarRunMng(saveVO);
                }else {
                    saveVO.setUpdtUsrId(LoginUtil.getUserId());         // 수정자
                    cmpCarRunMngDAO.updateCmpCarRunMng(saveVO);
                }
                result = "1";
            }else {
                result = "2";
            }
        }else {
            result = "0";
        }

        return result;
    }



    /**
     * 대행업무를 삭제한다.
     */
    @Override
    public boolean deleteCmpCarRunMng(CmpCarRunMngVO saveVO) throws Exception{

        return cmpCarRunMngDAO.deleteCmpCarRunMng(saveVO);

    }

}
