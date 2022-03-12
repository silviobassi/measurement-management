package com.dcconnect.pmm.domain.model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
@Table(name = "construction_measurement")
public class ConstructionMeasurement{

    @EqualsAndHashCode.Include
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "discrimination", nullable = false)
    private String discrimination;

    @Column(name = "quantity", nullable = false, precision = 19, scale = 2)
    private BigDecimal quantity;

    @Column(name = "unity_value", nullable = false, precision = 19, scale = 2)
    private BigDecimal unityValue;

    @ManyToMany
    @JoinTable(name = "construction_measurement_categories",
            joinColumns = @JoinColumn(name = "construction_measurement_id"),
            inverseJoinColumns = @JoinColumn(name = "categories_id"))
    private Set<Category> categories = new LinkedHashSet<>();

    @OneToOne(orphanRemoval = true)
    @JoinColumn(name = "measurement_execution_id")
    private MeasurementExecution measurementExecution;

    @OneToOne(orphanRemoval = true)
    @JoinColumn(name = "measurement_validation_id")
    private MeasurementValidation measurementValidation;

    @Enumerated(EnumType.STRING)
    @Column(name = "measurement_unity", nullable = false)
    private MeasurementUnity measurementUnity;

    @ManyToOne
    @JoinColumn(name = "withdrawals_id")
    private WithDraw withdrawals;

}