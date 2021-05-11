package chn.bhmc.dms.core;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : Constants.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 8. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 23.     Kang Seok Han     최초 생성
 * </pre>
 */

public class Constants {

    /**
     * 시스템 구분
     */
    public static final String SYS_CD_DLR = "D";    //딜러
    public static final String SYS_CD_CORP = "I";   //법인

    /**
     * 회사 구분
     */
    public static final String CMP_TP_DLR = "10";   //딜러
    public static final String CMP_TP_CORP = "20";  //법인

    /**
     * 법인딜러코드
     */
    public static final String DLR_CD_CORP = "A07AA";

    /**
     * 웹모바일 구분
     */
    public static final String WEB_MOBILE_DSTIN_CD_WEB = "W";       //웹
    public static final String WEB_MOBILE_DSTIN_CD_MOBILE = "M";    //모바일
    public static final String WEB_MOBILE_DSTIN_CD_TABLET = "T";    //태블릿

    /**
     * 게시판코드
     */
    public static final String BBS_ID_NOTICE = "BBS201604-000011";  //공지사항
    public static final String BBS_ID_QNA = "BBS201604-000012";     //질의응답
    public static final String BBS_ID_PDS = "BBS201604-000021";     //자료실

    /**
     * 화면-역할/사용자 매핑 참조구분
     */
    public static final String VIEW_AUTH_REF_TP_USER = "U"; //사용자
    public static final String VIEW_AUTH_REF_TP_ROLE = "R"; //역할

    /**
     * 화면유형
     */
    public static final String VIEW_TP_VIEW = "01";     //화면
    public static final String VIEW_TP_BUTTON = "02";   //버튼

    /**
     * 딜러[DMS] 직무코드
     */
    public static final String DMS_TSK_CD_A00 = "A00"; //董事长
    public static final String DMS_TSK_CD_A01 = "A01"; //总经理
    public static final String DMS_TSK_CD_A02 = "A02"; //副总经理
    public static final String DMS_TSK_CD_B10 = "B10"; //销售总监
    public static final String DMS_TSK_CD_B20 = "B20"; //展厅经理
    public static final String DMS_TSK_CD_B21 = "B21"; //金融经理
    public static final String DMS_TSK_CD_B22 = "B22"; //精品经理
    public static final String DMS_TSK_CD_B23 = "B23"; //二手车经理
    public static final String DMS_TSK_CD_B24 = "B24"; //大客户经理
    public static final String DMS_TSK_CD_B25 = "B25"; //计划控制经理
    public static final String DMS_TSK_CD_B30 = "B30"; //销售主管
    public static final String DMS_TSK_CD_B31 = "B31"; //信息主管
    public static final String DMS_TSK_CD_B40 = "B40"; //销售顾问
    public static final String DMS_TSK_CD_B41 = "B41"; //销售助理
    public static final String DMS_TSK_CD_B42 = "B42"; //销售内训师
    public static final String DMS_TSK_CD_B43 = "B43"; //交车专员
    public static final String DMS_TSK_CD_B44 = "B44"; //试乘试驾专员
    public static final String DMS_TSK_CD_B45 = "B45"; //金融专员
    public static final String DMS_TSK_CD_B46 = "B46"; //保险专员
    public static final String DMS_TSK_CD_B47 = "B47"; //二手车评估师
    public static final String DMS_TSK_CD_B48 = "B48"; //二手车专员
    public static final String DMS_TSK_CD_B49 = "B49"; //二手车销售顾问
    public static final String DMS_TSK_CD_B50 = "B50"; //大客户专员
    public static final String DMS_TSK_CD_B51 = "B51"; //库存管理员
    public static final String DMS_TSK_CD_C10 = "C10"; //服务总监
    public static final String DMS_TSK_CD_C20 = "C20"; //服务经理
    public static final String DMS_TSK_CD_C21 = "C21"; //配件经理
    public static final String DMS_TSK_CD_C22 = "C22"; //车间经理(运营)
    public static final String DMS_TSK_CD_C23 = "C23"; //技术经理
    public static final String DMS_TSK_CD_C24 = "C24"; //车间经理(技术)
    public static final String DMS_TSK_CD_C30 = "C30"; //机电主管
    public static final String DMS_TSK_CD_C31 = "C31"; //钣金主管
    public static final String DMS_TSK_CD_C32 = "C32"; //喷漆主管
    public static final String DMS_TSK_CD_C33 = "C33"; //洗车主管
    public static final String DMS_TSK_CD_C40 = "C40"; //服务培训师
    public static final String DMS_TSK_CD_C41 = "C41"; //服务顾问
    public static final String DMS_TSK_CD_C42 = "C42"; //保修索赔专员
    public static final String DMS_TSK_CD_C43 = "C43"; //保险理赔专员
    public static final String DMS_TSK_CD_C44 = "C44"; //预约服务专员
    public static final String DMS_TSK_CD_C45 = "C45"; //配件计划员
    public static final String DMS_TSK_CD_C46 = "C46"; //配件管理员
    public static final String DMS_TSK_CD_C47 = "C47"; //调度员
    public static final String DMS_TSK_CD_C48 = "C48"; //机电技师
    public static final String DMS_TSK_CD_C49 = "C49"; //钣金技师
    public static final String DMS_TSK_CD_C50 = "C50"; //喷漆技师
    public static final String DMS_TSK_CD_C51 = "C51"; //洗车员
    public static final String DMS_TSK_CD_C52 = "C52"; //技术培训师
    public static final String DMS_TSK_CD_C53 = "C53"; //质量检验员
    public static final String DMS_TSK_CD_C54 = "C54"; //设备管理员
    public static final String DMS_TSK_CD_D10 = "D10"; //市场总监

    /**
     * 법인[DCS] 직무코드
     */
     public static final String DCS_TSK_CD_01  = "01"; //总经理
     public static final String DCS_TSK_CD_02  = "02"; //常任副总经理
     public static final String DCS_TSK_CD_05  = "05"; //本部长
     public static final String DCS_TSK_CD_06  = "06"; //副本部长
     public static final String DCS_TSK_CD_07  = "07"; //部长
     public static final String DCS_TSK_CD_08  = "08"; //科长
     public static final String DCS_TSK_CD_09  = "09"; //职员
     public static final String DCS_TSK_CD_10  = "10"; //一般工人
     public static final String DCS_TSK_CD_11  = "11"; //辅助工人
     public static final String DCS_TSK_CD_12  = "12"; //实习生（职员）
     public static final String DCS_TSK_CD_13  = "13"; //实习生（工人）
     public static final String DCS_TSK_CD_14  = "14"; //劳务
     public static final String DCS_TSK_CD_A   = "A"; //总经理
     public static final String DCS_TSK_CD_A01 = "A01"; //管理层
     public static final String DCS_TSK_CD_B   = "B"; //部长
     public static final String DCS_TSK_CD_C   = "C"; //室长
     public static final String DCS_TSK_CD_D   = "D"; //科长
     public static final String DCS_TSK_CD_E   = "E"; //员工

     /**
      * ROOT 화면 ID
      */
     public static final String ROOT_VIEW_ID   = "VIEW_ROOT";

     /**
      * 파일업로드 데이터 폴더명
      */
     public static final String FILE_UPLOAD_DATA_FOLDER_NAME = "Data";
     /**
      * 파일업로드 큐 폴더명
      */
     public static final String FILE_UPLOAD_QUEUE_FOLDER_NAME = "Queue";
     /**
      * 파일업로드 Archive 폴더명
      */
     public static final String FILE_UPLOAD_ARCHIVE_FOLDER_NAME = "Archive";

     /**
      * 시스템설정 속성
      */
     public static final String SYS_PREF_DEFAULT_CURRENCY = "defaultCurrency";                  //기본통화
     public static final String SYS_PREF_CUST_INFO_UPDT_VALID_PRID = "custInfoUpdtValidPrid";   //고객정보 수정 유효기간(일)
     public static final String SYS_PREF_DATE_FORMAT = "dateFormat";                            //날짜 포맷
     public static final String SYS_PREF_TIME_FORMAT = "timeFormat";                            //시간 포맷
     public static final String SYS_PREF_DEFAULT_LANG = "defaultLang";                          //기본 언어
     public static final String SYS_PREF_SUPPORT_LANGS = "supportLangs";                        //지원 언어
     public static final String SYS_PREF_JMS_IP = "jmsIp";                                      //JMS IP
     public static final String SYS_PREF_JMS_PORT = "jmsPort";                                  //JMS Port

     /**
      * 권한
      */
     public static final String PERMISSION_READ = "READ";                                       //READ 권한
     public static final String PERMISSION_SEARCHIND = "SEARCHIND";                             //조회권한(개인)
     public static final String PERMISSION_SEARCHALL = "SEARCHALL";                             //조회권한(전체)

     /**
      * SMS Result Cd
      */
     public static final String SMSSENDRESULTCD_VALIDATEFAIL = "10";

     public static final String USED_CAR_URL = "http://ndms.bhmc.com.cn";
}
