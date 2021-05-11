package chn.bhmc.dms.dply.cmm.service.impl;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.xml.parsers.ParserConfigurationException;

import able.com.service.HService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.xml.sax.SAXException;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.dply.cmm.SyncCmdClient;
import chn.bhmc.dms.dply.cmm.service.DplyCmmService;
import chn.bhmc.dms.dply.cmm.service.dao.DplyCmmDAO;
import chn.bhmc.dms.dply.cmm.vo.CmmPrtySaveVO;
import chn.bhmc.dms.dply.cmm.vo.CmmPrtyVO;
import chn.bhmc.dms.dply.cmm.vo.DplyCmmSearchVO;
import chn.bhmc.dms.dply.cmm.vo.SimulationServerSaveVO;
import chn.bhmc.dms.dply.cmm.vo.SimulationServerVO;
import chn.bhmc.dms.dply.cmm.vo.SyncCommandBundleVO;
import chn.bhmc.dms.dply.cmm.vo.SyncCommandSearchVO;
import chn.bhmc.dms.dply.cmm.vo.SyncCommandSendReceiveHistorySearchVO;
import chn.bhmc.dms.dply.cmm.vo.SyncCommandSendReceiveHistoryVO;
import chn.bhmc.dms.dply.cmm.vo.SyncMessageTemplateSaveVO;
import chn.bhmc.dms.dply.cmm.vo.SyncMessageTemplateVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DplyCmmServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 4. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 6.     Cheol Man Oh     최초 생성
 * </pre>
 */

@Service("dplyCmmService")
public class DplyCmmServiceImpl extends HService implements DplyCmmService {

    private static final Logger logger = LoggerFactory.getLogger(DplyCmmServiceImpl.class);

    /**
     * 형상관리 공통업무 DAO 선언
     */
    @Resource(name="dplyCmmDAO")
    DplyCmmDAO dplyCmmDAO;

    /*
     * @see chn.bhmc.dms.dply.cmm.service.DplyCmmService#selectCmmPrtyList(chn.bhmc.dms.dply.cmm.vo.DplyCmmSearchVO)
     */
    @Override
    public List<CmmPrtyVO> selectCmmPrtyList(DplyCmmSearchVO dplyCmmSearchVO) throws Exception {

        return dplyCmmDAO.selectCmmPrtyList(dplyCmmSearchVO);
    }

    /*
     * @see chn.bhmc.dms.dply.cmm.service.DplyCmmService#multiCmmPrty(chn.bhmc.dms.dply.cmm.vo.CmmPrtySaveVO)
     */
    @Override
    public String multiCmmPrty(CmmPrtySaveVO saveVO) throws Exception {
        String usrId = LoginUtil.getUserId();

        for(CmmPrtyVO cmmPrtyVO : saveVO.getInsertList()) {
            cmmPrtyVO.setRegUsrId(usrId);
            dplyCmmDAO.insertCmmPrty(cmmPrtyVO);
        }

        for(CmmPrtyVO cmmPrtyVO : saveVO.getUpdateList()) {
            cmmPrtyVO.setUpdtUsrId(usrId);
            dplyCmmDAO.updateCmmPrty(cmmPrtyVO);
        }

        for(CmmPrtyVO cmmPrtyVO : saveVO.getDeleteList()) {
            cmmPrtyVO.setUpdtUsrId(usrId);
            dplyCmmDAO.deleteCmmPrty(cmmPrtyVO);
        }


        return "OK";

    }


    /*
     * @see chn.bhmc.dms.dply.cmm.service.DplyCmmService#selectSyncCommandSendReceiveHistoryByCondition(chn.bhmc.dms.dply.cmm.vo.SyncCommandSendReceiveHistorySearchVO)
     */
    @Override
    public List<SyncCommandSendReceiveHistoryVO> selectSyncCommandSendReceiveHistoryByCondition(SyncCommandSendReceiveHistorySearchVO searchVO) throws Exception {
        return dplyCmmDAO.selectSyncCommandSendReceiveHistoryByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.dply.cmm.service.DplyCmmService#selectSyncCommandSendReceiveHistoryByConditionCnt(chn.bhmc.dms.dply.cmm.vo.SyncCommandSendReceiveHistorySearchVO)
     */
    @Override
    public int selectSyncCommandSendReceiveHistoryByConditionCnt(SyncCommandSendReceiveHistorySearchVO searchVO) throws Exception {
        return dplyCmmDAO.selectSyncCommandSendReceiveHistoryByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.dply.cmm.service.DplyCmmService#multiSyncCommand(java.lang.String)
     */
    @Override
    public String multiSyncCommand(SyncCommandSearchVO searchVO) throws Exception {

        HashMap<String, String> map = new HashMap<String, String>();

        String ipAddr              = null;       // DCS_DPLY_SVR_IP_ADDR
        String port                = null;       // SYNCCMDSNDR_LOCAL_PORT
        String sockTmOut           = null;       // SYNCCMD_SOCKET_WAIT_TMOUT
        String rootSymbolicName    = null;       // ROOT SYMBOLIC NAME (chn.bhmc.*)
        String dcsMqPort           = null;       // DCS_MQ_PORT
        String reqBodyNeed         = null;

        String mesgCd              = null;       //
        String mesgGrpCd           = null;       //
        String dlrCd               = null;       // DEALER CODE
        String symbolicName        = null;       // SYMBOLIC NAME
        String operType            = null;
        String groupId             = null;
        String artifactId          = null;
        String version             = null;
        String specCd              = null;
        String deployVerNo         = null;
        String deployOperCd        = null;
        String deployReqSeq        = null;

        String repository          = null;
        String sql                 = null;
        String srcFileUrl          = null;
        String trgtFilePath        = null;
        String propertyFilePath    = null;
        String keyNm               = null;
        String keyVal              = null;
        String fileType            = null;
        String operCmdNm           = null;

        String operDirNm           = null;
        String operCmdEnvCont      = null;
        String successDecisionStr  = null;
        String failDecisionStr     = null;
        String objectNm            = null;

        String reload              = null;

        String directoryPath       = null;

        String srcFilePathNm       = null;
        String targFilePathNm      = null;

        String  updateDate            = null;


        List<CmmPrtyVO> prtyList = dplyCmmDAO.selectCmmPrtyList(new DplyCmmSearchVO());

        for(int i=0; i<prtyList.size(); i++) {
            if( "DCS_DPLY_SVR_IP_ADDR".equals(prtyList.get(i).getPrtyNm()) ) {
                ipAddr = prtyList.get(i).getPrtyVal();
            }
            if( "SYNCCMDSNDR_LOCAL_PORT".equals(prtyList.get(i).getPrtyNm()) ) {
                port = prtyList.get(i).getPrtyVal();
            }
            if( "SYNCCMD_SOCKET_WAIT_TMOUT".equals(prtyList.get(i).getPrtyNm()) ) {
                sockTmOut = prtyList.get(i).getPrtyVal();
            }
            if( "ROOT_SYMBOLIC_NAME".equals(prtyList.get(i).getPrtyNm()) ) {
                rootSymbolicName = prtyList.get(i).getPrtyVal();
            }
            if( "DCS_MQ_PORT".equals(prtyList.get(i).getPrtyNm()) ) {
                dcsMqPort = prtyList.get(i).getPrtyVal();
            }
        }

        SyncCommandBundleVO syncCommandBundleVO = null;

        ipAddr              = (searchVO.getIpAddr()           == null || "".equals(searchVO.getIpAddr())           ? ipAddr           : searchVO.getIpAddr());
        port                = (searchVO.getPort()             == null || "".equals(searchVO.getPort())             ? port             : searchVO.getPort())  ;
        rootSymbolicName    = (searchVO.getRootSymbolicName() == null || "".equals(searchVO.getRootSymbolicName()) ? rootSymbolicName : searchVO.getRootSymbolicName());
        dcsMqPort           = (searchVO.getDcsMqPort()        == null || "".equals(searchVO.getDcsMqPort())        ? dcsMqPort        : searchVO.getDcsMqPort())  ;
        reqBodyNeed         = (searchVO.getReqBodyNeed()      == null || "".equals(searchVO.getReqBodyNeed())      ? "N"              : searchVO.getReqBodyNeed());

        mesgCd              = searchVO.getMesgCd();
        mesgGrpCd           = searchVO.getMesgGrpCd();
        dlrCd               = searchVO.getDlrCd() ;
        symbolicName        = searchVO.getSymbolicName();
        operType            = searchVO.getOperType();
        groupId             = searchVO.getGroupId();
        artifactId          = searchVO.getArtifactid();
        version             = searchVO.getVersion();
        specCd              = searchVO.getSpecCd();
        deployVerNo         = searchVO.getDeployVerNo();
        deployOperCd        = searchVO.getDeployOperCd();
        deployReqSeq        = searchVO.getDeployReqSeq();

        repository          = searchVO.getRepository();
        sql                 = searchVO.getSql();
        srcFileUrl          = searchVO.getSrcFileUrl();
        trgtFilePath        = searchVO.getTrgtFilePath();
        propertyFilePath    = searchVO.getPropertyFilePath();
        keyNm               = searchVO.getKeyNm();
        keyVal              = searchVO.getKeyVal();
        fileType            = searchVO.getFileType();
        operCmdNm           = searchVO.getOperCmdNm();
        operDirNm           = searchVO.getOperDirNm();
        operCmdEnvCont      = searchVO.getOperCmdEnvCont();
        successDecisionStr  = searchVO.getSuccessDecisionStr();
        failDecisionStr     = searchVO.getFailDecisionStr();
        objectNm            = searchVO.getObjectNm();

        reload              = searchVO.getReload();

        directoryPath       = searchVO.getDirectoryPath();

        srcFilePathNm       = searchVO.getSrcFilePathNm();
        targFilePathNm      = searchVO.getTargFilePathNm();

        updateDate              =searchVO.getUpdateDate();

        map.put("ipAddr",             ipAddr          );
        map.put("port",               port            );
        map.put("sockTmOut",          sockTmOut       );
        map.put("rootSymbolicName",   rootSymbolicName);
        map.put("dcsMqPort",          dcsMqPort       );

        map.put("mesgCd",             mesgCd          );
        map.put("mesgGrpCd",          mesgGrpCd       );
        map.put("dlrCd",              dlrCd           );
        map.put("symbolicName",       symbolicName    );
        map.put("operType",           operType        );
        map.put("groupId",            groupId         );
        map.put("artifactId",         artifactId      );
        map.put("version",            version         );
        map.put("specCd",             specCd          );
        map.put("deployVerNo",        deployVerNo     );
        map.put("deployOperCd",       deployOperCd    );
        map.put("deployReqSeq",       deployReqSeq    );
        map.put("reqBodyNeed",        reqBodyNeed     );

        map.put("repository",         "<![CDATA[" + repository + "]]>"           );
//        map.put("repository",         repository      );
        map.put("sql",                "<![CDATA[" + sql + "]]>"                  );
        map.put("srcFileUrl",         "<![CDATA[" + srcFileUrl + "]]>"           );
        map.put("trgtFilePath",       "<![CDATA[" + trgtFilePath + "]]>"         );
        map.put("propertyFilePath",   "<![CDATA[" + propertyFilePath + "]]>"     );
        map.put("keyNm",              "<![CDATA[" + keyNm + "]]>"                );
        map.put("keyVal",             "<![CDATA[" + keyVal + "]]>"               );
        map.put("fileType",           fileType        );
        map.put("operCmdNm",          "<![CDATA[" + operCmdNm + "]]>"            );
        map.put("operDirNm",          "<![CDATA[" + operDirNm + "]]>"            );
        map.put("operCmdEnvCont",     "<![CDATA[" + operCmdEnvCont + "]]>"       );
        map.put("successDecisionStr", "<![CDATA[" + successDecisionStr + "]]>"   );
        map.put("failDecisionStr",    "<![CDATA[" + failDecisionStr + "]]>"      );
        map.put("objectNm",           objectNm        );

        map.put("reload",             reload          );

//        map.put("directoryPath",      directoryPath        );
        map.put("directoryPath",      "<![CDATA[" + directoryPath + "]]>"        );
//        map.put("directoryPath",      "<![CDATA[" + "C:\\Servers\\nexus\\sonatype-work\\nexus\\storage\\bhmc-dcs-dplysvr-releases\\file_deploy" + "]]>"        );

        map.put("srcFilePathNm",     srcFilePathNm );
        map.put("targFilePathNm",   targFilePathNm );

        map.put("updateDate",   updateDate );

        map.put("userId",             LoginUtil.getUserId());

        if(searchVO.getSyncCommandBundleVOList() != null) {
            syncCommandBundleVO = searchVO.getSyncCommandBundleVOList().get(0);
        }

        List<SyncMessageTemplateVO> mesgBodyList = dplyCmmDAO.selectMessageTemplateByCondition(map);

        String mesgBodyCont = null;
        String resMsg = null;

        if(mesgBodyList.size() != 0) {
            mesgBodyCont = mesgBodyList.get(0).getMesgBodyCont();
        }

        log.info("\nDplyCmmServiceImpl mesgBodyCont : Before Processing\n" + mesgBodyCont);

        if(map.get("mesgCd").equals("30001")) {  // DMS Check Alive Sync Message
            mesgBodyCont = setElementValue("dlr_cd", map.get("dlrCd"), mesgBodyCont);
            mesgBodyCont = setElementValue("user_id", map.get("userId"), mesgBodyCont);

        } else if(map.get("mesgCd").equals("30002")) {  // DMS Bundle List Query Sync Message
            mesgBodyCont = setElementValue("symbolic_name", map.get("rootSymbolicName"), mesgBodyCont);
            mesgBodyCont = setElementValue("dms_was_app_home_dir", map.get("targFilePathNm"), mesgBodyCont);
            mesgBodyCont = setElementValue("user_id", map.get("userId"), mesgBodyCont);

        } else if(map.get("mesgCd").equals("30003")) {  // DMS Bundle Status Query Sync Message
            mesgBodyCont = setElementValue("symbolic_name", syncCommandBundleVO.getSymbolicName(), mesgBodyCont);
            mesgBodyCont = setElementValue("version", syncCommandBundleVO.getVersion(), mesgBodyCont);
            mesgBodyCont = setElementValue("user_id", map.get("userId"), mesgBodyCont);

        } else if(map.get("mesgCd").equals("30004")) {  // Immediately Bundle Deploy Request Sync Message
            mesgBodyCont = setElementValue("oper_type", map.get("operType"), mesgBodyCont);
//          mesgBodyCont = setElementValue("repository_url", map.get("repository"), mesgBodyCont);
//          mesgBodyCont = setElementValue("symbolic_name", map.get("symbolicName"), mesgBodyCont);
//          mesgBodyCont = setElementValue("version", map.get("version"), mesgBodyCont);
          mesgBodyCont = setElementValue("src_file_path_nm", map.get("srcFilePathNm"), mesgBodyCont);
          mesgBodyCont = setElementValue("targ_file_path_nm", map.get("targFilePathNm"), mesgBodyCont);
          mesgBodyCont = setElementValue("user_id", map.get("userId"), mesgBodyCont);

        } else if(map.get("mesgCd").equals("30005")) {  // Immediately SQL Deploy Request Sync Message
            mesgBodyCont = setElementValue("sql", map.get("sql"), mesgBodyCont);
            mesgBodyCont = setElementValue("user_id", map.get("userId"), mesgBodyCont);

        } else if(map.get("mesgCd").equals("30006")) {  // Immediately Property Deploy Request Sync Message
            mesgBodyCont = setElementValue("property_file_path", map.get("propertyFilePath"), mesgBodyCont);
            mesgBodyCont = setElementValue("key_nm", map.get("keyNm"), mesgBodyCont);
            mesgBodyCont = setElementValue("key_val", map.get("keyVal"), mesgBodyCont);
            mesgBodyCont = setElementValue("file_type", map.get("fileType"), mesgBodyCont);
            mesgBodyCont = setElementValue("user_id", map.get("userId"), mesgBodyCont);

        } else if(map.get("mesgCd").equals("30007")) {  // Deploy Result Query Sync Message
            mesgBodyCont = setElementValue("spec_cd", map.get("specCd"), mesgBodyCont);
            mesgBodyCont = setElementValue("deploy_ver_no", map.get("deployVerNo"), mesgBodyCont);
            mesgBodyCont = setElementValue("deploy_req_seq", map.get("deployReqSeq"), mesgBodyCont);
            mesgBodyCont = setElementValue("user_id", map.get("userId"), mesgBodyCont);

        } else if(map.get("mesgCd").equals("30008")) {  // DMS Mobile App Download Version Query Sync Message

        } else if(map.get("mesgCd").equals("30009")) {  // Immediately File Deploy Request Sync Message
            mesgBodyCont = setElementValue("source_file", map.get("srcFileUrl"), mesgBodyCont);
            mesgBodyCont = setElementValue("dest_file", map.get("trgtFilePath"), mesgBodyCont);
            mesgBodyCont = setElementValue("user_id", map.get("userId"), mesgBodyCont);

        } else if(map.get("mesgCd").equals("30011")) {  // Sync DMS Deploy Server Bundle Deploy
            mesgBodyCont = setElementValue("repository_url", map.get("repository"), mesgBodyCont);
            mesgBodyCont = setElementValue("symbolic_name", map.get("symbolicName"), mesgBodyCont);
            mesgBodyCont = setElementValue("version", map.get("version"), mesgBodyCont);
            mesgBodyCont = setElementValue("user_id", map.get("userId"), mesgBodyCont);

        } else if(map.get("mesgCd").equals("30012")) {  // DMS Deploy Server Repository Deploy
            mesgBodyCont = setElementValue("oper_cmd_nm", map.get("operCmdNm"), mesgBodyCont);
            mesgBodyCont = setElementValue("repo_url_nm", map.get("repository"), mesgBodyCont);
            mesgBodyCont = setElementValue("user_id", map.get("userId"), mesgBodyCont);

        } else if(map.get("mesgCd").equals("30013")) {  // DMS Deploy Server Command Deploy
            mesgBodyCont = setElementValue("oper_cmd_nm",          map.get("operCmdNm"), mesgBodyCont);
            mesgBodyCont = setElementValue("oper_cmd_nm",          map.get("operCmdNm"), mesgBodyCont);
            mesgBodyCont = setElementValue("oper_dir_nm",          map.get("operDirNm"), mesgBodyCont);
            mesgBodyCont = setElementValue("oper_cmd_env_cont",    map.get("operCmdEnvCont"), mesgBodyCont);
            mesgBodyCont = setElementValue("success_decision_str", map.get("successDecisionStr"), mesgBodyCont);
            mesgBodyCont = setElementValue("fail_decision_str",    map.get("failDecisionStr"), mesgBodyCont);
            mesgBodyCont = setElementValue("user_id", map.get("userId"), mesgBodyCont);

        } else if(map.get("mesgCd").equals("30015")) {  // OSGi Bundle Repository Resource Query
//            map.put("dlrCd", "");
            mesgBodyCont = setElementValue("repository_url", map.get("repository"), mesgBodyCont);

        } else if(map.get("mesgCd").equals("30016")) {  // Sync DMS DB Object Query
            mesgBodyCont = setElementValue("object_name", map.get("objectNm"), mesgBodyCont);
            mesgBodyCont = setElementValue("user_id", map.get("userId"), mesgBodyCont);

        } else if(map.get("mesgCd").equals("30017")) {  // Sync DMS Table Structure Query
            mesgBodyCont = setElementValue("object_name", map.get("objectNm"), mesgBodyCont);
            mesgBodyCont = setElementValue("user_id", map.get("userId"), mesgBodyCont);

        } else if(map.get("mesgCd").equals("30018")) {  // Sync DMS Procedure/Function Source Query
            mesgBodyCont = setElementValue("object_name", map.get("objectNm"), mesgBodyCont);
            mesgBodyCont = setElementValue("user_id", map.get("userId"), mesgBodyCont);

        } else if(map.get("mesgCd").equals("30021")) {  // Symc DMS Index Structure Query
            mesgBodyCont = setElementValue("object_name", map.get("objectNm"), mesgBodyCont);
            mesgBodyCont = setElementValue("user_id", map.get("userId"), mesgBodyCont);

        } else if(map.get("mesgCd").equals("30022")) {  // Symc DMS View Structure Query
            mesgBodyCont = setElementValue("object_name", map.get("objectNm"), mesgBodyCont);
            mesgBodyCont = setElementValue("user_id", map.get("userId"), mesgBodyCont);

        } else if(map.get("mesgCd").equals("10001")) {  // Immediately Deploy Request Message
            mesgBodyCont = setElementValue("spec_cd", map.get("specCd"), mesgBodyCont);
            mesgBodyCont = setElementValue("deploy_ver_no", map.get("deployVerNo"), mesgBodyCont);
            mesgBodyCont = setElementValue("user_id", map.get("userId"), mesgBodyCont);

        } else if(map.get("mesgCd").equals("10002")) {  //
            mesgBodyCont = setElementValue("spec_cd", map.get("specCd"), mesgBodyCont);
            mesgBodyCont = setElementValue("deploy_ver_no", map.get("deployVerNo"), mesgBodyCont);
            mesgBodyCont = setElementValue("deploy_oper_cd", map.get("deployOperCd"), mesgBodyCont);
            mesgBodyCont = setElementValue("user_id", map.get("userId"), mesgBodyCont);

        } else if(map.get("mesgCd").equals("10003")) {  // Shared Memory Info Reloading Request
            mesgBodyCont = setElementValue("reload", map.get("reload"), mesgBodyCont);
            mesgBodyCont = setElementValue("user_id", map.get("userId"), mesgBodyCont);

        } else if(map.get("mesgCd").equals("10007")) {  // 대사실행
            mesgBodyCont = setElementValue("action", "COMPARE_ALL", mesgBodyCont);
            mesgBodyCont = setElementValue("user_id", map.get("userId"), mesgBodyCont);

        } else if(map.get("mesgCd").equals("10013")) {  // Dealer별 대사실행
            mesgBodyCont = setElementValue("dlr_cd", map.get("dlrCd"), mesgBodyCont);
//            mesgBodyCont = setElementValue("user_id", map.get("userId"), mesgBodyCont);  // XML에 user_id 태그 없음

        } else if(map.get("mesgCd").equals("10014")) {  // DMS App Compare Status Request
//            mesgBodyCont = setElementValue("dlr_cd", map.get("dlrCd"), mesgBodyCont);
            mesgBodyCont = setElementValue("user_id", map.get("userId"), mesgBodyCont);

        } else if(map.get("mesgCd").equals("10015")) {  // DCS File List Query
            mesgBodyCont = setElementValue("directory_path", map.get("directoryPath"), mesgBodyCont);
//            mesgBodyCont = setElementValue("user_id", map.get("userId"), mesgBodyCont);
        }else if(map.get("mesgCd").equals("10017")) {  // App List Query
            mesgBodyCont = setElementValue("directory_path", map.get("directoryPath"), mesgBodyCont);
//          mesgBodyCont = setElementValue("user_id", map.get("userId"), mesgBodyCont);
        }else if(map.get("mesgCd").equals("10016")) {  // DCS FileFolder List Query
          mesgBodyCont = setElementValue("directory_path", map.get("directoryPath"), mesgBodyCont);
        mesgBodyCont = setElementValue("update_date", map.get("updateDate"), mesgBodyCont);
        }



        log.info("\nDplyCmmServiceImpl mesgBodyCont : After Processing\n" + mesgBodyCont);

        SyncCmdClient cmdCient = null;
        String rtnMsg = null;

        if("E".equals(map.get("mesgGrpCd")) || "I".equals(map.get("mesgGrpCd"))) {
            cmdCient = new SyncCmdClient(map.get("ipAddr"), Integer.parseInt(map.get("port")), map.get("mesgCd"), map.get("dlrCd"), (mesgBodyCont == null ? "" : mesgBodyCont));
            resMsg = cmdCient.sendSyncCommand(Integer.parseInt(map.get("sockTmOut")));
            log.info("\nDplyCmmServiceImpl resMsg after sendSyncCommand :\n" + resMsg);

            rtnMsg = resMsg.substring(83);
            log.info("\nDplyCmmServiceImpl rtnMsg after header delete :\n" + rtnMsg);

        }
/*
        else if("NOTHING".equals(map.get("mesgGrpCd"))) {
            cmdCient = new SyncCmdClient(map.get("ipAddr"), Integer.parseInt(map.get("dcsMqPort")), "CommandBroker", "karaf", "karaf",  map.get("mesgCd"), (mesgBodyCont == null ? "" : mesgBodyCont));
            if (cmdCient.createMqConnection()) {
                cmdCient.sendMqMessage();
            }

            cmdCient.destroyMqConnection();

            rtnMsg = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><deploy><mesg_code>" + map.get("mesgCd") + "</mesg_code></deploy>";

        }
*/

        if("Y".equals(map.get("reqBodyNeed"))) {
//            mesgBodyCont = mesgBodyCont.replace("<?xml version=\"1.0\" encoding=\"UTF-8\"?>", "");
            rtnMsg = rtnMsg.replace("<?xml version=\"1.0\" encoding=\"UTF-8\"?>", "");
            rtnMsg = mesgBodyCont.replace("<?xml version=\"1.0\" encoding=\"UTF-8\"?>", "<?xml version=\"1.0\" encoding=\"UTF-8\"?><wholeMessage>") + rtnMsg + "</wholeMessage>";
        }

        if("Y".equals(map.get("reqBodyNeed"))) {
            rtnMsg = rtnMsg.replaceAll("><", ">\r\n<");
            log.info("\nDplyCmmServiceImpl rtnMsg after replaceAll :\n" + rtnMsg);
        } else {
            rtnMsg = rtnMsg.replaceAll("\r\n", "");
            log.info("\nDplyCmmServiceImpl rtnMsg after replaceAll :\n" + rtnMsg);
        }

        return rtnMsg;

//        return "<deploy><symbolic_name>bhmc.dcs.dplysvr.ComApiUtilFactory</symbolic_name><version>1.0.0</version><user_id>admin</user_id><result>OK</result><result_msg></result_msg><bundle><id>264</id><symbolic_name>bhmc.dcs.dplysvr.ComApiUtilFactory</symbolic_name><version>1.0.0</version><modified>2016/05/03 10:04:32</modified><state>ACTIVE</state><install_location>file:/D:/develop/ControlServer/deploy/ComApiUtilFactory-1.0.0.jar</install_location></bundle></deploy>";
//        return "<?xml version=\"1.0\" encoding=\"UTF-8\"?><jeus-web-dd xmlns=\"http://www.tmaxsoft.com/xml/ns/jeus\"><context-path>/bhmc-dcs-web</context-path><webinf-first>false</webinf-first><auto-reload><enable-reload>true</enable-reload><check-on-demand>true</check-on-demand></auto-reload></jeus-web-dd>";
//        return resMsg;
//        return mesgBodyCont;
    }

    private String setElementValue(String strElemantName,String strValue ,String strBody) throws ParserConfigurationException, SAXException, IOException {

        strBody = strBody.substring(0, strBody.indexOf("<" + strElemantName + ">") + strElemantName.length() + 2) +
                      strValue +
                      strBody.substring(strBody.indexOf("</" + strElemantName + ">"));

        return strBody;
    }

    /*
     * @see chn.bhmc.dms.dply.cmm.service.DplyCmmService#selectMessageTemplateByCondition(java.util.HashMap)
     */
    @Override
    public List<SyncMessageTemplateVO> selectMessageTemplateByCondition(HashMap<String, String> map) {
        return dplyCmmDAO.selectMessageTemplateByCondition(map);
    }

    /*
     * @see chn.bhmc.dms.dply.cmm.service.DplyCmmService#multiMessageTemplate(chn.bhmc.dms.dply.cmm.vo.SyncMessageTemplateSaveVO)
     */
    @Override
    public String multiMessageTemplate(SyncMessageTemplateSaveVO saveVO) throws Exception {
        String usrId = LoginUtil.getUserId();

        for(SyncMessageTemplateVO syncMessageTemplateVO : saveVO.getInsertList()) {
            syncMessageTemplateVO.setRegUsrId(usrId);
            dplyCmmDAO.insertMessageTemplate(syncMessageTemplateVO);
        }

        for(SyncMessageTemplateVO syncMessageTemplateVO : saveVO.getUpdateList()) {
            syncMessageTemplateVO.setUpdtUsrId(usrId);
            dplyCmmDAO.updateMessageTemplate(syncMessageTemplateVO);
        }

        for(SyncMessageTemplateVO syncMessageTemplateVO : saveVO.getDeleteList()) {
            syncMessageTemplateVO.setUpdtUsrId(usrId);
            dplyCmmDAO.deleteMessageTemplate(syncMessageTemplateVO);
        }

        return "OK";

    }

    /*
     * @see chn.bhmc.dms.dply.cmm.service.DplyCmmService#selectSimulationServer(java.util.HashMap)
     */
    @Override
    public List<SimulationServerVO> selectSimulationServer(HashMap<String, String> map) {
        return dplyCmmDAO.selectSimulationServer(map);
    }

    /*
     * @see chn.bhmc.dms.dply.cmm.service.DplyCmmService#multiSimulationServer(chn.bhmc.dms.dply.cmm.vo.SimulationServerSaveVO)
     */
    @Override
    public String multiSimulationServer(SimulationServerSaveVO saveVO) throws Exception {
        String usrId = LoginUtil.getUserId();

        for(SimulationServerVO simulationServerVO : saveVO.getInsertList()) {
            simulationServerVO.setRegUsrId(usrId);
            dplyCmmDAO.insertSimulationServer(simulationServerVO);
        }

        for(SimulationServerVO simulationServerVO : saveVO.getUpdateList()) {
            simulationServerVO.setUpdtUsrId(usrId);
            dplyCmmDAO.updateSimulationServer(simulationServerVO);
        }

        for(SimulationServerVO simulationServerVO : saveVO.getDeleteList()) {
            simulationServerVO.setUpdtUsrId(usrId);
            dplyCmmDAO.deleteSimulationServer(simulationServerVO);
        }

        return "OK";

    }


}
