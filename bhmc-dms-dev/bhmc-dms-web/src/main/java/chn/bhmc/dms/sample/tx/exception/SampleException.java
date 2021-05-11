package chn.bhmc.dms.sample.tx.exception;

public class SampleException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5586026828089874117L;
	
	public SampleException(String errorMessage){
		super(errorMessage);
	}

}
