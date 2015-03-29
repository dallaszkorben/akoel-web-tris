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
    id bigint NOT NULL,
    icon_name character varying
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


--
-- Name: members; Type: TABLE; Schema: public; Owner: dbuser; Tablespace: 
--

CREATE TABLE members (
    id bigint NOT NULL,
    nickname character varying NOT NULL,
    firstname character varying,
    surname character varying
);


ALTER TABLE public.members OWNER TO dbuser;

--
-- Name: members_id_seq; Type: SEQUENCE; Schema: public; Owner: dbuser
--

CREATE SEQUENCE members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.members_id_seq OWNER TO dbuser;

--
-- Name: members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbuser
--

ALTER SEQUENCE members_id_seq OWNED BY members.id;


--
-- Name: musiclinks; Type: TABLE; Schema: public; Owner: dbuser; Tablespace: 
--

CREATE TABLE musiclinks (
    id bigint NOT NULL,
    excursion_id bigint NOT NULL,
    link character varying NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.musiclinks OWNER TO dbuser;

--
-- Name: musiclinks_id_seq; Type: SEQUENCE; Schema: public; Owner: dbuser
--

CREATE SEQUENCE musiclinks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.musiclinks_id_seq OWNER TO dbuser;

--
-- Name: musiclinks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbuser
--

ALTER SEQUENCE musiclinks_id_seq OWNED BY musiclinks.id;


--
-- Name: participants; Type: TABLE; Schema: public; Owner: dbuser; Tablespace: 
--

CREATE TABLE participants (
    excursion_id bigint NOT NULL,
    member_id bigint NOT NULL,
    note character varying,
    id bigint NOT NULL
);


ALTER TABLE public.participants OWNER TO dbuser;

--
-- Name: participants_id_seq; Type: SEQUENCE; Schema: public; Owner: dbuser
--

CREATE SEQUENCE participants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.participants_id_seq OWNER TO dbuser;

--
-- Name: participants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbuser
--

ALTER SEQUENCE participants_id_seq OWNED BY participants.id;


--
-- Name: pictures; Type: TABLE; Schema: public; Owner: dbuser; Tablespace: 
--

CREATE TABLE pictures (
    id bigint NOT NULL,
    title character varying,
    href character varying NOT NULL,
    tour_id bigint,
    accomodation_id bigint,
    participant_id bigint NOT NULL,
    excursion_id bigint NOT NULL
);


ALTER TABLE public.pictures OWNER TO dbuser;

--
-- Name: pictures_id_seq; Type: SEQUENCE; Schema: public; Owner: dbuser
--

CREATE SEQUENCE pictures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pictures_id_seq OWNER TO dbuser;

--
-- Name: pictures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbuser
--

ALTER SEQUENCE pictures_id_seq OWNED BY pictures.id;


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
-- Name: videolinks; Type: TABLE; Schema: public; Owner: dbuser; Tablespace: 
--

CREATE TABLE videolinks (
    id bigint NOT NULL,
    excursion_id bigint NOT NULL,
    link character varying NOT NULL,
    name character varying
);


ALTER TABLE public.videolinks OWNER TO dbuser;

--
-- Name: videolinks_id_seq; Type: SEQUENCE; Schema: public; Owner: dbuser
--

CREATE SEQUENCE videolinks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.videolinks_id_seq OWNER TO dbuser;

--
-- Name: videolinks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbuser
--

ALTER SEQUENCE videolinks_id_seq OWNED BY videolinks.id;


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

ALTER TABLE ONLY members ALTER COLUMN id SET DEFAULT nextval('members_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY musiclinks ALTER COLUMN id SET DEFAULT nextval('musiclinks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY participants ALTER COLUMN id SET DEFAULT nextval('participants_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY pictures ALTER COLUMN id SET DEFAULT nextval('pictures_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY tour_type ALTER COLUMN id SET DEFAULT nextval('tour_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY tours ALTER COLUMN id SET DEFAULT nextval('tours_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY videolinks ALTER COLUMN id SET DEFAULT nextval('videolinks_id_seq'::regclass);


--
-- Name: 21065; Type: BLOB; Schema: -; Owner: dbuser
--

SELECT pg_catalog.lo_create('21065');


ALTER LARGE OBJECT 21065 OWNER TO dbuser;

--
-- Name: 21066; Type: BLOB; Schema: -; Owner: dbuser
--

SELECT pg_catalog.lo_create('21066');


ALTER LARGE OBJECT 21066 OWNER TO dbuser;

--
-- Name: 21067; Type: BLOB; Schema: -; Owner: dbuser
--

SELECT pg_catalog.lo_create('21067');


ALTER LARGE OBJECT 21067 OWNER TO dbuser;

--
-- Data for Name: accomodation_type; Type: TABLE DATA; Schema: public; Owner: dbuser
--

INSERT INTO accomodation_type VALUES (1, 'accomodation.type.guesthouse');
INSERT INTO accomodation_type VALUES (2, 'accomodation.type.hotel');
INSERT INTO accomodation_type VALUES (3, 'accomodation.type.motel');
INSERT INTO accomodation_type VALUES (4, 'accomodation.type.hostel');
INSERT INTO accomodation_type VALUES (5, 'accomodation.type.apartman');
INSERT INTO accomodation_type VALUES (6, 'accomodation.type.house.private');
INSERT INTO accomodation_type VALUES (7, 'accomodation.type.house.rented');
INSERT INTO accomodation_type VALUES (8, 'accomodation.type.caravan.private');
INSERT INTO accomodation_type VALUES (9, 'accomodation.type.caravan.rented');
INSERT INTO accomodation_type VALUES (10, 'accomodation.type.tent.wildcamping');
INSERT INTO accomodation_type VALUES (11, 'accomodation.type.tent.camping');
INSERT INTO accomodation_type VALUES (12, 'accomodation.type.tent.privateproperty');


--
-- Name: accomodation_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('accomodation_type_id_seq', 12, true);


--
-- Data for Name: accomodations; Type: TABLE DATA; Schema: public; Owner: dbuser
--

INSERT INTO accomodations VALUES ('Berkenyei másik ház', 'Szabadság utca 11', 2, '{47.908887,19.0488730000000004}', 3, 'acc_01.png');
INSERT INTO accomodations VALUES ('Berkenyei ház', 'Petöfi Sándor utca 23.', 2, '{47.8924870000000027,19.0730280000000008}', 1, 'acc_03.png');
INSERT INTO accomodations VALUES ('Hollókő 1. ház', 'Kossuth Lajos utca 3.', 2, '{47.9984859999999998,19.5936020000000006}', 2, 'acc_02.png');


--
-- Name: accomodations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('accomodations_id_seq', 3, true);


--
-- Data for Name: actual_accomodation; Type: TABLE DATA; Schema: public; Owner: dbuser
--

INSERT INTO actual_accomodation VALUES ('{1}', 1, 1, 1);
INSERT INTO actual_accomodation VALUES ('{2}', 2, 1, 3);
INSERT INTO actual_accomodation VALUES ('{1,2,3}', 3, 2, 2);


--
-- Name: actual_accomodation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('actual_accomodation_id_seq', 3, true);


--
-- Data for Name: excursions; Type: TABLE DATA; Schema: public; Owner: dbuser
--

INSERT INTO excursions VALUES ('Hollókő', '2012-03-14', 2, 1, '00FF00');
INSERT INTO excursions VALUES ('Berkenye', '2010-12-27', 1, 3, 'FF0000');


--
-- Name: excursions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('excursions_id_seq', 2, true);


--
-- Data for Name: members; Type: TABLE DATA; Schema: public; Owner: dbuser
--

INSERT INTO members VALUES (1, 'Ati', 'Attila', 'Földvárszky');
INSERT INTO members VALUES (2, 'Greg', 'Gergő', 'Havasi');
INSERT INTO members VALUES (3, 'Gréti', 'Gréta', 'Pásztor');
INSERT INTO members VALUES (4, 'Pít', 'Péter', 'Pásztory');
INSERT INTO members VALUES (5, 'Vap', 'Péter', 'Varga');
INSERT INTO members VALUES (6, 'Bence', 'Bence', 'Dani');
INSERT INTO members VALUES (7, 'Évi', 'Éva', 'Hernádi');
INSERT INTO members VALUES (8, 'Alex', 'Alex', 'Hörömpöli');


--
-- Name: members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('members_id_seq', 8, true);


--
-- Data for Name: musiclinks; Type: TABLE DATA; Schema: public; Owner: dbuser
--

INSERT INTO musiclinks VALUES (1, 1, 'https://www.youtube.com/embed/0vZ1Zmsk_l4?enablejsapi=1&version=3&playerapiid=ytplayer&fs=1&wmode=transparent', 'Berkenyei 1. zene');
INSERT INTO musiclinks VALUES (2, 1, 'https://www.youtube.com/embed/G9IA-Rt7lgw?enablejsapi=1&version=3&playerapiid=ytplayer&fs=1&wmode=transparent', 'Berkenye 2. zene');


--
-- Name: musiclinks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('musiclinks_id_seq', 2, true);


--
-- Data for Name: participants; Type: TABLE DATA; Schema: public; Owner: dbuser
--

INSERT INTO participants VALUES (1, 1, 'Atti ott volt Berkenyén', 1);
INSERT INTO participants VALUES (1, 2, 'Greg ott volt berkenyén', 2);
INSERT INTO participants VALUES (1, 4, 'Pít ott volt berkenyén', 3);
INSERT INTO participants VALUES (2, 3, '', 4);
INSERT INTO participants VALUES (2, 4, '', 5);
INSERT INTO participants VALUES (2, 7, '', 6);
INSERT INTO participants VALUES (2, 6, '', 7);
INSERT INTO participants VALUES (2, 5, '', 8);
INSERT INTO participants VALUES (1, 8, '', 11);
INSERT INTO participants VALUES (2, 8, '', 12);


--
-- Name: participants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('participants_id_seq', 12, true);


--
-- Data for Name: pictures; Type: TABLE DATA; Schema: public; Owner: dbuser
--

INSERT INTO pictures VALUES (11, 'Peti', 'pictures/2008_08_15_retyezat2_081.jpg', NULL, NULL, 4, 2);
INSERT INTO pictures VALUES (12, 'Szabi', 'pictures/2008_08_15_retyezat2_122.jpg', NULL, NULL, 4, 2);
INSERT INTO pictures VALUES (13, 'Erdőben', 'pictures/2008_08_15_retyezat2_178.jpg', NULL, NULL, 4, 2);
INSERT INTO pictures VALUES (10, 'Ez itt most nem is tudom micsoda', 'pictures/IMGP3458.JPG', 1, NULL, 3, 1);
INSERT INTO pictures VALUES (8, 'Jó hely', 'pictures/IMGP3468.JPG', 1, NULL, 11, 1);
INSERT INTO pictures VALUES (9, 'Ez egy szép kép', 'pictures/IMGP3448.JPG', 2, NULL, 11, 1);


--
-- Name: pictures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('pictures_id_seq', 13, true);


--
-- Data for Name: tour_type; Type: TABLE DATA; Schema: public; Owner: dbuser
--

INSERT INTO tour_type VALUES (2, 'tour.type.cycling');
INSERT INTO tour_type VALUES (1, 'tour.type.hiking');


--
-- Name: tour_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('tour_type_id_seq', 2, true);


--
-- Data for Name: tours; Type: TABLE DATA; Schema: public; Owner: dbuser
--

INSERT INTO tours VALUES (1, NULL, '{{47.8874276468905009,19.0743684768677007},{47.889585995082399,19.0759348869324015},{47.891571595978597,19.0746688842773011},{47.8927945731362996,19.0703344345092987},{47.8924348769704977,19.0649056434630992},{47.890693912217202,19.0625667572020987},{47.8873844790091994,19.061858654022199},{47.8860030878109981,19.0653562545776012},{47.8868376827320006,19.0717935562134002},{47.8874276468905009,19.0743684768677007}}', 1, 1, 1);
INSERT INTO tours VALUES (1, NULL, '{{47.8922334460262533,19.0776729583740234},{47.8941901706063504,19.0705490112304688},{47.8960317261981672,19.0604209899902344},{47.8985637581955785,19.0440273284912109},{47.902706816187461,19.0325260162353516},{47.9098988377128876,19.0139007568359375},{47.9218641465837862,18.9864349365234375},{47.931526414579757,18.9727020263671875},{47.9462463997866237,18.9699554443359375},{47.9572836383735677,18.97613525390625},{47.9655600203230748,18.9919281005859375},{47.9719962895770564,19.010467529296875},{47.9701574373520216,19.03656005859375},{47.9591229489524622,19.0482330322265625},{47.9494658378870184,19.0447998046875},{47.9490059304364422,19.021453857421875},{47.9411868775918322,19.0097808837890625},{47.9237047177456859,19.0152740478515625},{47.9075974995529137,19.0468597412109375},{47.9025629655636322,19.0577602386474609},{47.8922334460262533,19.0776729583740234}}', 1, 2, 2);


--
-- Name: tours_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('tours_id_seq', 2, true);


--
-- Name: tours_tour_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('tours_tour_type_id_seq', 1, false);


--
-- Data for Name: videolinks; Type: TABLE DATA; Schema: public; Owner: dbuser
--

INSERT INTO videolinks VALUES (2, 2, 'https://www.youtube.com/embed/IMMJerE2EvU?enablejsapi=1&version=3&playerapiid=ytplayer&fs=1&wmode=transparent', 'Mátrai video');
INSERT INTO videolinks VALUES (3, 1, 'https://www.youtube.com/embed/q6e227wHtmI?enablejsapi=1&version=3&playerapiid=ytplayer&fs=1&wmode=transparent', 'Még egy video Berkenyéhez');
INSERT INTO videolinks VALUES (4, 1, 'https://www.youtube.com/embed/9npu0vgEq_A?enablejsapi=1&version=3&playerapiid=ytplayer&fs=1&wmode=transparent', 'Daniken');
INSERT INTO videolinks VALUES (1, 1, 'https://www.youtube.com/embed/dKBbprjADKo?enablejsapi=1&version=3&playerapiid=ytplayer&fs=1&wmode=transparent', 'Retyezáti video');


--
-- Name: videolinks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('videolinks_id_seq', 4, true);


--
-- Data for Name: BLOBS; Type: BLOBS; Schema: -; Owner: 
--

SET search_path = pg_catalog;

BEGIN;

SELECT pg_catalog.lo_open('21065', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000320000001f0806000000a50d9e5900000006624b474400ff00ff00ffa0bda793000000097048597300000b1300000b1301009a9c180000000774494d4507df03160d0710474063390000001974455874436f6d6d656e74004372656174656420776974682047494d5057810e17000010a74944415458c36d98798c25c57dc73f555d7dbd7ef7dce7b2cb5eb32ccb623037c660238483b18d12c718223bce616ce79272285614c952a2fc11c5b2a2c4512c27b16345518c639c98a0601b6230e66681856577d965776766e77cf3deccbbfabdeed7dd55f963066ca2b454aafa55ff5af5abdfeffbbb5a7cfd6bff60b43d832e1c450b1f2152c0022111188c3108c1fffb186300f12eda0810c6600c482930067ec66500104200629bdf98ed5db1c36304f0f699029d26681d61598a767d9d5c720c553ec020b178f2e13f666cfa20072ffb38ca77a0af72a8e41c0351415a36c62aa0b226a99a4008090884785b70de753163b669adcd8ee00684c58e784861dee17b5b39db8fd8b910efd0e65d148046da0ec6482421e5a1123abd81f9e3ffcc65577e9091e14b115913632c64af378f632b6259c6953db4d628dd264d0c76b28a2506486b5b8bd212484b22a58594727b5812210596259152ecec6fcf9625117267ecac9116425a48291052202c0996405862e7bb9d33d4ce6c4b946b239c124ab94809fbaefd0316df3acfde891ccd761f2906289d55885a2708866f204e2c2c1322ad1cd92043a92164b28c4b4ae65448ad71b4316ceb552084062331e8ffa35503e81d2b4a0c3b7041200cdbfc426cc3480884d97e6760fb523a03035a5a3fb3930463396097d12661f4c01d5c38b6453f7a0563dba84897099c5d64dd1308354e1ad771a20df2d63064d3e82c46ab1c2669e10fe649822b3022605b1c0b817c1bf908c3bbbd4187202dc0dda677702890efe05308f10e3c2d69537ff6efd81f3f4bfde67f44097ecec10cdacd916313a323c2f6125e30cc58a98c94a082f1abe946190e125b1b2c91a3c3e5086f0a2b3c4fbe98438b0031a8832570a20b64de0c99aa2004c81d75190c028946800181268dce42d2c4096e263319081f8d410ab16d1d01428311062104962338f3d2a3cc5d358d5016820c81801d0b5a83163ad9c45879c8cf30b1abc8a8f53ccdb557518e6d28f8a364660c4bda102f12af9d613cef30706d06b1c6f621c904a42d121393b6ce93f437c9b20cf819f6d1dbda33c68089908418a31858e7c9cc7624ccb2844c1b32add15a634cf6ce3a4b13727ba67922148c9c7d88f2f4b57895594c96220d08e921dd0283f6051c8a2cd71651a1452f5944d13f872d97f18b073132c3240344b24516af13a71e8500f4e64b987e830c013ac31616ae2d30721b1ac21810122305c668522d30182c29d06680365d6c0c69a2514222a426d529088d41a0458654a0ad94f2740e8485e8be40f7cd170873e3540e7e06611791366426c02def22de58c0b1523215500d0aa8285ca7d36d510c5f201e485ce9e0fb86b8fb0ab95c40da498018d74f59597a937e7b8b24e9a3944b941a8abe835482566fc02095f8ae22131629924e1811e472b88e43dcef13c611be6d23d0a03306e9004b4a0abe439a266c754372b620d129ae9b63726a2f717f809cff372cdb03a13099c6680d51c8e4ec4dccd77e880e3c542203c2f8045e28906ac05a2dc512365a8214160210968563195a918d7227100e2cd437f9e677ff87fb3e7427857295ff7ef2a7945c8b7beebe0d690caea5f8eb6ffd13d71fdd4f21b059ae6d317fb1c5a7efbd131b1052f0c4132fd0093b1cda5dc1f387f8dee327f8c2fd77e3ec44afda569738dea4b1b1b46df99ddc92a4825bdef7bbac77fb14aa57b2d59847e9ec2c8e1bb2b1b589930ba90edd42add3e4cd13a7a98c4d10775312d9c7d69ad1d10a5e30b6ed076d856b7bb8be8f9b1b46da0e7e2e8f0a26105986b21da474b1dd3ca56291cdae40d9115e308e94db01dc0f86e9f4227cbf82e315b0a48b939fd871ef8cb0d763a5d625e76b36ea8be4fc00a96caebbfa1662354ec10fc97236a3cd0c65db25301b14f213c4f126bf76df6ff0c8538f9227401673387d4dcf8aa8b805fa2643e223a5607db3c558b54c3eb0c9072e23a502d3639354cbc3dbb9c6b2d977c93479d7c600a55c91d1e1984a75145b4a8490cc4e4f810e29154a28b7c8c87095ead01896b030684496b0bafa0cd75f71238bcb43ecb964866ed8e5f71f78807f79bc85ed2b6c4b21ed01aa1f8de39727a8cd3f43c119c72b15b8b0b84ca717b3babec065d3075958dac49e52dcf181db999ddd8d009e7de939ce9c3dc5c73e7c374150a2b1799123fb0ef3eb9ffc3800abab8b9c3ab69b42e003167ba6026666a6f8fc7d9fdcceea08768f5779ec498f4f7cf423d8b6c3ca468ddffad4a711426284e495575fe2a9e78fd18f321cd7a11b86445108123c5a749aeb64de28cdf616e2cffee28ba652cca34d9b9257e513f77d06db022115466b8414202548c1d2fc22e393932865d3ef872c2f2d20a4446719412e4f9a69162e5ee0f9e77f4ca3d5626eff555c7bcd0d6c36ebbcf4e24f68d457397ae58d5c77cd4d8c8d8e13c77db69a7506830146a7140b653c2f47aa13a4542c2c9ee399975fe42377dccde8f0c83b355bdceff3bd87bfc5ca5a9d9c3b82e9bd8c9226a61bb6e9874b1cb9f62e1cd70329b6f3c3cf95701bebf39c3cf52cdffefecb789666a83a05c207ba548a93f4d30e3283d3af1cc39292e9c045374ef2f47fbd416634be3104f439f9fca3846b6fb1f7c83524699b37cebc4cdcef512d0f11264d361a1b44618ac95c025f32b5eb7afa510256f04e31a96c4da56071fad5d7898b438cb97954a7b9811b40c999053bc7938f3fbc53aa661863904663a4a213b63976e2196aad55162f2e53b03d7ee99efbf9f113cf72e9a5fba9afae23738643fb8ed05f3e4dd2dba05b6bd21b6c87585b6a66e6de8f2d251bad06234323fcf0b19f70716d95ad469be1911e611cd2a8d5d18ea61ff5b9fda6db10f4f9c9338f607eaa31c6a0334da63384b0199abc966e6f4042848ad22d962e9ce7c0fe9bf9de23df6172780499f50893943049e9b586f0f30db41be1db79d2c100873ccd306576ea30cbf587c9648b3d3397526bd4199b98653d8ea1b9c273a72f60590e61376266c8e3a6cbafc7b7253ff8d17f50191ee7abdf78907b3ff6cb7cf785ffc4b25ee7ae0fdec95a7381fd7b86d1a2cdebe75e465ad3a49944298b2449b100a353f28ecde4d06ee268997c690219a56b1891f1d6d9a739baf73decbd6c8e17df7886e3275fa451b3b8aab49bab7382ad7a935a6795f3f5256293313373804a7592e9a97ddc70fd6d148a55eebcfd2e0af90a6e3082e378e45c97079f7e8defbe788a37965a388e0b964daa3571afcf8dd7dcc07df7decfa17dbbb9f5fadb79ffcd7770e7ad1fa6501c6610db90b9583dc5dcf43e2e9c38cb74718cf6fa165ffaa33fe7c6a3579226f3c45942b7bb89eca76da41dd1891aecdfb307c72f73a6b945a315f1c0ee5d9c78e33b7cf5a7cfd1a34fbbdda1d94c29e40b0c972be4722e73fb0e33541de6e0be393ccf676c629a42b1427760586df531b645924812ad48b421cdc0b37d4e1c3fc65a6d83205fa4b1b9c9cada2af57a0dc7924c8c4d232c49429fe9d969f6cfcda16c07cff531125aed1685a0cacada3c8dc622b5fa2aeaf3bffad73cfed4832451ccecfe436c1d7b81bb0ebd9743ee18b5ce2ab903709398e3f8d23a966b4892846a658ccb8f1c414a49a158248efb14fc3c4a59d8b6c7e8f824e7deb4c905793002230c9eebe2ba1e526b947258595c6468b84810e4515a63498b52a988eb6870025c7f409a0df05d9fad8d3a93e50ae363534c36d6416bc6262689bb3671af479310f5956ffe0a29310ac1c2d24759ebaf3277e8464657eb3cb4728eadd4c27104abeb6db44c989c75d873198c4ca5d88e62df9e3d142b051406d773b02c45be5022ec4544038192502c795896c3daea061313a358d2a3b5b5c99d777c0865497ef3b39fa3521e626eff1c90f0370f7e8ef570019129662767e9aa2d2a8797c9ac2bd858df60b3d564627894f9e649840be1661175fa8ca63730ec1e9ec6710aacae2d930cba8cbef70eee1c5cceb9c5f3bc70fc04cad5dcf9f10ab5f594d3175fe6a9634ff03bf757b8eeaabb49d318a268bb74c96236379b9c5f5aa1501ca5db4c9196a4d51bd00d7b4471464e0ba6cead71cde1c3f49e7a9a8fe5a7c9a294c19bf39c1d0a3971f24db451cc9f8be8874f62fb31a59245dc7b8c3ffd932f333a3a432fdce086abc7a87542bae90065f70563769ec0ce78e5f88b94820aa5f1dd58521178927dbb77e3ba1eeed9055e7fa546bfef62521bdbf2d9ffe56f90ad7f9d5eae42e19b7f89f2035e3cfe3ad56a40b3b6467564864fffc26ddbed6adaa7d9ae53cd46b9fdd1e3749657699d99a7d34db1265d72375fc3fab10b3c367b914e9ce2189bd18a4da128497b151acb1d7cb1ca8f5ef8576ebdf217d1a68397298adaa7b518a2c6268608a33a5e3f6665f124537b27d87f701cdf73097245befdd0233cf6f8b38cedd5d45ba0a460fef4067fb8354cc7add188bb7c47bcc6fb7efb13b42776130536e7d28cdfbbf930054722d5385a27d8181e7aee07782b1dbe918fe95713bc1187a9bd735cb63b4fe199635c5f9de56f4f2dd09636dd86459264585e824e35d2b7b8b0be893af67d96361fc3781de6a32eef999c212d28c43df75e62ceae34a8146631b9554c96b26b22a09cb3499208cff7e9c63e612be5d56736b8f28ac31cda7b396e008b5ffb778a2313543f7005f6ae312e999864e1a9a7a98a3e8747cb28656f375bd976cffdd2fc0aaf9addbceff6515ad1593696fb2c6d6eb2b21212a70e371cbd89515f73766191b546139d68e27e9e03bb6a20b6c87099df4869b77a685b33b5cf25eef6b03c85f8ec472f3772dac7172e2a4a189dddc37aa3811cb4e8e53b0cac1e5621a59ccf71706c9462564090e28b09aafe08a974596e3798ab14f08c422a073bcb40082a450fb2149369a268c0562fe52b4fbec4f9da32d71e98e45295e3c4fa325b2622eaa5a8c4c229087cd7c60f14fd30c1571e6a60e8f653126330b66130c8c8171c166a6d248a4ade43fcd5176f3542185a2222b4da74bc36881e5ea180a183d6032ce58356448390011163de35449d210a3985efb9e8c8d06bb67860df0156eb9bd43a11970c1570a4214b1294eb2084e4ef9f5fe089858bb4fb2d8684a453ae31355d20ea0ba6671406c546ad4db72f585eea21b1889301b62d29573c02cf666a3a87ce0cf920873086ad76c4c67a13b571e9795a5d43632324eaa7387a403c80ee629f5e98325255689a643b9d62decb238d46c92eb5b53661af47d44ef8c2c1fdb47b21876646689e59e1f933cbe42d41226d82a2833636f9bd1647cb07b970ea1c470287956981e3c3c9d36d02afcc5be7dab45a90cb5994f32eca1194f205b448a956f3189d515f8fa837428c68530c2c7a7d8de308547d2da1b6d166ab97920e209757d41a11b66d28176d2eae27a4190c05635c317b15ca56948a013a8bb162c9acb1383a37ccd4d80481b438b3b185670bae3b30c9523364a9de245a4f38d56b521f72585f5d221229c5e2288f1dbb407136234a63e6e7b778ede426571e19c1e88c62c14558e0781acf71f01d499c444c4f17281525bee7d1edc5985ac82013885b3e1598d41a506f64d839c1f8a845a9aa89ba0a5b7aa43a21d1196e77168c47b91c50f2029423682d75f9eca1834c8de759a8c72c2dad3135364c2b4969773a1c9c1a21f01ddadd2e91b278e8f46b747581e5950d1cb742afdf63b5b5ca665ca3176b2e3f5c26971bb0787180ebfa8c4d2a14b06ba68a72059ee3124586cd6603616ce2d890f4330429d6c811e74b6194522e5b8c0cd9a4a9a1db815edb268a13a4d1589b231cb9f40a9467d16f946987750aad987b0ecde1b9360b1756b77ff554ca2c2f2cd38a35d3d50271afcbc656886b7be485a4b5d2e3d46a9bd550b0d169333333c6d1c39731184494ab11cd6604c2214d60bd1e91cf792807e6971ae4f336a562855ebf4ba95cc2184de0bbe4cb36a3a325fe177698f5afdc758f940000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('21066', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d494844520000003200000020080600000050212b2100000006624b474400ff00ff00ffa0bda793000000097048597300000b1300000b1301009a9c180000000774494d4507df03160d091747a7db140000001974455874436f6d6d656e74004372656174656420776974682047494d5057810e17000010964944415458c35599d98f25d75dc73fbf736abb4bdd7b7bbfdd3d3dbb67bc2f33b6e330d94d12c0819008a4240a420405780944fc01c8849720f1820021e529242fc4210847402002829338b1e325f1d89eb167a6dbddd3db74dfeebb2f75abea9cc3c36d8f4dbdd4a93aaa53dfdf56f5ab4fc9af7cf93967adc55a0bcec7398b039c80d61a270ac7ffdfacb518c0bac98c11757bce730122800018004440448ec6f2ae951ce070ee9dbd730eb18288c53a7058c43a10c1ddbedee1de25ca39878756881294d338a7c12904b047c63801879a884140403985b30e710eeb1c5af4917080778fd5915c0762b96de1ed790b08ce39949bac070e548696082d29c608291ee81c31f6f6ba2213dd1c19ef5911444dc463156f9bfa2e27e31c8852b723204ae1a9891a630d063912ed8ec4721412b9ed4124474478774026cb3904411907cae21c382da8ee9becaefe3bd32b672957eea197593c6ff11d271c79d92941004fab6022d081f215ce398cb5283711e6de166201e5e170280d282122c5b8218334279410e395c9adc20958349e75b7d34954703476881c9d3f52e59c437038cfe16519def8169d9da7a8c58af4f0256cfb554c5645ad3c4114d6b14ea1d844bb31191a67050f5f4f721030ce8280f63dec64881341215867c14e6e2d4a510e14bdcda7f0865b0c9b3b48b948a57e093df3113a660a71234485efb85fec5144de31e4ede273ce21caa1c62d0ed7be8e9fb5f0c427c93a644345146a72d7a5a0817c9b4825b4b67f4068f7880a458c4df044e428a31c283d297611bcd09fe4bf9b14b5af3c9c71382c9e160eae7e95bc7d0363606a6e96dec180dddebfa16f5e65e6de3fc0f873580b0685c222ca3bca3c878899a48600eea84ec8c9faaf13747af4870794a640528b169f6434a6180bb6f31f607c3ac32df241138746eb1ea37e1b558c1451a4d19ec289467480680f631d2028adf17d0f7068adf1431fd77d899dd555fa231f1dc4d89e502ece11fa35bc6c97fd57ff81aab4d1fd4df0359eaf887c211c6d715c5f07a5d0da433c8df63d440b053fa4b9f9038cbec6fc72463a1aa0fd942818233264d037b4f7d631aa0792939b80de60ccad9d8c5edfe2d54a9a3437648122c984b111322bf87a522f6f3f3a3dcf23d71985de156e5efd3b9eb870016d8bececaeb26fc1c918d490d0294e1d5b207df96f796c619a8dd9cfd1efb79819bcceb96a97c55287abc5222f371610e5a144210882cf7858c27725d66eecb1b85c63d09a2728b5a84dc7e0aaf8e1496eed6de1ab84529cd06d75304691661d3c956c518d17d8bf7595a2aa52ae9ea49f0b3613103da9716770caa3ecd7d858fb111555a25acd999f3fc1830fdfc3b837a0d3eed2eeecb3ddee90b65f61c92ba2f59893e36798abe6148e1589a298e5f965aaad1fb093fe168d613089741020a33da2b8cadebaa35e2f52adcc13fa031a87194976805239c3e400f166294f1d63d0ef10446592618a720574a5669fec74dea0b7f502edbd2bf447872c2d3d84530ae5692c1a71395646b8ce0fd97feb87dc5f9fe5ce532778e9f2754e9c394baea0528b28068a995299c5a97956ce9c225e3a818e42245444aac7c9a529f6b7b73975ec6e46dd57d933f790690b2667ffe77f8ee96f5388147b3b1dbadd16adc321223398cc92a6294e45c4d373d83c26501a9743293e248e5314d91eddad1771238bb884cee68b64fd16b93872e7c0030942c434d878e59b94920e17ce2f92658695b92a9b37d7f17d8f2808a9d56a445148b5be441ec5f48c4549ca7490716ca1ca4ea347d756e8d8948b4b9ab3e53709944f390ec8fd3b11354b1a5509fd88289843b925ec3022a04c292a33b35020cd3acccd9da34f446de95efcc271324fa190107131ca2b13aa806a38c560b04b146a8250f0fd0c093591e91218c754b14c398e28c731f5b9885b9b1ba4e3047c8f04d0e51216c7b8df450e3789c60dead3219e520c13b87c638bb7f6da64b9e3e25c8f79dd0311ee7ae093743a8659b5c0dcc9338cb212ce199cb42954532af309da8c08f534874987957b3e8c2a9da5103f8ce807f1dacd43944e28163d46839441526025104272943528bf8cf32cceefd1e96ef2d9dff834be1fb3793062b152e6ccb2e1f2f3cf72e1fc79fc34256ff519275d9c4ba1a879e8e14b0c476d94f2982938ee3a1653f184561aa2cb8ed3730d6ef41dcf3fff372c2eb6e9750ef05c0b2f87b8b28cc816e562935af05176d30d845b3cfac0efb0df3d44f24d36b7ff97346fe0613292c4d118ef539d9a4644e17054ab114966c893068d6b4f71b07185e5f21cf331880a992d19aa414071bec4f6a661f3facf299a848152e408b98393c74ef3c2cf5fc4570ee784280a29793e7aecd3ce03642c147bb728f6aa78bd00e58ff8a3dffb226a281c36dfa2d7db619c2d305759a4d31e72e57a93a836c58debcff0f8e39fe51f7ffc0d5cb24eb198e2850583b116710183611fdf1fb0fbfab7c11cb074c747d9de7f968dcbff02e3944f3e7c092164737d83f5b56bd4ca3e95b888c888626d9af12827cd43dac39c42b9cab9bb4ed1ee5b92c190c7de732fababbba006740f0f3875e2345e54e0d6469bf6fe159e7824a452fb0859ab49bfd3c2e639657f868aaf0974ccf6d62a1555268817f9f54f7c8add9bfb0cfafb4c4d3b8a658d9e59889eac568a6851686f80cd13ec28a1b67237b59598cd17bf8919f7b163cb99fa1cabeb6fb1b5bdcddcc2028f3efe71f4dc9d7cec7d17484609bd5e133f2a31bf58a7189758a815a8ccaf30348e4b1f783f5ffbfa77a8cf1498a944b44c48b797304c52ce9f5aa25609e9b413fa833eda5944a0d7eb52a9d4687686bcff4397180df7d9dcbbc2f58d9f1178c7180ddaec6eec22ae80e7e131ecb5190d1dbee7e3f9117e31c1f577d97ce9efe9ec5e231967d891a3db55946bc729d62c17efbf034f0bd7df5ce3e289bb89e30267ef38c5fa7a9350fb93c6c418bc6244b156418962797989421493a64dbc5280f8117d060c7a3d0281859929b60f0e275dad758808f75f7888ca549d388e58bbba4aa3d1e6eab5b7d8dbfa2b4ecfbe8f860a190cbb78e364f29e28789a4be5e36852323f64fcdaf7307a4c3d85e65e4abc52a75810eaf3d3ec1c1c70f5d56b2c2e9fc4cffa1c34f649d23e2e358811d274443ecc880a75b2fd9b1c6eec7170ef1d9c3b3e473932e45948100a46059c50d39495c1d78e66eb90edb56dba833643934318f1a97295a95a954ab5c0c933c7a9ce04ccbc36c58f5ffa19d7f7ff13934fbea5bc5e7b8ccd32a62b45ce3d788ae21b3791be4f1a84e8991a419a92a8163f61cce2f21251e8519f9a211d0eb0b6cb23f7ccb0bdbe41212ee2d28c8d9d3dd66f1d509fa9f2e0fd2769f7f628fbc27fffd33708fc88ae0db0aa483fdb4764977209f494e660a0b979d0e5965384b5d3547cc5af7efc63ac6daeb1f3e20bbcffc397583e7d07dffcea7750e151af6923f23c63d81ba22b71f14937b65cb8ef020f5c3c8759dd64e00b72ee38bb5305e273a7b83958235a8ea94d4dd369b7493a3df60eb729fb0addeb238508ed296c9aa294c7ee6e8b872fdec9893b4ff1c0c547595c394da156e0dcbdf7b1bdbbcad6f63aedd616d3d53133551fb4a3d158271d8fa9147d4a3ae1b1471fa15e5fa2b1be4a218c887c85af34a117d2ed0d79e3da4db408221ed3b579bcc5a53add468795c50552dfa77de70a0a28ad2c71475c46fb9666d5679835e96ebd42c10f982d1de7be1377918e539ef9c5551ebf74373e213d3ba63dea9389a63b1a12051edf7efa7f681c36a8953abcbed5e0446d9aadc675ea73a779fa3b3fa59324446ac0af3df109ba6f3c47dc5d67fed37f88f63ab49a073cfddda788a29852b9861d36a99467998e8a3c71e96136f77719f72c8d4603cf1bc2b9620d7b6d95d6c12124638c0fc9619fb41c91cc6b9a69835c1bba8343e2a844b1287cffa7af323b53a72f292fdf7c8dbb4fdc43e370879d5b1deac7e640294c9e535fa823bea2dfeee1b4a5673bb4f331a56eced6ce2d0efb232a116cae3779edc61ecbf3152ebff02cdd4e97bbce9ec7da113dd3c6d121ef6baefce245964e2fd3ecf4a9c653ccd58fd1ebf45195a28f9babb251f478430d58d543d6d488ab0c79b6b30d671719ba9cbd568f4cc1d5b5351abd5beceedee4831f782f51e4e8f69a5cdbbece467f975add32bb54e4f8c93b30c6502a95100deb1bbb646991de2dc7c1ea804e7344181549734718557145cd2da5b821351afb3b7487635eddba42bc12d00bfb6c9b5dcaa77ca29969740c671eac51981a11468a7192a13ff399cf3fb970e218a78f2fa0031fa5024c18525e28b13fbec9f59d3586ad1eb50a98748c3321bde180caaca616ce334e33d6b736c8d4102fce4864ccb095a3f590b0aa39bd7c92a95a99994a9db4bfcbf6c10ee7cf9ce0e2237730773e64e198a1df1df281471fa057da6798ef112f38444a140a6386fd94ed1d8b63f2c9fd4b8fdec3e9a545fa4d4731d674d203ee3f3187579626321602ed73e7c97992761fe329467eca4b6f6554c21a891bd2ef26846144ebb045e05718fb119bd5b7d8d9dda7d74e89a77d5a0739d6b714a222cffce279a2d9021f7aef49ea02f5c51394ab29633be6fce212d7b72ff3a3b537998a3dca7727cc2e14b8fedd6d5ca5802e79f4fa4df60f3d16aa3e9149209f657770867f7d6e80677b8c0711e5e93ae54a9b9dd61af2975ff963375dac3122c5e52d480de26b9aa3013f79ed75a6ab53f8d101e938e0959737a9540ae0721ebdeb0c0bb1a2121fe76bdffa1eeff9e059d63636a8cc1568b513da2dc3630fdd4576d0214f13e66796d9ebdca05409111570fdfa1eced378251f1b257cc81d67f1defbf9f62bdfc7f332d27e894221407b230a8559fa7289f5b543f2a1a1a015ddc30dfaa301da95a84e55913ffd93bf70416449b30e4e46884ef1fc1ccf3724499f3c4f094243963a861d4dc9d32ccf4e335ba9e23247e4875cdeb94c3fc919a639c60d092a6386892335438a8166ba5aa0dfef620cc44588a202878d945c67f41370e27376a14ed19f6163adc99d678e71dfd9fb191c8ef9eb6f3dcf388d28554ad4a76bbcf8c20b645886831e8225c9067cf289dfc4b30c1827024428a980cd70166c16500a72f0c78cd316be4a082a0d06798b373a07f8039f421812178bac1c5b64aab24029aaa2b3903cef21ced1cb0d37b75fe3c6cdd7f1e318677292764e61aacc54c9921e8ef8ed5ffe1ca5729dcc16b02e6365669d78becab59d555e7f7583d7ae5c659864fcee173ecf4ffeebc7d8bccd17bef8fb3cfdcfdf63bfb1431415e9b69ac897bff415276270189c9bf05f118d48062228119412945204be87f61c4646a4a64b9677b1a6c7206fe3294ba8c0d7425c88a995aa2c14162955e70085b1395a7bf4da87783a208ea730c0301db3b5bbca6eff26d6593add3641901014a678eea70d766e0cb0ce27cd52ca519172a9c0c38fbd87dded5d6666a6585c5898d0c62f7fe9cf9c31e688c43a44c96d02f836ee54fa08a2c904812aa5d1a2f03d8df6c0130149f13c8738503ac79a04df401c5728974a088ec0f7290621dbebeb28a5a82dd5c9acc1e43946458c9211e938254f219380de28c7a6097996619dc30a2811ac13b40eb1c61c814387e79c43a923d8ec2cce3a8c35b7458b807516a5d41135e7889a7be4b9416907c643290fc4e12b8ba810214289a67b98a09a1d0a51489af531180e9a5d3ccf63de3551e2638dc69a2ed64ea078ee2cd60db0d62139083e6011c0180b68922cbbcd8187c3042fcf72acb358e713041322ab44811cd1c723406daddce6c713529fa191c9819763ada045e19c202e4094c37906084014c9d8a174010f477dba8452429e9ac98f05678e5af709d876d62256a1ac6094c5618fa0b52619275897011a11c1598b158fff03266d616e895597550000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('21067', 131072);
SELECT pg_catalog.lowrite(0, '\x89504e470d0a1a0a0000000d49484452000000320000001c08060000002399ecf700000006624b474400ff00ff00ffa0bda793000000097048597300000b1300000b1301009a9c180000000774494d4507df03160d0a263d5488ed0000001974455874436f6d6d656e74004372656174656420776974682047494d5057810e1700000f174944415458c3659859ac9dd755c77f7b7ff377867bee3cfa7a88a73809899ba443424b4b51d3a4a450da97564115f082847802f1840009211e9140880a242a55080990aa4a2d09286d68ab26698be321766cc78ec73b9d7bce3df377be710f3cd8ad2ab1a4fdb897f45fffb5feffbdb6f8eadfdeb6339ec34253d24b615a40e0595667241bb382c097780892a26292698aca62acc113a08543a9059e347852d00c1d7cdfc5f3258127708420f004d35c30ca346966d84b14d20a9ab1242b2a8653482a4b5609b43618631102acb53f3fbf184208008c31086910402b7470152107154c47107806c717584732282d72a2694539b34149cd538452a2016b615c04f4329f0241963bb842912b4d3da8a070f05d072b055841ec09220fa2c061794e12070204548547a935930cf64786ed91615482b502acc6f9052082ff1fe201324a6371671b500fa11e08e66b86a63ba2ee4ca9cb943419d2ed1eb0dbef31994e29f30c2c8451c8e2d2124fac1e2171d6d9379b0c8a2607a562aa14a10153585c575073a0d406074b56829086ba2f51dac17160beee538b2cf328a61aaaa9a0500f8ac5cfd878c802161cc0750ccd40608c65940bb405f1cdb7ae5ba7e860b31ee3de01ed76976ea743a7db219d4c711c07c77590d2413cc885b596aaaad05a73f8c806a71e3f8bbffe61dace09f68702df1a5ca9d0c6c15a0308241a6d2d95b658c04180054f6aa494541a92c2a2adc55a1016ac79c8c8431cc68227612136ccc696a480dd89441981f8cbbffe333bec0fe9f70724e304630dbee711fa01b528c2f703c220c0f5bc07a084c41a4359959465c9289d924e13368f1de1d10fff1ad3e6b31c8c7d2a6da890181c94b1480b06436905c63e00618d4500c658403f2cba7dd85a16acc5f2e02e40ec402bd4d47d41a62d59e5e04941652ce20bbff5b2b5d6e22209c2805a1c134731511411c7753ccf218e22223fc0f37d7cdfc7751cd23425cf73f22267341ad3ee7608a280673ff502d1eaf3244584b282425b4a2bd1084a2300c1b0922803c21af443500683350fcb8e40a0891d8346104b8884a2ee69e66b10782efdcc9215122b0499b2b82a2f88a3985aad4e10c4846188effb388e8b100e52b838d6434a89e7bab8522204c45184007451d1a8d709029f837e9f1fbffe2abffaa26061eda38cf298d0912801192e1196d8b52c5b0b5630281d7a85c5084bdd11ccfa86405a8405df1178d6e5605a52960a0f832321295c2a03a575705d436505512070a3da0cbee3829568ada9aa0a6b2dc63c90c2607696b22858df5865f3e82368a5b876e53d66e666b978e51aa3d1987ae42184a0164680e58dfffc0e9ffb52805d7c8edda98f2b045a3e18cabe7d3063ae1018d712bb2ed66a5c2ca575a82a8356164f2b50295a1bac5258070c2ea52811161a9e877004a0118e41fce3d7bf66c7a3ec61cf17346b0de61a33249309f7eedfe7b32fbc802c151ffbc8870916e701b87df57d0e9d3846b5dfe55fbef94d5eff9f37e87476595b5a667e7e0e23047e10f0a5afbec2d6dcb3b42b1761c01ab05aa3ca010bbea6e637d8cb05ca845829111a0c6010a02c362f30088436186390da80104803466bacb0b8d610ba20ee5e7bcfeeb5db6cacaf5316258dd60c4559706fa78de3ba9c7ae438424ac6594a1406d4e21a699210371aa8f1981bb76e72f9f275befeafdfa0518f698411beeb62a460f3e811bef89557b833ff18bb933193ce35dcde459edbd8e4d8fc712ebd73913b77ef121e7f1a71fae30837026da894a1122e4803523e50ac9f19c94349b63f77168b40e0fcc91fffd15f5c38f70e33f5065996d18c63f6db1dbef3ea6b5cb8709e0f3d71065d145c7cf732bd761b954d09045cbc7819036c1e3ecc33cf3ccd8b2fbcc0934f9d45ab12e938ccb55a4c271386c33e670eb5f8e9b97fa6fce05b7ce5f9dfa4b793d3dbda63a1d1c2912edbd72fd1202198a9235c41ad1160aa036aa1415443aab48f538df1c870c80803411cb9c4b1c0732b6431c1add7ebb89e8fe3ba28ad09a218c7f5d9dedbe5ded67d1c2b69341a24598ad021c3d198acdfe7d2c54be8532769063e8d38a2d96ce2ef39f4ba3d4e1c39c663274fd11df6b979f70eefbcf15d9e3f758485e38f518f1649927d26a32179a909a290465ca77bed5d9abb77e9f8115d0e70f588cffff2e7e9dfeb71edce369dde80e5f575923421d5163788096a31c970c0a0bb8fab548531e6a17159ac314804523c904584c5f13d1cf9c0141de9d2edb4994e138aa2c0711cdc7a83a02851a5e2a03f62753947684be0071cdd3ccc7f7ce75bbc34f71227569640c3cbbffe79942ac98a9c9d3bb7994ca6ec5deb309a4e196443f6f30b7ce1d32f73348e190c6e119729ef9dff09b7afc5e4d994bd9d1deaf510632c555120030f575bc9f2ea1a8d9939cab2a2b282a01673e6b1c7585a59c1ab3508e23ac74f9c401725cd4683f5c5590a3f62e3d026cdd97910022f08585859e6a3cf3fc7daea0a336bcb243bdbec6edd655a14bcfefaf769cd3478e6ec710683218d469d38ae3337b7c8a1a31937b6b7e98f86e8c2e5a9a32ff291a75e6471fd14cda51e577ff42693d198643225198da82a4377bf47ab358717d5f1c300f1d65b6fd9417f00d6120721b55a8daaaa188dc75465491447ecefeff3bd1ffe80b5d55596e61738188c585d5b81aae2473ffd09bffde5af30e91fd0eb8fb128ce3e7a86a5d97926650ec05ffdfddf60b4c3a3278fd368d6e8ecb6f9c24b9fe5f1279f4678926434e1cef62e9ee793e7399ee7f0ecd3cfe2053e5a19aebc7791fd7e8f0f76ae736bfb2269d56330ee32adf6a94489501e6e7b7b87fdfd7dacb5b45a2de6e7e75195623299505615699e71effe7d2e5db84859e408633977f93c67b25334a326376edde4daf50bac3697d13a474a8baa32b49e52ab45b49657595d5863a6d9e4375e7a9920f4a9850191eb51dcbb47a335cff2b123dcbabfcd7fbdf62ac3e190e5d54d2edd79878dcd658ab2a03bda663c49b9d33d47aa527a0709a3f11e49324165823217b8c69428955329c5f6f688e1a88f319a300c190e06186bd9debe8b1708843424c99046182294c6a8824f3cf3215a41139567a4c3219e1f508f6accae6e32b7b880f1020e6daeb3beb6c18fdf799338acf1f4e34fb033ead31bec6174cafcf829dedfb986aa67cc2e470cf575d24cc1c1235cdd3a8f4d5a5cbd79857e71852281aa12788e832d1dd29e26cb14ee6432a12872b436ecb53b98dd7d0482d66c83f130c1755dac75f99d577e8f3367ce608de5a0b3479aa7ccc6757cd783c188fe85732c4e536c1813ee7548a705ad4f7d1229254f3cfe24411861ebabbcf6f6bff30fdfff53befcc5bf23b7293fbaf0353ea6fe90ac8c90ad257ad979c6e96d92ee98372f7f1b2d15ae6f50a1834d7dd09ad95997839d922a110809d608dc8df50d4e3c7282d6dc2241141144116114a17585ef05580b799633d36c20a5a1521ae93c435956ec6fddc31415c671d08737585958428ca60c6e7cc064719e155de239358e9d3cc54fafdde3f2f61689bac8eaca3ccde63106fd2ed36c8f5b5b6f73f8d0ef32994cb8b9f3bf64799bc981440e9a84b3925e35c4f3c583d741e5918e055645cc460d7ac3218229ee273ff322ae949479415996144541321e519605d32c43e739fd6e872449994c863467e7299566ae35cbcaea2a9b274fe2fdd2131cfef4a78882003f087fbec1754729f7ae6ff3f6bb17f8c13bafa1c475fcb0e0c8a157d8ef24dcfee016938ee1fcde7711e639a2fa326ef12ba4a3ff241c68cece3d426f2ee14aa74fda57d84c124e5bd070a95287d9f915c64261dd0cf7d695cb248311c36442da3b40aa0a391993b7f7088a8ce1e9c79974db4c8c401b4d10d771fd80300c896a114282290b3ccf639056f43b09fb838cddfe1e37eebccdd55b3f647fff3a338d88f5f5b338e2510e3a1197cefd135b5b6f502ac5f2c26976db5dfc20a5283671763658dfd9c2ef1c306d64ace83a7ddfa73db614650d4a83550ef7870265e671bc10f7f6fbefd3de6ba3b1449e476b6606773864f6f41966a298b5cd0da47d123f8e69b69ad49a4dd2744a56284a1972a39bd11966f492943b5b17b9bf7d8e76ef0a93ec1eab4b4d1cb341249fc4754ed13ba831e85de3a0ff16e3f13d3c2c870e7d06471c437a2e58851686386bd19aecd0eeefe3372472c1e5998f2da3ab8c3086ff7ecbe1fd3b098e3568a550f91457094b5caf1185210b8b0b2caeadd3fac42768cccde20701420a7a49cec120e57e56d2e90cd81b2474ba7ba4e55dfafdbb74da57b9bff52e3819f5b8c1faea939c3dfd072856188c2d45798369fe1eddce79ca628025e3d0f251eab58f939979a27a1d55564ccb294559b0946b5c6db9a753d6e69779e6b31be4aa8314392bad9046e071ea915338c2e5eebd03b2a283bbb8b048f3f809364e9c64929574fb13ee6e0fd8bfba4537574c328394923cdfa3ddb9c4b07f83d1f07d3afb7be499a21678346bc7599efd285178182b5a04f11a2a3cc4a87f859d9d6fd31bbccbb05fa29466717e9dd3c73f47a58fd09f4c098da1c872aab24497396e51b0d40a89a72d1ecb5d2e950917bef71e8292334b012b3578fe299f576fce5114056ed8430d24e2cfbffe2d3b184e288dc60b7c901965d5663add25cd6e910cb7190ff731bac45a1f633c66ea1b04e2185eb086e32f312d4a3c571246217e94a2ed55a6d9396e5eddc5d33e488fb8d1e2d8c6f344b527d91f6414798a17f8945986aa14b62a285545d2bf8249c7cc368e3133b8c1bbfa3661dda31819a47689649dd5a535ee0c438e9c39cbe537ff8d72d4c3bd7ce31be4c5105576c9cb36a628f0bc1acd5a1d2fae13ba759637cf50942d949a23089609e279b23ca1bdf70176ba8d953d0af6b877f73d941ae2851e56d5986b6c1038b334eb8fa3ec32ed038b18741fec104290a7195591e2383e4a5564c95d72759dbcf411fa04b7ac4056823431482c850a104e8371e612d76a144a33b3fa2c9dd1abb82abd86efd688eb731caa9da6595b258e9611760e6d9bf47a391fdcbd4f55e58491468643223f63b4778df1e02279b94d50abf07c89e33bd49a1bc4de2ab5708dd03fca2071e9a5062114ae231ffe140ab4aa10084ca5289231f9f41693f40ac24ec11e465539b218509516932b1c4752668abc3a209d1ce0368f307be82455ba8f3106f7cce9df47db90389aa7de58a67330e1fdbbb7988c0f988c6e52955b5455829053c6a3219dfd0179d9a7982a44e8b27a38c623a0191c43578b2833472057e80f7334158e6708fc006d14be1f3033bf80aa2a46dd3d94cab1ba24195ec68a3673737308b5c8a017a0f35d6666638c168c87439432b8c2601d97ac1ce10a8f64d467b87319a325ff077bf65aab8ba5c2a80000000049454e44ae426082');
SELECT pg_catalog.lo_close(0);

COMMIT;

SET search_path = public, pg_catalog;

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
-- Name: members_nicname_key; Type: CONSTRAINT; Schema: public; Owner: dbuser; Tablespace: 
--

ALTER TABLE ONLY members
    ADD CONSTRAINT members_nicname_key UNIQUE (nickname);


--
-- Name: members_pkey; Type: CONSTRAINT; Schema: public; Owner: dbuser; Tablespace: 
--

ALTER TABLE ONLY members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);


--
-- Name: musiclinks_pkey; Type: CONSTRAINT; Schema: public; Owner: dbuser; Tablespace: 
--

ALTER TABLE ONLY musiclinks
    ADD CONSTRAINT musiclinks_pkey PRIMARY KEY (id);


--
-- Name: pictures_pkey; Type: CONSTRAINT; Schema: public; Owner: dbuser; Tablespace: 
--

ALTER TABLE ONLY pictures
    ADD CONSTRAINT pictures_pkey PRIMARY KEY (id);


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
-- Name: pkey_participants; Type: CONSTRAINT; Schema: public; Owner: dbuser; Tablespace: 
--

ALTER TABLE ONLY participants
    ADD CONSTRAINT pkey_participants PRIMARY KEY (id);


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
-- Name: ukey_participants_excursion_member; Type: CONSTRAINT; Schema: public; Owner: dbuser; Tablespace: 
--

ALTER TABLE ONLY participants
    ADD CONSTRAINT ukey_participants_excursion_member UNIQUE (excursion_id, member_id);


--
-- Name: ukey_participants_id_excursion; Type: CONSTRAINT; Schema: public; Owner: dbuser; Tablespace: 
--

ALTER TABLE ONLY participants
    ADD CONSTRAINT ukey_participants_id_excursion UNIQUE (excursion_id, id);


--
-- Name: ukey_tour_id_excursion; Type: CONSTRAINT; Schema: public; Owner: dbuser; Tablespace: 
--

ALTER TABLE ONLY tours
    ADD CONSTRAINT ukey_tour_id_excursion UNIQUE (id, excursion_id);


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
-- Name: videolinks_pkey; Type: CONSTRAINT; Schema: public; Owner: dbuser; Tablespace: 
--

ALTER TABLE ONLY videolinks
    ADD CONSTRAINT videolinks_pkey PRIMARY KEY (id);


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
-- Name: fkey_musiklinks_excursions; Type: FK CONSTRAINT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY musiclinks
    ADD CONSTRAINT fkey_musiklinks_excursions FOREIGN KEY (excursion_id) REFERENCES excursions(id);


--
-- Name: fkey_participants_excursions; Type: FK CONSTRAINT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY participants
    ADD CONSTRAINT fkey_participants_excursions FOREIGN KEY (excursion_id) REFERENCES excursions(id);


--
-- Name: fkey_participants_members; Type: FK CONSTRAINT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY participants
    ADD CONSTRAINT fkey_participants_members FOREIGN KEY (member_id) REFERENCES members(id);


--
-- Name: fkey_pictures_participants; Type: FK CONSTRAINT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY pictures
    ADD CONSTRAINT fkey_pictures_participants FOREIGN KEY (excursion_id, participant_id) REFERENCES participants(excursion_id, id);


--
-- Name: fkey_pictures_tour; Type: FK CONSTRAINT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY pictures
    ADD CONSTRAINT fkey_pictures_tour FOREIGN KEY (tour_id, excursion_id) REFERENCES tours(id, excursion_id);


--
-- Name: fkey_tour_type_id; Type: FK CONSTRAINT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY tours
    ADD CONSTRAINT fkey_tour_type_id FOREIGN KEY (tour_type_id) REFERENCES tour_type(id);


--
-- Name: fkey_videolinks_excursions; Type: FK CONSTRAINT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY videolinks
    ADD CONSTRAINT fkey_videolinks_excursions FOREIGN KEY (excursion_id) REFERENCES excursions(id);


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

