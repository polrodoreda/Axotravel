--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO postgres;

--
-- Name: travelapp_airport; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE travelapp_airport (
    id integer NOT NULL,
    airport_name character varying(200) NOT NULL,
    airport_iata character varying(200) NOT NULL,
    city_name character varying(200) NOT NULL,
    city_location geometry(Point,4326) NOT NULL,
    country_name character varying(200) NOT NULL
);


ALTER TABLE travelapp_airport OWNER TO postgres;

--
-- Name: travelapp_airport_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE travelapp_airport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE travelapp_airport_id_seq OWNER TO postgres;

--
-- Name: travelapp_airport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE travelapp_airport_id_seq OWNED BY travelapp_airport.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: travelapp_airport id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY travelapp_airport ALTER COLUMN id SET DEFAULT nextval('travelapp_airport_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add permission	3	add_permission
8	Can change permission	3	change_permission
9	Can delete permission	3	delete_permission
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add airport	7	add_airport
20	Can change airport	7	change_airport
21	Can delete airport	7	delete_airport
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 21, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, false);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	group
3	auth	permission
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	travelapp	airport
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 7, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-05-25 18:25:52.413392+02
2	auth	0001_initial	2017-05-25 18:25:52.479716+02
3	admin	0001_initial	2017-05-25 18:25:52.508209+02
4	admin	0002_logentry_remove_auto_add	2017-05-25 18:25:52.527027+02
5	contenttypes	0002_remove_content_type_name	2017-05-25 18:25:52.558501+02
6	auth	0002_alter_permission_name_max_length	2017-05-25 18:25:52.568862+02
7	auth	0003_alter_user_email_max_length	2017-05-25 18:25:52.583652+02
8	auth	0004_alter_user_username_opts	2017-05-25 18:25:52.598939+02
9	auth	0005_alter_user_last_login_null	2017-05-25 18:25:52.624949+02
10	auth	0006_require_contenttypes_0002	2017-05-25 18:25:52.627786+02
11	auth	0007_alter_validators_add_error_messages	2017-05-25 18:25:52.646837+02
12	auth	0008_alter_user_username_max_length	2017-05-25 18:25:52.672645+02
13	sessions	0001_initial	2017-05-25 18:25:52.687121+02
14	travelapp	0001_initial	2017-05-25 18:35:09.354519+02
15	travelapp	0002_auto_20170525_1852	2017-05-25 18:52:49.287414+02
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_migrations_id_seq', 15, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: travelapp_airport; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY travelapp_airport (id, airport_name, airport_iata, city_name, city_location, country_name) FROM stdin;
1	Goroka Airport	GKA	Goroka	0101000020E6100000DAFDFF3F8B2C624037EBFF7FA65318C0	Papua New Guinea
2	Madang Airport	MAG	Madang	0101000020E61000007A1500803F39624066FFFFBF0CD414C0	Papua New Guinea
3	Mount Hagen Kagamuga Airport	HGU	Mount Hagen	0101000020E6100000000000E07809624000000000A24E17C0	Papua New Guinea
4	Nadzab Airport	LAE	Lae	0101000020E6100000BE141E343B57624098A608707A471AC0	Papua New Guinea
5	Port Moresby Jacksons International Airport	POM	Port Moresby	0101000020E6100000000000400A676240000000C002E322C0	Papua New Guinea
6	Wewak International Airport	WWK	Wewak	0101000020E61000003F2F008068F56140F8050020AFAB0CC0	Papua New Guinea
8	Godthaab / Nuuk Airport	GOH	Nuuk	0101000020E610000062EBFFFFCBD649C0BD0A00C0370C5040	Greenland
11	Akureyri Airport	AEY	Akureyri	0101000020E6100000000000809C1232C0000000803D6A5040	Iceland
12	Egilsstaðir Airport	EGS	Egilsstaðir	0101000020E61000000000004084CD2CC0000000A021525040	Iceland
14	Húsavík Airport	HZK	Akureyri	0101000020E61000003410CB660E6D31C0AEBCE47FF27C5040	Iceland
15	Ísafjörður Airport	IFJ	Ísafjörður	0101000020E610000000000000A32237C0000000E0B7835040	Iceland
16	Keflavik International Airport	KEF	Keflavík	0101000020E61000005F0000A0089B36C03E00008014FE4F40	Iceland
18	Reykjavik Airport	RKV	Reykjavík	0101000020E6100000DDE0FF1FCBF035C010FBFFDF51085040	Iceland
21	Sault Ste Marie Airport	YAM	Sault Ste. Marie	0101000020E6100000000000009A2055C000000080143E4740	Canada
22	Winnipeg / St. Andrews Airport	YAV	Winnipeg	0101000020E610000025FFFF7F144258C03F0F002038074940	Canada
23	Halifax / CFB Shearwater Heliport	YAW	Halifax	0101000020E6100000E4EFFF5FECBF4FC00C1500C0E1514640	Canada
27	Baie Comeau Airport	YBC	Baie-Comeau	0101000020E6100000000000E0140D51C0000000C0F5904840	Canada
28	CFB Bagotville	YBG	Saguenay	0101000020E610000000000000C5BF51C000000020512A4840	Canada
30	Campbell River Airport	YBL	Campbell River	0101000020E61000000000002058515FC0000000E0B3F94840	Canada
31	Brandon Municipal Airport	YBR	Brandon	0101000020E6100000460A65E1EBFC58C014AE47E17AF44840	Canada
33	Nanaimo Airport	YCD	Nanaimo	0101000020E61000003D82FFD3ABF75EC08119AB4309874840	Canada
34	Castlegar/West Kootenay Regional Airport	YCG	Castlegar	0101000020E61000009CCEFFBF72685DC006E9FF5FF0A54840	Canada
35	Miramichi Airport	YCH	Miramichi	0101000020E6100000F790F0BDBF5C50C024F0879FFF804740	Canada
36	Charlo Airport	YCL	Campbellton	0101000020E6100000B2B96A9E239550C06BF46A80D2FE4740	Canada
39	Chilliwack Airport	YCW	Chilliwack	0101000020E61000003C4C00A0187C5EC0760F00008F934840	Canada
47	Dauphin Barker Airport	YDN	Dauphin	0101000020E610000000000000540359C000000000E78C4940	Canada
48	Dawson Creek Airport	YDQ	Dawson Creek	0101000020E610000000000040B60B5EC0000000A003DF4B40	Canada
49	Edmonton International Airport	YEG	Edmonton	0101000020E6100000F8F0FFBF1E655CC023FCFF3FA4A74A40	Canada
51	Estevan Airport	YEN	Estevan	0101000020E610000097080000D3BD59C0D6170020EB9A4840	Canada
52	Edson Airport	YET	Edson	0101000020E6100000111E0080C21D5DC04DE7FF5F19CA4A40	Canada
55	Iqaluit Airport	YFB	Iqaluit	0101000020E610000092FFFF3F922351C08FF9FFBFD1E04F40	Canada
56	Fredericton Airport	YFC	Fredericton	0101000020E61000000000008061A250C00000002038EF4640	Canada
58	Flin Flon Airport	YFO	Flin Flon	0101000020E6100000000000E0A56B59C000000000CC564B40	Canada
61	Kingston Norman Rogers Airport	YGK	Kingston	0101000020E6100000000000A0332653C0000000A0D61C4640	Canada
63	Gaspé (Michel-Pouliot) Airport	YGP	Gaspé	0101000020E61000000CF5FF5FA11E50C0E61200003D634840	Canada
67	Dryden Regional Airport	YHD	Dryden	0101000020E610000000000000A12F57C00000002075EA4840	Canada
70	John C. Munro Hamilton International Airport	YHM	Hamilton	0101000020E6100000B7010000D7FB53C0C113008038964540	Canada
71	Montréal / Saint-Hubert Airport	YHU	Montréal	0101000020E610000073090080AE5A52C0E91800803DC24640	Canada
73	Halifax / Stanfield International Airport	YHZ	Halifax	0101000020E6100000D0EBFFBF19C14FC0F3E7FFFFBD704640	Canada
76	St Jean Airport	YJN	Saint-Jean-sur-Richelieu	0101000020E610000000000080FD5152C0000000E0AEA54640	Canada
77	Stephenville Airport	YJT	Stephenville	0101000020E61000000000006066464DC000000060A8454840	Canada
78	Kamloops Airport	YKA	Kamloops	0101000020E610000058D9FF7F6A1C5EC00C1500C0E1594940	Canada
79	Waterloo Airport	YKF	Waterloo	0101000020E6100000D9FAFFFF3A1854C0DB000080FBBA4540	Canada
82	Buttonville Municipal Airport	YKZ	Toronto	0101000020E610000000000020AED753C0000000A05CEE4540	Canada
85	Lloydminster Airport	YLL	Lloydminster	0101000020E610000000000000AC845BC0000000E093A74A40	Canada
87	Kelowna International Airport	YLW	Kelowna	0101000020E61000000BF2FF1F31D85DC00A12008061FA4840	Canada
89	Moose Jaw Air Vice Marshal C. M. McEwen Airport	YMJ	Moose Jaw	0101000020E6100000000000A0C6635AC000000040472A4940	Canada
90	Fort McMurray Airport	YMM	Fort McMurray	0101000020E6100000ACECFF3F35CE5BC07CF8FF5F9F534C40	Canada
92	Maniwaki Airport	YMW	Mont-Laurier	0101000020E6100000B1F5FFFF65FF52C0D6170020EB224740	Canada
93	Montreal International (Mirabel) Airport	YMX	Montréal	0101000020E61000004F0A00007A8252C051EDFFDFF9D64640	Canada
95	Ottawa / Gatineau Airport	YND	Gatineau	0101000020E610000090FCFFFF11E452C0BBE7FF1FC7C24640	Canada
98	CFB Cold Lake	YOD	Cold Lake	0101000020E610000000000020DB915BC000000000D7334B40	Canada
100	Ottawa Macdonald-Cartier International Airport	YOW	Ottawa	0101000020E610000000000020D4EA52C0000000A047A94640	Canada
101	Prince Albert Glass Field	YPA	Prince Albert	0101000020E610000013010060126B5AC0D41400E06A9B4A40	Canada
102	Peace River Airport	YPE	Peace River	0101000020E6100000000000A09B5C5DC0000000000B1D4C40	Canada
103	Southport Airport	YPG	Portage la Prairie	0101000020E6100000AF05BD37869158C070067FBF98F34840	Canada
104	Pitt Meadows Airport	\\N	Pitt Meadows	0101000020E6100000000000A070AD5EC000000020A99B4840	Canada
107	Peterborough Airport	YPQ	Peterborough	0101000020E610000000000040409753C0000000A0701D4640	Canada
108	Prince Rupert Airport	YPR	Prince Rupert	0101000020E6100000EFE1FF7F3D4E60C078F2FFDF9E244B40	Canada
110	Muskoka Airport	YQA	Bracebridge	0101000020E61000000000004069D353C000000000C37C4640	Canada
111	Quebec Jean Lesage International Airport	YQB	Québec	0101000020E6100000CC9A58E02BD951C0CCEEC9C342654740	Canada
112	Red Deer Regional Airport	YQF	Red Deer	0101000020E61000000000004037795CC00000006052174A40	Canada
113	Windsor Airport	YQG	Windsor	0101000020E61000000000008028BD54C0000000E046234540	Canada
116	Lethbridge County Airport	YQL	Lethbridge	0101000020E61000009242004033335CC0EDFEFF9FADD04840	Canada
117	Greater Moncton International Airport	YQM	Moncton	0101000020E6100000000000206E2B50C0000000A05C0E4740	Canada
119	Comox Airport	YQQ	Courtenay	0101000020E6100000000000A0C4385FC000000080FBDA4840	Canada
120	Regina International Airport	YQR	Regina	0101000020E6100000000000C09F2A5AC00000008048374940	Canada
121	Thunder Bay Airport	YQT	Thunder Bay	0101000020E6100000000000C0BA5456C0000000609A2F4840	Canada
122	Grande Prairie Airport	YQU	Grande Prairie	0101000020E6100000A6C0FFDFA3B85DC08204006000974B40	Canada
123	Yorkton Municipal Airport	YQV	Yorkton	0101000020E610000000000060919D59C0000000C0E1A14940	Canada
124	North Battleford Airport	YQW	North Battleford	0101000020E6100000000000C09D0F5BC00000002075624A40	Canada
126	Sydney / J.A. Douglas McCurdy Airport	YQY	Sydney	0101000020E6100000F4EAFF3F1E064EC046FBFFBFA8144740	Canada
127	Quesnel Airport	YQZ	Quesnel	0101000020E6100000000000E0A3A05EC00000004057834A40	Canada
129	Rivière-du-Loup Airport	YRI	Rivière-du-Loup	0101000020E6100000000000C06B6551C0000000E0D7E14740	Canada
130	Roberval Airport	YRJ	Roberval	0101000020E6100000000000A0FF1052C0000000608F424840	Canada
131	Rocky Mountain House Airport	YRM	Rocky Mountain House	0101000020E61000004D6A0020DBB95CC08204006000374A40	Canada
133	Sudbury Airport	YSB	Greater Sudbury	0101000020E610000000000020213354C00000000000504740	Canada
134	Sherbrooke Airport	YSC	Sherbrooke	0101000020E6100000000000E03FEC51C00000000024B84640	Canada
135	Saint John Airport	YSJ	Saint John	0101000020E6100000000000A0FA7850C00000000076A84640	Canada
138	Summerside Airport	YSU	Summerside	0101000020E610000000000060B3EA4FC0000000A065384740	Canada
141	Thompson Airport	YTH	Thompson	0101000020E6100000000000004F7758C0000000808AE64B40	Canada
142	CFB Trenton	YTR	Quinte West	0101000020E610000000000060CC6153C000000020380F4640	Canada
143	Timmins/Victor M. Power	YTS	Timmins	0101000020E61000005E0500E01B5854C0E1E9FFDFEB484840	Canada
144	Billy Bishop Toronto City Centre Airport	YTZ	Toronto	0101000020E61000000727A25F5BD953C0E8A221E351D04540	Canada
146	Montreal / Pierre Elliott Trudeau International Airport	YUL	Montréal	0101000020E61000004A010040696F52C0630E00A03CBC4640	Canada
149	Rouyn Noranda Airport	YUY	Rouyn-Noranda	0101000020E6100000000000807AB553C000000080611A4840	Canada
153	Val-d'Or Airport	YVO	Val-d'Or	0101000020E6100000CB020060197253C094020080D2064840	Canada
156	Vancouver International Airport	YVR	Vancouver	0101000020E6100000B21800A0C6CB5EC08FF9FFBFD1984840	Canada
158	Wiarton Airport	YVV	Owen Sound	0101000020E61000004E469561DC4654C0ACADD85F765F4640	Canada
159	Petawawa Airport	YWA	Petawawa	0101000020E6100000000000C06D5453C0000000C0E1F94640	Canada
160	Winnipeg / James Armstrong Richardson International Airport	YWG	Winnipeg	0101000020E6100000D5F4FF7F5A4F58C057F9FFDF7AF44840	Canada
161	Wabush Airport	YWK	Labrador City	0101000020E61000000000006052B750C0000000E000764A40	Canada
162	Williams Lake Airport	YWL	Williams Lake	0101000020E6100000B578FFBF74835EC0FC1900E06F174A40	Canada
164	Cranbrook/Canadian Rockies International Airport	YXC	Cranbrook	0101000020E6100000E2FEFF3F0CF25CC0D0FFFFBF2ECE4840	Canada
165	Edmonton City Centre (Blatchford Field) Airport	YXD	Edmonton	0101000020E610000046D8FF1F58615CC0BFEDFF9F47C94A40	Canada
166	Saskatoon John G. Diefenbaker International Airport	YXE	Saskatoon	0101000020E6100000000000C0CCAC5AC0000000C0DC154A40	Canada
167	Medicine Hat Airport	YXH	Medicine Hat	0101000020E6100000000000E024AE5BC0000000606B024940	Canada
168	Fort St John Airport	YXJ	Fort St. John	0101000020E6100000000000205C2F5EC0000000007A1E4C40	Canada
171	Earlton (Timiskaming Regional) Airport	YXR	Temiskaming Shores	0101000020E6100000760700E83AF653C0A5DBB56C44D94740	Canada
172	Prince George Airport	YXS	Prince George	0101000020E6100000B578FFBF74AB5EC03E0C00E0D7F14A40	Canada
173	Northwest Regional Airport Terrace-Kitimat	YXT	Terrace	0101000020E610000074266DAA6E1260C0E61E12BEF73B4B40	Canada
174	London Airport	YXU	London	0101000020E6100000AEB6627FD94954C099620E828E844540	Canada
175	Abbotsford Airport	YXX	Abbotsford	0101000020E6100000000000A01A975EC0000000003D834840	Canada
176	Whitehorse / Erik Nielsen International Airport	YXY	Whitehorse	0101000020E6100000231F00E024E260C01E160020D45A4E40	Canada
177	North Bay Airport	YYB	North Bay	0101000020E6100000000000200FDB53C0000000808A2E4740	Canada
178	Calgary International Airport	YYC	Calgary	0101000020E6100000BFEDFF9F47815CC09F170040948E4940	Canada
179	Smithers Airport	YYD	Smithers	0101000020E610000000000040B6CB5FC0000000C08F694B40	Canada
181	Penticton Airport	YYF	Penticton	0101000020E61000000000002087E65DC0000000E046BB4840	Canada
182	Charlottetown Airport	YYG	Charlottetown	0101000020E610000000000040808F4FC0000000C01E254740	Canada
184	Victoria International Airport	YYJ	Victoria	0101000020E6100000AB86FF9F43DB5EC0EDFEFF9FCD524840	Canada
186	Swift Current Airport	YYN	Swift Current	0101000020E61000004EE7FF5F39EC5AC0E51200005D254940	Canada
188	Goose Bay Airport	YYR	Happy Valley-Goose Bay	0101000020E6100000840700A080364EC0DC000080DBA84A40	Canada
189	St. John's International Airport	YYT	St. John's	0101000020E6100000F4EAFF3F3E604AC0710600402ECF4740	Canada
190	Kapuskasing Airport	YYU	Kapuskasing	0101000020E610000000000080EB9D54C0000000A0FAB44840	Canada
192	Mont Joli Airport	YYY	Mont-Joli	0101000020E610000000000080510D51C0000000A0E64D4840	Canada
193	Lester B. Pearson International Airport	YYZ	Toronto	0101000020E6100000DD0300C05BE853C073090080AED64540	Canada
194	Downsview Airport	YZD	Toronto	0101000020E610000000000060CCDD53C0000000400ADF4540	Canada
196	Yellowknife Airport	YZF	Yellowknife	0101000020E610000000000000299C5CC0000000003D3B4F40	Canada
197	Slave Lake Airport	YZH	Slave Lake	0101000020E61000005BBCFF5FBAB15CC022FCFF3F84A54B40	Canada
199	Chris Hadfield Airport	YZR	Sarnia	0101000020E610000000000000C59354C000000060EC7F4540	Canada
201	Whitecourt Airport	YZU	Whitecourt	0101000020E6100000000000405EF25CC0000000606B124B40	Canada
202	Sept-Îles Airport	YZV	Sept-Îles	0101000020E6100000000000A0FF9050C000000020951C4940	Canada
204	CFB Greenwood	YZX	Greenwood	0101000020E610000000000080AE3A50C0000000E0007E4640	Canada
207	Blida Airport	\\N	Blida	0101000020E6100000000000806B8306400000000076404240	Algeria
208	Bou Saada Airport	\\N	‘Aïn el Hadjel	0101000020E6100000000000E057D31040000000608FAA4140	Algeria
209	Soummam Airport	BJA	Bejaïa	0101000020E6100000490500209947144099EBFFDF225B4240	Algeria
210	Houari Boumediene Airport	ALG	Algiers	0101000020E6100000000000E028B90940000000C072584240	Algeria
212	Boufarik Airport	QFD	Boufarik	0101000020E6100000A796ADF5450207404298DBBDDC454240	Algeria
213	Reggane Airport	\\N	Reggane	0101000020E6100000000000600A48D23F00000020C9B53A40	Algeria
214	Illizi Takhamalt Airport	VVZ	Illizi	0101000020E610000061F6FFFFCB3E2140B904004037B93A40	Algeria
215	Ain Oussera Airport	\\N	Aïn Oussera	0101000020E610000000000020990707400000004040C34140	Algeria
216	Aguenar – Hadj Bey Akhamok Airport	TMR	Tamanrasset	0101000020E6100000BE0600E0E7CD1540F6EDFF7FBECF3640	Algeria
217	Jijel Ferhat Abbas Airport	GJL	Jijel	0101000020E61000001FEFFF9F937E1740AD0F00E0C5654240	Algeria
218	Mecheria Airport	\\N	Naama	0101000020E610000083CAFF5F6C05CFBF4112006098C44040	Algeria
219	Relizane Airport	\\N	Relizane	0101000020E6100000000000A06B0AE43F0000002048E04140	Algeria
220	Annaba Airport	AAE	Annaba	0101000020E610000000000000973C1F40000000E03D694240	Algeria
221	Mohamed Boudiaf International Airport	CZL	Constantine	0101000020E610000000000080477B1A400000000054234240	Algeria
222	Cheikh Larbi Tébessi Airport	TEE	Tébessa	0101000020E610000077040000CF3D204077EFFF9F3EB74140	Algeria
224	Hassi R'Mel Airport	HRM	Berriane	0101000020E6100000000000A0087E0A400000006017774040	Algeria
225	Bou Chekif Airport	TID	Tiaret	0101000020E610000088B8FFFF0F69F73FC9FFFF1FA9AB4140	Algeria
226	Bou Sfer Airport	\\N	’Aïn el Turk	0101000020E610000000000020BFC5E9BF000000A021DE4140	Algeria
227	Tindouf Airport	TIN	Tindouf	0101000020E6100000F10400208E5520C0EBFBFF5F4DB33B40	Algeria
228	Ech Cheliff Airport	QAS	Chlef	0101000020E61000006B2F0000EE4EF53FD0EBFFBF391B4240	Algeria
229	Tafaraoui Airport	TAF	Oran	0101000020E6100000000000E06B08E1BF000000606DC54140	Algeria
230	Zenata – Messali El Hadj Airport	TLM	Tlemcen	0101000020E6100000A1BEFF3F3333F7BF1CF0FF3F23824140	Algeria
231	Es Senia Airport	ORN	Oran	0101000020E6100000F3F7FF1FBBE0E3BFDF060000DCCF4140	Algeria
232	Sidi Bel Abbes Airport	\\N	Sidi Bel Abbès	0101000020E6100000910700E01BFCE2BFE9180080FD954140	Algeria
233	Ghriss Airport	MUW	Mascara	0101000020E6100000000000808CD5C23F000000E0959A4140	Algeria
234	Touat Cheikh Sidi Mohamed Belkebir Airport	AZR	Adrar	0101000020E6100000000000006ADCC7BF000000006DD63B40	Algeria
235	Biskra Airport	BSK	Biskra	0101000020E610000017EEFF9FF2F31640D41400E08A654140	Algeria
237	Noumérat - Moufdi Zakaria Airport	GHA	Ghardaïa	0101000020E610000000000060565A0E40000000402A314040	Algeria
238	Oued Irara Airport	HME	Hassi Messaoud	0101000020E61000007EF4FF7FCF8F18404C0700C049AC3F40	Algeria
239	In Salah Airport	INZ	I-n-Salah	0101000020E6100000F4DCFFFF9D1804400912008041403B40	Algeria
240	Touggourt Sidi Madhi Airport	TGR	Touggourt	0101000020E610000000000040CC5A1840000000A0AD884040	Algeria
241	Laghouat Airport	LOO	Laghouat	0101000020E6100000EDF7FF7F3D6D07403D0C00E0D7E14040	Algeria
242	Timimoun Airport	TMX	Timimoun	0101000020E61000004DFBFF5F86AAD13F150400A0B23C3D40	Algeria
243	Ain el Beida Airport	OGX	Ouargla	0101000020E6100000000000C0AFA61540000000A0CDEA3F40	Algeria
245	Cadjehoun Airport	COO	Cotonou	0101000020E61000000000002026130340000000C0CD6D1940	Benin
246	Ouagadougou Airport	OUA	Ouagadougou	0101000020E610000000000060DF32F8BF000000A0D6B42840	Burkina Faso
247	Bobo Dioulasso Airport	BOY	Bobo-Dioulasso	0101000020E6100000000000C0E95211C0000000A0F8512640	Burkina Faso
248	Kotoka International Airport	ACC	Accra	0101000020E6100000000000603E59C5BF000000E0B66B1640	Ghana
249	Tamale Airport	TML	Tamale	0101000020E610000000000000739FEBBF00000000481D2340	Ghana
250	Wa Airport	\\N	Wa	0101000020E6100000000000C0BF0F04C0000000A0572A2440	Ghana
251	Sunyani Airport	NYI	Sunyani	0101000020E6100000000000E04CA102C0000000A083721D40	Ghana
252	Takoradi Airport	TKD	Takoradi	0101000020E6100000000000C06A65FCBF000000C090951340	Ghana
253	Port Bouet Airport	ABJ	Abidjan	0101000020E6100000000000C00A690FC0000000E0A90B1540	Ivory Coast
254	Bouaké Airport	BYK	Bouaké	0101000020E610000000000020704B14C00000000088F41E40	Ivory Coast
255	Daloa Airport	DJO	Daloa	0101000020E6100000000000E08BE419C000000060D62B1B40	Ivory Coast
256	Korhogo Airport	HGO	Korhogo	0101000020E6100000ABF0FF1F053A16C0E40100803CC62240	Ivory Coast
257	Man Airport	MJC	Man	0101000020E6100000000000E074591EC00000008099161D40	Ivory Coast
258	San Pedro Airport	SPY	San-Pédro	0101000020E610000000000000AEA41AC000000020A4FC1240	Ivory Coast
259	Yamoussoukro Airport	ASK	Yamoussoukro	0101000020E6100000550100A05A7615C0431500A0D89C1B40	Ivory Coast
260	Nnamdi Azikiwe International Airport	ABV	Abuja	0101000020E6100000000000607C0D1D40000000007A032240	Nigeria
261	Akure Airport	AKR	Akure	0101000020E6100000000000003C34154000000060A9FC1C40	Nigeria
262	Benin Airport	BNI	Benin City	0101000020E610000000000060E36516400000006096441940	Nigeria
263	Margaret Ekpo International Airport	CBQ	Calabar	0101000020E610000000000040C4B12040000000C071E71340	Nigeria
264	Akanu Ibiam International Airport	ENU	Enugu	0101000020E610000000000080723F1E4000000000A7E51940	Nigeria
265	Gusau Airport	QUS	Gusau	0101000020E610000000000000D1C81A4000000000E9572840	Nigeria
266	Ibadan Airport	IBA	Ibadan	0101000020E6100000000000A09ED30F40000000C028731D40	Nigeria
267	Ilorin International Airport	ILR	Ilorin	0101000020E610000000000020C6F911400000004063E12040	Nigeria
268	Yakubu Gowon Airport	JOS	Jos	0101000020E610000000000020F4BC2140000000C097472340	Nigeria
269	Kaduna Airport	KAD	Kaduna	0101000020E6100000000000E0CA471D40000000205A642540	Nigeria
270	Mallam Aminu International Airport	KAN	Kano	0101000020E6100000000000009B0C2140000000005F182840	Nigeria
271	Maiduguri International Airport	MIU	Maiduguri	0101000020E6100000000000C06B292A40000000E0E9B52740	Nigeria
272	Makurdi Airport	MDI	Makurdi	0101000020E610000000000060563A2140000000E0C5D01E40	Nigeria
273	Murtala Muhammed International Airport	LOS	Lagos	0101000020E610000000000060BC910A40000000203A4F1A40	Nigeria
274	Minna Airport	MXJ	Minna	0101000020E6100000000000A05AD9194000000040E94D2340	Nigeria
275	Port Harcourt International Airport	PHC	Elele	0101000020E61000000000006061CC1B40000000A0DC0F1440	Nigeria
276	Sadiq Abubakar III International Airport	SKO	Sokoto	0101000020E6100000000000A029D414400000004025D52940	Nigeria
277	Yola Airport	YOL	Yola	0101000020E6100000000000605DDC2840000000A0DD832240	Nigeria
278	Zaria Airport	ZAR	Zaria	0101000020E61000000000000045BE1E40000000A0A9422640	Nigeria
279	Maradi Airport	MFQ	Maradi	0101000020E6100000000000C0CA811C40000000A047012B40	Niger
280	Diori Hamani International Airport	NIM	Niamey	0101000020E610000000000080087801400000002087F62A40	Niger
281	Tahoua Airport	THZ	Tahoua	0101000020E610000000000080BA0F1540000000C05BC02D40	Niger
282	Mano Dayak International Airport	AJY	Agadez	0101000020E6100000000000600E002040000000C04BF73040	Niger
284	Diffa Airport	\\N	Diffa	0101000020E6100000000000E0DE402940000000C0ECBE2A40	Niger
285	Zinder Airport	ZND	Zinder	0101000020E610000000000060AFF7214000000020D98E2B40	Niger
286	Monastir Habib Bourguiba International Airport	MIR	Monastir	0101000020E610000000000000688225400000006009E14140	Tunisia
287	Tunis Carthage International Airport	TUN	Tunis	0101000020E61000000000008053742440000000A0ED6C4240	Tunisia
288	Sidi Ahmed Air Base	\\N	Bizerte	0101000020E610000048F7FFDF389523404A010040699F4240	Tunisia
290	Gafsa Ksar International Airport	GAF	Gafsa	0101000020E6100000000000C01EA521400000002004364140	Tunisia
291	Gabès Matmata International Airport	GAE	Gabès	0101000020E6100000000000C0E3342440000000403EF04040	Tunisia
292	Borj El Amri Airport	\\N	El Battan	0101000020E610000000000080E4E2234000000080535C4240	Tunisia
293	Djerba Zarzis International Airport	DJE	Houmt Souk	0101000020E6100000000000600E8D25400000000000F04040	Tunisia
295	Sfax Thyna International Airport	SFA	Sfax	0101000020E6100000000000C0CA61254000000060E75B4140	Tunisia
296	Tozeur Nefta International Airport	TOE	Tozeur	0101000020E6100000000000609B3820400000002048F84040	Tunisia
297	Niamtougou International Airport	LRL	Niamtougou	0101000020E610000000000080C275F13F00000080DF882340	Togo
298	Lomé-Tokoin Airport	LFW	Lomé	0101000020E6100000000000207912F43F000000A095A91840	Togo
299	Antwerp International Airport (Deurne)	ANR	Antwerpen	0101000020E61000001C0500A053D71140F4EAFF3F3E984940	Belgium
300	Beauvechain Air Base	\\N	Beauvechain	0101000020E610000000000020C5121340000000C019614940	Belgium
301	Kleine Brogel Air Base	\\N	Peer	0101000020E6100000E17A14AE47E115402A711DE38A954940	Belgium
302	Brussels Airport	BRU	Brussels	0101000020E61000008AF0FFFF10F01140880D002061734940	Belgium
303	Jehonville Air Base	\\N	Bertrix	0101000020E61000000000006043E514400000004023F24840	Belgium
304	Brussels South Charleroi Airport	CRL	Charleroi	0101000020E6100000B00E0040B6D01140BBE7FF1FC73A4940	Belgium
305	Chièvres Air Base	\\N	Chièvres	0101000020E610000000000060E3A50E40000000E0B3494940	Belgium
306	Koksijde Air Base	\\N	Koksijde	0101000020E6100000000000C0E4380540000000008F8B4940	Belgium
307	Florennes Air Base	\\N	Florennes	0101000020E6100000A30400805495124024FFFF7F241F4940	Belgium
308	Wevelgem Airport	QKT	Wevelgem	0101000020E610000026DBFF3F44A30940D2EEFFFF99684940	Belgium
309	Liège Airport	LGG	Liège	0101000020E610000000000080DBC515400000006096514940	Belgium
310	Ostend-Bruges International Airport	OST	Ostend	0101000020E610000021D9FF9FD3E50640ADEFFF7F75994940	Belgium
311	Zutendaal Air Base	\\N	Zutendaal	0101000020E6100000000000C0BB5C1640000000A047794940	Belgium
312	Limburg Regional Airport	\\N	Sint-Truiden	0101000020E610000095FEFF9F82CE1440E51200005D654940	Belgium
313	Saint Hubert Air Base	\\N	Saint-Hubert	0101000020E6100000000000C063C315400000004067044940	Belgium
314	Ursel Air Base	\\N	Knesselare	0101000020E610000000000060F2CD0B400000002075924940	Belgium
315	Weelde Air Base	\\N	Ravels	0101000020E6100000000000003CD71340000000C088B24940	Belgium
316	Oostmalle Air Base	\\N	Zoersel	0101000020E6100000FA6184F068031340C89750C1E1A14940	Belgium
317	Bautzen Airport	\\N	Bautzen	0101000020E610000000000000190A2D4000000040C8984940	Germany
318	Altenburg-Nobitz Airport	AOC	Altenburg	0101000020E6100000000000604503294000000060B07D4940	Germany
319	Dessau Airport	\\N	Dessau	0101000020E6100000264500C0C5612840D97117EF74EA4940	Germany
320	Eisenhüttenstadt Airport	\\N	Eisenhüttenstadt	0101000020E610000077D66EBBD02C2D40D95C35CF11194A40	Germany
322	Großenhain Airport	\\N	Suhl	0101000020E6100000000000E0711C2B40000000606EA74940	Germany
323	Merseburg Airport	\\N	Mühlhausen	0101000020E6100000BBF9FCE6B4E1274099501C9B78AE4940	Germany
324	Halle-Oppin Airport	\\N	Halle	0101000020E6100000713AC956971B2840AC8C463EAFC64940	Germany
325	Riesa-Göhlis Airport	\\N	Riesa	0101000020E610000025DFFF1F54B62A40ABE9FFFF94A54940	Germany
326	Rechlin-Lärz Airport	\\N	Röbel	0101000020E61000000F5E004023812940BD0A00C037A74A40	Germany
327	Strausberg Airport	\\N	Strausberg	0101000020E61000000000006055D52B40000000A04F4A4A40	Germany
328	Schönhagen Airport	\\N	Trebbin	0101000020E6100000866D004012502A40FC1900E00F1A4A40	Germany
329	Barth Airport	BBH	Barth	0101000020E610000087A2409FC86B29400F63D2DF4B2B4B40	Germany
330	Jena-Schöngleina Airport	\\N	Jena	0101000020E6100000000000A0CB6D2740000000E027754940	Germany
331	Kyritz Airport	\\N	Kyritz	0101000020E610000000000000BED92840000000209E754A40	Germany
332	Magdeburg \\City\\" Airport"	\\N	Magdeburg	0101000020E6100000F6251B0FB6402740EC4B361E6C094A40	Germany
333	Rothenburg/Görlitz Airport	\\N	Rothenburg	0101000020E61000000000006066E62D40000000C081AE4940	Germany
334	Anklam Airport	\\N	Anklam	0101000020E61000000000002054562B400000008098EA4A40	Germany
335	Cottbus-Drewitz Airport	\\N	Cottbus	0101000020E61000005A9BC6F65A102D402CD8463CD9F14940	Germany
336	Kamenz Airport	\\N	Kamenz	0101000020E6100000000000A047412C400000004002A64940	Germany
337	Berlin-Schönefeld International Airport	SXF	Berlin	0101000020E61000000F000020850B2B40DFFFFFDFA3304A40	Germany
338	Dresden Airport	DRS	Dresden	0101000020E610000000000080CE882B40000000A0FF904940	Germany
339	Erfurt Airport	ERF	Erfurt	0101000020E6100000000000208CEA2540000000206A7D4940	Germany
340	Frankfurt am Main International Airport	FRA	Kelsterbach	0101000020E61000006D1915DD1F24214013AFFC4344044940	Germany
341	Münster Osnabrück Airport	FMO	Munster	0101000020E6100000A2FAFF1F44BD1E4056F6FF9F3A114A40	Germany
342	Hamburg Airport	HAM	Hamburg	0101000020E6100000F8FFFF3FF9F92340EEFFFFFFB0D04A40	Germany
343	Berlin-Tempelhof International Airport	THF	Berlin	0101000020E610000000000000CCCE2A40000000408B3C4A40	Germany
344	Cologne Bonn Airport	CGN	Köln	0101000020E6100000D10E00602A921C40B0F2FFBFD56E4940	Germany
345	Düsseldorf International Airport	DUS	Düsseldorf	0101000020E6100000000000C02E111B40000000600EA54940	Germany
346	Munich International Airport	MUC	Munich	0101000020E610000078FFFFBF7B9227400B000060492D4840	Germany
347	Nuremberg Airport	NUE	Nürnberg	0101000020E6100000118A52E7F627264022C66B5ED5BF4840	Germany
348	Leipzig Halle Airport	LEJ	Leipzig	0101000020E61000005B4645F7077928409751D1FD41B64940	Germany
349	Saarbrücken Airport	SCN	Saarbrücken	0101000020E61000009912006023701C40BF0D0000789B4840	Germany
350	Stuttgart Airport	STR	Stuttgart	0101000020E6100000260200C0A4712240F30A00A04E584840	Germany
351	Berlin-Tegel International Airport	TXL	Berlin	0101000020E6100000EBFBFF5F4D932A4022FCFF3FA4474A40	Germany
352	Hannover Airport	HAJ	Hannover	0101000020E610000018F5FFBFC25E2340AA090060053B4A40	Germany
353	Bremen Airport	BRE	Bremen	0101000020E6100000B3FFFF5FC6922140A11A008014864A40	Germany
354	Frankfurt-Egelsbach Airport	QEF	Egelsbach	0101000020E6100000000000A0AA4A214000000040E1FA4840	Germany
355	Frankfurt-Hahn Airport	HHN	Traben-Trarbach	0101000020E610000049FAFF1F390E1D40770F00006FF94840	Germany
356	Mannheim-City Airport	MHG	Mannheim	0101000020E6100000000000E040072140000000208DBC4840	Germany
357	Allendorf/Eder Airport	\\N	Allendorf	0101000020E610000000000020965C2140000000E07A844940	Germany
358	Worms Airport	\\N	Worms	0101000020E61000003C139A2496BC204041BCAE5FB0CD4840	Germany
359	Mainz-Finthen Airport	\\N	Mainz	0101000020E6100000E08096AE604B2040D3F4D901D7FB4840	Germany
360	Eisenach-Kindel Airport	\\N	Eisenach	0101000020E6100000F6D1A92B9FF52440994A3FE1EC7E4940	Germany
361	Siegerland Airport	\\N	Burbach	0101000020E6100000000000007B2A2040000000E0955A4940	Germany
362	Hamburg-Finkenwerder Airport	XFW	Hamburg	0101000020E610000000000000CEAB23400000000084C44A40	Germany
363	Kiel-Holtenau Airport	KEL	Kiel	0101000020E6100000000000E0614A2440000000A091304B40	Germany
364	Lübeck Blankensee Airport	LBC	Lübeck	0101000020E6100000D23100003B7025403A06006017E74A40	Germany
365	Flugplatz Dahlemer Binz	\\N	Blankenheim	0101000020E6100000387DFF1F951D1A4050CAFF3FE9334940	Germany
366	Meinerzhagen Airport	\\N	Meinerzhagen	0101000020E61000000000006066661E40000000C0CC8C4940	Germany
367	Arnsberg-Menden Airport	ZCA	Arnsberg	0101000020E6100000000000A0E4971F4000000020F0BD4940	Germany
368	Essen Mulheim Airport	ESS	Mülheim	0101000020E610000000000060D3BF1B40000000A07EB34940	Germany
369	Bielefeld Airport	\\N	Bielefeld	0101000020E61000008B050060C1162140DF0600007CFB4940	Germany
370	Mönchengladbach Airport	MGL	Mönchengladbach	0101000020E6100000000000008D041A40000000C0799D4940	Germany
371	Paderborn Lippstadt Airport	PAD	Paderborn	0101000020E610000072FBFF3F8E3B214057F9FFDF9ACE4940	Germany
372	Stadtlohn-Vreden Airport	\\N	Stadtlohn	0101000020E6100000000000C0BA5C1B400000008077FF4940	Germany
373	Dortmund Airport	DTM	Dortmund	0101000020E6100000760F0000EF721E403B0900A057C24940	Germany
374	Augsburg Airport	AGB	Augsburg	0101000020E61000005D86FF7403DD2540A9DA6E826F364840	Germany
375	Biberach a.d. Riß Airport	\\N	Biberach an der Riß	0101000020E6100000000000E08A862340000000E0380E4840	Germany
376	Eggenfelden Airport	\\N	Eggenfelden	0101000020E6100000000000207D722940000000C0B3324840	Germany
377	Mindelheim-Mattsies Airport	\\N	Mindelheim	0101000020E6100000000000C0CC0C254000000060B00D4840	Germany
378	Oberpfaffenhofen Airport	OBF	Weßling	0101000020E610000000000080F2902640000000606B0A4840	Germany
379	Straubing Airport	RBM	Straubing	0101000020E6100000000000A088082940000000804E734840	Germany
380	Vilshofen Airport	\\N	Vilshofen	0101000020E6100000000000E01F642A40000000A047514840	Germany
381	Leutkirch-Unterzeil Airport	\\N	Leutkirch im Allgäu	0101000020E6100000000000E04007244000000020F0ED4740	Germany
382	Friedrichshafen Airport	FDH	Friedrichshafen	0101000020E610000011F7FFFFE1052340E9F8FF1FEDD54740	Germany
383	Schwerin Parchim Airport	SZW	Parchim	0101000020E6100000705F07CE199127408CBAD6DEA7B64A40	Germany
384	Stendal-Borstel Airport	ZSN	Stendal	0101000020E61000000000000021A32740000000607F504A40	Germany
385	Aalen-Heidenheim/Elchingen Airport	\\N	Neresheim	0101000020E6100000000000A089872440000000408E634840	Germany
386	Bayreuth Airport	BYU	Bayreuth	0101000020E610000000000020AE4727400000008014FE4840	Germany
387	Burg Feuerstein Airport	\\N	Ebermannstadt	0101000020E61000005F0000A068442640C7FFFF3FA7E54840	Germany
388	Hof-Plauen Airport	HOQ	Hof	0101000020E6100000000000A078B6274000000040F1244940	Germany
389	Haßfurt-Schweinfurt Airport	\\N	Haßfurt	0101000020E610000000000040130F2540000000A04F024940	Germany
390	Koblenz-Winningen Airport	ZNV	Koblenz	0101000020E6100000000000404C1D1E40000000E0AB294940	Germany
391	Trier-Föhren Airport	ZQF	Trier	0101000020E61000000000006066261B40000000E093EE4840	Germany
392	Speyer Airport	ZQC	Speyer	0101000020E6100000000000801CE720400000002001A74840	Germany
393	Zweibrücken Airport	ZQW	Zweibrücken	0101000020E6100000000000602C9A1D40000000A0CD9A4840	Germany
394	Donaueschingen-Villingen Airport	ZQL	Donaueschingen	0101000020E6100000840700A0600B214031F7FF1F96FC4740	Germany
395	Freiburg i. Br. Airport	\\N	Freiburg	0101000020E6100000550F00E07A541F40D20E0060EA024840	Germany
396	Mengen-Hohentengen Airport	\\N	Mengen	0101000020E6100000000000C0DCBE2240000000E0E5064840	Germany
397	Adolf Würth Airport	\\N	Schwäbisch Hall	0101000020E61000004FF8FFDF599123402B0B0080258F4840	Germany
398	Finsterwalde/Schacksdorf Airport	\\N	Soest	0101000020E610000047E4BB94BA7C2B405531957EC2CD4940	Germany
399	Braunschweig Wolfsburg Airport	BWE	Braunschweig	0101000020E6100000789CA223B91C25403CF54883DB284A40	Germany
400	Kassel-Calden Airport	KSF	Kassel	0101000020E6100000161406651AC522407D40A03369B54940	Germany
401	Hildesheim Airport	\\N	Hildesheim	0101000020E6100000000000208DE42340000000C037174A40	Germany
402	Bremerhaven Airport	BRV	Bremerhaven	0101000020E610000090BC732843252140D3F71A82E3C04A40	Germany
403	Emden Airport	EME	Emden	0101000020E6100000000000C0F5E81C40000000E00FB24A40	Germany
404	Leer-Papenburg Airport	\\N	Leer	0101000020E61000000000006044C41D4000000000CFA24A40	Germany
405	Wilhelmshaven-Mariensiel Airport	WVN	Wilhelmshaven	0101000020E6100000000000E0BC1A2040000000C048C04A40	Germany
406	Borkum Airport	BMK	Borkum	0101000020E610000000F9FFDF2FD61A40B4FBFF7F56CC4A40	Germany
407	Norderney Airport	NRD	Norderney	0101000020E61000000000002085EB1C40000000207DDA4A40	Germany
408	Flensburg-Schäferhaus Airport	FLF	Flensburg	0101000020E6100000000000C0FDC12240000000A0FC624B40	Germany
409	Rendsburg-Schachtholm Airport	\\N	Rendsburg	0101000020E610000000000060EA32234000000000291C4B40	Germany
410	Westerland Sylt Airport	GWT	Westerland	0101000020E61000001009002052AE20401FF6FFBFE3744B40	Germany
411	Ämari Air Base	\\N	Keila	0101000020E610000000000040603538400000008051A14D40	Estonia
412	Kärdla Airport	KDL	Kärdla	0101000020E6100000000000C0A8D4364000000080D27E4D40	Estonia
413	Kuressaare Airport	URE	Kuressaare	0101000020E6100000000000A06E823640000000606D1D4D40	Estonia
414	Pärnu Airport	EPU	Pärnu	0101000020E61000000000006009793840000000C0A1354D40	Estonia
415	Lennart Meri Tallinn Airport	TLL	Tallinn	0101000020E61000001201006032D538403AE6FFFFE6B44D40	Estonia
416	Tartu Airport	TAY	Tartu	0101000020E6100000F4E7FFFFBDB03A40600800205C274D40	Estonia
418	Eura Airport	\\N	Eura	0101000020E6100000000000008F33364000000060DC8E4E40	Finland
419	Halli Airport	KEV	Mänttä	0101000020E61000009738F24064C93840DF8C9AAF92ED4E40	Finland
420	Helsinki Malmi Airport	HEM	Helsinki	0101000020E610000000000000F50A3940000000C096204E40	Finland
421	Helsinki Vantaa Airport	HEL	Helsinki	0101000020E6100000F1FFFFDF9AF63840DDFFFFFF99284E40	Finland
422	Hameenkyro Airport	\\N	Hämeenkyrö	0101000020E610000000000000DE1237400000002048D84E40	Finland
423	Hanko Airport	\\N	Hanko	0101000020E6100000000000C066153740000000C0A8EC4D40	Finland
424	Hyvinkää Airfield	HYV	Hyvinge	0101000020E610000081E1FFBF8FE138409DF1FF5FC3534E40	Finland
425	Kiikala Airport	\\N	Somero	0101000020E6100000500D00400AA73740990B0040333B4E40	Finland
426	Immola Airport	\\N	Ruokolahti	0101000020E6100000000000E058E73C40000000C0E59F4E40	Finland
427	Kitee Airport	\\N	Kitee	0101000020E6100000F1F3DF83D7123E40CCEEC9C342154F40	Finland
428	Ivalo Airport	IVL	Inari	0101000020E6100000280000C0C1673B4023000000DE265140	Finland
429	Joensuu Airport	JOE	Joensuu	0101000020E61000000F000020859B3D40020000E0D9544F40	Finland
430	Jyvaskyla Airport	JYV	Jyväskylä	0101000020E61000000F000020A5AD3940F1FFFFDF22334F40	Finland
431	Kauhava Airport	KAU	Kauhava	0101000020E61000000F0C207C280D3740CBA0DAE044904F40	Finland
432	Kemi-Tornio Airport	KEM	Kemi	0101000020E61000003E000080049538401F000040D6715040	Finland
433	Kajaani Airport	KAJ	Kajaani	0101000020E61000005600002041B13B40070000A045125040	Finland
434	Kauhajoki Airport	\\N	Kauhajoki	0101000020E610000015E4FF3FA2643640990B0040333B4F40	Finland
435	Kokkola-Pietarsaari Airport	KOK	Kronoby	0101000020E610000092FFFF3FA22437404200004050DC4F40	Finland
436	Kemijarvi Airport	\\N	Kemijärvi	0101000020E6100000A60BB1FA23283B4090D8EE1EA0AD5040	Finland
437	Kuusamo Airport	KAO	Kuusamo	0101000020E61000007EFFFF5F493D3D40140000E0347F5040	Finland
438	Kittilä Airport	KTT	Kittilä	0101000020E6100000250000E0C7D838400F000020DDEC5040	Finland
439	Kuopio Airport	KUO	Kuopio	0101000020E6100000180000A03CCC3B40D2FFFF9FE8804F40	Finland
440	Lahti Vesivehmaa Airport	\\N	Asikkala	0101000020E610000049BE124889B13940D68EE21C75924E40	Finland
441	Lappeenranta Airport	LPP	Lappeenranta	0101000020E61000002E5393E00D253C40382F4E7CB5854E40	Finland
443	Menkijarvi Airport	\\N	Alajärvi	0101000020E6100000000000A0D6843740000000802D794F40	Finland
444	Mikkeli Airport	MIK	Mikkeli	0101000020E6100000925D6919A9333B4080B74082E2D74E40	Finland
445	Nummela Airport	\\N	Vihti	0101000020E6100000860A00E0E04B3840E7150040BD2A4E40	Finland
446	Oulu Airport	OUL	Oulu	0101000020E6100000ECFFFF1FC75A3940160000C0863B5040	Finland
447	Piikajarvi Airport	\\N	Harjavalta	0101000020E6100000000000A082313640000000E06F9F4E40	Finland
448	Pori Airport	POR	Pori	0101000020E6100000800000C0CCCC3540EEFFFFFF18BB4E40	Finland
449	Pudasjärvi Airport	\\N	Pudasjärvi	0101000020E61000003C29000068F23A40EDFEFF9FBD595040	Finland
450	Pyhäsalmi Airport	\\N	Pyhäjärvi	0101000020E610000013E1FFFF21ED3940F50D00E0AEDD4F40	Finland
451	Raahe Pattijoki Airport	\\N	Raahe	0101000020E610000006C9FFFF1FB23840CE0800E0092C5040	Finland
452	Rantasalmi Airport	\\N	Joroinen	0101000020E61000009EF4FF9F435B3C400F1B004062084F40	Finland
453	Rovaniemi Airport	RVN	Rovaniemi	0101000020E61000000F00002095D43940070000A025A45040	Finland
454	Rayskala Airport	\\N	Loppi	0101000020E6100000000000C0981B384000000060525F4E40	Finland
455	Savonlinna Airport	SVL	Savonlinna	0101000020E610000044000020F2F13C4009000080B7F84E40	Finland
456	Selanpaa Airport	\\N	Kouvola	0101000020E6100000000000C084CC3A40000000C0FC874E40	Finland
457	Sodankyla Airport	SOT	Sodankylä	0101000020E6100000681700607D9E3A403C0900A047D95040	Finland
458	Tampere-Pirkkala Airport	TMP	Tampere	0101000020E61000006A000000BA9A37403000004001B54E40	Finland
459	Teisko Airport	\\N	Orivesi	0101000020E6100000F4FDD478E906384097FF907EFBE24E40	Finland
460	Turku Airport	TKU	Turku	0101000020E6100000370000E04643364023000000CE414E40	Finland
461	Utti Air Base	QVY	Kouvola	0101000020E6100000580000003BF03A40EAFFFF3FBD724E40	Finland
462	Vaasa Airport	VAA	Vaasa	0101000020E61000007CFFFF7F1FC33540C5FFFF5F7D864F40	Finland
463	Varkaus Airport	VRK	Varkaus	0101000020E6100000180000A05CDE3B40F5FFFF9FE6154F40	Finland
464	Ylivieska Airfield	\\N	Ylivieska	0101000020E6100000CC834FCEABB938405FD78A9180035040	Finland
465	Belfast International Airport	BFS	Belfast	0101000020E610000015F2FF7F02DD18C048FEFFFF28544B40	United Kingdom
466	St Angelo Airport	ENK	Enniskillen	0101000020E6100000000000604F9B1EC0000000200F334B40	United Kingdom
467	George Best Belfast City Airport	BHD	Belfast	0101000020E6100000000000A0707D17C0000000E01D4F4B40	United Kingdom
468	City of Derry Airport	LDY	Derry	0101000020E610000000000000FAA41CC0000000807A854B40	United Kingdom
469	Birmingham International Airport	BHX	Birmingham	0101000020E610000074F0FF3FEEF7FBBF4DE7FF5F193A4A40	United Kingdom
470	Coventry Airport	CVT	Coventry	0101000020E6100000FBD6FFDFEEACF7BF13010060522F4A40	United Kingdom
471	Leicester Airport	\\N	Leicester	0101000020E610000000000080D382F0BF00000060CC4D4A40	United Kingdom
472	Gloucestershire Airport	GLO	Churchdown	0101000020E610000000000080775601C00000002075F24940	United Kingdom
474	Wolverhampton Halfpenny Green Airport	\\N	Kingswinford	0101000020E610000000000040551302C0000000803D424A40	United Kingdom
475	Cotswold Airport	\\N	Tetbury	0101000020E610000086AC6EF59C7400C081CF0F2384D54940	United Kingdom
476	Turweston Airport	\\N	Brackley	0101000020E6100000D6C6FFDF6987F1BF441800E038054A40	United Kingdom
477	Wellesbourne Mountford Airport	\\N	Wellesbourne Mountford	0101000020E610000000000000BFD4F9BF000000009A184A40	United Kingdom
478	Manchester Airport	MAN	Manchester	0101000020E610000000000000193302C00000000046AD4A40	United Kingdom
479	Manchester Woodford Airport	\\N	Bramhall	0101000020E61000008D9C853DED3001C088635DDC46AB4A40	United Kingdom
480	Royal Marines Base Chivenor Airport	\\N	Braunton	0101000020E6100000000000C0F29910C000000060298B4940	United Kingdom
481	Newquay Cornwall Airport	NQY	Newquay	0101000020E6100000000000C04CFB13C0000000A065384940	United Kingdom
482	RAF Lyneham	LYE	Lyneham	0101000020E610000030D80DDB16E5FFBFD49AE61DA7C04940	United Kingdom
483	MoD Boscombe Down Airport	\\N	Amesbury	0101000020E61000000000004064F5FBBF000000407B934940	United Kingdom
484	RNAS Culdrose	\\N	Helston	0101000020E6100000000000E0D80515C000000060050B4940	United Kingdom
485	MOD St. Athan	\\N	Llantwit Major	0101000020E6100000000000806A7C0BC000000080D0B34940	United Kingdom
486	RNAS Yeovilton	YEO	Yeovil	0101000020E6100000000000A04D1C05C00000000034814940	United Kingdom
487	Haverfordwest Airport	\\N	Haverfordwest	0101000020E6100000000000402DD813C000000000A3EA4940	United Kingdom
488	Cardiff International Airport	CWL	Cardiff	0101000020E6100000000000C023BF0AC000000020C7B24940	United Kingdom
489	Swansea Airport	SWS	Swansea	0101000020E610000000000040754510C0000000807ACD4940	United Kingdom
490	Bristol Airport	BRS	Bristol	0101000020E61000008D0B0742B2C005C0910E0F61FCB04940	United Kingdom
491	Liverpool John Lennon Airport	LPL	Liverpool	0101000020E6100000000000003ACC06C000000060B3AA4A40	United Kingdom
492	London Luton Airport	LTN	London	0101000020E6100000000000A0C492D7BF00000020F6EF4940	United Kingdom
493	Plymouth City Airport	PLH	Plymouth	0101000020E610000023BE13B35E6C10C03868AF3E1E364940	United Kingdom
494	Bournemouth Airport	BOH	Bournemouth	0101000020E610000000000040E17AFDBF00000000D7634940	United Kingdom
495	Southampton Airport	SOU	Southampton	0101000020E6100000000000E073B5F5BF00000060A3794940	United Kingdom
496	Lasham Airport	QLA	Alton	0101000020E6100000000000403789F0BF00000020F6974940	United Kingdom
497	Alderney Airport	ACI	St Anne	0101000020E610000000000020BFB701C00000008061DA4840	Guernsey
498	Guernsey Airport	GCI	St. Andrew`s	0101000020E6100000000000A0D5D004C000000020AEB74840	Guernsey
499	Jersey Airport	JER	Saint Helier	0101000020E610000000000080679001C0000000809C9A4840	Jersey
500	Shoreham Airport	ESH	Shoreham-by-Sea	0101000020E610000000000060AF05D3BF00000000F56A4940	United Kingdom
501	London Biggin Hill Airport	BQH	Biggin Hill	0101000020E610000000FCFFFFD6A3A03F3B0900A057AA4940	United Kingdom
502	London Gatwick Airport	LGW	London	0101000020E610000000000080075BC8BF00000000F5924940	United Kingdom
503	London City Airport	LCY	London	0101000020E6100000496760E4654DAC3FCBD93BA3ADC04940	United Kingdom
504	Farnborough Airport	FAB	Farnborough	0101000020E61000008E030040B8D7E8BFEBFBFF5F4DA34940	United Kingdom
505	Chalgrove Airport	\\N	Benson	0101000020E610000000000060144BF1BF000000808AD64940	United Kingdom
506	Blackbushe Airport	BBS	Yateley	0101000020E610000000000060B81EEBBF0000008075A94940	United Kingdom
507	London Heathrow Airport	LHR	London	0101000020E6100000499EEBFB7090DDBFB1BFEC9E3CBC4940	United Kingdom
508	Southend Airport	SEN	Southend-on-Sea	0101000020E6100000000000A0FE41E63F000000A023C94940	United Kingdom
509	Lydd Airport	LYX	New Romney	0101000020E610000000000000A80DEE3F00000080617A4940	United Kingdom
510	Kent International Airport	MSE	Manston	0101000020E6100000D218ADA3AA89F53F4AD40B3ECDAB4940	United Kingdom
511	Brough Airport	\\N	Brough	0101000020E61000007EA83462661FE2BF32772D211FDC4A40	United Kingdom
512	Carlisle Airport	CAX	Carlisle	0101000020E6100000000000202E7906C00000000000784B40	United Kingdom
513	Retford Gamston Airport	\\N	Retford	0101000020E610000000000060C771EEBF000000C0EAA34A40	United Kingdom
514	Blackpool International Airport	BLK	Blackpool	0101000020E6100000000000E0973A08C000000020C7E24A40	United Kingdom
515	Humberside Airport	HUY	Immingham	0101000020E6100000000000400C74D6BF0000000086C94A40	United Kingdom
516	Barrow Walney Island Airport	BWF	Barrow in Furness	0101000020E6100000A4703D0AD7230AC088331A5476104B40	United Kingdom
517	Leeds Bradford Airport	LBA	Leeds	0101000020E6100000000000E0B191FABF000000C0D5EE4A40	United Kingdom
518	Warton Airport	\\N	Freckleton	0101000020E6100000000000C0811007C0000000605FDF4A40	United Kingdom
519	Hawarden Airport	CEG	Hawarden	0101000020E6100000000000607ED207C000000000CC964A40	United Kingdom
520	Isle of Man Airport	IOM	Ballasalla	0101000020E610000000000000DD7E12C0000000A0A90A4B40	Isle of Man
521	Newcastle Airport	NCL	Newcastle	0101000020E6100000000000801411FBBF000000C0CC844B40	United Kingdom
522	Durham Tees Valley Airport	MME	Eaglescliffe	0101000020E610000000000000DDDEF6BF000000802D414B40	United Kingdom
523	East Midlands Airport	EMA	Castle Donington	0101000020E6100000593100E0BB3FF5BF0A120080616A4A40	United Kingdom
524	Llanbedr Airport	\\N	Caernarfon	0101000020E6100000210000C08B7E10C0E1FFFFBFE5674A40	United Kingdom
525	RAF Ternhill	\\N	Market Drayton	0101000020E610000000000020BB4404C000000080836F4A40	United Kingdom
526	RAF Shawbury	\\N	Wem	0101000020E610000000000060255805C0000000602B664A40	United Kingdom
528	RAF Woodvale	\\N	Formby	0101000020E6100000A20F0080B47108C00FFBFFDF71CA4A40	United Kingdom
529	Kirkwall Airport	KOI	Kirkwall	0101000020E6100000000000A0703D07C000000040997A4D40	United Kingdom
530	Sumburgh Airport	LSI	Lerwick	0101000020E6100000000000209DBAF4BF000000C07FF04D40	United Kingdom
531	Wick Airport	WIC	Wick	0101000020E61000000000004096BE08C000000040BD3A4D40	United Kingdom
532	Aberdeen Dyce Airport	ABZ	Aberdeen	0101000020E6100000000000A00D9501C0000000E0D7994C40	United Kingdom
533	Inverness Airport	INV	Inverness	0101000020E6100000000000E0A33010C0000000A070C54C40	United Kingdom
534	Glasgow International Airport	GLA	Glasgow	0101000020E61000002100002074BB11C054F3FF5F9AEF4B40	United Kingdom
535	Edinburgh Airport	EDI	Edinburgh	0101000020E610000000000040E1FA0AC0000000A099F94B40	United Kingdom
537	Glasgow Prestwick Airport	PIK	Prestwick	0101000020E610000000000000C05812C00000000034C14B40	United Kingdom
539	Scatsta Airport	SCS	Lerwick	0101000020E6100000000000E0DDBCF4BF0000000066374E40	United Kingdom
540	Dundee Airport	DND	Dundee	0101000020E610000000000060E63408C000000080EB394C40	United Kingdom
541	Stornoway Airport	SYY	Stornoway	0101000020E6100000000000800E5319C0000000C0981B4D40	United Kingdom
543	RAF Leuchars	ADX	Saint Andrews	0101000020E6100000000000A090F206C000000020BB2F4C40	United Kingdom
544	RAF Lossiemouth	LMO	Lossiemouth	0101000020E6100000000000C09EB60AC00000000044DA4C40	United Kingdom
545	Cambridge Airport	CBG	Cambridge	0101000020E6100000AF2000606666C63FE91800803D1A4A40	United Kingdom
546	Peterborough Business Airport	\\N	Peterborough	0101000020E6100000000000E03312D0BF000000C0EA3B4A40	United Kingdom
547	Norwich International Airport	NWI	Norwich	0101000020E6100000A6E7FF5F4486F43F840700A080564A40	United Kingdom
548	London Stansted Airport	STN	London	0101000020E6100000890600E07A14CE3FBFEDFF9F47F14940	United Kingdom
549	North Weald Airport	\\N	Epping	0101000020E610000028FBFF7FBEBBC33F840700A060DC4940	United Kingdom
550	Sheffield City Heliport	\\N	Rotherham	0101000020E61000002C2B4D4A4137F6BF39ECBE6378B24A40	United Kingdom
551	Cranfield Airport	\\N	Woburn Sands	0101000020E6100000CAF9FF5FBCBBE3BF72E6FFDF3D094A40	United Kingdom
552	Exeter International Airport	EXT	Exeter	0101000020E610000000000080A54F0BC0000000E0005E4940	United Kingdom
553	Bristol Filton Airport	FZO	Bristol	0101000020E6100000ABF0FF1F05BA04C0DE0300C07BC24940	United Kingdom
554	Oxford (Kidlington) Airport	OXF	Oxford	0101000020E610000047DBFF5FB81EF5BFFDF9FF7F1FEB4940	United Kingdom
555	RAF Benson	\\N	Benson	0101000020E610000030B8FFFF8488F1BF2F140040E6CE4940	United Kingdom
556	RAF Lakenheath	\\N	Lakenheath	0101000020E6100000B00E0040B6F3E13F20F9FFFF63344A40	United Kingdom
557	RAF Mildenhall	MHZ	Lakenheath	0101000020E6100000000000A04621DF3F000000C0522E4A40	United Kingdom
558	RAF Wattisham	\\N	Stowmarket	0101000020E610000020F0FFFFB699EE3FD81A00604B104A40	United Kingdom
559	RAF Wyton	\\N	Huntingdon	0101000020E6100000CAA0FF7FF19ABBBFC31600C0B82D4A40	United Kingdom
560	RAF Fairford	FFD	Highworth	0101000020E6100000BDB9FF7FF6A3FCBF1301006052D74940	United Kingdom
561	RAF Brize Norton	BZZ	Carterton	0101000020E610000011AAD4EC8156F9BF0000000000E04940	United Kingdom
562	RAF Odiham	ODH	Hook	0101000020E6100000790E00609F2BEEBFB8010000F79D4940	United Kingdom
563	DCAE Cosford Air Base	\\N	Albrighton	0101000020E6100000527E52EDD37102C0823CBB7CEB514A40	United Kingdom
564	RAF Northolt	NHT	Northolt	0101000020E6100000922100803FC3DABF46FBFFBFC8C64940	United Kingdom
565	RAF Coningsby	QCY	Horncastle	0101000020E610000080C3FF5FF23FC5BFBDEAFF5FE78B4A40	United Kingdom
566	RAF Dishforth	\\N	Ripon	0101000020E610000049B7FF1F58B9F6BF7B1800C08F114B40	United Kingdom
567	Leeming Airport	\\N	Northallerton	0101000020E610000054742497FF90F8BFDAACFA5C6D254B40	United Kingdom
568	Leeds East Airport	\\N	Sherburn in Elmet	0101000020E610000054E3A59BC420F3BF93020B60CAEA4A40	United Kingdom
569	RAF Honington	BEQ	Thetford	0101000020E6100000000000A0EABBE83F00000060DA2B4A40	United Kingdom
570	RAF Cottesmore	\\N	Wymondham	0101000020E61000007313B534B7C2E4BF965984622B5E4A40	United Kingdom
571	RAF Scampton	\\N	Dunholme	0101000020E6100000C90B00806CA0E1BF2E11000066A74A40	United Kingdom
572	RAF Wittering	\\N	Stamford	0101000020E6100000D61F00C0347EDEBFCC0500A0694E4A40	United Kingdom
573	RAF Linton-On-Ouse	HRT	Haxby	0101000020E61000009EF4FF9F430BF4BF96E5FF5F42064B40	United Kingdom
574	RAF Waddington	WTN	Heighington	0101000020E610000047FAFF3F0FC3E0BF2E11000046954A40	United Kingdom
575	RAF Topcliffe	\\N	Thirsk	0101000020E6100000CB4500600A1DF6BFEE0100E04D1A4B40	United Kingdom
576	RAF Cranwell	\\N	Sleaford	0101000020E6100000FD0E00E06FEDDEBF860A00E0E0834A40	United Kingdom
577	RAF Barkston Heath	\\N	Great Gonerby	0101000020E6100000A70A0000D5F8E1BFCA020060297B4A40	United Kingdom
578	RAF Marham	KNF	Swaffham	0101000020E6100000126745D4449FE13FE9F17B9BFE524A40	United Kingdom
579	Mount Pleasant Airport	MPN	Stanley	0101000020E6100000000000E03D394DC00000008051E949C0	Falkland Islands
580	Amsterdam Airport Schiphol	AMS	Amsterdam	0101000020E610000049FAFF1F390E13400203004080274A40	Netherlands
581	Budel Airport	\\N	Weert	0101000020E6100000950500C0D2671640EDFEFF9FADA04940	Netherlands
582	Maastricht Aachen Airport	MST	Maastricht	0101000020E61000007EFBFF9F9F141740150400A0B2744940	Netherlands
583	Deelen Air Base	\\N	Oosterbeek	0101000020E610000075C8CD70037E17409D11A5BDC1074A40	Netherlands
584	Drachten Airport	\\N	Drachten	0101000020E61000002B040060D58418400D180000428F4A40	Netherlands
585	Eindhoven Airport	EIN	Eindhoven	0101000020E610000027F7FFBF847F1540651100E09CB94940	Netherlands
586	Eelde Airport	GRQ	Groningen	0101000020E6100000C7F5FFBF58511A4013010060528F4A40	Netherlands
587	Gilze Rijen Air Base	\\N	Gilze	0101000020E6100000000000A031BA1340000000A0A0C84940	Netherlands
588	De Kooy Airport	DHR	Den Helder	0101000020E6100000000000E05A1F13400000000032764A40	Netherlands
589	Lelystad Airport	LEY	Lelystad	0101000020E610000000000080DF1B164000000020EB3A4A40	Netherlands
590	Leeuwarden Air Base	LWR	Leeuwarden	0101000020E610000000000040D00A1740000000C0429D4A40	Netherlands
591	Rotterdam The Hague Airport	RTM	Rotterdam	0101000020E6100000E4A08499B6BF11400EBDC5C37BFA4940	Netherlands
592	Soesterberg Air Base	UTC	Zeist	0101000020E61000008B0C0080D11A1540D81A00604B104A40	Netherlands
593	Twente Airfield	ENS	Enschede	0101000020E6100000DBC424B7818E1B40EA526D814E234A40	Netherlands
594	Valkenburg Naval Air Base	LID	Wassenaar	0101000020E6100000C4FDFF7FF8AB114019EAFFBF42154A40	Netherlands
595	Woensdrecht Air Base	WOE	Hoogerheide	0101000020E6100000E700C11C3D5E11401A51DA1B7CB94940	Netherlands
596	Cork Airport	ORK	Cork	0101000020E6100000000000C072FB20C0000000C0AFEB4940	Ireland
597	Galway Airport	GWY	Gaillimh	0101000020E61000000000002018E221C0000000006DA64A40	Ireland
599	Dublin Airport	DUB	Dublin	0101000020E6100000000000408D1419C000000020EDB54A40	Ireland
600	Ireland West Knock Airport	NOC	Castlebar	0101000020E61000000000002011A321C0000000C084F44A40	Ireland
601	Kerry Airport	KIR	Cill Airne	0101000020E6100000000000E02C0C23C0000000C027174A40	Ireland
602	Casement Air Base	\\N	Jobstown	0101000020E61000004B0F008029CE19C074E9FF1F9EA64A40	Ireland
603	Shannon Airport	SNN	Shannon	0101000020E61000001500000082D921C033000020DB594A40	Ireland
604	Sligo Airport	SXL	Sligo	0101000020E6100000F1FFFF9FCB3221C0070000A0DD234B40	Ireland
605	Waterford Airport	WAT	Waterford	0101000020E6100000000000000C591CC000000020F6174A40	Ireland
607	Aarhus Airport	AAR	Ebeltoft	0101000020E6100000E63500A0ED3C2540B115006066264C40	Denmark
608	Billund Airport	BLL	Billund	0101000020E610000031020020B64D22408E190020C2DE4B40	Denmark
609	Copenhagen Kastrup Airport	CPH	Copenhagen	0101000020E6100000C7FFFF3FDF4F29402E00006017CF4B40	Denmark
610	Esbjerg Airport	EBJ	Esbjerg	0101000020E610000000000040571B2140000000C050C34B40	Denmark
611	Grønholt Hillerød Airport	\\N	Fredensborg	0101000020E6100000000000C0AFC32840000000C07FF84B40	Denmark
612	Karup Airport	KRP	Ikast	0101000020E610000000000080CF3F22400000008014264C40	Denmark
613	Læsø Airport	\\N	Sæby	0101000020E6100000000000200D002640000000407BA34C40	Denmark
614	Lolland Falster Maribo Airport	\\N	Maribo	0101000020E61000006FF085C954E1264011902FA182594B40	Denmark
615	Odense Airport	ODE	Odense	0101000020E6100000000000C06BA924400000008004BD4B40	Denmark
616	Kruså-Padborg Airport	\\N	Aabenraa	0101000020E610000000000060DA8E224000000000666F4B40	Denmark
617	Copenhagen Roskilde Airport	RKE	Copenhagen	0101000020E6100000000000E04643284000000000F5CA4B40	Denmark
618	Bornholm Airport	RNN	Rønne	0101000020E610000000000040EA842D40000000401A884B40	Denmark
619	Sønderborg Airport	SGD	Sønderborg	0101000020E6100000000000A05D95234000000080717B4B40	Denmark
621	Skrydstrup Air Base	SKS	Vojens	0101000020E61000007FC16ED8B6882240516C054D4B9C4B40	Denmark
622	Skive Airport	\\N	Skive	0101000020E6100000000000E090582240000000006D464C40	Denmark
623	Thisted Airport	TED	Thisted	0101000020E6100000000000A01269214000000080CE884C40	Denmark
624	Kolding Vamdrup Airport	\\N	Kolding	0101000020E6100000F3FCFF5F6EA92240431500A0D8B74B40	Denmark
625	Vagar Airport	FAE	Miðvágur	0101000020E610000000000080DF1B1DC00000000024084F40	Faroe Islands
626	Vesthimmerlands Flyveplads	\\N	Aars	0101000020E6100000B43C0FEECEEA224090F98040676C4C40	Denmark
627	Stauning Airport	STA	Skjern	0101000020E6100000000000C033B52040000000A0BBFE4B40	Denmark
628	Aalborg Airport	AAL	Aalborg	0101000020E610000081FAFFFFCFB223407C972A86DF8B4C40	Denmark
629	Luxembourg-Findel International Airport	LUX	Luxembourg	0101000020E6100000C0666FDF59D11840FE00B562C9CF4840	Luxembourg
630	Ålesund Airport	AES	Ålesund	0101000020E6100000000000A0927A18400000000000484F40	Norway
632	Alta Airport	ALF	Alta	0101000020E6100000BEFFFFBF275F37401D000060787E5140	Norway
633	Bømoen Airport	\\N	Voss	0101000020E61000000000004089011A4000000080C7514E40	Norway
635	Bodø Airport	BOO	Bodø	0101000020E6100000000000A008BB2C40000000A03AD15040	Norway
636	Bergen Airport Flesland	BGO	Bergen	0101000020E61000000A48FB1F60DF1440224DFE1F8E254E40	Norway
638	Kristiansand Airport	KRS	Kristiansand	0101000020E6100000000000A0B52B204000000040231A4D40	Norway
641	Harstad/Narvik Airport, Evenes	EVE	Narvik	0101000020E61000008D00000098AD3040E6FFFF7F711F5140	Norway
643	Florø Airport	FRO	Florø	0101000020E61000002600004050191440E8FFFF5FB3CA4E40	Norway
644	Oslo Gardermoen Airport	OSL	Oslo	0101000020E610000057FFFF9F67332640280000C0D1184E40	Norway
645	Haugesund Airport	HAU	Haugesund	0101000020E6100000F2FFFF5F5CD51440160000C032AC4D40	Norway
647	Kristiansund Airport (Kvernberget)	KSU	Kristiansund	0101000020E6100000120000004F4C1F40090000804F8E4F40	Norway
648	Kjeller Airport	\\N	Lillestrøm	0101000020E6100000D83A00C07B12264090FCFFFF11FC4D40	Norway
649	Kirkenes Airport (Høybuktmoen)	KKN	Vadsø	0101000020E6100000FCFFFF3F2CE43D4009000080736E5140	Norway
650	Lista Airport	FAN	Flekkefjord	0101000020E61000000000004013811A4000000060BC0C4D40	Norway
651	Molde Airport	MOL	Molde	0101000020E6100000D7FFFFBFCC0C1D40F9FFFF5F525F4F40	Norway
652	Mosjøen Airport (Kjærstad)	MJF	Mosjøen	0101000020E6100000BB000060076E2A40EEFFFFFF2C725040	Norway
654	Notodden Airport	NTB	Notodden	0101000020E61000003F1D8F19A86C22404128EFE368C84D40	Norway
655	Ørland Airport	OLA	Trondheim	0101000020E6100000000000803F3523400000008075D94F40	Norway
657	Moss-Rygge Airport	RYG	Moss	0101000020E61000008201840F259225409C1551137DB04D40	Norway
659	Skien Airport	SKE	Skien	0101000020E6100000000000004622234000000020AE974D40	Norway
660	Stord Airport	SRP	Leirvik	0101000020E6100000000000C0075D1540000000005DE54D40	Norway
662	Sandnessjøen Airport (Stokka)	SSJ	Sandnessjøen	0101000020E6100000B70000A013F02840FCFFFF3F3C7D5040	Norway
663	Tromsø Airport	TOS	Tromsø	0101000020E6100000000000003DEB324000000020BB6B5140	Norway
664	Sandefjord Airport, Torp	TRF	Sandefjord	0101000020E610000036200040678424402C0E00C0E5974D40	Norway
665	Trondheim Airport Værnes	TRD	Trondheim	0101000020E61000006605758016D925406486D73F99BA4F40	Norway
666	Stavanger Airport Sola	SVG	Stavanger	0101000020E6100000B9C1FF3F168D1640FBE4FDBF37704D40	Norway
667	Babice Airport	\\N	Warsaw	0101000020E61000000000004037E93440000000405E224A40	Poland
668	Gdańsk Lech Wałęsa Airport	GDN	Gdańsk	0101000020E6100000000000E0587732400000004055304B40	Poland
669	John Paul II International Airport Kraków-Balice Airport	KRK	Kraków	0101000020E6100000000000A0E8C8334000000020F2094940	Poland
670	Muchowiec Airport	\\N	Katowice	0101000020E610000000000060C1083340000000007A1E4940	Poland
671	Katowice International Airport	KTW	Katowice	0101000020E610000014AE47E17A143340143FC6DCB53C4940	Poland
673	Mielec Airport	\\N	Mielec	0101000020E6100000000000204C7635400000002041294940	Poland
674	Poznań-Ławica Airport	POZ	Poznań	0101000020E6100000BE2D006088D330409CF1FF5FE3354A40	Poland
675	Rzeszów-Jasionka Airport	RZE	Rzeszów	0101000020E61000006DDDFF1FDD043640A11A0080140E4940	Poland
676	Szczecin-Goleniów \\Solidarność\\" Airport"	SZZ	Szczecin	0101000020E6100000E32F0020EDCD2D40BC070080D7CA4A40	Poland
677	Redzikowo Air Base	OSP	Słupsk	0101000020E610000000000020851B3140000000A04C3D4B40	Poland
678	Swidwin Military Air Base	\\N	Świdwin	0101000020E61000007B5B00C010A72F401301006032E54A40	Poland
679	Warsaw Chopin Airport	WAW	Warsaw	0101000020E610000022DCFFDF93F734402FF1FF9F35154A40	Poland
680	Copernicus Wrocław Airport	WRO	Wrocław	0101000020E6100000192D00C0C3E2304029080040258D4940	Poland
681	Zielona Góra-Babimost Airport	IEG	Zielona Góra	0101000020E61000009BABFF1FE2982F4055F3FF5FBA114A40	Poland
682	Malmen Air Base	\\N	Linköping	0101000020E610000000000080280D2F40000000A07E334D40	Sweden
683	Bråvalla Air Base	\\N	Norrköping	0101000020E610000000000080851A304000000000324E4D40	Sweden
684	Uppsala Airport	\\N	Uppsala	0101000020E610000000000080AE963140000000C0DAF24D40	Sweden
685	Ronneby Airport	RNB	Ronneby	0101000020E61000008B000020AE872E400D00004023224C40	Sweden
686	Råda Air Base	\\N	Lidköping	0101000020E6100000000000003D1B2A40000000C0C13F4D40	Sweden
687	Gothenburg-Landvetter Airport	GOT	Landvetter	0101000020E6100000DDFFFFFF418F2840F5FFFF9FD6D44C40	Sweden
688	Jönköping Airport	JKG	Jönköping	0101000020E6100000000000A02C232C4000000000F9E04C40	Sweden
689	Falköping Airport	\\N	Falköping	0101000020E610000000000020F42C2B4000000000BC154D40	Sweden
690	Lidköping-Hovby Airport	LDK	Lidköping	0101000020E6100000580000004B592A402C000080953B4D40	Sweden
691	Gothenburg City Airport	GSE	Landvetter	0101000020E610000000000020A5BD27400000006029E34C40	Sweden
692	Skövde Airport	KVB	Skövde	0101000020E6100000000000C005F22B40000000606B3A4D40	Sweden
693	Trollhättan-Vänersborg Airport	THN	Trollhättan	0101000020E6100000000000E0A3B0284000000080B7284D40	Sweden
694	Karlsborg Air Base	\\N	Tibro	0101000020E6100000000000A0A2032D4000000040C4414D40	Sweden
695	Såtenäs Air Base	\\N	Vänersborg	0101000020E6100000000000E0C56D29400000004094364D40	Sweden
696	Barkarby Airport	\\N	Stockholm	0101000020E61000009C1100C0D3E131406F10F87E0DB54D40	Sweden
697	Karlskoga Airport	KSK	Karlskoga	0101000020E6100000000000A0E6FD2C400000008046AC4D40	Sweden
698	Mora Airport	MXX	Mora	0101000020E610000000000040D6052D40000000809C7A4E40	Sweden
699	Stockholm Skavsta Airport	NYO	Stockholm	0101000020E61000000000000086E93040000000E0F0644D40	Sweden
700	Arvika Airport	\\N	Arvika	0101000020E6100000000000605F472940000000E083D64D40	Sweden
701	Emmaboda Airfield	\\N	Nybro	0101000020E6100000D93D7958A8352F406B2A8BC22E4E4C40	Sweden
702	Feringe Airport	\\N	Ljungby	0101000020E61000004FC7FFFFE8D72B409DF1FF5FA3794C40	Sweden
703	Kristianstad Airport	KID	Kristianstad	0101000020E6100000000000A0C62B2C4000000040FAF54B40	Sweden
704	Landskrona Airport	JLD	Landskrona	0101000020E6100000000000A070BD29400000008016F94B40	Sweden
705	Oskarshamn Airport	OSK	Oskarshamn	0101000020E6100000CDFFFFDF7C7F30400F000020DDAC4C40	Sweden
706	Anderstorp Airport	\\N	Anderstorp	0101000020E610000000000080E4322B4000000040D1A14C40	Sweden
707	Kalmar Airport	KLR	Kalmar	0101000020E610000000000020A049304000000080BE574C40	Sweden
708	Malmö Sturup Airport	MMX	Malmö	0101000020E6100000F3A4FFFF9CC02A40528677A7A5C44B40	Sweden
709	Halmstad Airport	HAD	Halmstad	0101000020E610000000000040F1A329400000000076584C40	Sweden
710	Hagshult Airport	\\N	Värnamo	0101000020E610000081BEFF1F3F462C40331A00C066A54C40	Sweden
1168	Damazin Airport	\\N	Ad-Damazin	0101000020E6100000C5190000192B41400449008061922740	Sudan
711	Växjö Kronoberg Airport	VXO	Växjö	0101000020E610000000000060BC742D40000000C0EC764C40	Sweden
715	Gällivare Airport	GEV	Gällivare	0101000020E6100000000000A089D034400000004079C85040	Sweden
716	Hudiksvall Airport	HUV	Hudiksvall	0101000020E6100000403200C0A81431400BF2FF1F51E24E40	Sweden
718	Kramfors Sollefteå Airport	KRF	Kramfors	0101000020E6100000000000A0D6C431400000008038864F40	Sweden
719	Lycksele Airport	LYC	Lycksele	0101000020E6100000000000E058B732400000006017235040	Sweden
720	Optand Airport	\\N	Östersund	0101000020E6100000000000A0089B2D400000000076904F40	Sweden
721	Sundsvall-Härnösand Airport	SDL	Sundsvall	0101000020E610000000000060A3713140000000C098434F40	Sweden
722	Örnsköldsvik Airport	OER	Örnsköldsvik	0101000020E6100000000000A070FD32400000002043B44F40	Sweden
723	Piteå Airport	\\N	Piteå	0101000020E6100000000000C0C3423540000000C07D595040	Sweden
724	Kiruna Airport	KRN	Kiruna	0101000020E6100000F7FFFF7F38563440E3FFFF9F9BF45040	Sweden
725	Orsa Airport	\\N	Orsa	0101000020E6100000000000E0D96C2D40000000E051984E40	Sweden
726	Skellefteå Airport	SFT	Skellefteå	0101000020E6100000000000C0AF133540000000C0FC275040	Sweden
727	Sättna Airport	\\N	Timrå	0101000020E6100000EC3026FDBD003140AF25E4839E3D4F40	Sweden
728	Umeå Airport	UME	Umeå	0101000020E61000007AFFFF9F65483440280000C059E54F40	Sweden
731	Örebro Airport	ORB	Örebro	0101000020E6100000000000C074132E4000000040A29C4D40	Sweden
733	Stockholm Västerås Airport	VST	Västerås	0101000020E6100000000000A033A230400000008071CB4D40	Sweden
734	Luleå Airport	LLA	Luleå	0101000020E6100000750000603B1F3640070000A0CD625040	Sweden
736	Arboga Airport	\\N	Arboga	0101000020E6100000000000A023D92F40000000207CB14D40	Sweden
737	Stockholm-Arlanda Airport	ARN	Stockholm	0101000020E61000007EFFFF5F29EB3140E6FFFF7F71D34D40	Sweden
738	Stockholm-Bromma Airport	BMA	Stockholm	0101000020E61000000000004013F13140000000005DAD4D40	Sweden
739	Borlange Airport	BLE	Borlänge	0101000020E610000000000040C8072F400000002004364E40	Sweden
740	Hultsfred Airport	HLF	Hultsfred	0101000020E610000057FFFF9F87A52F40C5FFFF5F4DC34C40	Sweden
741	Gävle Sandviken Airport	GVX	Valbo	0101000020E6100000000000008FF3304000000040F14B4E40	Sweden
742	Linköping City Airport	LPI	Linköping	0101000020E610000059D9FF7F6A5C2F4075ECFF5FFE334D40	Sweden
743	Norrköping Airport	NRK	Norrköping	0101000020E61000000000006027403040000000E00B4B4D40	Sweden
745	Eskilstuna Airport	\\N	Eskilstuna	0101000020E6100000000000C059B53040000000E0F0AC4D40	Sweden
746	Visby Airport	VBY	Visby	0101000020E6100000D2FFFF9FA0583240F5FFFF9FD6D44C40	Sweden
748	Kalixfors Airport	\\N	Kiruna	0101000020E6100000000000E0D741344000000080F2F05040	Sweden
750	Spangdahlem Air Base	SPM	Bitburg	0101000020E6100000F6FBFFBF1EC51A408910006081FC4840	Germany
751	Ramstein Air Base	RMS	Ramstein-Miesenbach	0101000020E6100000000000C0AF661E4000000060ECB74840	Germany
753	[Duplicate] Giebelstadt Army Air Field	GHF	Ochsenfurt	0101000020E6100000BFFFFFBFD7EE2340AAE9FFFFF4D24840	Germany
754	Bückeburg Air Base	\\N	Bückeburg	0101000020E6100000B56CAD2F122A2240CFF753E3A5234A40	Germany
755	Celle Airport	ZCN	Celle	0101000020E6100000000000C0500B244000000080AC4B4A40	Germany
756	Rheine Bentlage Air Base	\\N	Rheine	0101000020E61000003F355EBA498C1D405FD0420246254A40	Germany
757	Fritzlar Airport	\\N	Fritzlar	0101000020E6100000DF4F8D976E922240910F7A36AB8E4940	Germany
758	Laupheim Air Base	\\N	Laupheim	0101000020E61000006E693524EED12340B62BF4C1321C4840	Germany
759	Mendig Airport	\\N	Mendig	0101000020E6100000B1EEFFDFE5421D40461B0020D92E4940	Germany
760	Niederstetten Army Air Base	\\N	Niederstetten	0101000020E610000000FDBE7FF3EA2340556AF6402BB24840	Germany
761	Roth Airport	\\N	Roth	0101000020E6100000000000604D33264000000000D79B4840	Germany
762	Fassberg Air Base	\\N	Faßberg	0101000020E6100000766D6FB7245F2440D07CCEDDAE754A40	Germany
763	Grafenwohr Army Air Field	\\N	Grafenwöhr	0101000020E6100000000000E061E12740000000006FD94840	Germany
764	Hanau Army Air Field	ZNF	Erlensee	0101000020E61000003F52448655EC2140AAB9DC60A8154940	Germany
765	Hohenfels Army Air Field	\\N	Parsberg	0101000020E61000000000004015AC2740000000C0EA9B4840	Germany
766	Kitzingen Army Air Field	\\N	Kitzingen	0101000020E610000000000000B5662440000000E01DDF4840	Germany
767	Nordholz Naval Airbase	\\N	Nordholz	0101000020E6100000B7FAFFDF2651214021F9FFFF43E24A40	Germany
768	Diepholz Air Base	\\N	Diepholz	0101000020E610000084F1D3B837AF204000FDBE7FF34A4A40	Germany
769	Geilenkirchen Air Base	GKE	Geilenkirchen	0101000020E610000008C90226702B184097FF907EFB7A4940	Germany
770	Hohn Airport	\\N	Fockbek	0101000020E6100000000000008B13234000000020F6274B40	Germany
771	Jever Air Base	\\N	Jever	0101000020E6100000CBBE2B82FF8D1F4010B1C1C249C44A40	Germany
772	Rostock-Laage Airport	RLG	Schwaan	0101000020E610000074A9FF5F7D8E2840BFEDFF9F87F54A40	Germany
773	Nörvenich Air Base	\\N	Nörvenich	0101000020E610000052D50451F7A11A40B537F8C2646A4940	Germany
774	Schleswig Air Base	\\N	Schleswig	0101000020E61000002AE3DF675C08234093020B60CA3A4B40	Germany
775	Wittmundhafen Airport	\\N	Wittmund	0101000020E61000000000008058AB1E40000000401EC64A40	Germany
777	Wunstorf Air Base	\\N	Wunstorf	0101000020E610000026AAB706B6DA22405B43A9BD883A4A40	Germany
778	Vilseck Army Air Field	\\N	Vilseck	0101000020E610000000000080CE882740000000C019D14840	Germany
779	Coleman Army Air Field	\\N	Lampertheim	0101000020E61000000000008041ED20400000000024C84840	Germany
780	Wiesbaden Army Airfield	\\N	Wiesbaden	0101000020E6100000000000E09AA62040000000E05F064940	Germany
781	Landsberg Lech Air Base	\\N	Landsberg am Lech	0101000020E61000001D5A643BDFCF2540AE10566309094840	Germany
782	Büchel Air Base	\\N	Cochem	0101000020E61000004EF5FF9FD9401C407AF5FF1F3F164940	Germany
783	Erding Airport	\\N	Erding	0101000020E610000000000000BCE527400000002041294840	Germany
784	Fürstenfeldbruck Airport	FEL	Fürstenfeldbruck	0101000020E6100000000000E0AC882640000000A04F1A4840	Germany
785	Holzdorf Air Base	\\N	Herzberg	0101000020E610000012143FC6DC552A406473D53C47E24940	Germany
786	Ingolstadt Manching Airport	IGS	Ingolstadt	0101000020E61000000000008068112740000000009C5B4840	Germany
787	Lechfeld Airport	\\N	Untermeitingen	0101000020E610000000000040EFB8254000000080BE174840	Germany
788	Neuburg AFB	\\N	Neuburg an der Donau	0101000020E61000003F355EBA496C26408E3EE603025B4840	Germany
789	Gütersloh Air Base	GUT	Gütersloh	0101000020E61000003F912749D79C20403868AF3E1EF64940	Germany
792	Brakpan Airport	\\N	Brakpan	0101000020E6100000000000C0424D3C40000000E0143D3AC0	South Africa
793	Bisho Airport	BIY	Bhisho	0101000020E6100000170A002073473B401E160020D47240C0	South Africa
794	Bram Fischer International Airport	BFN	Bloemfontein	0101000020E6100000D00B00206A4D3A405AFCFF1FBB173DC0	South Africa
795	Bethlehem Airport	\\N	Bethlehem	0101000020E6100000D9DAFF9F0A563C4039030020973F3CC0	South Africa
796	Hendrik Potgieter Airport	\\N	Bothaville	0101000020E61000000000004013A13A40000000A0E65D3BC0	South Africa
797	Cape Town International Airport	CPT	Cape Town	0101000020E610000048FEFFFF089A324077EFFF9F7EFB40C0	South Africa
798	Calvinia Airport	\\N	Calvinia	0101000020E6100000000000A0D4B93340000000A013803FC0	South Africa
799	King Shaka International Airport	DUR	Durban	0101000020E610000015F4941DA61E3F402AE8293B4C9D3DC0	South Africa
800	Ben Schoeman Airport	ELS	East London	0101000020E6100000F6CDFF1F6ED33B40730900808E8440C0	South Africa
801	Ermelo Airport	\\N	Ermelo	0101000020E610000000000020D4FA3D40000000A0DF7E3AC0	South Africa
802	Ficksburg Sentraoes Airport	\\N	Clocolan	0101000020E6100000000000A0ADE83B40000000A0B6D23CC0	South Africa
803	Grand Central Airport	GCJ	Johannesburg	0101000020E610000070E3FF9FDD233C406C2000207EFC39C0	South Africa
804	George Airport	GRJ	George	0101000020E6100000773200A0FF603640BB070080B70041C0	South Africa
806	Graaff Reinet Airport	\\N	Graaff-Reinet	0101000020E610000000000040998A3840000000E0C71840C0	South Africa
807	Grahamstown Airport	\\N	Grahamstown	0101000020E610000000000080837F3A400000000071A440C0	South Africa
808	Greytown Airport	\\N	Greytown	0101000020E61000008933000032963E405BFFFF5F3B1F3DC0	South Africa
809	Harmony Airport	\\N	Virginia	0101000020E6100000000000A077DC3A40000000A025143CC0	South Africa
810	Harrismith Airport	\\N	Harrismith	0101000020E6100000000000E02F1B3D40000000802F3C3CC0	South Africa
811	Hoedspruit Air Force Base Airport	HDS	Thulamahashi	0101000020E610000042D2FF9F770C3F4069D7FF9F5C5E38C0	South Africa
812	Gariep Dam Airport	\\N	Colesberg	0101000020E6100000000000A03E87394000000060EC8F3EC0	South Africa
813	OR Tambo International Airport	JNB	Johannesburg	0101000020E6100000E5D022DBF93E3C406B9A779CA2233AC0	South Africa
814	P C Pelser Airport	\\N	Klerksdorp	0101000020E6100000000000E0CEB73A400000006000DF3AC0	South Africa
815	Kimberley Airport	KIM	Kimberley	0101000020E61000009B310020E4C338401D33004084CD3CC0	South Africa
816	Krugersdorp Airport	\\N	Krugersdorp	0101000020E6100000F1D4FF8FD5B93B40BEA3EA01B1143AC0	South Africa
817	Kroonstad Airport	\\N	Kroonstad	0101000020E610000000000040D8503B40000000201DA93BC0	South Africa
818	Johan Pienaar Airport	KMH	Kuruman	0101000020E6100000000000805169374000000040EA743BC0	South Africa
820	Lanseria Airport	HLA	Johannesburg	0101000020E61000002AE8FFDF14ED3B400912008041F039C0	South Africa
821	Lichtenburg Airport	\\N	Lichtenburg	0101000020E610000000000000422F3A40000000A0FA2C3AC0	South Africa
822	Makhado Air Force Base Airport	\\N	Louis Trichardt	0101000020E6100000000000E04DB23D4000000040EF2837C0	South Africa
823	Langebaanweg Airport	\\N	Saldanha	0101000020E6100000D1CBFF5F09293240A60300E0047C40C0	South Africa
824	Ladysmith Airport	LAY	Ekuvukeni	0101000020E6100000DE260060ECBF3D4057D6FF3FEA943CC0	South Africa
825	Middelburg Airport	\\N	Middelburg	0101000020E610000000000000B1703D40000000004FAF39C0	South Africa
827	Margate Airport	MGH	Margate	0101000020E6100000F50D00E0CE573E40712600A07EDB3EC0	South Africa
828	Marble Hall Airport	\\N	Siyabuswa	0101000020E61000000000004079483D40000000A035FD38C0	South Africa
829	Majuba Power Station Airport	\\N	Volksrust	0101000020E61000005A1F00C04BC73D40622E00004D143BC0	South Africa
831	Riverside Airport	\\N	Komatipoort	0101000020E6100000911F00A0A2933F40A11A0080146E39C0	South Africa
832	Morningside Farm Airport	MEZ	Koster	0101000020E6100000A6E0FF3FB4E83A404D2700205AB439C0	South Africa
834	Newcastle Airport	NCS	Newcastle	0101000020E610000031F7FF1F16FA3D4034DAFFFF45C53BC0	South Africa
835	Nylstroom Airfield	\\N	Modimolle	0101000020E6100000000000A0556F3C4000000040A4AF38C0	South Africa
836	Overberg Airport	\\N	Bredasdorp	0101000020E6100000F6CAFFDF2D4034403BE6FFFF064741C0	South Africa
837	Oudtshoorn Airport	DUH	Oudtshoorn	0101000020E610000015E4FF3F6230364011FEFF1FB2CD40C0	South Africa
838	Port Elizabeth Airport	PLZ	Port Elizabeth	0101000020E6100000B7210060079E39408BF3FF3F11FE40C0	South Africa
839	Plettenberg Bay Airport	\\N	Plettenberg Bay	0101000020E61000001EDBFF3727543740771C16D5480B41C0	South Africa
840	Hendrik Van Eck Airport	PHW	Phalaborwa	0101000020E610000043F5FF3FC8273F40DE260060ECEF37C0	South Africa
841	Pietersburg Municipal Airport	\\N	Polokwane	0101000020E610000091DCFF9F017C3D402AE8FFDF14ED37C0	South Africa
842	Port St Johns Airport	\\N	Port Saint John’s	0101000020E6100000000000A011853D40000000401C9B3FC0	South Africa
843	Pietermaritzburg Airport	PZB	Pietermaritzburg	0101000020E61000008BF3FF3F11663E40ACCCFFDF24A63DC0	South Africa
844	Pilanesberg International Airport	NTY	Rustenburg	0101000020E610000022F9FFFF632C3B401C1300E0735539C0	South Africa
845	Polokwane International Airport	PTG	Mokopane	0101000020E61000007E74EACA67753D409752978C63D837C0	South Africa
846	Potchefstroom Airport	\\N	Potchefstroom	0101000020E610000041CFFF5FF7143B40B21800A0C6AB3AC0	South Africa
847	Parys Airport	\\N	Parys	0101000020E6100000000000E0DE803B4000000020A9E33AC0	South Africa
848	Queenstown Airport	UTW	Queenstown	0101000020E6100000000000E0D7E13A400000004092EB3FC0	South Africa
849	Richards Bay Airport	RCB	Richards Bay	0101000020E6100000CE0800E0C90B404012FEFF1FB2BD3CC0	South Africa
850	Rustenburg Airport	\\N	Rustenburg	0101000020E6100000321A00C066453B4009EFFFDFF0A439C0	South Africa
851	Robertson Airport	ROD	Robertson	0101000020E6100000000000E01DE7334000000020F6E740C0	South Africa
852	Springbok Airport	SBU	Springbok	0101000020E6100000000000A089F031400000000076B03DC0	South Africa
853	Secunda Airport	\\N	Secunda	0101000020E6100000DFE6FF9F8B2B3D40D81A00602B863AC0	South Africa
854	Saldanha /Vredenburg Airport	\\N	Saldanha	0101000020E610000021F9FFFF23F83140BFEDFF9F677B40C0	South Africa
855	Springs Airfield	\\N	Brakpan	0101000020E610000025220020F5653C400BB89DB5D83F3AC0	South Africa
856	Swartkop Air Force Base	\\N	Centurion	0101000020E61000001BF0FF3F232A3C4045F8FF7F48CF39C0	South Africa
857	Sishen Airport	SIS	Kathu	0101000020E61000000B350020D2FF3640D9DAFF9F0AA63BC0	South Africa
858	Hendrik Swellengrebel Airport	\\N	Swellendam	0101000020E6100000000000607F793440000000602B0641C0	South Africa
859	Skukuza Airport	SZK	Thulamahashi	0101000020E6100000ABE9FFFFB4963F40EFE1FF7FFDF538C0	South Africa
861	New Tempe Airport	\\N	Bloemfontein	0101000020E61000000000008058283A40000000206C083DC0	South Africa
862	Tutuka Power Station Airport	\\N	Standerton	0101000020E61000005D0200A0BB563D407EDBFF3FCFC63AC0	South Africa
863	Tzaneen Airport	LTA	Tzaneen	0101000020E6100000622E00004D543E40E2E9FFDF0BD337C0	South Africa
864	Prince Mangosuthu Buthelezi Airport	ULD	Ulundi	0101000020E6100000F83300C09F6A3F401CD0FFDF12523CC0	South Africa
865	Pierre Van Ryneveld Airport	UTN	Upington	0101000020E6100000E20C00809C423540D81A00602B663CC0	South Africa
866	K. D. Matanzima Airport	UTT	Mthatha	0101000020E61000000DD5FFFF60AC3C4048E22A75DE8B3FC0	South Africa
867	Vryburg Airport	VRU	Vryburg	0101000020E61000001BCDFF9F92BA3840712600A07EFB3AC0	South Africa
868	Virginia Airport	VIR	Durban	0101000020E610000000000040F30E3F400000000046C53DC0	South Africa
869	Vredendal Airport	\\N	Vredendal	0101000020E610000000000000788B3240000000A018A43FC0	South Africa
870	Vereeniging Airport	\\N	Vereeniging	0101000020E6100000B8010000F7F53B40773200A0FF903AC0	South Africa
871	Wonderboom Airport	PRY	Pretoria	0101000020E6100000C0CB0C1B65393C40BADA8AFD65A739C0	South Africa
872	Witbank Airport	\\N	Witbank	0101000020E6100000BAE4FFDF26313D40072F00A011D539C0	South Africa
873	Waterkloof Air Force Base	\\N	Centurion	0101000020E6100000AFF2FFBFF5383C4057F9FFDF7AD439C0	South Africa
874	Welkom Airport	WEL	Welkom	0101000020E610000084E7FF3FD0A93A40930623E42FFF3BC0	South Africa
875	Ysterplaat Air Force Base	\\N	Rosebank	0101000020E6100000000000A0907F3240000000C039F340C0	South Africa
876	Zeerust Airport	\\N	Zeerust	0101000020E610000000000020D40A3A4000000020589939C0	South Africa
877	Francistown Airport	FRW	Francistown	0101000020E6100000000000E078793B4000000080DB2835C0	Botswana
879	Kasane Airport	BBK	Kasane	0101000020E61000000000000093293940000000E038D531C0	Botswana
880	Maun Airport	MUB	Maun	0101000020E6100000000000A05C6E374000000060FCF833C0	Botswana
881	Sir Seretse Khama International Airport	GBE	Kopong	0101000020E6100000000000200FEB3940000000A0218E38C0	Botswana
882	Selebi Phikwe Airport	PKW	Selebi-Phikwe	0101000020E6100000C0EC9E3C2CD43B40575BB1BFEC0E36C0	Botswana
883	Maya-Maya Airport	BZV	Brazzaville	0101000020E61000000000004089812E40000000A0BD0111C0	Republic of the Congo
884	Owando Airport	FTX	Owando	0101000020E61000000000008073E62F40000000C0D100E1BF	Republic of the Congo
885	Ouesso Airport	OUE	Ouésso	0101000020E61000001D1300E0B30930403B3E006018DBF93F	Republic of the Congo
886	Pointe Noire Airport	PNR	Pointe-Noire	0101000020E610000000000060F0C52740000000609D4313C0	Republic of the Congo
887	Matsapha Airport	MTS	Manzini	0101000020E610000000000060B84E3F40000000806C873AC0	Swaziland
888	Bangui M'Poko International Airport	BGF	Bangui	0101000020E610000000000020D0843240000000200B981140	Central African Republic
889	Berbérati Airport	BBT	Berbérati	0101000020E610000000000000A3922F40000000E0E5E21040	Central African Republic
890	Bata Airport	BSG	Bata	0101000020E610000000000020829C234000000020CE7CFE3F	Equatorial Guinea
891	Malabo Airport	SSG	Malabo	0101000020E610000000000060DD6A214000000000CB0A0E40	Equatorial Guinea
892	RAF Ascension Island	ASI	Georgetown	0101000020E61000000000000093C92CC0000000E0DEE01FC0	Saint Helena
893	Sir Seewoosagur Ramgoolam International Airport	MRU	Plaine Magnien	0101000020E61000000000004080D74C40000000A0216E34C0	Mauritius
894	Sir Charles Gaetan Duval Airport	RRG	Port Mathurin	0101000020E61000000000004035AE4F40000000A0F8C133C0	Mauritius
896	Tiko Airport	TKC	Tiko	0101000020E61000003B06006097B82240231100A0545B1040	Cameroon
897	Douala International Airport	DLA	Douala	0101000020E61000007DFBFF9F5F70234051EDFFDF39061040	Cameroon
898	Salak Airport	MVR	Maroua	0101000020E6100000000000E0C9832C40000000E01DE72440	Cameroon
899	Foumban Nkounja Airport	FOM	Foumban	0101000020E6100000000000E068802540000000C0348C1640	Cameroon
900	N'Gaoundéré Airport	NGE	Ngaoundéré	0101000020E6100000000000804F1E2B4000000000946D1D40	Cameroon
901	Garoua International Airport	GOU	Garoua	0101000020E6100000000000C07DBD2A40000000C0F9AB2240	Cameroon
902	Bafoussam Airport	BFX	Bafoussam	0101000020E6100000F10400208EB52440F3070060CE251640	Cameroon
903	Bamenda Airport	BPC	Bamenda	0101000020E610000000000060C53E2440000000802E281840	Cameroon
904	Yaoundé Airport	YAO	Yaoundé	0101000020E610000000000040080C2740000000C035B00E40	Cameroon
905	Kasompe Airport	\\N	Chingola	0101000020E6100000820000A0D6E43B4096FFFFFF452529C0	Zambia
906	Livingstone Airport	LVI	Livingstone	0101000020E6100000000000809CD239400000008061D231C0	Zambia
907	Kenneth Kaunda International Airport Lusaka	LUN	Lusaka	0101000020E610000070E3FF9FDD733C406A5D00A05EA92EC0	Zambia
909	Mongu Airport	\\N	Mongu	0101000020E6100000000000808C293740000000E04D822EC0	Zambia
910	Simon Mwansa Kapwepwe International Airport	NLA	Ndola	0101000020E6100000370000E036AA3C409E00000007FF29C0	Zambia
911	Southdowns Airport	KIW	Kalulushi	0101000020E6100000000000E05F263C40000000600ECD29C0	Zambia
912	Prince Said Ibrahim International Airport	HAH	Moroni	0101000020E610000026E4839ECDA245401AC05B20411127C0	Comoros
913	Mohéli Bandar Es Eslam Airport	NWA	Fomboni	0101000020E61000000000006019E24540000000A0A09828C0	Comoros
914	Ouani Airport	AJN	Ouani	0101000020E61000000000002014374640000000206E4328C0	Comoros
915	Dzaoudzi Pamandzi International Airport	DZA	Dzaoudzi	0101000020E610000000000020FBA34640000000A0019C29C0	Mayotte
916	Roland Garros Airport	RUN	Sainte-Marie	0101000020E61000000000008051C14B400000000019E334C0	Reunion
917	Pierrefonds Airport	ZSE	Saint-Louis	0101000020E61000000000006066B64B4000000080265235C0	Reunion
918	Ivato Airport	TNR	Antananarivo	0101000020E6100000CB02006049BD474091DCFF9F01CC32C0	Madagascar
919	Miandrivazo Airport	ZVA	Miandrivazo	0101000020E6100000000000E0B3B94640000000A0139033C0	Madagascar
920	Sainte Marie Airport	SMS	Ambodifotatra	0101000020E6100000000000206CE84840000000E0091831C0	Madagascar
921	Toamasina Airport	TMM	Toamasina	0101000020E6100000000000803DB2484000000040081C32C0	Madagascar
922	Morondava Airport	MOQ	Morondava	0101000020E610000000000020A728464000000020E24834C0	Madagascar
923	Arrachart Airport	DIE	Antsiranana	0101000020E61000000000006056A5484000000080E4B228C0	Madagascar
924	Mananara Nord Airport	WMR	Mananara	0101000020E6100000000000E00BE3484000000060F52930C0	Madagascar
925	Andapa Airport	ZWA	Andapa	0101000020E6100000000000E06FCF4840000000A0AB4D2DC0	Madagascar
926	Ambilobe Airport	AMB	Ambilobe	0101000020E6100000000000C0767E48400000000076602AC0	Madagascar
927	Antsirabato Airport	ANM	Antalaha	0101000020E610000000000060FC28494000000060B1FF2DC0	Madagascar
928	Analalava Airport	HVA	Antsohihy	0101000020E610000000000040C4E147400000000068422DC0	Madagascar
929	Amborovy Airport	MJN	Mahajanga	0101000020E610000068070030F52C4740B6DAE3476C552FC0	Madagascar
930	Fascene Airport	NOS	Hell-Ville	0101000020E6100000D81A00604B284840D35400A0CB9F2AC0	Madagascar
932	Maroantsetra Airport	WMN	Maroantsetra	0101000020E6100000000000401AD848400000002097DF2EC0	Madagascar
933	Sambava Airport	SVB	Sambava	0101000020E6100000000000A05C164940000000A0A48E2CC0	Madagascar
935	Ambalabe Airport	WAI	Antsohihy	0101000020E61000000000002038FF4740000000802FCC2DC0	Madagascar
936	Ampampamena Airport	IVA	Ambarakaraka	0101000020E6100000910E0F61FC504840B32781CD39F82AC0	Madagascar
937	Tôlanaro Airport	FTU	Fort Dauphin	0101000020E610000000000080617A4740000000E0C00939C0	Madagascar
938	Fianarantsoa Airport	WFI	Fianarantsoa	0101000020E6100000000000204C8E4740000000C00C7135C0	Madagascar
939	Farafangana Airport	RVA	Farafangana	0101000020E61000000000006009E947400000002028CE36C0	Madagascar
940	Manakara Airport	WVK	Manakara	0101000020E610000000000020C7024840000000A0A41E36C0	Madagascar
941	Mananjary Airport	MNJ	Mananjary	0101000020E6100000000000C0DC2D484000000020A93335C0	Madagascar
943	Toliara Airport	TLE	Toliara	0101000020E6100000000000803FDD454000000080266237C0	Madagascar
944	Mbanza Congo Airport	SSY	Mbanza Congo	0101000020E6100000000000C0767E2C40000000A0601419C0	Angola
945	Benguela Airport	BUG	Benguela	0101000020E6100000883000C0B1CE2A40F50D00E0CE3729C0	Angola
946	Cabinda Airport	CAB	Cabinda	0101000020E6100000000000007660284000000060516316C0	Angola
948	Nova Lisboa Airport	NOV	Huambo	0101000020E61000000000004060852F4000000020289E29C0	Angola
949	Kuito Airport	SVP	Cuito	0101000020E6100000ACFFFFBF88F23040D80000C027CF28C0	Angola
950	Lobito Airport	\\N	Lobito	0101000020E610000000000040BD122B40000000E00DBE28C0	Angola
951	Quatro de Fevereiro Airport	LAD	Luanda	0101000020E61000007EFEFFDF5F762A40E2FEFF3F7CB721C0	Angola
952	Malanje Airport	MEG	Malanje	0101000020E610000000000080F94F3040000000A0D80C23C0	Angola
953	Menongue Airport	SPP	Menongue	0101000020E6100000000000E044B8314000000000B1502DC0	Angola
955	Negage Airport	GXG	Uíge	0101000020E6100000000000604D932E40000000409E041FC0	Angola
957	Saurimo Airport	VHC	Saurimo	0101000020E610000000000000916E3440000000C0CD6023C0	Angola
958	Soyo Airport	SZA	Soio	0101000020E6100000000000A05CBE2840000000E0799018C0	Angola
959	Lubango Airport	SDD	Lubango	0101000020E61000000000006066262B400000004072D92DC0	Angola
960	Luena Airport	LUO	Luena	0101000020E6100000000000A0CFE5334000000060448927C0	Angola
961	Uige Airport	UGO	Uíge	0101000020E6100000000000C03B0E2E40000000208B691EC0	Angola
963	Oyem Airport	OYE	Oyem	0101000020E610000000000040AD2927400000002094B0F83F	Gabon
964	Okondja Airport	OKN	Okondja	0101000020E6100000000000A0A0582B40000000E06E49E5BF	Gabon
965	Lambarene Airport	LBQ	Lambaréné	0101000020E610000000000060CC7D2440000000C05A8AE6BF	Gabon
966	Bitam Airport	BMM	Bitam	0101000020E6100000000000C084FC264000000020E99A0040	Gabon
967	Port Gentil Airport	POG	Port-Gentil	0101000020E6100000000000203E822140000000E090C6E6BF	Gabon
969	Makokou Airport	MKU	Makokou	0101000020E61000000000000024C8294000000080E588E23F	Gabon
970	Libreville Leon M'ba International Airport	LBV	Libreville	0101000020E610000033FAFF5F16D3224054F4FFDFB359DD3F	Gabon
971	M'Vengue El Hadj Omar Bongo Ondimba International Airport	MVB	Franceville	0101000020E61000000000008041E02A40000000A0A17FFABF	Gabon
972	Principe Airport	PCP	Santo António	0101000020E6100000000000209FA51D4000000000679BFA3F	Sao Tome and Principe
973	São Tomé International Airport	TMS	São Tomé	0101000020E6100000000000E03DD91A40000000E00434D83F	Sao Tome and Principe
974	Beira Airport	BEW	Beira	0101000020E6100000000000402C744140000000E0E0CB33C0	Mozambique
976	Inhambane Airport	INH	Inhambane	0101000020E6100000000000C049B44140000000C05BE037C0	Mozambique
977	Lichinga Airport	VXC	Lichinga	0101000020E61000000000002016A24140000000C0498C2AC0	Mozambique
978	Lumbo Airport	\\N	Ilha de Moçambique	0101000020E6100000D3F1FF3FFA5544408D390080F2102EC0	Mozambique
979	Maputo Airport	MPM	Maputo	0101000020E6100000000000004B49404000000080B9EB39C0	Mozambique
981	Mocímboa da Praia Airport	MZB	Mocímboa	0101000020E6100000000000606D2D4440000000E03DB926C0	Mozambique
983	Nacala Airport	MNC	Nacala	0101000020E610000000000060295B444000000060F5F92CC0	Mozambique
984	Nampula Airport	APL	Nampula	0101000020E61000000000000012A443400000004011362EC0	Mozambique
985	Pemba Airport	POL	Pemba	0101000020E6100000000000E01243444000000040C8FB29C0	Mozambique
986	Quelimane Airport	UEL	Quelimane	0101000020E6100000000000A03E6F42400000000002DB31C0	Mozambique
988	Chingozi Airport	TET	Tete	0101000020E610000000000020F2D1404000000020D41A30C0	Mozambique
994	Seychelles International Airport	SEZ	Cascade	0101000020E610000000000060CAC24B400000002086B212C0	Seychelles
995	Praslin Airport	PRI	La Passe	0101000020E6100000000000C07FD84B4000000000F44611C0	Seychelles
997	Abeche Airport	AEH	Abéché	0101000020E61000000000000024D8344000000000AAB12B40	Chad
998	Moundou Airport	MQQ	Moundou	0101000020E61000000000004047123040000000A0B23F2140	Chad
999	N'Djamena International Airport	NDJ	N'Djamena	0101000020E61000000000008068112E400000006074442840	Chad
1000	Faya Largeau Airport	FYT	Faya-Largeau	0101000020E610000000000000711C334000000020C7EA3140	Chad
1001	Joshua Mqabuko Nkomo International Airport	BUQ	Bulawayo	0101000020E6100000000000C02E9E3C4000000060740434C0	Zimbabwe
1002	Charles Prince Airport	\\N	Harare	0101000020E610000000000020B9EC3E40000000E068C031C0	Zimbabwe
1003	Buffalo Range Airport	BFO	Chiredzi	0101000020E6100000000000201F943F40000000E0120235C0	Zimbabwe
1004	Victoria Falls International Airport	VFA	Victoria Falls	0101000020E6100000000000C0C8D63940000000E08C1832C0	Zimbabwe
1005	Harare International Airport	HRE	Harare	0101000020E6100000000000C0C1173F40000000808AEE31C0	Zimbabwe
1006	Kariba International Airport	KAB	Kariba	0101000020E6100000000000608FE23C40000000A0118530C0	Zimbabwe
1007	Mutoko Airport	\\N	Mutoko	0101000020E6100000000000C09D17404000000000916E31C0	Zimbabwe
1008	Mutare Airport	\\N	Mutare	0101000020E6100000DBFFFF1F4850404094FFFF1F5CFF32C0	Zimbabwe
1009	Masvingo International Airport	MVZ	Masvingo	0101000020E610000000000000EEDB3E4000000020280E34C0	Zimbabwe
1010	Zvishavane Airport	\\N	Zvishavane	0101000020E61000000000004094163E40000000A01C4A34C0	Zimbabwe
1011	Thornhill Air Base	GWE	Gweru	0101000020E610000000000080A5DC3D40000000E0B76F33C0	Zimbabwe
1013	Chileka International Airport	BLZ	Blantyre	0101000020E610000000000000AC7C414000000000B35B2FC0	Malawi
1014	Karonga Airport	KGJ	Karonga	0101000020E6100000000000E04DF24040000000603AE823C0	Malawi
1015	Kasungu Airport	\\N	Kasungu	0101000020E610000000000020FBBB4040000000A079072AC0	Malawi
1016	Lilongwe International Airport	LLW	Lilongwe	0101000020E6100000BD0A00C0F7E3404064EEFF3F2C942BC0	Malawi
1017	Mzuzu Airport	ZZU	Mzuzu	0101000020E6100000000000A082014140000000C0AFE326C0	Malawi
1018	Moshoeshoe I International Airport	MSU	Maseru	0101000020E6100000000000A0708D3B400000004059763DC0	Lesotho
1019	Mejametalana Airbase	\\N	Maseru	0101000020E610000000000060E5803B4000000080D94D3DC0	Lesotho
1020	Ndjili International Airport	FIH	Brazzaville	0101000020E6100000911F00A0A2E32E4012ECFFFF018B11C0	Republic of the Congo
1021	Ndolo Airport	NLO	Brazzaville	0101000020E61000008B000020AEA72E4000000000804E11C0	Republic of the Congo
1044	Senou Airport	BKO	Bamako	0101000020E610000000000020BDCC1FC0000000E026112940	Mali
1045	Gao Airport	GAQ	Gao	0101000020E6100000000000E0075976BF00000020973F3040	Mali
1046	Kayes Dag Dag Airport	KYS	Kayes	0101000020E6100000000000800DCF26C0000000E05FF62C40	Mali
1047	Mopti Airport	MZI	Mopti	0101000020E610000040040020785110C0683700C08D062D40	Mali
1048	Timbuktu Airport	TOM	Timbuktu	0101000020E610000000000020860F08C00000000002BB3040	Mali
1050	Banjul International Airport	BJL	Banjul	0101000020E6100000000000A0F6A630C0000000600EAD2A40	Gambia
1051	Fuerteventura Airport	FUE	Puerto del Rosario	0101000020E61000000000000044BA2BC000000020E4733C40	Spain
1053	La Palma Airport	SPC	Santa Cruz de la Palma	0101000020E6100000000000006FC131C00000004062A03C40	Spain
1054	Gran Canaria Airport	LPA	Carrizal	0101000020E610000000000060F0C52EC00000000091EE3B40	Spain
1055	Lanzarote Airport	ACE	Arrecife	0101000020E6100000000000C0DC352BC0000000400CF23C40	Spain
1056	Tenerife South Airport	TFS	Santa Cruz de Tenerife	0101000020E6100000F91300608F9230C09D340060640B3C40	Spain
1057	Tenerife Norte Airport	TFN	Santa Cruz de Tenerife	0101000020E610000066F1FF7F6C5730C092FFFF3F927B3C40	Spain
1058	Melilla Airport	MLN	Melilla	0101000020E6100000DA1D00A06BA607C086EAFF7FD0A34140	Spain
1059	Lungi International Airport	FNA	Tintafor	0101000020E6100000000000A018642AC0000000009E3B2140	Sierra Leone
1060	Cufar Airport	\\N	Catió	0101000020E6100000000000806A5C2EC0000000A067932640	Guinea-Bissau
1062	Spriggs Payne Airport	MLW	Monrovia	0101000020E610000000000060748425C000000060FF271940	Liberia
1063	Roberts International Airport	ROB	Monrovia	0101000020E6100000000000607FB924C0000000A066EF1840	Liberia
1064	Al Massira Airport	AGA	Agadir	0101000020E6100000000000E07DD322C00000004033533E40	Morocco
1065	Tan Tan Airport	TTA	Tan-Tan	0101000020E6100000000000E0955226C000000040BD723C40	Morocco
1066	Saïss Airport	FEZ	Fès	0101000020E6100000F2FCFF5F6EE913C08FF9FFBFB1F64040	Morocco
1067	Ifrane Airport	\\N	Ifrane	0101000020E6100000000000E0919C14C0000000A0ADC04040	Morocco
1069	Bassatine Airport	MEK	Meknès	0101000020E6100000000000A07B0F16C00000006086F04040	Morocco
1070	Angads Airport	OUD	Oujda-Angad	0101000020E6100000000000C0A9C8FEBF00000000C3644140	Morocco
1071	Ben Slimane Airport	\\N	Mohammedia	0101000020E61000001F0100C0C3E21CC0A1FAFF1FE4D34040	Morocco
1072	Rabat-Salé Airport	RBA	Rabat	0101000020E6100000000000808E011BC00000008097064140	Morocco
1074	Mohammed V International Airport	CMN	Casablanca	0101000020E610000000000020215C1EC0000000400AAF4040	Morocco
1075	Menara Airport	RAK	Marrakesh	0101000020E61000002E0A00E0951220C0EA1B00C05D9B3F40	Morocco
1076	Kenitra Airport	NNA	Kenitra	0101000020E6100000000000602E621AC00000006042264140	Morocco
1077	Ouarzazate Airport	OZZ	Ouarzazat	0101000020E61000008D0800A041A31BC0C7FCFFDF68F03E40	Morocco
1078	Cherif Al Idrissi Airport	AHU	Imzouren	0101000020E61000000000004056B70EC000000040AB964140	Morocco
1079	Saniat R'mel Airport	TTU	Tétouan	0101000020E6100000E8FFFF5FB34715C0DDFFFFFF11CC4140	Morocco
1080	Ibn Batouta Airport	TNG	Tangier	0101000020E610000029080040E5AA17C0561600000BDD4140	Morocco
1081	Ziguinchor Airport	ZIG	Ziguinchor	0101000020E6100000A60BB1FA234830C0B1506B9A771C2940	Senegal
1082	Cap Skirring Airport	CSK	Tionk Essil	0101000020E61000000000006000BF30C0000000C005D22840	Senegal
1083	Kaolack Airport	KLC	Kaolack	0101000020E610000000000000220D30C000000080364B2C40	Senegal
1084	Léopold Sédar Senghor International Airport	DKR	Dakar	0101000020E6100000000000C07D7D31C000000000BA7A2D40	Senegal
1085	Saint Louis Airport	XLS	Saint-Louis	0101000020E610000000000040947630C000000040010D3040	Senegal
1086	Bakel Airport	BXE	Diawara	0101000020E610000000000000C5EF28C000000040D1B12D40	Senegal
1087	Kédougou Airport	KGG	Kédougou	0101000020E610000000000020CB7028C00000008004252940	Senegal
1088	Tambacounda Airport	TUD	Tambacounda	0101000020E610000000000020634E2BC0000000E03D792B40	Senegal
1089	Aioun el Atrouss Airport	IEO	Aioun	0101000020E610000000000040984623C0000000C017B63040	Mauritania
1090	Tidjikja Airport	TIY	Tidjikja	0101000020E610000000000000D5D826C000000020F2913240	Mauritania
1091	Kiffa Airport	KFA	Kiffa	0101000020E610000000000080F9CF26C0000000400A973040	Mauritania
1092	Néma Airport	EMN	Néma	0101000020E6100000000000C032441DC0000000603B9F3040	Mauritania
1093	Kaédi Airport	KED	Kaédi	0101000020E610000000000020E4032BC000000000D5283040	Mauritania
1094	Nouakchott International Airport	NKC	Dar Naim	0101000020E6100000000000C0A1E52FC0000000A023193240	Mauritania
1095	Sélibaby Airport	SEY	Sélibaby	0101000020E610000000000040236A28C0000000A0015C2E40	Mauritania
1096	Atar International Airport	ATR	Atar	0101000020E6100000000000401E162AC0000000A0BD813440	Mauritania
1097	Nouadhibou International Airport	NDB	Nouadhibou	0101000020E610000000000020AE0731C0000000A0DFEE3440	Mauritania
1099	Fria Airport	FIG	Fria	0101000020E61000008B0000206E232BC08F0000E081B32440	Guinea
1100	Faranah Airport	FAA	Faranah	0101000020E61000000F5E0040238A25C05C6500002D122440	Guinea
1101	Tata Airport	LEK	Labé	0101000020E6100000EFFEFF7FD79228C068FFFF9FF6A62640	Guinea
1102	Amílcar Cabral International Airport	SID	Espargos	0101000020E6100000000000E00BF336C000000060CCBD3040	Cape Verde
1103	Rabil Airport	BVC	Vila de Sal Rei	0101000020E6100000000000008FE336C0000000A0F1223040	Cape Verde
1104	Maio Airport	MMO	Vila do Maio	0101000020E610000000000000B53637C000000020D24F2E40	Cape Verde
1105	Preguiça Airport	SNE	Vila da Ribeira Brava	0101000020E610000000000020E24838C000000060A1963040	Cape Verde
1106	São Pedro Airport	VXE	Mindelo	0101000020E610000000000020280E39C0000000A04CD53040	Cape Verde
1107	Addis Ababa Bole International Airport	ADD	Addis Ababa	0101000020E6100000791500804F66434070030000AEF42140	Ethiopia
1108	Lideta Army Airport	\\N	Addis Ababa	0101000020E61000001EA8531EDD5C4340B6F81400E3012240	Ethiopia
1109	Arba Minch Airport	AMH	Arba Minch	0101000020E61000000000008095CB4240000000E055281840	Ethiopia
1110	Axum Airport	AXU	Axum	0101000020E610000000000020EB62434000000060294B2C40	Ethiopia
1111	Bahir Dar Airport	BJR	Bahir Dar	0101000020E6100000000000402AA94240000000E058372740	Ethiopia
1112	Aba Tenna Dejazmach Yilma International Airport	DIR	Dire Dawa	0101000020E61000000000006056ED4440000000A0D83F2340	Ethiopia
1113	Gambella Airport	GMB	Gambēla	0101000020E6100000000000A013484140000000E0EC412040	Ethiopia
1114	Gonder Airport	GDQ	Gondar	0101000020E6100000000000408DB7424000000060300A2940	Ethiopia
1116	Jimma Airport	JIM	Jimma	0101000020E610000000000060866842400000008013AA1E40	Ethiopia
1117	Lalibella Airport	LLI	Lalībela	0101000020E6100000000000A0707D43400000004033F32740	Ethiopia
1118	Mekele Airport	MQX	Mek'ele	0101000020E6100000000000C049C44340000000004FEF2A40	Ethiopia
1119	Asosa Airport	ASO	Āsosa	0101000020E6100000000000E00B4B4140000000E078092440	Ethiopia
1120	Bujumbura International Airport	BJM	Bujumbura	0101000020E61000000000004089513D40000000C097970AC0	Burundi
1121	Egal International Airport	HGA	Hargeysa	0101000020E6100000000000C05D0B4640000000A04D092340	Somalia
1122	Berbera Airport	BBO	Berbera	0101000020E610000000000000767846400000004045C72440	Somalia
1123	Kisimayu Airport	KMU	Kismayo	0101000020E610000000000020C73A4540000000408D26D8BF	Somalia
1126	El Nouzha Airport	ALY	Alexandria	0101000020E610000000000020EBF23D4000000020142F3F40	Egypt
1128	Cairo International Airport	CAI	Cairo	0101000020E610000000000060D5673F40000000E0341F3E40	Egypt
1129	Cairo West Airport	\\N	Cairo	0101000020E61000003B0900A057EA3E40E5EFFF5FCC1D3E40	Egypt
1130	Hurghada International Airport	HRG	Hurghada	0101000020E6100000000000C052E6404000000020A52D3B40	Egypt
1131	El Gora Airport	EGR	Arish	0101000020E61000007DCEDDAE97104140B2D826158D113F40	Egypt
1132	Luxor International Airport	LXR	Luxor	0101000020E61000000FFBFFDF715A4040B21800A0C6AB3940	Egypt
1133	Mersa Matruh Airport	MUH	Mersa Matruh	0101000020E610000090D9FF5FC1383B40EBFBFF5F4D533F40	Egypt
1134	Port Said Airport	PSD	Port Said	0101000020E610000000000060B81E4040000000C086473F40	Egypt
1135	St Catherine International Airport	SKV	Dhahab	0101000020E6100000000000000008414002E3FFDF6FAF3C40	Egypt
1136	Aswan International Airport	ASW	Aswan	0101000020E6100000B0F2FFBFF5684040932200E0E2F63740	Egypt
1137	El Tor Airport	ELT	El-Tor	0101000020E6100000000000C09FD240400000000081353C40	Egypt
1138	Eldoret International Airport	EDL	Eldoret	0101000020E610000000000040949E4140000000C0A3E2D93F	Kenya
1139	Kakamega Airport	\\N	Kakamega	0101000020E610000030140040C66441403D0300E0AA5DD13F	Kenya
1140	Kisumu Airport	KIS	Kisumu	0101000020E6100000000000A04C5D4140000000A0340DB6BF	Kenya
1141	Kitale Airport	KTL	Kitale	0101000020E610000000000060B37A4140000000A0881AEF3F	Kenya
1143	Lodwar Airport	LOK	Lodwar	0101000020E6100000000000E0E9CD414000000060CBF90840	Kenya
1144	Manda Airstrip	LAU	Lamu	0101000020E610000000000080E0744440000000C0F40402C0	Kenya
1145	Mombasa Moi International Airport	MBA	Mombasa	0101000020E6100000000000C00ECC434000000080AA2310C0	Kenya
1146	Naivasha Airport	\\N	Naivasha	0101000020E6100000000000E07C37424000000040E936E9BF	Kenya
1147	Nairobi Wilson Airport	WIL	Nairobi	0101000020E6100000000000604B684240000000E0C325F5BF	Kenya
1148	Moi Air Base	\\N	Nairobi	0101000020E61000007FFEFFDF5F6E4240140400A0B26FF4BF	Kenya
1149	Wajir Airport	WJR	Wajir	0101000020E610000000000080B90B4440000000E059BBFB3F	Kenya
1152	Ghat Airport	GHT	Ghat	0101000020E61000009AEBFFDF0249244034DAFFFF45253940	Libya
1153	Kufra Airport	AKF	Al Jawf	0101000020E6100000000000406250374000000040BF2D3840	Libya
1154	Benina International Airport	BEN	Benghazi	0101000020E6100000F3E7FFFFFD44344020F9FFFF630C4040	Libya
1156	Sabha Airport	SEB	Sabhā	0101000020E610000000000080EBF12C4000000000ACFC3A40	Libya
1157	Tripoli International Airport	TIP	Tripoli	0101000020E61000004BC1FF7F68512A40EDFEFF9FED544040	Libya
1158	Marsa Brega Airport	\\N	Al Burayqah	0101000020E6100000000000008F93334000000020CB603E40	Libya
1160	Hon Airport	\\N	Hūn	0101000020E61000000000002063EE2F40000000802F1C3D40	Libya
1162	Ghadames East Airport	LTD	Ghadāmis	0101000020E6100000000000203D6E2340000000C0D5263E40	Libya
1164	Gisenyi Airport	GYI	Gisenyi	0101000020E61000000000004047423D40000000A0CFD5FABF	Rwanda
1165	Kigali International Airport	KGL	Kigali	0101000020E6100000B3F8FF3FB6233E4087500020827FFFBF	Rwanda
1166	Kamembe Airport	KME	Cyangugu	0101000020E6100000000000206CE83C40000000E0AAB203C0	Rwanda
1167	Dongola Airport	DOG	Dongola	0101000020E6100000D8FAFFFF1A6E3E402D11000066273340	Sudan
1169	El Fasher Airport	ELF	El Fasher	0101000020E6100000000000001953394000000020D43A2B40	Sudan
1170	Kassala Airport	KSL	Kassala	0101000020E610000000000020162A42400000006066C62E40	Sudan
1171	Kadugli Airport	\\N	Kadugli	0101000020E6100000D43400407BB33D40C2F0FFDFA7462640	Sudan
1172	El Obeid Airport	EBD	El Obeid	0101000020E610000000000040923B3E4000000040704E2A40	Sudan
1173	Juba International Airport	JUB	Juba	0101000020E610000012DEFFBFE1993F4081080040F07C1340	South Sudan
1175	Khartoum International Airport	KRT	Khartoum	0101000020E610000000000040CF46404000000000D32D2F40	Sudan
1176	Arusha Airport	ARK	Arusha	0101000020E61000000000000010514240000000E03BF10AC0	Tanzania
1177	Julius Nyerere International Airport	DAR	Dar es Salaam	0101000020E6100000740C00C0EE994340781200402F831BC0	Tanzania
1178	Dodoma Airport	DOD	Dodoma	0101000020E61000000000004055E04140000000E087AE18C0	Tanzania
1179	Iringa Airport	IRI	Iringa	0101000020E6100000000000E044E0414000000060ADAC1EC0	Tanzania
1180	Kilimanjaro International Airport	JRO	Merelani	0101000020E61000004A0100408989424078DDFF7F6E6F0BC0	Tanzania
1181	Lake Manyara Airport	LKY	Mto wa Mbu	0101000020E610000000000000BEE84140000000E0AE020BC0	Tanzania
1182	Mtwara Airport	MYW	Mtwara	0101000020E61000000000004045174440000000809EAD24C0	Tanzania
1183	Mwanza Airport	MWZ	Mwanza	0101000020E6100000000000C062774040000000C0508E03C0	Tanzania
1184	Pemba Airport	PMA	Chake Chake	0101000020E610000000000000DCE74340000000206F0715C0	Tanzania
1185	Tanga Airport	TGT	Tanga	0101000020E6100000000000201D894340000000A0935E14C0	Tanzania
1186	Abeid Amani Karume International Airport	ZNZ	Zanzibar	0101000020E61000004C040080C99C4340C9FBFF3F59E318C0	Tanzania
1187	Entebbe International Airport	EBB	Entebbe	0101000020E6100000000000A0C4384040000000209EB3A53F	Uganda
1189	Soroti Airport	SRT	Soroti	0101000020E6100000000000E0B7CF4040000000409EA4FB3F	Uganda
1190	Tirana International Airport Mother Teresa	TIA	Tirana	0101000020E6100000C71C004079B833402AE8FFDF14B54440	Albania
1191	Burgas Airport	BOJ	Burgas	0101000020E610000000000020E4833B40000000A0E8484540	Bulgaria
1192	Gorna Oryahovitsa Airport	GOZ	Gorna Oryahovitsa	0101000020E6100000000000A080B639400000002061934540	Bulgaria
1193	Plovdiv International Airport	PDV	Plovdiv	0101000020E6100000D26F5F07CED93840CBD93BA3AD084540	Bulgaria
1194	Sofia Airport	SOF	Sofia	0101000020E6100000000000E053693740000000402D594540	Bulgaria
1195	Stara Zagora Airport	\\N	Stara Zagora	0101000020E610000048E17A14AEA7394002FF4A9D36304540	Bulgaria
1196	Varna Airport	VAR	Varna	0101000020E6100000FAEDEBC039D33B40382F4E7CB59D4540	Bulgaria
1197	Larnaca International Airport	LCA	Larnaca	0101000020E6100000000000C0FCCF40400000004003704140	Cyprus
1198	Paphos International Airport	PFO	Paphos	0101000020E6100000000000602B3E404000000060E75B4140	Cyprus
1199	RAF Akrotiri	AKT	Ýpsonas	0101000020E6100000F5DBD781737E40404A438D42924B4140	Cyprus
1200	Dubrovnik Airport	DBV	Dubrovnik	0101000020E6100000000000C0A844324000000000DC474540	Croatia
1201	Osijek-Čepin Airfield	\\N	Čepin	0101000020E6100000EDE3B21BC7A1324057FF31BE79C54640	Croatia
1202	Osijek Airport	OSI	Osijek	0101000020E61000000000004069CF3240000000C039BB4640	Croatia
1203	Pula Airport	PUY	Pula	0101000020E6100000000000A02AD82B40000000405E724640	Croatia
1204	Grobnicko Polje Airport	\\N	Drenova	0101000020E610000000000020F2012D400000008093B04640	Croatia
1205	Rijeka Airport	RJK	Rijeka	0101000020E610000000000060FE232D4000000060C39B4640	Croatia
1206	Split Airport	SPU	Split	0101000020E6100000000000C0494C3040000000A0FAC44540	Croatia
1207	Varaždin Airport	\\N	Varaždin	0101000020E6100000000000E00762304000000000B7254740	Croatia
1208	Zagreb Airport	ZAG	Zagreb	0101000020E61000006BDAFFDF9C1130403A06006017DF4640	Croatia
1209	Zemunik Airport	ZAD	Zadar	0101000020E6100000000000A082B12E40000000C0DC0D4640	Croatia
1210	Udbina Air Base	\\N	Gospić	0101000020E6100000000000207E8C2F40000000605F474640	Croatia
1211	Albacete-Los Llanos Airport	\\N	Albacete	0101000020E61000004C350060FAD0FDBF45F8FF7F68794340	Spain
1212	Alicante International Airport	ALC	Alicante	0101000020E6100000000000006ADCE1BF000000201F244340	Spain
1213	Almería International Airport	LEI	Almería	0101000020E610000000000000F7F502C0000000E0046C4240	Spain
1214	Asturias Airport	OVD	Avilés	0101000020E610000000000060732318C00000000024C84540	Spain
1215	Córdoba Airport	ODB	Córdoba	0101000020E6100000000000C0406513C0000000A0C6EB4240	Spain
1216	Bilbao Airport	BIO	Bilbao	0101000020E6100000000000E0ED4807C0000000808AA64540	Spain
1218	Barcelona International Airport	BCN	Barcelona	0101000020E6100000ABFFFF9FAFA000402E00006007A64440	Spain
1219	Badajoz Airport	BJZ	Badajoz	0101000020E6100000000000C00A491BC00000002016724340	Spain
1220	A Coruña Airport	LCG	A Coruña	0101000020E61000000000004028C120C000000040ABA64540	Spain
1221	Armilla Air Base	\\N	Granada	0101000020E61000009D5C7C9FE4150DC02FE301C00C914240	Spain
1222	Girona Airport	GRO	Salt	0101000020E6100000F321FF3F9B15064085F0000054F34440	Spain
1223	Federico Garcia Lorca Airport	GRX	Granada	0101000020E61000000000008008380EC00000006027984240	Spain
1224	Getafe Air Base	\\N	Madrid	0101000020E61000000000006067CA0DC000000020A5254440	Spain
1225	Ibiza Airport	IBZ	Ibiza	0101000020E6100000EDB0FF9F4CF8F53F5AFCFF1FBB6F4340	Spain
1226	Jerez Airport	XRY	Jerez de la Frontera	0101000020E6100000000000808D3D18C0000000004F5F4240	Spain
1227	San Javier Airport	MJV	Murcia	0101000020E61000000000004017FFE9BF0000004033E34240	Spain
1229	Adolfo Suárez Madrid–Barajas Airport	MAD	Madrid	0101000020E61000001C5F7B6649800CC0E9103812683C4440	Spain
1230	Málaga Airport	AGP	Málaga	0101000020E6100000000000C016FF11C00000002063564240	Spain
1231	Menorca Airport	MAH	Sant Lluís	0101000020E6100000000000C0E5DF1040000000A069EE4340	Spain
1232	Moron Air Base	OZP	Sevilla	0101000020E610000000000000B97616C00000002063964240	Spain
1233	Ocaña Airport	\\N	Ocaña	0101000020E6100000000000E0D1060CC00000000000F84340	Spain
1234	Pamplona Airport	PNA	Pamplona	0101000020E6100000000000205E57FABF000000608F624540	Spain
1235	Alcantarilla Air Base	\\N	Murcia	0101000020E6100000E5D5390664AFF3BF1021AE9CBDF94240	Spain
1236	Reus Air Base	REU	Reus	0101000020E610000000000080BAACF23F00000000DE924440	Spain
1237	Rota Naval Station Airport	\\N	Rota	0101000020E6100000470200E0D86519C030F4FFDF95524240	Spain
1238	Salamanca Airport	SLM	Salamanca	0101000020E6100000000000A0090216C000000060DE794440	Spain
1239	Son Bonet Airport	\\N	Marratxí	0101000020E6100000000000204B9F0540000000C0A8CC4340	Spain
1241	San Luis Airport	\\N	Sant Lluís	0101000020E6100000000000A087081140000000A05CEE4340	Spain
1242	San Sebastian Airport	EAS	Donostia / San Sebastián	0101000020E6100000000000A056A6FCBF000000C0A1AD4540	Spain
1243	Santiago de Compostela Airport	SCQ	Oroso	0101000020E6100000000000408DD420C000000000BA724540	Spain
1244	Pirineus - la Seu d'Urgel Airport	LEU	la Seu d'Urgell	0101000020E6100000B21188D7F58BF63F7A36AB3E572B4540	Spain
1245	Torrejón Airport	TOJ	Madrid	0101000020E61000000000004024910BC0000000E0933F4440	Spain
1246	Valencia Airport	VLC	Valencia	0101000020E6100000000000A0F1D2DEBF00000060A1BE4340	Spain
1247	Valladolid Airport	VLL	Valladolid	0101000020E610000018030000636813C00A12008061DA4440	Spain
1249	Vitoria/Foronda Airport	VIT	Gasteiz / Vitoria	0101000020E6100000000000E0B6CB05C0000000A0FF704540	Spain
1250	Vigo Airport	VGO	Vigo	0101000020E610000000000000E84021C0000000A0AB1D4540	Spain
1251	Santander Airport	SDR	Santander	0101000020E610000000000060618F0EC000000040ABB64540	Spain
1252	Zaragoza Air Base	ZAZ	Zaragoza	0101000020E61000000000006030AAF0BF0000000046D54440	Spain
1253	Sevilla Airport	SVQ	Sevilla	0101000020E6100000000000608B9217C00000000081B54240	Spain
1254	Calais-Dunkerque Airport	CQF	Calais	0101000020E610000000000060B246FF3F00000020267B4940	France
1255	Péronne-Saint-Quentin Airport	\\N	Péronne	0101000020E6100000EAEC6470943C0840BA490C022BEF4840	France
1256	Nangis-Les Loges Airport	\\N	Nangis	0101000020E6100000000000E0E70D084000000040504C4840	France
1257	Bagnoles-de-l'Orne-Couterne Airport	\\N	La Ferté-Macé	0101000020E6100000000000E0E1CBD8BF000000C0DC454840	France
1258	Albert-Bray Airport	\\N	Albert	0101000020E6100000760100C0CE94054053F0FF1F5AFC4840	France
1259	Le Touquet-Côte d'Opale Airport	LTQ	Le Touquet-Paris-Plage	0101000020E6100000000000C0EFEDF93F000000203A424940	France
1260	Valenciennes-Denain Airport	\\N	Valenciennes	0101000020E610000000000020A9B00B40000000E0B3294940	France
1261	Amiens-Glisy Airport	\\N	Amiens	0101000020E610000000000020B818034000000080BEEF4840	France
1262	Agen-La Garenne Airport	AGF	Agen	0101000020E6100000000000C0D5E5E23F000000A05C164640	France
1263	Cazaux (BA 120) Air Base	\\N	La Teste-de-Buch	0101000020E6100000000000000000F2BF0000002043444640	France
1264	Bordeaux-Mérignac Airport	BOD	Bordeaux	0101000020E6100000AEFDFFBFD5E5E6BF2D0E00C0056A4640	France
1265	Bergerac-Roumanière Airport	EGC	Bergerac	0101000020E6100000000000207698E03F00000060A3694640	France
1266	Toulouse-Francazal (BA 101) Air Base	\\N	Toulouse	0101000020E6100000000000A047E1F53F00000040D6C54540	France
1267	Cognac-Châteaubernard (BA 709) Air Base	CNG	Cognac	0101000020E610000000000080EB51D4BF0000002043D44640	France
1268	Poitiers-Biard Airport	PIS	Poitiers	0101000020E6100000000000606AA0D33F000000C0394B4740	France
1269	Montluçon-Guéret Airport	MCU	Domérat	0101000020E6100000000000E063E90240000000207E1C4740	France
1270	Limoges Airport	LIG	Limoges	0101000020E610000000000080FCDEF23F0000004070EE4640	France
1271	Mont-de-Marsan (BA 118) Air Base	\\N	Mont-de-Marsan	0101000020E61000003D0AD7A3703DE0BF815D4D9EB2F44540	France
1272	Niort-Souché Airport	NIT	Niort	0101000020E61000009AB51490F63FD9BF2B86AB0320284740	France
1273	Toulouse-Blagnac Airport	TLS	Toulouse	0101000020E61000006E179AEB34D2F53FC170AE6186D04540	France
1274	Pau Pyrénées Airport	PUF	Pau	0101000020E6100000000000C085CADABF000000E0A3B04540	France
1275	Muret-Lherm Airport	\\N	La Rochelle	0101000020E6100000000000809936F43F0000008075B94540	France
1276	Tarbes-Lourdes-Pyrénées Airport	LDE	Tarbes	0101000020E6100000000000E0C75F7ABF000000A0DF964540	France
1277	Angoulême-Brie-Champniers Airport	ANG	Angoulême	0101000020E6100000000000A0AB58CC3F0000006056DD4640	France
1278	Toul Rosières Air Base	BVE	Brive-la-Gaillarde	0101000020E610000074ED0BE885EB174074ECA012D7634840	France
1279	Périgueux-Bassillac Airport	PGX	Périgueux	0101000020E6100000000000E00819EA3F000000605B994640	France
1280	Biarritz-Anglet-Bayonne Airport	BIQ	Anglet	0101000020E61000006EAE505A6E7FF8BF5A907758F2BB4540	France
1281	Cahors-Lalbenque Airport	\\N	Cahors	0101000020E610000000000040BF9AF73F000000A0FA2C4640	France
1282	Saint-Girons-Antichan Airport	\\N	Saint-Girons	0101000020E6100000000000A080A6F13F000000A0FF804540	France
1283	Arcachon-La Teste-de-Buch Airport	XAC	Arcachon	0101000020E6100000A0A696ADF5C5F1BF9E2633DE564C4640	France
1284	Albi-Le Séquestre Airport	LBI	Albi	0101000020E6100000000000008CE70040000000A0FAF44540	France
1285	Castres-Mazamet Airport	DCM	Castres	0101000020E6100000000000A03D500240000000E034C74540	France
1286	Toulouse-Lasbordes Airport	\\N	Toulouse	0101000020E6100000000000A099FCF73F0000006005CB4540	France
1287	Millau-Larzac Airport	\\N	Millau	0101000020E6100000000000C0C876094000000060A1FE4540	France
1288	Graulhet-Montdragon Airport	\\N	Graulhet	0101000020E6100000000000002E16004000000060B3E24540	France
1289	Rodez-Marcillac Airport	RDZ	Rodez	0101000020E61000000000002082DC03400000002036344640	France
1290	Ussel-Thalamy Airport	\\N	Ussel	0101000020E610000000000080206403400000000071C44640	France
1291	Villeneuve-sur-Lot Airport	\\N	Villeneuve-sur-Lot	0101000020E6100000000000A0D148E83F000000A0CD324640	France
1292	Royan-Médis Airport	RYN	Royan	0101000020E610000000000060B81EEFBF000000A065D04640	France
1293	Mimizan Airport	\\N	Mimizan	0101000020E6100000704221020EA1F2BF0CC9C9C4AD124640	France
1294	Aire-sur-l'Adour Airport	\\N	Mont-de-Marsan	0101000020E6100000000000004565CFBF000000A0CDDA4540	France
1295	Montauban Airport	\\N	Montauban	0101000020E6100000000000A0730CF63F000000204A034640	France
1296	Auch-Lamothe Airport	\\N	Auch	0101000020E610000000000020DB40E33F000000E009D84540	France
1297	Libourne-Artigues-de-Lussac Airport	\\N	Libourne	0101000020E6100000809E060C923EC1BF5531957EC27D4640	France
1298	Pamiers-Les Pujols Airport	\\N	Pamiers	0101000020E6100000000000A01E22FB3F000000C0988B4540	France
1299	Marmande-Virazeil Airport	\\N	Marmande	0101000020E61000000000006071AAC93F00000000DC3F4640	France
1300	Rochefort-Saint-Agnant (BA 721) Airport	RCO	Rochefort	0101000020E6100000000000E03175EFBF00000060A3F14640	France
1301	Pontivy Airport	\\N	Pontivy	0101000020E610000000000060E85F07C0000000E07C074840	France
1302	Aubigny-sur-Nère Airport	\\N	Aubigny-sur-Nère	0101000020E6100000A94C310741270340C3F2E7DB82BD4740	France
1303	Guiscriff Scaer Airport	\\N	Scaër	0101000020E6100000000000C058510DC000000060B8064840	France
1305	Ancenis Airport	\\N	Ancenis	0101000020E6100000000000400AD7F2BF000000A03CB44740	France
1306	Brienne-le-Château Airport	\\N	Bar-sur-Aube	0101000020E610000000000020CBED1140000000A003374840	France
1307	Colmar-Houssen Airport	CMR	Colmar	0101000020E610000000000060A06F1D4000000040110E4840	France
1308	Beaune-Challanges Airport	\\N	Beaune	0101000020E6100000895E46B1DC921340C1012D5DC1804740	France
1309	Dole-Tavaux Airport	DLE	Dole	0101000020E61000006B0F7BA180BD1540A0FF1EBC76854740	France
1310	Joigny Airport	\\N	Joigny	0101000020E61000000000004044230B400000006000FF4740	France
1311	Verdun-Le Rozelier Airfield	\\N	Verdun	0101000020E610000055C1A8A44EE01540438CD7BCAA8F4840	France
1312	Aubenas-Ardèche Méridional Airport	OBS	Aubenas	0101000020E6100000790E00601F7D1140C4F6FF5FA8454640	France
1313	Le Puy-Loudes Airport	LPY	Le Puy-en-Velay	0101000020E610000000000020661A0E4000000060548A4640	France
1314	Saint-Flour-Coltines Airport	\\N	Saint-Flour	0101000020E6100000000000C0E9F2074000000080C7894640	France
1315	Bourg-Ceyzériat Airport	XBK	Bourg-lès-Valence	0101000020E6100000000000E0092B154000000020B7194740	France
1316	Villefranche-Tarare Airport	XVF	Anse	0101000020E6100000C6DD205A2B8A124020F0C000C2F54640	France
1317	Moulins-Montbeugny Airport	XMU	Moulins	0101000020E610000000000040C7630B40000000C06D444740	France
1318	Saint-Affrique-Belmont Airport	\\N	Saint-Affrique	0101000020E61000000000006055F60540000000E061E94540	France
1319	Cassagnes-Bégonhès Airport	\\N	Luc-la-Primaube	0101000020E610000000000060B81E044000000020C2164640	France
1320	Metz-Nancy-Lorraine Airport	ETZ	Metz	0101000020E6100000D2EEFFFF59011940AEEFFF7FB57D4840	France
1321	Bastia-Poretta Airport	BIA	Bastia	0101000020E610000000000080ABF72240000000E0BE464540	France
1322	Calvi-Sainte-Catherine Airport	CLY	Calvi	0101000020E6100000BFD133620B96214001497DFE20434540	France
1323	Figari Sud-Corse Airport	FSC	Porto-Vecchio	0101000020E61000000000004010322240000000A013C04440	France
1324	Ajaccio-Napoléon Bonaparte Airport	AJA	Ajaccio	0101000020E610000000000060189B21400000008038F64440	France
1325	Propriano Airport	\\N	Ajaccio	0101000020E6100000000000408DC72140000000808ED44440	France
1326	Solenzara (BA 126) Air Base	SOZ	Porto-Vecchio	0101000020E610000000000040DFCF2240000000C052F64440	France
1327	Corte Airport	\\N	Corte	0101000020E6100000000000C0D8622240000000A094254540	France
1328	Auxerre-Branches Airport	AUF	Auxerre	0101000020E6100000000000C014FA0B4000000060D3EC4740	France
1329	Chambéry-Savoie Airport	CMF	Chambéry	0101000020E6100000000000005B85174000000040ADD14640	France
1330	Clermont-Ferrand Auvergne Airport	CFE	Clermont-Ferrand	0101000020E6100000B0F2FFBF755A0940150400A0B2E44640	France
1331	Bourges Airport	BOU	Bourges	0101000020E61000000000006055F60240000000E06F874740	France
1332	Chambéry-Challes-les-Eaux Airport	\\N	Chambéry	0101000020E6100000EFF3FF9F2DE7174011FEFF1FD2C74640	France
1333	Chalon-Champforgeuil Airport	XCD	Chalon-sur-Saône	0101000020E6100000000000C040451340000000A0BD694740	France
1334	Annemasse Airport	QNJ	Annemasse	0101000020E610000028FEFFDFD41219409A0E008093184740	France
1335	Lyon Saint-Exupéry Airport	LYS	Lyon	0101000020E6100000CF5EC7C90E531440FFB68201DFDC4640	France
1336	Mâcon-Charnay Airport	QNX	Mâcon	0101000020E61000003B8DB454DE2E13402A029CDEC5254740	France
1337	Saint-Yan Airport	\\N	Digoin	0101000020E610000000000000940D1040000000C0CC344740	France
1338	Roanne-Renaison Airport	RNE	Roanne	0101000020E6100000000000606C0110400000006076074740	France
1339	Annecy-Haute-Savoie-Mont Blanc Airport	NCY	Annecy	0101000020E610000031A13836F16C18408EC3AA8B25F74640	France
1340	Grenoble-Isère Airport	GNB	Grenoble	0101000020E610000000000060465115400000008073AE4640	France
1341	Montluçon-Domérat Airport	\\N	Montluçon	0101000020E6100000718FA50F5D9004405567B5C01E2D4740	France
1342	Valence-Chabeuil Airport	VAF	Chabeuil	0101000020E6100000C58F31772DE113402EFF21FDF6754640	France
1343	Vichy-Charmeil Airport	VHY	Vichy	0101000020E610000000000000DC3A0B40000000C0B8154740	France
1344	Aurillac Airport	AUR	Aurillac	0101000020E610000000000020226003400000006019724640	France
1345	Châteauroux-Déols \\Marcel Dassault\\" Airport"	CHR	Châteauroux	0101000020E61000007885F4CAAB89FB3FA94911951D6E4740	France
1346	Lyon-Bron Airport	LYN	Lyon	0101000020E6100000000000C0EEC61340000000E014DD4640	France
1347	Aix-en-Provence (BA 114) Airport	QXB	Bouc-Bel-Air	0101000020E6100000D47D00529B781540C66D3480B7C04540	France
1348	Le Luc-Le Cannet Airport	\\N	Le Luc	0101000020E6100000000000606E8C1940000000E03DB14540	France
1349	Cannes-Mandelieu Airport	CEQ	Cannes	0101000020E6100000000000005DD01B400000004060C54540	France
1350	Saint-Étienne-Bouthéon Airport	EBU	Veauche	0101000020E6100000000000E0802F11400000006032C54640	France
1351	Istres Le Tubé/Istres Air Base (BA 125) Airport	\\N	Istres	0101000020E610000052F2EA1C03B21340124BCADDE7C24540	France
1352	Carcassonne Airport	CCF	Carcassonne	0101000020E6100000000000E057730240000000E0A59B4540	France
1353	Marseille Provence Airport	MRS	Marseille	0101000020E6100000EAF1FFFFBCE214404285F50F3AB84540	France
1354	Nice-Côte d'Azur Airport	NCE	Nice	0101000020E61000006BECFFFF0CDD1C403117008046D44540	France
1355	Orange-Caritat (BA 115) Air Base	\\N	Orange	0101000020E61000000000008085771340000000E0FB114640	France
1356	Perpignan-Rivesaltes (Llabanère) Airport	PGF	Perpignan	0101000020E6100000000000E021F7064000000060C55E4540	France
1357	Le Castellet Airport	CTT	Le Beausset	0101000020E6100000000000E008241740000000E051A04540	France
1358	Alès-Deaux Airport	\\N	Alès	0101000020E61000001A6EC0E7879110405E4C33DDEB084640	France
1359	Montpellier-Méditerranée Airport	MPL	Montpellier	0101000020E6100000000000A03EB40F40000000E0C0C94540	France
1360	Béziers-Vias Airport	BZR	Béziers	0101000020E610000000000080C9D40A400000008068A94540	France
1361	Avignon-Caumont Airport	AVN	Avignon	0101000020E610000000000060799B13400000006022F44540	France
1362	Salon-de-Provence (BA 701) Air Base	\\N	Salon-de-Provence	0101000020E610000000000040DF6F1440000000809ECD4540	France
1363	Lézignan-Corbières Airport	\\N	Lézignan-Corbières	0101000020E61000000000008094DF0540000000A080964540	France
1364	Mende-Brenoux Airport	MEN	Mende	0101000020E61000000000002037430C40000000E044404640	France
1365	Carpentras Airport	\\N	Carpentras	0101000020E610000000000000EF4F144000000080D0034640	France
1366	Avord (BA 702) Air Base	\\N	Saint-Germain-du-Puy	0101000020E61000008FC2F5285C0F05406BF46A80D2864740	France
1367	Paris Beauvais Tillé Airport	BVA	Beauvais	0101000020E610000000000040F9E60040000000C029BA4840	France
1368	Châteaudun (BA 279) Air Base	\\N	Châteaudun	0101000020E6100000F44F70B1A206F63F85EAE6E26F074840	France
1369	Saumur-Saint-Florent Airport	\\N	Saumur	0101000020E61000005A626534F279BDBF11C64FE3DEA04740	France
1370	Évreux-Fauville (BA 105) Air Base	\\N	Évreux	0101000020E6100000000000E08B84F33F00000080AC834840	France
1371	Le Havre Octeville Airport	LEH	Le Havre	0101000020E610000000000080D68AB63F000000E056C44840	France
1372	Abbeville	\\N	Abbeville	0101000020E61000004563EDEF6C4FFD3FBEF8A23D5E124940	France
1373	Orléans-Bricy (BA 123) Air Base	ORE	Orléans	0101000020E6100000004E0000412BFC3F85E7FF3F70FE4740	France
1374	Châlons-Vatry Air Base	XCR	Chalon-sur-Saône	0101000020E610000000000000EBBC10400000004057634840	France
1375	Rouen Airport	URO	Rouen	0101000020E610000000000020FBCBF23F000000802DB14840	France
1376	Tours-Val-de-Loire Airport	TUF	Tours	0101000020E610000017FDFF5F8C48E73F1301006052B74740	France
1377	Cholet Le Pontreau Airport	CET	Cholet	0101000020E610000000000080E810ECBF00000040828A4740	France
1378	Laval-Entrammes Airport	LVA	Laval	0101000020E6100000000000A08AC6E7BF000000E004044840	France
1379	Orléans-Saint-Denis-de-l'Hôtel Airport	\\N	Orléans	0101000020E61000003CA583F57F4E014026E4839ECDF24740	France
1380	Paris-Le Bourget Airport	LBG	Paris	0101000020E610000000000080F787034000000040157C4840	France
1381	Creil Air Base	CSF	Creil	0101000020E6100000000000E032270440000000C072A04840	France
1382	Charles de Gaulle International Airport	CDG	Paris	0101000020E6100000AF200060666604409DF1FF5FA3814840	France
1383	Coulommiers-Voisins Airport	\\N	Coulommiers	0101000020E61000000000008003210840000000C0396B4840	France
1384	Melun-Villaroche Air Base	\\N	Melun	0101000020E610000000000020745E0540000000C0664D4840	France
1385	Toussus-le-Noble Airport	TNF	Buc	0101000020E6100000000000207AD90040000000403E604840	France
1386	Paris-Orly Airport	ORY	Paris	0101000020E6100000E73345251A090340CBCD812F965C4840	France
1387	Pontoise - Cormeilles-en-Vexin Airport	POX	Pontoise	0101000020E6100000BAB3C068A05300405E8E0D935F8C4840	France
1388	Villacoublay-Vélizy (BA 107) Air Base	\\N	Vélizy-Villacoublay	0101000020E6100000A2DB018D888801407D13F9E417634840	France
1389	Reims-Prunay Airport	\\N	Reims	0101000020E61000000000008056A01040000000A0B69A4840	France
1390	Troyes-Barberey Airport	QYR	Troyes	0101000020E6100000000000C019111040000000A03A294840	France
1391	Lunéville-Croismare Airport	\\N	Lunéville	0101000020E6100000000000C0802C1A4000000040F14B4840	France
1392	Étain-Rouvres Air Base	\\N	Jarny	0101000020E6100000000000805AB01640000000000B9D4840	France
1393	Autun-Bellevue Airport	\\N	Autun	0101000020E6100000000000E0D20A114000000080D07B4740	France
1394	Nevers-Fourchambault Airport	NVS	Nevers	0101000020E61000000000008019E808400000004055804740	France
1395	Cambrai-Épinoy (BA 103) Air Base	\\N	Cambrai	0101000020E61000005DE15D2EE23B0940FC170802641C4940	France
1396	Maubeuge-Élesmes Airport	\\N	Maubeuge	0101000020E610000000000040EA21104000000080BE274940	France
1397	Besançon-La Vèze Airport	\\N	Besançon	0101000020E6100000B22FD978B055184043AD69DE719A4740	France
1398	Phalsbourg-Bourscheid Air Base	\\N	Saverne	0101000020E610000052B81E85EBD11C403CC159A54F624840	France
1399	Lille-Lesquin Airport	LIL	Lille	0101000020E610000090D78349F1B10840286552431B484940	France
1400	Merville-Calonne Airport	\\N	Merville	0101000020E6100000000000C04E230540000000C0274F4940	France
1401	Charleville-Mézières Airport	\\N	Charleville-Mézières	0101000020E6100000000000209C961240000000E056E44840	France
1402	Vesoul-Frotey Airport	\\N	Vesoul	0101000020E610000054008C67D0D01840FDF675E09CD14740	France
1403	Brest Bretagne Airport	BES	Brest	0101000020E6100000000000C095AC11C0000000C054394840	France
1404	Cherbourg-Maupertus Airport	CER	Tourlaville	0101000020E6100000000000604486F7BF0000008036D34840	France
1405	Dinard-Pleurtuit-Saint-Malo Airport	DNR	Dinard	0101000020E610000000000020C2A300C0000000C0394B4840	France
1406	La Baule-Escoublac Airport	\\N	La Baule-Escoublac	0101000020E61000000000002068C502C0000000000BA54740	France
1407	Granville Airport	GFR	Granville	0101000020E610000000000020D706F9BF0000006009714840	France
1408	Deauville-Saint-Gatien Airport	DOL	Trouville-sur-Mer	0101000020E61000002B3100804CC0C33F8E190020C2AE4840	France
1409	Lorient South Brittany (Bretagne Sud) Airport	LRT	Lorient	0101000020E6100000000000C01E850BC0000000605BE14740	France
1410	La Roche-sur-Yon Airport	EDM	La Roche-sur-Yon	0101000020E610000000000060DE0EF6BF000000E0D7594740	France
1411	Landivisiau Air Base	\\N	Landivisiau	0101000020E610000000000080479B10C0000000E0E0434840	France
1412	Caen-Carpiquet Airport	CFR	Caen	0101000020E6100000000000C0CCCCDCBF000000C02E964840	France
1413	Lanvéoc-Poulmic Air Base	\\N	Crozon	0101000020E610000000000060B3C711C0000000C00E244840	France
1414	Le Mans-Arnage Airport	LME	Le Mans	0101000020E61000000000006039D0C93F000000C06BF94740	France
1415	Rennes-Saint-Jacques Airport	RNS	Rennes	0101000020E610000013360020B3C1FBBFA9090060E5084840	France
1416	Lannion-Côte de Granit Airport	LAI	Lannion	0101000020E6100000000000A0F5C50BC00000002090604840	France
1417	Quimper-Cornouaille Airport	UIP	Quimper	0101000020E610000000000020D1AB10C0000000C0CCFC4740	France
1418	Nantes Atlantique Airport	NTE	Nantes	0101000020E6100000F0B3FFDF8CC5F9BFE00600009C934740	France
1419	Saint-Brieuc-Armor Airport	SBK	Pordic	0101000020E6100000672783A3E4D506C0F7E461A1D6444840	France
1420	Morlaix-Ploujean Airport	MXN	Morlaix	0101000020E610000040E8FF9FB7860EC02FF1FF9F354D4840	France
1421	Vannes-Meucon Airport	VNE	Vannes	0101000020E6100000000000609CBF05C00000002095DC4740	France
1422	Saint-Nazaire-Montoir Airport	SNR	Montoir-de-Bretagne	0101000020E61000005BFA8678DA4001C07ACB3049C0A74740	France
1423	EuroAirport Basel-Mulhouse-Freiburg Airport	BSL	Mulhouse	0101000020E61000006B871AE0DD1D1E40EC51B81E85CB4740	France
1424	Colmar-Meyenheim Air Base	\\N	Colmar	0101000020E61000009BEEFF1F43991D40A2FAFF1F04F64740	France
1425	Dijon-Bourgogne Airport	DIJ	Dijon	0101000020E610000047090000295C1440D81A00606BA24740	France
1426	Metz-Frescaty (BA 128) Air Base	MZM	Metz	0101000020E610000000000080D4861840000000802D894840	France
1427	Épinal-Mirecourt Airport	EPL	Épinal	0101000020E6100000000000E0A8471840000000A099294840	France
1428	Haguenau Airport	\\N	Haguenau	0101000020E6100000DB0B00803B451F40E0E6FF9FAB654840	France
1429	Saint-Dizier-Robinson (BA 113) Air Base	\\N	Saint-Dizier	0101000020E610000000000080019913400000008068514840	France
1430	Montbéliard-Courcelles Airfield	\\N	Montbéliard	0101000020E610000028B8585183291B407593180456BE4740	France
1431	Nancy-Essey Airport	ENC	Nancy	0101000020E6100000000000C0FDEB1840000000C096584840	France
1432	Nancy-Ochey (BA 133) Air Base	\\N	Nancy	0101000020E610000000000080EBD1174000000000A34A4840	France
1433	Pontarlier Airport	\\N	Pontarlier	0101000020E6100000000000203A4F194000000040B6734740	France
1434	Reims-Champagne (BA 112) Air Base	RHE	Reims	0101000020E61000003333333333331040185DDE1CAEA74840	France
1435	Strasbourg Airport	SXB	Strasbourg	0101000020E6100000000000C04E831E4000000000E7444840	France
1436	Luxeuil-Saint-Sauveur (BA 116) Air Base	\\N	Luxeuil-les-Bains	0101000020E6100000DDC5871BE87419408E79782A3BE44740	France
1437	Cuers-Pierrefeu Airport	\\N	Cuers	0101000020E6100000000000A0BD811840000000E0B79F4540	France
1438	Toulon-Hyères Airport	TLN	Hyères	0101000020E6100000C60700E08895184020190060748C4540	France
1439	Nîmes-Arles-Camargue Airport	FNI	Nîmes	0101000020E6100000000000A057AA114000000080F2E04540	France
1440	Miquelon Airport	MQC	Miquelon	0101000020E6100000EDFEFF9FAD304CC04EE7FF5F398C4740	Saint Pierre and Miquelon
1441	St Pierre Airport	FSP	Saint-Pierre	0101000020E61000000000002028164CC0000000C0A6614740	Saint Pierre and Miquelon
1442	Ambérieu Air Base (BA 278)	\\N	Ambérieu-en-Bugey	0101000020E6100000FFCA4A9352501540702711E15FFE4640	France
1443	Damblain Airport	\\N	Vittel	0101000020E610000000000060FFA71640000000E00B0B4840	France
1444	Andravida Air Base	PYR	Gastoúni	0101000020E6100000E3C62DE6E74A3540AEB6627FD9F54240	Greece
1445	Agrinion Air Base	AGQ	Agrínio	0101000020E610000018DAEF3FE85935406494675E0E4D4340	Greece
1446	Dimokritos Airport	AXD	Alexandroupoli	0101000020E610000000000020D0F43940000000208E6D4440	Greece
1447	Alexandria Airport	\\N	Alexándreia	0101000020E6100000000000801B7D36400000004057534440	Greece
1448	Nea Anchialos Airport	VOL	Almyrós	0101000020E61000000000004057CB3640000000E01B9C4340	Greece
1449	Elefsis Airport	\\N	Elefsína	0101000020E610000000000000568E3740000000A02A084340	Greece
1450	Chios Island National Airport	JKH	Chios	0101000020E610000000000060FE233A4000000000EE2B4340	Greece
1451	Ioannina Airport	IOA	Ioánnina	0101000020E6100000000000608FD23440000000A023D94340	Greece
1452	Heraklion International Nikos Kazantzakis Airport	HER	Néa Alikarnassós	0101000020E6100000C3F3FF1F282E3940DAFDFF3F7BAB4140	Greece
1453	Kastoria National Airport	KSO	Kastoria	0101000020E6100000F4EAFF3F3E4835408204006020394440	Greece
1455	Kefallinia Airport	EFL	Argostólion	0101000020E6100000000000C020803440000000605F0F4340	Greece
1456	Kalamata Airport	KLX	Kalamata	0101000020E6100000000000208706364000000000BE884240	Greece
1457	Amigdhaleon Airport	\\N	Kavála	0101000020E61000000000000066573840000000C0847C4440	Greece
1458	Kos Airport	KGS	Kos	0101000020E6100000000000A079173B40000000E08A654240	Greece
1460	Ioannis Kapodistrias International Airport	CFU	Corfu	0101000020E61000000000002065E93340000000000BCD4340	Greece
1462	Alexander the Great International Airport	KVA	Kavála	0101000020E6100000000000E0839E384000000000E7744440	Greece
1463	Filippos Airport	KZI	Kozáni	0101000020E6100000000000A03ED73540000000E09E244440	Greece
1464	Leros Airport	LRS	Kálymnos	0101000020E61000000ACFFF7FE0CC3A40531300C0AA974240	Greece
1465	Limnos Airport	LXS	Mýrina	0101000020E61000006C2000207E3C39401DF3FF7F63F54340	Greece
1466	Larisa Airport	LRA	Lárisa	0101000020E6100000BA490C022B7736401D90847D3BD34340	Greece
1467	Megara Airport	\\N	Mégara	0101000020E6100000000000E08A5D3740000000A094FD4240	Greece
1468	Mikonos Airport	JMK	Ermoúpolis	0101000020E6100000000000201D59394000000060B1B74240	Greece
1469	Mytilene International Airport	MJT	Mytilene	0101000020E610000057D6FF3F2A993A400D18000042874340	Greece
1470	Aktion National Airport	PVK	Préveza	0101000020E6100000000000C0EAC33440000000C076764340	Greece
1471	Maritsa Airport	\\N	Ialysós	0101000020E6100000000000E0E01B3C400000006009314240	Greece
1472	Diagoras Airport	RHO	Ialysós	0101000020E61000000000004011163C4000000020E4334240	Greece
1473	Araxos Airport	GPA	Káto Achaḯa	0101000020E6100000772D211FF46C35407A36AB3E57134340	Greece
1474	Chania International Airport	CHQ	Chaniá	0101000020E6100000000000C052263840000000C00EC44140	Greece
1475	Skiathos Island National Airport	JSI	Skiáthos	0101000020E610000000000080F280374000000040AB964340	Greece
1476	Samos Airport	SMI	Néon Karlovásion	0101000020E61000000000002065E93A40000000E051D84240	Greece
1478	Sparti Airport	\\N	Spárti	0101000020E6100000000000A0BB863640000000C0A87C4240	Greece
1480	Sitia Airport	JSH	Sitia	0101000020E6100000000000C0EE193A4000000020A99B4140	Greece
1481	Stefanovikion Air Base	\\N	Néa Ionía	0101000020E6100000BF7D1D3867C436403D0AD7A370BD4340	Greece
1483	Tanagra Air Base	\\N	Vasilikón	0101000020E61000001135D1E7A3903740C58EC6A17E2B4340	Greece
1484	Kasteli Airport	\\N	Ierápetra	0101000020E610000000000040B65339400000008093984140	Greece
1485	Tripolis Airport	\\N	Trípoli	0101000020E61000000000006052673640000000C0EAC34240	Greece
1486	Thessaloniki Macedonia International Airport	SKG	Thessaloníki	0101000020E6100000000000E08CF836400000008085424440	Greece
1487	Tatoi Airport	\\N	Thrakomakedónes	0101000020E610000000000020A7C8374000000060F00D4340	Greece
1488	Dionysios Solomos Airport	ZTH	Zakynthos	0101000020E61000000000008061E23440000000801DE04240	Greece
1489	Budapest Ferenc Liszt International Airport	BUD	Budapest	0101000020E6100000750F00006F413340E4EFFF5FECB74740	Hungary
1490	Debrecen International Airport	DEB	Debrecen	0101000020E610000000000040849D35400000004094BE4740	Hungary
1491	Kecskemét Airport	\\N	Kecskemét	0101000020E6100000000000A0CBBF3340000000A070754740	Hungary
1492	Nyíregyháza Airport	\\N	Nyíregyháza	0101000020E6100000000000A03AB1354000000060F0FD4740	Hungary
1493	Őcsény Airport	\\N	Szekszárd	0101000020E610000000000040EAC4324000000040E6264740	Hungary
1496	Szentkirályszabadja Airport	\\N	Veszprém	0101000020E610000000000000E9F73140000000A0F8894740	Hungary
1498	Szolnok Airport	\\N	Szolnok	0101000020E61000003F355EBA493C344065E3C116BB8F4740	Hungary
1499	Amendola Air Base	\\N	Foggia	0101000020E6100000E4839ECDAA6F2F40C782C2A04CC54440	Italy
1500	Crotone Airport	CRV	Crotone	0101000020E6100000A323B9FC871431401DC9E53FA47F4340	Italy
1501	Bari Karol Wojtyła Airport	BRI	Bari	0101000020E6100000CC5EB69DB6C23040DB300A82C7914440	Italy
1502	Foggia \\Gino Lisa\\" Airport"	FOG	Foggia	0101000020E610000052B81E85EB112F404DBC033C69B74440	Italy
1503	Taranto-Grottaglie \\Marcello Arlotta\\" Airport"	TAR	Grottaglie	0101000020E610000048BF7D1D38673140ABCE6A813D424440	Italy
1504	Lecce Galatina Air Base	LCC	Lecce	0101000020E61000002B86AB0320223240D3156C239E1E4440	Italy
1505	Pescara International Airport	PSR	Pescara	0101000020E6100000789CA223B95C2C4014CFD90242374540	Italy
1506	Brindisi – Salento Airport	BDS	Brindisi	0101000020E6100000804754A86EF23140C0EC9E3C2C544440	Italy
1507	Gioia Del Colle Air Base	\\N	Gioia del Colle	0101000020E6100000575BB1BFECEE30406473D53C47624440	Italy
1508	Lamezia Terme Airport	SUF	Lamezia Terme	0101000020E610000020D26F5F073E3040626A4B1DE4734340	Italy
1509	Catania-Fontanarossa Airport	CTA	Catania	0101000020E6100000A7E8482EFF212E40BB5E9A22C0BB4240	Italy
1512	Falcone–Borsellino Airport	PMO	Palermo	0101000020E61000003BDF4F8D972E2A4079909E2287164340	Italy
1513	Palermo-Boccadifalco Airport	\\N	Palermo	0101000020E610000071AC8BDB68A02A406B2A8BC22E0E4340	Italy
1514	Reggio Calabria Airport	REG	Reggio Calabria	0101000020E6100000AF25E4839E4D2F40A438471D1D094340	Italy
1515	Vincenzo Florio Airport Trapani-Birgi	TPS	Trapani	0101000020E610000060E5D022DBF9284086C954C1A8F44240	Italy
1516	Sigonella Navy Air Base	NSY	Motta Sant'Anastasia	0101000020E61000002AA913D044D82D40FFEA71DF6AB34240	Italy
1517	Alghero-Fertilia Airport	AHO	Alghero	0101000020E6100000DB5031CEDF942040CA6ABA9EE8504440	Italy
1518	Decimomannu Air Base	DCI	Decimomannu	0101000020E6100000350708E6E8F1214080272D5C56AD4340	Italy
1519	Cagliari Elmas Airport	CAG	Cagliari	0101000020E61000005DA79196CA1B224005FD851E31A04340	Italy
1520	Olbia Costa Smeralda Airport	OLB	Olbia	0101000020E610000062DBA2CC06092340F6F065A208734440	Italy
1521	Tortolì Airport	TTB	Tortolì	0101000020E6100000E8A4F78DAF5D23404BC8073D9BF54340	Italy
1522	Torino-Aeritalia Airport	\\N	Turin	0101000020E6100000D28C45D3D9691E401CB4571F0F8B4640	Italy
1523	Milano-Bresso Airport	\\N	Bresso	0101000020E61000006397A8DE1A68224072FA7ABE66C54640	Italy
1524	Malpensa International Airport	MXP	Bresso	0101000020E6100000F7C77BD5CA742140C66D3480B7D04640	Italy
1525	Il Caravaggio International Airport	BGY	Bergamo	0101000020E61000000DA661F888682340F0DE516342D64640	Italy
1526	Turin Airport	TRN	Turin	0101000020E61000007E00529B38991E40577C43E1B3994640	Italy
1527	Villanova D'Albenga International Airport	ALL	Albenga	0101000020E6100000FE0E45813E4120401B9FC9FE79064640	Italy
1528	Genoa Cristoforo Colombo Airport	GOA	Genoa	0101000020E6100000CDCCCCCCCCAC2140E9B7AF03E7344640	Italy
1529	Milano Linate Airport	LIN	Milan	0101000020E610000076FD82DDB08D2240BC3D0801F9B84640	Italy
1530	Cameri Air Base [MIL]	\\N	Cameri	0101000020E610000082A8FB00A4562140750305DEC9C34640	Italy
1531	Parma Airport	PMF	Parma	0101000020E61000009D11A5BDC19724407842AF3F89694640	Italy
1532	Piacenza San Damiano Air Base	QPZ	Piacenza	0101000020E6100000A4E36A6457722340F2785A7EE0744640	Italy
1534	Cuneo International Airport	CUF	Cuneo	0101000020E61000003CDA38622D7E1E408DF0F62004464640	Italy
1535	Aviano Air Base	AVB	Aviano	0101000020E610000089EE59D7683129406667D13B15044740	Italy
1536	Bolzano Airport	BZO	Bolzano	0101000020E61000002CD49AE61DA72640124BCADDE73A4740	Italy
1537	Cervia Air Base	\\N	Cervia	0101000020E610000093A98251499D2840815D4D9EB21C4640	Italy
1538	Bologna Guglielmo Marconi Airport	BLQ	Bologna	0101000020E6100000DDB5847CD0932640A323B9FC87444640	Italy
1539	Treviso-Sant'Angelo Airport	TSF	Treviso	0101000020E61000004FAF9465886328402AE109BDFED24640	Italy
1540	Rivolto Air Base	\\N	Codroipo	0101000020E6100000B7627FD93D192A405FD0420246FD4640	Italy
1541	Forlì Airport	FRL	Forlì	0101000020E610000032E6AE25E4232840321D3A3DEF184640	Italy
1542	Ghedi Air Base	\\N	Ghedi	0101000020E6100000454772F90F8924403526C45C52B74640	Italy
1543	Verona-Boscomantico Airport	\\N	Verona	0101000020E6100000B3EA73B515DB254023DBF97E6ABC4640	Italy
1544	Brescia Airport	VBS	Brescia	0101000020E61000007E1D386744A924403198BF42E6B64640	Italy
1545	Trieste–Friuli Venezia Giulia Airport	TRS	Ronchi dei Legionari	0101000020E6100000A857CA32C4F12A40823CBB7CEBE94640	Italy
1546	Federico Fellini International Airport	RMI	Rimini	0101000020E610000029ED0DBE303929408E05854199024640	Italy
1547	Istrana Air Base	\\N	Treviso	0101000020E610000043AD69DE712A2840438CD7BCAAD74640	Italy
1548	Vicenza Airport	VIC	Vicenza	0101000020E6100000C976BE9F1A0F27409147702365C94640	Italy
1549	Padova Airport	QPA	Padova	0101000020E61000008A8EE4F21FB2274080D8D2A3A9B24640	Italy
1550	Verona Villafranca Airport	VRN	Dossobuono	0101000020E6100000F4FDD478E9C62540AB07CC43A6B24640	Italy
1551	Venice Marco Polo Airport	VCE	Venice	0101000020E6100000C0EC9E3C2CB42840CBD93BA3ADC04640	Italy
1552	Siena-Ampugnano Airport	SAY	Siena	0101000020E6100000C3F5285C8F8226401FF30181CEA04540	Italy
1553	Ciampino–G. B. Pastine International Airport	CIA	Rome	0101000020E6100000E3C798BB9630294011363CBD52E64440	Italy
1554	Pratica Di Mare Air Base	\\N	Torvaianica	0101000020E6100000C05B2041F1E32840E2218C9FC6D34440	Italy
1555	Leonardo da Vinci–Fiumicino Airport	FCO	Rome	0101000020E61000003CC159A54F7A2840805BC1806FE64440	Italy
1556	Guidonia Air Base	\\N	Guidonia	0101000020E6100000ECC039234A7B294079211D1EC2FE4440	Italy
1558	Marina Di Campo Airport	EBA	Portoferraio	0101000020E6100000265305A3927A24400C93A98251614540	Italy
1559	Latina Air Base	QLT	Latina	0101000020E6100000C520B07268D12940DAACFA5C6DC54440	Italy
1560	Grazzanise Airport	\\N	Grazzanise	0101000020E6100000B515FBCBEE292C409450FA42C8874440	Italy
1561	Naples International Airport	NAP	Naples	0101000020E6100000865AD3BCE3942C406518778368714440	Italy
1562	Pisa International Airport	PSA	Pisa	0101000020E6100000454772F90FC9244030629F008AD74540	Italy
1563	Peretola Airport	FLR	Florence	0101000020E6100000B7D100DE02692640185DDE1CAEE74540	Italy
1564	Grosseto Air Base	GRS	Grosseto	0101000020E6100000302AA913D024264087DEE2E13D614540	Italy
1565	Urbe Airport	\\N	Rome	0101000020E6100000E5F21FD26FFF2840FD87F4DBD7F94440	Italy
1566	Viterbo Airport	\\N	Viterbo	0101000020E610000070CE88D2DE202840CEE2C5C210374540	Italy
1567	Perugia San Francesco d'Assisi – Umbria International Airport	PEG	Perugia	0101000020E6100000499D8026C2062940AC53E57B468C4540	Italy
1568	Cerklje Airport	\\N	Cerklje na Gorenjskem	0101000020E6100000CD000060760F2F400D00004033F34640	Slovenia
1569	Ljubljana Jože Pučnik Airport	LJU	Ljubljana	0101000020E6100000984C158C4AEA2C408F8AFF3BA21C4740	Slovenia
1570	Maribor Airport	MBX	Maribor	0101000020E610000000000080485F2F40000000606D3D4740	Slovenia
1571	Portoroz Airport	POW	Lucija	0101000020E610000000000040E13A2B400000006098BC4640	Slovenia
1572	Slovenj Gradec Airport	\\N	Slovenj Gradec	0101000020E610000000000060E73B2E40000000806A3C4740	Slovenia
1573	České Budějovice Airport	\\N	České Budějovice	0101000020E610000000000040E1DA2C40000000A023794840	Czechia
1574	Čáslav Air Base	\\N	Čáslav	0101000020E6100000000000407BC32E400000002048F84840	Czechia
1575	Hradec Králové Airport	\\N	Hradec Králové	0101000020E61000008D28ED0DBEB02F404128EFE368204940	Czechia
1576	Hořovice Airport	\\N	Hořovice	0101000020E6100000000000E078C92B40000000808EEC4840	Czechia
1577	Kbely Air Base	\\N	Prague	0101000020E6100000000000C052162D40000000008A0F4940	Czechia
1578	Kunovice Airport	\\N	Kunovice	0101000020E6100000000000209070314000000060C3834840	Czechia
1579	Karlovy Vary International Airport	KLV	Karlovy Vary	0101000020E6100000000000E07AD42940000000E0FB194940	Czechia
1580	Plzeň-Líně Airport	\\N	Dobřany	0101000020E6100000A9000060988C2A40350000006DD64840	Czechia
1581	Mnichovo Hradiště Airport	\\N	Mnichovo Hradiště	0101000020E61000000000002061032E400000004025454940	Czechia
1582	Ostrava Leos Janáček Airport	OSR	Ostrava	0101000020E610000000000000711C32400000006020D94840	Czechia
1583	Náměšť Air Base	\\N	Náměšť nad Oslavou	0101000020E610000000000080F91F3040000000E038954840	Czechia
1584	Pardubice Airport	PED	Pardubice	0101000020E6100000000000C0297A2F4000000020B7014940	Czechia
1585	Pribram Airport	\\N	Příbram	0101000020E6100000000000E081332C40000000402CDC4840	Czechia
1586	Přerov Air Base	PRV	Přerov	0101000020E6100000000000609A673140000000A080B64840	Czechia
1587	Václav Havel Airport Prague	PRG	Prague	0101000020E610000085EB51B81E852C40E9B7AF03E70C4940	Czechia
1588	Brno-Tuřany Airport	BRQ	Brno	0101000020E610000000000040C4B13040000000C05D934840	Czechia
1589	Vodochody Airport	\\N	Roztoky	0101000020E61000007B832F4CA6CA2C4054AC1A84B91B4940	Czechia
1590	Ben Gurion International Airport	TLV	Yehud	0101000020E6100000000000607F7141400000008075014040	Israel
1591	Beersheba (Teyman) Airport	BEV	Beersheba	0101000020E61000000D0000408B5C4140140000E078493F40	Israel
1592	Tel Nof Air Base	\\N	Mazkeret Batya	0101000020E610000088EDFFBF3069414052CDFF7FE9D63F40	Israel
1593	Ein Shemer Airfield	\\N	H̱adera	0101000020E610000000000060FC804140000000206C384040	Israel
1594	Eilat Airport	ETH	Eilat	0101000020E610000000000080E47A414000000060B18F3D40	Israel
1595	Ein Yahav Airfield	\\N	Yeroẖam	0101000020E6100000000000C0059A4140000000C0279F3E40	Israel
1596	Haifa International Airport	HFA	Haifa	0101000020E61000000000004084854140000000609A674040	Israel
1597	Hatzor Air Base	\\N	Bene 'Ayish	0101000020E610000029E8FFDF145D41409FD4FF3F33C33F40	Israel
1598	Ben Ya'akov Airport	RPN	Safed	0101000020E61000000000000034C9414000000060917D4040	Israel
1599	Megiddo Airport	\\N	Migdal Ha‘Emeq	0101000020E610000000000060499D414000000060744C4040	Israel
1600	Bar Yehuda Airfield	\\N	‘Arad	0101000020E6100000000000A0BDB14140000000E004543F40	Israel
1601	Nevatim Air Base	\\N	Dimona	0101000020E610000097080000938141401DD3FF1F53353F40	Israel
1602	Ovda International Airport	VDA	Eilat	0101000020E610000000000040C877414000000080B7F03D40	Israel
1603	Ramat David Air Base	\\N	Ramat Yishay	0101000020E6100000000000E0F99641400000000022554040	Israel
1604	Ramon Air Base	\\N	Yeroẖam	0101000020E6100000000000605655414000000080AEC63E40	Israel
1605	Sde Dov Airport	SDV	Yehud	0101000020E6100000000000201F64414000000080AE0E4040	Israel
1606	Malta International Airport	MLA	Luqa	0101000020E610000014AE47E17AF42C405531957EC2ED4140	Malta
1607	Wiener Neustadt East Airport	\\N	Wiener Neustadt	0101000020E6100000000000E09542304000000040F1EB4740	Austria
1608	Wels Airport	\\N	Wels	0101000020E6100000000000E0F0142C400000006076174840	Austria
1609	Graz Airport	GRZ	Graz	0101000020E61000000000004013E12E4000000060DC7E4740	Austria
1610	Innsbruck Airport	INN	Innsbruck	0101000020E6100000E3A59BC420B0264079B130444EA14740	Austria
1611	Linz Hörsching Airport	LNZ	Linz	0101000020E61000000000000000602C40AEB6627FD91D4840	Austria
1612	Salzburg Airport	SZG	Salzburg	0101000020E61000001B1000A033022A40D41400E08AE54740	Austria
1613	Vienna International Airport	VIE	Vienna	0101000020E6100000250000E0D7913040D8FFFF3F1E0E4840	Austria
1615	Hinterstoisser Air Base	\\N	Zeltweg	0101000020E6100000CC5D4BC8077D2D404D4C1762F5994740	Austria
1616	Alverca Airport	\\N	Vialonga	0101000020E61000001D386744690F22C016C3D50110714340	Portugal
1618	Bragança Airport	BGC	Bragança	0101000020E610000050F8FFDF19D41AC0E5EFFF5FCCED4440	Portugal
1619	Beja International Airport	\\N	Beja	0101000020E6100000BBF2FF1FC7BA1FC04EE7FF5F190A4340	Portugal
1620	Braga Municipal Aerodrome	\\N	Braga	0101000020E6100000CA020060E9E320C0AF12002026CB4440	Portugal
1621	Coimbra Airport	\\N	Coimbra	0101000020E6100000B7EEE6A90EF120C03BFDA02E52144440	Portugal
1622	Cascais Airport	\\N	Cascais	0101000020E6100000000000C0E0B522C0000000C0CC5C4340	Portugal
1623	Covilhã Airport	\\N	Covilhã	0101000020E61000007A8D5DA27AEB1DC05B79C9FFE4214440	Portugal
1624	Évora Airport	\\N	Évora	0101000020E610000090DAC4C9FD8E1FC010B1C1C249444340	Portugal
1626	Faro Airport	FAO	Faro	0101000020E6100000BA12008017DD1FC03E0C00E0D7814240	Portugal
1627	Graciosa Airport	GRW	Lagoa	0101000020E610000000000000A1073CC000000040CD8B4340	Portugal
1628	Horta Airport	HOR	Horta	0101000020E61000000000004045B73CC0000000208C424340	Portugal
1629	Lajes Field	TER	Praia da Vitória	0101000020E6100000702600A03E173BC097E8FF9F82614340	Portugal
1630	Monte Real Air Base	\\N	Vieira de Leiria	0101000020E61000006666666666C621C008D858D306EA4340	Portugal
1631	Montijo Airport	\\N	Montijo	0101000020E6100000A1050020641222C04DE7FF5F195A4340	Portugal
1632	Ovar Airport	\\N	Ovar	0101000020E610000000000000B64A21C0000000403C754440	Portugal
1633	João Paulo II Airport	PDL	Ponta Delgada	0101000020E6100000CC0500A0A9B239C07EFBFF9FDFDE4240	Portugal
1634	Pico Airport	PIX	Madalena	0101000020E610000000000000F9703CC000000040F3464340	Portugal
1635	Portimão Airport	\\N	Portimão	0101000020E61000000F0000C0FC2A21C0FCFFFF3F1C934240	Portugal
1636	Francisco de Sá Carneiro Airport	OPO	Porto	0101000020E61000007AF5FF1FDF5C21C00C1500C0C19F4440	Portugal
1637	Porto Santo Airport	PXO	Camacha	0101000020E6100000492100A0995930C0A806002065894040	Portugal
1638	Lisbon Portela Airport	LIS	Lisbon	0101000020E6100000BBF9FF3F974522C08B1300A001644340	Portugal
2271	Hsinchu Air Base	\\N	Hsinchu	0101000020E61000003C4C00A0183C5E403F2F008068D13840	Taiwan
1639	São Jorge Airport	SJZ	Madalena	0101000020E610000000000040012D3CC0000000202F554340	Portugal
1640	Sintra Airport	\\N	Sintra	0101000020E610000000000080D9AD22C000000080616A4340	Portugal
1641	Tancos Airbase	\\N	Entroncamento	0101000020E6100000268DD13AAABA20C001A60C1CD0BC4340	Portugal
1642	Vila Real Airport	VRL	Vila Real	0101000020E6100000000000E0C2E11EC0000000401CA34440	Portugal
1643	Viseu Airport	\\N	Viseu	0101000020E610000000000060538E1FC000000020DD5C4440	Portugal
1645	Mostar International Airport	OMO	Mostar	0101000020E6100000000000E08CD831400000002036A44540	Bosnia and Herzegovina
1646	Sarajevo International Airport	SJJ	Sarajevo	0101000020E610000000000020DD543240000000808CE94540	Bosnia and Herzegovina
1647	Arad International Airport	ARW	Arad	0101000020E61000000000006012433540000000E09A164740	Romania
1648	Bacău Airport	BCM	Bacău	0101000020E61000000000006009E93A40000000A0CD424740	Romania
1649	Tautii Magheraus Airport	BAY	Recea	0101000020E6100000000000E0517837400000008046D44740	Romania
1650	Băneasa International Airport	BBU	Bucharest	0101000020E610000000000040231A3A40000000E068404640	Romania
1651	Mihail Kogălniceanu International Airport	CND	Constanţa	0101000020E610000000000040017D3C40000000A05C2E4640	Romania
1652	Cluj-Napoca International Airport	CLJ	Cluj-Napoca	0101000020E6100000000000C0AAAF37400000006081644740	Romania
1653	Caransebeş Airport	CSB	Caransebeş	0101000020E610000000000040D840364000000080C2B54640	Romania
1654	Craiova Airport	CRA	Craiova	0101000020E6100000000000407BE3374000000080B7284640	Romania
1655	Iaşi Airport	IAS	Iaşi	0101000020E6100000000000A0DF9E3B4000000020D9964740	Romania
1656	Oradea International Airport	OMR	Oradea	0101000020E6100000000000400AE73540000000003D834740	Romania
1657	Henri Coandă International Airport	OTP	Bucharest	0101000020E6100000F6285C8FC2153A40F970242B1A494640	Romania
1658	Sibiu International Airport	SBZ	Sibiu	0101000020E6100000000000605F173840000000808EE44640	Romania
1659	Satu Mare Airport	SUJ	Satu Mare	0101000020E610000000000040BDE23640000000C005DA4740	Romania
1660	Suceava Stefan cel Mare Airport	SCV	Suceava	0101000020E610000000000040A65A3A400000000000D84740	Romania
1661	Tulcea Airport	TCE	Tulcea	0101000020E610000000000060DCB63C400000000000884640	Romania
1662	Transilvania Târgu Mureş International Airport	TGM	Ungheni	0101000020E6100000000000A099693840000000A0DD3B4740	Romania
1663	Timişoara Traian Vuia Airport	TSR	Timişoara	0101000020E6100000000000A080563540000000C0AAE74640	Romania
1664	Les Eplatures Airport	\\N	La Chaux-de-Fonds	0101000020E6100000F20B0040DE2B1B40E7150040BD8A4740	Switzerland
1665	Geneva Cointrin International Airport	GVA	Genève	0101000020E6100000000000A0906F1840000000007A1E4740	Switzerland
1666	Saanen Airport	\\N	Saanen	0101000020E61000004EF5FF9FD9001D40B1150060663E4740	Switzerland
1667	Sion Airport	SIR	Conthey	0101000020E6100000501100209A4E1D405F0500E01B1C4740	Switzerland
1668	Alpnach Air Base	\\N	Alpnach	0101000020E61000003602F1BA7E912040B2D47ABFD1784740	Switzerland
1669	Dübendorf Air Base	\\N	Dübendorf	0101000020E6100000260200C0E44B2140AA09006005B34740	Switzerland
1670	Emmen Air Base	EML	Emmen	0101000020E61000006286C613419C2040105B7A34D58B4740	Switzerland
1671	Mollis Airport	\\N	Glarus	0101000020E6100000000000603121224000000060198A4740	Switzerland
1672	Meiringen Airport	\\N	Interlaken	0101000020E6100000000000E05138204000000080245F4740	Switzerland
1673	Payerne Air Base	\\N	Payerne	0101000020E61000002EEAFF7F05A91B405DFE43FAED6B4740	Switzerland
1675	Lugano Airport	LUG	Lugano	0101000020E6100000BB07008037D22140E7F5FFDF8C004740	Switzerland
1676	Bern Belp Airport	BRN	Bern	0101000020E6100000241400E014FD1D40080F004001754740	Switzerland
1677	Grenchen Airport	\\N	Grenchen	0101000020E6100000000000E033AB1D40000000A03E974740	Switzerland
1678	Zürich Airport	ZRH	Zürich	0101000020E61000000F0000C02C1921400D0000407BBB4740	Switzerland
1679	St Gallen Altenrhein Airport	ACH	Thal	0101000020E6100000E9FFFF3F1D1F2340A11A008014BE4740	Switzerland
1680	Samedan Airport	SMV	Davos	0101000020E610000000000020AAC42340000000605D444740	Switzerland
1681	Güvercinlik Airport	\\N	Ankara	0101000020E610000094020080D25E4040F0040020AEF74340	Turkey
1682	Esenboğa International Airport	ESB	Ankara	0101000020E61000007CF8FF5F5F7F4040AB0C00A065104440	Turkey
1683	Etimesgut Air Base	ANK	Ankara	0101000020E610000021F9FFFF235840409708000093F94340	Turkey
1684	Akıncı Air Base	\\N	Ankara	0101000020E6100000AC0C00A0654840404DE7FF5F190A4440	Turkey
1685	Adana Airport	ADA	Adana	0101000020E6100000A1FAFF1FE4A34140C31600C0B87D4240	Turkey
1686	İncirlik Air Base	UAB	Adana	0101000020E6100000A0F7FFDF83B64140A60300E044804240	Turkey
1687	Afyon Airport	AFY	Afyonkarahisar	0101000020E610000012DEFFBFE1993E4056F6FF9FFA5C4340	Turkey
1688	Antalya International Airport	AYT	Antalya	0101000020E6100000516A2FA2EDCC3E40F6F065A208734240	Turkey
1689	Gaziantep International Airport	GZT	Gaziantep	0101000020E61000002E11000046BD424072E6FFDF3D794240	Turkey
1690	İskenderun Airport	\\N	İskenderun	0101000020E61000001CF0FF3FA313424040EFFFBF87494240	Turkey
1691	Konya Airport	KYA	Konya	0101000020E61000007B4B395FEC4740405A643BDF4FFD4240	Turkey
1692	Malatya Tulga Airport	MLX	Malatya	0101000020E610000059BE2EC37F2043405FD04202462D4340	Turkey
1693	Amasya Merzifon Airport	MZH	Merzifon	0101000020E6100000B9C5FCDCD0C24140E52A16BF296A4440	Turkey
1694	Sivas Nuri Demirağ Airport	VAS	Sivas	0101000020E6100000CFF753E3A5734240DE3994A12AE84340	Turkey
1695	Malatya Erhaç Airport	\\N	Malatya	0101000020E6100000AD0F00E0A50B43403D0C00E0B7374340	Turkey
1696	Kayseri Erkilet Airport	ASR	Kayseri	0101000020E61000004A01004069BF4140E30C00809C624340	Turkey
1697	Sivrihisar Airport	\\N	Sivrihisar	0101000020E610000000000040845D3F40000000C0CAB94340	Turkey
1698	Tokat Airport	\\N	Tokat	0101000020E610000000000040072F4240000000E059274440	Turkey
1699	Çardak Airport	DNZ	Denizli	0101000020E6100000BE2D006088B33D40730900808EE44240	Turkey
1701	Atatürk International Airport	IST	İstanbul	0101000020E6100000D2CEFF9F89D03C40551600000B7D4440	Turkey
1702	Balıkesir Merkez Airport	BZI	Balıkesir	0101000020E6100000000000600EED3B400000004045CF4340	Turkey
1703	Bandırma Airport	BDM	Bandırma	0101000020E6100000000000804AFA3B4000000040B4284440	Turkey
1705	Eskişehir Air Base	ESK	Eskişehir	0101000020E61000001D36008004953E40681700605DE44340	Turkey
1706	Adnan Menderes International Airport	ADB	İzmir	0101000020E61000000BF2FF1F31283B40EBFBFF5F6D254340	Turkey
1707	Gaziemir Airport	\\N	İzmir	0101000020E610000000000080CE283B4000000040D8284340	Turkey
1708	Çiğli Airport	IGL	İzmir	0101000020E610000030F4FFDF95023B404E0A0000AA414340	Turkey
1709	Isparta Airport	\\N	Isparta	0101000020E6100000000000800B973E40000000E07EE44240	Turkey
1710	Kütahya Airport	\\N	Kütahya	0101000020E61000000000008053043E40000000209EB64340	Turkey
1712	Yalova Airport	\\N	Yalova	0101000020E6100000000000E02D603D40000000609A574440	Turkey
1713	Cengiz Topel Airport	\\N	Köseköy	0101000020E61000000000002053153E4000000080145E4440	Turkey
1715	Dalaman International Airport	DLM	Dalaman	0101000020E61000000FD8FF3FE1CA3C40BAE4FFDF465B4240	Turkey
1716	Akhisar Airport	\\N	Akhisar	0101000020E6100000000000807AD53B40000000008A674340	Turkey
1718	Imsık Airport	BXN	Bodrum	0101000020E61000000000008071AB3B40000000C0EE914240	Turkey
1719	Samandıra Air Base	\\N	İstanbul	0101000020E6100000000000806C373D40000000A01A7F4440	Turkey
1721	Elazığ Airport	EZS	Elazığ	0101000020E6100000E6F2FF9F4CA54340F50D00E0AE4D4340	Turkey
1722	Diyarbakir Airport	DIY	Diyarbakır	0101000020E610000055F3FF5FBA194440D81A00606BF24240	Turkey
1723	Erzincan Airport	ERC	Erzincan	0101000020E6100000A8E6FFBF74C34340C1F0FFDFE7DA4340	Turkey
1724	Erzurum International Airport	ERZ	Erzurum	0101000020E6100000C8FFFF1FC9954440F40A00A06EFA4340	Turkey
1726	Trabzon International Airport	TZX	Trabzon	0101000020E6100000000000E014E54340000000605F7F4440	Turkey
1728	Van Ferit Melen Airport	VAN	Van	0101000020E6100000000000C088AA454000000000EE3B4340	Turkey
1729	Batman Airport	BAL	Batman	0101000020E610000067F4FFBFEC8E44404B040080E9F64240	Turkey
1731	Siirt Airport	\\N	Siirt	0101000020E61000000000004092EB4440000000A04CFD4240	Turkey
1732	Kaklıç Airport	\\N	İzmir	0101000020E6100000000000E036FA3A40000000C040424340	Turkey
1733	Selçuk Efes Airport	\\N	İzmir	0101000020E61000000000006039543B4000000080B0F94240	Turkey
1734	Balti International Airport	BZY	Bălţi	0101000020E61000000000006010C83B40000000E046EB4740	Moldova
1735	Chişinău International Airport	KIV	Chisinau	0101000020E61000000000000056EE3C40000000E0BE764740	Moldova
1736	Ohrid St. Paul the Apostle Airport	OHD	Ohrid	0101000020E610000020D26F5F07BE3440D7A3703D0A974440	Macedonia
1737	Skopje Alexander the Great Airport	SKP	Skopje	0101000020E6100000A2B3CC22149F35408466D7BD15FB4440	Macedonia
1738	Gibraltar Airport	GIB	Gibraltar	0101000020E61000006A0500400D6615C0D5F4FF7F5A134240	Gibraltar
1739	Belgrade Nikola Tesla Airport	BEG	Belgrade	0101000020E6100000870D0020214F344089100060C1684640	Serbia
1740	Nis Airport	INI	Niš	0101000020E6100000009013268CDA35409CFC169D2CAB4540	Serbia
1741	Podgorica Airport	TGD	Podgorica	0101000020E6100000000000807C403340000000E0002E4540	Montenegro
1743	Tivat Airport	TIV	Tivat	0101000020E6100000000000402AB9324000000040CD334540	Montenegro
1744	Vršac International Airport	\\N	Vršac	0101000020E6100000C8073D9B554F354026E4839ECD924640	Serbia
1745	M. R. Štefánik Airport	BTS	Bratislava	0101000020E6100000000000807336314000000020C9154840	Slovakia
1746	Košice Airport	KSC	Košice	0101000020E6100000000000C0B83D354000000080E0544840	Slovakia
1747	Kuchyňa Air Base	\\N	Malacky	0101000020E6100000000000804F1E3140000000C074334840	Slovakia
1748	Piešťany Airport	PZY	Piešťany	0101000020E61000000000000012D431400000008006504840	Slovakia
1749	Sliač Airport	SLD	Zvolen	0101000020E6100000000000605422334000000060A3514840	Slovakia
1750	Trenčín Airport	\\N	Trenčín	0101000020E6100000B721006007FE314041120060B86E4840	Slovakia
1751	Poprad-Tatry Airport	TAT	Poprad	0101000020E6100000C31600C0B83D344061E8FFBF6B894840	Slovakia
1755	South Caicos Airport	XSC	Cockburn Town	0101000020E610000097080000D3E151C0A60300E004843540	Turks and Caicos Islands
1756	Arroyo Barril Airport	EPS	Samaná	0101000020E61000000FFBFFDF815B51C0C1D0FF7FD7323340	Dominican Republic
1757	Maria Montez International Airport	BRX	Santa Cruz de Barahona	0101000020E6100000000000A0B4C751C00000004062403240	Dominican Republic
1758	Cabo Rojo Airport	\\N	Pedernales	0101000020E61000000000006044E951C000000000D3ED3140	Dominican Republic
1759	Casa De Campo International Airport	LRM	La Romana	0101000020E6100000000000E05A3A51C00000002061733240	Dominican Republic
1760	Punta Cana International Airport	PUJ	Punta Cana	0101000020E610000091FCFFFF411751C08DD6FF1F41913240	Dominican Republic
1761	Gregorio Luperon International Airport	POP	Puerto Plata	0101000020E6100000000000E07AA451C0000000C005C23340	Dominican Republic
1762	Las Américas International Airport	SDQ	Santo Domingo	0101000020E61000000D000040CF6A51C087FFFFDF006E3240	Dominican Republic
1763	San Isidro Air Base	\\N	Santo Domingo Este	0101000020E6100000000000C0BF7051C000000080F2803240	Dominican Republic
1764	Cibao International Airport	STI	Santiago de los Caballeros	0101000020E610000000000060B3A651C000000020F6673340	Dominican Republic
1765	Bananera Airport	\\N	Morales	0101000020E6100000000000A0943556C0000000A06EF22E40	Guatemala
1766	Coban Airport	CBV	Cobán	0101000020E610000000000060079A56C0000000C020F02E40	Guatemala
1767	La Aurora Airport	GUA	Guatemala City	0101000020E610000000000080C2A156C000000040A62A2D40	Guatemala
1769	Retalhuleu Airport	\\N	Retalhuleu	0101000020E6100000000000A0A0EC56C000000080C00A2D40	Guatemala
1770	San José Airport	\\N	Puerto San José	0101000020E61000006F0000C07DB556C02EF1FF9F55DF2B40	Guatemala
1771	Goloson International Airport	LCE	La Ceiba	0101000020E610000083A5BA8097B655C05C8FC2F5287C2F40	Honduras
1772	Ramón Villeda Morales International Airport	SAP	San Pedro Sula	0101000020E6100000000000401CFB55C000000020BBE72E40	Honduras
1774	Juan Manuel Galvez International Airport	RTB	Coxen Hole	0101000020E61000006F2D93E178A155C0CF6740BD19513040	Honduras
1775	Tela Airport	TEA	Tela	0101000020E6100000F5DBD78173DE55C0CCEEC9C3428D2F40	Honduras
1776	Toncontín International Airport	TGU	Tegucigalpa	0101000020E6100000000000A0E6CD55C0000000402E1F2C40	Honduras
1777	Trujillo Airport	\\N	Trujillo	0101000020E6100000ADC266800B7C55C098DD938785DA2F40	Honduras
1778	Boscobel Aerodrome	OCJ	Ocho Rios	0101000020E610000000000020043E53C0000000A079673240	Jamaica
1779	Norman Manley International Airport	KIN	Kingston	0101000020E610000000000060663253C0000000008AEF3140	Jamaica
1780	Sangster International Airport	MBJ	Montego Bay	0101000020E610000000000020757A53C000000080F2803240	Jamaica
1781	Ken Jones Airport	POT	Port Antonio	0101000020E61000002A080040352253C024FFFF7FE4323240	Jamaica
1782	Tinson Pen Airport	KTP	Kingston	0101000020E610000000000020B93453C0000000E014FD3140	Jamaica
1783	General Juan N Alvarez International Airport	ACA	Acapulco de Juárez	0101000020E61000000000008041F058C000000040D1C13040	Mexico
1784	Del Norte International Airport	NTR	Monterrey	0101000020E6100000000000002B0F59C00000000098DD3940	Mexico
1785	Jesús Terán Paredo International Airport	AGU	Aguascalientes	0101000020E610000019C6DD205A9459C060066344A2B43540	Mexico
1786	Bahías de Huatulco International Airport	HUX	Santa María Huatulco	0101000020E610000000000080CE1058C000000020F48C2F40	Mexico
1787	General Mariano Matamoros Airport	CVJ	Cuernavaca	0101000020E610000000000020B9D058C000000080B5D53240	Mexico
1788	Ciudad Acuña New International Airport	\\N	Ciudad Acuña	0101000020E610000000000000564659C0000000E038553D40	Mexico
1789	Ciudad del Carmen International Airport	CME	Ciudad del Carmen	0101000020E6100000000000E022F356C0000000E058A73240	Mexico
1790	Nuevo Casas Grandes Airport	\\N	Nuevo Casas Grandes	0101000020E61000000000000000F85AC000000000BC653E40	Mexico
1791	Chilpancingo Airport	\\N	Chilpancingo	0101000020E610000094DBF63DEAE058C03E7AC37DE4923140	Mexico
1792	Bachigualato Federal International Airport	CUL	Culiacán	0101000020E6100000B7DEFF5F66DE5AC0B3F8FF3FB6C33840	Mexico
1793	Chetumal International Airport	CTM	Chetumal	0101000020E610000000000040EA1456C00000000034813240	Mexico
1794	Ciudad Obregón International Airport	CEN	Ciudad Obregón	0101000020E6100000000000E04F755BC00000006081643B40	Mexico
1795	Ingeniero Alberto Acuña Ongay International Airport	CPE	Campeche	0101000020E6100000A70300E004A056C0D1EBFFBF19D13340	Mexico
1796	Abraham González International Airport	CJS	Ciudad Juárez	0101000020E6100000000000C0749B5AC000000080D7A23F40	Mexico
1797	General Roberto Fierro Villalobos International Airport	CUU	Chihuahua	0101000020E6100000111E0080C27D5AC0862A0040F1B33C40	Mexico
1798	General Pedro Jose Mendez International Airport	CVM	Ciudad Victoria	0101000020E6100000B904004037BD58C0591C00800BB43740	Mexico
1800	Cozumel International Airport	CZM	San Miguel de Cozumel	0101000020E6100000000000003DBB55C000000000BC853440	Mexico
1801	General Guadalupe Victoria International Airport	DGO	Victoria de Durango	0101000020E6100000541300C0CA215AC0E0E6FF9FCB1F3840	Mexico
1802	Amado Nervo National Airport	TPQ	Tepic	0101000020E6100000000000C0F3355AC000000060646B3540	Mexico
1803	Ensenada Airport	ESE	Ensenada	0101000020E61000000000008097265DC0000000C098CB3F40	Mexico
1804	Don Miguel Hidalgo Y Costilla International Airport	GDL	Guadalajara	0101000020E610000000000060E7D359C0000000A094853440	Mexico
1805	General José María Yáñez International Airport	GYM	Heroica Guaymas	0101000020E61000000000004033BB5BC00000006010F83B40	Mexico
1806	Tehuacan Airport	TCN	Tehuacán	0101000020E6100000000000A0DF5A58C000000080487F3240	Mexico
1807	General Ignacio P. Garcia International Airport	HMO	Hermosillo	0101000020E61000001301006012C35BC0E9F5FFDF8C183D40	Mexico
1808	Licenciado Miguel de la Madrid Airport	CLQ	Colima	0101000020E6100000EDFEFF9FEDE459C052CDFF7FE9463340	Mexico
1809	Isla Mujeres Airport	ISJ	Isla Mujeres	0101000020E6100000000000205CAF55C000000060B83E3540	Mexico
1810	Plan De Guadalupe International Airport	SLW	Saltillo	0101000020E6100000000000C0743B59C000000000AC8C3940	Mexico
1811	Ixtepec Airport	\\N	El Espinal	0101000020E610000000000020FFC557C00000006005733040	Mexico
1813	Lázaro Cárdenas Airport	LZC	La Orilla	0101000020E6100000B395FFDF248E59C0FFDCFF5F6F003240	Mexico
1814	Valle del Fuerte International Airport	LMM	Los Mochis	0101000020E6100000F14700202F455BC050CAFF3F69AF3940	Mexico
1815	Del Bajío International Airport	BJX	Silao	0101000020E61000003A6900C0C85E59C0AC2C000056FE3440	Mexico
1816	Manuel Márquez de León International Airport	LAP	La Paz	0101000020E61000004F4D00002B975BC0E20C00809C123840	Mexico
1817	Loreto International Airport	LTO	Loreto	0101000020E6100000000000A045D65BC0000000403CFD3940	Mexico
1818	General Servando Canales International Airport	MAM	Matamoros	0101000020E6100000730900809E6158C03F0F002018C53940	Mexico
1819	Licenciado Manuel Crescencio Rejon Int Airport	MID	Mérida	0101000020E6100000BD0A00C0176A56C0F42D0040DFEF3440	Mexico
1820	General Rodolfo Sánchez Taboada International Airport	MXL	Mexicali	0101000020E61000006BDAFFDF7CCF5CC0BB070080B7504040	Mexico
1821	General Francisco J. Mujica International Airport	MLM	Morelia	0101000020E6100000492100A0994159C09708000093D93340	Mexico
1822	Minatitlán/Coatzacoalcos National Airport	MTT	Minatitlán	0101000020E6100000510D00402AA557C047DBFF5F781A3240	Mexico
1823	Monclova International Airport	LOV	Monclova	0101000020E610000000000080145E59C0000000C0A8F43A40	Mexico
1824	Licenciado Benito Juarez International Airport	MEX	Mexico City	0101000020E6100000D906EE409DC458C0AB3E575BB16F3340	Mexico
1825	General Mariano Escobedo International Airport	MTY	Monterrey	0101000020E610000052ADFF1FD90659C05A1F00C04BC73940	Mexico
1826	General Rafael Buelna International Airport	MZT	Mazatlán	0101000020E6100000BBA4FF1F06915AC08DF6FF7F51293740	Mexico
1827	Nogales International Airport	NOG	Nogales	0101000020E6100000000000C076BE5BC0000000C0E1393F40	Mexico
1828	Quetzalcóatl International Airport	NLD	Nuevo Laredo	0101000020E6100000180A002083E458C096280060A3713B40	Mexico
1829	Xoxocotlán International Airport	OAX	Oaxaca	0101000020E6100000840700A0802E58C0C81F0080F9FF3040	Mexico
1830	El Tajín National Airport	PAZ	Poza Rica de Hidalgo	0101000020E61000006F0000C07D5D58C0521000804A9A3440	Mexico
1831	Hermanos Serdán International Airport	PBC	Tlaltenango	0101000020E610000027050000C59758C0C71C004079283340	Mexico
1832	Ingeniero Juan Guillermo Villasana Airport	PCA	Los Tuzos	0101000020E61000000000008014B258C000000080D0133440	Mexico
1833	Puerto Peñasco International Airport	PPE	Puerto Peñasco	0101000020E61000009AD024B1A4615CC011C5E40D305B3F40	Mexico
1834	Piedras Negras International Airport	PDS	Piedras Negras	0101000020E6100000000000803D2259C0000000409DA03C40	Mexico
1835	Licenciado y General Ignacio Lopez Rayon Airport	UPN	Uruapan	0101000020E6100000000000007F8259C0000000208E653340	Mexico
1836	Licenciado Gustavo Díaz Ordaz International Airport	PVR	Puerto Vallarta	0101000020E61000000000008041505AC0000000001BAE3440	Mexico
1837	Puerto Escondido International Airport	PXM	Puerto Escondido	0101000020E6100000A1F7FFDFB34558C0D2ABFFFFF8C02F40	Mexico
1838	Querétaro Intercontinental Airport	QRO	Pedro Escobedo	0101000020E6100000C4B3FF5FE70B59C0B7210060079E3440	Mexico
1839	General Lucio Blanco International Airport	REX	Reynosa	0101000020E6100000FEFCFFBF9F8E58C03CE9FF3F47023A40	Mexico
1840	Los Cabos International Airport	SJD	San José del Cabo	0101000020E6100000000000E0246E5BC000000060DC263740	Mexico
1841	San Felipe International Airport	SFH	San Felipe	0101000020E6100000F5FFFF9FC6B35CC0C0FFFF9F21EE3E40	Mexico
1842	Ponciano Arriaga International Airport	SLP	San Luis Potosí	0101000020E6100000A8260080953B59C0D1EBFFBF19413640	Mexico
1843	Tlaxcala Airport	TXA	Tlaxcala	0101000020E61000008787307E1A8B58C07782FDD7B9893340	Mexico
1844	Terán Air Base	\\N	Copoya	0101000020E61000003A060060174B57C0D00B00206ABD3040	Mexico
1845	Francisco Sarabia International Airport	TRC	Torreon	0101000020E6100000E93800E04DDA59C05F0800207C913940	Mexico
1846	Angel Albino Corzo International Airport	TGZ	Copoya	0101000020E6100000850700A0704157C0BC2A002048903040	Mexico
1847	General Abelardo L. Rodríguez International Airport	TIJ	Tijuana	0101000020E610000000000080143E5DC0000000C042454040	Mexico
1848	General Francisco Javier Mina International Airport	TAM	Tampico	0101000020E610000058F9FFDF6A7758C0860A00E0E04B3640	Mexico
1849	Tamuin Airport	TSL	Tamuin	0101000020E61000006F0000C09DB358C076CCFFFFCD093640	Mexico
1850	Licenciado Adolfo Lopez Mateos International Airport	TLC	Toluca	0101000020E6100000CC02006039E458C0E3ECFF1F4C563340	Mexico
1851	Tapachula International Airport	TAP	Tapachula	0101000020E6100000F0040020AE1757C07F9BFF7FAE962D40	Mexico
1852	Cancún International Airport	CUN	Cancún	0101000020E61000001301006022B855C0400F002058093540	Mexico
1853	Carlos Rovirosa Pérez International Airport	VSA	Villahermosa	0101000020E610000000000040503457C0000000603BFF3140	Mexico
1854	General Heriberto Jara International Airport	VER	Las Amapolas	0101000020E610000067F4FFBFFC0B58C0D0EBFFBF59253340	Mexico
1855	General Leobardo C. Ruiz International Airport	ZCL	Zacatecas	0101000020E6100000BD0A00C0F7AB59C0C4F6FF5FA8E53640	Mexico
1856	Ixtapa Zihuatanejo International Airport	ZIH	El Coacoyul	0101000020E61000000DD5FFFF805D59C0111E0080029A3140	Mexico
1857	Zamora Airport	ZMM	Zamora	0101000020E610000000000000AA9159C000000020850B3440	Mexico
1858	Playa De Oro International Airport	ZLO	Cihuatlán	0101000020E6100000B21800A0C6235AC0072F00A011253340	Mexico
1859	Zapopan Airport	\\N	Zapopan	0101000020E610000035D1E7A38CDD59C07BF5F1D077BF3440	Mexico
1860	Bluefields Airport	BEF	Bluefields	0101000020E6100000000000E08AF154C00000006064FB2740	Nicaragua
1861	Los Brasiles Airport	\\N	Ciudad Sandino	0101000020E610000000000040A69655C0000000A047612840	Nicaragua
1862	Leon (Fanor Urroz) Airport	\\N	León	0101000020E610000000000080C7B955C000000020C0DB2840	Nicaragua
1863	Augusto C. Sandino (Managua) International Airport	MGA	Managua	0101000020E6100000000000C0C38A55C0000000C072482840	Nicaragua
1864	Puerto Cabezas Airport	PUZ	Puerto Cabezas	0101000020E6100000000000C0BFD854C0000000A02A182C40	Nicaragua
1865	Bocas Del Toro International Airport	BOC	Bocas del Toro	0101000020E6100000000000200D9054C0000000E083AE2240	Panama
1866	Cap Manuel Niño International Airport	CHX	Changuinola	0101000020E61000000000004013A154C0000000E0D2EA2240	Panama
1867	Enrique Malek International Airport	DAV	David	0101000020E610000000000000D79B54C00000002031C82040	Panama
1868	Panama Pacific International Airport	BLB	Veracruz	0101000020E6100000702711E15FE653C06A6AD95A5FD42140	Panama
1869	Marcos A. Gelabert International Airport	PAC	Panamá	0101000020E6100000000000008FE353C0000000A059F22140	Panama
1870	Ruben Cantu Airport	\\N	Santiago de Veraguas	0101000020E6100000000000C07F3C54C0000000C0D32B2040	Panama
1871	Tocumen International Airport	PTY	Tocumen	0101000020E6100000DAFDFF3F8BD853C04A01004089242240	Panama
1872	Buenos Aires Airport	\\N	Buenos Aires	0101000020E61000009CC58B8521D554C07F6C921FF1532240	Costa Rica
1874	Coto 47 Airport	OTR	Corredor	0101000020E610000000000080FDBD54C0000000A0FF332140	Costa Rica
1875	Chacarita Airport	\\N	Chacarita	0101000020E6100000A0F7FFDF733155C05BFFFF5F7BF62340	Costa Rica
1877	El Carmen de Siquirres Airport	\\N	Siquirres	0101000020E61000000000008038DE54C0000000806C672440	Costa Rica
1878	Finca 10 / Nuevo Palmar Sur Airport	\\N	Buenos Aires	0101000020E6100000000000A077E054C0000000E02BD52140	Costa Rica
1879	Golfito Airport	GLF	Golfito	0101000020E610000000000020A9CB54C000000060DA4E2140	Costa Rica
1880	Guapiles Airport	\\N	Guápiles	0101000020E610000091FCFFFF01F354C030B1FFDF346F2440	Costa Rica
1881	Daniel Oduber Quiros International Airport	LIR	Liberia	0101000020E610000000000080D76255C000000000C52F2540	Costa Rica
1882	Los Chiles Airport	\\N	San José	0101000020E6100000000000C0302D55C0000000E012122640	Costa Rica
1883	Limon International Airport	LIO	Limón	0101000020E61000000000008068C154C0000000C079EA2340	Costa Rica
1884	Nosara Airport	NOB	Nicoya	0101000020E6100000D8F7FFBFCA6955C0B5FBFF7FF6F32340	Costa Rica
1885	Juan Santamaria International Airport	SJO	Alajuela	0101000020E6100000000000005D0D55C000000040DBFC2340	Costa Rica
1886	Pandora Airport	\\N	Limón	0101000020E6100000000000C0ECBE54C000000000DF762340	Costa Rica
1887	Palmar Sur Airport	PMZ	Buenos Aires	0101000020E610000000000080FDDD54C000000060EDE62140	Costa Rica
1889	Quepos Managua Airport	XQP	Quepos	0101000020E6100000000000A04E0855C0000000E0E5E22240	Costa Rica
1890	Santa Clara De Guapiles Airport	\\N	Guácimo	0101000020E610000000000000AAED54C0000000009C932440	Costa Rica
1891	San Vito De Java Airport	\\N	Corredor	0101000020E6100000000000A05EBD54C0000000E0F7A62140	Costa Rica
1892	El Salvador International Airport	SAL	San Salvador	0101000020E610000098141F9F904356C0E09C11A5BDE12A40	El Salvador
1893	Ilopango International Airport	\\N	San Salvador	0101000020E610000000000080AC4756C0000000E024662B40	El Salvador
1894	Les Cayes Airport	\\N	Les Cayes	0101000020E610000000000080737252C0000000C066453240	Haiti
1895	Cap Haitien International Airport	CAP	Okap	0101000020E610000000000000760C52C0000000E0A5BB3340	Haiti
1896	Jacmel Airport	\\N	Jacmel	0101000020E6100000000000202F2152C0000000C0B83D3240	Haiti
1897	Toussaint Louverture International Airport	PAP	Port-au-Prince	0101000020E610000000000060B81252C0000000E07A943240	Haiti
1898	Gustavo Rizo Airport	BCA	Baracoa	0101000020E6100000000000A065A052C000000040845D3440	Cuba
1899	Carlos Manuel de Cespedes Airport	BYM	Bayamo	0101000020E610000000000000C52753C0000000807A653440	Cuba
1900	Maximo Gomez Airport	AVI	Ciego de Ávila	0101000020E6100000000000C088B253C000000000F0063640	Cuba
1901	Jardines Del Rey Airport	CCC	Morón	0101000020E610000025FFFF7F049553C0A1FAFF1F04763640	Cuba
1902	Jaime Gonzalez Airport	CFG	Cienfuegos	0101000020E610000000000040821A54C00000006066263640	Cuba
1904	Ignacio Agramonte International Airport	CMW	Camagüey	0101000020E6100000000000803D7653C0000000C0986B3540	Cuba
1905	Antonio Maceo International Airport	SCU	Santiago de Cuba	0101000020E61000000000004077F552C0000000E044F83340	Cuba
1906	Florida Airport	\\N	Florida	0101000020E6100000000000A0FA8C53C000000060EC7F3540	Cuba
1907	Leeward Point Field	\\N	Guantánamo	0101000020E61000000F00002041CD52C01D00006010E83340	Cuba
1908	Mariana Grajales Airport	GAO	Guantánamo	0101000020E6100000000000A021CA52C000000040D6153440	Cuba
1909	José Martí International Airport	HAV	Havana	0101000020E6100000000000C02E9A54C0000000403CFD3640	Cuba
1910	Frank Pais International Airport	HOG	Holguín	0101000020E6100000000000A02A1453C0000000201DC93440	Cuba
1911	La Coloma Airport	LCL	Pinar del Río	0101000020E6100000000000E014E954C0000000A00A563640	Cuba
1912	Orestes Acosta Airport	MOA	Moa	0101000020E61000000000006005BB52C00000000066A73440	Cuba
1913	Sierra Maestra Airport	MZO	Manzanillo	0101000020E610000000000080B54553C0000000E0C0493440	Cuba
1914	Rafael Cabrera Airport	GER	Nueva Gerona	0101000020E6100000000000C029B254C0000000E0AED53540	Cuba
1915	Playa Baracoa Airport	UPB	Baracoa	0101000020E6100000A70300E014A554C0B1D5FF9F65083740	Cuba
1916	Pinar Del Rio Airport	\\N	Pinar del Río	0101000020E6100000000000E06AEB54C0000000E0E06B3640	Cuba
1917	San Antonio De Los Banos Airport	\\N	San Antonio de los Baños	0101000020E61000000000006098A054C0000000A01ADF3640	Cuba
1918	Abel Santamaria Airport	SNU	Santa Clara	0101000020E61000000000000064FC53C0000000E0007E3640	Cuba
1919	Joaquín de Agüero Airport	\\N	Manatí	0101000020E6100000EC030078514153C0D007CAB36B823540	Cuba
1920	Siguanea Airport	\\N	Nueva Gerona	0101000020E61000000000006020BD54C0000000E07AA43540	Cuba
1921	Sancti Spiritus Airport	\\N	Sancti Spíritus	0101000020E6100000D4B5F63E55DC53C0D50968226CF83540	Cuba
1923	Juan Gualberto Gomez International Airport	VRA	Varadero	0101000020E610000000000000DC5B54C000000080CE083740	Cuba
1924	Hermanos Ameijeiras Airport	VTU	Las Tunas	0101000020E610000000000020E43B53C000000060D3FC3440	Cuba
1925	Gerrard Smith International Airport	CYB	Little Cayman	0101000020E6100000000000C07FF853C000000040DFAF3340	Cayman Islands
1926	Owen Roberts International Airport	GCM	George Town	0101000020E610000024FFFF7FE45654C0AAE9FFFFF44A3340	Cayman Islands
1928	Andros Town Airport	ASD	San Andros	0101000020E610000000000020EB7253C0000000A0A9B23840	Bahamas
1930	Marsh Harbour International Airport	MHH	Marsh Harbour	0101000020E6100000C3F3FF1F584553C0D7170020EB823A40	Bahamas
1931	San Andros Airport	SAQ	San Andros	0101000020E6100000000000E0228353C0000000E0C50D3940	Bahamas
1932	Spring Point Airport	AXP	Masons Bay	0101000020E61000009A0B0040237E52C0D1EBFFBF19713640	Bahamas
1933	Sandy Point Airport	\\N	Hard Bargain	0101000020E6100000000000E04F5953C0000000802D013A40	Bahamas
1934	Treasure Cay Airport	TCB	Cooper’s Town	0101000020E6100000D9FAFFFF0A5953C05C220000CCBE3A40	Bahamas
1935	Chub Cay Airport	CCZ	San Andros	0101000020E6100000000000A0607853C000000020C76A3940	Bahamas
1937	South Bimini Airport	BIM	Alice Town	0101000020E6100000860A00E0F0D053C0E02900A02CB33940	Bahamas
1941	Exuma International Airport	GGT	George Town	0101000020E6100000870D002031F852C038E0FF7F06903740	Bahamas
1942	George Town Airport	\\N	George Town	0101000020E61000003B06006007F252C04FEAFF9F79773740	Bahamas
1943	North Eleuthera Airport	ELH	Spanish Wells	0101000020E610000073090080BE2B53C09708000093793940	Bahamas
1944	Governor's Harbour Airport	GHB	Governor’s Harbour	0101000020E61000007AF5FF1F2F1553C08E190020E2483940	Bahamas
1946	Rock Sound Airport	RSD	Governor’s Harbour	0101000020E6100000AF0A0008520B53C05DDE3EE123E53840	Bahamas
1947	Staniel Cay Airport	\\N	Black Point	0101000020E6100000000000401A1C53C0000000204A2B3840	Bahamas
1948	Grand Bahama International Airport	FPO	Freeport	0101000020E6100000260200C084AC53C03BE6FFFF068F3A40	Bahamas
1949	Inagua Airport	IGA	Matthew Town	0101000020E610000000000080AE6A52C0000000A099F93440	Bahamas
1950	Deadman's Cay Airport	LGI	Clarence Town	0101000020E61000006DFDFF7FFDC552C097080000D32D3740	Bahamas
1951	Stella Maris Airport	SML	Port Nelson	0101000020E61000006AFFFF1731D152C03561CEB612953740	Bahamas
1952	Mayaguana Airport	MYG	Abraham’s Bay	0101000020E6100000E9F8FF1FDD4052C0BAE4FFDF26613640	Bahamas
1953	Lynden Pindling International Airport	NAS	Nassau	0101000020E6100000B2F8FF3FD65D53C05E0500E0FB093940	Bahamas
1954	Duncan Town Airport	\\N	Duncan Town	0101000020E610000000000020B0EE52C0000000808A2E3640	Bahamas
1955	Rum Cay Airport	\\N	Port Nelson	0101000020E61000000000004084B552C0000000E034AF3740	Bahamas
1956	San Salvador Airport	ZSA	Cockburn Town	0101000020E61000000000004089A152C00000006034103840	Bahamas
1957	Philip S. W. Goldson International Airport	BZE	Belize City	0101000020E610000000000080B91356C000000080028A3140	Belize
1959	Rarotonga International Airport	RAR	Avarua	0101000020E6100000541300C0CAF963C09B310020E43335C0	Cook Islands
1960	Nadi International Airport	NAN	Nadi	0101000020E6100000000000002D2E6640000000E061C131C0	Fiji
1961	Nausori International Airport	SUV	Suva	0101000020E610000000000060E3516640000000C0150B32C0	Fiji
1963	Fua'amotu International Airport	TBU	Nuku‘alofa	0101000020E6100000000000C0CCE465C000000040BF3D35C0	Tonga
1964	Vava'u International Airport	VAV	Neiafu	0101000020E6100000000000C0C8BE65C000000040D69532C0	Tonga
1965	Bonriki International Airport	TRW	Tarawa	0101000020E610000000000040B4A4654000000080321BF63F	Kiribati
1968	Hihifo Airport	WLS	Mata-Utu	0101000020E6100000710600405E0666C0111E0080027A2AC0	Wallis and Futuna
1969	Faleolo International Airport	APW	Mulifanua	0101000020E610000000000080418065C0000000C0F5A82BC0	Samoa
1970	Pago Pago International Airport	PPG	Pago Pago	0101000020E610000041120060B85665C03E4F00E078A92CC0	American Samoa
1987	Nuku Hiva Airport	NHV	Taiohae	0101000020E610000000000000548761C0000000E0589721C0	French Polynesia
1989	Bora Bora Airport	BOB	Uturoa	0101000020E61000000000004008F862C000000040C47130C0	French Polynesia
1991	Huahine-Fare Airport	HUH	Uturoa	0101000020E610000000000040B4E062C000000060ECAF30C0	French Polynesia
1992	Moorea Airport	MOZ	Faaa	0101000020E61000000000004062B862C0000000A0707D31C0	French Polynesia
1995	Raiatea Airport	RFP	Uturoa	0101000020E6100000D09A1F7FE9EE62C0454772F90FB930C0	French Polynesia
1997	Bauerfield International Airport	VLI	Port-Vila	0101000020E61000002C0000803D0A6540C5FFFF5F05B331C0	Vanuatu
1998	Koné Airport	KNQ	Koné	0101000020E6100000000000C0C89A6440000000A0E60D35C0	New Caledonia
2000	Lifou Airport	LIF	Wé	0101000020E610000000000020AEE764400000004059C634C0	New Caledonia
2001	Nouméa Magenta Airport	GEA	Nouméa	0101000020E6100000000000E022CF644000000000204236C0	New Caledonia
2002	Maré Airport	MEE	Tadine	0101000020E61000000000004037016540000000C0507B35C0	New Caledonia
2005	La Tontouta International Airport	NOU	Nouméa	0101000020E6100000000000E0D0C66440000000E0BC0336C0	New Caledonia
2006	Auckland International Airport	AKL	Auckland	0101000020E610000046D8FF1F58D96540CA020060098142C0	New Zealand
2007	Taupo Airport	TUO	Taupo	0101000020E610000000000020B002664000000080AE5E43C0	New Zealand
2008	Ardmore Airport	AMZ	Papakura	0101000020E6100000000000E022DF654000000040CD8342C0	New Zealand
2009	Christchurch International Airport	CHC	Christchurch	0101000020E61000000000002006916540000000A0A4BE45C0	New Zealand
2010	Chatham Islands-Tuuta Airport	CHT	Waitangi	0101000020E6100000000000C09F0E66C000000020AEE745C0	New Zealand
2011	Dunedin Airport	DUD	Dunedin	0101000020E6100000000000005646654000000000CCF646C0	New Zealand
2012	Gisborne Airport	GIS	Gisborne	0101000020E6100000000000C04B3F664000000000E75443C0	New Zealand
2014	Hokitika Airfield	HKK	Greymouth	0101000020E610000000000020855F654000000040575B45C0	New Zealand
2015	Hamilton International Airport	HLZ	Hamilton	0101000020E610000005C6FFBF9FEA65407D1B0000F0EE42C0	New Zealand
2016	Hastings Aerodrome	\\N	Hastings	0101000020E61000001EC3633F8B186640FF209221C7D243C0	New Zealand
2017	Kerikeri Airport	KKE	Kerikeri	0101000020E6100000000000202FBD654000000060A3A141C0	New Zealand
2022	Hood Airport	MRO	Masterton	0101000020E6100000000000C049F4654000000020957C44C0	New Zealand
2023	New Plymouth Airport	NPL	New Plymouth	0101000020E610000000000060BAC56540000000C0198143C0	New Zealand
2024	Nelson Airport	NSN	Nelson	0101000020E61000000000006012A76540000000C02EA644C0	New Zealand
2025	Invercargill Airport	IVC	Invercargill	0101000020E610000000000020040A654000000080C93447C0	New Zealand
2026	RNZAF Base Ohakea	\\N	Palmerston North	0101000020E6100000000000806AEC6540000000405E1A44C0	New Zealand
2027	Oamaru Airport	OAM	Oamaru, Waitaki District	0101000020E6100000000000C09F62654000000000297C46C0	New Zealand
2028	Palmerston North Airport	PMR	Palmerston North	0101000020E610000000000080BEF3654000000060092944C0	New Zealand
2029	Paraparaumu Airport	PPQ	Paraparaumu	0101000020E6100000000000E0A5DF654000000040CD7344C0	New Zealand
2030	Queenstown International Airport	ZQN	Queenstown	0101000020E610000030F4FFDFA51765401A0D0060B38246C0	New Zealand
2031	Rotorua Regional Airport	ROT	Rotorua	0101000020E6100000000000E0240A664000000040FA0D43C0	New Zealand
2034	Tauranga Airport	TRG	Tauranga	0101000020E6100000000000A045066640000000E000D642C0	New Zealand
2035	Timaru Airport	TIU	Timaru	0101000020E6100000000000403367654000000020C22646C0	New Zealand
2037	Woodbourne Airport	BHE	Blenheim	0101000020E610000000000000D7BB6540000000A057C244C0	New Zealand
2040	Wigram Airport	\\N	Christchurch	0101000020E610000017C7FF1FB2916540521000808AC645C0	New Zealand
2041	Whakatane Airport	WHK	Whakatane	0101000020E6100000000000803F1D664000000040D6F542C0	New Zealand
2042	Wellington International Airport	WLG	Wellington	0101000020E6100000111E0080C2D965400C1500C0E1A944C0	New Zealand
2044	RNZAF Base Auckland-Whenuapai	\\N	Waitakere	0101000020E61000000000000029D46540000000A0D66442C0	New Zealand
2045	Whangarei Airport	WRE	Whangarei	0101000020E610000000000020AECB6540000000A057E241C0	New Zealand
2047	Wanganui Airport	WAG	Wanganui	0101000020E6100000000000C0CCE065400000006029FB43C0	New Zealand
2048	Herat Airport	HEA	Herāt	0101000020E6100000000000E0381D4F4000000040E11A4140	Afghanistan
2049	Jalalabad Airport	JAA	Jalālābād	0101000020E610000000000000E99F5140000000A02C334140	Afghanistan
2050	Kabul International Airport	KBL	Kabul	0101000020E610000000000060964D5140000000606F484140	Afghanistan
2051	Kandahar Airport	KDH	Kandahār	0101000020E61000000000006042765040000000207C813F40	Afghanistan
2052	Maimana Airport	MMZ	Maymana	0101000020E6100000000000A0B23050400000008024F74140	Afghanistan
2053	Mazar I Sharif Airport	MZR	Mazār-e Sharīf	0101000020E6100000000000C06BCD5040000000C07B5A4240	Afghanistan
2054	Shindand Airport	\\N	Shīnḏanḏ	0101000020E610000045F8FF7F68214F4032F7FF1F16B24040	Afghanistan
2055	Sheberghan Airport	\\N	Shibirghān	0101000020E6100000000000E0717A5040000000401A604240	Afghanistan
2056	Konduz Airport	UND	Kunduz	0101000020E6100000000000804A3A51400000000022554240	Afghanistan
2057	Bahrain International Airport	BAH	Al Muharraq	0101000020E6100000000000C0195149400000002053453A40	Bahrain
2058	Sheik Isa Air Base	\\N	Al Muharraq	0101000020E6100000000000C0984B4940000000401CEB3940	Bahrain
2059	Abha Regional Airport	AHB	Abha	0101000020E610000060E5FF7F0B544540DADDFFDF8A3D3240	Saudi Arabia
2060	Al Ahsa Airport	HOF	Al Hufūf	0101000020E6100000000000001BBE48400000006009493940	Saudi Arabia
2061	Al Baha Airport	ABT	Al Bahah	0101000020E610000088EDFFBF30D1444064310040CD4B3440	Saudi Arabia
2062	Bisha Airport	BHH	Qal‘at Bīshah	0101000020E6100000000000A0794F4540000000A001FC3340	Saudi Arabia
2063	Abqaiq Airport	\\N	Abqaiq	0101000020E610000000000080ACCB4840000000004BE93940	Saudi Arabia
2064	King Fahd International Airport	DMM	Dammam	0101000020E6100000000000A021E64840000000A0A0783A40	Saudi Arabia
2065	King Abdulaziz Air Base	DHA	Dhahran	0101000020E6100000A8E6FFBF74134940862A0040F1433A40	Saudi Arabia
2066	Jizan Regional Airport	GIZ	Jizan	0101000020E610000000000080FB4A454000000080AEE63040	Saudi Arabia
2067	Gassim Airport	ELQ	Buraydah	0101000020E6100000000000801FE3454000000040844D3A40	Saudi Arabia
2068	Gurayat Domestic Airport	URY	Qurayyat	0101000020E6100000BC75FEEDB2A34240FC71FBE593693F40	Saudi Arabia
2069	Ha'il Airport	HAS	Ha'il	0101000020E6100000B5A7E49CD8D74440BDE2A9471A703B40	Saudi Arabia
2070	Jubail Airport	\\N	Al Jubayl	0101000020E610000000000060DAB34840000000E0FB093B40	Saudi Arabia
2071	King Faisal Naval Base	\\N	Jeddah	0101000020E6100000000000E024964340000000201D593540	Saudi Arabia
2072	King Abdulaziz International Airport	JED	Jeddah	0101000020E61000001AE1ED4108944340925CFE43FAAD3540	Saudi Arabia
2074	Prince Mohammad Bin Abdulaziz Airport	MED	Medina	0101000020E6100000000000C040DA4340000000A0AB8D3840	Saudi Arabia
2075	Nejran Airport	EAM	Najrān	0101000020E610000000000060A8354640000000C0849C3140	Saudi Arabia
2076	Al Qaisumah/Hafr Al Batin Airport	AQI	Qaisumah	0101000020E610000093E1783E03104740E3A6069ACF553C40	Saudi Arabia
2080	Rabigh Airport	\\N	Rābigh	0101000020E610000000000040EF884340000000A0DDB33640	Saudi Arabia
2082	King Khaled International Airport	RUH	Riyadh	0101000020E610000000000040725947400000004025F53840	Saudi Arabia
2083	Ras Mishab Airport	\\N	As Saffānīyah	0101000020E610000000000040354E4840000000A060143C40	Saudi Arabia
2084	Arar Domestic Airport	RAE	Arar	0101000020E610000000000080B09144400000000017E83E40	Saudi Arabia
2085	Ras Tanura Airport	\\N	Raḩīmah	0101000020E610000000000040F1034940000000201DB93A40	Saudi Arabia
2088	Sulayel Airport	SLF	As Sulayyil	0101000020E6100000000000004FCF4640000000A0F6763440	Saudi Arabia
2089	Tabuk Airport	TUU	Tabuk	0101000020E610000048BF7D1D384F42405AF5B9DA8A5D3C40	Saudi Arabia
2090	Ta’if Regional Airport	TIF	Ta’if	0101000020E6100000ECA2E8818F45444070EF1AF4A57B3540	Saudi Arabia
2092	Ras Tanajib Airport	\\N	As Saffānīyah	0101000020E6100000000000E0716248400000002028DE3B40	Saudi Arabia
2093	Turaif Domestic Airport	TUI	Turaif	0101000020E6100000E2CAD93BA35D434004AF963B33B13F40	Saudi Arabia
2095	Al Wajh Domestic Airport	EJH	Al Wajh	0101000020E6100000000000A0FA3C424000000080D7323A40	Saudi Arabia
2096	Prince Abdulmohsin Bin Abdulaziz Airport	YNB	Yanbu	0101000020E61000008048BF7D1D084340AC1DC539EA243840	Saudi Arabia
2097	Abadan Airport	ABD	Abadan	0101000020E6100000441800E0381D484089CDFF5F005F3E40	Iran
2098	Dezful Airport	\\N	Shūsh	0101000020E61000003E7AC37DE43248402235ED629A374040	Iran
2099	Aghajari Airport	\\N	Aghajari	0101000020E6100000F46C567DAED64840742497FF90BE3E40	Iran
2100	Gachsaran Airport	\\N	Dogonbadan	0101000020E61000005E0500E0FB69494069F7FFFF6C563E40	Iran
2101	Shahid Asyaee Airport	QMJ	Masjed Soleymān	0101000020E6100000000000809CA24840000000A04E004040	Iran
2102	Omidiyeh Airport	\\N	Rāmshīr	0101000020E6100000000000A077C44840000000A0CFD53E40	Iran
2103	Mahshahr Airport	MRX	Rāmshīr	0101000020E6100000000000807193484000000020638E3E40	Iran
2104	Ahwaz Airport	AWZ	Ahvaz	0101000020E61000004A010040896148407EFEFFDF5F563F40	Iran
2106	Bushehr Airport	BUZ	Bandar-e Būshehr	0101000020E61000001E160020D46A494075ECFF5FDEF13C40	Iran
2108	Asaloyeh Airport	\\N	Mohr	0101000020E6100000E1D39CBCC84E4A405E4BC8073D7B3B40	Iran
2109	Kish International Airport	KIH	Kīsh	0101000020E6100000BA04004077FD4A40ABE9FFFFB4863A40	Iran
2110	Bandar Lengeh Airport	BDH	Bandar-e Lengeh	0101000020E61000009708000093694B400BF2FF1F31883A40	Iran
2111	Khark Island Airport	\\N	Khārk	0101000020E6100000000000807529494000000000A3423D40	Iran
2114	Shahid Ashrafi Esfahani Airport	KSH	Kermanshah	0101000020E6100000630E00A03C94474031170080462C4140	Iran
2117	Sanandaj Airport	SDG	Sanandaj	0101000020E6100000000000802D814740000000A0799F4140	Iran
2118	Hesa Airport	\\N	Dowlatābād	0101000020E610000000000020D2C7494000000040E6764040	Iran
2119	Shahid Vatan Pour Air Base	\\N	Isfahan	0101000020E61000000000006086D849400000008093484040	Iran
2121	Esfahan Shahid Beheshti International Airport	IFN	Isfahan	0101000020E6100000000000203FEE4940000000401A604040	Iran
2122	Badr Air Base	\\N	Isfahan	0101000020E61000000000004037D9494000000040804F4040	Iran
2123	Sardar-e-Jangal Airport	RAS	Rasht	0101000020E61000001A18795913CF4840D95BCAF962A94240	Iran
2125	Arak Airport	\\N	Arāk	0101000020E61000000000006074EC484000000040AD114140	Iran
2126	Ghazvin Azadi Airport	\\N	Naz̧arābād	0101000020E6100000000000E0B339494000000060DEF94140	Iran
2127	Kushke Nosrat Airport	\\N	Qom	0101000020E61000000000008031674940000000C0F37D4140	Iran
2128	Doshan Tappeh Air Base	\\N	Tehran	0101000020E610000000000020D0BC4940000000E0FBD94140	Iran
2130	Ghale Morghi Airport	\\N	Tehran	0101000020E6100000000000C0BAB04940000000C088D24140	Iran
2131	Mehrabad International Airport	THR	Tehran	0101000020E6100000000000801DA84940000000C037D84140	Iran
2132	Qazvin Airport	\\N	Qazvin	0101000020E610000020D26F5F07064940535E2BA1BB1E4240	Iran
2133	Naja Airport	\\N	Karaj	0101000020E6100000000000A0C4704940000000C05DE34140	Iran
2134	Bandar Abbas International Airport	BND	Bandar Abbas	0101000020E6100000000000C05B304C4000000080E2373B40	Iran
2136	Kerman Airport	KER	Kerman	0101000020E61000006A1A00A0BD794C40732C00203F463E40	Iran
2138	Havadarya Airport	\\N	Bandar Abbas	0101000020E61000000000008014164C400000006086283B40	Iran
2139	Dayrestan Airport	\\N	Qeshm	0101000020E6100000000000E081F34B40000000802DC13A40	Iran
2141	Sirjan Airport	\\N	Sirjan	0101000020E6100000000000001BD64B40000000C0078D3D40	Iran
2142	Birjand Airport	XBJ	Bīrjand	0101000020E6100000000000A00FA24D4000000000F5724040	Iran
2143	Sarakhs Airport	\\N	Sarakhs	0101000020E6100000000000A04E884E400000006027404240	Iran
2144	Shahroud Airport	\\N	Shahrud	0101000020E610000033FAFF5F568D4B4085E7FF3F70364240	Iran
2147	Tabas Airport	\\N	Tabas	0101000020E610000021F9FFFF43724C40D5F4FF7F7AD54040	Iran
2148	Kalaleh Airport	\\N	Kalāleh	0101000020E610000059FCFF1FDBB94B4083E4FFFF0FB14240	Iran
2151	Ramsar Airport	RZR	Tonekābon	0101000020E610000000000020FD564940000000A077744240	Iran
2153	Fasa Airport	\\N	Fasā	0101000020E61000000000002095DC4A40000000004DE43C40	Iran
2154	Jahrom Airport	\\N	Fasā	0101000020E61000000000000020CA4A408933000032963C40	Iran
2156	Lamerd Airport	\\N	Mohr	0101000020E6100000D21100A02A984A4050CAFF3F695F3B40	Iran
2157	Shiraz Shahid Dastghaib International Airport	SYZ	Shiraz	0101000020E6100000000000A07E4B4A4000000000098A3D40	Iran
2158	Khoy Airport	\\N	Khvoy	0101000020E6100000000000E09E7C464000000060B8364340	Iran
2162	Tabriz International Airport	TBZ	Tabriz	0101000020E610000000000080141E4740000000A023114340	Iran
2163	Zanjan Airport	\\N	Zanjān	0101000020E6100000860A00E0002E4840C6F9FF9F08634240	Iran
2164	Shahid Sadooghi Airport	AZD	Yazd	0101000020E6100000A3FDFF5F64234B4038230080A7E73F40	Iran
2165	Zabol Airport	ACZ	Zābol	0101000020E6100000000000809EC54E40000000402A193F40	Iran
2166	Konarak Airport	ZBR	Chabahar	0101000020E6100000C6F9FF9FE8304E405F0800207C713940	Iran
2167	Zahedan International Airport	ZAH	Zahedan	0101000020E610000000000060FE734E4000000080C7793D40	Iran
2168	Iran Shahr Airport	\\N	Iranshahr	0101000020E610000048FEFFFF285C4E4084270000713C3B40	Iran
2170	Queen Alia International Airport	AMM	Amman	0101000020E6100000870D002021FF4140620B0060FCB83F40	Jordan
2171	Amman-Marka International Airport	ADJ	Amman	0101000020E6100000000000C0ECFE4140000000E002F93F40	Jordan
2172	Aqaba King Hussein International Airport	AQJ	Aqaba	0101000020E61000000000002051824140000000E0919C3D40	Jordan
2173	Prince Hassan Air Base	\\N	Al Azraq ash Shamālī	0101000020E61000000E87A5811F9342406E3315E291144040	Jordan
2174	Jerusalem Airport	\\N	Jerusalem	0101000020E6100000D0FFFFBF0E9C4140350000005DDD3F40	Israel
2175	King Hussein Air College	OMF	Mafraq	0101000020E6100000950B957F2D214240AF25E4839E2D4040	Jordan
2176	Kuwait International Airport	KWI	Kuwait City	0101000020E6100000000000E004FC474000000080023A3D40	Kuwait
2177	Beirut Rafic Hariri International Airport	BEY	Beirut	0101000020E6100000000000E083BE41400000004013E94040	Lebanon
2178	Rene Mouawad Air Base	\\N	Halba	0101000020E61000000000004072014240000000206E4B4140	Lebanon
2179	Abu Dhabi International Airport	AUH	Abu Dhabi	0101000020E61000000000004057534B4000000020D96E3840	United Arab Emirates
2180	Bateen Airport	AZI	Abu Dhabi	0101000020E610000000000000A33A4B4000000020A56D3840	United Arab Emirates
2181	Al Hamra Aux Airport	\\N	Ar Ruways	0101000020E610000000000040573B4A40000000A0F1123840	United Arab Emirates
2182	Jebel Dhana Airport	\\N	Ar Ruways	0101000020E610000000000080974E4A4000000080F92F3840	United Arab Emirates
2184	Al Dhafra Air Base	\\N	Abu Dhabi	0101000020E6100000D8FAFFFF1A464B40500A00008A3F3840	United Arab Emirates
2188	Dubai International Airport	DXB	Dubai	0101000020E6100000A50000A0A4AE4B40BB070080B7403940	United Arab Emirates
2189	Fujairah International Airport	FJR	Al Fujayrah	0101000020E6100000000000E078294C4000000020B91C3940	United Arab Emirates
2190	Ras Al Khaimah International Airport	RKT	Ras al-Khaimah	0101000020E6100000000000A02AF84B40000000600E9D3940	United Arab Emirates
2191	Sharjah International Airport	SHJ	Sharjah	0101000020E6100000000000A033C24B40000000201F543940	United Arab Emirates
2192	Khasab Air Base	KHS	Khasab	0101000020E610000000000000CC1E4C40000000A0C62B3A40	Oman
2194	Muscat International Airport	MCT	Muscat	0101000020E61000000000004067244D4000000080E2973740	Oman
2195	Salalah Airport	SLL	Şalālah	0101000020E6100000000000C0AF0B4B4000000040E8093140	Oman
2197	Bhagatanwala Airport	\\N	Kot Mūmin	0101000020E6100000140400A0B23C5240710600402E074040	Pakistan
2202	Faisalabad International Airport	LYP	Faisalābād	0101000020E6100000000000C0AA3F5240000000A0705D3F40	Pakistan
2203	Gwadar International Airport	GWD	Gwadar	0101000020E6100000000000002D2A4F4000000080B93B3940	Pakistan
2204	Gilgit Airport	GIL	Gilgit	0101000020E6100000000000C059955240000000409BF54140	Pakistan
2205	Shahbaz Air Base	\\N	Jacobābād	0101000020E6100000000000E0C71C514000000060C1483C40	Pakistan
2206	Jinnah International Airport	KHI	Karachi	0101000020E6100000E012807F4ACA5040F2D24D6210E83840	Pakistan
2207	Alama Iqbal International Airport	LHE	Lahore	0101000020E6100000000000A0D4995240000000A087853F40	Pakistan
2208	Walton Airport	\\N	Lahore	0101000020E6100000000000202896524000000040AB7E3F40	Pakistan
2209	Mangla Airport	\\N	Mangla	0101000020E610000000000080DB685240000000A069864040	Pakistan
2210	Muzaffarabad Airport	MFG	Muzaffarābād	0101000020E6100000000000E08C60524000000060642B4140	Pakistan
2211	Mianwali Air Base	\\N	Miānwāli	0101000020E61000000000006086E45140000000A013484040	Pakistan
2212	Moenjodaro Airport	MJD	Dokri	0101000020E61000000000008028095140000000A0CF553B40	Pakistan
2213	Masroor Air Base	\\N	Karachi	0101000020E61000000000004015BC504000000000C3E43840	Pakistan
2214	Multan International Airport	MUX	Multān	0101000020E610000000000080D2DA5140000000E004343E40	Pakistan
2215	Shaheed Benazirabad Airport	WNS	Nawābshāh	0101000020E6100000F3CCCB61F71851400EBE30992A383A40	Pakistan
2216	Okara Cantonment Airstrip	\\N	Okāra	0101000020E610000024FFFF7FE456524012FEFF1FB2BD3E40	Pakistan
2218	Pasni Airport	PSI	Pasni	0101000020E6100000000000402CAC4F40000000405E4A3940	Pakistan
2219	Peshawar International Airport	PEW	Peshawar	0101000020E610000000000040EFE051400000002038FF4040	Pakistan
2220	Qasim Airport	\\N	Rawalpindi	0101000020E61000000000000020425240000000A0B4C74040	Pakistan
2221	Quetta International Airport	UET	Quetta	0101000020E6100000000000E004BC5040000000C05B403E40	Pakistan
2222	Shaikh Zaid Airport	RYK	Sādiqābād	0101000020E610000000000000E59151400000004047623C40	Pakistan
2223	Benazir Bhutto International Airport	ISB	Islamabad	0101000020E6100000000000405946524000000000F0CE4040	Pakistan
2224	Risalpur Air Base	\\N	Risalpur Cantonment	0101000020E6100000000000203FFE514000000080610A4140	Pakistan
2225	Rawalakot Airport	RAZ	Rāwala Kot	0101000020E6100000000000201473524000000000C3EC4040	Pakistan
2227	Sukkur Airport	SKZ	Sukkur	0101000020E610000000000040AB32514000000000D5B83B40	Pakistan
2228	Saidu Sharif Airport	SDT	Mingora	0101000020E610000000000040941652400000000024684140	Pakistan
2229	Sui Airport	SUL	Dera Bugti	0101000020E610000000000060524B51400000004025A53C40	Pakistan
2230	Talhar Airport	BDN	Talhār	0101000020E610000000000060A8355140000000806CD73840	Pakistan
2233	Zhob Airport	PZH	Zhob	0101000020E6100000000000A0AB5D514000000020C05B3F40	Pakistan
2234	Basrah International Airport	BSR	Basrah	0101000020E6100000000000C0BFD44740000000E0918C3E40	Iraq
2235	Aleppo International Airport	ALP	Aleppo	0101000020E610000000000020B99C42400000002021174240	Syria
2236	Damascus International Airport	DAM	Damascus	0101000020E610000000000020FF41424000000000ACB44040	Syria
2237	Deir ez-Zor Airport	DEZ	Deir ez-Zor	0101000020E610000000000020871644400000000088A44140	Syria
2239	Bassel Al-Assad International Airport	LTK	Latakia	0101000020E6100000000000006FF941400000004057B34140	Syria
2240	Palmyra Airport	PMS	Tadmur	0101000020E61000007B15191D902843402C6519E258474140	Syria
2241	Doha International Airport	\\N	Doha	0101000020E6100000ACECFF3F55C84940C1D0FF7FD7423940	Qatar
2244	Saipan International Airport	SPN	Saipan	0101000020E6100000A4DDFFFF53376240E63500A0ED3C2E40	Northern Mariana Islands
2245	Andersen Air Force Base	UAM	Yigo Village	0101000020E61000004910AE80C21D62405EBA490C022B2B40	Guam
2246	Antonio B. Won Pat International Airport	GUM	Barrigada Village	0101000020E6100000C7FCFFDF781962400E95FF3F80F72A40	Guam
2247	Tinian International Airport	TIQ	San Jose Village	0101000020E6100000000000E0CE3362400000002097FF2D40	Northern Mariana Islands
2249	Marshall Islands International Airport	MAJ	Majuro	0101000020E610000000000040B46865400000008050421C40	Marshall Islands
2254	Chuuk International Airport	TKK	Weno	0101000020E6100000000000E0F9FA624000000080F4D81D40	Micronesia
2255	Pohnpei International Airport	PNI	Kolonia	0101000020E610000000000020B0C6634000000000BEF01B40	Micronesia
2256	Babelthuap Airport	ROR	Ngetkib	0101000020E61000000000008068D160400000004079781D40	Palau
2257	Kosrae International Airport	KSA	Tofol	0101000020E61000008099EFE0A75E6440E84D452A8C6D1540	Micronesia
2258	Yap International Airport	YAP	Colonia	0101000020E61000008099EFE0A7426140734BAB2171FF2240	Micronesia
2259	Kinmen Airport	KNH	Jincheng	0101000020E6100000000000E0F9965D40000000E08A6D3840	Taiwan
2260	Pingtung South Airport	\\N	Kaohsiung	0101000020E610000000000060911D5E400000006022AC3640	Taiwan
2261	Longtan Air Base	\\N	Daxi	0101000020E6100000000000603B4F5E40000000E0E7DA3840	Taiwan
2262	Taitung Airport	TTT	Taitung City	0101000020E61000000000002087465E40000000A047C13640	Taiwan
2263	Lyudao Airport	GNI	Taitung City	0101000020E610000000000000D35D5E40000000C084AC3640	Taiwan
2264	Kaohsiung International Airport	KHH	Kaohsiung	0101000020E61000000000006066165E40000000E0BC933640	Taiwan
2265	Chiayi Airport	CYI	Douliu	0101000020E6100000000000E026195E400000008038763740	Taiwan
2268	Taichung Ching Chuang Kang Airport	RMQ	Taichung	0101000020E610000000000080BE275E4000000060C3433840	Taiwan
2270	Tainan Airport	TNN	Tainan	0101000020E6100000000000202F0D5E40000000604DF33640	Taiwan
2272	Makung Airport	MZG	Magong	0101000020E61000000000002031E85D400000006096913740	Taiwan
2273	Chihhang Air Base	\\N	Taitung City	0101000020E6100000000000E0A54B5E40000000A008CB3640	Taiwan
2274	Pingtung North Airport	PIF	Kaohsiung	0101000020E610000000000020D91E5E400000004040B33640	Taiwan
2275	Taipei Songshan Airport	TSA	Taipei	0101000020E61000000000000054635E4000000040C4113940	Taiwan
2276	Taiwan Taoyuan International Airport	TPE	Taipei	0101000020E6100000C4793881E94E5E4032E6AE25E4133940	Taiwan
2277	Wang-an Airport	WOT	Magong	0101000020E6100000000000802DE05D40000000200C5E3740	Taiwan
2278	Hualien Airport	HUN	Hualien City	0101000020E6100000000000408D675E40000000E0E9053840	Taiwan
2279	Narita International Airport	NRT	Tokyo	0101000020E6100000D00B00205A8C61400C1500C0E1E14140	Japan
2280	Matsumoto Airport	MMJ	Matsumoto	0101000020E610000000000040893D6140000000C059154240	Japan
2281	Hyakuri Airport	IBR	Ibaraki	0101000020E6100000BFEDFF9F478D6140710600402E174240	Japan
2284	Nanki Shirahama Airport	SHM	Tanabe	0101000020E610000030F4FFDFA5EB60401AEDFFFFC2D44040	Japan
2285	Kohnan Airport	\\N	Okayama	0101000020E610000000000020DBBD6040000000609F4B4140	Japan
2286	Tokachi-Obihiro Airport	OBO	Obihiro	0101000020E610000091DCFF9FF1E66140E40F00C0DC5D4540	Japan
2287	New Chitose Airport	CTS	Sapporo	0101000020E6100000000000E024B66140000000C039634540	Japan
2288	Hakodate Airport	HKD	Hakodate	0101000020E6100000E93800E04D9A6140F91300608FE24440	Japan
2289	Chitose Air Base	SPK	Chitose	0101000020E610000002E3FFDF4FB5614010FEFF1FB2654540	Japan
2290	Memanbetsu Airport	MMB	Bihoro	0101000020E61000007A1500803F056240BB070080B7F04540	Japan
2291	Nakashibetsu Airport	SHB	Shibetsu	0101000020E610000041120060B81E62405FE5FF7FEBC94540	Japan
2293	Tokachi Airport	\\N	Obihiro	0101000020E6100000000000600EE56140000000E0FB714540	Japan
2294	Wakkanai Airport	WKJ	Wakkanai	0101000020E61000008FF9FFBFA1B96140651100E0BCB34640	Japan
2295	Iki Airport	IKI	Karatsu	0101000020E6100000F8F0FFBF1E396040FBF6FF3FDFDF4040	Japan
2296	Yamaguchi Ube Airport	UBJ	Yamaguchi	0101000020E6100000EDFEFF9FED686040510D00400AF74040	Japan
2297	Tsushima Airport	TSJ	Tsushima	0101000020E6100000C1D0FF7F972A60403C0900A077244140	Japan
2298	Monbetsu Airport	MBE	Mombetsu	0101000020E6100000EDFEFF9FEDEC61402F140040E6264640	Japan
2299	Asahikawa Airport	AKJ	Asahikawa	0101000020E6100000000000E04DCE6140000000C0DCD54540	Japan
2301	Rishiri Airport	RIS	Wakkanai	0101000020E6100000192D00C0F3A5614051EDFFDFF99E4640	Japan
2302	Ashiya Airport	\\N	Ashiya	0101000020E610000000000060E55460400000006009F14040	Japan
2303	Yakushima Airport	KUM	Miyanoura	0101000020E6100000B4FBFF7F165560402F3400A0B6623E40	Japan
2304	Fukue Airport	FUJ	Fukuechō	0101000020E6100000000000E0A71A60400000006049554040	Japan
2305	Fukuoka Airport	FUK	Fukuoka	0101000020E6100000000000A06E4E6040000000C0FECA4040	Japan
2306	New Tanegashima Airport	TNE	Nishinoomote	0101000020E6100000B9C1FF3FB65F6040C0F0FFDFE79A3E40	Japan
2307	Kagoshima Airport	KOJ	Kagoshima	0101000020E61000000000000002576040000000A0ABCD3F40	Japan
2308	Miyazaki Airport	KMI	Miyazaki	0101000020E6100000710600405E6E6040FE1C002090E03F40	Japan
2309	Nyutabaru Airport	\\N	Tsuma	0101000020E6100000000000A06E6E604000000060B30A4040	Japan
2310	Oita Airport	OIT	Ōita	0101000020E6100000A826008095776040E51200005DBD4040	Japan
2311	Kitakyūshū Airport	KKJ	Kitakyushu	0101000020E6100000F8F0FFBF1E6160403117008046EC4040	Japan
2312	Kumamoto Airport	KMJ	Kumamoto	0101000020E6100000000000205C5B6040000000A02C6B4040	Japan
2313	Nagasaki Airport	NGS	Nagasaki	0101000020E61000007A1500803F3D6040E51200005D754040	Japan
2314	Kanoya Airport	\\N	Kanoya	0101000020E6100000000000400A5B6040000000001B5E3F40	Japan
2315	Tsuiki Air Field	\\N	Tsuiki	0101000020E6100000BFEDFF9F47616040F0040020AED74040	Japan
2316	Amami Airport	ASJ	Naze	0101000020E6100000000000E0D0366040000000C03B6E3C40	Japan
2319	Fukui Airport	\\N	Maruoka	0101000020E6100000DFC3FFFF2A0761403DE9FF3F47124240	Japan
2320	Gifu Airport	\\N	Kakamigahara	0101000020E610000000000000D71B6140000000E071B24140	Japan
2321	Hamamatsu Airport	\\N	Hamamatsu	0101000020E6100000000000007F3661400000008006604140	Japan
2322	Komatsu Airport	KMQ	Kanazawa	0101000020E610000000000020060D61400000004082324240	Japan
2324	Toyama Airport	TOY	Toyama	0101000020E6100000000000200426614000000080FB524240	Japan
2325	Shizuhama Airport	\\N	Yaizu	0101000020E61000000000004089496140000000E009684140	Japan
2326	Hiroshima Airport	HIJ	Hiroshima	0101000020E61000003F2F0080689D604011FEFF1FD2374140	Japan
2327	Okayama Airport	OKJ	Okayama	0101000020E61000005A3F00205CBB60408E190020E2604140	Japan
2328	Izumo Airport	IZO	Izumo	0101000020E6100000523000E07A9C604009EFFFDFF0B44140	Japan
2329	Hofu Airport	\\N	Hōfu	0101000020E610000000000060917160400000000071044140	Japan
2330	Miho Yonago Airport	YGJ	Sakaiminato	0101000020E6100000000000408DA760400000006000BF4140	Japan
2332	Kōchi Ryōma Airport	KCZ	Kochi	0101000020E61000003F2F008068B56040B21800A0E6C54040	Japan
2333	Matsuyama Airport	MYJ	Matsuyama	0101000020E61000000000006066966040000000C0E1E94040	Japan
2334	Osaka International Airport	ITM	Osaka	0101000020E61000000000002004EE6040000000408B644140	Japan
2335	Tottori Airport	TTJ	Tottori	0101000020E610000046D8FF1F58C5604054F3FF5FDAC34140	Japan
2336	Tokushima Airport	TKS	Tokushima	0101000020E6100000E30C00806CD360407EFBFF9FFF104140	Japan
2337	Takamatsu Airport	TAK	Takamatsu	0101000020E61000009525002083C06040D41400E06A1B4140	Japan
2338	Yao Airport	\\N	Osaka	0101000020E6100000000000C04BF3604000000080534C4140	Japan
2339	Ozuki Airport	\\N	Onoda	0101000020E610000000000000AA61604000000060CC054140	Japan
2340	Aomori Airport	AOJ	Namioka	0101000020E6100000000000A01C966140000000A00A5E4440	Japan
2341	Yamagata Airport	GAJ	Yamagata	0101000020E61000007EDBFF3FDF8B6140451B0020B9344340	Japan
2342	Sado Airport	SDS	Ryōtsu-minato	0101000020E61000007A1500803F4D614028E5FF9FB4074340	Japan
2343	Hachinohe Airport	\\N	Hachinohe	0101000020E610000000000080E9AE61400000002038474440	Japan
2344	Hanamaki Airport	HNA	Hanamaki	0101000020E6100000000000E051A4614000000060DCB64340	Japan
2345	Akita Airport	AXT	Akita	0101000020E6100000000000000287614000000000CCCE4340	Japan
2346	Misawa Air Base	MSJ	Misawa	0101000020E6100000B21800A0C6AB614016E7FF7F025A4440	Japan
2347	Sendai Airport	SDJ	Sendai	0101000020E610000046D8FF1F589D61400C1500C0E1114340	Japan
2348	Matsushima Air Base	\\N	Matsushima	0101000020E6100000CD2800400AA761409C1100C0D3334340	Japan
2350	Atsugi Naval Air Facility	\\N	Atsugi	0101000020E610000000000060666E61400000006030BA4140	Japan
2351	Tateyama Airport	\\N	Tateyama	0101000020E610000085B18520877A614008759142597E4140	Japan
2353	Iruma Air Base	\\N	Sayama	0101000020E6100000000000E0266D614000000060C3EB4140	Japan
2354	Kisarazu Airport	\\N	Kisarazu	0101000020E6100000000000C01E7D614000000080FBB24140	Japan
2355	Shimofusa Airport	\\N	Shiroi	0101000020E6100000000000205A8061400000006042E64140	Japan
2356	Oshima Airport	OIM	Itō	0101000020E6100000AECFFF1F856B6140421500A018644140	Japan
2358	Kastner Army Heliport	\\N	Zama	0101000020E610000063CBFF9F9B6C614022FCFF3FC4C14140	Japan
2359	Tokyo Haneda International Airport	HND	Tokyo	0101000020E6100000357D76C0F5786140874ECFBBB1C64140	Japan
2360	Yokota Air Base	OKO	Fussa	0101000020E6100000000000E0226B6140000000E0CEDF4140	Japan
2361	Gwangju Airport	KWJ	Masan	0101000020E6100000B21800A0C6B35F40EF0100E02D904140	South Korea
2364	Jeon Ju Airport	CHN	Wanju	0101000020E610000000000020AEC75F40000000606FF04140	South Korea
2365	Yeosu Airport	RSU	Yeosu	0101000020E6100000000000E07CE75F4000000080D06B4140	South Korea
2366	Sokcho Airport	SHO	Sokcho	0101000020E6100000000000002B136040000000C040124340	South Korea
2367	Gangneung Airport	KAG	Kang-neung	0101000020E6100000ACECFF3F351E6040B2F5FFFF75E04240	South Korea
2370	Jeju International Airport	CJU	Jeju City	0101000020E6100000000000408D9F5F400000004072C14040	South Korea
2371	Jinhae Airport	\\N	Changwon	0101000020E6100000000000A045166040000000E012924140	South Korea
2372	Gimhae International Airport	PUS	Busan	0101000020E6100000A2FAFF1F041E604051EDFFDFF9964140	South Korea
2374	Ulsan Airport	USN	Ulsan	0101000020E61000001B1000A0432B6040BD0A00C0F7CB4140	South Korea
2375	A 511 Airport	\\N	Seonghwan	0101000020E6100000000000E0FBC15F4000000060297B4240	South Korea
2376	Seoul Air Base	SSN	Seongnam-si	0101000020E6100000000000C04BC75F400000000010B94240	South Korea
2377	Osan Air Base	OSN	Osan	0101000020E61000006AFAEC80EBC15F4070067FBF988B4240	South Korea
2378	Gimpo International Airport	GMP	Seoul	0101000020E610000005C6FFBF9FB25F4034FAFF5F76C74240	South Korea
2379	Suwon Airport	SWU	Suwon	0101000020E6100000000000C072C05F40000000A0A49E4240	South Korea
2380	Pohang Airport	KPO	Pohang	0101000020E6100000840700A0702D60409A0E008073FE4140	South Korea
2381	Daegu Airport	TAE	Daegu	0101000020E6100000B4FBFF7F161560400FFBFFDF71F24140	South Korea
2383	Yecheon Airport	YEC	Mungyeong	0101000020E6100000210000205C0B604044000020E2504240	South Korea
2384	Naha Airport	OKA	Okinawa	0101000020E610000046D8FF1F58E95F4006C9FFFF1F323A40	Japan
2385	Ie Shima Auxiliary Air Base	\\N	Nago	0101000020E610000000000020F4F05F4000000040CBB93A40	Japan
2386	Kadena Air Base	DNA	Okinawa	0101000020E61000002E5915E126F15F402575029A085B3A40	Japan
2387	Ishigaki Airport	ISG	Ishigaki	0101000020E6100000BD0A00C0F70B5F400BF2FF1F31583840	Japan
2390	Miyako Airport	MMY	Miyako	0101000020E6100000080F0040E1525F40B1D5FF9F65C83840	Japan
2392	Shimojishima Airport	SHI	Hirara	0101000020E6100000BFEDFF9F47495F40911F00A0A2D33840	Japan
2397	Ninoy Aquino International Airport	MNL	Manila	0101000020E610000029417FA147415E40BF7D1D3867042D40	Philippines
2399	Awang Airport	CBO	Cotabato	0101000020E6100000000000A0700D5F40000000A034A91C40	Philippines
2400	Cagayan De Oro Airport	CGY	Lumbia	0101000020E6100000C976BE9F1A275F4086200725CCD42040	Philippines
2401	Pagadian Airport	PAG	Pagadian	0101000020E610000008B4FFF783DD5E400771C143AB521F40	Philippines
2402	General Santos International Airport	GES	Romblon	0101000020E6100000B395FFDF24465F40A2080060643B1840	Philippines
2404	Zamboanga International Airport	ZAM	Zamboanga	0101000020E610000000000000D7835E40000000E08EB01B40	Philippines
2405	Loakan Airport	BAG	Baguio	0101000020E610000000000020AE275E400000008006603040	Philippines
2406	Daet Airport	\\N	Daet	0101000020E610000000000060B8BE5E400000008026422C40	Philippines
2407	Basa Air Base	\\N	Pulungmasle	0101000020E6100000000000408D1F5E400000008016F92D40	Philippines
2408	Lingayen Airport	\\N	Lingayen	0101000020E6100000000000806C0F5E40000000A0E8083040	Philippines
2409	San Jose Airport	SJI	Bagong Sikat	0101000020E61000001AAAFFFF01435E40AD32008016B92840	Philippines
2410	Fernando Air Base	\\N	Banaybanay	0101000020E61000000000000000485E40000000C0F5E82B40	Philippines
2411	Mamburao Airport	\\N	Mamburao	0101000020E610000000000060B8265E40000000208C6A2A40	Philippines
2414	Vigan Airport	\\N	Vigan	0101000020E6100000000000C0C8165E4000000020288E3140	Philippines
2415	Dr.Juan C. Angara Airport	\\N	Suklayin	0101000020E61000000000000000605E40C4F6FF5FA8752F40	Philippines
2421	Bagabag Airport	\\N	Quezon	0101000020E6100000000000C020505E40000000E0839E3040	Philippines
2422	Daniel Z. Romualdez Airport	TAC	Tacloban	0101000020E6100000541300C0CA415F403560000088742640	Philippines
2423	Bacolod-Silay City International Airport	BCD	Bacolod	0101000020E6100000419E5DBEF5C05E40933A014D848D2540	Philippines
2425	Sibulan Airport	DGT	Dumaguete	0101000020E61000009242004033D35E40DF060000DCAA2240	Philippines
2426	Godofredo P. Ramos Airport	MPH	Manoc-Manoc	0101000020E61000006494675E0E7D5E40D34D621058D92740	Philippines
2428	Guiuan Airport	\\N	Guiuan	0101000020E61000006BDAFFDF7C6F5F405C6500002D122640	Philippines
2429	Iloilo International Airport	ILO	Iloilo	0101000020E610000014CE6E2D939F5E402906483481AA2540	Philippines
2430	Kalibo International Airport	KLO	Kalibo (poblacion)	0101000020E6100000F956006010985E405BBCFF5FDA5B2740	Philippines
2433	Puerto Princesa Airport	PPS	Puerto Princesa	0101000020E61000000000008093B05D4000000020F77B2340	Philippines
2435	Evelio Javier Airport	\\N	Bagong Sikat	0101000020E6100000B9C1FF3FB67B5E400BF2FF1F31882540	Philippines
2436	Comodoro Pierrestegui Airport	COC	Concordia	0101000020E6100000C898BB9690FF4CC0B22E6EA3014C3FC0	Argentina
2437	Gualeguaychu Airport	GHU	Gualeguaychú	0101000020E6100000BC96900F7A4E4DC00C93A982518140C0	Argentina
2438	Junin Airport	\\N	Junín	0101000020E61000002CD49AE61D774EC076711B0DE04541C0	Argentina
2439	General Urquiza Airport	PRA	Paraná	0101000020E6100000CC7F48BF7D3D4EC05DDC460378CB3FC0	Argentina
2440	Islas Malvinas Airport	ROS	Rosario	0101000020E610000014AE47E17A644EC03255302AA97340C0	Argentina
2441	Sauce Viejo Airport	SFN	Santa Fe de la Vera Cruz	0101000020E6100000E4141DC9E5674EC02E90A0F831B63FC0	Argentina
2442	Jorge Newbery Airpark	AEP	Buenos Aires	0101000020E6100000DA1B7C6132354DC02BF697DD934741C0	Argentina
2443	Ingeniero Ambrosio Taravella Airport	COR	Córdoba	0101000020E61000007FFEFFDF4F0D50C0C1D0FF7FD7523FC0	Argentina
2444	Chamical Airport	\\N	Chamical	0101000020E61000000489F55FCA9250C0D8EFEC9F65583EC0	Argentina
2445	San Fernando Airport	\\N	Tigre	0101000020E61000005DDC4603784B4DC00B462575023A41C0	Argentina
2446	Mariano Moreno Airport	\\N	Morón	0101000020E6100000F775E09C11654DC09D11A5BDC14741C0	Argentina
2447	La Plata Airport	LPG	La Plata	0101000020E610000098DD938785F24CC0EA95B20C717C41C0	Argentina
2448	Moron Airport	\\N	Morón	0101000020E610000035EF384547524DC0742497FF905641C0	Argentina
2449	El Palomar Airport	\\N	Morón	0101000020E6100000CAC342AD694E4DC04BEA0434114E41C0	Argentina
2450	Chos Malal Airport	\\N	Chos Malal	0101000020E61000006CFDFF7F3D8E51C0E1E9FFDFEBB842C0	Argentina
2451	Dr. Arturo H. Illia Airport	\\N	General Roca	0101000020E6100000B3F8FF3FB6E750C0B8010000178043C0	Argentina
2452	El Plumerillo Airport	MDZ	Mendoza	0101000020E610000079F2FFDFBE3251C02BEBFF1F756A40C0	Argentina
2454	Suboficial Ay Santiago Germano Airport	AFA	San Rafael	0101000020E6100000AEB6627FD91951C07FA2B2614D4B41C0	Argentina
2455	Catamarca Airport	CTC	San Fernando del Valle de Catamarca	0101000020E61000005E0500E01B7050C0C71C004079983CC0	Argentina
2456	Vicecomodoro Angel D. La Paz Aragonés Airport	SDE	Santiago del Estero	0101000020E6100000B8010000D71350C0E1C9FF7FFBC33BC0	Argentina
2457	Tinogasta Airport	\\N	Tinogasta	0101000020E61000009EF4FF9F23E550C06BFAFF3FAD093CC0	Argentina
2458	Capitan V A Almonacid Airport	IRJ	La Rioja	0101000020E6100000F2070060EEB250C080210080B0613DC0	Argentina
2459	Chilecito Airport	\\N	Chilecito	0101000020E6100000B801000017DC50C08DF6FF7F51393DC0	Argentina
2460	Teniente Benjamin Matienzo Airport	TUC	Alderetes	0101000020E6100000B41CE8A1B64650C0D734EF3845D73AC0	Argentina
2461	Domingo Faustino Sarmiento Airport	UAQ	San Julián	0101000020E61000002B508BC1C31A51C09DA1B8E34D923FC0	Argentina
2462	Area De Material Airport	RCU	Río Cuarto	0101000020E6100000C9FFFF1FB91050C024FFFF7FE48A40C0	Argentina
2463	Villa Dolores Airport	VDR	Villa Dolores	0101000020E610000069F7FFFF5C4950C049DEFF9FF8F13FC0	Argentina
2464	La Quiaca Airport	\\N	Laboulaye	0101000020E6100000AFF2FFBFF56450C074C9FFBF8D2636C0	Argentina
2465	Marcos Juarez Airport	\\N	Marcos Juárez	0101000020E610000087A757CA32144FC0D6C56D34805740C0	Argentina
2466	Villa Reynolds Airport	\\N	Villa Mercedes	0101000020E610000059FCFF1FCB5850C0EBFBFF5F6DDD40C0	Argentina
2467	Brigadier Mayor D Cesar Raul Ojeda Airport	LUQ	San Luis	0101000020E6100000FBF6FF3FCF9650C0C0100040F8A240C0	Argentina
2468	Corrientes Airport	CNQ	Corrientes	0101000020E610000044696FF085614DC0355EBA490C723BC0	Argentina
2469	Resistencia International Airport	RES	Resistencia	0101000020E61000001EA7E8482E874DC03333333333733BC0	Argentina
2470	Formosa Airport	FMA	Formosa	0101000020E6100000DA1B7C61321D4DC0F5DBD78173363AC0	Argentina
2471	Cataratas Del Iguazú International Airport	IGR	Puerto Iguazú	0101000020E610000041120060983C4BC0FFFCFFBFBFBC39C0	Argentina
2472	Paso De Los Libres Airport	AOL	Paso de los Libres	0101000020E61000005DDC460378934CC0C6DCB5847CB03DC0	Argentina
2473	Monte Caseros Airport	\\N	Monte Caseros	0101000020E61000001973D712F2D14CC04BC8073D9B453EC0	Argentina
2474	Libertador Gral D Jose De San Martin Airport	PSS	Posadas	0101000020E6100000151DC9E53FFC4BC0FBCBEEC9C3623BC0	Argentina
2476	Martin Miguel De Guemes International Airport	SLA	Salta	0101000020E6100000EF0100E01D5F50C0922200E022DB38C0	Argentina
2477	Gobernador Horacio Guzman International Airport	JUJ	San Salvador de Jujuy	0101000020E610000013010060424650C079D2FF7F8E6438C0	Argentina
2478	Orán Airport	ORA	San Ramón de la Nueva Orán	0101000020E61000000EF8FF9F111550C072E6FFDF1D2737C0	Argentina
2479	Laboulaye Airport	\\N	La Quiaca	0101000020E61000007EFEFFDF5FAE4FC0A9E6FFBF541141C0	Argentina
2481	El Dorado Airport	\\N	Puerto Eldorado	0101000020E61000007B1800C08F494BC0111E0080C2653AC0	Argentina
2482	Goya Airport	\\N	Goya	0101000020E6100000158C4AEA049C4DC0B3EA73B5151B3DC0	Argentina
2483	Oberá Airport	\\N	Oberá	0101000020E61000002C0E00C0E58F4BC0403200C0A8843BC0	Argentina
2484	Reconquista Airport	\\N	Reconquista	0101000020E6100000D7A3703D0AD74DC04B598638D6353DC0	Argentina
2485	Curuzu Cuatia Airport	\\N	Curuzú Cuatiá	0101000020E6100000F7065F984CFD4CC0304CA60A46C53DC0	Argentina
2486	El Bolson Airport	EHL	El Bolsón	0101000020E61000008BF3FF3F11E251C0D7F7FFBFBAF844C0	Argentina
2487	General E. Mosconi Airport	CRD	Comodoro Rivadavia	0101000020E61000006F1283C0CADD50C03FC6DCB584E446C0	Argentina
2488	Brigadier Antonio Parodi Airport	EQS	Esquel	0101000020E6100000EDFEFF9FEDC851C04EE7FF5F397445C0	Argentina
2490	Almirante Marco Andres Zar Airport	REL	Trelew	0101000020E6100000F7065F984C5150C06DE7FBA9F19A45C0	Argentina
2491	Gobernador Castello Airport	VDM	Viedma	0101000020E61000008E75711B0D804FC073D712F2416F44C0	Argentina
2492	El Tehuelche Airport	PMY	Puerto Madryn	0101000020E6100000265305A3924650C0C58F31772D6145C0	Argentina
2494	Puerto Deseado Airport	PUD	Puerto Deseado	0101000020E610000012143FC6DC7950C0D95F764F1EDE47C0	Argentina
2496	Piloto Civil N. Fernández Airport	RGL	Río Gallegos	0101000020E6100000B22E6EA3015451C06744696FF0CD49C0	Argentina
2497	Malvinas Argentinas Airport	USH	Ushuaia	0101000020E6100000098A1F63EE1251C0C05B2041F16B4BC0	Argentina
2498	Capitan D Daniel Vazquez Airport	ULA	San Julián	0101000020E610000041F163CC5DF350C0D734EF3845A748C0	Argentina
2501	Comandante Espora Airport	BHI	Bahía Blanca	0101000020E61000003D9B559FAB154FC0CDCCCCCCCC5C43C0	Argentina
2502	Brigadier D.H.E. Ruiz Airport	\\N	Coronel Suárez	0101000020E61000006AA67B9DD4F14EC0CF6740BD19B942C0	Argentina
2503	Olavarria Airport	\\N	Olavarría	0101000020E6100000CEE8FF7FB91B4EC05FE5FF7FEB7142C0	Argentina
2504	General Pico Airport	\\N	General Pico	0101000020E610000083E4FFFF0FE14FC0671400201DD941C0	Argentina
2505	Tres Arroyos Airport	\\N	Tres Arroyos	0101000020E6100000E0BE0E9C332A4EC044696FF0853143C0	Argentina
2508	Ástor Piazzola International Airport	MDQ	Mar del Plata	0101000020E6100000FE65F7E461C94CC02BF697DD93F742C0	Argentina
2509	Presidente Peron Airport	NQN	Neuquén	0101000020E6100000B7010000F70951C0441800E0787943C0	Argentina
2512	Santa Rosa Airport	RSA	Santa Rosa	0101000020E61000002E1A321EA51150C07FA2B2614D4B42C0	Argentina
2513	San Carlos De Bariloche Airport	BRC	San Carlos de Bariloche	0101000020E610000024FFFF7F14CA51C0D5F4FF7F5A9344C0	Argentina
2514	Héroes De Malvinas Airport	TDL	Tandil	0101000020E6100000E2E9FFDF2B9D4DC09BEEFF1F639E42C0	Argentina
2515	Villa Gesell Airport	VLG	Villa Gesell	0101000020E610000088855AD3BC834CC03CBD5296219E42C0	Argentina
2516	Cutral-Co Airport	\\N	Cutral-Có	0101000020E6100000FBF6FF3FEF5051C0C3F3FF1F487843C0	Argentina
2517	Aviador C. Campos Airport	CPC	Junín de los Andes	0101000020E61000004C040080C9C851C0331A00C0A60944C0	Argentina
2518	Conceição do Araguaia Airport	CDJ	Conceição do Araguaia	0101000020E61000000000008097A648C0000000E05AB220C0	Brazil
2519	Campo Délio Jardim de Mattos Airport	\\N	Rio de Janeiro	0101000020E610000087DEE2E13DB145C026C3F17C06E036C0	Brazil
2521	Araraquara Airport	AQA	Araraquara	0101000020E6100000AF120020061148C0F42D0040DFCF35C0	Brazil
2522	Santa Maria Airport	AJU	Aracaju	0101000020E61000007EFBFF9FFF8842C0F50D00E0CEF725C0	Brazil
2525	Araçatuba Airport	ARU	Araçatuba	0101000020E6100000630E00A05C3649C064EEFF3F2C2435C0	Brazil
2526	Val de Cans/Júlio Cezar Ribeiro International Airport	BEL	Belém	0101000020E61000003A060060F73C48C047EDFF7F6811F6BF	Brazil
2527	Comandante Gustavo Kraemer Airport	BGX	Bagé	0101000020E6100000180000A05C0E4BC0BEFFFFBFF7633FC0	Brazil
2528	Pampulha - Carlos Drummond de Andrade Airport	PLU	Belo Horizonte	0101000020E610000000000040ADF945C000000040E8D933C0	Brazil
2529	Bacacheri Airport	BFH	Curitiba	0101000020E610000010FEFF1FB29D48C0221C00A0B46739C0	Brazil
2530	Major Brigadeiro Doorgal Borges Airport	\\N	Barbacena	0101000020E6100000000000C06BE145C000000040674435C0	Brazil
2531	Presidente Juscelino Kubistschek International Airport	BSB	Brasília	0101000020E6100000000000E0DDF547C00000008003BD2FC0	Brazil
2532	Bauru Airport	BAU	Bauru	0101000020E610000099EBFFDFE28648C0093200E0515836C0	Brazil
2533	Atlas Brasil Cantanhede Airport	BVB	Boa Vista	0101000020E6100000D7F7FFBF9A584EC0D2F5FF1F2ABB0640	Brazil
2534	Barra do Garças Airport	\\N	Barra do Garças	0101000020E61000003EECFF7FC7314AC06F9DFF5FFCB82FC0	Brazil
2535	Cascavel Airport	CAC	Cascavel	0101000020E6100000D3F1FF3F1AC04AC021D9FF9F130039C0	Brazil
2536	Cachimbo Airport	\\N	Itaituba	0101000020E610000092FFFF3F927B4BC050060020FAAA22C0	Brazil
2537	Tancredo Neves International Airport	CNF	Belo Horizonte	0101000020E6100000000000A068FC45C000000080DB9F33C0	Brazil
2538	Campo Grande Airport	CGR	Campo Grande	0101000020E6100000A11A008014564BC0EBD8FFBFFC7734C0	Brazil
2539	Serafin Enoss Bertaso Airport	XAP	Chapecó	0101000020E6100000C2FFFF7F0B544AC0F1FFFFDF5A223BC0	Brazil
2540	Brig. Lysias Augusto Rodrigues Airport	CLN	Carolina	0101000020E6100000000000A0B6BA47C00000006021481DC0	Brazil
2541	Diomício Freitas Airport	CCM	Criciúma	0101000020E610000004E6FF1FF0B548C02522002075B93CC0	Brazil
2542	Canoas Air Force Base	\\N	Porto Alegre	0101000020E6100000020F0C207C9249C0E55E605628F23DC0	Brazil
2543	Bartolomeu Lisandro Airport	CAW	Tobias Barreto	0101000020E610000074E9FF1F9EA644C0192D00C0C3B235C0	Brazil
2544	Corumbá International Airport	CMG	Corumbá	0101000020E610000004E6FF1FF0D54CC07BD5FFBF0E0333C0	Brazil
2545	Afonso Pena Airport	CWB	Curitiba	0101000020E6100000840700A0809648C05A1F00C04B8739C0	Brazil
2546	Caravelas Airport	CRQ	Nova Viçosa	0101000020E6100000070000A065A043C083FFFF1FFDA631C0	Brazil
2547	Hugo Cantergiani Regional Airport	CXJ	Caxias do Sul	0101000020E610000000000000009849C02422002075323DC0	Brazil
2548	Marechal Rondon Airport	CGB	Cuiabá	0101000020E61000007D1B0000F00E4CC0CEC5FFDF484E2FC0	Brazil
2549	Cruzeiro do Sul Airport	CZS	Cruzeiro do Sul	0101000020E6100000FDF9FF7F3F3152C0760100C04E661EC0	Brazil
2550	Presidente Prudente Airport	PPB	Presidente Prudente	0101000020E6100000CDE5FF3F59B649C020D6FF5FD32C36C0	Brazil
2551	Eduardo Gomes International Airport	MAO	Manaus	0101000020E6100000000000A05C064EC0000000C0124F08C0	Brazil
2553	São Pedro da Aldeia Airport	\\N	São Pedro da Aldeia	0101000020E610000000000060DA0B45C0000000401AD036C0	Brazil
2554	Cataratas International Airport	IGU	Foz do Iguaçu	0101000020E610000000000080143E4BC0000000E0AB9939C0	Brazil
2555	Hercílio Luz International Airport	FLN	Florianópolis	0101000020E610000000000060B84648C00000006097AB3BC0	Brazil
2558	Furnas Airport	\\N	Alpinópolis	0101000020E610000000000020EB2A47C0000000C0EAB334C0	Brazil
2559	Pinto Martins International Airport	FOR	Fortaleza	0101000020E6100000000000402C4443C000000040D2350EC0	Brazil
2560	Rio Galeão – Tom Jobim International Airport	GIG	Rio de Janeiro	0101000020E610000092FFFF3F12A045C066D1FF1F5CCF36C0	Brazil
2561	Guajará-Mirim Airport	\\N	Guajará Mirim	0101000020E6100000000000203A5250C000000000A39225C0	Brazil
2562	Santa Genoveva Airport	GYN	Goiânia	0101000020E6100000000000E03F9C48C0000000C0CAA130C0	Brazil
2563	EMBRAER - Unidade Gavião Peixoto Airport	\\N	Macaé	0101000020E610000000000060DA3348C00000004011C635C0	Brazil
2564	Guarulhos - Governador André Franco Montoro International Airport	GRU	São Paulo	0101000020E6100000000000208D3C47C0000000A0806F37C0	Brazil
2565	Guaratinguetá Airport	\\N	Guaratinguetá	0101000020E6100000000000E0369A46C000000040A6CA36C0	Brazil
2566	Altamira Airport	ATM	Altamira	0101000020E61000003300002083204AC04D00000002080AC0	Brazil
2567	Itacoatiara Airport	\\N	Itaituba	0101000020E610000000000000983D4DC0000000E0A00409C0	Brazil
2568	Itaituba Airport	ITB	Itaituba	0101000020E61000001200000017004CC0E4FFFFFF27F810C0	Brazil
2569	Bahia - Jorge Amado Airport	IOS	Ilhéus	0101000020E6100000250000E03F8443C089FFFFBFCAA12DC0	Brazil
2570	Usiminas Airport	IPN	Ipatinga	0101000020E6100000C0FFFF9F693E45C04B0000C07F7833C0	Brazil
2571	Francisco Vilela do Amaral Airport	\\N	Itumbiara	0101000020E610000088EDFFBF509B48C03E0C00E0D77132C0	Brazil
2572	Prefeito Renato Moreira Airport	IMP	Imperatriz	0101000020E610000000000040E1BA47C0000000800A2016C0	Brazil
2573	Belém/Brigadeiro Protásio de Oliveira Airport	\\N	Belém	0101000020E6100000C0100040F83A48C03014004066A0F6BF	Brazil
2574	Francisco de Assis Airport	JDF	Juiz de Fora	0101000020E6100000000000A082B145C0000000C09FCA35C0	Brazil
2575	Presidente Castro Pinto International Airport	JPA	João Pessoa	0101000020E6100000E3ECFF1F6C7941C0ACF7FF3F55951CC0	Brazil
2576	Lauro Carneiro de Loyola Airport	JOI	Joinville	0101000020E610000000000040116648C0000000E078393AC0	Brazil
2577	Presidente João Suassuna Airport	CPV	Campina Grande	0101000020E610000000000040BDF241C0000000E065141DC0	Brazil
2578	Viracopos International Airport	VCP	Campinas	0101000020E6100000B9040040379147C027050000E50137C0	Brazil
2579	Lages Airport	\\N	Acopiara	0101000020E610000043F5FF3F082449C0BC0A00C037C83BC0	Brazil
2580	Lins Airport	LIP	Lins	0101000020E6100000EEFFFFFF80DD48C0DFFFFFDFFBA935C0	Brazil
2581	Governador José Richa Airport	LDB	Londrina	0101000020E6100000BCE7FF1FA79049C0321A00C0665537C0	Brazil
2582	Bom Jesus da Lapa Airport	LAZ	Bom Jesus da Lapa	0101000020E6100000630E00A03CB445C097C5FFFF31862AC0	Brazil
2583	Lagoa Santa Airport	\\N	Lagoa Santa	0101000020E610000000000040BDF245C0000000A05EA933C0	Brazil
2584	João Correa da Rocha Airport	MAB	Marabá	0101000020E61000004E0A0000AA9148C0FEF5FF9F6F7915C0	Brazil
2585	Monte Dourado Airport	\\N	Almeirim	0101000020E61000002AE8FFDF144D4AC0CBF3FF9F8F79ECBF	Brazil
2586	Regional de Maringá - Sílvio Nane Junior Airport	MGF	Maringá	0101000020E610000086EAFF7F90014AC0641100E0BC7A37C0	Brazil
2587	Mário Ribeiro Airport	MOC	Montes Claros	0101000020E61000008FF9FFBFD1E845C040CFFF5FF7B430C0	Brazil
2589	Ponta Pelada Airport	PLL	Manaus	0101000020E6100000000000203FFE4DC000000000172B09C0	Brazil
2590	Zumbi dos Palmares Airport	MCZ	Maceió	0101000020E61000000000006056E541C0000000E0880523C0	Brazil
2591	Alberto Alcolumbre Airport	MCP	Macapá	0101000020E610000072E6FFDF3D8949C0FCE5FFBFA1F0A93F	Brazil
2592	Dix-Sept Rosado Airport	MVF	Mossoró	0101000020E610000089100060A1AE42C0A1FAFF1FC4CE14C0	Brazil
2593	Campo de Marte Airport	\\N	São Paulo	0101000020E61000009DF1FF5FA35147C026E2FF5F548237C0	Brazil
2594	Manicoré Airport	MNX	Manicoré	0101000020E61000002E0000609FA34EC016000060DA3E17C0	Brazil
2595	Ministro Victor Konder International Airport	NVT	Navegantes	0101000020E610000000000020615348C0000000A047E13AC0	Brazil
2596	Santo Ângelo Airport	GEL	Santo Ângelo	0101000020E610000000000020A5154BC0000000801D483CC0	Brazil
2597	Governador Aluízio Alves International Airport	NAT	Natal	0101000020E61000003B55BE6724B041C07EFCA5457D1217C0	Brazil
2599	Salgado Filho Airport	POA	Porto Alegre	0101000020E610000000000060F09549C00000000091FE3DC0	Brazil
2600	Prefeito Doutor João Silva Filho Airport	\\N	Parnaíba	0101000020E610000010FEFF1FB2DD44C0AF200060662607C0	Brazil
2601	Poços de Caldas - Embaixador Walther Moreira Salles Airport	POO	Poços de Caldas	0101000020E6100000EEFFFFFFB04847C0AAFFFFDFCED735C0	Brazil
2602	Lauro Kurtz Airport	PFB	Passo Fundo	0101000020E610000000000000CE294AC0000000C0763E3CC0	Brazil
2603	João Simões Lopes Neto International Airport	PET	Pelotas	0101000020E610000044000020F2294AC07B000000E9B73FC0	Brazil
2604	Senador Nilo Coelho Airport	PNZ	Petrolina	0101000020E610000000000040D84844C0000000C08DB922C0	Brazil
2606	Ponta Porã Airport	PMG	Ponta Porã	0101000020E6100000000000C0EED94BC0000000A0B28C36C0	Brazil
2607	Governador Jorge Teixeira de Oliveira Airport	PVH	Porto Velho	0101000020E6100000000000A07EF34FC000000000286B21C0	Brazil
2609	Plácido de Castro Airport	RBR	Rio Branco	0101000020E6100000000000C079F950C000000000DFBC23C0	Brazil
2610	Guararapes - Gilberto Freyre International Airport	REC	Recife	0101000020E610000000000080387641C000000040C34020C0	Brazil
2612	Santos Dumont Airport	SDU	Rio de Janeiro	0101000020E610000003060080E09445C0AD32008016E936C0	Brazil
2613	Leite Lopes Airport	RAO	Ribeirão Preto	0101000020E6100000000000E069E347C000000060EA2235C0	Brazil
2614	Santa Cruz Airport	STU	Rio de Janeiro	0101000020E6100000000000800BDC45C0000000C0B1EE36C0	Brazil
2615	Professor Urbano Ernesto Stumpf Airport	SJK	São José dos Campos	0101000020E6100000000000A045EE46C0000000E0AC3A37C0	Brazil
2616	Marechal Cunha Machado International Airport	SLZ	São Luís	0101000020E610000000000000F71D46C000000040D1AE04C0	Brazil
2618	Congonhas Airport	CGH	São Paulo	0101000020E610000000000080045447C0000000C048A037C0	Brazil
2619	Prof. Eribelto Manoel Reino State Airport	SJP	São José do Rio Preto	0101000020E610000043F5FF3F08B448C0602B00C00CD134C0	Brazil
2620	Base Aérea de Santos Airport	SSZ	Santos	0101000020E6100000000000405D2647C00000002095ED37C0	Brazil
2621	Deputado Luiz Eduardo Magalhães International Airport	SSA	Salvador	0101000020E6100000BFEDFF9F472943C0AEEFFF7F35D129C0	Brazil
2622	Trombetas Airport	TMT	Oriximiná	0101000020E6100000F9FFFF5FCA324CC0D0FFFFBF66D5F7BF	Brazil
2623	Senador Petrônio Portela Airport	THE	Teresina	0101000020E610000045F8FF7F686945C0860A00E0603D14C0	Brazil
2624	Tefé Airport	TFF	Tefé	0101000020E61000003C0900A0572E50C0970100E042100BC0	Brazil
2625	Tarauacá Airport	\\N	Tarauacá	0101000020E6100000070000A021B251C0110000407E4F20C0	Brazil
2626	Telêmaco Borba Airport	\\N	Telêmaco Borba	0101000020E6100000000000A0675349C0000000605B5138C0	Brazil
2628	Tabatinga Airport	TBT	Tabatinga	0101000020E610000021000020E47B51C007000060CE0511C0	Brazil
2629	Tucuruí Airport	TUR	Tucuruí	0101000020E6100000160000C032DC48C0540000A0BF490EC0	Brazil
2630	São Gabriel da Cachoeira Airport	SJL	São Gabriel	0101000020E6100000508D976E12BF50C0E9482EFF21FDC2BF	Brazil
2631	Paulo Afonso Airport	PAV	Paulo Afonso	0101000020E61000002A0000A0132043C0F7FFFF1F40CD22C0	Brazil
2632	Rubem Berta Airport	URG	Uruguaiana	0101000020E61000001FF6FFBFE3844CC0F4EAFF3F3EC83DC0	Brazil
2633	Ten. Cel. Aviador César Bombonato Airport	UDI	Uberlândia	0101000020E6100000000000E0D51C48C00000006034E232C0	Brazil
2635	Mário de Almeida Franco Airport	UBA	Uberaba	0101000020E6100000E6FFFF7FA9FB47C05A0000E0C4C333C0	Brazil
2636	Major Brigadeiro Trompowsky Airport	VAG	Varginha	0101000020E61000002BEBFF1F95BC46C088EDFFBF109735C0	Brazil
2637	Brigadeiro Camarão Airport	BVH	Vilhena	0101000020E61000000F000020950C4EC090FFFF5F886329C0	Brazil
2638	Eurico de Aguiar Salles Airport	VIX	Vitória	0101000020E610000000000060A82444C000000000104234C0	Brazil
2640	Campo Fontenelle Airport	QPS	Pirassununga	0101000020E6100000000000C0DAAA47C0000000C00EFC35C0	Brazil
2641	Chacalluta Airport	ARI	Arica	0101000020E610000000000040AD9551C000000040375932C0	Chile
2642	Balmaceda Airport	BBA	Coyhaique	0101000020E6100000000000C020EC51C0000000C042F546C0	Chile
2643	El Bosque Airport	\\N	Santiago	0101000020E6100000000000C00EAC51C000000000E9C740C0	Chile
2645	El Loa Airport	CJC	Calama	0101000020E6100000000000A0D43951C0000000008A7F36C0	Chile
2646	Gral. Bernardo O´Higgins Airport	\\N	Chillán	0101000020E610000000000080020252C0000000608F4A42C0	Chile
2647	Pdte. carlos Ibañez del Campo Airport	PUQ	Punta Arenas	0101000020E6100000000000C0B1B651C00000004055804AC0	Chile
2648	Teniente Vidal Airport	GXQ	Coyhaique	0101000020E610000000000060CA0652C0000000C00ECC46C0	Chile
2649	Diego Aracena Airport	IQQ	Iquique	0101000020E6100000000000609A8B51C0000000E0028934C0	Chile
2650	Comodoro Arturo Merino Benítez International Airport	SCL	Santiago	0101000020E6100000000000804AB251C0000000E04DB240C0	Chile
2651	Cerro Moreno Airport	ANF	Antofagasta	0101000020E6100000000000807C9C51C0000000C0CA7137C0	Chile
2652	Capitan Fuentes Martinez Airport Airport	WPR	Punta Arenas	0101000020E6100000000000C06D9451C00000004079A04AC0	Chile
2654	María Dolores Airport	LSQ	Los Ángeles	0101000020E6100000000000C0391B52C0000000E06AB342C0	Chile
2656	Carriel Sur Airport	CCP	Concepción	0101000020E6100000000000E0094452C0000000E0E76242C0	Chile
2658	Cañal Bajo Carlos - Hott Siebert Airport	ZOS	Osorno	0101000020E610000000000060E74352C0000000C03B4E44C0	Chile
2659	Vallenar Airport	\\N	Vallenar	0101000020E61000000000004062B051C0000000A0AD983CC0	Chile
2660	De La Independencia Airport	\\N	Rancagua	0101000020E610000000000020A5B151C0000000C03B1641C0	Chile
2662	La Florida Airport	LSC	La Serena	0101000020E6100000A50000A0C4CC51C0E2ECFF1F8CEA3DC0	Chile
2663	Eulogio Sánchez Airport	\\N	Santiago	0101000020E610000000000020FDA251C00000000068BA40C0	Chile
2664	Maquehue Airport	ZCO	Temuco	0101000020E61000001F000040C62852C01A000080266243C0	Chile
2665	El Tepual Airport	PMC	Puerto Montt	0101000020E610000000000020044652C0000000E02DB844C0	Chile
2667	Pichoy Airport	ZAL	Valdivia	0101000020E6100000150400A0824552C0990B004033D343C0	Chile
2668	Chachoán Airport	ATF	Ambato	0101000020E610000000000040C6A453C000000080A364F3BF	Ecuador
2669	Hacienda Clementina Airport	\\N	Montalvo	0101000020E6100000000000E03FD853C0000000C0E14CFBBF	Ecuador
2670	Francisco De Orellana Airport	OCC	Puerto Francisco de Orellana	0101000020E6100000000000C0273F53C0000000A0EC9FDDBF	Ecuador
2671	Mariscal Lamar Airport	CUE	Cuenca	0101000020E61000000000006000BF53C000000080A21D07C0	Ecuador
2672	Seymour Airport	GPS	Puerto Ayora	0101000020E610000000000080049156C0000000005F0ADDBF	Ecuador
2673	José Joaquín de Olmedo International Airport	GYE	Guayaquil	0101000020E6100000E9F5FFDF8CF853C0A8140060654201C0	Ecuador
2675	Atahualpa Airport	\\N	Ibarra	0101000020E6100000000000C0BA8853C000000020A8A8D53F	Ecuador
2676	Km 192 Airport	\\N	Rosa Zarate	0101000020E61000000000008016D953C0000000C0F693C73F	Ecuador
2677	Hacienda La Julia Airport	\\N	Babahoyo	0101000020E6100000000000E058E353C0000000002445FBBF	Ecuador
2678	Cotopaxi International Airport	LTX	Latacunga	0101000020E61000004A01004069A753C0E70F00A0C604EDBF	Ecuador
2679	Jose Maria Velasco Ibarra Airport	\\N	Macará	0101000020E6100000CC02006039FC53C0760100C04E8311C0	Ecuador
2680	Coronel E Carvajal Airport	XMS	Macas	0101000020E610000000000020BB8753C000000040B36402C0	Ecuador
2681	General Manuel Serrano Airport	MCH	Machala	0101000020E610000042B3EBDE8AFD53C0BB270F0BB5260AC0	Ecuador
2682	El Carmen Airport	\\N	Montalvo	0101000020E6100000000000E0713E53C0000000803C8900C0	Ecuador
2683	Eloy Alfaro International Airport	MEC	Manta	0101000020E610000000000080712B54C0000000604546EEBF	Ecuador
2684	Maragrosa Airport	\\N	Baláo	0101000020E6100000000000206EF353C0000000800DCF06C0	Ecuador
2685	Amable Calle Gutierrez Airport	\\N	Pasaje	0101000020E6100000000000A03AF153C000000020AF8E0AC0	Ecuador
2686	Reales Tamarindos Airport	PVO	Portoviejo	0101000020E610000000000080381E54C00000004099AAF0BF	Ecuador
2687	Quevedo Airport	\\N	Quevedo	0101000020E610000000000040C4DD53C0000000402AA9EFBF	Ecuador
2688	Mariscal Sucre International Airport	UIO	Quito	0101000020E61000007B14AE47E19653C072B788888888C0BF	Ecuador
2689	Chimborazo Airport	\\N	Riobamba	0101000020E610000000000080FDA953C0000000007374FABF	Ecuador
2690	Santa Rosa International Airport	ETR	Santa Rosa	0101000020E61000002BA1BB24CEFF53C0A051BAF42F890BC0	Ecuador
2691	General Ulpiano Paez Airport	SNC	Salinas	0101000020E61000000403081F4A3F54C06B0E10CCD1A301C0	Ecuador
2692	Santo Domingo de Los Colorados Airport	\\N	Santo Domingo de los Colorados	0101000020E6100000000000C0B8CD53C000000000BDC5CFBF	Ecuador
2694	Taura Airport	\\N	Milagro	0101000020E61000000000006088EB53C0000000209C1602C0	Ecuador
2695	Mayor Galo Torres Airport	\\N	Tena	0101000020E6100000000000C0727453C0000000609893EFBF	Ecuador
2697	Teniente Coronel Luis a Mantilla Airport	TUA	Tulcán	0101000020E610000000000080516D53C00000002079E7E93F	Ecuador
2699	Silvio Pettirossi International Airport	ASU	Asunción	0101000020E6100000000000608FC24CC0000000A0703D39C0	Paraguay
2700	Juan De Ayolas Airport	\\N	Ayolas	0101000020E610000071581AF8516D4CC0E8667FA0DC5E3BC0	Paraguay
2701	Teniente Col Carmelo Peralta Airport	CIO	Concepción	0101000020E6100000170FEF39B0B64CC0E0F599B33E7137C0	Paraguay
2702	Itaipú Airport	\\N	Ciudad del Este	0101000020E61000008272DBBE474F4BC0A67F492A536839C0	Paraguay
2704	Carlos Miguel Gimenez Airport	\\N	Pilar	0101000020E61000008CA37213B5284DC0477364E597E13AC0	Paraguay
2705	El Eden Airport	AXM	Armenia	0101000020E6100000E2E995B20CF152C0AB21718FA5CF1140	Colombia
2706	Tres De Mayo Airport	PUU	Puerto Asís	0101000020E61000008E75711B0D2053C06AC020E9D32AE03F	Colombia
2707	Las Flores Airport	\\N	El Banco	0101000020E6100000B537F8C2647E52C0D751D50451172240	Colombia
2708	Palonegro Airport	BGA	Bucaramanga	0101000020E6100000401361C3D34B52C0A8C64B3789811C40	Colombia
2709	El Dorado International Airport	BOG	Bogotá	0101000020E610000013F241CF668952C075CDE49B6DCE1240	Colombia
2710	Ernesto Cortissoz International Airport	BAQ	Barranquilla	0101000020E6100000E02D90A0F8B152C00F0BB5A679C72540	Colombia
2712	Gerardo Tobar López Airport	BUN	Buenaventura	0101000020E61000002C6519E2583F53C05890662C9A8E0E40	Colombia
2713	Camilo Daza International Airport	CUC	Cúcuta	0101000020E6100000DBF97E6ABC2052C0BD00FBE8D4B51F40	Colombia
2714	Rafael Nuñez International Airport	CTG	Cartagena	0101000020E610000046B6F3FDD4E052C03480B74082E22440	Colombia
2715	Alfonso Bonilla Aragon International Airport	CLO	Cali	0101000020E6100000D50968226C1853C0D44334BA83580C40	Colombia
2716	La Florida Airport	TCO	Tumaco	0101000020E6100000728A8EE4F2AF53C047551344DD07FD3F	Colombia
2717	Las Brujas Airport	CZU	Corozal	0101000020E610000035EF384547D252C05F24B4E55CAA2240	Colombia
2718	Yariguíes Airport	EJA	Barrancabermeja	0101000020E61000006B9A779CA27352C0293FA9F6E9181C40	Colombia
2719	Gustavo Artunduaga Paredes Airport	FLA	Florencia	0101000020E610000032772D211FE452C07715527E526DF93F	Colombia
2720	Santiago Vila Airport	\\N	Girardot City	0101000020E6100000492EFF21FDB252C05E6397A8DE1A1140	Colombia
2722	Juan Casiano Airport	GPI	Guapi	0101000020E6100000E10B93A9827953C072BF4351A08F0440	Colombia
2723	Guaymaral Airport	\\N	Cota	0101000020E6100000AA605452278452C01D3D7E6FD33F1340	Colombia
2724	Perales Airport	IBE	Ibagué	0101000020E6100000A323B9FC87C852C08FAA2688BAAF1140	Colombia
2725	San Luis Airport	IPI	Ipiales	0101000020E6100000FB5C6DC5FE6A53C0865AD3BCE394EB3F	Colombia
2726	Antonio Roldan Betancourt Airport	APO	Carepa	0101000020E6100000AEB6627FD92D53C001A43671723F1F40	Colombia
2727	Jorge Isaac Airport	\\N	Albania	0101000020E610000041F163CC5D1F52C0D7A3703D0A772640	Colombia
2728	Alfredo Vásquez Cobo International Airport	LET	Leticia	0101000020E6100000956588635D7C51C02E90A0F831C610C0	Colombia
2729	Enrique Olaya Herrera Airport	EOH	Medellín	0101000020E6100000CDE67118CCE552C07AA9D898D7E11840	Colombia
2730	Baracoa Airport	MGN	Magangué	0101000020E610000052499D8026B652C0E0B9F770C9912240	Colombia
2731	Los Garzones Airport	MTR	Montería	0101000020E61000005B423EE8D9F452C068D0D03FC1A52140	Colombia
2732	Fabio Alberto Leon Bentley Airport	MVP	Mitú	0101000020E610000034A2B437F88E51C090DAC4C9FD0EF43F	Colombia
2733	La Nubia Airport	MZL	Manizales	0101000020E6100000E09C11A5BDDD52C0AED85F764F1E1440	Colombia
2734	Benito Salas Airport	NVA	Neiva	0101000020E6100000894160E5D0D252C0EE5A423EE8990740	Colombia
2735	Aguas Claras Airport	OCV	Ocaña	0101000020E6100000098A1F63EE5652C0378E588B4FA12040	Colombia
2736	Otu Airport	OTU	Segovia	0101000020E61000006F1283C0CAAD52C02670EB6E9E0A1C40	Colombia
2738	German Olano Airport	PCR	Puerto Carreño	0101000020E6100000C898BB9690DF50C022AB5B3D27BD1840	Colombia
2739	Matecaña International Airport	PEI	Pereira	0101000020E610000017D9CEF753EF52C0E3C281902C401340	Colombia
2740	Pitalito Airport	\\N	Pitalito	0101000020E61000001A51DA1B7C0553C0B6D617096DB9FD3F	Colombia
2741	Guillermo León Valencia Airport	PPN	Popayán	0101000020E6100000FB5C6DC5FE2653C0516B9A779CA20340	Colombia
2742	Antonio Narino Airport	PSO	Pasto	0101000020E61000002DB29DEFA75253C0D7A3703D0A57F63F	Colombia
2744	Mariquita Airport	\\N	Mariquita	0101000020E6100000B8AF03E78CB852C044C02154A9D91440	Colombia
2745	Jose Maria Córdova International Airport	MDE	Rionegro	0101000020E610000002BC051214DB52C00D897B2C7DA81840	Colombia
2746	Almirante Padilla Airport	RCH	Ríohacha	0101000020E610000025068195433B52C0764F1E166A0D2740	Colombia
2747	Jorge E. Gonzalez Torres Airport	SJE	San José del Guaviare	0101000020E6100000FE43FAEDEB2852C0C18BBE8234A30440	Colombia
2748	Simón Bolívar International Airport	SMR	Santa Marta	0101000020E6100000499D8026C28E52C0053411363C3D2640	Colombia
2749	Gustavo Rojas Pinilla International Airport	ADZ	San Andrés	0101000020E6100000933A014D846D54C026E4839ECD2A2940	Colombia
2750	Eduardo Falla Solano Airport	SVI	Puerto Rico	0101000020E610000030BB270F0BB152C06475ABE7A4370140	Colombia
2751	Gustavo Vargas Airport	TME	Tame	0101000020E610000086C954C1A8F051C0CB845FEAE7CD1940	Colombia
2752	Santiago Perez Airport	AUC	Arauca	0101000020E6100000091B9E5E29AF51C0D8648D7A88461C40	Colombia
2753	El Caraño Airport	UIB	Quibdó	0101000020E61000007E8CB96B092953C0338AE59656C31640	Colombia
2754	Heriberto Gíl Martínez Airport	ULQ	Tuluá	0101000020E610000089D2DEE00B0F53C02619390B7B5A1040	Colombia
2755	Alfonso López Pumarejo Airport	VUP	Valledupar	0101000020E61000008716D9CEF74F52C01F85EB51B8DE2440	Colombia
2756	Vanguardia Airport	VVC	Villavicencio	0101000020E61000003A92CB7F486752C007EBFF1CE6AB1040	Colombia
2759	Jorge Wilsterman International Airport	CBB	Cochabamba	0101000020E6100000000000A0558B50C000000040CD6B31C0	Bolivia
2760	Chimore Airport	\\N	Chimoré	0101000020E6100000000000600E4950C0000000E071FD30C0	Bolivia
2761	Capitán Aníbal Arab Airport	CIJ	Cobija	0101000020E6100000E6F2FF9F1C3251C079120040AF1426C0	Bolivia
2762	El Alto International Airport	LPB	La Paz	0101000020E6100000000000A04E0C51C0000000A0678330C0	Bolivia
2763	Juan Mendoza Airport	\\N	Oruro	0101000020E610000003060080E0C450C069F7FFFF6CF631C0	Bolivia
2764	Capitan Nicolas Rojas Airport	POI	Potosí	0101000020E6100000880D0020516E50C0BF3000A0088B33C0	Bolivia
2767	Juana Azurduy De Padilla Airport	SRE	Sucre	0101000020E6100000000000007A5250C000000040D10133C0	Bolivia
2768	Capitan Oriel Lea Plaza Airport	TJA	Tarija	0101000020E610000011FEFF1FE22C50C096E5FF5F428E35C0	Bolivia
2769	Teniente Av. Jorge Henrich Arauz Airport	TDD	Trinidad	0101000020E610000003060080C03A50C0EDBBFF9F2CA32DC0	Bolivia
2770	Teniente Coronel Rafael Pabón Airport	\\N	Villamontes	0101000020E6100000541300C0EAB34FC0A21D00C0544135C0	Bolivia
2771	Viru Viru International Airport	VVI	Santa Cruz de la Sierra	0101000020E6100000000000C054914FC0000000A011A531C0	Bolivia
2772	Yacuiba Airport	BYC	Yacuiba	0101000020E6100000000000E06AD34FC000000080FDF535C0	Bolivia
2773	Johan Adolf Pengel International Airport	PBM	Onverwacht	0101000020E6100000CE0800E009984BC0140400A0B2CF1540	Suriname
2774	Cayenne-Rochambeau Airport	CAY	Cayenne	0101000020E61000008A1300A0212E4AC0DF1400407C471340	French Guiana
2776	Huancabamba Airport	\\N	Huancabamba	0101000020E61000000000008058DC53C0000000C0EE0615C0	Peru
2781	Cap FAP David Abenzur Rengifo International Airport	PCL	Pucallpa	0101000020E610000000000060C1A452C00000006081C120C0	Peru
2782	Teniente FAP Jaime A De Montreuil Morales Airport	CHM	Chimbote	0101000020E61000000000000086A153C0000000A0994C22C0	Peru
2784	Cesar Torke Podesta Airport	\\N	Moquegua	0101000020E61000000000004092BB51C000000000D32D31C0	Peru
2785	Capitan FAP Jose A Quinones Gonzales International Airport	CIX	Chiclayo	0101000020E6100000000000A0FFF453C00000002061261BC0	Peru
2786	Coronel FAP Alfredo Mendivil Duarte Airport	AYP	Ayacucho	0101000020E6100000000000E0148D52C000000000424F2AC0	Peru
2787	Andahuaylas Airport	ANS	Andahuaylas	0101000020E6100000000000006D5652C000000040AD692BC0	Peru
2788	Comandante FAP German Arias Graziani Airport	ATA	Anta	0101000020E6100000000000204C6653C0000000A0E3B122C0	Peru
2789	Jorge Chávez International Airport	LIM	Lima	0101000020E61000005473B9C1504753C097900F7A360B28C0	Peru
2790	Juanjui Airport	JJI	Juanjuí	0101000020E610000000000060A12E53C00000008028AD1CC0	Peru
2791	Francisco Carle Airport	\\N	Jauja	0101000020E6100000610800204CDE52C08D390080F29027C0	Peru
2792	Inca Manco Capac International Airport	JUL	Juliaca	0101000020E610000000000000208A51C0000000C027EF2EC0	Peru
2794	Ilo Airport	\\N	Ilo	0101000020E61000000000002004D651C000000080EBB131C0	Peru
2795	Las Palmas Air Base	\\N	San Isidro	0101000020E610000023000000EE3F53C03AFFFF3F475228C0	Peru
2796	Capitan FAP Pedro Canga Rodriguez Airport	TBP	Tumbes	0101000020E6100000000000E0681854C0000000E0946B0CC0	Peru
2797	Moises Benzaquen Rengifo Airport	YMS	Yurimaguas	0101000020E6100000000000A0900753C000000080389317C0	Peru
2799	Collique Airport	\\N	Lima	0101000020E610000000000000E94353C0000000A07EDB27C0	Peru
2800	Chachapoyas Airport	CHH	Chachapoyas	0101000020E610000000000060CA7653C000000040A7CE18C0	Peru
2801	Coronel FAP Francisco Secada Vignetta International Airport	IQT	Iquitos	0101000020E610000000000060C35352C0000000C025470EC0	Peru
2802	Rodríguez Ballón International Airport	AQP	Arequipa	0101000020E61000008DF6FF7F51E551C019CAFF5F525730C0	Peru
2803	Capitán FAP Leonardo Alvariño Herr Airport	\\N	San Ramón	0101000020E6100000000000A06ED652C0000000E0D74126C0	Peru
2804	Capitan FAP Carlos Martinez De Pinillos International Airport	TRU	Trujillo	0101000020E6100000000000A0F6C653C0000000A0AE2920C0	Peru
2805	Capitán FAP Renán Elías Olivera International Airport	PIO	Pisco	0101000020E610000000000060190E53C000000080637D2BC0	Peru
2806	Cadete FAP Guillermo Del Castillo Paredes Airport	TPP	Lamas	0101000020E610000000000080E21753C000000020F3081AC0	Peru
2807	Coronel FAP Carlos Ciriani Santa Rosa International Airport	TCQ	Tacna	0101000020E6100000B6FEFFBFA69151C0AFCFFF1FA50D32C0	Peru
2808	Padre Aldamiz International Airport	PEM	Puerto Maldonado	0101000020E61000000CF5FF5FA14E51C053D0FFBF293A29C0	Peru
2809	Capitán FAP Guillermo Concha Iberico International Airport	PIU	Piura	0101000020E6100000170A0020732754C0FF110020B0D214C0	Peru
2810	Capitan Montes Airport	TYL	Talara	0101000020E6100000ECFFFF1F435054C0320000C07A4E12C0	Peru
2812	Alejandro Velasco Astete International Airport	CUZ	Cusco	0101000020E61000002908004015FC51C03157004047122BC0	Peru
2813	Angel S Adami Airport	\\N	Montevideo	0101000020E6100000000000C0E1214CC000000080046541C0	Uruguay
2814	Santa Bernardina International Airport	\\N	Durazno	0101000020E6100000000000C0E53F4CC000000060F0AD40C0	Uruguay
2816	Carrasco International /General C L Berisso Airport	MVD	Montevideo	0101000020E610000000000040F1034CC0000000C0506B41C0	Uruguay
2817	Nueva Hesperides International Airport	STY	Salto	0101000020E6100000000000401EFE4CC00000008041703FC0	Uruguay
2818	Oswaldo Guevara Mujica Airport	AGV	Acarigua	0101000020E610000000000040394F51C000000000541B2340	Venezuela
2819	Anaco Airport	AAO	Anaco	0101000020E610000000000060201E50C00000008046DC2240	Venezuela
2821	General Jose Antonio Anzoategui International Airport	BLA	Barcelona	0101000020E6100000000000E01B2C50C0000000C0D5362440	Venezuela
2822	Barinas Airport	BNS	Barinas	0101000020E6100000000000A0218E51C000000040383D2140	Venezuela
2823	El Libertador Airbase	\\N	Maracaibo	0101000020E61000005AFCFF1FABE350C097280060E35D2440	Venezuela
2824	Barquisimeto International Airport	BRM	Barquisimeto	0101000020E6100000000000A0F35651C0000000E0E2152440	Venezuela
2826	Aeropuerto \\General Tomas de Heres\\". Ciudad Bolivar"	CBL	Ciudad Bolívar	0101000020E6100000D9FAFFFFBAC44FC0DFFFFFDF8B3E2040	Venezuela
2828	San Carlos Airport	\\N	San Carlos	0101000020E6100000000000E0C72451C000000000A24B2340	Venezuela
2829	Calabozo Airport	\\N	Calabozo	0101000020E6100000000000A0B1DA50C0000000806CD92140	Venezuela
2831	Carora Airport	\\N	Carora	0101000020E6100000000000802C8451C0000000A0E8592440	Venezuela
2832	General Francisco Bermúdez Airport	CUP	Carúpano	0101000020E6100000000000C07EA14FC000000060ED512540	Venezuela
2833	José Leonardo Chirinos Airport	CZE	Coro	0101000020E6100000000000E0936B51C00000008073D42640	Venezuela
2834	Oscar Machado Zuluaga Airport	\\N	Caracas	0101000020E6100000000000203BB450C0000000207D922440	Venezuela
2835	Cumaná (Antonio José de Sucre) Airport	CUM	Cumaná	0101000020E6100000000000A0590850C00000000092E62440	Venezuela
2836	Capitán Manuel Ríos Airbase	\\N	Carrizal	0101000020E6100000000000200FBB50C000000000CCBE2240	Venezuela
2839	Guasdalito Airport	\\N	Guasdualito	0101000020E61000000000004033B351C0000000E0EEEE1C40	Venezuela
2840	Guiria Airport	GUI	Güiria	0101000020E61000002B0B008005284FC06DFDFF7FED252540	Venezuela
2841	Guanare Airport	GUQ	Guanare	0101000020E610000000000060547051C0000000A0CB0D2240	Venezuela
2842	Higuerote Airport	\\N	Guatire	0101000020E61000005BB05417F08550C028806264C9EC2440	Venezuela
2843	Andrés Miguel Salazar Marcano Airport	\\N	Porlamar	0101000020E6100000520ABABDA4FD4FC0B0CA85CABF962540	Venezuela
2844	Josefa Camejo International Airport	LSP	Punto Fijo	0101000020E610000000000020B28951C0000000C0C18F2740	Venezuela
2845	San Juan de Los Morros Airport	\\N	San Juan de los Morros	0101000020E6100000000000004CD850C0000000205CD02340	Venezuela
2846	La Fria Airport	LFR	La Fría	0101000020E610000000000080581152C000000020747A2040	Venezuela
2848	La Chinita International Airport	MAR	Maracaibo	0101000020E61000002908004095EE51C066340080CD1D2540	Venezuela
2849	Alberto Carnevalli Airport	MRD	Mérida	0101000020E6100000000000804ECA51C000000020062A2140	Venezuela
2850	Del Caribe Santiago Mariño International Airport	PMV	Porlamar	0101000020E610000000000080B9FB4FC0000000C040D32540	Venezuela
2851	Simón Bolívar International Airport	CCS	Caracas	0101000020E6100000B0F2FFBF65BF50C067B1FFBFCB342540	Venezuela
2852	Maturín Airport	MUN	Maturín	0101000020E610000000000000DE924FC0000000C051822340	Venezuela
2853	Cacique Aramare Airport	PYH	Puerto Ayacucho	0101000020E6100000F9FFFF5FCAE650C02D0000A0DE7A1640	Venezuela
2854	General Bartolome Salom International Airport	PBL	Puerto Cabello	0101000020E610000000000000AC0451C00000002004F62440	Venezuela
2855	Paramillo Airport	\\N	San Cristóbal	0101000020E610000000000060FC0C52C0000000408D341F40	Venezuela
2856	General Manuel Carlos Piar International Airport	PZO	Ciudad Guayana	0101000020E6100000000000C054614FC000000040BA932040	Venezuela
2858	San Antonio Del Tachira Airport	SVZ	San Antonio del Táchira	0101000020E610000000000000241C52C000000080025D1F40	Venezuela
2860	Santa Elena de Uairen Airport	SNV	Santa Elena de Uairén	0101000020E61000000000004033934EC0000000E051381240	Venezuela
2861	Mayor Buenaventura Vivas International Airport	STD	San Cristóbal	0101000020E6100000000000203F0252C000000000F3421E40	Venezuela
2862	Sub Teniente Nestor Arias Airport	\\N	San Felipe	0101000020E610000000000040553051C0000000C0B18E2440	Venezuela
2863	San Fernando De Apure Airport	SFD	San Fernando de Apure	0101000020E6100000000000806ADC50C00000000085881F40	Venezuela
2864	San Tomé Airport	SOM	San José de Guanipa	0101000020E6100000E8FFFF5FAB0950C0E6FFFF3FEAE32140	Venezuela
2866	Tucupita Airport	TUV	Tucupita	0101000020E6100000000000E00D0C4FC0000000A0902D2240	Venezuela
2868	Arturo Michelena International Airport	VLN	Valencia	0101000020E6100000000000E06AFB50C0000000C0A94C2440	Venezuela
2870	Dr. Antonio Nicolás Briceño Airport	VLV	Valera	0101000020E61000000000004061A551C00000002053AE2240	Venezuela
2871	Valle de La Pascua Airport	VDP	Valle de La Pascua	0101000020E6100000370000E0967F50C0EC0900A0AD712240	Venezuela
2872	Linden Airport	\\N	Linden	0101000020E61000000000004099224DC0000000201ADD1740	Guyana
2873	Lethem Airport	LTM	Lethem	0101000020E6100000000000000BE54DC0000000A069FB0A40	Guyana
2874	V.C. Bird International Airport	ANU	Piggotts	0101000020E6100000A5BC564277E54EC0FB5C6DC5FE223140	Antigua and Barbuda
2875	Sir Grantley Adams International Airport	BGI	Bridgetown	0101000020E6100000500D00400ABF4DC097C5FFFF31262A40	Barbados
2876	Canefield Airport	DCF	Roseau	0101000020E6100000000000A033B24EC00000000064AC2E40	Dominica
2877	Melville Hall Airport	DOM	Wesley	0101000020E61000000000006066A64EC00000006010182F40	Dominica
2878	Martinique Aimé Césaire International Airport	FDF	Fort-de-France	0101000020E6100000000000E068804EC000000080972E2D40	Martinique
2881	Pointe-à-Pitre Le Raizet	PTP	Pointe-à-Pitre	0101000020E61000000000000012C44EC0000000C0EA433040	Guadeloupe
2882	Point Salines International Airport	GND	Saint George's	0101000020E610000000000040A2E44EC00000008026022840	Grenada
2883	Cyril E. King Airport	STT	Road Town	0101000020E6100000000000204C3E50C00000004059563240	British Virgin Islands
2885	Rafael Hernandez Airport	BQN	Aguadilla	0101000020E61000000000002048C850C0000000C0B17E3240	Puerto Rico
2886	Diego Jimenez Torres Airport	FAJ	Fajardo	0101000020E6100000000000A05C6A50C000000020144F3240	Puerto Rico
2887	Fernando Luis Ribas Dominicci Airport	SIG	San Juan	0101000020E610000000000040478650C0000000E0F0743240	Puerto Rico
2888	Eugenio Maria De Hostos Airport	MAZ	Mayagüez	0101000020E61000000000000081C950C00000008075413240	Puerto Rico
2889	Mercedita Airport	PSE	Ponce	0101000020E61000000000004008A450C00000000020023240	Puerto Rico
2890	Luis Munoz Marin International Airport	SJU	San Juan	0101000020E61000006CFDFF7F1D8050C0E9D5FF7F7C703240	Puerto Rico
2891	Robert L. Bradshaw International Airport	SKB	Monkey Hill	0101000020E610000000000060FE5B4FC0000000C0AA4F3140	Saint Kitts and Nevis
2893	George F. L. Charles Airport	SLU	Castries	0101000020E610000036954561177F4EC027C286A7570A2C40	Saint Lucia
2894	Hewanorra International Airport	UVF	Vieux Fort	0101000020E6100000E59997C3EE794EC0BADA8AFD65772B40	Saint Lucia
2895	Queen Beatrix International Airport	AUA	Oranjestad	0101000020E610000000000000F98051C000000080B7002940	Aruba
2896	Flamingo International Airport	BON	Kralendijk	0101000020E6100000000000202F1151C00000006012432840	Bonaire, Saint Eustatius and Saba 
2898	F. D. Roosevelt Airport	EUX	Oranjestad	0101000020E6100000000000005D7D4FC0000000A01A7F3140	Bonaire, Saint Eustatius and Saba 
2899	Princess Juliana International Airport	SXM	The Bottom	0101000020E610000006E9FF5FF08D4FC0FAF3FFFF7E0A3240	Bonaire, Saint Eustatius and Saba 
2900	Wallblake Airport	AXA	The Valley	0101000020E6100000000000800D874FC0000000C06D343240	Anguilla
2901	Tobago-Crown Point Airport	TAB	Scarborough	0101000020E610000000000080856A4EC000000080A54C2640	Trinidad and Tobago
2902	Piarco International Airport	POS	Arouca	0101000020E61000000000006029AB4EC000000040D8302540	Trinidad and Tobago
2903	Terrance B. Lettsome International Airport	EIS	Road Town	0101000020E610000000000080C02250C000000060DE713240	British Virgin Islands
2905	Canouan Airport	CIW	Port Elizabeth	0101000020E6100000000000C0D3AB4EC000000060E3652940	Saint Vincent and the Grenadines
2906	Mustique Airport	MQS	Port Elizabeth	0101000020E6100000000000C010974EC0000000E09AC62940	Saint Vincent and the Grenadines
2907	E. T. Joshua Airport	SVD	Kingstown	0101000020E6100000000000C0FE9A4EC0000000C0E1492A40	Saint Vincent and the Grenadines
2908	Almaty Airport	ALA	Almaty	0101000020E61000000000008097425340000000A011AD4540	Kazakhstan
2909	Balkhash Airport	BXH	Balqash	0101000020E6100000000000E051C05240000000A057724740	Kazakhstan
2910	Astana International Airport	TSE	Astana	0101000020E6100000000000C0E1DD514000000080D7824940	Kazakhstan
2911	Taraz Airport	DMB	Taraz	0101000020E6100000000000206ED35140000000C0426D4540	Kazakhstan
2912	Manas International Airport	FRU	Bishkek	0101000020E6100000070C0000919E5240431500A0D8874540	Kyrgyzstan
2913	Osh Airport	OSS	Osh	0101000020E6100000AA090060C53252409C1100C0F34D4440	Kyrgyzstan
2914	Shymkent Airport	CIT	Shymkent	0101000020E610000000000040A65E5140000000209E2E4540	Kazakhstan
2916	Uralsk Airport	URA	Oral	0101000020E61000000000004084C54940000000604D934940	Kazakhstan
2917	Pavlodar Airport	PWQ	Pavlodar	0101000020E6100000000000C0BA445340000000C0F5184A40	Kazakhstan
2918	Semipalatinsk Airport	PLX	Semey	0101000020E610000000000060000F544000000060F72C4940	Kazakhstan
2920	Aktobe Airport	AKX	Aqtöbe	0101000020E610000000000020759A4C4000000060761F4940	Kazakhstan
2922	Heydar Aliyev International Airport	GYD	Baku	0101000020E610000000000040FA05494000000000D73B4440	Azerbaijan
2923	Yakutsk Airport	YKS	Yakutsk	0101000020E610000000000000AC38604000000040F10B4F40	Russia
2925	Mirny Airport	MJZ	Mirny	0101000020E6100000000000007F825C400000000071444F40	Russia
2926	Ignatyevo Airport	BQS	Blagoveshchensk	0101000020E6100000000000405EDA5F400000008073364940	Russia
2927	Khabarovsk-Novy Airport	KHV	Khabarovsk	0101000020E61000002100002004E660402C00008095434840	Russia
2930	Sokol Airport	GDX	Magadan	0101000020E6100000000000400AD76240000000A09BF44D40	Russia
2932	Yelizovo Airport	PKC	Yelizovo	0101000020E61000000000002087CE6340000000C07D954A40	Russia
2933	Yuzhno-Sakhalinsk Airport	UUS	Yuzhno-Sakhalinsk	0101000020E6100000000000E0F9D66140000000E0C0714740	Russia
2934	Vladivostok International Airport	VVO	Vladivostok	0101000020E610000000000060BC8460400000006012B34540	Russia
2935	Chita-Kadala Airport	HTA	Chita	0101000020E6100000DD24068195535C40717500C45D034A40	Russia
2936	Bratsk Airport	BTK	Bratsk	0101000020E610000000000000AC6C5940000000E06F2F4C40	Russia
2937	Irkutsk Airport	IKT	Irkutsk	0101000020E6100000ABFEFF5FE5185A40BCFFFFDF4D224A40	Russia
2938	Ulan-Ude Airport (Mukhino)	UUD	Ulan-Ude	0101000020E61000000000004008DC5A400000000066E74940	Russia
2939	Boryspil International Airport	KBP	Kiev	0101000020E6100000000000000BE53E4000000000292C4940	Ukraine
2940	Donetsk International Airport	DOK	Donetsk	0101000020E610000000000080AEDE4240000000C06B094840	Ukraine
2941	Dnipropetrovsk International Airport	DNK	Dnipro	0101000020E610000000000080E08C4140000000C0B82D4840	Ukraine
2942	Simferopol International Airport	SIP	Simferopol	0101000020E610000000000020D0FC404000000080AE864640	Ukraine
2944	Kiev Zhuliany International Airport	IEV	Kiev	0101000020E610000016C1FF56B2733E40257A19C572334940	Ukraine
2945	Lviv International Airport	LWO	Rudne	0101000020E610000000000000C3F437400000000000E84840	Ukraine
2947	Odessa International Airport	ODS	Odessa	0101000020E6100000000000202FAD3E4000000060A1364740	Ukraine
2948	Pulkovo Airport	LED	Saint Petersburg	0101000020E61000000000004033433E400000004070E64D40	Russia
2949	Murmansk Airport	MMK	Murmansk	0101000020E6100000000000401A6040400000006007325140	Russia
2950	Gomel Airport	GME	Gomel	0101000020E61000000000008046043F40000000C074434A40	Belarus
2951	Vitebsk Vostochny Airport	VTB	Vitebsk	0101000020E61000002E0000607F593E40C9FFFF1F31904B40	Belarus
2952	Khrabrovo Airport	KGD	Kaliningrad	0101000020E6100000000000A0B497344000000080EB714B40	Russia
2953	Minsk 1 Airport	MHP	Minsk	0101000020E6100000000000C0298A3B40000000E0A7EE4A40	Belarus
2954	Minsk National Airport	MSQ	Smilavichy	0101000020E610000046000000DC073C40E1FFFFBFF5F04A40	Belarus
2955	Abakan Airport	ABA	Abakan	0101000020E6100000000000E0A3D8564000000060B8DE4A40	Russia
2956	Barnaul Airport	BAX	Barnaul	0101000020E6100000000000C076E254400000000091AE4A40	Russia
2957	Kemerovo Airport	KEJ	Kemerovo	0101000020E610000000000060DC865540000000A092A24B40	Russia
2958	Omsk Central Airport	OMS	Omsk	0101000020E610000000000040DF535240000000A0C67B4B40	Russia
2960	Krasnodar Pashkovsky International Airport	KRR	Krasnodar	0101000020E6100000CBFFFFFFD2954340EEFFFFFF70844640	Russia
2961	Uytash Airport	MCX	Makhachkala	0101000020E6100000000000A07ED34740000000E08C684540	Russia
2962	Mineralnyye Vody Airport	MRV	Mineralnye Vody	0101000020E6100000000000C07B8A454000000020D01C4640	Russia
2963	Stavropol Shpakovskoye Airport	STW	Stavropol’	0101000020E610000000000040700E454000000040FA8D4640	Russia
2964	Rostov-on-Don Airport	ROV	Rostov	0101000020E6100000BB070080B7E8434067F4FFBF0CA14740	Russia
2965	Sochi International Airport	AER	Sochi	0101000020E6100000020000E071FA43404000006096B94540	Russia
2966	Astrakhan Airport	ASF	Astrakhan	0101000020E610000073090080CE0048409BEEFF1F43244740	Russia
2967	Volgograd International Airport	VOG	Volgograd	0101000020E610000000000060392C46400000000029644840	Russia
2968	Chelyabinsk Balandino Airport	CEK	Chelyabinsk	0101000020E6100000D50968226CC04E40C40AB77C24A74B40	Russia
4335	Key Field	MEI	Meridian	0101000020E6100000000000201F3056C0000000A0922A4040	United States
2969	Magnitogorsk International Airport	MQF	Magnitogorsk	0101000020E6100000000000C0BA604D400000002051B24A40	Russia
2972	Nizhnevartovsk Airport	NJC	Nizhnevartovsk	0101000020E610000000000040F31E5340000000A082794E40	Russia
2973	Bolshoye Savino Airport	PEE	Perm	0101000020E6100000F5FFFF9FB6024C40400000600EF54C40	Russia
2974	Surgut Airport	SGC	Surgut	0101000020E610000000000020B759524000000060FEAB4E40	Russia
2975	Koltsovo Airport	SVX	Yekaterinburg	0101000020E6100000370000E0BE664E40BCFFFFDF1D5F4C40	Russia
2976	Ashgabat Airport	ASB	Ashgabat	0101000020E610000000000040352E4D40000000804FFE4240	Turkmenistan
2977	Turkmenbashi Airport	KRW	Türkmenbaşy	0101000020E61000005E4C33DDEB804A40ED66463F1A084440	Turkmenistan
2978	Turkmenabat Airport	CRZ	Türkmenabat	0101000020E6100000000000A080CE4F40000000A0A98A4340	Turkmenistan
2979	Dushanbe Airport	DYU	Dushanbe	0101000020E610000067F4FFBFCC345140D41400E08A454340	Tajikistan
2980	Bukhara Airport	BHK	Bukhara	0101000020E610000000000060EE1E50400000004033E34340	Uzbekistan
2981	Samarkand Airport	SKD	Samarqand	0101000020E6100000000000A0F6BE504000000000AAD94340	Uzbekistan
2983	Tashkent International Airport	TAS	Tashkent	0101000020E61000007AF5FF1FFF51514099EBFFDF02A14440	Uzbekistan
2984	Bryansk Airport	BZK	Bryansk	0101000020E61000009F17004094164140D41400E06A9B4A40	Russia
2985	Sheremetyevo International Airport	SVO	Moscow	0101000020E6100000F775E09C11B54240A88FC01F7EFC4B40	Russia
2986	Migalovo Air Base	KLD	Tver	0101000020E610000000000060FCE04140000000C08F694C40	Russia
2987	Voronezh International Airport	VOZ	Voronezh	0101000020E610000000000080639D4340000000C037E84940	Russia
2988	Vnukovo International Airport	VKO	Moscow	0101000020E6100000441800E078A14240B3F8FF3FB6CB4B40	Russia
2989	Syktyvkar Airport	SCW	Syktyvkar	0101000020E6100000000000402C6C4940000000E0D0D24E40	Russia
2990	Kazan International Airport	KZN	Kazan	0101000020E61000003E000080ACA348400000000098CD4B40	Russia
2991	Orenburg Central Airport	REN	Orenburg	0101000020E61000000000002075BA4B40000000C0DCE54940	Russia
2992	Ufa International Airport	UFA	Ufa	0101000020E6100000D6FFFF5FECEF4B40210000205C474B40	Russia
2993	Kurumoch International Airport	KUF	Samara	0101000020E6100000BEFFFFBF07154940D2FFFF9FA0C04A40	Russia
2994	Sardar Vallabhbhai Patel International Airport	AMD	Ahmedabad	0101000020E610000078F2FFDF9E2852409DF1FF5FC3133740	India
2995	Akola Airport	AKD	Akola	0101000020E610000000000020C0435340000000A0F1B23440	India
2996	Aurangabad Airport	IXU	Aurangabad	0101000020E6100000000000807AD95240000000E0D9DC3340	India
2997	Chhatrapati Shivaji International Airport	BOM	Mumbai	0101000020E61000005D0200A08B375240ABE9FFFFB4163340	India
2998	Bilaspur Airport	PAB	Bilāspur	0101000020E6100000000000A01A875440000000C007FD3540	India
2999	Bhuj Airport	BHJ	Bhuj	0101000020E610000024FFFF7FE46A51406BFAFF3FAD493740	India
3000	Belgaum Airport	IXG	Belgaum	0101000020E610000092FFFF3F92A7524039C0FF1FF6B72F40	India
3001	Vadodara Airport	BDQ	Vadodara	0101000020E6100000DE0300C07B4E52408BF3FF3F11563640	India
3002	Raja Bhoj International Airport	BHO	Bhopal	0101000020E6100000BE0D000098555340492100A099493740	India
3003	Bhavnagar Airport	BHU	Bhavnagar	0101000020E610000054F3FF5FDA0B5240FE1C002090C03540	India
3004	Daman Airport	NMB	Daman	0101000020E610000000000000F7355240000000E0346F3440	India
3005	Deesa Airport	\\N	Dīsa	0101000020E6100000000000E0140D52400000002095443840	India
3006	Guna Airport	\\N	Guna	0101000020E6100000000000203A565340000000609AA73840	India
3007	Dabolim Airport	GOI	Marmagao	0101000020E6100000AC0C00A035755240C0100040F8C22E40	India
3008	Devi Ahilyabai Holkar Airport	IDR	Indore	0101000020E61000002908004045F35240BA2700E0C7B83640	India
3009	Jabalpur Airport	JLR	Jabalpur	0101000020E6100000000000005403544000000040842D3740	India
3010	Jamnagar Airport	JGA	Jamnagar	0101000020E610000000000080CE805140000000002B773640	India
3011	Kandla Airport	IXY	Kāndla	0101000020E61000005BFFFF5F6B8651404A2400E0D91C3740	India
3012	Khajuraho Airport	HJR	Khajuraho Group of Monuments	0101000020E610000055F3FF5FCAFA5340A4DDFFFF33D13840	India
3013	Kolhapur Airport	KLH	Kolhāpur	0101000020E61000002B0B00808592524053D0FFBF29AA3040	India
3014	Keshod Airport	IXK	Keshod	0101000020E6100000000000404E915140000000802D513540	India
3015	Dr. Babasaheb Ambedkar International Airport	NAG	Nagpur	0101000020E61000000000006005C35340000000609A173540	India
3016	Gandhinagar Airport	ISK	Deolāli	0101000020E6100000FEFCFFBFAF735240ABE9FFFFB4F63340	India
3017	Pune Airport	PNQ	Pune	0101000020E610000000000060DC7A52400000008004953240	India
3018	Porbandar Airport	PBD	Porbandar	0101000020E61000007DFBFF9F0F6A51408BF3FF3F11A63540	India
3019	Rajkot Airport	RAJ	Rājkot	0101000020E6100000190D0060E3B151403A2600C0274F3640	India
3020	Raipur Airport	RPR	Bhatgaon	0101000020E610000045F8FF7F486F5440740C00C02E2E3540	India
3021	Solapur Airport	SSE	Solāpur	0101000020E610000020F6FFBFD3FB5240A50000A0C4A03140	India
3022	Surat Airport	STV	Sūrat	0101000020E6100000CC0500A0792F5240282800A0351D3540	India
3023	Maharana Pratap Airport	UDR	Udaipur	0101000020E61000004E0700C0597952408A1300A0219E3840	India
3024	Bandaranaike International Colombo Airport	CMB	Colombo	0101000020E61000000000002095F853400000002019B91C40	Sri Lanka
3025	Anuradhapura Air Force Base	ACJ	Anuradhapura	0101000020E6100000960500C0621B5440660600E05C9A2040	Sri Lanka
3026	Batticaloa Airport	\\N	Batticaloa	0101000020E6100000679DF17D716B5440C24CDBBFB2D21E40	Sri Lanka
3027	Colombo Ratmalana Airport	RML	Colombo	0101000020E610000000000080B7F85340000000C0B7491B40	Sri Lanka
3028	Ampara Airport	GOY	Ampara	0101000020E61000008750A5660F6854407D96E7C1DD591D40	Sri Lanka
3029	Kankesanturai Airport	JAF	Jaffna	0101000020E6100000000000807C04544000000040AC952340	Sri Lanka
3030	China Bay Airport	TRR	Trincomalee	0101000020E610000000000040A44B5440000000A0B7132140	Sri Lanka
3033	Kampong Chhnang Airport	\\N	Kampong Chhnang	0101000020E61000003C4C00A018245A40D997FF9FA9822840	Cambodia
3034	Phnom Penh International Airport	PNH	Phnom Penh	0101000020E61000000000002004365A4000000000DC172740	Cambodia
3035	Siem Reap International Airport	REP	Siem Reap	0101000020E610000043F5FF3F08F459403157004047D22A40	Cambodia
3036	Stung Treng Airport	TNX	Stung Treng	0101000020E6100000000000C0F5805A400000004055102B40	Cambodia
3037	Along Airport	\\N	Along	0101000020E61000000000000054B3574000000080E02C3C40	India
3038	Agartala Airport	IXA	Agartala	0101000020E6100000960500C062CF564019CAFF5F12E33740	India
3039	Lengpui Airport	AJL	Aizawl	0101000020E6100000C9FFFF1FA9275740862D008031D73740	India
3040	Bagdogra Airport	IXB	Bagdogra	0101000020E6100000000000C0071556400000002063AE3A40	India
3041	Bokaro Airport	\\N	Bokāro	0101000020E6100000000000A08789554000000060BCA43740	India
3042	Biju Patnaik Airport	BBI	Bhubaneshwar	0101000020E6100000370000E05674554089F0FFFF903E3440	India
3043	Netaji Subhash Chandra Bose International Airport	CCU	Kolkata	0101000020E6100000000000C0961C5640000000609AA73640	India
3044	Cooch Behar Airport	COH	Koch Bihār	0101000020E610000035FDFF9FE65D564063CBFF9F9B543A40	India
3045	Dhanbad Airport	DBD	Dhanbād	0101000020E610000000000020389B55400000000081D53740	India
3048	Gaya Airport	GAY	Gaya	0101000020E610000000000080E03C5540000000808ABE3840	India
3049	Hirakud Airport	\\N	Hīrākud	0101000020E6100000000000605D0055400000000088943540	India
3050	Imphal Airport	IMF	Imphal	0101000020E61000001DF3FF7F63795740F91300608FC23840	India
3051	Jharsuguda Airport	\\N	Jhārsuguda	0101000020E6100000000000C03903554000000020DBE93540	India
3052	Jamshedpur Airport	IXW	Jamshedpur	0101000020E6100000EDFEFF9FCD8A5540F6CAFFDF2DD03640	India
3053	Jorhat Airport	JRH	Jorhāt	0101000020E61000005BFFFF5F3B8B57409EF4FF9F43BB3A40	India
3054	Kailashahar Airport	IXH	Kailāshahar	0101000020E6100000000000007600574000000040E64E3840	India
3055	Silchar Airport	IXS	Silchar	0101000020E610000098080000A33E57401D1300E0B3E93840	India
3056	North Lakhimpur Airport	IXI	North Lakhimpur	0101000020E6100000000000203F865740000000E0A54B3B40	India
3057	Dibrugarh Airport	DIB	Dibrugarh	0101000020E6100000A70300E014C15740860A00E0E07B3B40	India
3058	Muzaffarpur Airport	\\N	Muzaffarpur	0101000020E6100000000000A013545540000000607D1E3A40	India
3059	Nawapara Airport	\\N	Khamharia	0101000020E61000000000002041A1544000000060B8DE3440	India
3061	Lok Nayak Jayaprakash Airport	PAT	Khagaul	0101000020E61000008FF9FFBFA14555407CF8FF5F5F973940	India
3062	Purnea Airport	\\N	Purnia	0101000020E6100000000000803DDA55400000002075C23940	India
3063	Birsa Munda Airport	IXR	Ranchi	0101000020E6100000B6FEFFBF96545540B2F5FFFF75503740	India
3064	Rourkela Airport	RRK	Bānposh	0101000020E6100000000000602234554000000020B7413640	India
3065	Utkela Airport	\\N	Kesinga	0101000020E610000000000060C3CB544000000040EF183440	India
3066	Vishakhapatnam Airport	VTZ	Gajuwaka	0101000020E6100000710600405ECE5440840700A0A0B83140	India
3067	Zero Airport	\\N	Ziro	0101000020E6100000000000A0FF745740000000E09A963B40	India
3068	Cox's Bazar Airport	CXB	Cox’s Bāzār	0101000020E610000000000080B0FD564000000060C3733540	Bangladesh
3069	Shah Amanat International Airport	CGP	Chittagong	0101000020E6100000000000200DF45640000000C0E53F3640	Bangladesh
3070	Ishurdi Airport	IRD	Ishurdi	0101000020E61000000000006029435640000000400A273840	Bangladesh
3071	Jessore Airport	JSR	Jessore	0101000020E6100000000000804A4A5640000000800D2F3740	Bangladesh
3072	Shah Mokhdum Airport	RJH	Rājshāhi	0101000020E6100000000000C07427564000000060EC6F3840	Bangladesh
3073	Saidpur Airport	SPD	Saidpur	0101000020E6100000000000602B3A5640000000E05AC23940	Bangladesh
3074	Osmany International Airport	ZYL	Sylhet	0101000020E6100000000000A079F756400000004094F63840	Bangladesh
3075	Tejgaon Airport	\\N	Dhaka	0101000020E6100000000000207E985640000000605FC73740	Bangladesh
3076	Dhaka / Hazrat Shahjalal International Airport	DAC	Dhaka	0101000020E6100000E8F9D34675995640022EC896E5D73740	Bangladesh
3077	Chek Lap Kok International Airport	HKG	Hong Kong	0101000020E6100000EC8100608F7A5C4025DFFF1F144F3640	Hong Kong
3078	Shek Kong Air Base	\\N	Yuen Long Kau Hui	0101000020E6100000000000C01E855C4000000000C56F3640	Hong Kong
3079	Agra Airport	AGR	Agra	0101000020E6100000000000607F7D534000000080E2273B40	India
3080	Allahabad Airport	IXD	Allahābād	0101000020E610000000000040F86E544000000060AA703940	India
3081	Sri Guru Ram Dass Jee International Airport	ATQ	Amritsar	0101000020E6100000B801000007B35240C4F6FF5FA8B53F40	India
3082	Nal Airport	\\N	Bīkaner	0101000020E6100000000000C0424D5240000000E012123C40	India
3084	Lal Bahadur Shastri Airport	VNS	Varanasi	0101000020E6100000750C00C0FEB6544086EAFF7FD0733940	India
3085	Kullu Manali Airport	KUU	Kulu	0101000020E6100000000000C0E1495340000000606FE03F40	India
3087	Bhiwani Airport	\\N	Bhiwāni	0101000020E610000000000060760B5340000000A045D63C40	India
3089	Chandigarh Airport	IXC	Chandigarh	0101000020E6100000000000C076325340000000806AAC3E40	India
3091	Safdarjung Airport	\\N	Delhi	0101000020E6100000000000E02B4D5340000000C0A1953C40	India
3092	Dehradun Airport	DED	Dehra Dūn	0101000020E61000004E0A00008A8B5340FE1C002090303E40	India
3093	Indira Gandhi International Airport	DEL	Delhi	0101000020E610000000000040994653400000002006913C40	India
3094	Gwalior Airport	GWL	Gwalior	0101000020E610000000000040948E5340000000C0154B3A40	India
3095	Hissar Airport	\\N	Hisar	0101000020E6100000000000E056F0524000000020ED2D3D40	India
3096	Jhansi Airport	\\N	Jhānsi	0101000020E6100000000000E0BCA3534000000040BF7D3940	India
3097	Jodhpur Airport	JDH	Jodhpur	0101000020E610000000000020214352400000002048403A40	India
3098	Jaipur International Airport	JAI	Jaipur	0101000020E610000059FCFF1FFBF35240F8F0FFBFFED23A40	India
3099	Jaisalmer Airport	JSA	Jaisalmer	0101000020E6100000000000205CB75140000000E081E33A40	India
3100	Jammu Airport	IXJ	Jammu	0101000020E6100000BE0D000098B552402019006034584040	India
3101	Kanpur Airport	KNU	Kanpur	0101000020E6100000000000805A175440000000A0FF703A40	India
3102	Kota Airport	KTU	Kota	0101000020E6100000720600401EF6524099EBFFDF02293940	India
3103	Ludhiana Airport	LUH	Dorāha	0101000020E610000000000060F7FC5240000000A0CDDA3E40	India
3104	Leh Kushok Bakula Rimpochee Airport	IXL	Leh	0101000020E6100000CE0800E0F9625340A806002065114140	India
3105	Chaudhary Charan Singh International Airport	LKO	Lucknow	0101000020E6100000500D0040EA3854402F3400A0B6C23A40	India
3107	Patiala Airport	\\N	Patiāla	0101000020E61000000000000054175340000000C096503E40	India
3108	Pantnagar Airport	PGH	Naini Tāl	0101000020E61000000000002051DE5340000000E08C083D40	India
3109	Fursatganj Airport	\\N	Raebareli	0101000020E6100000000000205A585440000000C09D3F3A40	India
3112	Sheikh ul Alam Airport	SXR	Srinagar	0101000020E6100000000000808CB152400000004059FE4040	India
3113	Satna Airport	TNI	Satna	0101000020E6100000000000A0B6365440000000E0F28F3840	India
3115	Luang Phabang International Airport	LPQ	Luang Prabang	0101000020E6100000000000E04D8A594000000080B5E53340	Laos
3116	Pakse International Airport	PKZ	Pakse	0101000020E6100000000000E0FB715A40000000A0A2432E40	Laos
3117	Phonesavanh Airport	\\N	Muang Phônsavan	0101000020E6100000000000C0F3CD59400000006074743340	Laos
3118	Savannakhet Airport	ZVK	Savannakhét	0101000020E6100000000000E0A3305A40000000607D8E3040	Laos
3119	Sam Neua Airport	\\N	Xam Nua	0101000020E6100000000000C049045A40000000401C6B3440	Laos
3120	Wattay International Airport	VTE	Vientiane	0101000020E610000043F5FF3F08A45940090F004001FD3140	Laos
3121	Macau International Airport	MFM	Macau	0101000020E610000000000060E3655C40000000204C263640	Macao
3122	Gautam Buddha Airport	BWA	Siddharthanagar	0101000020E61000007023658BA4DA5440E813799274813B40	Nepal
3124	Janakpur Airport	\\N	Janakpur	0101000020E6100000C6F9FF9F087B55401C1300E073B53A40	Nepal
3125	Tribhuvan International Airport	KTM	Kathmandu	0101000020E6100000DB000080FB56554026E2FF5F54B23B40	Nepal
3127	Pokhara Airport	PKR	Pokhara	0101000020E6100000000000C0DAFE5440000000206E333C40	Nepal
3128	Simara Airport	SIF	Bīrganj	0101000020E610000000000000BA3E554000000000D5283B40	Nepal
3129	Biratnagar Airport	BIR	Biratnagar	0101000020E610000000000060E5D05540000000A0437B3A40	Nepal
3131	Kempegowda International Airport	BLR	Bengaluru	0101000020E6100000A48CB800346D5340BEC1172653652A40	India
3132	Bellary Airport	BEP	Bellary	0101000020E6100000000000C07F385340000000805A532E40	India
3134	Vijayawada Airport	VGA	Vijayawada	0101000020E6100000000000C0FE32544000000040C8873040	India
3135	Coimbatore International Airport	CJB	Coimbatore	0101000020E610000039030020C74253405A3F00205C0F2640	India
3136	Cochin International Airport	COK	Angamāli	0101000020E610000048FBFFBFB8195340A49AFFFFD24D2440	India
3137	Calicut International Airport	CCJ	Kozhikode	0101000020E61000009FF4FF9F23FD5240D9DAFF9F0A462640	India
3138	Cuddapah Airport	CDP	Cuddapah	0101000020E61000000000008075B15340000000C01E052D40	India
3140	Dundigul Air Force Academy	\\N	Quthbullapur	0101000020E61000008BF3FF3FD1995340FE1C002090A03140	India
3141	Begumpet Airport	BPM	Hyderabad	0101000020E6100000EAF8FF1FED9D53406F230060FE733140	India
3142	Madurai Airport	IXM	Madurai	0101000020E6100000510D0040FA855340A70300E044AB2340	India
3143	Mangalore International Airport	IXE	Mangalore	0101000020E61000003A060060F7B8524086A7FF7F2FEC2940	India
3144	Chennai International Airport	MAA	Chennai	0101000020E6100000000000C0D50A544000000000E2FA2940	India
3145	Nagarjuna Sagar Airport	\\N	Mācherla	0101000020E6100000000000A065D4534000000060EE8A3040	India
3146	Vir Savarkar International Airport	IXZ	Port Blair	0101000020E610000000000060B32E5740000000604B482740	India
3147	Pondicherry Airport	PNY	Puducherry	0101000020E6100000000000A0D8F3534000000080F9EF2740	India
3148	Rajahmundry Airport	RJA	Rājahmundry	0101000020E6100000ECFBFF5F5D7454409BEEFF1F431C3140	India
3149	Salem Airport	\\N	Salem	0101000020E6100000160000C03284534066FFFFBF0C912740	India
3150	Tanjore Air Force Base	\\N	Thanjāvūr	0101000020E6100000000000A080C6534000000060DE712540	India
3151	Tirupati Airport	TIR	Renigunta	0101000020E6100000AA090060C5E25340BFCAFFFFD6432B40	India
3152	Tiruchirapally Civil Airport Airport	TRZ	Tiruchirappalli	0101000020E6100000000000C06BAD534000000080E2872540	India
3153	Trivandrum International Airport	TRV	Thiruvananthapuram	0101000020E6100000160700E0E23A534043FCFF5FD8F62040	India
3155	Paro Airport	PBH	Thimphu	0101000020E6100000E7F2FF9F2C5B564045D8FF1F38673B40	Bhutan
3156	Malé International Airport	MLE	Male	0101000020E6100000000000C0DC615240000000206FC41040	Maldives
3157	Don Mueang International Airport	DMK	Bangkok	0101000020E610000052ADFF1FD92659400203004040D32B40	Thailand
3158	Kamphaeng Saen Airport	\\N	Nakhon Pathom	0101000020E61000001A0D0060B3FA58404EE7FF5F39342C40	Thailand
3159	Khok Kathiam Airport	\\N	Lop Buri	0101000020E6100000FAD3FF9F6E2A5940D35400A0CBBF2D40	Thailand
3161	U-Tapao International Airport	UTP	Ban Chang	0101000020E6100000000000E051405940000000E01B5C2940	Thailand
3162	Watthana Nakhon Airport	\\N	Prachin Buri	0101000020E6100000000000002994594000000020A0892B40	Thailand
3163	Lampang Airport	LPT	Lampang	0101000020E6100000000000E044E05840000000C059453240	Thailand
3164	Phrae Airport	PRH	Phrae	0101000020E6100000000000608F0A5940000000E0D7213240	Thailand
3165	Hua Hin Airport	HHQ	Prachuap Khiri Khan	0101000020E6100000AA090060E5FC5840D93D0000BC452940	Thailand
3166	Takhli Airport	\\N	Nakhon Sawan	0101000020E6100000016600A0F1125940CD280040FA8D2E40	Thailand
3167	Sak Long Airport	\\N	Phetchabun	0101000020E610000000000060105059400000006005D33040	Thailand
3169	Nakhon Sawan Airport	\\N	Nakhon Sawan	0101000020E6100000000000A0C40859400000008093582F40	Thailand
3170	Phitsanulok Airport	PHS	Phitsanulok	0101000020E610000000000020DB115940000000206CC83040	Thailand
3171	Khunan Phumipol Airport	\\N	Tak	0101000020E6100000000000A0B4C3584000000080F43B3140	Thailand
3172	Khoun Khan Airport	\\N	Satun	0101000020E6100000000000C01E0559400000000046A51A40	Thailand
3173	Narathiwat Airport	NAW	Narathiwat	0101000020E6100000000000408D6F5940000000E065141A40	Thailand
3174	Krabi Airport	KBV	Krabi	0101000020E6100000EF0100E01DBF58407E0900E0BF322040	Thailand
3175	Songkhla Airport	\\N	Songkhla	0101000020E610000000000080E9265940000000A009BF1C40	Thailand
3176	Pattani Airport	PAN	Pattani	0101000020E610000000000020DB495940000000A04F241B40	Thailand
3177	Samui Airport	USM	Ko Samui	0101000020E6100000BD0A00C0F70359403E0100E077182340	Thailand
3178	Cha Eian Airport	\\N	Nakhon Si Thammarat	0101000020E610000045F8FF7F28FD584056F6FF9F3AF12040	Thailand
3179	Phuket International Airport	HKT	Phuket	0101000020E6100000C2F3FF1F489458402CF9FF5FF5392040	Thailand
3180	Ranong Airport	UNN	Ranong	0101000020E6100000000000E078A5584000000040248E2340	Thailand
3181	Hat Yai International Airport	HDY	Hat Yai	0101000020E6100000AE5200E0261959405A0A00609BBB1B40	Thailand
3182	Trang Airport	TST	Trang	0101000020E61000000000006076E7584000000020F3081E40	Thailand
3183	Udon Thani Airport	UTH	Udon Thani	0101000020E6100000FAD3FF9F6EB25940D7170020EB623140	Thailand
3184	Sakon Nakhon Airport	SNO	Sakon Nakhon	0101000020E6100000000000C09D075A4000000020F2313140	Thailand
3185	Surin Airport	\\N	Surin	0101000020E61000003AFFFF3FDFDF594075FFFFDF91BC2D40	Thailand
3186	Loei Airport	LOE	Loei	0101000020E610000000000040356E5940000000E068703140	Thailand
3187	Khorat Airport	\\N	Nakhon Ratchasima	0101000020E6100000FF99FF5F0E855940B6FEFFBF76DE2D40	Thailand
3188	Rob Muang Airport	\\N	Roi Et	0101000020E61000000000002058E95940000000C005123040	Thailand
3196	Da Nang International Airport	DAD	Da Nang	0101000020E610000000000060BC0C5B40000000003D0B3040	Vietnam
3197	Gia Lam Air Base	\\N	Hanoi	0101000020E610000000000040B4785A40000000405E0A3540	Vietnam
3198	Kep Air Base	\\N	Bắc Giang	0101000020E61000009F170040B4905A401D36008004653540	Vietnam
3199	Noi Bai International Airport	HAN	Hanoi	0101000020E6100000000000E0A5735A40000000A0A0383540	Vietnam
3200	Nha Trang Air Base	NHA	Nha Trang	0101000020E610000028F38FBE494C5B4014AE47E17A742840	Vietnam
3201	Phu Bai Airport	HUI	Huế	0101000020E6100000E6550000FEEC5A4046FBFFBFC8663040	Vietnam
3204	Phu Quoc International Airport	PQC	Dương Đông	0101000020E6100000166A4DF38EFF5940BBB88D06F0562440	Vietnam
3205	Tan Son Nhat International Airport	SGN	Ho Chi Minh City	0101000020E61000005BBCFF5FBAA95A40D7B4FFBF39A32540	Vietnam
3208	Anisakan Airport	\\N	Pyin Oo Lwin	0101000020E610000000000080FD1958400000002095F43540	Myanmar
3209	Bagan Airport	NYU	Pakokku	0101000020E61000000000006088BB5740000000E0C52D3540	Myanmar
3213	Heho Airport	HEH	Taunggyi	0101000020E610000000000020B0325840000000603BBF3440	Myanmar
3220	Lashio Airport	LSH	Lashio	0101000020E61000000000000024705840000000A057FA3640	Myanmar
3221	Lanywa Airport	\\N	Chauk	0101000020E610000000000080A5B4574000000000BEF03440	Myanmar
3222	Mandalay International Airport	MDL	Mandalay	0101000020E6100000000000E095FE574000000060C3B33540	Myanmar
3223	Myeik Airport	MGZ	Myeik	0101000020E6100000000000A0C6A75840000000802DE12840	Myanmar
3224	Myitkyina Airport	MYT	Myitkyina	0101000020E61000000000008085565840000000A033623940	Myanmar
3226	Momeik Airport	\\N	Mogok	0101000020E6100000000000A04C29584000000020AE173740	Myanmar
3228	Nampong Air Base	\\N	Myitkyina	0101000020E610000024FFFF7FE4525840CB250000BA5A3940	Myanmar
3230	Hpa-N Airport	\\N	Hpa-an	0101000020E6100000000000A02C6B584000000080C9E43040	Myanmar
3233	Pyay Airport	\\N	Pyay	0101000020E61000000000002006D157400000006012D33240	Myanmar
3234	Shante Air Base	\\N	Meiktila	0101000020E61000000000002087FA57400000004013F13440	Myanmar
3235	Sittwe Airport	AKY	Sittwe	0101000020E6100000000000A0D8375740000000A0F8213440	Myanmar
3237	Tachileik Airport	THL	Tachilek	0101000020E6100000000000A0DDFB584000000060DA7B3440	Myanmar
3238	Taungoo Airport	\\N	Taungoo	0101000020E610000000000040AD1958400000004003083340	Myanmar
3239	Yangon International Airport	RGN	Yangon	0101000020E610000034FAFF5F86085840A60300E044E83040	Myanmar
3240	Hasanuddin International Airport	UPG	Maros	0101000020E6100000000000C074E35D40000000E01B3F14C0	Indonesia
3242	Nabire Airport	NBX	Nabire	0101000020E610000000000040DFEF60400000006008F20AC0	Indonesia
3244	Sentani Airport	DJJ	Jayapura	0101000020E6100000000000208390614000000000989D04C0	Indonesia
3247	Jalaluddin Airport	GTO	Gorontalo	0101000020E6100000B7DEFF5F66B65E40BA0B00604763E43F	Indonesia
3249	Mutiara Airport	PLW	Palu	0101000020E6100000000000803DFA5D4000000040B264EDBF	Indonesia
3250	Sam Ratulangi Airport	MDC	Manado	0101000020E6100000000000A0433B5F40000000E0C4C9F83F	Indonesia
3251	Kasiguncu Airport	PSJ	Poso	0101000020E610000070A0FF9F1C2A5E4017C0FFFF01ABF6BF	Indonesia
3252	Pitu Airport	OTI	Tobelo	0101000020E6100000B7DEFF5F660A604085D9FFFF2F5E0040	Indonesia
3253	Sultan Khairun Babullah Airport	TTE	Ternate	0101000020E61000000000004062D85F4000000080F19AEA3F	Indonesia
3254	Bubung Airport	LUW	Luwuk	0101000020E61000000000008068B15E40000000A06A9FF0BF	Indonesia
3256	Pattimura Airport, Ambon	AMQ	Ambon	0101000020E6100000C3360020D9026040E40F00C09CAE0DC0	Indonesia
3260	Rendani Airport	MKW	Manokwari	0101000020E61000000000006091C1604000000060E589ECBF	Indonesia
3261	Dominique Edward Osok Airport	SOQ	Sorong	0101000020E610000077BE9F1A2F696040CFF753E3A59BECBF	Indonesia
3262	Bintulu Airport	BTU	Bintulu	0101000020E6100000BFEDFF9F47415C40ACE5FF1FA5FD0840	Malaysia
3263	Kuching International Airport	KCH	Kuching	0101000020E61000000000004035965B40000000C054C1F73F	Malaysia
3264	Limbang Airport	LMN	Limbang	0101000020E6100000000000E0A3C05C4000000000B33B1340	Malaysia
3265	Marudi Airport	MUR	Miri	0101000020E6100000000000600E955C400000008046B71040	Malaysia
3266	Miri Airport	MYY	Miri	0101000020E6100000000000002B7F5C4000000000BD491140	Malaysia
3267	Sibu Airport	SBW	Sibu	0101000020E6100000000000400AFF5B40000000C0C1170240	Malaysia
3268	Lahad Datu Airport	LDU	Lahad Datu	0101000020E610000000000060BC945D400000002006211440	Malaysia
3269	Kota Kinabalu International Airport	BKI	Kota Kinabalu	0101000020E6100000000000A043035D4000000000B4BF1740	Malaysia
3270	Labuan Airport	LBU	Victoria	0101000020E61000000000000000D05C4000000080E5331540	Malaysia
3271	Tawau Airport	TWU	Tawau	0101000020E61000000000002031885D4000000000D8471140	Malaysia
3272	Brunei International Airport	BWN	Bandar Seri Begawan	0101000020E61000000000006064BB5C4000000060DCC61340	Brunei
3273	Sultan Syarif Kasim Ii (Simpang Tiga) Airport	PKU	Pekanbaru	0101000020E6100000000000E07A5C5940000000A0847DDD3F	Indonesia
3274	Pinang Kampai Airport	DUM	Dumai	0101000020E6100000E2218C9FC65B5940C8CD70033EBFF93F	Indonesia
3275	Soekarno-Hatta International Airport	CGK	Jakarta	0101000020E61000005E0500E0FBA95A402DEEFF5F958018C0	Indonesia
3277	Aek Godang Airport	\\N	Padangsidempuan	0101000020E6100000C443183F8DDB5840D712F241CF66F63F	Indonesia
3278	Minangkabau Airport	\\N	Padang	0101000020E6100000000000E0FB115940000000806C2EE9BF	Indonesia
3279	Soewondo Air Force Base	MES	Medan	0101000020E6100000183F8D7BF3AA5840FB04508C2C790C40	Indonesia
3280	Dr Ferdinand Lumban Tobing Airport	\\N	Sibolga	0101000020E61000001FF6FFBFE3B858408152006021E5F83F	Indonesia
3284	Supadio Airport	PNK	Pontianak	0101000020E610000000000020DB595B40000000807F4AC3BF	Indonesia
3287	Sultan Thaha Airport	DJB	Jambi City	0101000020E61000000000004037E95940000000805435FABF	Indonesia
3288	Fatmawati Soekarno Airport	BKS	Bengkulu	0101000020E61000004C1C7920B29559400D71AC8BDBE80EC0	Indonesia
3289	Sultan Mahmud Badaruddin II Airport	PLM	Palembang	0101000020E610000066FFFFBFCC2C5A40C5FFFFBF9D2F07C0	Indonesia
3292	Lhok Sukon Airport	\\N	Lhokseumawe	0101000020E6100000000000C096505840000000A02D471440	Indonesia
3294	Sultan Iskandar Muda International Airport	BTJ	Banda Aceh	0101000020E6100000C0F5FFB7EBDA574012778CC36B171640	Indonesia
3295	Kluang Airport	\\N	Kluang	0101000020E6100000A17D00E0A5D3594021070040C4540040	Malaysia
3296	Sultan Abdul Halim Airport	AOR	Alor Setar	0101000020E6100000000000E078195940000000E038C21840	Malaysia
3297	Butterworth Airport	\\N	Butterworth	0101000020E61000000000002006195940000000201ADD1540	Malaysia
3298	Sultan Ismail Petra Airport	KBR	Kota Bharu	0101000020E610000000000080C0925940000000C0DAAA1840	Malaysia
3299	Kuantan Airport	KUA	Kuantan	0101000020E61000000000004060CD5940000000A0FF330E40	Malaysia
3300	Kerteh Airport	KTE	Kertih	0101000020E61000000000000054DB5940000000001D261240	Malaysia
3301	Simpang Airport	\\N	Kuala Lumpur	0101000020E610000000000000FE6C594000000060E3E50840	Malaysia
3302	Sultan Azlan Shah Airport	IPH	Ipoh	0101000020E610000000000060E3455940000000E099451240	Malaysia
3303	Senai International Airport	JHB	Johor Bahru	0101000020E610000000000040E1EA594000000040CE42FA3F	Malaysia
3304	Kuala Lumpur International Airport	KUL	Kuala Lumpur	0101000020E610000045FFFF9F706D5940AFFFFF9FF2F60540	Malaysia
3305	Langkawi International Airport	LGK	Kuah	0101000020E610000000000000A3EE5840000000C0A4511940	Malaysia
3306	Malacca Airport	MKZ	Malacca	0101000020E6100000119BFFBF20905940E30C00805C1B0240	Malaysia
3307	Sultan Mahmud Airport	TGG	Kuala Terengganu	0101000020E61000000000008097C65940000000C0D2871540	Malaysia
3308	Penang International Airport	PEN	George Town	0101000020E610000000000060BA1159400000008045301540	Malaysia
3309	Suai Airport	\\N	Suai	0101000020E6100000000000405E525F40000000804B9B22C0	East Timor
3310	Presidente Nicolau Lobato International Airport	DIL	Dili	0101000020E610000042780000AA615F400EFFFFBFC11721C0	East Timor
3311	Cakung Airport	\\N	Baucau	0101000020E610000042780000AA995F409003002062FA20C0	East Timor
3312	Sembawang Air Base	\\N	Singapore	0101000020E61000000000004008F4594000000060DDCDF63F	Singapore
3313	Paya Lebar Air Base	QPG	Singapore	0101000020E6100000000000803DFA5940000000C047C4F53F	Singapore
3314	Tengah Air Base	\\N	Singapore	0101000020E6100000FB39004060ED5940C5AFFF7F3732F63F	Singapore
3315	Seletar Airport	XSP	Singapore	0101000020E6100000000000408DF75940000000C0D3ABF63F	Singapore
3316	Singapore Changi Airport	SIN	Singapore	0101000020E61000000F48C2BE9DFF59400A2E56D4609AF53F	Singapore
3317	Brisbane Archerfield Airport	\\N	Brisbane	0101000020E610000093BFFF7F41206340742C0020FF913BC0	Australia
3319	Alice Springs Airport	ASP	Alice Springs	0101000020E610000000000020DDBC6040000000E083CE37C0	Australia
3320	Brisbane International Airport	BNE	Brisbane	0101000020E610000000000080BE236340000000E05A623BC0	Australia
3321	Gold Coast Airport	OOL	Gold Coast	0101000020E6100000C51900002930634032F7FF1F162A3CC0	Australia
3322	Cairns International Airport	CNS	Cairns	0101000020E6100000C519000029386240192D00C0C3E230C0	Australia
3324	Mount Isa Airport	ISA	Mount Isa	0101000020E610000030F4FFDFA56F614026250060F5A934C0	Australia
3325	Sunshine Coast Airport	MCY	Caloundra	0101000020E61000004C040080E92263400FFBFFDF719A3AC0	Australia
3326	Mackay Airport	MKY	Mackay	0101000020E6100000111E0080C2A56240A8E3FF7FF42B35C0	Australia
3328	Proserpine Whitsunday Coast Airport	PPP	Red Hill	0101000020E6100000D2EEFFFFA991624047DBFF5FB87E34C0	Australia
3329	Rockhampton Airport	ROK	Rockhampton	0101000020E61000009242004033CF62401C330040C46137C0	Australia
3330	Townsville Airport	TSV	Townsville	0101000020E6100000000000E07A586240000000E0A34033C0	Australia
3332	Avalon Airport	AVV	Clifton Springs	0101000020E61000008A330000020F6240551600000B0543C0	Australia
3333	Albury Airport	ABX	Albury	0101000020E6100000000000E0A75E6240000000A0AD0842C0	Australia
3334	Melbourne Essendon Airport	MEB	Melbourne	0101000020E610000000000020DD1C62400000006032DD42C0	Australia
3335	RAAF Base East Sale	\\N	Sale	0101000020E610000028E5FF9FC464624046FBFFBFA80C43C0	Australia
3336	Hobart International Airport	HBA	Hobart	0101000020E61000008C1600E051706240AA090060056B45C0	Australia
3337	Launceston Airport	LST	Launceston	0101000020E6100000C3360020D9666240E5EFFF5FCCC544C0	Australia
3338	Melbourne Moorabbin Airport	MBW	Melbourne	0101000020E6100000000000A04323624000000000E7FC42C0	Australia
3339	Melbourne International Airport	MEL	Melbourne	0101000020E6100000000000E0F91A6240000000C02ED642C0	Australia
3340	RAAF Williams, Point Cook Base	\\N	St Albans	0101000020E6100000000000A0181862400000006052F742C0	Australia
3341	Adelaide International Airport	ADL	Adelaide	0101000020E610000000000000FE506140000000C0F57841C0	Australia
3343	RAAF Base Edinburgh	\\N	Salisbury	0101000020E610000000000040DF53614000000080EB5941C0	Australia
3344	Perth Jandakot Airport	JAD	Perth	0101000020E61000000000004062F85C40000000E07A0C40C0	Australia
3345	Karratha Airport	KTA	Karratha	0101000020E6100000388600E078315D40940500C052B634C0	Australia
3346	Kalgoorlie Boulder Airport	KGI	Kalgoorlie	0101000020E6100000062C0060915D5E4031F7FF1F16CA3EC0	Australia
3347	Kununurra Airport	KNX	Kununurra	0101000020E6100000BA2700E0A7166040A1B7FF1F638E2FC0	Australia
3349	Port Hedland International Airport	PHE	Port Hedland	0101000020E6100000F956006010A85D40BB070080B76034C0	Australia
3350	Adelaide Parafield Airport	\\N	Adelaide	0101000020E610000093BFFF7F41546140D41400E08A6541C0	Australia
3351	Perth International Airport	PER	Perth	0101000020E610000000000060E3FD5C4000000080B7F03FC0	Australia
3353	Christmas Island Airport	XCH	Flying Fish Cove	0101000020E610000000000000296C5A4000000000B5E624C0	Christmas Island
3354	Sydney Bankstown Airport	BWU	Sydney	0101000020E6100000000000C09DDF6240000000C052F640C0	Australia
3355	Canberra International Airport	CBR	Canberra	0101000020E6100000000000803DA662400000008048A741C0	Australia
3356	Coffs Harbour Airport	CFS	Coffs Harbour	0101000020E6100000B9C1FF3FB62363401CD0FFDF12523EC0	Australia
3357	Camden Airport	CDU	Campbelltown	0101000020E6100000000000E0FBD5624000000080280541C0	Australia
3358	Dubbo City Regional Airport	DBO	Dubbo	0101000020E6100000B7DEFF5F66926240651100E0BC1B40C0	Australia
3359	Norfolk Island International Airport	NLK	Kingston	0101000020E6100000000000400CFE644000000040A60A3DC0	Norfolk Island
3360	RAAF Base Richmond	\\N	Richmond	0101000020E61000005A7F4B00FED86240F2785A7EE0CC40C0	Australia
3361	Sydney Kingsford Smith International Airport	SYD	Sydney	0101000020E610000000000000AAE56240000000C019F940C0	Australia
3362	Tamworth Airport	TMW	Tamworth	0101000020E610000056F6FF9F1ADB6240CF2B00807A153FC0	Australia
3364	Beijing Capital International Airport	PEK	Beijing	0101000020E6100000000000A070255D40000000C0400A4440	China
3366	Dongshan Airport	HLD	Hailar	0101000020E61000006EBDFFBFCCF45D40E91800803D9A4840	China
3368	Tianjin Binhai International Airport	TSN	Tianjin	0101000020E6100000B395FFDF24565D40E4EFFF5FEC8F4340	China
3369	Taiyuan Wusu Airport	TYN	Taiyuan	0101000020E61000000000002031285C40000000609ADF4240	China
3370	Guangzhou Baiyun International Airport	CAN	Guangzhou	0101000020E6100000000000E022535C400000006074643740	China
3371	Changsha Huanghua International Airport	CSX	Changsha	0101000020E61000009B510080144E5C40FEDCFF5F6F303C40	China
3372	Guilin Liangjiang International Airport	KWL	Guilin	0101000020E6100000000000007F825B4000000060D5373940	China
3373	Nanning Wuxu Airport	NNG	Nanning	0101000020E610000000000000020B5B4000000080B99B3640	China
3374	Shenzhen Bao'an International Airport	SZX	Shenzhen	0101000020E610000000000060E7735C4000000020A9A33640	China
3375	Zhengzhou Xinzheng International Airport	CGO	Zhengzhou	0101000020E610000097080000D3755C402A0B008085424140	China
3376	Wuhan Tianhe International Airport	WUH	Wuhan	0101000020E6100000000000E04F8D5C4000000020A7C83E40	China
3377	Pyongyang Sunan International Airport	FNJ	Pyongyang	0101000020E6100000AB984A3FE16A5F40AC8C463EAF9C4340	North Korea
3378	Lanzhou Zhongchuan Airport	LHW	Lanzhou	0101000020E6100000E4720020AEE7594011FEFF1FF2414240	China
3379	Xi'an Xianyang International Airport	XIY	Xi’an	0101000020E6100000000000C020305B40000000A03A394140	China
3380	Chinggis Khaan International Airport	ULN	Ulan Bator	0101000020E61000000000008016B15A40000000C0EAEB4740	Mongolia
3381	Xishuangbanna Gasa Airport	JHG	Jinghong	0101000020E6100000000000E0A33059400000008051F93540	China
3382	Kunming Changshui International Airport	KMG	Kunming	0101000020E610000010429B7777BB5940A6023807191A3940	China
3383	Xiamen Gaoqi International Airport	XMN	Xiamen	0101000020E61000000000002031885D40000000A0438B3840	China
3384	Nanchang Changbei International Airport	KHN	Nanchang	0101000020E6100000000000A099F95C40000000A070DD3C40	China
3385	Fuzhou Changle International Airport	FOC	Fuzhou	0101000020E6100000000000A06EEA5D40000000C062EF3940	China
3386	Hangzhou Xiaoshan International Airport	HGH	Hangzhou	0101000020E6100000000000A0C61B5E4000000080C03A3E40	China
3387	Ningbo Lishe International Airport	NGB	Ningbo	0101000020E610000000000060915D5E40000000A0A2D33D40	China
3388	Nanjing Lukou Airport	NKG	Nanjing	0101000020E6100000000000002BB75D40000000C0F3BD3F40	China
3389	Hefei Luogang International Airport	HFE	Hefei	0101000020E61000000000006012535D4000000020AEC73F40	China
3390	Liuting Airport	TAO	Qingdao	0101000020E610000007A9FF9FEF175E40FA1600A00F224240	China
3391	Shanghai Hongqiao International Airport	SHA	Shanghai	0101000020E61000000000000081555E40000000A0A9323F40	China
3392	Yantai Laishan Airport	YNT	Yantai	0101000020E6100000000000E0CE575E40000000E06AB34240	China
3393	Chongqing Jiangbei International Airport	CKG	Chongqing	0101000020E61000000000008016A95A40000000801DB83D40	China
3394	Longdongbao Airport	KWE	Guiyang	0101000020E6100000000000A043B35A4000000020DB893A40	China
3395	Chengdu Shuangliu International Airport	CTU	Chengdu	0101000020E6100000000000A09BFC5940000000A018943E40	China
3396	Xichang Qingshan Airport	XIC	Xichang	0101000020E6100000000000A0C68B5940000000A035FD3B40	China
3397	Kashgar Airport	KHG	Kashgar	0101000020E61000003C0900A047015340F1E4FFBF7DC54340	China
3398	Hotan Airport	HTN	Hotan	0101000020E6100000000000805AF75340000000A0ED844240	China
3399	Ürümqi Diwopu International Airport	URC	Ürümqi	0101000020E61000000000004059DE5540000000E01BF44540	China
3400	Taiping Airport	HRB	Harbin	0101000020E61000000000000000905F40000000A0CBCF4640	China
3402	Mudanjiang Hailang International Airport	MDG	Mudanjiang	0101000020E6100000ACECFF3F35326040B0F2FFBF15434640	China
3404	Zhoushuizi Airport	DLC	Dalian	0101000020E6100000000000007F625E40000000009C7B4340	China
3406	Shanghai Pudong International Airport	PVG	Shanghai	0101000020E61000000000002085735E40000000E0B5243F40	China
3408	Sultan Abdul Aziz Shah International Airport	SZB	Kuala Lumpur	0101000020E6100000000000E022635940000000806D0B0940	Malaysia
3409	Noto Airport	NTQ	Nanao	0101000020E6100000CADFFFBFC81E614022FCFF3F84A54240	Japan
3410	Borg El Arab International Airport	HBE	Alexandria	0101000020E61000000000004047B23D4000000060EEEA3E40	Egypt
3415	Hilo International Airport	ITO	Hilo	0101000020E610000000000040896163C0000000A0ADB83340	United States
3416	Orlando Executive Airport	ORL	Orlando	0101000020E61000001F0000404E5554C0490000E0A58B3C40	United States
3422	Bryant Army Heliport	FRN	Elmendorf Air Force Base	0101000020E610000052D90B60E5B462C02963F85F19A24E40	United States
3425	Laurence G Hanscom Field	BED	Bedford	0101000020E61000008FCCFAFF7ED251C0747DFEFF283C4540	United States
3433	Marina Municipal Airport	OAR	Marina	0101000020E61000003CA1D79FC4705EC05885F67F48574240	United States
3434	Sacramento Mather Airport	MHR	Sacramento	0101000020E6100000A374E95F12535EC0C6ECFA3FE6464340	United States
3435	Bicycle Lake Army Air Field	BYS	Fort Irwin	0101000020E61000001C8DFFDF51285DC0BDEAFF5FE7A34140	United States
3436	Twentynine Palms (Self) Airport	NXP	Twentynine Palms	0101000020E61000007C3727405E0A5DC0760A03E0E9254140	United States
3437	Fort Smith Regional Airport	FSM	Fort Smith	0101000020E610000000000080839757C0000000C015AB4140	United States
3438	Merrill Field	MRI	Anchorage	0101000020E61000000000000002BB62C000000000549B4E40	United States
3439	Grants-Milan Municipal Airport	GNT	Grants	0101000020E61000005BBCFF5FBAF95AC0D00B00206A954140	United States
3440	Ponca City Regional Airport	PNC	Ponca City	0101000020E610000095250020634658C0F242F81FB25D4240	United States
3441	Hunter Army Air Field	SVN	Georgetown	0101000020E6100000C7D40220534954C01DB5FC9F47014040	United States
3442	Grand Forks International Airport	GFK	Grand Forks	0101000020E6100000A7B05241454B58C011902FA182F94740	United States
3443	Grider Field	PBF	Pine Bluff	0101000020E6100000860A00E0E0FB56C0C2F3FF1F28164140	United States
3444	Whiting Field Naval Air Station - North	NSE	Milton	0101000020E61000007E86FDBF66C155C03D49152065B93E40	United States
3445	Hana Airport	HNM	Makawao	0101000020E6100000000000C0728063C000000080ACCB3440	United States
3446	Ernest A. Love Field	PRC	Prescott	0101000020E61000003F582140E11A5CC0AC81F79FC6534140	United States
3447	Trenton Mercer Airport	TTN	Ewing	0101000020E61000000000006010B452C0000000E06A234440	United States
3448	General Edward Lawrence Logan International Airport	BOS	Winthrop	0101000020E61000004E25034055C051C0900BF75FA12E4540	United States
3449	Travis Air Force Base	SUU	Fairfield	0101000020E6100000A0FEFFFF537B5EC0DBFFFF1FA0214340	United States
3450	Griffiss International Airport	RME	Rome	0101000020E61000007749FF3F0CDA52C01678FE1FED9D4540	United States
3452	Mobile Downtown Airport	BFM	Mobile	0101000020E6100000DD0300C05B0456C0B2F5FFFF75A03E40	United States
3453	Metropolitan Oakland International Airport	OAK	Alameda	0101000020E6100000000000E0248E5EC00000008053DC4240	United States
3454	Eppley Airfield	OMA	Omaha	0101000020E6100000000000E038F957C000000040CFA64440	United States
3455	Port Angeles Cgas Airport	NOW	Port Angeles	0101000020E6100000000000007FDA5EC0000000A01C124840	United States
3456	Kahului Airport	OGG	Kahului	0101000020E610000000000080C28D63C0000000A00AE63440	United States
3457	Wichita Mid Continent Airport	ICT	Wichita	0101000020E6100000000000E0B75B58C0000000E02FD34240	United States
3458	Kansas City International Airport	MCI	Parkville	0101000020E610000082AB3C81B0AD57C012A5BDC117A64340	United States
3459	Dane County Regional Truax Field	MSN	Monona	0101000020E6100000000000A0995556C000000040E8914540	United States
3461	Boone County Airport	HRO	Harrison	0101000020E6100000000000A0E64957C0000000E078214240	United States
3462	Phoenix Sky Harbor International Airport	PHX	Phoenix	0101000020E6100000000000A0C4005CC00000002097B74040	United States
3463	Bangor International Airport	BGR	Bangor	0101000020E6100000000000A0FF3451C0000000E058674640	United States
3464	Fort Lauderdale Executive Airport	FXE	Fort Lauderdale	0101000020E610000067F4FFBFEC0A54C00F1B004082323A40	United States
3465	East Texas Regional Airport	GGG	Longview	0101000020E61000000000004089AD57C0000000E026314040	United States
3466	Anderson Regional Airport	AND	Centerville	0101000020E6100000B7FEFFBF66AD54C0760F00004F3F4140	United States
3467	Spokane International Airport	GEG	Spokane	0101000020E6100000000000002D625DC0000000E058CF4740	United States
3468	North Perry Airport	HWO	Hollywood	0101000020E61000003D0900A0670F54C0F30A00A04E003A40	United States
3469	San Francisco International Airport	SFO	San Francisco	0101000020E61000000000000000985EC0000000603BCF4240	United States
3471	Acadiana Regional Airport	ARA	New Iberia	0101000020E61000006E3315E291F856C0EFC9C342AD093E40	United States
3472	Gainesville Regional Airport	GNV	Gainesville	0101000020E6100000A8060020659154C0D10E0060AAB03D40	United States
3473	Memphis International Airport	MEM	Southaven	0101000020E610000000000040827E56C0000000606D854140	United States
3474	Bisbee Douglas International Airport	DUG	Douglas	0101000020E6100000BA2700E0A7665BC0FF1F006010783F40	United States
3476	TSTC Waco Airport	CNW	Waco	0101000020E610000070030000BE4458C0B31B00E046A33F40	United States
3477	Annette Island Airport	ANN	Ketchikan	0101000020E6100000000000E04D7260C0000000606D854B40	United States
3478	Caribou Municipal Airport	CAR	Caribou	0101000020E610000029080040250151C06AFAFF3F8D6F4740	United States
3479	Little Rock Air Force Base	LRF	Jacksonville	0101000020E6100000A60000A0940957C0E51200005D754140	United States
3480	Redstone Army Air Field	HUA	Madison	0101000020E61000002658FBBFD3AB55C052AEF89FDF564140	United States
3481	Pope Field	POB	Fort Bragg	0101000020E6100000070000A0EDC053C000000000E0954140	United States
3482	Dalhart Municipal Airport	DHT	Dalhart	0101000020E61000001AAAFFFF01A359C024FFFF7FE4024240	United States
3483	Laughlin Air Force Base	DLF	Del Rio	0101000020E6100000541300C0CA3159C043F5FF3F085C3D40	United States
3484	Los Angeles International Airport	LAX	Los Angeles	0101000020E61000003957DE9F1C9A5DC0290C04E0A3F84040	United States
3485	Anniston Metropolitan Airport	ANB	Anniston	0101000020E6100000FCCDFE1FEB7655C0B6B509204ACB4040	United States
3486	Cleveland Hopkins International Airport	CLE	Fairview Park	0101000020E6100000180A0020637654C0150400A0B2B44440	United States
3487	Dover Air Force Base	DOV	Dover	0101000020E6100000592E0200D3DD52C0490BFA7F93904340	United States
3488	Cincinnati Northern Kentucky International Airport	CVG	Cincinnati	0101000020E61000006BFAFF3FBD2A55C07AF5FF1F3F864340	United States
3489	Tipton Airport	FME	Fort Meade	0101000020E61000004F0A00009A3053C0F1070060EE8A4340	United States
3490	China Lake Naws (Armitage Field) Airport	NID	Ridgecrest	0101000020E61000008712D2BF496C5DC0CA1EFC1FBBD74140	United States
3491	Huron Regional Airport	HON	Huron	0101000020E6100000000000C09F8E58C0000000404E314640	United States
3492	Juneau International Airport	JNU	Juneau	0101000020E6100000000000A06ED260C0000000A0702D4D40	United States
3493	Lafayette Regional Airport	LFT	Lafayette	0101000020E6100000A0D3FBDF34FF56C034FD0A808E343E40	United States
3494	Newark Liberty International Airport	EWR	Elizabeth	0101000020E610000000000000CC8A52C0000000E0A3584440	United States
3495	Boise Air Terminal/Gowen field	BOI	Boise	0101000020E610000059411DA0450E5DC0C2A201403EC84540	United States
3497	Garden City Regional Airport	GCK	Garden City	0101000020E6100000BE87FFFF552E59C041120060B8F64240	United States
3498	Minot International Airport	MOT	Minot	0101000020E610000000000080EB5159C00000000034214840	United States
3499	Wheeler Army Airfield	HHI	Wahiawā	0101000020E6100000E47107A047C163C03BFB0CA0C67B3540	United States
3500	Maxwell Air Force Base	MXF	Montgomery	0101000020E610000000000040699755C0000000E002314040	United States
3501	Robinson Army Air Field	\\N	Sherwood	0101000020E610000037470480361357C03CF7FD1FD06C4140	United States
3502	Dallas Love Field	DAL	University Park	0101000020E6100000000000E0833658C0000000C06D6C4040	United States
3503	Butts AAF (Fort Carson) Air Field	FCS	Fort Carson	0101000020E6100000A8FC10C072305AC03F02FBBFD5564340	United States
3504	Helena Regional Airport	HLN	Helena	0101000020E610000000000080E9FE5BC0000000A0AB4D4740	United States
3505	Miramar Marine Corps Air Station - Mitscher Field	NKX	Miramar	0101000020E6100000CE39D3DF26495DC027FDF7BF276F4040	United States
3506	Luke Air Force Base	LUF	Phoenix	0101000020E61000009525002083185CC057F9FFDF7AC44040	United States
3507	Hurlburt Field	\\N	Wright	0101000020E6100000000000801DAC55C000000040846D3E40	United States
3508	Jack Northrop Field Hawthorne Municipal Airport	HHR	Hawthorne	0101000020E6100000554CA59F70955DC03868AF3E1EF64040	United States
3509	Houlton International Airport	HUL	Saint Helens	0101000020E61000008FF9FFBFB1F250C00C1500C0C10F4740	United States
3510	Vance Air Force Base	END	Enid	0101000020E61000003E0C00E0A77A58C0D41400E06A2B4240	United States
3511	Point Mugu Naval Air Station (Naval Base Ventura Co)	NTD	Port Hueneme	0101000020E6100000FCB6FF7FBEC75DC02E110000660F4140	United States
3512	Edwards Air Force Base	EDW	Rosamond	0101000020E610000038A4518193785DC0626A4B1DE4734140	United States
3513	Lake Charles Regional Airport	LCH	Lake Charles	0101000020E6100000000000804A4E57C00000002048203E40	United States
3514	Kona International At Keahole Airport	KOA	Kalaoa	0101000020E6100000000000E0788163C00000000022BD3340	United States
3515	Myrtle Beach International Airport	MYR	Myrtle Beach	0101000020E61000004A01004069BB53C08204006000D74040	United States
3516	Lemoore Naval Air Station (Reeves Field) Airport	NLC	Lemoore	0101000020E61000005D8B16A0EDFC5DC0C054F9BF9F2A4240	United States
3517	Nantucket Memorial Airport	ACK	Nantucket	0101000020E61000009996FD5FDA8351C0676902A065A04440	United States
3518	Felker Army Air Field	FAF	Newport News	0101000020E610000036FDFF9FF62653C0AFF2FFBFF5904240	United States
3519	Campbell AAF (Fort Campbell) Air Field	HOP	Hopkinsville	0101000020E610000090F9FFBFC1DF55C028E5FF9F94554240	United States
3520	Ronald Reagan Washington National Airport	DCA	Washington, D.C.	0101000020E6100000118AADA0694253C0F775E09C116D4340	United States
3521	Patuxent River Naval Air Station/Trapnell Field Aiport	NHK	Lexington Park	0101000020E6100000523000E05A1A53C0E61604A09B244340	United States
3522	Palacios Municipal Airport	PSX	Port Lavaca	0101000020E61000001D000060101058C09FFFFF7F3DBA3C40	United States
3523	Arkansas International Airport	BYH	Blytheville	0101000020E6100000D6F4FF7F6A7C56C0F00400206EFB4140	United States
3524	Atlantic City International Airport	ACY	Atlantic City	0101000020E6100000000000E0F0A452C0000000A092BA4340	United States
3525	Tinker Air Force Base	TIK	Oklahoma City	0101000020E610000023000000BE5858C0CDFFFFDF14B54140	United States
3527	Pueblo Memorial Airport	PUB	Pueblo	0101000020E6100000000000E0CE1F5AC00000004001254340	United States
3528	Northern Maine Regional Airport at Presque Isle	PQI	Presque Isle	0101000020E610000083F7FAFFDD0251C01189082031584740	United States
3530	Gray Army Air Field	GRF	Fort Lewis	0101000020E6100000BE9B13202FA55EC03B0FF63F238A4740	United States
3531	Kodiak Airport	ADQ	Kodiak	0101000020E6100000B73302E0CE0F63C00000000000E04C40	United States
3532	Upolu Airport	UPP	Waimea	0101000020E610000000000020857B63C0000000C0EA433440	United States
3533	Fort Lauderdale Hollywood International Airport	FLL	Fort Lauderdale	0101000020E6100000000000E0C50954C0000000E095123A40	United States
3534	Davis Field	MKO	Muskogee	0101000020E61000009957010078D757C043F5FF3F08D44140	United States
3535	Falls International Airport	INL	International Falls	0101000020E610000000000060CC5957C00000004079484840	United States
3536	Salt Lake City International Airport	SLC	Salt Lake City	0101000020E61000000000008097FE5BC000000040EA644440	United States
3537	Childress Municipal Airport	CDS	Childress	0101000020E6100000FAD3FF9F6E1259C0331A00C086374140	United States
3538	Keesler Air Force Base	BIX	Biloxi	0101000020E6100000CA020060293B56C083E4FFFF0F693E40	United States
3539	Lawson Army Air Field (Fort Benning)	LSF	Columbus	0101000020E61000008DF6FF7F713F55C0E7F2FF9F2C2B4040	United States
3541	Marshall Army Air Field	FRI	Junction City	0101000020E6100000CE1101A0ED3058C03708082014874340	United States
3542	Harrisburg International Airport	MDT	Middletown	0101000020E6100000DC000080DB3053C0A50000A0C4184440	United States
3543	Lincoln Airport	LNK	Lincoln	0101000020E6100000000000C0963058C0000000A0ED6C4440	United States
3544	Capital City Airport	LAN	Waverly	0101000020E610000000000000982555C000000080AC634540	United States
3545	Waimea Kohala Airport	MUE	Waimea	0101000020E610000000000040607563C00000004055003440	United States
3546	Massena International Richards Field	MSS	Massena	0101000020E6100000000000401EB652C000000040C8774640	United States
3547	Hickory Regional Airport	HKY	Hickory	0101000020E6100000CE1101A0ED5854C0B340FD5FDCDE4140	United States
3548	Albert Whitted Airport	SPG	St. Petersburg	0101000020E6100000000000C020A854C0000000A0DDC33B40	United States
3549	Page Field	FMY	Fort Myers	0101000020E610000001030040407754C0D81A00602B963A40	United States
3550	George Bush Intercontinental Houston Airport	IAH	Houston	0101000020E610000000000080D9D557C0000000A001FC3D40	United States
3552	Andrews Air Force Base	ADW	Camp Springs	0101000020E6100000E9F5FFDF7C3753C043F5FF3FC8674340	United States
3553	Smith Reynolds Airport	INT	Winston-Salem	0101000020E610000000000040350E54C0000000201D114240	United States
3554	Southern California Logistics Airport	VCV	Victorville	0101000020E61000009525002083585DC057F9FFDF7A4C4140	United States
3555	Bob Sikes Airport	CEW	Crestview	0101000020E6100000D00B00206AA155C07CF8FF5F5FC73E40	United States
3556	Wheeler Sack Army Air Field	GTB	Fort Drum	0101000020E61000007749FF3F0CEE52C01451FADF1D074640	United States
3557	St Clair County International Airport	PHN	Port Huron	0101000020E61000005EC60380D9A154C0E61604A09B744540	United States
3558	Meadows Field	BFL	Bakersfield	0101000020E61000007CF9F8DFA5C35DC0DC4C014080B74140	United States
3559	El Paso International Airport	ELP	El Paso	0101000020E61000002E7C332031985AC0BEF207A0A4CE3F40	United States
3560	Valley International Airport	HRL	Harlingen	0101000020E6100000000000C0E16958C0000000007F3A3A40	United States
3561	Columbia Metropolitan Airport	CAE	Oak Grove	0101000020E6100000000000E0A54754C0000000A02AF84040	United States
3562	Davis Monthan Air Force Base	DMA	Tucson	0101000020E61000009525002083B85BC0FC1900E04F154040	United States
3563	Pensacola Naval Air Station/Forrest Sherman Field	NPA	Pensacola	0101000020E610000097B2040064D455C039EC00804A5A3E40	United States
3564	Pensacola Regional Airport	PNS	Pensacola	0101000020E6100000EAFFFF3FF1CB55C0390000C030793E40	United States
3565	Grand Forks Air Force Base	RDR	Grand Forks	0101000020E61000006BFAFF3FAD5958C0AA09006005FB4740	United States
3566	William P Hobby Airport	HOU	Houston	0101000020E61000005EC60380D9D157C00D6BF0DF38A53D40	United States
3567	Buckley Air Force Base	BKF	Aurora	0101000020E6100000119BFFBF20305AC08CF3FF3FD1D94340	United States
3569	Palmer Municipal Airport	PAQ	Palmer	0101000020E610000000000020D9A262C0000000A025CC4E40	United States
3570	Pittsburgh International Airport	PIT	Pittsburgh	0101000020E61000005D6003E0E70E54C0655AF67FE93E4440	United States
3572	Ellington Airport	EFD	Houston	0101000020E61000004D0700C029CA57C0BF0D0000789B3D40	United States
3573	Whidbey Island Naval Air Station /Ault Field/ Airport	NUW	Oak Harbor	0101000020E610000008CFDFDFFBA95EC08B5BFDBF072D4840	United States
3574	Alice International Airport	ALI	Alice	0101000020E610000048FBFFBFB88158C0D91D00A0ABBD3B40	United States
3575	Moody Air Force Base	VAD	Valdosta	0101000020E6100000D00B00205ACC54C00C1500C0C1F73E40	United States
3576	Miami International Airport	MIA	Miami Springs	0101000020E610000000000040991254C0000000200FCB3940	United States
3577	Seattle Tacoma International Airport	SEA	Seattle	0101000020E6100000000000A0C6935EC0000000E078B94740	United States
3578	Lovell Field	CHA	Chattanooga	0101000020E6100000000000000B4D55C0000000C084844140	United States
3579	Igor I Sikorsky Memorial Airport	BDR	Stratford	0101000020E6100000000000A0134852C0000000A0ED944440	United States
3580	Jackson-Medgar Wiley Evers International Airport	JAN	Flowood	0101000020E6100000DC000080DB8456C02DEEFF5FD5274040	United States
3581	Scholes International At Galveston Airport	GLS	Galveston	0101000020E6100000000000C010B757C0000000C0EA433D40	United States
3582	Long Beach /Daugherty Field/ Airport	LGB	Signal Hill	0101000020E6100000A7BEE25FBA895DC067E7FA5FAAE84040	United States
3584	Williamsport Regional Airport	IPT	Williamsport	0101000020E610000000000040F33A53C000000040F39E4440	United States
3585	Indianapolis International Airport	IND	Indianapolis	0101000020E61000000936AE7FD79255C0DDB5847CD0DB4340	United States
3586	Whiteman Air Force Base	SZL	Warrensburg	0101000020E6100000F3FFFFBF106357C0D4FFFF7F7A5D4340	United States
3587	Akron Fulton International Airport	AKC	Akron	0101000020E61000008FF9FFBFE15D54C067F4FFBFCC844440	United States
3588	Greenwood–Leflore Airport	GWO	Greenwood	0101000020E6100000DE0300C06B8556C02908004045BF4040	United States
3589	Westchester County Airport	HPN	White Plains	0101000020E610000000000060496D52C00000008093884440	United States
3590	Francis S Gabreski Airport	FOK	Riverhead	0101000020E61000007CF8FF5F6F2852C075ECFF5FFE6B4440	United States
3591	Jonesboro Municipal Airport	JBR	Jonesboro	0101000020E6100000000000A05EA956C00000002075EA4140	United States
3593	Palm Beach County Park Airport	LNA	West Palm Beach	0101000020E610000028A60340720554C0EF76F7DFCE973A40	United States
3594	North Island Naval Air Station-Halsey Field	NZY	San Diego	0101000020E6100000B450D77FC24D5DC0A17C07607F594040	United States
3595	Biggs Army Air Field (Fort Bliss)	BIF	El Paso	0101000020E61000005F0432E051985AC063A110E078D93F40	United States
3596	Yuma MCAS/Yuma International Airport	YUM	Yuma	0101000020E610000034D2F7BFC8A65CC0E262FB7F0B544040	United States
3597	Cavern City Air Terminal	CNM	Carlsbad	0101000020E610000000000000D5105AC000000040332B4040	United States
3598	Duluth International Airport	DLH	Hermantown	0101000020E610000020F9FFFF630C57C0CE0800E0C96B4740	United States
3599	Bethel Airport	BET	Bethel	0101000020E61000004264ECDFD03A64C04EA70A80D0634E40	United States
3600	Bowman Field	LOU	Saint Matthews	0101000020E61000004F0A00007A6A55C0F71000202F1D4340	United States
3601	Sierra Vista Municipal Libby Army Air Field	FHU	Sierra Vista	0101000020E61000000000002004965BC0000000E0A7963F40	United States
3602	Lihue Airport	LIH	Lihue	0101000020E610000000000020D9EA63C000000020DBF93540	United States
3603	Terre Haute International Hulman Field	HUF	Terre Haute	0101000020E6100000000000C0AFD355C0000000C0CAB94340	United States
3604	Havre City County Airport	HVR	Havre	0101000020E61000003CA1D79FC4705BC07133050081454840	United States
3605	Grant County International Airport	MWH	Moses Lake	0101000020E6100000B58E05E07AD45DC0ADA8FBDF959A4740	United States
3606	Edward F Knapp State Airport	MPV	Montpelier	0101000020E6100000619204C0FC2352C07749FF3F0C1A4640	United States
3608	Richmond International Airport	RIC	Fort Lee	0101000020E610000000000000765453C000000060AAC04240	United States
3609	Shreveport Regional Airport	SHV	Shreveport	0101000020E6100000000000A0D67457C0000000402A394040	United States
3611	Norfolk International Airport	ORF	Norfolk	0101000020E610000000000080E00C53C00000004082724240	United States
3612	Southeast Texas Regional Airport	BPT	Nederland	0101000020E610000000000020538157C0000000A067F33D40	United States
3613	Savannah Hilton Head International Airport	SAV	Port Wentworth	0101000020E61000009DC8FE3FEF4C54C08768F83F55104040	United States
3614	Hill Air Force Base	HIF	South Weber	0101000020E6100000828C800A47FE5BC087DC0C37E08F4440	United States
3616	Scappoose Industrial Airpark	\\N	San Luis	0101000020E6100000000000002BB75EC000000020B0E24640	United States
3617	St Petersburg Clearwater International Airport	PIE	St. Petersburg	0101000020E610000030490260FEAB54C01C3704E002E93B40	United States
3618	Menominee Marinette Twin County Airport	MNM	Menominee	0101000020E610000000000080DBE855C0000000C037904640	United States
3619	Lone Star Executive Airport	CXO	Conroe	0101000020E61000003903002087DA57C0FA1600A00F5A3E40	United States
3621	San Antonio International Airport	SAT	San Antonio	0101000020E610000000000040119E58C0000000A0A0883D40	United States
3622	Greater Rochester International Airport	ROC	Rochester	0101000020E6100000000000A0086B53C000000020388F4540	United States
3623	Patrick Air Force Base	COF	South Patrick Shores	0101000020E61000005E0500E00B2754C0901C0060223C3C40	United States
3624	Teterboro Airport	TEB	Little Ferry	0101000020E6100000A2FAFF1FE48352C003E6FF1FD06C4440	United States
3625	Ellsworth Air Force Base	RCA	Rapid City	0101000020E6100000ECD918E0A7C659C06FCD04608F124640	United States
3626	Raleigh Durham International Airport	RDU	Morrisville	0101000020E61000000000006066B253C00000004055F04140	United States
3627	James M Cox Dayton International Airport	DAY	Vandalia	0101000020E6100000000000A00A0E55C0000000E081F34340	United States
3628	Kenai Municipal Airport	ENA	Kenai	0101000020E610000000000000D7E762C0000000605B494E40	United States
3629	Mc Alester Regional Airport	MLC	McAlester	0101000020E6100000D282FEDF24F257C03C36FA7FF2704140	United States
3630	Niagara Falls International Airport	IAG	Niagara Falls	0101000020E6100000000000808EBC53C000000000BC8D4540	United States
3631	Coulter Field	CFD	Bryan	0101000020E6100000AC0C00A0351558C045D8FF1F38B73E40	United States
3632	Wright Aaf (Fort Stewart)/Midcoast Regional Airport	\\N	Wright	0101000020E6100000619204C0FC6354C0694DFBFF9BE33F40	United States
3633	Newport News Williamsburg International Airport	PHF	Newport News	0101000020E6100000E77C04408D1F53C0ECAE0520E2904240	United States
3634	Esler Regional Airport	ESF	Pineville	0101000020E6100000F2070060EE1257C03F0F002018653F40	United States
3635	Altus Air Force Base	LTS	Altus	0101000020E61000000EF8FF9F11D158C01DF3FF7F63554140	United States
3636	Tucson International Airport	TUS	Tucson	0101000020E61000000000006039BC5BC000000060DC0E4040	United States
3637	Minot Air Force Base	MIB	Minot	0101000020E6100000655AF67FE95659C0CE8FF95F32354840	United States
3638	Beale Air Force Base	BAB	Linda	0101000020E6100000BD0A00C0F75B5EC061E8FFBF6B914340	United States
3639	Greater Kankakee Airport	IKK	Kankakee	0101000020E61000004D0700C029F655C09DF4FF9F23894440	United States
3640	Seymour Johnson Air Force Base	GSB	Goldsboro	0101000020E61000006B9B03807A7D53C05B7C0A8071AB4140	United States
3641	Theodore Francis Green State Airport	PVD	Warwick	0101000020E6100000000000E0E7DA51C0000000E0C5DD4440	United States
3642	Salisbury Ocean City Wicomico Regional Airport	SBY	Salisbury	0101000020E6100000000000C0A8E052C000000080952B4340	United States
3643	Rancho Murieta Airport	RIU	Rancho Murieta	0101000020E61000000000008097465EC0000000804F3E4340	United States
3644	Bob Hope Airport	BUR	North Hollywood	0101000020E6100000000000E0F9965DC000000080B0194140	United States
3645	Detroit Metropolitan Wayne County Airport	DTW	Detroit	0101000020E6100000000000209ED654C0000000E02F1B4540	United States
3646	Tampa International Airport	TPA	Tampa	0101000020E61000000000000020A254C000000060BAF93B40	United States
3648	Polk Army Air Field	POE	Fort Polk South	0101000020E610000036E103E0444C57C00ADEEBFF770B3F40	United States
3649	Eielson Air Force Base	EIL	Fairbanks	0101000020E6100000E960FD9F436362C0523000E09A2A5040	United States
3650	Range Regional Airport	HIB	Hibbing	0101000020E6100000BAFF0220B23557C07395F61F7CB14740	United States
3651	Angelina County Airport	LFK	Lufkin	0101000020E61000000000000000B057C0BDEAFF5FE73B3F40	United States
3652	Midland International Airport	MAF	Midland	0101000020E6100000000000A0ED8C59C0000000A047F13F40	United States
3653	Austin Straubel International Airport	GRB	Green Bay	0101000020E6100000000000604B0856C0000000C0173E4640	United States
3654	Ardmore Municipal Airport	ADM	Ardmore	0101000020E610000085B8CDAF414158C0342E1C08C9264140	United States
3655	Mc Guire Air Force Base	WRI	Fort Dix	0101000020E6100000CDEAFC5FDEA552C0C52F0620FF014440	United States
3656	Cherry Point MCAS /Cunningham Field/	\\N	Havelock	0101000020E6100000247402605D3853C09B7AF6BF50734140	United States
3657	Emanuel County Airport	SBO	Santa Barbara	0101000020E610000000000080AC9754C000000000F74D4040	United States
3658	Augusta Regional At Bush Field	AGS	Augusta	0101000020E610000000000060BA7D54C0000000E058AF4040	United States
3659	Sloulin Field International Airport	ISN	Williston	0101000020E6100000B4FBFF7F16E959C0AA090060C5164840	United States
3660	Bill & Hillary Clinton National Airport/Adams Field	LIT	Little Rock	0101000020E610000058F9FFDF5A0E57C0E51200005D5D4140	United States
3661	Stewart International Airport	SWF	Newburgh	0101000020E610000000000000B58652C00000006086C04440	United States
3663	Sacramento Executive Airport	SAC	Sacramento	0101000020E6100000643100408D5F5EC04FEAFF9F99414340	United States
3664	Homer Airport	HOM	Homer	0101000020E6100000000000A043EF62C000000000A3D24D40	United States
3665	Waynesville-St. Robert Regional Forney field	TBN	Fort Leonard Wood	0101000020E610000085C3FB3F010957C0934107C0ECDE4240	United States
3666	Dobbins Air Reserve Base	MGE	Fair Oaks	0101000020E6100000F18503000B2155C090B402E02BF54040	United States
3667	Fairchild Air Force Base	SKA	Spokane	0101000020E61000005E0500E0FB695DC05D0200A0BBCE4740	United States
3669	Tyndall Air Force Base	PAM	Panama City	0101000020E6100000190D0060D36455C08BF3FF3FD1113E40	United States
3670	Dallas Fort Worth International Airport	DFW	Grapevine	0101000020E6100000000000A06E4258C000000060CA724040	United States
3671	Melbourne International Airport	MLB	Melbourne	0101000020E6100000000000A04C2954C000000020511A3C40	United States
3672	McChord Air Force Base	TCM	Tacoma	0101000020E6100000B03500C0769E5EC081010020A0914740	United States
3673	Austin Bergstrom International Airport	AUS	Hornsby Bend	0101000020E6100000000000A0DF6A58C0000000C0CA313E40	United States
3674	Rickenbacker International Airport	LCK	Groveport	0101000020E61000005D88D51F61BB54C0DE3994A12AE84340	United States
3675	Sawyer International Airport	MQT	Marquette	0101000020E6100000710600404ED955C019EAFFBF422D4740	United States
3676	McGhee Tyson Airport	TYS	Alcoa	0101000020E61000006E6704C09DFF54C0EF76F7DFCEE74140	United States
3677	Hood Army Air Field	HLR	Fort Hood	0101000020E610000055F3FF5FBA6D58C092DFFFDF81233F40	United States
3678	Lambert St Louis International Airport	STL	St. Louis	0101000020E610000000000020AE9756C000000060D55F4340	United States
3679	Millville Municipal Airport	MIV	Millville	0101000020E6100000000000E09EC452C00000002014AF4340	United States
3680	Sheppard Air Force Base-Wichita Falls Municipal Airport	SPS	Wichita Falls	0101000020E610000038C5FC3F7B9F58C03F84020091FE4040	United States
3681	Cincinnati Municipal Airport Lunken Field	LUK	Cincinnati	0101000020E6100000CB450060CA1A55C09BE405E0388D4340	United States
3682	Hartsfield Jackson Atlanta International Airport	ATL	College Park	0101000020E610000000000000661B55C0000000607FD14040	United States
3683	Castle Airport	MER	Merced	0101000020E6100000840607205A245EC07A93F83FB4B04240	United States
3684	Mc Clellan Airfield	MCC	Sacramento	0101000020E6100000732A1900AA595EC030A0F6DF73554340	United States
3685	Gerald R. Ford International Airport	GRR	Forest Hills	0101000020E6100000C713FF7F756155C0E6550000BE704540	United States
3686	Winkler County Airport	INK	Kermit	0101000020E610000067140020DDCC59C022DCFFDF93C73F40	United States
3687	Fresno Yosemite International Airport	FAT	Clovis	0101000020E6100000000000C0F3ED5DC0000000805A634240	United States
3688	Vero Beach Municipal Airport	VRB	Vero Beach	0101000020E6100000F1FFFFDFBE1A54C0C5FFFF5FD5A73B40	United States
3689	Imperial County Airport	IPL	Imperial	0101000020E6100000FF99FF5F0EE55CC0BBE7FF1FC76A4040	United States
3690	Nashville International Airport	BNA	Nashville	0101000020E6100000000000A067AB55C0000000A0EF0F4240	United States
3691	Laredo International Airport	LRD	Laredo	0101000020E6100000000000E08ADD58C000000080368B3B40	United States
3692	Elmendorf Air Force Base	EDF	Anchorage	0101000020E610000000000000D3B962C0000000C020A04E40	United States
3694	Altoona Blair County Airport	AOO	Hollidaysburg	0101000020E6100000EED1FADF7A9453C0B5E5F95FF0254440	United States
3695	Dyess Air Force Base	DYS	Abilene	0101000020E61000008FF9FFBFB1F658C0E40F00C0DC354040	United States
3696	South Arkansas Regional At Goodwin Field	ELD	El Dorado	0101000020E6100000000000200D3457C0000000C0499C4040	United States
3697	La Guardia Airport	LGA	College Point	0101000020E61000005C39FF9FD87752C038C5FC3F7B634440	United States
3698	Tallahassee Regional Airport	TLH	Tallahassee	0101000020E6100000000000606B1655C00000000081653E40	United States
3699	Dupage Airport	DPA	West Chicago	0101000020E6100000747DFEFFE80F56C0E03F06C032F44440	United States
3700	Waco Regional Airport	ACT	Waco	0101000020E610000000000080C04E58C0000000207E9C3F40	United States
3701	Augusta State Airport	AUG	Augusta	0101000020E6100000B8010000077351C0CA02006009294640	United States
3702	Hillsboro Municipal Airport	INJ	Hillsboro	0101000020E610000051F10380384658C0A0550320B00A4040	United States
3704	Mc Kellar Sipes Regional Airport	MKL	Flowood	0101000020E610000082790240993A56C0C9B8FB7FC9CC4140	United States
3705	Molokai Airport	MKK	Napili-Honokowai	0101000020E61000000000006012A363C00000008024273540	United States
3706	Godman Army Air Field	FTK	Fort Knox	0101000020E6100000370000E0367E55C05F0500E01BF44240	United States
3707	New River MCAS /H/ /Mccutcheon Fld/ Airport	\\N	Jacksonville	0101000020E610000097B20400245C53C001E807E0AC5A4140	United States
3708	San Angelo Regional Mathis Field	SJT	San Angelo	0101000020E610000000000080BE1F59C000000040925B3F40	United States
3709	Calexico International Airport	CXL	Calexico	0101000020E6100000B1B2FFFFD4E05CC011FEFF1FB2554040	United States
3710	Chico Municipal Airport	CIC	Chico	0101000020E6100000655AF67FE9765EC0845DFB9FCFE54340	United States
3711	Burlington International Airport	BTV	South Burlington	0101000020E61000007DFBFF9FCF4952C03CE9FF3F673C4640	United States
3712	Jacksonville International Airport	JAX	Jacksonville	0101000020E610000000000080066C54C0000000607D7E3E40	United States
3713	Durango La Plata County Airport	DRO	Durango	0101000020E61000000449008041F05AC0A3FDFF5F64934240	United States
3714	Washington Dulles International Airport	IAD	Washington, D.C.	0101000020E610000090B402E02B5D53C08B1C0160E5784340	United States
3715	Easterwood Field	CLL	College Station	0101000020E61000001F420180481758C0D09E0580AE963E40	United States
3716	Felts Field	SFF	Spokane	0101000020E610000060010000AC545DC02300000066D74740	United States
3717	General Mitchell International Airport	MKE	Milwaukee	0101000020E6100000000000E061F955C0000000E03D794540	United States
3718	Abilene Regional Airport	ABI	Abilene	0101000020E610000023FCFF3FA4EB58C02B0B0080A5344040	United States
3719	Columbia Regional Airport	COU	Oak Grove	0101000020E6100000000000E00D0E57C000000080B7684340	United States
3720	Portland International Airport	PDX	Vancouver	0101000020E610000059411DA045A65EC0073DFE7F5ACB4640	United States
3721	Dade Collier Training and Transition Airport	TNT	Miami Springs	0101000020E6100000F7FFFF7F683954C0AAFFFFDF9EDC3940	United States
3722	Palm Beach International Airport	PBI	West Palm Beach	0101000020E6100000000000401E0654C000000040E6AE3A40	United States
3723	Fort Worth Meacham International Airport	FTW	Fort Worth	0101000020E61000008CF6FF7F315758C078120040EF684040	United States
3724	Ogdensburg International Airport	OGS	Ogdensburg	0101000020E6100000D8F7FFBFCADD52C045F8FF7F48574640	United States
3726	Boeing Field King County International Airport	BFI	Seattle	0101000020E61000000000000054935EC000000000D7C34740	United States
3727	Lackland Air Force Base	SKF	San Antonio	0101000020E6100000FFD8FBBF30A558C08A73F5DF5A623D40	United States
3728	Honolulu International Airport	HNL	Honolulu	0101000020E61000000000000081BD63C00000006096513540	United States
3729	Des Moines International Airport	DSM	West Des Moines	0101000020E610000000000040706A57C0000000205AC44440	United States
3730	Coastal Carolina Regional Airport	EWN	New Bern	0101000020E610000078F2FFDFBE4253C03F0F002058894140	United States
3731	San Diego International Airport	SAN	San Diego	0101000020E61000005590FFFF284C5DC0B21800A0E65D4040	United States
3732	Monroe Regional Airport	MLU	Monroe	0101000020E6100000000000A0690257C00000002065414040	United States
3733	Shaw Air Force Base	SSC	Sumter	0101000020E61000005F44FC3F1E1E54C0F369FC5F81FC4040	United States
3734	Ontario International Airport	ONT	Ontario	0101000020E6100000000000C076665DC0000000002B074140	United States
3735	Majors Airport	GVT	Greenville	0101000020E6100000EF0100E02D0458C0EDFEFF9FAD884040	United States
3736	Roswell International Air Center Airport	ROW	Roswell	0101000020E6100000000000E0FB215AC0000000E09AA64040	United States
3737	Coleman A. Young Municipal Airport	DET	Detroit	0101000020E61000009298FB3FA2C054C0C3E1FD9F60344540	United States
3738	Brownsville South Padre Island International Airport	BRO	Brownsville	0101000020E610000000000000425B58C00000000024E83940	United States
3739	Dothan Regional Airport	DHN	Dothan	0101000020E610000000000040C65C55C0000000C040523F40	United States
3740	Cape May County Airport	WWD	Villas	0101000020E61000000EF8FF9F21BA52C0B5FBFF7F16814340	United States
3742	Selfridge Angb Airport	MTC	Mount Clemens	0101000020E6100000000000E078B554C0000000C0DC4D4540	United States
3743	Four Corners Regional Airport	FMN	Farmington	0101000020E610000041120060B80E5BC07DFBFF9FDF5E4240	United States
3744	Corpus Christi International Airport	CRP	Corpus Christi	0101000020E6100000000000A0136058C0000000E038C53B40	United States
3745	Syracuse Hancock International Airport	SYR	North Syracuse	0101000020E6100000000000A0CD0653C0000000C03B8E4540	United States
3746	Naval Air Station Key West/Boca Chica Field	NQX	Key West	0101000020E61000008C820100176C54C0B956F79F67933840	United States
3747	Chicago Midway International Airport	MDW	Chicago	0101000020E61000000000006027F055C0000000A09BE44440	United States
3748	Norman Y. Mineta San Jose International Airport	SJC	San Jose	0101000020E6100000000000C0747B5EC0000000A069AE4240	United States
3749	Lea County Regional Airport	HOB	Hobbs	0101000020E6100000C7A82160E3CD59C00000000000584040	United States
3750	Northeast Philadelphia Airport	PNE	Palmyra	0101000020E6100000CE1101A0ADC052C0F05EFFBF7B0A4440	United States
3751	Denver International Airport	DEN	Denver	0101000020E610000013010060122B5AC0210000204CEE4340	United States
3752	Philadelphia International Airport	PHL	Palmyra	0101000020E6100000000000206ECF52C0000000609AEF4340	United States
3753	Sioux Gateway Col. Bud Day Field	SUX	Sioux City	0101000020E61000004FA3FBFF991858C0EADEF55F88334540	United States
3754	Middle Georgia Regional Airport	MCN	Menominee	0101000020E6100000000000808CE954C0000000A0AD584040	United States
3755	Truth Or Consequences Municipal Airport	TCS	Truth or Consequences	0101000020E61000003F2F008068D15AC0950500C0529E4040	United States
3756	Palmdale Regional/USAF Plant 42 Airport	PMD	Palmdale	0101000020E610000020AC10A070855DC004B4082090504140	United States
3757	Randolph Air Force Base	RND	San Antonio	0101000020E61000005EC60380D99158C0281013609A873D40	United States
3758	El Centro Naf Airport	NJK	El Centro	0101000020E61000000000000002EB5CC000000040236A4040	United States
3759	Port Columbus International Airport	CMH	Groveport	0101000020E6100000000000E014B954C000000080BEFF4340	United States
3760	Drake Field	FYV	Fayetteville	0101000020E6100000000000E0E28A57C000000020A7004240	United States
3761	Henry Post Army Air Field (Fort Sill)	FSI	Lawton	0101000020E61000009C62FE9FBD9958C0259B06A02C534140	United States
3762	Princeton Municipal Airport	PNM	Zimmerman	0101000020E6100000CB84FCBFEC6657C0799707C0AAC74640	United States
3763	Wright-Patterson Air Force Base	FFO	Vandalia	0101000020E61000003A060060170355C06A1A00A0BDE94340	United States
3765	Chandler Municipal Airport	\\N	Chandler	0101000020E6100000DD09F65FE7F35BC043AD69DE71A24040	United States
3766	Mineral Wells Airport	MWL	Mineral Wells	0101000020E610000054F3FF5FDA8358C05FE5FF7F0B644040	United States
3767	Mc Connell Air Force Base	IAB	Wichita	0101000020E6100000C1FD04402A5158C09996FD5F9ACF4240	United States
3768	New Orleans NAS JRB/Alvin Callender Field	NBG	New Orleans	0101000020E61000002EBCFD7F3D8256C017480EE046D33D40	United States
3769	Beaufort County Airport	BFT	Beaufort	0101000020E61000004F0A00009A2854C01AEDFFFFC2344040	United States
3770	Texarkana Regional Webb Field	TXK	Texarkana	0101000020E6100000000000806C7F57C0000000E012BA4040	United States
3771	Plattsburgh International Airport	PBG	Plattsburgh	0101000020E610000000000060F55D52C0000000C050534640	United States
3772	Phillips Army Air Field	APG	Aberdeen	0101000020E610000026E4839ECD0A53C037AAD381ACBB4340	United States
3773	Tucumcari Municipal Airport	TCC	Tucumcari	0101000020E6100000C1D0FF7F97E659C02E11000066974140	United States
3774	Ted Stevens Anchorage International Airport	ANC	Anchorage	0101000020E610000000000040DFBF62C0000000C052964E40	United States
3775	Robert Gray  Army Air Field Airport	GRK	Killeen	0101000020E610000068F4FFBF0C7558C0A4DDFFFF33113F40	United States
3776	Black Rock Airport	ZUN	Zuni Pueblo	0101000020E610000000000020B0325BC000000040A68A4140	United States
3777	Bellingham International Airport	BLI	Bellingham	0101000020E6100000000000A06EA25EC0000000807A654840	United States
3778	Millington Regional Jetport Airport	NQA	Millington	0101000020E610000012000000B37756C01D000060A8AD4140	United States
3779	Elkins-Randolph Co-Jennings Randolph Field	EKN	Elkins	0101000020E6100000E389FFBFDAF653C0C752FBDFD7714340	United States
3780	Hartford Brainard Airport	HFD	Wethersfield	0101000020E6100000040000C08F2952C0210000204CDE4440	United States
3781	North Central State Airport	SFZ	Lincoln	0101000020E6100000170A002073DF51C0E40F00C0DCF54440	United States
3782	Mobile Regional Airport	MOB	Mobile	0101000020E6100000DDFFFFFF890F56C061000080F2B03E40	United States
3783	Moffett Federal Airfield	NUQ	Mountain View	0101000020E6100000000000E022835EC0000000C042B54240	United States
3784	Santa Fe Municipal Airport	SAF	Santa Fe	0101000020E610000017C7FF1FB2855AC067140020FDCE4140	United States
3785	Barking Sands Airport	BKH	Wailua Homesteads	0101000020E6100000F8F0FFBF1EF963C0AC2F0040D6053640	United States
3786	Beauregard Regional Airport	DRI	DeRidder	0101000020E6100000850A00E0C05557C057D6FF3FEAD43E40	United States
3787	Bradshaw Army Airfield	BSF	Waimea	0101000020E61000005BBCFF5FBA7163C030F4FFDF95C23340	United States
3788	Nogales International Airport	OLS	Nogales	0101000020E6100000000000A045B65BC000000060EE6A3F40	United States
3789	Mac Dill Air Force Base	MCF	Tampa	0101000020E61000000ACA02605BA154C09394ECBF6BD93B40	United States
3790	Scott AFB/Midamerica Airport	BLV	Shiloh	0101000020E6100000E82D1EDE737556C0BDE3141DC9454340	United States
3791	Opa-locka Executive Airport	OPF	Miami Springs	0101000020E61000001BD10340D11154C01189082031E83940	United States
3792	Del Rio International Airport	DRT	Del Rio	0101000020E6100000A4DDFFFF533B59C0E0E6FF9FCB5F3D40	United States
3793	Southwest Florida International Airport	RSW	Fort Myers	0101000020E610000000000040557054C00000006044893A40	United States
3795	Muir Army Air Field (Fort Indiantown Gap) Airport	MUI	Palmyra	0101000020E6100000DB25FDFF702453C04BB0F67FA7374440	United States
3796	Kapalua Airport	JHM	Napili-Honokowai	0101000020E610000000000040899563C0000000A080F63440	United States
6004	Mokpo Heliport	MPK	Moppo	0101000020E61000001C8DFFDF51985F409EF4FF9F23614140	South Korea
3797	John F Kennedy International Airport	JFK	College Point	0101000020E61000005EC60380D97152C008E60900E5514440	United States
3798	Homestead ARB Airport	HST	Homestead	0101000020E61000009D8902E08C1854C0CCEE0BE0147D3940	United States
3799	Riverside Municipal Airport	RAL	Pedley	0101000020E6100000B58E05E07A5C5DC0C752FBDFD7F94040	United States
3800	Sherman Army Air Field	FLV	Leavenworth	0101000020E6100000D5F4FF7F8ABA57C024FFFF7F24AF4340	United States
3801	Wallops Flight Facility Airport	WAL	Fruitland	0101000020E61000004C040080D9DD52C0C213008058F84240	United States
3802	Holloman Air Force Base	HMN	Alamogordo	0101000020E610000052ADFF1FD9865AC0F8F0FFBF1E6D4040	United States
3803	Willow Grove Naval Air Station/Joint Reserve Base	NXX	Willow Grove	0101000020E61000003B5201207CC952C09171F7FF92194440	United States
3804	Cheyenne Regional Jerry Olson Field	CYS	Cheyenne	0101000020E6100000DBFD2AC0F7335AC05148F8FFED934440	United States
3805	Stockton Metropolitan Airport	SCK	Stockton	0101000020E61000005BFFFF5F3B4F5EC00F00002075F24240	United States
3806	Charleston Air Force Base-International Airport	CHS	Hanahan	0101000020E6100000441C0480970254C027BEFB5F05734040	United States
3807	Reno Tahoe International Airport	RNO	Reno	0101000020E6100000000000E026F15DC000000080E2BF4340	United States
3808	Ketchikan International Airport	KTN	Ketchikan	0101000020E61000004C16F71FD97660C010A1004084AD4B40	United States
3809	Willow Run Airport	YIP	Detroit	0101000020E6100000BAFF0220F2E154C0AD69FF7F731E4540	United States
3810	Vandenberg Air Force Base	VBG	Lompoc	0101000020E6100000FB39004060255EC07FFEFFDF5F5E4140	United States
3811	Birmingham-Shuttlesworth International Airport	BHM	Tarrant	0101000020E61000008CC1FD5F39B055C0B219F91F0DC84040	United States
3812	Lakehurst Maxfield Field Airport	NEL	Pine Lake Park	0101000020E610000021E7FD7F9C9652C031C7FA1F43044440	United States
3814	Nellis Air Force Base	LSV	Sunrise Manor	0101000020E610000069F7FFFF2CC25CC0DE0300C03B1E4240	United States
3815	March ARB Airport	RIV	Pedley	0101000020E6100000D8840F8093505DC047E804C0BAF04040	United States
3816	Modesto City Co-Harry Sham Field	MOD	Modesto	0101000020E61000008D1315600E3D5EC0F3AC07401AD04240	United States
3817	Sacramento International Airport	SMF	Sacramento	0101000020E610000000000000D3655EC0000000E002594340	United States
3818	Waukegan National Airport	UGN	Chicago	0101000020E6100000E3FFFF9F8BF755C03B0000A00A364540	United States
3819	City of Colorado Springs Municipal Airport	COS	Colorado Springs	0101000020E610000029010020DD2C5AC03E00008024674340	United States
3820	Buffalo Niagara International Airport	BUF	Williamsville	0101000020E6100000B340FD5FDCAE53C09298FB3F62784540	United States
3821	Griffing Sandusky Airport	SKY	Sandusky	0101000020E6100000FBF6FF3FBFA954C04FEAFF9F79B74440	United States
3822	Snohomish County (Paine Field) Airport	PAE	Lake Stickney	0101000020E610000006C314400C925EC0D0B6FD9F01F44740	United States
3823	Mountain Home Air Force Base	MUO	Mountain Home	0101000020E6100000FB027AE1CEF75CC0E415889E94854540	United States
3824	Cedar City Regional Airport	CDC	Cedar City	0101000020E61000000000000056465CC000000060BAD94240	United States
3825	Bradley International Airport	BDL	Windsor Locks	0101000020E61000004B040080B92B52C0EF0100E02DF84440	United States
3826	Mc Allen Miller International Airport	MFE	McAllen	0101000020E6100000B917FB3F458F58C0BE06F13F012D3A40	United States
3827	Norfolk Ns (Chambers Fld) Airport	NGU	Norfolk	0101000020E6100000C5ADFEDF831253C09F6DFB3F03784240	United States
3828	Westover ARB/Metropolitan Airport	CEF	North Chicopee	0101000020E610000021A801203A2252C0AB1BF7FFD4184540	United States
3829	Lubbock Preston Smith International Airport	LBB	Lubbock	0101000020E610000000000000AC7459C0000000E0F0D44040	United States
3830	Chicago O'Hare International Airport	ORD	Chicago	0101000020E6100000A7530540E8F955C0AE9003C042FD4440	United States
3831	Boca Raton Airport	BCT	Boca Raton	0101000020E610000024FFFF7FE40654C0B0D2FF5FE5603A40	United States
3832	Fairbanks International Airport	FAI	Fairbanks	0101000020E61000001AE9FB5F647B62C04334FC9F2A345040	United States
3833	Quantico MCAF /Turner field	NYG	Triangle	0101000020E61000008152FEFF895353C0F54DF5BF37404340	United States
3834	Cannon Air Force Base	CVS	Clovis	0101000020E610000063CBFF9F9BD459C07EFBFF9FFF304140	United States
3835	Kaneohe Bay MCAS (Marion E. Carl Field) Airport	NGF	Marine Corps Base Hawaii - MCBH	0101000020E61000001DF3FF7F93B863C09E14000054733540	United States
3836	Offutt Air Force Base	OFF	Omaha	0101000020E6100000F9FFFF5F66FA57C03E000080248F4440	United States
3838	Watertown International Airport	ART	Watertown	0101000020E610000000000080630153C0000000A0F6FE4540	United States
3839	Palm Springs International Airport	PSP	Palm Springs	0101000020E6100000000000C072205DC0000000A033EA4040	United States
3840	Rick Husband Amarillo International Airport	AMA	Amarillo	0101000020E6100000000000202F6D59C000000040159C4140	United States
3841	Fort Dodge Regional Airport	FOD	Fort Dodge	0101000020E610000011C80480538C57C07D5FF97F97464540	United States
3842	Barksdale Air Force Base	BAD	Shreveport	0101000020E6100000CC0500A0696A57C0D9FAFFFF3A404040	United States
3843	Topeka Regional Airport - Forbes Field	FOE	Topeka	0101000020E6100000C5F6FF5F78EA57C038030020B7794340	United States
3844	Cotulla-La Salle County Airport	COT	Pearsall	0101000020E6100000F01F036019CE58C0F940FA3FEA743C40	United States
3845	Wilmington International Airport	ILM	Kings Grant	0101000020E610000000000040C47953C000000000A3224140	United States
3846	Baton Rouge Metropolitan, Ryan Field	BTR	Baton Rouge	0101000020E6100000592E020093C956C024B3FEBF7F883E40	United States
3848	Tyler Pounds Regional Airport	TYR	Tyler	0101000020E6100000000000E0C0D957C000000020532D4040	United States
3849	Baltimore/Washington International Thurgood Marshall Airport	BWI	Baltimore	0101000020E610000027BEFB5FC52A53C0AD69FF7F73964340	United States
3850	Hobart Regional Airport	HBR	Altus	0101000020E6100000043752B648C358C0037CB779E37E4140	United States
3851	Lanai Airport	LNY	Lahaina	0101000020E6100000000000A06E9E63C0000000201DC93440	United States
3852	Alexandria International Airport	AEX	Pineville	0101000020E6100000000000E02F2357C000000080D0533F40	United States
3853	Condron Army Air Field	WSD	Chaparral	0101000020E6100000A4B217C0CA995AC05BFA0240B62B4040	United States
3855	Tulsa International Airport	TUL	Tulsa	0101000020E6100000000000A0D6F857C00000002065194240	United States
3856	Sitka Rocky Gutierrez Airport	SIT	Sitka	0101000020E61000000000008095EB60C00000006007864C40	United States
3857	Long Island Mac Arthur Airport	ISP	Islip	0101000020E61000009ABD01A0694652C046820420C9654440	United States
3858	Minneapolis-St Paul International/Wold-Chamberlain Airport	MSP	Minneapolis	0101000020E610000091FCFFFF314E57C0A9090060E5704640	United States
3859	New Castle Airport	ILG	Kings Grant	0101000020E6100000D1DD01E0D0E652C052AEF89FDFD64340	United States
3861	Louis Armstrong New Orleans International Airport	MSY	New Orleans	0101000020E610000000000020839056C0000000804FFE3D40	United States
3862	Portland International Jetport Airport	PWM	Vancouver	0101000020E61000005009FC9FCB9351C0DE30FA9FB6D24540	United States
3863	Will Rogers World Airport	OKC	Oklahoma City	0101000020E6100000000000E0716658C00000002051B24140	United States
3864	Albany International Airport	ALB	Colonie	0101000020E6100000000000004F7352C000000040C85F4540	United States
3866	Langley Air Force Base	LFI	Poquoson	0101000020E610000013010060121753C0E30C00809C8A4240	United States
3867	John Wayne Airport-Orange County Airport	SNA	Santa Ana	0101000020E61000005803EF3F8D775DC0C015FD5F7DD64040	United States
3868	Columbus Air Force Base	CBM	Columbus	0101000020E6100000BA040040671C56C042F2FFFF67D24040	United States
3869	Kendall-Tamiami Executive Airport	TMB	Country Walk	0101000020E610000097080000B31B54C0E40F00C0DCA53940	United States
3870	Oceana NAS	NTU	Virginia Beach	0101000020E6100000D282FEDF240253C02FE301C00C694240	United States
3871	Grissom Air Reserve Base	GUS	Grissom Air Force Base	0101000020E6100000DF060000BC8955C0AAE9FFFFF4524440	United States
3872	Casper-Natrona County International Airport	CPR	Casper	0101000020E610000081BC0D20B29D5AC0547E086039744540	United States
3873	Destin-Ft Walton Beach Airport	VPS	Eglin Village	0101000020E610000090D8EE1EA0A155C05D6DC5FEB27B3E40	United States
3874	Craig Field	SEM	Selma	0101000020E61000002100002038BF55C0CDFFFFDF042C4040	United States
3875	Key West International Airport	EYW	Key West	0101000020E6100000000000409D7054C0000000A05C8E3840	United States
3876	Charlotte Douglas International Airport	CLT	Belmont	0101000020E6100000000000C05B3C54C000000060649B4140	United States
3877	McCarran International Airport	LAS	Sunrise Manor	0101000020E6100000A7BEE25FBAC95CC0CD29F9BF400A4240	United States
3878	Orlando International Airport	MCO	Orlando	0101000020E6100000000000A0C65354C000000020ED6D3C40	United States
3879	Florence Regional Airport	FLO	Florence	0101000020E61000000000006054EE53C000000020BB174140	United States
3880	Great Falls International Airport	GTF	Great Falls	0101000020E61000009FEF0280BED75BC0F242F81FB2BD4740	United States
3881	Youngstown Warren Regional Airport	YNG	Youngstown	0101000020E6100000C9A00360762B54C070F408A05EA14440	United States
3882	Ladd AAF Airfield	FBK	Fairbanks	0101000020E61000007CF9F8DFA57362C0CC6C04A099355040	United States
3883	Mc Minnville Municipal Airport	MMV	McMinnville	0101000020E6100000090D0E40B4C85EC0ECAE0520E2984640	United States
3884	Robins Air Force Base	WRB	Menominee	0101000020E61000008FF9FFBFE1E554C0750C00C0EE514040	United States
3885	Suvarnabhumi Airport	BKK	Bangkok	0101000020E6100000000000E0CE2F594000000020B95C2B40	Thailand
3889	Pongtiku Airport	TTR	Rantepao	0101000020E61000009DFFFF9F9BF45D409AFFFF9FA05B08C0	Indonesia
3890	Wolter Monginsidi Airport	KDI	Kendari	0101000020E610000000000080C09A5E40000000A0915310C0	Indonesia
3891	Maimun Saleh Airport	SBG	Sabang	0101000020E6100000EEFEFF9FBDD557405D1000E01B7F1740	Indonesia
3892	Cibeureum Airport	\\N	Tasikmalaya	0101000020E6100000FCB6FF7FBE0F5B40DCEBFF1FEB621DC0	Indonesia
3893	Iswahyudi Airport	\\N	Madiun	0101000020E6100000000000A0C6DB5B40000000608C761EC0	Indonesia
3894	Abdul Rachman Saleh Airport	MLG	Malang	0101000020E6100000111E0080C22D5C40E0020020CCB41FC0	Indonesia
3895	Budiarto Airport	\\N	Tangerang	0101000020E6100000523000E07AA45A40A8FCFFBF342C19C0	Indonesia
3896	Husein Sastranegara International Airport	BDO	Bandung	0101000020E610000000000020DDE45A40000000C03E9A1BC0	Indonesia
3897	Penggung Airport	CBN	Cirebon	0101000020E6100000EC8100608F225B40CC1000A049061BC0	Indonesia
3898	Adi Sutjipto International Airport	JOG	Yogyakarta	0101000020E6100000000000E0A59B5B40000000A018271FC0	Indonesia
3899	Tunggul Wulung Airport	CXP	Wangon	0101000020E610000069F7FFFF2C425B40D50600A08A941EC0	Indonesia
3900	Pondok Cabe Air Base	PCB	Jakarta	0101000020E6100000000000C0F5B05A40000000000C5919C0	Indonesia
3901	Achmad Yani Airport	SRG	Semarang	0101000020E61000000000000000985B40325A475513E41BC0	Indonesia
3903	Hang Nadim International Airport	BTH	Tanjungpinang	0101000020E6100000EB1B00C09D075A4069FEFF1FBDEFF13F	Indonesia
3904	Buluh Tumbang (H A S Hanandjoeddin) Airport	TJQ	Tanjung Pandan	0101000020E61000001C8DFFDF51F05A40DE1100003CF705C0	Indonesia
3905	Pangkal Pinang (Depati Amir) Airport	PGK	Pangkalpinang	0101000020E6100000AA090060E5885A407CFFFF7F2F4C01C0	Indonesia
3906	Raja Haji Fisabilillah International Airport	TNJ	Tanjungpinang	0101000020E6100000575C00400C225A40F20E00809E86ED3F	Indonesia
3908	Syamsudin Noor Airport	BDJ	Banjarmasin	0101000020E610000000000000D5B05C4000000000F4890BC0	Indonesia
3910	Iskandar Airport	PKN	Pangkalanbuun	0101000020E61000001301006012EB5B4083DDFFDF3FA405C0	Indonesia
3911	Tjilik Riwut Airport	PKY	Palangkaraya	0101000020E61000005F82FF1F5A7C5C40851C000011CD01C0	Indonesia
3913	Maumere(Wai Oti) Airport	MOF	Maumere	0101000020E61000004F4D00002B8F5E401BFBFF3F034821C0	Indonesia
3914	Ende (H Hasan Aroeboesman) Airport	ENE	Ende	0101000020E6100000E93800E04D6A5E4032F7FF1FD6B221C0	Indonesia
3915	Frans Sales Lega Airport	RTG	Ruteng	0101000020E610000079000020871E5E400D000040AB3121C0	Indonesia
3916	El Tari Airport	KOE	Kupang	0101000020E6100000000000A0F1EA5E4000000000DC5724C0	Indonesia
3917	Komodo (Mutiara II) Airport	LBJ	Labuan Bajo	0101000020E610000000000060E5F85D40000000802BF920C0	Indonesia
3919	Sultan Aji Muhamad Sulaiman Airport	BPN	Balikpapan	0101000020E6100000C696FF3F37395D40A53C0080D54AF4BF	Indonesia
3920	Juwata Airport	TRK	Tarakan	0101000020E6100000D2393FC571645D409F758D96039D0A40	Indonesia
3921	Temindung Airport	SRI	Samarinda	0101000020E6100000575C00400C4A5D4075E5FF3F8E02DFBF	Indonesia
3922	Tanjung Santan Airport	\\N	Bontang	0101000020E6100000E6550000FE5C5D403503002014CDB7BF	Indonesia
3923	Selaparang Airport	AMI	Mataram	0101000020E61000009B51008014065D402A040060151F21C0	Indonesia
3924	Muhammad Salahuddin Airport	BMU	Bima	0101000020E6100000BEFFFFBFF7AB5D40FCFFFFFF4C1421C0	Indonesia
3927	Waingapu Airport	WGP	Waingapu	0101000020E6100000A4DDFFFF53135E4020F9FFFFA35623C0	Indonesia
3928	Juanda International Airport	SUB	Surabaya	0101000020E6100000000000405E325C4000000020F2841DC0	Indonesia
3929	Adi Sumarmo Wiryokusumo Airport	SOC	Colomadu	0101000020E6100000000000C072B05B40000000E079101EC0	Indonesia
3930	Incheon International Airport	ICN	Seoul	0101000020E610000000000020DD9C5F40000000800BBC4240	South Korea
3931	Chiang Mai International Airport	CNX	Chiang Mai	0101000020E6100000DAFDFF3F9BBD5840622E00004DC43240	Thailand
3932	Chiang Rai International Airport	CEI	Chiang Rai	0101000020E61000000DF5FF5F81F85840D4D1FFDFC9F33340	Thailand
3933	Nakhon Si Thammarat Airport	NST	Nakhon Si Thammarat	0101000020E61000000000000076FC58400000002049142140	Thailand
3935	Nakhon Ratchasima Airport	NAK	Nakhon Ratchasima	0101000020E61000000000004008945940000000E024E62D40	Thailand
3936	Nakhon Phanom Airport	KOP	Nakhon Phanom	0101000020E6100000000000E026295A40000000C040623140	Thailand
3937	Ubon Ratchathani Airport	UBP	Ubon Ratchathani	0101000020E6100000E4720020AE375A40D10E0060AA802E40	Thailand
3938	Khon Kaen Airport	KKC	Khon Kaen	0101000020E610000069F7FFFF2CB25940170A002073773040	Thailand
3939	Sukhothai Airport	THS	Sukhothai	0101000020E6100000000000605DF45840000000A0ED3C3140	Thailand
3940	Ngurah Rai (Bali) International Airport	DPS	Denpasar	0101000020E6100000C1FEFF1FB0CA5C40F7FFFF1F107F21C0	Indonesia
3941	Eleftherios Venizelos International Airport	ATH	Athens	0101000020E6100000541300C0CAF13740DF060000DCF74240	Greece
3942	Chubu Centrair International Airport	NGO	Nagoya	0101000020E610000000000080C219614000000000E06D4140	Japan
3943	Kobe Airport	UKB	Kobe	0101000020E6100000000000002BE76040000000A0FF504140	Japan
3944	Pullman Moscow Regional Airport	PUW	Pullman	0101000020E6100000BF61A2410A475DC048BF7D1D385F4740	United States
3945	Lewiston Nez Perce County Airport	LWS	Lewiston Orchards	0101000020E6100000000000C0F5405DC0000000A0EF2F4740	United States
3946	Elmira Corning Regional Airport	ELM	Elmira	0101000020E610000000000000103953C0000000A077144540	United States
3947	Ithaca Tompkins Regional Airport	ITH	Ithaca	0101000020E610000000000060561D53C000000020D93E4540	United States
6005	Wonju Airport	WJU	Wŏnju	0101000020E6100000147EFF9F70FD5F401A1000A013B84240	South Korea
3948	Monterey Peninsula Airport	MRY	Monterey	0101000020E6100000000000C0F3755EC0000000E0224B4240	United States
3949	Santa Barbara Municipal Airport	SBA	Santa Barbara	0101000020E6100000B450D77FC2F55DC0A01607C08D364140	United States
3950	Daytona Beach International Airport	DAB	Daytona Beach	0101000020E6100000A27DACE0B74354C0469561DC0D2E3D40	United States
3952	Liepāja International Airport	LPX	Liepāja	0101000020E610000000000080CE183540000000803D424C40	Latvia
3953	Riga International Airport	RIX	Riga	0101000020E6100000000000009AF837400000008038764C40	Latvia
3954	Šiauliai International Airport	SQQ	Šiauliai	0101000020E6100000000000C01E653740000000606BF24B40	Lithuania
3955	Barysiai Airport	HLJ	Joniškis	0101000020E6100000000000A0DF8E37400000006009094C40	Lithuania
3956	Kaunas International Airport	KUN	Kaunas	0101000020E610000000000080B515384000000020617B4B40	Lithuania
3957	S. Darius and S. Girėnas Airport	\\N	Kaunas	0101000020E610000054D3FFFFA9E13740E81500409D704B40	Lithuania
3958	Palanga International Airport	PLQ	Palanga	0101000020E6100000000000E009183540000000E091FC4B40	Lithuania
3959	Vilnius International Airport	VNO	Vilnius	0101000020E6100000000000402A493940000000402A514B40	Lithuania
3960	Panevėžys Air Base	PNV	Panevėžys	0101000020E610000000000000F7753840000000005DDD4B40	Lithuania
3962	Erebuni Airport	\\N	Yerevan	0101000020E6100000A9060020853B4640060C0000A10F4440	Armenia
3963	Stepanavan Airport	\\N	Step’anavan	0101000020E6100000CA020060292B4640ACECFF3F35864440	Armenia
3964	Zvartnots International Airport	EVN	Yerevan	0101000020E6100000E8F5FFDFAC324640D7F7FFBFDA124440	Armenia
3965	Gyumri Shirak Airport	LWN	Gyumri	0101000020E6100000EA180080FDED4540EAF8FF1F0D604440	Armenia
3966	Assab International Airport	ASA	Assab	0101000020E6100000000000608F52454000000000C3242A40	Eritrea
3967	Asmara International Airport	ASM	Asmara	0101000020E6100000000000E091744340000000E073952E40	Eritrea
3968	Massawa International Airport	MSW	Massawa	0101000020E6100000000000605FAF4340000000400A572F40	Eritrea
3969	Yasser Arafat International Airport	GZA	Gaza	0101000020E6100000C7FFFF3F5723414021000020143F3F40	Palestinian Territory
3971	Batumi International Airport	BUS	Batumi	0101000020E61000001AEDFFFFC2CC4440F4EAFF3F1ECE4440	Georgia
3972	Kopitnari Airport	KUT	Kutaisi	0101000020E6100000AD0F00E0C53D454074E9FF1F9E164540	Georgia
3973	Tbilisi International Airport	TBS	Tbilisi	0101000020E61000001B1000A0337A4640C4F6FF5FA8D54440	Georgia
3974	Mukalla International Airport	RIY	Al Mukallā	0101000020E61000000000000000B048400000004040532D40	Yemen
3975	Ta'izz International Airport	TAI	Ta‘izz	0101000020E61000006F030000CE1146405BFFFF5F3B5F2B40	Yemen
3976	Hodeidah International Airport	HOD	Al Ḩudaydah	0101000020E610000000000060F77C45400000004089812D40	Yemen
3977	Aden International Airport	ADE	Aden	0101000020E6100000000000C0AF83464000000040B4A82940	Yemen
3978	Ataq Airport	AXK	Ataq	0101000020E6100000000000E0C069474000000000441A2D40	Yemen
3979	Al Ghaidah International Airport	AAY	Al Ghayz̧ah	0101000020E61000000000006066164A400000004013313040	Yemen
3980	Sana'a International Airport	SAH	Sanaa	0101000020E6100000000000201F1C4640000000A0DDF32E40	Yemen
3984	Socotra International Airport	SCT	Hadibu	0101000020E610000000000040F1F34A4000000020EB422940	Yemen
3986	Memmingen Allgau Airport	FMM	Memmingen	0101000020E6100000F83300C09F7A244089F0FFFF90FE4740	Germany
3987	Nevşehir Kapadokya Airport	NAV	Nevşehir	0101000020E610000023DBF97E6A44414026E4839ECD624340	Turkey
3988	Ministro Pistarini International Airport	EZE	Buenos Aires	0101000020E610000031992A1895444DC0B7627FD93D6941C0	Argentina
3989	Erbil International Airport	EBL	Erbil	0101000020E6100000000000204AFB4540000000A0691E4240	Iraq
3990	Emerald Airport	EMD	Emerald	0101000020E61000005BBCFF5FBA856240B92400A0479137C0	Australia
3991	Athen Helenikon Airport	HEW	Athens	0101000020E6100000C89750C1E1B937405646239F57F24240	Greece
3992	Kansai International Airport	KIX	Osaka	0101000020E6100000000000E0CEE76040000000C0B1364140	Japan
3994	Tagbilaran Airport	TAG	Tagbilaran City	0101000020E61000000000008097F65E400000004002542340	Philippines
3995	Ilulissat Airport	JAV	Ilulissat	0101000020E6100000760F00004F8749C0840700A0904F5140	Greenland
3996	Qasigiannguit Heliport	JCH	Ilulissat	0101000020E6100000F6EFFF85339649C058408A02A9345140	Greenland
3998	Palma De Mallorca Airport	PMI	Palma	0101000020E6100000A80D004015E9054074E9FF1F9EC64340	Spain
3999	Darwin International Airport	DRW	Darwin	0101000020E610000000000060105C60400000008053D428C0	Australia
4000	Surat Thani Airport	URT	Surat Thani	0101000020E6100000EDFEFF9FADC85840A0050020E4432240	Thailand
4005	Xewkija Heliport	GZM	Għajnsielem	0101000020E610000096B20C71AC8B2C40F1BDBF417B034240	Malta
4006	Tweed New Haven Airport	HVN	East Haven	0101000020E6100000F369FC5FC13852C0038D04E0C0A14440	United States
4007	Asheville Regional Airport	AVL	Asheville	0101000020E6100000000000E0ACA254C000000060D5B74140	United States
4008	Piedmont Triad International Airport	GSO	Greensboro	0101000020E6100000000000C0FCFB53C0000000C0840C4240	United States
4009	Joe Foss Field Airport	FSD	Sioux Falls	0101000020E6100000DAFDFF3F7B2F58C0FAF3FFFF7ECA4540	United States
4011	Manchester Airport	MHT	Bedford	0101000020E610000000000080E2DB51C0000000605F774540	United States
4012	Naples Municipal Airport	APF	Naples	0101000020E6100000730900809E7154C088EDFFBF10273A40	United States
4014	Louisville International Standiford Field	SDF	Saint Matthews	0101000020E6100000C976BE9F1A6F55C011363CBD52164340	United States
4015	Charlottesville Albemarle Airport	CHO	Hollymead	0101000020E610000000000060FC9C53C0000000A0BD114340	United States
4016	Roanoke–Blacksburg Regional Airport	ROA	Hollins	0101000020E610000069F7FFFF6CFE53C04E0A0000AAA94240	United States
4017	Blue Grass Airport	LEX	Monticello	0101000020E610000000000020C72655C000000000AC044340	United States
4018	Evansville Regional Airport	EVV	Evansville	0101000020E6100000160700E012E255C0620B0060BC044340	United States
4019	Albuquerque International Sunport Airport	ABQ	Albuquerque	0101000020E6100000000000E0F9A65AC00000004025854140	United States
4020	Gallatin Field	BZN	Bozeman	0101000020E6100000A4B217C0CAC95BC04B71FA1F85E34640	United States
4021	Billings Logan International Airport	BIL	Billings	0101000020E610000000000080C0225BC0000000C062E74640	United States
4022	Bert Mooney Airport	BTM	Butte	0101000020E6100000000000E0CE1F5CC0000000E036FA4640	United States
4023	Cherry Capital Airport	TVC	Traverse City	0101000020E6100000000000C0426555C000000040E65E4640	United States
4024	Mundo Maya International Airport	FRS	Flores	0101000020E6100000170A0020737756C0740C00C0EEE93040	Guatemala
4025	Hancock County-Bar Harbor Airport	BHB	Ellsworth	0101000020E6100000B9D8FEDF221751C005B0F99F99394640	United States
4026	Knox County Regional Airport	RKD	Rockland	0101000020E610000082790240594651C0EDD50960B1074640	United States
4027	Jackson Hole Airport	JAC	Jackson	0101000020E6100000000000603BAF5BC000000000BCCD4540	United States
4028	Chicago Rockford International Airport	RFD	Rockford	0101000020E610000000000080384656C0000000E002194540	United States
4029	Domodedovo International Airport	DME	Moscow	0101000020E6100000000000A001F442400000008053B44B40	Russia
4030	Sanya Phoenix International Airport	SYX	Sanya	0101000020E6100000000000405E5A5B40000000E08A4D3240	China
4033	Lijiang Airport	LJG	Lijiang	0101000020E6100000FCB6FF7FBE0F5940A11A008014AE3A40	China
4034	Greenville Spartanburg International Airport	GSP	Greer	0101000020E610000094020080028E54C030140040A6724140	United States
4037	Central Illinois Regional Airport at Bloomington-Normal	BMI	Bloomington	0101000020E6100000F19DFB1F9E3A56C09E07FB9F113D4440	United States
4038	Gulfport Biloxi International Airport	GPT	West Gulfport	0101000020E6100000000000807C4456C0000000E044683E40	United States
4039	Kalamazoo Battle Creek International Airport	AZO	Kalamazoo	0101000020E6100000000000A0556355C000000040111E4540	United States
4040	Toledo Express Airport	TOL	Toledo	0101000020E6100000F5CFFCFFB2F354C0459AFC3F1CCB4440	United States
4041	Fort Wayne International Airport	FWA	Fort Wayne	0101000020E6100000854503807C4C55C00F2308803F7D4440	United States
4042	Decatur Airport	DEC	Mount Zion	0101000020E6100000000000A0673756C000000020D4EA4340	United States
4043	The Eastern Iowa Airport	CID	Cedar Rapids	0101000020E6100000000000C07DED56C0000000E03DF14440	United States
4044	La Crosse Municipal Airport	LSE	La Crosse	0101000020E61000009E7AA4C16DD056C02E8F352383F04540	United States
4045	Central Wisconsin Airport	CWA	Kronenwetter	0101000020E6100000E8F5FFDFAC6A56C0C4F6FF5F88634640	United States
4046	General Wayne A. Downing Peoria International Airport	PIA	Bartonville	0101000020E6100000F9F3FFFF5E6C56C025FFFF7F04554440	United States
4047	Appleton International Airport	ATW	Appleton	0101000020E6100000C7FCFFDF382156C0CA02006009214640	United States
4048	Rochester International Airport	RST	Rochester	0101000020E610000000000000002057C00000002043F44540	United States
4049	University of Illinois Willard Airport	CMI	Champaign	0101000020E6100000E5EFFF5FCC1156C0ECED018004054440	United States
4050	Manhattan Regional Airport	MHK	Manhattan	0101000020E610000000000060EE2A58C0000000400C924340	United States
4052	Hervey Bay Airport	HVB	Maryborough	0101000020E6100000C5190000291C634096280060A35139C0	Australia
4054	Dali Airport	DLU	Dali	0101000020E610000023DBF97E6A1459405DFDD8243FA63940	China
4057	Sharm El Sheikh International Airport	SSH	Sharm el-Sheikh	0101000020E6100000F91300608F32414006E9FF5F30FA3B40	Egypt
4058	Venango Regional Airport	FKL	Franklin	0101000020E6100000050900C010F753C0F9F3FFFF5EB04440	United States
4059	Jomo Kenyatta International Airport	NBO	Nairobi	0101000020E61000008E190020C27642405FDEFF5F9B1BF5BF	Kenya
4061	El Calafate Airport	FTE	El Calafate	0101000020E6100000A298BC01660352C0CE88D2DEE02349C0	Argentina
4062	Armidale Airport	ARM	Armidale	0101000020E61000006D400080BEF36240862D008031873EC0	Australia
4063	Grand Junction Regional Airport	GJT	Grand Junction	0101000020E61000005BBCFF5FBA215BC0541300C0AA8F4340	United States
4064	St George Municipal Airport	SGU	Saint George	0101000020E61000002D7FA2D8A8605CC0B3E11F64A8844240	United States
4065	David Wayne Hooks Memorial Airport	DWH	Houston	0101000020E6100000880D002061E357C00B350020D20F3E40	United States
4066	Port O'Connor Private Airport	S46	Port Lavaca	0101000020E610000000000000711C58C0000000E0006E3C40	United States
4067	Sarasota Bradenton International Airport	SRQ	Sarasota	0101000020E6100000000000407BA354C0000000E038653B40	United States
4069	L.F. Wade International International Airport	BDA	Hamilton	0101000020E6100000000000E06F2B50C000000080972E4040	Bermuda
4071	Van Nuys Airport	VNY	Van Nuys	0101000020E6100000210000205C9F5DC0160000C0DA1A4140	United States
4072	Quad City International Airport	MLI	Moline	0101000020E6100000000000E07AA056C00000008068B94440	United States
4073	Panama City-Bay Co International Airport	PFN	Panama City	0101000020E61000005D6DC5FEB26B55C0A983BC1E4C363E40	United States
4074	Honiara International Airport	HIR	Honiara	0101000020E6100000D4FFFF7FC20164400D0000E022DB22C0	Solomon Islands
4075	Faa'a International Airport	PPT	Papeete	0101000020E6100000E30C00806CB362C0FBF6FF3FBF8D31C0	French Polynesia
4076	Nauru International Airport	INU	Yaren	0101000020E61000007D5A457F68DD6440CADFBDA3C684E1BF	Nauru
4077	Funafuti International Airport	FUN	Funafuti	0101000020E61000008FE1B19F45666640CDCCCCCCCC0C21C0	Tuvalu
4078	Tolmachevo Airport	OVB	Novosibirsk	0101000020E61000000F000020A5A95440CDFFFFDF9C814B40	Russia
4080	Samsø Airport	\\N	Odder	0101000020E6100000000000E0363A254000000020DBF14B40	Denmark
4081	Xieng Khouang Airport	XKH	Muang Phônsavan	0101000020E6100000000000A01CCA59400000004033733340	Laos
4083	Bismarck Municipal Airport	BIS	Bismarck	0101000020E610000000000080BE2F59C0000000E0E7624740	United States
4085	Yinchuan Airport	INC	Yinchuan	0101000020E610000038A4518193805A40D07CCEDDAE3D4340	China
4086	Mae Hong Son Airport	HGN	Mae Hong Son	0101000020E610000000000080737E584000000000224D3340	Thailand
4087	Rapid City Regional Airport	RAP	Rapid City	0101000020E6100000000000E0A5C359C000000060CC054640	United States
4088	Mc Clellan-Palomar Airport	CLD	Carlsbad	0101000020E6100000D53A1680EB515DC0A544F91F6C904040	United States
4089	Bishop International Airport	FNT	Flint	0101000020E61000000000002097EF54C000000040927B4540	United States
4090	Francisco Bangoy International Airport	DVO	Davao	0101000020E61000000000002058695F400000006088801C40	Philippines
4091	Madeira Airport	FNC	Funchal	0101000020E61000007AFFFF9F45C630C0F3FFFFBF54594040	Portugal
4092	Maestro Wilson Fonseca Airport	STM	Santarém	0101000020E61000000000002096644BC0000000A0D46503C0	Brazil
4093	Sihanoukville International Airport	KOS	Sihanoukville	0101000020E6100000986E00A0C4E859406D400080CE282540	Cambodia
4095	Hawke's Bay Airport	NPE	Napier	0101000020E6100000DF15C1FFD61B6640D8B8FE5D9FBB43C0	New Zealand
4096	Levuka Airfield	LEV	Levuka	0101000020E6100000473E00C049586640D9DAFF9F0AB631C0	Fiji
4097	Lhasa Gonggar Airport	LXA	Lhasa	0101000020E6100000E7F2FF9F5CBA5640630E00A03C4C3D40	China
4098	Redding Municipal Airport	RDD	Redding	0101000020E61000000FD02280C0925EC0EC2CFEDF26414440	United States
4099	Mahlon Sweet Field	EUG	Eugene	0101000020E61000000000006091CD5EC0000000E0F20F4640	United States
4100	Idaho Falls Regional Airport	IDA	Idaho Falls	0101000020E6100000000000408B045CC000000060DEC14540	United States
4101	Rogue Valley International Medford Airport	MFR	Central Point	0101000020E610000000000040DFB75EC0000000C0E52F4540	United States
4103	Roberts Field	RDM	Redmond	0101000020E61000007636E49F99495EC098F1006086204640	United States
4104	Picton Aerodrome	PCN	Blenheim	0101000020E61000007CFFFF7F97BE6540350000004DAC44C0	New Zealand
4105	Hosea Kutako International Airport	WDH	Windhoek	0101000020E6100000B8AF03E78C783140B459F5B9DA7A36C0	Namibia
4106	Victoria Harbour Seaplane Base	YWH	Victoria	0101000020E610000071BFFF33E3D85EC0EAC711F065364840	Canada
4107	Coal Harbour Seaplane Base	\\N	Vancouver	0101000020E610000002E3FFDF4FE55FC067F4FFBFCC4C4940	Canada
4108	Yaoqiang Airport	TNA	Jinan	0101000020E610000000000000D34D5D40000000C0B86D4240	China
4109	Changzhou Benniu Airport	CZX	Changzhou	0101000020E610000078279F1EDBF15D403719558671EB3F40	China
4110	Yibin Caiba Airport	YBP	Yibin	0101000020E61000007B14AE47E1225A40E0EE7935F1CC3C40	China
4111	Roshchino International Airport	TJM	Tyumen	0101000020E61000000CF5FF5FC1545040A60300E044984C40	Russia
4112	Akron Canton Regional Airport	CAK	Akron	0101000020E6100000000000004D5C54C0000000C042754440	United States
4113	Huntsville International Carl T Jones Field	HSV	Madison	0101000020E61000000D0000409BB155C0BEFFFFBF8F514140	United States
4114	Mid Ohio Valley Regional Airport	PKB	Parkersburg	0101000020E6100000000000E01B5C54C0000000402CAC4340	United States
4115	Montgomery Regional (Dannelly Field) Airport	MGM	Montgomery	0101000020E61000000471FD3F379955C0EB44F6FF79264040	United States
4116	Tri Cities Regional Tn Va Airport	TRI	Colonial Heights	0101000020E6100000000000E0129A54C000000060D33C4240	United States
6179	Bharatpur Airport	BHR	Bharatpur	0101000020E6100000000000407B1B55400000000098AD3B40	Nepal
4117	Barkley Regional Airport	PAH	Paducah	0101000020E610000000000000863156C000000040C8874240	United States
4119	Djibouti-Ambouli Airport	JIB	Djibouti	0101000020E6100000000000806A944540000000C037182740	Djibouti
4120	Haikou Meilan International Airport	HAK	Qiongshan	0101000020E610000000000040609D5B40000000A055EF3340	China
4121	Mafia Island Airport	MFA	Kilindoni	0101000020E6100000C1A7397991D54340AD32535A7FAB1FC0	Tanzania
4124	Page Municipal Airport	PGA	Page	0101000020E610000019ABCDFFABDC5BC0722FF67F8A764240	United States
4125	Utila Airport	UII	La Ceiba	0101000020E61000009E2633DE56B855C0772D211FF41C3040	Honduras
4127	Glacier Park International Airport	FCA	Kalispell	0101000020E61000000000004062905CC000000080BE274840	United States
4128	MBS International Airport	MBS	Freeland	0101000020E610000000000020180555C00000002036C44540	United States
4129	Greater Binghamton/Edwin A Link field	BGM	Binghamton	0101000020E61000000F7AFCFFB4FE52C0DE30FA9FB61A4540	United States
4130	Baghdad International Airport	BGW	Baghdad	0101000020E6100000BDEAFF5F071E464050EAFF9F99A14040	Iraq
4131	Nan Airport	NNT	Nan	0101000020E6100000000000A01C32594000000080D2CE3240	Thailand
4132	Roi Et Airport	ROI	Roi Et	0101000020E61000000000004089F15940000000A0E61D3040	Thailand
4133	Buri Ram Airport	BFV	Satuek	0101000020E61000000000002031D059400000000081752E40	Thailand
4135	Trat Airport	TDX	Trat	0101000020E610000058D9FF7F6A94594041120060988C2840	Thailand
4136	Blythe Airport	BLH	Blythe	0101000020E6100000905F0060E3AD5CC00D18000042CF4040	United States
4137	Al Asad Air Base	\\N	Hīt	0101000020E6100000CDE5FF3F79384540730900808EE44040	Iraq
4138	Al Taqaddum Air Base	\\N	Al Fallūjah	0101000020E6100000E1FFFFBF6DCC4540370000E046AB4040	Iraq
4139	Joint Base Balad	\\N	Ad Dujayl	0101000020E6100000C8FCFFDF482E4640C113008058F84040	Iraq
4140	Clark International Airport	CRK	Angeles City	0101000020E6100000AB6F0000D7235E405BFFFF5F3B5F2E40	Philippines
4141	Sandakan Airport	SDK	Sandakan	0101000020E6100000000000A0C6835D4000000080859A1740	Malaysia
4142	Luang Namtha Airport	LXG	Luang Namtha	0101000020E6100000000000A099595940000000408DF73440	Laos
4143	Oudomsay Airport	ODY	Muang Xay	0101000020E6100000000000C09D7F594000000060C5AE3440	Laos
4144	Taoxian Airport	SHE	Shenyang	0101000020E610000000000080E9DE5E4000000000E5D14440	China
4146	John A. Osborne Airport	MNI	Brades	0101000020E610000000000000BE184FC00000004099CA3040	Montserrat
4147	Petersburg James A Johnson Airport	PSG	Petersburg	0101000020E610000066FFF27F3D9E60C0F19DFB1F9E664C40	United States
4148	Luoyang Airport	LYA	Luoyang	0101000020E6100000B1B2FFFFD4185C40610B0060DC5E4140	China
4149	Xuzhou Guanyin Airport	XUZ	Tongshan	0101000020E61000000D8CBCAC89635D40F850A2258F074140	China
4151	Magway Airport	MWQ	Magway	0101000020E6100000000000E03FBC5740000000C0642A3440	Myanmar
4153	Lien Khuong Airport	DLI	Ðà Lạt	0101000020E6100000000000E07C175B400000000000802740	Vietnam
4155	Rach Gia Airport	VKG	Rạch Giá	0101000020E6100000632600E878485A4080938FE782EA2340	Vietnam
4156	Cà Mau Airport	CAH	Cà Mau	0101000020E6100000B1FCF9B6604B5A402828452BF75A2240	Vietnam
4157	Chu Lai International Airport	VCL	Tam Kỳ	0101000020E6100000F14700202F2D5B4074A9FF5F7DCE2E40	Vietnam
4158	Dong Tac Airport	TBB	Tuy Hòa	0101000020E6100000FB39004060555B40AFCFFF1F65192A40	Vietnam
4159	Mae Hong Son Airport	PYY	Mae Hong Son	0101000020E6100000BD0A00C0F79B58405BFFFF5F3B5F3340	Thailand
4160	Bol Airport	BWK	Omiš	0101000020E6100000000000E000AE3040000000E091A44540	Croatia
4161	Yaoundé Nsimalen International Airport	NSI	Yaoundé	0101000020E6100000000000204A1B274000000080CDC70D40	Cameroon
4162	Conakry International Airport	CKY	Conakry	0101000020E6100000D34D621058392BC065C746205E272340	Guinea
4165	Aachen-Merzbrück Airport	AAH	Aachen	0101000020E6100000000000C0DCBE1840000000E059694940	Germany
4166	Karlsruhe Baden-Baden Airport	FKB	Sinzheim	0101000020E6100000B9040040372920409DF1FF5FC3634840	Germany
4167	Orlando Sanford International Airport	SFB	Sanford	0101000020E610000000000040334F54C0000000C010C73C40	United States
4169	John Murtha Johnstown Cambria County Airport	JST	Johnstown	0101000020E6100000000000A05EB553C00000000076284440	United States
4170	Lukla Airport	LUA	Lobujya	0101000020E610000000000060B3AE5540000000A0D8AF3B40	Nepal
4171	Bhojpur Airport	BHP	Khāndbāri	0101000020E61000000000004040C3554000000000BC253B40	Nepal
4174	Manang Airport	NGX	Pokhara	0101000020E610000000000080B5055540000000C032A43C40	Nepal
4178	Tulsipur Airport	DNP	Tulsīpur	0101000020E610000000000020D492544000000000711C3C40	Nepal
4179	Rukumkot Airport	RUK	Besisahar	0101000020E610000057F9FFDF7A8C54409AEEFF1F83A03C40	Nepal
4180	Jumla Airport	JUM	Jumla	0101000020E6100000000000005F8C54400000000032463D40	Nepal
4182	Taplejung Airport	TPJ	Khāndbāri	0101000020E6100000D122DBF97EEC5540992A1895D4593B40	Nepal
4183	Tumling Tar Airport	TMI	Khāndbāri	0101000020E6100000000000005FCC5540000000E0A3503B40	Nepal
4184	Surkhet Airport	SKH	Birendranagar	0101000020E610000000000040B46854400000002004963C40	Nepal
4187	Bajhang Airport	BJH	Dipayal	0101000020E6100000000000A0DD4B5440000000E0FB893D40	Nepal
4188	Dhangarhi Airport	DHI	Dhangarhi	0101000020E6100000000000E03D25544000000040D8C03C40	Nepal
4189	Muan International Airport	MWX	Muan	0101000020E6100000DC9C4A0680985F4072874D64E67E4140	South Korea
4191	Ikaria Airport	JIK	Néon Karlovásion	0101000020E6100000DC000080DB583A4018EAFFBF62D74240	Greece
4192	Kalymnos Airport	JKL	Kálymnos	0101000020E6100000DDE0FF1FCBF03A40EBFBFF5F4D7B4240	Greece
4194	Naxos Airport	JNX	Náxos	0101000020E6100000E4CCFFBF3B5E39400A120080618A4240	Greece
4195	Paros Airport	PAS	Páros	0101000020E61000001B12F758FA1C3940A25D85949F824240	Greece
4197	Marsa Alam International Airport	RMF	Marsa Alam	0101000020E610000035FDFF9FB64A414074E9FF1F9E8E3940	Egypt
4198	Weeze Airport	NRN	Weeze	0101000020E6100000A9F4FFFF94911840DC0000801BCD4940	Germany
4199	Francisco B. Reyes Airport	USU	Coron	0101000020E6100000B7DEFF5F66065E40A05A0040353E2840	Philippines
4200	Bancasi Airport	BXU	Butuan	0101000020E6100000CA54C1A8A45E5F40BA490C022BE72140	Philippines
4201	Dipolog Airport	DPL	Dipolog	0101000020E610000033AFFF47E1D55E40CAE55F2E37342140	Philippines
4202	Laoag International Airport	LAO	Laoag	0101000020E6100000000000400C225E4000000000982D3240	Philippines
4203	Legazpi City International Airport	LGP	Sagpon	0101000020E6100000D7A3703D0AEF5E40713D0AD7A3502A40	Philippines
4204	Labo Airport	OZC	Clarin	0101000020E610000000000060E3F55E40000000A0655B2040	Philippines
4206	Mactan Cebu International Airport	CEB	Lapu-Lapu City	0101000020E61000003F0100E0A7FE5E40D2FFFF9F709D2440	Philippines
4207	Norden-Norddeich Airport	NOE	Norden	0101000020E6100000C4EFFF3FD8C21C4041F2FFFF07D14A40	Germany
4208	Juist Airport	JUI	Norderney	0101000020E6100000000000402C391C40000000A02ED74A40	Germany
4209	Porto Seguro Airport	BPS	Porto Seguro	0101000020E6100000000000E05A8A43C000000020487030C0	Brazil
4213	Iguatu Airport	\\N	Iguatu	0101000020E6100000000000409BA543C0000000A0F56219C0	Brazil
4214	Brigadeiro Lysias Rodrigues Airport	PMW	Palmas	0101000020E610000010FEFF1FB22D48C0F16700803F9524C0	Brazil
4215	Nelson Ribeiro Guimarães Airport	CLV	Caldas Novas	0101000020E6100000D4FFFF7FC24D48C0EAFFFF3FADB931C0	Brazil
4216	Missoula International Airport	MSO	Missoula	0101000020E6100000CAB4ECFFD2855CC022CF056049754740	United States
4218	Bundaberg Airport	BDB	Bundaberg	0101000020E6100000ACECFF3F350A63402D11000066E738C0	Australia
4220	Sugar Land Regional Airport	SGR	Sugar Land	0101000020E61000002100002004EA57C0120000004F9F3D40	United States
4221	Hayman Island Heliport	HIS	Red Hill	0101000020E61000002AA913D0449C6240C8073D9B550F34C0	Australia
4222	Centennial Airport	APA	Denver	0101000020E61000008DD5E6FF55365AC00A8B0600F9C84340	United States
4223	Clovis Municipal Airport	CVN	Clovis	0101000020E6100000FF99FF5F0EC559C0CC0500A069364140	United States
4224	Fort Stockton Pecos County Airport	FST	Fort Stockton	0101000020E610000005C6FFBF9FBA59C0D81A00606BEA3E40	United States
4225	Las Vegas Municipal Airport	LVS	Sunrise Manor	0101000020E6100000B4FBFF7F16495AC0651100E0BCD34140	United States
4226	West Houston Airport	IWS	Houston	0101000020E61000005F0500E00BEB57C0ADEFFF7F75D13D40	United States
4227	La Junta Municipal Airport	LHX	La Junta	0101000020E6100000D8840F8093E059C08F8DFE9F5C064340	United States
4228	Las Cruces International Airport	LRU	Las Cruces	0101000020E61000000000000002BB5AC0000000000B254040	United States
4229	Stephens County Airport	BKD	Breckenridge	0101000020E610000033F7FF1F06B958C043F5FF3F085C4040	United States
4230	Draughon Miller Central Texas Regional Airport	TPL	Temple	0101000020E610000000000060195A58C0000000400A273F40	United States
4235	Kaadedhdhoo Airport	KDM	Thinadhoo	0101000020E610000000000040CD3F5240000000C0893DDF3F	Maldives
4242	Tanna Airport	TAH	Isangel	0101000020E6100000000000002B27654000000060817433C0	Vanuatu
4247	El Trompillo Airport	SRZ	Santa Cruz de la Sierra	0101000020E61000009C1100C0F3954FC02ECEFFFFC4CF31C0	Bolivia
4249	Juancho E. Yrausquin Airport	SAB	The Bottom	0101000020E610000000000000299C4FC0000000C01EA53140	Bonaire, Saint Eustatius and Saba 
4250	Eagle County Regional Airport	EGE	Gypsum	0101000020E61000000FD02280C0BA5AC0CD29F9BF40D24340	United States
4253	Cuyahoga County Airport	CGF	Highland Heights	0101000020E6100000870D0020215F54C0ACECFF3F55C84440	United States
4254	Mansfield Lahm Regional Airport	MFD	Mansfield	0101000020E61000000000000010A154C09DF4FF9F23694440	United States
4255	Columbus Metropolitan Airport	CSG	Groveport	0101000020E610000000000000173C55C00000002016424040	United States
4256	Lawton Fort Sill Regional Airport	LAW	Lawton	0101000020E6100000CC0500A0A99A58C0D10E0060AA484140	United States
4257	Fort Collins Loveland Municipal Airport	FNL	Fort Collins	0101000020E61000009F170040B4405AC028E5FF9FD4394440	United States
4261	Flagstaff Pulliam Airport	FLG	Flagstaff	0101000020E610000073ECEA9FF1EA5BC03538F85FBA914140	United States
4262	Lake Tahoe Airport	TVL	South Lake Tahoe	0101000020E610000000000020AEFF5DC0000000606B724340	United States
4263	Joslin Field Magic Valley Regional Airport	TWF	Twin Falls	0101000020E6100000C45E28603B9F5CC0B46701A0AB3D4540	United States
4265	Martha's Vineyard Airport	MVY	East Falmouth	0101000020E6100000050900C050A751C00BF2FF1F51B24440	United States
4268	Concord Municipal Airport	CON	Concord	0101000020E6100000676902A025E051C0BAFF0220F2994540	United States
4270	Groton New London Airport	GON	Groton	0101000020E6100000000000E0E20252C0000000C040AA4440	United States
4271	St Cloud Regional Airport	STC	Saint Cloud	0101000020E610000000000060D58357C000000000F7C54640	United States
4272	Qinhuangdao Beidaihe Airport	BPE	Pakokku	0101000020E610000006465ED6C4C35D4003B5183C4CD54340	Myanmar
4273	Golden Triangle Regional Airport	GTR	Columbus	0101000020E61000004C040080D92556C09CF1FF5FA3B94040	United States
4274	Nizhny Novgorod Strigino International Airport	GOJ	Nizhniy Novgorod	0101000020E6100000440000205AE44540DFFFFFDF731D4C40	Russia
4275	Bowerman Airport	HQM	Hoquiam	0101000020E6100000BD0A00C0F7FB5EC084E7FF3F507C4740	United States
4276	Erie International Tom Ridge Field	ERI	Erie	0101000020E61000004DFDFFA1200B54C0CCFBEDE7A30A4540	United States
4278	Barnstable Municipal Boardman Polando Field	HYA	Barnstable	0101000020E6100000BAFF0220F29151C0B46701A0ABD54440	United States
4280	Sedona Airport	SDX	Sedona	0101000020E6100000F5FFFF9F6EF25BC0370000E09E6C4140	United States
4284	Morgantown Municipal Walter L. Bill Hart Field	MGW	Morgantown	0101000020E6100000F635FD9FA4FA53C039EC00804AD24340	United States
4285	Yeager Airport	CRW	Hanahan	0101000020E610000000000000F76554C0000000C0C12F4340	United States
4286	Wilkes Barre Scranton International Airport	AVP	Scranton	0101000020E6100000610800204CEE52C09D14000054AB4440	United States
4287	Bemidji Regional Airport	BJI	Bemidji	0101000020E61000003E5DFEBFC1BB57C09E46F7FF33C14740	United States
4289	Thangool Airport	THG	Biloela	0101000020E6100000000000A06ED2624000000040707E38C0	Australia
4290	Fagali'i Airport	FGI	Apia	0101000020E610000074E9FF1FAE7765C046FBFFBF88B22BC0	Samoa
4291	Ballina Byron Gateway Airport	BNK	Ballina	0101000020E61000005E0500E0FB316340CF2B00807AD53CC0	Australia
4292	Hector International Airport	FAR	Fargo	0101000020E610000000000020363458C000000080D9754740	United States
4293	Charles B. Wheeler Downtown Airport	MKC	Parkville	0101000020E610000000000060F0A557C000000000C58F4340	United States
4295	Ratanakiri Airport	RBE	Ban Lŭng	0101000020E6100000000000002BBF5A4000000080C2752B40	Cambodia
4296	Gillette Campbell County Airport	GCC	Gillette	0101000020E6100000F32A00007F625AC046FBFFBFA82C4640	United States
4297	Bogashevo Airport	TOF	Tomsk	0101000020E6100000F3FFFFBF544D5540070000A0AD304C40	Russia
4299	Phetchabun Airport	PHY	Phetchabun	0101000020E6100000523000E07A4C5940F20700600EAD3040	Thailand
4300	Chumphon Airport	CJM	Chumphon	0101000020E61000000000002026D7584000000060226C2540	Thailand
4302	Jieyang Chaoshan International Airport	SWA	Shantou	0101000020E6100000EA04341136205D405A643BDF4F8D3740	China
4303	Enghien Moisselles Airport	\\N	Ézanville	0101000020E61000000000002011D3024000000060F0854840	France
4304	Cheddi Jagan International Airport	GEO	Georgetown	0101000020E61000000000006086204DC0000000E083FE1940	Guyana
4305	Guarani International Airport	AGT	Ciudad del Este	0101000020E6100000C576F700DD6B4BC03D821B295B7439C0	Paraguay
4306	Ogle Airport	OGL	Georgetown	0101000020E6100000F10400208E0D4DC00B070080A1391B40	Guyana
4307	Kaieteur International Airport	KAI	Mahdia	0101000020E6100000C7FCFFDFE8BE4DC0B30D00A0E6B01440	Guyana
4309	Ancona Falconara Airport	AOI	Ancona	0101000020E61000007DAEB6627FB92A405CC7B8E2E2CE4540	Italy
4312	Chamonate Airport	CPO	Copiapó	0101000020E610000002030040709A51C091DCFF9F014C3BC0	Chile
4314	Edward Bodden Airfield	LYB	Little Cayman	0101000020E610000000000060660654C000000080C0AA3340	Cayman Islands
4315	Milas Bodrum International Airport	BJV	Bodrum	0101000020E6100000FA1600A00FAA3B401A1000A013A04240	Turkey
4316	Tabarka 7 Novembre Airport	TBJ	Tabarka	0101000020E610000000000040FEC02140000000A0707D4240	Tunisia
4317	Sabiha Gökçen International Airport	SAW	İstanbul	0101000020E61000003A2600C0274F3D40AA09006005734440	Turkey
4318	University Park Airport	SCE	State College	0101000020E6100000880D0020517653C030F4FFDFB56C4440	United States
4319	Broome International Airport	BME	Broome	0101000020E610000000000020D98E5E40000000E0D7F131C0	Australia
4320	Newcastle Airport	NTL	Newcastle	0101000020E610000000000020B0FA624000000080C26540C0	Australia
4322	Klagenfurt Airport	KLU	Klagenfurt am Wörthersee	0101000020E6100000E9B7AF03E7AC2C40ABCE6A813D524740	Austria
4325	Hammerfest Airport	HFT	Hammerfest	0101000020E61000007EFFFF5F29AB3740FCFFFF3F80AB5140	Norway
4328	Vadsø Airport	VDS	Vadsø	0101000020E6100000D8FFFF3F3ED83D40020000E02D845140	Norway
4330	Imam Khomeini International Airport	IKA	Tehran	0101000020E6100000000000407B934940000000C042B54140	Iran
4331	Mashhad International Airport	MHD	Mashhad	0101000020E6100000000000400CD24D40000000001B1E4240	Iran
4333	Ust-Ilimsk Airport	UIK	Ust’-Ilimsk	0101000020E61000000000000029A45940000000C06B114D40	Russia
4336	Abraham Lincoln Capital Airport	SPI	Springfield	0101000020E61000004B32FEBF626B56C0E262FB7F0BEC4340	United States
4338	Cortez Municipal Airport	CEZ	Cortez	0101000020E61000000BF2FF1F31285BC047FBFFBFC8A64240	United States
4339	Yampa Valley Airport	HDN	Hayden	0101000020E6100000FA3CEBBFF3CD5AC035F9FBFF973D4440	United States
4340	Gallup Municipal Airport	GUP	Gallup	0101000020E6100000F32A00007F325BC061E8FFBF6BC14140	United States
4341	Liberal Mid-America Regional Airport	LBL	Liberal	0101000020E610000020AC10A0703D59C015FA0560A8854240	United States
4342	Lamar Municipal Airport	LAA	Lamar	0101000020E610000043F5FF3F08AC59C0E1E9FFDFEB084340	United States
4344	Yellowstone Regional Airport	COD	Cody	0101000020E610000050CAFF3F89415BC030F4FFDF95424640	United States
4345	Ørsta-Volda Airport, Hovden	HOV	Ørsta	0101000020E6100000F8FFFFDFE04B18401F0000400A174F40	Norway
4348	Springfield Branson National Airport	SGF	Springfield	0101000020E61000008584FFDFDE5857C02A330820739F4240	United States
4349	Narvik Framnes Airport	NVK	Narvik	0101000020E61000005C0000C0FE623140FEFFFF1FF61B5140	Norway
4351	Oslo, Fornebu Airport	FBU	Oslo	0101000020E6100000000000A0013C2540000000A0A9F24D40	Norway
4352	Norilsk-Alykel Airport	NSK	Norilsk	0101000020E6100000000000C042D5554000000000E9535140	Russia
4353	Anapa Vityazevo Airport	AAQ	Anapa	0101000020E6100000D6FFFF5F74AC4240CDFFFFDF44804640	Russia
4354	Joplin Regional Airport	JLN	Joplin	0101000020E610000000000020E49F57C0000000206E934240	United States
4355	Lehigh Valley International Airport	ABE	Allentown	0101000020E61000000000002036DC52C00000000078534440	United States
4356	Northwest Arkansas Regional Airport	XNA	Bentonville	0101000020E61000005358A9A0A29357C06667D13B15244240	United States
4357	Atyrau Airport	GUW	Atyrau	0101000020E6100000000000A023E94940000000609A8F4740	Kazakhstan
4358	Kzyl-Orda Southwest Airport	KZO	Kyzylorda	0101000020E610000000000080EB655040000000C07B5A4640	Kazakhstan
4359	South Bend Regional Airport	SBN	South Bend	0101000020E6100000000000A04E9455C0000000A0B6DA4440	United States
4360	Bykovo Airport	BKA	Moscow	0101000020E6100000F0040020AE0743408204006000CF4B40	Russia
4362	Talagi Airport	ARH	Arkhangel’sk	0101000020E6100000000000E0BC5B4440000000606B265040	Russia
4363	Saratov Central Airport	RTW	Saratov	0101000020E610000000000040FA054740000000E051C84940	Russia
4364	Novy Urengoy Airport	NUX	Novyy Urengoy	0101000020E6100000000000A04C2153400000000071845040	Russia
4365	Noyabrsk Airport	NOJ	Noyabrsk	0101000020E6100000000000A047D152400000006076974F40	Russia
4367	Aktau Airport	SCO	Aktau	0101000020E6100000000000A0C68B4940000000C017EE4540	Kazakhstan
4368	Ukhta Airport	UCT	Ukhta	0101000020E61000000000006000E74A400000002090C84F40	Russia
4369	Usinsk Airport	USK	Usinsk	0101000020E61000000000006000AF4C40000000004D805040	Russia
4370	Pechora Airport	PEX	Pechora	0101000020E610000000000000BE904C4000000020C0475040	Russia
4371	Naryan Mar Airport	NNM	Nar'yan-Mar	0101000020E6100000000000609A8F4A40000000C0F5E85040	Russia
4372	Pskov Airport	PKV	Pskov	0101000020E61000000000000046653C40000000E056E44C40	Russia
4373	Kogalym International Airport	KGP	Kogalym	0101000020E6100000000000C029A25240000000005F184F40	Russia
4374	Yemelyanovo Airport	KJA	Krasnoyarsk	0101000020E61000001F000040921F5740C0FFFF9F21164C40	Russia
4375	Sary-Arka Airport	KGF	Karagandy	0101000020E6100000000000C066555240000000C0DCD54840	Kazakhstan
4376	Novosibirsk North Airport	\\N	Novosibirsk	0101000020E61000000000006007BA5440000000E0BC8B4B40	Russia
4377	Uray Airport	URJ	Uray	0101000020E6100000000000A0E8345040000000E0380D4E40	Russia
4379	Ivanovo South Airport	IWA	Ivanovo	0101000020E6100000000000206C784440000000403E784C40	Russia
4380	Longjia Airport	CGQ	Changchun	0101000020E6100000AB6F0000D76B5F401DF3FF7F83FF4540	China
4381	Niigata Airport	KIJ	Niigata	0101000020E61000007EDBFF3FDF63614058F9FFDF5AFA4240	Japan
4383	Smith Field	SMD	Fort Wayne	0101000020E6100000AF0EFC7FC74955C08A73F5DF5A924440	United States
4384	Arcata Airport	ACV	McKinleyville	0101000020E6100000000000E0F9065FC000000060327D4440	United States
4386	Albert J Ellis Airport	OAJ	Half Moon	0101000020E6100000E7F2FF9F2C6753C01CF0FF3F236A4140	United States
4387	Tuscaloosa Regional Airport	TCL	Northport	0101000020E61000000F00002021E755C0180000A03C9C4040	United States
4388	Dubuque Regional Airport	DBQ	Dubuque	0101000020E6100000BCE3FB7F68AD56C0FAE905C074334540	United States
4390	Shun Tak Heliport	\\N	Hong Kong	0101000020E61000006BDAFFDFBC895C409F170040144A3640	Hong Kong
5404	Uru Harbour Airport	ATD	Auki	0101000020E610000019C6DD205A2064403A3B191C25BF21C0	Solomon Islands
5405	Auki Airport	AKS	Auki	0101000020E610000097080000D3156440B9040040B76721C0	Solomon Islands
5407	Fera/Maringe Airport	FRE	Buala	0101000020E610000088BD50C076F26340D7A3703D0A3720C0	Solomon Islands
5408	Babanakira Airport	MBU	Honiara	0101000020E610000000000020D9FA634000000060B87E23C0	Solomon Islands
5409	Ngorangora Airport	IRA	Kirakira	0101000020E6100000E5EFFF5FBC3C644081BEFF1F3FE624C0	Solomon Islands
5410	Santa Cruz/Graciosa Bay/Luova Airport	SCZ	Lata	0101000020E6100000000000A070B9644000000020CB7025C0	Solomon Islands
5412	Nusatupe Airport	GZO	Gizo	0101000020E610000030F4FFDFA59B634082FDFF3F103220C0	Solomon Islands
5419	Buka Airport	BUA	Buka	0101000020E61000000000004089556340000000A074B015C0	Papua New Guinea
5420	Chimbu Airport	CMU	Kundiawa	0101000020E610000000000060121F624000000080DF1818C0	Papua New Guinea
5421	Daru Airport	DAU	Daru	0101000020E6100000BA2700E0A7E661405EFEFFBF6B2C22C0	Papua New Guinea
5422	Gurney Airport	GUR	Alotau	0101000020E6100000FE1C0020B0CA624072A3FFDF7C9F24C0	Papua New Guinea
5423	Girua Airport	PNP	Popondetta	0101000020E610000020D6FF5FE3896240E5FDFF9FEC9B21C0	Papua New Guinea
5424	Kimbe Airport	HKN	Kimbe	0101000020E6100000000000C0F5CC62400000002043D915C0	Papua New Guinea
5425	Kiunga Airport	UNG	Kiunga	0101000020E61000000000002006A9614000000020BA8018C0	Papua New Guinea
5427	Kerema Airport	KMA	Kerema	0101000020E61000005C220000AC38624066F8FF9FBCDA1FC0	Papua New Guinea
5428	Kavieng Airport	KVG	Kavieng	0101000020E6100000DDE0FF1FDBD96240E5F6FF7F9CA204C0	Papua New Guinea
5429	Mendi Airport	MDU	Mendi	0101000020E61000003271AB2006F56140813E9127499718C0	Papua New Guinea
5430	Momote Airport	MAS	Lorengau	0101000020E610000050340F60916D624074982F2FC07E00C0	Papua New Guinea
5433	Tari Airport	TIZ	Tari	0101000020E61000002E11000056DE6140BEF8FF9F476117C0	Papua New Guinea
5435	Tokua Airport	RAB	Kokopo	0101000020E6100000C5190000290C63400B070080A15C11C0	Papua New Guinea
5436	Vanimo Airport	VAI	Vanimo	0101000020E61000005227A089B0A9614043AD69DE718A05C0	Papua New Guinea
5437	Wapenamanda Airport	WBM	Wabag	0101000020E6100000000000E0A3FC614000000040BD9216C0	Papua New Guinea
5438	Alluitsup Paa Heliport	LLU	Qaqortoq	0101000020E6100000A2EE0390DAC846C04850FC18733B4E40	Greenland
5442	Qaqortoq Heliport	JJU	Qaqortoq	0101000020E6100000671AC05FD40347C0B2A3D4899B5B4E40	Greenland
5445	Narsaq Heliport	JNS	Qaqortoq	0101000020E61000009C010090AB0747C0A2D1358569754E40	Greenland
5447	Sisimiut Airport	JHS	Sisimiut	0101000020E6100000D0EBFFBF59DD4AC011FEFF1FE2BC5040	Greenland
5456	Whistler/Green Lake Water Aerodrome	YWS	Whistler	0101000020E610000055790060BCBC5EC00A12008061124940	Canada
5479	Fort Frances Municipal Airport	YAG	Fort Frances	0101000020E610000000000000245C57C0000000E0BC534840	Canada
5493	Texada Gillies Bay Airport	YGB	Powell River	0101000020E6100000000000E026215FC000000080DBD84840	Canada
5500	Vancouver Harbour Water Aerodrome	CXH	Vancouver	0101000020E610000056F6FF9F1AC75EC0F50D00E0AEA54840	Canada
5511	St Georges Airport	YSG	Saint-Georges	0101000020E6100000EDFEFF9FBDAD51C0360000E0560C4740	Canada
5514	Chapais Airport	YMT	Chibougamau	0101000020E610000000000060CCA152C0000000A0CDE24840	Canada
5523	Powell River Airport	YPW	Powell River	0101000020E61000000000000000205FC000000020C7EA4840	Canada
5524	The Pas Airport	YQD	The Pas	0101000020E610000000000000D34559C0000000E056FC4A40	Canada
5538	Bathurst Airport	ZBF	Bathurst	0101000020E6100000D00B00204A6F50C0D2EEFFFF99D04740	Canada
5552	Batna Airport	BLJ	Batna	0101000020E6100000FAF3FFFFFE3B1940A60300E044E04140	Algeria
5553	Béchar Boudghene Ben Ali Lotfi Airport	CBH	Béchar	0101000020E610000000000060AC2802C0000000A04CA53F40	Algeria
5555	Guemar Airport	ELU	Reguiba	0101000020E6100000F70200E06E1B1B40AEEFFF7F75C14040	Algeria
5556	Kumasi Airport	KMS	Kumasi	0101000020E6100000000000A0FF73F9BF000000A0B5DB1A40	Ghana
5557	Heringsdorf Airport	HDF	Ueckermünde	0101000020E6100000CD280040FA4D2C40CDE5FF3F79F04A40	Germany
5558	Heide-Büsum Airport	HEI	Meldorf	0101000020E6100000390A0040A7CD214083040060A0134B40	Germany
5560	Seinäjoki Airport	SJY	Seinäjoki	0101000020E6100000000000A011D53640000000C096584F40	Finland
5561	Nottingham Airport	NQT	Nottingham	0101000020E6100000000000C04744F1BF00000080C2754A40	United Kingdom
5562	Robin Hood Doncaster Sheffield Airport	DSA	Armthorpe	0101000020E610000033E5FFFFA52BF0BF634B524382BD4A40	United Kingdom
5563	Campbeltown Airport	CAL	Ballycastle	0101000020E610000000000000DDBE16C000000020F6B74B40	United Kingdom
5564	Eday Airport	EOI	Kirkwall	0101000020E6100000000000A0812D06C0000000A065984D40	United Kingdom
5567	Papa Westray Airport	PPW	Kirkwall	0101000020E610000030060000C63307C025FFFF7F04AD4D40	United Kingdom
5568	Stronsay Airport	SOY	Kirkwall	0101000020E610000009FDFF1F912105C0860A00E0E0934D40	United Kingdom
5569	Sanday Airport	NDY	Kirkwall	0101000020E610000000000020059D04C0000000E009A04D40	United Kingdom
5570	Lerwick / Tingwall Airport	LWK	Lerwick	0101000020E610000021D9FF9FD3E5F3BFD2EEFFFF99184E40	United Kingdom
5571	Westray Airport	WRY	Kirkwall	0101000020E610000051DFFF9F999907C035FDFF9FD6AC4D40	United Kingdom
5572	Land's End Airport	LEQ	Penzance	0101000020E610000000000040A7AE16C000000080280D4940	United Kingdom
5573	Penzance Heliport	PZE	Penzance	0101000020E6100000DE718A8EE41216C0DECA129D65104940	United Kingdom
5574	Anglesey Airport	VLY	Holyhead	0101000020E6100000FF110020302412C00C1500C0C19F4A40	United Kingdom
5577	Donegal Airport	CFN	Letterkenny	0101000020E61000000000008097AE20C000000060A8854B40	Ireland
5578	Weston Airport	\\N	Leixlip	0101000020E6100000B60500E0C6F119C02AE8FFDF14AD4A40	Ireland
5579	Sindal Airport	CNL	Hjørring	0101000020E61000001C1300E073752440950500C072C04C40	Denmark
5581	Namsos Høknesøra Airport	OSY	Namsos	0101000020E6100000F20000403E282740F7FFFF7F381E5040	Norway
5582	Mo i Rana Airport, Røssvoll	MQN	Mo i Rana	0101000020E61000003CFFFF1F519A2C40FEFFFF1F4A975040	Norway
5583	Rørvik Airport, Ryum	RVK	Namsos	0101000020E6100000EDFEFF9FCD4A2640160000C0A6355040	Norway
5585	Sandane Airport (Anda)	SDN	Volda	0101000020E6100000ECFFFFBF5E6C18402C0000803DEA4E40	Norway
5586	Sogndal Airport	SOG	Sogndal	0101000020E6100000E92B4833168D1C40BBEF181EFB934E40	Norway
5591	Bydgoszcz Ignacy Jan Paderewski Airport	BZG	Bydgoszcz	0101000020E6100000521000804AFA314020F9FFFF638C4A40	Poland
5592	Łódź Władysław Reymont Airport	LCJ	Łódź	0101000020E6100000CE0800E0E96533403CE9FF3F67DC4940	Poland
5593	Åre Östersund Airport	OSD	Östersund	0101000020E6100000BB00006027002D4044000020E2984F40	Sweden
5594	Hagfors Airport	HFS	Sunne	0101000020E6100000000000A065282B40000000A092024E40	Sweden
5595	Karlstad Airport	KSD	Karlstad	0101000020E6100000FFFCFFBFBFAC2A40E1E9FFDFEBB84D40	Sweden
5596	Torsby Airport	TYF	Sunne	0101000020E6100000DFE6FF9F8BFB294064EEFF3F2C144E40	Sweden
5597	Ängelholm-Helsingborg Airport	AGH	Ängelholm	0101000020E610000000000020B7B12940000000A0E6254C40	Sweden
5602	Ventspils International Airport	VTS	Ventspils	0101000020E610000088EDFFBF508B3540E5EFFF5FCCAD4C40	Latvia
5603	Rand Airport	QRA	Johannesburg	0101000020E6100000ABE9FFFFB4263C40A11A0080143E3AC0	South Africa
5604	Kruger Mpumalanga International Airport	MQP	Mpumalanga	0101000020E6100000BF3000A0081B3F40481E0060196239C0	South Africa
5605	Malamala Airport	AAM	Thulamahashi	0101000020E6100000000000E06A8B3F40000000006FD138C0	South Africa
5606	Mmabatho International Airport	MBD	Mahikeng	0101000020E61000004C0700C0498C394022F9FFFF63CC39C0	South Africa
5607	Ghanzi Airport	GNZ	Ghanzi	0101000020E61000000000004079A83540000000A047B135C0	Botswana
5608	Orapa Airport	ORP	Orapa	0101000020E6100000000000401351394000000080464435C0	Botswana
5609	Shakawe Airport	SWX	Shakawe	0101000020E61000000000004025D53540000000E0B75F32C0	Botswana
5611	Ngot Nzoungou Airport	DIS	Dolisie	0101000020E6100000C442AD69DE5129404F1E166A4DD310C0	Republic of the Congo
5612	Chipata Airport	CIP	Chipata	0101000020E610000000000060294B404000000080D91D2BC0	Zambia
5614	Iconi Airport	YVA	Moroni	0101000020E61000003F0F0020389F45406F030000EE6B27C0	Comoros
5617	Belo sur Tsiribihina Airport	BMD	Belo sur Tsiribihina	0101000020E6100000E51200005D454640E0E6FF9FCBAF33C0	Madagascar
5618	Maintirano Airport	MXT	Maintirano	0101000020E61000000000006039044640000000C0CC0C32C0	Madagascar
5621	Tsiroanomandidy Airport	WTS	Tsiroanomandidy	0101000020E61000004DFBFF9BEB064740A246AD297AC232C0	Madagascar
5622	Ambatondrazaka Airport	WAM	Ambatondrazaka	0101000020E610000075FCFF8FA63848406B7AF0DD9DCB31C0	Madagascar
5624	Ambanja Airport	\\N	Ambanja	0101000020E61000001FF30181CE3A484034BA83D8994A2BC0	Madagascar
5627	Nasa Shuttle Landing Facility Airport	TTS	Tsaratanana	0101000020E6100000000000C0722C54C0000000A0709D3C40	Madagascar
5628	Mandritsara Airport	WMA	Antsirabe Afovoany	0101000020E6100000851A0010A96A48403EC7BB7385AA2FC0	Madagascar
5630	Catumbela Airport	CBT	Catumbela	0101000020E610000045D8F0F44AF92A40857CD0B359F528C0	Angola
5632	Ngjiva Pereira Airport	VPE	Ondjiva	0101000020E6100000CD6800001B5E2F40932200E0220B31C0	Angola
5633	Namibe Airport	MSZ	Namibe	0101000020E610000000000060294B284000000000BC852EC0	Angola
5634	Koulamoutou Mabimbi Airport	KOU	Koulamoutou	0101000020E610000044000020F2E12840A4FFFF9F29F4F2BF	Gabon
5635	Mouilla Ville Airport	MJL	Mouila	0101000020E6100000000000C0071D264000000080B185FDBF	Gabon
5636	Tchibanga Airport	TCH	Tchibanga	0101000020E610000000000040B4082640000000C0CCCC06C0	Gabon
5637	Chimoio Airport	VPY	Chimoio	0101000020E610000000000080E9B64040000000A0BB2633C0	Mozambique
5639	Sarh Airport	SRH	Sarh	0101000020E6100000000000A0D85F324000000000F4492240	Chad
5640	Club Makokola Airport	CMK	Mangochi	0101000020E6100000000000C0F590414000000000229D2CC0	Malawi
5641	Luderitz Airport	LUD	Lüderitz	0101000020E6100000000000605D7C2E4000000080F9AF3AC0	Namibia
5642	Ondangwa Airport	OND	Ondangwa	0101000020E6100000D656EC2FBBE72F408350DEC7D1E031C0	Namibia
5643	Oranjemund Airport	OMD	Oranjemund	0101000020E6100000000000E05A723040000000E0AE953CC0	Namibia
5644	Swakopmund Airport	SWP	Swakopmund	0101000020E610000023000000DE222D4092FFFF3F72A936C0	Namibia
5645	Eros Airport	ERS	Windhoek	0101000020E6100000000000209514314000000020B99C36C0	Namibia
5659	La Gomera Airport	GMZ	San Sebastián de la Gomera	0101000020E610000000000000F03631C0000000E093073C40	Spain
5662	Sherbro International Airport	BTE	Bonthe	0101000020E610000000000040AD0929C0000000C032211E40	Sierra Leone
5663	Bo Airport	KBS	Bo	0101000020E6100000000000C0A18527C0000000C010C71F40	Sierra Leone
5664	Kenema Airport	KEN	Kenema	0101000020E6100000000000606B5A26C000000060AE901F40	Sierra Leone
5665	Osvaldo Vieira International Airport	OXB	Bissau	0101000020E6100000000000C0B14E2FC00000004023CA2740	Guinea-Bissau
5669	Smara Airport	SMW	Smara	0101000020E6100000742497FF905E27C07A36AB3E57BB3A40	Western Sahara
5670	Dakhla Airport	VIL	Dakhla	0101000020E610000077BE9F1A2FDD2FC080B74082E2B73740	Western Sahara
5671	Mogador Airport	ESU	Essaouira	0101000020E6100000A0F7FFDF035D23C0111E0080C2653F40	Morocco
5672	Hassan I Airport	EUN	Laayoune	0101000020E610000000917EFB3A702AC0FED5E3BED5263B40	Western Sahara
5673	Nador International Airport	NDR	Nador	0101000020E6100000AF120020C63908C089F0FFFF907E4140	Morocco
5674	Praia International Airport	RAI	Praia	0101000020E610000000000000567E37C00000002058D92D40	Cape Verde
5675	São Filipe Airport	SFL	São Filipe	0101000020E61000000FD8FF3FE17A38C0F12700C01EC52D40	Cape Verde
5676	Baco Airport	BCO	Bako	0101000020E61000000E2DB29DEF474240FD135CACA8211740	Ethiopia
5678	Combolcha Airport	DSE	Kombolcha	0101000020E6100000000000200FDB4340000000803D2A2640	Ethiopia
5679	Dembidollo Airport	DEM	Dembī Dolo	0101000020E610000000000000D36D4140000000E0A51B2140	Ethiopia
5681	Gore Airport	GOR	Gorē	0101000020E6100000ADFA5C6DC5C6414018265305A3522040	Ethiopia
5683	Mizan Teferi Airport	MTF	Mīzan Teferī	0101000020E6100000AC8BDB6800C74140A301BC0512D41B40	Ethiopia
5684	Tippi Airport	TIE	Tippi	0101000020E610000085EB51B81EB5414073D712F241CF1C40	Ethiopia
5685	Alula Airport	ALU	Caluula	0101000020E610000039B4C876BE5F4940ED0DBE3099EA2740	Somalia
5686	Bosaso Airport	BSA	Bosaso	0101000020E6100000000000801F93484000000020F48C2640	Somalia
5687	Aden Adde International Airport	MGQ	Mogadishu	0101000020E61000000000006000A74640000000C0921D0040	Somalia
5688	Galcaio Airport	GLK	Gaalkacyo	0101000020E61000001B1000A033BA474011F0FFDF911F1B40	Somalia
5689	Burao Airport	BUO	Burao	0101000020E6100000744694F606C74640AE47E17A140E2340	Somalia
5690	El Arish International Airport	AAC	Arish	0101000020E6100000DC000080FBEA4040192D00C0C3123F40	Egypt
5691	Assiut International Airport	ATZ	Asyūţ	0101000020E610000019CAFF5F12033F40BDEAFF5FE70B3B40	Egypt
5694	Malindi Airport	MYD	Malindi	0101000020E610000000000080040D444000000080A0D509C0	Kenya
5695	Nanyuki Airport	NYK	Nanyuki	0101000020E6100000000000C03F854240000000A0BFF2AFBF	Kenya
5696	Gardabya Airport	SRX	Sirte	0101000020E6100000093200E0519830400912008041103F40	Libya
5697	Gamal Abdel Nasser Airport	TOB	Tobruk	0101000020E6100000D578E92631E8374023DBF97E6ADC3F40	Libya
5698	Mitiga Airport	MJI	Tripoli	0101000020E6100000000000E04F8D2A40000000E071724040	Libya
5699	La Abraq Airport	LAQ	Al Bayḑā’	0101000020E610000000000060DCF6354000000020F4644040	Libya
5700	Atbara Airport	ATB	Atbara	0101000020E6100000000000604C07414000000020D9B53140	Sudan
5701	Nyala Airport	UYL	Nyala	0101000020E610000000000080C9F4384000000060641B2840	Sudan
5702	Port Sudan New International Airport	PZU	Port Sudan	0101000020E610000000000000F79D424000000060006F3340	Sudan
5703	Bukoba Airport	BKZ	Bukoba	0101000020E6100000A779C7293AD23F401D5A643BDF4FF5BF	Tanzania
5704	Kigoma Airport	TKQ	Kigoma	0101000020E6100000EBE2361AC0AB3D405DDC4603788B13C0	Tanzania
5705	Kikwetu Airport	LDI	Lindi	0101000020E6100000000000A0FFE04340000000C0C4B323C0	Tanzania
5706	Musoma Airport	MUZ	Musoma	0101000020E6100000910F7A36ABE640403F355EBA490CF8BF	Tanzania
5707	Shinyanga Airport	SHY	Shinyanga	0101000020E61000009CC420B072C04040569FABADD8DF0CC0	Tanzania
5708	Tabora Airport	TBO	Tabora	0101000020E6100000000000A0A96A404000000020394E14C0	Tanzania
5709	Arua Airport	RUA	Arua	0101000020E610000000000080C0EA3E400000006066660840	Uganda
5710	Gulu Airport	ULU	Gulu	0101000020E610000000000060CA22404000000080C9710640	Uganda
5711	Diu Airport	DIU	Diu	0101000020E610000000000040F3BA5140000000C08DB63440	India
5714	Aberdeen Regional Airport	ABR	Aberdeen	0101000020E6100000000000C0FE9A58C0000000207CB94640	United States
5715	Southwest Georgia Regional Airport	ABY	Colonie	0101000020E6100000000000C0720C55C00000008016893F40	United States
5716	Athens Ben Epps Airport	AHN	Athens	0101000020E610000000000020E2D454C0000000C06BF94040	United States
5717	Alamogordo White Sands Regional Airport	ALM	Alamogordo	0101000020E61000007283FF7F6C7F5AC08C1600E0816B4040	United States
5718	Waterloo Regional Airport	ALO	Cedar Falls	0101000020E6100000000000809E1957C0000000004F474540	United States
5719	Walla Walla Regional Airport	ALW	Walla Walla	0101000020E6100000B0CBF09F6E925DC09FACF79F250C4740	United States
5720	Alpena County Regional Airport	APN	Alpena	0101000020E6100000694DFBFFDBE354C0C52F0620FF894640	United States
5721	Watertown Regional Airport	ATY	Watertown	0101000020E610000010E0FC9FE64958C01F99F5FFFD744640	United States
5722	Bradford Regional Airport	BFD	Bradford	0101000020E610000000000060F7A853C000000000CCE64440	United States
5723	Western Neb. Rgnl/William B. Heilig Airport	BFF	Scottsbluff	0101000020E610000029B91EE024E659C0CF770140DFEF4440	United States
5724	Raleigh County Memorial Airport	BKW	Beckley	0101000020E6100000160700E0F24754C02F140040C6E44240	United States
5725	Brunswick Golden Isles Airport	BQK	Country Club Estates	0101000020E610000000000020DB5D54C0000000C040423F40	United States
5726	Southeast Iowa Regional Airport	BRL	South Burlington	0101000020E61000000000004008C856C0000000E03F644440	United States
5727	Jack Mc Namara Field Airport	CEC	Crescent City	0101000020E6100000C66AF3FF2A0F5FC000C103A0DDE34440	United States
5728	Cape Girardeau Regional Airport	CGI	Cape Girardeau	0101000020E610000000000000886456C0000000A0D69C4240	United States
5729	Chippewa County International Airport	CIU	Sault Ste. Marie	0101000020E6100000000000C03B1E55C0000000401A204740	United States
5730	North Central West Virginia Airport	CKB	Bridgeport	0101000020E61000004A010040990E54C0B8010000F7A54340	United States
5731	William R Fairchild International Airport	CLM	Port Angeles	0101000020E61000000000000000E05EC0000000C0620F4840	United States
5732	Houghton County Memorial Airport	CMX	Houghton	0101000020E6100000000000604D1F56C0000000208E954740	United States
5733	Dodge City Regional Airport	DDC	Dodge City	0101000020E610000000000060CCFD58C000000020B7E14240	United States
5734	DuBois Regional Airport	DUJ	DuBois	0101000020E610000010A1004084B953C0A094FF7FD2964440	United States
5735	Chippewa Valley Regional Airport	EAU	Eau Claire	0101000020E6100000000000C0FEDE56C000000080D26E4640	United States
5736	Elko Regional Airport	EKO	Elko	0101000020E610000000000020B0F25CC00000006096694440	United States
5737	New Bedford Regional Airport	EWB	New Bedford	0101000020E6100000000000E03DBD51C0000000808AD64440	United States
5738	Fayetteville Regional Grannis Field	FAY	Fayetteville	0101000020E6100000000000E056B853C0000000A0DF7E4140	United States
5740	Central Nebraska Regional Airport	GRI	Grand Island	0101000020E610000000000080D09358C000000000D77B4440	United States
5741	Memorial Field	HOT	Hot Springs	0101000020E610000000000020284657C0000000202F3D4140	United States
5742	Tri-State/Milton J. Ferguson Field	HTS	Huntington	0101000020E61000005BFA0240B6A354C032AF0200F02E4340	United States
5743	Kili Airport	KIO	Kili	0101000020E610000000000000D3236540000000C0FB931640	Marshall Islands
5744	Kirksville Regional Airport	IRK	Kirksville	0101000020E6100000000000A0DF2257C0000000C0F70B4440	United States
5745	Jamestown Regional Airport	JMS	Jamestown	0101000020E6100000811302A067AB58C08336F75F00774740	United States
5746	Laramie Regional Airport	LAR	Laramie	0101000020E610000000000040336B5AC0000000E0F2A74440	United States
5747	Arnold Palmer Regional Airport	LBE	Latrobe	0101000020E6100000A7530540E8D953C09B7AF6BF50234440	United States
5748	North Platte Regional Airport Lee Bird Field	LBF	North Platte	0101000020E6100000AC81F79FC62B59C0A4C6006027904440	United States
5749	Lebanon Municipal Airport	LEB	Lebanon	0101000020E6100000BF0D0000781352C020F9FFFF23D04540	United States
5750	Klamath Falls Airport	LMT	Klamath Falls	0101000020E610000000000080E96E5EC000000020FB134540	United States
5751	Lancaster Airport	LNS	Lititz	0101000020E610000000000040F31253C0000000E0930F4440	United States
5752	Lewistown Municipal Airport	LWT	Lewistown	0101000020E610000000000060E35D5BC0000000804F864740	United States
5753	Lynchburg Regional Preston Glenn Field	LYH	Timberlake	0101000020E610000000000060D3CC53C000000040D1A94240	United States
5754	Muskegon County Airport	MKG	Muskegon	0101000020E61000000D9603A03E8F55C0F242F81FB2954540	United States
5755	Frank Wiley Field	MLS	Miles City	0101000020E610000000000040B4785AC0000000C0C8364740	United States
5756	Northwest Alabama Regional Airport	MSL	Muscle Shoals	0101000020E6100000FC0CFB7F0DE755C0EA9FF9FF655F4140	United States
5757	Southwest Oregon Regional Airport	OTH	North Bend	0101000020E610000000000080BE0F5FC00000008063B54540	United States
5758	Owensboro Daviess County Airport	OWB	Owensboro	0101000020E6100000392BFDDFACCA55C082B8FE9FBBDE4240	United States
5759	Hattiesburg Laurel Regional Airport	PIB	Petal	0101000020E610000000000000935556C0000000E093773F40	United States
5760	Pocatello Regional Airport	PIH	Pocatello	0101000020E6100000000000E024265CC00000006074744540	United States
5761	Pierre Regional Airport	PIR	Pierre	0101000020E61000007F43F2DF4D1259C04FE2F75FFC304640	United States
5762	Pellston Regional Airport of Emmet County Airport	PLN	Petoskey	0101000020E6100000E4C8FB1FFD3255C06DBEF83F13C94640	United States
5763	Portsmouth International at Pease Airport	PSM	Portsmouth	0101000020E6100000070C0000B1B451C0431500A0F8894540	United States
5764	Reading Regional Carl A Spaatz Field	RDG	Wyomissing	0101000020E6100000000000E0C5FD52C0000000C072304440	United States
5765	Rhinelander Oneida County Airport	RHI	Rhinelander	0101000020E610000000000080EB5D56C000000020CBD04640	United States
5766	Rock Springs Sweetwater County Airport	RKS	Rock Springs	0101000020E6100000568AD3FF28445BC081D0F6BF0ECC4440	United States
5767	Rutland - Southern Vermont Regional Airport	RUT	Rutland	0101000020E6100000294B0040C63C52C00D14FC5FC3C34540	United States
5768	San Luis County Regional Airport	SBP	San Luis Obispo	0101000020E6100000B4FBFF7F16295EC0791500804F9E4140	United States
5769	Sheridan County Airport	SHR	Sheridan	0101000020E610000000000060B8BE5AC00000002075624640	United States
5770	Adirondack Regional Airport	SLK	Saranac Lake	0101000020E610000000000060328D52C00000008051314640	United States
5771	Salina Municipal Airport	SLN	Salina	0101000020E6100000000000A0BD6958C0000000803F654340	United States
5772	Santa Maria Pub/Capt G Allan Hancock Field	SMX	Santa Maria	0101000020E6100000F12FDD7F3F1D5EC0938003200F734140	United States
5773	Tupelo Regional Airport	TUP	Tupelo	0101000020E610000000000000463156C00000002051224140	United States
5774	Quincy Regional Baldwin Field	UIN	Quincy	0101000020E6100000B0F6036074CC56C067E7FA5FAAF84340	United States
5775	Victoria Regional Airport	VCT	Victoria	0101000020E6100000000000C0C83A58C00000000044DA3C40	United States
5776	Valdosta Regional Airport	VLD	Valdosta	0101000020E610000000000080B5D154C0000000E051C83E40	United States
5777	Worland Municipal Airport	WRL	Worland	0101000020E610000000000020DDFC5AC0000000009CFB4540	United States
5779	Yakima Air Terminal McAllister Field	YKM	Yakima	0101000020E61000004264ECDFD0225EC047E804C0BA484740	United States
5780	Ercan International Airport	ECN	Nicosia	0101000020E61000000000004080BF404000000040CD934140	Cyprus
5781	Logroño-Agoncillo Airport	RJL	Logroño	0101000020E610000082EFFFFFEF9302C0C2AF1F86003B4540	Spain
5782	Île d'Yeu Airport	IDY	Saint-Jean-de-Monts	0101000020E610000000000040FE2003C000000020FB5B4740	France
5783	Angers-Loire Airport	ANE	Beaufort-en-Vallée	0101000020E61000000000000072FBD3BF000000E0B7C74740	France
5786	La Môle Airport	LTT	Cavalaire-sur-Mer	0101000020E61000000000006091ED1940000000804A9A4540	France
5787	Syros Airport	JSY	Ermoúpolis	0101000020E6100000F6CDFF1F6EF33840F4EAFF3F1EB64240	Greece
5788	Pécs-Pogány Airport	PEV	Pécs	0101000020E61000008177F2E9B13D3240FED5E3BED5FE4640	Hungary
5789	Győr-Pér International Airport	QGY	Győr	0101000020E61000002EFEB62748D031407B4B395FECCF4740	Hungary
5790	Sármellék International Airport	SOB	Keszthely	0101000020E61000001E51A1BAB928314066A208A9DB574740	Hungary
5791	Aosta Airport	AOT	Aosta	0101000020E6100000448655BC91791D4079909E2287DE4640	Italy
5792	Salerno Costa d'Amalfi Airport	QSR	Salerno	0101000020E61000008AB0E1E995D22D404DBC033C694F4440	Italy
5794	Banja Luka International Airport	BNX	Banja Luka	0101000020E610000000000000294C3140000000C07F784640	Bosnia and Herzegovina
5795	Uşak Airport	USQ	Uşak	0101000020E610000000000060C1783D40000000603B574340	Turkey
5796	Kars Airport	KSY	Kars	0101000020E610000000000060B88E454000000020F6474440	Turkey
5797	Şanlıurfa Airport	SFQ	Şanlıurfa	0101000020E6100000000000C06D6C434000000000128C4240	Turkey
5798	Kahramanmaraş Airport	KCM	Kahramanmaraş	0101000020E610000069F7FFFF0C7A4240C0100040F8C44240	Turkey
5799	Ağrı Airport	AJI	Ağrı	0101000020E6100000000000405383454000000000C8D34340	Turkey
5800	Adıyaman Airport	ADF	Adıyaman	0101000020E6100000A70300E0043C4340F6EDFF7F9EDD4240	Turkey
5801	Süleyman Demirel International Airport	ISE	Isparta	0101000020E61000007FDEFF7F4F5E3E40F1E4FFBF7DED4240	Turkey
5802	Balıkesir Körfez Airport	EDO	Edremit	0101000020E6100000BE2D006088033B4067140020FDC64340	Turkey
5803	Samsun Çarşamba Airport	SZF	Samsun	0101000020E6100000B343FCC3964842404FE61F7D93A04440	Turkey
5806	Žilina Airport	ILZ	Bytča	0101000020E6100000F20700600E9D32400B1500C0A19D4840	Slovakia
5807	JAGS McCartney International Airport	GDT	Cockburn Town	0101000020E6100000000000801BC951C0000000C0CA713540	Turks and Caicos Islands
5809	Salt Cay Airport	SLX	Cockburn Town	0101000020E610000067F4FFBFCCCC51C0FCF9FF7F3F553540	Turks and Caicos Islands
5810	Samaná El Catey International Airport	AZS	Samaná	0101000020E6100000E8F5FFDF7C6F51C04D2700205A443340	Dominican Republic
5811	La Isabela International Airport	JBQ	Santo Domingo	0101000020E610000000000020147F51C0000000608F923240	Dominican Republic
5812	Puerto Barrios Airport	PBR	Puerto Barrios	0101000020E6100000000000005D2556C00000008038762F40	Guatemala
5813	Quezaltenango Airport	AAZ	Quetzaltenango	0101000020E6100000000000C020E056C0000000E02FBB2D40	Guatemala
5814	Utirik Airport	UTK	Utrik	0101000020E6100000E960FD9F433B65408B6CE7FBA9712640	Marshall Islands
5832	Puerto Lempira Airport	PEU	Puerto Lempira	0101000020E6100000EFAEB321FFF154C0BC0512143F862E40	Honduras
5833	Mili Island Airport	MIJ	Mili	0101000020E6100000000000C0747765400000008054551840	Marshall Islands
5834	Captain Rogelio Castillo National Airport	CYW	Celaya	0101000020E61000003CA1D79FC43859C0B29DEFA7C68B3440	Mexico
5835	Ciudad Constitución Airport	CUA	Ciudad Constitución	0101000020E6100000210000205CE75BC0490000E0C50D3940	Mexico
5837	El Lencero Airport	JAL	Jacarandas	0101000020E6100000500D00400A3358C081010020A0793340	Mexico
5838	Alonso Valderrama Airport	CTD	Chitré	0101000020E610000000000080381A54C0000000608CF31F40	Panama
5839	Enrique Adolfo Jimenez Airport	ONX	Colón	0101000020E61000000000008083F753C00000008099B62240	Panama
5841	Captain Ramon Xatruch Airport	PLP	La Palma	0101000020E6100000000000A0118953C00000000037D02040	Panama
5842	Aerotortuguero Airport	TTQ	Guácimo	0101000020E61000005EBA490C02E754C0D7A3703D0AD72440	Costa Rica
5844	Cabo Velas Airport	TNO	Nicoya	0101000020E6100000020000E0957655C0F20000401EB62440	Costa Rica
5845	Islita Airport	PBP	Nicoya	0101000020E610000000000020BB5755C00000000054B62340	Costa Rica
5847	Puerto Jimenez Airport	PJM	Golfito	0101000020E61000000000004033D354C0000000A010112140	Costa Rica
5848	Tobias Bolanos International Airport	SYQ	Alajuela	0101000020E610000000000080F20855C00000008002EA2340	Costa Rica
5849	Playa Samara Airport	\\N	Nicoya	0101000020E610000000000020B05A55C00000000000802440	Costa Rica
5850	Jérémie Airport	JEE	Jérémie	0101000020E610000000000040E68A52C0000000E0C0A93240	Haiti
5851	Port-de-Paix Airport	PAX	Port-de-Paix	0101000020E6100000000000804F3652C00000006000EF3340	Haiti
5852	Cayo Coco Airport	\\N	Morón	0101000020E610000023FCFF3FB4A053C0880D002061833640	Cuba
5853	Alberto Delgado Airport	TND	Trinidad	0101000020E610000000000020D2FF53C000000000CEC93540	Cuba
5857	Arthur's Town Airport	ATC	Arthur’s Town	0101000020E6100000FDF9FF7F1FEB52C08204006020A13840	Bahamas
5858	New Bight Airport	CAT	Arthur’s Town	0101000020E610000000000080F2DC52C000000080B7503840	Bahamas
5859	Colonel Hill Airport	CRI	Colonel Hill	0101000020E6100000E30C0080AC8B52C07DFBFF9FDFBE3640	Bahamas
5860	Nassau Paradise Island Airport	PID	Nassau	0101000020E610000000000040335353C0000000803F153940	Bahamas
5868	Malolo Lailai Island Airport	PTF	Nadi	0101000020E6100000E93800E04D26664024FFFF7F24C731C0	Fiji
5870	Mana Island Airport	MNF	Nadi	0101000020E610000099EBFFDF2223664085E7FF3F50AC31C0	Fiji
5872	Ngau Airport	NGI	Levuka	0101000020E6100000080F0040E16A6640C4D6FFFF971D32C0	Fiji
5874	Labasa Airport	LBS	Labasa	0101000020E610000000000040E16A6640000000A0797730C0	Fiji
5877	Rotuma Airport	RTA	Ahau	0101000020E6100000000000A045226640000000400AF728C0	Fiji
5878	Savusavu Airport	SVU	Labasa	0101000020E61000004C040080E96A66401C33004084CD30C0	Fiji
5879	Kaufana Airport	EUA	‘Ohonua	0101000020E6100000BA2700E0A7DE65C0C7D9FF3FD86035C0	Tonga
5880	Lifuka Island Airport	HPA	Pangai	0101000020E610000000000080E9CA65C000000080E9C633C0	Tonga
5882	Kuini Lavenia Airport	NTT	Hihifo	0101000020E6100000D9D9FF1C50B965C0B01EC89965F42FC0	Tonga
5884	Niue International Airport	IUE	Alofi	0101000020E6100000000000809E3D65C0000000603B1433C0	Niue
5885	Pointe Vele Airport	FUT	Alo	0101000020E6100000E02900A01C4266C002E3FFDF6F9F2CC0	Wallis and Futuna
5887	Maota Airport	MXS	Vailoa	0101000020E610000000000080418865C0000000C00E7C2BC0	Samoa
5891	Ua Pou Airport	UAP	Taiohae	0101000020E6100000000000007F8261C0000000200EB422C0	French Polynesia
5893	Mota Lava Airport	MTV	Sola	0101000020E6100000CADFFFBFC8F66440F3E7FFFFFD542BC0	Vanuatu
5894	Sola Airport	SLH	Sola	0101000020E610000080BEFF1F2FF1644090FCFFFF11B42BC0	Vanuatu
5898	Longana Airport	LOD	Saratamata	0101000020E610000091DCFF9FF1FE644040EFFFBF079D2EC0	Vanuatu
5899	Sara Airport	SSR	Saratamata	0101000020E610000067140020DD046540612B00C00CF12EC0	Vanuatu
5903	Maewo-Naone Airport	MWF	Saratamata	0101000020E6100000BA2700E0A70265400000000000002EC0	Vanuatu
5905	Norsup Airport	NUS	Lakatoro	0101000020E610000000000000D5EC644000000040671430C0	Vanuatu
5906	Gaua Island Airport	ZGU	Sola	0101000020E6100000CADFFFBFC8F2644059DCFFBFAA6F2CC0	Vanuatu
5907	Redcliffe Airport	RCL	Saratamata	0101000020E610000041120060B8FA644048410000AAF12EC0	Vanuatu
5908	Santo Pekoa International Airport	SON	Luganville	0101000020E6100000CD2800400AE7644004A6FF5F8F022FC0	Vanuatu
5912	Southwest Bay Airport	SWJ	Lakatoro	0101000020E6100000AED85F764FEE64403FC6DCB5847C30C0	Vanuatu
5915	Aniwa Airport	AWD	Isangel	0101000020E61000005305A3923A33654040A4DFBE0E3C33C0	Vanuatu
5922	Fayzabad Airport	FBD	Fayzabad	0101000020E6100000F7C9518028A15140A741D13C808F4240	Afghanistan
5924	Dawadmi Domestic Airport	DWD	Ad Dawādimī	0101000020E610000000000040333346400000000000803840	Saudi Arabia
5925	Al-Jawf Domestic Airport	AJF	Sakakah	0101000020E6100000000000C0CC0C444000000060FCC83D40	Saudi Arabia
5926	Wadi Al Dawasir Airport	EWD	As Sulayyil	0101000020E610000065F1FF7F8C994640D1EBFFBF19813440	Saudi Arabia
5927	Khoram Abad Airport	KHD	Khorramabad	0101000020E6100000000000203624484000000020BBB74040	Iran
5928	Bam Airport	BXR	Bam	0101000020E6100000000000A099394D40000000208E153D40	Iran
5929	Rafsanjan Airport	RJN	Rafsanjān	0101000020E6100000000000808A064C4000000020364C3E40	Iran
5930	Bojnord Airport	BJB	Bojnūrd	0101000020E61000000000002073A74C40000000A01ABF4240	Iran
5931	Sabzevar National Airport	AFZ	Sabzevar	0101000020E6100000000000802FCC4C400000004084154240	Iran
5932	Noshahr Airport	NSH	Nowshahr	0101000020E6100000000000407BBB494000000000E7544240	Iran
5933	Dasht-e Naz Airport	SRY	Nekā	0101000020E6100000C0F0FFDFC7984A408C1600E061514240	Iran
5934	Lar Airport	LRR	Gerāsh	0101000020E610000083E4FFFF0F314B404CE4FF1FB9AC3B40	Iran
5935	Ardabil Airport	ADU	Ardabīl	0101000020E6100000950500C05236484086EAFF7FB0294340	Iran
5936	Urmia Airport	OMH	Orūmīyeh	0101000020E6100000D6170020CB88464022FCFF3F84D54240	Iran
5937	Al Ain International Airport	AAN	Al Ain	0101000020E610000000000040FACD4B40000000C0FE423840	United Arab Emirates
5938	Bannu Airport	BNP	Bannu	0101000020E610000000000020C9A1514000000000887C4040	Pakistan
5939	Bahawalpur Airport	BHV	Bahāwalpur	0101000020E6100000000000C0F3ED5140000000201D593D40	Pakistan
5941	Dalbandin Airport	DBA	Dālbandīn	0101000020E610000034FAFF5F96195040C7D9FF3FD8E03C40	Pakistan
5942	Dera Ghazi Khan Airport	DEA	Dera Ghazi Khan	0101000020E610000000000000199F51400000002004F63D40	Pakistan
5943	Dera Ismael Khan Airport	DSK	Shorkot	0101000020E6100000000000E061B9514000000080CEE83F40	Pakistan
5944	Jiwani Airport	JIW	Jīwani	0101000020E61000003A06006017E74E40563600605B113940	Pakistan
5945	Hyderabad Airport	HDD	Hyderabad	0101000020E6100000F00400206E175140750F00006F513940	Pakistan
5946	Khuzdar Airport	KDD	Khuzdār	0101000020E6100000EBFBFF5F6DA95040260200C064CA3B40	Pakistan
5947	Ormara Airport	ORW	Ormāra	0101000020E6100000060C000081255040940500C052463940	Pakistan
5948	Parachinar Airport	PAJ	Parachinar	0101000020E6100000A806002095845140BF0D000078F34040	Pakistan
5950	Sehwan Sharif Airport	SYW	Bhān	0101000020E6100000000000A0E6ED5040000000201D793A40	Pakistan
5951	Turbat International Airport	TUK	Turbat	0101000020E6100000000000A0DD834F40000000C084FC3940	Pakistan
5952	Sulaymaniyah International Airport	ISU	As Sulaymānīyah	0101000020E6100000D41400E08AA84640BDEAFF5FE7C74140	Iraq
5953	Kamishly Airport	KAC	Ad Darbāsīyah	0101000020E6100000000000C07F98444000000000A3824240	Syria
5989	Kalaupapa Airport	LUP	Napili-Honokowai	0101000020E6100000C66AF3FF2A9F63C0DA3DF51F04363540	United States
5990	Eniwetok Airport	ENT	Enewetak	0101000020E6100000000000007F4A64400000004070AE2640	Marshall Islands
5992	Hengchun Airport	HCN	Hengchun	0101000020E610000000000060B82E5E4000000080850A3640	Taiwan
5994	Kushiro Airport	KUH	Kushiro	0101000020E610000069F7FFFF2C066240FCF9FF7F3F854540	Japan
5995	Okadama Airport	OKD	Sapporo	0101000020E61000000000000029AC614000000060DC8E4540	Japan
5996	Saga Airport	HSG	Saga	0101000020E6100000D2EEFFFFA9496040CA02006029934040	Japan
5997	Nagoya Airport	NKM	Nagoya	0101000020E610000000000060911D6140000000E0A3A04140	Japan
5998	Iwami Airport	IWJ	Masuda	0101000020E6100000BFEDFF9F477960409F17004094564140	Japan
5999	Fukushima Airport	FKS	Fukushima	0101000020E6100000000000C0CA8D6140000000801B9D4240	Japan
6000	Odate Noshiro Airport	ONJ	Takanosu	0101000020E61000007EDBFF3FDF8B614004E6FF1F90184440	Japan
6001	Shonai Airport	SYO	Matsumoto	0101000020E610000080BEFF1F2F79614031F7FF1FF6674340	Japan
6003	Kunsan Air Base	KUV	Gunsan	0101000020E6100000000000806CA75F40000000C0AFF34140	South Korea
6006	Yangyang International Airport	YNY	Sokcho	0101000020E61000000000008068156040000000A0D8074340	South Korea
6007	Sacheon Air Base	HIN	Chinju	0101000020E6100000000000803D02604000000000548B4140	South Korea
6008	Cheongju International Airport	CJJ	Cheongju-si	0101000020E610000007A9FF9FEFDF5F40CFE8FF7FB95B4240	South Korea
6009	Subic Bay International Airport	SFS	Olongapo	0101000020E61000000000002058115E40000000A0BB962D40	Philippines
6010	Cuyo Airport	CYU	Cuyo	0101000020E6100000000000806A445E40000000E058B72540	Philippines
6011	Rajah Buayan Air Base	\\N	General Santos	0101000020E61000005D9FFF3F0A4F5F4076FAFF9FFE6C1840	Philippines
6012	Camiguin Airport	CGM	Mambajao	0101000020E6100000000000803F2D5F4000000060CD812240	Philippines
6013	Jolo Airport	JOL	Jolo	0101000020E610000000000040B4405E4000000040F5361840	Philippines
6014	Sanga Sanga Airport	SGS	Bongao	0101000020E6100000000000408DEF5D40000000201E301440	Philippines
6016	Surigao Airport	SUG	Luna	0101000020E61000008F8700D8C75E5F40DA49B33DFD822340	Philippines
6017	Tandag Airport	TDG	Tandag	0101000020E6100000000000A0F18A5F40000000A0EB242240	Philippines
6018	Naga Airport	WNP	Milaor	0101000020E6100000000000A047D15E4000000000782B2B40	Philippines
6019	Basco Airport	BSO	Basco	0101000020E610000041120060B87E5E40BE2D006088733440	Philippines
6020	San Fernando Airport	SFE	San Fernando	0101000020E61000000000006064135E400000004079983040	Philippines
6021	Tuguegarao Airport	TUG	Tuguegarao	0101000020E610000025CFFFEFEB6E5E4025C892BEB3A43140	Philippines
6022	Virac Airport	VRC	Virac	0101000020E6100000000000202F0D5F40000000E01D272B40	Philippines
6023	Calbayog Airport	CYP	Calbayog City	0101000020E610000000000040E1225F40000000E038252840	Philippines
6024	Catarman National Airport	CRM	Catarman	0101000020E610000000000040B4285F40000000A03A012940	Philippines
6025	Moises R. Espinosa Airport	MBT	Masbate	0101000020E61000000449008041E85E4013E1FFFF21BD2840	Philippines
6026	Roxas Airport	RXS	Roxas City	0101000020E6100000000000C020B05E40000000C005322740	Philippines
6027	General Enrique Mosconi Airport	TTG	Tartagal	0101000020E6100000BE0D000098E54FC074E9FF1F9E9E36C0	Argentina
6028	Las Heras Airport	LHS	Las Heras	0101000020E6100000BB070080C73D51C03AE6FFFFE64447C0	Argentina
6029	Antoine De St Exupery Airport	OES	San Antonio Oeste	0101000020E61000002E90A0F8314250C0AA605452276044C0	Argentina
6030	Lago Argentino Airport	ING	El Calafate	0101000020E6100000A77A32FFE80F52C0620FED63052B49C0	Argentina
6032	Santa Teresita Airport	SST	San Clemente del Tuyú	0101000020E61000005C2041F1635C4CC0764F1E166A4542C0	Argentina
6033	Necochea Airport	NEC	Necochea	0101000020E6100000462575029A684DC04B598638D63D43C0	Argentina
6034	Orlando Bezerra de Menezes Airport	JDO	Juazeiro do Norte	0101000020E6100000140400A092A243C0B801000037E01CC0	Brazil
6036	Coronel Horácio de Mattos Airport	LEC	Lençóis Paulista	0101000020E6100000A9E6FFBF74A344C07D1B0000F0F628C0	Brazil
6037	Macaé Airport	MEA	Macaé	0101000020E610000064EEFF3F0CE244C0F50D00E0CE5736C0	Brazil
6038	Frank Miloye Milenkowichi–Marília State Airport	MII	Marília	0101000020E61000009F17004094F648C03B290000683236C0	Brazil
6039	Vitória da Conquista Airport	VDC	Vitória da Conquista	0101000020E6100000D2EEFFFF796E44C0804100E0C0B92DC0	Brazil
6040	Santa Maria Airport	RIA	Santa Maria	0101000020E61000000000000017D84AC0000000401EB63DC0	Brazil
6041	Toledo Airport	TOW	Toledo	0101000020E6100000000000A047D94AC000000060B1AF38C0	Brazil
6042	Ricardo García Posada Airport	ESR	Diego de Almagro	0101000020E610000000000000F97051C000000040A44F3AC0	Chile
6043	Pucón Airport	ZPC	Pucón	0101000020E6100000000000209EFA51C0000000807AA543C0	Chile
6044	Sorocaba Airport	SOD	Sorocaba	0101000020E610000000000060B8BE47C0000000405E7A37C0	Brazil
6045	San Cristóbal Airport	SCY	Puerto Baquerizo Moreno	0101000020E610000000000080836756C0000000606820EDBF	Ecuador
6046	Camilo Ponce Enriquez Airport	LOH	Catamayo	0101000020E610000000000040CDD753C00000002095F70FC0	Ecuador
6047	General Rivadeneira Airport	ESM	Esmeraldas	0101000020E6100000000000401AE853C0000000200750EF3F	Ecuador
6048	Port Stanley Airport	PSY	Stanley	0101000020E61000001D00006088E34CC035000000C5D749C0	Falkland Islands
6049	Santa Ana Airport	CRC	Cartago	0101000020E6100000613255302AFD52C0D5EC815660081340	Colombia
6050	La Jagua Airport	GLJ	Garzón	0101000020E6100000EA95B20C71EC52C0401361C3D32B0140	Colombia
6051	Caucaya Airport	LQM	Puerto Leguízamo	0101000020E61000006FF085C954B152C07AE063B0E254C7BF	Colombia
6054	Obando Airport	PDA	Inírida	0101000020E6100000A7E8482EFFF950C0323D618907D40E40	Colombia
6055	El Yopal Airport	EYP	Yopal	0101000020E61000007F6ABC74931852C0664E97C5C4461540	Colombia
6056	Capitán de Av. Emilio Beltrán Airport	GYA	Guayaramerín	0101000020E6100000710600401E5650C0A54300A025A425C0	Bolivia
6058	Capitán Av. Selin Zeitun Lopez Airport	RIB	Riberalta	0101000020E610000000000000008050C000000000000026C0	Bolivia
6059	Reyes Airport	REY	Reyes	0101000020E6100000000000209ED650C000000060DA9B2CC0	Bolivia
6060	Capitán Av. German Quiroga G. Airport	SRJ	San Borja	0101000020E61000000000004033AF50C000000000E9B72DC0	Bolivia
6061	Zorg en Hoop Airport	ORG	Paramaribo	0101000020E6100000000000E068984BC0000000C08B3E1740	Suriname
6062	Mucuri Airport	MVS	Mucuri	0101000020E6100000000000209EEE43C0000000C0840C32C0	Brazil
6066	Mayor General FAP Armando Revoredo Iglesias Airport	CJA	Cajamarca	0101000020E610000000000060529F53C000000040858E1CC0	Peru
6067	Alferez Fap David Figueroa Fernandini Airport	HUU	Huánuco	0101000020E6100000000000801B0D53C000000060F3C123C0	Peru
6068	Maria Reiche Neuman Airport	NZC	Nazca	0101000020E61000004A01004089BD52C0F16700803FB52DC0	Peru
6069	Santa Rosa Airport	SRA	Santa Rosa	0101000020E6100000000000809C424BC0000000801DE83BC0	Brazil
6070	El Jagüel / Punta del Este Airport	MDO	Maldonado	0101000020E61000000103004060754BC002030040607541C0	Uruguay
6071	Escuela Mariscal Sucre Airport	MYC	Maracay	0101000020E61000000000002090E950C000000020FD7F2440	Venezuela
6072	Juan Pablo Pérez Alfonso Airport	VIG	El Vigía	0101000020E6100000000000000DEB51C0000000208F3F2140	Venezuela
6073	Ji-Paraná Airport	JPR	Ji Paraná	0101000020E610000053F0FF1F5AEC4EC0CEE8FF7FD9BD25C0	Brazil
6074	Codrington Airport	BBQ	Codrington	0101000020E610000039B35DA10FEA4EC05AD427B9C3A23140	Antigua and Barbuda
6075	La Désirade Airport	DSD	Saint-François	0101000020E6100000000000A0CD8A4EC0000000A0014C3040	Guadeloupe
6076	Baillif Airport	BBR	Baillif	0101000020E61000000000006000DF4EC0000000A067033040	Guadeloupe
6077	St-François Airport	SFC	Saint-François	0101000020E6100000000000A099A14EC000000020FF413040	Guadeloupe
6078	Les Bases Airport	GBJ	Grand-Bourg	0101000020E6100000000000608FA24EC000000040C6BC2F40	Guadeloupe
6079	Vance W. Amory International Airport	NEV	Charlestown	0101000020E6100000000000E0814B4FC0000000C0A8343140	Saint Kitts and Nevis
6080	Virgin Gorda Airport	VIJ	Road Town	0101000020E6100000000000205C1B50C00000004047723240	British Virgin Islands
6081	J F Mitchell Airport	BQU	Port Elizabeth	0101000020E61000004A01004089A14EC0FA1600A00FFA2940	Saint Vincent and the Grenadines
6082	Union Island International Airport	UNI	Port Elizabeth	0101000020E6100000000000A0BAB44EC0000000E044332940	Saint Vincent and the Grenadines
6083	Kokshetau Airport	KOV	Kokshetau	0101000020E6100000000000E00D6651400000000020AA4A40	Kazakhstan
6084	Petropavlosk South Airport	PPK	Bishkul	0101000020E610000000000000C54B51400000006029634B40	Kazakhstan
6085	Zhezkazgan Airport	DZN	Zhezqazghan	0101000020E610000021CCED5EEEEE504080D8D2A3A9DA4740	Kazakhstan
6086	Ust-Kamennogorsk Airport	UKK	Ust-Kamenogorsk	0101000020E610000000000000A19F544000000040AF044940	Kazakhstan
6088	Kostanay West Airport	KSN	Kostanay	0101000020E61000000000004070C64F40000000C07B9A4A40	Kazakhstan
6089	Ganja Airport	KVD	Ganja	0101000020E610000000000020A7284740000000006D5E4440	Azerbaijan
6090	Nakhchivan Airport	NAJ	Nakhchivan	0101000020E6100000000000E0ACBA4640000000A02A984340	Azerbaijan
6091	Chulman Airport	CNN	Neryungri	0101000020E6100000F8FEFFFF7E3A5F403B0000A0FA744C40	Russia
6092	Polyarny Airport	PYJ	Udachny	0101000020E610000065AEFF7FEB015C4081010020A0995040	Russia
6095	Tiksi Airport	IKS	Tiksi	0101000020E61000000B000060E51C6040ECFFFF1FA7EC5140	Russia
6097	Komsomolsk-on-Amur Airport	KXK	Komsomolsk-on-Amur	0101000020E610000000000060E31D6140000000205A344940	Russia
6098	Ugolny Airport	DYR	Anadyr	0101000020E610000000000040B6376640000000A0082F5040	Russia
6099	Okhotsk Airport	OHO	Okhotsk	0101000020E6100000000000E0CEE16140000000007DB44D40	Russia
6100	Ujae Atoll Airport	UJE	Ujae	0101000020E610000015E4FF3F62B86440D5FBFF9F2ADB2140	Marshall Islands
6101	Mariupol International Airport	MPW	Mariupol	0101000020E6100000000000808CB94240000000A0BD894740	Ukraine
6102	Luhansk International Airport	VSG	Luhansk	0101000020E610000017E7FF7FE2AF4340EBFBFF5F6D354840	Ukraine
6103	Zaporizhzhia International Airport	OZH	Zaporizhia	0101000020E6100000000000E068A84140000000E0F9EE4740	Ukraine
6104	Kryvyi Rih International Airport	KWG	Kryvyi Rih	0101000020E610000000000040E19A4040000000E08A054840	Ukraine
6105	Kharkiv International Airport	HRK	Bezlyudivka	0101000020E6100000000000C01E254240000000E05FF64840	Ukraine
6106	Ivano-Frankivsk International Airport	IFO	Ivano-Frankivs’k	0101000020E610000000000040A4AF3840000000802D714840	Ukraine
6107	Chernivtsi International Airport	CWC	Chernivtsi	0101000020E6100000000000C015FB3940000000C030214840	Ukraine
6108	Rivne International Airport	RWN	Rivne	0101000020E6100000000000E03F243A4000000080B54D4940	Ukraine
6109	Uzhhorod International Airport	UDJ	Uzhhorod	0101000020E6100000000000206E433640000000C030514840	Ukraine
6111	Cherepovets Airport	CEE	Cherepovets	0101000020E61000002D0E00C005024340AA09006005A34D40	Russia
6113	Kotlas Airport	KSZ	Kotlas	0101000020E6100000000000A047594740000000C02E9E4E40	Russia
6114	Petrozavodsk Airport	PES	Petrozavodsk	0101000020E610000000000040CD134140000000404EF14E40	Russia
6115	Hrodna Airport	GNA	Hrodna	0101000020E6100000000000E0C50D3840000000600ECD4A40	Belarus
6116	Mogilev Airport	MVQ	Mahilyow	0101000020E61000000000008058183E40000000203AFA4A40	Belarus
6117	Yeniseysk Airport	EIE	Yeniseysk	0101000020E61000000000004033075740000000A0B23C4D40	Russia
6118	Kyzyl Airport	KYZ	Kyzyl	0101000020E610000000000060A3995740000000E0AED54940	Russia
6119	Spichenkovo Airport	NOZ	Novokuznetsk	0101000020E61000000000000024B8554000000000DCE74A40	Russia
6121	Igarka Airport	IAA	Igarka	0101000020E610000000000040CDA7554000000020FBDB5040	Russia
6122	Khankala Air Base	GRV	Khankala	0101000020E6100000000000605DE446400000002028A64540	Russia
6123	Nalchik Airport	NAL	Nal’chik	0101000020E6100000000000207CD14540000000C0A6C14540	Russia
6124	Beslan Airport	OGZ	Beslan	0101000020E6100000A8060020A54D4640050900C0409A4540	Russia
6125	Elista Airport	ESL	Elista	0101000020E6100000000000E05A2A464000000000DC2F4740	Russia
6128	Mercer County Airport	BLF	Bluefield	0101000020E6100000000000004B4D54C0000000C0DCA54240	United States
6130	Mid Delta Regional Airport	GLH	Greer	0101000020E61000000000002014BF56C0000000A0CFBD4040	United States
6133	Tri Cities Airport	PSC	Pasco	0101000020E6100000000000C09DC75DC0000000C0E1214740	United States
6136	Lopez Island Airport	LPS	Anacortes	0101000020E61000000000004008BC5EC000000060F03D4840	United States
6137	Salekhard Airport	SLY	Salekhard	0101000020E6100000000000A01AA75040000000A0CFA55040	Russia
6138	Khanty Mansiysk Airport	HMA	Khanty-Mansiysk	0101000020E6100000000000A082455140000000E0A5834E40	Russia
6139	Nyagan Airport	NYA	Nyagan	0101000020E6100000000000205C67504000000080140E4F40	Russia
6140	Sovetskiy Airport	OVS	Sovetskiy	0101000020E6100000000000800BCD4F40000000C0CEA94E40	Russia
6141	Izhevsk Airport	IJK	Izhevsk	0101000020E6100000000000608FBA4A4000000020FF694C40	Russia
6142	Pobedilovo Airport	KVX	Lyangasovo	0101000020E61000000F00002095AC4840210000206C404D40	Russia
6143	Nadym Airport	NYM	Nadym	0101000020E6100000000000C0BA2C524000000020C75E5040	Russia
6144	Raduzhny Airport	RAT	Raduzhny	0101000020E610000068F4FFBF0C55534069F7FFFF4C144F40	Russia
6145	Nefteyugansk Airport	NFG	Nefteyugansk	0101000020E6100000000000A099295240000000C0DC8D4E40	Russia
6146	Kurgan Airport	KRO	Kurgan	0101000020E610000000000040995A5040000000A0D6BC4B40	Russia
6147	Khudzhand Airport	LBD	Khŭjand	0101000020E610000000000000766C514000000040921B4440	Tajikistan
6148	Andizhan Airport	AZN	Andijon	0101000020E6100000860A00E0D012524029080040255D4440	Uzbekistan
6149	Fergana International Airport	FEG	Fergana	0101000020E6100000F0040020AEEF5140E9F8FF1FED2D4440	Uzbekistan
6150	Namangan Airport	NMA	Namangan	0101000020E6100000070C0000A1E35140BDEAFF5F077E4440	Uzbekistan
6151	Nukus Airport	NCU	Nukus	0101000020E610000000000040C8CF4D40000000E0833E4540	Uzbekistan
6152	Urgench Airport	UGC	Urganch	0101000020E61000000000004023524E4000000060CACA4440	Uzbekistan
6153	Karshi Khanabad Airport	KSQ	Qarshi	0101000020E6100000CE0800E0F97A50401A0D0060B36A4340	Uzbekistan
6154	Termez Airport	TMJ	Tirmiz	0101000020E610000000000000D7D35040000000A0B2A44240	Uzbekistan
6155	Staroselye Airport	RYB	Rybinsk	0101000020E6100000000000A0F676434000000060560D4D40	Russia
6156	Belgorod International Airport	EGO	Belgorod	0101000020E610000000000060884B42400000000068524940	Russia
6157	Kursk East Airport	URS	Kursk	0101000020E610000000000040D6254240000000A013E04940	Russia
6158	Lipetsk Airport	LPK	Lipetsk	0101000020E6100000000000A0D6C4434000000060F5594A40	Russia
6159	Vorkuta Airport	VKT	Vorkuta	0101000020E6100000000000E01DFF4F400000004045DF5040	Russia
6160	Bugulma Airport	UUA	Bugul’ma	0101000020E6100000000000209E664A4000000080EB514B40	Russia
6161	Yoshkar-Ola Airport	JOK	Yoshkar-Ola	0101000020E610000000000040CDF3474000000040AD594C40	Russia
6162	Cheboksary Airport	CSY	Cheboksary	0101000020E61000000000006074AC4740000000008F0B4C40	Russia
6163	Ulyanovsk East Airport	ULY	Ulyanovsk	0101000020E6100000000000E0BE6648400000000054334B40	Russia
6164	Orsk Airport	OSW	Orsk	0101000020E6100000000000A03C4C4D40000000A047894940	Russia
6165	Penza Airport	PEZ	Penza	0101000020E610000000000060B382464000000020288E4A40	Russia
6166	Saransk Airport	SKX	Saransk	0101000020E6100000000000402B9B46400000004004104B40	Russia
6167	Balakovo Airport	BWO	Balakovo	0101000020E6100000FC1900E06FDF4740E40F00C0DCED4940	Russia
6168	Hubli Airport	HBX	Hubli	0101000020E6100000FAF3FFFF6EC55240822400C030B92E40	India
6169	Koggala Airport	KCT	Weligama	0101000020E6100000000000C07F1454400000004087F91740	Sri Lanka
6171	Battambang Airport	BBM	Battambang	0101000020E61000000000000056CE594000000080F2302A40	Cambodia
6172	Shillong Airport	SHL	Shillong	0101000020E610000000000000A3FE5640000000201FB43940	India
6173	Lokpriya Gopinath Bordoloi International Airport	GAU	Guwahati	0101000020E6100000000000607FE5564000000060291B3A40	India
6174	Dimapur Airport	DMU	Dimāpur	0101000020E61000004E0700C0597157403CE9FF3F47E23940	India
6175	Tezpur Airport	TEZ	Tezpur	0101000020E61000000000008038325740000000A087B53A40	India
6176	Barisal Airport	BZL	Barisāl	0101000020E6100000000000E046935640000000600ECD3640	Bangladesh
6177	Ban Huoeisay Airport	OUI	Ban Houakhoua	0101000020E6100000BD0A00C0F71B594075ECFF5FDE413440	Laos
6180	Bhadrapur Airport	BDP	Bhadrapur	0101000020E6100000C3F3FF1F1805564006C9FFFF1F923A40	Nepal
6181	Meghauli Airport	MEY	Bharatpur	0101000020E6100000713D0AD7A30E5540DDB5847CD0933B40	Nepal
6182	Nepalgunj Airport	KEP	Nepalgunj	0101000020E610000000000020B06A544000000080851A3C40	Nepal
6183	Gan International Airport	GAN	Hithadhoo	0101000020E610000000000060F549524000000080DB2FE6BF	Maldives
6184	Hanimaadhoo Airport	HAQ	Dhidhdhoo	0101000020E610000000000080E94A52400000006017FA1A40	Maldives
6185	Kadhdhoo Airport	KDO	Fonadhoo	0101000020E6100000000000C0666152400000000029BFFD3F	Maldives
6186	Mae Sot Airport	MAQ	Tak	0101000020E6100000000000E0E2A25840000000A02CB33040	Thailand
6187	Buon Ma Thuot Airport	BMV	Buôn Ma Thuột	0101000020E6100000E4720020AE075B40D81A00602B562940	Vietnam
6188	Cat Bi International Airport	HPH	Haiphong	0101000020E61000000000006066AE5A4000000040C4D13440	Vietnam
6189	Cam Ranh Airport	CXR	Nha Trang	0101000020E610000000000020044E5B400000002014FF2740	Vietnam
6191	Can Tho International Airport	VCA	Cần Thơ	0101000020E6100000062C0060916D5A40866D0040922B2440	Vietnam
6192	Dien Bien Phu Airport	DIN	Dien Bien Phu	0101000020E61000009525002083C05940111E0080C2653540	Vietnam
6193	Phu Cat Airport	UIH	Qui Nhon	0101000020E6100000FE1C0020B0425B40B0F2FFBFF5E82B40	Vietnam
6194	Pleiku Airport	PXU	Pleiku	0101000020E61000000000008016015B40000000E04D022C40	Vietnam
6195	Vinh Airport	VII	Vinh	0101000020E6100000016600A0F16A5A4020D6FF5FD3BC3240	Vietnam
6196	Banmaw Airport	BMO	Bhamo	0101000020E6100000000000C0C14F584000000020DD443840	Myanmar
6197	Dawei Airport	TVY	Dawei	0101000020E6100000000000C0078D58400000006032352C40	Myanmar
6199	Loikaw Airport	LIW	Loikaw	0101000020E610000000000040BF4D58400000002006B13340	Myanmar
6200	Mawlamyine Airport	MNU	Mawlamyine	0101000020E6100000000000E0486A5840000000E0D7713040	Myanmar
6201	Pathein Airport	BSX	Pathein	0101000020E6100000000000E0E9B1574000000000B1D03040	Myanmar
6202	Pakhokku Airport	PKK	Pakokku	0101000020E610000085EB51B81EC75740D6C56D3480673540	Myanmar
6203	Sumbawa Besar Airport	SWQ	Sumbawa Besar	0101000020E6100000000000405E5A5D400000008063FA20C0	Indonesia
6207	Tanjung Harapan Airport	TJS	Tanjung Selor	0101000020E6100000B4CA933EE9575D40DE78FC62C9AF0640	Indonesia
6210	Warukin Airport	TJG	Amuntai	0101000020E6100000C4B3FF5FE7DB5C4020EBFFBF83BB01C0	Indonesia
6211	Sampit(Hasan) Airport	SMQ	Sampit	0101000020E6100000B7DEFF5F663E5C40381C006057FE03C0	Indonesia
6212	Dumatumbun Airport	LUV	Tual	0101000020E61000000000006064976040000000C07FA516C0	Indonesia
6219	Lawas Airport	LWY	Limbang	0101000020E6100000000000A01CDA5C40000000E08C651340	Malaysia
6222	Kudat Airport	KUD	Kudat	0101000020E61000000000000081355D40000000E0A3B01B40	Malaysia
6223	Radin Inten II (Branti) Airport	TKG	Metro	0101000020E610000076A73B4F3C4B5A40226DE34F54F614C0	Indonesia
6224	Halim Perdanakusuma International Airport	HLP	Jakarta	0101000020E61000000000002006B95A4000000040021119C0	Indonesia
6228	Pendopo Airport	PDO	Prabumulih	0101000020E6100000000000E051F8594000000020DF490AC0	Indonesia
6229	Malikus Saleh Airport	LSW	Lhokseumawe	0101000020E6100000000000C0D13C5840000000C01EE81440	Indonesia
6230	Pulau Pangkor Airport	PKG	Lumut	0101000020E61000000000006064235940000000E097FA1040	Malaysia
6235	Albany Airport	ALH	Albany	0101000020E6100000000000A0C6735D4000000000BE7841C0	Australia
6241	Broken Hill Airport	BHQ	Broken Hill	0101000020E610000056F6FF9F1AAF6140EF0100E02D0040C0	Australia
6242	Hamilton Island Airport	HTI	Red Hill	0101000020E6100000B03500C0769E624066F1FF7FAC5B34C0	Australia
6247	Oakey Airport	OKY	Toowoomba	0101000020E61000000000002085F762400000008051693BC0	Australia
6249	Bathurst Airport	BHS	Bathurst	0101000020E610000067140020DDB462403DE9FF3F67B440C0	Australia
6250	Blackwater Airport	BLT	Blackwater	0101000020E610000000000000D3996240000000C0649A37C0	Australia
6251	Carnarvon Airport	CVQ	Carnarvon	0101000020E610000090DAC4C9FD6A5C405794128255E138C0	Australia
6261	Cooma Snowy Mountains Airport	OOM	Cooma	0101000020E6100000DFC3FFFF2A9F6240D2EEFFFF792642C0	Australia
6264	Devonport Airport	DPO	Devonport	0101000020E6100000111E0080C24D6240C31600C0B89544C0	Australia
6266	Esperance Airport	EPR	Esperance	0101000020E610000019ABCDFFAB745E402235ED629AD740C0	Australia
6268	Geraldton Airport	GET	Geraldton	0101000020E6100000514F1F813FAD5C401A506F46CDCB3CC0	Australia
6269	Gladstone Airport	GLT	Gladstone	0101000020E6100000EE7893DF22E76240295DFA97A4DE37C0	Australia
6271	Griffith Airport	GFF	Griffith	0101000020E6100000231F00E024426240D4F1FF3F1A2041C0	Australia
6287	Lismore Airport	LSY	Lismore	0101000020E61000008C1600E05128634079D2FF7F8ED43CC0	Australia
6294	Merimbula Airport	MIM	Merimbula	0101000020E6100000213C0000D5BC624069F7FFFF4C7442C0	Australia
6298	Mildura Airport	MQL	Mildura	0101000020E610000086EAFF7FC0C2614033FAFF5F561D41C0	Australia
6300	Moree Airport	MRZ	Moree	0101000020E6100000CD2800400ABB624043D5FFDFB77F3DC0	Australia
6301	Moranbah Airport	MOV	Moranbah	0101000020E6100000B03500C0768262405C220000CC0E36C0	Australia
6302	Moruya Airport	MYA	Batemans Bay	0101000020E610000063CBFF9F9BC46240D6170020EBF241C0	Australia
6303	Mount Gambier Airport	MGB	Mount Gambier	0101000020E6100000000000C01E996140000000E06FDF42C0	Australia
6306	Maryborough Airport	MBH	Maryborough	0101000020E610000000000040E1166340000000A0678339C0	Australia
6307	Narrandera Airport	NRA	Leeton	0101000020E610000015E4FF3F625062400C1500C0E15941C0	Australia
6308	Narrabri Airport	NAA	Narrabri	0101000020E6100000B03500C076BA62403FCCFF1FB7513EC0	Australia
6310	Newman Airport	ZNE	Newman	0101000020E61000009D34006064F35D40AAE9FFFFF46A37C0	Australia
6313	Palm Island Airport	PMK	Ingham	0101000020E61000000000008097526240000000605BC132C0	Australia
6315	Cocos (Keeling) Islands Airport	CCK	West Island	0101000020E6100000F40A00A05E355840BB6A00E0686028C0	Cocos Islands
6317	Parkes Airport	PKE	Parkes	0101000020E610000030F4FFDFA58762408FF9FFBFD19040C0	Australia
6318	Port Lincoln Airport	PLO	Port Lincoln	0101000020E6100000C519000029FC6040D5F4FF7F7A4D41C0	Australia
6320	Port Macquarie Airport	PQQ	Port Macquarie	0101000020E6100000EB1B00C09D1B6340012300A0906F3FC0	Australia
6321	Portland Airport	PTJ	Portland	0101000020E61000000000006012AF614000000080B72843C0	Australia
6324	Roma Airport	RMA	Roma	0101000020E61000006EBDFFBFCC986240A9060020858B3AC0	Australia
6334	Whyalla Airport	WYA	Whyalla	0101000020E6100000000000C072306140000000008A8740C0	Australia
6336	Wollongong Airport	WOL	Wollongong	0101000020E6100000000000803FD9624000000020D24741C0	Australia
6338	Wynyard Airport	BWT	Burnie	0101000020E6100000000000606437624000000000DC7F44C0	Australia
6341	Beijing Nanyuan Airport	NAY	Beijing	0101000020E610000000000000D5185D40000000C032E44340	China
6342	Chifeng Airport	CIF	Chifeng	0101000020E6100000000000A01CBA5D4000000080141E4540	China
6343	Changzhi Airport	CIH	Changzhi	0101000020E610000009151C5E10485C40185DDE1CAE1F4240	China
6344	Datong Airport	DAT	Datong	0101000020E6100000D2A6EA1ED95E5C40A27DACE0B7074440	China
6345	Baita International Airport	HET	Hohhot	0101000020E610000055790060BCF45B4056F6FF9FFA6C4440	China
6346	Baotou Airport	BAV	Baotou	0101000020E6100000000000E0CE7F5B4000000020AE474440	China
6347	Shijiazhuang Daguocun International Airport	SJW	Shijiazhuang	0101000020E6100000000000A09BAC5C4000000000EE234340	China
6348	Tongliao Airport	TGO	Tongliao	0101000020E6100000149337C0CC8C5E4014CFD90242C74540	China
6349	Ulanhot Airport	HLH	Ulanhot	0101000020E6100000909E228788805E402F6AF7AB00194740	China
6350	Xilinhot Airport	XIL	Xilin Hot	0101000020E610000000000020B2FD5C400000006032F54540	China
6351	Beihai Airport	BHY	Beihai	0101000020E6100000A1832EE1D0525B4060764F1E168A3540	China
6352	Changde Airport	CGD	Changde	0101000020E6100000A36000C0F5E85B40ECDBFFFF3CEB3C40	China
6353	Dayong Airport	DYG	Zhangjiajie	0101000020E610000019C6DD205A9C5B405F07CE19511A3D40	China
6354	Meixian Airport	MXZ	Meizhou	0101000020E61000000000002083085D40000000A099593840	China
6355	Zhuhai Jinwan Airport	ZUH	Zhuhai	0101000020E610000009151C5E10585C4023BA675DA3013640	China
6356	Liuzhou Bailian Airport	LZH	Luorong	0101000020E61000003271AB2006595B4085EB51B81E353840	China
6357	Zhanjiang Airport	ZHA	Zhanjiang	0101000020E6100000C4793881E9965B408C4B55DAE2363540	China
6358	Enshi Airport	ENH	Enshi	0101000020E61000005D9FFF3F0A5F5B40742C0020FF513E40	China
6359	Nanyang Jiangying Airport	NNY	Nanyang	0101000020E6100000BF4692205C275C402A711DE38A7D4040	China
6360	Xiangyang Liuji Airport	XFN	Xiangyang	0101000020E6100000B4C876BE9F125C4088635DDC46134040	China
6361	Yichang Sanxia Airport	YIH	Yichang	0101000020E61000003D9E961FB8DE5B40BC96900F7A8E3E40	China
6362	Ankang Wulipu Airport	AKA	Ankang	0101000020E6100000DD240681953B5B4047AAEFFCA25A4040	China
6364	Hanzhong Chenggu Airport	HZG	Hanzhong	0101000020E610000046D1031F83C05A407787140324884040	China
6365	Qingyang Airport	IQN	Qingyang	0101000020E610000083A5BA8097E65A40DD4598A25CE64140	China
6366	Xining Caojiabu Airport	XNN	Xining	0101000020E6100000AFB0E07EC0825940EC51B81E85434240	China
6368	Yulin Yuyang Airport	UYN	Yulin	0101000020E6100000B2D47ABFD1655B40A7052FFA0A2E4340	China
6369	Arvaikheer Airport	AVK	Arvayheer	0101000020E61000000000000054B35940000000E009204740	Mongolia
6370	Altai Airport	LTI	Altai	0101000020E610000000000080260E5840000000E02D304740	Mongolia
6371	Bayankhongor Airport	BYN	Bayanhongor	0101000020E6100000000000600E2D594000000000E7144740	Mongolia
6372	Dalanzadgad Airport	DLZ	Dalandzadgad	0101000020E610000000000020851B5A40000000E0BCCB4540	Mongolia
6373	Khovd Airport	HVD	Khovd	0101000020E61000000000006034E856400000000020FA4740	Mongolia
6374	Mörön Airport	MXV	Murun-kuren	0101000020E6100000000000005606594000000000E7D44840	Mongolia
6375	Diqing Airport	DIG	Shangri-La	0101000020E61000007A36AB3E57EB5840091B9E5E29CB3B40	China
6376	Mangshi Airport	LUM	Zhongshu	0101000020E610000020D26F5F07A25840F46C567DAE663840	China
6378	Zhaotong Airport	ZAT	Zhaotong	0101000020E6100000000000E051F05940000000805A533B40	China
6379	Ganzhou Airport	KOW	Zhangye	0101000020E6100000B58D3F51D9B15C40FA980F0874DA3940	China
6380	Jingdezhen Airport	JDZ	Jingdezhen	0101000020E6100000AB86FF9F434B5D4073090080AE563D40	China
6381	Jiujiang Lushan Airport	JIU	Jiujiang	0101000020E6100000D15D126745F35C40FF058200197A3D40	China
6382	Quzhou Airport	JUZ	Quzhou	0101000020E61000007842AF3F89B95D406F826F9A3EF73C40	China
6383	Lianyungang Airport	LYG	Xinpu	0101000020E6100000419B1C3EE9B75D40E9995E622C494140	China
6384	Huangyan Luqiao Airport	HYN	Huangyan	0101000020E6100000000000C0745B5E4000000060EC8F3C40	China
6385	Shubuling Airport	LYI	Linyi	0101000020E6100000000000405E9A5D40000000A0E6854140	China
6386	Quanzhou Jinjiang International Airport	JJN	Quanzhou	0101000020E61000005531957EC2A55D40CE88D2DEE0CB3840	China
6387	Tunxi International Airport	TXN	Huangshan	0101000020E61000000000004062905D4000000080B9BB3D40	China
6388	Weifang Airport	WEF	Weifang	0101000020E61000000F48C2BE9DC75D40FF209221C7524240	China
6389	Weihai Airport	WEH	Weihai	0101000020E6100000000000E0A78E5E40000000E0F2974240	China
6390	Sunan Shuofang International Airport	WUX	Wuxi	0101000020E6100000B578FFBF741B5E4089F0FFFF907E3F40	China
6392	Wenzhou Yongqiang Airport	WNZ	Wenzhou	0101000020E61000000000002087365E400000000086E93B40	China
6393	Yancheng Airport	YNZ	Yancheng	0101000020E61000006CD097DEFE0C5E405E471CB281B64040	China
6394	Yiwu Airport	YIW	Yiwu	0101000020E6100000575C00400C025E40F4EAFF3F3E583D40	China
6395	Zhoushan Airport	HSN	Zhoushan	0101000020E61000004F4D00002B975E403A2600C027EF3D40	China
6397	Dachuan Airport	DAX	Dazhou	0101000020E6100000736891ED7CDB5A406FF085C954213F40	China
6398	Guangyuan Airport	GYS	Guangyuan	0101000020E6100000000000A0ED6C5A40000000A00F324040	China
6400	Mianyang Airport	MIG	Mianyang	0101000020E6100000000000806C2F5A4000000000986D3F40	China
6401	Nanchong Airport	NAO	Nanchong	0101000020E61000001895D409688A5A406B9A779CA2CB3E40	China
6403	Wanxian Airport	WXN	Wanxian	0101000020E6100000C1CAA145B61B5B40053411363CCD3E40	China
6404	Aksu Airport	AKU	Aksu	0101000020E6100000618BDD3EAB1254406A15FDA199A14440	China
6406	Kuqa Airport	KCA	Kuqa	0101000020E61000000000006029BF5440000000C0EADB4440	China
6407	Korla Airport	KRL	Korla	0101000020E6100000000000E03F8855400000008051D94440	China
6408	Karamay Airport	KRY	Baijiantan	0101000020E61000008CB96B09F93C554072F90FE9B7BB4640	China
6410	Heihe Airport	HEK	Heihe	0101000020E6100000260200C0C4D35F40A213C4ACF7154940	China
6411	Jiamusi Airport	JMU	Jiamusi	0101000020E6100000080F0040E14E6040A01A0080F46B4740	China
6412	Jinzhou Airport	JNZ	Jinzhou	0101000020E6100000000000C0F7435E40000000A0FA8C4440	China
6413	Qiqihar Sanjiazi Airport	NDG	Qiqihar	0101000020E610000000000080C0FA5E4000000040AB9E4740	China
6414	Yanji Chaoyangchuan Airport	YNJ	Yanji	0101000020E6100000FAD3FF9F6E2E60407EFBFF9FFF704540	China
6415	Waikoloa Heliport	WKL	Waikoloa Village	0101000020E61000005AF5B9DA8A7B63C0CFF753E3A5EB3340	United States
6421	Inishmore Aerodrome	IOR	Gaillimh	0101000020E610000000000000A64E23C000000060A88D4A40	Ireland
6422	Connemara Regional Airport	NNR	Gaillimh	0101000020E6100000000000E080EF22C0000000807A9D4A40	Ireland
6423	Rügen Airport	GTI	Bergen auf Rügen	0101000020E610000078120040AFA62A408AF0FFFF10314B40	Germany
6424	Berezovo Airport	NBB	Berëzovo	0101000020E6100000000000C0F341504000000060E3F54F40	Russia
6425	Szczecin-Dąbie Airport	\\N	Szczecin	0101000020E61000000000006081442D400000006030B24A40	Poland
6426	Worcester Regional Airport	ORH	Worcester	0101000020E6100000000000800BF851C0000000E036224540	United States
6427	Anqing Tianzhushan Airport	AQG	Anqing	0101000020E6100000EC6CC83F33435D408FC360FE0A953E40	China
6429	Shanhaiguan Airport	SHP	Qinhuangdao	0101000020E6100000C991CEC0C8EE5D409A982EC4EAFB4340	China
6430	Yuncheng Guangong Airport	YCU	Yuncheng	0101000020E61000009EED8A4602C25B403D4679E6E58E4140	China
6431	Lanzhou City Airport	\\N	Lanzhou	0101000020E6100000289B728577F759405470784144044240	China
6432	Jiayuguan Airport	JGN	Jiayuguan	0101000020E6100000AEB6627FD9955840D07CCEDDAEED4340	China
6434	Ordos Ejin Horo Airport	DSN	Dongsheng	0101000020E610000023D9DCFE20775B401F85EB51B8BE4340	China
6445	Bremerton National Airport	PWT	Bremerton	0101000020E61000006E0000C0F5B05EC0370000E0BEBE4740	United States
6446	Spencer Municipal Airport	SPW	Spencer	0101000020E6100000F5FFFF9FFACC57C0ECFFFF1F2F954540	United States
6447	Jefferson City Memorial Airport	JEF	Jefferson City	0101000020E61000006DFDFF7FFD0957C066F1FF7FAC4B4340	United States
6450	Tannheim Airport	\\N	Memmingen	0101000020E6100000671400207D322440BFEDFF9F47014840	Germany
6456	Provincetown Municipal Airport	PVC	Eastham	0101000020E61000005BFFFF5F2B8E51C09E14000034094540	United States
6458	Anduki Airport	\\N	Seria	0101000020E61000009CCEFFBF72985C4051F1FFBF498C1240	Brunei
6464	Kostroma Sokerkino Airport	KMW	Kostroma	0101000020E6100000DD0300C07B824440860A00E000E64C40	Russia
6465	Sukhumi Dranda Airport	SUI	Sokhumi	0101000020E6100000AB0C00A065904440CFE8FF7FD96D4540	Georgia
6466	Donskoye Airport	TBW	Tambov	0101000020E6100000D6FFFF5FCCBD4440D8FFFF3F2E674A40	Russia
6467	Oban Airport	OBN	Oban	0101000020E610000000000020439915C000000000543B4C40	United Kingdom
6477	Erechim Airport	ERM	Erechim	0101000020E6100000000000A057224AC00000004072A93BC0	Brazil
6478	La Côte Airport	\\N	Gland	0101000020E6100000000000E040081940000000E004344740	Switzerland
6479	Courchevel Airport	CVF	Saint-Jean-de-Maurienne	0101000020E610000000000000F4891A4000000020C7B24640	France
6481	Fullerton Municipal Airport	FUL	Buena Park	0101000020E610000041120060B87E5DC0F1E4FFBF9DEF4040	United States
6482	Concord Regional Airport	\\N	Harrisburg	0101000020E610000015A8C5E0612D54C023BA675DA3B14140	United States
6483	Isle of Wight / Sandown Airport	\\N	Sandown	0101000020E6100000C3716C7F5FEAF2BF70067FBF98534940	United Kingdom
6485	Navoi Airport	NVI	Navoiy	0101000020E610000000000060EE4A504000000060000F4440	Uzbekistan
6487	Andernos Les Bains Airport	\\N	Andernos-les-Bains	0101000020E6100000000000606603F1BF000000E0C7604640	France
6489	Bienenfarm Airport	\\N	Nauen	0101000020E6100000000000E0DD7D294000000080B1544A40	Germany
6492	Ain Arnat Airport	QSF	Sétif	0101000020E6100000BAF2FF1F474C154063EBFFFFCB164240	Algeria
6493	La Rochelle-Île de Ré Airport	LRH	La Rochelle	0101000020E6100000000000E0DD1FF3BF00000000F0164740	France
6494	Friedman Memorial Airport	SUN	Hailey	0101000020E610000073ECEA9FF1925CC004B4082090C04540	United States
6497	Yverdon-les-Bains Airport	\\N	Yverdon-les-Bains	0101000020E610000066FFFFBF0C741A402E11000086614740	Switzerland
6499	Bielsko Biala Airport	\\N	Bielsko-Biala	0101000020E6100000000000807C003340000000400AE74840	Poland
6500	Mason City Municipal Airport	MCW	Mason City	0101000020E610000021F9FFFF335557C0960500C032944540	United States
6505	Phoenix-Mesa-Gateway Airport	AZA	Mesa	0101000020E6100000D53A1680EBE95BC0EA9FF9FF65A74040	United States
6519	Niederoeblarn Airport	\\N	Liezen	0101000020E6100000151DC9E53F042C4001DF6DDE38BD4740	Austria
6520	Vöslau Airport	\\N	Kottingbrunn	0101000020E6100000000000608F4230400000002085FB4740	Austria
6522	Uetersen/Heist Airport	\\N	Uetersen	0101000020E6100000000000A088682340000000E0BCD24A40	Germany
6726	Ormoc Airport	OMC	Ormoc	0101000020E61000000000000029245F4000000020B21D2640	Philippines
6730	Sam Mbakwe International Airport	QOW	Owerri	0101000020E610000000000080F9D21C40000000404FB51540	Nigeria
6731	Arenal Airport	FON	Quesada	0101000020E6100000000000A09B2855C000000060BCF42440	Costa Rica
6732	Tambor Airport	TMU	Nicoya	0101000020E610000000000020E24055C0000000401F7A2340	Costa Rica
6733	Cauayan Airport	CYZ	Cauayan	0101000020E61000000BF2FF1F31705E40EF0100E00DEE3040	Philippines
6734	Kirovsk-Apatity Airport	KVK	Apatity	0101000020E6100000000000604DCB4040000000C0A6DD5040	Russia
6735	Coronel Altino Machado de Oliveira Airport	GVR	Governador Valadares	0101000020E6100000390000C0B8FD44C0DFFFFFDF2BE532C0	Brazil
6739	Hagerstown Regional Richard A Henson Field	HGR	Hagerstown	0101000020E6100000A0550320B06E53C021E7FD7F9CDA4340	United States
6741	Gorakhpur Airport	GOP	Gorakhpur	0101000020E61000003E0C00E0C7DC5440E51200005DBD3A40	India
6743	Hami Airport	HMI	Hami	0101000020E6100000A2FAFF1FD46A574097080000B36B4540	China
6744	Wuzhou Changzhoudao Airport	WUZ	Wuzhou	0101000020E61000000518963FDFCF5B40AC1DC539EA743740	China
6745	Tugdan Airport	TBH	Romblon	0101000020E6100000147EFF9F70855E405BFFFF5F3B9F2840	Philippines
6746	Sahand Airport	ACP	Bonāb	0101000020E6100000000000005F104740000000408BAC4240	Iran
6747	Gorgan Airport	GBT	Gorgān	0101000020E6100000F1E4FFBF5D334B403CE9FF3F67744240	Iran
6748	Ilam Airport	IIL	Īlām	0101000020E610000000000080D0334740000000C015CB4040	Iran
6749	Parsabade Moghan Airport	PFQ	Pārsābād	0101000020E610000035000000D5F04740160000C042CD4340	Iran
6751	Tocache Airport	\\N	Tocache	0101000020E6100000B4FBFF7F162153C011FEFF1FB25D20C0	Peru
6753	Mardin Airport	MQM	Mardin	0101000020E6100000DC000080DB5044402CEBFF1F959C4240	Turkey
6756	Leon Airport	LEN	León	0101000020E6100000000000204B9F16C000000060644B4540	Spain
6757	Burgos Airport	RGS	Burgos	0101000020E61000000000000051F70CC0000000E0C52D4540	Spain
6759	Shahrekord Airport	CQD	Shahr-e Kord	0101000020E61000006AFAFF3FCD6B4940D31100A00A264040	Iran
6760	Kangra Airport	DHM	Yol	0101000020E610000000000080DB1053400000000022154040	India
6761	Nanded Airport	NDC	Nanded	0101000020E6100000A60300E04454534067F4FFBFEC2E3340	India
6762	Shimla Airport	SLV	Shimla	0101000020E610000019C6DD205A44534014D044D8F0143F40	India
6768	Geneina Airport	EGN	Geneina	0101000020E6100000000000609A77364000000060A1F62A40	Sudan
6771	Walaha Airport	WLH	Saratamata	0101000020E6100000E02900A01CF66440026600A0F1D22EC0	Vanuatu
6772	Chaoyang Airport	CHG	Chaoyang	0101000020E6100000D3F4D901D71B5E40F2785A7EE0C44440	China
6773	Samburu South Airport	UAS	Isiolo	0101000020E61000000000008060C442400000004089FAE03F	Kenya
6776	Sialkot Airport	SKT	Sialkot	0101000020E61000004F0A00004A975240EAF8FF1F8D444040	Pakistan
6777	Capitan Corbeta CA Curbelo International Airport	PDP	Punta del Este	0101000020E610000000000000128C4BC0000000E0736D41C0	Uruguay
6778	Walvis Bay Airport	WVB	Walvis Bay	0101000020E6100000000000C0644A2D40000000C0DAFA36C0	Namibia
6779	Katima Mulilo Airport	MPA	Katima Mulilo	0101000020E6100000E7D2FF3F3C2D38403C29000068A231C0	Namibia
6780	Anadolu Airport	AOE	Eskişehir	0101000020E6100000DB8AFD65F7843E40438CD7BCAAE74340	Turkey
6781	Çanakkale Airport	CKZ	Çanakkale	0101000020E6100000122100C0426D3A4081010020A0114440	Turkey
6782	Muş Airport	MSR	Muş	0101000020E610000000000040A2D44440000000E0B75F4340	Turkey
6783	Sinop Airport	SIC	Sinop	0101000020E6100000BEFFFFBF7F884140E1FFFFBF05024540	Turkey
6784	Tekirdağ Çorlu Airport	TEQ	Çorlu	0101000020E6100000000000204AEB3B4000000080B0914440	Turkey
6785	Bursa Yenişehir Airport	YEI	Yenişehir	0101000020E610000038E0FF7F06903D40D10E0060AA204440	Turkey
6786	Terre-de-Haut Airport	LSS	Trois-Rivières	0101000020E61000000BF2FF1F51CA4EC00E3B00A092BA2F40	Guadeloupe
6787	Kalay Airport	KMV	Falam	0101000020E610000000000040458357400000004055303740	Myanmar
6788	Vieques Airport	VQS	Isabel Segunda	0101000020E61000006CFDFF7F0D5B50C0AFCFFF1FA51D3240	Puerto Rico
6790	Hamadan Airport	HDM	Hamadān	0101000020E610000000000060B846484000000000426F4140	Iran
6791	Marinduque Airport	MRQ	Boac	0101000020E610000000000020DD745E4000000000D5B82A40	Philippines
6792	Grafton Airport	GFN	Grafton	0101000020E6100000000000C0F52063400000000068C23DC0	Australia
6793	Orange Airport	OAG	Orange	0101000020E610000093BFFF7F41A46240DC000080DBB040C0	Australia
6794	Taree Airport	TRO	Taree	0101000020E61000009CCEFFBF72106340D43400407BE33FC0	Australia
6795	Choibalsan Airport	COQ	Choibalsan	0101000020E61000000000002058A95C40000000A05E114840	Mongolia
6797	Hohenems-Dornbirn Airport	HOJ	Hohenems	0101000020E6100000B20A006066662340BFEDFF9F47B14740	Austria
6798	Weser-Wümme Airport	\\N	Sottrum	0101000020E610000000000000CF6A2240000000E0E5864A40	Germany
6799	Krems Airport	\\N	Langenlois	0101000020E6100000A5677A89B1442F40A725564623394840	Austria
6800	Delta County Airport	ESC	Escanaba	0101000020E61000007AF5FF1FFFC555C08910006081DC4640	United States
6805	Goulburn Airport	GUL	Goulburn	0101000020E6100000000000603BB76240000000E0B76741C0	Australia
6806	Cessnock Airport	CES	Cessnock	0101000020E6100000A88C7F9FF1EA62402CD505BCCC6440C0	Australia
6807	Scone Airport	NSO	Muswellbrook	0101000020E6100000000000C09FDA624000000000C30440C0	Australia
6808	Mudgee Airport	DGE	Mudgee	0101000020E6100000643100408DB3624000000000004840C0	Australia
6809	Maitland Airport	MTL	Maitland	0101000020E6100000EB1B00C09DEF62402D0E00C0055A40C0	Australia
6814	Benjamin Rivera Noriega Airport	CPX	Culebra	0101000020E6100000D3D85E0B7A5350C0513239B533503240	Puerto Rico
6816	Raron Airport	\\N	Visp	0101000020E610000000000000174B1F4000000060DC264740	Switzerland
6819	Borovaya Airfield	\\N	Minsk	0101000020E6100000B8674C778DA63B4044CAAA63F0FA4A40	Belarus
6823	Amlikon Glider Airport	\\N	Weinfelden	0101000020E6100000000000E051182240000000607FC94740	Switzerland
6824	Lommis Airfield	\\N	Sirnach	0101000020E610000009FDFF1F91012240FDF9FF7F1FC34740	Switzerland
6825	Williamson County Regional Airport	MWA	Herrin	0101000020E6100000110701E0B54056C0290C04E0A3E04240	United States
6830	Flugplatz Finsterwalde/Heinrichsruh	\\N	Finsterwalde	0101000020E6100000B03BDD79E2592B402C0E677E35D14940	Germany
6832	Kirkuk Air Base	KIK	Kirkuk	0101000020E6100000000000C0A82C4640000000A018BC4140	Iraq
6833	Al Udeid Air Base	IUD	Doha	0101000020E610000010FBFFDF51A84940B7210060071E3940	Qatar
6837	Ford Airport	IMT	Iron Mountain	0101000020E610000021F9FFFF530756C089100060C1E84640	United States
6838	Marquette Airport	\\N	Marquette	0101000020E610000000000000EEE355C0000000E056444740	United States
6840	Dinslaken/Schwarze Heide Airport	\\N	Dinslaken	0101000020E61000000CCB9F6F0B761B402A560DC2DCCE4940	Germany
6841	Höxter-Holzminden Airport	\\N	Höxter	0101000020E6100000000000E0B4C12240000000E040E74940	Germany
6843	Niijima Airport	\\N	Shimoda	0101000020E610000063CBFF9F9B68614045F8FF7F482F4140	Japan
6844	Michigan City Municipal Airport	MGC	Michigan City	0101000020E6100000730900808EB455C02D0E00C005DA4440	United States
6845	Seward Airport	SWD	Seward	0101000020E61000000000008068AD62C0000000403E104E40	United States
6853	Wausau Downtown Airport	AUW	Wausau	0101000020E6100000500D00401A6856C06E0000C08D764640	United States
6855	Kalundborg Airport	\\N	Kalundborg	0101000020E6100000000000000080264000000060A3D94B40	Denmark
6859	Mary Airport	MYP	Mary	0101000020E6100000FF209221C7F24E403A92CB7F48CF4240	Turkmenistan
6862	Sazená Airport	LKS	Kralupy nad Vltavou	0101000020E610000079D2FF7F8E842C407B1800C08F294940	Czechia
6866	Spray View Airport	\\N	Victoria Falls	0101000020E6100000000000E026D1394000000080C0EA31C0	Zimbabwe
6868	Sabadell Airport	QSA	Sabadell	0101000020E61000000000002034D70040000000E0ACC24440	Spain
6870	Whitsunday Island Airport	WSY	Red Hill	0101000020E61000005C8FC2F5289862403B191C25AF4634C0	Australia
6871	Delaware County Johnson Field	MIE	Muncie	0101000020E610000000000060565955C0000000A0031F4440	United States
6873	Purdue University Airport	LAF	Lafayette	0101000020E610000000000020F6BB55C000000040C6344440	United States
6876	Brown County Airport	\\N	Maysville	0101000020E6100000000000207EF854C000000020E2704340	United States
6877	North Las Vegas Airport	VGT	Sunrise Manor	0101000020E6100000D4FFFF7F6ACC5CC042000040F81A4240	United States
6878	Kenosha Regional Airport	ENW	Kenosha	0101000020E61000007B7B002061FB55C09259FFDF3F4C4540	United States
6880	Montrose Regional Airport	MTJ	Montrose	0101000020E6100000C696FF3F37F95AC0880D002041414340	United States
6881	Riverton Regional Airport	RIW	Riverton	0101000020E6100000147EFF9F701D5BC0BD0A00C037884540	United States
6883	Eastern Oregon Regional At Pendleton Airport	PDT	Pendleton	0101000020E610000097080000D3B55DC0C5190000F9D84640	United States
6886	Lympne Airport	LYM	Hythe	0101000020E61000006891ED7C3F35F03F0AD7A3703D8A4940	United Kingdom
6887	Porto Cheli Airport	PKH	Náfplio	0101000020E61000004B598638D62537407EC3448314A64240	Greece
6894	Zell Am See Airport	\\N	Zell am See	0101000020E61000003333333333932940FB95CE8767A54740	Austria
6897	Tindal Airport	KTR	Katherine	0101000020E6100000000000A0188C6040000000A0CD0A2DC0	Australia
6899	Nowra Airport	NOA	Nowra	0101000020E6100000000000202FD1624000000080757941C0	Australia
6905	Lutsk Airport	UKC	Luts’k	0101000020E61000007FC16ED8B67C3940E0BC38F1D5564940	Ukraine
6906	Chernihiv Shestovitsa Airport	CEJ	Chernihiv	0101000020E6100000B115006086283F40DAFDFF3F7BB34940	Ukraine
6907	Ternopil International Airport	TNL	Ternopil’	0101000020E6100000FAEDEBC039B33940174850FC18C34840	Ukraine
6908	Brest Airport	BQT	Brest	0101000020E6100000A089B0E1E9E537404298DBBDDC0D4A40	Belarus
6909	Wittman Regional Airport	OSH	Oshkosh	0101000020E6100000000000E0A52356C0000000E000FE4540	United States
6910	Harle Airport	\\N	Wittmund	0101000020E610000000000000F7471F400000002074DA4A40	Germany
6911	Wangerooge Airport	AGE	Jever	0101000020E610000000000080D2A71F400000002032E44A40	Germany
6914	RAAF Base Pearce	\\N	Perth	0101000020E6100000000000C0F5005D4000000000F5AA3FC0	Australia
6915	Bendigo Airport	\\N	Bendigo	0101000020E61000007CF8FF5F8F0A6240A50000A0A45E42C0	Australia
6916	Pangborn Memorial Airport	EAT	Wenatchee	0101000020E6100000098CFF7F3F0D5EC0F71000200FB34740	United States
6917	Antonio Nery Juarbe Pol Airport	ARE	Arecibo	0101000020E6100000C2F3FF1F38AB50C09FD4FF3F33733240	Puerto Rico
6918	Ringi Cove Airport	RIN	Gizo	0101000020E61000000000008093A4634000000040B64020C0	Solomon Islands
6922	Kirensk Airport	\\N	Kirensk	0101000020E61000006ABC749318045B406DE7FBA9F1E24C40	Russia
6924	Ust-Kut Airport	UKX	Ust’-Kut	0101000020E610000000000060B86E5A4000000060A86D4C40	Russia
6927	Triengen Airport	\\N	Sursee	0101000020E610000000000080F727204000000080049D4740	Switzerland
6928	Lausanne-Blécherette Airport	QLS	Lausanne	0101000020E610000045F1FF5F78771A40E5EFFF5FCC454740	Switzerland
6929	Speck-Fehraltorf Airport	\\N	Pfäffikon	0101000020E610000000000000D7832140000000E02DB04740	Switzerland
6930	Locarno Airport	ZJI	Locarno	0101000020E610000048050020D9C121402CEBFF1F95144740	Switzerland
6931	Neuchatel Airport	QNC	Neuchâtel	0101000020E61000004710002079751B40F91300608F7A4740	Switzerland
6932	Taganrog Yuzhny Airport	\\N	Taganrog	0101000020E610000016AD927EB16C4340989A4EFC62994740	Russia
6933	Gelendzhik Airport	GDZ	Gelendzhik	0101000020E6100000A60B00F898014340FB78E302824A4640	Russia
6934	Zhukovsky International Airport	\\N	Ramenskoye	0101000020E6100000D42AFA43331343406BF46A80D2C64B40	Russia
6936	Khabarovsk Airport	\\N	Khabarovsk	0101000020E610000000000060E5E460400000004033434840	Russia
6937	Dzemgi Airport	\\N	Komsomolsk-on-Amur	0101000020E6100000000000809722614000000040844D4940	Russia
6939	Belaya Air Base	\\N	Sredniy	0101000020E6100000000000C0CCE45940000000C01E754A40	Russia
6940	Tunoshna Airport	IAR	Yaroslavl	0101000020E6100000000000A02514444000000000C5C74C40	Russia
6944	Jining Qufu Airport	JNG	Jining	0101000020E61000008EE6C8CA2F165D40807EDFBF79A54140	China
6945	Drake Bay Airport	DRK	Puntarenas	0101000020E61000000EF8FF9F11E954C014F6FF5F12702140	Costa Rica
6947	Tuzla International Airport	\\N	Živinice	0101000020E6100000000000808CB93240000000A0B63A4640	Bosnia and Herzegovina
6948	NAS Fort Worth JRB/Carswell Field	\\N	University Park	0101000020E61000006110FD7F415C58C07D20FD1F75624040	United States
6949	Naypyidaw Airport	NYT	Nay Pyi Taw	0101000020E6100000EAF8FF1FDD0C5840EB1B00C09D9F3340	Myanmar
6955	Wuhai Airport	WUA	Wuhai	0101000020E610000057EC2FBB27B35A40BD5296218EE54340	China
6956	Gary Chicago International Airport	GYY	Gary	0101000020E6100000000000606BDA55C0000000E0E2CE4440	United States
6957	Brainerd Lakes Regional Airport	BRD	Brainerd	0101000020E6100000428FFF9FD68857C01412FE7FFB324740	United States
6958	Greenbrier Valley Airport	LWB	Covington	0101000020E61000000CF5FF5F911954C0E40F00C0DCED4240	United States
6959	Pitt Greenville Airport	PGV	Greer	0101000020E61000009830FDBFA85853C091F3FE3F4ED14140	United States
6961	Oxnard Airport	OXR	Oxnard	0101000020E61000007CFFFF7F3FCD5DC0DFFFFFDFB3194140	United States
7379	Franca Airport	FRC	Franca	0101000020E6100000000000E002B147C0000000609A9734C0	Brazil
6963	Tongren Fenghuang Airport	TEN	Tongren	0101000020E610000006465ED6C4535B40427A8A1C22E23B40	China
6968	Schenectady County Airport	SCH	Scotia	0101000020E6100000ECFFFF1F737B52C0D0FFFFBF1E6D4540	United States
6969	Begishevo Airport	NBC	Nizhnekamsk	0101000020E610000000000000D70B4A400000002048C84B40	Russia
6973	Volkel Air Base	\\N	Uden	0101000020E6100000DD561FB4C3D41640191BBAD91FD44940	Netherlands
6974	Siargao Airport	IAO	Dapa	0101000020E6100000AA090060E5805F40DF060000DCB72340	Philippines
6975	Langeoog Airport	LGO	Esens	0101000020E610000000000080B9FD1D40000000400ADF4A40	Germany
6984	Biel-Kappelen Airport	\\N	Biel/Bienne	0101000020E6100000000000C0F5281D40000000E06A8B4740	Switzerland
6985	Nelspruit Airport	NLP	Nelspruit	0101000020E6100000750C00C0EEE93E4000000000008039C0	South Africa
6986	Cherkasy International Airport	CKC	Cherkasy	0101000020E610000000000000CCFE3F400000006032B54840	Ukraine
6989	Northeast Florida Regional Airport	UST	Saint Augustine	0101000020E61000000D000040BF5554C08B0000208EF53D40	United States
6990	Mykolaiv International Airport	NLV	Mykolayiv	0101000020E61000000000000078EB3F400000004069874740	Ukraine
6992	Charles M. Schulz Sonoma County Airport	STS	Santa Rosa	0101000020E61000002502D53F08B45EC0EC2CFEDF26414340	United States
6993	Kissimmee Gateway Airport	ISM	Kissimmee	0101000020E61000004C040080F95B54C006E9FF5F304A3C40	United States
6994	Lake City Gateway Airport	LCQ	Lake City	0101000020E61000005F0500E0EBA454C0C1D0FF7F972E3E40	United States
6995	Deland Municipal Sidney H Taylor Field	\\N	DeLand	0101000020E6100000086402C0295254C07BA613E026113D40	United States
6996	Haller Airpark	\\N	Green Cove Springs	0101000020E6100000AEB6627FD96B54C04AB8904770E73D40	United States
6998	Logan-Cache Airport	LGU	North Logan	0101000020E6100000C879FF1F87F65BC02E11000046E54440	United States
6999	Brigham City Airport	BMC	Brigham City	0101000020E6100000BD0A00C0F7035CC0ABE9FFFFB4C64440	United States
7000	Malad City Airport	MLD	Preston	0101000020E61000000000000002135CC00000002053154540	United States
7001	Aspen-Pitkin Co/Sardy Field	ASE	Aspen	0101000020E61000006E6704C09DB75AC07A54FCDF919C4340	United States
7003	Ulyanovsk Baratayevka Airport	ULV	Ulyanovsk	0101000020E610000025FFFF7F041D48403B0900A057224B40	Russia
7009	Kerrville Municipal Louis Schreiner Field	ERV	Kerrville	0101000020E61000005F0800207CC558C048FEFFFF08FA3D40	United States
7010	Birrfeld Airport	\\N	Windisch	0101000020E6100000000000C09B772040000000E0C7B84740	Switzerland
7011	Sussex County Airport	GED	Maysville	0101000020E610000075A40240F8D652C0F54DF5BF37584340	United States
7012	Prince Rupert/Seal Cove Seaplane Base	ZSW	Prince Rupert	0101000020E6100000000000600E4960C0000000A0A92A4B40	Canada
7013	Great Bend Municipal Airport	GBN	Great Bend	0101000020E6100000EAF8FF1FFDB658C090FCFFFF112C4340	United States
7014	Hays Regional Airport	HYS	Hays	0101000020E61000003B5201207CD158C020C0F93FCD6B4340	United States
7015	Spirit of St Louis Airport	SUS	Chesterfield	0101000020E6100000F9FFFF5FBAA956C0BEFFFFBFBF544340	United States
7017	Grand Rapids Itasca Co-Gordon Newstrom field	GPZ	Grand Rapids	0101000020E6100000C3E1FD9FA06057C027BEFB5F059B4740	United States
7018	Thief River Falls Regional Airport	TVF	Thief River Falls	0101000020E61000008C820100D70B58C006D7FDDF68084840	United States
7019	Eagle River Union Airport	EGV	Eagle River	0101000020E61000005F0500E02B5156C02EF1FF9F55F74640	United States
7020	Lakeland-Noble F. Lee Memorial field	ARV	Rhinelander	0101000020E61000002CD80420C76E56C0EE7A0660C5F64640	United States
7021	Ankeny Regional Airport	IKV	Ankeny	0101000020E6100000000000E03F6457C0000000C07FD84440	United States
7023	Corpus Christi Naval Air Station/Truax Field	NGP	Corpus Christi	0101000020E610000057C80160A15258C091F3FE3F4EB13B40	United States
7025	Catalina Airport	AVX	Rancho Palos Verdes	0101000020E6100000B4C876BE9F9A5DC0401361C3D3B34040	United States
7026	Mojave Airport	MHV	California City	0101000020E6100000A7BEE25FBA895DC09996FD5F9A874140	United States
7027	Interlaken Air Base	ZIN	Interlaken	0101000020E6100000014CBE7E2D841F40C3B6EADF9A564740	Switzerland
7030	Inisheer Aerodrome	INQ	Gaillimh	0101000020E6100000000000A0940523C00000002048884A40	Ireland
7033	Strezhevoy Airport	SWT	Strezhevoy	0101000020E61000006DFDFF7F3D6A5340EDFEFF9FCD5A4E40	Russia
7035	Hutchinson Municipal Airport	HUT	Hutchinson	0101000020E6100000A3FAFF1F147758C00F1B004062084340	United States
7036	Bagram Air Base	\\N	Kabul	0101000020E6100000AFF2FFBFF5505140D0EBFFBF19794140	Afghanistan
7037	Prince Sultan Air Base	\\N	Ad Dilam	0101000020E6100000000000E04DCA4740000000200D103840	Saudi Arabia
7042	Rosecrans Memorial Airport	STJ	Saint Joseph	0101000020E6100000F7FFFF7F38BA57C0070000A0CDE24340	United States
7046	Pápa Air Base	\\N	Pápa	0101000020E61000002019006034803140521000808AAE4740	Hungary
7047	Whiting Field Naval Air Station South Airport	NDZ	Cuxhaven	0101000020E6100000000000E078C155C00000008053B43E40	Germany
7048	Volk Field	VOK	Tomah	0101000020E6100000040000C0379056C0C9FFFF1F31F84540	United States
7051	Gunnison Crested Butte Regional Airport	GUC	Gunnison	0101000020E610000079ED2D40B6BB5AC0571FF6DF56444340	United States
7052	Xi'an Xiguan Airport	SIA	Lintong	0101000020E6100000001B1021AE475B406CAF05BD37304140	China
7053	Zamperini Field	TOA	Torrance	0101000020E6100000D4FFFF7FC2955DC0E1FFFFBFD5E64040	United States
7054	Manistee Co Blacker Airport	MBL	Manistee	0101000020E6100000E77C0440CD8F55C083F7FAFFDD224640	United States
7056	Charlotte County Airport	PGD	Punta Gorda	0101000020E61000001AE9FB5F647F54C08B04094092EB3A40	United States
7059	Chautauqua County-Jamestown Airport	JHW	Jamestown	0101000020E610000031C7FA1F83D053C0DC8BFD9FA2134540	United States
7060	La Macaza / Mont-Tremblant International Inc Airport	YTM	Mont-Tremblant	0101000020E6100000DC000080EBB152C03CE9FF3F67344740	Canada
7061	Lake Cumberland Regional Airport	SME	Somerset	0101000020E610000058F9FFDF6A2755C0AFF2FFBFD5864240	United States
7062	Shenandoah Valley Regional Airport	SHD	Bridgewater	0101000020E6100000F40A00A05EB953C022FCFF3FC4214340	United States
7063	Devils Lake Regional Airport	DVL	Devils Lake	0101000020E6100000086402C029BA58C0F19DFB1F9E0E4840	United States
7064	Dickinson Theodore Roosevelt Regional Airport	DIK	Dickinson	0101000020E6100000A4DDFFFF53B359C08BF3FF3F11664740	United States
7065	Sidney Richland Municipal Airport	SDY	Sidney	0101000020E6100000840607205A0C5AC0F05EFFBF7BDA4740	United States
7066	Chadron Municipal Airport	CDR	Chadron	0101000020E61000009B51008014C659C0B4FBFF7F366B4540	United States
7067	Alliance Municipal Airport	AIA	Alliance	0101000020E6100000B578FFBF74B359C078120040CF064540	United States
7068	Mc Cook Ben Nelson Regional Airport	MCK	McCook	0101000020E6100000C7A82160E32559C0CB060400681A4440	United States
7069	The Florida Keys Marathon Airport	MTH	Marathon	0101000020E6100000EFF8FE1F4A4354C0DAFEF8BFE1B93840	United States
7070	Dawson Community Airport	GDV	Glendive	0101000020E61000007CF9F8DFA5335AC0038D04E0C0914740	United States
7073	San Luis Valley Regional Bergman Field	ALS	Alamosa	0101000020E6100000BA2EFCE07C775AC0438CD7BCAAB74240	United States
7074	Canyonlands Field	CNY	Moab	0101000020E61000005F0432E051705BC0290C04E0A3604340	United States
7076	Vernal Regional Airport	VEL	Vernal	0101000020E61000000B19D9DFA3605BC0D32B0A606F384440	United States
7077	Sierra Blanca Regional Airport	SRR	Ruidoso	0101000020E61000002C0000803D625AC0350000003DBB4040	United States
7078	Show Low Regional Airport	SOW	Show Low	0101000020E610000015E4FF3F62805BC05E0500E0FB214140	United States
7380	Dourados Airport	DOU	Dourados	0101000020E61000006FB88FDC9A764BC0F90FE9B7AF3336C0	Brazil
7081	Mammoth Yosemite Airport	MMH	Mammoth Lakes	0101000020E610000084C8D8BFA1B55DC06EE5FC7FE2CF4240	United States
7082	Friday Harbor Airport	FRD	Anacortes	0101000020E610000050CAFF3F89C15EC009EFFFDFD0424840	United States
7083	Orcas Island Airport	ESD	Birch Bay	0101000020E6100000EFE1FF7F3DBA5EC030140040A65A4840	United States
7085	Astoria Regional Airport	AST	Warrenton	0101000020E61000000449008041F85EC04EE7FF5F39144740	United States
7086	Newport Municipal Airport	ONP	Newport	0101000020E610000000000040B6035FC0000000804A4A4640	United States
7094	Kasigluk Airport	KUK	Bethel	0101000020E610000021510DA0C45064C08191FA5FEC6F4E40	United States
7095	Kwethluk Airport	KWT	Bethel	0101000020E6100000ACECFF3F352E64C044F8FF7F28654E40	United States
7107	Hughes Airport	HUS	Brighton	0101000020E61000009D4A06806A4863C057C80160A1825040	United States
7120	Inyokern Airport	IYK	Ridgecrest	0101000020E6100000C1A7DEBF1E755DC011C8048053D44140	United States
7121	Visalia Municipal Airport	VIS	Visalia	0101000020E6100000AE5200E026D95DC0D6170020CB284240	United States
7122	Merced Regional Macready Field	MCE	Merced	0101000020E61000006D29D65FE5205EC0A2E2070071A44240	United States
7123	Laguna de Los Patos International Airport	CYR	Colonia del Sacramento	0101000020E6100000CBFFFFFFA2E24CC0E8FFFF5F6B3A41C0	Uruguay
7125	Amarais Airport	CPQ	Campinas	0101000020E610000000000080D98D47C000000080F4DB36C0	Brazil
7126	Phoenix Goodyear Airport	\\N	Goodyear	0101000020E6100000F956006010185CC0A11A008014B64040	United States
7128	Toowoomba Airport	TWB	Toowoomba	0101000020E6100000000000E04FFD624000000000F58A3BC0	Australia
7130	Gatton Campus Airport	\\N	Gatton	0101000020E6100000D235000CE50A63408CF19AC5768F3BC0	Australia
7131	Arkalyk North Airport	AYK	Arkalyk	0101000020E6100000000000A0FABC5040000000E0C7284940	Kazakhstan
7134	Nabern/Teck Airport	\\N	Dettingen unter Teck	0101000020E6100000B206008056F422407A1500806F4E4840	Germany
7140	Funter Bay Seaplane Base	FNR	Juneau	0101000020E6100000E5EFFF5FBCDC60C004E6FF1F90204D40	United States
7146	Metlakatla Seaplane Base	MTM	Ketchikan	0101000020E6100000000000007F7260C0000000A0C4904B40	United States
7157	Perryville Airport	KPV	Perryville	0101000020E6100000438F183D37E563C0E61E12BEF7F34B40	United States
7177	Ambler Airport	ABL	Ambler	0101000020E6100000E30C00806CBB63C0EDFEFF9FCDC65040	United States
7217	Akiak Airport	AKI	Bethel	0101000020E61000009D340060642764C092FFFF3F92734E40	United States
7221	Zapala Airport	APZ	Zapala	0101000020E6100000A7B05241458751C01EA8531EDD7C43C0	Argentina
7226	Tte. Julio Gallardo Airport	PNT	Puerto Natales	0101000020E610000000000040D12152C0000000C0F3D549C0	Chile
7229	Sierra Grande Airport	SGV	Sierra Grande	0101000020E610000046FBFFBFB85550C0651100E0BCCB44C0	Argentina
7230	Cabo F.A.A. H. R. Bordón Airport	IGB	Ingeniero Jacobacci	0101000020E610000059FCFF1FCB6451C0980B004013A944C0	Argentina
7254	Alma Airport	YTF	Alma	0101000020E6100000A60300E014E951C09DF4FF9F23414840	Canada
7256	Rimouski Airport	YXK	Rimouski	0101000020E610000000000040CD1F51C000000060323D4840	Canada
7267	Bonnyville Airport	YBY	Bonnyville	0101000020E61000000F48C2BE9DAF5BC0EA3C2AFEEF264B40	Canada
7268	Nanaimo Harbour Water Airport	ZNA	Nanaimo	0101000020E61000006EBDFFBFCCFC5EC034FAFF5F76974840	Canada
7269	Ganges Seaplane Base	YGG	North Cowichan	0101000020E61000007958A835CDDF5EC04C378941606D4840	Canada
7273	Boundary Bay Airport	YDT	Ladner	0101000020E6100000986E00A0C4C05EC07CF8FF5F7F894840	Canada
7274	Langley Airport	\\N	Langley	0101000020E610000015E4FF3F62A85EC03AE6FFFFE68C4840	Canada
7278	Camaguey-Campo Cuatro Milpas Airport	\\N	Guasave	0101000020E6100000F5FFFF9F6E225BC0820000A0F6A63940	Mexico
7280	Cabo San Lucas International Airport	\\N	Cabo San Lucas	0101000020E6100000BD0A00C0F77B5BC0E20C00809CF23640	Mexico
7291	Corn Island	RNI	Corn Island	0101000020E61000000000004015C454C0000000A067532840	Nicaragua
7292	San Pedro Airport	BZA	Bonanza	0101000020E610000000000060662655C00000006066E62B40	Nicaragua
7293	Rosita Airport	RFS	Bonanza	0101000020E6100000000000602B1A55C0000000C086C72B40	Nicaragua
7294	Siuna	SIU	Siuna	0101000020E610000000000020C73155C00000008056742B40	Nicaragua
7295	Waspam Airport	WSP	Waspam	0101000020E6100000000000A00AFE54C000000060787A2D40	Nicaragua
7296	San Carlos	\\N	San Carlos	0101000020E6100000000000A0473155C0000000004D442640	Nicaragua
7297	Playa Samara/Carrillo Airport	PLD	Nicoya	0101000020E61000000D000040CF5E55C017000080B3BD2340	Costa Rica
7301	Constanza - Expedición 14 de Junio National Airport	COZ	Constanza	0101000020E6100000E3FFFF9F33AE51C075FFFFDF51E83240	Dominican Republic
7302	Negril Airport	NEG	Lucea	0101000020E610000000000020419553C0000000C0C1573240	Jamaica
7307	José Aponte de la Torre Airport	RVR	Ceiba	0101000020E61000006CFDFF7F2D6950C05C220000CC3E3240	Puerto Rico
7309	Charlotte Amalie Harbor Seaplane Base	SPB	Road Town	0101000020E610000000000060343C50C000000080AE563240	British Virgin Islands
7313	Uyuni Airport	UYU	Uyuni	0101000020E6100000600800204CB650C0040900C0407234C0	Bolivia
7320	Abaiang Airport	ABF	Bikenibeu Village	0101000020E6100000000000E04FA16540000000401BC7FC3F	Kiribati
7323	Afobakka Airstrip	\\N	Brokopondo	0101000020E6100000C1C6F5EFFA7E4BC0E6913F1878FE1340	Suriname
7325	Albina Airport	ABN	Albina	0101000020E6100000000000A069064BC000000080060D1640	Suriname
7334	Moengo Airstrip	\\N	Moengo	0101000020E61000005E4BC8073D334BC0CA32C4B12E6E1640	Suriname
7335	Nieuw Nickerie Airport	ICK	Nieuw Nickerie	0101000020E6100000000000000B854CC0000000607ED21740	Suriname
7340	Totness Airport	TOT	Totness	0101000020E610000000000080EB294CC0000000209C761740	Suriname
7341	Wageningen Airstrip	AGI	Totness	0101000020E61000008AF0FFFF10514CC009FDFF1F11111740	Suriname
7343	Codela Airport	CSC	Guápiles	0101000020E6100000F2070060DE4555C0BD0A00C0F7D32440	Costa Rica
7351	Mabaruma Airport	USI	Mabaruma	0101000020E61000000000002043E44DC00000006066662040	Guyana
7352	Mahdia Airport	MHA	Mahdia	0101000020E61000000000004057934DC000000060261C1540	Guyana
7353	Dr Augusto Roberto Fuster International Airport	PJC	Pedro Juan Caballero	0101000020E6100000000000803DEA4BC000000000D7A336C0	Paraguay
7355	Los Colonizadores Airport	RVE	Arauquita	0101000020E61000005AF44E05DCF651C08B6F287CB6CE1B40	Colombia
7359	Villa Garzón Airport	VGZ	Villagarzón	0101000020E6100000499D8026C22653C0D5EDEC2B0F52EF3F	Colombia
7360	El Bagre Airport	EBG	El Bagre	0101000020E6100000006F8104C5B352C0342E1C08C9621E40	Colombia
7361	Juan H White Airport	CAQ	Caucasia	0101000020E610000062105839B4CC52C0E4A08499B6DF1F40	Colombia
7362	Mandinga Airport	COG	Condoto	0101000020E6100000CDCCCCCCCC2C53C04C1AA37554551440	Colombia
7363	Golfo de Morrosquillo Airport	TLU	Tolú	0101000020E610000005C58F3177E552C0F7E461A1D6042340	Colombia
7364	Cabo Frio Airport	CFB	Cabo Frio	0101000020E610000097E8FF9F820945C0A8E3FF7FF4EB36C0	Brazil
7367	Presidente João Batista Figueiredo Airport	OPS	Sinop	0101000020E6100000000000A005CB4BC0000000C01EC527C0	Brazil
7368	Gurupi Airport	GRP	Gurupi	0101000020E6100000000000E0EB9048C0000000E0AC7A27C0	Brazil
7370	Breves Airport	BVS	Breves	0101000020E6100000000000E0C73849C0000000203A2FFABF	Brazil
7371	Soure Airport	SFK	Soure	0101000020E610000000000020B04248C000000020BD61E6BF	Brazil
7372	Parintins Airport	PIN	Parintins	0101000020E6100000000000407B634CC000000040586205C0	Brazil
7373	Barreiras Airport	BRA	Barreiras	0101000020E6100000000000E0268146C0000000A0652828C0	Brazil
7376	Araguaína Airport	AUX	Araguaína	0101000020E6100000E1D39CBCC81E48C045F5D6C056E91CC0	Brazil
7377	Novo Aripuanã Airport	NVP	Novo Aripuanã	0101000020E610000000000000B52E4EC0000000E0DC7814C0	Brazil
7382	Maestro Marinho Franco Airport	ROO	Rondonópolis	0101000020E61000000612143FC65C4BC0BC749318049630C0	Brazil
7383	Tancredo Thomas de Faria Airport	GPB	Guarapuava	0101000020E610000030F4FFDF95C249C09FD4FF3F336339C0	Brazil
7384	Santa Terezinha Airport	JCB	Joaçaba	0101000020E610000094020080D2C649C0860A00E0E02B3BC0	Brazil
7394	General Leite de Castro Airport	RVD	Rio Verde de Mato Grosso	0101000020E6100000000000E0617A49C000000060B0D531C0	Brazil
7395	Romeu Zema Airport	AAX	Araxá	0101000020E610000040000060EE7A47C0BCFFFFDF2D9033C0	Brazil
7396	Maués Airport	MBZ	Maués	0101000020E61000000612143FC6DC4CC0276BD44334FA0AC0	Brazil
7397	Borba Airport	RBB	Borba	0101000020E6100000000000801BCD4DC0000000A017A011C0	Brazil
7398	Coari Airport	CIZ	Coari	0101000020E610000000000000F9904FC000000000478910C0	Brazil
7399	Barcelos Airport	BAZ	Barcelos	0101000020E6100000382F4E7CB5754FC02272FA7ABE66EFBF	Brazil
7406	Diamantino Airport	DMT	Diamantino	0101000020E61000000000004040334CC000000000F9C02CC0	Brazil
7407	Guanambi Airport	GNM	Guanambi	0101000020E610000000000040805F45C000000040996A2CC0	Brazil
7408	Tsletsi Airport	QDJ	Djelfa	0101000020E6100000022B8716D9CE0A403E7958A835554140	Algeria
7411	Lucapa Airport	LBZ	Lucapa	0101000020E610000055D3FFFF69BB34403305006036E420C0	Angola
7413	Am Timan Airport	AMC	Am Timan	0101000020E6100000ACCCFFDF244634404BC1FF7F68112640	Chad
7415	Eastern WV Regional Airport/Shepherd Field	MRB	Martinsburg	0101000020E6100000E960FD9F037F53C05B7C0A8071B34340	United States
7416	Awassa Airport	AWA	Hawassa	0101000020E61000000000000000404340000000A09B441C40	Ethiopia
7417	Wilwal International Airport	JIJ	Jijiga	0101000020E61000003F575BB1BF7445400AD7A3703DAA2240	Ethiopia
7419	Debra Marcos Airport	DBM	Debre Mark’os	0101000020E6100000000000A0C6DB42400000004033B32440	Ethiopia
7420	Debre Tabor Airport	DBT	Debre Tabor	0101000020E61000000000000000004340000000A01AEF2740	Ethiopia
7421	Harar Meda Airport	QHR	Bishoftu	0101000020E6100000F085C954C1804340E63FA4DFBE6E2140	Ethiopia
7422	Robe Airport	GOB	Goba	0101000020E610000033993B44ED054440DE0CED52D9761C40	Ethiopia
7424	Mara Serena Lodge Airstrip	MRE	Kihancha	0101000020E61000007FC0030308814140D4BB783F6E7FF6BF	Kenya
7426	Meru Mulika Airport	\\N	Maua	0101000020E61000002B1213D4F015434095D39E927362CD3F	Kenya
7429	Cape Palmas Airport	CPA	Greenville	0101000020E610000000000040ADC91EC0000000E01D841140	Liberia
7432	Ecuvillens Airport	\\N	Villars-sur-Glâne	0101000020E6100000000000C0EF4D1C40000000E0A3604740	Switzerland
7437	Inhaca Airport	\\N	Maputo	0101000020E6100000AAE9FFFFF4764040A70300E044FF39C0	Mozambique
7442	Ouro Sogui Airport	MAX	Matam	0101000020E61000000000000046A52AC000000060EC2F2F40	Senegal
7449	Kitgum Airport	\\N	Kitgum	0101000020E61000005227A089B0714040FE43FAEDEB400A40	Uganda
7453	Hatay Airport	HTY	Antakya	0101000020E610000080FEFFDF1F2442407A1500806F2E4240	Turkey
7454	Kihnu Airfield	\\N	Pärnu	0101000020E6100000000000E0A300384000000080FB124D40	Estonia
7459	Lleida-Alguaire Airport	ILD	Lleida	0101000020E61000002A73F38DE81EE13F0938842A35DD4440	Spain
7461	Ouessant Airport	\\N	Ploudalmézeau	0101000020E6100000000000201B4114C0000000204A3B4840	France
7466	Sauðárkrókur Airport	SAK	Sauðárkrókur	0101000020E610000019EDFFFFA29233C0A1FAFF1FD46E5040	Iceland
7467	Selfoss Airport	\\N	Selfoss	0101000020E610000000000040AD0935C000000000F0F64F40	Iceland
7468	Inishmaan Aerodrome	IIA	Gaillimh	0101000020E6100000000000C0D82223C000000060E78B4A40	Ireland
7469	Ak Bashat Airport	TDK	Taldykorgan	0101000020E6100000EA03C93B876652407D96E7C1DD714540	Kazakhstan
7470	Ulgii Mongolei Airport	ULG	Ölgii	0101000020E6100000500D00400A7B564024FFFF7F247F4840	Mongolia
7472	Qurghonteppa International Airport	\\N	Kirov	0101000020E6100000000000405737514000000040E6EE4240	Tajikistan
7473	Vologda Airport	VGD	Vologda	0101000020E610000000000020E2F843400000000029A44D40	Russia
7480	Leshukonskoye Airport	LDG	Arkhangel’sk	0101000020E6100000571900408BDC4640C2F3FF1F58395040	Russia
7481	Nizhneangarsk Airport	\\N	Nizhneangarsk	0101000020E61000000000008014665B40000000A080E64B40	Russia
7484	Aykhal Airport	\\N	Aykhal	0101000020E61000008F0000E0F9E25B4009000080637D5040	Russia
7485	Uktus Airport	\\N	Yekaterinburg	0101000020E6100000000000C01E654E4000000040D1594C40	Russia
7487	Biysk Airport	\\N	Biysk	0101000020E610000000000080C2555540000000A0703D4A40	Russia
7488	Huesca/Pirineos Airport	HSK	Huesca	0101000020E6100000431E00A04544D4BF6A1A00A0BD094540	Spain
7489	Ciudad Real Central Airport	CQM	Ciudad Real	0101000020E6100000C3F5285C8FC20FC0DC3DAF269E6D4340	Spain
7490	Al Najaf International Airport	NJF	Najaf	0101000020E6100000C11BD2A8C0334640F5D8960167FD3F40	Iraq
7494	Rock Hill - York County Airport	RKH	Rock Hill	0101000020E6100000E223FF1FA94354C00EFC0340707E4140	United States
7495	Allegheny County Airport	AGC	Pittsburgh	0101000020E61000000000006088FB53C0000000005D2D4440	United States
7496	Cecil Airport	\\N	Jacksonville	0101000020E61000005E0500E01B7854C0EAD8FFBFFC373E40	United States
7497	Fulton County Airport Brown Field	FTY	College Park	0101000020E6100000F40A00A05E2155C0CFE8FF7FB9E34040	United States
7499	Tarin Kowt Airport	TII	Tarinkot	0101000020E61000004A0100406977504033FAFF5F564D4040	Afghanistan
7500	Zaranj Airport	ZAJ	Zaranj	0101000020E61000001766A19DD3EE4E40A3737E8AE3F83E40	Afghanistan
7501	Chakcharan Airport	CCN	Fayrōz Kōh	0101000020E610000000000080165150400000006039444140	Afghanistan
7503	Fuyang Xiguan Airport	FUG	Fuyang	0101000020E610000006D7DCD1FFEE5C40FF774485EA704040	China
7510	Stepanakert Air Base	\\N	Xankandi	0101000020E610000000000060BC6447400000002061F34340	Azerbaijan
7511	Ohio State University Airport	OSU	Groveport	0101000020E610000000000000ACC454C0370000E0360A4440	United States
7513	Addison Airport	ADS	Addison	0101000020E61000003C0900A0873558C059FCFF1FFB7B4040	United States
7514	Destin Executive Airport	DTS	Destin	0101000020E6100000A7D1FDFF2C9E55C06F8E08006D663E40	United States
7516	Chernobayevka Airport	KHE	Kherson	0101000020E61000008FF9FFBFD1404040840700A080564740	Ukraine
7519	Zhijiang Airport	HJJ	Zhijiang	0101000020E6100000CDCCCCCCCC6C5B40A41364A8EC703B40	China
7521	Yarmouth Airport	YQI	Yarmouth	0101000020E610000000000060A38550C0000000E0D7E94540	Canada
7522	Kinston Regional Jetport At Stallings Field	ISO	Kinston	0101000020E610000036FDFF9FF66653C0D81A00606BAA4140	United States
7523	First Flight Airport	FFA	Kill Devil Hills	0101000020E610000036FDFF9FF6EA52C02019006054024240	United States
7533	Centro de Lançamento de Alcântara Airport	\\N	Alcântara	0101000020E610000000000040BD3246C000000060E7FB02C0	Brazil
7538	Würzburg-Schenkenturm Airport	\\N	Würzburg	0101000020E61000000000002085CB234000000000ADE84840	Germany
7542	São Jacinto Airport	\\N	Aveiro	0101000020E61000000D17B9A7AB7B21C09E78CE1610544440	Portugal
7544	Hopsten Air Base	\\N	Hörstel	0101000020E610000000000060522A1E40000000805A2B4A40	Germany
7546	Persian Gulf International Airport	PGU	Mohr	0101000020E6100000FE9C82FC6C5E4A406687F8872D613B40	Iran
7547	Yasouj Airport	YES	Yasuj	0101000020E6100000BCFFFFDFC5C54940BAFFFFFF53B33E40	Iran
7548	Mosul International Airport	OSB	Mosul	0101000020E610000000000000DE9245400000008024274240	Iraq
7549	Tajima Airport	TJH	Toyooka	0101000020E6100000000000202FD9604000000060A3C14140	Japan
7550	Amakusa Airport	AXJ	Hondomachi-hondo	0101000020E61000003065E080164560405531957EC23D4040	Japan
7551	Kikai Airport	KKX	Naze	0101000020E610000017C7FF1FB23D6040040900C040523C40	Japan
7556	Donoi Airport	\\N	Uliastay	0101000020E6100000280F0BB5A6215840C286A757CADA4740	Mongolia
7557	Bulgan Airport	UGA	Bulgan	0101000020E6100000000000C076DE5940000000A0706D4840	Mongolia
7558	Ulaangom Airport	ULO	Ulaangom	0101000020E6100000116E32AA0CFC56402D27A1F485084940	Mongolia
7559	Borongan Airport	BPR	Borongan	0101000020E6100000BA2700E0A75E5F406B1D00E03D592740	Philippines
7560	Lubang Airport	LBX	Lubang	0101000020E610000000000060B8065E4000000000F7B52B40	Philippines
7563	Kulob Airport	TJU	Kŭlob	0101000020E61000000000002085735140000000007AFE4240	Tajikistan
7565	Daşoguz Airport	TAZ	Daşoguz	0101000020E610000095D5743DD1E94D40F8F9EFC16BE14440	Turkmenistan
7572	Dunk Island Airport	DKI	Innisfail	0101000020E6100000523000E07A446240990B004013F131C0	Australia
7574	Hamilton Airport	HLT	Hamilton	0101000020E61000000000008014C26140000000200FD342C0	Australia
7579	Provo Municipal Airport	PVU	Provo	0101000020E6100000EDFEFF9F45EE5BC0D0FFFFBF0E1C4440	United States
7580	Steamboat Springs Bob Adams Field	SBS	Steamboat Springs	0101000020E6100000287BF07F6CB75AC08AF5FC1F16424440	United States
7581	Delta Municipal Airport	DTA	Delta	0101000020E61000009525002083205CC0BB070080B7B04340	United States
7582	Richfield Municipal Airport	RIF	Richfield	0101000020E61000000000000056065CC000000060425E4340	United States
7583	Carbon County Regional/Buck Davis Field	PUC	Price	0101000020E6100000FEF3346010B05BC0DEF1FD3F94CE4340	United States
7584	Los Alamos Airport	LAM	Los Alamos	0101000020E6100000C696FF3F37915AC0E81500409DF04140	United States
7586	Lake Havasu City Airport	HII	Lake Havasu City	0101000020E6100000C4793881E9965CC0CF6740BD19494140	United States
7587	Winslow Lindbergh Regional Airport	INW	Winslow	0101000020E6100000A54300A045AE5BC0EDFEFF9FCD824140	United States
7588	Douglas Municipal Airport	DGL	Douglas	0101000020E610000015E4FF3F62605BC0221C00A0B4573F40	United States
7599	Maiana Airport	MNK	Tarawa	0101000020E610000000000000FEA0654000000060C90EF03F	Kiribati
7610	Whitianga Airport	WTZ	Thames	0101000020E610000000000060BAF5654000000020756A42C0	New Zealand
7611	Takaka Airport	KTF	Port Motueka	0101000020E6100000000000C0CC986540000000401A6844C0	New Zealand
7617	Choiseul Bay Airport	CHY	Taro	0101000020E6100000BFD2F9F0AC8C63406D5512D907D91AC0	Solomon Islands
7621	Bartow Municipal Airport	BOW	Bartow	0101000020E61000009A0B0040237254C097E8FF9F82F13B40	United States
7622	Dyagilevo Air Base	\\N	Kostroma	0101000020E6100000000000E002C943400000008085524B40	Russia
7627	Fitiuta Airport	FTI	Ta`ū	0101000020E61000007636E49F992D65C0E561A1D6346F2CC0	American Samoa
7629	Livermore Municipal Airport	LVK	Livermore	0101000020E6100000523000E07A745EC089100060C1D84240	United States
7630	Mariposa Yosemite Airport	RMY	Merced	0101000020E6100000EC8100608F025EC0A806002065C14240	United States
7633	Grootfontein Airport	GFY	Grootfontein	0101000020E610000000000040691F3240000000C0299A33C0	Namibia
7634	Rundu Airport	NDU	Rundu	0101000020E61000003B0000A02AB8334083FFFF1FDDF431C0	Namibia
7646	Jacqueline Cochran Regional Airport	TRM	Palm Springs	0101000020E61000002C0000803D0A5DC0BEFFFFBF37D04040	United States
7647	Santa Monica Municipal Airport	SMO	Santa Monica	0101000020E610000067140020DD9C5DC02D0E00C005024140	United States
7648	Bermuda Dunes Airport	UDD	Palm Springs	0101000020E61000004D0000A099115DC02A0000A0CBDF4040	United States
7649	Scottsdale Airport	ZSY	Scottsdale	0101000020E61000002FFFFFDF4DFA5BC033000020BBCF4040	United States
7650	Olympia Regional Airport	OLM	Olympia	0101000020E6100000A4B217C0CAB95EC04E250340157C4740	United States
7651	Yolo County Davis Woodland Winters Airport	DWA	Davis	0101000020E610000032C62C20D9765EC09CA1FAFF1F4A4340	United States
7652	Garfield County Regional Airport	RIL	Rifle	0101000020E6100000BB511A2087EE5AC0A6AAF9BF5DC34340	United States
7653	Shively Field	SAA	Saratoga	0101000020E610000000000060BCB45AC000000080F2B84440	United States
7654	DeKalb Peachtree Airport	PDK	College Park	0101000020E610000021F9FFFF531355C01B1000A013F04040	United States
7655	Monroe County Airport	BMG	Bloomington	0101000020E61000000000000078A755C000000020B0924340	United States
7656	Witham Field	SUA	Stuart	0101000020E6100000A239FC7F260E54C0FEF0F3DF832E3B40	United States
7657	Morristown Municipal Airport	MMU	Florham Park	0101000020E6100000000000C08D9A52C0000000C052664440	United States
7658	Napa County Airport	APC	Napa	0101000020E6100000730F09DFFB915EC0ECC039234A1B4340	United States
7659	Brown Field Municipal Airport	SDM	San Diego	0101000020E610000003FFFF5FB83E5DC0C9FFFF1F41494040	United States
7660	Wangen-Lachen Airport	\\N	Lachen	0101000020E61000000000000029BC2140000000A0339A4740	Switzerland
7662	Venice Municipal Airport	VNC	Venice	0101000020E6100000020000E02D9C54C0D6FFFF5F54123B40	United States
7663	Palm Beach County Glades Airport	PHK	Pahokee	0101000020E6100000C3E1FD9F602C54C06A1D0BC0F5C83A40	United States
7669	Northwest Florida Beaches International Airport	ECP	Panama City	0101000020E6100000F4311F10E87255C094347F4C6B5B3E40	United States
7670	San Bernardino International Airport	SBD	San Bernardino	0101000020E61000005D9FFF3F0A4F5DC032F7FF1F360C4140	United States
7671	Valença Airport	VAL	Valença	0101000020E610000000000000077F43C0000000E0CE972AC0	Brazil
7673	Caruaru Airport	CAU	Caruaru	0101000020E610000000000060BA0142C000000060959020C0	Brazil
7675	Aeroclube Airport	QNV	Nova Iguaçu	0101000020E610000000000020EBBA45C000000000CCBE36C0	Brazil
7683	San Carlos Airport	SQL	San Carlos	0101000020E61000000000000000905EC02300000086C14240	United States
7684	Courtelary Airport	\\N	Saint-Imier	0101000020E610000000000080025D1C400000004080974740	Switzerland
7685	Koszalin Zegrze Pomorskie Air Base	OSZ	Koszalin	0101000020E61000004ED1915CFE4330403D0AD7A370054B40	Poland
7690	Rocky Mount Wilson Regional Airport	RWI	Rocky Mount	0101000020E6100000000000E0147953C0000000409BED4140	United States
7691	Whittier Airport	\\N	Whittier	0101000020E6100000000000A01A9762C0000000407B634E40	United States
7692	Soldotna Airport	SXQ	Kenai	0101000020E61000000000008016E162C0000000C0E33C4E40	United States
7693	Gillespie Field	SEE	El Cajon	0101000020E6100000EAFFFF3F353E5DC0140000E0C0694040	United States
7700	Phan Rang Airport	PHA	Phan Rang-Tháp Chàm	0101000020E6100000EDFEFF9FED3C5B404D2700205A442740	Vietnam
7701	Na-San Airport	SQH	Sơn La	0101000020E6100000000000A01C025A40000000408D373540	Vietnam
7702	Truckee Tahoe Airport	TKF	Truckee	0101000020E6100000A36000C0F5085EC0AFF2FFBFF5A84340	United States
7703	Fréjus Airport	FRJ	Fréjus	0101000020E610000036AB3E575BF11A403D0AD7A370B54540	France
7704	Geelong Airport	GEX	Geelong	0101000020E6100000000000E0A70A6240000000C0CC1C43C0	Australia
7711	Vaskovo Airport	\\N	Arkhangel’sk	0101000020E6100000D3F1FF3FFA354440A60300E0441C5040	Russia
7712	Cobb County-Mc Collum Field	RYY	College Park	0101000020E610000016B7FA7F4F2655C0238CFA7FB0014140	United States
7714	Brumowski  Air Base	\\N	Tulln	0101000020E6100000D57954FCDF1D3040545227A089284840	Austria
7717	Mission Field	LVM	Livingston	0101000020E61000005C220000AC9C5BC02E11000086D94640	United States
7720	Big Timber Airport	6S0	Livingston	0101000020E6100000000000C0C87E5BC00000002038E74640	United States
7721	Tulip City Airport	BIV	Holland	0101000020E6100000E3FFFF9FDF8655C02E000060175F4540	United States
7722	London Heliport	\\N	London	0101000020E6100000AA09006005F8C6BF7EFEFFDF1FBC4940	United Kingdom
7723	Venice-Lido Airport	\\N	Venice	0101000020E6100000BB270F0BB5C628406BF46A80D2B64640	Italy
7724	Tallinn Linnahall Heliport	\\N	Tallinn	0101000020E610000000000080D3C03840000000606CB94D40	Estonia
7725	Hernesaari Heliport	HEN	Helsinki	0101000020E610000000000060A8EC384000000060EA124E40	Finland
7726	Linkenheim Airport	\\N	Linkenheim-Hochstetten	0101000020E61000000000000019CA20400000002022924840	Germany
7727	Monument Valley Airport	\\N	Kayenta	0101000020E610000067140020DD8C5BC01BF0FF3F23824240	United States
7728	Hilversum Airport	\\N	Hilversum	0101000020E6100000BEF1FF7F7796144004E6FF1F90184A40	Netherlands
7730	Texel Airport	\\N	Den Burg	0101000020E61000006FFCFFDF9D5513408E190020C28E4A40	Netherlands
7731	La Cerdanya Airport	\\N	Puigcerdà	0101000020E610000000000060E1DDFD3F0000008075314540	Spain
7732	Lakeland Linder Regional Airport	LAL	Winston	0101000020E6100000050900C0308154C03F2F008028FD3B40	United States
7738	Stary Oskol Airport	\\N	Staryy Oskol	0101000020E6100000000000A069E24240000000C023AA4940	Russia
7766	Syangboche Airport	SYH	Lobujya	0101000020E6100000E86A2BF697AD5540E4839ECDAACF3B40	Nepal
7767	Indianola Municipal Airport	IDL	College Point	0101000020E610000018CC5F2173AB56C0965984622BBE4040	United States
7768	Cheremshanka Airport	\\N	Krasnoyarsk	0101000020E61000007CF8FF5F8F225740C0F0FFDFA7164C40	Russia
7769	French Valley Airport	RBK	Murrieta	0101000020E61000000BF2FF1F31485DC07CF8FF5F7FC94040	United States
7772	Oristano-Fenosu Airport	FNU	Oristano	0101000020E61000004ED4D2DC0A49214070ECD97399F24340	Italy
7773	White Waltham Airfield	\\N	Maidenhead	0101000020E61000005B0B00C03EC8E8BFD3F1FF3F1AC04940	United Kingdom
7774	Mysore Airport	MYQ	Mysore	0101000020E6100000000000A09429534000000060499D2840	India
7775	Carl R Keller Field	PCW	Port Clinton	0101000020E6100000000000C098B754C00000002016C24440	United States
7776	Dayton-Wright Brothers Airport	MGY	Vandalia	0101000020E6100000260200C0640E55C0A3FDFF5F64CB4340	United States
7777	Richmond Municipal Airport	RID	Fort Lee	0101000020E610000000000060F03555C0000000E0EBE04340	United States
7778	Findlay Airport	FDY	Findlay	0101000020E6100000E0060000CCEA54C055F3FF5FBA814440	United States
7780	Burlington Executive	\\N	Burlington	0101000020E6100000F6F4FF1468F653C04E34708981B84540	Canada
7800	Skå-Edeby Airport	ESX	Mülheim	0101000020E61000000000006091BD3140000000402CAC4D40	Germany
7804	Wycombe Air Park	\\N	High Wycombe	0101000020E610000037FCFF1FDDDDE9BFE3ECFF1F4CCE4940	United Kingdom
7805	Bembridge Airport	BBP	Sandown	0101000020E6100000A7CEFF1F44C0F1BF62EBFFFFCB564940	United Kingdom
7806	Waterville / Kings County Municipal Airport	\\N	Kentville	0101000020E61000002B0B0080B52950C0A50000A0A4864640	Canada
7809	Black Hills Airport-Clyde Ice Field	SPF	Spearfish	0101000020E6100000A50000A01CF259C0D4FFFF7F7A3D4640	United States
7810	Westkapelle heliport	\\N	Knokke-Heist	0101000020E61000006E0000C02D580A40F5FFFF9F3EA94940	Belgium
7811	Redcliffe Airport	\\N	Narangba	0101000020E6100000000000002D22634000000040EA343BC0	Australia
7812	Oksywie Military Air Base	QYD	Gdynia	0101000020E610000036200040678432401B1000A0334A4B40	Poland
7813	Malbork Military Air Base	\\N	Malbork	0101000020E6100000513000E05A2233408DF6FF7F71034B40	Poland
7814	Lask Military Air Base	\\N	Łask	0101000020E6100000CEE8FF7FD92D334074E9FF1F9EC64940	Poland
7815	Miroslawiec Military Air Base	\\N	Złocieniec	0101000020E61000001301006032153040140400A092B24A40	Poland
7816	Krzesiny Military Air Base	\\N	Poznań	0101000020E61000002E11000066F730402BEBFF1F752A4A40	Poland
7817	Olive Branch Airport	OLV	Olive Branch	0101000020E6100000E7F2FF9F5C7256C02E110000467D4140	United States
7818	Viña del mar Airport	\\N	Viña del Mar	0101000020E610000066F7E461A1DE51C00B24287E8C7940C0	Chile
7820	Brampton Airport	\\N	Brampton	0101000020E61000000000000000F853C08DF6FF7F51E14540	Canada
7821	Zonguldak Airport	ONQ	Zonguldak	0101000020E6100000B9040040570B40408FF9FFBFD1C04440	Turkey
7822	Rocky Mountain Metropolitan Airport	BJC	Broomfield	0101000020E6100000256F25E07C475AC011C8048053F44340	United States
7826	Salem Municipal Airport/McNary Field	SLE	Four Corners	0101000020E61000002E7C332031C05EC0D58DFB7F6A744640	United States
7827	Tunica Municipal Airport	UTM	Helena-West Helena	0101000020E61000001D000060309656C0CBFFFFFF2A574140	United States
7828	Batken Airport	\\N	Batken	0101000020E6100000F6D1A92B9FB55140FB03E5B67D054440	Kyrgyzstan
7831	Hunt Field	LND	Lindau	0101000020E610000041120060B82E5BC0C213008058684540	Germany
7834	Hoogeveen Airport	\\N	Hoogeveen	0101000020E6100000790000207F101A40D41400E08A5D4A40	Netherlands
7835	Teuge Airport	\\N	Deventer	0101000020E610000053F7FF3FCA2F184013010060521F4A40	Netherlands
7836	Midden-Zeeland Airport	\\N	Middelburg	0101000020E61000008013004050D90D407B1800C08FC14940	Netherlands
7837	Ameland Airport	\\N	Stiens	0101000020E61000004710002079B516408CF3FF3FD1B94A40	Netherlands
7838	Saint-Cyr-l'École Airport	\\N	Saint-Cyr-l’École	0101000020E6100000000000C00699004000000000DC674840	France
7839	Lawrence J Timmerman Airport	MWC	Milwaukee	0101000020E6100000000000A0330256C0000000A0218E4540	United States
7840	Southern Wisconsin Regional Airport	JVL	Janesville	0101000020E6100000CC0500A0A94256C02E110000664F4540	United States
7841	Mantsonyane Airport	\\N	Thaba-Tseka	0101000020E61000000000004060453C4000000040CD8B3DC0	Lesotho
7846	Arlington Municipal Airport	GKY	Arlington	0101000020E610000000000000094658C0000000A0FA544040	United States
7847	Gwinnett County Briscoe Field	LZU	Lawrenceville	0101000020E610000035F9FBFF97FD54C0CE8FF95F32FD4040	United States
7848	Bowling Green Warren County Regional Airport	BWG	Bowling Green	0101000020E6100000610B0060DC9A55C0A8E6FFBF747B4240	United States
7849	Richard Lloyd Jones Jr Airport	RVS	Tulsa	0101000020E6100000E3FFFF9F03FF57C0C0FFFF9F11054240	United States
7853	Al Minhad Air Base	NHD	Dubai	0101000020E61000007EFBFF9FDFAE4B4068D4FF5FDC063940	United Arab Emirates
7854	Kirovograd Airport	KGO	Kropyvnytskyi	0101000020E6100000000000E07A244040000000807A454840	Ukraine
7855	Roitzschjora Airport	\\N	Bad Düben	0101000020E6100000000000C027FD2840000000A0F4C94940	Germany
7856	El Alamein International Airport	DBB	Al ‘Alamayn	0101000020E6100000000000401E763C4000000000ACEC3E40	Egypt
7859	Burlington Alamance Regional Airport	\\N	South Burlington	0101000020E6100000000000C064DE53C00000004035064240	United States
7861	Chkalovskiy Airport	CKL	Shchelkovo	0101000020E61000002C0E00C0E5074340E3ECFF1F6CF04B40	Russia
7863	Belbek Airport	UKS	Sevastopol	0101000020E6100000B5FBFF7F16C940400BF2FF1F31584640	Ukraine
7867	De Peel Air Base	\\N	Venray	0101000020E6100000000000E0416C1740000000E036C24940	Netherlands
7868	Camp Bastion Airport	\\N	Gereshk	0101000020E61000007FFEFFDF5F0E504013E1FFFF21DD3F40	Afghanistan
7869	New Century Aircenter Airport	JCI	Olathe	0101000020E610000056F6FF9FFAB857C058F9FFDF5A6A4340	United States
7870	Easton Newnam Field	ESN	Easton	0101000020E6100000D6F4FF7F6A0453C07D1B0000F0664340	United States
7871	Stafsberg Airport	HMR	Hamar	0101000020E6100000000000E0D022264000000080B7684E40	Norway
7875	Yuba County Airport	MYV	Yuba City	0101000020E6100000B58E05E07A645EC0C83A03C0848C4340	United States
7879	Phillip Island Airport	\\N	Phillip Island	0101000020E6100000000000C0762A624000000080FB4243C0	Australia
7880	Halliburton Field	DUC	Duncan	0101000020E6100000C17BFDFF6E7D58C006980180463C4140	United States
7885	Garner Field	UVA	Uvalde	0101000020E61000003903002097EF58C0C3D3FFBF17363D40	United States
7886	Lewis University Airport	LOT	Lockport	0101000020E610000039AD0420280656C005EFF5FFBBCD4440	United States
7888	Buchanan Field	CCR	Harrisburg	0101000020E6100000A17D00E0A5835EC073090080AEFE4240	United States
7889	Ocean Reef Club Airport	OCA	Leisure City	0101000020E6100000F9FFFF5F961154C0510000604D533940	United States
7892	Strasbourg Neuhof Airport	\\N	Strasbourg	0101000020E6100000000000C0BB1C1F40000000A0F6464840	France
7893	Nannhausen Airport	\\N	Simmern	0101000020E6100000550800C0AAEA1D4011FEFF1F32FC4840	Germany
7894	Yushu Batang Airport	YUS	Yushu	0101000020E6100000DAF00F32544258401A4886CA0E6B4040	China
7902	Oshawa Airport	YOO	Oshawa	0101000020E61000003C0900A047B953C0F4EAFF3F1EF64540	Canada
7903	Marl-Loemühle Airport	\\N	Recklinghausen	0101000020E61000009ED2C1FA3FA71C40F1F3DF83D7D24940	Germany
7904	Färila Air Base	\\N	Ljusdal	0101000020E61000009C0000201D692F40C0FFFF9FF1F24E40	Sweden
7905	Lahr Airport	LHA	Lahr	0101000020E610000030F4FFDF954F1F4029080040452F4840	Germany
7906	Monywar Airport	\\N	Monywa	0101000020E6100000000000E07CC75740000000E0A53B3640	Myanmar
7907	Ohio University Snyder Field	\\N	Athens	0101000020E6100000FCF6FF3FCF8E54C00D180000029B4340	United States
7908	Springfield-Beckley Municipal Airport	SGH	Springfield	0101000020E6100000020000E0C5F554C0120000008FEB4340	United States
7910	Fes Sefrou Airport	\\N	Fès	0101000020E6100000000000C0BBDC13C00000006009014140	Morocco
7911	Herrera Airport	HEX	Santo Domingo	0101000020E610000056F6FF9F0A7E51C0F4EAFF3F3E783240	Dominican Republic
7918	Regensburg-Oberhub Airport	\\N	Regensburg	0101000020E6100000000000A0F4292840000000402B924840	Germany
7924	Hastings Airport	HGS	Tintafor	0101000020E61000000000006019422AC0000000A054CB2040	Sierra Leone
7925	Philip Billard Municipal Airport	TOP	Topeka	0101000020E610000012000000D7E757C033000020CB884340	United States
7928	Benson Airstrip	\\N	Uvalde	0101000020E6100000000000C0BAF458C000000000BA3A3D40	United States
7929	Rough River State Park Airport	\\N	Chesterfield	0101000020E61000003A2009FB76A055C096EB6D3315CE4240	United States
7930	Smyrna Airport	\\N	Smyrna	0101000020E6100000CB02006049A155C0BAE4FFDF26014240	United States
7931	Franklin County Airport	\\N	Winchester	0101000020E61000001A0000807A7955C0390000C0409A4140	United States
7933	Cochstedt Airport	CSO	Staßfurt	0101000020E610000093BFFF7F31D72640F6EDFF7F9EED4940	Germany
7935	Collin County Regional At Mc Kinney Airport	TKI	McKinney	0101000020E6100000153902C0CA2558C0EE7A0660C5964040	United States
7936	Chicago Executive Airport	PWK	Wheeling	0101000020E610000093E2E313B2F955C0EA3D95D39E0E4540	United States
7938	Southwest Washington Regional Airport	KLS	Kelso	0101000020E6100000388600E078B95EC055F6FF9F1A0F4740	United States
7939	Benešov Airport	\\N	Benešov	0101000020E610000000000020164A2D4000000080D2DE4840	Czechia
7941	Bougouni Airport	\\N	Bougouni	0101000020E61000000000008068111EC00000006066E62640	Mali
7963	Kerch Airport	KHC	Kerch	0101000020E6100000000000206133424000000020AEAF4640	Ukraine
7976	Ukunda Airstrip	UKA	Gazi	0101000020E6100000000000C019C94340000000C05E2C11C0	Kenya
7978	Wilmington Airpark	ILN	Kings Grant	0101000020E61000008FF9FFBFB1F254C0AA090060C5B64340	United States
7979	Marana Regional Airport	AVW	Tucson	0101000020E6100000A9A3FFBFF3CD5BC06E0000C06D344040	United States
7980	Casa Grande Municipal Airport	CGZ	Casa Grande	0101000020E61000003C86C77E16F15BC0D6FD63213A7A4040	United States
7981	Mobile Airport	\\N	Mobile	0101000020E61000000000004037115CC0000000C0528E4040	United States
7982	Buckeye Municipal Airport	BXK	Buckeye	0101000020E6100000DD09F65FE72B5CC0845DFB9FCFB54040	United States
7983	Gila Bend Municipal Airport	E63	Buckeye	0101000020E61000001AE9FB5F642B5CC0EE3B0A00A37A4040	United States
7984	McMinn County Airport	MMI	Athens	0101000020E6100000D0B6FD9F012455C0E389FFBFDAB24140	United States
7985	Sterling Municipal Airport	STK	Sterling	0101000020E61000006A1D0BC0F5D059C0C093F51FC24E4440	United States
7986	Rawlins Municipal Airport/Harvey Field	RWL	Rawlins	0101000020E61000004A33CCBFCCCC5AC01451FADF1DE74440	United States
7990	Essex County Airport	CDW	North Caldwell	0101000020E610000094020080029252C03217008006704440	United States
7991	Lee C Fine Memorial Airport	AIZ	Waynesville	0101000020E6100000DAFAFFFF2A2357C04D0700C0490C4340	United States
7998	Thomasville Regional Airport	TVI	Thomasville	0101000020E61000000D00004067F854C0C7FFFF3FCFE63E40	United States
7999	Henderson Executive Airport	HSH	Enterprise	0101000020E61000008E7C008093C85CC0260200C084FC4140	United States
8000	Gostomel Airport	GML	Kiev	0101000020E61000000000006020313E40000000803F4D4940	Ukraine
8005	Henry Tift Myers Airport	TMA	Tifton	0101000020E61000009EF4FF9F43DF54C097080000D36D3F40	United States
8006	Landshut Airport	\\N	Landshut	0101000020E61000000000000011112840000000407E414840	Germany
8007	Itzehoe/Hungriger Wolf Airport	\\N	Itzehoe	0101000020E6100000000000C03F282340000000004AFF4A40	Germany
8029	Radom Airport	QXR	Radom	0101000020E6100000523000E09A3635408BF3FF3FD1B14940	Poland
8030	Phoenix Deer Valley Airport	DVT	Peoria	0101000020E610000002E3FFDF4F055CC0D4F1FF3F1AD84040	United States
8031	Calgary / Springbank Airport	\\N	Calgary	0101000020E610000007A9FF9FEF975CC013010060328D4940	Canada
8033	Revelstoke Airport	YRV	Revelstoke	0101000020E6100000B9C1FF3FB68B5DC0651100E0BC7B4940	Canada
8034	Republic Airport	\\N	Farmingdale	0101000020E6100000A8060020755A52C0CB020060495D4440	United States
8035	Allstedt Airport	\\N	Roßleben	0101000020E610000000000080B1E4264000000000B6B04940	Germany
8038	General Freire Airport	\\N	Curicó	0101000020E610000000000060D9CD51C0000000C0BB7B41C0	Chile
8039	Peine-Eddesse Airport	\\N	Peine	0101000020E61000008FB9FFFF30752440A906002085334A40	Germany
8042	South Texas Regional Airport at Hondo	HDO	Hondo	0101000020E6100000120000004FCB58C042000040085C3D40	United States
8051	Lake Hood Seaplane Base	LHD	Anchorage	0101000020E6100000000000A01ABF62C0000000400A974E40	United States
8054	Spremberg-Welzow Airport	\\N	Großräschen	0101000020E6100000000000801D462C40000000E0ABC94940	Germany
8055	Taichung Airport	TXG	Taichung	0101000020E610000000000020DB295E4000000060B12F3840	Taiwan
8062	Wheeling Ohio County Airport	HLG	Martins Ferry	0101000020E610000069F7FFFF5C2954C0B115006066164440	United States
8063	Fitzgerald Municipal Airport	FZG	Fitzgerald	0101000020E6100000000000E04FD154C00000000007AF3F40	United States
8076	Al Maktoum International Airport	DWC	Dubai	0101000020E610000092770E65A8944B40C992399677E53840	United Arab Emirates
8077	Aransas County Airport	RKP	Rockport	0101000020E6100000D7F7FFBFDA4258C0C213008038163C40	United States
8079	Megève Airport	MVV	Verdun	0101000020E610000000000080DF9B1A400000000010E94640	France
8080	Méribel Altiport	MFX	Ajaccio	0101000020E610000078F01307D04F1A40DC2F9FAC18B44640	France
8085	Rotenburg (Wümme) Airport	\\N	Rotenburg	0101000020E6100000000000207DB22240000000406D904A40	Germany
8086	Wipperfürth-Neye Airport	\\N	Wipperfürth	0101000020E6100000000000E0937E1D40000000C0E48F4940	Germany
8087	Osnabrück-Atterheide Airport	\\N	Osnabrück	0101000020E6100000000000C0FEE01F4000000060A8244A40	Germany
8088	Flugplatz Ballenstedt	\\N	Ballenstedt	0101000020E6100000EB573A1F9E752640581F0F7D77DF4940	Germany
8089	Hartenholm Airport	\\N	Bad Bramstedt	0101000020E61000000000006034122440000000C01EF54A40	Germany
8090	Ganderkesee Atlas Airfield Airport	\\N	Ganderkesee	0101000020E610000000000040D8022140000000409F844A40	Germany
8091	Nienburg-Holzbalge Airport	\\N	Nienburg	0101000020E6100000000000403353224000000020D85A4A40	Germany
8092	Damme Airport	\\N	Damme	0101000020E610000000000040015F204000000060663E4A40	Germany
8093	Borkenberge Airport	\\N	Dülmen	0101000020E610000041040020F8261D40B7010000D7E34940	Germany
8094	Obermehler-Schlotheim Airport	\\N	Mühlhausen	0101000020E610000000000040FA4425400000008046A24940	Germany
8095	Hodenhagen Airport	\\N	Schwarmstedt	0101000020E6100000000000600B362340000000206C614A40	Germany
8096	Grube Airport	\\N	Lensahn	0101000020E610000000000060A80C2640000000004A1F4B40	Germany
8097	Tønder Airport	\\N	Tønder	0101000020E6100000000000405FAE21400000006000774B40	Denmark
8098	Celle-Arloh Airport	\\N	Celle	0101000020E61000000000000008392440000000E0F6574A40	Germany
8099	Uelzen Airport	\\N	Uelzen	0101000020E6100000A11A008014EE244004E6FF1FF07D4A40	Germany
8100	Hamm-Lippewiesen Airport	\\N	Hamm	0101000020E6100000000000A0B2431F40000000C048D84940	Germany
8101	Lüsse Airport	\\N	Bad Belzig	0101000020E61000000000008056542940000000E00F124A40	Germany
8102	Porta Westfalica Airport	\\N	Bad Oeynhausen	0101000020E6100000000000C0E4B7214000000040441C4A40	Germany
8103	Brilon/Hochsauerlandkreis Airport	\\N	Brilon	0101000020E6100000000000A0884821400000002085B34940	Germany
8104	Hameln-Pyrmont Airport	\\N	Bad Pyrmont	0101000020E61000000000006055952240000000C0BBFB4940	Germany
8105	Nordholz-Spieka Airfield	\\N	Cuxhaven	0101000020E610000014B188618749214098DEFE5C34E24A40	Germany
8106	Köthen Airport	\\N	Köthen	0101000020E6100000A194FF7FD2E72740EBFBFF5F4DDC4940	Germany
8107	St. Michaelisdonn Airport	\\N	Brunsbüttel	0101000020E610000000000000194A22400000000031FD4A40	Germany
8108	Salzgitter-Drütte Airport	\\N	Wolfenbüttel	0101000020E61000000000002074DA2440000000E0C4134A40	Germany
8109	Karlshöfen Airport	\\N	Gnarrenburg	0101000020E6100000000000A0810E22400000008098AA4A40	Germany
8110	Oldenburg-Hatten Airport	\\N	Oldenburg	0101000020E6100000000000A091A0204000000060D1884A40	Germany
8111	Rinteln Airport	\\N	Rinteln	0101000020E6100000000000804E1B2240000000806F164A40	Germany
8112	Münster-Telgte Airport	\\N	Münster	0101000020E61000000000006076181F4000000080E3F84940	Germany
8113	St. Peter-Ording Airport	PSH	Tönning	0101000020E610000000000020B75F2140000000A089274B40	Germany
8114	Lüchow-Rehbeck Airport	\\N	Lüchow	0101000020E6100000000000A0F4492640000000E00F824A40	Germany
8115	Klietz/Scharlibbe Airport	\\N	Havelberg	0101000020E6100000000000E08B25284000000000CF5A4A40	Germany
8116	Burg Airport	\\N	Burg bei Magdeburg	0101000020E61000000000002054B6274000000000EF1E4A40	Germany
8117	Crisp County Cordele Airport	CKF	Cordele	0101000020E61000001DB5FC9F87F154C07D08050022FD3F40	United States
8118	Ormond Beach Municipal Airport	OMN	Ormond Beach	0101000020E610000000000040454754C000000020F44C3D40	United States
8119	Bad Neuenahr-Ahrweiler Airport	\\N	Bad Neuenahr-Ahrweiler	0101000020E610000000000080A98B1C400000004065474940	Germany
8120	Bad Dürkheim Airport	\\N	Bad Dürkheim	0101000020E6100000000000208D642040000000208DBC4840	Germany
8121	Portland Troutdale Airport	TTD	Troutdale	0101000020E610000050FFFFFFA9995EC0160000C052C64640	United States
8122	Portland Hillsboro Airport	HIO	Hillsboro	0101000020E6100000149337C0CCBC5EC0E4DC26DC2BC54640	United States
8123	One Police Plaza Heliport	\\N	College Point	0101000020E610000000000080F97F52C000000080365B4440	United States
8124	Leverkusen Airport	\\N	Leverkusen	0101000020E610000000000080B0051C40000000A0F4814940	Germany
8126	Wershofen/Eifel Airport	\\N	Blankenheim	0101000020E61000000000000022221B4000000020C7394940	Germany
8127	Khost Airport	KHT	Khōst	0101000020E6100000EDFEFF9FED7C5140E8F5FFDFACAA4040	Afghanistan
8130	Namtu Airport	\\N	Nay Pyi Taw	0101000020E61000000000002083585840000000803F153740	Myanmar
8133	Bend Municipal Airport	\\N	Bend	0101000020E610000047270120DD4C5EC0003FFC5F220C4640	United States
8136	Prineville Airport	\\N	Prineville	0101000020E610000019FFFF1FDB395EC0D6FFFF5FBC244640	United States
8137	Red Bluff Municipal Airport	\\N	Red Bluff	0101000020E6100000119BFFBF20905EC0D00B00204A134440	United States
8138	Marin County Airport - Gnoss Field	\\N	Novato	0101000020E61000002C00008095A35EC0E6FFFF7F61124340	United States
8140	Tillamook Airport	\\N	Sheridan	0101000020E61000003C4C00A018F45EC0BFEDFF9F87B54640	United States
8141	Ontario Municipal Airport	\\N	Ontario	0101000020E6100000ABFEFF5FE5405DC0BEFFFFBF9F024640	United States
8142	Columbia Gorge Regional the Dalles Municipal Airport	\\N	The Dalles	0101000020E6100000FE1C0020B04A5EC0551600002BCF4640	United States
8143	Montgomery County Airpark	GAI	Gaithersburg	0101000020E6100000FEFCFFBF9F4A53C0D41400E08A954340	United States
8146	Sharana Airstrip	AZ3	Zaṟah Sharan	0101000020E6100000F6083543AA3551406ABC749318904040	Afghanistan
8147	Pembroke Airport	YTA	Pembroke	0101000020E6100000000000E01B5053C0000000A0A4EE4640	Canada
8148	Tsumeb Airport	TSB	Tsumeb	0101000020E61000000F00002085BB3140DFFFFFDF0B4333C0	Namibia
8149	Suffield Heliport	YSD	Medicine Hat	0101000020E610000000000040B6CB5BC00000004023224940	Canada
8152	Blumenau Airport	BNU	Blumenau	0101000020E6100000000000008F8B48C000000040A2D43AC0	Brazil
8162	Charlevoix Municipal Airport	CVX	Petoskey	0101000020E610000000000060965155C0000000A003A74640	United States
8165	Mykines Heliport	\\N	Miðvágur	0101000020E610000063EBFFFF6B951EC00EF8FF9F110D4F40	Faroe Islands
8177	Cornwall Regional Airport	YCC	Cornwall	0101000020E6100000000000200DA452C0000000E0E08B4640	Canada
8178	Seppe Airport	\\N	Sint Willebrord	0101000020E610000013080080C23512408204006000C74940	Netherlands
8179	St Stephan Airport	\\N	Gstaad	0101000020E6100000000000C078A61D40000000C0AA3F4740	Switzerland
8180	Zona da Mata Regional Airport	IZA	Juiz de Fora	0101000020E6100000331A00C0269645C03C0900A0578335C0	Brazil
8182	Flagler County Airport	XFL	Palm Coast	0101000020E610000065030200344D54C0DA290C80A7773D40	United States
8187	Morrisville Stowe State Airport	MVL	Morristown	0101000020E6100000DE0300C04B2752C06D0000C06D444640	United States
8188	Dallas Executive Airport	RBD	University Park	0101000020E6100000840700A0903758C040EFFFBF27574040	United States
8189	Como (Idroscalo - Water Ad) Hidroport	\\N	Como	0101000020E610000016C1FF56B22322405E82531F48E84640	Italy
8194	Westerly State Airport	WST	Westerly	0101000020E610000058F9FFDF6AF351C0FEFCFFBFBFAC4440	United States
8195	Block Island State Airport	BID	Charlestown	0101000020E610000056F6FF9FFAE451C022FCFF3F84954440	United States
8209	Vinnytsia/Gavyryshivka Airport	VIN	Vinnytsya	0101000020E61000001901158E209D3C4012A27C410B9F4840	Ukraine
8215	Decatur County Industrial Air Park	BGE	Bainbridge	0101000020E6100000602C0420CB2855C0090D0E40B4F83E40	United States
8219	Silver Springs Airport	SPZ	Silver Springs	0101000020E61000000000006010D05DC00000008095B34340	United States
8220	Whiteman Airport	WHP	Los Angeles	0101000020E6100000FAD3FF9F6E9A5DC088EDFFBF30214140	United States
8221	Madera Municipal Airport	MAE	Madera	0101000020E61000004F4D00002B075EC0521000808A7E4240	United States
8223	Trail Airport	YZZ	Trail	0101000020E6100000455B00E0F9665DC072E6FFDF1D874840	Canada
8224	Victoria Airport	\\N	North Saanich	0101000020E610000068C4FF2FD4DC5EC07F3816BCB2534840	Canada
8227	Birchwood Airport	BCV	Belmopan	0101000020E6100000547E086039B062C060AAFCDF4FB54E40	Belize
8230	Saint-Laurent-du-Maroni Airport	LDX	Saint-Laurent-du-Maroni	0101000020E610000090F9804067044BC0E605D847A7EE1540	French Guiana
8235	Sohag International Airport	HMB	Sohag	0101000020E61000003430F2B226BE3F40CDC98B4CC0573A40	Egypt
8236	Presidente General Don Oscar D. Gestido International Airport	RVY	Rivera	0101000020E610000000000020F4BC4BC0000000607FF93EC0	Uruguay
8237	Patos de Minas Airport	POJ	Patos de Minas	0101000020E6100000000000A0DF3E47C0000000A03CAC32C0	Brazil
8238	Bauru - Arealva Airport	JTC	Bauru	0101000020E6100000783333CB6F8648C04334D947B72A36C0	Brazil
8240	Redenção Airport	RDC	Redenção	0101000020E6100000000000606DFD48C0000000600B1120C0	Brazil
8241	São Félix do Xingu Airport	SXX	São Félix do Xingu	0101000020E61000008BFD65F7E4F949C0FFB27BF2B0901AC0	Brazil
8242	Bonito Airport	BYO	Bonito	0101000020E6100000823CBB7CEB394CC06155BDFC4E3F35C0	Brazil
8244	Caçador Airport	CFC	Caçador	0101000020E6100000D81A00604B7849C028E5FF9FD4C93AC0	Brazil
8245	Carauari Airport	CAF	Carauari	0101000020E6100000000000A070B950C0000000C06F7C13C0	Brazil
8247	Eirunepé Airport	ERN	Eirunepé	0101000020E6100000000000A04E7851C000000000E18E1AC0	Brazil
8248	Concórdia Airport	CCI	Concórdia	0101000020E6100000000000E0BE064AC0000000C03B2E3BC0	Brazil
8249	Francisco Beltrão Airport	FBE	Francisco Beltrão	0101000020E6100000000000C020884AC0000000C0270F3AC0	Brazil
8253	Umuarama Airport	UMU	Umuarama	0101000020E6100000000000A02AA84AC0000000A077CC37C0	Brazil
8254	Diamantina Airport	DTI	Diamantina	0101000020E61000000103004040D345C09D340060643B32C0	Brazil
8255	Fonte Boa Airport	FBA	Fonte Boa	0101000020E6100000180A0020538550C0442A0000C94204C0	Brazil
8256	Senadora Eunice Micheles Airport	OLC	São Paulo de Olivença	0101000020E610000060000008E83A51C0648561D351BE0BC0	Brazil
8257	Humaitá Airport	HUW	Humaitá	0101000020E610000056F6FF9F3A894FC0A4EFFF1FE4201EC0	Brazil
8259	Oriximiná Airport	ORX	Oriximiná	0101000020E6100000000000A008EB4BC000000020DF6CFBBF	Brazil
8260	Hotel Transamérica Airport	UNA	Una	0101000020E6100000FBF6FF3FDF7F43C0F0A1FFBFDCB52EC0	Brazil
8266	Gazipaşa Airport	GZP	Alanya	0101000020E6100000D2EEFFFF7926404067F4FFBF4C264240	Turkey
8273	Douglas Municipal Airport	DQH	Douglas	0101000020E61000000000006012B754C000000000097A3F40	United States
8274	St Lucie County International Airport	FRP	Fort Pierce	0101000020E6100000C447FE3F921754C02126FADFBE7E3B40	United States
8276	Taunton Municipal King Field	TAN	Taunton	0101000020E61000000000000010C151C000000060ECEF4440	United States
8277	Plymouth Municipal Airport	PYM	Carver	0101000020E6100000000000A0A4AE51C0000000205AF44440	United States
8278	Quonset State Airport	OQU	North Kingstown	0101000020E6100000DFFFFFDF5FDA51C0E1FFFFBF6DCC4440	United States
8280	Norwood Memorial Airport	OWD	Norwood	0101000020E6100000050900C010CB51C00F1B004062184540	United States
8281	Barnes Municipal Airport	BAF	Westfield	0101000020E61000003883BF5FCC2D52C0B62BF4C132144540	United States
8282	Windham Airport	IJD	Willimantic	0101000020E6100000000000008A0B52C0000000603BDF4440	United States
8283	Orange County Airport	MGJ	Montgomery	0101000020E61000009DC8FE3FEF9052C01DB5FC9F47C14440	United States
8284	Capital City Airport	CXY	Middletown	0101000020E6100000FAF3FFFF7E3653C0CE0800E0C91B4440	United States
8285	Marshfield Municipal George Harlow Field	GHG	Hanover	0101000020E61000000000006005AB51C000000020950C4540	United States
8286	Danbury Municipal Airport	DXR	Danbury	0101000020E6100000610B0060DC5E52C06AFAFF3F8DAF4440	United States
8287	Boire Field	ASH	Nashua	0101000020E610000093020080F2E051C0750C00C00E644540	United States
8288	Lawrence Municipal Airport	LWM	North Andover	0101000020E6100000B0F2FFBFE5C751C06AFAFF3FCD5B4540	United States
8289	Waterbury Oxford Airport	OXC	Oxford	0101000020E6100000ECFFFF1FA74852C0160000C042BD4440	United States
8290	Fitchburg Municipal Airport	FIT	Leominster	0101000020E61000000000008093F051C0000000C0EC464540	United States
8291	Earl L. Small Jr. Field/Stockmar Airport	\\N	Villa Rica	0101000020E610000078F2FFDF9E3855C0AAE9FFFFD4E04040	United States
8292	Cartersville Airport	VPC	Cartersville	0101000020E610000000000020513655C0000000C0C10F4140	United States
8293	Centre-Piedmont-Cherokee County Regional Airport	PYP	Cedartown	0101000020E61000006BD3D85E0B6755C03332C85D840B4140	United States
8294	Richard B Russell Airport	RMG	Rome	0101000020E6100000E7F2FF9F1C4A55C003060080E02C4140	United States
8295	Northeast Alabama Regional Airport	GAD	Gadsden	0101000020E6100000635E471CB28555C0A88FC01F7EFC4040	United States
8296	Knoxville Downtown Island Airport	DKX	Alcoa	0101000020E610000000000000EEF754C00000002061FB4140	United States
8297	Barrow County Airport	WDR	Winder	0101000020E6100000A6ED04A0B6EA54C0845DFB9FCFFD4040	United States
8298	Plantation Airpark	JYL	Sylvania	0101000020E6100000000000E0366654C00000004099524040	United States
8299	Dalton Municipal Airport	DNN	Dalton	0101000020E61000002519FF5FB13755C067A8FEFF875C4140	United States
8300	West Georgia Regional O V Gray Field	CTJ	Carrollton	0101000020E610000000000060BA4955C0000000A0C4D04040	United States
8302	Lagrange Callaway Airport	LGC	La Grange	0101000020E61000002B0B0080A54455C09EF4FF9F23814040	United States
8303	Baldwin County Airport	MLJ	Milledgeville	0101000020E6100000811302A067CF54C0CF3805E0BC934040	United States
8305	Harris County Airport	PIM	La Grange	0101000020E61000004A010040793855C0DF0600009C6B4040	United States
8306	Peachtree City Falcon Field	FFC	College Park	0101000020E610000000000060982455C000000000BCAD4040	United States
8308	Lee Gilmer Memorial Airport	GVL	Gainesville	0101000020E61000007D08050022F554C0504C0780E4224140	United States
8312	Harry Clever Field	PHD	New Philadelphia	0101000020E61000001D000060DC5A54C01A000080463C4440	United States
8313	Darlington County Jetport Airport	UDG	Darlington	0101000020E61000007317FE5FF7F853C015BB090086394140	United States
8314	Hilton Head Airport	HHH	Hilton Head Island	0101000020E6100000A0F7FFDFA32C54C0461B0020B91C4040	United States
8318	Daniel Field	DNL	Augusta	0101000020E61000002B0B0080858254C0B3F8FF3FB6BB4040	United States
8319	Foothills Regional Airport	MRN	Morganton	0101000020E610000000000020216754C000000060FCE84140	United States
8320	Pike County-Hatcher Field	PBX	Pikeville	0101000020E61000009259FFDF3FA454C03B3A0900E9C74240	United States
8321	Mallards Landing Airport	\\N	Locust Grove	0101000020E6100000000000A0920A55C000000040CFAE4040	United States
8322	Toccoa Airport - R.G. Letourneau Field	TOC	Toccoa	0101000020E610000062F80460EED254C0D0B6FD9F014C4140	United States
8323	Compton Abbas Aerodrome	\\N	Shaftesbury	0101000020E6100000000000E0973A01C000000040CD7B4940	United Kingdom
8328	Suprunovka Airport	PLV	Poltava	0101000020E610000000000080D7324140000000E0C7C84840	Ukraine
8334	Moyale Airport	OYL	Moyale	0101000020E61000009EF0129CFA8C43408B37328FFCC10B40	Kenya
8335	Zagora Airport	\\N	Zagora	0101000020E610000045F1FF5F787717C0742C0020FF513E40	Morocco
8336	Yengema Airport	WYE	Yengema	0101000020E6100000000000A03E1726C0000000808F382140	Sierra Leone
8337	Gbangbatok Airport	GBK	Bonthe	0101000020E6100000000000A018C428C00000008068111F40	Sierra Leone
8341	Podkamennaya Tunguska Airport	\\N	Bor	0101000020E6100000000000C09D7F5640000000407BCB4E40	Russia
8342	Fort Worth Alliance Airport	AFW	Fort Worth	0101000020E6100000BA040040675458C0CC0500A0697E4040	United States
8343	East Troy Municipal Airport	57C	Mukwonago	0101000020E6100000000000A0D81756C0000000A00A664540	United States
8344	Kolpashevo Airport	\\N	Kolpashevo	0101000020E610000000000020AEBB544000000060A3294D40	Russia
8347	Ali Al Salem Air Base	\\N	Kuwait City	0101000020E6100000000000A0A9C2474000000060C1583D40	Kuwait
8352	Rottnest Island Airport	RTS	Mosman Park	0101000020E6100000000000608FE25C4000000080DB0040C0	Australia
8354	Ballarat Airport	\\N	Ballarat	0101000020E6100000000000E04FF96140000000607FC142C0	Australia
8359	Kirkland Lake Airport	YKX	Kirkland Lake	0101000020E610000000000040CFFE53C000000020EB1A4840	Canada
8364	Collingwood Airport	\\N	Collingwood	0101000020E61000000EF8FF9F210A54C07CF8FF5F7F394640	Canada
8365	Brantford Municipal Airport	YFD	Brantford	0101000020E610000000000080EB1554C0000000C0D1904540	Canada
8366	Lawrence Municipal Airport	LWC	North Andover	0101000020E6100000FD33FFBFDCCD57C0C17BFDFF6E814340	United States
8367	Wellington Municipal Airport	EGT	Wellington	0101000020E6100000000000E0D95858C0000000C06BA94240	United States
8379	Pompano Beach Airpark	PMP	Pompano Beach	0101000020E6100000FCFFFF3F1C0754C0DDFFFFFF413F3A40	United States
8394	Shelby County Airport	EET	Alabaster	0101000020E6100000F01F036019B255C05D6003E0A7964040	United States
8397	Sky Ranch At Carefree Airport	\\N	Cave Creek	0101000020E6100000000000E078F95BC000000080B7E84040	United States
8401	Lombok International Airport	LOP	Praya	0101000020E6100000BB270F0BB5115D4027158DB5BF8321C0	Indonesia
8405	Glasgow City Heliport	\\N	Glasgow	0101000020E610000000000020123011C00000000042EE4B40	United Kingdom
8406	Yarram Airport	\\N	Traralgon	0101000020E61000000000000029586240000000A0894843C0	Australia
8407	Handan Airport	HDG	Handan	0101000020E6100000ACE95E4D3C9B5C40C8D5B4814E434240	China
8409	Indianapolis Metropolitan Airport	UMP	Indianapolis	0101000020E6100000E9210140E18255C08C4305A0B4F74340	United States
8410	London-Corbin Airport/Magee Field	LOZ	London	0101000020E6100000FAF3FFFF6E0555C02B0B0080858A4240	United States
8412	Simmons Army Air Field	FBG	Spring Lake	0101000020E61000008729FCDFF2BB53C04C410AE0DE904140	United States
8414	Modlin Airport	WMI	Warsaw	0101000020E610000068D4FF5FDCA634406A1A00A0BD394A40	Poland
8417	Jixi Xingkaihu Airport	JXA	Jixi	0101000020E61000001904560E2D6660402FDD240681A54640	China
8419	Jeongseok Airport	\\N	Seogwipo	0101000020E6100000062C006091AD5F40AF12002026B34040	South Korea
8427	Tura Mountain Airport	\\N	Tura	0101000020E610000024FFFF7FB41B5940FCFFFF3F58155040	Russia
8428	Beloyarskiy Airport	EYK	Beloyarskiy	0101000020E610000030F4FFDFB5AC5040E4EFFF5FECD74F40	Russia
8430	John H Batten Airport	RAC	Racine	0101000020E6100000E10900402CF455C05BFFFF5F5B614540	United States
8431	Cesar Lim Rodriguez Airport	RZP	Taytay	0101000020E6100000BFD18E1B7EE05D40A5DAA7E331A32540	Philippines
8432	Gera-Leumnitz Airport	\\N	Gera	0101000020E6100000000000E08B45284000000080DA704940	Germany
8435	Kasimovo Airfield	\\N	Agalatovo	0101000020E610000000000080C2553E40000000E061194E40	Russia
8438	Terlet Glider Field	\\N	Arnhem	0101000020E6100000FB743C66A0B217403526C45C52074A40	Netherlands
8443	Redlands Municipal Airport	REI	Mentone	0101000020E61000000000002058495DC000000020EB0A4140	United States
8445	Flabob Airport	RIR	Pedley	0101000020E6100000000000E04D5A5DC000000080AEFE4040	United States
8446	Tacoma Narrows Airport	TIW	Tacoma	0101000020E6100000901FE0FFFDA45EC039EC00804AA24740	United States
8459	Oerlinghausen Airport	\\N	Telgte	0101000020E610000000000000C65221400000000053F74940	Germany
8460	Jack Edwards Airport	JKA	Gulf Shores	0101000020E61000007B3C04C0FEEA55C05F44FC3F5E4A3E40	United States
8462	Balzers Heliport	\\N	Sargans	0101000020E61000009F8EC70C54F62240C66D3480B7884740	Switzerland
8467	Flugplatz Punitz	\\N	Oberwart	0101000020E61000006EF7729F1C51304002F1BA7EC1924740	Austria
8468	Khmelnytskyi Airport	HMJ	Khmel’nyts’kyy	0101000020E610000000000040F3EE3A40000000A00AAE4840	Ukraine
8469	Hiroshimanishi Airport	HIW	Hiroshima	0101000020E6100000000000803F8D6040000000A0F62E4140	Japan
8473	Hazleton Municipal Airport	HZL	Hazleton	0101000020E6100000E30C0080ACFF52C0791500804F7E4440	United States
8474	Greater Cumberland Regional Airport	CBE	Cumberland	0101000020E6100000150400A0B2B053C0AA090060C5CE4340	United States
8475	Sugar Loaf Shores Airport	\\N	Key West	0101000020E6100000000000801B6554C0000000C017A63840	United States
8482	Grabtsevo Airport	KLF	Kaluga	0101000020E6100000760F0000EF2E4240B115006066464B40	Russia
8493	Tri-County Regional Airport	LNR	Richland Center	0101000020E61000007CF8FF5F9F8B56C0C5190000199B4540	United States
8495	Monroe Municipal Airport	\\N	Monroe	0101000020E610000000000020C96556C000000000B54E4540	United States
8496	Joliet Regional Airport	JOT	Joliet	0101000020E6100000A66BFD5F3B0B56C09A7E054047C24440	United States
8497	Illinois Valley Regional Airport-Walter A Duncan Field	VYS	Grissom Air Force Base	0101000020E61000003883BF5FCC4956C08FC360FE0AAD4440	United States
8499	Jackson County Reynolds Field	JXN	Flowood	0101000020E6100000B7FEFFBF661D55C0880D002041214540	United States
8500	Fuerstenwalde Airport	\\N	Fürstenwalde	0101000020E61000001C330040C4312C407AF5FF1FFF314A40	Germany
8501	Eberswalde-Finow Airport	\\N	Eberswalde	0101000020E61000000000000021632B4000000060E2694A40	Germany
8502	Joseph A. Hardy Connellsville Airport	\\N	Connellsville	0101000020E61000004600FDDF0DEA53C0651BFA1FC7FA4340	United States
8503	Bedford County Airport	\\N	Bedford	0101000020E6100000F901FEDFC7A053C0C38A0920EB0A4440	United States
8504	Wings Field	BBX	Palmyra	0101000020E61000003A060060F7D052C04FEAFF9F99114440	United States
8505	Okeechobee County Airport	OBE	Okeechobee	0101000020E6100000180A0020633654C0B31B00E046433B40	United States
8506	Sebring Regional Airport	SEF	Sebring	0101000020E6100000760A03E0E95554C0094C0AA0D6743B40	United States
8507	Avon Park Executive Airport	AVO	Avon Park	0101000020E6100000AF0EFC7FC76154C0A90CEBDF58973B40	United States
8508	Winter Haven Municipal Airport - Gilbert Field	GIF	Winter Haven	0101000020E6100000ED530220367054C06433F23F1A103C40	United States
8509	Zephyrhills Municipal Airport	ZPH	Zephyrhills	0101000020E6100000510D0040FA8954C0D81A00606B3A3C40	United States
8510	Ocala International Airport - Jim Taylor Field	OCF	Ocala	0101000020E610000082790240598E54C0B258F57F2F2C3D40	United States
8511	Jesup Wayne County Airport	JES	Jesup	0101000020E6100000EED1FADF7A7854C0CAB4ECFFD28D3F40	United States
8512	Madison Municipal Airport	52A	Monona	0101000020E6100000BA04004077DD54C0CDE5FF3F59CE4040	United States
8513	Newnan Coweta County Airport	CCO	Newnan	0101000020E610000000000060443155C000000080E2A74040	United States
8514	Thomson-McDuffie County Airport	HQU	Thomson	0101000020E6100000FF99FF5F0EA154C020C0F93FCDC34040	United States
8515	Aiken Municipal Airport	AIK	Aiken	0101000020E6100000B7010000D76B54C0FDF9FF7F1FD34040	United States
8516	Woodward Field	CDN	Camden	0101000020E61000003B060060272454C069F7FFFF4C244140	United States
8517	Lumberton Regional Airport	LBT	Lumberton	0101000020E61000006AFAFF3FCDC353C08BF3FF3F114E4140	United States
8519	Moore County Airport	SOP	Southern Pines	0101000020E61000005A12FB5F09D953C0CD68F51F639E4140	United States
8520	Richmond County Airport	RCZ	Rockingham	0101000020E6100000D906EE409DF053C060764F1E16724140	United States
8524	Baraboo Wisconsin Dells Airport	DLL	Baraboo	0101000020E6100000F18503004B7156C095A3F8DFE7C24540	United States
8526	Statesville Regional Airport	SVH	Statesville	0101000020E6100000F3FFFFBF0C3D54C0C5FFFF5FF5E14140	United States
8528	Burlington Municipal Airport	BUU	South Burlington	0101000020E6100000000000A07E1356C0000000E068584540	United States
8532	William T. Piper Memorial Airport	LHV	Lock Haven	0101000020E6100000BE310400075B53C0420DF85F5B914440	United States
8538	Zelienople Municipal Airport	\\N	Fernway	0101000020E61000006A3503E0480A54C0523000E09A664440	United States
8542	Lorain County Regional Airport	LPR	Elyria	0101000020E61000006E6704C05D8B54C0AFB7070012AC4440	United States
8544	Burke Lakefront Airport	BKL	Fairview Park	0101000020E610000000000020BB6B54C0000000803DC24440	United States
8545	Chautauqua County-Dunkirk Airport	DKK	Dunkirk	0101000020E6100000BCE3FB7F68D153C0888FFC7F243F4540	United States
8548	South Jersey Regional Airport	VAY	Mount Laurel	0101000020E61000000000000020B652C089F0FFFFB0F84340	United States
8550	Linden Airport	LDJ	Linden	0101000020E6100000BB070080A78F52C03BE6FFFF064F4440	United States
8553	Tri State Steuben County Airport	ANQ	Angola	0101000020E610000074452921584555C0C89750C1E1D14440	United States
8555	Warsaw Municipal Airport	\\N	Warsaw	0101000020E610000000000040C47555C00000006029A34440	United States
8556	Van Wert County Airport	VNW	Van Wert	0101000020E610000000000060002755C000000080AE6E4440	United States
8560	Genesee County Airport	GVQ	Batavia	0101000020E6100000B3010100BA8A53C081D0F6BF0E844540	United States
8565	Clearwater Air Park	CLW	Clearwater	0101000020E6100000730900808EB054C048FEFFFF08FA3B40	United States
8593	Chicago Meigs Airport	CGX	Chicago	0101000020E6100000000000E0E7E655C000000020EDED4440	United States
8601	Pickens County Airport	JZP	Canton	0101000020E610000000000000461D55C000000000093A4140	United States
8603	Saarmund Airport	\\N	Michendorf	0101000020E6100000000000207C332A400000008077274A40	Germany
8604	Grand Strand Airport	CRE	North Myrtle Beach	0101000020E6100000A4FDFF5F54AE53C02C0E00C0E5E74040	United States
8606	Lansing Municipal Airport	IGQ	Waverly	0101000020E610000000000060E3E155C0000000A077C44440	United States
8608	Ramona Airport	RNM	Ramona	0101000020E6100000000000608F3A5DC00000008004854040	United States
8609	Pont Sur Yonne Airfield	\\N	Sens	0101000020E6100000A1496249B9FB09409F758D9603254840	France
8610	St Florentin Cheu Airfield	\\N	Saint-Florentin	0101000020E610000026AB22DC64340E40E1EEACDD76FD4740	France
8611	Saulieu Liernais Airfield	\\N	Semur-en-Auxois	0101000020E6100000C72E51BD35101140F9D85DA0A49E4740	France
8612	Olten Airport	\\N	Olten	0101000020E610000000000060C98E1F400000004015AC4740	Switzerland
8613	Buochs Airport	BXO	Buochs	0101000020E6100000D5AF743E3CCB204047E4BB94BA7C4740	Switzerland
8614	Ambri Airport	\\N	Biasca	0101000020E6100000A9DE1AD82A6121406A15FDA199414740	Switzerland
8615	Lodrino Air Base	\\N	Biasca	0101000020E610000000000080F8FB214000000000E0254740	Switzerland
8616	Roudnice Airport	\\N	Roudnice nad Labem	0101000020E61000004F401361C3732C40A583F57F8E344940	Czechia
8617	Usti Nad Labem Airfield	\\N	Ústí nad Labem	0101000020E6100000C6DCB5847CF02B409F05A1BC8F594940	Czechia
8618	Mauterndorf Airport	\\N	Tamsweg	0101000020E610000000000020D0642B40000000C0F5904740	Austria
8619	Nötsch Im Gailtal Airport	\\N	Arnoldstein	0101000020E61000000000008026422B4000000080614A4740	Austria
8620	Karlsruhe-Forchheim Airport	\\N	Karlsruhe	0101000020E6100000B29DEFA7C6AB2040F5B9DA8AFD7D4840	Germany
8621	Weinheim/Bergstraße Airport	\\N	Weinheim	0101000020E6100000000000C09A382140000000E0A3C84840	Germany
8622	Meaux Esbly Airport	\\N	Meaux	0101000020E610000000000040A7AE064000000020C2764840	France
8623	Château-Thierry - Belleau Airport	\\N	Château-Thierry	0101000020E61000000000006003DB0A40000000009A884840	France
8624	Branch County Memorial Airport	OEB	Coldwater	0101000020E61000006E6704C05D4355C0680EFF9F79F74440	United States
8625	Wilkes Barre Wyoming Valley Airport	WBW	Wilkes-Barre	0101000020E61000004F0A00007AF652C0D31100A00AA64440	United States
8626	Willoughby Lost Nation Municipal Airport	LNN	Willoughby	0101000020E6100000860A00E0F05854C06AFAFF3F8DD74440	United States
8627	Taoyuan Air Base	\\N	Taoyuan City	0101000020E610000000000000A24F5E40000000607D0E3940	Taiwan
8631	Capital City Airport	FFT	Frankfort	0101000020E610000010E0FC9FE63955C0D7F3FB1F5C174340	United States
8632	Auburn Lewiston Municipal Airport	LEW	Lewiston Orchards	0101000020E6100000A70300E0249251C0ACECFF3F35064640	United States
8633	Inowroclaw Military Air Base	\\N	Inowrocław	0101000020E610000015E4FF3FA25432404D0700C0296A4A40	Poland
8634	Pruszcz Gdanski Air Base	\\N	Pruszcz Gdański	0101000020E61000005DFE43FAEDAB32400A302C7FBE1F4B40	Poland
8639	Bloyer Field	\\N	Tomah	0101000020E6100000016600A0F19E56C06826F7BFCCFC4540	United States
8641	Marco Island Airport	MRK	Marco	0101000020E6100000500D00400A6B54C047DBFF5FB8FE3940	United States
8646	Gladwin Zettel Memorial Airport	GDW	Midland	0101000020E610000035FAFF5F661E55C0630E00A03CFC4540	United States
8648	South Haven Area Regional Airport	LWA	South Haven	0101000020E6100000000000605D9055C000000020F42C4540	United States
8653	Marshfield Municipal Airport	MFI	Hanover	0101000020E61000006DFDFF7F1D8C56C02E11000086514640	United States
8654	Alexander Field South Wood County Airport	ISW	Wisconsin Rapids	0101000020E610000012FEFF1FB27556C0F4EAFF3F1E2E4640	United States
8655	Clinton Municipal Airport	CWI	Clinton	0101000020E610000000000000109556C00A12008061EA4440	United States
8658	Beverly Municipal Airport	BVY	Beverly	0101000020E61000003D0C00E0A7BA51C0BBE7FF1FC74A4540	United States
8660	Nagaur Airport	\\N	Nāgaur	0101000020E6100000000000A0876D52400000002053353B40	India
8661	Ostafyevo International Airport	\\N	Moscow	0101000020E6100000000000E0EBC04240000000607FC14B40	Russia
8663	Trois-Rivières Airport	YRQ	Sainte-Catherine	0101000020E6100000000000407B2B52C000000080282D4740	Canada
8664	Poplar Bluff Municipal Airport	POF	Poplar Bluff	0101000020E6100000ECFFFF1FCB9456C0ECFFFF1F0F634240	United States
8665	Somerset Airport	\\N	Bridgewater	0101000020E610000000000080E4AA52C0000000C020504440	United States
8667	Keokuk Municipal Airport	EOK	Keokuk	0101000020E6100000E30C00806CDB56C0F2E7FFFFDD3A4440	United States
8669	Perth/Scone Airport	PSL	Perth	0101000020E6100000000000804EFA0AC0000000C037384C40	United Kingdom
8670	Caernarfon Airport	\\N	Caernarfon	0101000020E6100000B4B88F74B75911C0D809676B088D4A40	United Kingdom
8671	Grefrath-Niershorst Airport	\\N	Grefrath	0101000020E61000000000002012701940000000E0BCAA4940	Germany
8681	St Paul Downtown Holman Field	STP	Saint Paul	0101000020E610000000000000D74357C0000000C09D774640	United States
8682	Söderhamn Airport	SOO	Söderhamn	0101000020E6100000000000A05E193140000000E078A14E40	Sweden
8683	Newcastle Aerodrome	\\N	Newcastle West	0101000020E6100000000000E05D2E18C0000000C019894A40	Ireland
8684	Saravane Airport	VNA	Salavan	0101000020E61000004D5600E4489A5A40B024A79D3B6B2F40	Laos
8689	Segeletz Airport	\\N	Wusterhausen	0101000020E6100000000000A07915294000000040D0694A40	Germany
8690	Fuentemilanos Airport	\\N	Segovia	0101000020E61000009CEAFF3F33F310C0F2E7FFFFBD714440	Spain
8691	Akeno Airport	\\N	Ise	0101000020E610000000000000811561400000002043444140	Japan
8693	Oconomowoc Airport	\\N	Oconomowoc	0101000020E6100000000000203A1E56C000000080C7914540	United States
8698	Bantry Aerodrome	BYT	Derry	0101000020E610000000000020E5F722C0000000A094D54940	Ireland
8700	Aliwal North Airport	\\N	Aliwal North	0101000020E610000000000040E1BA3A400000008014AE3EC0	South Africa
8701	Alkantpan Copper Airport	\\N	Prieska	0101000020E61000000000004013513640000000E009E83DC0	South Africa
8703	Barberton Airport	\\N	Barberton	0101000020E61000009AB67F65A5F93E4027840EBA84B739C0	South Africa
8706	Butler Co Regional Airport - Hogan Field	\\N	Fairfield	0101000020E610000045F8FF7F682155C089F0FFFF90AE4340	United States
8707	Bungoma Airport	\\N	Bungoma	0101000020E610000000000080D7464140000000C04B70E23F	Kenya
8708	Bura East Airport	\\N	Hola	0101000020E6100000000000A099F94340000000A09999F1BF	Kenya
8709	Busia Airport	\\N	Busia	0101000020E610000000000000AD10414000000080E140DD3F	Kenya
8710	Embu Airport	\\N	Embu	0101000020E6100000F2CD3637A6BF4240B8E4B8533A58E2BF	Kenya
8712	Garissa Airport	GAS	Garissa	0101000020E610000000000080FBD24340000000801DAADDBF	Kenya
8713	Hola Airport	HOA	Hola	0101000020E61000000000002083004440000000A01C5AF8BF	Kenya
8714	Homa Bay Airport	\\N	Homa Bay	0101000020E6100000000000A0C63B4140000000403333E3BF	Kenya
8715	Isiolo Airport	\\N	Isiolo	0101000020E6100000000000A0BCCB4240000000C097A4D53F	Kenya
8717	Kericho Airport	KEY	Kericho	0101000020E61000000000000000A04140000000C020B0DABF	Kenya
8721	Antsirabe Airport	ATJ	Antsirabe	0101000020E61000003FEFFFBF2788474036021538D7D633C0	Madagascar
8722	Bekily Airport	OVA	Beteza	0101000020E6100000D7F7FFBFFAA646407546CF7D563C38C0	Madagascar
8723	Ust-Tsylma Airport	\\N	Ust-Tsilma	0101000020E6100000A40000A0A4194A40E7F2FF9FFC5B5040	Russia
8740	Gorno-Altaysk Airport	RGK	Gorno-Altaysk	0101000020E6100000260200C054755540651100E0BCFB4940	Russia
8742	Fond du Lac County Airport	FLD	Fond du Lac	0101000020E610000091FCFFFF411F56C035FDFF9FB6E24540	United States
8743	Waupaca Municipal Airport	PCZ	Waupaca	0101000020E61000007E470160444156C0D300F79FA92A4640	United States
8744	Stevens Point Municipal Airport	STE	Stevens Point	0101000020E61000001D000060F06156C0C9FFFF1FC9454640	United States
8750	Peenemünde Airport	PEF	Wolgast	0101000020E61000009FF7FFDF838C2B4011FEFF1F32144B40	Germany
8751	Góraszka Airport	\\N	Józefów	0101000020E6100000000000E0F6473540000000C09B174A40	Poland
8752	Nusawiru Airport	\\N	Sidareja	0101000020E6100000000000205C1F5B40000000E0ADE11EC0	Indonesia
8759	Galion Municipal Airport	GQQ	Galion	0101000020E6100000950500C052AE54C0F91300606F604440	United States
8762	Rio Amazonas Airport	PTZ	Puyo	0101000020E6100000990B0040038453C0B6E5FF7F7615F8BF	Ecuador
8763	Clarksville–Montgomery County Regional Airport	CKV	Oak Grove	0101000020E61000007CF8FF5F8FDA55C054F3FF5F9A4F4240	United States
8771	Lompoc Airport	LPC	Lompoc	0101000020E6100000A9A3FFBFF31D5EC01301006032554140	United States
8772	Chester County G O Carlson Airport	CTH	Coatesville	0101000020E61000001AE9FB5F64F752C060AAFCDF4FFD4340	United States
8773	Bost Airport	BST	Lashkar Gāh	0101000020E6100000000000205C17504000000080488F3F40	Afghanistan
8774	Lankaran International Airport	LLK	Lankaran	0101000020E61000009F170040B46848404E0A00008A5F4340	Azerbaijan
8775	Gabala International Airport	GBB	Geoktschai	0101000020E61000003333333333DB47405AD76839D0694440	Azerbaijan
8776	Zaqatala International Airport	ZTU	Zaqatala	0101000020E61000002A1A6B7F67554740BD8BF7E3F6C74440	Azerbaijan
8777	Lake Placid Airport	LKP	North Elba	0101000020E6100000FFFCFFBF8F7D52C059FCFF1FDB214640	United States
8780	Magan Airport	\\N	Yakutsk	0101000020E6100000D7DCD1FF7231604063D4B5F63E0D4F40	Russia
8782	Cooma Hospital Helipad	DEE	Yuzhno-Kurilsk	0101000020E610000085950A2A2AA462400CC85EEFFE1E42C0	Russia
8784	Lima Allen County Airport	AOH	Lima	0101000020E610000020ED7F80B50155C00EBDC5C37B5A4440	United States
8785	Sondok Airport	DSO	Hamhŭng	0101000020E61000008DD5E6FF55DE5F4027F911BF62DF4340	North Korea
8789	Malcolm McKinnon Airport	SSI	Country Club Estates	0101000020E6100000F18503000B5954C042BA1260DC263F40	United States
8790	Beaver County Airport	BFP	Beaver Falls	0101000020E610000068F4FFBF0C1954C0080F0040E1624440	United States
8792	Georgetown County Airport	GGE	Maysville	0101000020E6100000A3FDFF5F74D453C02C0E00C0E5A74040	United States
8793	Hardwick Field	HDI	Fairview Park	0101000020E610000000000000463555C0000000402C9C4140	United States
8796	Renton Municipal Airport	RNT	Renton	0101000020E610000097080000D38D5EC072E6FFDF1DBF4740	United States
8798	Brackett Field	POC	La Verne	0101000020E6100000E2FEFF3F0C725DC0E6FFFF7FB90B4140	United States
8801	Cross City Airport	CTY	Corinth	0101000020E610000028050000B5C654C004E6FF1FB0A23D40	United States
8802	Oconee County Regional Airport	CEU	Clemson	0101000020E6100000179F0260BCB854C03BD0F9DF00564140	United States
8804	Beech Factory Airport	BEC	Wichita	0101000020E610000095020080C24D58C0A9090060E5D84240	United States
8807	Tabing Airport	PDG	Padang	0101000020E6100000C879FF1F87165940F80900E0E8FFEBBF	Indonesia
8808	Tom B. David Field	\\N	Calhoun	0101000020E6100000FBA6FADF1B3C55C039EC00804A3A4140	United States
8809	Habersham County Airport	\\N	Toccoa	0101000020E61000000DD5FFFFA0E354C0619204C0FC3F4140	United States
8811	Georgetown Municipal Airport	GTU	Maysville	0101000020E6100000000000407B6B58C0000000E0C5AD3E40	United States
8812	Old Rhinebeck Airport	\\N	Kingston	0101000020E6100000D7B4FFBF397752C0840607205AFC4440	United States
8813	Duxford Airport	QFO	Sawston	0101000020E6100000200300808AE3C03F7CF8FF5F9F0B4A40	United Kingdom
8815	Sidney Municipal-Lloyd W Carr Field	SNY	Sidney	0101000020E610000096E2F43F0ABF59C03AD40860F78C4440	United States
8820	Great Keppel Is Airport	GKL	Yeppoon	0101000020E6100000231F00E024DE624067F4FFBFEC2E37C0	Australia
8823	Innisfail Airport	IFL	Innisfail	0101000020E61000000000004062406240000000E0348F31C0	Australia
8824	Kalaeloa Airport	\\N	Kapolei	0101000020E61000009FAD83833DC263C058CA32C4B14E3540	United States
8825	Bamiyan Airport	BIN	Bāmyān	0101000020E6100000000000C049F450400000008093684140	Afghanistan
8834	Madison County Executive Airport-Tom Sharp Jr Field	\\N	Madison	0101000020E610000086AB0320AEA355C09DE0F65F426E4140	United States
8835	Leesburg Executive Airport	JYO	Leesburg	0101000020E610000000000020AE6353C0000000E0FB894340	United States
8838	Anoka County-Blaine Arpt(Janes Field) Airport	\\N	Anoka	0101000020E61000001DB5FC9F874D57C06FCD04608F924640	United States
8845	Lingling Airport	LLF	Lengshuitan	0101000020E6100000D789CBF10AE75B403F6EBF7CB2563A40	China
8850	Williamson Sodus Airport	SDC	Williamson	0101000020E61000009FEF0280BE4753C0A79201A00A9E4540	United States
8853	Fairoaks Airport	\\N	Woking	0101000020E61000000A0F00206BE2E1BF730900808EAC4940	United Kingdom
8854	Boulder Municipal Airport	WBU	Boulder	0101000020E6100000B03500C0764E5AC0551600000B054440	United States
8855	Neustadt-Glewe Airport	\\N	Neustadt-Glewe	0101000020E6100000000000C0053B2740000000600BAE4A40	Germany
8859	Goetsenhoven Air Base	\\N	Tienen	0101000020E610000000000040C4D41340000000C00E644940	Belgium
8860	Tutow Airport	\\N	Demmin	0101000020E61000000000004012702A400000004002F64A40	Germany
8861	Bremgarten Airport	\\N	Heitersheim	0101000020E6100000D7F7FFBF9A781E40710600408EF34740	Germany
8862	Bitburg Airport	BBJ	Bitburg	0101000020E6100000C3F5285C8F421A406CD097DEFEF84840	Germany
8864	Palo Alto Airport of Santa Clara County	PAO	Palo Alto	0101000020E61000005A3F00205C875EC0AA09006005BB4240	United States
8866	Ust-Nera Airport	\\N	Ust-Nera	0101000020E610000071FFFF1FAEE361400D00004033235040	Russia
8867	Letiště Vysoké Mýto	\\N	Vysoké Mýto	0101000020E6100000699082A7902F3040F9D85DA0A4F64840	Czechia
8868	Spa (la Sauvenière) Airport	\\N	Spa	0101000020E6100000000000A025A4174000000080C23D4940	Belgium
8869	Falcon Field	FFZ	Mesa	0101000020E6100000C1D0FF7F97EE5BC0DC000080FBBA4040	United States
8870	Coolidge Municipal Airport	P08	Coolidge	0101000020E61000000000000054DB5BC0000000A0CB774040	United States
8871	Cottonwood Airport	P52	Cottonwood	0101000020E6100000EFE1FF7F3D025CC007ECFF9F705D4140	United States
8872	Suarlée Airport	\\N	Namur	0101000020E610000016F6B4C35F13134088BD50C0763E4940	Belgium
8873	Kiewit Airfield Hasselt	\\N	Hasselt	0101000020E6100000C7D79E59128015402D0B26FE287C4940	Belgium
8874	Ak-Chin Regional Airport	A39	Phoenix	0101000020E6100000E15DD328C9FA5BC0CA58C8B7D27E4040	United States
8875	Wickenburg Municipal Airport	E25	Wickenburg	0101000020E6100000B9D8FEDF22335CC06F24F9DF04FC4040	United States
8876	Yangzhou Taizhou Airport	YTY	Yangzhou	0101000020E61000004BEA043411EE5D408048BF7D1D484040	China
8877	Oakland County International Airport	PTK	Waterford	0101000020E6100000F1FFFFDFE2DA54C0ECFFFF1F2F554540	United States
8880	Kissidougou Airport	KSI	Kissidougou	0101000020E61000000B000060B13F24C0EAFFFFDF34522240	Guinea
8888	Dillant Hopkins Airport	EEN	Swanzey	0101000020E6100000000000C0541152C0000000C0FE724540	United States
8890	Kawama Airport	\\N	Varadero	0101000020E6100000EBFBFF5F4D5354C0F6EDFF7FBE1F3740	Cuba
8892	Kooddoo Airport	GKK	Viligili	0101000020E6100000EBE2361AC05B52408FE4F21FD26FE73F	Maldives
8894	Rochester Airport	RCS	Rochester	0101000020E6100000000000C04D1BE03F000000000BAD4940	United Kingdom
9182	Crystal River Airport	CGC	Homosassa Springs	0101000020E61000000000002090A454C00000006007DE3C40	United States
8914	Termas de Río Hondo international Airport	RHD	Termas de Río Hondo	0101000020E61000003D2CD49AE63B50C09031772D217F3BC0	Argentina
8918	Keetmanshoop Airport	KMP	Keetmanshoop	0101000020E6100000000000C0841C324000000060308A3AC0	Namibia
8925	Iowa City Municipal Airport	IOW	Iowa City	0101000020E6100000CE0800E0F9E256C08CF3FF3FD1D14440	United States
8926	Turpan Jiaohe Airport	TLQ	Turpan	0101000020E61000005F07CE1951465640C05B2041F1834540	China
8927	Lorenzo Airport	\\N	Valença	0101000020E6100000000000E07A7443C00000004065C72AC0	Brazil
8931	Longview Ranch Airport	\\N	Longview	0101000020E610000000000060BAE95DC0000000A0B2544640	United States
8933	Sortavala Airport	\\N	Sortavala	0101000020E61000000000000071AC3E400000008038DE4E40	Russia
8935	Lee Airport	ANP	Annapolis	0101000020E6100000284701A2602453C09FAA4203B1784340	United States
8943	Cuamba Airport	FXO	Cuamba	0101000020E6100000D3F4D901D7434240E17A14AE47A12DC0	Mozambique
8944	Bodaybo Airport	ODO	Bodaybo	0101000020E6100000643100408D8F5C40610B0060DCEE4C40	Russia
8946	Zhytomyr Airport	ZTR	Zhytomyr	0101000020E61000004277499C15BD3C4048DE3994A1224940	Ukraine
8948	Paluknys Airport	\\N	Trakai	0101000020E610000000000080C4FC3840000000800F3E4B40	Lithuania
8949	Mattala Rajapaksa International Airport	HRI	Tangalla	0101000020E6100000252191B6F1475440392A37514B231940	Sri Lanka
8950	Pecos Municipal Airport	PEQ	Pecos	0101000020E6100000E2FEFF3FB4E059C0A8FFFFFFE4613F40	United States
8951	Hattiesburg Bobby L Chain Municipal Airport	HBG	Hattiesburg	0101000020E6100000AA5E02E02D5056C0DA6808E0C9433F40	United States
8952	Botucatu - Tancredo de Almeida Neves Airport	QCJ	Botucatu	0101000020E61000002E000060E73B48C03300002083F036C0	Brazil
8953	Base Aérea Airport	\\N	Anápolis	0101000020E610000092CCEA1D6E7B48C0423EE8D9AC3A30C0	Brazil
8954	São Carlos Airport	QSC	São Carlos	0101000020E610000000000080ACF347C0000000401AE035C0	Brazil
8958	Chan Gurney Municipal Airport	YKN	Yankton	0101000020E6100000F5FFFF9FB25858C04000006056754540	United States
8961	Sir Bani Yas Airport	XSB	Ar Ruways	0101000020E61000004D4BAC8C464A4A402EC901BB9A483840	United Arab Emirates
8963	Bromont (Roland Desourdy) Airport	ZBM	Bromont	0101000020E6100000170A0020732F52C0441800E038A54640	Canada
8965	Beccles Airport	\\N	Beccles	0101000020E610000073EDFFFFADE4F93F3D0C00E0B7374A40	United Kingdom
8966	Kratie Airport	KTI	Kratié	0101000020E61000000000002085835A4000000020DBF92840	Cambodia
8969	Copacabana Airport	\\N	San Pedro	0101000020E6100000000000401E4651C0000000E0EB3030C0	Bolivia
8972	RAF Brawdy	\\N	Haverfordwest	0101000020E61000002BBEA1F0D97A14C085EB51B81EF14940	United Kingdom
8975	Redhill Aerodrome	KRH	Redhill	0101000020E61000001D43006001BEC1BFB9040040579B4940	United Kingdom
8982	Hayward Executive Airport	HWD	Hayward	0101000020E6100000F50D00E0CE875EC0840700A060D44240	United States
8983	Motueka Airport	MZP	Port Motueka	0101000020E6100000000000E0A59F654000000040C88F44C0	New Zealand
8984	Shute Harbour Airport	JHQ	Red Hill	0101000020E61000007EC9C6832D986240B1C398F4F74634C0	Australia
8989	Ann Arbor Municipal Airport	ARB	Ann Arbor	0101000020E61000003D0C00E0B7EF54C0571900408B1C4540	United States
8994	Shepparton Airport	SHT	Shepparton	0101000020E610000000000080932C624000000040E63642C0	Australia
9008	Reichenbach Air Base	\\N	Frutigen	0101000020E6100000000000000CB61E40000000808A4E4740	Switzerland
9025	Bijie Feixiong Airport	BFJ	Bijie	0101000020E61000008BE255D6365E5A40A0DFF76F5E443B40	China
9026	Lensk Airport	ULK	Lensk	0101000020E610000067140020DDB45C40630E00A03C5C4E40	Russia
9042	Kavalerovo Airport	\\N	Kavalerovo	0101000020E6100000B0726891EDE06040DE718A8EE4224640	Russia
9044	Şanlıurfa GAP Airport	GNY	Şanlıurfa	0101000020E6100000000000C0A2724340000000800BB94240	Turkey
9045	Zafer Airport	KZR	Kütahya	0101000020E6100000C05C8B16A01D3E40DAAB8F87BE8D4340	Turkey
9048	Velikiye Luki Airport	VLU	Velikiye Luki	0101000020E610000000000080AC9B3E40000000E0C7304C40	Russia
9054	Yeltsovka Airport	\\N	Novosibirsk	0101000020E6100000000000C049C05440000000C0D38B4B40	Russia
9062	Kodinsk Airport	\\N	Kodinsk	0101000020E61000000000008002C65840000000005D3D4D40	Russia
9065	Lake Macquarie Airport	BEO	Newcastle	0101000020E6100000179F0260BCF46240545227A0898840C0	Australia
9066	Atlanta South Regional Airport/Tara Field	4A7	Poquoson	0101000020E6100000771211FE451555C002F4FBFECDB14040	United States
9068	Brampton Island Airport	BMP	Mackay	0101000020E6100000000000E0A3A8624000000020A5CD34C0	Australia
9075	Endelave West Airport	\\N	Odder	0101000020E61000005BFFFF5F3B7F2440AAE9FFFFD4E04B40	Denmark
9076	St. Johann In Tirol Airport	\\N	Kitzbühel	0101000020E6100000BC0512143FE62840265305A392C24740	Austria
9079	Thalmässing-Waizenhofen Airport	\\N	Thalmässing	0101000020E6100000000000E0176B2640000000A036884840	Germany
9088	Cochrane Airport	YCN	Cochrane	0101000020E6100000000000E0DE4054C000000040848D4840	Canada
9089	Estadual Arthur Siqueira Airport	BJP	Bragança Paulista	0101000020E610000050ABE80FCD4447C0677C5F5CAAFA36C0	Brazil
9090	Busselton Regional Airport	BQB	Busselton	0101000020E6100000A9A3FFBFB3D95C40F4EAFF3F1ED840C0	Australia
9093	Comarapa Airport	\\N	Salt Lake City	0101000020E6100000000000A0232150C0000000C0E1E931C0	United States
9095	Inverell Airport	IVR	Inverell	0101000020E610000063CBFF9F9BE46240BFEDFF9F67E33DC0	Australia
9096	Glen Innes Airport	GLI	Glen Innes	0101000020E6100000000000400CF66240000000C0CCAC3DC0	Australia
9100	Ansbach-Petersdorf Airport	\\N	Ansbach	0101000020E6100000C1012D5DC1562540E99C9FE238AE4840	Germany
9102	Immokalee Regional Airport	IMM	Immokalee	0101000020E6100000E5B00300AA5954C055661040E66E3A40	United States
9104	Rancho San Simeon Airport	\\N	Cambria	0101000020E6100000000000400A475EC000000020C9CD4140	United States
9107	Yichun Mingyueshan Airport	YIC	Yichun	0101000020E61000004182E2C798935C403D0AD7A370CD3B40	China
9120	Dinwiddie County Airport	PTB	Petersburg	0101000020E6100000EAFFFF3F796053C0D0FFFFBF86974240	United States
9125	Klatovy Airport	\\N	Klatovy	0101000020E610000000000020D0A42A40000000E08AB54840	Czechia
9126	Sheboygan County Memorial Airport	SBM	Sheboygan	0101000020E6100000C015FD5F7DF655C02E3AF63F82E24540	United States
9136	Herning Airport	\\N	Herning	0101000020E610000000000020C216224000000040A4174C40	Denmark
9137	Oberschleißheim Airfield	\\N	Oberschleißheim	0101000020E6100000F9D0FF5F6E1F2740AF120020A61E4840	Germany
9138	Pinal Airpark	MZJ	Marana	0101000020E6100000E6550000FED45BC05BFFFF5F5B414040	United States
9139	Glendale Municipal Airport	GEU	Litchfield Park	0101000020E610000000000040E1125CC00000008071C34040	United States
9140	Safford Regional Airport	SAD	Safford	0101000020E61000000B19D9DFA3685BC0535704206A6D4040	United States
9141	Verden-Scharnhorst Airport	\\N	Verden	0101000020E610000000000040C8902240000000408E7B4A40	Germany
9147	Nittenau-Bruck Airport	\\N	Nittenau	0101000020E6100000000000C0E4972840000000E07A9C4840	Germany
9148	Kerama Airport	KJP	Itoman	0101000020E6100000F7730080C0D25F40A82900C0152B3A40	Japan
9149	Americana Airport	\\N	Americana	0101000020E6100000000000C07BA247C0000000207CC136C0	Brazil
9156	Ekibastuz Airport	\\N	Ekibastuz	0101000020E610000000000080C2CD5240000000E0A5CB4940	Kazakhstan
9162	Adamovka	\\N	Adamovka	0101000020E61000008236397CD2F74D400000000000C04940	Russia
9164	Sikeston Memorial Municipal Airport	SIK	Sikeston	0101000020E6100000F7FFFF7FF46356C0ECFFFF1F0F734240	United States
9178	Floyd Bennett Memorial Airport	GFL	Queensbury	0101000020E61000007AF5FF1F0F6752C066F1FF7FACAB4540	United States
9179	Saratoga County Airport	5B2	Ballston Spa	0101000020E6100000DC0D05E01D7752C03F84020091864540	United States
9183	Martin State Airport	MTN	Baltimore	0101000020E6100000F05EFFBF7B1A53C0238CFA7FB0A94340	United States
9184	Lincoln Regional Karl Harder Field	LHM	Lincoln	0101000020E6100000000000C076565EC0000000A060744340	United States
9185	Fostoria Metropolitan Airport	FZI	Fostoria	0101000020E61000004866FD7F3FD954C0A544F91F6C984440	United States
9186	Eastern Slopes Regional Airport	IZG	Moultonborough	0101000020E610000054F3FF5FAABC51C0610B0060DCFE4540	United States
9187	Coral Creek Airport	\\N	Rotonda	0101000020E6100000000000A0139054C000000080C0DA3A40	United States
9188	Lakefront Airport	NEW	New Orleans	0101000020E6100000E3FFFF9FCF8156C089FFFFBFDA0A3E40	United States
9189	Coeur D'Alene - Pappy Boyington Field	COE	Coeur d'Alene	0101000020E6100000B58E05E07A345DC0459AFC3F1CE34740	United States
9190	Beaumont Municipal Airport	BMT	Nederland	0101000020E61000007FFBFF9FCF8D57C0481E006019123E40	United States
9191	Vermilion Regional Airport	DNV	Danville	0101000020E610000003CC004023E655C0A17C07607F194440	United States
9199	Space Coast Regional Airport	TIX	Port Saint John	0101000020E6100000FEFFFF1F263354C0020000E0C9833C40	United States
9207	Warnervale Airport	\\N	Cessnock	0101000020E6100000E50B5A48C0ED624062F9F36DC19E40C0	Australia
9218	Nyeri Airport	NYE	Nyeri	0101000020E6100000000000003F7D4240000000208F52D7BF	Kenya
9225	Andrau Airpark	AAP	Houston	0101000020E6100000B7FEFFBFA6E557C0AFF2FFBFF5B83D40	United States
9226	Flying Cloud Airport	FCM	Eden Prairie	0101000020E6100000880D0020415D57C00C1500C0E1694640	United States
9228	Johnson County Executive Airport	OJC	Olathe	0101000020E6100000A0D3FBDF34AF57C054FC00207E6C4340	United States
9229	Sigiriya Air Force Base	GIU	Dambulla	0101000020E6100000FEFCFFBF9F2E54400DEEFF3FA1D31F40	Sri Lanka
9232	Neumünster Airport	EUM	Neumünster	0101000020E6100000000000C0FDE12340000000402B0A4B40	Germany
9233	Tak Airport	TKT	Tak	0101000020E61000000000002036D058400000004060E53040	Thailand
9236	Barrie-Orillia (Lake Simcoe Regional Airport)	YLK	Barrie	0101000020E6100000FAF3FFFF8EE353C0F4EAFF3F1E3E4640	Canada
9237	Huronia Airport	YEE	Midland	0101000020E61000004A01004069FB53C034FAFF5F76574640	Canada
9238	Markham Airport	NU8	Markham	0101000020E6100000000000E0C7D053C000000040C8F74540	Canada
9240	Lindsay Airport	NF4	Peterborough	0101000020E6100000000000602BB253C000000080AE2E4640	Canada
9241	Niagara District Airport	YCM	St. Catharines	0101000020E610000000000020FDCA53C0000000A089984540	Canada
9243	Edenvale Aerodrome	\\N	Wasaga Beach	0101000020E6100000C767B27F9EFD53C0D09D60FF75384640	Canada
9244	Orillia Airport	\\N	Orillia	0101000020E6100000B5030098DAD353C0DAE5BA6CBD564640	Canada
9245	Holland Landing Airpark	\\N	Newmarket	0101000020E610000000000020AEDF53C000000080710B4640	Canada
9247	Parry Sound Area Municipal Airport	YPD	Parry Sound	0101000020E6100000B72572C119F553C0295C8FC2F5A04640	Canada
9248	Hanover / Saugeen Municipal Airport	\\N	Hanover	0101000020E61000004510E7E1044454C0D882DE1B43144640	Canada
9249	Brandywine Airport	OQN	West Chester	0101000020E6100000000000E03DE552C0000000A0BBFE4340	United States
9251	Manassas Regional Airport/Harry P. Davis Field	MNZ	Manassas	0101000020E6100000179F0260FC6053C0571FF6DF565C4340	United States
9252	Texas Gulf Coast Regional Airport	\\N	Angleton	0101000020E61000009708000093DD57C064310040CD1B3D40	United States
9253	Bubovice Airport	\\N	Beroun	0101000020E6100000000000E02F5B2C4000000020B9FC4840	Czechia
9255	Rakkestad Astorp Airport	\\N	Mysen	0101000020E6100000FDF675E09CB12640AB984A3FE1B24D40	Norway
9273	Kastamonu Airport	KFS	Kastamonu	0101000020E6100000000000C0DCE54040000000C037A84440	Turkey
9276	Elstree Airfield	\\N	Bushey	0101000020E6100000E3F6FF9F72DAD4BF8BF3FF3FF1D34940	United Kingdom
9277	Sandtoft Airfield	\\N	Stainforth	0101000020E6100000B6FEFFBF7677EBBF23FCFF3FA4C74A40	United Kingdom
9290	Torit Airport	\\N	Torit	0101000020E6100000000000C09F4A4040000000A099991140	South Sudan
9305	Shelby County Airport	2H0	Pana	0101000020E6100000D9FAFFFF1A3656C041F2FFFF87B44340	United States
9317	Vängsö Airport	\\N	Gnesta	0101000020E6100000000000A00A363140000000E0F08C4D40	Sweden
9327	Comiso Airport	CIY	Comiso	0101000020E61000009370218FE0362D40D2C8E7154F7F4240	Italy
9348	Enumclaw Airport	\\N	Enumclaw	0101000020E61000000000008068815EC0000000C00C994740	United States
9371	Markovo Airport	KVM	Markovo	0101000020E610000000000020584D654000000020B02A5040	Russia
9374	Susuman Airport	\\N	Susuman	0101000020E610000000000080B18462400000002022624F40	Russia
9377	Aldan Airport	ADH	Aldan	0101000020E6100000000000002D5A5F4000000080284D4D40	Russia
9378	Olyokminsk Airport	\\N	Olyokminsk	0101000020E6100000B395FFDF241E5E40080F0040E1324E40	Russia
9380	Pellworm Field	\\N	Bredstedt	0101000020E610000047090000295C2140C4F6FF5FA8444B40	Germany
9388	Fontaine Airport	BOR	Belfort	0101000020E6100000F5FFFFFF160B1C40160000C0EAD34740	France
9390	Fairfield County Airport	FDW	Lake Murray of Richland	0101000020E6100000000000A0F64654C00000004062284140	United States
9391	Obock Airport	OBC	Obock	0101000020E6100000000000002DA24540000000A01AEF2740	Djibouti
9392	Tadjoura Airport	TDJ	Tadjoura	0101000020E6100000000000406075454000000060E5902740	Djibouti
9393	Santa Cruz del Quiche Airport	AQB	Santa Cruz del Quiché	0101000020E610000000000060A3C956C0000000203F062E40	Guatemala
9394	Norðfjörður Airport	NOR	Egilsstaðir	0101000020E610000000000020287E2BC00000000071485040	Iceland
9395	Bursa Airport	BTZ	Bursa	0101000020E6100000000000E05A023D40000000C0DC1D4440	Turkey
9396	Skyhaven Airport	DAW	Rochester	0101000020E6100000000000A079BB51C0000000605DA44540	United States
9399	Newton City-County Airport	EWK	Newton	0101000020E61000000CF5FF5F915158C0170A002073074340	United States
9400	La Ferté Alais Airfield	\\N	Itteville	0101000020E61000008F8CD5E6FFB50240E10A28D4D33F4840	France
9402	Bairnsdale Airport	BSJ	Bairnsdale	0101000020E6100000000000002D726240000000A099F142C0	Australia
9403	Taszár Air Base	TZR	Groveport	0101000020E610000000000040E1EA31400000002051324740	United States
9406	Fort Bridger Airport	FBR	Evanston	0101000020E6100000575C00400C9A5BC04D0700C029B24440	United States
9407	Prosser Airport	S40	Prosser	0101000020E6100000DE4724C09FF25DC09B7AF6BF501B4740	United States
9408	Chehalis Centralia Airport	CLS	Chehalis	0101000020E61000004C040080E9BE5EC0C0F0FFDFA7564740	United States
9409	Desert Aire Airport	M94	Terrace Heights	0101000020E6100000000000A0F1FA5DC0000000C0FC574740	United States
9411	Evanston-Uinta County Airport-Burns Field	EVW	Evanston	0101000020E61000004CAF28803DC25BC0259B06A02CA34440	United States
9413	Mt Pleasant Regional-Faison field	LRO	Mount Pleasant	0101000020E6100000C0D600001BF253C0C38A0920EB724040	United States
9414	Souther Field	\\N	Americus	0101000020E61000008C820100170C55C0ADEB06C02E0E4040	United States
9415	Weedon Field	EUF	Eufaula	0101000020E61000007FFEFFDF3F4855C0BE2D006088F33F40	United States
9416	Saluda County Airport	6J4	Batesburg-Leesville	0101000020E6100000000000C0DA7254C000000060A1F64040	United States
9417	Dare County Regional Airport	MEO	Kill Devil Hills	0101000020E610000031C7FA1F83EC52C0A1BB03C0A1F54140	United States
9418	Auburn Opelika Robert G. Pitts Airport	AUO	Auburn	0101000020E6100000743E02A0C65B55C082B8FE9FBB4E4040	United States
9419	Tri Cities Airport	CZG	Endicott	0101000020E610000014AFB2B6290653C065E256410C0A4540	United States
9428	Bessemer Airport	EKY	Bessemer	0101000020E61000001AAAFFFF41BB55C0B219F91F0DA84040	United States
9429	Colorado Springs East Airport	A50	Ellicott City	0101000020E6100000000000803D1A5AC000000060EC6F4340	United States
9447	Crystal Airport	MIC	Crystal	0101000020E610000000000040A65657C0000000A0EF874640	United States
9448	Clarke County Airport	23M	Meridian	0101000020E6100000D00B00204A2F56C0F3E7FFFFDD0A4040	United States
9450	W H 'Bud' Barron Airport	DBN	Dublin	0101000020E6100000938003200FBF54C0C2A201403E484040	United States
9475	Kabale Airport	\\N	Kabale	0101000020E6100000F6285C8FC2F53D40F2406491269EF3BF	Uganda
9484	Central Bolívar Airport	\\N	Sevilla	0101000020E6100000000000C0BBFB51C00000006055D52140	Spain
9488	Corvallis Municipal Airport	CVO	Corvallis	0101000020E6100000E053EF5F8FD25EC0AC42FB3FA43F4640	United States
9492	Tuzla Romania Airport	\\N	Tuzla	0101000020E610000000000040159C3C4000000040FAFD4540	Romania
9500	El Almendro Airport	\\N	Scranton	0101000020E610000000000000C6F251C000000080F3FA41C0	United States
9511	San Agustin Airport	\\N	Florham Park	0101000020E610000000000080883855C00000002022222440	United States
9528	Fazenda Campo Verde Airport	\\N	Sihanoukville	0101000020E61000001BF0FF3F234249C05AAEFF1F3AAFF03F	Cambodia
9533	Cowra Airport	CWT	Chatsworth	0101000020E6100000000000A0C4946240000000201FEC40C0	United States
9543	Ogden Hinckley Airport	OGD	South Weber	0101000020E6100000A50000A0C4005CC00D00004013994440	United States
9545	Robert S Kerr Airport	RKR	Poteau	0101000020E610000000000060C3A757C0000000C0C3824140	United States
9546	Colorado Plains Regional Airport	AKO	Akron	0101000020E6100000ACECFF3F35CE59C0D2EEFFFF79164440	United States
9547	Sanderson Field	SHN	Shelton	0101000020E610000087FFFFDF78C95EC0F5FFFF9FE69D4740	United States
9739	Napakiak Airport	WNA	Bethel	0101000020E610000000000000543F64C0000000C05B584E40	United States
9744	Napaskiak Airport	PKA	Bethel	0101000020E610000052D90B60E53864C0F8DAF99FF8594E40	United States
9749	Bedwell Harbour Seaplane Base	YBW	North Saanich	0101000020E61000004C040080E9CE5EC00000000000604840	Canada
9753	Popham Airport	\\N	Basingstoke	0101000020E6100000000000C069C1F3BF000000C0D1984940	United Kingdom
9754	Causey Airport	2A5	Gibsonville	0101000020E6100000000000C086E753C0000000E0B5F44140	United States
9760	Black Point Airstrip	\\N	Black Point	0101000020E6100000E30A007A771953C03CF708B7E8163840	Bahamas
9761	Bartica A Airport	GFO	Bartica	0101000020E610000000000040AD514DC0000000C0C37F1940	Guyana
9763	Doylestown Airport	DYL	Doylestown	0101000020E61000001FF6FFBFD3C752C0FEFCFFBF9F2A4440	United States
9768	Tingo Maria Airport	TGI	Tingo María	0101000020E6100000000000C0CCFC52C0000000A0184422C0	Peru
9769	Plínio Alarcom Airport	TJL	Três Lagoas	0101000020E6100000DFFFFFDF93D749C080FFFF3F13C134C0	Brazil
9771	Cacoal Airport	OAL	Cacoal	0101000020E6100000B6847CD0B3B94EC0CBA145B6F3FD26C0	Brazil
9772	Warren Field	OCW	Washington, D.C.	0101000020E6100000DFFFFFDF2F4353C0FEFFFF1F06C94140	United States
9774	Mocopulli Airport	MHC	Castro	0101000020E6100000793E03EACD6D52C0B5F97FD5912B45C0	Chile
9776	Stillwater Regional Airport	\\N	Stillwater	0101000020E6100000210000207C4558C01F000040A2144240	United States
9777	Okmulgee Regional Airport	\\N	Okmulgee	0101000020E610000009000080B7FC57C0FCFFFF3F84D54140	United States
9778	Cushing Municipal Airport	\\N	Cushing	0101000020E6100000D5F4FF7F7A3158C034FAFF5F96F94140	United States
9779	Clinton Sherman Airport	\\N	Clinton	0101000020E610000028050000D5CC58C077EFFF9F7EAB4140	United States
9780	Strother Field	\\N	Winfield	0101000020E610000042F2FFFF674258C028E5FF9F94954240	United States
9781	Wiley Post Airport	\\N	Oklahoma City	0101000020E6100000535704206A6958C0C3E1FD9F60C44140	United States
9782	Shreveport Downtown Airport	\\N	Shreveport	0101000020E6100000F0040020AE6F57C02908004025454040	United States
9783	Stephenville Clark Regional Airport	\\N	Stephenville	0101000020E6100000E8FFFF5F5F8B58C0120000008F1B4040	United States
9784	Perry Municipal Airport	\\N	Perry	0101000020E6100000000000A0BD5158C0000000605B314240	United States
9786	Hamilton Municipal Airport	\\N	Fairfield	0101000020E6100000000000A0828958C00000006078AA3F40	United States
9787	Ada Municipal Airport	\\N	Ada	0101000020E610000036FDFF9FF62A58C0990B0040F3664140	United States
9788	Mesquite Metro Airport	\\N	Forney	0101000020E610000000000020F22158C0000000C09D5F4040	United States
9789	Denton Municipal Airport	\\N	Denton	0101000020E6100000E0060000AC4C58C086EAFF7FB0994040	United States
9790	Austin Executive Airport	\\N	Hornsby Bend	0101000020E6100000B0CA85CA3F6458C0BAE2981BC2653E40	United States
9791	Lago Vista Tx Rusty Allen Airport	\\N	Lago Vista	0101000020E6100000000000400C7E58C000000040A47F3E40	United States
9792	Brenham Municipal Airport	\\N	Brenham	0101000020E61000001E9D0480F41758C05187F45F10383E40	United States
9793	Lakeway Airpark	\\N	Lakeway	0101000020E6100000000000E0A57F58C000000020855B3E40	United States
9795	Kestrel Airpark	\\N	San Antonio	0101000020E610000000000020389B58C0000000200DD03D40	United States
9796	Elliot Lake Municipal Airport	YEL	Elliot Lake	0101000020E610000070030000EEA354C056F6FF9FFA2C4740	Canada
9798	Charleston Executive Airport	JZI	Hanahan	0101000020E6100000000000802F0054C000000020B7594040	United States
9799	Danville Regional Airport	DAN	Danville	0101000020E6100000000000A082D553C0000000C054494240	United States
9800	Brookneal/Campbell County Airport	0V4	Timberlake	0101000020E610000068F4FFBF0CC153C01BF0FF3F23924240	United States
9806	Cheraw Municipal Airport/Lynch Bellinger Field	CQW	Cheraw	0101000020E61000004866FD7F3FFD53C01590F63F405B4140	United States
9808	Wauchula Municipal Airport	\\N	Fort Meade	0101000020E6100000FEFFFF1F5A7854C084000080D0833B40	United States
9818	Lilydale Airport	\\N	Healesville	0101000020E610000000000080BE2B6240000000A089D842C0	Australia
9819	Beni Mellal Airport	BEM	Beni Mellal	0101000020E610000000000080545519C00000004033334040	Morocco
9820	Şırnak Şerafettin Elçi Airport	NKT	Cizre	0101000020E61000004850FC1873074540F46C567DAEAE4240	Turkey
9821	Suntar Airport	SUY	Suntar	0101000020E6100000DFFFFFDFA3685D40FEFFFF1FAE174F40	Russia
9824	Tazadit Airport	OUZ	Zouerate	0101000020E6100000000000609AF728C000000060A3C13640	Mauritania
9825	Asaba International Airport	\\N	Asaba	0101000020E6100000DBEBD5C4B3A21A40275B039D36D01840	Nigeria
9826	Akwa Ibom International Airport	QUO	Uyo	0101000020E6100000560E2DB29D2F20403D0AD7A3707D1340	Nigeria
9828	Kasama Airport	KAA	Kasama	0101000020E61000000000000020223F4000000040F36E24C0	Zambia
9829	Mbeya Airport	MBI	Mbeya	0101000020E6100000000000A0C6BB40400000000081D521C0	Tanzania
9830	Mpanda Airport	\\N	Mpanda	0101000020E610000002124DA088153F4013656F29E76B19C0	Tanzania
9831	Songea Airport	SGX	Songea	0101000020E6100000000000C09FCA414000000020B25D25C0	Tanzania
9832	Morogoro Airport	\\N	Morogoro	0101000020E6100000000000C098D34240000000805A301BC0	Tanzania
9844	Anshan Air Base	AOG	Anshan	0101000020E61000008CBAD6DEA7B65E40389ECF807A8D4440	China
9846	Zunyi Xinzhou Airport	ZYI	Zunyi	0101000020E6100000DC4603780BC05A40F4FDD478E9963B40	China
9847	Conway Horry County Airport	HYW	Conway	0101000020E610000056A1FD1FD2C753C07749FF3F0CEA4040	United States
9848	Lindu Airport	LDS	Yichun	0101000020E6100000273108AC9C206040DF09405B43E04740	China
9849	Anshun Huangguoshu Airport	AVA	Anshun	0101000020E610000078EF7DB1E4775A40D617D6C4B3423A40	China
9850	Sikasso Airport	KSS	Sikasso	0101000020E6100000000000C0CCCC16C0000000007FAA2640	Mali
9853	Brisbane West Wellcamp Airport	WTB	Toowoomba	0101000020E6100000CD3AE3FB62F962400F4757E9EE8E3BC0	Australia
9854	Tonghua Sanyuanpu Airport	TNH	Liuhe	0101000020E6100000FDDACF69036D5F4057525D6E7F204540	China
9857	Suzhou Guangfu Airport	SZV	Mudu	0101000020E6100000732A1900AA195E40DE9387855A433F40	China
9860	City Airport Manchester	\\N	Manchester	0101000020E610000030DFFF7F251E03C0840700A060BC4A40	United Kingdom
9861	Sleap Airport	\\N	Shrewsbury	0101000020E61000008EE4FF5F612C06C0E7150040BD6A4A40	United Kingdom
9862	Tatenhill Airfield	\\N	Burton upon Trent	0101000020E61000008A1E00A0812DFCBFC3F3FF1F48684A40	United Kingdom
9863	Full Sutton Airfield	\\N	York	0101000020E610000037110080CDABEBBF22FCFF3F84FD4A40	United Kingdom
9864	Sherburn-In-Elmet Airfield	\\N	Leeds	0101000020E6100000CF1264045478F3BF81221631ECE44A40	United Kingdom
9874	Silangit Airport	DTB	Parapat	0101000020E6100000F1BDBF417BBF584015527E52ED130240	Indonesia
9875	Lasikin Airport	SSV	Sinabang	0101000020E6100000000000A0D6145840000000E040480340	Indonesia
9886	Seunagan Airport	MEQ	Meulaboh	0101000020E610000000000060E30D58400000000000001140	Indonesia
9890	Sanggata/Sangkimah Airport	SGQ	Bontang	0101000020E6100000986E1283C0625D40575BB1BFEC9ED83F	Indonesia
9902	Warrnambool Airport	WMB	Warrnambool	0101000020E6100000000000E04DCE614000000060CC2543C0	Australia
9904	Richmond Airport	RCM	Richmond	0101000020E610000000000020AEE36140000000C0AFB334C0	Australia
9935	Kualanamu International Airport	KNO	Medan	0101000020E610000092770E65A8B85840772CB64945230D40	Indonesia
9937	Gratiot Community Airport	\\N	Kamloops	0101000020E610000043F5FF3F082C55C056F6FF9F3AA94540	Canada
9938	Asheboro Regional Airport	HBI	Asheboro	0101000020E6100000AE9003C042F953C0AC81F79FC6D34140	United States
9939	Seosan Air Base	\\N	Seosan	0101000020E6100000C976BE9F1A9F5F4057B5A4A31C5A4240	South Korea
9942	Henderson Field	\\N	Clinton	0101000020E6100000000000003B8053C000000020E45B4140	United States
9943	Emporia Greensville Regional Airport	EMV	Emporia	0101000020E610000000000040E65E53C000000060EC574240	United States
10017	El Monte Airport	EMT	El Monte	0101000020E6100000EFE1FF7F3D825DC0AA090060050B4140	United States
10057	Farah Airport	FAH	Farah	0101000020E6100000000000806C174F40000000E0F92E4040	Afghanistan
10061	Pasighat Airport	IXT	Pāsighāt	0101000020E6100000000000807AD55740000000E0EB103C40	India
10062	Kee Field	I16	Beckley	0101000020E6100000000000A0CB6354C0000000E0D9CC4240	United States
10069	Kramatorsk Airport	KRQ	Kramators’k	0101000020E6100000000000C07FD0424000000020515A4840	Ukraine
10089	Lille/Marcq-en-Baroeul Airport	\\N	Marquette-lez-Lille	0101000020E610000000000040BF9A084000000020F6574940	France
10096	Kawass Airport	\\N	Kamsar	0101000020E6100000D300000034112DC099FFFFDF4F4D2540	Guinea
10102	Stinson Municipal Airport	SSF	San Antonio	0101000020E61000001A000080269E58C07AFFFF9F45563D40	United States
10103	Sallisaw Municipal Airport	JSV	Sallisaw	0101000020E61000007B7B002061B357C0C5C5F6FF16B84140	United States
10104	Jasper County Airport-Bell Field	JAS	Canton	0101000020E6100000F05EFFBF3B8257C0E1E81140BDE23E40	United States
10105	El Dorado Springs Memorial Airport	87K	Nevada	0101000020E610000000000040F17F57C000000060A8ED4240	United States
10106	Marfa Municipal Airport	MRF	Alpine	0101000020E6100000459BE3DC26015AC00C941458005F3E40	United States
10107	Alpine Casparis Municipal Airport	E38	Alpine	0101000020E6100000B21800A0C6EB59C0513000E05A623E40	United States
10110	Bubaque Airport	BQE	Bubaque	0101000020E6100000000000C018AD2FC0000000003F982640	Guinea-Bissau
10114	Chichen Itza International Airport	CZA	Chichén-Itzá	0101000020E6100000730900808E1C56C064EEFF3F2CA43440	Mexico
10116	Bunbury Airport	BUY	Bunbury	0101000020E61000000000000054EB5C40000000206CB040C0	Australia
10117	Cable Airport	CCB	Upland	0101000020E610000043F5FF3F086C5DC0C7FCFFDF480E4140	United States
10121	Mount Sterling Montgomery County Airport	IOB	Mount Sterling	0101000020E61000006F0C01C0B1FE54C0FC4BF7DF6F074340	United States
10122	Elkhart Municipal Airport	EKI	Elkhart	0101000020E6100000A4FDFF5F348055C0ACECFF3F15DC4440	United States
10123	Nappanee Municipal Airport	C03	Nappanee	0101000020E6100000000000C0D37B55C0000000201DB94440	United States
10128	Jim Hamilton L.B. Owens Airport	CUB	Oak Grove	0101000020E61000000CF5FF5FB13F54C04EE7FF5F39FC4040	United States
10129	Grove Municipal Airport	GMJ	Grove	0101000020E6100000B917FB3F45AF57C0B46701A0AB4D4240	United States
10130	Mc Pherson Airport	MPR	McPherson	0101000020E6100000C2A201403E6C58C0B0B3F87F1B2D4340	United States
10131	Donaldson Center Airport	GYH	Greer	0101000020E6100000B8010000179854C083E4FFFF0F614140	United States
10132	Perry Houston County Airport	PXE	Perry	0101000020E6100000000000801BF154C0000000605B414040	United States
10133	Hartsville Regional Airport	HVS	Hartsville	0101000020E6100000060C0000A10754C0C31600C098334140	United States
10134	Horace Williams Airport	IGX	Chapel Hill	0101000020E61000006CAF05BD37C453C0185DDE1CAEF74140	United States
10135	San Cristobal de las Casas Airport	SZT	San Cristóbal de las Casas	0101000020E61000000F000020ED2157C009000080B7B03040	Mexico
10137	Dunnville Airport	DU9	Port Colborne	0101000020E61000000EF8FF9F21E653C023FCFF3FA46F4540	Canada
10138	Brunswick County Airport	SUT	Oak Island	0101000020E61000002FE301C0CC8453C0D11CFE3FF3F64040	United States
10139	Chesterfield County Airport	FCI	Fort Lee	0101000020E6100000CC6C04A0996153C043F5FF3F08B44240	United States
10140	Atherton Airport	\\N	Atherton	0101000020E6100000523000E07A306240F8F0FFBFFE4231C0	Australia
10142	Scarlett Martinez International Airport	\\N	Antón	0101000020E6100000090000802F0854C0E8FFFF5F73C02040	Panama
10144	Henderson Oxford Airport	HNZ	Oxford	0101000020E6100000CDEAFC5FDEA153C06A3503E0482E4240	United States
10145	Leesburg International Airport	LEE	Leesburg	0101000020E61000003E5DFEBFC17354C06DAA0FA0B6D23C40	United States
10148	Semyazino Airport	\\N	Vladimir	0101000020E6100000000000E051284440000000C037104C40	Russia
10154	Pouso Alegre Airport	PPY	Pouso Alegre	0101000020E610000000000020A5F546C000000000094A36C0	Brazil
10155	Brigadeiro Cabral Airport	DIQ	Divinópolis	0101000020E6100000C0FFFF9F796F46C0F9FFFF5F422E34C0	Brazil
10156	Yeysk Airport	\\N	Yeysk	0101000020E61000007B14AE47E11A4340D7A3703D0A574740	Russia
10157	Berdyansk Airport	ERD	Berdyans’k	0101000020E61000000000006009614240000000E051684740	Ukraine
10160	Erenhot Saiwusu International Airport	ERL	Erenhot	0101000020E61000008EE6C8CA2F065C40AE47E17A14B64540	China
10161	Shobdon Aerodrome	\\N	Leominster	0101000020E6100000971D0060830C07C07D1B0000F01E4A40	United Kingdom
10162	Chino Airport	CNO	Chino	0101000020E61000003CA1D79FC4685DC08ADD0400C3FC4040	United States
10163	Kamigoto Airport	\\N	Fukuechō	0101000020E6100000231F00E0242660406BFAFF3FAD814040	Japan
10164	Ojika Airport	\\N	Hirado	0101000020E6100000080F0040E1226040E3ECFF1F6C984040	Japan
10165	Chofu Airport	\\N	Tokyo	0101000020E610000000000060E570614000000040FAD54140	Japan
10166	Hateruma Airport	HTR	Ishigaki	0101000020E6100000A826008095F35E4025DFFF1F140F3840	Japan
10169	Madison County Airport	UYF	London	0101000020E61000008977046091DD54C04B32FEBF62F74340	United States
10171	Las Brujas Airport	BWW	Yaguajay	0101000020E6100000DE0300C06BC953C0653400800D9F3640	Cuba
10173	Digby (General Hospital) Heliport	\\N	Tremblay-en-France	0101000020E610000000000000C37050C000000060DC4E4640	France
10178	Thun Airport	\\N	Thun	0101000020E6100000CCF0FF3FF9661E408FF9FFBFD1604740	Switzerland
10185	Paso Robles Municipal Airport	PRB	Paso Robles	0101000020E61000003188FEBF20285EC06C58F89F21D64140	United States
10295	Kymi Airport	\\N	Kotka	0101000020E6100000000000C066E53A40000000A023494E40	Finland
10360	Half Moon Bay Airport	HAF	Half Moon Bay	0101000020E6100000F956006010A05EC038030020B7C14240	United States
10371	General WM J Fox Airfield	WJF	Lititz	0101000020E6100000F8302020048E5DC0B340FD5FDC5E4140	United States
10544	Guarapari Airport	GUZ	Guarapari	0101000020E610000036FDFF9FF63E44C0080C000081A534C0	Brazil
10545	Ubatuba Airport	UBT	Ubatuba	0101000020E610000000000040AD8946C0000000E0EB7037C0	Brazil
10611	Ali Air Base	\\N	Nasiriyah	0101000020E610000000000060880B4740000000A090EF3E40	Iraq
10617	Ota Air Base	\\N	Alenquer	0101000020E61000005B7C0A80F1EC21C0D42AFA43338B4340	Portugal
10723	Elsenthal Grafe Airport	\\N	Grafenau	0101000020E61000000000000029BC2A40000000A047694840	Germany
10744	Newtownards Airport	\\N	Newtownards	0101000020E6100000DFFFFFDF8BC416C00A120080614A4B40	United Kingdom
10745	Lashenden (Headcorn) Airfield	\\N	Staplehurst	0101000020E610000090847D3B8988E43F6667D13B15944940	United Kingdom
10746	Panshanger Aerodrome	\\N	Welwyn Garden City	0101000020E6100000B44100E02D3BC4BF40120060B8E64940	United Kingdom
10747	Thurrock Airfield	\\N	Stanford-le-Hope	0101000020E61000005473B9C15087D73FDF37BEF6CCC44940	United Kingdom
10748	Stapleford Aerodrome	\\N	Epping	0101000020E6100000B2EAFFFF55F2C33FA906002085D34940	United Kingdom
10750	HAL Airport	\\N	Bengaluru	0101000020E61000001FF6FFBFC36A5340AA4C006066E62940	India
10751	Chichester/Goodwood Airport	\\N	Chichester	0101000020E6100000000000A0184BE8BF000000E0006E4940	United Kingdom
10776	Meschede-Schüren Airport	\\N	Meschede	0101000020E610000000000020747A204000000060C1A64940	Germany
10794	Morro da Urca Heliport	\\N	Rio de Janeiro	0101000020E6100000000000003A9545C000000080A0F336C0	Brazil
10800	Dongji Aiport	FYJ	Fuyuan	0101000020E6100000F4160FEFB9CB6040C6DFF60489194840	China
10802	Skúvoy Heliport	\\N	Sandur	0101000020E610000000000020B1361BC00000004082E24E40	Faroe Islands
10803	Stóra Dímun Heliport	\\N	Tvøroyri	0101000020E610000000000040B4081BC0000000E0B7D74E40	Faroe Islands
10804	Frooba Heliport	\\N	Tvøroyri	0101000020E61000000000008001191BC00000000098C54E40	Faroe Islands
10831	Person County Airport	TDF	Roxboro	0101000020E6100000E4C8FB1FFDBE53C016210AA077244240	United States
10942	Hengyang Nanyue Airport	HNY	Hengyang	0101000020E610000005FD851E31285C409D11A5BDC1E73A40	China
10949	Wonsan Kalma International Airport	WOS	Wŏnsan	0101000020E6100000C976BE9F1ADF5F4055F833BC59954340	North Korea
10951	Mestia Queen Tamar Airport	\\N	Lent’ekhi	0101000020E6100000E1270EA0DF5F4540F5143944DC864540	Georgia
10952	Magas Airport	IGT	Magas	0101000020E6100000651100E09C814640880D002041A94540	Russia
11004	Talladega Municipal Airport	ASN	Talladega	0101000020E610000091FCFFFF418355C093020080F2C84040	United States
11005	Greenville Downtown Airport	GMU	Greer	0101000020E610000035FAFF5F669654C041F2FFFF876C4140	United States
11008	Mankato Regional Airport	MKT	Mankato	0101000020E61000009BFCFDFFCB7A57C0247402605D1C4640	United States
11009	Captain Auguste George Airport	NGD	Road Town	0101000020E6100000000000C0191550C0000000C029BA3240	British Virgin Islands
11010	Troy Municipal Airport	TOI	Troy	0101000020E61000001F000040C68055C03300002043DC3F40	United States
11011	Merkel Field Sylacauga Municipal Airport	SCD	Sylacauga	0101000020E6100000000000408D9355C000000080FD954040	United States
11012	Enterprise Municipal Airport	EDN	Enterprise	0101000020E610000035F9FBFF977955C0E9B7F11FB94C3F40	United States
11017	Ryan Field	\\N	Tucson	0101000020E61000000000004033CB5BC0000000A033124040	United States
11022	Thomas C Russell Field	ALX	Alexander City	0101000020E61000008FF9FFBFA17D55C029E8FFDF14754040	United States
11032	Stade Airport	\\N	Stade	0101000020E6100000000000E092FF224000000080D2C74A40	Germany
11035	Meriden Markham Municipal Airport	\\N	Meriden	0101000020E610000000000080163552C0000000201DC14440	United States
11048	Luzern-Beromunster Airport	\\N	Luzern	0101000020E610000000000000D1682040000000E051984740	Switzerland
11049	La Grand'combe Airport	\\N	Alès	0101000020E610000000000060830C104000000080481F4640	France
11054	Canmore Municipal Heliport	\\N	Canmore	0101000020E6100000FF8200C0A1D55CC02CEEFF5FF5894940	Canada
11055	Krasnokamensk Airport	\\N	Krasnokamensk	0101000020E6100000000000C0E9835D40000000E03C044940	Russia
11067	Ridgely Airpark	\\N	Easton	0101000020E61000000000008071F752C0000000402C7C4340	United States
11068	New Castle Henry Co. Municipal Airport	UWL	New Castle	0101000020E61000008B1C0160E55455C0921A03801DF04340	United States
11070	Brewster Field	HDE	Holdrege	0101000020E61000007842AF3F89D558C0F3C64961DE394440	United States
11071	Pratt Regional Airport	PTT	Pratt	0101000020E6100000E77C0440CDAF58C0B4A6FDFFCDD94240	United States
11072	Yubileyniy Airfield	\\N	Baikonur	0101000020E61000000000000000A04F40000000400A074740	Kazakhstan
11073	Wahoo Municipal Airport	AHQ	Fremont	0101000020E6100000A2FAFF1F042658C099EBFFDFE29E4440	United States
11074	Jim Kelly Field	LXN	Lexington	0101000020E6100000FBF6FF3FBFF158C0FCF9FF7F3F654440	United States
11075	Sublette Municipal Airport	19S	Ulysses	0101000020E6100000C1A7DEBF1E3559C0C6ECFA3FE6BE4240	United States
11076	Council Bluffs Municipal Airport	CBF	Council Bluffs	0101000020E6100000EDFEFF9FADF057C06CFDFF7F2DA14440	United States
11077	Kokomo Municipal Airport	OKK	Kokomo	0101000020E6100000F5FFFF9FC68355C0460000009C434440	United States
11078	Neodesha Municipal Airport	2K7	Independence	0101000020E6100000000000C059E957C000000020BBB74240	United States
11079	King Ranch Airport	\\N	Sutton	0101000020E6100000000000205C8B62C000000040D6E54E40	United States
11080	Elkhart Morton County Airport	EHA	Elkhart	0101000020E610000000E5EFDE517859C05985CD0017804240	United States
11081	Front Range Airport	FTG	Denver	0101000020E610000000000080C0225AC0000000C084E44340	United States
11082	Galesburg Municipal Airport	GBG	Galesburg	0101000020E610000039030020979B56C005E9FF5F10784440	United States
11084	Guymon Municipal Airport	GUY	Guymon	0101000020E610000095250020836059C00CF5FF5FB1574240	United States
11087	Turkey Mountain Estates Airport	\\N	Berryville	0101000020E610000000000080AE6A57C0000000E0BC4B4240	United States
11088	Ulysses Airport	ULS	Ulysses	0101000020E6100000020CCB9FEF5759C060AAFCDF4FCD4240	United States
11089	Flagler Aerial Spraying Inc Airport	\\N	Palm Coast	0101000020E6100000000000C049C459C000000000D7A34340	United States
11090	Independence Municipal Airport	IDP	Independence	0101000020E61000008CF3FF3FD1F157C03117008046944240	United States
11091	Augusta Municipal Airport	3AU	Augusta	0101000020E610000000000060FC4458C000000000F7D54240	United States
11092	Larned Pawnee County Airport	LQR	Great Bend	0101000020E61000007133050081C558C03FC3FE5FB31A4340	United States
11093	Lampasas Airport	LZZ	Lampasas	0101000020E6100000000000A0898C58C0000000E02F1B3F40	United States
11094	Bay City Municipal Airport	BYY	Bay City	0101000020E61000009EF4FF9F43F757C057D6FF3F2AF93C40	United States
11095	Cox Field	PRX	Paris	0101000020E6100000020000E0D9DC57C0210000207CD14040	United States
11096	Coffeyville Municipal Airport	CFV	Coffeyville	0101000020E61000004F0A00009AE457C043F5FF3F088C4240	United States
11097	The Farm Airport	\\N	Batesburg-Leesville	0101000020E610000000000040805B54C000000040C8F74040	United States
11098	Greeley–Weld County Airport	GXY	Greeley	0101000020E61000009525002083285AC0E40F00C0FC374440	United States
11099	General Dewitt Spain Airport	\\N	Southaven	0101000020E6100000322DFBBF748356C0238CFA7FB0994140	United States
11100	Oryol Yuzhny Airport	OEL	Oakley	0101000020E6100000C2F3FF1F4800424023FCFF3FA4774A40	United States
11101	Fremont Municipal Airport	FET	Fremont	0101000020E6100000F18503004B2158C07395F61F7CB94440	United States
11102	La Grande/Union County Airport	LGD	La Grande	0101000020E61000009CCEFFBF72805DC02908004025A54640	United States
11103	Szczytno-Szymany International Airport	SZY	Szczytno	0101000020E6100000000000200DF03440000000E0AEBD4A40	Poland
11110	Pocono Mountains Municipal Airport	MPO	Arlington Heights	0101000020E61000009259FFDF3FD852C005B0F99F99914440	United States
11111	Quakertown Airport	UKT	Quakertown	0101000020E6100000EEFFFFFF70D852C0180000A0B4374440	United States
11127	Banff Airport	YBA	Banff	0101000020E6100000A0B2FFD9ADE25CC0CCADEC218A9A4940	Canada
11131	Banning Municipal Airport	BNG	Banning	0101000020E6100000B03500C076365DC0C2F3FF1F28F64040	United States
11132	Gießen-Lützellinden Airport	\\N	Gießen	0101000020E6100000000000E0382E2140000000209E454940	Germany
11133	Tököl Airport	\\N	Budapest	0101000020E6100000A82900C015FB3240960500C032AC4740	Hungary
11134	Karl Stefan Memorial Airport	OFK	Norfolk	0101000020E6100000180000A0D85B58C0CDFFFFDF24FE4440	United States
11139	Kotido Airport	\\N	Kotido	0101000020E6100000006F8104C50F414039B4C876BE9F0740	Uganda
11140	Kajjansi Airfield	\\N	Kampala	0101000020E6100000A6D590B8C74640408D28ED0DBE30C93F	Uganda
11141	Arlington Municipal Airport	AWO	Arlington	0101000020E6100000364B13002D8A5EC07A54FCDF91144840	United States
11142	Paracatu Airport	\\N	Paracatu	0101000020E610000000000060097147C0000000001B3E31C0	Brazil
11143	Conselheiro Lafaiete Airport	\\N	Conselheiro Lafaiete	0101000020E61000000000004011E645C0000000E014BD34C0	Brazil
11144	Janaúba Airport	\\N	Janaúba	0101000020E6100000000000605BA945C0000000C0C8762FC0	Brazil
11145	Juscelino Kubitscheck Airport	TFL	Teófilo Otoni	0101000020E6100000000000A0BDC144C0000000C06DE431C0	Brazil
11146	Cristiano Ferreira Varella Airport	\\N	Muriaé	0101000020E6100000000000C07B3245C000000020482035C0	Brazil
11153	Peter O Knight Airport	TPF	Tampa	0101000020E61000000B000060C19C54C0F3FFFFBF64EA3B40	United States
11170	Lure Malbouhans Air Base	\\N	Lure	0101000020E6100000E5B33C0FEE2E1A40E0BE0E9C33DA4740	France
11175	Parati Airport	\\N	Paraty	0101000020E6100000960500C0325C46C08C360040723937C0	Brazil
11176	Umberto Modiano Airport	BZC	Armação de Búzios	0101000020E61000000000004040FB44C00000004060C536C0	Brazil
11177	Angra dos Reis Airport	\\N	Angra dos Reis	0101000020E6100000000000004F2746C000000040ADF936C0	Brazil
11178	Itaperuna Airport	ITP	Itaperuna	0101000020E6100000E91800801DF044C020F9FFFF233835C0	Brazil
11179	Maricá Airport	\\N	Maricá	0101000020E6100000000000E05A6A45C00000006064EB36C0	Brazil
11180	Resende Airport	\\N	Resende	0101000020E6100000D5F4FF7F7A3D46C0F9F3FFFF7E7A36C0	Brazil
11181	Saquarema Airport	\\N	Saquarema	0101000020E610000000000080E34045C00000004002EE36C0	Brazil
11198	Aripuanã Airport	AIR	Aripuanã	0101000020E6100000D6A9F23D23B14DC00BD12170248024C0	Brazil
11204	Posto Leonardo Vilas Boas Airport	\\N	Chapada dos Guimarães	0101000020E610000000000080DAB04AC0000000E08B6528C0	Brazil
11205	Tangará da Serra Airport	\\N	Nova Olímpia	0101000020E6100000A50000A0C4B84CC0026600A0F1522DC0	Brazil
11206	Canarana Airport	\\N	Canarana	0101000020E6100000000000A0A1224AC0000000801D262BC0	Brazil
11209	Sobral Airport	QBX	Sobral	0101000020E6100000000000401C2B44C0000000E05D6E0DC0	Brazil
11210	Arapiraca Airport	APQ	Arapiraca	0101000020E6100000000000A0895042C000000000FC8C23C0	Brazil
11211	Cangapara Airport	FLB	Floriano	0101000020E610000000000000E58945C000000000B4621BC0	Brazil
11212	Picos Airport	PCS	Picos	0101000020E6100000000000A008C344C0000000A08C3F1CC0	Brazil
11243	Montauk Airport	MTP	Springs	0101000020E610000000000060EEFA51C0000000C0CA894440	United States
11255	Porter County Municipal Airport	VPZ	Valparaiso	0101000020E6100000B0F6036074C055C0574A09A01CBA4440	United States
11257	Dharavandhoo Airport	DRV	Eydhafushi	0101000020E61000001C7C613255485240569FABADD89F1440	Maldives
11268	Cerro Largo International Airport	MLZ	Melo	0101000020E6100000000000E0BC1B4BC000000040402B40C0	Uruguay
11269	Tydeo Larre Borges Airport	PDU	Paysandú	0101000020E610000000000060EC074DC0000000A0802E40C0	Uruguay
11270	Artigas International Airport	ATI	Artigas	0101000020E6100000000000E002414CC00000004094663EC0	Uruguay
11272	Murray Bridge Airport	\\N	Murray Bridge	0101000020E6100000000000A043676140000000A0898841C0	Australia
11273	Horsham Airport	HSM	Horsham	0101000020E61000000000004089C56140000000C0B85542C0	Australia
11274	Swan Hill Airport	SWH	Swan Hill	0101000020E6100000000000600EF16140000000401AB041C0	Australia
11291	Attopeu Airport	AOU	Attapu	0101000020E6100000A482FFB796B45A405ABA0B5F22A12D40	Laos
11293	Francisco de Miranda Airport	N/A	Caracas	0101000020E610000060080020FCB550C0AC2F004056F82440	Venezuela
11299	Mason County Airport	LDM	Ludington	0101000020E6100000C0D600001B9A55C098D9084033FB4540	United States
11312	Reid-Hillview Airport of Santa Clara County	RHV	San Jose	0101000020E610000058D9FF7F6A745EC0E30C00809CAA4240	United States
11328	Sohar Airport	OHS	Sohar	0101000020E6100000B24B546F0D504C40A6F27684D3623840	Oman
11332	Sahiwal Airport	RZS	Mangla	0101000020E61000000000002011195240000000A0B2E33F40	Pakistan
11352	Thamkharka Airport	\\N	Dhankutā	0101000020E6100000E84F1BD5E9B65540A3755435410C3B40	Nepal
11353	Thimarafushi Airport	TMF	Veymandoo	0101000020E6100000849ECDAACF495240E3A59BC420B00140	Maldives
11354	Ifuru Airport	IFU	Ugoofaaru	0101000020E61000009A99999999415240F7065F984CD51640	Maldives
11355	Kieta Airport	KIE	Arawa	0101000020E61000006D66EDE94C77634002018C25BF3819C0	Papua New Guinea
11357	Hakkari Yüksekova Airport	YKO	Hakkari	0101000020E6100000BC96900F7A1E46403C4ED1915CC64240	Turkey
11386	Jelenia Góra Glider Airport	\\N	Jelenia Góra	0101000020E6100000000000203A922F40000000200F734940	Poland
11389	Bathpalathang Airport	BUT	Jakar	0101000020E6100000DDB5847CD0AF5640ABCFD556EC8F3B40	Bhutan
11406	Vuktyl Airport	\\N	Vuktyl	0101000020E610000000000000D7A34C40000000E061E94F40	Russia
11407	Berezniki Airport	\\N	Berezniki	0101000020E610000000000080C86D4C40000000A02ECA4D40	Russia
11436	Tarko-Sale Airport	TQL	Tarko-Sale	0101000020E6100000DD0300C05B74534092FFFF3F923B5040	Russia
11438	Camarillo Airport	\\N	Camarillo	0101000020E61000000000002004C65DC0000000805A1B4140	United States
11452	Leopoldsburg Airfield	\\N	Leopoldsburg	0101000020E6100000B26BD674983A15408FC2F5285C8F4940	Belgium
11479	Omtepe Airport	\\N	San Jorge	0101000020E61000001990BDDEFD6C55C01E537765170C2740	Nicaragua
11524	Achinsk Airport	ACS	Achinsk	0101000020E61000000000000088A45640000000A057224C40	Russia
11583	Hinton/Jasper-Hinton Airport	\\N	Hinton	0101000020E61000000BF2FF1F31705DC0DC000080DBA84A40	Canada
11638	Watsonville Municipal Airport	WVI	Watsonville	0101000020E6100000EC8100608F725EC027050000C5774240	United States
11644	Gelephu Airport	GLU	Sarpang	0101000020E6100000D95A5F24B49D56408A592F8672E23A40	Bhutan
11649	Williamsburg Jamestown Airport	JGG	Williamsburg	0101000020E6100000000000A0D42D53C0000000209E9E4240	United States
11700	Siquijor Airport	\\N	Siquijor	0101000020E61000004EE7FF5F39DE5E4002997C0BAC6D2240	Philippines
11718	Gelnhausen Airport	\\N	Gelnhausen	0101000020E6100000000000400A572240000000A03E194940	Germany
11719	Ærø Airport	\\N	Svendborg	0101000020E610000000000040ADE9244000000080286D4B40	Denmark
11720	Lauterbach Airport	\\N	Lauterbach	0101000020E6100000000000C058D222400000008077574940	Germany
11721	Aschaffenburg Airport	\\N	Aschaffenburg	0101000020E610000000000000B6202240000000802DF84840	Germany
11722	Squamish Airport	YSE	Whistler	0101000020E6100000017DFF3F5ECA5EC0750C00C00EE44840	Canada
11735	Reichelsheim Airport	\\N	Florstadt	0101000020E61000000000008090C12140000000A0FC2A4940	Germany
11737	Marburg-Schönstadt Airport	\\N	Cölbe	0101000020E6100000000000A047A12140000000C0ED6F4940	Germany
11738	Lauenbrück Airport	\\N	Scheeßel	0101000020E6100000000000E08B252340000000608F9A4A40	Germany
11739	Hüttenbusch Airport	\\N	Worpswede	0101000020E610000000000040FAE4214000000080B1A44A40	Germany
11740	Vrsar Crljenka Airport	\\N	Rovinj	0101000020E610000000000000DE422B400000004023924640	Croatia
11742	Union County Airport	MRT	Linda	0101000020E6100000000000A080D654C000000000C31C4440	United States
11745	Liverpool South Shore Regional Airport		Bridgewater	0101000020E610000055F3FF5FCA3650C0D5F4FF7F7A1D4640	Canada
11748	James T. Field Memorial Aerodrome	YCE	South Huron	0101000020E61000008BE1EA00886054C099620E828EA44540	Canada
11752	Dolbeau St Felicien Airport	YDO	Saint-Félicien	0101000020E610000000000000001852C0BCFFFFDFA5634840	Canada
11753	Amos Magny Airport	YEY	Amos	0101000020E610000000000020FB8F53C0000000E02D484840	Canada
11754	Goderich Airport	YGD	Goderich	0101000020E6100000D5F4FF7F7A6D54C04D0700C029E24540	Canada
11755	Hope Airport	YHE	Chilliwack	0101000020E6100000EF640040DF5F5EC024FFFF7F24AF4840	Canada
11761	Matane Airport	YME	Matane	0101000020E6100000000000E002DD50C0000000E0AE6D4840	Canada
11762	Charlevoix Airport	YML	La Malbaie	0101000020E610000000000060548E51C0000000E07ACC4740	Canada
11764	Owen Sound / Billy Bishop Regional Airport	YOS	Owen Sound	0101000020E6100000CC0500A0993554C0760F00008F4B4640	Canada
11765	Port Hawkesbury Airport	YPS	Princeville	0101000020E610000072E6FFDF1DAF4EC0750C00C00ED44640	Canada
11766	St Thomas Municipal Airport	YQS	St. Thomas	0101000020E610000000000060174754C0000000608F624540	Canada
11767	Ottawa / Rockcliffe Airport	YRO	Ottawa	0101000020E61000004E0700C059E952C0D6170020EBBA4640	Canada
11768	Ottawa / Carp Airport	YRP	Ottawa	0101000020E6100000DE0300C06B0153C0DC000080DBA84640	Canada
11769	Smiths Falls-Montague (Russ Beach) Airport	YSH	Smiths Falls	0101000020E6100000000000C032FC52C00000000010794640	Canada
11770	St Leonard Airport	YSL	Edmundston	0101000020E6100000000000C06BF550C00000000029944740	Canada
11772	Vernon Airport	YVE	Vernon	0101000020E6100000000000202FD55DC0000000C0C11F4940	Canada
11774	Salmon Arm Airport	YSN	Salmon Arm	0101000020E61000008CBAD6DEA7CE5DC05BD2510E66574940	Canada
11779	Thicket Portage Airport	YTD	Thompson	0101000020E6100000000000A04C6D58C0000000C0D1A84B40	Canada
11780	Pikwitonei Airport	PIW	Thompson	0101000020E610000000000040824A58C00000002061CB4B40	Canada
11785	Neubrandenburg Airport	FNB	Neubrandenburg	0101000020E6100000E9263108AC9C2A405BD3BCE314CD4A40	Germany
11786	Airport Bamberg-Breitenau	\\N	Bamberg	0101000020E610000012D9075916D42540F511F8C3CFF54840	Germany
11787	Zerbst Airport	\\N	Zerbst	0101000020E6100000000000C0164C2840000000401B004A40	Germany
11788	RAF Spadeadam	\\N	Hexham	0101000020E6100000AF200060666604C0B115006066864B40	United Kingdom
11789	RAF Kinloss	FSS	Forres	0101000020E61000000BD9FFDF307C0CC0FDF9FF7F1FD34C40	United Kingdom
11790	Biała Podlaska Airfield	BXP	Biała Podlaska	0101000020E610000092CF8657ED213740D53E1D8F19004A40	Poland
11791	Cewice Military Airport	\\N	Sierakowice	0101000020E6100000BFEDFF9F67C33140FCF9FF7F3F354B40	Poland
11792	Deblin Military Air Base	\\N	Dęblin	0101000020E610000014240000C3E435409F17004094C64940	Poland
11793	Leczyca Military Air Base	\\N	Łęczyca	0101000020E610000034DAFFFF45253340D2EEFFFF99004A40	Poland
11794	Minsk Mazowiecki Military Air Base	\\N	Mińsk Mazowiecki	0101000020E610000042350000E9A73540AF12002006194A40	Poland
11795	Powidz Military Air Base	\\N	Mińsk Mazowiecki	0101000020E6100000CDE5FF3F99DA314004E6FF1F90304A40	Poland
11796	Tomaszow Mazowiecki Military Air Base	\\N	Tomaszów Mazowiecki	0101000020E6100000D1CBFF5F09193440EDFEFF9FCDCA4940	Poland
11797	Björkvik Air Base	\\N	Krokek	0101000020E6100000000000203A923040000000E038654D40	Sweden
11798	Ljungbyhed Airport	\\N	Klippan	0101000020E6100000000000C0CC6C2A4000000040990A4C40	Sweden
11799	Daugavpils Intrenational Airport	DGP	Daugavpils	0101000020E6100000EFE1FF7F3DAA3A40E7F2FF9FECF84B40	Latvia
11800	Jēkabpils Air Base	\\N	Jēkabpils	0101000020E610000014AE47E17AE43940499EEBFB70444C40	Latvia
11801	Jūrmala Airport	\\N	Tukums	0101000020E61000000C93A98251393740462575029A784C40	Latvia
11802	Kėdainiai Air Base	\\N	Kėdainiai	0101000020E6100000000000A0D6F43740000000C0E5A74B40	Lithuania
11803	Lime Acres Finsch Mine Airport	LMR	Daniëlskuil	0101000020E6100000000000E068703740000000802F5C3CC0	South Africa
11805	Lusaka City Airport	\\N	Lusaka	0101000020E6100000403200C0A8543C40645100A0DDD32EC0	Zambia
11806	Sumbe Airport	NDD	Sumbe	0101000020E610000000000080EBB12B4000000000F75526C0	Angola
11807	Mangochi Airport	MAI	Mangochi	0101000020E6100000000000002DA24140000000C04BF72CC0	Malawi
11809	Mariental Airport	\\N	Mariental	0101000020E610000000000000E7EC314000000080FB9A38C0	Namibia
11810	Almaza Air Force Base	\\N	Cairo	0101000020E610000000000000295C3F400000004080173E40	Egypt
11811	Beni Suef Air Base	\\N	Banī Suwayf	0101000020E6100000000000E03F043F400000002053353D40	Egypt
11812	Jiyanklis Air Base	\\N	Abū al Maţāmīr	0101000020E610000000000080F2303E4000000060DED13E40	Egypt
11813	Merowe New Airport	MWE	Merowe	0101000020E610000071267EB1E4D73F400BC0174B7E713240	Sudan
11814	St Louis Regional Airport	ALN	Bethalto	0101000020E61000000EF8FF9FF18256C02CEEFF5FF5714340	United States
11815	Chandler Field	AXN	Pineville	0101000020E6100000960500C042D957C099EBFFDFE2EE4640	United States
11816	Columbus Municipal Airport	CLU	Groveport	0101000020E610000069F7FFFF5C7955C02E11000086A14340	United States
11817	Curtis Field	BBD	Brady	0101000020E6100000D7F7FFBFBAD458C0B8E1FF9FE62D3F40	United States
11819	Baker City Municipal Airport	BKE	Baker City	0101000020E6100000B21800A0C6735DC0E7F2FF9F2C6B4640	United States
11821	Ozark Regional Airport	WMH	Mountain Home	0101000020E6100000E7F2FF9F1C1E57C03F0F0020382F4240	United States
11822	W K Kellogg Airport	BTL	Battle Creek	0101000020E6100000C6F9FF9F185055C02EF1FF9F55274540	United States
11823	Burley Municipal Airport	BYI	Burley	0101000020E61000003F2F008068715CC01C1300E073454540	United States
11824	Northeast Iowa Regional Airport	CCY	Charles City	0101000020E61000003A060060172757C0551600004B894540	United States
11825	Chanute Martin Johnson Airport	CNU	Chanute	0101000020E61000005E0500E00BDF57C0DAFDFF3F9BD54240	United States
11826	Jacksonville Executive at Craig Airport	CRG	Jacksonville	0101000020E61000005F0500E0EB6054C0C3D3FFBF17563E40	United States
11827	Crossville Memorial Whitson Field	CSV	Crossville	0101000020E6100000850700A0704555C022FCFF3FC4F94140	United States
11828	Davison Army Air Field	DAA	Fort Belvoir	0101000020E61000002B0B0080954B53C0A9060020855B4340	United States
11829	Barstow Daggett Airport	DAG	Barstow	0101000020E61000007C3727405E325DC04DFEFEFF456D4140	United States
11830	Deming Municipal Airport	DMN	Deming	0101000020E6100000B395FFDF24EE5AC09708000093214040	United States
11831	Desert Rock Airport	DRA	Pahrump	0101000020E61000006EF7729F1C025DC03A92CB7F484F4240	United States
11832	Needles Airport	EED	Shiprock	0101000020E6100000EF640040DFA75CC032F7FF1F16624140	United States
11833	Duke Field	EGI	Crestview	0101000020E61000000471FD3F77A155C05F83F89F80A63E40	United States
11834	Murray Field	EKA	Eureka	0101000020E61000006891FF5F3B075FC0AFF2FFBFD5664440	United States
11835	San Marcos Municipal Airport	HYI	San Marcos	0101000020E6100000000000603B7758C00000000088E43D40	United States
11836	Sawyer County Airport	HYR	Hayward	0101000020E61000007DF8FF5F6FDC56C0D1EBFFBF39034740	United States
11838	Monticello Municipal Ellis Field	LLQ	Monticello	0101000020E61000001844FF5F10F056C0631F09A0BDD14040	United States
11841	Mc Comb/Pike County Airport/John E Lewis Field	MCB	McComb	0101000020E61000001B1000A0339E56C0F242F81FB22D3F40	United States
11842	Southern Illinois Airport	MDH	Carbondale	0101000020E6100000000000C0205056C0000000C098E34240	United States
11843	Mc Entire Joint National Guard Base	MMT	Woodfield	0101000020E61000001F420180483354C0C5F009C0DCF54040	United States
12018	Corryong Airport	CYG	Ararat	0101000020E6100000000000806A7C624000000000661742C0	Australia
11844	Brunswick Executive Airport	NHZ	Country Club Estates	0101000020E6100000E8FAFCFF117C51C01B1000A033F24540	United States
11845	Naval Station Mayport (Admiral David L. Mcdonald Field)	NRB	Atlantic Beach	0101000020E6100000F45104402E5B54C061D100201F643E40	United States
11846	Orangeburg Municipal Airport	OGB	Orangeburg	0101000020E6100000DDFFFFFF013754C01D00006078BA4040	United States
11847	Columbus Municipal Airport	OLU	Groveport	0101000020E61000001678FE1FED5558C0A39FFC1F58B94440	United States
11848	Ottumwa Regional Airport	OTM	Ottumwa	0101000020E610000067E7FA5FAA1C57C0768C0A20A58D4440	United States
11849	Cairns AAF (Fort Rucker) Air Field	OZR	Daleville	0101000020E61000004E3DFB5FA86D55C06D6B134094463F40	United States
11851	Dutchess County Airport	POU	Poughkeepsie	0101000020E6100000000000C0967852C00000006034D04440	United States
11852	New Richmond Regional Airport	RNH	New Richmond	0101000020E61000000EFC0340702257C01412FE7FFB924640	United States
11853	Russell Municipal Airport	RSL	Hays	0101000020E6100000F7FFFF7FF4B358C0EEFFFFFFA06F4340	United States
11854	Redwood Falls Municipal Airport	RWF	Redwood Falls	0101000020E61000007E47016044C557C0A79201A00A464640	United States
11855	Salinas Municipal Airport	SNS	Salinas	0101000020E6100000C60000C0C8665EC0F5FFFF9FD6544240	United States
11857	Saline County Regional Airport	SUZ	Bryant	0101000020E610000009E2FA7FAE1E57C0CADFFFBF984B4140	United States
11859	Aurora State Airport	UAO	Wilsonville	0101000020E6100000000000A047B15EC000000000A19F4640	United States
11860	Ukiah Municipal Airport	UKI	Ukiah	0101000020E610000029010020DDCC5EC0390000C020904340	United States
11861	University Oxford Airport	UOX	Oxford	0101000020E6100000F1FFFFDF5A6256C0390000C030314140	United States
11862	Huntsville Regional Airport	HTV	Madison	0101000020E6100000A50000A094E557C0231F00E034BF3E40	United States
11864	Winnemucca Municipal Airport	WMC	Winnemucca	0101000020E6100000A826008095735DC01FF6FFBFC3724440	United States
11865	West Woodward Airport	WWR	Woodward	0101000020E610000054CD075F73E158C0F2D24D6210384240	United States
11866	Cape Canaveral AFS Skid Strip	XMR	Cocoa Beach	0101000020E6100000190A0020432454C0221C00A0B4773C40	United States
11868	Zanesville Municipal Airport	ZZV	Zanesville	0101000020E6100000C3F3FF1F187954C08E190020E2F84340	United States
11869	Gjadër Air Base	\\N	Lezhë	0101000020E61000007E1D386744993340B9347EE195F24440	Albania
11870	Kukës Airport	\\N	Kukës	0101000020E610000047DBFF5F786A344084E7FF3F50044540	Albania
11871	Kuçovë Air Base	\\N	Kuçovë	0101000020E6100000000000E0E2E63340000000A0CD624440	Albania
11872	Vlorë Air Base	\\N	Vlorë	0101000020E61000000000002065793340000000E0F03C4440	Albania
11873	Uzundzhovo Air Base	\\N	Haskovo	0101000020E610000000000020FD963940000000A0FAFC4440	Bulgaria
11874	Gabrovnitsa Air Base	\\N	Montana	0101000020E610000000000080C2453740000000A0ABC54540	Bulgaria
11875	Graf Ignatievo Air Base	\\N	Saedinenie	0101000020E6100000000000C0C8B63840000000E02B254540	Bulgaria
11876	Dolna Mitropoliya Air Base	\\N	Dolni Dabnik	0101000020E6100000C66D3480B7803840DB300A82C7B94540	Bulgaria
11877	Balchik Air Base	\\N	Balchik	0101000020E6100000000000A0692E3C40000000203FB64540	Bulgaria
11878	Cuatro Vientos Airport	ECV	Madrid	0101000020E6100000B81D0080F7470EC0170A0020732F4440	Spain
11879	Castellón-Costa Azahar Airport	CDT	Castelló de la Plana	0101000020E610000089B2B794F3C5B23FB1FCF9B6601B4440	Spain
11880	Teruel Airport	TEV	Teruel	0101000020E610000003780B24287EF3BFDD24068195334440	Spain
11881	Blois-Le Breuil Airport	\\N	Blois	0101000020E6100000D68BA19C6857F33FA3224E27D9D64740	France
11882	Trento-Mattarello Airport	TN0	Mattarello	0101000020E61000008F537424973F26403411363CBD024740	Italy
11883	Alessandria Airport	\\N	Alessandria	0101000020E6100000397F130A11402140FE9C82FC6C764640	Italy
11884	Biella-Cerrione Airport	\\N	Candelo	0101000020E6100000A25D85949F342040BADA8AFD65BF4640	Italy
11885	Vercelli Airport	\\N	Vercelli	0101000020E610000020B58993FBD52040EA9106B7B5A74640	Italy
11886	Casale Monferrato Airport	\\N	Casale Monferrato	0101000020E610000061FD9FC37CE92040B8B06EBC3B8E4640	Italy
11887	Varese-Venegono Airport	\\N	Varese	0101000020E6100000F4A62215C6C62140DC0F786000DF4640	Italy
11888	Novi Ligure Airport	\\N	Novi Ligure	0101000020E61000008ACDC7B5A1922140D3F4D901D7634640	Italy
11889	Sarzana-Luni Air Base	QLP	Colombiera-Molicciara	0101000020E6100000992A1895D4F92340F581E49D430B4640	Italy
11890	Câmpia Turzii Air Base	\\N	Câmpia Turzii	0101000020E610000000000060CAE23740000000604B404740	Romania
11891	Mărculeşti International Airport	\\N	Floreşti	0101000020E6100000000000007A363C40000000006DEE4740	Moldova
11892	Cahul International Airport	\\N	Cahul	0101000020E610000092DFFFDF81433C408B1300A001EC4640	Moldova
11893	Tiraspol Airport	\\N	Tiraspolul	0101000020E61000000000008031973D40000000E01D6F4740	Moldova
11894	Batajnica Air Base	BJY	Nova Pazova	0101000020E610000052B81E85EB413440A27DACE0B7774640	Serbia
11895	Rubelsanto Airport	RUV	Chisec	0101000020E6100000000000C07F9C56C000000060E7FB2F40	Guatemala
11896	Coronel Enrique Soto Cano Air Base	XPL	Comayagua	0101000020E610000085CFD6C1C1E755C016FBCBEEC9C32C40	Honduras
11897	Upala Airport	UPL	San José	0101000020E6100000C652245F094155C07FFB3A70CEC82540	Costa Rica
11898	San Nicolas De Bari Airport	QSN	San Nicolás de Bari	0101000020E610000000000000F07A54C0000000C08FC13640	Cuba
11899	San Julian Air Base	SNJ	Pinar del Río	0101000020E610000000000060BA0955C0000000A065183640	Cuba
11900	Dawadmi Domestic Airport	\\N	Ad Dawādimī	0101000020E61000000A9FAD83830F46406C787AA52C733840	Saudi Arabia
11901	King Khaled Air Base	KMX	Ad Dawādimī	0101000020E610000000000020D9664540000000E01B4C3240	Saudi Arabia
11902	Riyadh Air Base	XXN	Riyadh	0101000020E610000000000060D35C474000000080B5B53840	Saudi Arabia
11904	Hamadan Air Base	\\N	Hamadān	0101000020E6100000000000A0A2534840000000C0159B4140	Iran
11905	Payam International Airport	PYK	Karaj	0101000020E610000030000040D1694940C7FFFF3F57E34140	Iran
11906	Ahmed Al Jaber Air Base	XIJ	Al Aḩmadī	0101000020E6100000E51200005DE547407CD8FFFF4EEF3C40	Kuwait
11907	Rayak Air Base	\\N	Zahlé	0101000020E6100000000000006DFE414000000000E7EC4040	Lebanon
11908	Mirpur Khas Air Base	MPD	Mirpur Khas	0101000020E6100000000000C0A844514000000060B8AE3940	Pakistan
11909	Minhas Air Base	ATG	Kāmra	0101000020E6100000C4F6FF5FA819524077EFFF9F3EEF4040	Pakistan
11910	Rafiqui Air Base	\\N	Shorkot	0101000020E61000000000008014125240000000E012C23E40	Pakistan
11911	Faisal Air Base	\\N	Karachi	0101000020E61000000000008095C75040000000A0CBDF3840	Pakistan
11912	Mushaf Air Base	SGI	Sargodha	0101000020E6100000000000608F2A52400000008038064040	Pakistan
11914	Al Sahra Army Air Field	\\N	Tikrīt	0101000020E61000000000000081C54540000000602B564140	Iraq
11915	Tall Afar Army Air Field	\\N	Sinjār	0101000020E61000000000008095334540000000A03C244240	Iraq
11916	Al Taji Army Air Field	\\N	Baghdad	0101000020E610000000000080DB204640000000200FC34040	Iraq
11917	Ubaydah Bin Al Jarrah Airport	\\N	Al Kūt	0101000020E6100000000000A0E8E0464000000020B23D4040	Iraq
11919	Wasilla Airport	WWA	Wasilla	0101000020E6100000BFEDFF9F47B162C06CFDFF7F2DC94E40	United States
11920	Gangshan Air Force Base	\\N	Kaohsiung	0101000020E610000000000000D5105E40000000E051C83640	Taiwan
11921	Asahikawa Airport	\\N	Asahikawa	0101000020E6100000000000C09DCB614000000020C9E54540	Japan
11923	Utsunomiya Airport	QUT	Asahikawa	0101000020E610000000000040DF7B614000000020DB414240	Japan
11924	Jungwon Air Base	\\N	Koesan	0101000020E6100000000000E0A3F85F4000000000D7834240	South Korea
11925	Ie Jima Airport	IEJ	Nago	0101000020E6100000EFE1FF7F3DF25F40A4200000D5B83A40	Japan
11926	Allah Valley Airport	AAV	Surallah	0101000020E61000000000006010305F40000000A09F771940	Philippines
11927	Bislig Airport	BPH	Bislig	0101000020E6100000000000A09B945F400000008053642040	Philippines
11928	Mati National Airport	MXI	Bislig	0101000020E6100000000000E078915F40000000A027CC1B40	Philippines
11929	Presidente Néstor Kirchner Regionsl Airport	VMR	Villa María	0101000020E610000070253B36029D4FC08CB96B09F92840C0	Argentina
11930	Chafei Amsei Airport	BAT	Barretos	0101000020E6100000C2FFFF7F0B4C48C0280000C0A19534C0	Brazil
11931	Base de Aviação de Taubaté Airport	QHP	Taubaté	0101000020E6100000000000400CC246C000000000440A37C0	Brazil
11932	Barriles Airport	TOQ	Tocopilla	0101000020E610000000000080068451C0000000201F2436C0	Chile
11935	Panguilemo Airport	TLX	Talca	0101000020E61000000000004082E651C0000000C05BB041C0	Chile
11936	Victoria Airport	ZIC	Victoria	0101000020E6100000000000804F1652C0000000E06F1F43C0	Chile
11937	Las Breas Airport	TTC	Taltal	0101000020E6100000000000C00E9851C000000000769039C0	Chile
11938	Gomez Nino Apiay Air Base	API	Villavicencio	0101000020E6100000645DDC46036452C0AED3484BE54D1040	Colombia
11939	Coveñas Airport	CVE	San Antero	0101000020E610000063EE5A423EEC52C0E89FE06245CD2240	Colombia
11940	German Olano Air Base	PAL	La Dorada	0101000020E6100000FC1873D712AA52C00113B87537EF1540	Colombia
11942	Tunja Airport	\\N	Tunja	0101000020E6100000355EBA490C5652C07CD5CA845F2A1640	Colombia
11945	Juan Simons Vela Airport	RIJ	Rioja	0101000020E6100000000000803D4A53C0000000207D4518C0	Peru
11946	Shumba Airport	JAE	Jaén	0101000020E61000007842AF3F89B153C0E622BE13B35E16C0	Peru
11947	Metropolitano Airport	\\N	Ocumare del Tuy	0101000020E6100000000000C06BB250C0000000C02E442440	Venezuela
11948	Issyk-Kul International Airport	IKU	Cholpon-Ata	0101000020E6100000CBA2B08BA22D534008556AF6404B4540	Kyrgyzstan
11949	Kant Air Base	\\N	Kant	0101000020E6100000000000002DB65240000000A0356D4540	Kyrgyzstan
11950	Ayaguz Airport	\\N	Ayagoz	0101000020E6100000000000A0FA1C5440000000A094F54740	Kazakhstan
11951	Chelkar Airport	\\N	Shalqar	0101000020E6100000000000205CCF4D4000000000D7F34740	Kazakhstan
11953	Vilyuisk Airport	VYI	Vilyuysk	0101000020E6100000FD0000A05F6C5E40D4FFFF7FDAE04F40	Russia
11954	Belaya Gora Airport	\\N	Ak”yar	0101000020E61000000000008068476240000000609F235140	Russia
11955	Dzhermuk Airport	\\N	Vayk’	0101000020E6100000AB0C00A045D64640441800E078E94340	Armenia
11956	Kamenny Ruchey Naval Air Base	\\N	Vanino	0101000020E6100000000000E02D866140000000802B9E4840	Russia
11957	Maygatka Airport.	GVN	Vanino	0101000020E6100000B4FBFF7F16816140C0F0FFDFA7764840	Russia
11960	Keperveem Airport	\\N	Bilibino	0101000020E6100000523000E07AC4644024FFFF7F14F65040	Russia
11961	Magadan-13 Airport	\\N	Magadan	0101000020E61000000000000081DD624000000040C8CF4D40	Russia
11962	Nikolayevsk-na-Amure Airport	NLI	Nikolayevsk-on-Amure	0101000020E610000066FFFFBFCC94614012000000D7934A40	Russia
11964	Zheleznogorsk Airport	\\N	Zheleznogorsk-Ilimskiy	0101000020E6100000000000C0C8065A40000000006D3E4C40	Russia
11965	Gvardeyskoe Air Base	\\N	Gvardeyskoye	0101000020E6100000000000600EFD404000000060B88E4640	Ukraine
11966	Saki Air Base	\\N	Saki	0101000020E61000000000000029CC404000000060E78B4640	Ukraine
11967	Dzhankoy Airport	\\N	Dzhankoy	0101000020E6100000000000809E35414000000020B7D94640	Ukraine
11968	Ozerne Air Base	\\N	Zhytomyr	0101000020E61000000000004001BD3C400000002043144940	Ukraine
11969	Severomorsk-1 Naval Air Base	\\N	Severomorsk	0101000020E6100000000000E08BB54040000000E006425140	Russia
11970	Pushkin Airport	\\N	Saint Petersburg	0101000020E6100000523000E09A563E40F0040020AED74D40	Russia
11971	Siversky Air Base	\\N	Siverskiy	0101000020E61000000000002065093E4000000060A8AD4D40	Russia
11972	Staraya Russa Airport	\\N	Staraya Russa	0101000020E61000000000000068623F40000000200FFB4C40	Russia
11973	Peski Airport	\\N	Petrozavodsk	0101000020E6100000000000C0D4254140000000207DEA4E40	Russia
11974	Baranavichi Air Base	\\N	Baranovichi	0101000020E6100000000000C0CC0C3A40000000C0CC8C4A40	Belarus
11975	Babruisk Air Base	\\N	Babruysk	0101000020E610000014AE47E17A343D403D0AD7A3708D4A40	Belarus
11976	Severo-Eniseysk Airport	\\N	Severo-Yeniseyskiy	0101000020E6100000000000C0BF40574000000040C82F4E40	Russia
11977	Sharypovo Airport	\\N	Sharypovo	0101000020E6100000860A00E0204B564056F6FF9F3ABA4B40	Russia
11978	Omsk Severny Airport	\\N	Omsk	0101000020E6100000A80600208563524067F4FFBFCC7C4B40	Russia
11979	Nagurskoye	\\N	Murmansk	0101000020E6100000AF0AD462F0D44740C53A55BE67335440	Russia
11980	Svetlogorsk Airport	\\N	Svetlogorsk	0101000020E610000000000040D019564000000080C2B55040	Russia
11981	Valek Airport	\\N	Norilsk	0101000020E6100000000000C0A2165640000000E066595140	Russia
11982	Khanskaya Airport	\\N	Maykop	0101000020E6100000000000E07A044440000000400A574640	Russia
11983	Dudinka Airport	\\N	Dudinka	0101000020E6100000000000E0068A55400000000000585140	Russia
11984	Volgodonsk Airport	VLK	Ak”yar	0101000020E61000000000008051094540000000004FD74740	Russia
11985	Tashkent East Airport	\\N	Tashkent	0101000020E6100000000000C00C5951400000008006A84440	Uzbekistan
11986	Myachkovo Airport	\\N	Moscow	0101000020E6100000A11A008014FE4240F0040020AEC74B40	Russia
11987	Tretyakovo Airport	\\N	Lukhovitsy	0101000020E6100000CD0800E069834340B7010000D7734B40	Russia
11988	Yermolino Airport	\\N	Balabanovo	0101000020E610000072E6FFDFDD4D4240D2EEFFFF399D4B40	Russia
11990	Izhma Airport	\\N	Sosnogorsk	0101000020E61000000000000029FC4A400000006007425040	Russia
11991	Borisoglebskoye Airport	\\N	Kazan	0101000020E6100000000000001091484000000000F0EE4B40	Russia
11993	Maksimovka Airport	\\N	Ufa	0101000020E6100000000000E08A154C40000000803D6A4B40	Russia
11994	Buguruslan Severny Airport	\\N	Buguruslan	0101000020E610000054F3FF5F9A2F4A40A01A0080F4DB4A40	Russia
11995	Bezymyanka Airfield	\\N	Samara	0101000020E6100000000000A09929494000000000299C4A40	Russia
11996	Ratnagiri Airport	RTC	Ratnagiri	0101000020E6100000000000A0FA545240000000407B033140	India
11997	Hingurakgoda Air Force Base	HIM	Polonnaruwa	0101000020E6100000D712F241CF3E54400C0742B280192040	Sri Lanka
11998	Kazi Nazrul Islam Airport	RDP	Bahula	0101000020E6100000643BDF4F8DCF55408FC2F5285C9F3740	India
12002	Sri Sathya Sai Airport	PUT	Puttaparthi	0101000020E61000000CF5FF5FA172534084270000714C2C40	India
12003	Meiktila Air Base	\\N	Meiktila	0101000020E61000000000008023F9574000000020EBE23440	Myanmar
12004	Changi Air Base (East)	\\N	Singapore	0101000020E61000008E7C008093005A40BF5000009981F53F	Singapore
12005	Soltsy-2 Air Base	\\N	Sol’tsy	0101000020E61000000000006096543E40000000A0DC114D40	Russia
12006	Severomorsk-3 Naval Air Base	\\N	Severomorsk	0101000020E6100000000000C0BBDB40400000008077375140	Russia
12007	Fedotovo Naval Air Base	\\N	Molochnoye	0101000020E610000000000040C88F4340000000401A984D40	Russia
12008	Lebyazhye Air Base	\\N	Kamyshin	0101000020E6100000CC0500A0A99A46408CF3FF3FD1194940	Russia
12009	Smolensk North Airport	\\N	Smolensk	0101000020E61000003333333333034040B6F3FDD478694B40	Russia
12010	Rtishchevo Air Base	\\N	Rtishchevo	0101000020E61000004D840D4FAFDC45400DA9F8780E264A40	Russia
12012	Ararat Airport	ARY	Ararat	0101000020E6100000000000E0A5DF6140000000609AA742C0	Australia
12013	Benalla Airport	BLN	Ararat	0101000020E61000000000006039406240000000A0A44642C0	Australia
12014	Balranald Airport	BZD	Ararat	0101000020E6100000000000007FF2614000000020D24F41C0	Australia
12015	Brewarrina Airport	BWQ	Ararat	0101000020E6100000000000E0245A62400000008051F93DC0	Australia
12016	Cleve Airport	CVC	Ararat	0101000020E6100000000000002910614000000080D7DA40C0	Australia
12017	Corowa Airport	CWW	Ararat	0101000020E6100000000000806C4B62400000006052FF41C0	Australia
12019	Cootamundra Airport	CMD	Ararat	0101000020E610000000000060E580624000000000DC4F41C0	Australia
12020	Dirranbandi Airport	DRN	Ararat	0101000020E6100000000000A0F1866240000000A079973CC0	Australia
12021	Deniliquin Airport	DNQ	Deniliquin	0101000020E6100000A54300A0451E624054F3FF5F9AC741C0	Australia
12022	Dysart Airport	DYA	Ararat	0101000020E6100000000000E0A58B624000000080489F36C0	Australia
12023	Echuca Airport	ECH	Ararat	0101000020E61000000000004062186240000000201F1442C0	Australia
12024	Forbes Airport	FRB	Parkes	0101000020E61000006AFAEC80EB7D62404E61A5828AAE40C0	Australia
12025	Gunnedah Airport	GUH	Ararat	0101000020E61000000000004008C86240000000A00AF63EC0	Australia
12026	Hay Airport	HXX	Ararat	0101000020E6100000000000608F1A6240000000E0044441C0	Australia
12027	Hopetoun Airport	HTU	Ararat	0101000020E61000000000002085CB6140000000008FDB41C0	Australia
12028	Kerang Airport	KRA	Ararat	0101000020E6100000000000400CFE6140000000E02DE041C0	Australia
12029	Kempsey Airport	KPS	Ararat	0101000020E6100000000000E0A3186340000000E00B133FC0	Australia
12030	Kingaroy Airport	KGY	Ararat	0101000020E610000000000080E9FA624000000040AF943AC0	Australia
12031	Latrobe Valley Airport	TGN	Morwell	0101000020E6100000CB82893F0A4F6240C861307F851A43C0	Australia
12032	Mareeba Airport	MRG	Ararat	0101000020E610000000000080682D624000000020B71131C0	Australia
12033	Ngukurr Airport	RPM	Ararat	0101000020E610000000000060E7D76040000000E012722DC0	Australia
12034	Narromine Airport	QRM	Ararat	0101000020E61000000000004033876240000000407B1B40C0	Australia
12035	Port Pirie Airport	PPI	Ararat	0101000020E610000000000000D73F614000000040949E40C0	Australia
12036	Smithton Airport	SIO	Ararat	0101000020E610000000000020B022624000000040E16A44C0	Australia
12037	Snake Bay Airport	SNB	Ararat	0101000020E6100000000000A0ED5460400000004079D826C0	Australia
12038	Stawell Airport	SWC	Ararat	0101000020E610000000000040B6D76140000000802D8942C0	Australia
12039	Tibooburra Airport	TYB	Ararat	0101000020E610000000000020DBC16140000000407B733DC0	Australia
12040	Tumut Airport	TUM	Ararat	0101000020E610000000000040B687624000000060A3A141C0	Australia
12041	Wangaratta Airport	WGT	Ararat	0101000020E610000000000000D3496240000000E0383542C0	Australia
12042	Warracknabeal Airport	WKB	Ararat	0101000020E61000000000008068CD6140000000C0192942C0	Australia
12043	Warren Airport	QRR	Ararat	0101000020E610000000000020B279624000000080B9BB3FC0	Australia
12044	West Sale Airport	SXE	Sale	0101000020E6100000E5D53906E45E6240014C1938A00B43C0	Australia
12046	Young Airport	NGA	Ararat	0101000020E6100000000000A0EF87624000000080B72041C0	Australia
12047	Guangzhou MR Air Base	LHK	Laohekou	0101000020E6100000000000E07AEC5B40000000E0D7314040	China
12048	Shiyan Wudangshan Airport	WDS	Shiyan	0101000020E6100000CF81E50819BA5B40AC8F87BEBB4B4040	China
12049	Sunchon Air Base	\\N	P’yŏngsŏng	0101000020E610000029417FA147795F406DFDF49F35B54340	North Korea
12051	Baruun Urt Airport	UUN	Baruun-Urt	0101000020E6100000000000803D525C40000000C084544740	Mongolia
12052	Bengbu Airport	BFU	Bengbu	0101000020E61000002A6D8DE27E545D4054209F86826C4040	China
12053	Rugao Air Base	RUG	Nantong	0101000020E6100000000000201B205E400000006002214040	China
12054	Wuhu Air Base	WHU	Wuhu	0101000020E610000060CAC0012D9A5D404ED1915CFE633F40	China
12056	Yingkou Lanqi Airport	YKH	Yingkou	0101000020E61000001E166A4DF3965E40C6A52A6D71454440	China
12057	Shenyang Dongta Airport	\\N	Shenyang	0101000020E610000000000080BEDF5E400000004067E44440	China
\.


--
-- Name: travelapp_airport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('travelapp_airport_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: travelapp_airport travelapp_airport_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY travelapp_airport
    ADD CONSTRAINT travelapp_airport_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: travelapp_airport_city_location_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX travelapp_airport_city_location_id ON travelapp_airport USING gist (city_location);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

