package com.dcconnect.pmm.domain.model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
@Table(name = "measurement_validation")
public class MeasurementValidation {

    @EqualsAndHashCode.Include
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "verified", nullable = false)
    private boolean verified;

    @Column(name = "reason_not_verified")
    private String reasonNotVerified;

    @OneToOne(mappedBy = "measurementValidation", orphanRemoval = true)
    private ConstructionMeasurement constructionMeasurement;

}