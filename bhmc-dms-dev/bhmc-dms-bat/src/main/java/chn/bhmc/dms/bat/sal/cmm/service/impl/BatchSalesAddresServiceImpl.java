package chn.bhmc.dms.bat.sal.cmm.service.impl;

import java.net.InetAddress;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.sal.cmm.service.BatchSalesAddresService;
import chn.bhmc.dms.bat.sal.cmm.service.dao.BatchSalesAddresDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchSalesServiceImpl
 * @Description : camel 호출요청.
 * @author Kim Jin Suk
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.                        최초 생성
 * </pre>
 */

@Service("batchSalesAddresService")
public class BatchSalesAddresServiceImpl extends HService implements BatchSalesAddresService {

    /**
     *  DAO 선언
     */
    @Resource(name="batchSalesAddresDAO")
    BatchSalesAddresDAO batchSalesAddresDAO;

    @Override
    public void pingSearch(String url, int timeOut) throws Exception{
        boolean connectionFlag = false;

        connectionFlag = pingCheck(url.trim(), timeOut);
        batchSalesAddresDAO.pingSearch(url.trim(), connectionFlag?"Y":"N");
    }

    private boolean pingCheck(String url, int timeout) throws Exception{
        //입력된 호스명으로 IP 어드레스를 던진다.
        InetAddress target = InetAddress.getByName(url);
        //주어진 밀리세컨드 내에 원격호스트에 접근 가능 하면 true, 아니면 false를 던진다.(밀리세컨드 (ms) = 1/1000초)
        return target.isReachable(timeout);
    }

}