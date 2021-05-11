package chn.bhmc.dms.crm.css.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.exception.BizException;
import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.css.service.SatisFactionResultMgmtService;
import chn.bhmc.dms.crm.css.service.dao.SatisFactionResultMgmtDAO;
import chn.bhmc.dms.crm.css.vo.SatisFactionResultDtlMgmtSearchVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionResultDtlMgmtVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionResultMgmtSearchVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionResultMgmtVO;

/**
 * 만족도 조사 결과 관리에 관한 데이터처리 매퍼 클래스
 *
 *    File Name : SatisFactionResultMgmtDAO
 *    Description : 만족도 조사 결과관리
 *    author LEE Kyo Jin
 *    since 2016. 03. 04.
 *    version 1.0
 *    Modification Information
 *       since          author              description
 *    ===========    =============    ===========================
 *    2016. 03. 04.    LEE Kyo Jin    최초 생성
 */

@Service("satisFactionResultMgmtService")
public class SatisFactionResultMgmtServiceImpl extends HService implements SatisFactionResultMgmtService {

    /**
     * 만족도 조사 결과 관리 DAO
     */
    @Resource(name="satisFactionResultMgmtDAO")
    SatisFactionResultMgmtDAO satisFactionResultMgmtDAO;

    /*
     * @see chn.bhmc.dms.crm.css.service.SatisFactionResultMgmtService#selectSatisFactionResultMgmtByConditionCnt(chn.bhmc.dms.crm.css.vo.SatisFactionResultMgmtSearchVO)
     */
    @Override
    public int selectSatisFactionResultMgmtByConditionCnt(SatisFactionResultMgmtSearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return satisFactionResultMgmtDAO.selectSatisFactionResultMgmtByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.css.service.SatisFactionResultMgmtService#selectSatisFactionResultMgmtByCondition(chn.bhmc.dms.crm.css.vo.SatisFactionResultMgmtSearchVO)
     */
    @Override
    public List<SatisFactionResultMgmtVO> selectSatisFactionResultMgmtByCondition(
            SatisFactionResultMgmtSearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return satisFactionResultMgmtDAO.selectSatisFactionResultMgmtByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.css.service.SatisFactionResultMgmtService#insertSatisFactionResultMgmt(chn.bhmc.dms.crm.css.vo.SatisFactionResultMgmtVO)
     */
    @Override
    public int insertSatisFactionResultMgmt(SatisFactionResultMgmtVO satisFactionResultMgmtVO) throws Exception {

        if (StringUtils.isEmpty(satisFactionResultMgmtVO.getDlrCd())){satisFactionResultMgmtVO.setDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(satisFactionResultMgmtVO.getRegUsrId())){satisFactionResultMgmtVO.setRegUsrId(LoginUtil.getUserId());}
        if (StringUtils.isEmpty(satisFactionResultMgmtVO.getUpdtUsrId())){satisFactionResultMgmtVO.setUpdtUsrId(LoginUtil.getUserId());}
        return satisFactionResultMgmtDAO.insertSatisFactionResultMgmt(satisFactionResultMgmtVO);
    }

    /*
     * @see chn.bhmc.dms.crm.css.service.SatisFactionResultMgmtService#updateSatisFactionResultMgmt(chn.bhmc.dms.crm.css.vo.SatisFactionResultMgmtVO)
     */
    @Override
    public int updateSatisFactionResultMgmt(SatisFactionResultMgmtVO satisFactionResultMgmtVO) throws Exception {
        if (StringUtils.isEmpty(satisFactionResultMgmtVO.getUpdtUsrId())){satisFactionResultMgmtVO.setUpdtUsrId(LoginUtil.getUserId());}
        return satisFactionResultMgmtDAO.updateSatisFactionResultMgmt(satisFactionResultMgmtVO);
    }

    /**
     * 만족도 조사 DCS I/F DATA
     * @param SatisFactionResultDtlMgmtVO - I/F할 정보가 담긴 SatisFactionResultMgmtVO
     */
    public void selectSatisFactionDcsIfCopy(SatisFactionResultMgmtVO SatisFactionResultMgmtVO) throws Exception{
        satisFactionResultMgmtDAO.selectSatisFactionDcsIfCopy(SatisFactionResultMgmtVO);
    }

    /*
     * @see chn.bhmc.dms.crm.css.service.SatisFactionResultMgmtService#selectSatisFactionResultDtlMgmtByConditionCnt(chn.bhmc.dms.crm.css.vo.SatisFactionResultDtlMgmtSearchVO)
     */
    @Override
    public int selectSatisFactionResultDtlMgmtByConditionCnt(SatisFactionResultDtlMgmtSearchVO searchVO)
            throws Exception {

        /**
         * DCS에서는 딜러코드 셋팅하면 안됨.
         * DMS에만 딜러코드 셋팅
         */
        //if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return satisFactionResultMgmtDAO.selectSatisFactionResultDtlMgmtByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.css.service.SatisFactionResultMgmtService#selectSatisFactionResultDtlMgmtByCondition(chn.bhmc.dms.crm.css.vo.SatisFactionResultDtlMgmtSearchVO)
     */
    @Override
    public List<SatisFactionResultDtlMgmtVO> selectSatisFactionResultDtlMgmtByCondition(
            SatisFactionResultDtlMgmtSearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        return satisFactionResultMgmtDAO.selectSatisFactionResultDtlMgmtByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.crm.css.service.SatisFactionResultMgmtService#insertSatisFactionResultDtlMgmt(chn.bhmc.dms.crm.css.vo.SatisFactionResultDtlMgmtVO)
     */
    @Override
    public int insertSatisFactionResultDtlMgmt(SatisFactionResultDtlMgmtVO satisFactionResultDtlMgmtVO)
            throws Exception {
        if (StringUtils.isEmpty(satisFactionResultDtlMgmtVO.getRegUsrId())){satisFactionResultDtlMgmtVO.setRegUsrId(LoginUtil.getUserId());}
        if (StringUtils.isEmpty(satisFactionResultDtlMgmtVO.getUpdtUsrId())){satisFactionResultDtlMgmtVO.setUpdtUsrId(LoginUtil.getUserId());}
        return satisFactionResultMgmtDAO.insertSatisFactionResultDtlMgmt(satisFactionResultDtlMgmtVO);
    }

    /*
     * @see chn.bhmc.dms.crm.css.service.SatisFactionResultMgmtService#selectStrOrdOcnBlockingsByCondition(chn.bhmc.dms.crm.css.vo.SatisFactionResultDtlMgmtSearchVO)
     */
    @Override
    public Map<String, List> selectSatisFactionResultDtlDataSetMgmtByCondition(SatisFactionResultDtlMgmtSearchVO searchVO)
            throws Exception {

        Map<String, List> map = new HashMap<String, List>();

        /**
         * DCS에서는 딜러코드 셋팅하면 안됨.
         * DMS에만 딜러코드 셋팅
         */
        //if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        List<String> columnList = satisFactionResultMgmtDAO.selectSatisFactionResultDtlHeaderMgmtByCondition(searchVO);

        int maxSize = columnList.size();
        /*        List<String> columnArr = new ArrayList();
        for(int i=0; i<maxSize; i++){
            columnArr.add(columnList.get(i).getHeaderCont());
        }*/

        map.put("columnList", columnList);

        List<SatisFactionResultDtlMgmtVO> voList = satisFactionResultMgmtDAO.selectSatisFactionResultDtlMgmtByCondition(searchVO);

        ArrayList<Map> resultList = new ArrayList<Map>();
        HashMap<String, String> hMap = null;

        int count = 0;

        for(SatisFactionResultDtlMgmtVO vo : voList) {
            if(count == 0){
                hMap = new HashMap<String, String>();
            }
            count++;

            hMap.put("dlrCd", vo.getDlrCd());
            hMap.put("C"+columnList.indexOf(vo.getHeaderCont()), vo.getVal());

            if (count == maxSize) {
                resultList.add(hMap);
                count = 0;
            }
        }

        map.put("dataSet", resultList);

        return map;
    }
/*    public Map<String, List<SatisFactionResultDtlMgmtVO>> selectSatisFactionResultDtlDataSetMgmtByCondition(SatisFactionResultDtlMgmtSearchVO searchVO)
    throws Exception {

        Map<String, List<SatisFactionResultDtlMgmtVO>> map = new HashMap<String, List<SatisFactionResultDtlMgmtVO>>();

        List<SatisFactionResultDtlMgmtVO> columnList = satisFactionResultMgmtDAO.selectSatisFactionResultDtlHeaderMgmtByCondition(searchVO);

        map.put("columnList", columnList);

        int maxSize = columnList.size();

        List<SatisFactionResultDtlMgmtVO> voList = satisFactionResultMgmtDAO.selectSatisFactionResultDtlMgmtByCondition(searchVO);

        //ArrayList<Map<String, String>> resultList = new ArrayList<Map<String, String>>();

        List<SatisFactionResultDtlMgmtVO> resultList = new ArrayList<SatisFactionResultDtlMgmtVO>();

        SatisFactionResultDtlMgmtVO hMap = null;

        int count = 0;

        for(SatisFactionResultDtlMgmtVO vo : voList) {
            if(count == 0){
                hMap = new SatisFactionResultDtlMgmtVO();
            }
            count++;

//            if( !hMap.containsKey("dlrCd") ){
//                hMap.put("dlrCd", vo.getDlrCd());
//                hMap.put("dlrNm", vo.getDlrNm());
//                hMap.put("carlineCd", vo.getCarlineCd());
//                hMap.put("carlineNm", vo.getCarlineNm());
//                hMap.put("modelCd", vo.getModelCd());
//                hMap.put("modelNm", vo.getModelNm());
//                hMap.put(vo.getOcnCd(), vo.getBlkYn() );
//            }else{
//                hMap.put(vo.getOcnCd(), vo.getBlkYn() );
//            }
            hMap.setDlrCd(vo.getDlrCd());
            hMap.setHeaderCont(vo.getVal());

            //hMap.put(vo.getHeaderCont(), vo.getVal());

            if (count == maxSize) {
                resultList.add(hMap);
                count = 0;
            }
        }

        map.put("dataSet", resultList);

        return map;
    }
*/
    /*
     * @see chn.bhmc.dms.crm.css.service.SatisFactionResultMgmtService#multiSatisFactionResultExcelImport(java.util.List)
     */
    @Override
    public void multiSatisFactionResultExcelImport(List<SatisFactionResultDtlMgmtVO> satisFactionResultDtlMgmt)
            throws Exception {
        try {

            String titleNm = "";
            String satisFactionResultMgmtSeq = "";

            SatisFactionResultDtlMgmtVO satisFactionResultDtlMgmtVO = new SatisFactionResultDtlMgmtVO();

            for (int i=0; i < satisFactionResultDtlMgmt.size() ; i++) {
                if (i == 0){
                    titleNm = satisFactionResultDtlMgmt.get(0).getVal();
                    SatisFactionResultMgmtVO satisFactionResultMgmtVO = new SatisFactionResultMgmtVO();
                    satisFactionResultMgmtVO.setTitleNm(titleNm);
                    satisFactionResultMgmtVO.setDisplayYn("Y");
                    satisFactionResultMgmtVO.setRegUsrId(LoginUtil.getUserId());
                    satisFactionResultMgmtVO.setUpdtUsrId(LoginUtil.getUserId());

                    insertSatisFactionResultMgmt(satisFactionResultMgmtVO);
                    satisFactionResultMgmtSeq = satisFactionResultMgmtVO.getSeq();
                } else {
                    satisFactionResultDtlMgmtVO.setUpperSeq(satisFactionResultMgmtSeq);
                    satisFactionResultDtlMgmtVO.setDlrCd(satisFactionResultDtlMgmt.get(i).getDlrCd());
                    satisFactionResultDtlMgmtVO.setHeaderCont(satisFactionResultDtlMgmt.get(i).getHeaderCont());
                    satisFactionResultDtlMgmtVO.setVal(satisFactionResultDtlMgmt.get(i).getVal());
                    satisFactionResultDtlMgmtVO.setRegUsrId(LoginUtil.getUserId());

                    insertSatisFactionResultDtlMgmt(satisFactionResultDtlMgmtVO);
                }
            }

        } catch(Exception e){
            throw new BizException(e.getMessage());
        }

    }

    /*
     * @see chn.bhmc.dms.crm.css.service.SatisFactionResultMgmtService#multiSatisFactionResultMgmt(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiSatisFactionResultMgmt(BaseSaveVO<SatisFactionResultMgmtVO> obj) throws Exception {
        // TODO Auto-generated method stub
        String userId = LoginUtil.getUserId();

        for(SatisFactionResultMgmtVO satisFactionResultMgmtVO : obj.getUpdateList()){
            satisFactionResultMgmtVO.setUpdtUsrId(userId);
            satisFactionResultMgmtDAO.updateSatisFactionResultMgmt(satisFactionResultMgmtVO);
        }

        //for(SatisFactionResultMgmtVO satisFactionResultMgmtVO : obj.getDeleteList()){
            //customerMemoDAO.deleteCustomerMemo(customerMemoVO);
        //}

    }


}
