package chn.bhmc.dms.dply.cmm;

import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintStream;
import java.net.Socket;
import java.text.SimpleDateFormat;
import java.util.Date;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SyncCmdClient.java
 * @Description : Deploy Sync Command Sending & Response Receiving Class
 * @author Kil Hwan Oh
 * @since 2016. 4. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since                 author                  description
 *  ===========    =============    ===========================
 *  2016. 4. 15.        Kil Hwan Oh             First Edited
 * </pre>
 */

public class SyncCmdClient {

    private final static int SYNC_MESSAGE_HEADER_LEN = 83;
    private String strMsgCode  = null;
    private String strDlrCode   = null;
    private String strXmlBody  = null;
    private String strIpaddr = null;
    private String strQueueName = null;
    private int intPort = 0;
    private String strMqUrl = null;
    private String strUser = null;
    private String strPassword = null;
    private Socket clsSocket = null;
    private InputStream clsInPutStream = null;
    private OutputStream clsOutPutStream = null;
    private DataInputStream clsDataInPutStream = null;
    private DataOutputStream clsDataOutPutStream = null;
    private String strResMsg = null;
    private String strReqMsg = null;
    private int intSockTmOut = 0;


    /**
     *
     * Class Constructor Method
     *
     * @param strIpaddr
     * @param intPort
     * @param strMsgCode
     * @param strDlrCode
     * @param strXmlBody
     */
    public SyncCmdClient(String strIpaddr, int intPort, String strMsgCode, String strDlrCode, String strXmlBody) {
        this.strMsgCode = strMsgCode;
        this.strDlrCode = strDlrCode;
        this.strXmlBody = strXmlBody.trim();
        this.strIpaddr = strIpaddr;
        this.intPort = intPort;
    }


    /**
     *
     * Statements
     *
     * @param strIpaddr
     * @param intPort
     * @param strQueueName
     * @param strUser
     * @param strPassword
     * @param strMsgCode
     * @param strXmlBody
     */
    public SyncCmdClient(String strIpaddr, int intPort, String strQueueName, String strUser, String strPassword,String strMsgCode, String strXmlBody) {
        this.strIpaddr = strIpaddr;
        this.intPort = intPort;
        this.strQueueName = strQueueName;
        this.strMqUrl = "tcp://" + strIpaddr + ":" + intPort;
        this.strUser = strUser;
        this.strPassword = strPassword;
        this.strQueueName = strQueueName;
        this.strMsgCode = strMsgCode;
        this.strXmlBody = strXmlBody.trim();
    }


    public String sendSyncCommand(int intSockTmOut) {
        this.intSockTmOut = intSockTmOut;
        Date clsDate = new Date();
        SimpleDateFormat clsDateFormat = new SimpleDateFormat("yyyyMMddhhmmssSSS");
        String strDateTime = clsDateFormat.format(clsDate);

        try {
            // Message Header & Body Setting
            //               MsgCode(5)    Sender(20)                                                      Receiver(20)
            strReqMsg = strMsgCode + String.format("%1$-" + 20 + "s", "ControlServer") + String.format("%1$-" + 20 + "s", strDlrCode) +
            //               TranId(17)     SendReceive DT(14)               XML Body Length(5)                                   XML Body
                             strDateTime + strDateTime.substring(0, 14) + String.format("%07d", strXmlBody.getBytes("UTF-8").length) + strXmlBody;

            // Connect To Deploy Control Server
            if (!connectToServer()) {
                closeSocket();
                return getErrorResMsg("Server Connection Fail ! ");
            }

            // Request Message Sending
            if (!sendReqMessage()) {
                closeSocket();
                return getErrorResMsg("Request Message Sending Fail ! ");
            }


            // Response Message Receiving
            if (!recvResMessage()) {
                closeSocket();
                return getErrorResMsg("Response Message Receiving Fail ! ");
            }


        } catch (Exception e) {
            return getErrorResMsg(getPrintStackTrace(e));
        }

        return strResMsg;
    }



    /**
     *
     * Error Response Message Creation Method
     *
     * @param strErrMsg
     * @return
     */
    public String getErrorResMsg(String strErrMsg) {
        Date clsDate = new Date();
        SimpleDateFormat clsDateFormat = new SimpleDateFormat("yyyyMMddhhmmssSSS");
        String strDateTime = clsDateFormat.format(clsDate);
        String strResMsg = "<?xml version=\"1.0\"?>" +
                         "<deploy>" +
                         "<result>NOK</result>" +
                         "<result_msg>" + strErrMsg + "</result_msg>" +
                         "</deploy>";

        try {
        strResMsg =      strMsgCode + String.format("%1$-" + 20 + "s", "ControlServer") + String.format("%1$-" + 20 + "s", strDlrCode) +
                         strDateTime + strDateTime.substring(0, 14) + String.format("%07d", strResMsg.getBytes("UTF-8").length) + strResMsg;

        } catch (Exception e) {


        }

        return strResMsg;

    }


    /**
     *
     * Server Socket Connection Method
     *
     * @throws Exception
     */
    public boolean connectToServer() {
        // Connecting To Deploy Control Server
        try {
            clsSocket = new Socket(strIpaddr, intPort);
            clsSocket.setSoTimeout(intSockTmOut*2);
            clsInPutStream = clsSocket.getInputStream();
            clsOutPutStream = clsSocket.getOutputStream();
            clsDataInPutStream = new DataInputStream(clsInPutStream);
            clsDataOutPutStream = new DataOutputStream(clsOutPutStream);
        } catch (Exception e) {
            return false;
        }

        return true;
    }


    /**
     *
     * Request Message Send Method
     *
     * @return
     */
    public boolean sendReqMessage() {
        byte    btyReqData[] = null;

        try {
            btyReqData =  new byte[SYNC_MESSAGE_HEADER_LEN + strXmlBody.getBytes("UTF-8").length];
            btyReqData = strReqMsg.getBytes("UTF-8");
            writeOutputSocketStream(clsDataOutPutStream, btyReqData, SYNC_MESSAGE_HEADER_LEN + strXmlBody.getBytes("UTF-8").length , 0);
        } catch (Exception e) {
            return false;
        }

        return true;
    }


    /**
     *
     * Response Message Receive Method
     *
     * @return
     */
    public boolean recvResMessage() {
        byte    btyHeaderData[] = new byte[SYNC_MESSAGE_HEADER_LEN];
        byte    btyBodyData[] = null;
        String   strHeaderData = null;
        String   strBodyData = null;
        int intBodyLen = 0;
        int intReadLen = 0;

        try {
            intReadLen = readInputSocketStream(clsDataInPutStream, btyHeaderData, SYNC_MESSAGE_HEADER_LEN, 0);
            if (intReadLen != SYNC_MESSAGE_HEADER_LEN) {
                return false;
            }

            strHeaderData = new String(btyHeaderData, 0, SYNC_MESSAGE_HEADER_LEN, "UTF-8");
            intBodyLen = Integer.parseInt(strHeaderData.substring(76, 83));
            btyBodyData = new byte[intBodyLen];
            intReadLen = readInputSocketStream(clsDataInPutStream, btyBodyData, intBodyLen, 0);
            if (intReadLen != intBodyLen) {
                return false;
            }

            strBodyData = new String(btyBodyData, 0, intBodyLen, "UTF-8");

            strResMsg = strHeaderData + strBodyData;
        } catch (Exception e) {
            return false;
        }

        return true;

    }


    /**
     *
     * Read Data From Socket InputStream Into Byte Buffer
     *
     * @param in
     * @param bytData
     * @param len
     * @param offset
     * @return
     */
    public int readInputSocketStream(DataInputStream in, byte[] bytData, int len , int offset) {
        int intRcnt = 0;
        int intRvalue = 0;

        try {
            while (intRcnt < len) {
                intRvalue = in.read(bytData, offset+intRcnt, len-intRcnt);

                if (intRvalue == 0) {
                    return -1;
                } else if (intRvalue < 0) {
                    return -1;
                }

                intRcnt += intRvalue;
            }
        } catch (Exception e) {
            return -1;
        }

        return intRcnt;
    }


    /**
    *
    * Write Data Into Socket OutputStream From Byte Buffer
    *
    * @param out
    * @param bytData
    * @param len
    * @param offset
    * @return
    */
    public boolean writeOutputSocketStream(DataOutputStream out, byte[] bytData, int len , int offset) {

        try {
            out.write(bytData, offset, len);
        } catch (Exception e) {
            return false;
        }

        return true;
    }


    /**
     *
     * Socket, Stream Resource Close
     *
     */
    public void closeSocket() {

        try {
            if (clsDataInPutStream != null) clsDataInPutStream.close();
            if (clsDataOutPutStream != null) clsDataOutPutStream.close();
            if (clsInPutStream != null) clsInPutStream.close();
            if (clsOutPutStream != null) clsOutPutStream.close();
            if (clsSocket != null) clsSocket.close();
        } catch (Exception e) {
        }
    }


    /**
    *
    * Error Logging Method
    *
    * @param clsObject
    * @return
    */
    public static String getPrintStackTrace(Object clsObject) {
        ByteArrayOutputStream clsOutStream = new ByteArrayOutputStream();
        PrintStream printStream = new PrintStream(clsOutStream);
        ((Throwable) clsObject).printStackTrace(printStream);

        return clsOutStream.toString();
    }





}
