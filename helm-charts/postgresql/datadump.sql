--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7 (Ubuntu 14.7-1.pgdg22.04+1)
-- Dumped by pg_dump version 16.2 (Ubuntu 16.2-1.pgdg22.04+1)

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: vusmart
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO vusmart;

--
-- Name: timescaledb; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS timescaledb WITH SCHEMA public;


--
-- Name: EXTENSION timescaledb; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION timescaledb IS 'Enables scalable inserts and complex queries for time-series data';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO core;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_group_id_seq OWNER TO core;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO core;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_group_permissions_id_seq OWNER TO core;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO core;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_permission_id_seq OWNER TO core;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO core;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO core;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_user_groups_id_seq OWNER TO core;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_user_id_seq OWNER TO core;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO core;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNER TO core;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: captcha_captchastore; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.captcha_captchastore (
    id integer NOT NULL,
    challenge character varying(32) NOT NULL,
    response character varying(32) NOT NULL,
    hashkey character varying(40) NOT NULL,
    expiration timestamp with time zone NOT NULL
);


ALTER TABLE public.captcha_captchastore OWNER TO core;

--
-- Name: captcha_captchastore_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.captcha_captchastore_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.captcha_captchastore_id_seq OWNER TO core;

--
-- Name: captcha_captchastore_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.captcha_captchastore_id_seq OWNED BY public.captcha_captchastore.id;


--
-- Name: defender_accessattempt; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.defender_accessattempt (
    id integer NOT NULL,
    user_agent character varying(255) NOT NULL,
    ip_address inet,
    username character varying(255),
    http_accept character varying(1025) NOT NULL,
    path_info character varying(255) NOT NULL,
    attempt_time timestamp with time zone NOT NULL,
    login_valid boolean NOT NULL
);


ALTER TABLE public.defender_accessattempt OWNER TO core;

--
-- Name: defender_accessattempt_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.defender_accessattempt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.defender_accessattempt_id_seq OWNER TO core;

--
-- Name: defender_accessattempt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.defender_accessattempt_id_seq OWNED BY public.defender_accessattempt.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.django_admin_log (
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


ALTER TABLE public.django_admin_log OWNER TO core;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_admin_log_id_seq OWNER TO core;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO core;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_content_type_id_seq OWNER TO core;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO core;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_migrations_id_seq OWNER TO core;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO core;

--
-- Name: event_correlation_eventcorrelationconfig; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.event_correlation_eventcorrelationconfig (
    id bigint NOT NULL,
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    workspace_id integer NOT NULL,
    data_models jsonb NOT NULL,
    correlation_profiles jsonb
);


ALTER TABLE public.event_correlation_eventcorrelationconfig OWNER TO core;

--
-- Name: event_correlation_eventcorrelationconfig_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

ALTER TABLE public.event_correlation_eventcorrelationconfig ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.event_correlation_eventcorrelationconfig_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: event_correlation_trialrun; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.event_correlation_trialrun (
    id bigint NOT NULL,
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    name character varying(100) NOT NULL,
    workspace_id integer NOT NULL,
    workspace_name character varying(100) NOT NULL,
    source_type character varying(10) NOT NULL,
    start_time timestamp with time zone,
    end_time timestamp with time zone,
    raw_events jsonb NOT NULL,
    residual_events jsonb NOT NULL,
    status character varying(10) NOT NULL
);


ALTER TABLE public.event_correlation_trialrun OWNER TO core;

--
-- Name: event_correlation_trialrun_correlated_events; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.event_correlation_trialrun_correlated_events (
    id integer NOT NULL,
    trialrun_id bigint NOT NULL,
    vusoftcorrelatedevents_id bigint NOT NULL
);


ALTER TABLE public.event_correlation_trialrun_correlated_events OWNER TO core;

--
-- Name: event_correlation_trialrun_correlated_events_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

ALTER TABLE public.event_correlation_trialrun_correlated_events ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.event_correlation_trialrun_correlated_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: event_correlation_trialrun_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

ALTER TABLE public.event_correlation_trialrun ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.event_correlation_trialrun_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: event_correlation_vusoftcorrelatedevents; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.event_correlation_vusoftcorrelatedevents (
    id bigint NOT NULL,
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    rule_identifier text,
    event_id character varying(100) NOT NULL,
    raw_event_ids jsonb,
    raw_events_details jsonb,
    summary character varying(4000),
    description character varying(4000),
    severity character varying(200) NOT NULL,
    notification_channel_info jsonb,
    start_time timestamp with time zone NOT NULL,
    end_time timestamp with time zone,
    last_updated_time timestamp with time zone,
    duration double precision,
    state character varying(200) NOT NULL,
    workspace_id integer NOT NULL,
    correlation_technique character varying(100),
    events_history jsonb,
    is_correlated boolean NOT NULL,
    correlation_type character varying(20) NOT NULL,
    additional_info jsonb,
    raw_events_tight_link_ids jsonb,
    raw_events_loose_link_ids jsonb,
    tags jsonb,
    insights_filled_up boolean DEFAULT false NOT NULL,
    instance_name character varying(1000),
    run_type character varying(50),
    similar_incidents jsonb,
    raw_events_subclusters jsonb,
    insights jsonb,
    root_cause text,
    recommended_actions text,
    is_standalone_3t boolean,
    work_status character varying(200),
    is_standalone_ml boolean,
    workspace_name text NOT NULL,
    is_rca_filled_up boolean DEFAULT false NOT NULL,
    related_dashboards text NOT NULL,
    source text,
    ticket_id character varying(100)
);


ALTER TABLE public.event_correlation_vusoftcorrelatedevents OWNER TO core;

--
-- Name: event_correlation_vusoftcorrelatedevents_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

ALTER TABLE public.event_correlation_vusoftcorrelatedevents ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.event_correlation_vusoftcorrelatedevents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: events_feedback; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.events_feedback (
    id integer NOT NULL,
    event_id text NOT NULL,
    event_type character varying(15),
    user_name text NOT NULL,
    feedback_type text,
    feedback_json jsonb NOT NULL,
    workspace_id integer
);


ALTER TABLE public.events_feedback OWNER TO core;

--
-- Name: events_feedback_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

ALTER TABLE public.events_feedback ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.events_feedback_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: events_rca_comments_feedback; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.events_rca_comments_feedback (
    id integer NOT NULL,
    event_id text NOT NULL,
    event_type text NOT NULL,
    comment text,
    feedback jsonb NOT NULL,
    rca_id text,
    action_type character varying(15),
    user_name text NOT NULL,
    feedback_type text,
    feedback_json jsonb NOT NULL,
    workspace_id integer
);


ALTER TABLE public.events_rca_comments_feedback OWNER TO core;

--
-- Name: events_rca_comments_feedback_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

ALTER TABLE public.events_rca_comments_feedback ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.events_rca_comments_feedback_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: groups; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.groups (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    permission_list character varying(1000) NOT NULL,
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    home_page text NOT NULL,
    mobile_home_page text NOT NULL,
    mobile_kpi text NOT NULL,
    search_string character varying(1000) NOT NULL
);


ALTER TABLE public.groups OWNER TO core;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.groups_id_seq OWNER TO core;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;


--
-- Name: guardian_groupobjectpermission; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.guardian_groupobjectpermission (
    id integer NOT NULL,
    object_pk character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.guardian_groupobjectpermission OWNER TO core;

--
-- Name: guardian_groupobjectpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

ALTER TABLE public.guardian_groupobjectpermission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.guardian_groupobjectpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: guardian_userobjectpermission; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.guardian_userobjectpermission (
    id integer NOT NULL,
    object_pk character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    permission_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.guardian_userobjectpermission OWNER TO core;

--
-- Name: guardian_userobjectpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

ALTER TABLE public.guardian_userobjectpermission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.guardian_userobjectpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: dbz_heartbeat; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.dbz_heartbeat (
    id integer NOT NULL,
    ts timestamp with time zone
);


ALTER TABLE public.dbz_heartbeat OWNER TO core;

--
-- Name: dbz_heartbeat_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.dbz_heartbeat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dbz_heartbeat_id_seq OWNER TO core;

--
-- Name: dbz_heartbeat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.dbz_heartbeat_id_seq OWNED BY public.dbz_heartbeat.id;


--
-- Name: metrics_metric; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.metrics_metric (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    category character varying(255) NOT NULL,
    subcategory character varying(255) NOT NULL
);


ALTER TABLE public.metrics_metric OWNER TO core;

--
-- Name: metrics_metric_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

ALTER TABLE public.metrics_metric ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.metrics_metric_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: metrics_metricitem; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.metrics_metricitem (
    id bigint NOT NULL,
    value double precision NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    metadata jsonb NOT NULL,
    metric_id bigint NOT NULL
);


ALTER TABLE public.metrics_metricitem OWNER TO core;

--
-- Name: metrics_metricitem_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

ALTER TABLE public.metrics_metricitem ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.metrics_metricitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: notification_config; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.notification_config (
    id bigint NOT NULL,
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    route_name text NOT NULL,
    route_category text NOT NULL,
    severity text,
    duration jsonb NOT NULL,
    last_updated_time timestamp with time zone NOT NULL,
    creation_time timestamp with time zone NOT NULL,
    channels jsonb NOT NULL,
    script text,
    category_fields jsonb
);


ALTER TABLE public.notification_config OWNER TO core;

--
-- Name: notification_config_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

ALTER TABLE public.notification_config ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.notification_config_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: oauth2_provider_accesstoken; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.oauth2_provider_accesstoken (
    id bigint NOT NULL,
    token character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    scope text NOT NULL,
    application_id bigint,
    user_id integer,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    source_refresh_token_id bigint
);


ALTER TABLE public.oauth2_provider_accesstoken OWNER TO core;

--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.oauth2_provider_accesstoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oauth2_provider_accesstoken_id_seq OWNER TO core;

--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.oauth2_provider_accesstoken_id_seq OWNED BY public.oauth2_provider_accesstoken.id;


--
-- Name: oauth2_provider_application; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.oauth2_provider_application (
    id bigint NOT NULL,
    client_id character varying(100) NOT NULL,
    redirect_uris text NOT NULL,
    client_type character varying(32) NOT NULL,
    authorization_grant_type character varying(32) NOT NULL,
    client_secret character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    user_id integer,
    skip_authorization boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);


ALTER TABLE public.oauth2_provider_application OWNER TO core;

--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.oauth2_provider_application_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oauth2_provider_application_id_seq OWNER TO core;

--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.oauth2_provider_application_id_seq OWNED BY public.oauth2_provider_application.id;


--
-- Name: oauth2_provider_grant; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.oauth2_provider_grant (
    id bigint NOT NULL,
    code character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    redirect_uri character varying(255) NOT NULL,
    scope text NOT NULL,
    application_id bigint NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    code_challenge character varying(128) NOT NULL,
    code_challenge_method character varying(10) NOT NULL
);


ALTER TABLE public.oauth2_provider_grant OWNER TO core;

--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.oauth2_provider_grant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oauth2_provider_grant_id_seq OWNER TO core;

--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.oauth2_provider_grant_id_seq OWNED BY public.oauth2_provider_grant.id;


--
-- Name: oauth2_provider_refreshtoken; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.oauth2_provider_refreshtoken (
    id bigint NOT NULL,
    token character varying(255) NOT NULL,
    access_token_id bigint,
    application_id bigint NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    revoked timestamp with time zone
);


ALTER TABLE public.oauth2_provider_refreshtoken OWNER TO core;

--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.oauth2_provider_refreshtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oauth2_provider_refreshtoken_id_seq OWNER TO core;

--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.oauth2_provider_refreshtoken_id_seq OWNED BY public.oauth2_provider_refreshtoken.id;


--
-- Name: vu_auth_provider_customsession; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vu_auth_provider_customsession (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL,
    access_token text
);


ALTER TABLE public.vu_auth_provider_customsession OWNER TO core;

--
-- Name: vu_auth_provider_dataaccesspolicy; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vu_auth_provider_dataaccesspolicy (
    bu_id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    tenant_id integer NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    id uuid NOT NULL,
    category character varying(100) NOT NULL,
    condition jsonb NOT NULL,
    keycloak_group_id uuid NOT NULL,
    must_match boolean NOT NULL,
    tables character varying(255)[] NOT NULL,
    type character varying(10) NOT NULL,
    wildcard_patterns character varying(100)[] NOT NULL,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.vu_auth_provider_dataaccesspolicy OWNER TO core;

--
-- Name: vu_auth_provider_usergroupmembership; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vu_auth_provider_usergroupmembership (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    group_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.vu_auth_provider_usergroupmembership OWNER TO core;

--
-- Name: vu_auth_provider_usergroupmembership_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

ALTER TABLE public.vu_auth_provider_usergroupmembership ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.vu_auth_provider_usergroupmembership_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: vu_auth_provider_userprofile; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vu_auth_provider_userprofile (
    id bigint NOT NULL,
    user_created_time date,
    last_login_time date,
    home_page text NOT NULL,
    mobile_home_page text NOT NULL,
    mobile_kpi text NOT NULL,
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    allow_console_login boolean NOT NULL,
    user_auth_type text NOT NULL,
    department text NOT NULL,
    user_id integer NOT NULL,
    keycloak_user_id uuid NOT NULL
);


ALTER TABLE public.vu_auth_provider_userprofile OWNER TO core;

--
-- Name: vu_auth_provider_userprofile_groups; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vu_auth_provider_userprofile_groups (
    id integer NOT NULL,
    userprofile_id bigint NOT NULL,
    groups_id bigint NOT NULL
);


ALTER TABLE public.vu_auth_provider_userprofile_groups OWNER TO core;

--
-- Name: vu_auth_provider_userprofile_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vu_auth_provider_userprofile_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vu_auth_provider_userprofile_groups_id_seq OWNER TO core;

--
-- Name: vu_auth_provider_userprofile_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vu_auth_provider_userprofile_groups_id_seq OWNED BY public.vu_auth_provider_userprofile_groups.id;


--
-- Name: vu_auth_provider_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vu_auth_provider_userprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vu_auth_provider_userprofile_id_seq OWNER TO core;

--
-- Name: vu_auth_provider_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vu_auth_provider_userprofile_id_seq OWNED BY public.vu_auth_provider_userprofile.id;


--
-- Name: vusoft_alertrule; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_alertrule (
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    alert_rule_id integer NOT NULL,
    title character varying(100) NOT NULL,
    summary text NOT NULL,
    description text NOT NULL,
    enabled boolean NOT NULL,
    config jsonb NOT NULL,
    created_at timestamp with time zone NOT NULL,
    created_by_id integer,
    updated_at timestamp with time zone NOT NULL,
    updated_by_id integer
);


ALTER TABLE public.vusoft_alertrule OWNER TO core;

--
-- Name: vusoft_alertrule_alert_rule_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_alertrule_alert_rule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_alertrule_alert_rule_id_seq OWNER TO core;

--
-- Name: vusoft_alertrule_alert_rule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_alertrule_alert_rule_id_seq OWNED BY public.vusoft_alertrule.alert_rule_id;


--
-- Name: vusoft_alertrule_owners; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_alertrule_owners (
    id integer NOT NULL,
    alertrule_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.vusoft_alertrule_owners OWNER TO core;

--
-- Name: vusoft_alertrule_owners_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

ALTER TABLE public.vusoft_alertrule_owners ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.vusoft_alertrule_owners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: vusoft_alertrules; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_alertrules (
    alert_id character varying(100) NOT NULL,
    alert_name character varying(200) NOT NULL,
    alert_json text NOT NULL
);


ALTER TABLE public.vusoft_alertrules OWNER TO core;

--
-- Name: vusoft_assetaudittrail; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_assetaudittrail (
    id character varying(121) NOT NULL,
    name character varying(60) NOT NULL,
    context character varying(60) NOT NULL,
    onboarded_at timestamp with time zone NOT NULL,
    first_data_received_at timestamp with time zone,
    latest_data_received_at timestamp with time zone,
    connectivity_verified_at timestamp with time zone,
    connected boolean NOT NULL,
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    asset_id integer NOT NULL
);


ALTER TABLE public.vusoft_assetaudittrail OWNER TO core;

--
-- Name: vusoft_datacollectionmethod; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_datacollectionmethod (
    dcm_id character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    agent_config_template text NOT NULL
);


ALTER TABLE public.vusoft_datacollectionmethod OWNER TO core;

--
-- Name: vusoft_datastreams; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_datastreams (
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    partitions integer NOT NULL,
    description character varying(100),
    advanced_settings text,
    retention_setting_in_mins integer,
    created_at timestamp with time zone NOT NULL,
    created_by_id integer,
    updated_at timestamp with time zone NOT NULL,
    updated_by_id integer
);


ALTER TABLE public.vusoft_datastreams OWNER TO core;

--
-- Name: vusoft_datastreams_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_datastreams_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_datastreams_id_seq OWNER TO core;

--
-- Name: vusoft_datastreams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_datastreams_id_seq OWNED BY public.vusoft_datastreams.id;


--
-- Name: vusoft_datastreamservicemapping; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_datastreamservicemapping (
    id integer NOT NULL,
    service_id character varying(100) NOT NULL,
    service_type character varying(100) NOT NULL,
    data_stream_id character varying(100),
    data_stream_type character varying(100)
);


ALTER TABLE public.vusoft_datastreamservicemapping OWNER TO core;

--
-- Name: vusoft_datastreamservicemapping_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_datastreamservicemapping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_datastreamservicemapping_id_seq OWNER TO core;

--
-- Name: vusoft_datastreamservicemapping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_datastreamservicemapping_id_seq OWNED BY public.vusoft_datastreamservicemapping.id;


--
-- Name: vusoft_hrmsdata; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_hrmsdata (
    id integer NOT NULL,
    username text NOT NULL,
    user_info text NOT NULL,
    hrms_search_string text NOT NULL,
    user_group character varying(25) NOT NULL,
    last_modified_time timestamp with time zone
);


ALTER TABLE public.vusoft_hrmsdata OWNER TO core;

--
-- Name: vusoft_hrmsdata_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_hrmsdata_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_hrmsdata_id_seq OWNER TO core;

--
-- Name: vusoft_hrmsdata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_hrmsdata_id_seq OWNED BY public.vusoft_hrmsdata.id;


--
-- Name: vusoft_hrmsmapping; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_hrmsmapping (
    name character varying(100) NOT NULL,
    mapping text NOT NULL
);


ALTER TABLE public.vusoft_hrmsmapping OWNER TO core;

--
-- Name: vusoft_insightcards; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_insightcards (
    bu_id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    tenant_id integer NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    insight_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    definitions text,
    insight_type character varying(100),
    insight_content text,
    script text,
    is_template boolean NOT NULL,
    created_by_id integer,
    updated_by_id integer,
    is_preloaded boolean NOT NULL
);


ALTER TABLE public.vusoft_insightcards OWNER TO core;

--
-- Name: vusoft_insightcards_insight_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

ALTER TABLE public.vusoft_insightcards ALTER COLUMN insight_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.vusoft_insightcards_insight_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: vusoft_insightcards_owners; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_insightcards_owners (
    id integer NOT NULL,
    insightcards_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.vusoft_insightcards_owners OWNER TO core;

--
-- Name: vusoft_insightcards_owners_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

ALTER TABLE public.vusoft_insightcards_owners ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.vusoft_insightcards_owners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: vusoft_logicalvublockmapping; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_logicalvublockmapping (
    target_id character varying(255) NOT NULL,
    target text NOT NULL,
    component_vublock text NOT NULL,
    logical_vublock text NOT NULL,
    logical_vublock_instance text NOT NULL
);


ALTER TABLE public.vusoft_logicalvublockmapping OWNER TO core;

--
-- Name: vusoft_mobiledashboard; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_mobiledashboard (
    id integer NOT NULL,
    bu_id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    tenant_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    status character varying(10) NOT NULL,
    visualizations jsonb NOT NULL,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.vusoft_mobiledashboard OWNER TO core;

--
-- Name: vusoft_mobiledashboard_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_mobiledashboard_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_mobiledashboard_id_seq OWNER TO core;

--
-- Name: vusoft_mobiledashboard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_mobiledashboard_id_seq OWNED BY public.vusoft_mobiledashboard.id;


--
-- Name: vusoft_sparkjobhistory; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_sparkjobhistory (
    id integer NOT NULL,
    app_name text NOT NULL,
    job_id text NOT NULL,
    start_time timestamp with time zone NOT NULL,
    end_time timestamp with time zone NOT NULL,
    job_status text NOT NULL,
    last_modified_time timestamp with time zone
);


ALTER TABLE public.vusoft_sparkjobhistory OWNER TO core;

--
-- Name: vusoft_sparkjobhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_sparkjobhistory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_sparkjobhistory_id_seq OWNER TO core;

--
-- Name: vusoft_sparkjobhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_sparkjobhistory_id_seq OWNED BY public.vusoft_sparkjobhistory.id;


--
-- Name: vusoft_storyboards; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_storyboards (
    storyboard_id character varying(100) NOT NULL,
    storyboard_name character varying(200) NOT NULL,
    storyboard_json text NOT NULL
);


ALTER TABLE public.vusoft_storyboards OWNER TO core;

--
-- Name: vusoft_utm; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_utm (
    id integer NOT NULL,
    bu_id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    tenant_id integer NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name character varying(100) NOT NULL,
    configuration jsonb NOT NULL,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.vusoft_utm OWNER TO core;

--
-- Name: vusoft_utm_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_utm_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_utm_id_seq OWNER TO core;

--
-- Name: vusoft_utm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_utm_id_seq OWNED BY public.vusoft_utm.id;


--
-- Name: vusoft_utm_owners; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_utm_owners (
    id integer NOT NULL,
    utm_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.vusoft_utm_owners OWNER TO core;

--
-- Name: vusoft_utm_owners_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

ALTER TABLE public.vusoft_utm_owners ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.vusoft_utm_owners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: vusoft_vublock; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vublock (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    icon character varying(255) NOT NULL,
    source_id_field character varying(255) NOT NULL,
    vublock_type character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    tags character varying(255)[] NOT NULL,
    story_boards jsonb[] NOT NULL,
    alert_rules jsonb[] NOT NULL,
    get_started_format character varying(255) NOT NULL,
    get_started_content text NOT NULL,
    fields jsonb[] NOT NULL,
    sources jsonb[] NOT NULL,
    agent_tab_name character varying(255) NOT NULL,
    agent_tab_meta_data jsonb NOT NULL,
    agent_configuration_required boolean NOT NULL,
    wizard_meta_data jsonb NOT NULL,
    error_logs character varying(255)[] NOT NULL
);


ALTER TABLE public.vusoft_vublock OWNER TO core;

--
-- Name: vusoft_vublockalertruleconfigs; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vublockalertruleconfigs (
    id integer NOT NULL,
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    vublock_id character varying(250) NOT NULL,
    vublock_version character varying(120) NOT NULL,
    base_alert_rule_def jsonb NOT NULL,
    active_alert_rule_id integer
);


ALTER TABLE public.vusoft_vublockalertruleconfigs OWNER TO core;

--
-- Name: vusoft_vublockalertruleconfigs_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

ALTER TABLE public.vusoft_vublockalertruleconfigs ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.vusoft_vublockalertruleconfigs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: vusoft_vublockalertrules; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vublockalertrules (
    id integer NOT NULL,
    vublock_id character varying(100) NOT NULL,
    alert_id character varying(100) NOT NULL
);


ALTER TABLE public.vusoft_vublockalertrules OWNER TO core;

--
-- Name: vusoft_vublockalertrules_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vublockalertrules_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vublockalertrules_id_seq OWNER TO core;

--
-- Name: vusoft_vublockalertrules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vublockalertrules_id_seq OWNED BY public.vusoft_vublockalertrules.id;


--
-- Name: vusoft_vublockdashboardconfigs; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vublockdashboardconfigs (
    id integer NOT NULL,
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    vublock_id character varying(250) NOT NULL,
    vublock_version character varying(120) NOT NULL,
    base_dashboard_def jsonb NOT NULL,
    active_dashboard_uid character varying(120),
    title character varying(250) NOT NULL
);


ALTER TABLE public.vusoft_vublockdashboardconfigs OWNER TO core;

--
-- Name: vusoft_vublockdashboardconfigs_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

ALTER TABLE public.vusoft_vublockdashboardconfigs ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.vusoft_vublockdashboardconfigs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: vusoft_vublockdatamodelconfigs; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vublockdatamodelconfigs (
    id integer NOT NULL,
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    vublock_id character varying(250) NOT NULL,
    vublock_version character varying(120) NOT NULL,
    base_datamodel_def jsonb NOT NULL,
    active_datamodel_id character varying(120),
    title character varying(250) NOT NULL
);


ALTER TABLE public.vusoft_vublockdatamodelconfigs OWNER TO core;

--
-- Name: vusoft_vublockdatamodelconfigs_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

ALTER TABLE public.vusoft_vublockdatamodelconfigs ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.vusoft_vublockdatamodelconfigs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: vusoft_vublockdatasources; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vublockdatasources (
    id integer NOT NULL,
    vublock_id character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    type text NOT NULL,
    description text NOT NULL,
    data_collection_method_id character varying(100) NOT NULL
);


ALTER TABLE public.vusoft_vublockdatasources OWNER TO core;

--
-- Name: vusoft_vublockdatasources_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vublockdatasources_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vublockdatasources_id_seq OWNER TO core;

--
-- Name: vusoft_vublockdatasources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vublockdatasources_id_seq OWNED BY public.vusoft_vublockdatasources.id;


--
-- Name: vusoft_vublockdatastreamsconfigs; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vublockdatastreamsconfigs (
    id integer NOT NULL,
    vublock_id character varying(100) NOT NULL,
    enrichment_data text,
    pipelines bytea,
    sink_connectors bytea
);


ALTER TABLE public.vusoft_vublockdatastreamsconfigs OWNER TO core;

--
-- Name: vusoft_vublockdatastreamsconfigs_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vublockdatastreamsconfigs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vublockdatastreamsconfigs_id_seq OWNER TO core;

--
-- Name: vusoft_vublockdatastreamsconfigs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vublockdatastreamsconfigs_id_seq OWNED BY public.vusoft_vublockdatastreamsconfigs.id;


--
-- Name: vusoft_vublockdiagnostic; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vublockdiagnostic (
    id integer NOT NULL,
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    vublock_id character varying(50) NOT NULL,
    source_id character varying(50) NOT NULL,
    source_value character varying(50) NOT NULL,
    duration integer,
    start_time timestamp with time zone NOT NULL,
    end_time timestamp with time zone,
    status character varying(50),
    created_by_id integer
);


ALTER TABLE public.vusoft_vublockdiagnostic OWNER TO core;

--
-- Name: vusoft_vublockdiagnostic_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

ALTER TABLE public.vusoft_vublockdiagnostic ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.vusoft_vublockdiagnostic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: vusoft_vublockfields; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vublockfields (
    id integer NOT NULL,
    vublock_id character varying(100) NOT NULL,
    field_id character varying(100) NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    type text NOT NULL,
    index text NOT NULL,
    source text NOT NULL,
    unit text NOT NULL
);


ALTER TABLE public.vusoft_vublockfields OWNER TO core;

--
-- Name: vusoft_vublockfields_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vublockfields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vublockfields_id_seq OWNER TO core;

--
-- Name: vusoft_vublockfields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vublockfields_id_seq OWNED BY public.vusoft_vublockfields.id;


--
-- Name: vusoft_vublockgoldensignals; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vublockgoldensignals (
    id integer NOT NULL,
    vublock_id character varying(100) NOT NULL,
    goldensignal_id character varying(100) NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    type text NOT NULL,
    index text NOT NULL,
    source text NOT NULL,
    unit text NOT NULL
);


ALTER TABLE public.vusoft_vublockgoldensignals OWNER TO core;

--
-- Name: vusoft_vublockgoldensignals_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vublockgoldensignals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vublockgoldensignals_id_seq OWNER TO core;

--
-- Name: vusoft_vublockgoldensignals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vublockgoldensignals_id_seq OWNED BY public.vusoft_vublockgoldensignals.id;


--
-- Name: vusoft_vublockjinjatemplate; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vublockjinjatemplate (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content text NOT NULL,
    vublock_id character varying(255) NOT NULL
);


ALTER TABLE public.vusoft_vublockjinjatemplate OWNER TO core;

--
-- Name: vusoft_vublockjinjatemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

ALTER TABLE public.vusoft_vublockjinjatemplate ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.vusoft_vublockjinjatemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: vusoft_vublockservicediagnostic; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vublockservicediagnostic (
    id integer NOT NULL,
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    vublock_id character varying(50) NOT NULL,
    source_id character varying(50) NOT NULL,
    source_value character varying(50) NOT NULL,
    service_name character varying(50) NOT NULL,
    service_type character varying(50) NOT NULL,
    type character varying(50) NOT NULL,
    stage character varying(50) NOT NULL,
    status character varying(50),
    last_modifed_at timestamp with time zone NOT NULL,
    diagnostic_id integer NOT NULL
);


ALTER TABLE public.vusoft_vublockservicediagnostic OWNER TO core;

--
-- Name: vusoft_vublockservicediagnostic_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

ALTER TABLE public.vusoft_vublockservicediagnostic ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.vusoft_vublockservicediagnostic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: vusoft_vublocksource; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vublocksource (
    bu_id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    tenant_id integer NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    id character varying(255) NOT NULL,
    source_name character varying(255) NOT NULL,
    type character varying(50) NOT NULL,
    description text NOT NULL,
    run_in_shipper character varying(255) NOT NULL,
    deployment_template character varying(255),
    enabled character varying(255) NOT NULL,
    tags jsonb NOT NULL,
    fields jsonb NOT NULL,
    jinja_service_mapping jsonb NOT NULL,
    vublock_diagnostic_meta jsonb,
    collector jsonb NOT NULL,
    vublock_id character varying(255) NOT NULL,
    source_id_field character varying(255) NOT NULL,
    source_id_value character varying(255) NOT NULL,
    asset_count integer NOT NULL,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.vusoft_vublocksource OWNER TO core;

--
-- Name: vusoft_vublockstoryboards; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vublockstoryboards (
    id integer NOT NULL,
    vublock_id character varying(100) NOT NULL,
    storyboard_id character varying(100) NOT NULL
);


ALTER TABLE public.vusoft_vublockstoryboards OWNER TO core;

--
-- Name: vusoft_vublockstoryboards_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vublockstoryboards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vublockstoryboards_id_seq OWNER TO core;

--
-- Name: vusoft_vublockstoryboards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vublockstoryboards_id_seq OWNED BY public.vusoft_vublockstoryboards.id;


--
-- Name: vusoft_vublocktopicdiagnostic; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vublocktopicdiagnostic (
    id integer NOT NULL,
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    vublock_id character varying(50) NOT NULL,
    source_id character varying(50) NOT NULL,
    source_value character varying(50) NOT NULL,
    topic_name character varying(50) NOT NULL,
    data jsonb,
    type character varying(50) NOT NULL,
    status character varying(50) NOT NULL,
    last_modifed_at timestamp with time zone NOT NULL,
    diagnostic_id integer NOT NULL
);


ALTER TABLE public.vusoft_vublocktopicdiagnostic OWNER TO core;

--
-- Name: vusoft_vublocktopicdiagnostic_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

ALTER TABLE public.vusoft_vublocktopicdiagnostic ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.vusoft_vublocktopicdiagnostic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: vusoft_vudatalakejob; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vudatalakejob (
    id integer NOT NULL,
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    job_id text NOT NULL,
    job_status text NOT NULL,
    description text NOT NULL,
    namespace text NOT NULL,
    "table" text NOT NULL,
    timestamp_column text NOT NULL,
    from_time timestamp with time zone NOT NULL,
    to_time timestamp with time zone NOT NULL,
    sql_filter text,
    advanced_settings text,
    last_modified_time timestamp with time zone,
    last_modified_by character varying(100)
);


ALTER TABLE public.vusoft_vudatalakejob OWNER TO core;

--
-- Name: vusoft_vudatalakejob_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vudatalakejob_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vudatalakejob_id_seq OWNER TO core;

--
-- Name: vusoft_vudatalakejob_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vudatalakejob_id_seq OWNED BY public.vusoft_vudatalakejob.id;


--
-- Name: vusoft_vusoftagentdetails; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftagentdetails (
    id integer NOT NULL,
    tenant_id integer NOT NULL,
    agent_ip text NOT NULL,
    version_num integer NOT NULL,
    handshake_time timestamp with time zone NOT NULL
);


ALTER TABLE public.vusoft_vusoftagentdetails OWNER TO core;

--
-- Name: vusoft_vusoftagentdetails_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftagentdetails_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftagentdetails_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftagentdetails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftagentdetails_id_seq OWNED BY public.vusoft_vusoftagentdetails.id;


--
-- Name: vusoft_vusoftalertmetadata; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftalertmetadata (
    id integer NOT NULL,
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    name character varying(100) NOT NULL,
    grouping_values character varying(200),
    last_modification_time timestamp with time zone,
    index_update_time timestamp with time zone,
    start_time timestamp with time zone,
    observation_time timestamp with time zone,
    throttle_time timestamp with time zone,
    alarm_state character varying(32) NOT NULL,
    alert_id character varying(40) NOT NULL,
    ticket_id character varying(32) NOT NULL,
    alert_doc character varying(16384) NOT NULL,
    history character varying(4096) NOT NULL,
    duration integer NOT NULL,
    channel_last_update_time character varying(512) NOT NULL,
    channel_info text NOT NULL,
    no_bucket_count integer NOT NULL,
    correlation_state character varying(512) NOT NULL,
    is_notification_sent boolean NOT NULL
);


ALTER TABLE public.vusoft_vusoftalertmetadata OWNER TO core;

--
-- Name: vusoft_vusoftalertmetadata_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftalertmetadata_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftalertmetadata_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftalertmetadata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftalertmetadata_id_seq OWNED BY public.vusoft_vusoftalertmetadata.id;


--
-- Name: vusoft_vusoftasset; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftasset (
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    topology_id character varying(100) NOT NULL,
    node_id integer NOT NULL,
    last_modified_time timestamp with time zone NOT NULL,
    addition_method character varying(50) NOT NULL,
    system_ip character varying(100) NOT NULL,
    credential_name character varying(100) NOT NULL,
    type_of_discovery character varying(100) NOT NULL,
    vendor_name character varying(100) NOT NULL,
    device_name character varying(200) NOT NULL,
    device_type character varying(100) NOT NULL,
    interface_list text NOT NULL,
    port_list text NOT NULL,
    enriched_data text NOT NULL,
    location character varying(100) NOT NULL,
    serial_number character varying(100) NOT NULL,
    contact_details character varying(100) NOT NULL,
    subnet character varying(100) NOT NULL,
    maintenance_mode boolean NOT NULL,
    tags text NOT NULL,
    last_scan_time timestamp with time zone,
    last_scan_id character varying(100) NOT NULL,
    ip_address text NOT NULL,
    cred_type character varying(100) NOT NULL,
    "OS" character varying(100) NOT NULL,
    application character varying(100) NOT NULL,
    branch character varying(100) NOT NULL,
    region character varying(100) NOT NULL,
    zone character varying(100) NOT NULL,
    creation_time timestamp with time zone NOT NULL,
    parent_router_ip character varying(100) NOT NULL,
    device_model character varying(100) NOT NULL,
    total_ips_in_subnet integer NOT NULL,
    used_ip_in_subnet integer NOT NULL,
    last_scan_name character varying(100) NOT NULL,
    dcm_credential character varying(100) NOT NULL,
    dcm_credential_type character varying(100) NOT NULL,
    dcm_enabled boolean NOT NULL,
    dcm_error_message text,
    dcm_groups text,
    dcm_status boolean NOT NULL,
    decomissioned_by character varying(100),
    last_action character varying(100) NOT NULL,
    last_modified_by character varying(100),
    monitoring_enabled boolean NOT NULL,
    monitoring_error_message text,
    monitoring_groups text,
    monitoring_status boolean NOT NULL,
    on_boarded_user character varying(100),
    pending_action integer NOT NULL,
    status character varying(100) NOT NULL,
    vunet_device_model character varying(100),
    decommissioned_time timestamp with time zone,
    uptime character varying(100)
);


ALTER TABLE public.vusoft_vusoftasset OWNER TO core;

--
-- Name: vusoft_vusoftasset_node_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftasset_node_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftasset_node_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftasset_node_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftasset_node_id_seq OWNED BY public.vusoft_vusoftasset.node_id;


--
-- Name: vusoft_vusoftassetgroup; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftassetgroup (
    group_id integer NOT NULL,
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    asset_group_name character varying(100) NOT NULL,
    description text NOT NULL,
    modified_by character varying(100),
    modified_at timestamp with time zone NOT NULL
);


ALTER TABLE public.vusoft_vusoftassetgroup OWNER TO core;

--
-- Name: vusoft_vusoftassetgroup_assets; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftassetgroup_assets (
    id integer NOT NULL,
    vusoftassetgroup_id integer NOT NULL,
    vusoftasset_id integer NOT NULL
);


ALTER TABLE public.vusoft_vusoftassetgroup_assets OWNER TO core;

--
-- Name: vusoft_vusoftassetgroup_assets_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftassetgroup_assets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftassetgroup_assets_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftassetgroup_assets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftassetgroup_assets_id_seq OWNED BY public.vusoft_vusoftassetgroup_assets.id;


--
-- Name: vusoft_vusoftassetgroup_group_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftassetgroup_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftassetgroup_group_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftassetgroup_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftassetgroup_group_id_seq OWNED BY public.vusoft_vusoftassetgroup.group_id;


--
-- Name: vusoft_vusoftauto_remediation_script_track; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftauto_remediation_script_track (
    id integer NOT NULL,
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    script_id character varying(100) NOT NULL,
    alert_id character varying(100) NOT NULL,
    template_id character varying(100) NOT NULL,
    template_name character varying(100),
    start_time timestamp with time zone NOT NULL,
    completion_time text,
    status text
);


ALTER TABLE public.vusoft_vusoftauto_remediation_script_track OWNER TO core;

--
-- Name: vusoft_vusoftauto_remediation_script_track_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftauto_remediation_script_track_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftauto_remediation_script_track_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftauto_remediation_script_track_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftauto_remediation_script_track_id_seq OWNED BY public.vusoft_vusoftauto_remediation_script_track.id;


--
-- Name: vusoft_vusoftbu; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftbu (
    id integer NOT NULL,
    tenant_id integer NOT NULL,
    name text NOT NULL,
    bu_json_str text NOT NULL
);


ALTER TABLE public.vusoft_vusoftbu OWNER TO core;

--
-- Name: vusoft_vusoftbu_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftbu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftbu_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftbu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftbu_id_seq OWNED BY public.vusoft_vusoftbu.id;


--
-- Name: vusoft_vusoftbualertcfg; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftbualertcfg (
    id integer NOT NULL,
    bu_id integer NOT NULL,
    alertcfg_json_str text NOT NULL
);


ALTER TABLE public.vusoft_vusoftbualertcfg OWNER TO core;

--
-- Name: vusoft_vusoftbualertcfg_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftbualertcfg_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftbualertcfg_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftbualertcfg_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftbualertcfg_id_seq OWNED BY public.vusoft_vusoftbualertcfg.id;


--
-- Name: vusoft_vusoftbucredential; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftbucredential (
    bu_id integer NOT NULL,
    credential_json_str text NOT NULL
);


ALTER TABLE public.vusoft_vusoftbucredential OWNER TO core;

--
-- Name: vusoft_vusoftbucredentials; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftbucredentials (
    id integer NOT NULL,
    bu_id integer NOT NULL,
    cred_type text NOT NULL,
    name text NOT NULL,
    credential_json_str text NOT NULL
);


ALTER TABLE public.vusoft_vusoftbucredentials OWNER TO core;

--
-- Name: vusoft_vusoftbucredentials_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftbucredentials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftbucredentials_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftbucredentials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftbucredentials_id_seq OWNED BY public.vusoft_vusoftbucredentials.id;


--
-- Name: vusoft_vusoftbuscan; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftbuscan (
    bu_id integer NOT NULL,
    scan_json_str text NOT NULL
);


ALTER TABLE public.vusoft_vusoftbuscan OWNER TO core;

--
-- Name: vusoft_vusoftcache; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftcache (
    key character varying(100) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.vusoft_vusoftcache OWNER TO core;

--
-- Name: vusoft_vusoftchatconversation; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftchatconversation (
    bu_id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    tenant_id integer NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    conversation_id integer NOT NULL,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.vusoft_vusoftchatconversation OWNER TO core;

--
-- Name: vusoft_vusoftchatconversation_conversation_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

ALTER TABLE public.vusoft_vusoftchatconversation ALTER COLUMN conversation_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.vusoft_vusoftchatconversation_conversation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: vusoft_vusoftchatentry; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftchatentry (
    bu_id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    tenant_id integer NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    chat_id integer NOT NULL,
    category character varying(100),
    question text,
    is_failure boolean NOT NULL,
    response jsonb,
    "like" boolean NOT NULL,
    dislike boolean NOT NULL,
    conversation_id integer,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.vusoft_vusoftchatentry OWNER TO core;

--
-- Name: vusoft_vusoftchatentry_chat_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

ALTER TABLE public.vusoft_vusoftchatentry ALTER COLUMN chat_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.vusoft_vusoftchatentry_chat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: vusoft_vusoftcollectioninfo; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftcollectioninfo (
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    config_command_id integer NOT NULL,
    vendor character varying(100) NOT NULL,
    model character varying(100) NOT NULL,
    config_collection_command_list text NOT NULL,
    main_config_command text NOT NULL
);


ALTER TABLE public.vusoft_vusoftcollectioninfo OWNER TO core;

--
-- Name: vusoft_vusoftcollectioninfo_config_command_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftcollectioninfo_config_command_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftcollectioninfo_config_command_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftcollectioninfo_config_command_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftcollectioninfo_config_command_id_seq OWNED BY public.vusoft_vusoftcollectioninfo.config_command_id;


--
-- Name: vusoft_vusoftconfigletmetadata; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftconfigletmetadata (
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    configlet_id integer NOT NULL,
    configlet_hash character varying(100) NOT NULL,
    configlet_name character varying(100) NOT NULL,
    configlet_created timestamp with time zone NOT NULL,
    is_used boolean NOT NULL,
    created_by character varying(100)
);


ALTER TABLE public.vusoft_vusoftconfigletmetadata OWNER TO core;

--
-- Name: vusoft_vusoftconfigletmetadata_configlet_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftconfigletmetadata_configlet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftconfigletmetadata_configlet_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftconfigletmetadata_configlet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftconfigletmetadata_configlet_id_seq OWNED BY public.vusoft_vusoftconfigletmetadata.configlet_id;


--
-- Name: vusoft_vusoftconfigurationdevices; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftconfigurationdevices (
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    id integer NOT NULL,
    device_name character varying(200) NOT NULL,
    device_address character varying(100) NOT NULL,
    collect_schedule_status character varying(100) NOT NULL,
    config_collection_settings text NOT NULL,
    config_upload_settings text NOT NULL,
    credentials text NOT NULL,
    last_config_collection_status character varying(100),
    last_config_collection_time character varying(100),
    last_config_push_id character varying(100),
    last_config_push_status character varying(100),
    last_config_push_time character varying(100),
    last_updated_time timestamp with time zone NOT NULL,
    asset_node_id integer NOT NULL,
    golden_template_type character varying(100),
    last_configuration_change_check_status character varying(100),
    last_configuration_change_check_time character varying(100),
    last_policy_check_status character varying(100),
    model character varying(100),
    recommended_credential text NOT NULL,
    vendor character varying(100),
    latest_collected_snapshot_id character varying(100)
);


ALTER TABLE public.vusoft_vusoftconfigurationdevices OWNER TO core;

--
-- Name: vusoft_vusoftconfigurationdevices_config_policy; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftconfigurationdevices_config_policy (
    id integer NOT NULL,
    vusoftconfigurationdevices_id integer NOT NULL,
    vusoftpolicy_id integer NOT NULL
);


ALTER TABLE public.vusoft_vusoftconfigurationdevices_config_policy OWNER TO core;

--
-- Name: vusoft_vusoftconfigurationdevices_config_policy_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftconfigurationdevices_config_policy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftconfigurationdevices_config_policy_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftconfigurationdevices_config_policy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftconfigurationdevices_config_policy_id_seq OWNED BY public.vusoft_vusoftconfigurationdevices_config_policy.id;


--
-- Name: vusoft_vusoftconfigurationdevices_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftconfigurationdevices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftconfigurationdevices_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftconfigurationdevices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftconfigurationdevices_id_seq OWNED BY public.vusoft_vusoftconfigurationdevices.id;


--
-- Name: vusoft_vusoftdatamanagement; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftdatamanagement (
    bu_id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    tenant_id integer NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    data_category character varying(100) NOT NULL,
    data_store_type character varying(100) NOT NULL,
    data_retention_period jsonb,
    tables text,
    additional_prefix_tables text,
    folders text,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.vusoft_vusoftdatamanagement OWNER TO core;

--
-- Name: vusoft_vusoftdatamanagement_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

ALTER TABLE public.vusoft_vusoftdatamanagement ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.vusoft_vusoftdatamanagement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: vusoft_vusoftdataretention; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftdataretention (
    bu_id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    tenant_id integer NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    retention_id integer NOT NULL,
    index_prefix character varying(100) NOT NULL,
    non_searchable_data_in_days integer NOT NULL,
    archive_data_after_days integer NOT NULL,
    searchable_data_in_days integer NOT NULL,
    is_default boolean NOT NULL,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.vusoft_vusoftdataretention OWNER TO core;

--
-- Name: vusoft_vusoftdataretention_retention_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

ALTER TABLE public.vusoft_vusoftdataretention ALTER COLUMN retention_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.vusoft_vusoftdataretention_retention_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: vusoft_vusoftdevicegroup; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftdevicegroup (
    group_id integer NOT NULL,
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    device_group_name character varying(100) NOT NULL,
    group_config_collection_settings text NOT NULL,
    group_config_upload_settings text NOT NULL,
    description text NOT NULL,
    modified_by character varying(100),
    modified_at character varying(100),
    default_group_flag boolean NOT NULL
);


ALTER TABLE public.vusoft_vusoftdevicegroup OWNER TO core;

--
-- Name: vusoft_vusoftdevicegroup_config_policy; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftdevicegroup_config_policy (
    id integer NOT NULL,
    vusoftdevicegroup_id integer NOT NULL,
    vusoftpolicy_id integer NOT NULL
);


ALTER TABLE public.vusoft_vusoftdevicegroup_config_policy OWNER TO core;

--
-- Name: vusoft_vusoftdevicegroup_config_policy_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftdevicegroup_config_policy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftdevicegroup_config_policy_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftdevicegroup_config_policy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftdevicegroup_config_policy_id_seq OWNED BY public.vusoft_vusoftdevicegroup_config_policy.id;


--
-- Name: vusoft_vusoftdevicegroup_devices; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftdevicegroup_devices (
    id integer NOT NULL,
    vusoftdevicegroup_id integer NOT NULL,
    vusoftconfigurationdevices_id integer NOT NULL
);


ALTER TABLE public.vusoft_vusoftdevicegroup_devices OWNER TO core;

--
-- Name: vusoft_vusoftdevicegroup_devices_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftdevicegroup_devices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftdevicegroup_devices_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftdevicegroup_devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftdevicegroup_devices_id_seq OWNED BY public.vusoft_vusoftdevicegroup_devices.id;


--
-- Name: vusoft_vusoftdevicegroup_group_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftdevicegroup_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftdevicegroup_group_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftdevicegroup_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftdevicegroup_group_id_seq OWNED BY public.vusoft_vusoftdevicegroup.group_id;


--
-- Name: vusoft_vusoftdiscovery; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftdiscovery (
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    topology_id integer NOT NULL,
    start_time timestamp with time zone,
    end_time timestamp with time zone,
    no_of_nodes_discovered integer NOT NULL,
    discovery_status character varying(100) NOT NULL,
    config_id integer NOT NULL,
    name character varying(100) NOT NULL,
    no_of_nodes_protocol_responding integer NOT NULL,
    no_of_nodes_targeted integer NOT NULL
);


ALTER TABLE public.vusoft_vusoftdiscovery OWNER TO core;

--
-- Name: vusoft_vusoftdiscovery_topology_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftdiscovery_topology_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftdiscovery_topology_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftdiscovery_topology_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftdiscovery_topology_id_seq OWNED BY public.vusoft_vusoftdiscovery.topology_id;


--
-- Name: vusoft_vusoftenrichmentdata; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftenrichmentdata (
    id integer NOT NULL,
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    table_name character varying(100) NOT NULL,
    config_id character varying(1000) NOT NULL,
    json_config text,
    key_id integer NOT NULL,
    topic character varying(100) NOT NULL,
    last_modified_at timestamp with time zone NOT NULL
);


ALTER TABLE public.vusoft_vusoftenrichmentdata OWNER TO core;
ALTER TABLE vusoft_vusoftenrichmentdata REPLICA IDENTITY FULL;
--
-- Name: vusoft_vusoftenrichmentdata_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftenrichmentdata_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftenrichmentdata_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftenrichmentdata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftenrichmentdata_id_seq OWNED BY public.vusoft_vusoftenrichmentdata.id;


--
-- Name: vusoft_vusoftenrichmentmetadata; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftenrichmentmetadata (
    id integer NOT NULL,
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    topic_name character varying(100),
    keys text NOT NULL,
    "values" text NOT NULL,
    options text,
    table_name character varying(31) NOT NULL,
    description text,
    created_at timestamp with time zone NOT NULL,
    created_by_id integer,
    updated_at timestamp with time zone NOT NULL,
    updated_by_id integer
);


ALTER TABLE public.vusoft_vusoftenrichmentmetadata OWNER TO core;

--
-- Name: vusoft_vusoftenrichmentmetadata_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftenrichmentmetadata_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftenrichmentmetadata_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftenrichmentmetadata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftenrichmentmetadata_id_seq OWNED BY public.vusoft_vusoftenrichmentmetadata.id;


--
-- Name: vusoft_vusoftetlpipeline; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftetlpipeline (
    id integer NOT NULL,
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    app_id character varying(100) NOT NULL,
    name character varying(40) NOT NULL,
    description text NOT NULL,
    instances integer NOT NULL,
    app_config text,
    log4j_properties text NOT NULL,
    log4j_xml text NOT NULL,
    stream_config text NOT NULL,
    telegraf text NOT NULL,
    pipeline_image_name text NOT NULL,
    app_config_draft text,
    app_config_request text,
    app_config_request_draft text,
    pipeline_graph text,
    pipeline_graph_draft text,
    pipeline_type character varying(20) NOT NULL,
    threads_per_instance integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    created_by_id integer,
    updated_at timestamp with time zone NOT NULL,
    updated_by_id integer
);


ALTER TABLE public.vusoft_vusoftetlpipeline OWNER TO core;

--
-- Name: vusoft_vusoftetlpipeline_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftetlpipeline_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftetlpipeline_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftetlpipeline_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftetlpipeline_id_seq OWNED BY public.vusoft_vusoftetlpipeline.id;


--
-- Name: vusoft_vusoftetlsettings; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftetlsettings (
    id integer NOT NULL,
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    default_instances integer NOT NULL
);


ALTER TABLE public.vusoft_vusoftetlsettings OWNER TO core;

--
-- Name: vusoft_vusoftetlsettings_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftetlsettings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftetlsettings_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftetlsettings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftetlsettings_id_seq OWNED BY public.vusoft_vusoftetlsettings.id;


--
-- Name: vusoft_vusofteventadditionalinfo; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusofteventadditionalinfo (
    id integer NOT NULL,
    event_id character varying(100) NOT NULL,
    data_type integer NOT NULL,
    data_str text NOT NULL
);


ALTER TABLE public.vusoft_vusofteventadditionalinfo OWNER TO core;

--
-- Name: vusoft_vusofteventadditionalinfo_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusofteventadditionalinfo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusofteventadditionalinfo_id_seq OWNER TO core;

--
-- Name: vusoft_vusofteventadditionalinfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusofteventadditionalinfo_id_seq OWNED BY public.vusoft_vusofteventadditionalinfo.id;


--
-- Name: vusoft_vusofteventcorrelations; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusofteventcorrelations (
    id integer NOT NULL,
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    event_id character varying(100) NOT NULL,
    corelation_id character varying(100) NOT NULL,
    corelation_rule text NOT NULL,
    supressed_event boolean NOT NULL,
    summary text NOT NULL,
    group_label text NOT NULL,
    related_events text NOT NULL,
    region text,
    severity text NOT NULL,
    type text NOT NULL,
    alarm_state text NOT NULL,
    assignee text,
    last_modified_time timestamp with time zone,
    last_modified_user text,
    confidence_factor double precision NOT NULL,
    status text NOT NULL,
    emttr integer NOT NULL,
    active_duration integer,
    total_duration integer,
    created_time timestamp with time zone NOT NULL,
    created_by text NOT NULL,
    occurrences text NOT NULL,
    ip_address text NOT NULL,
    category text NOT NULL,
    impact text NOT NULL,
    source text NOT NULL,
    related_dashboards text NOT NULL,
    ticket_id character varying(100),
    ticket_creation_time timestamp with time zone,
    notes jsonb NOT NULL,
    dynamic_notification_data jsonb NOT NULL,
    is_3t_suppressed_event boolean NOT NULL,
    is_ml_suppressed_event boolean NOT NULL,
    work_status character varying(200),
    similar_incidents jsonb
);


ALTER TABLE public.vusoft_vusofteventcorrelations OWNER TO core;

--
-- Name: vusoft_vusofteventcorrelations_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

ALTER TABLE public.vusoft_vusofteventcorrelations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.vusoft_vusofteventcorrelations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: vusoft_vusofteventdetails; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusofteventdetails (
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    event_id character varying(100) NOT NULL,
    summary text NOT NULL,
    region text,
    severity text NOT NULL,
    assignee text,
    last_modified_time timestamp with time zone,
    last_modified_user text,
    confidence_factor double precision NOT NULL,
    status text NOT NULL,
    emttr integer NOT NULL,
    active_duration integer,
    total_duration integer,
    created_time timestamp with time zone NOT NULL,
    created_by text NOT NULL,
    occurrences text NOT NULL,
    ip_address text NOT NULL,
    category text NOT NULL,
    impact text NOT NULL,
    source text NOT NULL,
    related_dashboards text NOT NULL,
    ticket_id character varying(100),
    dislikes integer NOT NULL,
    likes integer NOT NULL,
    ticket_creation_time timestamp with time zone
);


ALTER TABLE public.vusoft_vusofteventdetails OWNER TO core;

--
-- Name: vusoft_vusoftfcmtoken; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftfcmtoken (
    id integer NOT NULL,
    fcm_token text NOT NULL,
    device_id character varying(30) NOT NULL,
    last_modification_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.vusoft_vusoftfcmtoken OWNER TO core;

--
-- Name: vusoft_vusoftfcmtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftfcmtoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftfcmtoken_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftfcmtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftfcmtoken_id_seq OWNED BY public.vusoft_vusoftfcmtoken.id;


--
-- Name: vusoft_vusoftlinkinformation; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftlinkinformation (
    id integer NOT NULL,
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    link_type character varying(50) NOT NULL,
    info_collection_method character varying(50) NOT NULL,
    source_ip character varying(50) NOT NULL,
    source_node_id integer,
    source_end_point_id character varying(100) NOT NULL,
    source_end_point_name character varying(100) NOT NULL,
    destination_ip character varying(50) NOT NULL,
    destination_node_id integer,
    destination_end_point_id character varying(100) NOT NULL,
    destination_end_point_name character varying(100) NOT NULL,
    topology_id integer NOT NULL
);


ALTER TABLE public.vusoft_vusoftlinkinformation OWNER TO core;

--
-- Name: vusoft_vusoftlinkinformation_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftlinkinformation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftlinkinformation_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftlinkinformation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftlinkinformation_id_seq OWNED BY public.vusoft_vusoftlinkinformation.id;


--
-- Name: vusoft_vusoftmoduledata; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftmoduledata (
    id integer NOT NULL,
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    module text NOT NULL,
    value double precision NOT NULL,
    date text NOT NULL
);


ALTER TABLE public.vusoft_vusoftmoduledata OWNER TO core;

--
-- Name: vusoft_vusoftmoduledata_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftmoduledata_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftmoduledata_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftmoduledata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftmoduledata_id_seq OWNED BY public.vusoft_vusoftmoduledata.id;


--
-- Name: vusoft_vusoftnamednetwork; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftnamednetwork (
    id integer NOT NULL,
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    discovery_time timestamp with time zone NOT NULL,
    network_name character varying(100) NOT NULL,
    asset_id integer,
    topology_id integer
);


ALTER TABLE public.vusoft_vusoftnamednetwork OWNER TO core;

--
-- Name: vusoft_vusoftnamednetwork_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftnamednetwork_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftnamednetwork_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftnamednetwork_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftnamednetwork_id_seq OWNED BY public.vusoft_vusoftnamednetwork.id;


--
-- Name: vusoft_vusoftnamednetworkgroup; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftnamednetworkgroup (
    id integer NOT NULL,
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    network_name character varying(100) NOT NULL
);


ALTER TABLE public.vusoft_vusoftnamednetworkgroup OWNER TO core;

--
-- Name: vusoft_vusoftnamednetworkgroup_assets; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftnamednetworkgroup_assets (
    id integer NOT NULL,
    vusoftnamednetworkgroup_id integer NOT NULL,
    vusoftasset_id integer NOT NULL
);


ALTER TABLE public.vusoft_vusoftnamednetworkgroup_assets OWNER TO core;

--
-- Name: vusoft_vusoftnamednetworkgroup_assets_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftnamednetworkgroup_assets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftnamednetworkgroup_assets_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftnamednetworkgroup_assets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftnamednetworkgroup_assets_id_seq OWNED BY public.vusoft_vusoftnamednetworkgroup_assets.id;


--
-- Name: vusoft_vusoftnamednetworkgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftnamednetworkgroup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftnamednetworkgroup_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftnamednetworkgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftnamednetworkgroup_id_seq OWNED BY public.vusoft_vusoftnamednetworkgroup.id;


--
-- Name: vusoft_vusoftnode; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftnode (
    id integer NOT NULL,
    topology_id integer NOT NULL,
    node_json_str text NOT NULL,
    tp_id_csv character varying(300) NOT NULL
);


ALTER TABLE public.vusoft_vusoftnode OWNER TO core;

--
-- Name: vusoft_vusoftnode_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftnode_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftnode_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftnode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftnode_id_seq OWNED BY public.vusoft_vusoftnode.id;


--
-- Name: vusoft_vusoftnodebuleveldata; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftnodebuleveldata (
    id integer NOT NULL,
    bu_id integer NOT NULL,
    object_id integer NOT NULL,
    node_data_type integer NOT NULL,
    data text NOT NULL
);


ALTER TABLE public.vusoft_vusoftnodebuleveldata OWNER TO core;

--
-- Name: vusoft_vusoftnodebuleveldata_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftnodebuleveldata_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftnodebuleveldata_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftnodebuleveldata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftnodebuleveldata_id_seq OWNED BY public.vusoft_vusoftnodebuleveldata.id;


--
-- Name: vusoft_vusoftnodeinterface; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftnodeinterface (
    id integer NOT NULL,
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    topology_id integer NOT NULL,
    node_id integer NOT NULL,
    interface_ip character varying(100) NOT NULL,
    interface_name character varying(100) NOT NULL,
    neighbour_information text NOT NULL
);


ALTER TABLE public.vusoft_vusoftnodeinterface OWNER TO core;

--
-- Name: vusoft_vusoftnodeinterface_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftnodeinterface_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftnodeinterface_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftnodeinterface_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftnodeinterface_id_seq OWNED BY public.vusoft_vusoftnodeinterface.id;


--
-- Name: vusoft_vusoftnodelink; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftnodelink (
    id integer NOT NULL,
    topology_id integer NOT NULL,
    node_id integer NOT NULL,
    tp_id integer NOT NULL
);


ALTER TABLE public.vusoft_vusoftnodelink OWNER TO core;

--
-- Name: vusoft_vusoftnodelink_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftnodelink_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftnodelink_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftnodelink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftnodelink_id_seq OWNED BY public.vusoft_vusoftnodelink.id;


--
-- Name: vusoft_vusoftnodes; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftnodes (
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    topology_id integer NOT NULL,
    node_id integer NOT NULL,
    system_ip character varying(100) NOT NULL,
    credential_name character varying(100) NOT NULL,
    cred_type character varying(100) NOT NULL,
    vendor_name character varying(100) NOT NULL,
    device_name character varying(200) NOT NULL,
    device_type character varying(100) NOT NULL,
    interface_list text NOT NULL,
    port_list text NOT NULL,
    extended_data text NOT NULL,
    last_discovered_time timestamp with time zone,
    type_of_discovery character varying(100) NOT NULL,
    serial_number character varying(100) NOT NULL,
    subnet character varying(100) NOT NULL,
    ip_address text NOT NULL,
    device_model character varying(100) NOT NULL,
    device_status character varying(100) NOT NULL,
    parent_router_ip character varying(100) NOT NULL,
    total_ips_in_subnet integer NOT NULL,
    used_ip_in_subnet integer NOT NULL,
    reachable_via_icmp boolean NOT NULL,
    reachable_via_snmp boolean NOT NULL,
    vunet_device_model character varying(100)
);


ALTER TABLE public.vusoft_vusoftnodes OWNER TO core;

--
-- Name: vusoft_vusoftnodes_node_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftnodes_node_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftnodes_node_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftnodes_node_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftnodes_node_id_seq OWNED BY public.vusoft_vusoftnodes.node_id;


--
-- Name: vusoft_vusoftobjectidentification; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftobjectidentification (
    id integer NOT NULL,
    bu_id integer NOT NULL,
    object_type integer NOT NULL,
    ip_address text NOT NULL,
    object_id integer NOT NULL
);


ALTER TABLE public.vusoft_vusoftobjectidentification OWNER TO core;

--
-- Name: vusoft_vusoftobjectidentification_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftobjectidentification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftobjectidentification_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftobjectidentification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftobjectidentification_id_seq OWNED BY public.vusoft_vusoftobjectidentification.id;


--
-- Name: vusoft_vusoftpolicy; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftpolicy (
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    policy_id integer NOT NULL,
    policy_name character varying(100) NOT NULL,
    description text NOT NULL,
    configuration_line text NOT NULL,
    comparison_operation character varying(100),
    modified_by character varying(100),
    violation boolean NOT NULL
);


ALTER TABLE public.vusoft_vusoftpolicy OWNER TO core;

--
-- Name: vusoft_vusoftpolicy_policy_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftpolicy_policy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftpolicy_policy_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftpolicy_policy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftpolicy_policy_id_seq OWNED BY public.vusoft_vusoftpolicy.policy_id;


--
-- Name: vusoft_vusoftreports; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftreports (
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    report_id integer NOT NULL,
    report_name character varying(100) NOT NULL,
    report_description text,
    time_window text,
    report_path text,
    supported_formats character varying(100),
    status character varying(100) NOT NULL,
    report_template_id integer,
    dynamic_filters text,
    user_permission text,
    created_at timestamp with time zone NOT NULL,
    created_by_id integer,
    updated_at timestamp with time zone NOT NULL,
    updated_by_id integer,
    reports_tracker jsonb NOT NULL,
    duration character varying(100),
    downloaded_count integer NOT NULL
);


ALTER TABLE public.vusoft_vusoftreports OWNER TO core;

--
-- Name: vusoft_vusoftreports_owners; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftreports_owners (
    id integer NOT NULL,
    vusoftreports_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.vusoft_vusoftreports_owners OWNER TO core;

--
-- Name: vusoft_vusoftreports_owners_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

ALTER TABLE public.vusoft_vusoftreports_owners ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.vusoft_vusoftreports_owners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: vusoft_vusoftreports_report_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftreports_report_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftreports_report_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftreports_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftreports_report_id_seq OWNED BY public.vusoft_vusoftreports.report_id;


--
-- Name: vusoft_vusoftreportstemplate; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftreportstemplate (
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    report_template_id integer NOT NULL,
    report_template_name character varying(100) NOT NULL,
    report_template_description text,
    schedule text,
    destinations text,
    formats text,
    data_specification text,
    columns text,
    custom_contents text,
    time_window text,
    dashboards_link text,
    created_at timestamp with time zone NOT NULL,
    dynamic_filters text,
    user_permission text,
    created_by_id integer,
    updated_at timestamp with time zone NOT NULL,
    updated_by_id integer,
    status character varying(10) NOT NULL,
    filter_details text
);


ALTER TABLE public.vusoft_vusoftreportstemplate OWNER TO core;

--
-- Name: vusoft_vusoftreportstemplate_owners; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftreportstemplate_owners (
    id integer NOT NULL,
    vusoftreportstemplate_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.vusoft_vusoftreportstemplate_owners OWNER TO core;

--
-- Name: vusoft_vusoftreportstemplate_owners_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

ALTER TABLE public.vusoft_vusoftreportstemplate_owners ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.vusoft_vusoftreportstemplate_owners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: vusoft_vusoftreportstemplate_report_template_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftreportstemplate_report_template_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftreportstemplate_report_template_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftreportstemplate_report_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftreportstemplate_report_template_id_seq OWNED BY public.vusoft_vusoftreportstemplate.report_template_id;


--
-- Name: vusoft_vusoftrolluprules; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftrolluprules (
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    group_name character varying(100) NOT NULL,
    rollup_data text NOT NULL,
    start_time timestamp with time zone,
    duration integer,
    last_rollup_status character varying(10),
    last_rollup_error_message text
);


ALTER TABLE public.vusoft_vusoftrolluprules OWNER TO core;

--
-- Name: vusoft_vusoftscanconfigdetails; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftscanconfigdetails (
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    config_id integer NOT NULL,
    start_ip character varying(100) NOT NULL,
    end_ip character varying(100) NOT NULL,
    excluded_ip text NOT NULL,
    seed_ip text NOT NULL,
    cred_list text NOT NULL,
    schedule_name character varying(100) NOT NULL,
    schedule_string text NOT NULL,
    user_details text NOT NULL,
    source_ip text NOT NULL,
    hop_count integer,
    meta_data text NOT NULL,
    config_method character varying(100) NOT NULL,
    file_name character varying(200) NOT NULL,
    dcm_cred_list text NOT NULL,
    dcm_enabled boolean NOT NULL,
    monitoring_enabled boolean NOT NULL,
    discover_l2_topology boolean NOT NULL,
    network_name character varying(100) NOT NULL
);


ALTER TABLE public.vusoft_vusoftscanconfigdetails OWNER TO core;

--
-- Name: vusoft_vusoftscanconfigdetails_config_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftscanconfigdetails_config_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftscanconfigdetails_config_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftscanconfigdetails_config_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftscanconfigdetails_config_id_seq OWNED BY public.vusoft_vusoftscanconfigdetails.config_id;


--
-- Name: vusoft_vusoftsnapshot; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftsnapshot (
    id integer NOT NULL,
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    name text NOT NULL,
    snapshot_json_str text NOT NULL
);


ALTER TABLE public.vusoft_vusoftsnapshot OWNER TO core;

--
-- Name: vusoft_vusoftsnapshot_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftsnapshot_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftsnapshot_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftsnapshot_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftsnapshot_id_seq OWNED BY public.vusoft_vusoftsnapshot.id;


--
-- Name: vusoft_vusoftsnapshotmetadata; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftsnapshotmetadata (
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    id integer NOT NULL,
    device_address character varying(100) NOT NULL,
    snapshot_hash character varying(100) NOT NULL,
    snapshot_name character varying(100) NOT NULL,
    snapshot_created timestamp with time zone NOT NULL,
    snapshot_collection_status character varying(100) NOT NULL,
    commmit_message text NOT NULL,
    snapshot_collection_status_remark text NOT NULL,
    snapshot_category character varying(100) NOT NULL,
    config_policy_status text NOT NULL,
    golden_template_type character varying(100)
);


ALTER TABLE public.vusoft_vusoftsnapshotmetadata OWNER TO core;

--
-- Name: vusoft_vusoftsnapshotmetadata_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftsnapshotmetadata_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftsnapshotmetadata_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftsnapshotmetadata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftsnapshotmetadata_id_seq OWNED BY public.vusoft_vusoftsnapshotmetadata.id;


--
-- Name: vusoft_vusoftsnapshotnode; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftsnapshotnode (
    id integer NOT NULL,
    snapshot_id integer NOT NULL,
    node_id integer NOT NULL,
    node_json_str text NOT NULL
);


ALTER TABLE public.vusoft_vusoftsnapshotnode OWNER TO core;

--
-- Name: vusoft_vusoftsnapshotnode_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftsnapshotnode_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftsnapshotnode_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftsnapshotnode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftsnapshotnode_id_seq OWNED BY public.vusoft_vusoftsnapshotnode.id;


--
-- Name: vusoft_vusoftsnapshotnodelink; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftsnapshotnodelink (
    id integer NOT NULL,
    snapshot_id integer NOT NULL,
    link_json_str text NOT NULL
);


ALTER TABLE public.vusoft_vusoftsnapshotnodelink OWNER TO core;

--
-- Name: vusoft_vusoftsnapshotnodelink_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftsnapshotnodelink_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftsnapshotnodelink_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftsnapshotnodelink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftsnapshotnodelink_id_seq OWNED BY public.vusoft_vusoftsnapshotnodelink.id;


--
-- Name: vusoft_vusoftsnapshotvulnerability; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftsnapshotvulnerability (
    id integer NOT NULL,
    snapshot_id integer NOT NULL,
    node_id integer NOT NULL,
    vul_json_str text NOT NULL
);


ALTER TABLE public.vusoft_vusoftsnapshotvulnerability OWNER TO core;

--
-- Name: vusoft_vusoftsnapshotvulnerability_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftsnapshotvulnerability_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftsnapshotvulnerability_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftsnapshotvulnerability_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftsnapshotvulnerability_id_seq OWNED BY public.vusoft_vusoftsnapshotvulnerability.id;


--
-- Name: vusoft_vusofttenant; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusofttenant (
    id integer NOT NULL,
    name text NOT NULL,
    tenant_json_str text NOT NULL,
    customer_id uuid
);


ALTER TABLE public.vusoft_vusofttenant OWNER TO core;

--
-- Name: vusoft_vusofttenant_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusofttenant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusofttenant_id_seq OWNER TO core;

--
-- Name: vusoft_vusofttenant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusofttenant_id_seq OWNED BY public.vusoft_vusofttenant.id;


--
-- Name: vusoft_vusofttenantattributes; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusofttenantattributes (
    id integer NOT NULL,
    tenant_id integer NOT NULL,
    data_type integer NOT NULL,
    data_str text NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.vusoft_vusofttenantattributes OWNER TO core;

--
-- Name: vusoft_vusofttenantattributes_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusofttenantattributes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusofttenantattributes_id_seq OWNER TO core;

--
-- Name: vusoft_vusofttenantattributes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusofttenantattributes_id_seq OWNED BY public.vusoft_vusofttenantattributes.id;


--
-- Name: vusoft_vusofttenantdata; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusofttenantdata (
    id integer NOT NULL,
    tenant_id integer NOT NULL,
    data_type integer NOT NULL,
    data_str text NOT NULL
);


ALTER TABLE public.vusoft_vusofttenantdata OWNER TO core;

--
-- Name: vusoft_vusofttenantdata_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusofttenantdata_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusofttenantdata_id_seq OWNER TO core;

--
-- Name: vusoft_vusofttenantdata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusofttenantdata_id_seq OWNED BY public.vusoft_vusofttenantdata.id;


--
-- Name: vusoft_vusofttopology; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusofttopology (
    id integer NOT NULL,
    topology_json_str character varying(10000) NOT NULL
);


ALTER TABLE public.vusoft_vusofttopology OWNER TO core;

--
-- Name: vusoft_vusofttopology_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusofttopology_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusofttopology_id_seq OWNER TO core;

--
-- Name: vusoft_vusofttopology_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusofttopology_id_seq OWNED BY public.vusoft_vusofttopology.id;


--
-- Name: vusoft_vusoftusereventrelation; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftusereventrelation (
    id integer NOT NULL,
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    username text NOT NULL,
    user_reaction text NOT NULL,
    additional_comment jsonb NOT NULL,
    time_added timestamp with time zone NOT NULL,
    event_id integer NOT NULL
);


ALTER TABLE public.vusoft_vusoftusereventrelation OWNER TO core;

--
-- Name: vusoft_vusoftusereventrelation_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftusereventrelation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftusereventrelation_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftusereventrelation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftusereventrelation_id_seq OWNED BY public.vusoft_vusoftusereventrelation.id;


--
-- Name: vusoft_vusoftuserpreferences; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vusoftuserpreferences (
    id integer NOT NULL,
    "user" character varying(100) NOT NULL,
    data_type integer NOT NULL,
    data_str text NOT NULL
);


ALTER TABLE public.vusoft_vusoftuserpreferences OWNER TO core;

--
-- Name: vusoft_vusoftuserpreferences_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vusoftuserpreferences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vusoftuserpreferences_id_seq OWNER TO core;

--
-- Name: vusoft_vusoftuserpreferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vusoftuserpreferences_id_seq OWNED BY public.vusoft_vusoftuserpreferences.id;


--
-- Name: vusoft_vustreamsconnectors; Type: TABLE; Schema: public; Owner: core
--

CREATE TABLE public.vusoft_vustreamsconnectors (
    id integer NOT NULL,
    tenant_id integer NOT NULL,
    bu_id integer NOT NULL,
    connector_name character varying(100) NOT NULL,
    connector_type character varying(100) NOT NULL,
    connector_dest character varying(100) NOT NULL,
    data_streams character varying(100) NOT NULL,
    description character varying(100),
    payload text,
    type character varying(100) NOT NULL,
    form text,
    created_at timestamp with time zone NOT NULL,
    created_by_id integer,
    updated_at timestamp with time zone NOT NULL,
    updated_by_id integer
);


ALTER TABLE public.vusoft_vustreamsconnectors OWNER TO core;

--
-- Name: vusoft_vustreamsconnectors_id_seq; Type: SEQUENCE; Schema: public; Owner: core
--

CREATE SEQUENCE public.vusoft_vustreamsconnectors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vusoft_vustreamsconnectors_id_seq OWNER TO core;

--
-- Name: vusoft_vustreamsconnectors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: core
--

ALTER SEQUENCE public.vusoft_vustreamsconnectors_id_seq OWNED BY public.vusoft_vustreamsconnectors.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: captcha_captchastore id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.captcha_captchastore ALTER COLUMN id SET DEFAULT nextval('public.captcha_captchastore_id_seq'::regclass);


--
-- Name: defender_accessattempt id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.defender_accessattempt ALTER COLUMN id SET DEFAULT nextval('public.defender_accessattempt_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- Name: dbz_heartbeat id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.dbz_heartbeat ALTER COLUMN id SET DEFAULT nextval('public.dbz_heartbeat_id_seq'::regclass);


--
-- Name: oauth2_provider_accesstoken id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken ALTER COLUMN id SET DEFAULT nextval('public.oauth2_provider_accesstoken_id_seq'::regclass);


--
-- Name: oauth2_provider_application id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.oauth2_provider_application ALTER COLUMN id SET DEFAULT nextval('public.oauth2_provider_application_id_seq'::regclass);


--
-- Name: oauth2_provider_grant id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.oauth2_provider_grant ALTER COLUMN id SET DEFAULT nextval('public.oauth2_provider_grant_id_seq'::regclass);


--
-- Name: oauth2_provider_refreshtoken id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken ALTER COLUMN id SET DEFAULT nextval('public.oauth2_provider_refreshtoken_id_seq'::regclass);


--
-- Name: vu_auth_provider_userprofile id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vu_auth_provider_userprofile ALTER COLUMN id SET DEFAULT nextval('public.vu_auth_provider_userprofile_id_seq'::regclass);


--
-- Name: vu_auth_provider_userprofile_groups id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vu_auth_provider_userprofile_groups ALTER COLUMN id SET DEFAULT nextval('public.vu_auth_provider_userprofile_groups_id_seq'::regclass);


--
-- Name: vusoft_alertrule alert_rule_id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_alertrule ALTER COLUMN alert_rule_id SET DEFAULT nextval('public.vusoft_alertrule_alert_rule_id_seq'::regclass);


--
-- Name: vusoft_datastreams id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_datastreams ALTER COLUMN id SET DEFAULT nextval('public.vusoft_datastreams_id_seq'::regclass);


--
-- Name: vusoft_datastreamservicemapping id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_datastreamservicemapping ALTER COLUMN id SET DEFAULT nextval('public.vusoft_datastreamservicemapping_id_seq'::regclass);


--
-- Name: vusoft_hrmsdata id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_hrmsdata ALTER COLUMN id SET DEFAULT nextval('public.vusoft_hrmsdata_id_seq'::regclass);


--
-- Name: vusoft_mobiledashboard id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_mobiledashboard ALTER COLUMN id SET DEFAULT nextval('public.vusoft_mobiledashboard_id_seq'::regclass);


--
-- Name: vusoft_sparkjobhistory id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_sparkjobhistory ALTER COLUMN id SET DEFAULT nextval('public.vusoft_sparkjobhistory_id_seq'::regclass);


--
-- Name: vusoft_utm id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_utm ALTER COLUMN id SET DEFAULT nextval('public.vusoft_utm_id_seq'::regclass);


--
-- Name: vusoft_vublockalertrules id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vublockalertrules ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vublockalertrules_id_seq'::regclass);


--
-- Name: vusoft_vublockdatasources id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vublockdatasources ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vublockdatasources_id_seq'::regclass);


--
-- Name: vusoft_vublockdatastreamsconfigs id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vublockdatastreamsconfigs ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vublockdatastreamsconfigs_id_seq'::regclass);


--
-- Name: vusoft_vublockfields id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vublockfields ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vublockfields_id_seq'::regclass);


--
-- Name: vusoft_vublockgoldensignals id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vublockgoldensignals ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vublockgoldensignals_id_seq'::regclass);


--
-- Name: vusoft_vublockstoryboards id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vublockstoryboards ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vublockstoryboards_id_seq'::regclass);


--
-- Name: vusoft_vudatalakejob id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vudatalakejob ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vudatalakejob_id_seq'::regclass);


--
-- Name: vusoft_vusoftagentdetails id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftagentdetails ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vusoftagentdetails_id_seq'::regclass);


--
-- Name: vusoft_vusoftalertmetadata id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftalertmetadata ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vusoftalertmetadata_id_seq'::regclass);


--
-- Name: vusoft_vusoftasset node_id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftasset ALTER COLUMN node_id SET DEFAULT nextval('public.vusoft_vusoftasset_node_id_seq'::regclass);


--
-- Name: vusoft_vusoftassetgroup group_id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftassetgroup ALTER COLUMN group_id SET DEFAULT nextval('public.vusoft_vusoftassetgroup_group_id_seq'::regclass);


--
-- Name: vusoft_vusoftassetgroup_assets id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftassetgroup_assets ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vusoftassetgroup_assets_id_seq'::regclass);


--
-- Name: vusoft_vusoftauto_remediation_script_track id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftauto_remediation_script_track ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vusoftauto_remediation_script_track_id_seq'::regclass);


--
-- Name: vusoft_vusoftbu id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftbu ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vusoftbu_id_seq'::regclass);


--
-- Name: vusoft_vusoftbualertcfg id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftbualertcfg ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vusoftbualertcfg_id_seq'::regclass);


--
-- Name: vusoft_vusoftbucredentials id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftbucredentials ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vusoftbucredentials_id_seq'::regclass);


--
-- Name: vusoft_vusoftcollectioninfo config_command_id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftcollectioninfo ALTER COLUMN config_command_id SET DEFAULT nextval('public.vusoft_vusoftcollectioninfo_config_command_id_seq'::regclass);


--
-- Name: vusoft_vusoftconfigletmetadata configlet_id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftconfigletmetadata ALTER COLUMN configlet_id SET DEFAULT nextval('public.vusoft_vusoftconfigletmetadata_configlet_id_seq'::regclass);


--
-- Name: vusoft_vusoftconfigurationdevices id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftconfigurationdevices ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vusoftconfigurationdevices_id_seq'::regclass);


--
-- Name: vusoft_vusoftconfigurationdevices_config_policy id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftconfigurationdevices_config_policy ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vusoftconfigurationdevices_config_policy_id_seq'::regclass);


--
-- Name: vusoft_vusoftdevicegroup group_id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftdevicegroup ALTER COLUMN group_id SET DEFAULT nextval('public.vusoft_vusoftdevicegroup_group_id_seq'::regclass);


--
-- Name: vusoft_vusoftdevicegroup_config_policy id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftdevicegroup_config_policy ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vusoftdevicegroup_config_policy_id_seq'::regclass);


--
-- Name: vusoft_vusoftdevicegroup_devices id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftdevicegroup_devices ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vusoftdevicegroup_devices_id_seq'::regclass);


--
-- Name: vusoft_vusoftdiscovery topology_id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftdiscovery ALTER COLUMN topology_id SET DEFAULT nextval('public.vusoft_vusoftdiscovery_topology_id_seq'::regclass);


--
-- Name: vusoft_vusoftenrichmentdata id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftenrichmentdata ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vusoftenrichmentdata_id_seq'::regclass);


--
-- Name: vusoft_vusoftenrichmentmetadata id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftenrichmentmetadata ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vusoftenrichmentmetadata_id_seq'::regclass);


--
-- Name: vusoft_vusoftetlpipeline id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftetlpipeline ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vusoftetlpipeline_id_seq'::regclass);


--
-- Name: vusoft_vusoftetlsettings id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftetlsettings ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vusoftetlsettings_id_seq'::regclass);


--
-- Name: vusoft_vusofteventadditionalinfo id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusofteventadditionalinfo ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vusofteventadditionalinfo_id_seq'::regclass);


--
-- Name: vusoft_vusoftfcmtoken id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftfcmtoken ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vusoftfcmtoken_id_seq'::regclass);


--
-- Name: vusoft_vusoftlinkinformation id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftlinkinformation ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vusoftlinkinformation_id_seq'::regclass);


--
-- Name: vusoft_vusoftmoduledata id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftmoduledata ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vusoftmoduledata_id_seq'::regclass);


--
-- Name: vusoft_vusoftnamednetwork id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftnamednetwork ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vusoftnamednetwork_id_seq'::regclass);


--
-- Name: vusoft_vusoftnamednetworkgroup id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftnamednetworkgroup ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vusoftnamednetworkgroup_id_seq'::regclass);


--
-- Name: vusoft_vusoftnamednetworkgroup_assets id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftnamednetworkgroup_assets ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vusoftnamednetworkgroup_assets_id_seq'::regclass);


--
-- Name: vusoft_vusoftnode id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftnode ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vusoftnode_id_seq'::regclass);


--
-- Name: vusoft_vusoftnodebuleveldata id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftnodebuleveldata ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vusoftnodebuleveldata_id_seq'::regclass);


--
-- Name: vusoft_vusoftnodeinterface id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftnodeinterface ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vusoftnodeinterface_id_seq'::regclass);


--
-- Name: vusoft_vusoftnodelink id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftnodelink ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vusoftnodelink_id_seq'::regclass);


--
-- Name: vusoft_vusoftnodes node_id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftnodes ALTER COLUMN node_id SET DEFAULT nextval('public.vusoft_vusoftnodes_node_id_seq'::regclass);


--
-- Name: vusoft_vusoftobjectidentification id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftobjectidentification ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vusoftobjectidentification_id_seq'::regclass);


--
-- Name: vusoft_vusoftpolicy policy_id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftpolicy ALTER COLUMN policy_id SET DEFAULT nextval('public.vusoft_vusoftpolicy_policy_id_seq'::regclass);


--
-- Name: vusoft_vusoftreports report_id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftreports ALTER COLUMN report_id SET DEFAULT nextval('public.vusoft_vusoftreports_report_id_seq'::regclass);


--
-- Name: vusoft_vusoftreportstemplate report_template_id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftreportstemplate ALTER COLUMN report_template_id SET DEFAULT nextval('public.vusoft_vusoftreportstemplate_report_template_id_seq'::regclass);


--
-- Name: vusoft_vusoftscanconfigdetails config_id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftscanconfigdetails ALTER COLUMN config_id SET DEFAULT nextval('public.vusoft_vusoftscanconfigdetails_config_id_seq'::regclass);


--
-- Name: vusoft_vusoftsnapshot id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftsnapshot ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vusoftsnapshot_id_seq'::regclass);


--
-- Name: vusoft_vusoftsnapshotmetadata id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftsnapshotmetadata ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vusoftsnapshotmetadata_id_seq'::regclass);


--
-- Name: vusoft_vusoftsnapshotnode id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftsnapshotnode ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vusoftsnapshotnode_id_seq'::regclass);


--
-- Name: vusoft_vusoftsnapshotnodelink id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftsnapshotnodelink ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vusoftsnapshotnodelink_id_seq'::regclass);


--
-- Name: vusoft_vusoftsnapshotvulnerability id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftsnapshotvulnerability ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vusoftsnapshotvulnerability_id_seq'::regclass);


--
-- Name: vusoft_vusofttenant id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusofttenant ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vusofttenant_id_seq'::regclass);


--
-- Name: vusoft_vusofttenantattributes id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusofttenantattributes ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vusofttenantattributes_id_seq'::regclass);


--
-- Name: vusoft_vusofttenantdata id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusofttenantdata ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vusofttenantdata_id_seq'::regclass);


--
-- Name: vusoft_vusofttopology id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusofttopology ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vusofttopology_id_seq'::regclass);


--
-- Name: vusoft_vusoftusereventrelation id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftusereventrelation ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vusoftusereventrelation_id_seq'::regclass);


--
-- Name: vusoft_vusoftuserpreferences id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftuserpreferences ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vusoftuserpreferences_id_seq'::regclass);


--
-- Name: vusoft_vustreamsconnectors id; Type: DEFAULT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vustreamsconnectors ALTER COLUMN id SET DEFAULT nextval('public.vusoft_vustreamsconnectors_id_seq'::regclass);


--
-- Data for Name: cache_inval_bgw_job; Type: TABLE DATA; Schema: _timescaledb_cache; Owner: vusmart
--

COPY _timescaledb_cache.cache_inval_bgw_job  FROM stdin;
\.


--
-- Data for Name: cache_inval_extension; Type: TABLE DATA; Schema: _timescaledb_cache; Owner: vusmart
--

COPY _timescaledb_cache.cache_inval_extension  FROM stdin;
\.


--
-- Data for Name: cache_inval_hypertable; Type: TABLE DATA; Schema: _timescaledb_cache; Owner: vusmart
--

COPY _timescaledb_cache.cache_inval_hypertable  FROM stdin;
\.


--
-- Data for Name: hypertable; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: vusmart
--

COPY _timescaledb_catalog.hypertable (id, schema_name, table_name, associated_schema_name, associated_table_prefix, num_dimensions, chunk_sizing_func_schema, chunk_sizing_func_name, chunk_target_size, compression_state, compressed_hypertable_id, replication_factor) FROM stdin;
\.


--
-- Data for Name: chunk; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: vusmart
--

COPY _timescaledb_catalog.chunk (id, hypertable_id, schema_name, table_name, compressed_chunk_id, dropped, status, osm_chunk) FROM stdin;
\.


--
-- Data for Name: dimension; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: vusmart
--

COPY _timescaledb_catalog.dimension (id, hypertable_id, column_name, column_type, aligned, num_slices, partitioning_func_schema, partitioning_func, interval_length, compress_interval_length, integer_now_func_schema, integer_now_func) FROM stdin;
\.


--
-- Data for Name: dimension_slice; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: vusmart
--

COPY _timescaledb_catalog.dimension_slice (id, dimension_id, range_start, range_end) FROM stdin;
\.


--
-- Data for Name: chunk_constraint; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: vusmart
--

COPY _timescaledb_catalog.chunk_constraint (chunk_id, dimension_slice_id, constraint_name, hypertable_constraint_name) FROM stdin;
\.


--
-- Data for Name: chunk_data_node; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: vusmart
--

COPY _timescaledb_catalog.chunk_data_node (chunk_id, node_chunk_id, node_name) FROM stdin;
\.


--
-- Data for Name: chunk_index; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: vusmart
--

COPY _timescaledb_catalog.chunk_index (chunk_id, index_name, hypertable_id, hypertable_index_name) FROM stdin;
\.


--
-- Data for Name: compression_chunk_size; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: vusmart
--

COPY _timescaledb_catalog.compression_chunk_size (chunk_id, compressed_chunk_id, uncompressed_heap_size, uncompressed_toast_size, uncompressed_index_size, compressed_heap_size, compressed_toast_size, compressed_index_size, numrows_pre_compression, numrows_post_compression) FROM stdin;
\.


--
-- Data for Name: continuous_agg; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: vusmart
--

COPY _timescaledb_catalog.continuous_agg (mat_hypertable_id, raw_hypertable_id, parent_mat_hypertable_id, user_view_schema, user_view_name, partial_view_schema, partial_view_name, bucket_width, direct_view_schema, direct_view_name, materialized_only, finalized) FROM stdin;
\.


--
-- Data for Name: continuous_agg_migrate_plan; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: vusmart
--

COPY _timescaledb_catalog.continuous_agg_migrate_plan (mat_hypertable_id, start_ts, end_ts) FROM stdin;
\.


--
-- Data for Name: continuous_agg_migrate_plan_step; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: vusmart
--

COPY _timescaledb_catalog.continuous_agg_migrate_plan_step (mat_hypertable_id, step_id, status, start_ts, end_ts, type, config) FROM stdin;
\.


--
-- Data for Name: continuous_aggs_bucket_function; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: vusmart
--

COPY _timescaledb_catalog.continuous_aggs_bucket_function (mat_hypertable_id, experimental, name, bucket_width, origin, timezone) FROM stdin;
\.


--
-- Data for Name: continuous_aggs_hypertable_invalidation_log; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: vusmart
--

COPY _timescaledb_catalog.continuous_aggs_hypertable_invalidation_log (hypertable_id, lowest_modified_value, greatest_modified_value) FROM stdin;
\.


--
-- Data for Name: continuous_aggs_invalidation_threshold; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: vusmart
--

COPY _timescaledb_catalog.continuous_aggs_invalidation_threshold (hypertable_id, watermark) FROM stdin;
\.


--
-- Data for Name: continuous_aggs_materialization_invalidation_log; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: vusmart
--

COPY _timescaledb_catalog.continuous_aggs_materialization_invalidation_log (materialization_id, lowest_modified_value, greatest_modified_value) FROM stdin;
\.


--
-- Data for Name: dimension_partition; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: vusmart
--

COPY _timescaledb_catalog.dimension_partition (dimension_id, range_start, data_nodes) FROM stdin;
\.


--
-- Data for Name: hypertable_compression; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: vusmart
--

COPY _timescaledb_catalog.hypertable_compression (hypertable_id, attname, compression_algorithm_id, segmentby_column_index, orderby_column_index, orderby_asc, orderby_nullsfirst) FROM stdin;
\.


--
-- Data for Name: hypertable_data_node; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: vusmart
--

COPY _timescaledb_catalog.hypertable_data_node (hypertable_id, node_hypertable_id, node_name, block_chunks) FROM stdin;
\.


--
-- Data for Name: metadata; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: vusmart
--

COPY _timescaledb_catalog.metadata (key, value, include_in_telemetry) FROM stdin;
exported_uuid	fd39749a-9aa3-4d2e-b9b7-6d59b0cf2777	t
\.


--
-- Data for Name: remote_txn; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: vusmart
--

COPY _timescaledb_catalog.remote_txn (data_node_name, remote_transaction_id) FROM stdin;
\.


--
-- Data for Name: tablespace; Type: TABLE DATA; Schema: _timescaledb_catalog; Owner: vusmart
--

COPY _timescaledb_catalog.tablespace (id, hypertable_id, tablespace_name) FROM stdin;
\.


--
-- Data for Name: bgw_job; Type: TABLE DATA; Schema: _timescaledb_config; Owner: vusmart
--

COPY _timescaledb_config.bgw_job (id, application_name, schedule_interval, max_runtime, max_retries, retry_period, proc_schema, proc_name, owner, scheduled, fixed_schedule, initial_start, hypertable_id, config, check_schema, check_name, timezone) FROM stdin;
\.


--
-- Data for Name: job_errors; Type: TABLE DATA; Schema: _timescaledb_internal; Owner: vusmart
--

COPY _timescaledb_internal.job_errors (job_id, pid, start_time, finish_time, error_data) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can view permission	1	view_permission
5	Can add group	2	add_group
6	Can change group	2	change_group
7	Can delete group	2	delete_group
8	Can view group	2	view_group
9	Can add user	3	add_user
10	Can change user	3	change_user
11	Can delete user	3	delete_user
12	Can view user	3	view_user
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add log entry	76	add_logentry
18	Can change log entry	76	change_logentry
19	Can delete log entry	76	delete_logentry
20	Can view log entry	76	view_logentry
21	Can add session	77	add_session
22	Can change session	77	change_session
23	Can delete session	77	delete_session
24	Can view session	77	view_session
25	Can add vu soft bu	5	add_vusoftbu
26	Can change vu soft bu	5	change_vusoftbu
27	Can delete vu soft bu	5	delete_vusoftbu
28	Can view vu soft bu	5	view_vusoftbu
29	Can add vu soft bu credential	6	add_vusoftbucredential
30	Can change vu soft bu credential	6	change_vusoftbucredential
31	Can delete vu soft bu credential	6	delete_vusoftbucredential
32	Can view vu soft bu credential	6	view_vusoftbucredential
33	Can add vu soft bu scan	7	add_vusoftbuscan
34	Can change vu soft bu scan	7	change_vusoftbuscan
35	Can delete vu soft bu scan	7	delete_vusoftbuscan
36	Can view vu soft bu scan	7	view_vusoftbuscan
37	Can add vu soft node	8	add_vusoftnode
38	Can change vu soft node	8	change_vusoftnode
39	Can delete vu soft node	8	delete_vusoftnode
40	Can view vu soft node	8	view_vusoftnode
41	Can add vu soft node bu level data	9	add_vusoftnodebuleveldata
42	Can change vu soft node bu level data	9	change_vusoftnodebuleveldata
43	Can delete vu soft node bu level data	9	delete_vusoftnodebuleveldata
44	Can view vu soft node bu level data	9	view_vusoftnodebuleveldata
45	Can add vu soft node link	10	add_vusoftnodelink
46	Can change vu soft node link	10	change_vusoftnodelink
47	Can delete vu soft node link	10	delete_vusoftnodelink
48	Can view vu soft node link	10	view_vusoftnodelink
49	Can add vu soft object identification	11	add_vusoftobjectidentification
50	Can change vu soft object identification	11	change_vusoftobjectidentification
51	Can delete vu soft object identification	11	delete_vusoftobjectidentification
52	Can view vu soft object identification	11	view_vusoftobjectidentification
53	Can add vu soft snapshot	12	add_vusoftsnapshot
54	Can change vu soft snapshot	12	change_vusoftsnapshot
55	Can delete vu soft snapshot	12	delete_vusoftsnapshot
56	Can view vu soft snapshot	12	view_vusoftsnapshot
57	Can add vu soft snapshot node	13	add_vusoftsnapshotnode
58	Can change vu soft snapshot node	13	change_vusoftsnapshotnode
59	Can delete vu soft snapshot node	13	delete_vusoftsnapshotnode
60	Can view vu soft snapshot node	13	view_vusoftsnapshotnode
61	Can add vu soft snapshot node link	14	add_vusoftsnapshotnodelink
62	Can change vu soft snapshot node link	14	change_vusoftsnapshotnodelink
63	Can delete vu soft snapshot node link	14	delete_vusoftsnapshotnodelink
64	Can view vu soft snapshot node link	14	view_vusoftsnapshotnodelink
65	Can add vu soft snapshot vulnerability	15	add_vusoftsnapshotvulnerability
66	Can change vu soft snapshot vulnerability	15	change_vusoftsnapshotvulnerability
67	Can delete vu soft snapshot vulnerability	15	delete_vusoftsnapshotvulnerability
68	Can view vu soft snapshot vulnerability	15	view_vusoftsnapshotvulnerability
69	Can add vu soft tenant	16	add_vusofttenant
70	Can change vu soft tenant	16	change_vusofttenant
71	Can delete vu soft tenant	16	delete_vusofttenant
72	Can view vu soft tenant	16	view_vusofttenant
73	Can add vu soft topology	17	add_vusofttopology
74	Can change vu soft topology	17	change_vusofttopology
75	Can delete vu soft topology	17	delete_vusofttopology
76	Can view vu soft topology	17	view_vusofttopology
77	Can add vu soft bu alert cfg	18	add_vusoftbualertcfg
78	Can change vu soft bu alert cfg	18	change_vusoftbualertcfg
79	Can delete vu soft bu alert cfg	18	delete_vusoftbualertcfg
80	Can view vu soft bu alert cfg	18	view_vusoftbualertcfg
81	Can add vu soft tenant data	19	add_vusofttenantdata
82	Can change vu soft tenant data	19	change_vusofttenantdata
83	Can delete vu soft tenant data	19	delete_vusofttenantdata
84	Can view vu soft tenant data	19	view_vusofttenantdata
85	Can add vu soft bu credentials	20	add_vusoftbucredentials
86	Can change vu soft bu credentials	20	change_vusoftbucredentials
87	Can delete vu soft bu credentials	20	delete_vusoftbucredentials
88	Can view vu soft bu credentials	20	view_vusoftbucredentials
89	Can add vu soft tenant attributes	21	add_vusofttenantattributes
90	Can change vu soft tenant attributes	21	change_vusofttenantattributes
91	Can delete vu soft tenant attributes	21	delete_vusofttenantattributes
92	Can view vu soft tenant attributes	21	view_vusofttenantattributes
93	Can add logical vublock mapping	22	add_logicalvublockmapping
94	Can change logical vublock mapping	22	change_logicalvublockmapping
95	Can delete logical vublock mapping	22	delete_logicalvublockmapping
96	Can view logical vublock mapping	22	view_logicalvublockmapping
97	Can add vu soft agent details	23	add_vusoftagentdetails
98	Can change vu soft agent details	23	change_vusoftagentdetails
99	Can delete vu soft agent details	23	delete_vusoftagentdetails
100	Can view vu soft agent details	23	view_vusoftagentdetails
101	Can add vu soft event additional info	24	add_vusofteventadditionalinfo
102	Can change vu soft event additional info	24	change_vusofteventadditionalinfo
103	Can delete vu soft event additional info	24	delete_vusofteventadditionalinfo
104	Can view vu soft event additional info	24	view_vusofteventadditionalinfo
105	Can add vu soft event details	25	add_vusofteventdetails
106	Can change vu soft event details	25	change_vusofteventdetails
107	Can delete vu soft event details	25	delete_vusofteventdetails
108	Can view vu soft event details	25	view_vusofteventdetails
109	Can add vu soft user preferences	26	add_vusoftuserpreferences
110	Can change vu soft user preferences	26	change_vusoftuserpreferences
111	Can delete vu soft user preferences	26	delete_vusoftuserpreferences
112	Can view vu soft user preferences	26	view_vusoftuserpreferences
113	Can add vu soft asset	27	add_vusoftasset
114	Can change vu soft asset	27	change_vusoftasset
115	Can delete vu soft asset	27	delete_vusoftasset
116	Can view vu soft asset	27	view_vusoftasset
117	Can add vu soft discovery	28	add_vusoftdiscovery
118	Can change vu soft discovery	28	change_vusoftdiscovery
119	Can delete vu soft discovery	28	delete_vusoftdiscovery
120	Can view vu soft discovery	28	view_vusoftdiscovery
121	Can add vu soft node interface	29	add_vusoftnodeinterface
122	Can change vu soft node interface	29	change_vusoftnodeinterface
123	Can delete vu soft node interface	29	delete_vusoftnodeinterface
124	Can view vu soft node interface	29	view_vusoftnodeinterface
125	Can add vu soft nodes	30	add_vusoftnodes
126	Can change vu soft nodes	30	change_vusoftnodes
127	Can delete vu soft nodes	30	delete_vusoftnodes
128	Can view vu soft nodes	30	view_vusoftnodes
129	Can add vu soft scan config details	31	add_vusoftscanconfigdetails
130	Can change vu soft scan config details	31	change_vusoftscanconfigdetails
131	Can delete vu soft scan config details	31	delete_vusoftscanconfigdetails
132	Can view vu soft scan config details	31	view_vusoftscanconfigdetails
133	Can add vu soft user event relation	32	add_vusoftusereventrelation
134	Can change vu soft user event relation	32	change_vusoftusereventrelation
135	Can delete vu soft user event relation	32	delete_vusoftusereventrelation
136	Can view vu soft user event relation	32	view_vusoftusereventrelation
137	Can add vu soft module data	33	add_vusoftmoduledata
138	Can change vu soft module data	33	change_vusoftmoduledata
139	Can delete vu soft module data	33	delete_vusoftmoduledata
140	Can view vu soft module data	33	view_vusoftmoduledata
141	Can add vu soft cache	34	add_vusoftcache
142	Can change vu soft cache	34	change_vusoftcache
143	Can delete vu soft cache	34	delete_vusoftcache
144	Can view vu soft cache	34	view_vusoftcache
145	Can add vu soft rollup rules	35	add_vusoftrolluprules
146	Can change vu soft rollup rules	35	change_vusoftrolluprules
147	Can delete vu soft rollup rules	35	delete_vusoftrolluprules
148	Can view vu soft rollup rules	35	view_vusoftrolluprules
149	Can add vu soft event correlations	36	add_vusofteventcorrelations
150	Can change vu soft event correlations	36	change_vusofteventcorrelations
151	Can delete vu soft event correlations	36	delete_vusofteventcorrelations
152	Can view vu soft event correlations	36	view_vusofteventcorrelations
153	Can add vu soft configuration devices	37	add_vusoftconfigurationdevices
154	Can change vu soft configuration devices	37	change_vusoftconfigurationdevices
155	Can delete vu soft configuration devices	37	delete_vusoftconfigurationdevices
156	Can view vu soft configuration devices	37	view_vusoftconfigurationdevices
157	Can add vu soft enrichment meta data	38	add_vusoftenrichmentmetadata
158	Can change vu soft enrichment meta data	38	change_vusoftenrichmentmetadata
159	Can delete vu soft enrichment meta data	38	delete_vusoftenrichmentmetadata
160	Can view vu soft enrichment meta data	38	view_vusoftenrichmentmetadata
161	Can add vu soft enrichment data	39	add_vusoftenrichmentdata
162	Can change vu soft enrichment data	39	change_vusoftenrichmentdata
163	Can delete vu soft enrichment data	39	delete_vusoftenrichmentdata
164	Can view vu soft enrichment data	39	view_vusoftenrichmentdata
165	Can add alert rules	40	add_alertrules
166	Can change alert rules	40	change_alertrules
167	Can delete alert rules	40	delete_alertrules
168	Can view alert rules	40	view_alertrules
169	Can add data collection method	41	add_datacollectionmethod
170	Can change data collection method	41	change_datacollectionmethod
171	Can delete data collection method	41	delete_datacollectionmethod
172	Can view data collection method	41	view_datacollectionmethod
173	Can add storyboards	42	add_storyboards
174	Can change storyboards	42	change_storyboards
175	Can delete storyboards	42	delete_storyboards
176	Can view storyboards	42	view_storyboards
177	Can add vu block fields	43	add_vublockfields
178	Can change vu block fields	43	change_vublockfields
179	Can delete vu block fields	43	delete_vublockfields
180	Can view vu block fields	43	view_vublockfields
181	Can add vu block golden signals	44	add_vublockgoldensignals
182	Can change vu block golden signals	44	change_vublockgoldensignals
183	Can delete vu block golden signals	44	delete_vublockgoldensignals
184	Can view vu block golden signals	44	view_vublockgoldensignals
185	Can add vu blocks	45	add_vublocks
186	Can change vu blocks	45	change_vublocks
187	Can delete vu blocks	45	delete_vublocks
188	Can view vu blocks	45	view_vublocks
189	Can add vu block storyboards	46	add_vublockstoryboards
190	Can change vu block storyboards	46	change_vublockstoryboards
191	Can delete vu block storyboards	46	delete_vublockstoryboards
192	Can view vu block storyboards	46	view_vublockstoryboards
193	Can add vu block data sources	47	add_vublockdatasources
194	Can change vu block data sources	47	change_vublockdatasources
195	Can delete vu block data sources	47	delete_vublockdatasources
196	Can view vu block data sources	47	view_vublockdatasources
197	Can add vu block alert rules	48	add_vublockalertrules
198	Can change vu block alert rules	48	change_vublockalertrules
199	Can delete vu block alert rules	48	delete_vublockalertrules
200	Can view vu block alert rules	48	view_vublockalertrules
201	Can add vu soft alert meta data	49	add_vusoftalertmetadata
202	Can change vu soft alert meta data	49	change_vusoftalertmetadata
203	Can delete vu soft alert meta data	49	delete_vusoftalertmetadata
204	Can view vu soft alert meta data	49	view_vusoftalertmetadata
205	Can add vu orchestration	50	add_vuorchestration
206	Can change vu orchestration	50	change_vuorchestration
207	Can delete vu orchestration	50	delete_vuorchestration
208	Can view vu orchestration	50	view_vuorchestration
209	Can add vu soft snapshot metadata	51	add_vusoftsnapshotmetadata
210	Can change vu soft snapshot metadata	51	change_vusoftsnapshotmetadata
211	Can delete vu soft snapshot metadata	51	delete_vusoftsnapshotmetadata
212	Can view vu soft snapshot metadata	51	view_vusoftsnapshotmetadata
213	Can add vu host landscape	52	add_vuhostlandscape
214	Can change vu host landscape	52	change_vuhostlandscape
215	Can delete vu host landscape	52	delete_vuhostlandscape
216	Can view vu host landscape	52	view_vuhostlandscape
217	Can add vu soft etl pipeline	53	add_vusoftetlpipeline
218	Can change vu soft etl pipeline	53	change_vusoftetlpipeline
219	Can delete vu soft etl pipeline	53	delete_vusoftetlpipeline
220	Can view vu soft etl pipeline	53	view_vusoftetlpipeline
221	Can add vu soft etl settings	54	add_vusoftetlsettings
222	Can change vu soft etl settings	54	change_vusoftetlsettings
223	Can delete vu soft etl settings	54	delete_vusoftetlsettings
224	Can view vu soft etl settings	54	view_vusoftetlsettings
225	Can add vu soft device group	55	add_vusoftdevicegroup
226	Can change vu soft device group	55	change_vusoftdevicegroup
227	Can delete vu soft device group	55	delete_vusoftdevicegroup
228	Can view vu soft device group	55	view_vusoftdevicegroup
229	Can add hrms data	56	add_hrmsdata
230	Can change hrms data	56	change_hrmsdata
231	Can delete hrms data	56	delete_hrmsdata
232	Can view hrms data	56	view_hrmsdata
233	Can add vu soft asset group	57	add_vusoftassetgroup
234	Can change vu soft asset group	57	change_vusoftassetgroup
235	Can delete vu soft asset group	57	delete_vusoftassetgroup
236	Can view vu soft asset group	57	view_vusoftassetgroup
237	Can add vu soft policy	58	add_vusoftpolicy
238	Can change vu soft policy	58	change_vusoftpolicy
239	Can delete vu soft policy	58	delete_vusoftpolicy
240	Can view vu soft policy	58	view_vusoftpolicy
241	Can add asset audit trail	59	add_assetaudittrail
242	Can change asset audit trail	59	change_assetaudittrail
243	Can delete asset audit trail	59	delete_assetaudittrail
244	Can view asset audit trail	59	view_assetaudittrail
245	Can add vu soft reports template	60	add_vusoftreportstemplate
246	Can change vu soft reports template	60	change_vusoftreportstemplate
247	Can delete vu soft reports template	60	delete_vusoftreportstemplate
248	Can view vu soft reports template	60	view_vusoftreportstemplate
249	Can add vu soft reports	61	add_vusoftreports
250	Can change vu soft reports	61	change_vusoftreports
251	Can delete vu soft reports	61	delete_vusoftreports
252	Can view vu soft reports	61	view_vusoftreports
253	Can add vusoft fcm token	62	add_vusoftfcmtoken
254	Can change vusoft fcm token	62	change_vusoftfcmtoken
255	Can delete vusoft fcm token	62	delete_vusoftfcmtoken
256	Can view vusoft fcm token	62	view_vusoftfcmtoken
257	Can add vu block data streams configs	63	add_vublockdatastreamsconfigs
258	Can change vu block data streams configs	63	change_vublockdatastreamsconfigs
259	Can delete vu block data streams configs	63	delete_vublockdatastreamsconfigs
260	Can view vu block data streams configs	63	view_vublockdatastreamsconfigs
261	Can add vu soft collection info	64	add_vusoftcollectioninfo
262	Can change vu soft collection info	64	change_vusoftcollectioninfo
263	Can delete vu soft collection info	64	delete_vusoftcollectioninfo
264	Can view vu soft collection info	64	view_vusoftcollectioninfo
265	Can add vu soft configlet metadata	65	add_vusoftconfigletmetadata
266	Can change vu soft configlet metadata	65	change_vusoftconfigletmetadata
267	Can delete vu soft configlet metadata	65	delete_vusoftconfigletmetadata
268	Can view vu soft configlet metadata	65	view_vusoftconfigletmetadata
269	Can add alert rule	66	add_alertrule
270	Can change alert rule	66	change_alertrule
271	Can delete alert rule	66	delete_alertrule
272	Can view alert rule	66	view_alertrule
273	Can add hrms mapping	67	add_hrmsmapping
274	Can change hrms mapping	67	change_hrmsmapping
275	Can delete hrms mapping	67	delete_hrmsmapping
276	Can view hrms mapping	67	view_hrmsmapping
277	Can add data streams	68	add_datastreams
278	Can change data streams	68	change_datastreams
279	Can delete data streams	68	delete_datastreams
280	Can view data streams	68	view_datastreams
281	Can add data stream service mapping	69	add_datastreamservicemapping
282	Can change data stream service mapping	69	change_datastreamservicemapping
283	Can delete data stream service mapping	69	delete_datastreamservicemapping
284	Can view data stream service mapping	69	view_datastreamservicemapping
285	Can add vu streams connectors	70	add_vustreamsconnectors
286	Can change vu streams connectors	70	change_vustreamsconnectors
287	Can delete vu streams connectors	70	delete_vustreamsconnectors
288	Can view vu streams connectors	70	view_vustreamsconnectors
289	Can add vu soft named network group	71	add_vusoftnamednetworkgroup
290	Can change vu soft named network group	71	change_vusoftnamednetworkgroup
291	Can delete vu soft named network group	71	delete_vusoftnamednetworkgroup
292	Can view vu soft named network group	71	view_vusoftnamednetworkgroup
293	Can add vu soft named network	72	add_vusoftnamednetwork
294	Can change vu soft named network	72	change_vusoftnamednetwork
295	Can delete vu soft named network	72	delete_vusoftnamednetwork
296	Can view vu soft named network	72	view_vusoftnamednetwork
297	Can add vu soft link information	73	add_vusoftlinkinformation
298	Can change vu soft link information	73	change_vusoftlinkinformation
299	Can delete vu soft link information	73	delete_vusoftlinkinformation
300	Can view vu soft link information	73	view_vusoftlinkinformation
301	Can add mobile dashboard	74	add_mobiledashboard
302	Can change mobile dashboard	74	change_mobiledashboard
303	Can delete mobile dashboard	74	delete_mobiledashboard
304	Can view mobile dashboard	74	view_mobiledashboard
305	Can add vu soft auto_ remediation_ script_ track	75	add_vusoftauto_remediation_script_track
306	Can change vu soft auto_ remediation_ script_ track	75	change_vusoftauto_remediation_script_track
307	Can delete vu soft auto_ remediation_ script_ track	75	delete_vusoftauto_remediation_script_track
308	Can view vu soft auto_ remediation_ script_ track	75	view_vusoftauto_remediation_script_track
309	Can add access attempt	78	add_accessattempt
310	Can change access attempt	78	change_accessattempt
311	Can delete access attempt	78	delete_accessattempt
312	Can view access attempt	78	view_accessattempt
313	Can add application	79	add_application
314	Can change application	79	change_application
315	Can delete application	79	delete_application
316	Can view application	79	view_application
317	Can add access token	80	add_accesstoken
318	Can change access token	80	change_accesstoken
319	Can delete access token	80	delete_accesstoken
320	Can view access token	80	view_accesstoken
321	Can add grant	81	add_grant
322	Can change grant	81	change_grant
323	Can delete grant	81	delete_grant
324	Can view grant	81	view_grant
325	Can add refresh token	82	add_refreshtoken
326	Can change refresh token	82	change_refreshtoken
327	Can delete refresh token	82	delete_refreshtoken
328	Can view refresh token	82	view_refreshtoken
329	Can add captcha store	83	add_captchastore
330	Can change captcha store	83	change_captchastore
331	Can delete captcha store	83	delete_captchastore
332	Can view captcha store	83	view_captchastore
333	Can add session	84	add_customsession
334	Can change session	84	change_customsession
335	Can delete session	84	delete_customsession
336	Can view session	84	view_customsession
337	Can add groups	85	add_groups
338	Can change groups	85	change_groups
339	Can delete groups	85	delete_groups
340	Can view groups	85	view_groups
341	Can add user profile	86	add_userprofile
342	Can change user profile	86	change_userprofile
343	Can delete user profile	86	delete_userprofile
344	Can view user profile	86	view_userprofile
345	Can add utm	87	add_utm
346	Can change utm	87	change_utm
347	Can delete utm	87	delete_utm
348	Can view utm	87	view_utm
349	Can add vu data lake job	88	add_vudatalakejob
350	Can change vu data lake job	88	change_vudatalakejob
351	Can delete vu data lake job	88	delete_vudatalakejob
352	Can view vu data lake job	88	view_vudatalakejob
353	Can add spark job history	89	add_sparkjobhistory
354	Can change spark job history	89	change_sparkjobhistory
355	Can delete spark job history	89	delete_sparkjobhistory
356	Can view spark job history	89	view_sparkjobhistory
357	Can add insight cards	90	add_insightcards
358	Can change insight cards	90	change_insightcards
359	Can delete insight cards	90	delete_insightcards
360	Can view insight cards	90	view_insightcards
361	Can add vublock dashboard configs	91	add_vublockdashboardconfigs
362	Can change vublock dashboard configs	91	change_vublockdashboardconfigs
363	Can delete vublock dashboard configs	91	delete_vublockdashboardconfigs
364	Can view vublock dashboard configs	91	view_vublockdashboardconfigs
365	Can add vu soft data retention	92	add_vusoftdataretention
366	Can change vu soft data retention	92	change_vusoftdataretention
367	Can delete vu soft data retention	92	delete_vusoftdataretention
368	Can view vu soft data retention	92	view_vusoftdataretention
369	Can add vublock alert rule configs	93	add_vublockalertruleconfigs
370	Can change vublock alert rule configs	93	change_vublockalertruleconfigs
371	Can delete vublock alert rule configs	93	delete_vublockalertruleconfigs
372	Can view vublock alert rule configs	93	view_vublockalertruleconfigs
373	Can add vublock datamodel configs	94	add_vublockdatamodelconfigs
374	Can change vublock datamodel configs	94	change_vublockdatamodelconfigs
375	Can delete vublock datamodel configs	94	delete_vublockdatamodelconfigs
376	Can view vublock datamodel configs	94	view_vublockdatamodelconfigs
377	Can add vublock diagnostic	95	add_vublockdiagnostic
378	Can change vublock diagnostic	95	change_vublockdiagnostic
379	Can delete vublock diagnostic	95	delete_vublockdiagnostic
380	Can view vublock diagnostic	95	view_vublockdiagnostic
381	Can add vu block topic diagnostic	96	add_vublocktopicdiagnostic
382	Can change vu block topic diagnostic	96	change_vublocktopicdiagnostic
383	Can delete vu block topic diagnostic	96	delete_vublocktopicdiagnostic
384	Can view vu block topic diagnostic	96	view_vublocktopicdiagnostic
385	Can add vublock service diagnostic	97	add_vublockservicediagnostic
386	Can change vublock service diagnostic	97	change_vublockservicediagnostic
387	Can delete vublock service diagnostic	97	delete_vublockservicediagnostic
388	Can view vublock service diagnostic	97	view_vublockservicediagnostic
389	Can add vu soft event correlations	98	add_vusofteventcorrelations
390	Can change vu soft event correlations	98	change_vusofteventcorrelations
391	Can delete vu soft event correlations	98	delete_vusofteventcorrelations
392	Can view vu soft event correlations	98	view_vusofteventcorrelations
393	Can add vu soft chat conversation	99	add_vusoftchatconversation
394	Can change vu soft chat conversation	99	change_vusoftchatconversation
395	Can delete vu soft chat conversation	99	delete_vusoftchatconversation
396	Can view vu soft chat conversation	99	view_vusoftchatconversation
397	Can add vu soft chat entry	100	add_vusoftchatentry
398	Can change vu soft chat entry	100	change_vusoftchatentry
399	Can delete vu soft chat entry	100	delete_vusoftchatentry
400	Can view vu soft chat entry	100	view_vusoftchatentry
401	Can add vu soft event correlations int	101	add_vusofteventcorrelationsint
402	Can change vu soft event correlations int	101	change_vusofteventcorrelationsint
403	Can delete vu soft event correlations int	101	delete_vusofteventcorrelationsint
404	Can view vu soft event correlations int	101	view_vusofteventcorrelationsint
405	Can add vu soft event correlations old	36	add_vusofteventcorrelationsold
406	Can change vu soft event correlations old	36	change_vusofteventcorrelationsold
407	Can delete vu soft event correlations old	36	delete_vusofteventcorrelationsold
408	Can view vu soft event correlations old	36	view_vusofteventcorrelationsold
409	Can add vu soft user event relation int	102	add_vusoftusereventrelationint
410	Can change vu soft user event relation int	102	change_vusoftusereventrelationint
411	Can delete vu soft user event relation int	102	delete_vusoftusereventrelationint
412	Can view vu soft user event relation int	102	view_vusoftusereventrelationint
413	Can add vublock	103	add_vublock
414	Can change vublock	103	change_vublock
415	Can delete vublock	103	delete_vublock
416	Can view vublock	103	view_vublock
417	Can add vublock jinja template	104	add_vublockjinjatemplate
418	Can change vublock jinja template	104	change_vublockjinjatemplate
419	Can delete vublock jinja template	104	delete_vublockjinjatemplate
420	Can view vublock jinja template	104	view_vublockjinjatemplate
421	Can add vublock source	105	add_vublocksource
422	Can change vublock source	105	change_vublocksource
423	Can delete vublock source	105	delete_vublocksource
424	Can view vublock source	105	view_vublocksource
425	Can add kafka topic metrics	106	add_kafkatopicmetrics
426	Can change kafka topic metrics	106	change_kafkatopicmetrics
427	Can delete kafka topic metrics	106	delete_kafkatopicmetrics
428	Can view kafka topic metrics	106	view_kafkatopicmetrics
429	Can add system parts	107	add_systemparts
430	Can change system parts	107	change_systemparts
431	Can delete system parts	107	delete_systemparts
432	Can view system parts	107	view_systemparts
433	Can add vu soft data management	108	add_vusoftdatamanagement
434	Can change vu soft data management	108	change_vusoftdatamanagement
435	Can delete vu soft data management	108	delete_vusoftdatamanagement
436	Can view vu soft data management	108	view_vusoftdatamanagement
437	Can add group object permission	109	add_groupobjectpermission
438	Can change group object permission	109	change_groupobjectpermission
439	Can delete group object permission	109	delete_groupobjectpermission
440	Can view group object permission	109	view_groupobjectpermission
441	Can add user object permission	110	add_userobjectpermission
442	Can change user object permission	110	change_userobjectpermission
443	Can delete user object permission	110	delete_userobjectpermission
444	Can view user object permission	110	view_userobjectpermission
445	Can add user group membership	111	add_usergroupmembership
446	Can change user group membership	111	change_usergroupmembership
447	Can delete user group membership	111	delete_usergroupmembership
448	Can view user group membership	111	view_usergroupmembership
449	Can add system row policies	112	add_systemrowpolicies
450	Can change system row policies	112	change_systemrowpolicies
451	Can delete system row policies	112	delete_systemrowpolicies
452	Can view system row policies	112	view_systemrowpolicies
453	Can add system tables	113	add_systemtables
454	Can change system tables	113	change_systemtables
455	Can delete system tables	113	delete_systemtables
456	Can view system tables	113	view_systemtables
457	Can add data access policy	114	add_dataaccesspolicy
458	Can change data access policy	114	change_dataaccesspolicy
459	Can delete data access policy	114	delete_dataaccesspolicy
460	Can view data access policy	114	view_dataaccesspolicy
461	Can add metric	115	add_metric
462	Can change metric	115	change_metric
463	Can delete metric	115	delete_metric
464	Can view metric	115	view_metric
465	Can add metric item	116	add_metricitem
466	Can change metric item	116	change_metricitem
467	Can delete metric item	116	delete_metricitem
468	Can view metric item	116	view_metricitem
469	Can add apm span mv	117	add_apmspanmv
470	Can change apm span mv	117	change_apmspanmv
471	Can delete apm span mv	117	delete_apmspanmv
472	Can view apm span mv	117	view_apmspanmv
473	Can add service map mv	118	add_servicemapmv
474	Can change service map mv	118	change_servicemapmv
475	Can delete service map mv	118	delete_servicemapmv
476	Can view service map mv	118	view_servicemapmv
477	Can add span	119	add_span
478	Can change span	119	change_span
479	Can delete span	119	delete_span
480	Can view span	119	view_span
481	Can add event correlation config	120	add_eventcorrelationconfig
482	Can change event correlation config	120	change_eventcorrelationconfig
483	Can delete event correlation config	120	delete_eventcorrelationconfig
484	Can view event correlation config	120	view_eventcorrelationconfig
485	Can add vu soft correlated events	121	add_vusoftcorrelatedevents
486	Can change vu soft correlated events	121	change_vusoftcorrelatedevents
487	Can delete vu soft correlated events	121	delete_vusoftcorrelatedevents
488	Can view vu soft correlated events	121	view_vusoftcorrelatedevents
489	Can add events feedback	122	add_eventsfeedback
490	Can change events feedback	122	change_eventsfeedback
491	Can delete events feedback	122	delete_eventsfeedback
492	Can view events feedback	122	view_eventsfeedback
493	Can add rca comments and feedback	123	add_rcacommentsandfeedback
494	Can change rca comments and feedback	123	change_rcacommentsandfeedback
495	Can delete rca comments and feedback	123	delete_rcacommentsandfeedback
496	Can view rca comments and feedback	123	view_rcacommentsandfeedback
497	Can add trial run	124	add_trialrun
498	Can change trial run	124	change_trialrun
499	Can delete trial run	124	delete_trialrun
500	Can view trial run	124	view_trialrun
501	Can add notification config	125	add_notificationconfig
502	Can change notification config	125	change_notificationconfig
503	Can delete notification config	125	delete_notificationconfig
504	Can view notification config	125	view_notificationconfig
505	Can add user engagement log	126	add_userengagementlog
506	Can change user engagement log	126	change_userengagementlog
507	Can delete user engagement log	126	delete_userengagementlog
508	Can view user engagement log	126	view_userengagementlog
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
3		\N	f	Vunet Admin User				f	t	2023-02-02 21:35:31.864244+05:30
4		\N	f	do_not_touch				f	t	2023-02-03 11:35:31.970859+05:30
5	!ippwaoaoChLgYZChhlAu9qS8wPgNz5Z8qGzXtXcC	\N	f	AnonymousUser				f	t	2024-02-21 11:11:18.472025+05:30
2		\N	t	vunetadmin				f	t	2023-02-01 15:50:31.879315+05:30
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: captcha_captchastore; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.captcha_captchastore (id, challenge, response, hashkey, expiration) FROM stdin;
\.


--
-- Data for Name: defender_accessattempt; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.defender_accessattempt (id, user_agent, ip_address, username, http_accept, path_info, attempt_time, login_valid) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	auth	permission
2	auth	group
3	auth	user
4	contenttypes	contenttype
5	vusoft	vusoftbu
6	vusoft	vusoftbucredential
7	vusoft	vusoftbuscan
8	vusoft	vusoftnode
9	vusoft	vusoftnodebuleveldata
10	vusoft	vusoftnodelink
11	vusoft	vusoftobjectidentification
12	vusoft	vusoftsnapshot
13	vusoft	vusoftsnapshotnode
14	vusoft	vusoftsnapshotnodelink
15	vusoft	vusoftsnapshotvulnerability
16	vusoft	vusofttenant
17	vusoft	vusofttopology
18	vusoft	vusoftbualertcfg
19	vusoft	vusofttenantdata
20	vusoft	vusoftbucredentials
21	vusoft	vusofttenantattributes
22	vusoft	logicalvublockmapping
23	vusoft	vusoftagentdetails
24	vusoft	vusofteventadditionalinfo
25	vusoft	vusofteventdetails
26	vusoft	vusoftuserpreferences
27	vusoft	vusoftasset
28	vusoft	vusoftdiscovery
29	vusoft	vusoftnodeinterface
30	vusoft	vusoftnodes
31	vusoft	vusoftscanconfigdetails
32	vusoft	vusoftusereventrelation
33	vusoft	vusoftmoduledata
34	vusoft	vusoftcache
35	vusoft	vusoftrolluprules
37	vusoft	vusoftconfigurationdevices
38	vusoft	vusoftenrichmentmetadata
39	vusoft	vusoftenrichmentdata
40	vusoft	alertrules
41	vusoft	datacollectionmethod
42	vusoft	storyboards
43	vusoft	vublockfields
44	vusoft	vublockgoldensignals
45	vusoft	vublocks
46	vusoft	vublockstoryboards
47	vusoft	vublockdatasources
48	vusoft	vublockalertrules
49	vusoft	vusoftalertmetadata
50	vusoft	vuorchestration
51	vusoft	vusoftsnapshotmetadata
52	vusoft	vuhostlandscape
53	vusoft	vusoftetlpipeline
54	vusoft	vusoftetlsettings
55	vusoft	vusoftdevicegroup
56	vusoft	hrmsdata
57	vusoft	vusoftassetgroup
58	vusoft	vusoftpolicy
59	vusoft	assetaudittrail
60	vusoft	vusoftreportstemplate
61	vusoft	vusoftreports
62	vusoft	vusoftfcmtoken
63	vusoft	vublockdatastreamsconfigs
64	vusoft	vusoftcollectioninfo
65	vusoft	vusoftconfigletmetadata
66	vusoft	alertrule
67	vusoft	hrmsmapping
68	vusoft	datastreams
69	vusoft	datastreamservicemapping
70	vusoft	vustreamsconnectors
71	vusoft	vusoftnamednetworkgroup
72	vusoft	vusoftnamednetwork
73	vusoft	vusoftlinkinformation
74	vusoft	mobiledashboard
75	vusoft	vusoftauto_remediation_script_track
76	admin	logentry
77	sessions	session
78	defender	accessattempt
79	oauth2_provider	application
80	oauth2_provider	accesstoken
81	oauth2_provider	grant
82	oauth2_provider	refreshtoken
83	captcha	captchastore
84	vu_auth_provider	customsession
85	vu_auth_provider	groups
86	vu_auth_provider	userprofile
87	vusoft	utm
88	vusoft	vudatalakejob
89	vusoft	sparkjobhistory
36	vusoft	vusofteventcorrelationsold
90	vusoft	insightcards
91	vusoft	vublockdashboardconfigs
92	vusoft	vusoftdataretention
93	vusoft	vublockalertruleconfigs
94	vusoft	vublockdatamodelconfigs
95	vusoft	vublockdiagnostic
96	vusoft	vublocktopicdiagnostic
97	vusoft	vublockservicediagnostic
98	vusoft	vusofteventcorrelations
99	vusoft	vusoftchatconversation
100	vusoft	vusoftchatentry
101	vusoft	vusofteventcorrelationsint
102	vusoft	vusoftusereventrelationint
103	vusoft	vublock
104	vusoft	vublockjinjatemplate
105	vusoft	vublocksource
106	vusoft	kafkatopicmetrics
107	vusoft	systemparts
108	vusoft	vusoftdatamanagement
109	guardian	groupobjectpermission
110	guardian	userobjectpermission
111	vu_auth_provider	usergroupmembership
112	vu_auth_provider	systemrowpolicies
113	vu_auth_provider	systemtables
114	vu_auth_provider	dataaccesspolicy
115	metrics	metric
116	metrics	metricitem
117	apm	apmspanmv
118	apm	servicemapmv
119	apm	span
120	event_correlation	eventcorrelationconfig
121	event_correlation	vusoftcorrelatedevents
122	event_correlation	eventsfeedback
123	event_correlation	rcacommentsandfeedback
124	event_correlation	trialrun
125	notification_management	notificationconfig
126	user_engagement	userengagementlog
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2023-02-01 15:05:56.934904+05:30
2	auth	0001_initial	2023-02-01 15:05:57.025342+05:30
3	vusoft	0001_initial	2023-02-01 15:05:57.027983+05:30
4	vusoft	0002_vusoftbu_vusoftbucredential_vusoftbuscan_vusoftnode_vusoftnodebuleveldata_vusoftnodelink_vusoftobjec	2023-02-01 15:05:57.130975+05:30
5	vusoft	0003_delete_vusoftvulnerability	2023-02-01 15:05:57.136355+05:30
6	vusoft	0004_vusoftbualertcfg	2023-02-01 15:05:57.149225+05:30
7	vusoft	0005_vusofttenantdata	2023-02-01 15:05:57.162654+05:30
8	vusoft	0006_vusoftuserprofile_home_page	2023-02-01 15:05:57.16593+05:30
9	vusoft	0007_vusoftbucredentials	2023-02-01 15:05:57.177846+05:30
10	vusoft	0008_auto_20171023_1405	2023-02-01 15:05:57.191291+05:30
11	vusoft	0009_auto_20171107_0003	2023-02-01 15:05:57.402468+05:30
12	vusoft	0010_vusoftuserprofile_mobile_kpi	2023-02-01 15:05:57.405862+05:30
13	vusoft	0011_groups_search_string	2023-02-01 15:05:57.40913+05:30
14	vusoft	0012_auto_20181209_2245	2023-02-01 15:05:57.421488+05:30
15	vusoft	0013_merge	2023-02-01 15:05:57.424428+05:30
16	vusoft	0014_vusoftuserprofile_allow_console_login	2023-02-01 15:05:57.427092+05:30
17	vusoft	0015_auto_20201103_1349	2023-02-01 15:05:57.449257+05:30
18	vusoft	0016_vusofteventdetails_related_dashboard	2023-02-01 15:05:57.482325+05:30
19	vusoft	0017_vusofteventdetails_ticket_id	2023-02-01 15:05:57.490262+05:30
20	vusoft	0018_vusoftasset	2023-02-01 15:05:57.505567+05:30
21	vusoft	0019_auto_20210108_1542	2023-02-01 15:05:57.550105+05:30
22	vusoft	0020_auto_20210112_1057	2023-02-01 15:05:57.562329+05:30
23	vusoft	0021_auto_20210209_1722	2023-02-01 15:05:57.565459+05:30
24	vusoft	0022_auto_20210324_1814	2023-02-01 15:05:57.598862+05:30
25	vusoft	0023_auto_20210311_1241	2023-02-01 15:05:57.614895+05:30
26	vusoft	0023_vusoftmoduledata	2023-02-01 15:05:57.629007+05:30
27	vusoft	0024_vusoftlogindata	2023-02-01 15:05:57.632483+05:30
28	vusoft	0025_delete_vusoftlogindata	2023-02-01 15:05:57.635553+05:30
29	vusoft	0025_vusoftmoduledata_date	2023-02-01 15:05:57.64227+05:30
30	vusoft	0026_vusoftcache	2023-02-01 15:05:57.656302+05:30
31	vusoft	0026_vusoftrolluprules	2023-02-01 15:05:57.669541+05:30
32	vusoft	0027_vusofteventcorrelations	2023-02-01 15:05:57.684908+05:30
33	vusoft	0028_vusoftconfigurationfamily	2023-02-01 15:05:57.687972+05:30
34	vusoft	0029_vusoftconfigurationdevices	2023-02-01 15:05:57.701271+05:30
35	vusoft	0028_auto_20210518_1235	2023-02-01 15:05:57.728236+05:30
36	vusoft	0028_auto_20210506_1347	2023-02-01 15:05:57.765704+05:30
37	vusoft	0029_auto_20210518_1207	2023-02-01 15:05:57.772977+05:30
38	vusoft	0030_auto_20210209_1723	2023-02-01 15:05:57.775725+05:30
39	vusoft	0031_create_groups_field	2023-02-01 15:05:57.778441+05:30
40	vusoft	0031_group_info_transfer	2023-02-01 15:05:57.782342+05:30
41	vusoft	0031_remove_group_field	2023-02-01 15:05:57.786876+05:30
42	vusoft	0024_vublock_manage_ui	2023-02-01 15:05:57.897063+05:30
43	vusoft	0025_auto_20210405_0840	2023-02-01 15:05:57.903982+05:30
44	vusoft	0028_merge_20210503_2220	2023-02-01 15:05:57.953032+05:30
45	vusoft	0029_auto_20210713_1546	2023-02-01 15:05:57.9865+05:30
46	vusoft	0032_vunetadmin_manage_service_portal	2023-02-01 15:05:57.990813+05:30
47	vusoft	0030_auto_20210806_1746	2023-02-01 15:05:58.040706+05:30
48	vusoft	0033_auto_20210805_2203	2023-02-01 15:05:58.070025+05:30
49	vusoft	0034_vusoftalertmetadata_no_bucket_count	2023-02-01 15:05:58.078483+05:30
50	vusoft	0035_auto_20210813_1632	2023-02-01 15:05:58.089723+05:30
51	vusoft	0036_auto_20210818_1942	2023-02-01 15:05:58.133868+05:30
52	vusoft	0037_auto_20210818_1526	2023-02-01 15:05:58.137451+05:30
53	vusoft	0038_auto_20210831_2351	2023-02-01 15:05:58.155+05:30
54	vusoft	0039_vusoftasset_device_model	2023-02-01 15:05:58.166739+05:30
55	vusoft	0040_auto_20210916_1027	2023-02-01 15:05:58.182422+05:30
56	vusoft	0041_user_auth_type	2023-02-01 15:05:58.185879+05:30
57	vusoft	0041_etl	2023-02-01 15:05:58.207645+05:30
58	vusoft	0042_vusoftdevicegroup	2023-02-01 15:05:58.24304+05:30
59	vusoft	0043_devicegroupindex	2023-02-01 15:05:58.246016+05:30
60	vusoft	0044_vusoftconfigurationdevices_environment_variables	2023-02-01 15:05:58.260944+05:30
61	vusoft	0045_auto_20211014_2056	2023-02-01 15:05:58.272879+05:30
62	vusoft	0046_auto_20211018_1654	2023-02-01 15:05:58.285926+05:30
63	vusoft	0047_auto_20211018_1717	2023-02-01 15:05:58.289505+05:30
64	vusoft	0048_vusoftassetgroup	2023-02-01 15:05:58.320979+05:30
65	vusoft	0049_vusoftconfigurationdevices_last_updated_time	2023-02-01 15:05:58.331955+05:30
66	vusoft	0049_home_dashboard_group_level	2023-02-01 15:05:58.335045+05:30
67	vusoft	0050_auto_20211111_2157	2023-02-01 15:05:58.421316+05:30
68	vusoft	0051_auto_20211125_1750	2023-02-01 15:05:58.440133+05:30
69	vusoft	0052_auto_20211126_1041	2023-02-01 15:05:58.464043+05:30
70	vusoft	0053_assetaudittrail	2023-02-01 15:05:58.485344+05:30
71	vusoft	0054_auto_20211204_0119	2023-02-01 15:05:58.496794+05:30
72	vusoft	0055_vusoftenrichmentdata_last_modified_at	2023-02-01 15:05:58.508001+05:30
73	vusoft	0056_auto_20211210_1434	2023-02-01 15:05:58.528798+05:30
74	vusoft	0057_vusoftscanconfigdetails_file_name	2023-02-01 15:05:58.554959+05:30
75	vusoft	0058_auto_20211225_1611	2023-02-01 15:05:58.580703+05:30
76	vusoft	0059_auto_20220103_2024	2023-02-01 15:05:58.622522+05:30
77	vusoft	0060_vusoftuserprofile_department	2023-02-01 15:05:58.626676+05:30
78	vusoft	0061_auto_20220124_1119	2023-02-01 15:05:58.635324+05:30
79	vusoft	0062_vusoftreports_vusoftreportstemplate	2023-02-01 15:05:58.666331+05:30
80	vusoft	0063_auto_20220215_1228	2023-02-01 15:05:58.685644+05:30
81	vusoft	0064_vusoftasset_last_scan_name	2023-02-01 15:05:58.701336+05:30
82	vusoft	0065_auto_20220307_1153	2023-02-01 15:05:58.741658+05:30
83	vusoft	0066_auto_20220302_1003	2023-02-01 15:05:58.773575+05:30
84	vusoft	0067_auto_20220311_1520	2023-02-01 15:05:58.788239+05:30
85	vusoft	0068_vusoftfcmtoken	2023-02-01 15:05:58.814375+05:30
86	vusoft	0069_vusoftetlpipeline_created_time	2023-02-01 15:05:58.824855+05:30
87	vusoft	0070_auto_20220503_1500	2023-02-01 15:05:58.903488+05:30
88	vusoft	0071_auto_20220510_1808	2023-02-01 15:05:58.908199+05:30
89	vusoft	0072_vusoftetlpipeline_pipeline_image_name	2023-02-01 15:05:58.921617+05:30
90	vusoft	0073_auto_20220727_1736	2023-02-01 15:05:59.20315+05:30
91	vusoft	0074_vublockdatastreamsconfigs	2023-02-01 15:05:59.219803+05:30
92	vusoft	0075_auto_20220812_1228	2023-02-01 15:05:59.371844+05:30
93	vusoft	0076_auto_20220812_1133	2023-02-01 15:05:59.375181+05:30
94	vusoft	0077_alertrule	2023-02-01 15:05:59.387809+05:30
95	vusoft	0078_auto_20220912_1817	2023-02-01 15:05:59.418647+05:30
96	vusoft	0079_auto_20220825_2101	2023-02-01 15:05:59.421826+05:30
97	vusoft	0080_hrmsmapping	2023-02-01 15:05:59.434676+05:30
98	vusoft	0081_alter_vusoftconfigurationdevices_last_updated_time	2023-02-01 15:05:59.446973+05:30
99	vusoft	0082_datastreams_datastreamservicemapping	2023-02-01 15:05:59.473538+05:30
100	vusoft	0083_vustreamsconnectors_vustreamspipeline	2023-02-01 15:05:59.490743+05:30
101	vusoft	0084_auto_20220916_1221	2023-02-01 15:05:59.57896+05:30
102	vusoft	0085_auto_20221006_1507	2023-02-01 15:05:59.635534+05:30
103	vusoft	0086_auto_20221011_1406	2023-02-01 15:05:59.653143+05:30
104	vusoft	0087_auto_20220929_1540	2023-02-01 15:05:59.834878+05:30
105	vusoft	0088_auto_20221014_1835	2023-02-01 15:05:59.84957+05:30
106	vusoft	0089_auto_20221026_1207	2023-02-01 15:05:59.890615+05:30
107	vusoft	0090_auto_20221026_1224	2023-02-01 15:05:59.929217+05:30
108	vusoft	0091_auto_20221026_1345	2023-02-01 15:05:59.982614+05:30
109	vusoft	0092_auto_20221114_1131	2023-02-01 15:06:00.092658+05:30
110	vusoft	0093_auto_20221110_0001	2023-02-01 15:06:00.131194+05:30
111	vusoft	0094_auto_20221028_1717	2023-02-01 15:06:00.139187+05:30
112	vusoft	0095_auto_20221116_0403	2023-02-01 15:06:00.175231+05:30
113	vusoft	0096_create_model_for_mobile_dashboard_config	2023-02-01 15:06:00.222143+05:30
114	vusoft	0097_alter_vusoftreportstemplate_report_template_name	2023-02-01 15:06:00.238842+05:30
115	vusoft	0098_auto_20221221_1709	2023-02-01 15:06:00.271675+05:30
116	vusoft	0099_event_correlations_remove_likes_dislikes_and_datetime_field_changes	2023-02-01 15:06:00.308195+05:30
117	admin	0001_initial	2023-02-01 15:13:12.726978+05:30
118	admin	0002_logentry_remove_auto_add	2023-02-01 15:13:12.743078+05:30
119	admin	0003_logentry_add_action_flag_choices	2023-02-01 15:13:12.758496+05:30
120	contenttypes	0002_remove_content_type_name	2023-02-01 15:13:12.855216+05:30
121	auth	0002_alter_permission_name_max_length	2023-02-01 15:13:12.871465+05:30
122	auth	0003_alter_user_email_max_length	2023-02-01 15:13:12.887242+05:30
123	auth	0004_alter_user_username_opts	2023-02-01 15:13:12.908103+05:30
124	auth	0005_alter_user_last_login_null	2023-02-01 15:13:12.927209+05:30
125	auth	0006_require_contenttypes_0002	2023-02-01 15:13:12.930665+05:30
126	auth	0007_alter_validators_add_error_messages	2023-02-01 15:13:12.950425+05:30
127	auth	0008_alter_user_username_max_length	2023-02-01 15:13:12.978402+05:30
128	auth	0009_alter_user_last_name_max_length	2023-02-01 15:13:12.995591+05:30
129	auth	0010_alter_group_name_max_length	2023-02-01 15:13:13.015455+05:30
130	auth	0011_update_proxy_permissions	2023-02-01 15:13:13.100267+05:30
131	auth	0012_alter_user_first_name_max_length	2023-02-01 15:13:13.117759+05:30
132	captcha	0001_initial	2023-02-01 15:13:13.135628+05:30
133	defender	0001_initial	2023-02-01 15:13:13.151069+05:30
134	oauth2_provider	0001_initial	2023-02-01 15:13:13.308307+05:30
135	oauth2_provider	0002_auto_20190406_1805	2023-02-01 15:13:13.345024+05:30
136	sessions	0001_initial	2023-02-01 15:13:13.362494+05:30
137	vu_auth_provider	0001_initial	2023-02-01 15:13:13.444133+05:30
138	vu_auth_provider	0002_alter_groups_name	2023-02-01 15:13:13.478+05:30
139	vusoft	0100_utm	2023-02-28 22:00:09.728731+05:30
140	vusoft	0101_alter_utm_options	2023-02-28 22:00:09.738168+05:30
141	vusoft	0102_alter_mobiledashboard_options	2023-02-28 22:00:09.780607+05:30
142	vusoft	0103_vuorchestration_config_file_name	2023-03-09 12:41:57.876113+05:30
143	vusoft	0104_vudatalakejob	2023-03-09 12:41:57.912322+05:30
144	vusoft	0105_sparkjobhistory	2023-03-09 12:41:57.925729+05:30
145	apm	0001_initial	2024-02-21 11:11:07.339112+05:30
146	captcha	0002_alter_captchastore_id	2024-02-21 11:11:07.34866+05:30
147	event_correlation	0001_initial	2024-02-21 11:11:07.403189+05:30
148	event_correlation	0002_vusoftcorrelatedevents	2024-02-21 11:11:07.433948+05:30
149	event_correlation	0003_vusoftcorrelatedevents_is_standalone_and_more	2024-02-21 11:11:07.464891+05:30
150	event_correlation	0004_eventsfeedback	2024-02-21 11:11:07.487871+05:30
151	event_correlation	0005_vusoftcorrelatedevents_work_status	2024-02-21 11:11:07.499924+05:30
152	event_correlation	0006_alter_vusoftcorrelatedevents_description_and_more	2024-02-21 11:11:07.629491+05:30
153	event_correlation	0007_rename_is_standalone_vusoftcorrelatedevents_is_standalone_3t_and_more	2024-02-21 11:11:07.677861+05:30
154	event_correlation	0008_rcacommentsandfeedback_and_more	2024-02-21 11:11:07.717392+05:30
155	event_correlation	0009_remove_vusoftcorrelatedevents_is_test_run_and_more	2024-02-21 11:11:07.749058+05:30
156	event_correlation	0010_vusoftcorrelatedevents_workspace_name	2024-02-21 11:11:07.762165+05:30
157	event_correlation	0011_vusoftcorrelatedevents_is_rca_filled_up	2024-02-21 11:11:07.77544+05:30
158	event_correlation	0012_alter_vusoftcorrelatedevents_event_id	2024-02-21 11:11:07.798447+05:30
159	event_correlation	0013_alter_eventcorrelationconfig_bu_id_and_more	2024-02-21 11:11:07.884173+05:30
160	event_correlation	0014_vusoftcorrelatedevents_related_dashboards_and_more	2024-02-21 11:11:07.917867+05:30
161	guardian	0001_initial	2024-02-21 11:11:08.129859+05:30
162	guardian	0002_generic_permissions_index	2024-02-21 11:11:08.192038+05:30
163	metrics	0001_initial	2024-02-21 11:11:08.317846+05:30
164	notification_management	0001_initial	2024-02-21 11:11:08.357631+05:30
165	notification_management	0002_alter_notificationconfig_severity	2024-02-21 11:11:08.371955+05:30
166	user_engagement	0001_initial	2024-02-21 11:11:08.382136+05:30
167	user_engagement	0002_userengagementlog_access_log_target_service_and_more	2024-02-21 11:11:08.409405+05:30
168	vu_auth_provider	0003_usergroupmembership	2024-02-21 11:11:08.451038+05:30
169	vu_auth_provider	0004_userprofile_keycloak_user_id	2024-02-21 11:11:08.49829+05:30
170	vu_auth_provider	0005_populate_keycloak_user_id	2024-02-21 11:11:08.691326+05:30
171	vu_auth_provider	0006_alter_userprofile_keycloak_user_id	2024-02-21 11:11:08.712744+05:30
172	vu_auth_provider	0007_initial_guest_user	2024-02-21 11:11:09.001602+05:30
173	vu_auth_provider	0008_systemrowpolicies_systemtables_dataaccesspolicy	2024-02-21 11:11:09.088473+05:30
174	vu_auth_provider	0009_keycloak_group_id_custom_mapper	2024-02-21 11:11:09.891096+05:30
175	vusoft	0106_insightcards	2024-02-21 11:11:09.939261+05:30
176	vusoft	0107_auto_20230425_1639	2024-02-21 11:11:10.751477+05:30
177	vusoft	0108_migrate_common_attributes	2024-02-21 11:11:11.052506+05:30
178	vusoft	0109_auto_20230425_1847	2024-02-21 11:11:11.923032+05:30
179	vusoft	0110_auto_20230601_1443	2024-02-21 11:11:12.284285+05:30
180	vusoft	0111_auto_20230601_1450	2024-02-21 11:11:12.295844+05:30
181	vusoft	0112_auto_20230602_1744	2024-02-21 11:11:12.363526+05:30
182	vusoft	0113_remove_vusoftreports_creation_time	2024-02-21 11:11:12.400168+05:30
183	vusoft	0114_update_auth_scopes_for_data_enrichment_and_mobile_dashboards	2024-02-21 11:11:12.639327+05:30
184	vusoft	0115_insightcards_is_preloaded	2024-02-21 11:11:12.676497+05:30
185	vusoft	0116_auto_20230706_1028	2024-02-21 11:11:13.165952+05:30
186	vusoft	0117_add_realm_roles_for_denver_orchestration_client	2024-02-21 11:11:13.445821+05:30
187	vusoft	0118_auto_20230711_1214	2024-02-21 11:11:13.467007+05:30
188	vusoft	0119_update_auth_scopes_for_insight_template_packaging	2024-02-21 11:11:13.609343+05:30
189	vusoft	0120_updated_reports_table	2024-02-21 11:11:13.720025+05:30
190	vusoft	0120_vublockdatamodelconfigs_vublockdiagnostic_and_more	2024-02-21 11:11:13.912327+05:30
191	vusoft	0121_vusoftenrichment_topic_name	2024-02-21 11:11:14.042212+05:30
192	vusoft	0122_auto_20230919_1814	2024-02-21 11:11:14.468221+05:30
193	vusoft	0123_auto_20230929_0102	2024-02-21 11:11:14.486747+05:30
194	vusoft	0124_vusofteventcorrelationsint_and_more	2024-02-21 11:11:15.666138+05:30
195	vusoft	0125_vusoftchatconversation	2024-02-21 11:11:15.888848+05:30
196	vusoft	0126_auto_20231114_1612	2024-02-21 11:11:15.914092+05:30
197	vusoft	0127_auto_20231118_2210	2024-02-21 11:11:15.942892+05:30
198	vusoft	0128_auto_20231207_1903	2024-02-21 11:11:15.95687+05:30
199	vusoft	0129_auto_20231209_1410	2024-02-21 11:11:16.055428+05:30
200	vusoft	0130_vusofteventcorrelationsint_and_more	2024-02-21 11:11:17.607055+05:30
201	vusoft	0131_auto_20231229_1510	2024-02-21 11:11:17.760491+05:30
202	vusoft	0132_kafkatopicmetrics_systemparts	2024-02-21 11:11:17.774887+05:30
203	vusoft	0133_vusofteventcorrelations_similar_incidents	2024-02-21 11:11:17.791573+05:30
204	vusoft	0134_vusoftdatamanagement	2024-02-21 11:11:17.905237+05:30
205	vusoft	0135_alter_vusoftdatamanagement_additional_prefix_tables_and_more	2024-02-21 11:11:18.074133+05:30
206	vusoft	0136_vusofttenant_customer_id	2024-02-21 11:11:18.085377+05:30
207	vusoft	0137_alter_vusoftdatamanagement_additional_prefix_tables_and_more	2024-02-21 11:11:18.156443+05:30
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: event_correlation_eventcorrelationconfig; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.event_correlation_eventcorrelationconfig (id, tenant_id, bu_id, workspace_id, data_models, correlation_profiles) FROM stdin;
\.


--
-- Data for Name: event_correlation_trialrun; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.event_correlation_trialrun (id, tenant_id, bu_id, name, workspace_id, workspace_name, source_type, start_time, end_time, raw_events, residual_events, status) FROM stdin;
\.


--
-- Data for Name: event_correlation_trialrun_correlated_events; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.event_correlation_trialrun_correlated_events (id, trialrun_id, vusoftcorrelatedevents_id) FROM stdin;
\.


--
-- Data for Name: event_correlation_vusoftcorrelatedevents; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.event_correlation_vusoftcorrelatedevents (id, tenant_id, bu_id, rule_identifier, event_id, raw_event_ids, raw_events_details, summary, description, severity, notification_channel_info, start_time, end_time, last_updated_time, duration, state, workspace_id, correlation_technique, events_history, is_correlated, correlation_type, additional_info, raw_events_tight_link_ids, raw_events_loose_link_ids, tags, insights_filled_up, instance_name, run_type, similar_incidents, raw_events_subclusters, insights, root_cause, recommended_actions, is_standalone_3t, work_status, is_standalone_ml, workspace_name, is_rca_filled_up, related_dashboards, source, ticket_id) FROM stdin;
\.


--
-- Data for Name: events_feedback; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.events_feedback (id, event_id, event_type, user_name, feedback_type, feedback_json, workspace_id) FROM stdin;
\.


--
-- Data for Name: events_rca_comments_feedback; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.events_rca_comments_feedback (id, event_id, event_type, comment, feedback, rca_id, action_type, user_name, feedback_type, feedback_json, workspace_id) FROM stdin;
\.


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.groups (id, name, permission_list, tenant_id, bu_id, home_page, mobile_home_page, mobile_kpi, search_string) FROM stdin;
7	vunet:1:id:idpadmin		1	1				
6	vunet:1:id:admin	ManageLicense,ViewObject,ManageObject,DataFetchAPIs,ManagePreferences,ViewIncidents,ManageDataEnrichment,ManageUsers,ReportAdmin,ManageWorkspaces,CreateWorkspace,ViewWorkspace,CreateDataModel,ViewDataModel,CreateDatasource,ViewDataSource,CreateVDSSchema,ViewVDSSchema,IncidentFeedback,ManageEvents,ManageDataSources,ManageDataSettings,ReportUsers,DeleteDataModel	1	1				
\.


--
-- Data for Name: guardian_groupobjectpermission; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.guardian_groupobjectpermission (id, object_pk, content_type_id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: guardian_userobjectpermission; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.guardian_userobjectpermission (id, object_pk, content_type_id, permission_id, user_id) FROM stdin;
\.


--
-- Data for Name: dbz_heartbeat; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.dbz_heartbeat (id, ts) FROM stdin;
\.


--
-- Data for Name: metrics_metric; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.metrics_metric (id, name, slug, category, subcategory) FROM stdin;
\.


--
-- Data for Name: metrics_metricitem; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.metrics_metricitem (id, value, "timestamp", metadata, metric_id) FROM stdin;
\.


--
-- Data for Name: notification_config; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.notification_config (id, tenant_id, bu_id, route_name, route_category, severity, duration, last_updated_time, creation_time, channels, script, category_fields) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_accesstoken; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.oauth2_provider_accesstoken (id, token, expires, scope, application_id, user_id, created, updated, source_refresh_token_id) FROM stdin;
1	710C278287339C8A79A8B8113AD7B8F9B93D4DFA5DF64F2AA437D2BB6CA49F91	2022-06-04 13:21:13+05:30	vusmartmaps	\N	2	2023-02-01 15:50:31.91919+05:30	2023-02-01 16:03:42.542465+05:30	\N
21	D09CC0F7102EC08BCE17B9184090EDA8A612F0DEF3A305FB6365EE30F1ACAC3B	2022-06-04 13:21:13+05:30	vusmartmaps	\N	2	2023-02-02 11:31:54.058092+05:30	2023-02-02 12:19:39.458541+05:30	\N
12	537AEA75B7C3366345E321C219799E3283CB459F8BB69E2D07BA33BB3C27B40B	2022-06-04 13:21:13+05:30	vusmartmaps	\N	2	2023-02-01 17:55:04.928384+05:30	2023-02-01 17:58:05.36104+05:30	\N
11	4E9FAD721C6585615B0E6F6E97F3209074FE0AA4D10FA0EB880D54ABC78EF1FD	2022-06-04 13:21:13+05:30	vusmartmaps	\N	2	2023-02-01 16:21:15.528876+05:30	2023-02-01 19:11:57.043248+05:30	\N
28	3CDE161BFA66E647B4B7A1A080CADFA4C865480B1F80F96D370FA1F2BCE91AE8	2022-06-04 13:21:13+05:30	vusmartmaps	\N	2	2023-02-02 12:53:25.077273+05:30	2023-02-02 13:00:05.833125+05:30	\N
9	8FA71C3460F629FCD583A8CE119C8CC12128A3B5FDB85E85D66A16BBD9074364	2022-06-04 13:21:13+05:30	vusmartmaps	\N	2	2023-02-01 16:04:56.131112+05:30	2023-02-01 16:04:56.131134+05:30	\N
10	8F15D3E17A8794E5DB4C3802A2AAE58A8C5472DD12C68B5A5AA71C125F41E991	2022-06-04 13:21:13+05:30	vusmartmaps	\N	2	2023-02-01 16:13:48.665038+05:30	2023-02-01 16:31:08.366344+05:30	\N
38	339449461AD2B8A953AFE76153EAF75977D3434EEF87FB237B7DC25FAF9BE2E5	2022-06-04 13:21:13+05:30	vusmartmaps	\N	2	2023-02-02 17:13:08.206433+05:30	2023-02-02 17:33:30.598816+05:30	\N
3	null	2022-06-04 13:21:13+05:30	vusmartmaps	\N	2	2023-02-01 15:54:25.470055+05:30	2023-02-02 17:29:25.637756+05:30	\N
24	F2867E55B5C96D471666969A06F6CFFBD8280B92CB2B91DFFA812C38BE52CE1F	2022-06-04 13:21:13+05:30	vusmartmaps	\N	2	2023-02-02 12:20:39.211293+05:30	2023-02-02 13:01:24.999106+05:30	\N
14	D7383AFCEE46872D3E66F2FF03BFAAF4313F14D30B2411457FF56BB350DEB9BF	2022-06-04 13:21:13+05:30	vusmartmaps	\N	2	2023-02-01 19:11:57.078625+05:30	2023-02-01 20:16:08.10647+05:30	\N
2	C990C953023BE3D29BA06154C565AB38A533379EFD2972043DBEE06A65D54230	2022-06-04 13:21:13+05:30	vusmartmaps	\N	2	2023-02-01 15:50:31.921674+05:30	2023-02-01 16:21:14.299855+05:30	\N
31	A94F7594586422247E7A5D75250D183CD18F0626E7A1A34086EB26B07DB6F1EB	2022-06-04 13:21:13+05:30	vusmartmaps	\N	2	2023-02-02 13:28:59.466602+05:30	2023-02-02 14:24:40.035094+05:30	\N
23	996F4666DB8DAC146156FB645B0F15898FD7D0A7EF11BF858185A93DEDD39013	2022-06-04 13:21:13+05:30	vusmartmaps	\N	2	2023-02-02 12:18:23.755307+05:30	2023-02-02 12:25:02.435779+05:30	\N
35	3E5B7DE110FF98D494E9A89F6499BE21E8734DB04E4C346E5742FAED0C894190	2022-06-04 13:21:13+05:30	vusmartmaps	\N	2	2023-02-02 15:23:38.441307+05:30	2023-02-02 17:05:19.863464+05:30	\N
40	74E7EBE22C8DD2ADAE26D19D590C545D738E71357339A03181D5D674C23CAED6	2022-06-04 13:21:13+05:30	vusmartmaps	\N	2	2023-02-02 17:29:14.693335+05:30	2023-02-02 17:33:49.572659+05:30	\N
27	6560283678DA6B4A77269216247AFD62010344AC0159960645641089DE7B5708	2022-06-04 13:21:13+05:30	vusmartmaps	\N	2	2023-02-02 12:33:59.630293+05:30	2023-02-02 13:04:40.775344+05:30	\N
7	DDDEA341A8D95DC7E8CF8372A294E8C927DB451DE1C450DBB884262E7B6E63AF	2022-06-04 13:21:13+05:30	vusmartmaps	\N	2	2023-02-01 16:02:05.337793+05:30	2023-02-01 16:33:28.831524+05:30	\N
42	22707018B5130D4980418B237D66C0882DDFA126A61ACC783E1AE7B9792DE2EE	2022-06-04 13:21:13+05:30	vusmartmaps	\N	2	2023-02-02 18:16:27.056126+05:30	2023-02-02 20:42:28.540423+05:30	\N
18	45281EE5A96610411134E774796104784D98BFC9A2132AEC6BECD672A76C24F7	2022-06-04 13:21:13+05:30	vusmartmaps	\N	2	2023-02-01 22:52:53.243948+05:30	2023-02-02 10:39:40.511917+05:30	\N
32	A80ACFE271C192B8FE236EFB731B5F88A90841748786F94E07984454EB67ED96	2022-06-04 13:21:13+05:30	vusmartmaps	\N	2	2023-02-02 13:40:35.903307+05:30	2023-02-02 14:22:12.642037+05:30	\N
6	E8B29E176036E2082932E2E87B3F2F5C11FD80BBE5C8D5999CB5C0270B4E6862	2022-06-04 13:21:13+05:30	vusmartmaps	\N	2	2023-02-01 15:57:42.317083+05:30	2023-02-01 16:02:04.055968+05:30	\N
5	0AF739C4D0362EAC80A866F7DECC3CF8FF82279E10929F30D10C718111953CF4	2022-06-04 13:21:13+05:30	vusmartmaps	\N	2	2023-02-01 15:54:25.77737+05:30	2023-02-01 15:57:41.910711+05:30	\N
26	EB1A18C0D29BAB49E6ECDFECD452519A0942F27D664590340FA96E3B285D192B	2022-06-04 13:21:13+05:30	vusmartmaps	\N	2	2023-02-02 12:30:22.730595+05:30	2023-02-02 12:51:54.550971+05:30	\N
20	4D2E3A17EEC0C8B3D1B096E38D4510649C49AAD2604ADD71286988649E69B13D	2022-06-04 13:21:13+05:30	vusmartmaps	\N	2	2023-02-02 10:51:29.797446+05:30	2023-02-02 11:29:29.493311+05:30	\N
19	CDFE7540EF536078CEEC4CD690EF7B12258AC9E3D5B0A083B1D9D28AAE77FC65	2022-06-04 13:21:13+05:30	vusmartmaps	\N	2	2023-02-02 10:42:25.052063+05:30	2023-02-02 10:51:28.707264+05:30	\N
8	D6541B6D276DCEC4AD124EEDFA07A6DA29B3B95FB8898276FFB6BF61A721B8B1	2022-06-04 13:21:13+05:30	vusmartmaps	\N	2	2023-02-01 16:03:12.040466+05:30	2023-02-01 17:55:00.993562+05:30	\N
30	2E12E8BE5CF21CAAFE54DDB4EE64BD79EAF3F020F2CACF5EE78DD97B3111F83B	2022-06-04 13:21:13+05:30	vusmartmaps	\N	2	2023-02-02 13:04:50.585618+05:30	2023-02-02 13:39:12.25553+05:30	\N
16	5FC823B9926FD0F96AB8CBEA9AE6F6B17684593D64803C9D0B1036A4A28AE3FF	2022-06-04 13:21:13+05:30	vusmartmaps	\N	2	2023-02-01 20:33:35.432205+05:30	2023-02-01 21:52:20.054217+05:30	\N
15	1051B98862F7E1DC83C2CB3EBDBDDDDBF15ED064D10BF70AB18BCCEFE9C152DC	2022-06-04 13:21:13+05:30	vusmartmaps	\N	2	2023-02-01 20:16:03.931251+05:30	2023-02-01 22:52:30.676494+05:30	\N
22	4DF5FEA1687864E873D9D188EA31D62EEA23B790A66181FB8003A695829BD81D	2022-06-04 13:21:13+05:30	vusmartmaps	\N	2	2023-02-02 11:58:29.563477+05:30	2023-02-02 12:11:01.765543+05:30	\N
37	00EC84C188B52237A62D26B9705FFE1D1E3393B18A423B079257286EE8ADD410	2022-06-04 13:21:13+05:30	vusmartmaps	\N	2	2023-02-02 17:08:19.854556+05:30	2023-02-02 17:13:51.753252+05:30	\N
36	1BDBF62330DA7A6F7A30B241CD9E27EA8C15DEACD885A6DD1EDBF9FEA4812D7B	2022-06-04 13:21:13+05:30	vusmartmaps	\N	2	2023-02-02 16:47:09.494096+05:30	2023-02-02 17:11:54.966833+05:30	\N
45	1209650E0BDB1DCAC247CC3D6BA7ECED64377DCB1B68344560085B4DA7347F6A	2022-06-04 13:21:13+05:30	vusmartmaps	\N	2	2023-02-02 20:42:42.832936+05:30	2023-02-02 20:54:29.050808+05:30	\N
29	582C30988F4A48AFB180DD78FC935E80241520315183DA942D22CC56FF423293	2022-06-04 13:21:13+05:30	vusmartmaps	\N	2	2023-02-02 12:58:20.067264+05:30	2023-02-02 13:57:02.305468+05:30	\N
34	8374199410A90C1DAD09CF092663B067F8F828451FE90AE64A4E81DD57FE4C61	2022-06-04 13:21:13+05:30	vusmartmaps	\N	2	2023-02-02 15:05:01.899785+05:30	2023-02-02 15:08:02.475006+05:30	\N
39	3E71FD72B42F8219BB368C744EAC75279EBCAEE75F3328870183DBCD0B96E12F	2022-06-04 13:21:13+05:30	vusmartmaps	\N	2	2023-02-02 17:16:32.092572+05:30	2023-02-02 17:36:04.944235+05:30	\N
44	3F12A7791C3AA38B8106837B529D3B07449C50B27CA253214D788983254470AA	2022-06-04 13:21:13+05:30	vusmartmaps	\N	2	2023-02-02 20:30:45.039588+05:30	2023-02-02 21:26:33.196135+05:30	\N
33	9FEF3C37E8E4558941B1E6DE2F985E3B9BB2861823248415EAA6AECEC15D3E45	2022-06-04 13:21:13+05:30	vusmartmaps	\N	2	2023-02-02 13:49:47.058237+05:30	2023-02-02 17:13:01.787244+05:30	\N
43	6B6CF20BFE54B0D50EE709A9D6DF0AA0A839739A1DDF96A1C35E9CE6E6CC75D9	2022-06-04 13:21:13+05:30	vusmartmaps	\N	2	2023-02-02 20:30:38.817384+05:30	2023-02-02 20:30:40.262855+05:30	\N
49	0B0CA94A7C007A7C29E333674861643E4DC62035918044EC9224E83B0B96C99B	2023-02-03 06:10:28+05:30	vusmartmaps	\N	3	2023-02-03 11:21:57.058764+05:30	2023-02-03 11:22:14.417096+05:30	\N
47	9A79BF7BEE8F50E0F54BD620B4233FD56C37ED0E7C1937E6B416A9BB5B2C38F7	2023-02-02 16:56:27+05:30	vusmartmaps	\N	3	2023-02-02 21:26:33.63363+05:30	2023-02-02 22:25:27.172661+05:30	\N
41	77904F20233F4CE303B288BB6B7D16251956610E4457A5B83728FAD3A4A67AFD	2022-06-04 13:21:13+05:30	vusmartmaps	\N	2	2023-02-02 17:29:32.965154+05:30	2023-02-02 20:41:31.621478+05:30	\N
48	91D2AF6BBA88E8155BF87B1FF1A21B7F9E8ACF7B53DB66B0002E2D1ED7E7937E	2023-02-03 04:27:10+05:30	vusmartmaps	\N	3	2023-02-03 08:57:13.143913+05:30	2023-02-03 08:57:13.143943+05:30	\N
50	31690D485D84D27AFE0FB9AA116A030D425D675D1D126C83FE490B5FB22ACAE2	2023-02-03 06:52:10+05:30	vusmartmaps	\N	3	2023-02-03 11:22:23.099063+05:30	2023-02-03 11:40:10.973646+05:30	\N
51	6E21E2998EBEB17705AE88F1E0E985C5D895F50DFF56A0D8BFAE014AC3A33263	2023-02-03 07:05:29+05:30	vusmartmaps	\N	4	2023-02-03 11:35:31.995254+05:30	2023-02-03 11:35:53.134195+05:30	\N
53	748AAA88DA22E2A69AEFB8F11C864DF3B9EF84ED17885B68C7722669AE288D38	2023-02-03 07:10:08+05:30	vusmartmaps	\N	3	2023-02-03 11:40:15.143999+05:30	2023-02-03 11:59:10.157252+05:30	\N
52	BEEB4B0DBFAC17AC3B3DE81672ED89D9460B29127AC55316CB423C4F16CBEDED	2023-02-03 07:07:51+05:30	vusmartmaps	\N	3	2023-02-03 11:37:57.08932+05:30	2023-02-03 11:45:32.601231+05:30	\N
55	CDE9999FF32739133BB919F1E8B9472EFA0ED79874150B7548741639B6952079	2023-02-03 08:06:37+05:30	vusmartmaps	\N	4	2023-02-03 13:11:31.931603+05:30	2023-02-03 13:11:31.94435+05:30	\N
54	A7ACEC19BE5DD085986EFF200914BE613222F6B94F7E3F5016521004AFE285B3	2023-02-03 07:57:58+05:30	vusmartmaps	\N	3	2023-02-03 13:10:05.087758+05:30	2023-02-03 13:21:43.395482+05:30	\N
64	E84E49A2D52246724462CE0D5DC7851E7C4EF1638ABC1FEC91FC69613FDF3DE6	2023-02-03 12:35:13+05:30	vusmartmaps	\N	3	2023-02-03 17:05:26.139597+05:30	2023-02-03 17:10:32.39526+05:30	\N
56	9D3A788C424E5382EEF7E2B7CF379563DDFA37239D696CAE4615ED62645E83E7	2023-02-03 08:41:29+05:30	vusmartmaps	\N	4	2023-02-03 13:11:32.31118+05:30	2023-02-03 13:11:51.127603+05:30	\N
58	0F72FF0826045F3EF4500D25FEAEE1FBE3870A18901D0D86231747E5C2AA532B	2023-02-03 08:46:30+05:30	vusmartmaps	\N	3	2023-02-03 13:16:53.367963+05:30	2023-02-03 14:16:15.556526+05:30	\N
60	B64BCD7568E86347F5FD0EF1EE8A2110581D8D774DC81D528EC6083D262516B5	2023-02-03 09:56:17+05:30	vusmartmaps	\N	3	2023-02-03 14:26:20.644574+05:30	2023-02-03 14:27:03.968605+05:30	\N
61	22C5F3C13876EAAEA6F0E6F0184419E48181C2106381A8C46216AF8B39176A4C	2023-02-03 09:56:56+05:30	vusmartmaps	\N	3	2023-02-03 14:27:19.127382+05:30	2023-02-03 15:23:22.525498+05:30	\N
57	1A249682F239EFF1034FE0B471F5550DDCC4F1EED9982C12778EF963F128EA13	2023-02-03 08:41:49+05:30	vusmartmaps	\N	3	2023-02-03 13:11:51.429105+05:30	2023-02-03 13:16:34.166948+05:30	\N
62	FE364BDDBE5329D347B3010082B5D290DE331A970EADDFF582491D2D94808064	2023-02-03 10:53:11+05:30	vusmartmaps	\N	3	2023-02-03 15:23:25.300209+05:30	2023-02-03 15:48:51.322868+05:30	\N
65	0A9146D4218121B255EF5D4D65868E4FE60715A4DDC2A768CD466BFC51067405	2023-02-03 12:40:19+05:30	vusmartmaps	\N	3	2023-02-03 17:13:39.093831+05:30	2023-02-03 17:53:56.874053+05:30	\N
59	45FFE4510E0DA516E36D6A45EEABC2662936E5CB362BFD8CCAE848CD1C379A6A	2023-02-03 08:53:36+05:30	vusmartmaps	\N	4	2023-02-03 13:23:39.741537+05:30	2023-02-03 13:24:20.665667+05:30	\N
63	18F96418EB3FF9A2DEF2C1D5812D904E8C8D74F7AE359D7BCC35220101A0334C	2023-02-03 11:25:11+05:30	vusmartmaps	\N	3	2023-02-03 15:55:18.075455+05:30	2023-02-03 16:45:52.734304+05:30	\N
66	A99D3F57BA00A45C0FE0C5E0DDC1B065C6B60EC25736B3FBDDB6ED9F023AF3A6	2023-02-28 17:39:49+05:30	vusmartmaps	\N	4	2023-02-28 22:10:01.925436+05:30	2023-02-28 22:17:33.062534+05:30	\N
67	A38FFA5F61DE50A98F087C79640EE177F474278BA2E47DDAF734A39DF5C95B35	2023-02-28 17:47:17+05:30	vusmartmaps	\N	3	2023-02-28 22:17:37.18008+05:30	2023-02-28 22:17:42.697953+05:30	\N
68	B15F6AD934A7915781DC63BC1711600527DCD49CEA2E5E94572F610863E1D616	2023-03-09 08:19:15+05:30	vusmartmaps	\N	3	2023-03-09 12:49:36.281675+05:30	2023-03-09 13:27:46.94344+05:30	\N
\.


--
-- Data for Name: oauth2_provider_application; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.oauth2_provider_application (id, client_id, redirect_uris, client_type, authorization_grant_type, client_secret, name, user_id, skip_authorization, created, updated) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_grant; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.oauth2_provider_grant (id, code, expires, redirect_uri, scope, application_id, user_id, created, updated, code_challenge, code_challenge_method) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_refreshtoken; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.oauth2_provider_refreshtoken (id, token, access_token_id, application_id, user_id, created, updated, revoked) FROM stdin;
\.


--
-- Data for Name: vu_auth_provider_customsession; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vu_auth_provider_customsession (session_key, session_data, expire_date, access_token) FROM stdin;
wi4pyjg2v1ugxjeb722srx8uqzxbx7yf	.eJxlU1tvmzAU_i9-TlLAmNsbgUSKtGrVqq0P04QMnCxuwEa26WVV__uOySCt9mLZ3_nO_fMb4U0DxlRWnUGSjBRp6hUpo15AtztaBuk29yKfhQWLWL6lSc4opXG626MpDryQltvdzovyiJUsDKhHVkRIq5UZoLFCyUqDGZQ0QLI3IozBFCdrB5Pd3Ih2M4hO2c3TKMFuhEJfWR9J5kcspCELYroi8DLMQJI4gI8tyX6Sp9H0XNueDwbdGi60Ir_w0gmQthLIIa3kU3y0m7FGIDmyJKj9aA0xsHWYgr9OgCVrVidxHHLOWQLEZbCnyooepsSUJhTTY1stVkI61fDOkXqNr-G5dUVzxyVTG7zthURsAN1juzgBV-3L6x_nUzd43nLJf0PJLb9Xo8bhI_ZDwPPX-hFHthCWp2PuwTan_O5gFvOdhiNokBf_a8yd1KI59TiEBf4iGnALmN_fDWjn9A0GpW3-r-CL7UHpsxn4taoFwHehgVv4iDjGtZOF4iAzQzPnVrXQfaLMiGMcZCNarNq4LVqQfN6ij4R6vN616sCN9P6s9Fjzg3MS9nVqYzqEsZpbpZE7bSS7rATDPlqBQXLm-fu0jAIaFWmx9eMStZvGNMpZUvqhyyG4_axCjlp-wrRWj4BqatRwWfhHDY441v-V8L4iFWpY4DeonBZIgD_LCzx_7TPGqE_e_wKrnRzC:1pNAEB:CT_fSXQh9wJVODVXPy8qyosBOyl7G4JucU-X3yUR2IU	2023-02-15 15:50:31.963997+05:30	C990C953023BE3D29BA06154C565AB38A533379EFD2972043DBEE06A65D54230
qr9ygvesgid3u5cyr8yh1mu3qagfaj45	.eJxlU11vmzAU_S9-TtIYYzB5IzCkSKtWrdr2ME3IwM3iJtjINv1Y1f--a7KQVnuxfI_P_T5-JbJtwbnamyNosiEpXRdRKiKRMpYVIk-zXGwFpSwv062osm3Gyriscl5WSVxFeR6ztIy226TI46zKKFkQpb01boDWK6NrC24w2gHZvBLlHKY4eD-4zc2N6laDOhm_ehw1-JUy6KubPdnQhMcs5lHKFgSehwsgRADk2JHNT_I4ul5a38vBoVsrlTXkF15OCrSvFXJIp-UUH9_d2CAg9lxEDU2WkAJfxhnQpQAulrwRaRpLKbkAEjL4Q-1VD1NixgTD9NhWh5WQk2nlKZB6i9bw1IWiZeCSqQ3Z9UojNoDtsV2cQKj2-eVP8GlaPG-llr-hlF7em9Hi8BH7ruDpS_OAI5sJsxmYFfj2kN_t3Px8Z2EPFvTZ_xrzk7aqPfQ4hBn-rFoIC7jY3xzY4PQVBmN9_q_g89sPY49ukNeqZgDtwoL08B4JjGsnMyVA7gJdOLemg9MHygUJjJ1uVYdVu7BFD1pethgU1YzXuzUnCCO9Pxo7NnIXnJR_mdqYDuW8ld5Y5E4b2ZxXgmEfvMIgOV_TKiuTiCVFVmxpWia8zFKW5FyUNJ4ULP1HFUrU8iOm9XYEVFNrhvPC32twxLH-r4S3BalRwwq_QR20QKJ1xNbRmi4p55xR8vYXF0cdMg:1pNAEB:gdv2RTfptYdiqRyEcnVFPZaQz6HbMH3wtG_y0JEl2wQ	2023-02-15 15:50:31.964618+05:30	710C278287339C8A79A8B8113AD7B8F9B93D4DFA5DF64F2AA437D2BB6CA49F91
m3o9oq8ygfyiycw69xhjj3byih9knysi	.eJxlU11vmzAU_S9-TlIM2BjeCCRSpFWrVm19mKbIwM3iBmxkm36s6n_fdbIkrfZi-R6f-338RmTbgnNbbw6gSUHEusxolaQ8WvM4X1c1E0kpqhWleSWqisY0FmWyZOt6KdhKsJrzkvLlss6jLE14SmZEaW-NG6H1yuitBTca7YAUb0Q5hyn23o-uuLlR3WJUvfGLp0mDXyiDvrrZkYJyliYpi7NkRuBlPANCBEBOHSl-kqfJDdL6QY4O3VqprCG_8NIr0H6rkEM6LY_x8d1NTehtx0TcUD6HDNg8zYHOBTAxZ43IslRKyQSQkMHvt14NcEycJCLB9NhWh5WQ3rSyD6TBojU-d6FoGbjk2IbsBqURG8EO2C5OIFT78von-DQtnrdSy99QSy_vzWRx-Ij9UPD8tXnEkV0IFzMw1-DbfXm3cZfnOws7sKBP_teYK21Vux9wCBf4i2ohLOBsf3dgg9M3GI315b-CT28Pxh7cKK9VXQC0KwvSw0ckMK6dXCgBcmfozLk1HfSfKGckMDa6VR1W7cIWPWh53iJFQjNd79b0EEZ6fzB2auQmOCn_emzjeCjnrfTGIve4keK0Egz76BUGKVlE13nN44RXebWkWc1ZnWcJL5moaRpyKOk_q1Cilp8wrbcToJpaM54W_lGDE471fyW8z8gWNazwG2yDFkgcxUkUR3ROeZQzTt7_AseQHR4:1pNAS8:gZF4-2Cw5G1F259Is_2dNt1ts7IK40CmtyYAjzFymk8	2023-02-15 16:04:56.149511+05:30	8FA71C3460F629FCD583A8CE119C8CC12128A3B5FDB85E85D66A16BBD9074364
9dbz8o70owv9a7zk4lf6h3k705zrteuy	.eJxlU11vmzAU_S9-TtIYMJi8EUikSKtWrdr6ME3IwM3iBmxkm36s6n_fNRmk1V4s3-Nzv4_fiKhrsLZ0-gyKbAjfU1aEO5pkPEmjHSu2UR7ydZAFWbZjPOM5i5KgKGiQx3zLMpZlCc1pwPYR3aUpJQsilTPa9lA7qVVpwPZaWSCbNyKtxRQn53q7ubmRzaqXrXarp0GBW0mNvqo6kg2NWRRGLEjCBYGXfgI494AYGrL5SZ4G2wnjOtFbdKuFNJr8wksrQblSIoc0Sozx8d0Ole_tyHhQ0XgJCbBllAJdcmB8ySqeJJEQgnEgPoM7lU52MCYOQx5iemyrwUpIq2vRelJn0OqfG1-08FwytiGaTirEejAdtosT8NW-vP7xPlWN561Q4jcUwol7PRgcPmI_JDx_rR5xZDNhNj1zD64-ZXcHOz_fGTiCAXXxv8bcKSPrU4dDmOEvsga_gMn-bsF4p2_Qa-OyfwVf3h60OdteXKuaAbRzA8LBR8Qzrp3MFA_ZCZo4t7qB9hNlQjzjoGrZYNXWb9GBEtMWvaKq4Xo3ugU_0vuzNkMlDt5JutexjfGQ1hnhtEHuuJHNZSUY9tFJDJKxNd2nRRyEcZ7mW5oUMSvSJIwzxgsajQoW7rMKBWr5CdM6MwCqqdb9ZeEfNTjgWP9XwvuClKhhid-g9FogwToI18GaLmlMecTJ-1-Y5R0R:1pNAai:xjdYTNta85IR0NaofVW74kuZU8stprUdpbW8NPRtDBQ	2023-02-15 16:13:48.684331+05:30	8F15D3E17A8794E5DB4C3802A2AAE58A8C5472DD12C68B5A5AA71C125F41E991
g1sfnatjusdrnar35rkbzaua4waysa7e	.eJxlU11vmzAU_S9-TtIYMJi8OZBIkVatWrX1YZoiAzeLm2Aj2_RjVf_7rskgrfZi-R6f-338RmRdg3N7b06gyYrwLWVlvKGZ4FmebFi5ToqYLyMRCbFhXPCCJVlUljQqUr5mggmR0YJGbJvQTZ5TMiNKe2tcB7VXRu8tuM5oB2T1RpRzmOLofedWNzeqWXTqbPziqdfgF8qgr64OZEVTlsQJi7J4RuClGwHOAyD7hqx-kqfetdL6VnYO3WqprCG_8HJWoP1eIYc0Wg7x8d31VejtwHhU0XQOGbB5kgOdc2B8ziqeZYmUknEgIYM_7r1qYUgcxzzG9NhWg5WQs6nlOZBai1b33ISiZeCSoQ3ZtEoj1oFtsV2cQKj25fVP8KlqPG-llr-hlF7em97i8BH7oeD5a_WII5sIkxmYW_D1Udzt3PR8Z-EAFvTF_xpzo62qjy0OYYK_qBrCAkb7uwMbnL5BZ6wX_wq-vD0Ye3KdvFY1AWgXFqSHj0hgXDuZKAFyIzRybk0D50-UEQmMna5Vg1W7sEUPWo5bDIqq-uvdmjOEkd6fjO0ruQtOyr8ObQyHct5Kbyxyh42sLivBsI9eYRDBlnSbl2kUp0VerGlWpqzMszgVjJc0GRQs_WcVStTyE6b1tgdUU226y8I_arDHsf6vhPcZ2aOGFX6DfdACiZZRvIyWdE6xgmVO3v8CmMUdCg:1pNAev:Ldpbryp8QwG0tHgjjvHKxHsaPZ5Hi-tYWA_ZvUKVLOc	2023-02-15 16:18:09.123483+05:30	8F15D3E17A8794E5DB4C3802A2AAE58A8C5472DD12C68B5A5AA71C125F41E991
d5bvnpalzwvqnuvpry260m5g9w7jvc2y	.eJxlU11vmzAU_S9-TtIYMJi8OZBIkVatWrX1YZoiAzeLm2Aj2_RjVf_7rskgrfZi-R6f-338RmRdg3N7b06gyYrwLWVlvKGZ4FmebFi5ToqYLyMRCbFhXPCCJVlUljQqUr5mggmR0YJGbJvQTZ5TMiNKe2tcB7VXRu8tuM5oB2T1RpRzmOLofedWNzeqWXTqbPziqdfgF8qgr64OZEVTlsQJi7J4RuClGwHOAyD7hqx-kqfetdL6VnYO3WqprCG_8HJWoP1eIYc0Wg7x8d31VejtwHhU0XQOGbB5kgOdc2B8ziqeZYmUknEgIYM_7r1qYUgcxzzG9NhWg5WQs6nlOZBai1b33ISiZeCSoQ3ZtEoj1oFtsV2cQKj25fVP8KlqPG-llr-hlF7em97i8BH7oeD5a_WII5sIkxmYW_D1Udzt3PR8Z-EAFvTF_xpzo62qjy0OYYK_qBrCAkb7uwMbnL5BZ6wX_wq-vD0Ye3KdvFY1AWgXFqSHj0hgXDuZKAFyIzRybk0D50-UEQmMna5Vg1W7sEUPWo5bDIqq-uvdmjOEkd6fjO0ruQtOyr8ObQyHct5Kbyxyh42sLivBsI9eYRDBlnSbl2kUp0VerGlWpqzMszgVjJc0GRQs_WcVStTyE6b1tgdUU226y8I_arDHsf6vhPcZ2aOGFX6DfdACiZZRvIyWdE6xgmVO3v8CmMUdCg:1pNAev:Ldpbryp8QwG0tHgjjvHKxHsaPZ5Hi-tYWA_ZvUKVLOc	2023-02-15 16:18:09.133985+05:30	8F15D3E17A8794E5DB4C3802A2AAE58A8C5472DD12C68B5A5AA71C125F41E991
v9s6amkdslhfkd7zl9s2pfclmynt3k4f	.eJxlU11v2yAU_S88J2kwBuO8OXEsRVq1atXWh2mKsH2z0MRgAe7Hqv73XZLFabUXxD2c-314I6ppwPttsAcwZEHyXFSpEKJcyrJY0VRQLqqlSPlyXlEuc1mVWTkvsnVF6bKSXFLJi5yV67Jk-ZwyMiHaBGd9D03Q1mwd-N4aD2TxRrT3mGIfQu8XNze6nfX6aMPsaTAQZtqir6l3ZEEFT1nKk4xNCLz0F0DKCKihJYuf5GnwnXKhU71Ht0ZpZ8kvvBw1mLDVyCGtUaf4-O6HGgG54zKpqZhCBnya5kCnEric8lpmWaqU4hJIzBD226A7OCVmTDJMj221WAk52kYdI6lzaPXPbSxaRS45taHaThvEenAdtosTiNW-vP6JPnWD560y6jeUKqh7OzgcPmI_NDx_rR9xZCNhNCOzgtDsi7uNH5_vHOzAgTn7X2OujdPNvsMhjPAX3UBcwMX-7sFFp2_QWxeKfwWf3x6sO_heXasaAbRXDlSAj0hkXDsZKRHyF-jCubUtHD9RLkhkbEyjW6zaxy0GMOqyRYqEerjenT1CHOn9wbqhVpvopMPrqY3ToX1wKliH3NNGFueVYNjHoDFIwee0ykuRMLHKV0ualYKXecZEwWVJ05hDq_BZhQq1_IRpgxsA1dTY_rzwjxoccKz_K-F9QraoYY3fYBu1QJJ5wuZ4TGmSCMbI-1_WgB0a:1pNTRV:o3wKaGgQ_MPgZBfi6xkhQnCb66THDKH2-W8KgGnXs5o	2023-02-16 12:21:33.457563+05:30	996F4666DB8DAC146156FB645B0F15898FD7D0A7EF11BF858185A93DEDD39013
ub5qr8hsziuyd8aovhz7b6h5ct1uzy7m	.eJxlU1tv2yAU_i88J2mMDcZ-8yWWIq1atWrrwzRF2D5ZaGKwAPeyqv99h2RJWu0FcT6-c_94I7LrwLmNN3vQJCcNFTxdMVayKuN1kkac84xnxZI3vGqashZULMuMViUts6humkJEtIpFuWK0WkUNmRGlvTVuhM4rozcW3Gi0A5K_EeUcpth5P7r85kb1i1EdjF88TRr8Qhn01e2W5BFnSZwwmsYzAi_jGRAiAHLqSf6TPE1ukNYPcnTo1kllDfmFl4MC7TcKOaTX8hgf393UIiC2TNA24nNIgc2TDKK5ACbmrBVpmkgpmQASMvjdxqsBjonjWMSYHtvqsRJyMJ08BNJg0Rqf-1C0DFxybEP2g9KIjWAHbBcnEKp9ef0TfNoOz1up5W-opZf3ZrI4fMR-KHj-2j7iyC6EixmYDfhuV9yt3eX5zsIWLOiT_zXmSlvV7QYcwgX-ojoICzjb3x3Y4PQNRmN98a_g09uDsXs3ymtVFwDtyoL08BEJjGsnF0qA3Bk6c25ND4dPlDMSGGvdqR6rdmGLHrQ8bzFCQjtd79YcIIz0fm_s1Mp1cFL-9djG8VDOW-mNRe5xI_lpJRj20SsMUrBl1GQ1pzGvsqqM0pqzOktjXjBRR0nIoaT_rEKJWn7CtN5OgGrqzHha-EcNTjjW_5XwPiMb1LDCb7AJWiB0SeMlHvOIUp4I8v4XafwdTg:1pNTRk:wprK-xbQOJbolsuMJW6LUiYIqPh03ysUUKJVqcUa0R4	2023-02-16 12:21:48.776565+05:30	F2867E55B5C96D471666969A06F6CFFBD8280B92CB2B91DFFA812C38BE52CE1F
llws3lptf80m8h0tuluwl4mct16tbhd4	.eJxlU8lu2zAQ_ReebceUrMW6uXYDGGjQoEGbQ1EII2pcM5ZIgRxlaZB_71Cu5AS9EJzHN_vjqwCl0PuS7AmNKITpm0bMhDbkrO9QkbamdOg7azyK4lVo75l2JOp8cXWl60WnG0uLx94gLbRlX1MdRCHTZBWvkiiLZwKfuxHI8wBAX4vip3jsfQuOWug8uynQzopffGk0Gio1c0RtYIjP776vGMgPSR5VMp1jhsl8tUY5zzHJ50mVZ9kKAJIcRchAx5J0i0PiOM5jTs9t1VyJaKyC0CS0jq3uqQ5FQ-CKoQ2oW20Y69C13C5PIFT7_PIn-FSKzxsw8Bt3QHBne8cDZOyHxqev1QOPbCJMZmBeI6nj5nbvp-dbhwd0aM7-l5ifjdPq2PIQJviLVhgWMNrfPbrg9A0762jzr-Dz2711J9_BpaoJYHvrEAjfI4Fx6WSiBMiP0Mi5sTU2HygjEhh7o3TNVfuwRUID4xYlE6r-cne2wTDSu5N1fQX74KTpZWhjOLQnB2Qdc4eNFOeVcNgH0hxkkyzl9XqXRnG6XW8_yWyXJrt1FqebJN_JVcihgT6qEFjLj5yWXI-sJmW788Lfa7Dnsf6vhLeZKFnDmr9BGbQgomUUL_mYy1RGUoq3v4t7ED4:1pNWxr:7VJfJHr-cOWnv34opYKmQwZBQnETC6g9NVWTfENvKx8	2023-02-16 16:07:11.211561+05:30	null
4oc0y7i2z0tmddotqyyp5mfyyfxu8v03	.eJxlU11vmzAU_S9-TlIcsDF5IyFIkVatWrX1YZoiAzeLG7CRbfqxqv9918kgrfZifI_P_T68EVnX4NzemxNosiJZxsuEc16sRZFvaMIp4-WaJ2wdlZSJTJRFWkR5ui0pXZeCCSpYnsXFtijiLKIxmRGlvTWuh9oro_cWXG-0A7J6I8o5THH0vnermxvVLHrVGr94GjT4hTLoq6sDWVHOkjhhyzSeEXjpR0CIAMihIauf5GlwnbS-k71Dt1oqa8gvvLQKtN8r5JBGy3N8fHdDhYA4MLGsKJ9DCmyeZEDnApiYs0qkaSKlZAJIyOCPe686OCeOYxFjemyrwUpIa2rZBlJn0eqfm1C0DFxybkM2ndKI9WA7bBcnEKp9ef0TfKoaz1up5W8opJf3ZrA4fMR-KHj-Wj3iyCbCZAZmCb4-5nc7Nz3fWTiABX3xv8bcaqvqY4dDmOAvqoawgNH-7sAGp2_QG-vzfwVf3h6MPbleXquaALQ3FqSHj0hgXDuZKAFyIzRybk0D7SfKiATGTteqwapd2KIHLcctUiRUw_VuTQthpPcnY4dK7oKT8q_nNs6Hct5KbyxyzxtZXVaCYR-9wiA5i2iZFXwZ8022WdO04KzI0pjnTBQ0CTmU9J9VKFHLT5jW2wFQTbXpLwv_qMEBx_q_Et5nZI8aVvgb7IMWyDJaxhEec4rfaEne_wLWWR0R:1pNTUs:31hqtQ1tYZCx4RsCCcldrtfVZKt_1ojdRZfGOB6cA9g	2023-02-16 12:25:02.46076+05:30	996F4666DB8DAC146156FB645B0F15898FD7D0A7EF11BF858185A93DEDD39013
emnfa4toh1bm7ypapmasxx9y5wfoz8md	.eJxlU8lu2zAQ_ReebcdaSFG6abEAAw0aNGhzKAqBksY1Y4kUSCpLg_x7h3ZtJ-iF4Dy-2R_fiOg6sLZx-gCKZKQOOUs2lBa0TFkVJwFjLGVpvmY1K-u6qHjI10UalkVYpEFV1zkPwjLixYaG5SaoyYJI5Yy2E3ROatUYsJNWFkj2RqS1mGLv3GSzmxvZryY5aLd6mhW4ldToq9odyQJG4yimYRItCLxMZ4BzD4i5J9lP8jTbURg3ismiWyek0eQXXgYJyjUSOaRX4hgf3-3cIsB3lIdtwJaQAF3GKQRLDpQvacuTJBZCUA7EZ3D7xskRjomjiEeYHtvqsRIy6E4MnjQatKbn3hctPJcc2xD9KBViE5gR28UJ-GpfXv94n7bD81Yo8Rsq4cS9ng0OH7EfEp6_to84sgvhYnpmDa7b53dbe3m-M7ADA-rkf425UUZ2-xGHcIG_yA78As72dwvGO32DSRuX_yv49PagzcFO4lrVBUC7NCAcfEQ849rJheIhe4bOnFvdw_CJckY8Y6s62WPV1m_RgRLnLQZIaOfr3egB_EjvD9rMrdh6J-lej20cD2mdEU4b5B43kp1WgmEfncQgOV0HdVqxMGJlWhZBUjFapUnEcsqrIPY5pHCfVShQy0-Y1pkZUE2dnk4L_6jBGcf6vxLeF6RBDUv8Bo3XAgnXYbTGYxmEURxF5P0vaeUdRw:1pNTZF:9xCQvCOx4kgKAJRZ-3BjzeSuRfD9GIhzJYEHoPIzqfg	2023-02-16 12:29:33.40714+05:30	F2867E55B5C96D471666969A06F6CFFBD8280B92CB2B91DFFA812C38BE52CE1F
eosw6or6ujyxdnb8za4p7xe83lbd9ooj	.eJxlU8tu2zAQ_BeebceSTEnWzbUbwECDBg3aHIpCWFHrmrFECuQqjwb59y7lSk7QC8Edzr6HrwKUQu9Lsic0ohCmbxoxE9qQs75DRdqa0qHvrPEoilehvWfakajzxdWVrhedbiwtHnuDtNCWfU11EEWUylWyknGWzAQ-dyOQ5wGAvhbFT_HY-xYctdB5dlOgnRW_-NJoNFRq5ojawBCf331fMZAfZB5XUTrHDOV8tcZonqPM57LKs2wFADJHETLQsSTd4pA4SfKE03NbNVciGqsgNAmtY6t7qkPRELhiaAPqVhvGOnQtt8sTCNU-v_wJPpXi8wYM_MYdENzZ3vEAGfuh8elr9cAjmwiTGZjXSOq4ud376fnW4QEdmrP_JeZn47Q6tjyECf6iFYYFjPZ3jy44fcPOOtr8K_j8dm_dyXdwqWoC2N46BML3SGBcOpkoAfIjNHJubI3NB8qIBMbeKF1z1T5skdDAuMWICVV_uTvbYBjp3cm6voJ9cNL0MrQxHNqTA7KOucNGivNKOOwDaQ6ykcvoer1L4yTdrrefomyXyt06S9KNzHfRKuTQQB9VCKzlR05LrkdWk7LdeeHvNdjzWP9XwttMlKxhzd-gDFoQ8TJOlnzMoziRUSTe_gKLehA_:1pNTZr:N1rnMHb7EOOQiFqIR_VIPd6h77aBDFeS2PSLoiGqq8E	2023-02-16 12:30:11.366439+05:30	null
nsnknk8fl2ocowfm48y8g1foz95hpp6d	.eJxlU8tu2zAQ_BeebceSTEnWzbUbwECDBg3aHIpCWFHrmrFECuQqjwb59y7lSk7QC8Edzr6HrwKUQu9Lsic0ohCmbxoxE9qQs75DRdqa0qHvrPEoilehvWfakajzxdWVrhedbiwtHnuDtNCWfU11EEWUylWyknGWzAQ-dyOQ5wGAvhbFT_HY-xYctdB5dlOgnRW_-NJoNFRq5ojawBCf331fMZAfZB5XUTrHDOV8tcZonqPM57LKs2wFADJHETLQsSTd4pA4SfKE03NbNVciGqsgNAmtY6t7qkPRELhiaAPqVhvGOnQtt8sTCNU-v_wJPpXi8wYM_MYdENzZ3vEAGfuh8elr9cAjmwiTGZjXSOq4ud376fnW4QEdmrP_JeZn47Q6tjyECf6iFYYFjPZ3jy44fcPOOtr8K_j8dm_dyXdwqWoC2N46BML3SGBcOpkoAfIjNHJubI3NB8qIBMbeKF1z1T5skdDAuMWICVV_uTvbYBjp3cm6voJ9cNL0MrQxHNqTA7KOucNGivNKOOwDaQ6ykcvoer1L4yTdrrefomyXyt06S9KNzHfRKuTQQB9VCKzlR05LrkdWk7LdeeHvNdjzWP9XwttMlKxhzd-gDFoQ8TJOlnzMoziRUSTe_gKLehA_:1pNTZr:N1rnMHb7EOOQiFqIR_VIPd6h77aBDFeS2PSLoiGqq8E	2023-02-16 12:30:11.376531+05:30	null
ulw06y12z51b4pn9l7275z7p4mxsmhmd	.eJxlU9uOmzAQ_Rc_J1luBsMbhESK1FVXXbX7UFXIwKTxBmxkm710tf_eMSlkV33A8hyfmTM33ghvGjCmsuoMkmRkV_i5z7ZeGaRFXkTpLt5tyz1-EQ2on-ZeGgX7ICnjOKKpF0bePk_jXVgEjJZ-GhRkRYS0WpkBGiuUrDSYQUkDJHsjwhiUOFk7mOzmRrSbQXTKbp5GCXYjFPrK-kgyP6ZRiHpJuCLwMswAYw7gY0uyn-RpND3XtueDQbeGC63IL7x0AqStBHJIK_kUH9_NWCPAjpQFtR-vIQG6jlLw1wwoW9OaJUnEOacMiFOwp8qKHibhMGQhymNZLWZCOtXwzpF6jdbw3LqkueOSqQze9kIiNoDusVzsgMv25fWP86kbPG-55L-h5Jbfq1Fj8xH7IeD5a_2ILVsIi-mYe7DNKb87mOX5TsMRNMiL_zXmTmrRnHpswgJ_EQ24Acz2dwPaOX2DQWmb_0v48vag9NkM_JrVAqC91cAtfEQc41rJQnGQmaGZc6ta6D5RZsQxDrIRLWZt3BQtSD5P0UdCPV7vWnXgWnp_Vnqs-cE5Cfs6lTEdwljNrdLInSaSXUaCYR-twCA59fx9WsZBGG_TbeHjLtMyTcI4p6z0I6chuP28hRx3-QllrR4Bt6lRw2XgH3dwxLb-vwnvK1LhDgv8DSq3CyTwgtDDY-0HIQqQ97_c2B0b:1pNTaN:-WktZi1fj3rcsi0rtBS_-nZuMNG-1PBsjS-7d9EI_X0	2023-02-16 12:30:43.472055+05:30	EB1A18C0D29BAB49E6ECDFECD452519A0942F27D664590340FA96E3B285D192B
kf84cth0fva8wzjk0zbqnc46mc1574gu	.eJxlU9uOmzAQ_Rc_J1luBsMbhESK1FVXXbX7UFXIwKTxBmxkm710tf_eMSlkV33A8hyfmTM33ghvGjCmsuoMkmRkV_i5z7ZeGaRFXkTpLt5tyz1-EQ2on-ZeGgX7ICnjOKKpF0bePk_jXVgEjJZ-GhRkRYS0WpkBGiuUrDSYQUkDJHsjwhiUOFk7mOzmRrSbQXTKbp5GCXYjFPrK-kgyP6ZRiHpJuCLwMswAYw7gY0uyn-RpND3XtueDQbeGC63IL7x0AqStBHJIK_kUH9_NWCPAjpQFtR-vIQG6jlLw1wwoW9OaJUnEOacMiFOwp8qKHibhMGQhymNZLWZCOtXwzpF6jdbw3LqkueOSqQze9kIiNoDusVzsgMv25fWP86kbPG-55L-h5Jbfq1Fj8xH7IeD5a_2ILVsIi-mYe7DNKb87mOX5TsMRNMiL_zXmTmrRnHpswgJ_EQ24Acz2dwPaOX2DQWmb_0v48vag9NkM_JrVAqC91cAtfEQc41rJQnGQmaGZc6ta6D5RZsQxDrIRLWZt3BQtSD5P0UdCPV7vWnXgWnp_Vnqs-cE5Cfs6lTEdwljNrdLInSaSXUaCYR-twCA59fx9WsZBGG_TbeHjLtMyTcI4p6z0I6chuP28hRx3-QllrR4Bt6lRw2XgH3dwxLb-vwnvK1LhDgv8DSq3CyTwgtDDY-0HIQqQ97_c2B0b:1pNTaN:-WktZi1fj3rcsi0rtBS_-nZuMNG-1PBsjS-7d9EI_X0	2023-02-16 12:30:43.514345+05:30	EB1A18C0D29BAB49E6ECDFECD452519A0942F27D664590340FA96E3B285D192B
9m1mgrumctwjuvbspgb8b1293ubxk7ut	.eJxlU8tu2zAQ_BeebceyrId1c-wGMNCgQYM2h6IQVtQ6ZiyRBLlykgb59y7lSk7QC8Edzr6HbwKkRO9LMkfUohC6axoxEUqTM96iJGV06dBboz2K4k0o75l2ILK-uLpS9cyqxtDs1GmkmTLsq6u9KKI0WcbLZJHFE4EvdgDyPADQ1aL4JU6db8FRC9azmwTljPjNl0ahplIxR9Qa-vj87ruKgXyf5IsqSqeYYTJdrjCa5pjk06TKs2wJAEmOImSgQ0mqxT5xHOcxp-e2aq5ENEZCaBJax5Z9rkPRELiibwPqVmnGLLqW2-UJhGpfXv8En0ryeQsaHnELBPemczxAxn4qfP5WPfHIRsJoBuYNkjys73Z-fL5zuEeH-ux_iflFOyUPLQ9hhL8qiWEBg_3DowtO39EaR-t_BZ_fHow7eguXqkaA7Y1DIPyIBMalk5ESID9AA-fW1Nh8ogxIYOy0VDVX7cMWCTUMW4yYUHWXuzMNhpHeH43rKtgFJ0WvfRv9oTw5IOOY22-kOK-Ewz6R4iDrZB7drLbpIk43q811lG3TZLvK4nSd5NtoGXIooM8qBNbyidOS65DVJI09L_yjBjse6_9KeJ-IkjWs-BuUQQtiMV_Ecz6mUTyfRyvx_heLbhBA:1pNTyB:MBznE73wO9Xmvyg_f6N38vi_RrsRTcC3bAu9gnG1xjE	2023-02-16 12:55:19.191243+05:30	null
evitl6hklym0aw3dz3jw4ytxe5ehomfc	.eJxlU8tu2zAQ_BeebceyrId1c-wGMNCgQYM2h6IQVtQ6ZiyRBLlykgb59y7lSk7QC8Edzr6HbwKkRO9LMkfUohC6axoxEUqTM96iJGV06dBboz2K4k0o75l2ILK-uLpS9cyqxtDs1GmkmTLsq6u9KKI0WcbLZJHFE4EvdgDyPADQ1aL4JU6db8FRC9azmwTljPjNl0ahplIxR9Qa-vj87ruKgXyf5IsqSqeYYTJdrjCa5pjk06TKs2wJAEmOImSgQ0mqxT5xHOcxp-e2aq5ENEZCaBJax5Z9rkPRELiibwPqVmnGLLqW2-UJhGpfXv8En0ryeQsaHnELBPemczxAxn4qfP5WPfHIRsJoBuYNkjys73Z-fL5zuEeH-ux_iflFOyUPLQ9hhL8qiWEBg_3DowtO39EaR-t_BZ_fHow7eguXqkaA7Y1DIPyIBMalk5ESID9AA-fW1Nh8ogxIYOy0VDVX7cMWCTUMW4yYUHWXuzMNhpHeH43rKtgFJ0WvfRv9oTw5IOOY22-kOK-Ewz6R4iDrZB7drLbpIk43q811lG3TZLvK4nSd5NtoGXIooM8qBNbyidOS65DVJI09L_yjBjse6_9KeJ-IkjWs-BuUQQtiMV_Ecz6mUTyfRyvx_heLbhBA:1pNTyB:MBznE73wO9Xmvyg_f6N38vi_RrsRTcC3bAu9gnG1xjE	2023-02-16 12:55:19.205098+05:30	null
r30m2647f1np1pwdxzwse0exrsckpbv2	.eJxlU11v2jAU_S9-BkoITkLeKKwS0qpVq7Y-TFN0k1yKS2Jb9g1tV_W_7zosodVeLN_jc7-P3wRUFXpfkDmiFrnQXdOIiVCanPEWK1JGFw69NdqjyN-E8p5pByLr86srVc-sagzNTp1GminDvrrcizxK5DJeykUaTwS-2AHIsgBAV4v8lzh1vgVHLVjPbhUoZ8RvvjQKNRWKOaLW0Mfnd9-VDGR7mS3KKJliinK6XGE0zVBmU1lmaboEAJmhCBnoUJBqsU8cx1nM6bmtmisRjakgNAmtY8s-16FoCFzRtwF1qzRjFl3L7fIEQrUvr3-CT1nxeQsaHnELBPemczxAxn4qfP5WPvHIRsJoBuYNUnVY3-38-HzncI8O9dn_EvOLdqo6tDyEEf6qKgwLGOwfHl1w-o7WOFr_K_j89mDc0Vu4VDUCbG8cAuFHJDAunYyUAPkBGji3psbmE2VAAmOnK1Vz1T5skVDDsMWICWV3uTvTYBjp_dG4roRdcFL02rfRH8qTAzKOuf1G8vNKOOwTKQ6ylvPoZrVNFnGyWW2uo3SbyO0qjZO1zLbRMuRQQJ9VCKzlE6cl1yGrqTL2vPCPGux4rP8r4X0iCtaw4m9QBC2IxXwRz_mYRnKezhPx_heLkhBF:1pNVws:n7uj-Y1qzm59ADDpoKinivAgL5OcUZ0KwoPTHs7_d5Q	2023-02-16 15:02:06.822611+05:30	null
dtvwyj1cbtnoj7tsierp8u0vla4fu1zo	.eJxlU8lu2zAQ_ReebceyVuvm2g1goEGDBm0ORSGMqHHNWCIJcpSlQf69Q7mSE_RCcB7f7I-vAqRE7ysyJ9SiFLpvWzETSpMz3qIkZXTl0FujPYryVSjvmXYksr68ulLNwqrW0OKx10gLZdhX1wdRRlmaxEm6yuOZwGc7AkURAOgbUf4Uj73vwFEH1rObBOWM-MWXVqGmSjFHNBqG-Pzu-5qB4pAWqzrK5phjOk_WGM0LTIt5Whd5ngBAWqAIGehYkepwSBzHRczpua2GKxGtkRCahM6xZZ-aUDQErhjagKZTmjGLruN2eQKh2ueXP8GnlnzegIbfuAOCO9M7HiBjPxQ-fa0feGQTYTID8xpJHje3ez893zo8oEN99r_E_KydkseOhzDBX5TEsIDR_u7RBadvaI2jzb-Cz2_3xp28hUtVE8D21iEQvkcC49LJRAmQH6GRc2MabD9QRiQw9lqqhqv2YYuEGsYtRkyo-8vdmRbDSO9OxvU17IOTopehjeFQnhyQccwdNlKeV8JhH0hxkE26jK7Xu2wVZ9v19lOU77J0t87jbJMWuygJORTQRxUCa_mR05LrkdUkjT0v_L0Gex7r_0p4m4mKNaz4G1RBC2K1XMVLPuZRHidRLN7-AoueEEU:1pNYFF:hMmqL4UT4gnCxSo8lBOg_3M-xN6JxN9JxiZsNIr37E0	2023-02-16 17:29:13.133157+05:30	null
9gafigde0fyylkq3xhulnoa9epmjqz6g	.eJxlU8lu2zAQ_ReebceyVuvm2g1goEGDBm0ORSGMqHHNWCIJcpSlQf69Q7mSE_RCcB7f7I-vAqRE7ysyJ9SiFLpvWzETSpMz3qIkZXTl0FujPYryVSjvmXYksr68ulLNwqrW0OKx10gLZdhX1wdRRlmaxEm6yuOZwGc7AkURAOgbUf4Uj73vwFEH1rObBOWM-MWXVqGmSjFHNBqG-Pzu-5qB4pAWqzrK5phjOk_WGM0LTIt5Whd5ngBAWqAIGehYkepwSBzHRczpua2GKxGtkRCahM6xZZ-aUDQErhjagKZTmjGLruN2eQKh2ueXP8GnlnzegIbfuAOCO9M7HiBjPxQ-fa0feGQTYTID8xpJHje3ez893zo8oEN99r_E_KydkseOhzDBX5TEsIDR_u7RBadvaI2jzb-Cz2_3xp28hUtVE8D21iEQvkcC49LJRAmQH6GRc2MabD9QRiQw9lqqhqv2YYuEGsYtRkyo-8vdmRbDSO9OxvU17IOTopehjeFQnhyQccwdNlKeV8JhH0hxkE26jK7Xu2wVZ9v19lOU77J0t87jbJMWuygJORTQRxUCa_mR05LrkdUkjT0v_L0Gex7r_0p4m4mKNaz4G1RBC2K1XMVLPuZRHidRLN7-AoueEEU:1pNYFF:hMmqL4UT4gnCxSo8lBOg_3M-xN6JxN9JxiZsNIr37E0	2023-02-16 17:29:13.195612+05:30	null
cnglpimi1ncqxuzdrhrszs1zfh4knlax	.eJxlU8tu2zAQ_Beebcd6UJJ1c-wGMNCgQYM2h6IQVtQ6ZiyRBEk5SYP8e5dyJSfoheAOZ9_DNwZCoHOV10dUrGSqb1s2Y1J5q51B4aVWlUVntHLIyjcmnSPawXvjyqsr2SyMbLVfnHqFfiE1-ap6z8oo42mS8jhPZgxfzAgURQCgb1j5i51614H1HRhHbgKk1ew3XVqJyleSOKxRMMSnd9fXBBR7XsR1lM0xRz5PVxjNC-TFnNdFnqcAwAtkIYM_VF52OCROkiKh9NRWQ5WwVgsITUJnyTLPTSgaApcNbUDTSUWYQdtRuzSBUO3L65_gUws6b0HBI27Bw73uLQ2QsJ8Sn7_VTzSyiTCZgXmDXhzWdzs3Pd9Z3KNFdfa_xPyirBSHjoYwwV-lwLCA0f7h0Aan72i09et_BZ_fHrQ9OgOXqiaA7I1F8PgRCYxLJxMlQG6ERs6tbrD9RBmRwNgpIRuq2oUtelQwbjEiQt1f7la3GEZ6f9S2r2EXnKR_HdoYDum8Ba8tcYeNlOeVUNgnLynImi-jm9U2i5Nss9pcR_k249tVnmRrXmyjNOSQ4D-rEEjLJ0rrbY-kJqHNeeEfNdjTWP9XwvuMVaRhSd-gClpg8TJOlnTMozxJY87e_wKLqBBI:1pNYFR:fLyhlH9kotHSnX3QtLX0rV2-mhkcY8WVeNY9Zd7bImY	2023-02-16 17:29:25.633925+05:30	null
bf9uvaxizhi8egp4kh5gmoi8spz831ny	.eJxlU8tu2zAQ_Beebcd6UJJ1c-wGMNCgQYM2h6IQVtQ6ZiyRBEk5SYP8e5dyJSfoheAOZ9_DNwZCoHOV10dUrGSqb1s2Y1J5q51B4aVWlUVntHLIyjcmnSPawXvjyqsr2SyMbLVfnHqFfiE1-ap6z8oo42mS8jhPZgxfzAgURQCgb1j5i51614H1HRhHbgKk1ew3XVqJyleSOKxRMMSnd9fXBBR7XsR1lM0xRz5PVxjNC-TFnNdFnqcAwAtkIYM_VF52OCROkiKh9NRWQ5WwVgsITUJnyTLPTSgaApcNbUDTSUWYQdtRuzSBUO3L65_gUws6b0HBI27Bw73uLQ2QsJ8Sn7_VTzSyiTCZgXmDXhzWdzs3Pd9Z3KNFdfa_xPyirBSHjoYwwV-lwLCA0f7h0Aan72i09et_BZ_fHrQ9OgOXqiaA7I1F8PgRCYxLJxMlQG6ERs6tbrD9RBmRwNgpIRuq2oUtelQwbjEiQt1f7la3GEZ6f9S2r2EXnKR_HdoYDum8Ba8tcYeNlOeVUNgnLynImi-jm9U2i5Nss9pcR_k249tVnmRrXmyjNOSQ4D-rEEjLJ0rrbY-kJqHNeeEfNdjTWP9XwvuMVaRhSd-gClpg8TJOlnTMozxJY87e_wKLqBBI:1pNYFR:fLyhlH9kotHSnX3QtLX0rV2-mhkcY8WVeNY9Zd7bImY	2023-02-16 17:29:25.675781+05:30	null
y9kcxt6xbt73pcbuanra27wzre8piyk5	.eJxtUsuO3CAQ_BfO4xmahw2-gY1_w2JsRkMyBsvg3ZVW---BlSIlSiQuXU1XVRd8IrssLqU5x58uoB61hoAhUgqjjYauw1wZISYw2EjBBz4KySeOx2nircKj0JMyGJgaqKKUtBRdkA_5iGl3S_YxzIdLewzJof4T-ZSKxDPnPfW3G4H2ysQVBL0Ca29-LbPh_kA9tB1nmFEiL8h97L-BTlbAnmvheDvTZo-82T2VqeXlXcizr51g_RHvvqDpvJdaUoA747ThDEjDgLaNpfbRLAJgkZ3ggj1Qpc3POfvN_SEvyi5rkUevuNhXvbQdpdrfq9Mjvty3keByD71fy9ntuvlQ17CVCK1xDjGXbM_lWdAf2ReQaoqnoVOjElpzPklDiFYDNlSKTlJVnX9vovAg1aS5GRgfpVak1QMmlLBBQotbqFHb_HdctoT-VqTzcbrCs8Td_ZPWmdzxP4NfFzSXuH15sTnWv0CKGiaYNgAMU0BfvwCjX577:1pNpCW:TUzjubFm25asEWw6f7zmlIzqupxG6N0fHOLiZK0bcT4	2023-02-17 11:35:32.027563+05:30	6E21E2998EBEB17705AE88F1E0E985C5D895F50DFF56A0D8BFAE014AC3A33263
2rlcrwfdt6c9et63xp85clbca0iwtlxg	.eJxtUsuO3CAQ_BfO4xmaN76NX79hMTarIRmDZfAm0mr_Pc0ql1WCONAFXV1dzQdxy-Jznkv66SNpST-MFtc0caa5Bc67zoKdYDSdFZqN052Og7ZGC5C001LUk-K2U1Yyqi25kBDLkfLulxJSnA-f9xSzJ-0HCTljiWcpe25vNwbqKswVDL-CULewYm58vJEWFPIil9UX4n_vfwEAWQF3rsjxfubNHWVze8as5RV8LHOoN9GFIz0Covl8YMxXJQ1Y2hjqfCPezKMxXNKGeW9AK2r5upBKW55zCZv_Xj6sWJ680uJe9dF2YLT_qkqP9PJfQqIvLbRhxb27dQuxtuEqEVnTHFNBb8_lieiPEhC0I_CRSjuIrkcveTfqnkkYOdV8oNBX5V-dTKJj4t6LoVcWbVe6BzrJoZf3ASbgolrtyne9Dk1_x9LlOD3yLGn3_7h1Zn_8T-Dnhcxod8CJzan-BUYZp4zyBjiOGMjnH4O8nyY:1pNqhP:RnVJuBV5ivNOvrcy4CNz4im_eHoXbnYaHN0CGOFxItE	2023-02-17 13:11:31.955127+05:30	CDE9999FF32739133BB919F1E8B9472EFA0ED79874150B7548741639B6952079
z71oenh4994x3ioyg185mkhjxo6myzlv	.eJxtUsuO3CAQ_BfO4xmaN76NX79hMTarIRmDZfAm0mr_Pc0ql1WCONAFXV1dzQdxy-Jznkv66SNpST-MFtc0caa5Bc67zoKdYDSdFZqN052Og7ZGC5C001LUk-K2U1Yyqi25kBDLkfLulxJSnA-f9xSzJ-0HCTljiWcpe25vNwbqKswVDL-CULewYm58vJEWFPIil9UX4n_vfwEAWQF3rsjxfubNHWVze8as5RV8LHOoN9GFIz0Covl8YMxXJQ1Y2hjqfCPezKMxXNKGeW9AK2r5upBKW55zCZv_Xj6sWJ680uJe9dF2YLT_qkqP9PJfQqIvLbRhxb27dQuxtuEqEVnTHFNBb8_lieiPEhC0I_CRSjuIrkcveTfqnkkYOdV8oNBX5V-dTKJj4t6LoVcWbVe6BzrJoZf3ASbgolrtyne9Dk1_x9LlOD3yLGn3_7h1Zn_8T-Dnhcxod8CJzan-BUYZp4zyBjiOGMjnH4O8nyY:1pNqhP:RnVJuBV5ivNOvrcy4CNz4im_eHoXbnYaHN0CGOFxItE	2023-02-17 13:11:31.970112+05:30	CDE9999FF32739133BB919F1E8B9472EFA0ED79874150B7548741639B6952079
5ssjmxowu94khffkmks8srvc7lzebbfd	.eJxtUtmO3CAQ_Bee5-Bsg9984N-wGJvVkIzBMngTabX_nmalSIkSiZeupquqCz6IWxaf81zSdx9JS6SaJisVo5aOnWJgBYzQSWVt1w8cgBsBVg29AN5Pox6Gzmqph5ENojEddORCQixHyrtfSkhxPnzeU8yetB8k5IwSz1L23N7vnMFN6hvT4sYk3MOKs_HxRloGjZKMagYX4n_uvwEpK-DOFTnez7y5o2xuzzi1vIKPZQ61E1040iMgms8H1mIFpZmhV02dv8o3_bhqoeiVe69ZA9SIdSGVtjznEjb_h7zCXVaUJ6-0uFe9tB1Y7T-q0yO9_JeR6EvL2rDi2d26hVjXcJWIrGmOqWC25_JE9FsJCNJGauglxdg06w3YcWyskGoA2nCYTHX-tUnT2UaaSVgzgpKib0YFmkqrhebGMFmjduXvuByG_o7S5Tg98ixp9_-kdWZ__M_g54XMGHfAF5tT_QucckE5FVcmuBaGfP4CCRmfFw:1pNqt9:nenxFa_dW1WiLqfkvrrrwbRk5XDKRYXKNceQupD7BcY	2023-02-17 13:23:39.762134+05:30	45FFE4510E0DA516E36D6A45EEABC2662936E5CB362BFD8CCAE848CD1C379A6A
1yuvxuhc0na5axtwrier9sa0hbipbfeg	.eJx1U8tO3DAU_RXk9QzEjzhOdiGZSEhFRUWFRVWNHOfSMUycyHagEuLfezMvpqq6yOKce-7TJ-9EGwMhrOPwAo4UhLEqbXhFucrkqixXpWySFX5UCUHzlVBU0YrRRHJFS1UJyagsG3XNc5rJUlRkQayLfggjmGgHt_YQxsEFIMU7sSFgi02MYyiurjDzUqhLqvglFfLKdpjr2idSUJmlAikqFwR-j0dCsZnQU4c1XqfQax97PQbMMlsLLq7tHHHa-qG1yIapRfwkclAio8su5e1SUEOXbS6TpRaMi8QkUuiWzGXjZh1tD2ftU9ylw_ZkOxi9nUW9RzS-7SbVs5Y8TA7iRdn11l18D-AxEsHp4zQU8Qi-x83xGKT4QW6107_gizUwH2VBHiy8fW2f8VoI9sETrHXUDUSzKe9uwil85-EJPDh8t0P-jTO2wwt8aubMlfPWbHrkT_Q84Sz6BuPg427qU-xx8C9h1PuqlQcdP6lDn3O8V8x9bocOtgfFOf5UhGHypyIzcX8k9pqH-v7ebKDXB8k5Pu7WAHStNi_k54L4YQs7E-DtC1rYrtCHVZ6jxYAUeVVepyWrOJVJkqfoTNlkdZLTRiV1M5tj9zxylTF1LVLKGZNKNVzWNaN1mgnFqoyq2c06_u1Ijb5-xfbRT4B1zDDCP4ac8M7_M8jHgqzR1RZ_jPWw--USxhOW8CVNGU8T8vEH2HYZfw:1pNsgc:qhMDo4m87I39INRUQ7Kis2YMKpPfie35fNxI7bOlEgQ	2023-02-17 15:18:50.819097+05:30	22C5F3C13876EAAEA6F0E6F0184419E48181C2106381A8C46216AF8B39176A4C
ljredxu6lrqmcz23da163mm51vwfeb5h	.eJx1U9tu3CAQ_ZWI570YjMH2m-OLFKlRo0bdPlTVCuPZLMkaW4CTSlH-vbD3Nuob58yZKzPvSEgJ1q7d8AIa5ahOaU2zglQJIZRxQikjZR1VSVXyNME1L2ndYBanxW2Jm7rMcFOyjOG4qZq4qhmaIaWdGewI0qlBrw3YcdAWUP6OlLU-xda50ebLJcFsQdMFTuMFpmypOu-r2w3KMeMJJRTjeIbg93giOA-EmDof43WyvTCuF6P1XnKnQLu1ChYtlBla5Vk7tR4nApKMQzTnSZbNqUyjebvhMJcMaLppM9EJikJYt1071cMxG84yjH0vnU-PdoMUuyDqjUfj275SEbRoNWlwN0XXK33z3YLxFgdanKrBHo9get-5HwbKf6J7ocUTfFESwlBmaKXg7Wv77KflwcF4hpVwogEnt8XDnT2bHwxswID2_3b0v9NSdX4CF03wrLVRctt7_kyHCoPoG4yDcfuqz7Yfg3mxozhELQ0Id6GOea7xQRHy3A8d7I6Ka3xR2GEy5yCBeDwRB82qenyUW-jFUXKNT701AF0r5Mu53vr1U8eHsP9w4JzST5euTzOoYAfXDfyaITPsYL9c_k9znKsuF8cRPTvlDVFRU86SKGK4TjP_pmVUFCyjMScpuS3C0u2_vWyikjesqhuWYppFjFfJLW4IqTBL6igNVyLc36sm_L28-vTOTODjyGGET4s--dr_t3gfM7T216L8wa3DqiESkTgiUTzHHCcxQR9_AN9VOgU:1pNuQi:Y19NGCyRtX-R8PJI7WHsBYtMFRONJJ5tttvCaI6uTHY	2023-02-17 17:10:32.424363+05:30	E84E49A2D52246724462CE0D5DC7851E7C4EF1638ABC1FEC91FC69613FDF3DE6
i1r4qqdjq0qvp12w421whg80lyb8kh1c	.eJx1U9tu3CAQ_ZWI570YjMH2m-OLFKlRo0bdPlTVCuPZLMkaW4CTSlH-vbD3Nuob58yZKzPvSEgJ1q7d8AIa5ahOaU2zglQJIZRxQikjZR1VSVXyNME1L2ndYBanxW2Jm7rMcFOyjOG4qZq4qhmaIaWdGewI0qlBrw3YcdAWUP6OlLU-xda50ebLJcFsQdMFTuMFpmypOu-r2w3KMeMJJRTjeIbg93giOA-EmDof43WyvTCuF6P1XnKnQLu1ChYtlBla5Vk7tR4nApKMQzTnSZbNqUyjebvhMJcMaLppM9EJikJYt1071cMxG84yjH0vnU-PdoMUuyDqjUfj275SEbRoNWlwN0XXK33z3YLxFgdanKrBHo9get-5HwbKf6J7ocUTfFESwlBmaKXg7Wv77KflwcF4hpVwogEnt8XDnT2bHwxswID2_3b0v9NSdX4CF03wrLVRctt7_kyHCoPoG4yDcfuqz7Yfg3mxozhELQ0Id6GOea7xQRHy3A8d7I6Ka3xR2GEy5yCBeDwRB82qenyUW-jFUXKNT701AF0r5Mu53vr1U8eHsP9w4JzST5euTzOoYAfXDfyaITPsYL9c_k9znKsuF8cRPTvlDVFRU86SKGK4TjP_pmVUFCyjMScpuS3C0u2_vWyikjesqhuWYppFjFfJLW4IqTBL6igNVyLc36sm_L28-vTOTODjyGGET4s--dr_t3gfM7T216L8wa3DqiESkTgiUTzHHCcxQR9_AN9VOgU:1pNuQi:Y19NGCyRtX-R8PJI7WHsBYtMFRONJJ5tttvCaI6uTHY	2023-02-17 17:10:32.445253+05:30	E84E49A2D52246724462CE0D5DC7851E7C4EF1638ABC1FEC91FC69613FDF3DE6
tfb38v9ngb0glww28a94jtxf22ksm2f1	.eJx1U8lu2zAQ_ZWAZzsRZZJabrIWIECDBg2aHorCoKhxzMSiBJJKCgT59w69t0GP782bfeadSKXAuZUfXsCQnERFRpmoWExTGtNlzHnd8IpVgqcirVlTiyihvGBVVcZFItKyYkIsm5LTSCQs4mRGtPF2cCMorwezsuDGwTgg-TvRzmGKjfejy29uYiquWXpN08U1przRHfqadk1yKhLOYsZoNiPwezwSaRQIOXUY43VyvbS-l6NDL7XVYPxKB4uR2g6tRtZNLWIugWcJRPOEZ9mcqTSat-sE5koAS9dtJjvJSAjrNyuvezhko1lGKfbSYXqyHZTcBlFvEY1vu0pl0JLHyYC_Krpem6vvDixaPBh5rIYiHsH22DkOg-Q_yZ008gm-aAVhKDPyqOHta_uM00KwN55gJb1swKtNcX_rTuZ7C2uwYHBvB_9bo3SHEzhrgmdtrFabHvkTHSoMom8wDtbvqj7Zfgz2xY1yH7W0IP2ZOuS5xHtFyHM3dLA9KC7xWeGGyZ6CBOLhSOw1j9XDg9pALw-SS3zsrQHoWqleTvXWr5863of9hwPvtXk6d32cQQVbuGzg14zYYQu748Kd5jTXXS4PI3r2Gg2sKctlUhVZQUsukiZdLHmUNcs0ZmWxiJNwdLu1l01UJo2o6kaklGX4GhVf0iaOKyp4HaXhS6T_-9Il_ssrpvd2AoyjhhE-HfqEtf_v8D5mZIXfovHhVuHUSBzFiyiOFnOa8JQL8vEHlpA5_w:1pNv6i:cEZ3EoZXR4KaD_yUfNHL7XBjKbRQ5kOODQk5ejvBBdM	2023-02-17 17:53:56.935082+05:30	0A9146D4218121B255EF5D4D65868E4FE60715A4DDC2A768CD466BFC51067405
nuqmlydfybv7mz89wflw4pv76fvcejf2	.eJxtUtGOpCAQ_BeexxlsBNQ3UfkNA8pmuBvBCO5dstl_v2aTfbjcEV6opqu6Cj6IWVeX0pLjTxdIT4aum5jmUg2UDg0fqZ7pyGc6TWOtqOCjUILOI3DJhGJaTZMS89RpCmzQbBDkRnzIZ0yHW7OPYTldOmJIjvQfxKeEEs-cj9Q_HnUH91q0d-jutYSH37A32DfS10JKgYRtdyPu9_EN8K4A5tqQ4_1Kuznzbo6EXevLu5AXXyrB-DNaj2i6LJ5Xt1kG1lSwgqwa1tnK1tZWDAzYN-g45w0ptPm5ZL-7b7W6lRK9bChPXnE1r3JpP_F0_CqTnvHlvgYJLvd17zfch9l2H4oNU4jIFpcQM2Z7rU9Ef2SPoORKtSBEJzilctaCgVC6lUrIBuRYhklfTgYxY2Hm86z1wND8SBstplG3WioGskRt8t9xGQz9HaXzeTnkWePh_knrSu7834CfN7Jg3B5fbInlLwCSUoC2AlwMyOcfrAmgpA:1pX38X:uVjWTxHYDxAgaITLiIrbWBfMGG6-JYNJqyX1LSbrTmA	2023-03-14 22:17:33.635697+05:30	A99D3F57BA00A45C0FE0C5E0DDC1B065C6B60EC25736B3FBDDB6ED9F023AF3A6
fm51yy9n0a6z0c33sn42ru2qkdrlcwl2	.eJxtUkGO3CAQ_Avn8QwGA8Y3Y5tvWIBZDckYLIM3kVb79zQr7SFKEBeq6aqugg9knPM5ryX99BENaJRyppoJNWI8dmzCesETW_A8T63CnE1ccbxMhAnKFdVqnhVfZqkxoaOmI0c3FGI5Uz68KyHF9fT5SDF7NHygkDNIPEs58vB4tJLcW97fiby3gjzCBr3RvqGh5UJwIOzlDfnfxzfAZAXMtQHH-5V3c5bdHBm63Cv4WNZQK9GEM9kAaL4snJ3fLCXWNMQR0XRU2sa21jaUGGLfiGSMdajSludawu6_1dpeCPCygTx6JWde9dJ-wun4VSc908t_DRJ9GdohbLAPs-0hVhumEqEtrTEVyPZyT0B_lACgYEr1hHPJGcZi0ZwSrnQvFBcdEVMdJn85GfkChYUti9YjBfMT7jSfJ91roSgRNWpT_o7LQOjvIF3OywOPS4f_J60r-_N_A37e0ApxB3ixNdW_QIAUE9I3BBal6PMPrAygpQ:1pX38X:0g9SlNOVccfuwPgwBtDESkGAuYtl5KYJwuXP6OJSZFQ	2023-03-14 22:17:33.669448+05:30	A99D3F57BA00A45C0FE0C5E0DDC1B065C6B60EC25736B3FBDDB6ED9F023AF3A6
p8uul4n7x85kzviub0m6cy40lx5b1sck	.eJx1U9tq3DAQ_ZWg593EsiX58ubYXgg0NDR0-1DKIsuzWSVr2UhyUgj594723oY-iXPmzH30TqRS4NzKDy9gSEFuKV-Iss4TVqY55WlG60oktxVNKRVRxOO0rmqWV00ZN7zJGU_jhaBRJpKG1oIKMiPaeDu4EZTXg1lZcONgHJDinWjnMMXG-9EVNzc0j6-pyK7jHB9-ozv0Ne2aFFSkWcJEwvmMwO_xSOR5IOTUYYzXyfXS-l6ODr3UVoPxKx0sRmo7tBpZN7WI2ZqtFU_YXGaynTOq0nnLGcxbhcVnck1BRSSE9ZuV1z2c07MUe-kwPdkOSm6DqLeIxrddpTJoyXIy4K_Krtfm6rsDixYPRh6roYhHsD12jsMgxU9yL418gi9aQRjKjCw1vH1tn3FaCPbGE6yllwvwalM-3LmT-cHCGiwY3NvB_84o3eEEzprg2Rir1aZH_kSHCoPoG4yD9buqT7Yfg31xo9xHrSxIf6YOeS7xXhHy3A8dbA-KS3xWuGGypyCBeDwSe82yfnxUG-jlQXKJj70tALpWqpdTvc3rp473Yf_hwHttns5dH2dQwxYuG_g1I3bYwu64cKcFLXRXyMOInr0O22RpFi9uWcmyOipZw3lVZSwWTGQNrco8HN1u7RllUVkmuWgyVEe1yGqRpk2NnlFNF0n4JdL_fekS_8srpvd2AoyjhhE-HfqEtf_v8D5mZIW_ReOHW4VTI3EUJ1ES5XOaJDHj5OMPEMw59A:1paB9l:naFxnImgYO1TEzN6TUJXlfEhuINQCgcUpbYSzl3otSk	2023-03-23 13:27:45.08318+05:30	B15F6AD934A7915781DC63BC1711600527DCD49CEA2E5E94572F610863E1D616
\.


--
-- Data for Name: vu_auth_provider_dataaccesspolicy; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vu_auth_provider_dataaccesspolicy (bu_id, created_at, tenant_id, updated_at, id, category, condition, keycloak_group_id, must_match, tables, type, wildcard_patterns, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: vu_auth_provider_usergroupmembership; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vu_auth_provider_usergroupmembership (id, created_at, group_id, user_id) FROM stdin;
\.


--
-- Data for Name: vu_auth_provider_userprofile; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vu_auth_provider_userprofile (id, user_created_time, last_login_time, home_page, mobile_home_page, mobile_kpi, tenant_id, bu_id, allow_console_login, user_auth_type, department, user_id, keycloak_user_id) FROM stdin;
\.


--
-- Data for Name: vu_auth_provider_userprofile_groups; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vu_auth_provider_userprofile_groups (id, userprofile_id, groups_id) FROM stdin;
\.


--
-- Data for Name: vusoft_alertrule; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_alertrule (tenant_id, bu_id, alert_rule_id, title, summary, description, enabled, config, created_at, created_by_id, updated_at, updated_by_id) FROM stdin;
\.


--
-- Data for Name: vusoft_alertrule_owners; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_alertrule_owners (id, alertrule_id, group_id) FROM stdin;
\.


--
-- Data for Name: vusoft_alertrules; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_alertrules (alert_id, alert_name, alert_json) FROM stdin;
\.


--
-- Data for Name: vusoft_assetaudittrail; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_assetaudittrail (id, name, context, onboarded_at, first_data_received_at, latest_data_received_at, connectivity_verified_at, connected, tenant_id, bu_id, created_at, updated_at, asset_id) FROM stdin;
\.


--
-- Data for Name: vusoft_datacollectionmethod; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_datacollectionmethod (dcm_id, name, agent_config_template) FROM stdin;
\.


--
-- Data for Name: vusoft_datastreams; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_datastreams (tenant_id, bu_id, id, name, partitions, description, advanced_settings, retention_setting_in_mins, created_at, created_by_id, updated_at, updated_by_id) FROM stdin;
\.


--
-- Data for Name: vusoft_datastreamservicemapping; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_datastreamservicemapping (id, service_id, service_type, data_stream_id, data_stream_type) FROM stdin;
\.


--
-- Data for Name: vusoft_hrmsdata; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_hrmsdata (id, username, user_info, hrms_search_string, user_group, last_modified_time) FROM stdin;
\.


--
-- Data for Name: vusoft_hrmsmapping; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_hrmsmapping (name, mapping) FROM stdin;
\.


--
-- Data for Name: vusoft_insightcards; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_insightcards (bu_id, created_at, tenant_id, updated_at, insight_id, name, description, definitions, insight_type, insight_content, script, is_template, created_by_id, updated_by_id, is_preloaded) FROM stdin;
\.


--
-- Data for Name: vusoft_insightcards_owners; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_insightcards_owners (id, insightcards_id, group_id) FROM stdin;
\.


--
-- Data for Name: vusoft_logicalvublockmapping; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_logicalvublockmapping (target_id, target, component_vublock, logical_vublock, logical_vublock_instance) FROM stdin;
\.


--
-- Data for Name: vusoft_mobiledashboard; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_mobiledashboard (id, bu_id, created_at, updated_at, tenant_id, name, description, status, visualizations, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: vusoft_sparkjobhistory; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_sparkjobhistory (id, app_name, job_id, start_time, end_time, job_status, last_modified_time) FROM stdin;
\.


--
-- Data for Name: vusoft_storyboards; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_storyboards (storyboard_id, storyboard_name, storyboard_json) FROM stdin;
\.


--
-- Data for Name: vusoft_utm; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_utm (id, bu_id, created_at, tenant_id, updated_at, name, configuration, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: vusoft_utm_owners; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_utm_owners (id, utm_id, group_id) FROM stdin;
\.


--
-- Data for Name: vusoft_vublock; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vublock (id, name, description, icon, source_id_field, vublock_type, status, tags, story_boards, alert_rules, get_started_format, get_started_content, fields, sources, agent_tab_name, agent_tab_meta_data, agent_configuration_required, wizard_meta_data, error_logs) FROM stdin;
\.


--
-- Data for Name: vusoft_vublockalertruleconfigs; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vublockalertruleconfigs (id, tenant_id, bu_id, vublock_id, vublock_version, base_alert_rule_def, active_alert_rule_id) FROM stdin;
\.


--
-- Data for Name: vusoft_vublockalertrules; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vublockalertrules (id, vublock_id, alert_id) FROM stdin;
\.


--
-- Data for Name: vusoft_vublockdashboardconfigs; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vublockdashboardconfigs (id, tenant_id, bu_id, vublock_id, vublock_version, base_dashboard_def, active_dashboard_uid, title) FROM stdin;
\.


--
-- Data for Name: vusoft_vublockdatamodelconfigs; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vublockdatamodelconfigs (id, tenant_id, bu_id, vublock_id, vublock_version, base_datamodel_def, active_datamodel_id, title) FROM stdin;
\.


--
-- Data for Name: vusoft_vublockdatasources; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vublockdatasources (id, vublock_id, name, type, description, data_collection_method_id) FROM stdin;
\.


--
-- Data for Name: vusoft_vublockdatastreamsconfigs; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vublockdatastreamsconfigs (id, vublock_id, enrichment_data, pipelines, sink_connectors) FROM stdin;
\.


--
-- Data for Name: vusoft_vublockdiagnostic; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vublockdiagnostic (id, tenant_id, bu_id, vublock_id, source_id, source_value, duration, start_time, end_time, status, created_by_id) FROM stdin;
\.


--
-- Data for Name: vusoft_vublockfields; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vublockfields (id, vublock_id, field_id, name, description, type, index, source, unit) FROM stdin;
\.


--
-- Data for Name: vusoft_vublockgoldensignals; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vublockgoldensignals (id, vublock_id, goldensignal_id, name, description, type, index, source, unit) FROM stdin;
\.


--
-- Data for Name: vusoft_vublockjinjatemplate; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vublockjinjatemplate (id, name, content, vublock_id) FROM stdin;
\.


--
-- Data for Name: vusoft_vublockservicediagnostic; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vublockservicediagnostic (id, tenant_id, bu_id, vublock_id, source_id, source_value, service_name, service_type, type, stage, status, last_modifed_at, diagnostic_id) FROM stdin;
\.


--
-- Data for Name: vusoft_vublocksource; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vublocksource (bu_id, created_at, tenant_id, updated_at, id, source_name, type, description, run_in_shipper, deployment_template, enabled, tags, fields, jinja_service_mapping, vublock_diagnostic_meta, collector, vublock_id, source_id_field, source_id_value, asset_count, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: vusoft_vublockstoryboards; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vublockstoryboards (id, vublock_id, storyboard_id) FROM stdin;
\.


--
-- Data for Name: vusoft_vublocktopicdiagnostic; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vublocktopicdiagnostic (id, tenant_id, bu_id, vublock_id, source_id, source_value, topic_name, data, type, status, last_modifed_at, diagnostic_id) FROM stdin;
\.


--
-- Data for Name: vusoft_vudatalakejob; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vudatalakejob (id, tenant_id, bu_id, job_id, job_status, description, namespace, "table", timestamp_column, from_time, to_time, sql_filter, advanced_settings, last_modified_time, last_modified_by) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftagentdetails; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftagentdetails (id, tenant_id, agent_ip, version_num, handshake_time) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftalertmetadata; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftalertmetadata (id, tenant_id, bu_id, name, grouping_values, last_modification_time, index_update_time, start_time, observation_time, throttle_time, alarm_state, alert_id, ticket_id, alert_doc, history, duration, channel_last_update_time, channel_info, no_bucket_count, correlation_state, is_notification_sent) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftasset; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftasset (tenant_id, bu_id, topology_id, node_id, last_modified_time, addition_method, system_ip, credential_name, type_of_discovery, vendor_name, device_name, device_type, interface_list, port_list, enriched_data, location, serial_number, contact_details, subnet, maintenance_mode, tags, last_scan_time, last_scan_id, ip_address, cred_type, "OS", application, branch, region, zone, creation_time, parent_router_ip, device_model, total_ips_in_subnet, used_ip_in_subnet, last_scan_name, dcm_credential, dcm_credential_type, dcm_enabled, dcm_error_message, dcm_groups, dcm_status, decomissioned_by, last_action, last_modified_by, monitoring_enabled, monitoring_error_message, monitoring_groups, monitoring_status, on_boarded_user, pending_action, status, vunet_device_model, decommissioned_time, uptime) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftassetgroup; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftassetgroup (group_id, tenant_id, bu_id, asset_group_name, description, modified_by, modified_at) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftassetgroup_assets; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftassetgroup_assets (id, vusoftassetgroup_id, vusoftasset_id) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftauto_remediation_script_track; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftauto_remediation_script_track (id, tenant_id, bu_id, script_id, alert_id, template_id, template_name, start_time, completion_time, status) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftbu; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftbu (id, tenant_id, name, bu_json_str) FROM stdin;
1	1	Test Vumap Ops First BU	{\n    "bu_description": "VuNet Systems First BU",\n    "bu_created_time": "2015-01-13 09:34:20.388023",\n    "name": "Test Vumap Ops First BU"\n}
\.


--
-- Data for Name: vusoft_vusoftbualertcfg; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftbualertcfg (id, bu_id, alertcfg_json_str) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftbucredential; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftbucredential (bu_id, credential_json_str) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftbucredentials; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftbucredentials (id, bu_id, cred_type, name, credential_json_str) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftbuscan; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftbuscan (bu_id, scan_json_str) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftcache; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftcache (key, value) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftchatconversation; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftchatconversation (bu_id, created_at, tenant_id, updated_at, conversation_id, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftchatentry; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftchatentry (bu_id, created_at, tenant_id, updated_at, chat_id, category, question, is_failure, response, "like", dislike, conversation_id, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftcollectioninfo; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftcollectioninfo (tenant_id, bu_id, config_command_id, vendor, model, config_collection_command_list, main_config_command) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftconfigletmetadata; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftconfigletmetadata (tenant_id, bu_id, configlet_id, configlet_hash, configlet_name, configlet_created, is_used, created_by) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftconfigurationdevices; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftconfigurationdevices (tenant_id, bu_id, id, device_name, device_address, collect_schedule_status, config_collection_settings, config_upload_settings, credentials, last_config_collection_status, last_config_collection_time, last_config_push_id, last_config_push_status, last_config_push_time, last_updated_time, asset_node_id, golden_template_type, last_configuration_change_check_status, last_configuration_change_check_time, last_policy_check_status, model, recommended_credential, vendor, latest_collected_snapshot_id) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftconfigurationdevices_config_policy; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftconfigurationdevices_config_policy (id, vusoftconfigurationdevices_id, vusoftpolicy_id) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftdatamanagement; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftdatamanagement (bu_id, created_at, tenant_id, updated_at, id, name, data_category, data_store_type, data_retention_period, tables, additional_prefix_tables, folders, created_by_id, updated_by_id) FROM stdin;
1	2024-02-21 11:11:12.291105+05:30	1	2024-02-21 11:11:12.291105+05:30	1	All	All	NoSQL Store	{"Hot": 2, "Cold": 1, "Warm": 2}	\N	vunet-1-1	\N	\N	\N
\.


--
-- Data for Name: vusoft_vusoftdataretention; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftdataretention (bu_id, created_at, tenant_id, updated_at, retention_id, index_prefix, non_searchable_data_in_days, archive_data_after_days, searchable_data_in_days, is_default, created_by_id, updated_by_id) FROM stdin;
1	2024-02-21 11:11:12.291105+05:30	1	2024-02-21 11:11:12.291105+05:30	1	vunet-1-1	2	1	2	t	\N	\N
\.


--
-- Data for Name: vusoft_vusoftdevicegroup; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftdevicegroup (group_id, tenant_id, bu_id, device_group_name, group_config_collection_settings, group_config_upload_settings, description, modified_by, modified_at, default_group_flag) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftdevicegroup_config_policy; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftdevicegroup_config_policy (id, vusoftdevicegroup_id, vusoftpolicy_id) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftdevicegroup_devices; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftdevicegroup_devices (id, vusoftdevicegroup_id, vusoftconfigurationdevices_id) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftdiscovery; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftdiscovery (tenant_id, bu_id, topology_id, start_time, end_time, no_of_nodes_discovered, discovery_status, config_id, name, no_of_nodes_protocol_responding, no_of_nodes_targeted) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftenrichmentdata; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftenrichmentdata (id, tenant_id, bu_id, table_name, config_id, json_config, key_id, topic, last_modified_at) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftenrichmentmetadata; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftenrichmentmetadata (id, tenant_id, bu_id, topic_name, keys, "values", options, table_name, description, created_at, created_by_id, updated_at, updated_by_id) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftetlpipeline; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftetlpipeline (id, tenant_id, bu_id, app_id, name, description, instances, app_config, log4j_properties, log4j_xml, stream_config, telegraf, pipeline_image_name, app_config_draft, app_config_request, app_config_request_draft, pipeline_graph, pipeline_graph_draft, pipeline_type, threads_per_instance, created_at, created_by_id, updated_at, updated_by_id) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftetlsettings; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftetlsettings (id, tenant_id, bu_id, default_instances) FROM stdin;
\.


--
-- Data for Name: vusoft_vusofteventadditionalinfo; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusofteventadditionalinfo (id, event_id, data_type, data_str) FROM stdin;
\.


--
-- Data for Name: vusoft_vusofteventcorrelations; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusofteventcorrelations (id, tenant_id, bu_id, event_id, corelation_id, corelation_rule, supressed_event, summary, group_label, related_events, region, severity, type, alarm_state, assignee, last_modified_time, last_modified_user, confidence_factor, status, emttr, active_duration, total_duration, created_time, created_by, occurrences, ip_address, category, impact, source, related_dashboards, ticket_id, ticket_creation_time, notes, dynamic_notification_data, is_3t_suppressed_event, is_ml_suppressed_event, work_status, similar_incidents) FROM stdin;
\.


--
-- Data for Name: vusoft_vusofteventdetails; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusofteventdetails (tenant_id, bu_id, event_id, summary, region, severity, assignee, last_modified_time, last_modified_user, confidence_factor, status, emttr, active_duration, total_duration, created_time, created_by, occurrences, ip_address, category, impact, source, related_dashboards, ticket_id, dislikes, likes, ticket_creation_time) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftfcmtoken; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftfcmtoken (id, fcm_token, device_id, last_modification_time, user_id) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftlinkinformation; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftlinkinformation (id, tenant_id, bu_id, link_type, info_collection_method, source_ip, source_node_id, source_end_point_id, source_end_point_name, destination_ip, destination_node_id, destination_end_point_id, destination_end_point_name, topology_id) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftmoduledata; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftmoduledata (id, tenant_id, bu_id, module, value, date) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftnamednetwork; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftnamednetwork (id, tenant_id, bu_id, discovery_time, network_name, asset_id, topology_id) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftnamednetworkgroup; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftnamednetworkgroup (id, tenant_id, bu_id, network_name) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftnamednetworkgroup_assets; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftnamednetworkgroup_assets (id, vusoftnamednetworkgroup_id, vusoftasset_id) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftnode; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftnode (id, topology_id, node_json_str, tp_id_csv) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftnodebuleveldata; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftnodebuleveldata (id, bu_id, object_id, node_data_type, data) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftnodeinterface; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftnodeinterface (id, tenant_id, bu_id, topology_id, node_id, interface_ip, interface_name, neighbour_information) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftnodelink; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftnodelink (id, topology_id, node_id, tp_id) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftnodes; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftnodes (tenant_id, bu_id, topology_id, node_id, system_ip, credential_name, cred_type, vendor_name, device_name, device_type, interface_list, port_list, extended_data, last_discovered_time, type_of_discovery, serial_number, subnet, ip_address, device_model, device_status, parent_router_ip, total_ips_in_subnet, used_ip_in_subnet, reachable_via_icmp, reachable_via_snmp, vunet_device_model) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftobjectidentification; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftobjectidentification (id, bu_id, object_type, ip_address, object_id) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftpolicy; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftpolicy (tenant_id, bu_id, policy_id, policy_name, description, configuration_line, comparison_operation, modified_by, violation) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftreports; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftreports (tenant_id, bu_id, report_id, report_name, report_description, time_window, report_path, supported_formats, status, report_template_id, dynamic_filters, user_permission, created_at, created_by_id, updated_at, updated_by_id, reports_tracker, duration, downloaded_count) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftreports_owners; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftreports_owners (id, vusoftreports_id, group_id) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftreportstemplate; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftreportstemplate (tenant_id, bu_id, report_template_id, report_template_name, report_template_description, schedule, destinations, formats, data_specification, columns, custom_contents, time_window, dashboards_link, created_at, dynamic_filters, user_permission, created_by_id, updated_at, updated_by_id, status, filter_details) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftreportstemplate_owners; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftreportstemplate_owners (id, vusoftreportstemplate_id, group_id) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftrolluprules; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftrolluprules (tenant_id, bu_id, group_name, rollup_data, start_time, duration, last_rollup_status, last_rollup_error_message) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftscanconfigdetails; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftscanconfigdetails (tenant_id, bu_id, config_id, start_ip, end_ip, excluded_ip, seed_ip, cred_list, schedule_name, schedule_string, user_details, source_ip, hop_count, meta_data, config_method, file_name, dcm_cred_list, dcm_enabled, monitoring_enabled, discover_l2_topology, network_name) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftsnapshot; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftsnapshot (id, tenant_id, bu_id, name, snapshot_json_str) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftsnapshotmetadata; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftsnapshotmetadata (tenant_id, bu_id, id, device_address, snapshot_hash, snapshot_name, snapshot_created, snapshot_collection_status, commmit_message, snapshot_collection_status_remark, snapshot_category, config_policy_status, golden_template_type) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftsnapshotnode; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftsnapshotnode (id, snapshot_id, node_id, node_json_str) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftsnapshotnodelink; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftsnapshotnodelink (id, snapshot_id, link_json_str) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftsnapshotvulnerability; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftsnapshotvulnerability (id, snapshot_id, node_id, vul_json_str) FROM stdin;
\.


--
-- Data for Name: vusoft_vusofttenant; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusofttenant (id, name, tenant_json_str, customer_id) FROM stdin;
1	Test Vumap Ops Tenant	{"enterprise_name": "VuNet Systems", "email": "info@vunetsystems.com", "phone_no": "1234567890", "tenant_created_time": "2015-01-13 09:34:20.388023", "tenant_description": "Tenant created the first time", "name": "Test Vumap Ops Tenant"}	\N
\.


--
-- Data for Name: vusoft_vusofttenantattributes; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusofttenantattributes (id, tenant_id, data_type, data_str, name) FROM stdin;
\.


--
-- Data for Name: vusoft_vusofttenantdata; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusofttenantdata (id, tenant_id, data_type, data_str) FROM stdin;
3	1	14	{\n    "vuInfra360": {\n        "Number of servers": null,\n        "Number of network components": null,\n        "Count of Availability Monitoring": null,\n        "Count of Configuration Collector": null,\n        "Count of Netflow": null\n    },\n    "vuLogX": {\n        "Size of Log data ingested per day": ""\n    },\n    "vuBJM": {\n        "Number of journeys configured": "",\n        "Count of applications": "",\n        "Count of infrastructure nodes": "",\n        "Count of transactions and TPS": ""\n    },\n    "vuRemoteInsights": {\n        "Number of synthetics": "",\n        "Frequency of runs per hour": "",\n        "Number of locations": ""\n    },\n    "Utility": {\n        "User": 37\n    }\n}
2	1	13	{\n    "time": "Wed Dec 31 23:59:59 2025",\n    "vuInfra360": {\n        "status": "enabled",\n        "Number of servers": 100,\n        "Number of network components": 100,\n        "Count of Availability Monitoring": 100,\n        "Count of Configuration Collector": 25,\n        "Count of Netflow": 20\n    },\n    "vuLogX": {\n        "status": "enabled",\n        "Size of Log data ingested per day": 100\n    },\n    "vuBJM": {\n        "status": "enabled",\n        "Number of journeys configured": "unlimited",\n        "Count of applications": "unlimited",\n        "Count of infrastructure nodes": "unlimited",\n        "Count of transactions and TPS": 5\n    },\n    "vuRemoteInsights": {\n        "status": "enabled",\n        "Number of synthetics": "unlimited",\n        "Frequency of runs per hour": "unlimited",\n        "Number of locations": "unlimited"\n    },\n    "Utility": {\n        "status": "enabled",\n        "User": 100\n    }\n}
4	1	5	{\n    "index": "fwz6fkJ14Om2GqvarR8PKEmO+Mva7Zj+UPmD6aUiquIL/KjLn9PLPaZJ8jU9zVRV0UNX+vemEBeMHSAQ1fF7JxHn2fNfO31pBszxWYmEpxKdCJB5Vd6csfmsl9oz7/0UYyfRKuirfGRh/mXyeTk41NPscLLJAFLm/Cyzwrs6hqPviUPik9gfBkQBDt8GR6IC/87rlP3645I2Js0aRTDKAV22RTufJo/mMYSLGa/7ee9w8snkBpMGq7oHq6JidqBSz6JI+DQIFT9f/DSI/JH5QCKKd7NooflujSHBBZQHQcRN3Yaby4KojlMjuqyQBWS9EiKcs/tBxtqplLw1I4LjdfnlCFr6xjwkcEoo7lY0Lyio7NmHCmGg/R5ml1GCVJRxDc5eC9fBQqeLXXy6HauEFqKNBQhMO+vZs0hrIIwIQXF07qTJM6gNLuOKZU78jnTWrb2aPHP8f+Nncspx5SrRY/Lb+71cwt37AOpY/joRkQkaiR840che7/17ua9+UyCh3JpvfzgRP/zpeWwsJQlMZ5ymK4cL5RXUPORCuTORYlRGiph/snXktxF9SaScrP5lYQemBbqtnKxs9YB/yNsFQTn3N9/GnTH6Es6/pBHtFOfQV1fQTLKTfNcMzp5iOMhqXHDyS/RMukE5URVZo55ENncFoVt7ox2g1hkuOVCTJZ+OLWMBVFDEubHVhCPkPHOeXQI729izy7j4Jk9dPyZatk0nEue2DczHNjhi8IYSQC2P2YrfFiEzjxwwQM5H5HGAQrMS4UDReOKQ0Ma8LWrtgn8zJQ6vhcMfFZYEeYrGbfm9jZpaq5wLKvYmpiKU37XZyODsMTSU1oB7yXo092ZLIF2CFCpU7f31aPykRRNjg4PqFE1uqjwR04cP0DmO6B44F3HC7R2xVCpDKVOhkZvY1YdYP5wXQIfe7UhrgdfN9RLNzBt/R6FAzg0Sqmy6uzoZbe/Z/9tP6E7NZFvdjYBsOWydnU+m4je6ZRCwz6bAgjxzDAXNOZmWR37Wr8C0H3CHdtU+dFefol3fC3SnU9yEHCOXq60/b9bso81Wn6MboPxqWzPl9iRM2gAEQhkWETCurYT68ggGwy40wIFQHvydx9voS1RIeUwqKCemB70/MUhBAzTuloT1IG6rAfgECesJ0n6j06iVqo34AHJck78YmCbddtYma1sOwZYW+meMc1Cs5Fp7W0h62soXZGCJ33CMXMNFrhNPrsQisgNFr2Fn5rI3Z/0KHz3FMpEs+s5E9scCWJl3+zWlNnlmcpU78R3N2X2ag2VIEbTPnJ+qVrJxjd3fKaP7gqBYm8jHjmPiaRfZdtqtm2PBKklUB3Vxch9v4uIAF67mEtk8PBNm9xjxgQ=="\n}
1	1	12	{\n  "index": "XyqRSp0K/LOSy2ox3DBiRGhMC9pQe16I9/aAoPewtzAL0A+FyZqZsAIvFFATrM5YU9fZHr7xWQqdSaKhxC1gIwaaatXX34JLBDfdLrnGJzFx14lms+JC/TRaUO3HLqkN9bX8lFkoCHh8Fb8VwiLliBfNsLJgczuC5M/akCFEyufbhsOf9jtJFpcxubtMhAzxfUuUIYygH/9hj++XzoOTKedkx79yiuVu1jUgml2xZ/9qD8vGfm6bKWUg2vugPESGwul6rFkLpbrn+w1z3fhDb/RtN48iwld7+smJ2vsVpN/h6ACKY4JRyjl3ycif+bl32hhwSg9Ku/YwN7WjzMyD7m1sP3+s7+DAxiLy8ND1qJXOgEjS3aW9TmqCtyVGP7FSrFsz/OV1iaNCznG9BO6Q1ZUYqJ6DFPeze8dkDTjLiAhkM/W+FjbxsRDuFfteyLpP8ZRGsLkw9SkiiZl2E8pdxuASM/Ue25khB5gjVYwu3UeKoE972DPMbudb0u1Me+7/Gca38XBpYa/UgbugM1LU0s84U9ufIODMfhsIGhdhqyA2I15nNuPYBic1XrS5rFQn9qoHm9tPHxQkIQtsL4JHYXESCWFfjLE/k5izGVkNF0jOnkR2D02tfG5pslk0sGatXog1kRet4EpaBbFoX9DBHOkmU5H3rnUV+ry07eunvNUclZ5/cD+Ju7/drf8gZyE6tZ+LJtnb9KaVOloL89TSzSEFWrfBQfebdjAvd9IzSllUc8/PlHRoGsEErNv8j5qGJCtPgtPI6FJY4JH1obA6VHwa3gb8z3Cf76frV3WVynKZt9QeO4qAfzJzun7LDq0eLrr/qYil1TsG+PK3EXMca6efM0DtqRcixMNjVugbtl+iiy0b2wSg/sGyjntXWQE135+625Jpe0X/JgeYOvTopUys0S7SnbNZ38Q48AvrybnueyEvDxGD8gqMOedJR3VMeY0uHM2sf9Qz77YZCsDamF5iY53NEvwkR1bmJYYYTlG9fvdTssV+otQHgzGA9IlTCjp2yOZvJzVQ4DCxbcOMANTfdrrSJvIxoOe4jiKOnXADtUFD2Yxp5Bn++sQA7CSkKg289aVT5C/I31YNmk7Bq0zrvvCWiZ4bKlegkVcdLS1z/ZmxKCuEayCfpCx0vzd6vY/nAWVunFpPuBq0UsK75N7X58eaouOw+wWshIH7efqG6KvLzgPTCxCDYxRy8iqIWsVVMMD0t/tWDbbvgy9w4OjzEX1NBOKgkoGEcSk+srOzC7AplwYQDXqLdbIP7WopPFR9PtT5SbtCz/sIb9UYLIcxT4fikMKc4zXiEd5SV+V9+tfdvQIUIgNW+eAlnTLCNFgvNszMlMvNTaqHaiNGuA==",\n "ptr": "Jg2oZF304alePuKY1lQgs8HeBR9wEsjENqMH+tBJg9UH2viD+qnGbnIAXSrbN9bRa+XEuyWfPglm0T7MbkiXLqBot0v8lOUVDwjYYZoAB/nwO7B3HGwlvOVyrGm15YwMrfB7/mx5htckRu0SACKzNkPr6U5LKNf9LE/+KUne3Dk="\n}
\.

--
-- Data for Name: vusoft_vusofttopology; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusofttopology (id, topology_json_str) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftusereventrelation; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftusereventrelation (id, tenant_id, bu_id, username, user_reaction, additional_comment, time_added, event_id) FROM stdin;
\.


--
-- Data for Name: vusoft_vusoftuserpreferences; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vusoftuserpreferences (id, "user", data_type, data_str) FROM stdin;
\.


--
-- Data for Name: vusoft_vustreamsconnectors; Type: TABLE DATA; Schema: public; Owner: core
--

COPY public.vusoft_vustreamsconnectors (id, tenant_id, bu_id, connector_name, connector_type, connector_dest, data_streams, description, payload, type, form, created_at, created_by_id, updated_at, updated_by_id) FROM stdin;
\.


--
-- Name: chunk_constraint_name; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: vusmart
--

SELECT pg_catalog.setval('_timescaledb_catalog.chunk_constraint_name', 1, false);


--
-- Name: chunk_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: vusmart
--

SELECT pg_catalog.setval('_timescaledb_catalog.chunk_id_seq', 1, false);


--
-- Name: continuous_agg_migrate_plan_step_step_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: vusmart
--

SELECT pg_catalog.setval('_timescaledb_catalog.continuous_agg_migrate_plan_step_step_id_seq', 1, false);


--
-- Name: dimension_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: vusmart
--

SELECT pg_catalog.setval('_timescaledb_catalog.dimension_id_seq', 1, false);


--
-- Name: dimension_slice_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: vusmart
--

SELECT pg_catalog.setval('_timescaledb_catalog.dimension_slice_id_seq', 1, false);


--
-- Name: hypertable_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_catalog; Owner: vusmart
--

SELECT pg_catalog.setval('_timescaledb_catalog.hypertable_id_seq', 1, false);


--
-- Name: bgw_job_id_seq; Type: SEQUENCE SET; Schema: _timescaledb_config; Owner: vusmart
--

SELECT pg_catalog.setval('_timescaledb_config.bgw_job_id_seq', 1000, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 508, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 5, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: captcha_captchastore_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.captcha_captchastore_id_seq', 1, false);


--
-- Name: defender_accessattempt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.defender_accessattempt_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 126, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 207, true);


--
-- Name: event_correlation_eventcorrelationconfig_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.event_correlation_eventcorrelationconfig_id_seq', 1, false);


--
-- Name: event_correlation_trialrun_correlated_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.event_correlation_trialrun_correlated_events_id_seq', 1, false);


--
-- Name: event_correlation_trialrun_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.event_correlation_trialrun_id_seq', 1, false);


--
-- Name: event_correlation_vusoftcorrelatedevents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.event_correlation_vusoftcorrelatedevents_id_seq', 1, false);


--
-- Name: events_feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.events_feedback_id_seq', 1, false);


--
-- Name: events_rca_comments_feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.events_rca_comments_feedback_id_seq', 1, false);


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.groups_id_seq', 7, true);


--
-- Name: guardian_groupobjectpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.guardian_groupobjectpermission_id_seq', 1, false);


--
-- Name: guardian_userobjectpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.guardian_userobjectpermission_id_seq', 1, false);


--
-- Name: dbz_heartbeat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.dbz_heartbeat_id_seq', 1, false);


--
-- Name: metrics_metric_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.metrics_metric_id_seq', 1, false);


--
-- Name: metrics_metricitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.metrics_metricitem_id_seq', 1, false);


--
-- Name: notification_config_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.notification_config_id_seq', 1, false);


--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.oauth2_provider_accesstoken_id_seq', 68, true);


--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.oauth2_provider_application_id_seq', 1, false);


--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.oauth2_provider_grant_id_seq', 1, false);


--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.oauth2_provider_refreshtoken_id_seq', 1, false);


--
-- Name: vu_auth_provider_usergroupmembership_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vu_auth_provider_usergroupmembership_id_seq', 1, false);


--
-- Name: vu_auth_provider_userprofile_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vu_auth_provider_userprofile_groups_id_seq', 22454, true);


--
-- Name: vu_auth_provider_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vu_auth_provider_userprofile_id_seq', 18, true);


--
-- Name: vusoft_alertrule_alert_rule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_alertrule_alert_rule_id_seq', 1, false);


--
-- Name: vusoft_alertrule_owners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_alertrule_owners_id_seq', 1, false);


--
-- Name: vusoft_datastreams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_datastreams_id_seq', 1, false);


--
-- Name: vusoft_datastreamservicemapping_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_datastreamservicemapping_id_seq', 1, false);


--
-- Name: vusoft_hrmsdata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_hrmsdata_id_seq', 1, false);


--
-- Name: vusoft_insightcards_insight_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_insightcards_insight_id_seq', 1, false);


--
-- Name: vusoft_insightcards_owners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_insightcards_owners_id_seq', 1, false);


--
-- Name: vusoft_mobiledashboard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_mobiledashboard_id_seq', 1, false);


--
-- Name: vusoft_sparkjobhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_sparkjobhistory_id_seq', 1, false);


--
-- Name: vusoft_utm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_utm_id_seq', 1, false);


--
-- Name: vusoft_utm_owners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_utm_owners_id_seq', 1, false);


--
-- Name: vusoft_vublockalertruleconfigs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vublockalertruleconfigs_id_seq', 1, false);


--
-- Name: vusoft_vublockalertrules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vublockalertrules_id_seq', 1, false);


--
-- Name: vusoft_vublockdashboardconfigs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vublockdashboardconfigs_id_seq', 1, false);


--
-- Name: vusoft_vublockdatamodelconfigs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vublockdatamodelconfigs_id_seq', 1, false);


--
-- Name: vusoft_vublockdatasources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vublockdatasources_id_seq', 1, false);


--
-- Name: vusoft_vublockdatastreamsconfigs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vublockdatastreamsconfigs_id_seq', 1, false);


--
-- Name: vusoft_vublockdiagnostic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vublockdiagnostic_id_seq', 1, false);


--
-- Name: vusoft_vublockfields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vublockfields_id_seq', 1, false);


--
-- Name: vusoft_vublockgoldensignals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vublockgoldensignals_id_seq', 1, false);


--
-- Name: vusoft_vublockjinjatemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vublockjinjatemplate_id_seq', 1, false);


--
-- Name: vusoft_vublockservicediagnostic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vublockservicediagnostic_id_seq', 1, false);


--
-- Name: vusoft_vublockstoryboards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vublockstoryboards_id_seq', 1, false);


--
-- Name: vusoft_vublocktopicdiagnostic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vublocktopicdiagnostic_id_seq', 1, false);


--
-- Name: vusoft_vudatalakejob_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vudatalakejob_id_seq', 1, false);


--
-- Name: vusoft_vusoftagentdetails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftagentdetails_id_seq', 1, false);


--
-- Name: vusoft_vusoftalertmetadata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftalertmetadata_id_seq', 1, false);


--
-- Name: vusoft_vusoftasset_node_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftasset_node_id_seq', 1, false);


--
-- Name: vusoft_vusoftassetgroup_assets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftassetgroup_assets_id_seq', 1, false);


--
-- Name: vusoft_vusoftassetgroup_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftassetgroup_group_id_seq', 1, false);


--
-- Name: vusoft_vusoftauto_remediation_script_track_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftauto_remediation_script_track_id_seq', 1, false);


--
-- Name: vusoft_vusoftbu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftbu_id_seq', 1, true);


--
-- Name: vusoft_vusoftbualertcfg_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftbualertcfg_id_seq', 1, false);


--
-- Name: vusoft_vusoftbucredentials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftbucredentials_id_seq', 1, false);


--
-- Name: vusoft_vusoftchatconversation_conversation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftchatconversation_conversation_id_seq', 1, false);


--
-- Name: vusoft_vusoftchatentry_chat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftchatentry_chat_id_seq', 1, false);


--
-- Name: vusoft_vusoftcollectioninfo_config_command_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftcollectioninfo_config_command_id_seq', 1, false);


--
-- Name: vusoft_vusoftconfigletmetadata_configlet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftconfigletmetadata_configlet_id_seq', 1, false);


--
-- Name: vusoft_vusoftconfigurationdevices_config_policy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftconfigurationdevices_config_policy_id_seq', 1, false);


--
-- Name: vusoft_vusoftconfigurationdevices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftconfigurationdevices_id_seq', 1, false);


--
-- Name: vusoft_vusoftdatamanagement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftdatamanagement_id_seq', 1, true);


--
-- Name: vusoft_vusoftdataretention_retention_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftdataretention_retention_id_seq', 1, true);


--
-- Name: vusoft_vusoftdevicegroup_config_policy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftdevicegroup_config_policy_id_seq', 1, false);


--
-- Name: vusoft_vusoftdevicegroup_devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftdevicegroup_devices_id_seq', 1, false);


--
-- Name: vusoft_vusoftdevicegroup_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftdevicegroup_group_id_seq', 1, false);


--
-- Name: vusoft_vusoftdiscovery_topology_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftdiscovery_topology_id_seq', 1, false);


--
-- Name: vusoft_vusoftenrichmentdata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftenrichmentdata_id_seq', 1, false);


--
-- Name: vusoft_vusoftenrichmentmetadata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftenrichmentmetadata_id_seq', 1, false);


--
-- Name: vusoft_vusoftetlpipeline_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftetlpipeline_id_seq', 1, false);


--
-- Name: vusoft_vusoftetlsettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftetlsettings_id_seq', 1, false);


--
-- Name: vusoft_vusofteventadditionalinfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusofteventadditionalinfo_id_seq', 1, false);


--
-- Name: vusoft_vusofteventcorrelations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusofteventcorrelations_id_seq', 1, false);


--
-- Name: vusoft_vusoftfcmtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftfcmtoken_id_seq', 1, false);


--
-- Name: vusoft_vusoftlinkinformation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftlinkinformation_id_seq', 1, false);


--
-- Name: vusoft_vusoftmoduledata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftmoduledata_id_seq', 1, false);


--
-- Name: vusoft_vusoftnamednetwork_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftnamednetwork_id_seq', 1, false);


--
-- Name: vusoft_vusoftnamednetworkgroup_assets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftnamednetworkgroup_assets_id_seq', 1, false);


--
-- Name: vusoft_vusoftnamednetworkgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftnamednetworkgroup_id_seq', 1, false);


--
-- Name: vusoft_vusoftnode_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftnode_id_seq', 1, false);


--
-- Name: vusoft_vusoftnodebuleveldata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftnodebuleveldata_id_seq', 1, false);


--
-- Name: vusoft_vusoftnodeinterface_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftnodeinterface_id_seq', 1, false);


--
-- Name: vusoft_vusoftnodelink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftnodelink_id_seq', 1, false);


--
-- Name: vusoft_vusoftnodes_node_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftnodes_node_id_seq', 1, false);


--
-- Name: vusoft_vusoftobjectidentification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftobjectidentification_id_seq', 1, false);


--
-- Name: vusoft_vusoftpolicy_policy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftpolicy_policy_id_seq', 1, false);


--
-- Name: vusoft_vusoftreports_owners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftreports_owners_id_seq', 1, false);


--
-- Name: vusoft_vusoftreports_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftreports_report_id_seq', 1, false);


--
-- Name: vusoft_vusoftreportstemplate_owners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftreportstemplate_owners_id_seq', 1, false);


--
-- Name: vusoft_vusoftreportstemplate_report_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftreportstemplate_report_template_id_seq', 1, false);


--
-- Name: vusoft_vusoftscanconfigdetails_config_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftscanconfigdetails_config_id_seq', 1, false);


--
-- Name: vusoft_vusoftsnapshot_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftsnapshot_id_seq', 1, false);


--
-- Name: vusoft_vusoftsnapshotmetadata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftsnapshotmetadata_id_seq', 1, false);


--
-- Name: vusoft_vusoftsnapshotnode_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftsnapshotnode_id_seq', 1, false);


--
-- Name: vusoft_vusoftsnapshotnodelink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftsnapshotnodelink_id_seq', 1, false);


--
-- Name: vusoft_vusoftsnapshotvulnerability_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftsnapshotvulnerability_id_seq', 1, false);


--
-- Name: vusoft_vusofttenant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusofttenant_id_seq', 1, true);


--
-- Name: vusoft_vusofttenantattributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusofttenantattributes_id_seq', 1, false);


--
-- Name: vusoft_vusofttenantdata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusofttenantdata_id_seq', 4, true);


--
-- Name: vusoft_vusofttopology_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusofttopology_id_seq', 1, false);


--
-- Name: vusoft_vusoftusereventrelation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftusereventrelation_id_seq', 1, false);


--
-- Name: vusoft_vusoftuserpreferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vusoftuserpreferences_id_seq', 1, false);


--
-- Name: vusoft_vustreamsconnectors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: core
--

SELECT pg_catalog.setval('public.vusoft_vustreamsconnectors_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: captcha_captchastore captcha_captchastore_hashkey_key; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.captcha_captchastore
    ADD CONSTRAINT captcha_captchastore_hashkey_key UNIQUE (hashkey);


--
-- Name: captcha_captchastore captcha_captchastore_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.captcha_captchastore
    ADD CONSTRAINT captcha_captchastore_pkey PRIMARY KEY (id);


--
-- Name: defender_accessattempt defender_accessattempt_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.defender_accessattempt
    ADD CONSTRAINT defender_accessattempt_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: event_correlation_eventcorrelationconfig event_correlation_eventcorrelationconfig_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.event_correlation_eventcorrelationconfig
    ADD CONSTRAINT event_correlation_eventcorrelationconfig_pkey PRIMARY KEY (id);


--
-- Name: event_correlation_eventcorrelationconfig event_correlation_eventcorrelationconfig_workspace_id_key; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.event_correlation_eventcorrelationconfig
    ADD CONSTRAINT event_correlation_eventcorrelationconfig_workspace_id_key UNIQUE (workspace_id);


--
-- Name: event_correlation_trialrun_correlated_events event_correlation_trialr_trialrun_id_vusoftcorrel_41ed31f2_uniq; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.event_correlation_trialrun_correlated_events
    ADD CONSTRAINT event_correlation_trialr_trialrun_id_vusoftcorrel_41ed31f2_uniq UNIQUE (trialrun_id, vusoftcorrelatedevents_id);


--
-- Name: event_correlation_trialrun_correlated_events event_correlation_trialrun_correlated_events_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.event_correlation_trialrun_correlated_events
    ADD CONSTRAINT event_correlation_trialrun_correlated_events_pkey PRIMARY KEY (id);


--
-- Name: event_correlation_trialrun event_correlation_trialrun_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.event_correlation_trialrun
    ADD CONSTRAINT event_correlation_trialrun_pkey PRIMARY KEY (id);


--
-- Name: event_correlation_vusoftcorrelatedevents event_correlation_vusoftcorrelatedevents_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.event_correlation_vusoftcorrelatedevents
    ADD CONSTRAINT event_correlation_vusoftcorrelatedevents_pkey PRIMARY KEY (id);


--
-- Name: events_feedback events_feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.events_feedback
    ADD CONSTRAINT events_feedback_pkey PRIMARY KEY (id);


--
-- Name: events_rca_comments_feedback events_rca_comments_feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.events_rca_comments_feedback
    ADD CONSTRAINT events_rca_comments_feedback_pkey PRIMARY KEY (id);


--
-- Name: groups groups_name_46b2c599_uniq; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_name_46b2c599_uniq UNIQUE (name);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: guardian_groupobjectpermission guardian_groupobjectperm_group_id_permission_id_o_3f189f7c_uniq; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobjectperm_group_id_permission_id_o_3f189f7c_uniq UNIQUE (group_id, permission_id, object_pk);


--
-- Name: guardian_groupobjectpermission guardian_groupobjectpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobjectpermission_pkey PRIMARY KEY (id);


--
-- Name: guardian_userobjectpermission guardian_userobjectpermi_user_id_permission_id_ob_b0b3d2fc_uniq; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermi_user_id_permission_id_ob_b0b3d2fc_uniq UNIQUE (user_id, permission_id, object_pk);


--
-- Name: guardian_userobjectpermission guardian_userobjectpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermission_pkey PRIMARY KEY (id);


--
-- Name: dbz_heartbeat dbz_heartbeat_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.dbz_heartbeat
    ADD CONSTRAINT dbz_heartbeat_pkey PRIMARY KEY (id);


--
-- Name: metrics_metric metrics_metric_name_key; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.metrics_metric
    ADD CONSTRAINT metrics_metric_name_key UNIQUE (name);


--
-- Name: metrics_metric metrics_metric_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.metrics_metric
    ADD CONSTRAINT metrics_metric_pkey PRIMARY KEY (id);


--
-- Name: metrics_metric metrics_metric_slug_key; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.metrics_metric
    ADD CONSTRAINT metrics_metric_slug_key UNIQUE (slug);


--
-- Name: metrics_metricitem metrics_metricitem_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.metrics_metricitem
    ADD CONSTRAINT metrics_metricitem_pkey PRIMARY KEY (id);


--
-- Name: notification_config notification_config_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.notification_config
    ADD CONSTRAINT notification_config_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_source_refresh_token_id_key; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_source_refresh_token_id_key UNIQUE (source_refresh_token_id);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_token_key; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_token_key UNIQUE (token);


--
-- Name: oauth2_provider_application oauth2_provider_application_client_id_key; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_client_id_key UNIQUE (client_id);


--
-- Name: oauth2_provider_application oauth2_provider_application_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_grant oauth2_provider_grant_code_key; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_code_key UNIQUE (code);


--
-- Name: oauth2_provider_grant oauth2_provider_grant_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_access_token_id_key; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_access_token_id_key UNIQUE (access_token_id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq UNIQUE (token, revoked);


--
-- Name: event_correlation_vusoftcorrelatedevents unique_correlated_instance_workspace_runtype; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.event_correlation_vusoftcorrelatedevents
    ADD CONSTRAINT unique_correlated_instance_workspace_runtype UNIQUE (event_id, workspace_id, run_type, instance_name);


--
-- Name: vusoft_vusoftdatamanagement unique_data_management_name_data_store_type; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftdatamanagement
    ADD CONSTRAINT unique_data_management_name_data_store_type UNIQUE (name, data_store_type);


--
-- Name: events_rca_comments_feedback unique_event_id_rca_id; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.events_rca_comments_feedback
    ADD CONSTRAINT unique_event_id_rca_id UNIQUE (event_id, rca_id, user_name, feedback_type);


--
-- Name: vusoft_mobiledashboard unique_mobile_dashboard_name_for_tenant; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_mobiledashboard
    ADD CONSTRAINT unique_mobile_dashboard_name_for_tenant UNIQUE (name, tenant_id, bu_id);


--
-- Name: notification_config unique_notification_config_route_name_route_category; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.notification_config
    ADD CONSTRAINT unique_notification_config_route_name_route_category UNIQUE (route_name, route_category);


--
-- Name: vu_auth_provider_customsession vu_auth_provider_customsession_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vu_auth_provider_customsession
    ADD CONSTRAINT vu_auth_provider_customsession_pkey PRIMARY KEY (session_key);


--
-- Name: vu_auth_provider_dataaccesspolicy vu_auth_provider_dataaccesspolicy_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vu_auth_provider_dataaccesspolicy
    ADD CONSTRAINT vu_auth_provider_dataaccesspolicy_pkey PRIMARY KEY (id);


--
-- Name: vu_auth_provider_usergroupmembership vu_auth_provider_usergroupmembership_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vu_auth_provider_usergroupmembership
    ADD CONSTRAINT vu_auth_provider_usergroupmembership_pkey PRIMARY KEY (id);


--
-- Name: vu_auth_provider_userprofile_groups vu_auth_provider_userpro_userprofile_id_groups_id_a5403395_uniq; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vu_auth_provider_userprofile_groups
    ADD CONSTRAINT vu_auth_provider_userpro_userprofile_id_groups_id_a5403395_uniq UNIQUE (userprofile_id, groups_id);


--
-- Name: vu_auth_provider_userprofile_groups vu_auth_provider_userprofile_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vu_auth_provider_userprofile_groups
    ADD CONSTRAINT vu_auth_provider_userprofile_groups_pkey PRIMARY KEY (id);


--
-- Name: vu_auth_provider_userprofile vu_auth_provider_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vu_auth_provider_userprofile
    ADD CONSTRAINT vu_auth_provider_userprofile_pkey PRIMARY KEY (id);


--
-- Name: vu_auth_provider_userprofile vu_auth_provider_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vu_auth_provider_userprofile
    ADD CONSTRAINT vu_auth_provider_userprofile_user_id_key UNIQUE (user_id);


--
-- Name: vusoft_alertrule_owners vusoft_alertrule_owners_alertrule_id_group_id_ee8a95b0_uniq; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_alertrule_owners
    ADD CONSTRAINT vusoft_alertrule_owners_alertrule_id_group_id_ee8a95b0_uniq UNIQUE (alertrule_id, group_id);


--
-- Name: vusoft_alertrule_owners vusoft_alertrule_owners_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_alertrule_owners
    ADD CONSTRAINT vusoft_alertrule_owners_pkey PRIMARY KEY (id);


--
-- Name: vusoft_alertrule vusoft_alertrule_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_alertrule
    ADD CONSTRAINT vusoft_alertrule_pkey PRIMARY KEY (alert_rule_id);


--
-- Name: vusoft_alertrule vusoft_alertrule_title_6b8ef8db_uniq; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_alertrule
    ADD CONSTRAINT vusoft_alertrule_title_6b8ef8db_uniq UNIQUE (title);


--
-- Name: vusoft_alertrules vusoft_alertrules_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_alertrules
    ADD CONSTRAINT vusoft_alertrules_pkey PRIMARY KEY (alert_id);


--
-- Name: vusoft_assetaudittrail vusoft_assetaudittrail_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_assetaudittrail
    ADD CONSTRAINT vusoft_assetaudittrail_pkey PRIMARY KEY (id);


--
-- Name: vusoft_datacollectionmethod vusoft_datacollectionmethod_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_datacollectionmethod
    ADD CONSTRAINT vusoft_datacollectionmethod_pkey PRIMARY KEY (dcm_id);


--
-- Name: vusoft_datastreams vusoft_datastreams_name_999be6a2_uniq; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_datastreams
    ADD CONSTRAINT vusoft_datastreams_name_999be6a2_uniq UNIQUE (name);


--
-- Name: vusoft_datastreams vusoft_datastreams_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_datastreams
    ADD CONSTRAINT vusoft_datastreams_pkey PRIMARY KEY (id);


--
-- Name: vusoft_datastreamservicemapping vusoft_datastreamservicemapping_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_datastreamservicemapping
    ADD CONSTRAINT vusoft_datastreamservicemapping_pkey PRIMARY KEY (id);


--
-- Name: vusoft_hrmsdata vusoft_hrmsdata_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_hrmsdata
    ADD CONSTRAINT vusoft_hrmsdata_pkey PRIMARY KEY (id);


--
-- Name: vusoft_hrmsmapping vusoft_hrmsmapping_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_hrmsmapping
    ADD CONSTRAINT vusoft_hrmsmapping_pkey PRIMARY KEY (name);


--
-- Name: vusoft_insightcards vusoft_insightcards_name_key; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_insightcards
    ADD CONSTRAINT vusoft_insightcards_name_key UNIQUE (name);


--
-- Name: vusoft_insightcards_owners vusoft_insightcards_owne_insightcards_id_group_id_3046cb75_uniq; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_insightcards_owners
    ADD CONSTRAINT vusoft_insightcards_owne_insightcards_id_group_id_3046cb75_uniq UNIQUE (insightcards_id, group_id);


--
-- Name: vusoft_insightcards_owners vusoft_insightcards_owners_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_insightcards_owners
    ADD CONSTRAINT vusoft_insightcards_owners_pkey PRIMARY KEY (id);


--
-- Name: vusoft_insightcards vusoft_insightcards_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_insightcards
    ADD CONSTRAINT vusoft_insightcards_pkey PRIMARY KEY (insight_id);


--
-- Name: vusoft_logicalvublockmapping vusoft_logicalvublockmapping_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_logicalvublockmapping
    ADD CONSTRAINT vusoft_logicalvublockmapping_pkey PRIMARY KEY (target_id);


--
-- Name: vusoft_mobiledashboard vusoft_mobiledashboard_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_mobiledashboard
    ADD CONSTRAINT vusoft_mobiledashboard_pkey PRIMARY KEY (id);


--
-- Name: vusoft_sparkjobhistory vusoft_sparkjobhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_sparkjobhistory
    ADD CONSTRAINT vusoft_sparkjobhistory_pkey PRIMARY KEY (id);


--
-- Name: vusoft_storyboards vusoft_storyboards_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_storyboards
    ADD CONSTRAINT vusoft_storyboards_pkey PRIMARY KEY (storyboard_id);


--
-- Name: vusoft_utm_owners vusoft_utm_owners_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_utm_owners
    ADD CONSTRAINT vusoft_utm_owners_pkey PRIMARY KEY (id);


--
-- Name: vusoft_utm_owners vusoft_utm_owners_utm_id_group_id_88bfd3e3_uniq; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_utm_owners
    ADD CONSTRAINT vusoft_utm_owners_utm_id_group_id_88bfd3e3_uniq UNIQUE (utm_id, group_id);


--
-- Name: vusoft_utm vusoft_utm_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_utm
    ADD CONSTRAINT vusoft_utm_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vublock vusoft_vublock_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vublock
    ADD CONSTRAINT vusoft_vublock_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vublockalertruleconfigs vusoft_vublockalertruleconfigs_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vublockalertruleconfigs
    ADD CONSTRAINT vusoft_vublockalertruleconfigs_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vublockalertrules vusoft_vublockalertrules_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vublockalertrules
    ADD CONSTRAINT vusoft_vublockalertrules_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vublockdashboardconfigs vusoft_vublockdashboardconfigs_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vublockdashboardconfigs
    ADD CONSTRAINT vusoft_vublockdashboardconfigs_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vublockdatamodelconfigs vusoft_vublockdatamodelconfigs_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vublockdatamodelconfigs
    ADD CONSTRAINT vusoft_vublockdatamodelconfigs_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vublockdatasources vusoft_vublockdatasources_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vublockdatasources
    ADD CONSTRAINT vusoft_vublockdatasources_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vublockdatastreamsconfigs vusoft_vublockdatastreamsconfigs_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vublockdatastreamsconfigs
    ADD CONSTRAINT vusoft_vublockdatastreamsconfigs_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vublockdatastreamsconfigs vusoft_vublockdatastreamsconfigs_vublock_id_key; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vublockdatastreamsconfigs
    ADD CONSTRAINT vusoft_vublockdatastreamsconfigs_vublock_id_key UNIQUE (vublock_id);


--
-- Name: vusoft_vublockdiagnostic vusoft_vublockdiagnostic_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vublockdiagnostic
    ADD CONSTRAINT vusoft_vublockdiagnostic_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vublockfields vusoft_vublockfields_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vublockfields
    ADD CONSTRAINT vusoft_vublockfields_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vublockgoldensignals vusoft_vublockgoldensignals_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vublockgoldensignals
    ADD CONSTRAINT vusoft_vublockgoldensignals_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vublockjinjatemplate vusoft_vublockjinjatemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vublockjinjatemplate
    ADD CONSTRAINT vusoft_vublockjinjatemplate_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vublockservicediagnostic vusoft_vublockservicediagnostic_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vublockservicediagnostic
    ADD CONSTRAINT vusoft_vublockservicediagnostic_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vublocksource vusoft_vublocksource_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vublocksource
    ADD CONSTRAINT vusoft_vublocksource_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vublockstoryboards vusoft_vublockstoryboards_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vublockstoryboards
    ADD CONSTRAINT vusoft_vublockstoryboards_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vublocktopicdiagnostic vusoft_vublocktopicdiagnostic_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vublocktopicdiagnostic
    ADD CONSTRAINT vusoft_vublocktopicdiagnostic_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vudatalakejob vusoft_vudatalakejob_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vudatalakejob
    ADD CONSTRAINT vusoft_vudatalakejob_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vusoftagentdetails vusoft_vusoftagentdetails_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftagentdetails
    ADD CONSTRAINT vusoft_vusoftagentdetails_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vusoftalertmetadata vusoft_vusoftalertmetadata_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftalertmetadata
    ADD CONSTRAINT vusoft_vusoftalertmetadata_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vusoftasset vusoft_vusoftasset_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftasset
    ADD CONSTRAINT vusoft_vusoftasset_pkey PRIMARY KEY (node_id);


--
-- Name: vusoft_vusoftassetgroup_assets vusoft_vusoftassetgroup__vusoftassetgroup_id_vuso_9aa4f6ef_uniq; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftassetgroup_assets
    ADD CONSTRAINT vusoft_vusoftassetgroup__vusoftassetgroup_id_vuso_9aa4f6ef_uniq UNIQUE (vusoftassetgroup_id, vusoftasset_id);


--
-- Name: vusoft_vusoftassetgroup_assets vusoft_vusoftassetgroup_assets_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftassetgroup_assets
    ADD CONSTRAINT vusoft_vusoftassetgroup_assets_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vusoftassetgroup vusoft_vusoftassetgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftassetgroup
    ADD CONSTRAINT vusoft_vusoftassetgroup_pkey PRIMARY KEY (group_id);


--
-- Name: vusoft_vusoftauto_remediation_script_track vusoft_vusoftauto_remediation_script_track_alert_id_key; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftauto_remediation_script_track
    ADD CONSTRAINT vusoft_vusoftauto_remediation_script_track_alert_id_key UNIQUE (alert_id);


--
-- Name: vusoft_vusoftauto_remediation_script_track vusoft_vusoftauto_remediation_script_track_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftauto_remediation_script_track
    ADD CONSTRAINT vusoft_vusoftauto_remediation_script_track_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vusoftauto_remediation_script_track vusoft_vusoftauto_remediation_script_track_script_id_key; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftauto_remediation_script_track
    ADD CONSTRAINT vusoft_vusoftauto_remediation_script_track_script_id_key UNIQUE (script_id);


--
-- Name: vusoft_vusoftbu vusoft_vusoftbu_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftbu
    ADD CONSTRAINT vusoft_vusoftbu_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vusoftbualertcfg vusoft_vusoftbualertcfg_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftbualertcfg
    ADD CONSTRAINT vusoft_vusoftbualertcfg_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vusoftbucredential vusoft_vusoftbucredential_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftbucredential
    ADD CONSTRAINT vusoft_vusoftbucredential_pkey PRIMARY KEY (bu_id);


--
-- Name: vusoft_vusoftbucredentials vusoft_vusoftbucredentials_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftbucredentials
    ADD CONSTRAINT vusoft_vusoftbucredentials_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vusoftbuscan vusoft_vusoftbuscan_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftbuscan
    ADD CONSTRAINT vusoft_vusoftbuscan_pkey PRIMARY KEY (bu_id);


--
-- Name: vusoft_vusoftcache vusoft_vusoftcache_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftcache
    ADD CONSTRAINT vusoft_vusoftcache_pkey PRIMARY KEY (key);


--
-- Name: vusoft_vusoftchatconversation vusoft_vusoftchatconversation_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftchatconversation
    ADD CONSTRAINT vusoft_vusoftchatconversation_pkey PRIMARY KEY (conversation_id);


--
-- Name: vusoft_vusoftchatentry vusoft_vusoftchatentry_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftchatentry
    ADD CONSTRAINT vusoft_vusoftchatentry_pkey PRIMARY KEY (chat_id);


--
-- Name: vusoft_vusoftcollectioninfo vusoft_vusoftcollectioninfo_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftcollectioninfo
    ADD CONSTRAINT vusoft_vusoftcollectioninfo_pkey PRIMARY KEY (config_command_id);


--
-- Name: vusoft_vusoftconfigletmetadata vusoft_vusoftconfigletmetadata_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftconfigletmetadata
    ADD CONSTRAINT vusoft_vusoftconfigletmetadata_pkey PRIMARY KEY (configlet_id);


--
-- Name: vusoft_vusoftconfigurationdevices_config_policy vusoft_vusoftconfigurati_vusoftconfigurationdevic_663f5c9f_uniq; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftconfigurationdevices_config_policy
    ADD CONSTRAINT vusoft_vusoftconfigurati_vusoftconfigurationdevic_663f5c9f_uniq UNIQUE (vusoftconfigurationdevices_id, vusoftpolicy_id);


--
-- Name: vusoft_vusoftconfigurationdevices_config_policy vusoft_vusoftconfigurationdevices_config_policy_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftconfigurationdevices_config_policy
    ADD CONSTRAINT vusoft_vusoftconfigurationdevices_config_policy_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vusoftconfigurationdevices vusoft_vusoftconfigurationdevices_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftconfigurationdevices
    ADD CONSTRAINT vusoft_vusoftconfigurationdevices_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vusoftdatamanagement vusoft_vusoftdatamanagement_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftdatamanagement
    ADD CONSTRAINT vusoft_vusoftdatamanagement_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vusoftdataretention vusoft_vusoftdataretention_index_prefix_key; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftdataretention
    ADD CONSTRAINT vusoft_vusoftdataretention_index_prefix_key UNIQUE (index_prefix);


--
-- Name: vusoft_vusoftdataretention vusoft_vusoftdataretention_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftdataretention
    ADD CONSTRAINT vusoft_vusoftdataretention_pkey PRIMARY KEY (retention_id);


--
-- Name: vusoft_vusoftdevicegroup_config_policy vusoft_vusoftdevicegroup_config_policy_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftdevicegroup_config_policy
    ADD CONSTRAINT vusoft_vusoftdevicegroup_config_policy_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vusoftdevicegroup_devices vusoft_vusoftdevicegroup_devices_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftdevicegroup_devices
    ADD CONSTRAINT vusoft_vusoftdevicegroup_devices_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vusoftdevicegroup vusoft_vusoftdevicegroup_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftdevicegroup
    ADD CONSTRAINT vusoft_vusoftdevicegroup_pkey PRIMARY KEY (group_id);


--
-- Name: vusoft_vusoftdevicegroup_config_policy vusoft_vusoftdevicegroup_vusoftdevicegroup_id_vus_387327d7_uniq; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftdevicegroup_config_policy
    ADD CONSTRAINT vusoft_vusoftdevicegroup_vusoftdevicegroup_id_vus_387327d7_uniq UNIQUE (vusoftdevicegroup_id, vusoftpolicy_id);


--
-- Name: vusoft_vusoftdevicegroup_devices vusoft_vusoftdevicegroup_vusoftdevicegroup_id_vus_f9f3efdd_uniq; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftdevicegroup_devices
    ADD CONSTRAINT vusoft_vusoftdevicegroup_vusoftdevicegroup_id_vus_f9f3efdd_uniq UNIQUE (vusoftdevicegroup_id, vusoftconfigurationdevices_id);


--
-- Name: vusoft_vusoftdiscovery vusoft_vusoftdiscovery_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftdiscovery
    ADD CONSTRAINT vusoft_vusoftdiscovery_pkey PRIMARY KEY (topology_id);


--
-- Name: vusoft_vusoftenrichmentdata vusoft_vusoftenrichmentdata_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftenrichmentdata
    ADD CONSTRAINT vusoft_vusoftenrichmentdata_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vusoftenrichmentdata vusoft_vusoftenrichmentdata_topic_config_id_87da2400_uniq; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftenrichmentdata
    ADD CONSTRAINT vusoft_vusoftenrichmentdata_topic_config_id_87da2400_uniq UNIQUE (topic, config_id);


--
-- Name: vusoft_vusoftenrichmentmetadata vusoft_vusoftenrichmentmetadata_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftenrichmentmetadata
    ADD CONSTRAINT vusoft_vusoftenrichmentmetadata_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vusoftenrichmentmetadata vusoft_vusoftenrichmentmetadata_topic_key; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftenrichmentmetadata
    ADD CONSTRAINT vusoft_vusoftenrichmentmetadata_topic_key UNIQUE (table_name);


--
-- Name: vusoft_vusoftenrichmentmetadata vusoft_vusoftenrichmentmetadata_topic_name_key; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftenrichmentmetadata
    ADD CONSTRAINT vusoft_vusoftenrichmentmetadata_topic_name_key UNIQUE (topic_name);


--
-- Name: vusoft_vusoftetlpipeline vusoft_vusoftetlpipeline_app_id_75d8622e_uniq; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftetlpipeline
    ADD CONSTRAINT vusoft_vusoftetlpipeline_app_id_75d8622e_uniq UNIQUE (app_id);


--
-- Name: vusoft_vusoftetlpipeline vusoft_vusoftetlpipeline_name_464531ad_uniq; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftetlpipeline
    ADD CONSTRAINT vusoft_vusoftetlpipeline_name_464531ad_uniq UNIQUE (name);


--
-- Name: vusoft_vusoftetlpipeline vusoft_vusoftetlpipeline_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftetlpipeline
    ADD CONSTRAINT vusoft_vusoftetlpipeline_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vusoftetlsettings vusoft_vusoftetlsettings_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftetlsettings
    ADD CONSTRAINT vusoft_vusoftetlsettings_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vusofteventadditionalinfo vusoft_vusofteventadditionalinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusofteventadditionalinfo
    ADD CONSTRAINT vusoft_vusofteventadditionalinfo_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vusofteventcorrelations vusoft_vusofteventcorrelations_pkey1; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusofteventcorrelations
    ADD CONSTRAINT vusoft_vusofteventcorrelations_pkey1 PRIMARY KEY (id);


--
-- Name: vusoft_vusofteventdetails vusoft_vusofteventdetails_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusofteventdetails
    ADD CONSTRAINT vusoft_vusofteventdetails_pkey PRIMARY KEY (event_id);


--
-- Name: vusoft_vusoftfcmtoken vusoft_vusoftfcmtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftfcmtoken
    ADD CONSTRAINT vusoft_vusoftfcmtoken_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vusoftlinkinformation vusoft_vusoftlinkinformation_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftlinkinformation
    ADD CONSTRAINT vusoft_vusoftlinkinformation_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vusoftmoduledata vusoft_vusoftmoduledata_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftmoduledata
    ADD CONSTRAINT vusoft_vusoftmoduledata_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vusoftnamednetworkgroup_assets vusoft_vusoftnamednetwor_vusoftnamednetworkgroup__9ac9ed15_uniq; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftnamednetworkgroup_assets
    ADD CONSTRAINT vusoft_vusoftnamednetwor_vusoftnamednetworkgroup__9ac9ed15_uniq UNIQUE (vusoftnamednetworkgroup_id, vusoftasset_id);


--
-- Name: vusoft_vusoftnamednetwork vusoft_vusoftnamednetwork_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftnamednetwork
    ADD CONSTRAINT vusoft_vusoftnamednetwork_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vusoftnamednetworkgroup_assets vusoft_vusoftnamednetworkgroup_assets_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftnamednetworkgroup_assets
    ADD CONSTRAINT vusoft_vusoftnamednetworkgroup_assets_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vusoftnamednetworkgroup vusoft_vusoftnamednetworkgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftnamednetworkgroup
    ADD CONSTRAINT vusoft_vusoftnamednetworkgroup_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vusoftnode vusoft_vusoftnode_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftnode
    ADD CONSTRAINT vusoft_vusoftnode_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vusoftnodebuleveldata vusoft_vusoftnodebuleveldata_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftnodebuleveldata
    ADD CONSTRAINT vusoft_vusoftnodebuleveldata_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vusoftnodeinterface vusoft_vusoftnodeinterface_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftnodeinterface
    ADD CONSTRAINT vusoft_vusoftnodeinterface_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vusoftnodelink vusoft_vusoftnodelink_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftnodelink
    ADD CONSTRAINT vusoft_vusoftnodelink_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vusoftnodes vusoft_vusoftnodes_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftnodes
    ADD CONSTRAINT vusoft_vusoftnodes_pkey PRIMARY KEY (node_id);


--
-- Name: vusoft_vusoftobjectidentification vusoft_vusoftobjectidentification_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftobjectidentification
    ADD CONSTRAINT vusoft_vusoftobjectidentification_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vusoftpolicy vusoft_vusoftpolicy_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftpolicy
    ADD CONSTRAINT vusoft_vusoftpolicy_pkey PRIMARY KEY (policy_id);


--
-- Name: vusoft_vusoftreports_owners vusoft_vusoftreports_own_vusoftreports_id_group_i_c8902cb8_uniq; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftreports_owners
    ADD CONSTRAINT vusoft_vusoftreports_own_vusoftreports_id_group_i_c8902cb8_uniq UNIQUE (vusoftreports_id, group_id);


--
-- Name: vusoft_vusoftreports_owners vusoft_vusoftreports_owners_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftreports_owners
    ADD CONSTRAINT vusoft_vusoftreports_owners_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vusoftreports vusoft_vusoftreports_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftreports
    ADD CONSTRAINT vusoft_vusoftreports_pkey PRIMARY KEY (report_id);


--
-- Name: vusoft_vusoftreportstemplate_owners vusoft_vusoftreportstemp_vusoftreportstemplate_id_5d958ccb_uniq; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftreportstemplate_owners
    ADD CONSTRAINT vusoft_vusoftreportstemp_vusoftreportstemplate_id_5d958ccb_uniq UNIQUE (vusoftreportstemplate_id, group_id);


--
-- Name: vusoft_vusoftreportstemplate_owners vusoft_vusoftreportstemplate_owners_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftreportstemplate_owners
    ADD CONSTRAINT vusoft_vusoftreportstemplate_owners_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vusoftreportstemplate vusoft_vusoftreportstemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftreportstemplate
    ADD CONSTRAINT vusoft_vusoftreportstemplate_pkey PRIMARY KEY (report_template_id);


--
-- Name: vusoft_vusoftreportstemplate vusoft_vusoftreportstemplate_report_template_name_655d4f11_uniq; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftreportstemplate
    ADD CONSTRAINT vusoft_vusoftreportstemplate_report_template_name_655d4f11_uniq UNIQUE (report_template_name);


--
-- Name: vusoft_vusoftrolluprules vusoft_vusoftrolluprules_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftrolluprules
    ADD CONSTRAINT vusoft_vusoftrolluprules_pkey PRIMARY KEY (group_name);


--
-- Name: vusoft_vusoftscanconfigdetails vusoft_vusoftscanconfigdetails_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftscanconfigdetails
    ADD CONSTRAINT vusoft_vusoftscanconfigdetails_pkey PRIMARY KEY (config_id);


--
-- Name: vusoft_vusoftsnapshot vusoft_vusoftsnapshot_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftsnapshot
    ADD CONSTRAINT vusoft_vusoftsnapshot_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vusoftsnapshotmetadata vusoft_vusoftsnapshotmetadata_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftsnapshotmetadata
    ADD CONSTRAINT vusoft_vusoftsnapshotmetadata_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vusoftsnapshotnode vusoft_vusoftsnapshotnode_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftsnapshotnode
    ADD CONSTRAINT vusoft_vusoftsnapshotnode_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vusoftsnapshotnodelink vusoft_vusoftsnapshotnodelink_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftsnapshotnodelink
    ADD CONSTRAINT vusoft_vusoftsnapshotnodelink_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vusoftsnapshotvulnerability vusoft_vusoftsnapshotvulnerability_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftsnapshotvulnerability
    ADD CONSTRAINT vusoft_vusoftsnapshotvulnerability_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vusofttenant vusoft_vusofttenant_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusofttenant
    ADD CONSTRAINT vusoft_vusofttenant_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vusofttenantattributes vusoft_vusofttenantattributes_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusofttenantattributes
    ADD CONSTRAINT vusoft_vusofttenantattributes_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vusofttenantdata vusoft_vusofttenantdata_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusofttenantdata
    ADD CONSTRAINT vusoft_vusofttenantdata_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vusofttopology vusoft_vusofttopology_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusofttopology
    ADD CONSTRAINT vusoft_vusofttopology_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vusoftusereventrelation vusoft_vusoftusereventrelation_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftusereventrelation
    ADD CONSTRAINT vusoft_vusoftusereventrelation_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vusoftuserpreferences vusoft_vusoftuserpreferences_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftuserpreferences
    ADD CONSTRAINT vusoft_vusoftuserpreferences_pkey PRIMARY KEY (id);


--
-- Name: vusoft_vustreamsconnectors vusoft_vustreamsconnectors_connector_name_key; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vustreamsconnectors
    ADD CONSTRAINT vusoft_vustreamsconnectors_connector_name_key UNIQUE (connector_name);


--
-- Name: vusoft_vustreamsconnectors vusoft_vustreamsconnectors_pkey; Type: CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vustreamsconnectors
    ADD CONSTRAINT vusoft_vustreamsconnectors_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: captcha_captchastore_hashkey_cbe8d15a_like; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX captcha_captchastore_hashkey_cbe8d15a_like ON public.captcha_captchastore USING btree (hashkey varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: event_correlation_trialrun_trialrun_id_ebdbce49; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX event_correlation_trialrun_trialrun_id_ebdbce49 ON public.event_correlation_trialrun_correlated_events USING btree (trialrun_id);


--
-- Name: event_correlation_trialrun_vusoftcorrelatedevents_id_533f16c9; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX event_correlation_trialrun_vusoftcorrelatedevents_id_533f16c9 ON public.event_correlation_trialrun_correlated_events USING btree (vusoftcorrelatedevents_id);


--
-- Name: groups_name_46b2c599_like; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX groups_name_46b2c599_like ON public.groups USING btree (name varchar_pattern_ops);


--
-- Name: guardian_gr_content_ae6aec_idx; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX guardian_gr_content_ae6aec_idx ON public.guardian_groupobjectpermission USING btree (content_type_id, object_pk);


--
-- Name: guardian_groupobjectpermission_content_type_id_7ade36b8; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX guardian_groupobjectpermission_content_type_id_7ade36b8 ON public.guardian_groupobjectpermission USING btree (content_type_id);


--
-- Name: guardian_groupobjectpermission_group_id_4bbbfb62; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX guardian_groupobjectpermission_group_id_4bbbfb62 ON public.guardian_groupobjectpermission USING btree (group_id);


--
-- Name: guardian_groupobjectpermission_permission_id_36572738; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX guardian_groupobjectpermission_permission_id_36572738 ON public.guardian_groupobjectpermission USING btree (permission_id);


--
-- Name: guardian_us_content_179ed2_idx; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX guardian_us_content_179ed2_idx ON public.guardian_userobjectpermission USING btree (content_type_id, object_pk);


--
-- Name: guardian_userobjectpermission_content_type_id_2e892405; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX guardian_userobjectpermission_content_type_id_2e892405 ON public.guardian_userobjectpermission USING btree (content_type_id);


--
-- Name: guardian_userobjectpermission_permission_id_71807bfc; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX guardian_userobjectpermission_permission_id_71807bfc ON public.guardian_userobjectpermission USING btree (permission_id);


--
-- Name: guardian_userobjectpermission_user_id_d5c1e964; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX guardian_userobjectpermission_user_id_d5c1e964 ON public.guardian_userobjectpermission USING btree (user_id);


--
-- Name: metrics_metric_name_9ab0aad5_like; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX metrics_metric_name_9ab0aad5_like ON public.metrics_metric USING btree (name varchar_pattern_ops);


--
-- Name: metrics_metric_slug_9bc5f88f_like; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX metrics_metric_slug_9bc5f88f_like ON public.metrics_metric USING btree (slug varchar_pattern_ops);


--
-- Name: metrics_metricitem_metric_id_6717db24; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX metrics_metricitem_metric_id_6717db24 ON public.metrics_metricitem USING btree (metric_id);


--
-- Name: oauth2_provider_accesstoken_application_id_b22886e1; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX oauth2_provider_accesstoken_application_id_b22886e1 ON public.oauth2_provider_accesstoken USING btree (application_id);


--
-- Name: oauth2_provider_accesstoken_token_8af090f8_like; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX oauth2_provider_accesstoken_token_8af090f8_like ON public.oauth2_provider_accesstoken USING btree (token varchar_pattern_ops);


--
-- Name: oauth2_provider_accesstoken_user_id_6e4c9a65; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX oauth2_provider_accesstoken_user_id_6e4c9a65 ON public.oauth2_provider_accesstoken USING btree (user_id);


--
-- Name: oauth2_provider_application_client_id_03f0cc84_like; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX oauth2_provider_application_client_id_03f0cc84_like ON public.oauth2_provider_application USING btree (client_id varchar_pattern_ops);


--
-- Name: oauth2_provider_application_client_secret_53133678; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX oauth2_provider_application_client_secret_53133678 ON public.oauth2_provider_application USING btree (client_secret);


--
-- Name: oauth2_provider_application_client_secret_53133678_like; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX oauth2_provider_application_client_secret_53133678_like ON public.oauth2_provider_application USING btree (client_secret varchar_pattern_ops);


--
-- Name: oauth2_provider_application_user_id_79829054; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX oauth2_provider_application_user_id_79829054 ON public.oauth2_provider_application USING btree (user_id);


--
-- Name: oauth2_provider_grant_application_id_81923564; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX oauth2_provider_grant_application_id_81923564 ON public.oauth2_provider_grant USING btree (application_id);


--
-- Name: oauth2_provider_grant_code_49ab4ddf_like; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX oauth2_provider_grant_code_49ab4ddf_like ON public.oauth2_provider_grant USING btree (code varchar_pattern_ops);


--
-- Name: oauth2_provider_grant_user_id_e8f62af8; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX oauth2_provider_grant_user_id_e8f62af8 ON public.oauth2_provider_grant USING btree (user_id);


--
-- Name: oauth2_provider_refreshtoken_application_id_2d1c311b; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX oauth2_provider_refreshtoken_application_id_2d1c311b ON public.oauth2_provider_refreshtoken USING btree (application_id);


--
-- Name: oauth2_provider_refreshtoken_user_id_da837fce; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX oauth2_provider_refreshtoken_user_id_da837fce ON public.oauth2_provider_refreshtoken USING btree (user_id);


--
-- Name: vu_auth_provider_customsession_access_token_593adac9; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vu_auth_provider_customsession_access_token_593adac9 ON public.vu_auth_provider_customsession USING btree (access_token);


--
-- Name: vu_auth_provider_customsession_access_token_593adac9_like; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vu_auth_provider_customsession_access_token_593adac9_like ON public.vu_auth_provider_customsession USING btree (access_token text_pattern_ops);


--
-- Name: vu_auth_provider_customsession_expire_date_4f44d3c3; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vu_auth_provider_customsession_expire_date_4f44d3c3 ON public.vu_auth_provider_customsession USING btree (expire_date);


--
-- Name: vu_auth_provider_customsession_session_key_daa8f430_like; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vu_auth_provider_customsession_session_key_daa8f430_like ON public.vu_auth_provider_customsession USING btree (session_key varchar_pattern_ops);


--
-- Name: vu_auth_provider_dataaccesspolicy_created_by_id_693f65d5; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vu_auth_provider_dataaccesspolicy_created_by_id_693f65d5 ON public.vu_auth_provider_dataaccesspolicy USING btree (created_by_id);


--
-- Name: vu_auth_provider_dataaccesspolicy_updated_by_id_61088d8a; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vu_auth_provider_dataaccesspolicy_updated_by_id_61088d8a ON public.vu_auth_provider_dataaccesspolicy USING btree (updated_by_id);


--
-- Name: vu_auth_provider_usergroupmembership_group_id_3fa59797; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vu_auth_provider_usergroupmembership_group_id_3fa59797 ON public.vu_auth_provider_usergroupmembership USING btree (group_id);


--
-- Name: vu_auth_provider_usergroupmembership_user_id_5f766c73; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vu_auth_provider_usergroupmembership_user_id_5f766c73 ON public.vu_auth_provider_usergroupmembership USING btree (user_id);


--
-- Name: vu_auth_provider_userprofile_groups_groups_id_8d1d961b; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vu_auth_provider_userprofile_groups_groups_id_8d1d961b ON public.vu_auth_provider_userprofile_groups USING btree (groups_id);


--
-- Name: vu_auth_provider_userprofile_groups_userprofile_id_6185dadd; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vu_auth_provider_userprofile_groups_userprofile_id_6185dadd ON public.vu_auth_provider_userprofile_groups USING btree (userprofile_id);


--
-- Name: vusoft_alertrule_created_by_user_id_f8833814; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_alertrule_created_by_user_id_f8833814 ON public.vusoft_alertrule USING btree (created_by_id);


--
-- Name: vusoft_alertrule_owners_alertrule_id_cc15fdd1; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_alertrule_owners_alertrule_id_cc15fdd1 ON public.vusoft_alertrule_owners USING btree (alertrule_id);


--
-- Name: vusoft_alertrule_owners_group_id_f55c0660; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_alertrule_owners_group_id_f55c0660 ON public.vusoft_alertrule_owners USING btree (group_id);


--
-- Name: vusoft_alertrule_title_6b8ef8db_like; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_alertrule_title_6b8ef8db_like ON public.vusoft_alertrule USING btree (title varchar_pattern_ops);


--
-- Name: vusoft_alertrule_updated_by_id_d5998dcd; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_alertrule_updated_by_id_d5998dcd ON public.vusoft_alertrule USING btree (updated_by_id);


--
-- Name: vusoft_alertrules_alert_id_12f77ba1_like; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_alertrules_alert_id_12f77ba1_like ON public.vusoft_alertrules USING btree (alert_id varchar_pattern_ops);


--
-- Name: vusoft_assetaudittrail_asset_id_e573382f; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_assetaudittrail_asset_id_e573382f ON public.vusoft_assetaudittrail USING btree (asset_id);


--
-- Name: vusoft_datacollectionmethod_dcm_id_83ce0acb_like; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_datacollectionmethod_dcm_id_83ce0acb_like ON public.vusoft_datacollectionmethod USING btree (dcm_id varchar_pattern_ops);


--
-- Name: vusoft_datastreams_created_by_id_470e3151; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_datastreams_created_by_id_470e3151 ON public.vusoft_datastreams USING btree (created_by_id);


--
-- Name: vusoft_datastreams_name_999be6a2_like; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_datastreams_name_999be6a2_like ON public.vusoft_datastreams USING btree (name varchar_pattern_ops);


--
-- Name: vusoft_datastreams_updated_by_id_927f1b8e; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_datastreams_updated_by_id_927f1b8e ON public.vusoft_datastreams USING btree (updated_by_id);


--
-- Name: vusoft_hrmsmapping_name_0cec4ee1_like; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_hrmsmapping_name_0cec4ee1_like ON public.vusoft_hrmsmapping USING btree (name varchar_pattern_ops);


--
-- Name: vusoft_insightcards_created_by_user_id_8bb7032c; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_insightcards_created_by_user_id_8bb7032c ON public.vusoft_insightcards USING btree (created_by_id);


--
-- Name: vusoft_insightcards_name_1ee1d647_like; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_insightcards_name_1ee1d647_like ON public.vusoft_insightcards USING btree (name varchar_pattern_ops);


--
-- Name: vusoft_insightcards_owners_group_id_ee335a80; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_insightcards_owners_group_id_ee335a80 ON public.vusoft_insightcards_owners USING btree (group_id);


--
-- Name: vusoft_insightcards_owners_insightcards_id_233498dc; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_insightcards_owners_insightcards_id_233498dc ON public.vusoft_insightcards_owners USING btree (insightcards_id);


--
-- Name: vusoft_insightcards_updated_by_id_5ffdfadf; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_insightcards_updated_by_id_5ffdfadf ON public.vusoft_insightcards USING btree (updated_by_id);


--
-- Name: vusoft_logicalvublockmapping_target_id_0b0cf127_like; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_logicalvublockmapping_target_id_0b0cf127_like ON public.vusoft_logicalvublockmapping USING btree (target_id varchar_pattern_ops);


--
-- Name: vusoft_mobiledashboard_created_by_user_id_f229cb9f; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_mobiledashboard_created_by_user_id_f229cb9f ON public.vusoft_mobiledashboard USING btree (created_by_id);


--
-- Name: vusoft_mobiledashboard_updated_by_id_12eb0b25; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_mobiledashboard_updated_by_id_12eb0b25 ON public.vusoft_mobiledashboard USING btree (updated_by_id);


--
-- Name: vusoft_storyboards_storyboard_id_ba90220c_like; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_storyboards_storyboard_id_ba90220c_like ON public.vusoft_storyboards USING btree (storyboard_id varchar_pattern_ops);


--
-- Name: vusoft_utm_created_by_user_id_5cbe676e; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_utm_created_by_user_id_5cbe676e ON public.vusoft_utm USING btree (created_by_id);


--
-- Name: vusoft_utm_owners_group_id_7d3367c9; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_utm_owners_group_id_7d3367c9 ON public.vusoft_utm_owners USING btree (group_id);


--
-- Name: vusoft_utm_owners_utm_id_f7fa9a26; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_utm_owners_utm_id_f7fa9a26 ON public.vusoft_utm_owners USING btree (utm_id);


--
-- Name: vusoft_utm_updated_by_id_5ab01455; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_utm_updated_by_id_5ab01455 ON public.vusoft_utm USING btree (updated_by_id);


--
-- Name: vusoft_vublock_id_9913e4ea_like; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vublock_id_9913e4ea_like ON public.vusoft_vublock USING btree (id varchar_pattern_ops);


--
-- Name: vusoft_vublockalertruleconfigs_active_alert_rule_id_3cc4c842; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vublockalertruleconfigs_active_alert_rule_id_3cc4c842 ON public.vusoft_vublockalertruleconfigs USING btree (active_alert_rule_id);


--
-- Name: vusoft_vublockalertrules_alert_id_79c3254b; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vublockalertrules_alert_id_79c3254b ON public.vusoft_vublockalertrules USING btree (alert_id);


--
-- Name: vusoft_vublockalertrules_alert_id_79c3254b_like; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vublockalertrules_alert_id_79c3254b_like ON public.vusoft_vublockalertrules USING btree (alert_id varchar_pattern_ops);


--
-- Name: vusoft_vublockdatasource_data_collection_method_i_c725b476_like; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vublockdatasource_data_collection_method_i_c725b476_like ON public.vusoft_vublockdatasources USING btree (data_collection_method_id varchar_pattern_ops);


--
-- Name: vusoft_vublockdatasources_data_collection_method_id_c725b476; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vublockdatasources_data_collection_method_id_c725b476 ON public.vusoft_vublockdatasources USING btree (data_collection_method_id);


--
-- Name: vusoft_vublockdatastreamsconfigs_vublock_id_be0c4859_like; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vublockdatastreamsconfigs_vublock_id_be0c4859_like ON public.vusoft_vublockdatastreamsconfigs USING btree (vublock_id varchar_pattern_ops);


--
-- Name: vusoft_vublockdiagnostic_created_by_id_5d0a2fd7; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vublockdiagnostic_created_by_id_5d0a2fd7 ON public.vusoft_vublockdiagnostic USING btree (created_by_id);


--
-- Name: vusoft_vublockjinjatemplate_vublock_id_99cf85ac; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vublockjinjatemplate_vublock_id_99cf85ac ON public.vusoft_vublockjinjatemplate USING btree (vublock_id);


--
-- Name: vusoft_vublockjinjatemplate_vublock_id_99cf85ac_like; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vublockjinjatemplate_vublock_id_99cf85ac_like ON public.vusoft_vublockjinjatemplate USING btree (vublock_id varchar_pattern_ops);


--
-- Name: vusoft_vublockservicediagnostic_diagnostic_id_0801ceb2; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vublockservicediagnostic_diagnostic_id_0801ceb2 ON public.vusoft_vublockservicediagnostic USING btree (diagnostic_id);


--
-- Name: vusoft_vublocksource_created_by_id_e9d8646c; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vublocksource_created_by_id_e9d8646c ON public.vusoft_vublocksource USING btree (created_by_id);


--
-- Name: vusoft_vublocksource_id_0142ef06_like; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vublocksource_id_0142ef06_like ON public.vusoft_vublocksource USING btree (id varchar_pattern_ops);


--
-- Name: vusoft_vublocksource_updated_by_id_a3964231; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vublocksource_updated_by_id_a3964231 ON public.vusoft_vublocksource USING btree (updated_by_id);


--
-- Name: vusoft_vublockstoryboards_storyboard_id_2c1457af; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vublockstoryboards_storyboard_id_2c1457af ON public.vusoft_vublockstoryboards USING btree (storyboard_id);


--
-- Name: vusoft_vublockstoryboards_storyboard_id_2c1457af_like; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vublockstoryboards_storyboard_id_2c1457af_like ON public.vusoft_vublockstoryboards USING btree (storyboard_id varchar_pattern_ops);


--
-- Name: vusoft_vublocktopicdiagnostic_diagnostic_id_523b8838; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vublocktopicdiagnostic_diagnostic_id_523b8838 ON public.vusoft_vublocktopicdiagnostic USING btree (diagnostic_id);


--
-- Name: vusoft_vusoftassetgroup_assets_vusoftasset_id_4ebe7eee; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftassetgroup_assets_vusoftasset_id_4ebe7eee ON public.vusoft_vusoftassetgroup_assets USING btree (vusoftasset_id);


--
-- Name: vusoft_vusoftassetgroup_assets_vusoftassetgroup_id_dc875bb0; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftassetgroup_assets_vusoftassetgroup_id_dc875bb0 ON public.vusoft_vusoftassetgroup_assets USING btree (vusoftassetgroup_id);


--
-- Name: vusoft_vusoftauto_remedi_alert_id_e26b66f6_like; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftauto_remedi_alert_id_e26b66f6_like ON public.vusoft_vusoftauto_remediation_script_track USING btree (alert_id varchar_pattern_ops);


--
-- Name: vusoft_vusoftauto_remedi_script_id_036e4bd1_like; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftauto_remedi_script_id_036e4bd1_like ON public.vusoft_vusoftauto_remediation_script_track USING btree (script_id varchar_pattern_ops);


--
-- Name: vusoft_vusoftcache_key_213aed54_like; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftcache_key_213aed54_like ON public.vusoft_vusoftcache USING btree (key varchar_pattern_ops);


--
-- Name: vusoft_vusoftchatconversation_created_by_id_d38fedba; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftchatconversation_created_by_id_d38fedba ON public.vusoft_vusoftchatconversation USING btree (created_by_id);


--
-- Name: vusoft_vusoftchatconversation_updated_by_id_173a435d; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftchatconversation_updated_by_id_173a435d ON public.vusoft_vusoftchatconversation USING btree (updated_by_id);


--
-- Name: vusoft_vusoftchatentry_conversation_id_57d42fc9; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftchatentry_conversation_id_57d42fc9 ON public.vusoft_vusoftchatentry USING btree (conversation_id);


--
-- Name: vusoft_vusoftchatentry_created_by_id_d801c865; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftchatentry_created_by_id_d801c865 ON public.vusoft_vusoftchatentry USING btree (created_by_id);


--
-- Name: vusoft_vusoftchatentry_updated_by_id_1dcfe82c; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftchatentry_updated_by_id_1dcfe82c ON public.vusoft_vusoftchatentry USING btree (updated_by_id);


--
-- Name: vusoft_vusoftconfiguration_vusoftconfigurationdevices_426ff7d5; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftconfiguration_vusoftconfigurationdevices_426ff7d5 ON public.vusoft_vusoftconfigurationdevices_config_policy USING btree (vusoftconfigurationdevices_id);


--
-- Name: vusoft_vusoftconfiguration_vusoftpolicy_id_a38b567b; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftconfiguration_vusoftpolicy_id_a38b567b ON public.vusoft_vusoftconfigurationdevices_config_policy USING btree (vusoftpolicy_id);


--
-- Name: vusoft_vusoftdatamanagement_created_by_id_ee71ffc0; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftdatamanagement_created_by_id_ee71ffc0 ON public.vusoft_vusoftdatamanagement USING btree (created_by_id);


--
-- Name: vusoft_vusoftdatamanagement_updated_by_id_1567584c; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftdatamanagement_updated_by_id_1567584c ON public.vusoft_vusoftdatamanagement USING btree (updated_by_id);


--
-- Name: vusoft_vusoftdataretention_created_by_id_c0cbc8b5; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftdataretention_created_by_id_c0cbc8b5 ON public.vusoft_vusoftdataretention USING btree (created_by_id);


--
-- Name: vusoft_vusoftdataretention_index_prefix_e4eff708_like; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftdataretention_index_prefix_e4eff708_like ON public.vusoft_vusoftdataretention USING btree (index_prefix varchar_pattern_ops);


--
-- Name: vusoft_vusoftdataretention_updated_by_id_dd8c3928; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftdataretention_updated_by_id_dd8c3928 ON public.vusoft_vusoftdataretention USING btree (updated_by_id);


--
-- Name: vusoft_vusoftdevicegroup_c_vusoftdevicegroup_id_095d772b; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftdevicegroup_c_vusoftdevicegroup_id_095d772b ON public.vusoft_vusoftdevicegroup_config_policy USING btree (vusoftdevicegroup_id);


--
-- Name: vusoft_vusoftdevicegroup_config_policy_vusoftpolicy_id_748604a7; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftdevicegroup_config_policy_vusoftpolicy_id_748604a7 ON public.vusoft_vusoftdevicegroup_config_policy USING btree (vusoftpolicy_id);


--
-- Name: vusoft_vusoftdevicegroup_d_vusoftconfigurationdevices_30946220; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftdevicegroup_d_vusoftconfigurationdevices_30946220 ON public.vusoft_vusoftdevicegroup_devices USING btree (vusoftconfigurationdevices_id);


--
-- Name: vusoft_vusoftdevicegroup_devices_vusoftdevicegroup_id_2e97e5f7; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftdevicegroup_devices_vusoftdevicegroup_id_2e97e5f7 ON public.vusoft_vusoftdevicegroup_devices USING btree (vusoftdevicegroup_id);


--
-- Name: vusoft_vusoftenrichmentdata_key_id_55075c52; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftenrichmentdata_key_id_55075c52 ON public.vusoft_vusoftenrichmentdata USING btree (key_id);


--
-- Name: vusoft_vusoftenrichmentmetadata_created_by_user_id_1f7e0cba; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftenrichmentmetadata_created_by_user_id_1f7e0cba ON public.vusoft_vusoftenrichmentmetadata USING btree (created_by_id);


--
-- Name: vusoft_vusoftenrichmentmetadata_topic_55a9f510_like; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftenrichmentmetadata_topic_55a9f510_like ON public.vusoft_vusoftenrichmentmetadata USING btree (table_name varchar_pattern_ops);


--
-- Name: vusoft_vusoftenrichmentmetadata_topic_name_85ea0933_like; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftenrichmentmetadata_topic_name_85ea0933_like ON public.vusoft_vusoftenrichmentmetadata USING btree (topic_name varchar_pattern_ops);


--
-- Name: vusoft_vusoftenrichmentmetadata_updated_by_id_7a076eaa; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftenrichmentmetadata_updated_by_id_7a076eaa ON public.vusoft_vusoftenrichmentmetadata USING btree (updated_by_id);


--
-- Name: vusoft_vusoftetlpipeline_app_id_75d8622e_like; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftetlpipeline_app_id_75d8622e_like ON public.vusoft_vusoftetlpipeline USING btree (app_id varchar_pattern_ops);


--
-- Name: vusoft_vusoftetlpipeline_created_by_id_c71d9c38; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftetlpipeline_created_by_id_c71d9c38 ON public.vusoft_vusoftetlpipeline USING btree (created_by_id);


--
-- Name: vusoft_vusoftetlpipeline_name_464531ad_like; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftetlpipeline_name_464531ad_like ON public.vusoft_vusoftetlpipeline USING btree (name varchar_pattern_ops);


--
-- Name: vusoft_vusoftetlpipeline_updated_by_id_f95f28ee; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftetlpipeline_updated_by_id_f95f28ee ON public.vusoft_vusoftetlpipeline USING btree (updated_by_id);


--
-- Name: vusoft_vusofteventdetails_event_id_441a7178_like; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusofteventdetails_event_id_441a7178_like ON public.vusoft_vusofteventdetails USING btree (event_id varchar_pattern_ops);


--
-- Name: vusoft_vusoftfcmtoken_user_id_37ba2bcd; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftfcmtoken_user_id_37ba2bcd ON public.vusoft_vusoftfcmtoken USING btree (user_id);


--
-- Name: vusoft_vusoftlinkinformation_topology_id_881d735c; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftlinkinformation_topology_id_881d735c ON public.vusoft_vusoftlinkinformation USING btree (topology_id);


--
-- Name: vusoft_vusoftnamednetwork_asset_id_27b6cdd3; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftnamednetwork_asset_id_27b6cdd3 ON public.vusoft_vusoftnamednetwork USING btree (asset_id);


--
-- Name: vusoft_vusoftnamednetwork_topology_id_fe1e0066; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftnamednetwork_topology_id_fe1e0066 ON public.vusoft_vusoftnamednetwork USING btree (topology_id);


--
-- Name: vusoft_vusoftnamednetworkg_vusoftnamednetworkgroup_id_5c8f6b80; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftnamednetworkg_vusoftnamednetworkgroup_id_5c8f6b80 ON public.vusoft_vusoftnamednetworkgroup_assets USING btree (vusoftnamednetworkgroup_id);


--
-- Name: vusoft_vusoftnamednetworkgroup_assets_vusoftasset_id_105224df; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftnamednetworkgroup_assets_vusoftasset_id_105224df ON public.vusoft_vusoftnamednetworkgroup_assets USING btree (vusoftasset_id);


--
-- Name: vusoft_vusoftreports_created_by_user_id_52bc0d83; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftreports_created_by_user_id_52bc0d83 ON public.vusoft_vusoftreports USING btree (created_by_id);


--
-- Name: vusoft_vusoftreports_owners_group_id_ad7da2d0; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftreports_owners_group_id_ad7da2d0 ON public.vusoft_vusoftreports_owners USING btree (group_id);


--
-- Name: vusoft_vusoftreports_owners_vusoftreports_id_4cd0a7cf; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftreports_owners_vusoftreports_id_4cd0a7cf ON public.vusoft_vusoftreports_owners USING btree (vusoftreports_id);


--
-- Name: vusoft_vusoftreports_report_template_id_d6f564a6; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftreports_report_template_id_d6f564a6 ON public.vusoft_vusoftreports USING btree (report_template_id);


--
-- Name: vusoft_vusoftreports_updated_by_id_0ef8f4ca; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftreports_updated_by_id_0ef8f4ca ON public.vusoft_vusoftreports USING btree (updated_by_id);


--
-- Name: vusoft_vusoftreportstempla_vusoftreportstemplate_id_a74de2bb; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftreportstempla_vusoftreportstemplate_id_a74de2bb ON public.vusoft_vusoftreportstemplate_owners USING btree (vusoftreportstemplate_id);


--
-- Name: vusoft_vusoftreportstemplate_created_by_user_id_008d0b72; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftreportstemplate_created_by_user_id_008d0b72 ON public.vusoft_vusoftreportstemplate USING btree (created_by_id);


--
-- Name: vusoft_vusoftreportstemplate_owners_group_id_e441ef88; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftreportstemplate_owners_group_id_e441ef88 ON public.vusoft_vusoftreportstemplate_owners USING btree (group_id);


--
-- Name: vusoft_vusoftreportstemplate_report_template_name_655d4f11_like; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftreportstemplate_report_template_name_655d4f11_like ON public.vusoft_vusoftreportstemplate USING btree (report_template_name varchar_pattern_ops);


--
-- Name: vusoft_vusoftreportstemplate_updated_by_id_2bfd7fd5; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftreportstemplate_updated_by_id_2bfd7fd5 ON public.vusoft_vusoftreportstemplate USING btree (updated_by_id);


--
-- Name: vusoft_vusoftrolluprules_group_name_3cac732f_like; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftrolluprules_group_name_3cac732f_like ON public.vusoft_vusoftrolluprules USING btree (group_name varchar_pattern_ops);


--
-- Name: vusoft_vusoftusereventrelation_event_id_309972f8; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vusoftusereventrelation_event_id_309972f8 ON public.vusoft_vusoftusereventrelation USING btree (event_id);


--
-- Name: vusoft_vustreamsconnectors_connector_name_f8b5e4e8_like; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vustreamsconnectors_connector_name_f8b5e4e8_like ON public.vusoft_vustreamsconnectors USING btree (connector_name varchar_pattern_ops);


--
-- Name: vusoft_vustreamsconnectors_created_by_id_8fd94fc7; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vustreamsconnectors_created_by_id_8fd94fc7 ON public.vusoft_vustreamsconnectors USING btree (created_by_id);


--
-- Name: vusoft_vustreamsconnectors_updated_by_id_3c89c2e0; Type: INDEX; Schema: public; Owner: core
--

CREATE INDEX vusoft_vustreamsconnectors_updated_by_id_3c89c2e0 ON public.vusoft_vustreamsconnectors USING btree (updated_by_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: event_correlation_trialrun_correlated_events event_correlation_tr_trialrun_id_ebdbce49_fk_event_cor; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.event_correlation_trialrun_correlated_events
    ADD CONSTRAINT event_correlation_tr_trialrun_id_ebdbce49_fk_event_cor FOREIGN KEY (trialrun_id) REFERENCES public.event_correlation_trialrun(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: event_correlation_trialrun_correlated_events event_correlation_tr_vusoftcorrelatedeven_533f16c9_fk_event_cor; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.event_correlation_trialrun_correlated_events
    ADD CONSTRAINT event_correlation_tr_vusoftcorrelatedeven_533f16c9_fk_event_cor FOREIGN KEY (vusoftcorrelatedevents_id) REFERENCES public.event_correlation_vusoftcorrelatedevents(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_groupobjectpermission guardian_groupobject_content_type_id_7ade36b8_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobject_content_type_id_7ade36b8_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_groupobjectpermission guardian_groupobject_group_id_4bbbfb62_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobject_group_id_4bbbfb62_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_groupobjectpermission guardian_groupobject_permission_id_36572738_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobject_permission_id_36572738_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_userobjectpermission guardian_userobjectp_content_type_id_2e892405_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectp_content_type_id_2e892405_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_userobjectpermission guardian_userobjectp_permission_id_71807bfc_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectp_permission_id_71807bfc_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_userobjectpermission guardian_userobjectpermission_user_id_d5c1e964_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermission_user_id_d5c1e964_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: metrics_metricitem metrics_metricitem_metric_id_6717db24_fk_metrics_metric_id; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.metrics_metricitem
    ADD CONSTRAINT metrics_metricitem_metric_id_6717db24_fk_metrics_metric_id FOREIGN KEY (metric_id) REFERENCES public.metrics_metric(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr FOREIGN KEY (source_refresh_token_id) REFERENCES public.oauth2_provider_refreshtoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_user_id_6e4c9a65_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_user_id_6e4c9a65_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_application oauth2_provider_application_user_id_79829054_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_user_id_79829054_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_grant oauth2_provider_gran_application_id_81923564_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_gran_application_id_81923564_fk_oauth2_pr FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_grant oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr FOREIGN KEY (access_token_id) REFERENCES public.oauth2_provider_accesstoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vu_auth_provider_dataaccesspolicy vu_auth_provider_dat_created_by_id_693f65d5_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vu_auth_provider_dataaccesspolicy
    ADD CONSTRAINT vu_auth_provider_dat_created_by_id_693f65d5_fk_auth_user FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vu_auth_provider_dataaccesspolicy vu_auth_provider_dat_updated_by_id_61088d8a_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vu_auth_provider_dataaccesspolicy
    ADD CONSTRAINT vu_auth_provider_dat_updated_by_id_61088d8a_fk_auth_user FOREIGN KEY (updated_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vu_auth_provider_usergroupmembership vu_auth_provider_use_group_id_3fa59797_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vu_auth_provider_usergroupmembership
    ADD CONSTRAINT vu_auth_provider_use_group_id_3fa59797_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vu_auth_provider_userprofile_groups vu_auth_provider_use_groups_id_8d1d961b_fk_groups_id; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vu_auth_provider_userprofile_groups
    ADD CONSTRAINT vu_auth_provider_use_groups_id_8d1d961b_fk_groups_id FOREIGN KEY (groups_id) REFERENCES public.groups(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vu_auth_provider_usergroupmembership vu_auth_provider_use_user_id_5f766c73_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vu_auth_provider_usergroupmembership
    ADD CONSTRAINT vu_auth_provider_use_user_id_5f766c73_fk_auth_user FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vu_auth_provider_userprofile_groups vu_auth_provider_use_userprofile_id_6185dadd_fk_vu_auth_p; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vu_auth_provider_userprofile_groups
    ADD CONSTRAINT vu_auth_provider_use_userprofile_id_6185dadd_fk_vu_auth_p FOREIGN KEY (userprofile_id) REFERENCES public.vu_auth_provider_userprofile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vu_auth_provider_userprofile vu_auth_provider_userprofile_user_id_5e258bd0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vu_auth_provider_userprofile
    ADD CONSTRAINT vu_auth_provider_userprofile_user_id_5e258bd0_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_alertrule vusoft_alertrule_created_by_id_13d69f05_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_alertrule
    ADD CONSTRAINT vusoft_alertrule_created_by_id_13d69f05_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_alertrule_owners vusoft_alertrule_own_alertrule_id_cc15fdd1_fk_vusoft_al; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_alertrule_owners
    ADD CONSTRAINT vusoft_alertrule_own_alertrule_id_cc15fdd1_fk_vusoft_al FOREIGN KEY (alertrule_id) REFERENCES public.vusoft_alertrule(alert_rule_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_alertrule_owners vusoft_alertrule_owners_group_id_f55c0660_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_alertrule_owners
    ADD CONSTRAINT vusoft_alertrule_owners_group_id_f55c0660_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_alertrule vusoft_alertrule_updated_by_id_d5998dcd_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_alertrule
    ADD CONSTRAINT vusoft_alertrule_updated_by_id_d5998dcd_fk_auth_user_id FOREIGN KEY (updated_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_assetaudittrail vusoft_assetaudittra_asset_id_e573382f_fk_vusoft_vu; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_assetaudittrail
    ADD CONSTRAINT vusoft_assetaudittra_asset_id_e573382f_fk_vusoft_vu FOREIGN KEY (asset_id) REFERENCES public.vusoft_vusoftasset(node_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_datastreams vusoft_datastreams_created_by_id_470e3151_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_datastreams
    ADD CONSTRAINT vusoft_datastreams_created_by_id_470e3151_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_datastreams vusoft_datastreams_updated_by_id_927f1b8e_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_datastreams
    ADD CONSTRAINT vusoft_datastreams_updated_by_id_927f1b8e_fk_auth_user_id FOREIGN KEY (updated_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_insightcards_owners vusoft_insightcards__insightcards_id_233498dc_fk_vusoft_in; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_insightcards_owners
    ADD CONSTRAINT vusoft_insightcards__insightcards_id_233498dc_fk_vusoft_in FOREIGN KEY (insightcards_id) REFERENCES public.vusoft_insightcards(insight_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_insightcards vusoft_insightcards_created_by_id_8adbc612_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_insightcards
    ADD CONSTRAINT vusoft_insightcards_created_by_id_8adbc612_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_insightcards_owners vusoft_insightcards_owners_group_id_ee335a80_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_insightcards_owners
    ADD CONSTRAINT vusoft_insightcards_owners_group_id_ee335a80_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_insightcards vusoft_insightcards_updated_by_id_5ffdfadf_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_insightcards
    ADD CONSTRAINT vusoft_insightcards_updated_by_id_5ffdfadf_fk_auth_user_id FOREIGN KEY (updated_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_mobiledashboard vusoft_mobiledashboard_created_by_id_73a4c4f2_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_mobiledashboard
    ADD CONSTRAINT vusoft_mobiledashboard_created_by_id_73a4c4f2_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_mobiledashboard vusoft_mobiledashboard_updated_by_id_12eb0b25_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_mobiledashboard
    ADD CONSTRAINT vusoft_mobiledashboard_updated_by_id_12eb0b25_fk_auth_user_id FOREIGN KEY (updated_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_utm vusoft_utm_created_by_id_a1c3e743_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_utm
    ADD CONSTRAINT vusoft_utm_created_by_id_a1c3e743_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_utm_owners vusoft_utm_owners_group_id_7d3367c9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_utm_owners
    ADD CONSTRAINT vusoft_utm_owners_group_id_7d3367c9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_utm_owners vusoft_utm_owners_utm_id_f7fa9a26_fk_vusoft_utm_id; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_utm_owners
    ADD CONSTRAINT vusoft_utm_owners_utm_id_f7fa9a26_fk_vusoft_utm_id FOREIGN KEY (utm_id) REFERENCES public.vusoft_utm(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_utm vusoft_utm_updated_by_id_5ab01455_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_utm
    ADD CONSTRAINT vusoft_utm_updated_by_id_5ab01455_fk_auth_user_id FOREIGN KEY (updated_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vublockalertruleconfigs vusoft_vublockalertr_active_alert_rule_id_3cc4c842_fk_vusoft_al; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vublockalertruleconfigs
    ADD CONSTRAINT vusoft_vublockalertr_active_alert_rule_id_3cc4c842_fk_vusoft_al FOREIGN KEY (active_alert_rule_id) REFERENCES public.vusoft_alertrule(alert_rule_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vublockalertrules vusoft_vublockalertr_alert_id_79c3254b_fk_vusoft_al; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vublockalertrules
    ADD CONSTRAINT vusoft_vublockalertr_alert_id_79c3254b_fk_vusoft_al FOREIGN KEY (alert_id) REFERENCES public.vusoft_alertrules(alert_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vublockdatasources vusoft_vublockdataso_data_collection_meth_c725b476_fk_vusoft_da; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vublockdatasources
    ADD CONSTRAINT vusoft_vublockdataso_data_collection_meth_c725b476_fk_vusoft_da FOREIGN KEY (data_collection_method_id) REFERENCES public.vusoft_datacollectionmethod(dcm_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vublockdiagnostic vusoft_vublockdiagnostic_created_by_id_5d0a2fd7_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vublockdiagnostic
    ADD CONSTRAINT vusoft_vublockdiagnostic_created_by_id_5d0a2fd7_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vublockjinjatemplate vusoft_vublockjinjat_vublock_id_99cf85ac_fk_vusoft_vu; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vublockjinjatemplate
    ADD CONSTRAINT vusoft_vublockjinjat_vublock_id_99cf85ac_fk_vusoft_vu FOREIGN KEY (vublock_id) REFERENCES public.vusoft_vublock(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vublockservicediagnostic vusoft_vublockservic_diagnostic_id_0801ceb2_fk_vusoft_vu; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vublockservicediagnostic
    ADD CONSTRAINT vusoft_vublockservic_diagnostic_id_0801ceb2_fk_vusoft_vu FOREIGN KEY (diagnostic_id) REFERENCES public.vusoft_vublockdiagnostic(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vublocksource vusoft_vublocksource_created_by_id_e9d8646c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vublocksource
    ADD CONSTRAINT vusoft_vublocksource_created_by_id_e9d8646c_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vublocksource vusoft_vublocksource_updated_by_id_a3964231_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vublocksource
    ADD CONSTRAINT vusoft_vublocksource_updated_by_id_a3964231_fk_auth_user_id FOREIGN KEY (updated_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vublockstoryboards vusoft_vublockstoryb_storyboard_id_2c1457af_fk_vusoft_st; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vublockstoryboards
    ADD CONSTRAINT vusoft_vublockstoryb_storyboard_id_2c1457af_fk_vusoft_st FOREIGN KEY (storyboard_id) REFERENCES public.vusoft_storyboards(storyboard_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vublocktopicdiagnostic vusoft_vublocktopicd_diagnostic_id_523b8838_fk_vusoft_vu; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vublocktopicdiagnostic
    ADD CONSTRAINT vusoft_vublocktopicd_diagnostic_id_523b8838_fk_vusoft_vu FOREIGN KEY (diagnostic_id) REFERENCES public.vusoft_vublockdiagnostic(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vusoftassetgroup_assets vusoft_vusoftassetgr_vusoftasset_id_4ebe7eee_fk_vusoft_vu; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftassetgroup_assets
    ADD CONSTRAINT vusoft_vusoftassetgr_vusoftasset_id_4ebe7eee_fk_vusoft_vu FOREIGN KEY (vusoftasset_id) REFERENCES public.vusoft_vusoftasset(node_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vusoftassetgroup_assets vusoft_vusoftassetgr_vusoftassetgroup_id_dc875bb0_fk_vusoft_vu; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftassetgroup_assets
    ADD CONSTRAINT vusoft_vusoftassetgr_vusoftassetgroup_id_dc875bb0_fk_vusoft_vu FOREIGN KEY (vusoftassetgroup_id) REFERENCES public.vusoft_vusoftassetgroup(group_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vusoftchatconversation vusoft_vusoftchatcon_created_by_id_d38fedba_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftchatconversation
    ADD CONSTRAINT vusoft_vusoftchatcon_created_by_id_d38fedba_fk_auth_user FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vusoftchatconversation vusoft_vusoftchatcon_updated_by_id_173a435d_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftchatconversation
    ADD CONSTRAINT vusoft_vusoftchatcon_updated_by_id_173a435d_fk_auth_user FOREIGN KEY (updated_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vusoftchatentry vusoft_vusoftchatent_conversation_id_57d42fc9_fk_vusoft_vu; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftchatentry
    ADD CONSTRAINT vusoft_vusoftchatent_conversation_id_57d42fc9_fk_vusoft_vu FOREIGN KEY (conversation_id) REFERENCES public.vusoft_vusoftchatconversation(conversation_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vusoftchatentry vusoft_vusoftchatentry_created_by_id_d801c865_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftchatentry
    ADD CONSTRAINT vusoft_vusoftchatentry_created_by_id_d801c865_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vusoftchatentry vusoft_vusoftchatentry_updated_by_id_1dcfe82c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftchatentry
    ADD CONSTRAINT vusoft_vusoftchatentry_updated_by_id_1dcfe82c_fk_auth_user_id FOREIGN KEY (updated_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vusoftconfigurationdevices_config_policy vusoft_vusoftconfigu_vusoftconfigurationd_426ff7d5_fk_vusoft_vu; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftconfigurationdevices_config_policy
    ADD CONSTRAINT vusoft_vusoftconfigu_vusoftconfigurationd_426ff7d5_fk_vusoft_vu FOREIGN KEY (vusoftconfigurationdevices_id) REFERENCES public.vusoft_vusoftconfigurationdevices(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vusoftconfigurationdevices_config_policy vusoft_vusoftconfigu_vusoftpolicy_id_a38b567b_fk_vusoft_vu; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftconfigurationdevices_config_policy
    ADD CONSTRAINT vusoft_vusoftconfigu_vusoftpolicy_id_a38b567b_fk_vusoft_vu FOREIGN KEY (vusoftpolicy_id) REFERENCES public.vusoft_vusoftpolicy(policy_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vusoftdatamanagement vusoft_vusoftdataman_created_by_id_ee71ffc0_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftdatamanagement
    ADD CONSTRAINT vusoft_vusoftdataman_created_by_id_ee71ffc0_fk_auth_user FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vusoftdatamanagement vusoft_vusoftdataman_updated_by_id_1567584c_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftdatamanagement
    ADD CONSTRAINT vusoft_vusoftdataman_updated_by_id_1567584c_fk_auth_user FOREIGN KEY (updated_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vusoftdataretention vusoft_vusoftdataret_created_by_id_c0cbc8b5_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftdataretention
    ADD CONSTRAINT vusoft_vusoftdataret_created_by_id_c0cbc8b5_fk_auth_user FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vusoftdataretention vusoft_vusoftdataret_updated_by_id_dd8c3928_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftdataretention
    ADD CONSTRAINT vusoft_vusoftdataret_updated_by_id_dd8c3928_fk_auth_user FOREIGN KEY (updated_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vusoftdevicegroup_devices vusoft_vusoftdeviceg_vusoftconfigurationd_30946220_fk_vusoft_vu; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftdevicegroup_devices
    ADD CONSTRAINT vusoft_vusoftdeviceg_vusoftconfigurationd_30946220_fk_vusoft_vu FOREIGN KEY (vusoftconfigurationdevices_id) REFERENCES public.vusoft_vusoftconfigurationdevices(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vusoftdevicegroup_config_policy vusoft_vusoftdeviceg_vusoftdevicegroup_id_095d772b_fk_vusoft_vu; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftdevicegroup_config_policy
    ADD CONSTRAINT vusoft_vusoftdeviceg_vusoftdevicegroup_id_095d772b_fk_vusoft_vu FOREIGN KEY (vusoftdevicegroup_id) REFERENCES public.vusoft_vusoftdevicegroup(group_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vusoftdevicegroup_devices vusoft_vusoftdeviceg_vusoftdevicegroup_id_2e97e5f7_fk_vusoft_vu; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftdevicegroup_devices
    ADD CONSTRAINT vusoft_vusoftdeviceg_vusoftdevicegroup_id_2e97e5f7_fk_vusoft_vu FOREIGN KEY (vusoftdevicegroup_id) REFERENCES public.vusoft_vusoftdevicegroup(group_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vusoftdevicegroup_config_policy vusoft_vusoftdeviceg_vusoftpolicy_id_748604a7_fk_vusoft_vu; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftdevicegroup_config_policy
    ADD CONSTRAINT vusoft_vusoftdeviceg_vusoftpolicy_id_748604a7_fk_vusoft_vu FOREIGN KEY (vusoftpolicy_id) REFERENCES public.vusoft_vusoftpolicy(policy_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vusoftenrichmentmetadata vusoft_vusoftenrichm_created_by_id_b82258d1_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftenrichmentmetadata
    ADD CONSTRAINT vusoft_vusoftenrichm_created_by_id_b82258d1_fk_auth_user FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vusoftenrichmentdata vusoft_vusoftenrichm_key_id_55075c52_fk_vusoft_vu; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftenrichmentdata
    ADD CONSTRAINT vusoft_vusoftenrichm_key_id_55075c52_fk_vusoft_vu FOREIGN KEY (key_id) REFERENCES public.vusoft_vusoftenrichmentmetadata(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vusoftenrichmentmetadata vusoft_vusoftenrichm_updated_by_id_7a076eaa_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftenrichmentmetadata
    ADD CONSTRAINT vusoft_vusoftenrichm_updated_by_id_7a076eaa_fk_auth_user FOREIGN KEY (updated_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vusoftetlpipeline vusoft_vusoftetlpipeline_created_by_id_c71d9c38_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftetlpipeline
    ADD CONSTRAINT vusoft_vusoftetlpipeline_created_by_id_c71d9c38_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vusoftetlpipeline vusoft_vusoftetlpipeline_updated_by_id_f95f28ee_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftetlpipeline
    ADD CONSTRAINT vusoft_vusoftetlpipeline_updated_by_id_f95f28ee_fk_auth_user_id FOREIGN KEY (updated_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vusoftfcmtoken vusoft_vusoftfcmtoken_user_id_37ba2bcd_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftfcmtoken
    ADD CONSTRAINT vusoft_vusoftfcmtoken_user_id_37ba2bcd_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vusoftlinkinformation vusoft_vusoftlinkinf_topology_id_881d735c_fk_vusoft_vu; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftlinkinformation
    ADD CONSTRAINT vusoft_vusoftlinkinf_topology_id_881d735c_fk_vusoft_vu FOREIGN KEY (topology_id) REFERENCES public.vusoft_vusoftdiscovery(topology_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vusoftnamednetwork vusoft_vusoftnamedne_asset_id_27b6cdd3_fk_vusoft_vu; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftnamednetwork
    ADD CONSTRAINT vusoft_vusoftnamedne_asset_id_27b6cdd3_fk_vusoft_vu FOREIGN KEY (asset_id) REFERENCES public.vusoft_vusoftasset(node_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vusoftnamednetwork vusoft_vusoftnamedne_topology_id_fe1e0066_fk_vusoft_vu; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftnamednetwork
    ADD CONSTRAINT vusoft_vusoftnamedne_topology_id_fe1e0066_fk_vusoft_vu FOREIGN KEY (topology_id) REFERENCES public.vusoft_vusoftdiscovery(topology_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vusoftnamednetworkgroup_assets vusoft_vusoftnamedne_vusoftasset_id_105224df_fk_vusoft_vu; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftnamednetworkgroup_assets
    ADD CONSTRAINT vusoft_vusoftnamedne_vusoftasset_id_105224df_fk_vusoft_vu FOREIGN KEY (vusoftasset_id) REFERENCES public.vusoft_vusoftasset(node_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vusoftnamednetworkgroup_assets vusoft_vusoftnamedne_vusoftnamednetworkgr_5c8f6b80_fk_vusoft_vu; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftnamednetworkgroup_assets
    ADD CONSTRAINT vusoft_vusoftnamedne_vusoftnamednetworkgr_5c8f6b80_fk_vusoft_vu FOREIGN KEY (vusoftnamednetworkgroup_id) REFERENCES public.vusoft_vusoftnamednetworkgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vusoftreports vusoft_vusoftreports_created_by_id_18c01059_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftreports
    ADD CONSTRAINT vusoft_vusoftreports_created_by_id_18c01059_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vusoftreportstemplate vusoft_vusoftreports_created_by_id_f90c8166_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftreportstemplate
    ADD CONSTRAINT vusoft_vusoftreports_created_by_id_f90c8166_fk_auth_user FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vusoftreportstemplate_owners vusoft_vusoftreports_group_id_e441ef88_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftreportstemplate_owners
    ADD CONSTRAINT vusoft_vusoftreports_group_id_e441ef88_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vusoftreports_owners vusoft_vusoftreports_owners_group_id_ad7da2d0_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftreports_owners
    ADD CONSTRAINT vusoft_vusoftreports_owners_group_id_ad7da2d0_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vusoftreports vusoft_vusoftreports_report_template_id_d6f564a6_fk_vusoft_vu; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftreports
    ADD CONSTRAINT vusoft_vusoftreports_report_template_id_d6f564a6_fk_vusoft_vu FOREIGN KEY (report_template_id) REFERENCES public.vusoft_vusoftreportstemplate(report_template_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vusoftreports vusoft_vusoftreports_updated_by_id_0ef8f4ca_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftreports
    ADD CONSTRAINT vusoft_vusoftreports_updated_by_id_0ef8f4ca_fk_auth_user_id FOREIGN KEY (updated_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vusoftreportstemplate vusoft_vusoftreports_updated_by_id_2bfd7fd5_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftreportstemplate
    ADD CONSTRAINT vusoft_vusoftreports_updated_by_id_2bfd7fd5_fk_auth_user FOREIGN KEY (updated_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vusoftreports_owners vusoft_vusoftreports_vusoftreports_id_4cd0a7cf_fk_vusoft_vu; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftreports_owners
    ADD CONSTRAINT vusoft_vusoftreports_vusoftreports_id_4cd0a7cf_fk_vusoft_vu FOREIGN KEY (vusoftreports_id) REFERENCES public.vusoft_vusoftreports(report_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vusoftreportstemplate_owners vusoft_vusoftreports_vusoftreportstemplat_a74de2bb_fk_vusoft_vu; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftreportstemplate_owners
    ADD CONSTRAINT vusoft_vusoftreports_vusoftreportstemplat_a74de2bb_fk_vusoft_vu FOREIGN KEY (vusoftreportstemplate_id) REFERENCES public.vusoft_vusoftreportstemplate(report_template_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vusoftusereventrelation vusoft_vusoftusereve_event_id_309972f8_fk_vusoft_vu; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vusoftusereventrelation
    ADD CONSTRAINT vusoft_vusoftusereve_event_id_309972f8_fk_vusoft_vu FOREIGN KEY (event_id) REFERENCES public.vusoft_vusofteventcorrelations(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vustreamsconnectors vusoft_vustreamsconn_created_by_id_8fd94fc7_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vustreamsconnectors
    ADD CONSTRAINT vusoft_vustreamsconn_created_by_id_8fd94fc7_fk_auth_user FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vusoft_vustreamsconnectors vusoft_vustreamsconn_updated_by_id_3c89c2e0_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: core
--

ALTER TABLE ONLY public.vusoft_vustreamsconnectors
    ADD CONSTRAINT vusoft_vustreamsconn_updated_by_id_3c89c2e0_fk_auth_user FOREIGN KEY (updated_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dbz_publication; Type: PUBLICATION; Schema: -; Owner: core
--

CREATE PUBLICATION dbz_publication WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION dbz_publication OWNER TO core;

--
-- Name: dbz_publication vusoft_vusoftenrichmentdata; Type: PUBLICATION TABLE; Schema: public; Owner: core
--

ALTER PUBLICATION dbz_publication ADD TABLE ONLY public.vusoft_vusoftenrichmentdata;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: vusmart
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--
