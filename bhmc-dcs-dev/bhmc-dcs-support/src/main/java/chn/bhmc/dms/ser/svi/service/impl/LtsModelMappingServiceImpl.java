package chn.bhmc.dms.ser.svi.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.ser.svi.service.LtsModelMappingService;
import chn.bhmc.dms.ser.svi.service.dao.LtsModelMappingDAO;
import chn.bhmc.dms.ser.svi.vo.LtsModelMappingVO;
import chn.bhmc.dms.ser.svi.vo.LtsModelSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LtsModelMappingServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ki Hyun Kwon
 * @since 2016. 2. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 11.     Ki Hyun Kwon     최초 생성
 * </pre>
 */

@Service("ltsModelMappingService")
public class LtsModelMappingServiceImpl extends HService implements LtsModelMappingService{

    @Resource(name="ltsModelMappingDAO")
    LtsModelMappingDAO ltsModelMappingDAO;


    /*
     * {@inheritDoc}
     */
    @Override
    public List<LtsModelMappingVO> selectLtsModelByKey(String vinNo) throws Exception {

        return ltsModelMappingDAO.selectLtsModelByKey(vinNo);
    }



    /*
     * {@inheritDoc}
     */
    @Override
    public String selectLtsModelMapping(String vinNo) throws Exception {

        LtsModelMappingVO mappingVO = new LtsModelMappingVO();
        int index = 0;
        String ltsModelCd = "";

        ArrayList<Integer> ltsCntList = new ArrayList<Integer>();
        ArrayList<String> ltsCdList = new ArrayList<String>();

        for(LtsModelMappingVO objVO : selectLtsModelByKey(vinNo)){
            mappingVO.setLtsModelCd(objVO.getLtsModelCd());
            mappingVO.setVinNo(objVO.getVinNo());
            int ltsCnt = 0;
            boolean isSame = true; // mapping table의 vin 자릿수에 잘못된 데이터가 있을경우 false

            // 차대번호 앞 11자리만 비교한다.
            for(int i=0 ; i < 11 ; i++){
                // VIN Mapping 데이터(LBES**H**********) 에 * 로 되어 있는 부분은 skip 한다.
                if(!mappingVO.getVinNo().substring(i, i+1).equals("*")){
                    if(vinNo.substring(i,i+1).equals(mappingVO.getVinNo().substring(i,i+1))){
                        ltsCnt++;
                    }else{
                        isSame = false;
                    }
                }
            }

            /**
             * index 보다 적게 매핑된 빈은 skip
             */
            if(isSame){
                if(ltsCnt > 0 && index < ltsCnt){
                    index = ltsCnt;
                    ltsCntList.add(ltsCnt);
                    ltsCdList.add(mappingVO.getLtsModelCd());
                }
            }
        }

        for( int i = 0 ; i <ltsCntList.size() ; i++){
            if(ltsCntList.get(i) == (index)){
                ltsModelCd = ltsCdList.get(i);
            }

        }

        return ltsModelCd;
    }



    /*
     * {@inheritDoc}
     */
    @Override
    public LtsModelMappingVO selectLtsModelInfosByCondition(LtsModelSearchVO searchVO) throws Exception {


        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return ltsModelMappingDAO.selectLtsModelInfosByCondition(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public LtsModelMappingVO selectMappingLtsModelCdByKey(LtsModelSearchVO searchVO) throws Exception {


        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return ltsModelMappingDAO.selectMappingLtsModelCdByKey(searchVO);
    }


    /*
     * {@inheritDoc}
     */
    @Override
    public List<LtsModelMappingVO> selectLtsModelsByCondition(LtsModelSearchVO searchVO) throws Exception {


        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return ltsModelMappingDAO.selectLtsModelsByCondition(searchVO);
    }








}
