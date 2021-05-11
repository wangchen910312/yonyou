package chn.bhmc.dms.web.core.taglibs;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.ApplicationContext;

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.context.WebAppContext;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SystemConfigTag.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 20.     Kang Seok Han     최초 생성
 * </pre>
 */

public class SystemConfigTag extends TagSupport {
    /**
     *
     */
    private static final long serialVersionUID = -7997424702829332489L;

    /**
     * 시스템설정 정보 관리 서비스
     */
    private SystemConfigInfoService configService;

    /**
     * 시스템설정 코드값
     */
    private String code;

    /**
     * 설정값을 저장할 PageContext Attribute
     */
    private String var;

    public SystemConfigTag(){
        super();

        ApplicationContext ctx = WebAppContext.getApplicationContext();
        this.configService = (SystemConfigInfoService)ctx.getBean(SystemConfigInfoService.class);
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getVar() {
        return this.var;
    }

    public void setVar(String var) {
        this.var = var;
    }

    @Override
    public int doStartTag() throws JspException{

        String text = "";

        if(!StringUtils.isEmpty(code)){
            try {
            	
            	if("monthFormat".equals(code)){
            		text = configService.selectStrValueByKey("dateFormat");
            		
            		if("yyyy-MM-dd".equals(text)){
            			text = "yyyy-MM";
            		}else if("MM/dd/yyyy".equals(text)){
            			text = "MM/yyyy";
            		}else if("dd/MM/yyyy".equals(text)){
            			text = "MM/yyyy";
            		}else{
            			text = "yyyy-MM";
            		}
            		
            	}else if("dateTimeFormat".equals(code)){
                    text = configService.selectStrValueByKey("dateFormat") + " " + configService.selectStrValueByKey("timeFormat");
                }else{
                    text = configService.selectStrValueByKey(code);
                }
            } catch (Exception e) {
                throw new JspException(e.toString());
            }
        }

        if(this.var == null) {
            JspWriter writer = pageContext.getOut();
            try {
                writer.print(text);
            } catch (IOException e) {
                throw new JspException(e.toString());
            }
        } else {
            pageContext.setAttribute(this.var, text);
        }

        return SKIP_BODY;
    }
}
