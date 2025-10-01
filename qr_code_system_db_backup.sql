--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

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
-- Name: attendence; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attendence (
    attendence_id integer NOT NULL,
    session_id integer,
    student_reg text,
    student_sign text,
    device_id text,
    created_at timestamp without time zone DEFAULT now(),
    status text DEFAULT 'success'::text,
    device_name text
);


ALTER TABLE public.attendence OWNER TO postgres;

--
-- Name: attendence_attendece_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.attendence ALTER COLUMN attendence_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.attendence_attendece_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courses (
    course_id integer NOT NULL,
    course_name text,
    program_id integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.courses OWNER TO postgres;

--
-- Name: courses_course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.courses ALTER COLUMN course_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.courses_course_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: programs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.programs (
    program_id integer NOT NULL,
    program_name text NOT NULL
);


ALTER TABLE public.programs OWNER TO postgres;

--
-- Name: programs_program_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.programs ALTER COLUMN program_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.programs_program_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    session_id integer NOT NULL,
    timetable_id integer,
    created_at timestamp without time zone DEFAULT now(),
    expired_time integer,
    created_time timestamp without time zone DEFAULT now()
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: sessions_session_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.sessions ALTER COLUMN session_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.sessions_session_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff (
    staff_id integer NOT NULL,
    staff_name text
);


ALTER TABLE public.staff OWNER TO postgres;

--
-- Name: staff_staff_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.staff ALTER COLUMN staff_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.staff_staff_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    student_id integer NOT NULL,
    student_name text,
    student_reg text NOT NULL,
    course_id integer,
    student_password text,
    student_role text,
    year text DEFAULT 2023,
    program_id integer DEFAULT 1,
    student_level text
);


ALTER TABLE public.students OWNER TO postgres;

--
-- Name: students_student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.students ALTER COLUMN student_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.students_student_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: timetable; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.timetable (
    timetable_id integer NOT NULL,
    course_id integer,
    day text,
    date date,
    start_time time without time zone,
    end_time time without time zone,
    lecture_id integer,
    created_at timestamp without time zone DEFAULT now(),
    is_sessioned boolean DEFAULT false,
    class_year integer DEFAULT 2023 NOT NULL,
    program_id integer DEFAULT 0 NOT NULL,
    class_level text
);


ALTER TABLE public.timetable OWNER TO postgres;

--
-- Name: time_table_time_table_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.timetable ALTER COLUMN timetable_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.time_table_time_table_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: attendence; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attendence (attendence_id, session_id, student_reg, student_sign, device_id, created_at, status, device_name) FROM stdin;
19	2	30774/T.2023	j.m.mali	A1B2C3D4-E5F6-7890-1234-567890ABCDEF	2025-09-13 03:57:34.942139	success	iphone
21	90	30773/T.2023	gfh.fuj	9C:E5:3E:35:4A:F1:5B:18:1E:BB:D0:F8:9B:37:2F:B0:BC:26:13:A3:57:B8:DD:6C:9D:D5:E7:F4:84:E9:87:D7	2025-09-13 03:58:52.865373	success	a05m
36	93	\N	j.m.mali	A1B2C3D4-E5F6-7890-1234-567890ABCDEFfF	2025-09-13 07:05:26.543915	success	iphone
38	94	30773/T.2023	j.m.mali	A1B2C3D4-E5F6-7890-1234-567890ABCDEFfF	2025-09-13 07:30:16.481728	success	iphone
39	95	30773/T.2023	\N	A1B2C3D4-E5F6-7890-1234-567890ABCDEFfF	2025-09-13 07:33:39.972278	success	iphone
40	97	30773/T.2023	hdf.gyju	9C:E5:3E:35:4A:F1:5B:18:1E:BB:D0:F8:9B:37:2F:B0:BC:26:13:A3:57:B8:DD:6C:9D:D5:E7:F4:84:E9:87:D7	2025-09-13 07:39:34.533499	success	a05m
41	98	30773/T.2023	\N	A1B2C3D4-E5F6-7890-1234-567890ABCDEFfFf	2025-09-13 07:49:59.353684	success	iphone
42	99	30773/T.2023	\N	A1B2C3D4-E5F6-7890-1234-567890ABCDEFfF	2025-09-13 07:52:26.023175	success	iphone
44	99	30773/T.2023	\N	A1B2C3D4-E5F6-7890-1234-567890ABCDEFfFff	2025-09-13 07:59:08.733616	success	iphone
45	99	30773/T.2023	\N	A1B2C3D4-E5F6-7890-1234-567890ABCDEFfFfff	2025-09-13 08:00:40.568829	success	iphone
46	100	30773/T.2023	aaa.eug	9C:E5:3E:35:4A:F1:5B:18:1E:BB:D0:F8:9B:37:2F:B0:BC:26:13:A3:57:B8:DD:6C:9D:D5:E7:F4:84:E9:87:D7	2025-09-13 08:08:36.747903	success	a05m
47	101	30773/T.2023	yyh.djj	9C:E5:3E:35:4A:F1:5B:18:1E:BB:D0:F8:9B:37:2F:B0:BC:26:13:A3:57:B8:DD:6C:9D:D5:E7:F4:84:E9:87:D7	2025-09-13 08:19:31.322652	success	samsung
\.


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.courses (course_id, course_name, program_id) FROM stdin;
1	is123	1
2	IS 214	1
\.


--
-- Data for Name: programs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.programs (program_id, program_name) FROM stdin;
1	csn
2	ism
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (session_id, timetable_id, created_at, expired_time, created_time) FROM stdin;
2	4	2025-09-07 18:17:51.89985	5	2025-09-08 06:02:09.451753
8	14	2025-09-07 19:06:17.442308	\N	2025-09-08 06:02:09.451753
9	12	2025-09-08 05:37:09.879067	80	2025-09-08 06:02:09.451753
10	14	2025-09-11 16:37:45.06859	6	2025-09-11 16:37:45.06859
11	14	2025-09-11 16:54:07.735136	6	2025-09-11 16:54:07.735136
12	14	2025-09-11 16:54:08.849288	6	2025-09-11 16:54:08.849288
13	14	2025-09-11 16:54:09.894424	6	2025-09-11 16:54:09.894424
15	4	2025-09-11 16:54:33.183397	6	2025-09-11 16:54:33.183397
16	4	2025-09-11 16:58:42.326874	1	2025-09-11 16:58:42.326874
17	4	2025-09-11 17:01:09.889705	1	2025-09-11 17:01:09.889705
18	4	2025-09-11 17:07:31.619722	1	2025-09-11 17:07:31.619722
19	4	2025-09-11 17:08:06.838159	2	2025-09-11 17:08:06.838159
20	4	2025-09-11 17:13:25.792055	3	2025-09-11 17:13:25.792055
21	4	2025-09-11 17:23:25.56134	1	2025-09-11 17:23:25.56134
22	4	2025-09-11 17:25:51.170547	1	2025-09-11 17:25:51.170547
23	4	2025-09-11 17:26:49.151664	1	2025-09-11 17:26:49.151664
24	4	2025-09-11 17:27:36.791045	1	2025-09-11 17:27:36.791045
25	4	2025-09-11 17:32:10.981192	0	2025-09-11 17:32:10.981192
26	4	2025-09-11 17:32:22.285965	0	2025-09-11 17:32:22.285965
27	4	2025-09-11 17:33:18.465851	0	2025-09-11 17:33:18.465851
28	13	2025-09-11 17:33:36.06324	0	2025-09-11 17:33:36.06324
29	4	2025-09-11 17:43:57.295932	0	2025-09-11 17:43:57.295932
30	4	2025-09-11 17:44:02.501245	2	2025-09-11 17:44:02.501245
31	4	2025-09-13 01:27:23.855625	2	2025-09-13 01:27:23.855625
32	4	2025-09-13 01:29:31.982628	2	2025-09-13 01:29:31.982628
33	4	2025-09-13 01:31:18.765737	2	2025-09-13 01:31:18.765737
34	4	2025-09-13 01:40:31.502521	2	2025-09-13 01:40:31.502521
35	4	2025-09-13 01:45:40.710609	2	2025-09-13 01:45:40.710609
36	4	2025-09-13 01:51:07.90752	2	2025-09-13 01:51:07.90752
37	4	2025-09-13 02:05:06.5175	2	2025-09-13 02:05:06.5175
38	4	2025-09-13 02:10:46.972679	2	2025-09-13 02:10:46.972679
39	4	2025-09-13 02:13:42.259671	2	2025-09-13 02:13:42.259671
40	4	2025-09-13 02:18:42.327219	2	2025-09-13 02:18:42.327219
41	4	2025-09-13 02:22:43.366553	2	2025-09-13 02:22:43.366553
42	4	2025-09-13 02:25:29.61408	2	2025-09-13 02:25:29.61408
43	4	2025-09-13 02:27:56.573545	2	2025-09-13 02:27:56.573545
44	4	2025-09-13 02:35:10.931283	2	2025-09-13 02:35:10.931283
45	4	2025-09-13 02:38:33.138716	2	2025-09-13 02:38:33.138716
46	4	2025-09-13 02:41:36.835287	2	2025-09-13 02:41:36.835287
47	4	2025-09-13 02:45:32.267737	2	2025-09-13 02:45:32.267737
48	4	2025-09-13 02:47:38.472545	2	2025-09-13 02:47:38.472545
49	4	2025-09-13 02:51:54.764088	2	2025-09-13 02:51:54.764088
82	4	2025-09-13 03:04:56.748098	2	2025-09-13 03:04:56.748098
83	4	2025-09-13 03:16:02.772759	2	2025-09-13 03:16:02.772759
84	4	2025-09-13 03:17:20.865938	2	2025-09-13 03:17:20.865938
85	4	2025-09-13 03:23:21.808437	2	2025-09-13 03:23:21.808437
86	4	2025-09-13 03:25:42.749239	2	2025-09-13 03:25:42.749239
87	4	2025-09-13 03:28:34.983609	2	2025-09-13 03:28:34.983609
88	4	2025-09-13 03:33:43.30665	2	2025-09-13 03:33:43.30665
89	4	2025-09-13 03:37:09.303853	2	2025-09-13 03:37:09.303853
90	4	2025-09-13 03:58:44.367634	2	2025-09-13 03:58:44.367634
91	4	2025-09-13 06:46:29.962081	2	2025-09-13 06:46:29.962081
92	4	2025-09-13 06:49:41.574527	2	2025-09-13 06:49:41.574527
93	4	2025-09-13 07:05:10.651768	2	2025-09-13 07:05:10.651768
94	4	2025-09-13 07:29:02.150889	10	2025-09-13 07:29:02.150889
95	4	2025-09-13 07:33:20.076912	2	2025-09-13 07:33:20.076912
96	4	2025-09-13 07:38:15.451065	10	2025-09-13 07:38:15.451065
97	4	2025-09-13 07:39:01.766623	10	2025-09-13 07:39:01.766623
98	4	2025-09-13 07:49:52.058196	20	2025-09-13 07:49:52.058196
99	4	2025-09-13 07:51:46.822683	10	2025-09-13 07:51:46.822683
100	4	2025-09-13 08:08:23.796019	10	2025-09-13 08:08:23.796019
101	4	2025-09-13 08:19:22.590388	1	2025-09-13 08:19:22.590388
102	13	2025-09-22 13:18:33.059923	1	2025-09-22 13:18:33.059923
103	13	2025-09-22 13:22:14.618509	1	2025-09-22 13:22:14.618509
104	13	2025-09-22 13:32:57.63292	1	2025-09-22 13:32:57.63292
105	13	2025-09-22 13:38:16.430437	1	2025-09-22 13:38:16.430437
106	13	2025-09-22 13:40:40.584143	1	2025-09-22 13:40:40.584143
\.


--
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staff (staff_id, staff_name) FROM stdin;
1	alex
2	amada
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (student_id, student_name, student_reg, course_id, student_password, student_role, year, program_id, student_level) FROM stdin;
14	beno	30775/T.2023	2	beno123	\N	1	0	ism2
12	asha	30773/T.2023	2	asha123	CR	2022	1	ism1
13	juma	30774/T.2023	2	juma123	unroled	2024	1	ism1
\.


--
-- Data for Name: timetable; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.timetable (timetable_id, course_id, day, date, start_time, end_time, lecture_id, created_at, is_sessioned, class_year, program_id, class_level) FROM stdin;
14	2	tueday	2025-10-17	16:40:00	19:40:00	2	2025-09-07 21:51:10.939	f	0	1	\N
15	2	tueday	2025-10-17	16:40:00	19:40:00	2	2025-09-07 21:51:10.939	f	0	1	\N
16	2	tueday	2025-10-17	16:40:00	19:40:00	2	2025-09-07 21:51:10.939	f	0	1	\N
17	2	tueday	2025-10-17	16:40:00	19:40:00	2	2025-09-07 21:51:10.939	f	0	1	\N
18	2	tueday	2025-10-17	16:40:00	19:40:00	2	2025-09-07 21:51:10.939	f	0	1	\N
19	2	tueday	2025-10-17	16:40:00	19:40:00	2	2025-09-07 21:51:10.939	f	0	1	\N
20	2	tueday	2025-10-17	16:40:00	19:40:00	2	2025-09-07 21:51:10.939	f	0	1	\N
21	2	tueday	2025-10-17	16:40:00	19:40:00	2	2025-09-07 21:51:10.939	f	0	1	\N
22	2	tueday	2025-10-17	16:40:00	19:40:00	2	2025-09-07 21:51:10.939	f	0	1	\N
23	2	tueday	2025-10-17	16:40:00	19:40:00	2	2025-09-07 21:51:10.939	f	0	1	\N
25	2	tueday	2025-10-17	16:40:00	19:40:00	2	2025-09-07 21:51:10.939	f	0	1	\N
26	2	tueday	2025-10-17	16:40:00	19:40:00	2	2025-09-07 21:51:10.939	f	0	1	\N
27	1	friday	2025-10-19	16:40:00	19:40:00	2	2025-09-07 21:51:10.939	f	0	1	\N
24	2	tueday	2025-10-16	16:40:00	19:40:00	2	2025-09-07 21:51:10.939	f	0	1	\N
12	2	tueday	2025-10-17	16:40:00	19:40:00	2	2025-09-07 21:51:10.939	f	2023	1	ism2
4	2	monday	2025-09-17	17:40:00	18:40:00	1	2025-09-07 15:51:10.939513	t	2022	1	ism1
13	2	tueday	2025-10-19	16:40:00	19:40:00	2	2025-09-07 21:51:10.939	t	2022	1	ism1
\.


--
-- Name: attendence_attendece_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.attendence_attendece_id_seq', 47, true);


--
-- Name: courses_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.courses_course_id_seq', 2, true);


--
-- Name: programs_program_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.programs_program_id_seq', 2, true);


--
-- Name: sessions_session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sessions_session_id_seq', 106, true);


--
-- Name: staff_staff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_staff_id_seq', 2, true);


--
-- Name: students_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_student_id_seq', 14, true);


--
-- Name: time_table_time_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.time_table_time_table_id_seq', 28, true);


--
-- Name: attendence attendence_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendence
    ADD CONSTRAINT attendence_pkey PRIMARY KEY (attendence_id);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (course_id);


--
-- Name: programs programs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programs
    ADD CONSTRAINT programs_pkey PRIMARY KEY (program_id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (session_id);


--
-- Name: staff staff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (staff_id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (student_id);


--
-- Name: students students_student_reg_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_student_reg_key UNIQUE (student_reg);


--
-- Name: timetable time_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timetable
    ADD CONSTRAINT time_table_pkey PRIMARY KEY (timetable_id);


--
-- Name: attendence unique_session_device; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendence
    ADD CONSTRAINT unique_session_device UNIQUE (session_id, device_id);


--
-- Name: attendence attendence_session_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendence
    ADD CONSTRAINT attendence_session_id_fkey FOREIGN KEY (session_id) REFERENCES public.sessions(session_id) NOT VALID;


--
-- Name: attendence attendence_student_reg_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendence
    ADD CONSTRAINT attendence_student_reg_fkey FOREIGN KEY (student_reg) REFERENCES public.students(student_reg) NOT VALID;


--
-- Name: courses courses_program_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_program_id_fkey FOREIGN KEY (program_id) REFERENCES public.programs(program_id) NOT VALID;


--
-- Name: sessions sessions_timetable_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_timetable_id_fkey FOREIGN KEY (timetable_id) REFERENCES public.timetable(timetable_id) NOT VALID;


--
-- Name: students students_program_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_program_id_fkey FOREIGN KEY (program_id) REFERENCES public.programs(program_id) NOT VALID;


--
-- Name: students students_student_courseId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT "students_student_courseId_fkey" FOREIGN KEY (course_id) REFERENCES public.courses(course_id) NOT VALID;


--
-- Name: timetable time_table_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timetable
    ADD CONSTRAINT time_table_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(course_id) NOT VALID;


--
-- Name: timetable time_table_lecture_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timetable
    ADD CONSTRAINT time_table_lecture_id_fkey FOREIGN KEY (lecture_id) REFERENCES public.staff(staff_id) NOT VALID;


--
-- Name: timetable timetable_program_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timetable
    ADD CONSTRAINT timetable_program_id_fkey FOREIGN KEY (program_id) REFERENCES public.programs(program_id) NOT VALID;


--
-- PostgreSQL database dump complete
--

