package chn.bhmc.dms.support.activator;

import org.osgi.framework.BundleActivator;
import org.osgi.framework.BundleContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : Activator.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 3. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 15.     Kang Seok Han     최초 생성
 * </pre>
 */

public class Activator implements BundleActivator {
    private Logger log = LoggerFactory.getLogger(Activator.class);

    /**
     * Statements
     *
     * @param  BundleContext
     * @return void
     * @throws Exception
     */
    public void start(BundleContext context) throws Exception {
        log.info("Start bhmc-dms-support Bundle !!!!!!!!!!");
    }

    /**
     * Statements
     *
     * @param  BundleContext
     * @return void
     * @throws Exception
     */
    public void stop(BundleContext context) {
        log.error("Stop bhmc-dms-support Bundle !!!!!!!!!!");
    }

}
