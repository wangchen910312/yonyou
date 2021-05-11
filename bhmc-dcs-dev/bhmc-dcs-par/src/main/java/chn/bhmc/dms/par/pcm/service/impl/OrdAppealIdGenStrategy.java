package chn.bhmc.dms.par.pcm.service.impl;

import org.joda.time.LocalDate;

import chn.bhmc.dms.core.support.idgen.AbstractIdGnrStrategyImpl;

public class OrdAppealIdGenStrategy extends AbstractIdGnrStrategyImpl {


    @Override
    public String buildPrefix(String prefix) {
        return "S" + LocalDate.now().toString("yyyyMMdd");
    }

}
