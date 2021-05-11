package chn.bhmc.dms.par.cpm.web;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import able.com.util.fmt.StringUtil;

import org.apache.commons.io.FileUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.FileMgrService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.FileItemVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.cpm.service.LeaveItemInterfaceService;
import chn.bhmc.dms.par.cpm.service.LeaveItemService;
import chn.bhmc.dms.par.cpm.vo.LeaveItemInterfaceSearchVO;
import chn.bhmc.dms.par.cpm.vo.LeaveItemSearchVO;
import chn.bhmc.dms.par.cpm.vo.LeaveItemSendVO;
import chn.bhmc.dms.par.cpm.vo.LeaveItemVO;


/**
 * LeaveItemController Controller
 *
 * @author In Bo Shim
 * @since 2016. 05. 24.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 5. 24.     In Bo Shim      최초 생성
 * </pre>
 */
@Controller
public class LeaveItemInterfaceController {

    /**
     * commonCodeService
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * leaveItemInterfaceService
     */
    @Resource(name="leaveItemInterfaceService")
    LeaveItemInterfaceService leaveItemInterfaceService;

    /**
     * leaveItemService
     */
    @Resource(name="leaveItemService")
    LeaveItemService leaveItemService;

    /**
     * fileMgrService
     */
    @Resource(name="fileMgrService")
    FileMgrService fileMgrService;

    /**
     * systemConfigInfoService
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 방치품 관리 화면을 출력한다.
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/par/cpm/leaveItem/selectLeaveItemMgrMain.do", method = RequestMethod.GET)
    public String selectLeaveItemMgrMain(Model model) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
        // 시스템 시간정보
        model.addAttribute("sysDate", DateUtil.getDate(dateFormat));
        //방치품판매유형
        model.addAttribute("sellTypeCdList", commonCodeService.selectCommonCodesByCmmGrpCd("PAR511", null, langCd));

        return "/par/cpm/leaveItem/selectLeaveItemMgrMain";
    }

    /**
     * 선방치품 관리 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 LeaveItemInterfaceSearchVO
     * @return
     */
    @RequestMapping(value = "/par/cpm/leaveItem/selectLeaveItemInterfaces.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectLeaveItemInterfaces(@RequestBody LeaveItemInterfaceSearchVO searchVO) throws Exception{

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        SearchResult result = new SearchResult();

        result.setTotal(leaveItemInterfaceService.selectLeaveItemInterfacesByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(leaveItemInterfaceService.selectLeaveItemInterfacesByCondition(searchVO));
        }

        return result;

    }

    @RequestMapping(value = "/par/cpm/leaveItem/multiLeaveItemsSend.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiLeaveItemsSend(
            @RequestBody LeaveItemSendVO leaveItemSendVO
            ,HttpServletRequest request
            ) throws Exception {

        //String filePath = null;
        //String uploadPath = request.getServletContext().getInitParameter("FILE_UPLOAD_PATH");

        List<LeaveItemVO> list = leaveItemSendVO.getList();

        int iSendRowCnt = 0;
        List<LeaveItemVO> sendList = new ArrayList<LeaveItemVO>();
        for(LeaveItemVO leaveItemVO : list){
            //List<FileItemVO> fileItems = fileMgrService.selectFileItemsByFileDocNo(leaveItemVO.getFileDocNo());

            //for(FileItemVO fileItemVO : fileItems){
                /*첨부파일 확인 일단 패스[주원]
                filePath = uploadPath + fileItemVO.getFileData();
                File file = null;
                if(!StringUtil.isEmpty(filePath)){
                    file = new File(filePath);
                 여기까지*/

                    /*String fileName = file.getName();
                    file.createNewFile();

                    BufferedWriter out = new BufferedWriter(new FileWriter(file));
                    out.write(file.getName());
                    out.close();

                    file.getParentFile().mkdirs();
                    file.createNewFile();
*/                /*첨부파일 확인 일단 패스[주원]    }

                //if(file != null && file.isFile() && file.isDirectory()){//file is Exist and directory is exist

                if(file != null){//file is Exist and directory is exist
                    byte[] src = FileUtils.readFileToByteArray(file);

                    String encodeToString = Base64Utils.encodeToString(src);

                    leaveItemVO.setFileDataContBase64(encodeToString);
                    BufferedImage originalImage = ImageIO.read(file);

                    if(originalImage != null){
                        leaveItemVO.setFileWidth(String.valueOf(originalImage.getWidth()));
                        leaveItemVO.setFileHeight(String.valueOf(originalImage.getHeight()));
                        leaveItemVO.setFileName(fileItemVO.getFileNm());
                    }
                } 여기까지*/
            //}

            sendList.add(leaveItemVO);
            iSendRowCnt++;
        }

        //Send Leave Interface Item
        try{
            leaveItemInterfaceService.multiLeaveItemSend(sendList);
        }catch(Exception ex){
            throw ex;
        }

        return true;
    }

    @RequestMapping(value = "/par/cpm/leaveItem/multiLeaveItemsSendAll.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiLeaveItemsSendAll(
            @RequestBody LeaveItemSendVO leaveItemSendVO
            ,HttpServletRequest request
            ) throws Exception {

        String filePath = null;
        String uploadPath = request.getServletContext().getInitParameter("FILE_UPLOAD_PATH");

        List<LeaveItemVO> list = null;

        if(leaveItemSendVO.getSendAllFlag().equals("Y")){//전체전송 시 DB 방치품 데이타 전체 조회
            LeaveItemSearchVO searchVO = new LeaveItemSearchVO();
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            searchVO.setsPltCd(LoginUtil.getPltCd());
            searchVO.setsNonMovingFlg("Y");//방차품여부 Y
            searchVO.setsBpCd("A10AA001");//BMP코드

            list = leaveItemService.selectLeaveItemsByCondition(searchVO);
        }

        int iSendRowCnt = 0;
        List<LeaveItemVO> sendList = new ArrayList<LeaveItemVO>();
        for(LeaveItemVO leaveItemVO : list){
            List<FileItemVO> fileItems = fileMgrService.selectFileItemsByFileDocNo(leaveItemVO.getFileDocNo());

            for(FileItemVO fileItemVO : fileItems){
                filePath = uploadPath + fileItemVO.getFileData();
                File file = null;
                if(!StringUtil.isEmpty(filePath)){
                    file = new File(filePath);

                }

                if(file != null && file.isFile() && file.isDirectory()){//file is Exist and directory is exist
                    byte[] src = FileUtils.readFileToByteArray(file);
                    leaveItemVO.setFileDataContBase64(Base64Utils.encodeToString(src));
                    BufferedImage originalImage = ImageIO.read(file);

                    leaveItemVO.setFileWidth(String.valueOf(originalImage.getWidth()));
                    leaveItemVO.setFileHeight(String.valueOf(originalImage.getHeight()));
                    leaveItemVO.setFileName(fileItemVO.getFileNm());
                }
            }

            sendList.add(leaveItemVO);
            iSendRowCnt++;
        }

        //Send Leave Interface Item
        try{
            leaveItemInterfaceService.multiLeaveItemSend(sendList);
        }catch(Exception ex){
            throw ex;
        }

        return true;
    }

}
