CREATE TABLE IF NOT EXISTS category
(
    id   BIGINT AUTO_INCREMENT NOT NULL,
    name VARCHAR(255) NOT NULL,
    CONSTRAINT pk_category PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE IF NOT EXISTS city
(
    id       BIGINT AUTO_INCREMENT NOT NULL,
    name     VARCHAR(255) NOT NULL,
    state_id BIGINT       NOT NULL,
    CONSTRAINT pk_city PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE IF NOT EXISTS construction_measurement
(
    id                        BIGINT AUTO_INCREMENT NOT NULL,
    discrimination            VARCHAR(255)   NOT NULL,
    quantity                  DECIMAL(19, 2) NOT NULL,
    unity_value               DECIMAL(19, 2) NOT NULL,
    measurement_execution_id  BIGINT NULL,
    measurement_validation_id BIGINT NULL,
    measurement_unity         VARCHAR(255)   NOT NULL,
    withdrawals_id            BIGINT NULL,
    CONSTRAINT pk_construction_measurement PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE IF NOT EXISTS construction_measurement_categories
(
    categories_id               BIGINT NOT NULL,
    construction_measurement_id BIGINT NOT NULL,
    CONSTRAINT pk_construction_measurement_categories
    PRIMARY KEY (categories_id, construction_measurement_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE IF NOT EXISTS measurement_execution
(
    id                   BIGINT AUTO_INCREMENT NOT NULL,
    quantity             DECIMAL(19, 2) NOT NULL,
    concluded            BIT(1)         NOT NULL,
    reason_not_concluded VARCHAR(255) NULL,
    CONSTRAINT pk_measurement_execution PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE IF NOT EXISTS measurement_validation
(
    id                  BIGINT AUTO_INCREMENT NOT NULL,
    verified            BIT(1) NOT NULL,
    reason_not_verified VARCHAR(255) NULL,
    CONSTRAINT pk_measurement_validation PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE IF NOT EXISTS person_involved
(
    id           BIGINT AUTO_INCREMENT NOT NULL,
    name         VARCHAR(255) NOT NULL,
    cpf          VARCHAR(255) NOT NULL,
    cell_phone   VARCHAR(255) NOT NULL,
    cep          VARCHAR(255) NOT NULL,
    street       VARCHAR(255) NOT NULL,
    number       VARCHAR(255) NULL,
    neighborhood VARCHAR(255) NOT NULL,
    complement   VARCHAR(255) NULL,
    city_id      BIGINT       NOT NULL,
    CONSTRAINT pk_person_involved PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE IF NOT EXISTS person_involved_property_or_constructions
(
    person_involved_id           BIGINT NOT NULL,
    property_or_constructions_id BIGINT NOT NULL,
    CONSTRAINT pk_person_involved_property_or_constructions
    PRIMARY KEY (person_involved_id, property_or_constructions_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE IF NOT EXISTS property_or_construction
(
    id                BIGINT AUTO_INCREMENT NOT NULL,
    size              DECIMAL(19, 2) NOT NULL,
    measurement_unity VARCHAR(255)   NOT NULL,
    `description`     LONGTEXT NULL,
    type              VARCHAR(255)   NOT NULL,
    cep               VARCHAR(255)   NOT NULL,
    street            VARCHAR(255)   NOT NULL,
    number            VARCHAR(255) NULL,
    neighborhood      VARCHAR(255)   NOT NULL,
    complement        VARCHAR(255) NULL,
    city_id           BIGINT         NOT NULL,
    CONSTRAINT pk_property_or_construction PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE IF NOT EXISTS state
(
    id   BIGINT AUTO_INCREMENT NOT NULL,
    name VARCHAR(255) NOT NULL,
    CONSTRAINT pk_state PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE IF NOT EXISTS type
(
    id   BIGINT AUTO_INCREMENT NOT NULL,
    name VARCHAR(255) NOT NULL,
    CONSTRAINT pk_type PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE IF NOT EXISTS withdraw
(
    id    BIGINT AUTO_INCREMENT NOT NULL,
    date  datetime       NOT NULL,
    value DECIMAL(19, 2) NOT NULL,
    note  LONGTEXT NULL,
    CONSTRAINT pk_withdraw PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE person_involved
    ADD CONSTRAINT uc_person_involved_cell_phone
        UNIQUE (cell_phone);

ALTER TABLE person_involved
    ADD CONSTRAINT uc_person_involved_cpf UNIQUE (cpf);

ALTER TABLE city
    ADD CONSTRAINT FK_CITY_ON_STATE
        FOREIGN KEY (state_id) REFERENCES state (id);

ALTER TABLE construction_measurement
    ADD CONSTRAINT FK_CONSTRUCTION_MEASUREMENT_ON_MEASUREMENT_EXECUTION
        FOREIGN KEY (measurement_execution_id) REFERENCES measurement_execution (id);

ALTER TABLE construction_measurement
    ADD CONSTRAINT FK_CONSTRUCTION_MEASUREMENT_ON_MEASUREMENT_VALIDATION
        FOREIGN KEY (measurement_validation_id) REFERENCES measurement_validation (id);

ALTER TABLE construction_measurement
    ADD CONSTRAINT FK_CONSTRUCTION_MEASUREMENT_ON_WITHDRAWALS
        FOREIGN KEY (withdrawals_id) REFERENCES withdraw (id);

ALTER TABLE person_involved
    ADD CONSTRAINT FK_PERSON_INVOLVED_ON_CITY
        FOREIGN KEY (city_id) REFERENCES city (id);

ALTER TABLE property_or_construction
    ADD CONSTRAINT FK_PROPERTY_OR_CONSTRUCTION_ON_CITY
        FOREIGN KEY (city_id) REFERENCES city (id);

ALTER TABLE construction_measurement_categories
    ADD CONSTRAINT fk_construction_measurement_on_category
        FOREIGN KEY (categories_id) REFERENCES category (id);

ALTER TABLE construction_measurement_categories
    ADD CONSTRAINT fk_category_on_construction_measurement
        FOREIGN KEY (construction_measurement_id) REFERENCES construction_measurement (id);

ALTER TABLE person_involved_property_or_constructions
    ADD CONSTRAINT fk_property_or_construction_on_person_involved
        FOREIGN KEY (person_involved_id) REFERENCES person_involved (id);

ALTER TABLE person_involved_property_or_constructions
    ADD CONSTRAINT fk_person_involved_on_property_or_construction
        FOREIGN KEY (property_or_constructions_id) REFERENCES property_or_construction (id);