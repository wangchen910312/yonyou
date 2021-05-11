package chn.bhmc.dms.cmm.sci.service;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.reflect.MethodSignature;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import chn.bhmc.dms.cmm.sci.service.dao.ChangeHistoryDAO;
import chn.bhmc.dms.cmm.sci.vo.ChangeHistoryVO;
import chn.bhmc.dms.core.context.WebAppContext;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.web.bind.annotation.ChangeHistory;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SystemChangeHistoryLoggableAspect.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 5. 31.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 31.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

public class SystemChangeHistoryLoggableAspect {
    @Resource(name = "changeHistoryDAO")
    ChangeHistoryDAO changeHistoryDAO;

    @SuppressWarnings("unchecked")
    public void systemChangeHistoryLoggable(JoinPoint joinPoint) {
        Logger log = LoggerFactory.getLogger(SystemChangeHistoryLoggableAspect.class);

        try {
            MethodSignature signature = (MethodSignature) joinPoint.getSignature();
            Method method = signature.getMethod();

            method = joinPoint.getTarget().getClass().getDeclaredMethod(method.getName(), method.getParameterTypes());

            if (method.isAnnotationPresent(ChangeHistory.class)) {
                ChangeHistoryVO saveVO = new ChangeHistoryVO();

                Map<String, Object> oldDataMap = new HashMap<String, Object>();
                Map<String, Object> newDataMap = new HashMap<String, Object>();

                JSONObject oldDataJson = new JSONObject();
                JSONObject newDataJson = new JSONObject();

                Object[] arguments = joinPoint.getArgs();
                Field[] fields = null;

                if (arguments.length > 0) {
                    for(Object argument : arguments) {
                        fields = argument.getClass().getDeclaredFields();

                        for (Field field : fields) {
                            if (!"serialVersionUID".equals(field.getName())) {
                                newDataMap.put(field.getName(), argument.getClass().getDeclaredMethod("get" + field.getName().substring(0, 1).toUpperCase() + field.getName().substring(1, field.getName().length())).invoke(argument));
                            }
                        }
                    }

                    for (Map.Entry<String, Object> entry : newDataMap.entrySet()) {
                        newDataJson.put(entry.getKey(), (entry.getValue() != null ? entry.getValue().toString() : "null"));
                    }

                    SystemHistoryLoggableService service = (SystemHistoryLoggableService)WebAppContext.getApplicationContext().getBean(method.getAnnotation(ChangeHistory.class).beanId());
                    Object model = service.selectSystemHistoryLoggable(newDataMap);

                    if(model == null){
                        return;
                    }

                    if (!"C".equals(method.getAnnotation(ChangeHistory.class).chgTp())) {
                        fields = model.getClass().getDeclaredFields();

                        for (Field field : fields) {
                            if (!"serialVersionUID".equals(field.getName())) {
                                oldDataMap.put(field.getName(), model.getClass().getDeclaredMethod("get" + field.getName().substring(0, 1).toUpperCase() + field.getName().substring(1, field.getName().length())).invoke(model));
                            }
                        }

                        for (Map.Entry<String, Object> entry : oldDataMap.entrySet()) {
                            oldDataJson.put(entry.getKey(), (entry.getValue() != null ? entry.getValue().toString() : "null"));
                        }
                    }

                    saveVO.setChgTp(method.getAnnotation(ChangeHistory.class).chgTp());
                    saveVO.setSysDstinCd(method.getAnnotation(ChangeHistory.class).sysDstinCd());
                    saveVO.setChgUsrId(LoginUtil.getUserId());

                    if ("C".equals(method.getAnnotation(ChangeHistory.class).chgTp())) {
                        saveVO.setChgBefDataVal(null);
                        saveVO.setChgAftDataVal(newDataJson.toString());
                    }
                    else if ("U".equals(method.getAnnotation(ChangeHistory.class).chgTp())) {
                        saveVO.setChgBefDataVal(oldDataJson.toString());
                        saveVO.setChgAftDataVal(newDataJson.toString());
                    }
                    else if ("D".equals(method.getAnnotation(ChangeHistory.class).chgTp())) {
                        saveVO.setChgBefDataVal(oldDataJson.toString());
                        saveVO.setChgAftDataVal(null);
                    }
                    else {
                        saveVO.setChgTp(null);
                        saveVO.setChgBefDataVal(null);
                        saveVO.setChgAftDataVal(null);
                    }

                    changeHistoryDAO.insertChangeHistory(saveVO);
                }
            }
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
    }
}