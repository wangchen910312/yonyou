package chn.bhmc.dms.sal.stm.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.stm.service.StrOrdOcnBlockingService;
import chn.bhmc.dms.sal.stm.service.dao.StrOrdOcnBlockingDAO;
import chn.bhmc.dms.sal.stm.vo.StrOrdOcnBlockingSaveVO;
import chn.bhmc.dms.sal.stm.vo.StrOrdOcnBlockingSearchVO;
import chn.bhmc.dms.sal.stm.vo.StrOrdOcnBlockingVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : StrOrdOcnBlockingServiceImpl
 * @Description : 전략오더OCN블러킹
 * @author Kim Jin Suk
 * @since 2016. 7. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.      최초 생성
 * </pre>
 */

@Service("strOrdOcnBlockingService")
public class StrOrdOcnBlockingServiceImpl extends HService implements StrOrdOcnBlockingService {

    /**
     * 전략오더OCN블러킹 DAO 선언
     */
    @Resource(name="strOrdOcnBlockingDAO")
    StrOrdOcnBlockingDAO strOrdOcnBlockingDAO;


    /**
     * 전략오더OCN블러킹 헤더 & 내역 조회
     */
    @SuppressWarnings("rawtypes")
    @Override
    public Map<String, List> selectStrOrdOcnBlockingsByCondition(StrOrdOcnBlockingSearchVO searchVO) throws Exception{
        Map<String, List> map = new HashMap<String, List>();

        // 전략오더OCN블러킹-헤더 조회
        List<StrOrdOcnBlockingVO> columnList = strOrdOcnBlockingDAO.selectStrOrdOcnBlockingHeadersByCondition(searchVO);
        map.put("columnList", columnList);

        int maxSize = columnList.size();
        // 전략오더OCN블러킹-내역 조회
        List<StrOrdOcnBlockingVO> voList = strOrdOcnBlockingDAO.selectStrOrdOcnBlockingsByCondition(searchVO);

        ArrayList<Map> resultList = new ArrayList<Map>();
        HashMap<String, String> hMap = null;

        int count = 0;
        for(StrOrdOcnBlockingVO vo : voList){
            if(count == 0){
                hMap = new HashMap<String, String>();
            }
            count++;

            if( !hMap.containsKey("dlrCd") ){

                hMap.put("dlrCd", vo.getDlrCd());
                hMap.put("dlrNm", vo.getDlrNm());
                hMap.put("carlineCd", vo.getCarlineCd());
                hMap.put("carlineNm", vo.getCarlineNm());
                hMap.put("modelCd", vo.getModelCd());
                hMap.put("modelNm", vo.getModelNm());
                hMap.put(vo.getOcnCd(), vo.getBlkYn() );
            }else{
                hMap.put(vo.getOcnCd(), vo.getBlkYn() );
            }

            if(count == maxSize){
                resultList.add(hMap);
                count = 0;
            }
        }

        map.put("dataSet", resultList);
        return map;
    }

    /**
     * 전략오더OCN블러킹 총 내역수 조회
     */
    @Override
    public int selectStrOrdOcnBlockingsByConditionCnt(StrOrdOcnBlockingSearchVO searchVO) throws Exception{
        return strOrdOcnBlockingDAO.selectStrOrdOcnBlockingsByConditionCnt(searchVO);
    }



    /**
     * 전략오더OCN블러킹 저장
     */
    @SuppressWarnings("rawtypes")
    public int multiStrOrdOcnBlockings(Map<?,?> saveVO) throws Exception{
        String isSearchOcnCd = (String)saveVO.get("searchOcn") == null ? "N" : (String)saveVO.get("searchOcn");

        String ocnKey = "";
        StrOrdOcnBlockingSaveVO strSaveVO = null;

        List updateList = (List)saveVO.get("updateOcnList");
        ArrayList<String> ocnCdList = null;

        for(int i=0; i<updateList.size(); i++){
            HashMap map = (HashMap)updateList.get(i);

            strSaveVO = new StrOrdOcnBlockingSaveVO();
            strSaveVO.setUpdtUsrId(LoginUtil.getUserId());
            strSaveVO.setRegUsrId(LoginUtil.getUserId());
            strSaveVO.setDlrCd((String)map.get("dlrCd"));
            strSaveVO.setCarlineCd((String)map.get("carlineCd"));
            strSaveVO.setModelCd((String)map.get("modelCd"));
            if("Y".equals(isSearchOcnCd)){      // 특정 ocn코드만 수정 시.
                strSaveVO.setOcnCd((String)map.get("ocnCd"));
            }
            strOrdOcnBlockingDAO.deleteStrOrdOcnBlockings(strSaveVO);

            ocnCdList = new ArrayList<String>();
            Iterator<?>  itr = map.keySet().iterator();
            while(itr.hasNext()){
                ocnKey = (String)itr.next();

                if(  !ocnKey.equals("carlineCd")
                  && !ocnKey.equals("carlineNm")
                  && !ocnKey.equals("dirty")
                  && !ocnKey.equals("dlrCd")
                  && !ocnKey.equals("dlrNm")
                  && !ocnKey.equals("id")
                  && !ocnKey.equals("modelCd")
                  && !ocnKey.equals("modelNm")
                  && !ocnKey.equals("uid")
                ){
                    ocnCdList.add(ocnKey);
                }
            }

            for(String mapKey : ocnCdList){
                strSaveVO = new StrOrdOcnBlockingSaveVO();
                strSaveVO.setUpdtUsrId(LoginUtil.getUserId());
                strSaveVO.setRegUsrId(LoginUtil.getUserId());
                strSaveVO.setDlrCd((String)map.get("dlrCd"));
                strSaveVO.setCarlineCd((String)map.get("carlineCd"));
                strSaveVO.setModelCd((String)map.get("modelCd"));
                strSaveVO.setOcnCd(mapKey);
                strSaveVO.setBlkYn((String)map.get(mapKey));

                // Y로 체크한 OCN 코드값이 있을 경우에만 저장.
                // if문 제거시 해제했던 내역이 저장
                if("Y".equals(strSaveVO.getBlkYn())){
                    strOrdOcnBlockingDAO.insertStrOrdOcnBlockings(strSaveVO);
                }
            }
        }
        return 1;
    }

    /**
     * 딜러 - 딜러 복사
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int strOrdOcnBlockingDlrCopys(StrOrdOcnBlockingVO saveVO) throws Exception{
        saveVO.setUpdtUsrId(LoginUtil.getUserId());
        saveVO.setRegUsrId(LoginUtil.getUserId());
        strOrdOcnBlockingDAO.deleteStrOrdOcnBlockingDlrInfo(saveVO);
        strOrdOcnBlockingDAO.insertStrOrdOcnBlockingDlrInfo(saveVO);
        return 1;
    }


    /**
     * 전체딜러 복사
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int strOrdOcnBlockingAllDlrCopys(Map<String, String> saveMap) throws Exception{

        StrOrdOcnBlockingSaveVO strSaveVO = new StrOrdOcnBlockingSaveVO();
        strSaveVO.setUpdtUsrId(LoginUtil.getUserId());
        strSaveVO.setRegUsrId(LoginUtil.getUserId());

        strSaveVO.setCarlineCd(saveMap.get("carlineCd"));
        strSaveVO.setModelCd(saveMap.get("modelCd"));
        strOrdOcnBlockingDAO.deleteStrOrdOcnBlockingAllDlrCopys(strSaveVO);

        // 선택한 딜러의 ocn정보 저장.
        ArrayList<String> ocnCdList = new ArrayList<String>();
        Iterator<String>  itr = saveMap.keySet().iterator();
        String ocnKey = "";
        while(itr.hasNext()){
            ocnKey = itr.next();

            if(  !ocnKey.equals("carlineCd")
              && !ocnKey.equals("carlineNm")
              && !ocnKey.equals("dirty")
              && !ocnKey.equals("dlrCd")
              && !ocnKey.equals("dlrNm")
              && !ocnKey.equals("id")
              && !ocnKey.equals("modelCd")
              && !ocnKey.equals("modelNm")
              && !ocnKey.equals("uid")
            ){
                ocnCdList.add(ocnKey);
            }
        }

        for(String mapKey : ocnCdList){
            strSaveVO = new StrOrdOcnBlockingSaveVO();
            strSaveVO.setUpdtUsrId(LoginUtil.getUserId());
            strSaveVO.setRegUsrId(LoginUtil.getUserId());
            strSaveVO.setDlrCd(saveMap.get("dlrCd"));
            strSaveVO.setCarlineCd(saveMap.get("carlineCd"));
            strSaveVO.setModelCd(saveMap.get("modelCd"));
            strSaveVO.setOcnCd(mapKey);
            strSaveVO.setBlkYn(saveMap.get(mapKey));

            // Y로 체크한 OCN 코드값이 있을 경우에만 저장.
            // if문 제거시 해제했던 내역이 저장
            if("Y".equals(strSaveVO.getBlkYn())){
                strOrdOcnBlockingDAO.insertStrOrdOcnBlockings(strSaveVO);
            }
        }

        // 선택 딜러값으로 전체 딜러 복사.
        strSaveVO = new StrOrdOcnBlockingSaveVO();
        strSaveVO.setUpdtUsrId(LoginUtil.getUserId());
        strSaveVO.setRegUsrId(LoginUtil.getUserId());
        strSaveVO.setDlrCd(saveMap.get("dlrCd"));
        strSaveVO.setCarlineCd(saveMap.get("carlineCd"));
        strSaveVO.setModelCd(saveMap.get("modelCd"));

        strOrdOcnBlockingDAO.insertStrOrdOcnBlockingAllDlrCopys(strSaveVO);
        return 1;
    }
}
