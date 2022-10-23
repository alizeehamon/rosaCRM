package com.example.rosacrm.enumeration;

import java.util.ArrayList;
import java.util.List;

public enum ProspectionStatus {
    ALL_PROSPECTION_STATUS("All prospection status"), NOT_STARTED("Not started"), IN_PROGRESS("In progress"), TO_CONTACT("To contact"), OVER("Over");
    private String value;

    ProspectionStatus(String value) {
        this.value = value;
    }

    public static List<String> getValues() {
        List<String> values = new ArrayList<>();
        values.add(ALL_PROSPECTION_STATUS.getValue());
        values.add(NOT_STARTED.getValue());
        values.add(IN_PROGRESS.getValue());
        values.add(TO_CONTACT.getValue());
        values.add(OVER.getValue());
        return values;
    }

    public static List<String> getValuesWithoutOver() {
        List<String> values = new ArrayList<>();
        values.add(ALL_PROSPECTION_STATUS.getValue());
        values.add(NOT_STARTED.getValue());
        values.add(IN_PROGRESS.getValue());
        values.add(TO_CONTACT.getValue());
        return values;
    }

    public static List<String> getValuesWithoutAllProspectionStatus() {
        List<String> values = new ArrayList<>();
        values.add(NOT_STARTED.getValue());
        values.add(IN_PROGRESS.getValue());
        values.add(TO_CONTACT.getValue());
        return values;
    }


    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

}
