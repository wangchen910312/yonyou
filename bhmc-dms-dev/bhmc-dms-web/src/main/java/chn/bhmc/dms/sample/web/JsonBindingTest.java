package chn.bhmc.dms.sample.web;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : JsonBindingTest.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 7. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 28.     Kang Seok Han     최초 생성
 * </pre>
 */

/**
{
   "IsSuccess":true
   ,"Message":"SUCCESS"
   ,"Errors":null
   ,"Data":{
       "UserName":"15510704592"
       ,"RealName":"木木基"
       ,"PhoneNumber":"15510704592"
       ,"IdentityNumber":"513228197805071415"
       ,"Gender":""
       ,"Birthday":""
       ,"Email":"564678981@qq.com"
       ,"Address":""
       ,"BlueMembership_Id":"0000407B-0E6F-4325-B8CB-4FFBE12635D4"
       ,"BlueMembership_No":"16061006826"
       ,"MLevel":"10"
   }
}
*/
//TODO[한강석] 샘플입니다. 삭제대상
public class JsonBindingTest implements Serializable {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6478384850868871102L;

    @JsonProperty("IsSuccess")
    private boolean isSuccess;

    @JsonProperty("Message")
    private String message;

    @JsonProperty("Errors")
    private String errors;

    @JsonProperty("Data")
    private JsonBindingData data;

    public JsonBindingTest(){}

    /**
     * @return the isSuccess
     */
    public boolean isSuccess() {
        return isSuccess;
    }

    /**
     * @param isSuccess the isSuccess to set
     */
    public void setSuccess(boolean isSuccess) {
        this.isSuccess = isSuccess;
    }

    /**
     * @return the message
     */
    public String getMessage() {
        return message;
    }

    /**
     * @param message the message to set
     */
    public void setMessage(String message) {
        this.message = message;
    }

    /**
     * @return the errors
     */
    public String getErrors() {
        return errors;
    }

    /**
     * @param errors the errors to set
     */
    public void setErrors(String errors) {
        this.errors = errors;
    }

    /**
     * @return the data
     */
    public JsonBindingData getData() {
        return data;
    }

    /**
     * @param data the data to set
     */
    public void setData(JsonBindingData data) {
        this.data = data;
    }

}
