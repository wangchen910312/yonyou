package chn.bhmc.dms.core.web.bind.support;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RequestParams.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 3. 2.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 2.     Kang Seok Han     최초 생성
 * </pre>
 */

public class JsonRequestParams {

    private static final Logger log = LoggerFactory.getLogger(JsonRequestParams.class);
    private HashMap<String, Object> params = new HashMap<String, Object>();

    public JsonRequestParams(){

    }

    public JsonRequestParams(String key, Object value){
        put(key, value);
    }

    public Set<Entry<String, Object>> entrySet(){
        return params.entrySet();
    }

    public void setDefaultValue(String key, Object value){
        if(isBlank(key)) put(key, value);
    }

    public boolean isBlank(){
        for(String key : params.keySet()){
            if(!isBlank(key)){
                return false;
            }
        }

        return true;
    }

    public boolean isBlank(String key){
        return StringUtils.isBlank(get(key));
    }

    public boolean isBlank(String[] keys){

        boolean flag = true;
        for(String key : keys){
            flag = flag && isBlank(key);
        }

        return flag;
    }

    public void put(String key, Object value) {
        params.put(key, value);
    }

    public String get(String key){
        return get(key, StringUtils.EMPTY);
    }

    public String get(String key, String defaultValue){
        Object val = params.get(key);

        if(val == null) return defaultValue;

        if(val instanceof String[]){
            return StringUtils.join((String[])val, ",");
        }

        return val.toString();
    }

    public int getIntValue(String key){
        return getIntValue(key, 0);
    }

    public int getIntValue(String key, int defaultValue){

        String val = get(key);

        try{

            return Integer.parseInt(val);

        }catch(NumberFormatException e){
            return defaultValue;
        }

    }

    public long getLongValue(String key, long defaultValue){

        String val = get(key);

        try{

            return Long.parseLong(val);

        }catch(NumberFormatException e){
            return defaultValue;
        }

    }

    public String[] getValues(String key){
        Object val = params.get(key);

        if(val == null) return null;

        if(val instanceof String[]){
            return (String[])val;
        }

        return new String[]{val.toString()};
    }

    public Map<String, Object> getParams(){
        return params;
    }

    public void printParam(){
        log.debug("SearchParams >>> " + params.toString());
    }

}
