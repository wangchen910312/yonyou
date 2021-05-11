package chn.bhmc.dms.security.taglibs;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import chn.bhmc.dms.security.service.ViewResourceAccessService;

public class ViewResourceTag extends BodyTagSupport {
	/**
	 *
	 */
	private static final long serialVersionUID = -8664286763656469190L;

	private ApplicationContext context;

	private ViewResourceAccessService viewResourceAccessService;

	/**
	 * 화면ID
	 */
	private String viewId;

	/**
	 * 퍼미션 마스크
	 */
	private String hasPermission = "";

	/**
     * 설정값을 저장할 PageContext Attribute
     */
    private String var;

    /**
     * 버튼 여부
     */
    private String buttonYn = "Y";

	/**
     * @return the viewId
     */
    public String getViewId() {
        return viewId;
    }

    /**
     * @param viewId the viewId to set
     */
    public void setViewId(String viewId) {
        this.viewId = viewId;
    }

    /**
     * @return the var
     */
    public String getVar() {
        return var;
    }

    /**
     * @param var the var to set
     */
    public void setVar(String var) {
        this.var = var;
    }

    /**
     * @return the buttonYn
     */
    public String getButtonYn() {
        return buttonYn;
    }

    /**
     * @param buttonYn the buttonYn to set
     */
    public void setButtonYn(String buttonYn) {
        this.buttonYn = buttonYn;
    }

    public String getHasPermission() {
		return hasPermission;
	}

    /**
	 * Setting required permission to bit mask. ex) READ-1 WRITE-2,
	 * If permission information is not one,
	 * then separate information with comma such as 'hasPermission="3,16"'
	 * This method also support EL expression. ex) hasPermission="${permissions}"
	 *
	 * @param hasPermission
	 */
	public void setHasPermission(String hasPermission) {
		this.hasPermission = hasPermission;
	}

	public int doStartTag() throws JspException {
	    return EVAL_BODY_BUFFERED;
	}

	/**
	 * Check if user has permission with current view resource by using viewResourceAccessService.
	 * INCLUDE if user has permission, SKIP doesn't have.
	 */
	public int doAfterBody() throws JspException {
		initializeIfRequired();

		try {

			List<Integer> requiredPermissionList = parsePermissionsString(hasPermission);
			boolean result = viewResourceAccessService.isGranted(viewId, requiredPermissionList);

			if(this.var != null){
			    pageContext.setAttribute(this.var, result);
			    return SKIP_BODY;
			}

			BodyContent body = getBodyContent();

			//버튼인 경우
			if("Y".equals(this.buttonYn)){

			    //버튼 권한이 있다면 BODY를 출력한다.
			    if(result){
			        body.writeOut(body.getEnclosingWriter());

			    //버튼 권한이 없다면 hidden class를 추가하고 출력한다
			    }else{

	                String bodyText = body.getString();

	                Pattern p = Pattern.compile("class\\s?=\\s?[\"|\']([^\"|']+)[\"|\']");
	                Matcher m = p.matcher(bodyText);

	                StringBuffer sb = new StringBuffer(bodyText.length());

	                while(m.find()){
	                    m.appendReplacement(sb, Matcher.quoteReplacement("class=\"" + m.group(1) + " hidden\""));
	                }
	                m.appendTail(sb);

	                JspWriter out = body.getEnclosingWriter();
                    out.print(sb.toString());
			    }

			//버튼이 아닌 경우
			}else{
			    if(result){
			        body.writeOut(body.getEnclosingWriter());
			    }
			}

			return SKIP_BODY;
		}
		catch (Exception e) {
		    return SKIP_BODY;
		}
	}

	/**
	 * Return list of split permission with comma
	 *
	 * @param evaledPermissionsString
	 * @return
	 */
	protected List<Integer> parsePermissionsString(String evaledPermissionsString) {
		List<Integer> parsePermissionsList = new ArrayList<Integer>();
		for(String perm : evaledPermissionsString.replaceAll(" ", "").split(",")){
			parsePermissionsList.add(new Integer(Integer.parseInt(perm)));
		}

		return parsePermissionsList;
	}

	/**
	 * find context of Spring
	 *
	 * @return
	 */
	protected ApplicationContext getContext() {
		return WebApplicationContextUtils.getRequiredWebApplicationContext(pageContext.getServletContext());
	}

	/**
	 * As initialize logic of tag, get Spring context to use viewResourceAccessService bean.
	 *
	 * @throws JspException
	 */
	protected void initializeIfRequired() throws JspException {
		if (context != null) {
			return;
		}

		context = getContext();

		Map<String, ViewResourceAccessService> beanMap = context.getBeansOfType(ViewResourceAccessService.class);
		if (beanMap.size() > 0) {
			viewResourceAccessService = (ViewResourceAccessService) beanMap.values().iterator().next();
		}
		else {
			throw new JspException("viewResourceAccessService bean was not found in application context");
		}
	}

}
