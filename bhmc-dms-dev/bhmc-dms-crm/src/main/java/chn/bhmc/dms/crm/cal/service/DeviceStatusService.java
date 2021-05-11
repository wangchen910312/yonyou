package chn.bhmc.dms.crm.cal.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import able.com.util.fmt.StringUtil;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import chn.bhmc.dms.crm.cal.vo.CallCenterDeviceVO;

public class DeviceStatusService {

    Logger logger = LoggerFactory.getLogger(DeviceStatusService.class);
    private static DeviceStatusService mDeviceStatus = null;

    // call 정보
    private static HashMap<String, CallCenterDeviceVO> callReceiveMap = new HashMap<String, CallCenterDeviceVO>();

    private Map<String, Channel> mChannel = new HashMap<String, Channel>();

    public class Channel {

        private String callIBSeq            = "";   // ibSeq        - IB 콜시퀀스
        private String callOBSeq            = "";   // obSeq        - OB 콜시퀀스
        private String callStatCd           = "";   // event_type   - 상태코드
        private String callHisLineNo        = "";   // line         - 디바이스 line No
        private String callDeviceId         = "";   // device_id    - 디바이스 id
        private String callDeviceIpNo       = "";   // device_Ip    - 디바이스에 연결된 client ip
        private String callTelNo            = "";   // caller       - IB / OB 전화번호
        private String callRingCnt          = "";   // RingCnt      - IB 벨 카운트
        private String callDevicePortVal    = "";   // device_port  - 디바이스 포트
        private String callPassHm           = "";   // duration     - 통화 시간 ( 초 )
        private String callHm               = "";   // TimeLong     - 통화 시간 ( 초 )
        private String callFileNm           = "";   // FilePath     - 업로드 파일 명
        private String callStartDtStr       = "";   // date         - 통화  시간 ( yyyy-mm-dd hh:mm:ss )
        private String callViewId           = "";   // viewId       - 콜센터 담당자 화면 설정
        private String dlrCd                = "";   // 딜러코드             -
        private String userId               = "";   // userId

        public void updateStatus(HttpServletRequest request) {

            try {

                if ( null != request.getParameter("ibseq") ) {
                    callIBSeq = request.getParameter("ibseq");
                } else {
                    callIBSeq = "";
                }

                if ( null != request.getParameter("obseq") ) {
                    callOBSeq = request.getParameter("obseq");
                } else {
                    callOBSeq = "";
                }

                if ( null != request.getParameter("event_type") ) {
                    callStatCd = request.getParameter("event_type");
                } else {
                    callStatCd = "";
                }

                if ( null != request.getParameter("line") ) {
                    callHisLineNo = request.getParameter("line");
                } else {
                    callHisLineNo = "";
                }

                if ( null != request.getParameter("device_id") ) {
                    callDeviceId = request.getParameter("device_id");
                } else {
                    callDeviceId = "";
                }

                if ( null != request.getParameter("device_ip") ) {
                    callDeviceIpNo = request.getParameter("device_ip");
                } else {
                    callDeviceIpNo = "";
                }

                if ( null != request.getParameter("caller") ) {
                    callTelNo = request.getParameter("caller");
                } else {
                    callTelNo = "";
                }

                if ( null != request.getParameter("RingCnt") ) {
                    callRingCnt = request.getParameter("RingCnt");
                } else {
                    callRingCnt = "";
                }

                if ( null != request.getParameter("device_port") ) {
                    callDevicePortVal = request.getParameter("device_port");
                } else {
                    callDevicePortVal = "";
                }

                if ( null != request.getParameter("duration") ) {
                    callPassHm = request.getParameter("duration");
                } else {
                    callPassHm = "";
                }

                if ( null != request.getParameter("TimeLong") ) {
                    callHm = request.getParameter("TimeLong");
                } else {
                    callHm = "";
                }

                if ( null != request.getParameter("FilePath") ) {
                    callFileNm = request.getParameter("FilePath");
                } else {
                    callFileNm = "";
                }

                if ( null != request.getParameter("date") ) {
                    callStartDtStr = request.getParameter("date");
                } else {
                    callStartDtStr = "";
                }

                if ( null != request.getParameter("viewid") ) {
                    callViewId = request.getParameter("viewid");
                } else {
                    callViewId = "";
                }

                if ( null != request.getParameter("dlrCd") ) {
                    dlrCd = request.getParameter("dlrCd");
                } else {
                    dlrCd = "";
                }

                if ( null != request.getParameter("userId") ) {
                    userId = request.getParameter("userId");
                } else {
                    userId = "";
                }

            } catch(Exception e) {
                e.printStackTrace();
            }
        }

    }


    /**
     * 디바이스 상태를 계속 return 해준다.
     *
     * @return
     */
    public synchronized DeviceStatusService getInstance() {
        if ( mDeviceStatus == null ) {
            mDeviceStatus = new DeviceStatusService();
        }
        return mDeviceStatus;
    }

    /**
     * 디바이스 상태를 업데이트 한다.
     * @param : request
     * @return
     */
    public CallCenterDeviceVO httpRequest(HttpServletRequest request) {

        CallCenterDeviceVO saveVO = new CallCenterDeviceVO();

        try {

            // line param 필수로 받아야함. 안그러면.. For input string: "undefined" 에러남.. 해당부분 예외처리 해야함.
            String callHisLineNo = request.getParameter("line");

            if ( callHisLineNo != null ) {

                synchronized (mChannel) {

                    if ( !mChannel.containsKey(callHisLineNo) ) {
                        mChannel.put(callHisLineNo, new Channel());
                    }

                    // 상태 업데이트 - 아이피 확인후 해당 아이피 map에다가 변경된 상태를 담는다.

                    String mapPutId = request.getParameter("userId");

//                    if ( request.getRemoteAddr().equals(mapPutId) ) {
                        mChannel.get(callHisLineNo).updateStatus(request);

                        //EXE 상태 변화에 따라서 DB INSERT 시작
                        String callRingCnt = mChannel.get(callHisLineNo).callRingCnt;
                        int RingCntNum;
                        if (StringUtil.isEmpty(callRingCnt) ) {
                            RingCntNum = 0;
                        } else {
                            RingCntNum = Integer.parseInt(callRingCnt);
                        }

                        String callDevicePortVal = mChannel.get(callHisLineNo).callDevicePortVal;
                        int callDevicePortValNum;
                        if (StringUtil.isEmpty(callDevicePortVal) ) {
                            callDevicePortValNum = 0;
                        } else {
                            callDevicePortValNum = Integer.parseInt(callDevicePortVal);
                        }

                        saveVO.setCallIBSeq(mChannel.get(callHisLineNo).callIBSeq);
                        saveVO.setCallOBSeq(mChannel.get(callHisLineNo).callOBSeq);
                        saveVO.setCallStatCd(mChannel.get(callHisLineNo).callStatCd);
                        saveVO.setCallHisLineNo(Integer.parseInt(callHisLineNo));
                        saveVO.setCallDeviceId(mChannel.get(callHisLineNo).callDeviceId);
                        saveVO.setCallDeviceIpNo(mChannel.get(callHisLineNo).callDeviceIpNo);
                        saveVO.setCallTelNo(mChannel.get(callHisLineNo).callTelNo);
                        saveVO.setCallRingCnt(RingCntNum);
                        saveVO.setCallDevicePortVal(callDevicePortValNum);
                        saveVO.setCallPassHm(mChannel.get(callHisLineNo).callPassHm);
                        saveVO.setCallHm(mChannel.get(callHisLineNo).callHm);
                        saveVO.setCallFileNm(mChannel.get(callHisLineNo).callFileNm);
                        saveVO.setCallViewId(mChannel.get(callHisLineNo).callViewId);
                        saveVO.setDlrCd(mChannel.get(callHisLineNo).dlrCd);
                        saveVO.setUserId(mChannel.get(callHisLineNo).userId);
                        String callStartDtStr = mChannel.get(callHisLineNo).callStartDtStr;

                        if ( StringUtils.isNotEmpty(callStartDtStr)) {

                            Date callStartDt = new Date();
                            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");  // 콜센터프로그램에서 해당 포맷으로 전송해줌.
                            try {
                                callStartDt = sdf.parse(callStartDtStr);
                            } catch (Exception e) {
                                e.printStackTrace();
                            };
                            saveVO.setCallStartDt(callStartDt);

                        }
                        //EXE 상태 변화에 따라서 DB INSERT 종료

                        // MAP 에다가 상태를 담는다.
                        callReceiveMap.put(mapPutId, saveVO);


//                    };

                }
            }


        } catch(Exception e){
            e.printStackTrace();
        }

        return saveVO;
    }

    /**
     * WEB 에서 상태값 확인
     *
     * @return
     */

    public CallCenterDeviceVO getDeviceInfo2(String userId) {

        CallCenterDeviceVO callCenterDeviceVO = new CallCenterDeviceVO();


        if ( StringUtils.isNotEmpty(userId) ) {

            if ( callReceiveMap.get(userId) != null ) {

//                Set<String> set = callReceiveMap.keySet();
//                for(String key : set){
//                }

                callCenterDeviceVO.setCallIBSeq(callReceiveMap.get(userId).getCallDeviceIpNo());
                callCenterDeviceVO.setCallIBSeq(callReceiveMap.get(userId).getCallIBSeq());
                callCenterDeviceVO.setCallOBSeq(callReceiveMap.get(userId).getCallOBSeq());
                callCenterDeviceVO.setCallStatCd(callReceiveMap.get(userId).getCallStatCd());
                callCenterDeviceVO.setCallHisLineNo(callReceiveMap.get(userId).getCallHisLineNo());
                callCenterDeviceVO.setCallDeviceId(callReceiveMap.get(userId).getCallDeviceId());
                callCenterDeviceVO.setCallDeviceIpNo(callReceiveMap.get(userId).getCallDeviceIpNo());
                callCenterDeviceVO.setCallTelNo(callReceiveMap.get(userId).getCallTelNo());
                callCenterDeviceVO.setCallRingCnt(callReceiveMap.get(userId).getCallRingCnt());
                callCenterDeviceVO.setCallPassHm(callReceiveMap.get(userId).getCallPassHm());
                callCenterDeviceVO.setCallHm(callReceiveMap.get(userId).getCallHm());
                callCenterDeviceVO.setCallFileNm(callReceiveMap.get(userId).getCallFileNm());
                callCenterDeviceVO.setCallViewId(callReceiveMap.get(userId).getCallViewId());
                callCenterDeviceVO.setDlrCd(callReceiveMap.get(userId).getDlrCd());
                callCenterDeviceVO.setCallStartDt(callReceiveMap.get(userId).getCallStartDt());
                callCenterDeviceVO.setUserId(callReceiveMap.get(userId).getUserId());

            }

        }

        return callCenterDeviceVO;
    }


/*
    public CallCenterDeviceVO getDeviceInfo() {

        CallCenterDeviceVO callCenterDeviceVO = new CallCenterDeviceVO();

        try {

            List<Map.Entry<String,Channel>> mappingList = null;
            synchronized (mChannel) {
                mappingList = new ArrayList<Map.Entry<String,Channel>>(mChannel.entrySet());
            }

            Collections.sort(mappingList,
                    new Comparator<Map.Entry<String, Channel>>() {
                public int compare(Map.Entry<String, Channel> mapping1,
                        Map.Entry<String, Channel> mapping2) {
                    return mapping1.getKey().compareTo(mapping2.getKey());
                }
            });

            String callHisLineNo;       // line
            int lineNum;                // 디바이스라인
            String callRingCnt;         // RingCnt
            int RingCntNum;             // 벨수량

            for (Map.Entry<String, Channel> mapping : mappingList) {

                callHisLineNo = mapping.getValue().callHisLineNo;
                if (StringUtil.isEmpty(callHisLineNo) ) {
                    lineNum = 0;
                } else {
                    lineNum = Integer.parseInt(callHisLineNo);
                }
                callRingCnt = mapping.getValue().callRingCnt;
                if (StringUtil.isEmpty(callRingCnt) ) {
                    RingCntNum = 0;
                } else {
                    RingCntNum = Integer.parseInt(callRingCnt);
                }

                callCenterDeviceVO.setCallIBSeq(mapping.getValue().callIBSeq);
                callCenterDeviceVO.setCallOBSeq(mapping.getValue().callOBSeq);
                callCenterDeviceVO.setCallStatCd(mapping.getValue().callStatCd);
                callCenterDeviceVO.setCallHisLineNo(lineNum);
                callCenterDeviceVO.setCallDeviceId(mapping.getValue().callDeviceId);
                callCenterDeviceVO.setCallDeviceIpNo(mapping.getValue().callDeviceIpNo);
                callCenterDeviceVO.setCallTelNo(mapping.getValue().callTelNo);
                callCenterDeviceVO.setCallRingCnt(RingCntNum);
                callCenterDeviceVO.setCallPassHm(mapping.getValue().callPassHm);
                callCenterDeviceVO.setCallHm(mapping.getValue().callHm);
                callCenterDeviceVO.setCallFileNm(mapping.getValue().callFileNm);
                callCenterDeviceVO.setCallViewId(mapping.getValue().callViewId);
                callCenterDeviceVO.setDlrCd(mapping.getValue().dlrCd);

                String callStartDtStr = mapping.getValue().callStartDtStr;

                if ( StringUtils.isNotEmpty(callStartDtStr)) {

                    Date callStartDt = new Date();
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");  // 콜센터프로그램에서 해당 포맷으로 전송해줌
                    try {
                        callStartDt = sdf.parse(callStartDtStr);
                    } catch (Exception e) {
                        e.printStackTrace();
                    };
                    callCenterDeviceVO.setCallStartDt(callStartDt);

                }

            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return callCenterDeviceVO;
    }
*/
}