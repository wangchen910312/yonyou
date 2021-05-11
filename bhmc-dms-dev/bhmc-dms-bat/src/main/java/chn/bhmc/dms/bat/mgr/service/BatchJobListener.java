package chn.bhmc.dms.bat.mgr.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.JobListener;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;

import chn.bhmc.dms.bat.mgr.vo.BatchResultVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * 프로그램 명 : JobListener 구현 클래스
 * 프로그램 개요 :
 * 비고 :
 * 개정이력 : 2015-07-28 (한강석), V1.0, 최초작성
 *
 * @author 한강석
 * @version 1.0
 * @see
 *
 */
public class BatchJobListener implements JobListener {

	private static final Logger logger = LoggerFactory.getLogger(BatchJobListener.class);

	/**
	 * 배치결과 서비스
	 */
	private BatchResultService batchResultService;

    /**
     * 배치결과 ID 생성 서비스
     */
	private EgovIdGnrService idGenService;

	/**
	 * 메세지소스
	 */
	private MessageSource messageSource;


	public void setBatchResultService(BatchResultService batchResultService) {
		this.batchResultService = batchResultService;
	}

	public void setIdGenService(EgovIdGnrService idGenService) {
		this.idGenService = idGenService;
	}

	/**
     * @param messageSource the messageSource to set
     */
    public void setMessageSource(MessageSource messageSource) {
        this.messageSource = messageSource;
    }

    /**
     * Job Listener 이름을 리턴한다.
     * @see org.quartz.JobListener#getName()
     */
	public String getName() {
		return this.getClass().getName();
	}

	/**
	 * Batch 작업을 실행하기전에 Batch 결과정보를 등록한다.
	 *
	 * @param jobContext JobExecutionContext
	 * @see org.quartz.JobListener#jobToBeExecuted(JobExecutionContext jobContext)
	 */
	public void jobToBeExecuted(JobExecutionContext jobContext) {

		BatchResultVO batchResult = new BatchResultVO();
		JobDataMap dataMap = jobContext.getJobDetail().getJobDataMap();
		SimpleDateFormat formatter = new SimpleDateFormat ( "yyyyMMddHHmmss", Locale.getDefault());

		try {

			batchResult.setBatRsltId(this.idGenService.getNextStringId());
			batchResult.setBatScheduleId(dataMap.getString("batScheduleId"));
			batchResult.setBatOperId(dataMap.getString("batOperId"));
			batchResult.setBatParamVal(dataMap.getString("batParamVal"));
			batchResult.setBatOperRsltCd(BatchResultVO.BATCH_STATUS_PROCESSING);	//배치실행중
			batchResult.setBatStartTm(formatter.format(new Date()));

			batchResultService.insertBatchResult(batchResult);

			jobContext.put("batRsltId", batchResult.getBatRsltId());

		} catch (Exception e) {
		    logger.error(messageSource.getMessage("global.err.jobToBeExecuted", new String[]{batchResult.getBatOperId(), batchResult.getBatScheduleId(), e.getMessage()}, LocaleContextHolder.getLocale()));
		}

	}

	/**
	 * Batch 작업을 완료한후 Batch 결과를 업데이트한다.
	 *
	 * @param jobContext JobExecutionContext
	 * @see org.quartz.JobListener#jobWasExecuted(JobExecutionContext jobContext)
	 */
	public void jobWasExecuted(JobExecutionContext jobContext, JobExecutionException jee) {

		BatchResultVO batchResult = new BatchResultVO();
		JobDataMap dataMap = jobContext.getJobDetail().getJobDataMap();
		SimpleDateFormat formatter = new SimpleDateFormat ( "yyyyMMddHHmmss", Locale.getDefault());

		try {

			batchResult.setBatRsltId((String)jobContext.get("batRsltId"));
			batchResult.setBatScheduleId(dataMap.getString("batScheduleId"));
			batchResult.setBatOperId(dataMap.getString("batOperId"));
			batchResult.setBatParamVal(dataMap.getString("batParamVal"));
			batchResult.setBatEndTm(formatter.format(new Date()));

			// 수행중 exception이 발생한 경우
            if (jee != null) {

                String errorMessage = resolveErrorMessage(jee, 5);

                batchResult.setBatOperRsltCd(BatchResultVO.BATCH_STATUS_FAIL);     //배치실행 실패
                batchResult.setErrMesgTxt(errorMessage);
                logger.error(messageSource.getMessage("global.err.jobWasExecuted", new String[]{batchResult.getBatOperId(), batchResult.getBatScheduleId(), errorMessage}, LocaleContextHolder.getLocale()));
            } else {
                batchResult.setBatOperRsltCd(BatchResultVO.BATCH_STATUS_SUCCESS);   //배치실행 성공
            }
/*
			if (jobContext.getResult() != null) {
				jobResult = (Integer) jobContext.getResult();
			}

			// 배치작업 성공.
			if (jobResult == 0) {
				batchResult.setBatOperRsltCd(BatchResultVO.BATCH_STATUS_SUCCESS);	//배치실행 성공

			// 배치작업 실패
			} else {
				batchResult.setBatOperRsltCd(BatchResultVO.BATCH_STATUS_FAIL);		//배치실행 실패
				batchResult.setErrMesgTxt("배치작업이 결과값 [" + jobResult + "]를 리턴했습니다. \n" + "배치프로그램 [" + dataMap.getString("batPrgmNm") + "]의 로그를 확인하세요");
			}

			// 수행중 exception이 발생한 경우
			if (jee != null) {
				String errorMessage = batchResult.getErrMesgTxt();
				batchResult.setBatOperRsltCd(BatchResultVO.BATCH_STATUS_FAIL);
				batchResult.setErrMesgTxt(errorMessage + "\n\n" + jee.getMessage());
				logger.error(jee.getMessage());
			}
*/
			this.batchResultService.updateBatchResult(batchResult);

		} catch (Exception e) {
		    logger.error(messageSource.getMessage("global.err.jobWasExecuted", new String[]{batchResult.getBatOperId(), batchResult.getBatScheduleId(), e.getMessage()}, LocaleContextHolder.getLocale()));
		}
	}


	/**
	 * Batch 작업을 실행한 후에 Batch결과 '에러'상태로 저장한다.
	 *
	 * @param jobContext JobExecutionContext
	 *
	 * @see org.quartz.JobListener#jobExecutionVetoed(JobExecutionContext jobContext)
	 */
	public void jobExecutionVetoed(JobExecutionContext jobContext) {

		BatchResultVO batchResult = new BatchResultVO();
		JobDataMap dataMap = jobContext.getJobDetail().getJobDataMap();
		SimpleDateFormat formatter = new SimpleDateFormat ( "yyyyMMddHHmmss", Locale.getDefault());

		String jobExecutionVetoedMsg = messageSource.getMessage("global.err.jobExecutionVetoed", null, LocaleContextHolder.getLocale());
		logger.error(messageSource.getMessage("global.err.jobToBeExecuted", new String[]{batchResult.getBatOperId(), batchResult.getBatScheduleId(), jobExecutionVetoedMsg}, LocaleContextHolder.getLocale()));

		try {

			batchResult.setBatRsltId((String)jobContext.get("batRsltId"));
			batchResult.setBatScheduleId(dataMap.getString("batScheduleId"));
			batchResult.setBatOperId(dataMap.getString("batOperId"));
			batchResult.setBatParamVal(dataMap.getString("batParamVal"));
			batchResult.setBatOperRsltCd(BatchResultVO.BATCH_STATUS_FAIL);
			batchResult.setErrMesgTxt(jobExecutionVetoedMsg);
			batchResult.setBatEndTm(formatter.format(new Date()));

			this.batchResultService.updateBatchResult(batchResult);

		} catch (Exception e) {
		    logger.error(messageSource.getMessage("global.err.jobToBeExecuted", new String[]{batchResult.getBatOperId(), batchResult.getBatScheduleId(), e.getMessage()}, LocaleContextHolder.getLocale()));
		}

	}

	/**
	 * 배치결과 에러메세지 추출
	 * @param cause
	 * @param maxDepth
	 * @return
	 */
	private String resolveErrorMessage(Throwable cause, int maxDepth) {

	    Throwable e = cause.getCause();
	    if(maxDepth <= 0 || e == null){
	        return cause.getMessage();
	    }

	    return resolveErrorMessage(e, --maxDepth);
	}
}