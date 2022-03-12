package com.dcconnect.pmm.domain.model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
@Table(name = "person_involved")
public class PersonInvolved {

    @EqualsAndHashCode.Include
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "cpf", nullable = false, unique = true)
    private String cpf;

    @Column(name = "cell_phone", nullable = false, unique = true)
    private String cellPhone;

    @ManyToMany
    @JoinTable(name = "person_involved_property_or_constructions",
            joinColumns = @JoinColumn(name = "person_involved_id"),
            inverseJoinColumns = @JoinColumn(name = "property_or_constructions_id"))
    private Set<PropertyOrConstruction> propertyOrConstructions = new LinkedHashSet<>();

    @Embedded
    private Address address;

}