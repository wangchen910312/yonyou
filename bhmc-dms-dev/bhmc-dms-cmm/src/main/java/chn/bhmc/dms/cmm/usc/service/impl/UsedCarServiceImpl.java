package chn.bhmc.dms.cmm.usc.service.impl;

import java.util.ArrayList;
import java.util.List;

import able.com.service.HService;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.usc.service.UsedCarService;
import chn.bhmc.dms.cmm.usc.vo.UsedCarBrandListVO;
import chn.bhmc.dms.cmm.usc.vo.UsedCarModelListVO;
import chn.bhmc.dms.cmm.usc.vo.UsedCarStyleListVO;
import chn.bhmc.dms.core.context.WebContext;
import chn.bhmc.dms.core.util.DateUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AwayCustomerServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 4. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 25.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

@Service("usedCarService")
public class UsedCarServiceImpl extends HService implements UsedCarService {

    public static final String APP_KEY = "c76dd41b-3802-48f4-ad58-9159ee2c24fa";

    private String createSignString(String params){
        return DigestUtils.md5Hex(params+APP_KEY);
    }

    /**
     * 브랜드 목록 조회
     */
    @Override
    public List<UsedCarBrandListVO> selectUsedCarBrandList() throws Exception {

        List<UsedCarBrandListVO> arrUsedCarBrandListVO = new ArrayList<UsedCarBrandListVO>();

        String url = WebContext.getServletContext().getInitParameter("USEDCAR_SYSTEM_URL");
        String tm = DateUtil.getDate("yyyyMMddHHmmss");
        String params = "BrandToJosn=1&InSale=0&tm="+tm;

        HttpPost request =  new HttpPost(url+"?"+params+"&sign="+createSignString(params));
        CloseableHttpClient httpClient = HttpClientBuilder.create().build();

        try{

            //StringEntity requestEntity = new StringEntity(BrandToJosn, "UTF-8");
            request.addHeader("content-type", "application/x-www-form-urlencoded");
            //request.setEntity(requestEntity);
            HttpResponse response = httpClient.execute(request);
            HttpEntity responseEntity = response.getEntity();
            String responseText = EntityUtils.toString(responseEntity, "UTF-8");

            log.debug("==RECEIVE DATA==");
            log.debug(responseText);

            Object obj = JSONValue.parseWithException(responseText);
            JSONObject jsonRecvData = (JSONObject)obj;

            JSONArray array = (JSONArray) jsonRecvData.get("MakeList");
            JSONObject jobj = null;
            UsedCarBrandListVO usedCarBrandListVO = new UsedCarBrandListVO();

            if(array != null){
                String requestResultCd = jsonRecvData.get("status").toString();
                if("100".equals(requestResultCd)){
                    int iSize = array.size();

                    for(int j = 0; j < iSize; j++){
                        jobj = (JSONObject) array.get(j);

                        usedCarBrandListVO = new UsedCarBrandListVO();
                        usedCarBrandListVO.setCarBrandCd(jobj.get("GroupName").toString() + "-" + jobj.get("MakeId").toString());
                        usedCarBrandListVO.setCarBrandNm(jobj.get("MakeName").toString());

                        arrUsedCarBrandListVO.add(usedCarBrandListVO);
                    }
                }
            }

        }catch (Exception e) {
            log.error(e.getMessage(), e);
        }finally{
            try{
                httpClient.close();
            }catch(Exception e){}
        }
        return arrUsedCarBrandListVO;
    }

    /**
     * 차종 목록 조회
     */
    @Override
    public List<UsedCarModelListVO> selectUsedCarModelList(String carBrandCd) throws Exception {
        List<UsedCarModelListVO> usedCarModelList = new ArrayList<UsedCarModelListVO>();

        if(!StringUtils.isEmpty(carBrandCd)){

            String url = WebContext.getServletContext().getInitParameter("USEDCAR_SYSTEM_URL");
            String tm = DateUtil.getDate("yyyyMMddHHmmss");
            String params = "manufacturerid="+carBrandCd.substring(2)+"&InSale=0&tm="+tm;

            HttpPost request =  new HttpPost(url+"?"+params+"&sign="+createSignString(params));
            CloseableHttpClient httpClient = HttpClientBuilder.create().build();

            try{
                request.addHeader("content-type", "application/x-www-form-urlencoded");
                HttpResponse response = httpClient.execute(request);
                HttpEntity responseEntity = response.getEntity();
                String responseText = EntityUtils.toString(responseEntity, "UTF-8");

                log.debug("==RECEIVE DATA==");
                log.debug(responseText);

                JSONObject responseJsonData = (JSONObject)JSONValue.parseWithException(responseText);
                JSONArray jsonArrayMenufactureList = (JSONArray)responseJsonData.get("ManufacturerList");

                for(Object obj : jsonArrayMenufactureList){
                    JSONObject jsonObjectManufacture = (JSONObject)obj;
                    JSONArray jsonArrayModelList = (JSONArray)jsonObjectManufacture.get("ModelList");

                    if(jsonArrayModelList != null && "100".equals(responseJsonData.get("status").toString())){
                        for(Object objModel : jsonArrayModelList){
                            JSONObject jsonObjectModel = (JSONObject)objModel;

                            UsedCarModelListVO usedCarModelListVO = new UsedCarModelListVO();
                            usedCarModelListVO.setBrandNm(jsonObjectModel.get("ManufacturerName").toString());
                            usedCarModelListVO.setCarlineCd(jsonObjectModel.get("Id").toString());
                            usedCarModelListVO.setCarlineNm(jsonObjectModel.get("Name").toString());

                            usedCarModelList.add(usedCarModelListVO);
                        }
                    }
                }
            }catch (Exception e) {
                log.error(e.getMessage(), e);
            }finally{
                try{
                    httpClient.close();
                }catch(Exception e){}
            }
        }

        return usedCarModelList;
    }

    /**
     * 차관 목록 조회
     */
    @Override
    public List<UsedCarStyleListVO> selectUsedCarStyleList(String carlineCd) throws Exception {

        List<UsedCarStyleListVO> usedCarStyleList = new ArrayList<UsedCarStyleListVO>();

        String url = WebContext.getServletContext().getInitParameter("USEDCAR_SYSTEM_URL");
        String tm = DateUtil.getDate("yyyyMMddHHmmss");
        String params = "modelid="+carlineCd+"&InSale=0&tm="+tm;

        HttpPost request =  new HttpPost(url+"?"+params+"&sign="+createSignString(params));
        CloseableHttpClient httpClient = HttpClientBuilder.create().build();

        try{
            request.addHeader("content-type", "application/x-www-form-urlencoded");
            HttpResponse response = httpClient.execute(request);
            HttpEntity responseEntity = response.getEntity();
            String responseText = EntityUtils.toString(responseEntity, "UTF-8");

            log.debug("==RECEIVE DATA==");
            log.debug(responseText);

            JSONObject responseJsonData = (JSONObject)JSONValue.parseWithException(responseText);
            JSONArray jsonArrayYearGroupList = (JSONArray)responseJsonData.get("YearGroupList");

            for(Object obj : jsonArrayYearGroupList){
                JSONObject jsonObjectYearGroup = (JSONObject)obj;
                JSONArray jsonArrayStyleList = (JSONArray)jsonObjectYearGroup.get("StyleList");

                if(jsonArrayStyleList != null && "100".equals(responseJsonData.get("status").toString())){
                    for(Object objModel : jsonArrayStyleList){
                        JSONObject jsonObjectModel = (JSONObject)objModel;

                        UsedCarStyleListVO usedCarStyleListVO = new UsedCarStyleListVO();
                        usedCarStyleListVO.setYear(jsonObjectModel.get("Year").toString());
                        usedCarStyleListVO.setStyleCd(jsonObjectModel.get("Id").toString());
                        usedCarStyleListVO.setStyleNm(jsonObjectModel.get("Name").toString());

                        usedCarStyleList.add(usedCarStyleListVO);
                    }
                }
            }
        }catch (Exception e) {
            log.error(e.getMessage(), e);
        }finally{
            try{
                httpClient.close();
            }catch(Exception e){}
        }

        return usedCarStyleList;
    }
}