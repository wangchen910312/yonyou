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
 * @ClassName   : TabletCheckTag.java
 * @Description : 태블릿 디바이스 체크
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

public class TabletCheckTag extends TagSupport {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1068685570490930723L;

    @Override
    public int doStartTag() throws JspException{
        return DeviceUtils.getCurrentDevice((HttpServletRequest)pageContext.getRequest()).isTablet()? Tag.EVAL_BODY_INCLUDE : Tag.SKIP_BODY;
        //return UserAgentUtil.isMobile((HttpServletRequest)pageContext.getRequest())? Tag.EVAL_BODY_INCLUDE : Tag.SKIP_BODY;
    }
}
