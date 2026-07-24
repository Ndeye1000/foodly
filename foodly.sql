--
-- PostgreSQL database dump
--

\restrict cOzccSLMhFp2IUUlTwe8JUtU3URRlfTw0WJzPfV5vX5s8ABnYMPTdLqyRUYt53W

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE foodly;
--
-- Name: foodly; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE foodly WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'French_Senegal.1252';


ALTER DATABASE foodly OWNER TO postgres;

\unrestrict cOzccSLMhFp2IUUlTwe8JUtU3URRlfTw0WJzPfV5vX5s8ABnYMPTdLqyRUYt53W
\connect foodly
\restrict cOzccSLMhFp2IUUlTwe8JUtU3URRlfTw0WJzPfV5vX5s8ABnYMPTdLqyRUYt53W

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: aliment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aliment (
    id integer NOT NULL,
    nom character varying(100) NOT NULL,
    marque character varying(100),
    sucre numeric,
    calories numeric NOT NULL,
    graisses numeric,
    proteines numeric,
    famille_id integer,
    reduction_id integer
);


ALTER TABLE public.aliment OWNER TO postgres;

--
-- Name: aliment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.aliment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.aliment_id_seq OWNER TO postgres;

--
-- Name: aliment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aliment_id_seq OWNED BY public.aliment.id;


--
-- Name: aliment_lieu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aliment_lieu (
    aliment_id integer NOT NULL,
    lieu_id integer NOT NULL
);


ALTER TABLE public.aliment_lieu OWNER TO postgres;

--
-- Name: appareil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.appareil (
    id integer NOT NULL,
    type character varying(100)
);


ALTER TABLE public.appareil OWNER TO postgres;

--
-- Name: appareil_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.appareil_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.appareil_id_seq OWNER TO postgres;

--
-- Name: appareil_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.appareil_id_seq OWNED BY public.appareil.id;


--
-- Name: famille; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.famille (
    id integer NOT NULL,
    nom character varying(100) NOT NULL
);


ALTER TABLE public.famille OWNER TO postgres;

--
-- Name: famille_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.famille_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.famille_id_seq OWNER TO postgres;

--
-- Name: famille_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.famille_id_seq OWNED BY public.famille.id;


--
-- Name: langue; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.langue (
    id integer NOT NULL,
    nom character varying(100) NOT NULL,
    code character varying(10)
);


ALTER TABLE public.langue OWNER TO postgres;

--
-- Name: langue_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.langue_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.langue_id_seq OWNER TO postgres;

--
-- Name: langue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.langue_id_seq OWNED BY public.langue.id;


--
-- Name: lieu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lieu (
    id integer NOT NULL,
    nom character varying(100) NOT NULL,
    type character varying(100) NOT NULL
);


ALTER TABLE public.lieu OWNER TO postgres;

--
-- Name: lieu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lieu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lieu_id_seq OWNER TO postgres;

--
-- Name: lieu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lieu_id_seq OWNED BY public.lieu.id;


--
-- Name: reduction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reduction (
    id integer NOT NULL,
    valeur character varying(100)
);


ALTER TABLE public.reduction OWNER TO postgres;

--
-- Name: reduction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reduction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reduction_id_seq OWNER TO postgres;

--
-- Name: reduction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reduction_id_seq OWNED BY public.reduction.id;


--
-- Name: somme_proteines; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.somme_proteines AS
 SELECT sum(proteines) AS somme
   FROM public.aliment;


ALTER VIEW public.somme_proteines OWNER TO postgres;

--
-- Name: somme_proteines_vw; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.somme_proteines_vw AS
 SELECT sum(proteines) AS somme
   FROM public.aliment;


ALTER VIEW public.somme_proteines_vw OWNER TO postgres;

--
-- Name: utilisateur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utilisateur (
    id integer NOT NULL,
    prenom character varying(100),
    email character varying(255) NOT NULL,
    langue_id integer
);


ALTER TABLE public.utilisateur OWNER TO postgres;

--
-- Name: utilisateur_aliment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utilisateur_aliment (
    utilisateur_id integer NOT NULL,
    aliment_id integer NOT NULL
);


ALTER TABLE public.utilisateur_aliment OWNER TO postgres;

--
-- Name: utilisateur_appareil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utilisateur_appareil (
    utilisateur_id integer NOT NULL,
    appareil_id integer NOT NULL
);


ALTER TABLE public.utilisateur_appareil OWNER TO postgres;

--
-- Name: utilisateur_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.utilisateur_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.utilisateur_id_seq OWNER TO postgres;

--
-- Name: utilisateur_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.utilisateur_id_seq OWNED BY public.utilisateur.id;


--
-- Name: aliment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aliment ALTER COLUMN id SET DEFAULT nextval('public.aliment_id_seq'::regclass);


--
-- Name: appareil id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appareil ALTER COLUMN id SET DEFAULT nextval('public.appareil_id_seq'::regclass);


--
-- Name: famille id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.famille ALTER COLUMN id SET DEFAULT nextval('public.famille_id_seq'::regclass);


--
-- Name: langue id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.langue ALTER COLUMN id SET DEFAULT nextval('public.langue_id_seq'::regclass);


--
-- Name: lieu id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lieu ALTER COLUMN id SET DEFAULT nextval('public.lieu_id_seq'::regclass);


--
-- Name: reduction id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reduction ALTER COLUMN id SET DEFAULT nextval('public.reduction_id_seq'::regclass);


--
-- Name: utilisateur id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilisateur ALTER COLUMN id SET DEFAULT nextval('public.utilisateur_id_seq'::regclass);


--
-- Data for Name: aliment; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.aliment VALUES (2, 'poire', 'sans marque', 27.5, 134, 0.2, 1.1, NULL, NULL);
INSERT INTO public.aliment VALUES (3, 'banane', 'chiquita', 24, 101, 0.3, 1.1, NULL, NULL);
INSERT INTO public.aliment VALUES (4, 'jambon', 'herta', 0.2, 34, 0.8, 6.6, NULL, NULL);
INSERT INTO public.aliment VALUES (5, 'compote', 'andros', 11, 51, 0, 0.5, NULL, NULL);
INSERT INTO public.aliment VALUES (6, 'steak hach‚', 'charal', 0.8, 68, 4.8, 4.8, NULL, NULL);
INSERT INTO public.aliment VALUES (7, 'saumon', 'guyader', 0, 206, 12.3, 22.1, NULL, NULL);
INSERT INTO public.aliment VALUES (9, 'riz', 'oncle benz', 28.2, 130, 0.3, 2.7, NULL, NULL);
INSERT INTO public.aliment VALUES (10, 'pƒtes completes', 'barilla', 64, 353, 2.7, 14, NULL, NULL);
INSERT INTO public.aliment VALUES (11, 'blanc de dinde', 'pŠre dodu', 0.6, 98, 0.9, 22, NULL, NULL);
INSERT INTO public.aliment VALUES (12, 'filet de poulet', 'le gaulois', 0, 121, 1.8, 26.2, NULL, NULL);
INSERT INTO public.aliment VALUES (13, 'muesli', 'bjorg', 26.5, 170, 5, 3.5, NULL, NULL);
INSERT INTO public.aliment VALUES (14, 'caf‚', 'carte noire', 0, 0, 0, 0, NULL, NULL);
INSERT INTO public.aliment VALUES (15, 'jus d orange', 'innocent', 16, 74, 0, 1.6, NULL, NULL);
INSERT INTO public.aliment VALUES (16, 'jus de pomme', 'andros', 24, 100, 0.2, 0.2, NULL, NULL);
INSERT INTO public.aliment VALUES (17, 'pomme de terre', 'dor‚ac', 21.1, 104, 0.2, 2.8, NULL, NULL);
INSERT INTO public.aliment VALUES (18, 'oeuf', 'naturalia', 0.4, 74, 5.1, 6.5, NULL, NULL);
INSERT INTO public.aliment VALUES (19, 'baguette', 'sans marque', 36.1, 185, 1.2, 7.5, NULL, NULL);
INSERT INTO public.aliment VALUES (20, 'lait d amande', 'bjorg', 6.1, 80, 5.3, 1.5, NULL, NULL);
INSERT INTO public.aliment VALUES (8, 'haricots verts', 'bonduelle', 5.8, 25, 0.1, 1.5, 1, NULL);
INSERT INTO public.aliment VALUES (1, 'pomme', 'sans marque', 19.1, 72, 0.2, 0.4, NULL, 1);


--
-- Data for Name: aliment_lieu; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.aliment_lieu VALUES (11, 1);


--
-- Data for Name: appareil; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: famille; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.famille VALUES (1, 'l‚gumes');


--
-- Data for Name: langue; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.langue VALUES (1, 'fran‡ais', NULL);
INSERT INTO public.langue VALUES (2, 'anglais', NULL);


--
-- Data for Name: lieu; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.lieu VALUES (1, 'Carrefour City', 'supermarch‚');


--
-- Data for Name: reduction; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.reduction VALUES (1, '20%');


--
-- Data for Name: utilisateur; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.utilisateur VALUES (1, 'quentin', 'qentin@gmail.com', 1);
INSERT INTO public.utilisateur VALUES (2, 'marie', 'marie@hotmail.fr', 1);
INSERT INTO public.utilisateur VALUES (3, 'vincent', 'vm@yahoo.com', 2);
INSERT INTO public.utilisateur VALUES (4, 'marc', 'marc@gmail.com', 2);
INSERT INTO public.utilisateur VALUES (5, 'pierre', 'pp@orange.fr', 1);
INSERT INTO public.utilisateur VALUES (6, 'lisa', 'lisadv@gmail.com', 1);
INSERT INTO public.utilisateur VALUES (7, '‚l‚onore', 'glunt@sfr.com', 1);
INSERT INTO public.utilisateur VALUES (8, 'henry', 'henry@outlook.fr', 2);
INSERT INTO public.utilisateur VALUES (9, 'lionel', 'hpp@gmail.com', 2);
INSERT INTO public.utilisateur VALUES (10, 'fabienne', 'fabienne@yopmail.com', 1);


--
-- Data for Name: utilisateur_aliment; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.utilisateur_aliment VALUES (1, 7);
INSERT INTO public.utilisateur_aliment VALUES (1, 3);
INSERT INTO public.utilisateur_aliment VALUES (1, 5);
INSERT INTO public.utilisateur_aliment VALUES (2, 2);
INSERT INTO public.utilisateur_aliment VALUES (2, 19);
INSERT INTO public.utilisateur_aliment VALUES (2, 14);
INSERT INTO public.utilisateur_aliment VALUES (3, 4);
INSERT INTO public.utilisateur_aliment VALUES (3, 15);
INSERT INTO public.utilisateur_aliment VALUES (3, 12);
INSERT INTO public.utilisateur_aliment VALUES (1, 17);
INSERT INTO public.utilisateur_aliment VALUES (4, 5);
INSERT INTO public.utilisateur_aliment VALUES (4, 4);
INSERT INTO public.utilisateur_aliment VALUES (4, 7);
INSERT INTO public.utilisateur_aliment VALUES (5, 1);
INSERT INTO public.utilisateur_aliment VALUES (5, 18);
INSERT INTO public.utilisateur_aliment VALUES (5, 3);
INSERT INTO public.utilisateur_aliment VALUES (6, 2);
INSERT INTO public.utilisateur_aliment VALUES (6, 12);
INSERT INTO public.utilisateur_aliment VALUES (6, 6);
INSERT INTO public.utilisateur_aliment VALUES (7, 16);
INSERT INTO public.utilisateur_aliment VALUES (7, 19);
INSERT INTO public.utilisateur_aliment VALUES (7, 1);
INSERT INTO public.utilisateur_aliment VALUES (8, 3);
INSERT INTO public.utilisateur_aliment VALUES (8, 5);
INSERT INTO public.utilisateur_aliment VALUES (9, 18);
INSERT INTO public.utilisateur_aliment VALUES (9, 9);
INSERT INTO public.utilisateur_aliment VALUES (9, 14);
INSERT INTO public.utilisateur_aliment VALUES (10, 16);
INSERT INTO public.utilisateur_aliment VALUES (10, 3);


--
-- Data for Name: utilisateur_appareil; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: aliment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aliment_id_seq', 5, true);


--
-- Name: appareil_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appareil_id_seq', 1, false);


--
-- Name: famille_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.famille_id_seq', 1, true);


--
-- Name: langue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.langue_id_seq', 1, false);


--
-- Name: lieu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lieu_id_seq', 1, true);


--
-- Name: reduction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reduction_id_seq', 1, true);


--
-- Name: utilisateur_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utilisateur_id_seq', 4, true);


--
-- Name: aliment_lieu aliment_lieu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aliment_lieu
    ADD CONSTRAINT aliment_lieu_pkey PRIMARY KEY (aliment_id, lieu_id);


--
-- Name: aliment aliment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aliment
    ADD CONSTRAINT aliment_pkey PRIMARY KEY (id);


--
-- Name: appareil appareil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appareil
    ADD CONSTRAINT appareil_pkey PRIMARY KEY (id);


--
-- Name: famille famille_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.famille
    ADD CONSTRAINT famille_pkey PRIMARY KEY (id);


--
-- Name: langue langue_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.langue
    ADD CONSTRAINT langue_pkey PRIMARY KEY (id);


--
-- Name: lieu lieu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lieu
    ADD CONSTRAINT lieu_pkey PRIMARY KEY (id);


--
-- Name: reduction reduction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reduction
    ADD CONSTRAINT reduction_pkey PRIMARY KEY (id);


--
-- Name: utilisateur_aliment utilisateur_aliment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilisateur_aliment
    ADD CONSTRAINT utilisateur_aliment_pkey PRIMARY KEY (utilisateur_id, aliment_id);


--
-- Name: utilisateur_appareil utilisateur_appareil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilisateur_appareil
    ADD CONSTRAINT utilisateur_appareil_pkey PRIMARY KEY (utilisateur_id, appareil_id);


--
-- Name: utilisateur utilisateur_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_email_key UNIQUE (email);


--
-- Name: utilisateur utilisateur_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_pkey PRIMARY KEY (id);


--
-- Name: aliment aliment_famille_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aliment
    ADD CONSTRAINT aliment_famille_id_fkey FOREIGN KEY (famille_id) REFERENCES public.famille(id);


--
-- Name: aliment_lieu aliment_lieu_aliment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aliment_lieu
    ADD CONSTRAINT aliment_lieu_aliment_id_fkey FOREIGN KEY (aliment_id) REFERENCES public.aliment(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: aliment_lieu aliment_lieu_lieu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aliment_lieu
    ADD CONSTRAINT aliment_lieu_lieu_id_fkey FOREIGN KEY (lieu_id) REFERENCES public.lieu(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: aliment aliment_reduction_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aliment
    ADD CONSTRAINT aliment_reduction_id_fkey FOREIGN KEY (reduction_id) REFERENCES public.reduction(id);


--
-- Name: utilisateur_aliment utilisateur_aliment_aliment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilisateur_aliment
    ADD CONSTRAINT utilisateur_aliment_aliment_id_fkey FOREIGN KEY (aliment_id) REFERENCES public.aliment(id);


--
-- Name: utilisateur_aliment utilisateur_aliment_utilisateur_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilisateur_aliment
    ADD CONSTRAINT utilisateur_aliment_utilisateur_id_fkey FOREIGN KEY (utilisateur_id) REFERENCES public.utilisateur(id);


--
-- Name: utilisateur_appareil utilisateur_appareil_appareil_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilisateur_appareil
    ADD CONSTRAINT utilisateur_appareil_appareil_id_fkey FOREIGN KEY (appareil_id) REFERENCES public.appareil(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: utilisateur_appareil utilisateur_appareil_utilisateur_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilisateur_appareil
    ADD CONSTRAINT utilisateur_appareil_utilisateur_id_fkey FOREIGN KEY (utilisateur_id) REFERENCES public.utilisateur(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: utilisateur utilisateur_langue_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_langue_id_fkey FOREIGN KEY (langue_id) REFERENCES public.langue(id);


--
-- PostgreSQL database dump complete
--

\unrestrict cOzccSLMhFp2IUUlTwe8JUtU3URRlfTw0WJzPfV5vX5s8ABnYMPTdLqyRUYt53W

