package chn.bhmc.dms.crm.cal.web;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import able.com.util.fmt.StringUtil;
import able.com.web.HController;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.NoSuchMessageException;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import chn.bhmc.dms.cmm.ath.service.ViewInfoService;
import chn.bhmc.dms.cmm.ath.vo.ViewInfoSearchVO;
import chn.bhmc.dms.cmm.ath.vo.ViewInfoVO;
import chn.bhmc.dms.cmm.sci.service.FileMgrService;
import chn.bhmc.dms.core.datatype.DownloadVO;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cal.service.CallCenterDeviceService;
import chn.bhmc.dms.crm.cal.service.DeviceStatusService;
import chn.bhmc.dms.crm.cal.vo.CallCenterDeviceSearchVO;
import chn.bhmc.dms.crm.cal.vo.CallCenterDeviceVO;

/**
 * 콜센터 전화 수신 컨트롤러
 *
 * @author in moon lee
 * @since 2016.10.25.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.10.25         in moon lee            최초 생성
 * </pre>
 */

@RequestMapping("/crm/cal/callCenter")
@Controller
public class CallCenterReceiveController extends HController {

    /**
     * 콜센터 디바이스 상태 확인 서비스
     */
    @Resource(name="callCenterDeviceService")
    CallCenterDeviceService callCenterDeviceService;

    /**
     * 콜센터 디바이스 정보
     */
    @Resource(name="deviceStatusService")
    DeviceStatusService deviceStatusService;

    /**
     * 파일 정보
     */
    @Resource(name="fileMgrService")
    FileMgrService fileMgrService;

    /**
     * View 정보
     */
    @Resource(name="viewInfoService")
    ViewInfoService viewInfoService;

    public List<String> certifyIDList = new ArrayList<String>();        // 콜센터 연결 PC IP저장 리스트

    String recFileId = null;
    int callHisSeq = 0;

    /**
     * 녹음 파일 업로드 - EXE 에서 통화 완료후 해당 URL 로 파일 업로드 실행.
     */
    @RequestMapping(value = "/callReceive.do", method = RequestMethod.POST)
    protected void DeviceDoPost( @RequestParam("files") MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception   {
        try {
            if (!file.isEmpty()) {
                Path path = Paths.get(request.getServletContext().getInitParameter("FILE_UPLOAD_CALLCENTER_PATH"));
                String[] fileNamePart = file.getOriginalFilename().split("-"); //86209574-20161110142419-O-L001-EN-88.mp3

                if(fileNamePart.length > 2){
                    path = path.resolve(DateUtil.getDate(fileNamePart[1].substring(0, 8), "yyyyMMdd", "yyyy/MM/dd"));
                }

                if(!Files.exists(path)){
                    Files.createDirectories(path);
                };

                Files.copy(file.getInputStream(), path.resolve(file.getOriginalFilename()), StandardCopyOption.REPLACE_EXISTING);
                response.getWriter().write("0000");
            }else{
                DeviceDoGet(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 첨부파일을 다운로드 한다.
     * @param callHisSeq, dlrCd
     * @return
     */
    @RequestMapping(value = "/selectRecordFileDownload.do")
    public ModelAndView selectFileDownload(
            @RequestParam("callHisSeq") int callHisSeq,
            @RequestParam("dlrCd") String dlrCd,
            @RequestParam(value="inline", required=false, defaultValue="false") boolean inline,
            HttpServletRequest request) throws Exception {

        ModelAndView mav = new ModelAndView("downloadView");

        CallCenterDeviceSearchVO searchVO = new CallCenterDeviceSearchVO();
        searchVO.setsCallHisSeq(callHisSeq);
        searchVO.setsDlrCd(dlrCd);
        CallCenterDeviceVO vo = callCenterDeviceService.selectCallCenterDeviceByKey(searchVO);

        if ( vo != null ) {

            String fileName = vo.getCallFileNm();
            String uploadPath = request.getServletContext().getInitParameter("FILE_UPLOAD_CALLCENTER_PATH");

            String[] fileNamePart = fileName.split("-"); //86209574-20161110142419-O-L001-EN-88.mp3
            String filePath = null;
            String fileFullPath = null;
            File file = null;
            if(fileNamePart.length > 2){
                filePath = fileNamePart[1].substring(0, 8);
                // TODO 20170330 - 이인문 - String.format %/ 에러나서 기존소스로 대체.
                //fileFullPath = String.format("%/%/%/%/%", uploadPath, filePath.substring(0,4), filePath.substring(4,6), filePath.substring(6,8), vo.getCallFileNm());
                fileFullPath = uploadPath + "\\" + filePath.substring(0,4) + "\\" + filePath.substring(4,6) + "\\" + filePath.substring(6,8)+"\\"+ vo.getCallFileNm();
                if(!StringUtil.isEmpty(fileFullPath)){
                    file = new File(fileFullPath);
                }
            }

            if(file != null && file.exists()){
                DownloadVO downloadVO = new DownloadVO();
                downloadVO.setFileName(fileName);
                downloadVO.setFilePath(fileFullPath);
                downloadVO.setFileSize(file.length());
                downloadVO.setContentType("audio/wav");

                mav.addObject("FILE_INFO", downloadVO);
                mav.addObject("INLINE", inline);
            }
        }

        return mav;
    }

    /**
     * EXE에서 호출하는 URL
     *  > 전화기에 액션이 생길때 ( 전화올때 / 수화기 들때 / 버튼을 누를때 )
     * 호출후 0000 리턴해줘야 EXE 프로그램에서 정상 통신으로 확인.
     */
    @RequestMapping(value = "/callReceive.do", method = RequestMethod.GET)
    protected void DeviceDoGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception  {

        log.debug("device_ip : "+request.getParameter("device_ip"));

//        if ( request.getRemoteAddr().equals(request.getParameter("device_ip"))) {

            log.debug("statUpdate!!");
            CallCenterDeviceVO callCenterDeviceVO = deviceStatusService.getInstance().httpRequest(request);
            log.debug("callCenterDeviceVO : "+callCenterDeviceVO);

            // 콜센터 장비가 연결된 피시를 찾기위해 EXE에서 PARAM 으로 온 아이피를 certifyIDList 에 담는다.
            if ( null != callCenterDeviceVO.getUserId() && null != callCenterDeviceVO.getCallStatCd() ) {

                String certifyID = callCenterDeviceVO.getUserId();

                if ( !certifyIDList.contains(certifyID) ) {
                    certifyIDList.add(certifyID);
                }

                // 콜센터 장비가 종료되면 해당 PC아이피를 인증 목록에서 뺀다.
                if ( "99".equals(callCenterDeviceVO.getCallStatCd()) ) {
                    certifyIDList.remove(certifyID);
                }

            };

            if ( "9".equals(callCenterDeviceVO.getCallStatCd()) || "10".equals(callCenterDeviceVO.getCallStatCd()) || "11".equals(callCenterDeviceVO.getCallStatCd()) ) {
                log.debug("9 / 10 / 11 - 히스토리에 등록!");

                int result = callCenterDeviceService.insertCallCenterHistory(callCenterDeviceVO);
                if ( result == 1 ) {
                    callHisSeq = callCenterDeviceVO.getCallHisSeq();
                    recFileId = callCenterDeviceVO.getCallFileNm();
                };

            };

//        }

        response.getWriter().write("0000");
    }

    /**
     * WEB 에서 디바이스 상태 확인 호출 URL
     */
    @RequestMapping(value = "/callStatus.do", method = RequestMethod.POST)
    @ResponseBody
    public CallCenterDeviceVO doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception {

        String userId = LoginUtil.getUserId();
        String remoteUserId = "";

        CallCenterDeviceVO callCenterDeviceVO = new CallCenterDeviceVO();
        callCenterDeviceVO = deviceStatusService.getInstance().getDeviceInfo2(userId);
        remoteUserId = callCenterDeviceVO.getUserId();

        // URL 호출 PC와 디바이스 PC를 체크하여 호출한 URL에게만 CALL 정보를 리턴.
        if ( userId.equals(remoteUserId) ) {

            // certifyIDList 에 있는 아아피를 가지고 콜센터 장비가 연결되어 있는 PC인지 확인한다.
            if (certifyIDList.size() > 0  ) {

                for (String certifyIDChk : certifyIDList) {
                    if ( certifyIDChk.equals(remoteUserId)) {
                        callCenterDeviceVO.setCallDevicePc(true);
                    }
                }

            }

            if ( callHisSeq > 0 ) {
                callCenterDeviceVO.setCallHisSeq(callHisSeq);
            };
            if ( StringUtils.isNotEmpty(recFileId) ) {
                callCenterDeviceVO.setCallFileNm(recFileId);
            };

        } else {
            // 호출한 PC가 아닌경우는 정보없는상태로 return
            callCenterDeviceVO.setCallHisSeq(0);
            callCenterDeviceVO.setCallStatCd("8");      // callStatCd 8 : 전화 대기 상태임.
            callCenterDeviceVO.setCallFileNm("");
            callCenterDeviceVO.setCallStartDt(null);
            callCenterDeviceVO.setCallTelNo("");
            callCenterDeviceVO.setCallRingCnt(0);
            callCenterDeviceVO.setCallHisLineNo(0);
            callCenterDeviceVO.setCallOBSeq("");
            callCenterDeviceVO.setCallIBSeq("");

        }
        return callCenterDeviceVO;

    }

    /**
     * 화면정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 ViewInfoSearchVO
     * @return
     */
    @RequestMapping(value = "/selectViewInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public ViewInfoVO selectViewInfo(@RequestBody ViewInfoSearchVO searchVO) throws Exception {

        ViewInfoVO viewInfoVO = viewInfoService.selectViewInfoByKey(searchVO.getsViewId());

        if(viewInfoVO != null && StringUtils.isNotEmpty(viewInfoVO.getMesgKey())) {
            try{
                String viewNm = messageSource.getMessage(viewInfoVO.getMesgKey(), null, LocaleContextHolder.getLocale());
                viewInfoVO.setViewNm(viewNm);
            }catch(NoSuchMessageException e){
                log.warn(e.getMessage());
            }

        }

        return viewInfoVO;
    }

}