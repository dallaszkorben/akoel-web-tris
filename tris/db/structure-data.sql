--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = true;

--
-- Name: accomodation; Type: TABLE; Schema: public; Owner: tris; Tablespace: 
--

CREATE TABLE accomodation (
    id bigint NOT NULL,
    name character varying(30),
    lat double precision,
    long double precision,
    date_start date,
    date_end date
);


ALTER TABLE public.accomodation OWNER TO tris;

--
-- Name: position_id_seq; Type: SEQUENCE; Schema: public; Owner: tris
--

CREATE SEQUENCE position_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.position_id_seq OWNER TO tris;

--
-- Name: position_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tris
--

ALTER SEQUENCE position_id_seq OWNED BY accomodation.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tris
--

ALTER TABLE ONLY accomodation ALTER COLUMN id SET DEFAULT nextval('position_id_seq'::regclass);


--
-- Data for Name: accomodation; Type: TABLE DATA; Schema: public; Owner: tris
--

INSERT INTO accomodation VALUES (1, 'Berkenye', 47.8924870000000027, 19.0730280000000008, '2010-12-27', '2010-12-29');
INSERT INTO accomodation VALUES (2, 'Hollókő', 47.9984859999999998, 19.5936020000000006, '2012-12-27', '2012-12-28');


--
-- Name: position_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tris
--

SELECT pg_catalog.setval('position_id_seq', 2, true);


--
-- Name: unique_lat_long; Type: CONSTRAINT; Schema: public; Owner: tris; Tablespace: 
--

ALTER TABLE ONLY accomodation
    ADD CONSTRAINT unique_lat_long UNIQUE (lat, long);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: accomodation; Type: ACL; Schema: public; Owner: tris
--

REVOKE ALL ON TABLE accomodation FROM PUBLIC;
REVOKE ALL ON TABLE accomodation FROM tris;
GRANT ALL ON TABLE accomodation TO tris;


--
-- PostgreSQL database dump complete
--

