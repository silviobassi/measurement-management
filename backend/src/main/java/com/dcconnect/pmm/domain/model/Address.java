package com.dcconnect.pmm.domain.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Embeddable
public class Address {
    @Column(name = "cep", nullable = false)
    private String cep;

    @Column(name = "street", nullable = false)
    private String street;

    @Column(name = "number")
    private String number;

    @Column(name = "neighborhood", nullable = false)
    private String neighborhood;

    @Column(name = "complement")
    private String complement;

    @ManyToOne(cascade = CascadeType.ALL, optional = false)
    @JoinColumn(name = "city_id", nullable = false)
    private City city;

}