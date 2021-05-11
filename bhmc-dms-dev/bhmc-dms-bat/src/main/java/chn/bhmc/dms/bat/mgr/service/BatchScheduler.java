
package chn.bhmc.dms.bat.mgr.service;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.commons.lang3.StringUtils;
import org.joda.time.DateTimeZone;
import org.quartz.CronScheduleBuilder;
import org.quartz.Job;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.JobKey;
import org.quartz.ObjectAlreadyExistsException;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.spi.JobFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.web.context.ServletContextAware;

import chn.bhmc.dms.bat.mgr.vo.BatchOperVO;
import chn.bhmc.dms.bat.mgr.vo.BatchScheduleSearchVO;
import chn.bhmc.dms.bat.mgr.vo.BatchScheduleVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * 프로그램 명 : 배치실행 클래스
 * 프로그램 개요 :
 * 비고 :
 * 개정이력 : 2015-07-28 (한강석), V1.0, 최초작성
 *
 * @author 한강석
 * @version 1.0
 * @see
 *
 */
public class BatchScheduler implements ServletContextAware {
    private static final Logger logger = LoggerFactory.getLogger(BatchScheduler.class);

    /**
     * 메세지 소스
     */
    private MessageSource messageSource;

    /**
     * 배치스케쥴 관리 서비스
     */
    private BatchScheduleService batchScheduleService;

    /**
     * 배치결과 관리 서비스
     */
    private BatchResultService batchResultService;

    /**
     * 배치결과 ID 생성 서비스
     */
    private EgovIdGnrService idGnrService;

    /**
     * Quartz 스케쥴러
     */
    private Scheduler scheduler;

    /**
     * Job Factory
     */
    private JobFactory jobFactory;

    /**
     * 시작시 배치실행 자동시작 여부를 설정한다.
     */
    private boolean autoStart = true;

    /**
     * ServletContext 파라메터
     */
    Map<String, String> servletContextParams = new HashMap<String, String>();

    /**
     * 배치스케줄러에 batchSchedule 파라미터를 이용하여 Job , Trigger를 Add 한다.
     *
     * @param batchSchedule  배치스케줄러에 등록할 스케줄정보
     * @exception Exception Exception
     */
    public void insertBatchSchedule(BatchScheduleVO batchSchedule) {
        try {
            JobDetail jobDetail = getJobDetail(batchSchedule);

            Trigger trigger = TriggerBuilder.newTrigger()
                    .withIdentity(batchSchedule.getBatScheduleId())
                    .withSchedule(CronScheduleBuilder.cronSchedule(batchSchedule.getCronExpressionTxt()).inTimeZone(DateTimeZone.forID(batchSchedule.getTimezoneId()).toTimeZone()))
                    .forJob(jobDetail.getKey().getName())
                    .build();

            //스케줄러에서 삭제한다.
            if(scheduler.checkExists(jobDetail.getKey())){
                scheduler.deleteJob(jobDetail.getKey());
            }

            //스케줄러에 등록한다.
            if("Y".equals(batchSchedule.getBatEnabledYn())){
                scheduler.scheduleJob(jobDetail, trigger);
            }

        } catch (ObjectAlreadyExistsException e){
            logger.info(messageSource.getMessage("global.err.insertBatchSchedule", new String[]{batchSchedule.getBatOperId(), batchSchedule.getBatScheduleId(), e.getMessage()}, LocaleContextHolder.getLocale()));
        } catch (ClassNotFoundException e){
            logger.error(messageSource.getMessage("global.err.insertBatchSchedule", new String[]{batchSchedule.getBatOperId(), batchSchedule.getBatScheduleId(), e.getMessage()}, LocaleContextHolder.getLocale()));
        } catch (SchedulerException e) {
            logger.error(messageSource.getMessage("global.err.insertBatchSchedule", new String[]{batchSchedule.getBatOperId(), batchSchedule.getBatScheduleId(), e.getMessage()}, LocaleContextHolder.getLocale()));
        } catch (Exception e){
            logger.error(messageSource.getMessage("global.err.insertBatchSchedule", new String[]{batchSchedule.getBatOperId(), batchSchedule.getBatScheduleId(), e.getMessage()}, LocaleContextHolder.getLocale()));
        }
    }

    /**
     * 배치스케줄러에 batchSchedule 파라미터를 이용하여 Job , Trigger를 갱신 한다.
     *
     * @param batchSchedule  배치스케줄러에 갱신할 스케줄정보
     * @exception Exception Exception
     */
    public void updateBatchSchedule(BatchScheduleVO batchSchedule) {
        try {
            JobDetail jobDetail = getJobDetail(batchSchedule);

            Trigger trigger = TriggerBuilder.newTrigger()
                    .withIdentity(batchSchedule.getBatScheduleId())
                    .withSchedule(CronScheduleBuilder.cronSchedule(batchSchedule.getCronExpressionTxt()).inTimeZone(DateTimeZone.forID(batchSchedule.getTimezoneId()).toTimeZone()))
                    .forJob(jobDetail.getKey().getName())
                    .build();

            //스케줄러에서 삭제한다.
            if(scheduler.checkExists(jobDetail.getKey())){
                scheduler.deleteJob(jobDetail.getKey());
            }

            //스케줄러에 등록한다.
            if("Y".equals(batchSchedule.getBatEnabledYn())){
                scheduler.scheduleJob(jobDetail, trigger);
            }

        } catch (SchedulerException e) {
            logger.info(messageSource.getMessage("global.err.updateBatchSchedule", new String[]{batchSchedule.getBatOperId(), batchSchedule.getBatScheduleId(), e.getMessage()}, LocaleContextHolder.getLocale()));
            //throw new RuntimeException(e);
        } catch (ClassNotFoundException e){
            logger.info(messageSource.getMessage("global.err.updateBatchSchedule", new String[]{batchSchedule.getBatOperId(), batchSchedule.getBatScheduleId(), e.getMessage()}, LocaleContextHolder.getLocale()));
            //throw new RuntimeException(e);
        } catch (Exception e){
            logger.error(messageSource.getMessage("global.err.updateBatchSchedule", new String[]{batchSchedule.getBatOperId(), batchSchedule.getBatScheduleId(), e.getMessage()}, LocaleContextHolder.getLocale()));
        }
    }

    /**
     * 배치스케줄러에 batchSchedule 파라미터를 이용하여 Job , Trigger를 삭제한다.
     *
     * @param batchSchedule  배치스케줄러에 삭제할 스케줄정보
     * @exception Exception Exception
     */
    public void deleteBatchSchedule(BatchScheduleVO batchSchedule) {
        try {
            JobKey jobKey = JobKey.jobKey(batchSchedule.getBatScheduleId());

            //스케줄러에서 삭제한다.
            if(scheduler.checkExists(jobKey)){
                scheduler.deleteJob(jobKey);
            }
        } catch (SchedulerException e) {
            logger.info(messageSource.getMessage("global.err.deleteBatchSchedule", new String[]{batchSchedule.getBatOperId(), batchSchedule.getBatScheduleId(), e.getMessage()}, LocaleContextHolder.getLocale()));
            //throw new RuntimeException(e);
        }
    }

    /**
     * 클래스 초기화메소드.
     * 배치스케줄테이블을 읽어서 Quartz 스케줄러를 초기화한다.
     *
     */
    public void init() throws Exception {
        //스케쥴러 등록
        SchedulerFactory schedulerFactory = new org.quartz.impl.StdSchedulerFactory("quartz.properties");
        scheduler = schedulerFactory.getScheduler();
        if(jobFactory != null){
        	scheduler.setJobFactory(jobFactory);
        }

        //JobListener 등록
        BatchJobListener listener = new BatchJobListener();
        listener.setBatchResultService(batchResultService);
        listener.setIdGenService(idGnrService);
        listener.setMessageSource(messageSource);

        scheduler.getListenerManager().addJobListener(listener);

        if(isAutoStart()){
            BatchScheduleSearchVO searchVO = new BatchScheduleSearchVO();
            List<BatchScheduleVO> batchScheduleList = (List<BatchScheduleVO>) batchScheduleService.selectBatchSchedulesByCondition(searchVO);

            for(BatchScheduleVO obj : batchScheduleList){
            	insertBatchSchedule(obj);
            }

            start();
        }
    }

    @SuppressWarnings("unchecked")
    private Class<? extends Job> getJobClass(BatchScheduleVO batchSchedule) throws ClassNotFoundException{
        Class<? extends Job> cls = null;

        if(batchSchedule.getBatTp().equals(BatchOperVO.BATCH_TYPE_SHELL)){
            cls = BatchShellScriptJob.class;
        }else{
            cls = (Class<? extends Job>) Class.forName(batchSchedule.getBatPrgmNm());
        }

        return cls;
    }

    private JobDetail getJobDetail(BatchScheduleVO batchSchedule) throws ClassNotFoundException {
        JobDetail jobDetail = JobBuilder.newJob(getJobClass(batchSchedule))
        .withIdentity(batchSchedule.getBatScheduleId())
        //.storeDurably()
        .requestRecovery()
        .build();

        jobDetail.getJobDataMap().putAll(servletContextParams);
        jobDetail.getJobDataMap().put("batOperId", batchSchedule.getBatOperId());
        jobDetail.getJobDataMap().put("batScheduleId", batchSchedule.getBatScheduleId());
        jobDetail.getJobDataMap().put("batPrgmNm", batchSchedule.getBatPrgmNm());
        jobDetail.getJobDataMap().put("batParamVal", batchSchedule.getBatParamVal());

        if(batchSchedule.getBatTp().equals(BatchOperVO.BATCH_TYPE_QUARTZJOB)){
            if(!StringUtils.isBlank(batchSchedule.getBatParamVal())){
                String[] params = batchSchedule.getBatParamVal().split(",");

                for(int i=0, j=params.length; i<j; i++){

                    if(params[i].indexOf(":") > 0){
                        String[] keyValues = params[i].split(":");

                        jobDetail.getJobDataMap().put(keyValues[0].trim(), keyValues[1].trim());
                    }
                }
            }
        }

        return jobDetail;
    }

    /**
     * 클래스 destroy메소드.
     * Quartz 스케줄러를 shutdown한다.
     *
     */
    public void destroy() throws Exception {
        shutdown();
    }

    /**
     * @return 스케줄러를 반환한다.
     */
    public Scheduler getScheduler() {
        return scheduler;
    }

    /**
     * 메세지소스 설정
     * @param messageSource the messageSource to set
     */
    public void setMessageSource(MessageSource messageSource) {
        this.messageSource = messageSource;
    }

    /**
     * 배치스케줄 서비스 설정
     * @param batchScheduleService the batchScheduleService to set
     */
    public void setBatchScheduleService(
            BatchScheduleService batchScheduleService) {
        this.batchScheduleService = batchScheduleService;
    }

    /**
     * 배치결과 서비스 설정
     * @param batchResultService the batchResultService to set
     */
    public void setBatchResultService(BatchResultService batchResultService) {
        this.batchResultService = batchResultService;
    }

    /**
     * 배치결과ID 생성서비스 설정
     * @param idGnrService the idGenService to set
     */
    public void setIdGnrService(EgovIdGnrService idGnrService) {
        this.idGnrService = idGnrService;
    }

    /**
     * Job Factory 설정
     * @param jobFactory
     */
    public void setJobFactory(JobFactory jobFactory) {
    	this.jobFactory = jobFactory;
    }

    /**
     * ServletContext 설정
     *
     * @param servletContext
     */
    public void setServletContext(ServletContext servletContext) {
        Enumeration<String> initParameterNames = servletContext.getInitParameterNames();
        while(initParameterNames.hasMoreElements()){
            String paramName = initParameterNames.nextElement();
            servletContextParams.put(paramName, servletContext.getInitParameter(paramName));
        }
    }

    /**
     * 자동배치 실행 시작 여부를 반환한다.
     * @return
     */
    public boolean isAutoStart() {
        return autoStart;
    }

    /**
     * 자동배치 실행 시작 여부를 설정한다.
     * @param autoStart
     */
    public void setAutoStart(boolean autoStart) {
        this.autoStart = autoStart;
    }

    public void start(){
        try {
            if(!this.scheduler.isStarted()){
                this.scheduler.start();
                logger.debug("Quartz scheduler start!!");
            }
        } catch (SchedulerException e) {
            e.printStackTrace();
        }
    }

    public void shutdown(){
        try {
            if(!this.scheduler.isShutdown()){
                this.scheduler.shutdown(true);
                logger.debug("Quartz scheduler shutdown!!");
            }
        } catch (SchedulerException e) {
            e.printStackTrace();
        }
    }
}