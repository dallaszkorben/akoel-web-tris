--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = true;

--
-- Name: accomodation_type; Type: TABLE; Schema: public; Owner: dbuser; Tablespace: 
--

CREATE TABLE accomodation_type (
    id bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.accomodation_type OWNER TO dbuser;

--
-- Name: accomodation_type_id_seq; Type: SEQUENCE; Schema: public; Owner: dbuser
--

CREATE SEQUENCE accomodation_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accomodation_type_id_seq OWNER TO dbuser;

--
-- Name: accomodation_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbuser
--

ALTER SEQUENCE accomodation_type_id_seq OWNED BY accomodation_type.id;


--
-- Name: accomodations; Type: TABLE; Schema: public; Owner: dbuser; Tablespace: 
--

CREATE TABLE accomodations (
    name character varying NOT NULL,
    address character varying,
    accomodation_type_id bigint NOT NULL,
    "position" double precision[] NOT NULL,
    id bigint NOT NULL
);


ALTER TABLE public.accomodations OWNER TO dbuser;

--
-- Name: accomodations_id_seq; Type: SEQUENCE; Schema: public; Owner: dbuser
--

CREATE SEQUENCE accomodations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accomodations_id_seq OWNER TO dbuser;

--
-- Name: accomodations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbuser
--

ALTER SEQUENCE accomodations_id_seq OWNED BY accomodations.id;


--
-- Name: actual_accomodation; Type: TABLE; Schema: public; Owner: dbuser; Tablespace: 
--

CREATE TABLE actual_accomodation (
    days integer[],
    id bigint NOT NULL,
    excursion_id bigint NOT NULL,
    accomodation_id bigint NOT NULL
);


ALTER TABLE public.actual_accomodation OWNER TO dbuser;

--
-- Name: actual_accomodation_id_seq; Type: SEQUENCE; Schema: public; Owner: dbuser
--

CREATE SEQUENCE actual_accomodation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.actual_accomodation_id_seq OWNER TO dbuser;

--
-- Name: actual_accomodation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbuser
--

ALTER SEQUENCE actual_accomodation_id_seq OWNED BY actual_accomodation.id;


--
-- Name: excursions; Type: TABLE; Schema: public; Owner: dbuser; Tablespace: 
--

CREATE TABLE excursions (
    name character varying NOT NULL,
    date_start date NOT NULL,
    id bigint NOT NULL,
    days integer DEFAULT 1 NOT NULL,
    color character(6)
);


ALTER TABLE public.excursions OWNER TO dbuser;

--
-- Name: excursions_id_seq; Type: SEQUENCE; Schema: public; Owner: dbuser
--

CREATE SEQUENCE excursions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.excursions_id_seq OWNER TO dbuser;

--
-- Name: excursions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbuser
--

ALTER SEQUENCE excursions_id_seq OWNED BY excursions.id;


SET default_with_oids = false;

--
-- Name: tour_type; Type: TABLE; Schema: public; Owner: dbuser; Tablespace: 
--

CREATE TABLE tour_type (
    id bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.tour_type OWNER TO dbuser;

--
-- Name: tour_type_id_seq; Type: SEQUENCE; Schema: public; Owner: dbuser
--

CREATE SEQUENCE tour_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tour_type_id_seq OWNER TO dbuser;

--
-- Name: tour_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbuser
--

ALTER SEQUENCE tour_type_id_seq OWNED BY tour_type.id;


SET default_with_oids = true;

--
-- Name: tours; Type: TABLE; Schema: public; Owner: dbuser; Tablespace: 
--

CREATE TABLE tours (
    tour_type_id bigint NOT NULL,
    "timestamp" timestamp without time zone[],
    route double precision[] NOT NULL,
    excursion_id bigint NOT NULL,
    id bigint NOT NULL,
    day integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.tours OWNER TO dbuser;

--
-- Name: tours_id_seq; Type: SEQUENCE; Schema: public; Owner: dbuser
--

CREATE SEQUENCE tours_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tours_id_seq OWNER TO dbuser;

--
-- Name: tours_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbuser
--

ALTER SEQUENCE tours_id_seq OWNED BY tours.id;


--
-- Name: tours_tour_type_id_seq; Type: SEQUENCE; Schema: public; Owner: dbuser
--

CREATE SEQUENCE tours_tour_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tours_tour_type_id_seq OWNER TO dbuser;

--
-- Name: tours_tour_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbuser
--

ALTER SEQUENCE tours_tour_type_id_seq OWNED BY tours.tour_type_id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY accomodation_type ALTER COLUMN id SET DEFAULT nextval('accomodation_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY accomodations ALTER COLUMN id SET DEFAULT nextval('accomodations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY actual_accomodation ALTER COLUMN id SET DEFAULT nextval('actual_accomodation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY excursions ALTER COLUMN id SET DEFAULT nextval('excursions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY tour_type ALTER COLUMN id SET DEFAULT nextval('tour_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY tours ALTER COLUMN id SET DEFAULT nextval('tours_id_seq'::regclass);


--
-- Name: accomodation_type_name_key; Type: CONSTRAINT; Schema: public; Owner: dbuser; Tablespace: 
--

ALTER TABLE ONLY accomodation_type
    ADD CONSTRAINT accomodation_type_name_key UNIQUE (name);


--
-- Name: accomodation_type_pkey; Type: CONSTRAINT; Schema: public; Owner: dbuser; Tablespace: 
--

ALTER TABLE ONLY accomodation_type
    ADD CONSTRAINT accomodation_type_pkey PRIMARY KEY (id);


--
-- Name: pkey_accomodations; Type: CONSTRAINT; Schema: public; Owner: dbuser; Tablespace: 
--

ALTER TABLE ONLY accomodations
    ADD CONSTRAINT pkey_accomodations PRIMARY KEY (id);


--
-- Name: pkey_actual_accomodation; Type: CONSTRAINT; Schema: public; Owner: dbuser; Tablespace: 
--

ALTER TABLE ONLY actual_accomodation
    ADD CONSTRAINT pkey_actual_accomodation PRIMARY KEY (id);


--
-- Name: pkey_excursions; Type: CONSTRAINT; Schema: public; Owner: dbuser; Tablespace: 
--

ALTER TABLE ONLY excursions
    ADD CONSTRAINT pkey_excursions PRIMARY KEY (id);


--
-- Name: pkey_tours; Type: CONSTRAINT; Schema: public; Owner: dbuser; Tablespace: 
--

ALTER TABLE ONLY tours
    ADD CONSTRAINT pkey_tours PRIMARY KEY (id);


--
-- Name: tour_type_name_key; Type: CONSTRAINT; Schema: public; Owner: dbuser; Tablespace: 
--

ALTER TABLE ONLY tour_type
    ADD CONSTRAINT tour_type_name_key UNIQUE (name);


--
-- Name: tour_type_pkey; Type: CONSTRAINT; Schema: public; Owner: dbuser; Tablespace: 
--

ALTER TABLE ONLY tour_type
    ADD CONSTRAINT tour_type_pkey PRIMARY KEY (id);


--
-- Name: unique_accomodations_position; Type: CONSTRAINT; Schema: public; Owner: dbuser; Tablespace: 
--

ALTER TABLE ONLY accomodations
    ADD CONSTRAINT unique_accomodations_position UNIQUE ("position");


--
-- Name: unique_actual_accomodation_excursions_accomodations_days; Type: CONSTRAINT; Schema: public; Owner: dbuser; Tablespace: 
--

ALTER TABLE ONLY actual_accomodation
    ADD CONSTRAINT unique_actual_accomodation_excursions_accomodations_days UNIQUE (excursion_id, accomodation_id, days);


--
-- Name: unique_tours_excersions_rute; Type: CONSTRAINT; Schema: public; Owner: dbuser; Tablespace: 
--

ALTER TABLE ONLY tours
    ADD CONSTRAINT unique_tours_excersions_rute UNIQUE (excursion_id, route);


--
-- Name: fkey_accomodation_type; Type: FK CONSTRAINT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY accomodations
    ADD CONSTRAINT fkey_accomodation_type FOREIGN KEY (accomodation_type_id) REFERENCES accomodation_type(id);


--
-- Name: fkey_accomodations_actual_accomodation; Type: FK CONSTRAINT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY actual_accomodation
    ADD CONSTRAINT fkey_accomodations_actual_accomodation FOREIGN KEY (accomodation_id) REFERENCES accomodations(id);


--
-- Name: fkey_excursions; Type: FK CONSTRAINT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY tours
    ADD CONSTRAINT fkey_excursions FOREIGN KEY (excursion_id) REFERENCES excursions(id);


--
-- Name: fkey_excursions_actual_accomodation; Type: FK CONSTRAINT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY actual_accomodation
    ADD CONSTRAINT fkey_excursions_actual_accomodation FOREIGN KEY (excursion_id) REFERENCES excursions(id);


--
-- Name: fkey_tour_type_id; Type: FK CONSTRAINT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY tours
    ADD CONSTRAINT fkey_tour_type_id FOREIGN KEY (tour_type_id) REFERENCES tour_type(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;


--
-- Name: excursions; Type: ACL; Schema: public; Owner: dbuser
--

REVOKE ALL ON TABLE excursions FROM PUBLIC;
REVOKE ALL ON TABLE excursions FROM dbuser;
GRANT ALL ON TABLE excursions TO dbuser;
GRANT ALL ON TABLE excursions TO tris;


--
-- PostgreSQL database dump complete
--

