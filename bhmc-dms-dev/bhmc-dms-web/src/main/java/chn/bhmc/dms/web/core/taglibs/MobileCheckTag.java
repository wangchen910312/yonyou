package chn.bhmc.dms.web.core.taglibs;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.Tag;
import javax.servlet.jsp.tagext.TagSupport;

import org.springframework.mobile.device.DeviceUtils;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MobileCheckTag.java
 * @Description : 모바일 디바이스 체크
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

public class MobileCheckTag extends TagSupport {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1068685570490930723L;

    @Override
    public int doStartTag() throws JspException{
    	//20191219 update by sunzq3 去掉安卓判断操作系统逻辑 start
        //return DeviceUtils.getCurrentDevice((HttpServletRequest)pageContext.getRequest()).isMobile()? Tag.EVAL_BODY_INCLUDE : Tag.SKIP_BODY;
    	return Tag.SKIP_BODY;
    	//20191219 update by sunzq3 去掉安卓判断操作系统逻辑 end;
        //return UserAgentUtil.isMobile((HttpServletRequest)pageContext.getRequest())? Tag.EVAL_BODY_INCLUDE : Tag.SKIP_BODY;
    }
}
