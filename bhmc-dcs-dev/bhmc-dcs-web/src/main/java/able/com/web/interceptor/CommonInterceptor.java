package able.com.web.interceptor;

import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.propertyeditors.LocaleEditor;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;
import org.springframework.web.servlet.support.RequestContextUtils;

import able.com.web.HController;

/**
 *<pre>
 * AnnotationHandlerMapping의 Interceptor로 사용된다.
 * &lt;기능&gt;
 *  1. RequestHolder를 이용한 현재 Request의 Session정보를 현재 Thread의 전구간에서 자유로이 접근 가능하게 지원한다.
 *  2. 이전 URI 및 Path정보 , 현재 Request URI정보를 session에 저장한다.
 *  3. 다국어 선택에 대한 locale 설정을 지원한다.
 *  org.springframework.web.servlet.i18n.LocaleChangeInterceptor 를 재정의 하였다.
 *  [확장 기능]
 *    - request의 localeParamName에 해당하는 parameter가 있다면 해당 파라미터 값으로 locale을 설정하고 해당정보를 session에 저장한다.
 *    - request의 localeParamName에 해당하는 parameter가 없다면 session의 정보를 검색하며, session에도 없다면 default locale이 적용된다.
 *
 * [dispatcher-servlet.xml 설정]
 *  &lt;!-- multi language message Resolver --&gt;
 *  &lt;bean id="localeResolver" class="org.springframework.web.servlet.i18n.SessionLocaleResolver" /&gt;
 * &lt;!-- define Handler Interceptor bean --&gt;
 *  &lt;bean id="tmsInterceptor" class="able.com.web.servlet.Interceptor"&gt;
 *      &lt;property name="localeParamName" value="language" /&gt;
 *  &lt;/bean&gt;
 *  &lt;!-- set interceptor of AnnotationHandlerMapping --&gt;
 *  &lt;bean id="annotationMapper" class="org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping"&gt;
 *      &lt;property name="interceptors"&gt;
 *          &lt;list&gt;
 *              &lt;ref bean="tmsInterceptor" /&gt;
 *          &lt;/list&gt;
 *      &lt;/property&gt;
 *  &lt;/bean&gt;
 *
 * (+) Language parameter value
 * : 2자리 소문자 형식의 ISO-639-1 코드 체계를 따른다.
 *  http://www.loc.gov/standards/iso639-2/php/English_list.php 에서 확인할 수 있다.
 *
 *  caution) language는 framework 예약어 이므로 다른 application에서 별개 의미의 parameter로 사용할 수 없다.
 *
 *   수정일         수정자                   수정내용
 *  -------        --------    ---------------------------
 *  2010.05.18     IT아키텍처팀        최초작성
 * </pre>
 * @author ABLE Project IT아키텍처팀
 * @since jdk 1.5
 * @version 1.0
 * @see LocaleChangeInterceptor
 * @see SessionLocaleResolver
 * @see RequestMappingHandlerMapping
 * @see HandlerInterceptorAdapter
 * @see DispatcherServlet
 */
public class CommonInterceptor extends HandlerInterceptorAdapter{
    /** serial version UID **/
    public static final String DEFAULT_PARAM_NAME = "locale";
    /** locale 설정 parameter name **/
    private String localeParamName;
    /**
     * default constructor
     * locale parameter name = locale
     * **/
    public CommonInterceptor()
    {
        localeParamName = DEFAULT_PARAM_NAME;
    }
    /**
     * locale parameter name = localeParamName
     * @param localeParamName locale parameter name
     * **/
    public void setLocaleParamName(String localeParamName)
    {
        this.localeParamName = localeParamName;
    }
    /**
     * return locale parameter name
     * @return String locale parameter name
     * **/
    public String getLocaleParamName()
    {
        return localeParamName;
    }
    /**<pre>
     * Controller의 처리 직전 시행된다.
     * 1. RequestHolder 에 현재 Session을 저장한다.
     * 2. 세션에 RequestURI를 저장한다.
     * 3. 현재 Request에 대한 locale을 설정한다.
     *    - resquest로부터의 locale parameter value로 현재 locale을 설정한다.
     *    - request에 해당 parameter가 없는 경우 session으로 부터 locale을 획득한다.
     * </pre>
     * @param request HttpServletRequest
     * @param response HttpServletResponse
     * @param handler controller
     * @return boolean
     * **/
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
        throws ServletException
    {

        //set session info int ThreadLocal
        //HController.setLocalSession(request.getSession());
        //set request uri in local session
        //String targetURI        = request.getRequestURI();
        //HController.setSessionAttribute(HController.TARGET_URI, targetURI);

        //get/set language info
        HttpSession session = request.getSession();

        String newLocale    = request.getParameter(localeParamName);
        if(newLocale==null)//if request parameter is null
            newLocale       = (String) session.getAttribute(localeParamName);//get locale from session
        else
            session.setAttribute(localeParamName, newLocale);//setting session

        if(newLocale != null)
        {
            LocaleResolver localeResolver = RequestContextUtils.getLocaleResolver(request);
            if(localeResolver == null)
                throw new IllegalStateException("No LocaleResolver found: not in a DispatcherServlet request?");
            LocaleEditor localeEditor = new LocaleEditor();
            localeEditor.setAsText(newLocale);
            localeResolver.setLocale(request, response, (Locale)localeEditor.getValue());//setting locale
        }
        return true;
    }


    /**<pre>
     * Controller의 처리 직후 시행된다.
     * Controller내에서의 오류 발생 시 실행되지 않음에 유의한다.
     * </pre>
     * @param request HttpServletRequest
     * @param response HttpServletResponse
     * @param handler controller
     * @param modelandview ModelAndView
     * **/
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelandview)
        throws Exception
    {
        request.setAttribute("ABLE_SPRING_CURRENT_URI",request.getRequestURI());
    }


    /**<pre>
     * Request에 대한 모든 처리가 완료된 후 실행된다.
     * 1. session에 현재 request URI를 저장한다.
     * 2. session에 현재 servletPath(jsp 경로)를 저장한다.
     * 3. RequestHolder에 저장한 정보를 제거한다.
     * </pre>
     * @param httpservletrequest HttpServletRequest
     * @param httpservletresponse HttpServletResponse
     * @param handler controller
     * @param exception Exception
     * **/
    public void afterCompletion(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse, Object handler, Exception exception)
        throws Exception
    {
        httpservletrequest.setAttribute("ABLE_SPRING_CURRENT_URI",httpservletrequest.getRequestURI());

        //save last request and response info in local session
        String startURI     = httpservletrequest.getRequestURI();
        String startPath    = httpservletrequest.getServletPath();
        if(startPath!=null
                && (
                        startPath.trim().toLowerCase().endsWith(".jsp")
                        || startPath.trim().toLowerCase().endsWith(".jspf")
                        || startPath.trim().toLowerCase().endsWith(".html")
                        || startPath.trim().toLowerCase().endsWith(".htm")
                        || startPath.trim().toLowerCase().endsWith(".xml")
                        || startPath.trim().toLowerCase().endsWith(".xslt")
                    )
        ){
            HController.setSessionAttribute(HController.START_URI, startURI);
            HController.setSessionAttribute(HController.START_PATH, startPath);
        }
        //remove session info int ThreadLocal
        HController.removeLocalSession();
    }

}
