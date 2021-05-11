package chn.bhmc.dms.core.support.camel;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : Body.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 5. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 16.     Kang Seok Han     최초 생성
 * </pre>
 */

@XmlAccessorType(XmlAccessType.FIELD)
public class Body {

    @XmlElement(name="MESSAGE")
    private String jsonMessage;

    @XmlTransient
    private Message message = new Message();

    /**
     * @return the message
     */
    public Message getMessage() {
        return message;
    }

    /**
     * @param message the message to set
     */
    public void setMessage(Message message) {
        this.message = message;
    }


    /**
     * @return the jsonMessage
     */
    public String getJsonMessage() {
        return jsonMessage;
    }

    /**
     * @param jsonMessage the jsonMessage to set
     */
    public void setJsonMessage(String jsonMessage) {
        this.jsonMessage = jsonMessage;
    }



    class Message {

        private List<Map<String, Object>> results = new ArrayList<Map<String, Object>>();

        /**
         * @return the results
         */
        public List<Map<String, Object>> getResults() {
            return results;
        }

        /**
         * @param results the results to set
         */
        public void setResults(List<Map<String, Object>> results) {
            this.results = results;
        }


    }


}
