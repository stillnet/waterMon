--
-- PostgreSQL database dump
--

-- Dumped from database version 11.8 (Ubuntu 11.8-1.pgdg19.10+1)
-- Dumped by pg_dump version 11.8 (Ubuntu 11.8-1.pgdg19.10+1)

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
-- Name: timescaledb; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS timescaledb WITH SCHEMA public;


--
-- Name: EXTENSION timescaledb; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION timescaledb IS 'Enables scalable inserts and complex queries for time-series data';


--
-- Name: fnshowercomplete(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fnshowercomplete() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
  PERFORM pg_notify('showerComplete', row_to_json(NEW)::text);
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.fnshowercomplete() OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: sump; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sump (
    "timestamp" timestamp with time zone NOT NULL,
    charging_ma smallint,
    battery_mv smallint,
    shunt_mv smallint,
    main_pump boolean,
    backup_pump boolean,
    depth_volts smallint
);


ALTER TABLE public.sump OWNER TO postgres;

--
-- Name: _hyper_1_10_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_10_chunk (
    CONSTRAINT constraint_10 CHECK ((("timestamp" >= '2020-02-12 18:00:00-06'::timestamp with time zone) AND ("timestamp" < '2020-02-19 18:00:00-06'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_10_chunk OWNER TO postgres;

--
-- Name: _hyper_1_11_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_11_chunk (
    CONSTRAINT constraint_11 CHECK ((("timestamp" >= '2020-02-19 18:00:00-06'::timestamp with time zone) AND ("timestamp" < '2020-02-26 18:00:00-06'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_11_chunk OWNER TO postgres;

--
-- Name: _hyper_1_12_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_12_chunk (
    CONSTRAINT constraint_12 CHECK ((("timestamp" >= '2020-02-26 18:00:00-06'::timestamp with time zone) AND ("timestamp" < '2020-03-04 18:00:00-06'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_12_chunk OWNER TO postgres;

--
-- Name: _hyper_1_13_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_13_chunk (
    CONSTRAINT constraint_13 CHECK ((("timestamp" >= '2020-03-04 18:00:00-06'::timestamp with time zone) AND ("timestamp" < '2020-03-11 19:00:00-05'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_13_chunk OWNER TO postgres;

--
-- Name: _hyper_1_14_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_14_chunk (
    CONSTRAINT constraint_14 CHECK ((("timestamp" >= '2020-03-11 19:00:00-05'::timestamp with time zone) AND ("timestamp" < '2020-03-18 19:00:00-05'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_14_chunk OWNER TO postgres;

--
-- Name: _hyper_1_15_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_15_chunk (
    CONSTRAINT constraint_15 CHECK ((("timestamp" >= '2020-03-18 19:00:00-05'::timestamp with time zone) AND ("timestamp" < '2020-03-25 19:00:00-05'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_15_chunk OWNER TO postgres;

--
-- Name: _hyper_1_16_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_16_chunk (
    CONSTRAINT constraint_16 CHECK ((("timestamp" >= '2020-03-25 19:00:00-05'::timestamp with time zone) AND ("timestamp" < '2020-04-01 19:00:00-05'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_16_chunk OWNER TO postgres;

--
-- Name: _hyper_1_17_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_17_chunk (
    CONSTRAINT constraint_17 CHECK ((("timestamp" >= '2020-04-01 19:00:00-05'::timestamp with time zone) AND ("timestamp" < '2020-04-08 19:00:00-05'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_17_chunk OWNER TO postgres;

--
-- Name: _hyper_1_18_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_18_chunk (
    CONSTRAINT constraint_18 CHECK ((("timestamp" >= '2020-04-08 19:00:00-05'::timestamp with time zone) AND ("timestamp" < '2020-04-15 19:00:00-05'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_18_chunk OWNER TO postgres;

--
-- Name: _hyper_1_19_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_19_chunk (
    CONSTRAINT constraint_19 CHECK ((("timestamp" >= '2020-04-15 19:00:00-05'::timestamp with time zone) AND ("timestamp" < '2020-04-22 19:00:00-05'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_19_chunk OWNER TO postgres;

--
-- Name: _hyper_1_1_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_1_chunk (
    CONSTRAINT constraint_1 CHECK ((("timestamp" >= '2019-12-11 18:00:00-06'::timestamp with time zone) AND ("timestamp" < '2019-12-18 18:00:00-06'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_1_chunk OWNER TO postgres;

--
-- Name: _hyper_1_20_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_20_chunk (
    CONSTRAINT constraint_20 CHECK ((("timestamp" >= '2020-04-22 19:00:00-05'::timestamp with time zone) AND ("timestamp" < '2020-04-29 19:00:00-05'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_20_chunk OWNER TO postgres;

--
-- Name: _hyper_1_21_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_21_chunk (
    CONSTRAINT constraint_21 CHECK ((("timestamp" >= '2020-04-29 19:00:00-05'::timestamp with time zone) AND ("timestamp" < '2020-05-06 19:00:00-05'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_21_chunk OWNER TO postgres;

--
-- Name: _hyper_1_22_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_22_chunk (
    CONSTRAINT constraint_22 CHECK ((("timestamp" >= '2020-05-06 19:00:00-05'::timestamp with time zone) AND ("timestamp" < '2020-05-13 19:00:00-05'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_22_chunk OWNER TO postgres;

--
-- Name: _hyper_1_23_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_23_chunk (
    CONSTRAINT constraint_23 CHECK ((("timestamp" >= '2020-05-13 19:00:00-05'::timestamp with time zone) AND ("timestamp" < '2020-05-20 19:00:00-05'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_23_chunk OWNER TO postgres;

--
-- Name: _hyper_1_24_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_24_chunk (
    CONSTRAINT constraint_24 CHECK ((("timestamp" >= '2020-05-20 19:00:00-05'::timestamp with time zone) AND ("timestamp" < '2020-05-27 19:00:00-05'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_24_chunk OWNER TO postgres;

--
-- Name: _hyper_1_25_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_25_chunk (
    CONSTRAINT constraint_25 CHECK ((("timestamp" >= '2020-05-27 19:00:00-05'::timestamp with time zone) AND ("timestamp" < '2020-06-03 19:00:00-05'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_25_chunk OWNER TO postgres;

--
-- Name: _hyper_1_26_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_26_chunk (
    CONSTRAINT constraint_26 CHECK ((("timestamp" >= '2020-06-10 19:00:00-05'::timestamp with time zone) AND ("timestamp" < '2020-06-17 19:00:00-05'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_26_chunk OWNER TO postgres;

--
-- Name: _hyper_1_27_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_27_chunk (
    CONSTRAINT constraint_27 CHECK ((("timestamp" >= '2020-06-24 19:00:00-05'::timestamp with time zone) AND ("timestamp" < '2020-07-01 19:00:00-05'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_27_chunk OWNER TO postgres;

--
-- Name: _hyper_1_28_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_28_chunk (
    CONSTRAINT constraint_28 CHECK ((("timestamp" >= '2020-07-01 19:00:00-05'::timestamp with time zone) AND ("timestamp" < '2020-07-08 19:00:00-05'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_28_chunk OWNER TO postgres;

--
-- Name: _hyper_1_29_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_29_chunk (
    CONSTRAINT constraint_29 CHECK ((("timestamp" >= '2020-07-08 19:00:00-05'::timestamp with time zone) AND ("timestamp" < '2020-07-15 19:00:00-05'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_29_chunk OWNER TO postgres;

--
-- Name: _hyper_1_2_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_2_chunk (
    CONSTRAINT constraint_2 CHECK ((("timestamp" >= '2019-12-18 18:00:00-06'::timestamp with time zone) AND ("timestamp" < '2019-12-25 18:00:00-06'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_2_chunk OWNER TO postgres;

--
-- Name: _hyper_1_30_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_30_chunk (
    CONSTRAINT constraint_30 CHECK ((("timestamp" >= '2020-07-15 19:00:00-05'::timestamp with time zone) AND ("timestamp" < '2020-07-22 19:00:00-05'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_30_chunk OWNER TO postgres;

--
-- Name: _hyper_1_31_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_31_chunk (
    CONSTRAINT constraint_31 CHECK ((("timestamp" >= '2020-07-22 19:00:00-05'::timestamp with time zone) AND ("timestamp" < '2020-07-29 19:00:00-05'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_31_chunk OWNER TO postgres;

--
-- Name: _hyper_1_32_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_32_chunk (
    CONSTRAINT constraint_32 CHECK ((("timestamp" >= '2020-07-29 19:00:00-05'::timestamp with time zone) AND ("timestamp" < '2020-08-05 19:00:00-05'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_32_chunk OWNER TO postgres;

--
-- Name: _hyper_1_33_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_33_chunk (
    CONSTRAINT constraint_33 CHECK ((("timestamp" >= '2020-08-05 19:00:00-05'::timestamp with time zone) AND ("timestamp" < '2020-08-12 19:00:00-05'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_33_chunk OWNER TO postgres;

--
-- Name: _hyper_1_34_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_34_chunk (
    CONSTRAINT constraint_34 CHECK ((("timestamp" >= '2020-08-12 19:00:00-05'::timestamp with time zone) AND ("timestamp" < '2020-08-19 19:00:00-05'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_34_chunk OWNER TO postgres;

--
-- Name: _hyper_1_35_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_35_chunk (
    CONSTRAINT constraint_35 CHECK ((("timestamp" >= '2020-08-19 19:00:00-05'::timestamp with time zone) AND ("timestamp" < '2020-08-26 19:00:00-05'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_35_chunk OWNER TO postgres;

--
-- Name: _hyper_1_36_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_36_chunk (
    CONSTRAINT constraint_36 CHECK ((("timestamp" >= '2020-08-26 19:00:00-05'::timestamp with time zone) AND ("timestamp" < '2020-09-02 19:00:00-05'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_36_chunk OWNER TO postgres;

--
-- Name: _hyper_1_37_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_37_chunk (
    CONSTRAINT constraint_37 CHECK ((("timestamp" >= '2020-09-02 19:00:00-05'::timestamp with time zone) AND ("timestamp" < '2020-09-09 19:00:00-05'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_37_chunk OWNER TO postgres;

--
-- Name: _hyper_1_38_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_38_chunk (
    CONSTRAINT constraint_38 CHECK ((("timestamp" >= '2020-10-07 19:00:00-05'::timestamp with time zone) AND ("timestamp" < '2020-10-14 19:00:00-05'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_38_chunk OWNER TO postgres;

--
-- Name: _hyper_1_39_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_39_chunk (
    CONSTRAINT constraint_39 CHECK ((("timestamp" >= '2020-10-14 19:00:00-05'::timestamp with time zone) AND ("timestamp" < '2020-10-21 19:00:00-05'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_39_chunk OWNER TO postgres;

--
-- Name: _hyper_1_3_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_3_chunk (
    CONSTRAINT constraint_3 CHECK ((("timestamp" >= '2019-12-25 18:00:00-06'::timestamp with time zone) AND ("timestamp" < '2020-01-01 18:00:00-06'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_3_chunk OWNER TO postgres;

--
-- Name: _hyper_1_40_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_40_chunk (
    CONSTRAINT constraint_40 CHECK ((("timestamp" >= '2020-10-21 19:00:00-05'::timestamp with time zone) AND ("timestamp" < '2020-10-28 19:00:00-05'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_40_chunk OWNER TO postgres;

--
-- Name: _hyper_1_41_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_41_chunk (
    CONSTRAINT constraint_41 CHECK ((("timestamp" >= '2020-10-28 19:00:00-05'::timestamp with time zone) AND ("timestamp" < '2020-11-04 18:00:00-06'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_41_chunk OWNER TO postgres;

--
-- Name: _hyper_1_42_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_42_chunk (
    CONSTRAINT constraint_42 CHECK ((("timestamp" >= '2020-11-04 18:00:00-06'::timestamp with time zone) AND ("timestamp" < '2020-11-11 18:00:00-06'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_42_chunk OWNER TO postgres;

--
-- Name: _hyper_1_43_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_43_chunk (
    CONSTRAINT constraint_43 CHECK ((("timestamp" >= '2020-11-11 18:00:00-06'::timestamp with time zone) AND ("timestamp" < '2020-11-18 18:00:00-06'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_43_chunk OWNER TO postgres;

--
-- Name: _hyper_1_44_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_44_chunk (
    CONSTRAINT constraint_44 CHECK ((("timestamp" >= '2020-11-18 18:00:00-06'::timestamp with time zone) AND ("timestamp" < '2020-11-25 18:00:00-06'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_44_chunk OWNER TO postgres;

--
-- Name: _hyper_1_45_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_45_chunk (
    CONSTRAINT constraint_45 CHECK ((("timestamp" >= '2020-11-25 18:00:00-06'::timestamp with time zone) AND ("timestamp" < '2020-12-02 18:00:00-06'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_45_chunk OWNER TO postgres;

--
-- Name: _hyper_1_46_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_46_chunk (
    CONSTRAINT constraint_46 CHECK ((("timestamp" >= '2020-12-02 18:00:00-06'::timestamp with time zone) AND ("timestamp" < '2020-12-09 18:00:00-06'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_46_chunk OWNER TO postgres;

--
-- Name: _hyper_1_47_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_47_chunk (
    CONSTRAINT constraint_47 CHECK ((("timestamp" >= '2020-12-09 18:00:00-06'::timestamp with time zone) AND ("timestamp" < '2020-12-16 18:00:00-06'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_47_chunk OWNER TO postgres;

--
-- Name: _hyper_1_48_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_48_chunk (
    CONSTRAINT constraint_48 CHECK ((("timestamp" >= '2020-12-16 18:00:00-06'::timestamp with time zone) AND ("timestamp" < '2020-12-23 18:00:00-06'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_48_chunk OWNER TO postgres;

--
-- Name: _hyper_1_49_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_49_chunk (
    CONSTRAINT constraint_49 CHECK ((("timestamp" >= '2020-12-23 18:00:00-06'::timestamp with time zone) AND ("timestamp" < '2020-12-30 18:00:00-06'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_49_chunk OWNER TO postgres;

--
-- Name: _hyper_1_4_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_4_chunk (
    CONSTRAINT constraint_4 CHECK ((("timestamp" >= '2020-01-01 18:00:00-06'::timestamp with time zone) AND ("timestamp" < '2020-01-08 18:00:00-06'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_4_chunk OWNER TO postgres;

--
-- Name: _hyper_1_50_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_50_chunk (
    CONSTRAINT constraint_50 CHECK ((("timestamp" >= '2020-12-30 18:00:00-06'::timestamp with time zone) AND ("timestamp" < '2021-01-06 18:00:00-06'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_50_chunk OWNER TO postgres;

--
-- Name: _hyper_1_5_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_5_chunk (
    CONSTRAINT constraint_5 CHECK ((("timestamp" >= '2020-01-08 18:00:00-06'::timestamp with time zone) AND ("timestamp" < '2020-01-15 18:00:00-06'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_5_chunk OWNER TO postgres;

--
-- Name: _hyper_1_6_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_6_chunk (
    CONSTRAINT constraint_6 CHECK ((("timestamp" >= '2020-01-15 18:00:00-06'::timestamp with time zone) AND ("timestamp" < '2020-01-22 18:00:00-06'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_6_chunk OWNER TO postgres;

--
-- Name: _hyper_1_7_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_7_chunk (
    CONSTRAINT constraint_7 CHECK ((("timestamp" >= '2020-01-22 18:00:00-06'::timestamp with time zone) AND ("timestamp" < '2020-01-29 18:00:00-06'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_7_chunk OWNER TO postgres;

--
-- Name: _hyper_1_8_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_8_chunk (
    CONSTRAINT constraint_8 CHECK ((("timestamp" >= '2020-01-29 18:00:00-06'::timestamp with time zone) AND ("timestamp" < '2020-02-05 18:00:00-06'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_8_chunk OWNER TO postgres;

--
-- Name: _hyper_1_9_chunk; Type: TABLE; Schema: _timescaledb_internal; Owner: postgres
--

CREATE TABLE _timescaledb_internal._hyper_1_9_chunk (
    CONSTRAINT constraint_9 CHECK ((("timestamp" >= '2020-02-05 18:00:00-06'::timestamp with time zone) AND ("timestamp" < '2020-02-12 18:00:00-06'::timestamp with time zone)))
)
INHERITS (public.sump);


ALTER TABLE _timescaledb_internal._hyper_1_9_chunk OWNER TO postgres;

--
-- Name: showers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.showers (
    showerid integer NOT NULL,
    start timestamp with time zone,
    "end" timestamp with time zone,
    "lastUpdate" timestamp with time zone
);


ALTER TABLE public.showers OWNER TO postgres;

--
-- Name: showers_showerid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.showers_showerid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.showers_showerid_seq OWNER TO postgres;

--
-- Name: showers_showerid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.showers_showerid_seq OWNED BY public.showers.showerid;


--
-- Name: showers_test; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.showers_test (
    showerid integer NOT NULL,
    start timestamp with time zone,
    "end" timestamp with time zone,
    "lastUpdate" timestamp with time zone
);


ALTER TABLE public.showers_test OWNER TO postgres;

--
-- Name: showers_test_showerid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.showers_test_showerid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.showers_test_showerid_seq OWNER TO postgres;

--
-- Name: showers_test_showerid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.showers_test_showerid_seq OWNED BY public.showers_test.showerid;


--
-- Name: waterflow; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.waterflow (
    "timestamp" timestamp with time zone NOT NULL,
    locationid smallint,
    flow_rate integer
);


ALTER TABLE public.waterflow OWNER TO postgres;

--
-- Name: showers showerid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.showers ALTER COLUMN showerid SET DEFAULT nextval('public.showers_showerid_seq'::regclass);


--
-- Name: showers_test showerid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.showers_test ALTER COLUMN showerid SET DEFAULT nextval('public.showers_test_showerid_seq'::regclass);


--
-- Name: showers showers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.showers
    ADD CONSTRAINT showers_pkey PRIMARY KEY (showerid);


--
-- Name: showers_test showers_test_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.showers_test
    ADD CONSTRAINT showers_test_pkey PRIMARY KEY (showerid);


--
-- Name: _hyper_1_10_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_10_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_10_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_11_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_11_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_11_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_12_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_12_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_12_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_13_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_13_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_13_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_14_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_14_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_14_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_15_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_15_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_15_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_16_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_16_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_16_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_17_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_17_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_17_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_18_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_18_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_18_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_19_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_19_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_19_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_1_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_1_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_1_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_20_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_20_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_20_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_21_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_21_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_21_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_22_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_22_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_22_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_23_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_23_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_23_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_24_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_24_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_24_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_25_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_25_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_25_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_26_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_26_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_26_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_27_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_27_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_27_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_28_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_28_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_28_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_29_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_29_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_29_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_2_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_2_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_2_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_30_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_30_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_30_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_31_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_31_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_31_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_32_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_32_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_32_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_33_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_33_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_33_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_34_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_34_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_34_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_35_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_35_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_35_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_36_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_36_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_36_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_37_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_37_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_37_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_38_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_38_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_38_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_39_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_39_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_39_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_3_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_3_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_3_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_40_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_40_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_40_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_41_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_41_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_41_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_42_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_42_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_42_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_43_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_43_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_43_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_44_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_44_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_44_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_45_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_45_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_45_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_46_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_46_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_46_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_47_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_47_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_47_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_48_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_48_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_48_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_49_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_49_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_49_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_4_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_4_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_4_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_50_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_50_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_50_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_5_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_5_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_5_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_6_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_6_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_6_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_7_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_7_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_7_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_8_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_8_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_8_chunk USING btree ("timestamp" DESC);


--
-- Name: _hyper_1_9_chunk_sump_timestamp_idx; Type: INDEX; Schema: _timescaledb_internal; Owner: postgres
--

CREATE INDEX _hyper_1_9_chunk_sump_timestamp_idx ON _timescaledb_internal._hyper_1_9_chunk USING btree ("timestamp" DESC);


--
-- Name: sump_timestamp_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sump_timestamp_idx ON public.sump USING btree ("timestamp" DESC);


--
-- Name: showers trshowercomplete; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trshowercomplete AFTER UPDATE ON public.showers FOR EACH ROW EXECUTE PROCEDURE public.fnshowercomplete();


--
-- Name: showers_test trshowercomplete; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trshowercomplete AFTER UPDATE ON public.showers_test FOR EACH ROW EXECUTE PROCEDURE public.fnshowercomplete();


--
-- Name: sump ts_insert_blocker; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER ts_insert_blocker BEFORE INSERT ON public.sump FOR EACH ROW EXECUTE PROCEDURE _timescaledb_internal.insert_blocker();


--
-- Name: TABLE sump; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.sump TO house;
GRANT SELECT ON TABLE public.sump TO housereader;


--
-- Name: TABLE showers; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.showers TO housereader;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.showers TO house;


--
-- Name: SEQUENCE showers_showerid_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.showers_showerid_seq TO house;


--
-- Name: TABLE showers_test; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.showers_test TO house;
GRANT SELECT ON TABLE public.showers_test TO housereader;


--
-- Name: TABLE waterflow; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.waterflow TO housereader;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.waterflow TO house;


--
-- PostgreSQL database dump complete
--

