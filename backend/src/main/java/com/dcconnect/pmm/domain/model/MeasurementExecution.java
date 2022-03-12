package com.dcconnect.pmm.domain.model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.math.BigDecimal;

@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
@Table(name = "measurement_execution")
public class MeasurementExecution {

    @EqualsAndHashCode.Include
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "quantity", nullable = false, precision = 19, scale = 2)
    private BigDecimal quantity;

    @Column(name = "concluded", nullable = false)
    private boolean concluded;

    @Column(name = "reason_not_concluded")
    private String reasonNotConcluded;

    @OneToOne(mappedBy = "measurementExecution", orphanRemoval = true)
    private ConstructionMeasurement constructionMeasurement;

}