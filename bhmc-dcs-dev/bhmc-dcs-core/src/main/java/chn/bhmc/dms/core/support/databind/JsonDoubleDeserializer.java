package chn.bhmc.dms.core.support.databind;

import java.io.IOException;

import org.apache.commons.lang3.StringUtils;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;

public class JsonDoubleDeserializer extends JsonDeserializer<Double>  {


	@Override
	public Double deserialize(JsonParser jsonParser, DeserializationContext deserializationContext)
			throws IOException, JsonProcessingException {

	    if(StringUtils.isBlank(jsonParser.getText())){
	        return null;
	    }

        try {    
        	return Double.valueOf(jsonParser.getText().replaceAll(",", ""));            
        } catch (NumberFormatException e) {
            throw new RuntimeException(e);
        }
	}

}
