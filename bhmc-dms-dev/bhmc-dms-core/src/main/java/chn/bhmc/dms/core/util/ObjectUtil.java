package chn.bhmc.dms.core.util;

import java.io.IOException;
import java.lang.reflect.Constructor;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.CollectionType;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ObjectUtil.java
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

public class ObjectUtil {

    private static final Logger log = LoggerFactory.getLogger(ObjectUtil.class);

    /**
     *
     * Map 데이터를 Object에 카피한다.
     *
     * @param map
     * @param obj
     * @param ignoreProperties
     * @return
     */
    @SuppressWarnings("rawtypes")
    public static Object convertMapToObject(Map map, Object obj, String... ignoreProperties) {

        Iterator iter = map.keySet().iterator();
        String key = null;

        while(iter.hasNext()){
            key = (String)iter.next();

            if(!ArrayUtils.contains(ignoreProperties, key)){
                try{
                    BeanUtils.setProperty(obj, key, map.get(key));
                }catch(Exception e){
                    log.warn(e.getMessage());
                }
            }
        }

        return obj;
    }

   public static <T> T readValue(String content, Class<T> valueType){
        ObjectMapper objectMapper = new ObjectMapper();

        try {
            return objectMapper.readValue(content, valueType);
        } catch (JsonParseException e) {
            e.printStackTrace();
        } catch (JsonMappingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }

   public static <T> List<T> readValues(String content, Class<T> valueType){
       ObjectMapper objectMapper = new ObjectMapper();

       try {

           if(content.trim().startsWith("[")) {
               CollectionType collectionType = objectMapper.getTypeFactory().constructCollectionType(List.class, valueType);
               return objectMapper.readValue(content, collectionType);
           } else {
               List<T> list = new ArrayList<T>();
               list.add(ObjectUtil.readValue(content, valueType));
               return list;
           }

       } catch (JsonParseException e) {
           e.printStackTrace();
       } catch (JsonMappingException e) {
           e.printStackTrace();
       } catch (IOException e) {
           e.printStackTrace();
       }

       return null;
   }

   /**
    * 클래스명으로 객체를 로딩한다.
    * @param className
    * @return
    * @throws ClassNotFoundException
    * @throws Exception
    */
   public static Class<?> loadClass(String className) throws ClassNotFoundException, Exception {

       Class<?> clazz = Thread.currentThread().getContextClassLoader().loadClass(className);;

       if (clazz == null) {
           clazz = Class.forName(className);
       }

       return clazz;
   }

   /**
    * 클래스명으로 객체를 로드한 후 인스턴스화 한다.
    * @param className
    * @return
    * @throws ClassNotFoundException
    * @throws InstantiationException
    * @throws IllegalAccessException
    * @throws Exception
    */
   public static Object instantiate(String className) throws ClassNotFoundException, InstantiationException, IllegalAccessException, Exception {
       Class<?> clazz;

       try {
           clazz = loadClass(className);
           return clazz.newInstance();
       } catch (ClassNotFoundException e) {
           log.error("{} : Class is can not instantialized.", className);
           throw new ClassNotFoundException();
       } catch (InstantiationException e) {
           log.error("{} : Class is can not instantialized.", className);
           throw new InstantiationException();
       } catch (IllegalAccessException e) {
           log.error("{} : Class is not accessed.", className);
           throw new IllegalAccessException();
       } catch (Exception e) {
           log.error("{} : Class is not accessed.", className);
           throw new Exception(e);
       }
   }

   /**
    * 클래스명으로 파라매터가 있는 클래스의 생성자를 인스턴스화 한다.
    * 예) Class <?> clazz = ObjectUtil.loadClass(this.mapClass);
    * Constructor <?> constructor = clazz.getConstructor(new Class[]{DataSource.class, String.class});
    * Object [] params = new Object [] {
    *     getDataSource(), getUsersByUsernameQuery()
    *  };
    * this.usersByUsernameMapping = (UsersByUsernameMapping)constructor.newInstance(params);
    * @param className
    * @return
    * @throws ClassNotFoundException
    * @throws InstantiationException
    * @throws IllegalAccessException
    * @throws Exception
    */
   public static Object instantiate(String className, String[] types, Object[] values) throws ClassNotFoundException, InstantiationException, IllegalAccessException, Exception {
       Class<?> clazz;
       Class<?>[] classParams = new Class[values.length];
       Object[] objectParams = new Object[values.length];

       try {
           clazz = loadClass(className);

           for (int i = 0; i < values.length; i++) {
               classParams[i] = loadClass(types[i]);
               objectParams[i] = values[i];
           }

           Constructor<?> constructor = clazz.getConstructor(classParams);
           return constructor.newInstance(values);

       } catch (ClassNotFoundException e) {
           log.error("{} : Class is can not instantialized.", className);
           throw new ClassNotFoundException();
       } catch (InstantiationException e) {
           log.error("{} : Class is can not instantialized.", className);
           throw new InstantiationException();
       } catch (IllegalAccessException e) {
           log.error("{} : Class is not accessed.", className);
           throw new IllegalAccessException();
       } catch (Exception e) {
           log.error("{} : Class is not accessed.", className);
           throw new Exception(e);
       }
   }

   /**
    * 객체가 Null 인지 확인한다.
    * @param object
    * @return Null인경우 true / Null이 아닌경우 false
    */
   public static boolean isNull(Object object) {
       return ((object == null) || object.equals(null));
   }
}
