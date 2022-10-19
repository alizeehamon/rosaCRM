package com.example.rosacrm.enumeration;

public enum ProspectionStatus {
    AUCUNE("Aucune"), EN_COURS("En cours"), A_RELANCER("A relancer"), TERMINE("Terminé");

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
