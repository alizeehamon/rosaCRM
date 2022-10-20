package com.example.rosacrm.enumeration;

public enum ProspectionStatus {
    ALL_PROSPECTION_STATUS("All prospection status"), NOT_STARTED("Not started"), IN_PROGRESS("In progress"), TO_CONTACT("To contact"), OVER("Over");
    private String value;

    ProspectionStatus(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

}
