package chn.bhmc.dms.core.support.excel;

import able.com.vo.HMap;

import org.jxls.common.Context;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : JxlsSupport.java
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

public interface JxlsSupport {
    public void initJxlsContext(Context context, HMap params) throws Exception;
}
