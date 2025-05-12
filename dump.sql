--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 17.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
-- SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: film; Type: TABLE; Schema: public; Owner: prac
--

CREATE TABLE public.film (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    title character varying NOT NULL,
    rating integer NOT NULL,
    director character varying NOT NULL,
    tags character varying NOT NULL,
    image character varying NOT NULL,
    cover character varying NOT NULL,
    about text,
    description text
);


ALTER TABLE public.film OWNER TO prac;

--
-- Name: films; Type: TABLE; Schema: public; Owner: prac
--

CREATE TABLE public.films (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    rating double precision NOT NULL,
    director character varying NOT NULL,
    tags text NOT NULL,
    image character varying NOT NULL,
    cover character varying NOT NULL,
    title character varying NOT NULL,
    about character varying NOT NULL,
    description character varying NOT NULL
);


ALTER TABLE public.films OWNER TO prac;

--
-- Name: schedule; Type: TABLE; Schema: public; Owner: prac
--

CREATE TABLE public.schedule (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    daytime timestamp with time zone NOT NULL,
    hall integer NOT NULL,
    price integer NOT NULL,
    rows integer NOT NULL,
    seats integer NOT NULL,
    taken text DEFAULT ''::text NOT NULL,
    "filmId" uuid NOT NULL
);


ALTER TABLE public.schedule OWNER TO prac;

--
-- Name: schedules; Type: TABLE; Schema: public; Owner: prac
--

CREATE TABLE public.schedules (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    daytime character varying NOT NULL,
    hall integer NOT NULL,
    rows integer NOT NULL,
    seats integer NOT NULL,
    price double precision NOT NULL,
    taken text NOT NULL,
    "filmId" uuid
);


ALTER TABLE public.schedules OWNER TO prac;

--
-- Data for Name: film; Type: TABLE DATA; Schema: public; Owner: prac
--

COPY public.film (id, title, rating, director, tags, image, cover, about, description) FROM stdin;
\.


--
-- Data for Name: films; Type: TABLE DATA; Schema: public; Owner: prac
--

COPY public.films (id, rating, director, tags, image, cover, title, about, description) FROM stdin;
92b8a2a7-ab6b-4fa9-915b-d27945865e39	8.1	Амелия Хьюз	Рекомендуемые	/bg6s.jpg	/bg6c.jpg	Сон в летний день	Фэнтези-фильм о группе друзей попавших в волшебный лес, где время остановилось.	Причудливый фэнтези-фильм, действие которого происходит в волшебном лесу, где время остановилось. Группа друзей натыкается на это заколдованное царство и поначалу проникается беззаботным духом обитателей, но потом друзьям приходится разойтись. А как встретиться снова, если нет ни времени, ни места встречи?
0354a762-8928-427f-81d7-1656f717f39c	9.5	Оливер Беннет	Рекомендуемые	/bg4s.jpg	/bg4c.jpg	Парадокс Нексуса	Фильм об эксперименте по соединению человеческих умов. Исследует вопросы неприкосновенности частной жизни, идентичности и самой природы человеческого сознания	В фильме исследуются последствия новаторского эксперимента по соединению человеческих умов. По мере развития проекта участники сталкиваются с вопросами неприкосновенности частной жизни, идентичности и самой природы человеческого сознания.
5b70cb1a-61c9-47b1-b207-31f9e89087ff	8.9	Лила Васкес	Рекомендуемые	/bg2s.jpg	/bg2c.jpg	Стражи Гримуара	Фэнтезийное приключение об истинном значении дружбы, мужества и силы знаний	Захватывающее фэнтезийное приключение, которое рассказывает о группе героев, которые должны защитить древний магический том от попадания в руки тёмного колдуна. История об истинном значении дружбы, мужества и силы знаний.
3bedbc5a-844b-40eb-9d77-83b104e0cf75	8.5	Элиза Уиттакер	Рекомендуемые	/bg5s.jpg	/bg5c.jpg	Звёздное путешествие	Научно-фантастический фильм о команде астронавтов, исследующий темы жизнестойкости, надежды и силы человеческих связей	«Звёздное путешествие» — прекрасный научно-фантастический фильм о команде астронавтов, путешествующих по галактике в поисках нового дома для человечества. Помимо потрясающей работы оператора и специалистов по визуальным эффектам, можно отметить темы, исследуемые в фильме: жизнестойкости, надежды и силы человеческих связей.
51b4bc85-646d-47fc-b988-3e7051a9fe9e	9	Харрисон Рид	Рекомендуемые	/bg3s.jpg	/bg3c.jpg	Недостижимая утопия	Провокационный фильм-антиутопия, исследующий темы свободы, контроля и цены совершенства.	Провокационный фильм-антиутопия режиссера Харрисона Рида. Действие фильма разворачивается в, казалось бы, идеальном обществе, и рассказывает о группе граждан, которые начинают подвергать сомнению систему. Фильм исследует темы свободы, контроля и цены совершенства.
0e33c7f6-27a7-4aa0-8e61-65d7e5effecf	2.9	Итан Райт	Документальный	/bg1s.jpg	/bg1c.jpg	Архитекторы общества	Документальный фильм, исследующий влияние искусственного интеллекта на общество и этические, философские и социальные последствия технологии.	Документальный фильм Итана Райта исследует влияние технологий на современное общество, уделяя особое внимание роли искусственного интеллекта в формировании нашего будущего. Фильм исследует этические, философские и социальные последствия гонки технологий ИИ и поднимает вопрос: какой мир мы создаём для будущих поколений.
\.


--
-- Data for Name: schedule; Type: TABLE DATA; Schema: public; Owner: prac
--

COPY public.schedule (id, daytime, hall, price, rows, seats, taken, "filmId") FROM stdin;
\.


--
-- Data for Name: schedules; Type: TABLE DATA; Schema: public; Owner: prac
--

COPY public.schedules (id, daytime, hall, rows, seats, price, taken, "filmId") FROM stdin;
a8af36c3-65ee-4224-a77d-c9ebb790ba66	2024-06-29T15:00:53+03:00	1	5	10	350		0e33c7f6-27a7-4aa0-8e61-65d7e5effecf
0cf8b68c-fcf2-4c0a-97ba-45990231fa0e	2024-06-29T17:00:53+03:00	2	5	10	350		0e33c7f6-27a7-4aa0-8e61-65d7e5effecf
2519ca34-32b4-4a7f-971d-3bb585c6450b	2024-06-30T12:00:53+03:00	0	5	10	350		0e33c7f6-27a7-4aa0-8e61-65d7e5effecf
b105ad4b-ecd2-4556-abaf-9a95403dc01c	2024-06-30T16:00:53+03:00	1	5	10	350		0e33c7f6-27a7-4aa0-8e61-65d7e5effecf
02a9feb2-fc92-4386-a917-aa79e7f8fd7f	2024-06-30T18:00:53+03:00	2	5	10	350		0e33c7f6-27a7-4aa0-8e61-65d7e5effecf
9647fcf2-d0fa-4e69-ad90-2b23cff15449	2024-06-28T10:00:53+03:00	0	5	10	350		51b4bc85-646d-47fc-b988-3e7051a9fe9e
9f2db237-01d0-463e-a150-89f30bfc4250	2024-06-28T14:00:53+03:00	1	5	10	350		51b4bc85-646d-47fc-b988-3e7051a9fe9e
3d5f5d12-b4d8-44d3-a440-1b91616fda40	2024-06-28T16:00:53+03:00	2	5	10	350		51b4bc85-646d-47fc-b988-3e7051a9fe9e
7f59de0d-62b2-412f-9e0b-bf6e971c44e5	2024-06-29T11:00:53+03:00	0	5	10	350		51b4bc85-646d-47fc-b988-3e7051a9fe9e
65f4a65e-1bc1-4677-842b-10e9b317b287	2024-06-29T15:00:53+03:00	1	5	10	350		51b4bc85-646d-47fc-b988-3e7051a9fe9e
b3ba6b69-050e-498c-9cdb-92711d8e4180	2024-06-29T17:00:53+03:00	2	5	10	350		51b4bc85-646d-47fc-b988-3e7051a9fe9e
d87ee9ab-4d84-43bb-85d6-f71aced22f73	2024-06-30T12:00:53+03:00	0	5	10	350		51b4bc85-646d-47fc-b988-3e7051a9fe9e
eed1469f-c95e-428a-870d-13cbfe4ac2ac	2024-06-30T16:00:53+03:00	1	5	10	350		51b4bc85-646d-47fc-b988-3e7051a9fe9e
68437c84-6c35-4203-bff7-021d16042a6b	2024-06-30T18:00:53+03:00	2	5	10	350		51b4bc85-646d-47fc-b988-3e7051a9fe9e
351b437c-3430-4a35-b71d-b93b3d80274a	2024-06-28T10:00:53+03:00	0	5	10	350		3bedbc5a-844b-40eb-9d77-83b104e0cf75
2661b7e2-7654-4d17-aa5d-9da76e4fb563	2024-06-28T14:00:53+03:00	1	5	10	350		3bedbc5a-844b-40eb-9d77-83b104e0cf75
d155ff3f-d547-4e4d-a530-bfcdcb3efbd5	2024-06-28T16:00:53+03:00	2	5	10	350		3bedbc5a-844b-40eb-9d77-83b104e0cf75
baf5d315-f3ad-4ebc-bbdc-544c51f3a2f3	2024-06-29T11:00:53+03:00	0	5	10	350		3bedbc5a-844b-40eb-9d77-83b104e0cf75
5a102896-b6ac-4db1-9f93-1653dde8a5f2	2024-06-29T15:00:53+03:00	1	5	10	350		3bedbc5a-844b-40eb-9d77-83b104e0cf75
c06b2048-a159-4356-b51b-3d7817766d02	2024-06-29T17:00:53+03:00	2	5	10	350		3bedbc5a-844b-40eb-9d77-83b104e0cf75
ee489a8b-68be-48a1-b62f-896981d60b06	2024-06-30T12:00:53+03:00	0	5	10	350		3bedbc5a-844b-40eb-9d77-83b104e0cf75
a33f5fda-c4d8-4a1b-9f86-cd39d73fdc98	2024-06-30T16:00:53+03:00	1	5	10	350		3bedbc5a-844b-40eb-9d77-83b104e0cf75
24074084-1d42-49ff-b0fb-e64029674718	2024-06-30T18:00:53+03:00	2	5	10	350		3bedbc5a-844b-40eb-9d77-83b104e0cf75
793009d6-030c-4dd4-8d13-9ba500724b38	2024-06-28T10:00:53+03:00	0	5	10	350	3:3,1:4,1:5,1:3,1:2	5b70cb1a-61c9-47b1-b207-31f9e89087ff
27a6c145-d5bf-4722-8bd9-b58c5b6b718f	2024-06-28T14:00:53+03:00	1	5	10	350		5b70cb1a-61c9-47b1-b207-31f9e89087ff
1f57131e-eb9c-41a2-b451-89ea7f691fb7	2024-06-28T16:00:53+03:00	2	5	10	350		5b70cb1a-61c9-47b1-b207-31f9e89087ff
bfd27e0e-3a21-465c-966c-c874da242875	2024-06-29T11:00:53+03:00	0	5	10	350	2:2,2:3	5b70cb1a-61c9-47b1-b207-31f9e89087ff
4ba7c6c6-33ba-4f1f-9a64-538d59d90c10	2024-06-29T15:00:53+03:00	1	5	10	350		5b70cb1a-61c9-47b1-b207-31f9e89087ff
e75cded8-ebad-4286-9e3e-b3e852916f8c	2024-06-29T17:00:53+03:00	2	5	10	350		5b70cb1a-61c9-47b1-b207-31f9e89087ff
516f87d0-8a36-4663-a079-1e9695b9a412	2024-06-30T12:00:53+03:00	0	5	10	350		5b70cb1a-61c9-47b1-b207-31f9e89087ff
3573d55b-9a7f-484b-a0e0-b204af6d86d0	2024-06-30T16:00:53+03:00	1	5	10	350		5b70cb1a-61c9-47b1-b207-31f9e89087ff
208ec902-8955-4a52-bdc3-a6ff04602ed9	2024-06-30T18:00:53+03:00	2	5	10	350		5b70cb1a-61c9-47b1-b207-31f9e89087ff
d3f54ca3-8e19-4b63-afd4-6a8d03933339	2024-06-28T10:00:53+03:00	0	5	10	350		0354a762-8928-427f-81d7-1656f717f39c
2d794723-eadc-43ea-b82b-268f0178fb43	2024-06-28T14:00:53+03:00	1	5	10	350		0354a762-8928-427f-81d7-1656f717f39c
043eb8fb-454a-40d2-9ce9-6fe80072bf8b	2024-06-28T16:00:53+03:00	2	5	10	350		0354a762-8928-427f-81d7-1656f717f39c
aa366df5-f035-43ec-8088-87e042110f3d	2024-06-29T11:00:53+03:00	0	5	10	350		0354a762-8928-427f-81d7-1656f717f39c
87b49000-5481-49d1-b481-b4f416f3e9bb	2024-06-29T15:00:53+03:00	1	5	10	350		0354a762-8928-427f-81d7-1656f717f39c
9c1bd824-2330-4a8e-ab9d-6ac2180c9c5e	2024-06-29T17:00:53+03:00	2	5	10	350		0354a762-8928-427f-81d7-1656f717f39c
20778761-4041-4a71-bf9f-0bfd63930ae8	2024-06-30T12:00:53+03:00	0	5	10	350		0354a762-8928-427f-81d7-1656f717f39c
2aa2877b-9c15-4f56-8eea-936cfda5890a	2024-06-30T16:00:53+03:00	1	5	10	350		0354a762-8928-427f-81d7-1656f717f39c
53d4d8a0-d79f-4485-b4ce-ffc3a75540cb	2024-06-30T18:00:53+03:00	2	5	10	350		0354a762-8928-427f-81d7-1656f717f39c
5274c89d-f39c-40f9-bea8-f22a22a50c8a	2024-06-28T10:00:53+03:00	0	5	10	350		92b8a2a7-ab6b-4fa9-915b-d27945865e39
3f7ed030-230c-4b06-bfc7-eeaee7f3f79b	2024-06-28T14:00:53+03:00	1	5	10	350		92b8a2a7-ab6b-4fa9-915b-d27945865e39
8e8c2627-4578-42b1-a59a-9ec4964a03e1	2024-06-28T16:00:53+03:00	2	5	10	350		92b8a2a7-ab6b-4fa9-915b-d27945865e39
940e657a-69fa-4f71-a48e-3c064dcb61fd	2024-06-29T11:00:53+03:00	0	5	10	350		92b8a2a7-ab6b-4fa9-915b-d27945865e39
ffde1149-dbc7-49b2-964d-a8de6a45709c	2024-06-29T15:00:53+03:00	1	5	10	350		92b8a2a7-ab6b-4fa9-915b-d27945865e39
6a0d0a68-2f74-4164-aac5-45e0e07adb86	2024-06-29T17:00:53+03:00	2	5	10	350		92b8a2a7-ab6b-4fa9-915b-d27945865e39
9d3d3914-ea59-46a0-80a2-4e320e82956a	2024-06-30T12:00:53+03:00	0	5	10	350		92b8a2a7-ab6b-4fa9-915b-d27945865e39
5c68663d-1a71-401c-9214-e79af571c347	2024-06-30T16:00:53+03:00	1	5	10	350		92b8a2a7-ab6b-4fa9-915b-d27945865e39
2644a72a-6f17-4c61-a405-9c48bb0ea682	2024-06-30T18:00:53+03:00	2	5	10	350		92b8a2a7-ab6b-4fa9-915b-d27945865e39
f2e429b0-685d-41f8-a8cd-1d8cb63b99ce	2024-06-28T10:00:53+03:00	0	5	10	350	1:1	0e33c7f6-27a7-4aa0-8e61-65d7e5effecf
5beec101-acbb-4158-adc6-d855716b44a8	2024-06-28T14:00:53+03:00	1	5	10	350	1:1	0e33c7f6-27a7-4aa0-8e61-65d7e5effecf
89ee32f3-8164-40a6-b237-f4d492450250	2024-06-28T16:00:53+03:00	2	5	10	350	1:1,1:2	0e33c7f6-27a7-4aa0-8e61-65d7e5effecf
d6a4ed9b-51d6-4df2-b66e-d75175deb373	2024-06-29T11:00:53+03:00	0	5	10	350	1:1,1:3	0e33c7f6-27a7-4aa0-8e61-65d7e5effecf
\.


--
-- Name: schedule PK_1c05e42aec7371641193e180046; Type: CONSTRAINT; Schema: public; Owner: prac
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT "PK_1c05e42aec7371641193e180046" PRIMARY KEY (id);


--
-- Name: film PK_37ec0ffe0011ccbe438a65e3c6e; Type: CONSTRAINT; Schema: public; Owner: prac
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT "PK_37ec0ffe0011ccbe438a65e3c6e" PRIMARY KEY (id);


--
-- Name: films PK_697487ada088902377482c970d1; Type: CONSTRAINT; Schema: public; Owner: prac
--

ALTER TABLE ONLY public.films
    ADD CONSTRAINT "PK_697487ada088902377482c970d1" PRIMARY KEY (id);


--
-- Name: schedules PK_7e33fc2ea755a5765e3564e66dd; Type: CONSTRAINT; Schema: public; Owner: prac
--

ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT "PK_7e33fc2ea755a5765e3564e66dd" PRIMARY KEY (id);


--
-- Name: schedules FK_1c2f5e637713a429f4854024a76; Type: FK CONSTRAINT; Schema: public; Owner: prac
--

ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT "FK_1c2f5e637713a429f4854024a76" FOREIGN KEY ("filmId") REFERENCES public.films(id);


--
-- Name: schedule FK_7876c96cecc19ed1e6bd2a76d24; Type: FK CONSTRAINT; Schema: public; Owner: prac
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT "FK_7876c96cecc19ed1e6bd2a76d24" FOREIGN KEY ("filmId") REFERENCES public.film(id);


--
-- PostgreSQL database dump complete
--

