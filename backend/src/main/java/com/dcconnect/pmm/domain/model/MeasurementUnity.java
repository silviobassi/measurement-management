package com.dcconnect.pmm.domain.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum MeasurementUnity {

    UN("Unidade"),
    ML("Metro Linear"),
    M2("m²"),
    M3("m³");

    private String description;
}
