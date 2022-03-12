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
@Table(name = "property_or_construction")
public class PropertyOrConstruction {

    @EqualsAndHashCode.Include
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "size", nullable = false, precision = 19, scale = 2)
    private BigDecimal size;

    @Enumerated(EnumType.STRING)
    @Column(name = "measurement_unity", nullable = false)
    private MeasurementUnity measurementUnity;

    @Lob
    @Column(name = "description")
    private String description;

    @Column(name = "type", nullable = false)
    private String type;

    @ManyToMany(mappedBy = "propertyOrConstructions")
    private Set<PersonInvolved> personInvolved = new LinkedHashSet<>();

    @Embedded
    private Address address;

}