--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

-- Started on 2020-12-09 15:51:20

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3902 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 27004)
-- Name: escalier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.escalier (
    gid integer NOT NULL,
    id_etage_b bigint,
    id_etage_h bigint,
    id_salle_b bigint,
    id_salle_h bigint,
    geom public.geometry(Polygon),
    sortie_b public.geometry(LineString,4326),
    sortie_h public.geometry(LineString,4326)
);


ALTER TABLE public.escalier OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 27002)
-- Name: escalier_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.escalier_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.escalier_gid_seq OWNER TO postgres;

--
-- TOC entry 3903 (class 0 OID 0)
-- Dependencies: 208
-- Name: escalier_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.escalier_gid_seq OWNED BY public.escalier.gid;


--
-- TOC entry 215 (class 1259 OID 27065)
-- Name: etage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.etage (
    id integer NOT NULL,
    nom character varying NOT NULL
);


ALTER TABLE public.etage OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 27063)
-- Name: etage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.etage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.etage_id_seq OWNER TO postgres;

--
-- TOC entry 3904 (class 0 OID 0)
-- Dependencies: 214
-- Name: etage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.etage_id_seq OWNED BY public.etage.id;


--
-- TOC entry 207 (class 1259 OID 25887)
-- Name: fonction_salle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fonction_salle (
    id integer NOT NULL,
    nom character varying NOT NULL
);


ALTER TABLE public.fonction_salle OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 25885)
-- Name: fonction_salle_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fonction_salle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fonction_salle_id_seq OWNER TO postgres;

--
-- TOC entry 3905 (class 0 OID 0)
-- Dependencies: 206
-- Name: fonction_salle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fonction_salle_id_seq OWNED BY public.fonction_salle.id;


--
-- TOC entry 211 (class 1259 OID 27016)
-- Name: porte; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.porte (
    gid integer NOT NULL,
    id_salle_1 bigint,
    id_salle_2 bigint,
    geom public.geometry(LineString)
);


ALTER TABLE public.porte OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 27014)
-- Name: porte_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.porte_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.porte_gid_seq OWNER TO postgres;

--
-- TOC entry 3906 (class 0 OID 0)
-- Dependencies: 210
-- Name: porte_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.porte_gid_seq OWNED BY public.porte.gid;


--
-- TOC entry 213 (class 1259 OID 27028)
-- Name: salle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salle (
    gid integer NOT NULL,
    id_etage bigint,
    numero bigint,
    id_fonctio bigint,
    geom public.geometry(Polygon)
);


ALTER TABLE public.salle OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 27026)
-- Name: salle_gid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.salle_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.salle_gid_seq OWNER TO postgres;

--
-- TOC entry 3907 (class 0 OID 0)
-- Dependencies: 212
-- Name: salle_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.salle_gid_seq OWNED BY public.salle.gid;


--
-- TOC entry 3732 (class 2604 OID 27007)
-- Name: escalier gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.escalier ALTER COLUMN gid SET DEFAULT nextval('public.escalier_gid_seq'::regclass);


--
-- TOC entry 3735 (class 2604 OID 27068)
-- Name: etage id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etage ALTER COLUMN id SET DEFAULT nextval('public.etage_id_seq'::regclass);


--
-- TOC entry 3731 (class 2604 OID 25890)
-- Name: fonction_salle id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fonction_salle ALTER COLUMN id SET DEFAULT nextval('public.fonction_salle_id_seq'::regclass);


--
-- TOC entry 3733 (class 2604 OID 27019)
-- Name: porte gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.porte ALTER COLUMN gid SET DEFAULT nextval('public.porte_gid_seq'::regclass);


--
-- TOC entry 3734 (class 2604 OID 27031)
-- Name: salle gid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salle ALTER COLUMN gid SET DEFAULT nextval('public.salle_gid_seq'::regclass);


--
-- TOC entry 3890 (class 0 OID 27004)
-- Dependencies: 209
-- Data for Name: escalier; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.escalier (gid, id_etage_b, id_etage_h, id_salle_b, id_salle_h, geom, sortie_b, sortie_h) VALUES (1, 1, 2, 7, 25, '010300000001000000070000000000000000003E400000000000001C400000000000003E40000000000000284000000000008041400000000000002840000000000080414000000000000023400000000000404040000000000000234000000000004040400000000000001C400000000000003E400000000000001C40', '0102000020E6100000020000000000000000804140000000000000284000000000008041400000000000002340', '0102000020E6100000020000000000000000003E400000000000001C4000000000004040400000000000001C40');


--
-- TOC entry 3896 (class 0 OID 27065)
-- Dependencies: 215
-- Data for Name: etage; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.etage (id, nom) VALUES (1, 'rdc');
INSERT INTO public.etage (id, nom) VALUES (2, '1er');


--
-- TOC entry 3888 (class 0 OID 25887)
-- Dependencies: 207
-- Data for Name: fonction_salle; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.fonction_salle (id, nom) VALUES (1, 'TP');
INSERT INTO public.fonction_salle (id, nom) VALUES (2, 'TD');
INSERT INTO public.fonction_salle (id, nom) VALUES (3, 'couloir');
INSERT INTO public.fonction_salle (id, nom) VALUES (4, 'secretariat');
INSERT INTO public.fonction_salle (id, nom) VALUES (5, 'toilettes');
INSERT INTO public.fonction_salle (id, nom) VALUES (6, 'bureau');
INSERT INTO public.fonction_salle (id, nom) VALUES (7, 'amphi');


--
-- TOC entry 3892 (class 0 OID 27016)
-- Dependencies: 211
-- Data for Name: porte; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.porte (gid, id_salle_1, id_salle_2, geom) VALUES (1, 6, 7, '0102000000020000000000000000004240000000000000144000000000008042400000000000001440');
INSERT INTO public.porte (gid, id_salle_1, id_salle_2, geom) VALUES (2, 5, 7, '0102000000020000000000000000804140000000000000144000000000000042400000000000001440');
INSERT INTO public.porte (gid, id_salle_1, id_salle_2, geom) VALUES (3, 4, 7, '0102000000020000000000000000003D4000000000000014400000000000003E400000000000001440');
INSERT INTO public.porte (gid, id_salle_1, id_salle_2, geom) VALUES (4, 3, 7, '0102000000020000000000000000003740000000000000144000000000000038400000000000001440');
INSERT INTO public.porte (gid, id_salle_1, id_salle_2, geom) VALUES (5, 2, 7, '0102000000020000000000000000002E40000000000000144000000000000030400000000000001440');
INSERT INTO public.porte (gid, id_salle_1, id_salle_2, geom) VALUES (6, 1, 7, '0102000000020000000000000000001C40000000000000144000000000000020400000000000001440');
INSERT INTO public.porte (gid, id_salle_1, id_salle_2, geom) VALUES (7, 8, 7, '0102000000020000000000000000002C400000000000001C400000000000002E400000000000001C40');
INSERT INTO public.porte (gid, id_salle_1, id_salle_2, geom) VALUES (8, 8, 7, '0102000000020000000000000000001C400000000000001C4000000000000020400000000000001C40');
INSERT INTO public.porte (gid, id_salle_1, id_salle_2, geom) VALUES (9, 9, 7, '01020000000200000000000000008035400000000000001C4000000000008036400000000000001C40');
INSERT INTO public.porte (gid, id_salle_1, id_salle_2, geom) VALUES (10, 10, 7, '0102000000020000000000000000003D400000000000001C400000000000003E400000000000001C40');
INSERT INTO public.porte (gid, id_salle_1, id_salle_2, geom) VALUES (11, 24, 7, '0102000000020000000000000000004240000000000000304000000000000042400000000000003240');
INSERT INTO public.porte (gid, id_salle_1, id_salle_2, geom) VALUES (12, 20, 7, '0102000000020000000000000000804640000000000080334000000000008046400000000000803440');
INSERT INTO public.porte (gid, id_salle_1, id_salle_2, geom) VALUES (13, 20, 7, '0102000000020000000000000000404840000000000000334000000000004048400000000000003440');
INSERT INTO public.porte (gid, id_salle_1, id_salle_2, geom) VALUES (14, 11, 7, '0102000000020000000000000000804840000000000000254000000000000049400000000000002540');
INSERT INTO public.porte (gid, id_salle_1, id_salle_2, geom) VALUES (15, 12, 7, '0102000000020000000000000000004B4000000000000025400000000000804B400000000000002540');
INSERT INTO public.porte (gid, id_salle_1, id_salle_2, geom) VALUES (16, 13, 7, '0102000000020000000000000000804B4000000000000025400000000000004C400000000000002540');
INSERT INTO public.porte (gid, id_salle_1, id_salle_2, geom) VALUES (17, 14, 7, '0102000000020000000000000000C04C4000000000000026400000000000C04C400000000000002840');
INSERT INTO public.porte (gid, id_salle_1, id_salle_2, geom) VALUES (18, 15, 7, '0102000000020000000000000000C04C400000000000002C400000000000C04C400000000000002E40');
INSERT INTO public.porte (gid, id_salle_1, id_salle_2, geom) VALUES (19, 16, 7, '0102000000020000000000000000C04C4000000000000031400000000000C04C400000000000003240');
INSERT INTO public.porte (gid, id_salle_1, id_salle_2, geom) VALUES (20, 17, 7, '0102000000020000000000000000C04C4000000000008033400000000000C04C400000000000803440');
INSERT INTO public.porte (gid, id_salle_1, id_salle_2, geom) VALUES (21, 18, 7, '0102000000020000000000000000404B4000000000008034400000000000C04B400000000000803440');
INSERT INTO public.porte (gid, id_salle_1, id_salle_2, geom) VALUES (22, 19, 7, '0102000000020000000000000000C0494000000000008034400000000000404A400000000000803440');
INSERT INTO public.porte (gid, id_salle_1, id_salle_2, geom) VALUES (23, 21, 7, '010200000002000000000000000040484000000000008034400000000000C048400000000000803440');
INSERT INTO public.porte (gid, id_salle_1, id_salle_2, geom) VALUES (24, 22, 7, '0102000000020000000000000000C04B400000000000002D400000000000C04B400000000000002F40');
INSERT INTO public.porte (gid, id_salle_1, id_salle_2, geom) VALUES (25, 23, 7, '0102000000020000000000000000C04B400000000000002F400000000000C04B400000000000803040');
INSERT INTO public.porte (gid, id_salle_1, id_salle_2, geom) VALUES (26, 30, 25, '0102000000020000000000000000004040000000000000144000000000008040400000000000001440');
INSERT INTO public.porte (gid, id_salle_1, id_salle_2, geom) VALUES (27, 29, 25, '0102000000020000000000000000003F40000000000000144000000000000040400000000000001440');
INSERT INTO public.porte (gid, id_salle_1, id_salle_2, geom) VALUES (28, 28, 25, '0102000000020000000000000000003740000000000000144000000000000038400000000000001440');
INSERT INTO public.porte (gid, id_salle_1, id_salle_2, geom) VALUES (29, 27, 25, '0102000000020000000000000000002E40000000000000144000000000000030400000000000001440');
INSERT INTO public.porte (gid, id_salle_1, id_salle_2, geom) VALUES (30, 26, 25, '0102000000020000000000000000001C40000000000000144000000000000020400000000000001440');
INSERT INTO public.porte (gid, id_salle_1, id_salle_2, geom) VALUES (31, 33, 25, '01020000000200000000000000000021400000000000001C4000000000000023400000000000001C40');
INSERT INTO public.porte (gid, id_salle_1, id_salle_2, geom) VALUES (32, 32, 25, '01020000000200000000000000008032400000000000001C4000000000008033400000000000001C40');
INSERT INTO public.porte (gid, id_salle_1, id_salle_2, geom) VALUES (33, 31, 25, '0102000000020000000000000000803C400000000000001C400000000000803D400000000000001C40');
INSERT INTO public.porte (gid, id_salle_1, id_salle_2, geom) VALUES (34, 31, 32, '0102000000020000000000000000003440000000000000214000000000000034400000000000002540');


--
-- TOC entry 3894 (class 0 OID 27028)
-- Dependencies: 213
-- Data for Name: salle; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.salle (gid, id_etage, numero, id_fonctio, geom) VALUES (1, 1, 5, 2, '010300000001000000050000000000000000000000000000000000000000000000000000000000000000001440000000000000204000000000000014400000000000002040000000000000000000000000000000000000000000000000');
INSERT INTO public.salle (gid, id_etage, numero, id_fonctio, geom) VALUES (2, 1, 4, 2, '010300000001000000050000000000000000002040000000000000000000000000000020400000000000001440000000000000304000000000000014400000000000003040000000000000000000000000000020400000000000000000');
INSERT INTO public.salle (gid, id_etage, numero, id_fonctio, geom) VALUES (3, 1, 3, 2, '010300000001000000050000000000000000003040000000000000000000000000000030400000000000001440000000000000384000000000000014400000000000003840000000000000000000000000000030400000000000000000');
INSERT INTO public.salle (gid, id_etage, numero, id_fonctio, geom) VALUES (4, 1, 2, 2, '0103000000010000000500000000000000000038400000000000000000000000000000384000000000000014400000000000003E4000000000000014400000000000003E40000000000000000000000000000038400000000000000000');
INSERT INTO public.salle (gid, id_etage, numero, id_fonctio, geom) VALUES (5, 1, 1, 2, '010300000001000000050000000000000000003E4000000000000000000000000000003E40000000000000144000000000000042400000000000001440000000000000424000000000000000000000000000003E400000000000000000');
INSERT INTO public.salle (gid, id_etage, numero, id_fonctio, geom) VALUES (6, 1, NULL, 5, '010300000001000000050000000000000000004240000000000000000000000000000042400000000000001440000000000040434000000000000014400000000000404340000000000000000000000000000042400000000000000000');
INSERT INTO public.salle (gid, id_etage, numero, id_fonctio, geom) VALUES (7, 1, NULL, 3, '010300000001000000130000000000000000000000000000000000144000000000000000000000000000001C400000000000003E400000000000001C400000000000003E400000000000002840000000000000424000000000000028400000000000004240000000000080364000000000008046400000000000803640000000000080464000000000000029400000000000C04B4000000000000029400000000000C04B40000000000080324000000000004048400000000000803240000000000040484000000000008034400000000000C04C4000000000008034400000000000C04C4000000000000025400000000000804640000000000000254000000000008046400000000000001E4000000000004043400000000000001E400000000000404340000000000000144000000000000000000000000000001440');
INSERT INTO public.salle (gid, id_etage, numero, id_fonctio, geom) VALUES (8, 1, 7, 1, '0103000000010000000500000000000000000000000000000000001C40000000000000000000000000000028400000000000002E4000000000000028400000000000002E400000000000001C4000000000000000000000000000001C40');
INSERT INTO public.salle (gid, id_etage, numero, id_fonctio, geom) VALUES (9, 1, 8, 1, '010300000001000000050000000000000000002E400000000000001C400000000000002E4000000000000028400000000000803640000000000000284000000000008036400000000000001C400000000000002E400000000000001C40');
INSERT INTO public.salle (gid, id_etage, numero, id_fonctio, geom) VALUES (10, 1, 9, 1, '0103000000010000000500000000000000008036400000000000001C40000000000080364000000000000028400000000000003E4000000000000028400000000000003E400000000000001C4000000000008036400000000000001C40');
INSERT INTO public.salle (gid, id_etage, numero, id_fonctio, geom) VALUES (11, 1, NULL, 6, '01030000000100000005000000000000000080464000000000000025400000000000004940000000000000254000000000000049400000000000001E4000000000008046400000000000001E4000000000008046400000000000002540');
INSERT INTO public.salle (gid, id_etage, numero, id_fonctio, geom) VALUES (12, 1, NULL, 6, '0103000000010000000500000000000000000049400000000000001E40000000000000494000000000000025400000000000804B4000000000000025400000000000804B400000000000001E4000000000000049400000000000001E40');
INSERT INTO public.salle (gid, id_etage, numero, id_fonctio, geom) VALUES (13, 1, NULL, 6, '010300000001000000050000000000000000804B400000000000001E400000000000804B4000000000000025400000000000004E4000000000000025400000000000004E400000000000001E400000000000804B400000000000001E40');
INSERT INTO public.salle (gid, id_etage, numero, id_fonctio, geom) VALUES (14, 1, NULL, 6, '010300000001000000050000000000000000C04C4000000000000025400000000000C04C400000000000002B400000000000004E400000000000002B400000000000004E4000000000000025400000000000C04C400000000000002540');
INSERT INTO public.salle (gid, id_etage, numero, id_fonctio, geom) VALUES (15, 1, NULL, 6, '010300000001000000050000000000000000C04C400000000000002B400000000000C04C4000000000008030400000000000004E4000000000008030400000000000004E400000000000002B400000000000C04C400000000000002B40');
INSERT INTO public.salle (gid, id_etage, numero, id_fonctio, geom) VALUES (16, 1, NULL, 6, '010300000001000000050000000000000000C04C4000000000008030400000000000C04C4000000000008033400000000000004E4000000000008033400000000000004E4000000000008030400000000000C04C400000000000803040');
INSERT INTO public.salle (gid, id_etage, numero, id_fonctio, geom) VALUES (17, 1, NULL, 6, '010300000001000000050000000000000000C04C4000000000008033400000000000C04C4000000000008036400000000000004E4000000000008036400000000000004E4000000000008033400000000000C04C400000000000803340');
INSERT INTO public.salle (gid, id_etage, numero, id_fonctio, geom) VALUES (18, 1, NULL, 6, '010300000001000000050000000000000000404B4000000000008034400000000000404B4000000000008036400000000000C04C4000000000008036400000000000C04C4000000000008034400000000000404B400000000000803440');
INSERT INTO public.salle (gid, id_etage, numero, id_fonctio, geom) VALUES (19, 1, NULL, 6, '010300000001000000050000000000000000C0494000000000008034400000000000C0494000000000008036400000000000404B4000000000008036400000000000404B4000000000008034400000000000C049400000000000803440');
INSERT INTO public.salle (gid, id_etage, numero, id_fonctio, geom) VALUES (20, 1, NULL, 4, '010300000001000000050000000000000000804640000000000080324000000000008046400000000000803640000000000040484000000000008036400000000000404840000000000080324000000000008046400000000000803240');
INSERT INTO public.salle (gid, id_etage, numero, id_fonctio, geom) VALUES (21, 1, NULL, 6, '0103000000010000000500000000000000004048400000000000803440000000000040484000000000008036400000000000C0494000000000008036400000000000C04940000000000080344000000000004048400000000000803440');
INSERT INTO public.salle (gid, id_etage, numero, id_fonctio, geom) VALUES (22, 1, NULL, 6, '010300000001000000050000000000000000804A4000000000000029400000000000804A400000000000002F400000000000C04B400000000000002F400000000000C04B4000000000000029400000000000804A400000000000002940');
INSERT INTO public.salle (gid, id_etage, numero, id_fonctio, geom) VALUES (23, 1, NULL, 6, '010300000001000000050000000000000000804A400000000000002F400000000000804A4000000000008032400000000000C04B4000000000008032400000000000C04B400000000000002F400000000000804A400000000000002F40');
INSERT INTO public.salle (gid, id_etage, numero, id_fonctio, geom) VALUES (24, 1, NULL, 7, '010300000001000000050000000000000000003A400000000000002A400000000000003A40000000000000354000000000000042400000000000003640000000000000424000000000000028400000000000003A400000000000002A40');
INSERT INTO public.salle (gid, id_etage, numero, id_fonctio, geom) VALUES (25, 2, NULL, 3, '010300000001000000070000000000000000000000000000000000144000000000000000000000000000001C400000000000003E400000000000001C400000000000003E400000000000002840000000000040434000000000000028400000000000404340000000000000144000000000000000000000000000001440');
INSERT INTO public.salle (gid, id_etage, numero, id_fonctio, geom) VALUES (26, 2, 15, 2, '010300000001000000050000000000000000000000000000000000000000000000000000000000000000001440000000000000204000000000000014400000000000002040000000000000000000000000000000000000000000000000');
INSERT INTO public.salle (gid, id_etage, numero, id_fonctio, geom) VALUES (27, 2, 14, 2, '010300000001000000050000000000000000002040000000000000000000000000000020400000000000001440000000000000304000000000000014400000000000003040000000000000000000000000000020400000000000000000');
INSERT INTO public.salle (gid, id_etage, numero, id_fonctio, geom) VALUES (28, 2, 13, 2, '010300000001000000050000000000000000003040000000000000000000000000000030400000000000001440000000000000384000000000000014400000000000003840000000000000000000000000000030400000000000000000');
INSERT INTO public.salle (gid, id_etage, numero, id_fonctio, geom) VALUES (29, 2, 12, 2, '010300000001000000050000000000000000003840000000000000000000000000000038400000000000001440000000000000404000000000000014400000000000004040000000000000000000000000000038400000000000000000');
INSERT INTO public.salle (gid, id_etage, numero, id_fonctio, geom) VALUES (30, 2, 11, 1, '010300000001000000050000000000000000004040000000000000000000000000000040400000000000001440000000000040434000000000000014400000000000404340000000000000000000000000000040400000000000000000');
INSERT INTO public.salle (gid, id_etage, numero, id_fonctio, geom) VALUES (31, 2, 19, 1, '0103000000010000000500000000000000000034400000000000001C40000000000000344000000000000028400000000000003E4000000000000028400000000000003E400000000000001C4000000000000034400000000000001C40');
INSERT INTO public.salle (gid, id_etage, numero, id_fonctio, geom) VALUES (32, 2, 18, 1, '0103000000010000000500000000000000000024400000000000001C40000000000000244000000000000028400000000000003440000000000000284000000000000034400000000000001C4000000000000024400000000000001C40');
INSERT INTO public.salle (gid, id_etage, numero, id_fonctio, geom) VALUES (33, 2, 17, 1, '0103000000010000000500000000000000000000000000000000001C40000000000000000000000000000028400000000000002440000000000000284000000000000024400000000000001C4000000000000000000000000000001C40');


--
-- TOC entry 3729 (class 0 OID 24882)
-- Dependencies: 202
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3908 (class 0 OID 0)
-- Dependencies: 208
-- Name: escalier_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.escalier_gid_seq', 1, true);


--
-- TOC entry 3909 (class 0 OID 0)
-- Dependencies: 214
-- Name: etage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.etage_id_seq', 2, true);


--
-- TOC entry 3910 (class 0 OID 0)
-- Dependencies: 206
-- Name: fonction_salle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fonction_salle_id_seq', 7, true);


--
-- TOC entry 3911 (class 0 OID 0)
-- Dependencies: 210
-- Name: porte_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.porte_gid_seq', 34, true);


--
-- TOC entry 3912 (class 0 OID 0)
-- Dependencies: 212
-- Name: salle_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.salle_gid_seq', 33, true);


--
-- TOC entry 3743 (class 2606 OID 27012)
-- Name: escalier escalier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.escalier
    ADD CONSTRAINT escalier_pkey PRIMARY KEY (gid);


--
-- TOC entry 3751 (class 2606 OID 27073)
-- Name: etage etage_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etage
    ADD CONSTRAINT etage_pk PRIMARY KEY (id);


--
-- TOC entry 3740 (class 2606 OID 25895)
-- Name: fonction_salle fonction_salle_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fonction_salle
    ADD CONSTRAINT fonction_salle_pk PRIMARY KEY (id);


--
-- TOC entry 3746 (class 2606 OID 27021)
-- Name: porte porte_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.porte
    ADD CONSTRAINT porte_pkey PRIMARY KEY (gid);


--
-- TOC entry 3749 (class 2606 OID 27033)
-- Name: salle salle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salle
    ADD CONSTRAINT salle_pkey PRIMARY KEY (gid);


--
-- TOC entry 3741 (class 1259 OID 27013)
-- Name: escalier_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX escalier_geom_idx ON public.escalier USING gist (geom);


--
-- TOC entry 3738 (class 1259 OID 25896)
-- Name: fonction_salle_nom_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX fonction_salle_nom_uindex ON public.fonction_salle USING btree (nom);


--
-- TOC entry 3744 (class 1259 OID 27025)
-- Name: porte_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX porte_geom_idx ON public.porte USING gist (geom);


--
-- TOC entry 3747 (class 1259 OID 27037)
-- Name: salle_geom_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX salle_geom_idx ON public.salle USING gist (geom);


-- Completed on 2020-12-09 15:51:21

--
-- PostgreSQL database dump complete
--

