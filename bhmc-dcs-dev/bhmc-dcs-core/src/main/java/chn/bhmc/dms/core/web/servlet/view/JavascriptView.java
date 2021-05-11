package chn.bhmc.dms.core.web.servlet.view;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.AbstractView;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : JavascriptView.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 3. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 29.     Kang Seok Han     최초 생성
 * </pre>
 */

@Component("javascriptView")
public class JavascriptView extends AbstractView {

    @Override
    protected void renderMergedOutputModel(Map<String, Object> model,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        response.setContentType("application/javascript;charset=UTF-8");

        PrintWriter out = response.getWriter();
        out.print(model.get("script"));
        out.flush();

    }

}
