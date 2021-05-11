package chn.bhmc.dms.bat.sal.usc.service.impl;

import able.com.service.HService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.sal.cmm.service.BatchSalesService;
import chn.bhmc.dms.bat.sal.usc.service.UsedcarInfoService;
import chn.bhmc.dms.bat.sal.usc.service.dao.UsedcarInfoDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UsedcarInfoServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ki hyun Kwon
 * @since 2017. 3. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 3. 24.     Ki hyun Kwon     최초 생성
 * </pre>
 */
@Service("usedcarInfoService")
public class UsedcarInfoServiceImpl extends HService implements UsedcarInfoService {


    @Autowired
    UsedcarInfoDAO usedcarInfoDAO;


    @Autowired
    BatchSalesService batchSalesService;

    /**
    *
    * 중고차인증명세-차량마스터  정보 SAL122
    *
    * @throws Exception
    */
   public void insertSusunDcsUvinmst()throws Exception{

       usedcarInfoDAO.insertSusunDcsUvinmst();

       batchSalesService.executeEaiService("SAL122");


   }

   /**
    *
    * 중고차인증명세-소유자  정보 SAL123
    *
    * @throws Exception
    */
   public void insertSusunDcsOwner()throws Exception{

       usedcarInfoDAO.insertSusunDcsOwner();

       batchSalesService.executeEaiService("SAL123");
   }

   /**
    *
    * 중고차인증명세-인증차량 SAL124
    *
    * @throws Exception
    */
   public void insertSusunDcsCrtvin()throws Exception{

       usedcarInfoDAO.insertSusunDcsCrtvin();

       batchSalesService.executeEaiService("SAL124");
   }

   /**
    *
    * 중고차인증명세-인증딜러  정보 SAL125
    *
    * @throws Exception
    */
   public void insertSusunDcsCrtdlr()throws Exception{

       usedcarInfoDAO.insertSusunDcsCrtdlr();

       batchSalesService.executeEaiService("SAL125");
   }

}
