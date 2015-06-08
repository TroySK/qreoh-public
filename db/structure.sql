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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: attachinary_files; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE attachinary_files (
    id integer NOT NULL,
    attachinariable_id integer,
    attachinariable_type character varying(255),
    scope character varying(255),
    public_id character varying(255),
    version character varying(255),
    width integer,
    height integer,
    format character varying(255),
    resource_type character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: attachinary_files_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE attachinary_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: attachinary_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE attachinary_files_id_seq OWNED BY attachinary_files.id;


--
-- Name: authorizations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE authorizations (
    id integer NOT NULL,
    provider character varying(255),
    uid character varying(255),
    user_id integer,
    token character varying(255),
    secret character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: authorizations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authorizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: authorizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authorizations_id_seq OWNED BY authorizations.id;


--
-- Name: backers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE backers (
    id integer NOT NULL,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: backers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE backers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: backers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE backers_id_seq OWNED BY backers.id;


--
-- Name: color_details; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE color_details (
    id integer NOT NULL,
    color character varying(255),
    quantity integer,
    project_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    title character varying(255)
);


--
-- Name: color_details_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE color_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: color_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE color_details_id_seq OWNED BY color_details.id;


--
-- Name: coupons; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE coupons (
    id integer NOT NULL,
    code character varying(36) NOT NULL,
    coupon_type integer,
    value integer,
    order_id integer,
    used boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: coupons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE coupons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: coupons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE coupons_id_seq OWNED BY coupons.id;


--
-- Name: designer_feedbacks; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE designer_feedbacks (
    id integer NOT NULL,
    designer_id integer,
    user_id integer,
    feedback_text text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: designer_feedbacks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE designer_feedbacks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: designer_feedbacks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE designer_feedbacks_id_seq OWNED BY designer_feedbacks.id;


--
-- Name: designers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE designers (
    id integer NOT NULL,
    user_id integer,
    name character varying(255),
    about text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    location character varying(255),
    website character varying(255),
    avatar character varying(255),
    facebook character varying(255),
    pinterest character varying(255),
    behance character varying(255),
    linkedin character varying(255),
    slideshare character varying(255),
    twitter character varying(255),
    slug character varying(255),
    status integer DEFAULT 0
);


--
-- Name: designers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE designers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: designers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE designers_id_seq OWNED BY designers.id;


--
-- Name: editor_picks; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE editor_picks (
    id integer NOT NULL,
    project_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: editor_picks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE editor_picks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: editor_picks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE editor_picks_id_seq OWNED BY editor_picks.id;


--
-- Name: favorites; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE favorites (
    id integer NOT NULL,
    project_id integer,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: favorites_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE favorites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: favorites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE favorites_id_seq OWNED BY favorites.id;


--
-- Name: friendly_id_slugs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE friendly_id_slugs (
    id integer NOT NULL,
    slug character varying(255) NOT NULL,
    sluggable_id integer NOT NULL,
    sluggable_type character varying(40),
    created_at timestamp without time zone
);


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE friendly_id_slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE friendly_id_slugs_id_seq OWNED BY friendly_id_slugs.id;


--
-- Name: hot_right_now_projects; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE hot_right_now_projects (
    id integer NOT NULL,
    project_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: hot_right_now_projects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE hot_right_now_projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hot_right_now_projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE hot_right_now_projects_id_seq OWNED BY hot_right_now_projects.id;


--
-- Name: inventories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE inventories (
    id integer NOT NULL,
    project_id integer,
    size character varying(255) NOT NULL,
    total integer DEFAULT 0,
    sold integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: inventories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE inventories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: inventories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE inventories_id_seq OWNED BY inventories.id;


--
-- Name: latest_projects; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE latest_projects (
    id integer NOT NULL,
    project_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: latest_projects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE latest_projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: latest_projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE latest_projects_id_seq OWNED BY latest_projects.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE messages (
    id integer NOT NULL,
    user_id integer,
    recipient_id integer,
    message text,
    trashed boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    project_id integer,
    archived boolean DEFAULT false
);


--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE messages_id_seq OWNED BY messages.id;


--
-- Name: oauth2_access_tokens; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE oauth2_access_tokens (
    id integer NOT NULL,
    user_id integer,
    client_id integer,
    refresh_token_id integer,
    token character varying(255),
    expires_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: oauth2_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE oauth2_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: oauth2_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE oauth2_access_tokens_id_seq OWNED BY oauth2_access_tokens.id;


--
-- Name: oauth2_authorization_codes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE oauth2_authorization_codes (
    id integer NOT NULL,
    user_id integer,
    client_id integer,
    token character varying(255),
    expires_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: oauth2_authorization_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE oauth2_authorization_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: oauth2_authorization_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE oauth2_authorization_codes_id_seq OWNED BY oauth2_authorization_codes.id;


--
-- Name: oauth2_clients; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE oauth2_clients (
    id integer NOT NULL,
    name character varying(255),
    redirect_uri character varying(255),
    website character varying(255),
    identifier character varying(255),
    secret character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: oauth2_clients_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE oauth2_clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: oauth2_clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE oauth2_clients_id_seq OWNED BY oauth2_clients.id;


--
-- Name: oauth2_refresh_tokens; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE oauth2_refresh_tokens (
    id integer NOT NULL,
    user_id integer,
    client_id integer,
    token character varying(255),
    expires_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: oauth2_refresh_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE oauth2_refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: oauth2_refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE oauth2_refresh_tokens_id_seq OWNED BY oauth2_refresh_tokens.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE orders (
    id integer NOT NULL,
    project_id integer,
    backer_id integer,
    size character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    confirmed boolean DEFAULT false,
    confirm_code character varying(255),
    payment_mode character varying(255),
    color character varying(255),
    amount integer,
    transaction_id character varying(255),
    user_id integer
);


--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE orders_id_seq OWNED BY orders.id;


--
-- Name: popular_designers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE popular_designers (
    id integer NOT NULL,
    designer_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: popular_designers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE popular_designers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: popular_designers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE popular_designers_id_seq OWNED BY popular_designers.id;


--
-- Name: popular_projects; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE popular_projects (
    id integer NOT NULL,
    project_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: popular_projects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE popular_projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: popular_projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE popular_projects_id_seq OWNED BY popular_projects.id;


--
-- Name: project_photos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE project_photos (
    id integer NOT NULL,
    designer_id integer,
    project_id integer,
    image character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: project_photos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE project_photos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: project_photos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE project_photos_id_seq OWNED BY project_photos.id;


--
-- Name: project_updates; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE project_updates (
    id integer NOT NULL,
    project_id integer,
    update_text text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: project_updates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE project_updates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: project_updates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE project_updates_id_seq OWNED BY project_updates.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE projects (
    id integer NOT NULL,
    designer_id integer,
    category_id integer,
    title character varying(255),
    "desc" text,
    description text,
    size_text text,
    material character varying(255),
    color character varying(255),
    end_date timestamp without time zone,
    production_days integer,
    challenges text,
    price numeric,
    quantity integer,
    about text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    material_details text,
    tags character varying(255),
    duration integer,
    start_date timestamp without time zone,
    location character varying(255),
    status integer DEFAULT 0,
    slug character varying(255),
    fethr_button text,
    mywindow_button text,
    paypal_button character varying(255),
    ooak boolean DEFAULT false,
    taxonomy integer,
    code character varying(255)
);


--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE projects_id_seq OWNED BY projects.id;


--
-- Name: rails_admin_histories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rails_admin_histories (
    id integer NOT NULL,
    message text,
    username character varying(255),
    item integer,
    "table" character varying(255),
    month smallint,
    year bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: rails_admin_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rails_admin_histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rails_admin_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rails_admin_histories_id_seq OWNED BY rails_admin_histories.id;


--
-- Name: recent_designers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE recent_designers (
    id integer NOT NULL,
    designer_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: recent_designers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE recent_designers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: recent_designers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE recent_designers_id_seq OWNED BY recent_designers.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: shipping_addresses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE shipping_addresses (
    id integer NOT NULL,
    backer_id integer,
    order_id integer,
    name character varying(255),
    address1 character varying(255),
    address2 character varying(255),
    zipcode character varying(255),
    city character varying(255),
    state character varying(255),
    country character varying(255),
    phone_number character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: shipping_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE shipping_addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shipping_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE shipping_addresses_id_seq OWNED BY shipping_addresses.id;


--
-- Name: shopping_cart_items; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE shopping_cart_items (
    id integer NOT NULL,
    owner_id integer,
    owner_type character varying(255),
    quantity integer,
    item_id integer,
    item_type character varying(255),
    price double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    details text
);


--
-- Name: shopping_cart_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE shopping_cart_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shopping_cart_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE shopping_cart_items_id_seq OWNED BY shopping_cart_items.id;


--
-- Name: shopping_carts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE shopping_carts (
    id integer NOT NULL,
    user_id integer,
    status boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    order_id integer
);


--
-- Name: shopping_carts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE shopping_carts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shopping_carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE shopping_carts_id_seq OWNED BY shopping_carts.id;


--
-- Name: size_details; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE size_details (
    id integer NOT NULL,
    project_id integer,
    size character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    quantity integer
);


--
-- Name: size_details_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE size_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: size_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE size_details_id_seq OWNED BY size_details.id;


--
-- Name: trending_projects; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE trending_projects (
    id integer NOT NULL,
    project_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: trending_projects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE trending_projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trending_projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE trending_projects_id_seq OWNED BY trending_projects.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    confirmation_token character varying(255),
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY attachinary_files ALTER COLUMN id SET DEFAULT nextval('attachinary_files_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authorizations ALTER COLUMN id SET DEFAULT nextval('authorizations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY backers ALTER COLUMN id SET DEFAULT nextval('backers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY color_details ALTER COLUMN id SET DEFAULT nextval('color_details_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY coupons ALTER COLUMN id SET DEFAULT nextval('coupons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY designer_feedbacks ALTER COLUMN id SET DEFAULT nextval('designer_feedbacks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY designers ALTER COLUMN id SET DEFAULT nextval('designers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY editor_picks ALTER COLUMN id SET DEFAULT nextval('editor_picks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY favorites ALTER COLUMN id SET DEFAULT nextval('favorites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('friendly_id_slugs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY hot_right_now_projects ALTER COLUMN id SET DEFAULT nextval('hot_right_now_projects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY inventories ALTER COLUMN id SET DEFAULT nextval('inventories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY latest_projects ALTER COLUMN id SET DEFAULT nextval('latest_projects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY messages ALTER COLUMN id SET DEFAULT nextval('messages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY oauth2_access_tokens ALTER COLUMN id SET DEFAULT nextval('oauth2_access_tokens_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY oauth2_authorization_codes ALTER COLUMN id SET DEFAULT nextval('oauth2_authorization_codes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY oauth2_clients ALTER COLUMN id SET DEFAULT nextval('oauth2_clients_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY oauth2_refresh_tokens ALTER COLUMN id SET DEFAULT nextval('oauth2_refresh_tokens_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY popular_designers ALTER COLUMN id SET DEFAULT nextval('popular_designers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY popular_projects ALTER COLUMN id SET DEFAULT nextval('popular_projects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY project_photos ALTER COLUMN id SET DEFAULT nextval('project_photos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY project_updates ALTER COLUMN id SET DEFAULT nextval('project_updates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY projects ALTER COLUMN id SET DEFAULT nextval('projects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rails_admin_histories ALTER COLUMN id SET DEFAULT nextval('rails_admin_histories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY recent_designers ALTER COLUMN id SET DEFAULT nextval('recent_designers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY shipping_addresses ALTER COLUMN id SET DEFAULT nextval('shipping_addresses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY shopping_cart_items ALTER COLUMN id SET DEFAULT nextval('shopping_cart_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY shopping_carts ALTER COLUMN id SET DEFAULT nextval('shopping_carts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY size_details ALTER COLUMN id SET DEFAULT nextval('size_details_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY trending_projects ALTER COLUMN id SET DEFAULT nextval('trending_projects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: attachinary_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY attachinary_files
    ADD CONSTRAINT attachinary_files_pkey PRIMARY KEY (id);


--
-- Name: authorizations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY authorizations
    ADD CONSTRAINT authorizations_pkey PRIMARY KEY (id);


--
-- Name: backers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY backers
    ADD CONSTRAINT backers_pkey PRIMARY KEY (id);


--
-- Name: color_details_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY color_details
    ADD CONSTRAINT color_details_pkey PRIMARY KEY (id);


--
-- Name: coupons_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY coupons
    ADD CONSTRAINT coupons_pkey PRIMARY KEY (id);


--
-- Name: designer_feedbacks_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY designer_feedbacks
    ADD CONSTRAINT designer_feedbacks_pkey PRIMARY KEY (id);


--
-- Name: designers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY designers
    ADD CONSTRAINT designers_pkey PRIMARY KEY (id);


--
-- Name: editor_picks_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY editor_picks
    ADD CONSTRAINT editor_picks_pkey PRIMARY KEY (id);


--
-- Name: favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY favorites
    ADD CONSTRAINT favorites_pkey PRIMARY KEY (id);


--
-- Name: friendly_id_slugs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);


--
-- Name: hot_right_now_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY hot_right_now_projects
    ADD CONSTRAINT hot_right_now_projects_pkey PRIMARY KEY (id);


--
-- Name: inventories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY inventories
    ADD CONSTRAINT inventories_pkey PRIMARY KEY (id);


--
-- Name: latest_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY latest_projects
    ADD CONSTRAINT latest_projects_pkey PRIMARY KEY (id);


--
-- Name: messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: oauth2_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY oauth2_access_tokens
    ADD CONSTRAINT oauth2_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: oauth2_authorization_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY oauth2_authorization_codes
    ADD CONSTRAINT oauth2_authorization_codes_pkey PRIMARY KEY (id);


--
-- Name: oauth2_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY oauth2_clients
    ADD CONSTRAINT oauth2_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth2_refresh_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY oauth2_refresh_tokens
    ADD CONSTRAINT oauth2_refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: popular_designers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY popular_designers
    ADD CONSTRAINT popular_designers_pkey PRIMARY KEY (id);


--
-- Name: popular_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY popular_projects
    ADD CONSTRAINT popular_projects_pkey PRIMARY KEY (id);


--
-- Name: project_photos_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY project_photos
    ADD CONSTRAINT project_photos_pkey PRIMARY KEY (id);


--
-- Name: project_updates_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY project_updates
    ADD CONSTRAINT project_updates_pkey PRIMARY KEY (id);


--
-- Name: projects_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: rails_admin_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rails_admin_histories
    ADD CONSTRAINT rails_admin_histories_pkey PRIMARY KEY (id);


--
-- Name: recent_designers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY recent_designers
    ADD CONSTRAINT recent_designers_pkey PRIMARY KEY (id);


--
-- Name: shipping_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY shipping_addresses
    ADD CONSTRAINT shipping_addresses_pkey PRIMARY KEY (id);


--
-- Name: shopping_cart_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY shopping_cart_items
    ADD CONSTRAINT shopping_cart_items_pkey PRIMARY KEY (id);


--
-- Name: shopping_carts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY shopping_carts
    ADD CONSTRAINT shopping_carts_pkey PRIMARY KEY (id);


--
-- Name: size_details_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY size_details
    ADD CONSTRAINT size_details_pkey PRIMARY KEY (id);


--
-- Name: trending_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY trending_projects
    ADD CONSTRAINT trending_projects_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: by_scoped_parent; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX by_scoped_parent ON attachinary_files USING btree (attachinariable_type, attachinariable_id, scope);


--
-- Name: index_authorizations_on_uid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_authorizations_on_uid ON authorizations USING btree (uid);


--
-- Name: index_authorizations_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_authorizations_on_user_id ON authorizations USING btree (user_id);


--
-- Name: index_backers_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_backers_on_user_id ON backers USING btree (user_id);


--
-- Name: index_color_details_on_project_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_color_details_on_project_id ON color_details USING btree (project_id);


--
-- Name: index_coupons_on_code; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_coupons_on_code ON coupons USING btree (code);


--
-- Name: index_coupons_on_order_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_coupons_on_order_id ON coupons USING btree (order_id);


--
-- Name: index_designer_feedbacks_on_designer_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_designer_feedbacks_on_designer_id ON designer_feedbacks USING btree (designer_id);


--
-- Name: index_designer_feedbacks_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_designer_feedbacks_on_user_id ON designer_feedbacks USING btree (user_id);


--
-- Name: index_designers_on_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_designers_on_slug ON designers USING btree (slug);


--
-- Name: index_designers_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_designers_on_user_id ON designers USING btree (user_id);


--
-- Name: index_favorites_on_project_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_favorites_on_project_id ON favorites USING btree (project_id);


--
-- Name: index_favorites_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_favorites_on_user_id ON favorites USING btree (user_id);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type ON friendly_id_slugs USING btree (slug, sluggable_type);


--
-- Name: index_friendly_id_slugs_on_sluggable_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_id ON friendly_id_slugs USING btree (sluggable_id);


--
-- Name: index_friendly_id_slugs_on_sluggable_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_type ON friendly_id_slugs USING btree (sluggable_type);


--
-- Name: index_inventories_on_project_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_inventories_on_project_id ON inventories USING btree (project_id);


--
-- Name: index_messages_on_project_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_messages_on_project_id ON messages USING btree (project_id);


--
-- Name: index_messages_on_recipient_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_messages_on_recipient_id ON messages USING btree (recipient_id);


--
-- Name: index_messages_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_messages_on_user_id ON messages USING btree (user_id);


--
-- Name: index_oauth2_access_tokens_on_client_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_oauth2_access_tokens_on_client_id ON oauth2_access_tokens USING btree (client_id);


--
-- Name: index_oauth2_access_tokens_on_expires_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_oauth2_access_tokens_on_expires_at ON oauth2_access_tokens USING btree (expires_at);


--
-- Name: index_oauth2_access_tokens_on_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_oauth2_access_tokens_on_token ON oauth2_access_tokens USING btree (token);


--
-- Name: index_oauth2_access_tokens_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_oauth2_access_tokens_on_user_id ON oauth2_access_tokens USING btree (user_id);


--
-- Name: index_oauth2_authorization_codes_on_client_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_oauth2_authorization_codes_on_client_id ON oauth2_authorization_codes USING btree (client_id);


--
-- Name: index_oauth2_authorization_codes_on_expires_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_oauth2_authorization_codes_on_expires_at ON oauth2_authorization_codes USING btree (expires_at);


--
-- Name: index_oauth2_authorization_codes_on_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_oauth2_authorization_codes_on_token ON oauth2_authorization_codes USING btree (token);


--
-- Name: index_oauth2_authorization_codes_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_oauth2_authorization_codes_on_user_id ON oauth2_authorization_codes USING btree (user_id);


--
-- Name: index_oauth2_clients_on_identifier; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_oauth2_clients_on_identifier ON oauth2_clients USING btree (identifier);


--
-- Name: index_oauth2_refresh_tokens_on_client_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_oauth2_refresh_tokens_on_client_id ON oauth2_refresh_tokens USING btree (client_id);


--
-- Name: index_oauth2_refresh_tokens_on_expires_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_oauth2_refresh_tokens_on_expires_at ON oauth2_refresh_tokens USING btree (expires_at);


--
-- Name: index_oauth2_refresh_tokens_on_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_oauth2_refresh_tokens_on_token ON oauth2_refresh_tokens USING btree (token);


--
-- Name: index_oauth2_refresh_tokens_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_oauth2_refresh_tokens_on_user_id ON oauth2_refresh_tokens USING btree (user_id);


--
-- Name: index_orders_on_backer_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_orders_on_backer_id ON orders USING btree (backer_id);


--
-- Name: index_orders_on_project_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_orders_on_project_id ON orders USING btree (project_id);


--
-- Name: index_project_photos_on_designer_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_project_photos_on_designer_id ON project_photos USING btree (designer_id);


--
-- Name: index_project_photos_on_project_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_project_photos_on_project_id ON project_photos USING btree (project_id);


--
-- Name: index_project_updates_on_project_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_project_updates_on_project_id ON project_updates USING btree (project_id);


--
-- Name: index_projects_on_category_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_projects_on_category_id ON projects USING btree (category_id);


--
-- Name: index_projects_on_designer_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_projects_on_designer_id ON projects USING btree (designer_id);


--
-- Name: index_projects_on_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_projects_on_slug ON projects USING btree (slug);


--
-- Name: index_rails_admin_histories; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_rails_admin_histories ON rails_admin_histories USING btree (item, "table", month, year);


--
-- Name: index_shipping_addresses_on_backer_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_shipping_addresses_on_backer_id ON shipping_addresses USING btree (backer_id);


--
-- Name: index_shipping_addresses_on_order_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_shipping_addresses_on_order_id ON shipping_addresses USING btree (order_id);


--
-- Name: index_shopping_carts_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_shopping_carts_on_user_id ON shopping_carts USING btree (user_id);


--
-- Name: index_size_details_on_project_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_size_details_on_project_id ON size_details USING btree (project_id);


--
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON users USING btree (confirmation_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20130624135746');

INSERT INTO schema_migrations (version) VALUES ('20130624172343');

INSERT INTO schema_migrations (version) VALUES ('20130702142756');

INSERT INTO schema_migrations (version) VALUES ('20130702144914');

INSERT INTO schema_migrations (version) VALUES ('20130702145647');

INSERT INTO schema_migrations (version) VALUES ('20130703054428');

INSERT INTO schema_migrations (version) VALUES ('20130703164741');

INSERT INTO schema_migrations (version) VALUES ('20130709180050');

INSERT INTO schema_migrations (version) VALUES ('20130716192148');

INSERT INTO schema_migrations (version) VALUES ('20130721130759');

INSERT INTO schema_migrations (version) VALUES ('20130721130934');

INSERT INTO schema_migrations (version) VALUES ('20130721131537');

INSERT INTO schema_migrations (version) VALUES ('20130721134237');

INSERT INTO schema_migrations (version) VALUES ('20130721162718');

INSERT INTO schema_migrations (version) VALUES ('20130721163157');

INSERT INTO schema_migrations (version) VALUES ('20130721185750');

INSERT INTO schema_migrations (version) VALUES ('20130722140144');

INSERT INTO schema_migrations (version) VALUES ('20130722165714');

INSERT INTO schema_migrations (version) VALUES ('20130723170943');

INSERT INTO schema_migrations (version) VALUES ('20130723182033');

INSERT INTO schema_migrations (version) VALUES ('20130723184841');

INSERT INTO schema_migrations (version) VALUES ('20130729161906');

INSERT INTO schema_migrations (version) VALUES ('20130731172503');

INSERT INTO schema_migrations (version) VALUES ('20130810142802');

INSERT INTO schema_migrations (version) VALUES ('20130810142817');

INSERT INTO schema_migrations (version) VALUES ('20130810142829');

INSERT INTO schema_migrations (version) VALUES ('20130810142906');

INSERT INTO schema_migrations (version) VALUES ('20130810142945');

INSERT INTO schema_migrations (version) VALUES ('20130810143003');

INSERT INTO schema_migrations (version) VALUES ('20130810203719');

INSERT INTO schema_migrations (version) VALUES ('20130810211013');

INSERT INTO schema_migrations (version) VALUES ('20130811152637');

INSERT INTO schema_migrations (version) VALUES ('20130811154332');

INSERT INTO schema_migrations (version) VALUES ('20130815172348');

INSERT INTO schema_migrations (version) VALUES ('20130816174223');

INSERT INTO schema_migrations (version) VALUES ('20130816174407');

INSERT INTO schema_migrations (version) VALUES ('20130816180443');

INSERT INTO schema_migrations (version) VALUES ('20130817130913');

INSERT INTO schema_migrations (version) VALUES ('20130817131027');

INSERT INTO schema_migrations (version) VALUES ('20130817205708');

INSERT INTO schema_migrations (version) VALUES ('20130823180123');

INSERT INTO schema_migrations (version) VALUES ('20130928183056');

INSERT INTO schema_migrations (version) VALUES ('20140308101924');

INSERT INTO schema_migrations (version) VALUES ('20140406081157');

INSERT INTO schema_migrations (version) VALUES ('20140623135233');

INSERT INTO schema_migrations (version) VALUES ('20140710112953');

INSERT INTO schema_migrations (version) VALUES ('20140715131017');

INSERT INTO schema_migrations (version) VALUES ('20140716104117');

INSERT INTO schema_migrations (version) VALUES ('20140803154250');

INSERT INTO schema_migrations (version) VALUES ('20140807113647');

INSERT INTO schema_migrations (version) VALUES ('20140809212006');

INSERT INTO schema_migrations (version) VALUES ('20140810083823');

INSERT INTO schema_migrations (version) VALUES ('20140810094352');

INSERT INTO schema_migrations (version) VALUES ('20140817135714');

INSERT INTO schema_migrations (version) VALUES ('20140817141834');

INSERT INTO schema_migrations (version) VALUES ('20140817191039');

INSERT INTO schema_migrations (version) VALUES ('20140817200735');

INSERT INTO schema_migrations (version) VALUES ('20140818101422');

INSERT INTO schema_migrations (version) VALUES ('20140818101937');

INSERT INTO schema_migrations (version) VALUES ('20140906125904');

INSERT INTO schema_migrations (version) VALUES ('20140906125940');

INSERT INTO schema_migrations (version) VALUES ('20140906190919');

INSERT INTO schema_migrations (version) VALUES ('20140906210740');

INSERT INTO schema_migrations (version) VALUES ('20140907195704');

INSERT INTO schema_migrations (version) VALUES ('20141004123130');

INSERT INTO schema_migrations (version) VALUES ('20141006104028');SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20130624135746');

INSERT INTO schema_migrations (version) VALUES ('20130624172343');

INSERT INTO schema_migrations (version) VALUES ('20130702142756');

INSERT INTO schema_migrations (version) VALUES ('20130702144914');

INSERT INTO schema_migrations (version) VALUES ('20130702145647');

INSERT INTO schema_migrations (version) VALUES ('20130703054428');

INSERT INTO schema_migrations (version) VALUES ('20130703164741');

INSERT INTO schema_migrations (version) VALUES ('20130709180050');

INSERT INTO schema_migrations (version) VALUES ('20130716192148');

INSERT INTO schema_migrations (version) VALUES ('20130721130759');

INSERT INTO schema_migrations (version) VALUES ('20130721130934');

INSERT INTO schema_migrations (version) VALUES ('20130721131537');

INSERT INTO schema_migrations (version) VALUES ('20130721134237');

INSERT INTO schema_migrations (version) VALUES ('20130721162718');

INSERT INTO schema_migrations (version) VALUES ('20130721163157');

INSERT INTO schema_migrations (version) VALUES ('20130721185750');

INSERT INTO schema_migrations (version) VALUES ('20130722140144');

INSERT INTO schema_migrations (version) VALUES ('20130722165714');

INSERT INTO schema_migrations (version) VALUES ('20130723170943');

INSERT INTO schema_migrations (version) VALUES ('20130723182033');

INSERT INTO schema_migrations (version) VALUES ('20130723184841');

INSERT INTO schema_migrations (version) VALUES ('20130729161906');

INSERT INTO schema_migrations (version) VALUES ('20130731172503');

INSERT INTO schema_migrations (version) VALUES ('20130810142802');

INSERT INTO schema_migrations (version) VALUES ('20130810142817');

INSERT INTO schema_migrations (version) VALUES ('20130810142829');

INSERT INTO schema_migrations (version) VALUES ('20130810142906');

INSERT INTO schema_migrations (version) VALUES ('20130810142945');

INSERT INTO schema_migrations (version) VALUES ('20130810143003');

INSERT INTO schema_migrations (version) VALUES ('20130810203719');

INSERT INTO schema_migrations (version) VALUES ('20130810211013');

INSERT INTO schema_migrations (version) VALUES ('20130811152637');

INSERT INTO schema_migrations (version) VALUES ('20130811154332');

INSERT INTO schema_migrations (version) VALUES ('20130815172348');

INSERT INTO schema_migrations (version) VALUES ('20130816174223');

INSERT INTO schema_migrations (version) VALUES ('20130816174407');

INSERT INTO schema_migrations (version) VALUES ('20130816180443');

INSERT INTO schema_migrations (version) VALUES ('20130817130913');

INSERT INTO schema_migrations (version) VALUES ('20130817131027');

INSERT INTO schema_migrations (version) VALUES ('20130817205708');

INSERT INTO schema_migrations (version) VALUES ('20130823180123');

INSERT INTO schema_migrations (version) VALUES ('20130928183056');

INSERT INTO schema_migrations (version) VALUES ('20140308101924');

INSERT INTO schema_migrations (version) VALUES ('20140406081157');

INSERT INTO schema_migrations (version) VALUES ('20140623135233');

INSERT INTO schema_migrations (version) VALUES ('20140710112953');

INSERT INTO schema_migrations (version) VALUES ('20140715131017');

INSERT INTO schema_migrations (version) VALUES ('20140716104117');

INSERT INTO schema_migrations (version) VALUES ('20140803154250');

INSERT INTO schema_migrations (version) VALUES ('20140807113647');

INSERT INTO schema_migrations (version) VALUES ('20140809212006');

INSERT INTO schema_migrations (version) VALUES ('20140810083823');

INSERT INTO schema_migrations (version) VALUES ('20140810094352');

INSERT INTO schema_migrations (version) VALUES ('20140817135714');

INSERT INTO schema_migrations (version) VALUES ('20140817141834');

INSERT INTO schema_migrations (version) VALUES ('20140817191039');

INSERT INTO schema_migrations (version) VALUES ('20140817200735');

INSERT INTO schema_migrations (version) VALUES ('20140818101422');

INSERT INTO schema_migrations (version) VALUES ('20140818101937');

INSERT INTO schema_migrations (version) VALUES ('20140906125904');

INSERT INTO schema_migrations (version) VALUES ('20140906125940');

INSERT INTO schema_migrations (version) VALUES ('20140906190919');

INSERT INTO schema_migrations (version) VALUES ('20140906210740');

INSERT INTO schema_migrations (version) VALUES ('20140907195704');

INSERT INTO schema_migrations (version) VALUES ('20141004123130');

INSERT INTO schema_migrations (version) VALUES ('20141006104028');

INSERT INTO schema_migrations (version) VALUES ('20141022075500');SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20130624135746');

INSERT INTO schema_migrations (version) VALUES ('20130624172343');

INSERT INTO schema_migrations (version) VALUES ('20130702142756');

INSERT INTO schema_migrations (version) VALUES ('20130702144914');

INSERT INTO schema_migrations (version) VALUES ('20130702145647');

INSERT INTO schema_migrations (version) VALUES ('20130703054428');

INSERT INTO schema_migrations (version) VALUES ('20130703164741');

INSERT INTO schema_migrations (version) VALUES ('20130709180050');

INSERT INTO schema_migrations (version) VALUES ('20130716192148');

INSERT INTO schema_migrations (version) VALUES ('20130721130759');

INSERT INTO schema_migrations (version) VALUES ('20130721130934');

INSERT INTO schema_migrations (version) VALUES ('20130721131537');

INSERT INTO schema_migrations (version) VALUES ('20130721134237');

INSERT INTO schema_migrations (version) VALUES ('20130721162718');

INSERT INTO schema_migrations (version) VALUES ('20130721163157');

INSERT INTO schema_migrations (version) VALUES ('20130721185750');

INSERT INTO schema_migrations (version) VALUES ('20130722140144');

INSERT INTO schema_migrations (version) VALUES ('20130722165714');

INSERT INTO schema_migrations (version) VALUES ('20130723170943');

INSERT INTO schema_migrations (version) VALUES ('20130723182033');

INSERT INTO schema_migrations (version) VALUES ('20130723184841');

INSERT INTO schema_migrations (version) VALUES ('20130729161906');

INSERT INTO schema_migrations (version) VALUES ('20130731172503');

INSERT INTO schema_migrations (version) VALUES ('20130810142802');

INSERT INTO schema_migrations (version) VALUES ('20130810142817');

INSERT INTO schema_migrations (version) VALUES ('20130810142829');

INSERT INTO schema_migrations (version) VALUES ('20130810142906');

INSERT INTO schema_migrations (version) VALUES ('20130810142945');

INSERT INTO schema_migrations (version) VALUES ('20130810143003');

INSERT INTO schema_migrations (version) VALUES ('20130810203719');

INSERT INTO schema_migrations (version) VALUES ('20130810211013');

INSERT INTO schema_migrations (version) VALUES ('20130811152637');

INSERT INTO schema_migrations (version) VALUES ('20130811154332');

INSERT INTO schema_migrations (version) VALUES ('20130815172348');

INSERT INTO schema_migrations (version) VALUES ('20130816174223');

INSERT INTO schema_migrations (version) VALUES ('20130816174407');

INSERT INTO schema_migrations (version) VALUES ('20130816180443');

INSERT INTO schema_migrations (version) VALUES ('20130817130913');

INSERT INTO schema_migrations (version) VALUES ('20130817131027');

INSERT INTO schema_migrations (version) VALUES ('20130817205708');

INSERT INTO schema_migrations (version) VALUES ('20130823180123');

INSERT INTO schema_migrations (version) VALUES ('20130928183056');

INSERT INTO schema_migrations (version) VALUES ('20140308101924');

INSERT INTO schema_migrations (version) VALUES ('20140406081157');

INSERT INTO schema_migrations (version) VALUES ('20140623135233');

INSERT INTO schema_migrations (version) VALUES ('20140710112953');

INSERT INTO schema_migrations (version) VALUES ('20140715131017');

INSERT INTO schema_migrations (version) VALUES ('20140716104117');

INSERT INTO schema_migrations (version) VALUES ('20140803154250');

INSERT INTO schema_migrations (version) VALUES ('20140807113647');

INSERT INTO schema_migrations (version) VALUES ('20140809212006');

INSERT INTO schema_migrations (version) VALUES ('20140810083823');

INSERT INTO schema_migrations (version) VALUES ('20140810094352');

INSERT INTO schema_migrations (version) VALUES ('20140817135714');

INSERT INTO schema_migrations (version) VALUES ('20140817141834');

INSERT INTO schema_migrations (version) VALUES ('20140817191039');

INSERT INTO schema_migrations (version) VALUES ('20140817200735');

INSERT INTO schema_migrations (version) VALUES ('20140818101422');

INSERT INTO schema_migrations (version) VALUES ('20140818101937');

INSERT INTO schema_migrations (version) VALUES ('20140906125904');

INSERT INTO schema_migrations (version) VALUES ('20140906125940');

INSERT INTO schema_migrations (version) VALUES ('20140906190919');

INSERT INTO schema_migrations (version) VALUES ('20140906210740');

INSERT INTO schema_migrations (version) VALUES ('20140907195704');

INSERT INTO schema_migrations (version) VALUES ('20141004123130');

INSERT INTO schema_migrations (version) VALUES ('20141006104028');

INSERT INTO schema_migrations (version) VALUES ('20141022075500');SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20130624135746');

INSERT INTO schema_migrations (version) VALUES ('20130624172343');

INSERT INTO schema_migrations (version) VALUES ('20130702142756');

INSERT INTO schema_migrations (version) VALUES ('20130702144914');

INSERT INTO schema_migrations (version) VALUES ('20130702145647');

INSERT INTO schema_migrations (version) VALUES ('20130703054428');

INSERT INTO schema_migrations (version) VALUES ('20130703164741');

INSERT INTO schema_migrations (version) VALUES ('20130709180050');

INSERT INTO schema_migrations (version) VALUES ('20130716192148');

INSERT INTO schema_migrations (version) VALUES ('20130721130759');

INSERT INTO schema_migrations (version) VALUES ('20130721130934');

INSERT INTO schema_migrations (version) VALUES ('20130721131537');

INSERT INTO schema_migrations (version) VALUES ('20130721134237');

INSERT INTO schema_migrations (version) VALUES ('20130721162718');

INSERT INTO schema_migrations (version) VALUES ('20130721163157');

INSERT INTO schema_migrations (version) VALUES ('20130721185750');

INSERT INTO schema_migrations (version) VALUES ('20130722140144');

INSERT INTO schema_migrations (version) VALUES ('20130722165714');

INSERT INTO schema_migrations (version) VALUES ('20130723170943');

INSERT INTO schema_migrations (version) VALUES ('20130723182033');

INSERT INTO schema_migrations (version) VALUES ('20130723184841');

INSERT INTO schema_migrations (version) VALUES ('20130729161906');

INSERT INTO schema_migrations (version) VALUES ('20130731172503');

INSERT INTO schema_migrations (version) VALUES ('20130810142802');

INSERT INTO schema_migrations (version) VALUES ('20130810142817');

INSERT INTO schema_migrations (version) VALUES ('20130810142829');

INSERT INTO schema_migrations (version) VALUES ('20130810142906');

INSERT INTO schema_migrations (version) VALUES ('20130810142945');

INSERT INTO schema_migrations (version) VALUES ('20130810143003');

INSERT INTO schema_migrations (version) VALUES ('20130810203719');

INSERT INTO schema_migrations (version) VALUES ('20130810211013');

INSERT INTO schema_migrations (version) VALUES ('20130811152637');

INSERT INTO schema_migrations (version) VALUES ('20130811154332');

INSERT INTO schema_migrations (version) VALUES ('20130815172348');

INSERT INTO schema_migrations (version) VALUES ('20130816174223');

INSERT INTO schema_migrations (version) VALUES ('20130816174407');

INSERT INTO schema_migrations (version) VALUES ('20130816180443');

INSERT INTO schema_migrations (version) VALUES ('20130817130913');

INSERT INTO schema_migrations (version) VALUES ('20130817131027');

INSERT INTO schema_migrations (version) VALUES ('20130817205708');

INSERT INTO schema_migrations (version) VALUES ('20130823180123');

INSERT INTO schema_migrations (version) VALUES ('20130928183056');

INSERT INTO schema_migrations (version) VALUES ('20140308101924');

INSERT INTO schema_migrations (version) VALUES ('20140406081157');

INSERT INTO schema_migrations (version) VALUES ('20140623135233');

INSERT INTO schema_migrations (version) VALUES ('20140710112953');

INSERT INTO schema_migrations (version) VALUES ('20140715131017');

INSERT INTO schema_migrations (version) VALUES ('20140716104117');

INSERT INTO schema_migrations (version) VALUES ('20140803154250');

INSERT INTO schema_migrations (version) VALUES ('20140807113647');

INSERT INTO schema_migrations (version) VALUES ('20140809212006');

INSERT INTO schema_migrations (version) VALUES ('20140810083823');

INSERT INTO schema_migrations (version) VALUES ('20140810094352');

INSERT INTO schema_migrations (version) VALUES ('20140817135714');

INSERT INTO schema_migrations (version) VALUES ('20140817141834');

INSERT INTO schema_migrations (version) VALUES ('20140817191039');

INSERT INTO schema_migrations (version) VALUES ('20140817200735');

INSERT INTO schema_migrations (version) VALUES ('20140818101422');

INSERT INTO schema_migrations (version) VALUES ('20140818101937');

INSERT INTO schema_migrations (version) VALUES ('20140906125904');

INSERT INTO schema_migrations (version) VALUES ('20140906125940');

INSERT INTO schema_migrations (version) VALUES ('20140906190919');

INSERT INTO schema_migrations (version) VALUES ('20140906210740');

INSERT INTO schema_migrations (version) VALUES ('20140907195704');

INSERT INTO schema_migrations (version) VALUES ('20141004123130');

INSERT INTO schema_migrations (version) VALUES ('20141006104028');

INSERT INTO schema_migrations (version) VALUES ('20141022075500');

INSERT INTO schema_migrations (version) VALUES ('20141107152957');SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20130624135746');

INSERT INTO schema_migrations (version) VALUES ('20130624172343');

INSERT INTO schema_migrations (version) VALUES ('20130702142756');

INSERT INTO schema_migrations (version) VALUES ('20130702144914');

INSERT INTO schema_migrations (version) VALUES ('20130702145647');

INSERT INTO schema_migrations (version) VALUES ('20130703054428');

INSERT INTO schema_migrations (version) VALUES ('20130703164741');

INSERT INTO schema_migrations (version) VALUES ('20130709180050');

INSERT INTO schema_migrations (version) VALUES ('20130716192148');

INSERT INTO schema_migrations (version) VALUES ('20130721130759');

INSERT INTO schema_migrations (version) VALUES ('20130721130934');

INSERT INTO schema_migrations (version) VALUES ('20130721131537');

INSERT INTO schema_migrations (version) VALUES ('20130721134237');

INSERT INTO schema_migrations (version) VALUES ('20130721162718');

INSERT INTO schema_migrations (version) VALUES ('20130721163157');

INSERT INTO schema_migrations (version) VALUES ('20130721185750');

INSERT INTO schema_migrations (version) VALUES ('20130722140144');

INSERT INTO schema_migrations (version) VALUES ('20130722165714');

INSERT INTO schema_migrations (version) VALUES ('20130723170943');

INSERT INTO schema_migrations (version) VALUES ('20130723182033');

INSERT INTO schema_migrations (version) VALUES ('20130723184841');

INSERT INTO schema_migrations (version) VALUES ('20130729161906');

INSERT INTO schema_migrations (version) VALUES ('20130731172503');

INSERT INTO schema_migrations (version) VALUES ('20130810142802');

INSERT INTO schema_migrations (version) VALUES ('20130810142817');

INSERT INTO schema_migrations (version) VALUES ('20130810142829');

INSERT INTO schema_migrations (version) VALUES ('20130810142906');

INSERT INTO schema_migrations (version) VALUES ('20130810142945');

INSERT INTO schema_migrations (version) VALUES ('20130810143003');

INSERT INTO schema_migrations (version) VALUES ('20130810203719');

INSERT INTO schema_migrations (version) VALUES ('20130810211013');

INSERT INTO schema_migrations (version) VALUES ('20130811152637');

INSERT INTO schema_migrations (version) VALUES ('20130811154332');

INSERT INTO schema_migrations (version) VALUES ('20130815172348');

INSERT INTO schema_migrations (version) VALUES ('20130816174223');

INSERT INTO schema_migrations (version) VALUES ('20130816174407');

INSERT INTO schema_migrations (version) VALUES ('20130816180443');

INSERT INTO schema_migrations (version) VALUES ('20130817130913');

INSERT INTO schema_migrations (version) VALUES ('20130817131027');

INSERT INTO schema_migrations (version) VALUES ('20130817205708');

INSERT INTO schema_migrations (version) VALUES ('20130823180123');

INSERT INTO schema_migrations (version) VALUES ('20130928183056');

INSERT INTO schema_migrations (version) VALUES ('20140308101924');

INSERT INTO schema_migrations (version) VALUES ('20140406081157');

INSERT INTO schema_migrations (version) VALUES ('20140623135233');

INSERT INTO schema_migrations (version) VALUES ('20140710112953');

INSERT INTO schema_migrations (version) VALUES ('20140715131017');

INSERT INTO schema_migrations (version) VALUES ('20140716104117');

INSERT INTO schema_migrations (version) VALUES ('20140803154250');

INSERT INTO schema_migrations (version) VALUES ('20140807113647');

INSERT INTO schema_migrations (version) VALUES ('20140809212006');

INSERT INTO schema_migrations (version) VALUES ('20140810083823');

INSERT INTO schema_migrations (version) VALUES ('20140810094352');

INSERT INTO schema_migrations (version) VALUES ('20140817135714');

INSERT INTO schema_migrations (version) VALUES ('20140817141834');

INSERT INTO schema_migrations (version) VALUES ('20140817191039');

INSERT INTO schema_migrations (version) VALUES ('20140817200735');

INSERT INTO schema_migrations (version) VALUES ('20140818101422');

INSERT INTO schema_migrations (version) VALUES ('20140818101937');

INSERT INTO schema_migrations (version) VALUES ('20140906125904');

INSERT INTO schema_migrations (version) VALUES ('20140906125940');

INSERT INTO schema_migrations (version) VALUES ('20140906190919');

INSERT INTO schema_migrations (version) VALUES ('20140906210740');

INSERT INTO schema_migrations (version) VALUES ('20140907195704');

INSERT INTO schema_migrations (version) VALUES ('20141004123130');

INSERT INTO schema_migrations (version) VALUES ('20141006104028');

INSERT INTO schema_migrations (version) VALUES ('20141022075500');

INSERT INTO schema_migrations (version) VALUES ('20141107152957');

INSERT INTO schema_migrations (version) VALUES ('20141117184430');

INSERT INTO schema_migrations (version) VALUES ('20141117184431');

INSERT INTO schema_migrations (version) VALUES ('20141117184432');

INSERT INTO schema_migrations (version) VALUES ('20141117184433');

INSERT INTO schema_migrations (version) VALUES ('20141118081705');

INSERT INTO schema_migrations (version) VALUES ('20141117184433');
SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20130624135746');

INSERT INTO schema_migrations (version) VALUES ('20130624172343');

INSERT INTO schema_migrations (version) VALUES ('20130702142756');

INSERT INTO schema_migrations (version) VALUES ('20130702144914');

INSERT INTO schema_migrations (version) VALUES ('20130702145647');

INSERT INTO schema_migrations (version) VALUES ('20130703054428');

INSERT INTO schema_migrations (version) VALUES ('20130703164741');

INSERT INTO schema_migrations (version) VALUES ('20130709180050');

INSERT INTO schema_migrations (version) VALUES ('20130716192148');

INSERT INTO schema_migrations (version) VALUES ('20130721130759');

INSERT INTO schema_migrations (version) VALUES ('20130721130934');

INSERT INTO schema_migrations (version) VALUES ('20130721131537');

INSERT INTO schema_migrations (version) VALUES ('20130721134237');

INSERT INTO schema_migrations (version) VALUES ('20130721162718');

INSERT INTO schema_migrations (version) VALUES ('20130721163157');

INSERT INTO schema_migrations (version) VALUES ('20130721185750');

INSERT INTO schema_migrations (version) VALUES ('20130722140144');

INSERT INTO schema_migrations (version) VALUES ('20130722165714');

INSERT INTO schema_migrations (version) VALUES ('20130723170943');

INSERT INTO schema_migrations (version) VALUES ('20130723182033');

INSERT INTO schema_migrations (version) VALUES ('20130723184841');

INSERT INTO schema_migrations (version) VALUES ('20130729161906');

INSERT INTO schema_migrations (version) VALUES ('20130731172503');

INSERT INTO schema_migrations (version) VALUES ('20130810142802');

INSERT INTO schema_migrations (version) VALUES ('20130810142817');

INSERT INTO schema_migrations (version) VALUES ('20130810142829');

INSERT INTO schema_migrations (version) VALUES ('20130810142906');

INSERT INTO schema_migrations (version) VALUES ('20130810142945');

INSERT INTO schema_migrations (version) VALUES ('20130810143003');

INSERT INTO schema_migrations (version) VALUES ('20130810203719');

INSERT INTO schema_migrations (version) VALUES ('20130810211013');

INSERT INTO schema_migrations (version) VALUES ('20130811152637');

INSERT INTO schema_migrations (version) VALUES ('20130811154332');

INSERT INTO schema_migrations (version) VALUES ('20130815172348');

INSERT INTO schema_migrations (version) VALUES ('20130816174223');

INSERT INTO schema_migrations (version) VALUES ('20130816174407');

INSERT INTO schema_migrations (version) VALUES ('20130816180443');

INSERT INTO schema_migrations (version) VALUES ('20130817130913');

INSERT INTO schema_migrations (version) VALUES ('20130817131027');

INSERT INTO schema_migrations (version) VALUES ('20130817205708');

INSERT INTO schema_migrations (version) VALUES ('20130823180123');

INSERT INTO schema_migrations (version) VALUES ('20130928183056');

INSERT INTO schema_migrations (version) VALUES ('20140308101924');

INSERT INTO schema_migrations (version) VALUES ('20140406081157');

INSERT INTO schema_migrations (version) VALUES ('20140623135233');

INSERT INTO schema_migrations (version) VALUES ('20140710112953');

INSERT INTO schema_migrations (version) VALUES ('20140715131017');

INSERT INTO schema_migrations (version) VALUES ('20140716104117');

INSERT INTO schema_migrations (version) VALUES ('20140803154250');

INSERT INTO schema_migrations (version) VALUES ('20140807113647');

INSERT INTO schema_migrations (version) VALUES ('20140809212006');

INSERT INTO schema_migrations (version) VALUES ('20140810083823');

INSERT INTO schema_migrations (version) VALUES ('20140810094352');

INSERT INTO schema_migrations (version) VALUES ('20140817135714');

INSERT INTO schema_migrations (version) VALUES ('20140817141834');

INSERT INTO schema_migrations (version) VALUES ('20140817191039');

INSERT INTO schema_migrations (version) VALUES ('20140817200735');

INSERT INTO schema_migrations (version) VALUES ('20140818101422');

INSERT INTO schema_migrations (version) VALUES ('20140818101937');

INSERT INTO schema_migrations (version) VALUES ('20140906125904');

INSERT INTO schema_migrations (version) VALUES ('20140906125940');

INSERT INTO schema_migrations (version) VALUES ('20140906190919');

INSERT INTO schema_migrations (version) VALUES ('20140906210740');

INSERT INTO schema_migrations (version) VALUES ('20140907195704');

INSERT INTO schema_migrations (version) VALUES ('20141004123130');

INSERT INTO schema_migrations (version) VALUES ('20141006104028');

INSERT INTO schema_migrations (version) VALUES ('20141022075500');

INSERT INTO schema_migrations (version) VALUES ('20141107152957');

INSERT INTO schema_migrations (version) VALUES ('20141117184430');

INSERT INTO schema_migrations (version) VALUES ('20141117184431');

INSERT INTO schema_migrations (version) VALUES ('20141117184432');

INSERT INTO schema_migrations (version) VALUES ('20141117184433');

INSERT INTO schema_migrations (version) VALUES ('20141118081705');

INSERT INTO schema_migrations (version) VALUES ('20141130090842');SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20130624135746');

INSERT INTO schema_migrations (version) VALUES ('20130624172343');

INSERT INTO schema_migrations (version) VALUES ('20130702142756');

INSERT INTO schema_migrations (version) VALUES ('20130702144914');

INSERT INTO schema_migrations (version) VALUES ('20130702145647');

INSERT INTO schema_migrations (version) VALUES ('20130703054428');

INSERT INTO schema_migrations (version) VALUES ('20130703164741');

INSERT INTO schema_migrations (version) VALUES ('20130709180050');

INSERT INTO schema_migrations (version) VALUES ('20130716192148');

INSERT INTO schema_migrations (version) VALUES ('20130721130759');

INSERT INTO schema_migrations (version) VALUES ('20130721130934');

INSERT INTO schema_migrations (version) VALUES ('20130721131537');

INSERT INTO schema_migrations (version) VALUES ('20130721134237');

INSERT INTO schema_migrations (version) VALUES ('20130721162718');

INSERT INTO schema_migrations (version) VALUES ('20130721163157');

INSERT INTO schema_migrations (version) VALUES ('20130721185750');

INSERT INTO schema_migrations (version) VALUES ('20130722140144');

INSERT INTO schema_migrations (version) VALUES ('20130722165714');

INSERT INTO schema_migrations (version) VALUES ('20130723170943');

INSERT INTO schema_migrations (version) VALUES ('20130723182033');

INSERT INTO schema_migrations (version) VALUES ('20130723184841');

INSERT INTO schema_migrations (version) VALUES ('20130729161906');

INSERT INTO schema_migrations (version) VALUES ('20130731172503');

INSERT INTO schema_migrations (version) VALUES ('20130810142802');

INSERT INTO schema_migrations (version) VALUES ('20130810142817');

INSERT INTO schema_migrations (version) VALUES ('20130810142829');

INSERT INTO schema_migrations (version) VALUES ('20130810142906');

INSERT INTO schema_migrations (version) VALUES ('20130810142945');

INSERT INTO schema_migrations (version) VALUES ('20130810143003');

INSERT INTO schema_migrations (version) VALUES ('20130810203719');

INSERT INTO schema_migrations (version) VALUES ('20130810211013');

INSERT INTO schema_migrations (version) VALUES ('20130811152637');

INSERT INTO schema_migrations (version) VALUES ('20130811154332');

INSERT INTO schema_migrations (version) VALUES ('20130815172348');

INSERT INTO schema_migrations (version) VALUES ('20130816174223');

INSERT INTO schema_migrations (version) VALUES ('20130816174407');

INSERT INTO schema_migrations (version) VALUES ('20130816180443');

INSERT INTO schema_migrations (version) VALUES ('20130817130913');

INSERT INTO schema_migrations (version) VALUES ('20130817131027');

INSERT INTO schema_migrations (version) VALUES ('20130817205708');

INSERT INTO schema_migrations (version) VALUES ('20130823180123');

INSERT INTO schema_migrations (version) VALUES ('20130928183056');

INSERT INTO schema_migrations (version) VALUES ('20140308101924');

INSERT INTO schema_migrations (version) VALUES ('20140406081157');

INSERT INTO schema_migrations (version) VALUES ('20140623135233');

INSERT INTO schema_migrations (version) VALUES ('20140710112953');

INSERT INTO schema_migrations (version) VALUES ('20140715131017');

INSERT INTO schema_migrations (version) VALUES ('20140716104117');

INSERT INTO schema_migrations (version) VALUES ('20140803154250');

INSERT INTO schema_migrations (version) VALUES ('20140807113647');

INSERT INTO schema_migrations (version) VALUES ('20140809212006');

INSERT INTO schema_migrations (version) VALUES ('20140810083823');

INSERT INTO schema_migrations (version) VALUES ('20140810094352');

INSERT INTO schema_migrations (version) VALUES ('20140817135714');

INSERT INTO schema_migrations (version) VALUES ('20140817141834');

INSERT INTO schema_migrations (version) VALUES ('20140817191039');

INSERT INTO schema_migrations (version) VALUES ('20140817200735');

INSERT INTO schema_migrations (version) VALUES ('20140818101422');

INSERT INTO schema_migrations (version) VALUES ('20140818101937');

INSERT INTO schema_migrations (version) VALUES ('20140906125904');

INSERT INTO schema_migrations (version) VALUES ('20140906125940');

INSERT INTO schema_migrations (version) VALUES ('20140906190919');

INSERT INTO schema_migrations (version) VALUES ('20140906210740');

INSERT INTO schema_migrations (version) VALUES ('20140907195704');

INSERT INTO schema_migrations (version) VALUES ('20141004123130');

INSERT INTO schema_migrations (version) VALUES ('20141006104028');

INSERT INTO schema_migrations (version) VALUES ('20141022075500');

INSERT INTO schema_migrations (version) VALUES ('20141107152957');

INSERT INTO schema_migrations (version) VALUES ('20141117184430');

INSERT INTO schema_migrations (version) VALUES ('20141117184431');

INSERT INTO schema_migrations (version) VALUES ('20141117184432');

INSERT INTO schema_migrations (version) VALUES ('20141117184433');

INSERT INTO schema_migrations (version) VALUES ('20141118081705');

INSERT INTO schema_migrations (version) VALUES ('20141130090842');SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20130624135746');

INSERT INTO schema_migrations (version) VALUES ('20130624172343');

INSERT INTO schema_migrations (version) VALUES ('20130702142756');

INSERT INTO schema_migrations (version) VALUES ('20130702144914');

INSERT INTO schema_migrations (version) VALUES ('20130702145647');

INSERT INTO schema_migrations (version) VALUES ('20130703054428');

INSERT INTO schema_migrations (version) VALUES ('20130703164741');

INSERT INTO schema_migrations (version) VALUES ('20130709180050');

INSERT INTO schema_migrations (version) VALUES ('20130716192148');

INSERT INTO schema_migrations (version) VALUES ('20130721130759');

INSERT INTO schema_migrations (version) VALUES ('20130721130934');

INSERT INTO schema_migrations (version) VALUES ('20130721131537');

INSERT INTO schema_migrations (version) VALUES ('20130721134237');

INSERT INTO schema_migrations (version) VALUES ('20130721162718');

INSERT INTO schema_migrations (version) VALUES ('20130721163157');

INSERT INTO schema_migrations (version) VALUES ('20130721185750');

INSERT INTO schema_migrations (version) VALUES ('20130722140144');

INSERT INTO schema_migrations (version) VALUES ('20130722165714');

INSERT INTO schema_migrations (version) VALUES ('20130723170943');

INSERT INTO schema_migrations (version) VALUES ('20130723182033');

INSERT INTO schema_migrations (version) VALUES ('20130723184841');

INSERT INTO schema_migrations (version) VALUES ('20130729161906');

INSERT INTO schema_migrations (version) VALUES ('20130731172503');

INSERT INTO schema_migrations (version) VALUES ('20130810142802');

INSERT INTO schema_migrations (version) VALUES ('20130810142817');

INSERT INTO schema_migrations (version) VALUES ('20130810142829');

INSERT INTO schema_migrations (version) VALUES ('20130810142906');

INSERT INTO schema_migrations (version) VALUES ('20130810142945');

INSERT INTO schema_migrations (version) VALUES ('20130810143003');

INSERT INTO schema_migrations (version) VALUES ('20130810203719');

INSERT INTO schema_migrations (version) VALUES ('20130810211013');

INSERT INTO schema_migrations (version) VALUES ('20130811152637');

INSERT INTO schema_migrations (version) VALUES ('20130811154332');

INSERT INTO schema_migrations (version) VALUES ('20130815172348');

INSERT INTO schema_migrations (version) VALUES ('20130816174223');

INSERT INTO schema_migrations (version) VALUES ('20130816174407');

INSERT INTO schema_migrations (version) VALUES ('20130816180443');

INSERT INTO schema_migrations (version) VALUES ('20130817130913');

INSERT INTO schema_migrations (version) VALUES ('20130817131027');

INSERT INTO schema_migrations (version) VALUES ('20130817205708');

INSERT INTO schema_migrations (version) VALUES ('20130823180123');

INSERT INTO schema_migrations (version) VALUES ('20130928183056');

INSERT INTO schema_migrations (version) VALUES ('20140308101924');

INSERT INTO schema_migrations (version) VALUES ('20140406081157');

INSERT INTO schema_migrations (version) VALUES ('20140623135233');

INSERT INTO schema_migrations (version) VALUES ('20140710112953');

INSERT INTO schema_migrations (version) VALUES ('20140715131017');

INSERT INTO schema_migrations (version) VALUES ('20140716104117');

INSERT INTO schema_migrations (version) VALUES ('20140803154250');

INSERT INTO schema_migrations (version) VALUES ('20140807113647');

INSERT INTO schema_migrations (version) VALUES ('20140809212006');

INSERT INTO schema_migrations (version) VALUES ('20140810083823');

INSERT INTO schema_migrations (version) VALUES ('20140810094352');

INSERT INTO schema_migrations (version) VALUES ('20140817135714');

INSERT INTO schema_migrations (version) VALUES ('20140817141834');

INSERT INTO schema_migrations (version) VALUES ('20140817191039');

INSERT INTO schema_migrations (version) VALUES ('20140817200735');

INSERT INTO schema_migrations (version) VALUES ('20140818101422');

INSERT INTO schema_migrations (version) VALUES ('20140818101937');

INSERT INTO schema_migrations (version) VALUES ('20140906125904');

INSERT INTO schema_migrations (version) VALUES ('20140906125940');

INSERT INTO schema_migrations (version) VALUES ('20140906190919');

INSERT INTO schema_migrations (version) VALUES ('20140906210740');

INSERT INTO schema_migrations (version) VALUES ('20140907195704');

INSERT INTO schema_migrations (version) VALUES ('20141004123130');

INSERT INTO schema_migrations (version) VALUES ('20141006104028');

INSERT INTO schema_migrations (version) VALUES ('20141022075500');

INSERT INTO schema_migrations (version) VALUES ('20141107152957');

INSERT INTO schema_migrations (version) VALUES ('20141117184430');

INSERT INTO schema_migrations (version) VALUES ('20141117184431');

INSERT INTO schema_migrations (version) VALUES ('20141117184432');

INSERT INTO schema_migrations (version) VALUES ('20141117184433');

INSERT INTO schema_migrations (version) VALUES ('20141118081705');

INSERT INTO schema_migrations (version) VALUES ('20141130090842');

INSERT INTO schema_migrations (version) VALUES ('20141222124906');

INSERT INTO schema_migrations (version) VALUES ('20141222124925');

INSERT INTO schema_migrations (version) VALUES ('20141222125008');SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20130624135746');

INSERT INTO schema_migrations (version) VALUES ('20130624172343');

INSERT INTO schema_migrations (version) VALUES ('20130702142756');

INSERT INTO schema_migrations (version) VALUES ('20130702144914');

INSERT INTO schema_migrations (version) VALUES ('20130702145647');

INSERT INTO schema_migrations (version) VALUES ('20130703054428');

INSERT INTO schema_migrations (version) VALUES ('20130703164741');

INSERT INTO schema_migrations (version) VALUES ('20130709180050');

INSERT INTO schema_migrations (version) VALUES ('20130716192148');

INSERT INTO schema_migrations (version) VALUES ('20130721130759');

INSERT INTO schema_migrations (version) VALUES ('20130721130934');

INSERT INTO schema_migrations (version) VALUES ('20130721131537');

INSERT INTO schema_migrations (version) VALUES ('20130721134237');

INSERT INTO schema_migrations (version) VALUES ('20130721162718');

INSERT INTO schema_migrations (version) VALUES ('20130721163157');

INSERT INTO schema_migrations (version) VALUES ('20130721185750');

INSERT INTO schema_migrations (version) VALUES ('20130722140144');

INSERT INTO schema_migrations (version) VALUES ('20130722165714');

INSERT INTO schema_migrations (version) VALUES ('20130723170943');

INSERT INTO schema_migrations (version) VALUES ('20130723182033');

INSERT INTO schema_migrations (version) VALUES ('20130723184841');

INSERT INTO schema_migrations (version) VALUES ('20130729161906');

INSERT INTO schema_migrations (version) VALUES ('20130731172503');

INSERT INTO schema_migrations (version) VALUES ('20130810142802');

INSERT INTO schema_migrations (version) VALUES ('20130810142817');

INSERT INTO schema_migrations (version) VALUES ('20130810142829');

INSERT INTO schema_migrations (version) VALUES ('20130810142906');

INSERT INTO schema_migrations (version) VALUES ('20130810142945');

INSERT INTO schema_migrations (version) VALUES ('20130810143003');

INSERT INTO schema_migrations (version) VALUES ('20130810203719');

INSERT INTO schema_migrations (version) VALUES ('20130810211013');

INSERT INTO schema_migrations (version) VALUES ('20130811152637');

INSERT INTO schema_migrations (version) VALUES ('20130811154332');

INSERT INTO schema_migrations (version) VALUES ('20130815172348');

INSERT INTO schema_migrations (version) VALUES ('20130816174223');

INSERT INTO schema_migrations (version) VALUES ('20130816174407');

INSERT INTO schema_migrations (version) VALUES ('20130816180443');

INSERT INTO schema_migrations (version) VALUES ('20130817130913');

INSERT INTO schema_migrations (version) VALUES ('20130817131027');

INSERT INTO schema_migrations (version) VALUES ('20130817205708');

INSERT INTO schema_migrations (version) VALUES ('20130823180123');

INSERT INTO schema_migrations (version) VALUES ('20130928183056');

INSERT INTO schema_migrations (version) VALUES ('20140308101924');

INSERT INTO schema_migrations (version) VALUES ('20140406081157');

INSERT INTO schema_migrations (version) VALUES ('20140623135233');

INSERT INTO schema_migrations (version) VALUES ('20140710112953');

INSERT INTO schema_migrations (version) VALUES ('20140715131017');

INSERT INTO schema_migrations (version) VALUES ('20140716104117');

INSERT INTO schema_migrations (version) VALUES ('20140803154250');

INSERT INTO schema_migrations (version) VALUES ('20140807113647');

INSERT INTO schema_migrations (version) VALUES ('20140809212006');

INSERT INTO schema_migrations (version) VALUES ('20140810083823');

INSERT INTO schema_migrations (version) VALUES ('20140810094352');

INSERT INTO schema_migrations (version) VALUES ('20140817135714');

INSERT INTO schema_migrations (version) VALUES ('20140817141834');

INSERT INTO schema_migrations (version) VALUES ('20140817191039');

INSERT INTO schema_migrations (version) VALUES ('20140817200735');

INSERT INTO schema_migrations (version) VALUES ('20140818101422');

INSERT INTO schema_migrations (version) VALUES ('20140818101937');

INSERT INTO schema_migrations (version) VALUES ('20140906125904');

INSERT INTO schema_migrations (version) VALUES ('20140906125940');

INSERT INTO schema_migrations (version) VALUES ('20140906190919');

INSERT INTO schema_migrations (version) VALUES ('20140906210740');

INSERT INTO schema_migrations (version) VALUES ('20140907195704');

INSERT INTO schema_migrations (version) VALUES ('20141004123130');

INSERT INTO schema_migrations (version) VALUES ('20141006104028');

INSERT INTO schema_migrations (version) VALUES ('20141022075500');

INSERT INTO schema_migrations (version) VALUES ('20141107152957');

INSERT INTO schema_migrations (version) VALUES ('20141117184430');

INSERT INTO schema_migrations (version) VALUES ('20141117184431');

INSERT INTO schema_migrations (version) VALUES ('20141117184432');

INSERT INTO schema_migrations (version) VALUES ('20141117184433');

INSERT INTO schema_migrations (version) VALUES ('20141118081705');

INSERT INTO schema_migrations (version) VALUES ('20141130090842');

INSERT INTO schema_migrations (version) VALUES ('20141222124906');

INSERT INTO schema_migrations (version) VALUES ('20141222124925');

INSERT INTO schema_migrations (version) VALUES ('20141222125008');SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20130624135746');

INSERT INTO schema_migrations (version) VALUES ('20130624172343');

INSERT INTO schema_migrations (version) VALUES ('20130702142756');

INSERT INTO schema_migrations (version) VALUES ('20130702144914');

INSERT INTO schema_migrations (version) VALUES ('20130702145647');

INSERT INTO schema_migrations (version) VALUES ('20130703054428');

INSERT INTO schema_migrations (version) VALUES ('20130703164741');

INSERT INTO schema_migrations (version) VALUES ('20130709180050');

INSERT INTO schema_migrations (version) VALUES ('20130716192148');

INSERT INTO schema_migrations (version) VALUES ('20130721130759');

INSERT INTO schema_migrations (version) VALUES ('20130721130934');

INSERT INTO schema_migrations (version) VALUES ('20130721131537');

INSERT INTO schema_migrations (version) VALUES ('20130721134237');

INSERT INTO schema_migrations (version) VALUES ('20130721162718');

INSERT INTO schema_migrations (version) VALUES ('20130721163157');

INSERT INTO schema_migrations (version) VALUES ('20130721185750');

INSERT INTO schema_migrations (version) VALUES ('20130722140144');

INSERT INTO schema_migrations (version) VALUES ('20130722165714');

INSERT INTO schema_migrations (version) VALUES ('20130723170943');

INSERT INTO schema_migrations (version) VALUES ('20130723182033');

INSERT INTO schema_migrations (version) VALUES ('20130723184841');

INSERT INTO schema_migrations (version) VALUES ('20130729161906');

INSERT INTO schema_migrations (version) VALUES ('20130731172503');

INSERT INTO schema_migrations (version) VALUES ('20130810142802');

INSERT INTO schema_migrations (version) VALUES ('20130810142817');

INSERT INTO schema_migrations (version) VALUES ('20130810142829');

INSERT INTO schema_migrations (version) VALUES ('20130810142906');

INSERT INTO schema_migrations (version) VALUES ('20130810142945');

INSERT INTO schema_migrations (version) VALUES ('20130810143003');

INSERT INTO schema_migrations (version) VALUES ('20130810203719');

INSERT INTO schema_migrations (version) VALUES ('20130810211013');

INSERT INTO schema_migrations (version) VALUES ('20130811152637');

INSERT INTO schema_migrations (version) VALUES ('20130811154332');

INSERT INTO schema_migrations (version) VALUES ('20130815172348');

INSERT INTO schema_migrations (version) VALUES ('20130816174223');

INSERT INTO schema_migrations (version) VALUES ('20130816174407');

INSERT INTO schema_migrations (version) VALUES ('20130816180443');

INSERT INTO schema_migrations (version) VALUES ('20130817130913');

INSERT INTO schema_migrations (version) VALUES ('20130817131027');

INSERT INTO schema_migrations (version) VALUES ('20130817205708');

INSERT INTO schema_migrations (version) VALUES ('20130823180123');

INSERT INTO schema_migrations (version) VALUES ('20130928183056');

INSERT INTO schema_migrations (version) VALUES ('20140308101924');

INSERT INTO schema_migrations (version) VALUES ('20140406081157');

INSERT INTO schema_migrations (version) VALUES ('20140623135233');

INSERT INTO schema_migrations (version) VALUES ('20140710112953');

INSERT INTO schema_migrations (version) VALUES ('20140715131017');

INSERT INTO schema_migrations (version) VALUES ('20140716104117');

INSERT INTO schema_migrations (version) VALUES ('20140803154250');

INSERT INTO schema_migrations (version) VALUES ('20140807113647');

INSERT INTO schema_migrations (version) VALUES ('20140809212006');

INSERT INTO schema_migrations (version) VALUES ('20140810083823');

INSERT INTO schema_migrations (version) VALUES ('20140810094352');

INSERT INTO schema_migrations (version) VALUES ('20140817135714');

INSERT INTO schema_migrations (version) VALUES ('20140817141834');

INSERT INTO schema_migrations (version) VALUES ('20140817191039');

INSERT INTO schema_migrations (version) VALUES ('20140817200735');

INSERT INTO schema_migrations (version) VALUES ('20140818101422');

INSERT INTO schema_migrations (version) VALUES ('20140818101937');

INSERT INTO schema_migrations (version) VALUES ('20140906125904');

INSERT INTO schema_migrations (version) VALUES ('20140906125940');

INSERT INTO schema_migrations (version) VALUES ('20140906190919');

INSERT INTO schema_migrations (version) VALUES ('20140906210740');

INSERT INTO schema_migrations (version) VALUES ('20140907195704');

INSERT INTO schema_migrations (version) VALUES ('20141004123130');

INSERT INTO schema_migrations (version) VALUES ('20141006104028');

INSERT INTO schema_migrations (version) VALUES ('20141022075500');

INSERT INTO schema_migrations (version) VALUES ('20141107152957');

INSERT INTO schema_migrations (version) VALUES ('20141117184430');

INSERT INTO schema_migrations (version) VALUES ('20141117184431');

INSERT INTO schema_migrations (version) VALUES ('20141117184432');

INSERT INTO schema_migrations (version) VALUES ('20141117184433');

INSERT INTO schema_migrations (version) VALUES ('20141118081705');

INSERT INTO schema_migrations (version) VALUES ('20141130090842');

INSERT INTO schema_migrations (version) VALUES ('20141222124906');

INSERT INTO schema_migrations (version) VALUES ('20141222124925');

INSERT INTO schema_migrations (version) VALUES ('20141222125008');

INSERT INTO schema_migrations (version) VALUES ('20150122155014');SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20130624135746');

INSERT INTO schema_migrations (version) VALUES ('20130624172343');

INSERT INTO schema_migrations (version) VALUES ('20130702142756');

INSERT INTO schema_migrations (version) VALUES ('20130702144914');

INSERT INTO schema_migrations (version) VALUES ('20130702145647');

INSERT INTO schema_migrations (version) VALUES ('20130703054428');

INSERT INTO schema_migrations (version) VALUES ('20130703164741');

INSERT INTO schema_migrations (version) VALUES ('20130709180050');

INSERT INTO schema_migrations (version) VALUES ('20130716192148');

INSERT INTO schema_migrations (version) VALUES ('20130721130759');

INSERT INTO schema_migrations (version) VALUES ('20130721130934');

INSERT INTO schema_migrations (version) VALUES ('20130721131537');

INSERT INTO schema_migrations (version) VALUES ('20130721134237');

INSERT INTO schema_migrations (version) VALUES ('20130721162718');

INSERT INTO schema_migrations (version) VALUES ('20130721163157');

INSERT INTO schema_migrations (version) VALUES ('20130721185750');

INSERT INTO schema_migrations (version) VALUES ('20130722140144');

INSERT INTO schema_migrations (version) VALUES ('20130722165714');

INSERT INTO schema_migrations (version) VALUES ('20130723170943');

INSERT INTO schema_migrations (version) VALUES ('20130723182033');

INSERT INTO schema_migrations (version) VALUES ('20130723184841');

INSERT INTO schema_migrations (version) VALUES ('20130729161906');

INSERT INTO schema_migrations (version) VALUES ('20130731172503');

INSERT INTO schema_migrations (version) VALUES ('20130810142802');

INSERT INTO schema_migrations (version) VALUES ('20130810142817');

INSERT INTO schema_migrations (version) VALUES ('20130810142829');

INSERT INTO schema_migrations (version) VALUES ('20130810142906');

INSERT INTO schema_migrations (version) VALUES ('20130810142945');

INSERT INTO schema_migrations (version) VALUES ('20130810143003');

INSERT INTO schema_migrations (version) VALUES ('20130810203719');

INSERT INTO schema_migrations (version) VALUES ('20130810211013');

INSERT INTO schema_migrations (version) VALUES ('20130811152637');

INSERT INTO schema_migrations (version) VALUES ('20130811154332');

INSERT INTO schema_migrations (version) VALUES ('20130815172348');

INSERT INTO schema_migrations (version) VALUES ('20130816174223');

INSERT INTO schema_migrations (version) VALUES ('20130816174407');

INSERT INTO schema_migrations (version) VALUES ('20130816180443');

INSERT INTO schema_migrations (version) VALUES ('20130817130913');

INSERT INTO schema_migrations (version) VALUES ('20130817131027');

INSERT INTO schema_migrations (version) VALUES ('20130817205708');

INSERT INTO schema_migrations (version) VALUES ('20130823180123');

INSERT INTO schema_migrations (version) VALUES ('20130928183056');

INSERT INTO schema_migrations (version) VALUES ('20140308101924');

INSERT INTO schema_migrations (version) VALUES ('20140406081157');

INSERT INTO schema_migrations (version) VALUES ('20140623135233');

INSERT INTO schema_migrations (version) VALUES ('20140710112953');

INSERT INTO schema_migrations (version) VALUES ('20140715131017');

INSERT INTO schema_migrations (version) VALUES ('20140716104117');

INSERT INTO schema_migrations (version) VALUES ('20140803154250');

INSERT INTO schema_migrations (version) VALUES ('20140807113647');

INSERT INTO schema_migrations (version) VALUES ('20140809212006');

INSERT INTO schema_migrations (version) VALUES ('20140810083823');

INSERT INTO schema_migrations (version) VALUES ('20140810094352');

INSERT INTO schema_migrations (version) VALUES ('20140817135714');

INSERT INTO schema_migrations (version) VALUES ('20140817141834');

INSERT INTO schema_migrations (version) VALUES ('20140817191039');

INSERT INTO schema_migrations (version) VALUES ('20140817200735');

INSERT INTO schema_migrations (version) VALUES ('20140818101422');

INSERT INTO schema_migrations (version) VALUES ('20140818101937');

INSERT INTO schema_migrations (version) VALUES ('20140906125904');

INSERT INTO schema_migrations (version) VALUES ('20140906125940');

INSERT INTO schema_migrations (version) VALUES ('20140906190919');

INSERT INTO schema_migrations (version) VALUES ('20140906210740');

INSERT INTO schema_migrations (version) VALUES ('20140907195704');

INSERT INTO schema_migrations (version) VALUES ('20141004123130');

INSERT INTO schema_migrations (version) VALUES ('20141006104028');

INSERT INTO schema_migrations (version) VALUES ('20141022075500');

INSERT INTO schema_migrations (version) VALUES ('20141107152957');

INSERT INTO schema_migrations (version) VALUES ('20141117184430');

INSERT INTO schema_migrations (version) VALUES ('20141117184431');

INSERT INTO schema_migrations (version) VALUES ('20141117184432');

INSERT INTO schema_migrations (version) VALUES ('20141117184433');

INSERT INTO schema_migrations (version) VALUES ('20141118081705');

INSERT INTO schema_migrations (version) VALUES ('20141130090842');

INSERT INTO schema_migrations (version) VALUES ('20141222124906');

INSERT INTO schema_migrations (version) VALUES ('20141222124925');

INSERT INTO schema_migrations (version) VALUES ('20141222125008');

INSERT INTO schema_migrations (version) VALUES ('20150122155014');

INSERT INTO schema_migrations (version) VALUES ('20150130113732');SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20130624135746');

INSERT INTO schema_migrations (version) VALUES ('20130624172343');

INSERT INTO schema_migrations (version) VALUES ('20130702142756');

INSERT INTO schema_migrations (version) VALUES ('20130702144914');

INSERT INTO schema_migrations (version) VALUES ('20130702145647');

INSERT INTO schema_migrations (version) VALUES ('20130703054428');

INSERT INTO schema_migrations (version) VALUES ('20130703164741');

INSERT INTO schema_migrations (version) VALUES ('20130709180050');

INSERT INTO schema_migrations (version) VALUES ('20130716192148');

INSERT INTO schema_migrations (version) VALUES ('20130721130759');

INSERT INTO schema_migrations (version) VALUES ('20130721130934');

INSERT INTO schema_migrations (version) VALUES ('20130721131537');

INSERT INTO schema_migrations (version) VALUES ('20130721134237');

INSERT INTO schema_migrations (version) VALUES ('20130721162718');

INSERT INTO schema_migrations (version) VALUES ('20130721163157');

INSERT INTO schema_migrations (version) VALUES ('20130721185750');

INSERT INTO schema_migrations (version) VALUES ('20130722140144');

INSERT INTO schema_migrations (version) VALUES ('20130722165714');

INSERT INTO schema_migrations (version) VALUES ('20130723170943');

INSERT INTO schema_migrations (version) VALUES ('20130723182033');

INSERT INTO schema_migrations (version) VALUES ('20130723184841');

INSERT INTO schema_migrations (version) VALUES ('20130729161906');

INSERT INTO schema_migrations (version) VALUES ('20130731172503');

INSERT INTO schema_migrations (version) VALUES ('20130810142802');

INSERT INTO schema_migrations (version) VALUES ('20130810142817');

INSERT INTO schema_migrations (version) VALUES ('20130810142829');

INSERT INTO schema_migrations (version) VALUES ('20130810142906');

INSERT INTO schema_migrations (version) VALUES ('20130810142945');

INSERT INTO schema_migrations (version) VALUES ('20130810143003');

INSERT INTO schema_migrations (version) VALUES ('20130810203719');

INSERT INTO schema_migrations (version) VALUES ('20130810211013');

INSERT INTO schema_migrations (version) VALUES ('20130811152637');

INSERT INTO schema_migrations (version) VALUES ('20130811154332');

INSERT INTO schema_migrations (version) VALUES ('20130815172348');

INSERT INTO schema_migrations (version) VALUES ('20130816174223');

INSERT INTO schema_migrations (version) VALUES ('20130816174407');

INSERT INTO schema_migrations (version) VALUES ('20130816180443');

INSERT INTO schema_migrations (version) VALUES ('20130817130913');

INSERT INTO schema_migrations (version) VALUES ('20130817131027');

INSERT INTO schema_migrations (version) VALUES ('20130817205708');

INSERT INTO schema_migrations (version) VALUES ('20130823180123');

INSERT INTO schema_migrations (version) VALUES ('20130928183056');

INSERT INTO schema_migrations (version) VALUES ('20140308101924');

INSERT INTO schema_migrations (version) VALUES ('20140406081157');

INSERT INTO schema_migrations (version) VALUES ('20140623135233');

INSERT INTO schema_migrations (version) VALUES ('20140710112953');

INSERT INTO schema_migrations (version) VALUES ('20140715131017');

INSERT INTO schema_migrations (version) VALUES ('20140716104117');

INSERT INTO schema_migrations (version) VALUES ('20140803154250');

INSERT INTO schema_migrations (version) VALUES ('20140807113647');

INSERT INTO schema_migrations (version) VALUES ('20140809212006');

INSERT INTO schema_migrations (version) VALUES ('20140810083823');

INSERT INTO schema_migrations (version) VALUES ('20140810094352');

INSERT INTO schema_migrations (version) VALUES ('20140817135714');

INSERT INTO schema_migrations (version) VALUES ('20140817141834');

INSERT INTO schema_migrations (version) VALUES ('20140817191039');

INSERT INTO schema_migrations (version) VALUES ('20140817200735');

INSERT INTO schema_migrations (version) VALUES ('20140818101422');

INSERT INTO schema_migrations (version) VALUES ('20140818101937');

INSERT INTO schema_migrations (version) VALUES ('20140906125904');

INSERT INTO schema_migrations (version) VALUES ('20140906125940');

INSERT INTO schema_migrations (version) VALUES ('20140906190919');

INSERT INTO schema_migrations (version) VALUES ('20140906210740');

INSERT INTO schema_migrations (version) VALUES ('20140907195704');

INSERT INTO schema_migrations (version) VALUES ('20141004123130');

INSERT INTO schema_migrations (version) VALUES ('20141006104028');

INSERT INTO schema_migrations (version) VALUES ('20141022075500');

INSERT INTO schema_migrations (version) VALUES ('20141107152957');

INSERT INTO schema_migrations (version) VALUES ('20141117184430');

INSERT INTO schema_migrations (version) VALUES ('20141117184431');

INSERT INTO schema_migrations (version) VALUES ('20141117184432');

INSERT INTO schema_migrations (version) VALUES ('20141117184433');

INSERT INTO schema_migrations (version) VALUES ('20141118081705');

INSERT INTO schema_migrations (version) VALUES ('20141130090842');

INSERT INTO schema_migrations (version) VALUES ('20141222124906');

INSERT INTO schema_migrations (version) VALUES ('20141222124925');

INSERT INTO schema_migrations (version) VALUES ('20141222125008');

INSERT INTO schema_migrations (version) VALUES ('20150122155014');SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20130624135746');

INSERT INTO schema_migrations (version) VALUES ('20130624172343');

INSERT INTO schema_migrations (version) VALUES ('20130702142756');

INSERT INTO schema_migrations (version) VALUES ('20130702144914');

INSERT INTO schema_migrations (version) VALUES ('20130702145647');

INSERT INTO schema_migrations (version) VALUES ('20130703054428');

INSERT INTO schema_migrations (version) VALUES ('20130703164741');

INSERT INTO schema_migrations (version) VALUES ('20130709180050');

INSERT INTO schema_migrations (version) VALUES ('20130716192148');

INSERT INTO schema_migrations (version) VALUES ('20130721130759');

INSERT INTO schema_migrations (version) VALUES ('20130721130934');

INSERT INTO schema_migrations (version) VALUES ('20130721131537');

INSERT INTO schema_migrations (version) VALUES ('20130721134237');

INSERT INTO schema_migrations (version) VALUES ('20130721162718');

INSERT INTO schema_migrations (version) VALUES ('20130721163157');

INSERT INTO schema_migrations (version) VALUES ('20130721185750');

INSERT INTO schema_migrations (version) VALUES ('20130722140144');

INSERT INTO schema_migrations (version) VALUES ('20130722165714');

INSERT INTO schema_migrations (version) VALUES ('20130723170943');

INSERT INTO schema_migrations (version) VALUES ('20130723182033');

INSERT INTO schema_migrations (version) VALUES ('20130723184841');

INSERT INTO schema_migrations (version) VALUES ('20130729161906');

INSERT INTO schema_migrations (version) VALUES ('20130731172503');

INSERT INTO schema_migrations (version) VALUES ('20130810142802');

INSERT INTO schema_migrations (version) VALUES ('20130810142817');

INSERT INTO schema_migrations (version) VALUES ('20130810142829');

INSERT INTO schema_migrations (version) VALUES ('20130810142906');

INSERT INTO schema_migrations (version) VALUES ('20130810142945');

INSERT INTO schema_migrations (version) VALUES ('20130810143003');

INSERT INTO schema_migrations (version) VALUES ('20130810203719');

INSERT INTO schema_migrations (version) VALUES ('20130810211013');

INSERT INTO schema_migrations (version) VALUES ('20130811152637');

INSERT INTO schema_migrations (version) VALUES ('20130811154332');

INSERT INTO schema_migrations (version) VALUES ('20130815172348');

INSERT INTO schema_migrations (version) VALUES ('20130816174223');

INSERT INTO schema_migrations (version) VALUES ('20130816174407');

INSERT INTO schema_migrations (version) VALUES ('20130816180443');

INSERT INTO schema_migrations (version) VALUES ('20130817130913');

INSERT INTO schema_migrations (version) VALUES ('20130817131027');

INSERT INTO schema_migrations (version) VALUES ('20130817205708');

INSERT INTO schema_migrations (version) VALUES ('20130823180123');

INSERT INTO schema_migrations (version) VALUES ('20130928183056');

INSERT INTO schema_migrations (version) VALUES ('20140308101924');

INSERT INTO schema_migrations (version) VALUES ('20140406081157');

INSERT INTO schema_migrations (version) VALUES ('20140623135233');

INSERT INTO schema_migrations (version) VALUES ('20140710112953');

INSERT INTO schema_migrations (version) VALUES ('20140715131017');

INSERT INTO schema_migrations (version) VALUES ('20140716104117');

INSERT INTO schema_migrations (version) VALUES ('20140803154250');

INSERT INTO schema_migrations (version) VALUES ('20140807113647');

INSERT INTO schema_migrations (version) VALUES ('20140809212006');

INSERT INTO schema_migrations (version) VALUES ('20140810083823');

INSERT INTO schema_migrations (version) VALUES ('20140810094352');

INSERT INTO schema_migrations (version) VALUES ('20140817135714');

INSERT INTO schema_migrations (version) VALUES ('20140817141834');

INSERT INTO schema_migrations (version) VALUES ('20140817191039');

INSERT INTO schema_migrations (version) VALUES ('20140817200735');

INSERT INTO schema_migrations (version) VALUES ('20140818101422');

INSERT INTO schema_migrations (version) VALUES ('20140818101937');

INSERT INTO schema_migrations (version) VALUES ('20140906125904');

INSERT INTO schema_migrations (version) VALUES ('20140906125940');

INSERT INTO schema_migrations (version) VALUES ('20140906190919');

INSERT INTO schema_migrations (version) VALUES ('20140906210740');

INSERT INTO schema_migrations (version) VALUES ('20140907195704');

INSERT INTO schema_migrations (version) VALUES ('20141004123130');

INSERT INTO schema_migrations (version) VALUES ('20141006104028');

INSERT INTO schema_migrations (version) VALUES ('20141022075500');

INSERT INTO schema_migrations (version) VALUES ('20141107152957');

INSERT INTO schema_migrations (version) VALUES ('20141117184430');

INSERT INTO schema_migrations (version) VALUES ('20141117184431');

INSERT INTO schema_migrations (version) VALUES ('20141117184432');

INSERT INTO schema_migrations (version) VALUES ('20141117184433');

INSERT INTO schema_migrations (version) VALUES ('20141118081705');

INSERT INTO schema_migrations (version) VALUES ('20141130090842');

INSERT INTO schema_migrations (version) VALUES ('20141222124906');

INSERT INTO schema_migrations (version) VALUES ('20141222124925');

INSERT INTO schema_migrations (version) VALUES ('20141222125008');

INSERT INTO schema_migrations (version) VALUES ('20150122155014');

INSERT INTO schema_migrations (version) VALUES ('20150130113732');SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20130624135746');

INSERT INTO schema_migrations (version) VALUES ('20130624172343');

INSERT INTO schema_migrations (version) VALUES ('20130702142756');

INSERT INTO schema_migrations (version) VALUES ('20130702144914');

INSERT INTO schema_migrations (version) VALUES ('20130702145647');

INSERT INTO schema_migrations (version) VALUES ('20130703054428');

INSERT INTO schema_migrations (version) VALUES ('20130703164741');

INSERT INTO schema_migrations (version) VALUES ('20130709180050');

INSERT INTO schema_migrations (version) VALUES ('20130716192148');

INSERT INTO schema_migrations (version) VALUES ('20130721130759');

INSERT INTO schema_migrations (version) VALUES ('20130721130934');

INSERT INTO schema_migrations (version) VALUES ('20130721131537');

INSERT INTO schema_migrations (version) VALUES ('20130721134237');

INSERT INTO schema_migrations (version) VALUES ('20130721162718');

INSERT INTO schema_migrations (version) VALUES ('20130721163157');

INSERT INTO schema_migrations (version) VALUES ('20130721185750');

INSERT INTO schema_migrations (version) VALUES ('20130722140144');

INSERT INTO schema_migrations (version) VALUES ('20130722165714');

INSERT INTO schema_migrations (version) VALUES ('20130723170943');

INSERT INTO schema_migrations (version) VALUES ('20130723182033');

INSERT INTO schema_migrations (version) VALUES ('20130723184841');

INSERT INTO schema_migrations (version) VALUES ('20130729161906');

INSERT INTO schema_migrations (version) VALUES ('20130731172503');

INSERT INTO schema_migrations (version) VALUES ('20130810142802');

INSERT INTO schema_migrations (version) VALUES ('20130810142817');

INSERT INTO schema_migrations (version) VALUES ('20130810142829');

INSERT INTO schema_migrations (version) VALUES ('20130810142906');

INSERT INTO schema_migrations (version) VALUES ('20130810142945');

INSERT INTO schema_migrations (version) VALUES ('20130810143003');

INSERT INTO schema_migrations (version) VALUES ('20130810203719');

INSERT INTO schema_migrations (version) VALUES ('20130810211013');

INSERT INTO schema_migrations (version) VALUES ('20130811152637');

INSERT INTO schema_migrations (version) VALUES ('20130811154332');

INSERT INTO schema_migrations (version) VALUES ('20130815172348');

INSERT INTO schema_migrations (version) VALUES ('20130816174223');

INSERT INTO schema_migrations (version) VALUES ('20130816174407');

INSERT INTO schema_migrations (version) VALUES ('20130816180443');

INSERT INTO schema_migrations (version) VALUES ('20130817130913');

INSERT INTO schema_migrations (version) VALUES ('20130817131027');

INSERT INTO schema_migrations (version) VALUES ('20130817205708');

INSERT INTO schema_migrations (version) VALUES ('20130823180123');

INSERT INTO schema_migrations (version) VALUES ('20130928183056');

INSERT INTO schema_migrations (version) VALUES ('20140308101924');

INSERT INTO schema_migrations (version) VALUES ('20140406081157');

INSERT INTO schema_migrations (version) VALUES ('20140623135233');

INSERT INTO schema_migrations (version) VALUES ('20140710112953');

INSERT INTO schema_migrations (version) VALUES ('20140715131017');

INSERT INTO schema_migrations (version) VALUES ('20140716104117');

INSERT INTO schema_migrations (version) VALUES ('20140803154250');

INSERT INTO schema_migrations (version) VALUES ('20140807113647');

INSERT INTO schema_migrations (version) VALUES ('20140809212006');

INSERT INTO schema_migrations (version) VALUES ('20140810083823');

INSERT INTO schema_migrations (version) VALUES ('20140810094352');

INSERT INTO schema_migrations (version) VALUES ('20140817135714');

INSERT INTO schema_migrations (version) VALUES ('20140817141834');

INSERT INTO schema_migrations (version) VALUES ('20140817191039');

INSERT INTO schema_migrations (version) VALUES ('20140817200735');

INSERT INTO schema_migrations (version) VALUES ('20140818101422');

INSERT INTO schema_migrations (version) VALUES ('20140818101937');

INSERT INTO schema_migrations (version) VALUES ('20140906125904');

INSERT INTO schema_migrations (version) VALUES ('20140906125940');

INSERT INTO schema_migrations (version) VALUES ('20140906190919');

INSERT INTO schema_migrations (version) VALUES ('20140906210740');

INSERT INTO schema_migrations (version) VALUES ('20140907195704');

INSERT INTO schema_migrations (version) VALUES ('20141004123130');

INSERT INTO schema_migrations (version) VALUES ('20141006104028');

INSERT INTO schema_migrations (version) VALUES ('20141022075500');

INSERT INTO schema_migrations (version) VALUES ('20141107152957');

INSERT INTO schema_migrations (version) VALUES ('20141117184430');

INSERT INTO schema_migrations (version) VALUES ('20141117184431');

INSERT INTO schema_migrations (version) VALUES ('20141117184432');

INSERT INTO schema_migrations (version) VALUES ('20141117184433');

INSERT INTO schema_migrations (version) VALUES ('20141118081705');

INSERT INTO schema_migrations (version) VALUES ('20141130090842');

INSERT INTO schema_migrations (version) VALUES ('20141222124906');

INSERT INTO schema_migrations (version) VALUES ('20141222124925');

INSERT INTO schema_migrations (version) VALUES ('20141222125008');

INSERT INTO schema_migrations (version) VALUES ('20150122155014');

INSERT INTO schema_migrations (version) VALUES ('20150130113732');

INSERT INTO schema_migrations (version) VALUES ('20150209080254');SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20130624135746');

INSERT INTO schema_migrations (version) VALUES ('20130624172343');

INSERT INTO schema_migrations (version) VALUES ('20130702142756');

INSERT INTO schema_migrations (version) VALUES ('20130702144914');

INSERT INTO schema_migrations (version) VALUES ('20130702145647');

INSERT INTO schema_migrations (version) VALUES ('20130703054428');

INSERT INTO schema_migrations (version) VALUES ('20130703164741');

INSERT INTO schema_migrations (version) VALUES ('20130709180050');

INSERT INTO schema_migrations (version) VALUES ('20130716192148');

INSERT INTO schema_migrations (version) VALUES ('20130721130759');

INSERT INTO schema_migrations (version) VALUES ('20130721130934');

INSERT INTO schema_migrations (version) VALUES ('20130721131537');

INSERT INTO schema_migrations (version) VALUES ('20130721134237');

INSERT INTO schema_migrations (version) VALUES ('20130721162718');

INSERT INTO schema_migrations (version) VALUES ('20130721163157');

INSERT INTO schema_migrations (version) VALUES ('20130721185750');

INSERT INTO schema_migrations (version) VALUES ('20130722140144');

INSERT INTO schema_migrations (version) VALUES ('20130722165714');

INSERT INTO schema_migrations (version) VALUES ('20130723170943');

INSERT INTO schema_migrations (version) VALUES ('20130723182033');

INSERT INTO schema_migrations (version) VALUES ('20130723184841');

INSERT INTO schema_migrations (version) VALUES ('20130729161906');

INSERT INTO schema_migrations (version) VALUES ('20130731172503');

INSERT INTO schema_migrations (version) VALUES ('20130810142802');

INSERT INTO schema_migrations (version) VALUES ('20130810142817');

INSERT INTO schema_migrations (version) VALUES ('20130810142829');

INSERT INTO schema_migrations (version) VALUES ('20130810142906');

INSERT INTO schema_migrations (version) VALUES ('20130810142945');

INSERT INTO schema_migrations (version) VALUES ('20130810143003');

INSERT INTO schema_migrations (version) VALUES ('20130810203719');

INSERT INTO schema_migrations (version) VALUES ('20130810211013');

INSERT INTO schema_migrations (version) VALUES ('20130811152637');

INSERT INTO schema_migrations (version) VALUES ('20130811154332');

INSERT INTO schema_migrations (version) VALUES ('20130815172348');

INSERT INTO schema_migrations (version) VALUES ('20130816174223');

INSERT INTO schema_migrations (version) VALUES ('20130816174407');

INSERT INTO schema_migrations (version) VALUES ('20130816180443');

INSERT INTO schema_migrations (version) VALUES ('20130817130913');

INSERT INTO schema_migrations (version) VALUES ('20130817131027');

INSERT INTO schema_migrations (version) VALUES ('20130817205708');

INSERT INTO schema_migrations (version) VALUES ('20130823180123');

INSERT INTO schema_migrations (version) VALUES ('20130928183056');

INSERT INTO schema_migrations (version) VALUES ('20140308101924');

INSERT INTO schema_migrations (version) VALUES ('20140406081157');

INSERT INTO schema_migrations (version) VALUES ('20140623135233');

INSERT INTO schema_migrations (version) VALUES ('20140710112953');

INSERT INTO schema_migrations (version) VALUES ('20140715131017');

INSERT INTO schema_migrations (version) VALUES ('20140716104117');

INSERT INTO schema_migrations (version) VALUES ('20140803154250');

INSERT INTO schema_migrations (version) VALUES ('20140807113647');

INSERT INTO schema_migrations (version) VALUES ('20140809212006');

INSERT INTO schema_migrations (version) VALUES ('20140810083823');

INSERT INTO schema_migrations (version) VALUES ('20140810094352');

INSERT INTO schema_migrations (version) VALUES ('20140817135714');

INSERT INTO schema_migrations (version) VALUES ('20140817141834');

INSERT INTO schema_migrations (version) VALUES ('20140817191039');

INSERT INTO schema_migrations (version) VALUES ('20140817200735');

INSERT INTO schema_migrations (version) VALUES ('20140818101422');

INSERT INTO schema_migrations (version) VALUES ('20140818101937');

INSERT INTO schema_migrations (version) VALUES ('20140906125904');

INSERT INTO schema_migrations (version) VALUES ('20140906125940');

INSERT INTO schema_migrations (version) VALUES ('20140906190919');

INSERT INTO schema_migrations (version) VALUES ('20140906210740');

INSERT INTO schema_migrations (version) VALUES ('20140907195704');

INSERT INTO schema_migrations (version) VALUES ('20141004123130');

INSERT INTO schema_migrations (version) VALUES ('20141006104028');

INSERT INTO schema_migrations (version) VALUES ('20141022075500');

INSERT INTO schema_migrations (version) VALUES ('20141107152957');

INSERT INTO schema_migrations (version) VALUES ('20141117184430');

INSERT INTO schema_migrations (version) VALUES ('20141117184431');

INSERT INTO schema_migrations (version) VALUES ('20141117184432');

INSERT INTO schema_migrations (version) VALUES ('20141117184433');

INSERT INTO schema_migrations (version) VALUES ('20141118081705');

INSERT INTO schema_migrations (version) VALUES ('20141130090842');

INSERT INTO schema_migrations (version) VALUES ('20141222124906');

INSERT INTO schema_migrations (version) VALUES ('20141222124925');

INSERT INTO schema_migrations (version) VALUES ('20141222125008');

INSERT INTO schema_migrations (version) VALUES ('20150122155014');

INSERT INTO schema_migrations (version) VALUES ('20150130113732');

INSERT INTO schema_migrations (version) VALUES ('20150209080254');

INSERT INTO schema_migrations (version) VALUES ('20150215175133');

INSERT INTO schema_migrations (version) VALUES ('20150215175134');

INSERT INTO schema_migrations (version) VALUES ('20150215175135');SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20130624135746');

INSERT INTO schema_migrations (version) VALUES ('20130624172343');

INSERT INTO schema_migrations (version) VALUES ('20130702142756');

INSERT INTO schema_migrations (version) VALUES ('20130702144914');

INSERT INTO schema_migrations (version) VALUES ('20130702145647');

INSERT INTO schema_migrations (version) VALUES ('20130703054428');

INSERT INTO schema_migrations (version) VALUES ('20130703164741');

INSERT INTO schema_migrations (version) VALUES ('20130709180050');

INSERT INTO schema_migrations (version) VALUES ('20130716192148');

INSERT INTO schema_migrations (version) VALUES ('20130721130759');

INSERT INTO schema_migrations (version) VALUES ('20130721130934');

INSERT INTO schema_migrations (version) VALUES ('20130721131537');

INSERT INTO schema_migrations (version) VALUES ('20130721134237');

INSERT INTO schema_migrations (version) VALUES ('20130721162718');

INSERT INTO schema_migrations (version) VALUES ('20130721163157');

INSERT INTO schema_migrations (version) VALUES ('20130721185750');

INSERT INTO schema_migrations (version) VALUES ('20130722140144');

INSERT INTO schema_migrations (version) VALUES ('20130722165714');

INSERT INTO schema_migrations (version) VALUES ('20130723170943');

INSERT INTO schema_migrations (version) VALUES ('20130723182033');

INSERT INTO schema_migrations (version) VALUES ('20130723184841');

INSERT INTO schema_migrations (version) VALUES ('20130729161906');

INSERT INTO schema_migrations (version) VALUES ('20130731172503');

INSERT INTO schema_migrations (version) VALUES ('20130810142802');

INSERT INTO schema_migrations (version) VALUES ('20130810142817');

INSERT INTO schema_migrations (version) VALUES ('20130810142829');

INSERT INTO schema_migrations (version) VALUES ('20130810142906');

INSERT INTO schema_migrations (version) VALUES ('20130810142945');

INSERT INTO schema_migrations (version) VALUES ('20130810143003');

INSERT INTO schema_migrations (version) VALUES ('20130810203719');

INSERT INTO schema_migrations (version) VALUES ('20130810211013');

INSERT INTO schema_migrations (version) VALUES ('20130811152637');

INSERT INTO schema_migrations (version) VALUES ('20130811154332');

INSERT INTO schema_migrations (version) VALUES ('20130815172348');

INSERT INTO schema_migrations (version) VALUES ('20130816174223');

INSERT INTO schema_migrations (version) VALUES ('20130816174407');

INSERT INTO schema_migrations (version) VALUES ('20130816180443');

INSERT INTO schema_migrations (version) VALUES ('20130817130913');

INSERT INTO schema_migrations (version) VALUES ('20130817131027');

INSERT INTO schema_migrations (version) VALUES ('20130817205708');

INSERT INTO schema_migrations (version) VALUES ('20130823180123');

INSERT INTO schema_migrations (version) VALUES ('20130928183056');

INSERT INTO schema_migrations (version) VALUES ('20140308101924');

INSERT INTO schema_migrations (version) VALUES ('20140406081157');

INSERT INTO schema_migrations (version) VALUES ('20140623135233');

INSERT INTO schema_migrations (version) VALUES ('20140710112953');

INSERT INTO schema_migrations (version) VALUES ('20140715131017');

INSERT INTO schema_migrations (version) VALUES ('20140716104117');

INSERT INTO schema_migrations (version) VALUES ('20140803154250');

INSERT INTO schema_migrations (version) VALUES ('20140807113647');

INSERT INTO schema_migrations (version) VALUES ('20140809212006');

INSERT INTO schema_migrations (version) VALUES ('20140810083823');

INSERT INTO schema_migrations (version) VALUES ('20140810094352');

INSERT INTO schema_migrations (version) VALUES ('20140817135714');

INSERT INTO schema_migrations (version) VALUES ('20140817141834');

INSERT INTO schema_migrations (version) VALUES ('20140817191039');

INSERT INTO schema_migrations (version) VALUES ('20140817200735');

INSERT INTO schema_migrations (version) VALUES ('20140818101422');

INSERT INTO schema_migrations (version) VALUES ('20140818101937');

INSERT INTO schema_migrations (version) VALUES ('20140906125904');

INSERT INTO schema_migrations (version) VALUES ('20140906125940');

INSERT INTO schema_migrations (version) VALUES ('20140906190919');

INSERT INTO schema_migrations (version) VALUES ('20140906210740');

INSERT INTO schema_migrations (version) VALUES ('20140907195704');

INSERT INTO schema_migrations (version) VALUES ('20141004123130');

INSERT INTO schema_migrations (version) VALUES ('20141006104028');

INSERT INTO schema_migrations (version) VALUES ('20141022075500');

INSERT INTO schema_migrations (version) VALUES ('20141107152957');

INSERT INTO schema_migrations (version) VALUES ('20141117184430');

INSERT INTO schema_migrations (version) VALUES ('20141117184431');

INSERT INTO schema_migrations (version) VALUES ('20141117184432');

INSERT INTO schema_migrations (version) VALUES ('20141117184433');

INSERT INTO schema_migrations (version) VALUES ('20141118081705');

INSERT INTO schema_migrations (version) VALUES ('20141130090842');

INSERT INTO schema_migrations (version) VALUES ('20141222124906');

INSERT INTO schema_migrations (version) VALUES ('20141222124925');

INSERT INTO schema_migrations (version) VALUES ('20141222125008');

INSERT INTO schema_migrations (version) VALUES ('20150122155014');

INSERT INTO schema_migrations (version) VALUES ('20150130113732');

INSERT INTO schema_migrations (version) VALUES ('20150209080254');

INSERT INTO schema_migrations (version) VALUES ('20150215175133');

INSERT INTO schema_migrations (version) VALUES ('20150215175134');

INSERT INTO schema_migrations (version) VALUES ('20150215175135');

INSERT INTO schema_migrations (version) VALUES ('20150218205108');SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20130624135746');

INSERT INTO schema_migrations (version) VALUES ('20130624172343');

INSERT INTO schema_migrations (version) VALUES ('20130702142756');

INSERT INTO schema_migrations (version) VALUES ('20130702144914');

INSERT INTO schema_migrations (version) VALUES ('20130702145647');

INSERT INTO schema_migrations (version) VALUES ('20130703054428');

INSERT INTO schema_migrations (version) VALUES ('20130703164741');

INSERT INTO schema_migrations (version) VALUES ('20130709180050');

INSERT INTO schema_migrations (version) VALUES ('20130716192148');

INSERT INTO schema_migrations (version) VALUES ('20130721130759');

INSERT INTO schema_migrations (version) VALUES ('20130721130934');

INSERT INTO schema_migrations (version) VALUES ('20130721131537');

INSERT INTO schema_migrations (version) VALUES ('20130721134237');

INSERT INTO schema_migrations (version) VALUES ('20130721162718');

INSERT INTO schema_migrations (version) VALUES ('20130721163157');

INSERT INTO schema_migrations (version) VALUES ('20130721185750');

INSERT INTO schema_migrations (version) VALUES ('20130722140144');

INSERT INTO schema_migrations (version) VALUES ('20130722165714');

INSERT INTO schema_migrations (version) VALUES ('20130723170943');

INSERT INTO schema_migrations (version) VALUES ('20130723182033');

INSERT INTO schema_migrations (version) VALUES ('20130723184841');

INSERT INTO schema_migrations (version) VALUES ('20130729161906');

INSERT INTO schema_migrations (version) VALUES ('20130731172503');

INSERT INTO schema_migrations (version) VALUES ('20130810142802');

INSERT INTO schema_migrations (version) VALUES ('20130810142817');

INSERT INTO schema_migrations (version) VALUES ('20130810142829');

INSERT INTO schema_migrations (version) VALUES ('20130810142906');

INSERT INTO schema_migrations (version) VALUES ('20130810142945');

INSERT INTO schema_migrations (version) VALUES ('20130810143003');

INSERT INTO schema_migrations (version) VALUES ('20130810203719');

INSERT INTO schema_migrations (version) VALUES ('20130810211013');

INSERT INTO schema_migrations (version) VALUES ('20130811152637');

INSERT INTO schema_migrations (version) VALUES ('20130811154332');

INSERT INTO schema_migrations (version) VALUES ('20130815172348');

INSERT INTO schema_migrations (version) VALUES ('20130816174223');

INSERT INTO schema_migrations (version) VALUES ('20130816174407');

INSERT INTO schema_migrations (version) VALUES ('20130816180443');

INSERT INTO schema_migrations (version) VALUES ('20130817130913');

INSERT INTO schema_migrations (version) VALUES ('20130817131027');

INSERT INTO schema_migrations (version) VALUES ('20130817205708');

INSERT INTO schema_migrations (version) VALUES ('20130823180123');

INSERT INTO schema_migrations (version) VALUES ('20130928183056');

INSERT INTO schema_migrations (version) VALUES ('20140308101924');

INSERT INTO schema_migrations (version) VALUES ('20140406081157');

INSERT INTO schema_migrations (version) VALUES ('20140623135233');

INSERT INTO schema_migrations (version) VALUES ('20140710112953');

INSERT INTO schema_migrations (version) VALUES ('20140715131017');

INSERT INTO schema_migrations (version) VALUES ('20140716104117');

INSERT INTO schema_migrations (version) VALUES ('20140803154250');

INSERT INTO schema_migrations (version) VALUES ('20140807113647');

INSERT INTO schema_migrations (version) VALUES ('20140809212006');

INSERT INTO schema_migrations (version) VALUES ('20140810083823');

INSERT INTO schema_migrations (version) VALUES ('20140810094352');

INSERT INTO schema_migrations (version) VALUES ('20140817135714');

INSERT INTO schema_migrations (version) VALUES ('20140817141834');

INSERT INTO schema_migrations (version) VALUES ('20140817191039');

INSERT INTO schema_migrations (version) VALUES ('20140817200735');

INSERT INTO schema_migrations (version) VALUES ('20140818101422');

INSERT INTO schema_migrations (version) VALUES ('20140818101937');

INSERT INTO schema_migrations (version) VALUES ('20140906125904');

INSERT INTO schema_migrations (version) VALUES ('20140906125940');

INSERT INTO schema_migrations (version) VALUES ('20140906190919');

INSERT INTO schema_migrations (version) VALUES ('20140906210740');

INSERT INTO schema_migrations (version) VALUES ('20140907195704');

INSERT INTO schema_migrations (version) VALUES ('20141004123130');

INSERT INTO schema_migrations (version) VALUES ('20141006104028');

INSERT INTO schema_migrations (version) VALUES ('20141022075500');

INSERT INTO schema_migrations (version) VALUES ('20141107152957');

INSERT INTO schema_migrations (version) VALUES ('20141117184430');

INSERT INTO schema_migrations (version) VALUES ('20141117184431');

INSERT INTO schema_migrations (version) VALUES ('20141117184432');

INSERT INTO schema_migrations (version) VALUES ('20141117184433');

INSERT INTO schema_migrations (version) VALUES ('20141118081705');

INSERT INTO schema_migrations (version) VALUES ('20141130090842');

INSERT INTO schema_migrations (version) VALUES ('20141222124906');

INSERT INTO schema_migrations (version) VALUES ('20141222124925');

INSERT INTO schema_migrations (version) VALUES ('20141222125008');

INSERT INTO schema_migrations (version) VALUES ('20150122155014');

INSERT INTO schema_migrations (version) VALUES ('20150130113732');

INSERT INTO schema_migrations (version) VALUES ('20150209080254');

INSERT INTO schema_migrations (version) VALUES ('20150215175133');

INSERT INTO schema_migrations (version) VALUES ('20150215175134');

INSERT INTO schema_migrations (version) VALUES ('20150215175135');SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20130624135746');

INSERT INTO schema_migrations (version) VALUES ('20130624172343');

INSERT INTO schema_migrations (version) VALUES ('20130702142756');

INSERT INTO schema_migrations (version) VALUES ('20130702144914');

INSERT INTO schema_migrations (version) VALUES ('20130702145647');

INSERT INTO schema_migrations (version) VALUES ('20130703054428');

INSERT INTO schema_migrations (version) VALUES ('20130703164741');

INSERT INTO schema_migrations (version) VALUES ('20130709180050');

INSERT INTO schema_migrations (version) VALUES ('20130716192148');

INSERT INTO schema_migrations (version) VALUES ('20130721130759');

INSERT INTO schema_migrations (version) VALUES ('20130721130934');

INSERT INTO schema_migrations (version) VALUES ('20130721131537');

INSERT INTO schema_migrations (version) VALUES ('20130721134237');

INSERT INTO schema_migrations (version) VALUES ('20130721162718');

INSERT INTO schema_migrations (version) VALUES ('20130721163157');

INSERT INTO schema_migrations (version) VALUES ('20130721185750');

INSERT INTO schema_migrations (version) VALUES ('20130722140144');

INSERT INTO schema_migrations (version) VALUES ('20130722165714');

INSERT INTO schema_migrations (version) VALUES ('20130723170943');

INSERT INTO schema_migrations (version) VALUES ('20130723182033');

INSERT INTO schema_migrations (version) VALUES ('20130723184841');

INSERT INTO schema_migrations (version) VALUES ('20130729161906');

INSERT INTO schema_migrations (version) VALUES ('20130731172503');

INSERT INTO schema_migrations (version) VALUES ('20130810142802');

INSERT INTO schema_migrations (version) VALUES ('20130810142817');

INSERT INTO schema_migrations (version) VALUES ('20130810142829');

INSERT INTO schema_migrations (version) VALUES ('20130810142906');

INSERT INTO schema_migrations (version) VALUES ('20130810142945');

INSERT INTO schema_migrations (version) VALUES ('20130810143003');

INSERT INTO schema_migrations (version) VALUES ('20130810203719');

INSERT INTO schema_migrations (version) VALUES ('20130810211013');

INSERT INTO schema_migrations (version) VALUES ('20130811152637');

INSERT INTO schema_migrations (version) VALUES ('20130811154332');

INSERT INTO schema_migrations (version) VALUES ('20130815172348');

INSERT INTO schema_migrations (version) VALUES ('20130816174223');

INSERT INTO schema_migrations (version) VALUES ('20130816174407');

INSERT INTO schema_migrations (version) VALUES ('20130816180443');

INSERT INTO schema_migrations (version) VALUES ('20130817130913');

INSERT INTO schema_migrations (version) VALUES ('20130817131027');

INSERT INTO schema_migrations (version) VALUES ('20130817205708');

INSERT INTO schema_migrations (version) VALUES ('20130823180123');

INSERT INTO schema_migrations (version) VALUES ('20130928183056');

INSERT INTO schema_migrations (version) VALUES ('20140308101924');

INSERT INTO schema_migrations (version) VALUES ('20140406081157');

INSERT INTO schema_migrations (version) VALUES ('20140623135233');

INSERT INTO schema_migrations (version) VALUES ('20140710112953');

INSERT INTO schema_migrations (version) VALUES ('20140715131017');

INSERT INTO schema_migrations (version) VALUES ('20140716104117');

INSERT INTO schema_migrations (version) VALUES ('20140803154250');

INSERT INTO schema_migrations (version) VALUES ('20140807113647');

INSERT INTO schema_migrations (version) VALUES ('20140809212006');

INSERT INTO schema_migrations (version) VALUES ('20140810083823');

INSERT INTO schema_migrations (version) VALUES ('20140810094352');

INSERT INTO schema_migrations (version) VALUES ('20140817135714');

INSERT INTO schema_migrations (version) VALUES ('20140817141834');

INSERT INTO schema_migrations (version) VALUES ('20140817191039');

INSERT INTO schema_migrations (version) VALUES ('20140817200735');

INSERT INTO schema_migrations (version) VALUES ('20140818101422');

INSERT INTO schema_migrations (version) VALUES ('20140818101937');

INSERT INTO schema_migrations (version) VALUES ('20140906125904');

INSERT INTO schema_migrations (version) VALUES ('20140906125940');

INSERT INTO schema_migrations (version) VALUES ('20140906190919');

INSERT INTO schema_migrations (version) VALUES ('20140906210740');

INSERT INTO schema_migrations (version) VALUES ('20140907195704');

INSERT INTO schema_migrations (version) VALUES ('20141004123130');

INSERT INTO schema_migrations (version) VALUES ('20141006104028');

INSERT INTO schema_migrations (version) VALUES ('20141022075500');

INSERT INTO schema_migrations (version) VALUES ('20141107152957');

INSERT INTO schema_migrations (version) VALUES ('20141117184430');

INSERT INTO schema_migrations (version) VALUES ('20141117184431');

INSERT INTO schema_migrations (version) VALUES ('20141117184432');

INSERT INTO schema_migrations (version) VALUES ('20141117184433');

INSERT INTO schema_migrations (version) VALUES ('20141118081705');

INSERT INTO schema_migrations (version) VALUES ('20141130090842');

INSERT INTO schema_migrations (version) VALUES ('20141222124906');

INSERT INTO schema_migrations (version) VALUES ('20141222124925');

INSERT INTO schema_migrations (version) VALUES ('20141222125008');

INSERT INTO schema_migrations (version) VALUES ('20150122155014');

INSERT INTO schema_migrations (version) VALUES ('20150130113732');

INSERT INTO schema_migrations (version) VALUES ('20150209080254');

INSERT INTO schema_migrations (version) VALUES ('20150215175133');

INSERT INTO schema_migrations (version) VALUES ('20150215175134');

INSERT INTO schema_migrations (version) VALUES ('20150215175135');

INSERT INTO schema_migrations (version) VALUES ('20150218205108');SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20130624135746');

INSERT INTO schema_migrations (version) VALUES ('20130624172343');

INSERT INTO schema_migrations (version) VALUES ('20130702142756');

INSERT INTO schema_migrations (version) VALUES ('20130702144914');

INSERT INTO schema_migrations (version) VALUES ('20130702145647');

INSERT INTO schema_migrations (version) VALUES ('20130703054428');

INSERT INTO schema_migrations (version) VALUES ('20130703164741');

INSERT INTO schema_migrations (version) VALUES ('20130709180050');

INSERT INTO schema_migrations (version) VALUES ('20130716192148');

INSERT INTO schema_migrations (version) VALUES ('20130721130759');

INSERT INTO schema_migrations (version) VALUES ('20130721130934');

INSERT INTO schema_migrations (version) VALUES ('20130721131537');

INSERT INTO schema_migrations (version) VALUES ('20130721134237');

INSERT INTO schema_migrations (version) VALUES ('20130721162718');

INSERT INTO schema_migrations (version) VALUES ('20130721163157');

INSERT INTO schema_migrations (version) VALUES ('20130721185750');

INSERT INTO schema_migrations (version) VALUES ('20130722140144');

INSERT INTO schema_migrations (version) VALUES ('20130722165714');

INSERT INTO schema_migrations (version) VALUES ('20130723170943');

INSERT INTO schema_migrations (version) VALUES ('20130723182033');

INSERT INTO schema_migrations (version) VALUES ('20130723184841');

INSERT INTO schema_migrations (version) VALUES ('20130729161906');

INSERT INTO schema_migrations (version) VALUES ('20130731172503');

INSERT INTO schema_migrations (version) VALUES ('20130810142802');

INSERT INTO schema_migrations (version) VALUES ('20130810142817');

INSERT INTO schema_migrations (version) VALUES ('20130810142829');

INSERT INTO schema_migrations (version) VALUES ('20130810142906');

INSERT INTO schema_migrations (version) VALUES ('20130810142945');

INSERT INTO schema_migrations (version) VALUES ('20130810143003');

INSERT INTO schema_migrations (version) VALUES ('20130810203719');

INSERT INTO schema_migrations (version) VALUES ('20130810211013');

INSERT INTO schema_migrations (version) VALUES ('20130811152637');

INSERT INTO schema_migrations (version) VALUES ('20130811154332');

INSERT INTO schema_migrations (version) VALUES ('20130815172348');

INSERT INTO schema_migrations (version) VALUES ('20130816174223');

INSERT INTO schema_migrations (version) VALUES ('20130816174407');

INSERT INTO schema_migrations (version) VALUES ('20130816180443');

INSERT INTO schema_migrations (version) VALUES ('20130817130913');

INSERT INTO schema_migrations (version) VALUES ('20130817131027');

INSERT INTO schema_migrations (version) VALUES ('20130817205708');

INSERT INTO schema_migrations (version) VALUES ('20130823180123');

INSERT INTO schema_migrations (version) VALUES ('20130928183056');

INSERT INTO schema_migrations (version) VALUES ('20140308101924');

INSERT INTO schema_migrations (version) VALUES ('20140406081157');

INSERT INTO schema_migrations (version) VALUES ('20140623135233');

INSERT INTO schema_migrations (version) VALUES ('20140710112953');

INSERT INTO schema_migrations (version) VALUES ('20140715131017');

INSERT INTO schema_migrations (version) VALUES ('20140716104117');

INSERT INTO schema_migrations (version) VALUES ('20140803154250');

INSERT INTO schema_migrations (version) VALUES ('20140807113647');

INSERT INTO schema_migrations (version) VALUES ('20140809212006');

INSERT INTO schema_migrations (version) VALUES ('20140810083823');

INSERT INTO schema_migrations (version) VALUES ('20140810094352');

INSERT INTO schema_migrations (version) VALUES ('20140817135714');

INSERT INTO schema_migrations (version) VALUES ('20140817141834');

INSERT INTO schema_migrations (version) VALUES ('20140817191039');

INSERT INTO schema_migrations (version) VALUES ('20140817200735');

INSERT INTO schema_migrations (version) VALUES ('20140818101422');

INSERT INTO schema_migrations (version) VALUES ('20140818101937');

INSERT INTO schema_migrations (version) VALUES ('20140906125904');

INSERT INTO schema_migrations (version) VALUES ('20140906125940');

INSERT INTO schema_migrations (version) VALUES ('20140906190919');

INSERT INTO schema_migrations (version) VALUES ('20140906210740');

INSERT INTO schema_migrations (version) VALUES ('20140907195704');

INSERT INTO schema_migrations (version) VALUES ('20141004123130');

INSERT INTO schema_migrations (version) VALUES ('20141006104028');

INSERT INTO schema_migrations (version) VALUES ('20141022075500');

INSERT INTO schema_migrations (version) VALUES ('20141107152957');

INSERT INTO schema_migrations (version) VALUES ('20141117184430');

INSERT INTO schema_migrations (version) VALUES ('20141117184431');

INSERT INTO schema_migrations (version) VALUES ('20141117184432');

INSERT INTO schema_migrations (version) VALUES ('20141117184433');

INSERT INTO schema_migrations (version) VALUES ('20141118081705');

INSERT INTO schema_migrations (version) VALUES ('20141130090842');

INSERT INTO schema_migrations (version) VALUES ('20141222124906');

INSERT INTO schema_migrations (version) VALUES ('20141222124925');

INSERT INTO schema_migrations (version) VALUES ('20141222125008');

INSERT INTO schema_migrations (version) VALUES ('20150122155014');

INSERT INTO schema_migrations (version) VALUES ('20150130113732');

INSERT INTO schema_migrations (version) VALUES ('20150209080254');

INSERT INTO schema_migrations (version) VALUES ('20150215175133');

INSERT INTO schema_migrations (version) VALUES ('20150215175134');

INSERT INTO schema_migrations (version) VALUES ('20150215175135');

INSERT INTO schema_migrations (version) VALUES ('20150218205108');

INSERT INTO schema_migrations (version) VALUES ('20150220132938');SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20130624135746');

INSERT INTO schema_migrations (version) VALUES ('20130624172343');

INSERT INTO schema_migrations (version) VALUES ('20130702142756');

INSERT INTO schema_migrations (version) VALUES ('20130702144914');

INSERT INTO schema_migrations (version) VALUES ('20130702145647');

INSERT INTO schema_migrations (version) VALUES ('20130703054428');

INSERT INTO schema_migrations (version) VALUES ('20130703164741');

INSERT INTO schema_migrations (version) VALUES ('20130709180050');

INSERT INTO schema_migrations (version) VALUES ('20130716192148');

INSERT INTO schema_migrations (version) VALUES ('20130721130759');

INSERT INTO schema_migrations (version) VALUES ('20130721130934');

INSERT INTO schema_migrations (version) VALUES ('20130721131537');

INSERT INTO schema_migrations (version) VALUES ('20130721134237');

INSERT INTO schema_migrations (version) VALUES ('20130721162718');

INSERT INTO schema_migrations (version) VALUES ('20130721163157');

INSERT INTO schema_migrations (version) VALUES ('20130721185750');

INSERT INTO schema_migrations (version) VALUES ('20130722140144');

INSERT INTO schema_migrations (version) VALUES ('20130722165714');

INSERT INTO schema_migrations (version) VALUES ('20130723170943');

INSERT INTO schema_migrations (version) VALUES ('20130723182033');

INSERT INTO schema_migrations (version) VALUES ('20130723184841');

INSERT INTO schema_migrations (version) VALUES ('20130729161906');

INSERT INTO schema_migrations (version) VALUES ('20130731172503');

INSERT INTO schema_migrations (version) VALUES ('20130810142802');

INSERT INTO schema_migrations (version) VALUES ('20130810142817');

INSERT INTO schema_migrations (version) VALUES ('20130810142829');

INSERT INTO schema_migrations (version) VALUES ('20130810142906');

INSERT INTO schema_migrations (version) VALUES ('20130810142945');

INSERT INTO schema_migrations (version) VALUES ('20130810143003');

INSERT INTO schema_migrations (version) VALUES ('20130810203719');

INSERT INTO schema_migrations (version) VALUES ('20130810211013');

INSERT INTO schema_migrations (version) VALUES ('20130811152637');

INSERT INTO schema_migrations (version) VALUES ('20130811154332');

INSERT INTO schema_migrations (version) VALUES ('20130815172348');

INSERT INTO schema_migrations (version) VALUES ('20130816174223');

INSERT INTO schema_migrations (version) VALUES ('20130816174407');

INSERT INTO schema_migrations (version) VALUES ('20130816180443');

INSERT INTO schema_migrations (version) VALUES ('20130817130913');

INSERT INTO schema_migrations (version) VALUES ('20130817131027');

INSERT INTO schema_migrations (version) VALUES ('20130817205708');

INSERT INTO schema_migrations (version) VALUES ('20130823180123');

INSERT INTO schema_migrations (version) VALUES ('20130928183056');

INSERT INTO schema_migrations (version) VALUES ('20140308101924');

INSERT INTO schema_migrations (version) VALUES ('20140406081157');

INSERT INTO schema_migrations (version) VALUES ('20140623135233');

INSERT INTO schema_migrations (version) VALUES ('20140710112953');

INSERT INTO schema_migrations (version) VALUES ('20140715131017');

INSERT INTO schema_migrations (version) VALUES ('20140716104117');

INSERT INTO schema_migrations (version) VALUES ('20140803154250');

INSERT INTO schema_migrations (version) VALUES ('20140807113647');

INSERT INTO schema_migrations (version) VALUES ('20140809212006');

INSERT INTO schema_migrations (version) VALUES ('20140810083823');

INSERT INTO schema_migrations (version) VALUES ('20140810094352');

INSERT INTO schema_migrations (version) VALUES ('20140817135714');

INSERT INTO schema_migrations (version) VALUES ('20140817141834');

INSERT INTO schema_migrations (version) VALUES ('20140817191039');

INSERT INTO schema_migrations (version) VALUES ('20140817200735');

INSERT INTO schema_migrations (version) VALUES ('20140818101422');

INSERT INTO schema_migrations (version) VALUES ('20140818101937');

INSERT INTO schema_migrations (version) VALUES ('20140906125904');

INSERT INTO schema_migrations (version) VALUES ('20140906125940');

INSERT INTO schema_migrations (version) VALUES ('20140906190919');

INSERT INTO schema_migrations (version) VALUES ('20140906210740');

INSERT INTO schema_migrations (version) VALUES ('20140907195704');

INSERT INTO schema_migrations (version) VALUES ('20141004123130');

INSERT INTO schema_migrations (version) VALUES ('20141006104028');

INSERT INTO schema_migrations (version) VALUES ('20141022075500');

INSERT INTO schema_migrations (version) VALUES ('20141107152957');

INSERT INTO schema_migrations (version) VALUES ('20141117184430');

INSERT INTO schema_migrations (version) VALUES ('20141117184431');

INSERT INTO schema_migrations (version) VALUES ('20141117184432');

INSERT INTO schema_migrations (version) VALUES ('20141117184433');

INSERT INTO schema_migrations (version) VALUES ('20141118081705');

INSERT INTO schema_migrations (version) VALUES ('20141130090842');

INSERT INTO schema_migrations (version) VALUES ('20141222124906');

INSERT INTO schema_migrations (version) VALUES ('20141222124925');

INSERT INTO schema_migrations (version) VALUES ('20141222125008');

INSERT INTO schema_migrations (version) VALUES ('20150122155014');

INSERT INTO schema_migrations (version) VALUES ('20150130113732');

INSERT INTO schema_migrations (version) VALUES ('20150209080254');

INSERT INTO schema_migrations (version) VALUES ('20150215175133');

INSERT INTO schema_migrations (version) VALUES ('20150215175134');

INSERT INTO schema_migrations (version) VALUES ('20150215175135');

INSERT INTO schema_migrations (version) VALUES ('20150218205108');

INSERT INTO schema_migrations (version) VALUES ('20150220132938');

INSERT INTO schema_migrations (version) VALUES ('20150220144538');SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20130624135746');

INSERT INTO schema_migrations (version) VALUES ('20130624172343');

INSERT INTO schema_migrations (version) VALUES ('20130702142756');

INSERT INTO schema_migrations (version) VALUES ('20130702144914');

INSERT INTO schema_migrations (version) VALUES ('20130702145647');

INSERT INTO schema_migrations (version) VALUES ('20130703054428');

INSERT INTO schema_migrations (version) VALUES ('20130703164741');

INSERT INTO schema_migrations (version) VALUES ('20130709180050');

INSERT INTO schema_migrations (version) VALUES ('20130716192148');

INSERT INTO schema_migrations (version) VALUES ('20130721130759');

INSERT INTO schema_migrations (version) VALUES ('20130721130934');

INSERT INTO schema_migrations (version) VALUES ('20130721131537');

INSERT INTO schema_migrations (version) VALUES ('20130721134237');

INSERT INTO schema_migrations (version) VALUES ('20130721162718');

INSERT INTO schema_migrations (version) VALUES ('20130721163157');

INSERT INTO schema_migrations (version) VALUES ('20130721185750');

INSERT INTO schema_migrations (version) VALUES ('20130722140144');

INSERT INTO schema_migrations (version) VALUES ('20130722165714');

INSERT INTO schema_migrations (version) VALUES ('20130723170943');

INSERT INTO schema_migrations (version) VALUES ('20130723182033');

INSERT INTO schema_migrations (version) VALUES ('20130723184841');

INSERT INTO schema_migrations (version) VALUES ('20130729161906');

INSERT INTO schema_migrations (version) VALUES ('20130731172503');

INSERT INTO schema_migrations (version) VALUES ('20130810142802');

INSERT INTO schema_migrations (version) VALUES ('20130810142817');

INSERT INTO schema_migrations (version) VALUES ('20130810142829');

INSERT INTO schema_migrations (version) VALUES ('20130810142906');

INSERT INTO schema_migrations (version) VALUES ('20130810142945');

INSERT INTO schema_migrations (version) VALUES ('20130810143003');

INSERT INTO schema_migrations (version) VALUES ('20130810203719');

INSERT INTO schema_migrations (version) VALUES ('20130810211013');

INSERT INTO schema_migrations (version) VALUES ('20130811152637');

INSERT INTO schema_migrations (version) VALUES ('20130811154332');

INSERT INTO schema_migrations (version) VALUES ('20130815172348');

INSERT INTO schema_migrations (version) VALUES ('20130816174223');

INSERT INTO schema_migrations (version) VALUES ('20130816174407');

INSERT INTO schema_migrations (version) VALUES ('20130816180443');

INSERT INTO schema_migrations (version) VALUES ('20130817130913');

INSERT INTO schema_migrations (version) VALUES ('20130817131027');

INSERT INTO schema_migrations (version) VALUES ('20130817205708');

INSERT INTO schema_migrations (version) VALUES ('20130823180123');

INSERT INTO schema_migrations (version) VALUES ('20130928183056');

INSERT INTO schema_migrations (version) VALUES ('20140308101924');

INSERT INTO schema_migrations (version) VALUES ('20140406081157');

INSERT INTO schema_migrations (version) VALUES ('20140623135233');

INSERT INTO schema_migrations (version) VALUES ('20140710112953');

INSERT INTO schema_migrations (version) VALUES ('20140715131017');

INSERT INTO schema_migrations (version) VALUES ('20140716104117');

INSERT INTO schema_migrations (version) VALUES ('20140803154250');

INSERT INTO schema_migrations (version) VALUES ('20140807113647');

INSERT INTO schema_migrations (version) VALUES ('20140809212006');

INSERT INTO schema_migrations (version) VALUES ('20140810083823');

INSERT INTO schema_migrations (version) VALUES ('20140810094352');

INSERT INTO schema_migrations (version) VALUES ('20140817135714');

INSERT INTO schema_migrations (version) VALUES ('20140817141834');

INSERT INTO schema_migrations (version) VALUES ('20140817191039');

INSERT INTO schema_migrations (version) VALUES ('20140817200735');

INSERT INTO schema_migrations (version) VALUES ('20140818101422');

INSERT INTO schema_migrations (version) VALUES ('20140818101937');

INSERT INTO schema_migrations (version) VALUES ('20140906125904');

INSERT INTO schema_migrations (version) VALUES ('20140906125940');

INSERT INTO schema_migrations (version) VALUES ('20140906190919');

INSERT INTO schema_migrations (version) VALUES ('20140906210740');

INSERT INTO schema_migrations (version) VALUES ('20140907195704');

INSERT INTO schema_migrations (version) VALUES ('20141004123130');

INSERT INTO schema_migrations (version) VALUES ('20141006104028');

INSERT INTO schema_migrations (version) VALUES ('20141022075500');

INSERT INTO schema_migrations (version) VALUES ('20141107152957');

INSERT INTO schema_migrations (version) VALUES ('20141117184430');

INSERT INTO schema_migrations (version) VALUES ('20141117184431');

INSERT INTO schema_migrations (version) VALUES ('20141117184432');

INSERT INTO schema_migrations (version) VALUES ('20141117184433');

INSERT INTO schema_migrations (version) VALUES ('20141118081705');

INSERT INTO schema_migrations (version) VALUES ('20141130090842');

INSERT INTO schema_migrations (version) VALUES ('20141222124906');

INSERT INTO schema_migrations (version) VALUES ('20141222124925');

INSERT INTO schema_migrations (version) VALUES ('20141222125008');

INSERT INTO schema_migrations (version) VALUES ('20150122155014');

INSERT INTO schema_migrations (version) VALUES ('20150130113732');

INSERT INTO schema_migrations (version) VALUES ('20150209080254');

INSERT INTO schema_migrations (version) VALUES ('20150215175133');

INSERT INTO schema_migrations (version) VALUES ('20150215175134');

INSERT INTO schema_migrations (version) VALUES ('20150215175135');

INSERT INTO schema_migrations (version) VALUES ('20150218205108');

INSERT INTO schema_migrations (version) VALUES ('20150220132938');

INSERT INTO schema_migrations (version) VALUES ('20150220144538');

INSERT INTO schema_migrations (version) VALUES ('20150223093445');

INSERT INTO schema_migrations (version) VALUES ('20150223122725');

INSERT INTO schema_migrations (version) VALUES ('20150223122726');

INSERT INTO schema_migrations (version) VALUES ('20150223122727');

INSERT INTO schema_migrations (version) VALUES ('20150223122728');

INSERT INTO schema_migrations (version) VALUES ('20150224171514');

INSERT INTO schema_migrations (version) VALUES ('20150224171515');SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20130624135746');

INSERT INTO schema_migrations (version) VALUES ('20130624172343');

INSERT INTO schema_migrations (version) VALUES ('20130702142756');

INSERT INTO schema_migrations (version) VALUES ('20130702144914');

INSERT INTO schema_migrations (version) VALUES ('20130702145647');

INSERT INTO schema_migrations (version) VALUES ('20130703054428');

INSERT INTO schema_migrations (version) VALUES ('20130703164741');

INSERT INTO schema_migrations (version) VALUES ('20130709180050');

INSERT INTO schema_migrations (version) VALUES ('20130716192148');

INSERT INTO schema_migrations (version) VALUES ('20130721130759');

INSERT INTO schema_migrations (version) VALUES ('20130721130934');

INSERT INTO schema_migrations (version) VALUES ('20130721131537');

INSERT INTO schema_migrations (version) VALUES ('20130721134237');

INSERT INTO schema_migrations (version) VALUES ('20130721162718');

INSERT INTO schema_migrations (version) VALUES ('20130721163157');

INSERT INTO schema_migrations (version) VALUES ('20130721185750');

INSERT INTO schema_migrations (version) VALUES ('20130722140144');

INSERT INTO schema_migrations (version) VALUES ('20130722165714');

INSERT INTO schema_migrations (version) VALUES ('20130723170943');

INSERT INTO schema_migrations (version) VALUES ('20130723182033');

INSERT INTO schema_migrations (version) VALUES ('20130723184841');

INSERT INTO schema_migrations (version) VALUES ('20130729161906');

INSERT INTO schema_migrations (version) VALUES ('20130731172503');

INSERT INTO schema_migrations (version) VALUES ('20130810142802');

INSERT INTO schema_migrations (version) VALUES ('20130810142817');

INSERT INTO schema_migrations (version) VALUES ('20130810142829');

INSERT INTO schema_migrations (version) VALUES ('20130810142906');

INSERT INTO schema_migrations (version) VALUES ('20130810142945');

INSERT INTO schema_migrations (version) VALUES ('20130810143003');

INSERT INTO schema_migrations (version) VALUES ('20130810203719');

INSERT INTO schema_migrations (version) VALUES ('20130810211013');

INSERT INTO schema_migrations (version) VALUES ('20130811152637');

INSERT INTO schema_migrations (version) VALUES ('20130811154332');

INSERT INTO schema_migrations (version) VALUES ('20130815172348');

INSERT INTO schema_migrations (version) VALUES ('20130816174223');

INSERT INTO schema_migrations (version) VALUES ('20130816174407');

INSERT INTO schema_migrations (version) VALUES ('20130816180443');

INSERT INTO schema_migrations (version) VALUES ('20130817130913');

INSERT INTO schema_migrations (version) VALUES ('20130817131027');

INSERT INTO schema_migrations (version) VALUES ('20130817205708');

INSERT INTO schema_migrations (version) VALUES ('20130823180123');

INSERT INTO schema_migrations (version) VALUES ('20130928183056');

INSERT INTO schema_migrations (version) VALUES ('20140308101924');

INSERT INTO schema_migrations (version) VALUES ('20140406081157');

INSERT INTO schema_migrations (version) VALUES ('20140623135233');

INSERT INTO schema_migrations (version) VALUES ('20140710112953');

INSERT INTO schema_migrations (version) VALUES ('20140715131017');

INSERT INTO schema_migrations (version) VALUES ('20140716104117');

INSERT INTO schema_migrations (version) VALUES ('20140803154250');

INSERT INTO schema_migrations (version) VALUES ('20140807113647');

INSERT INTO schema_migrations (version) VALUES ('20140809212006');

INSERT INTO schema_migrations (version) VALUES ('20140810083823');

INSERT INTO schema_migrations (version) VALUES ('20140810094352');

INSERT INTO schema_migrations (version) VALUES ('20140817135714');

INSERT INTO schema_migrations (version) VALUES ('20140817141834');

INSERT INTO schema_migrations (version) VALUES ('20140817191039');

INSERT INTO schema_migrations (version) VALUES ('20140817200735');

INSERT INTO schema_migrations (version) VALUES ('20140818101422');

INSERT INTO schema_migrations (version) VALUES ('20140818101937');

INSERT INTO schema_migrations (version) VALUES ('20140906125904');

INSERT INTO schema_migrations (version) VALUES ('20140906125940');

INSERT INTO schema_migrations (version) VALUES ('20140906190919');

INSERT INTO schema_migrations (version) VALUES ('20140906210740');

INSERT INTO schema_migrations (version) VALUES ('20140907195704');

INSERT INTO schema_migrations (version) VALUES ('20141004123130');

INSERT INTO schema_migrations (version) VALUES ('20141006104028');

INSERT INTO schema_migrations (version) VALUES ('20141022075500');

INSERT INTO schema_migrations (version) VALUES ('20141107152957');

INSERT INTO schema_migrations (version) VALUES ('20141117184430');

INSERT INTO schema_migrations (version) VALUES ('20141117184431');

INSERT INTO schema_migrations (version) VALUES ('20141117184432');

INSERT INTO schema_migrations (version) VALUES ('20141117184433');

INSERT INTO schema_migrations (version) VALUES ('20141118081705');

INSERT INTO schema_migrations (version) VALUES ('20141130090842');

INSERT INTO schema_migrations (version) VALUES ('20141222124906');

INSERT INTO schema_migrations (version) VALUES ('20141222124925');

INSERT INTO schema_migrations (version) VALUES ('20141222125008');

INSERT INTO schema_migrations (version) VALUES ('20150122155014');

INSERT INTO schema_migrations (version) VALUES ('20150130113732');

INSERT INTO schema_migrations (version) VALUES ('20150209080254');

INSERT INTO schema_migrations (version) VALUES ('20150215175133');

INSERT INTO schema_migrations (version) VALUES ('20150215175134');

INSERT INTO schema_migrations (version) VALUES ('20150215175135');

INSERT INTO schema_migrations (version) VALUES ('20150218205108');

INSERT INTO schema_migrations (version) VALUES ('20150220132938');

INSERT INTO schema_migrations (version) VALUES ('20150220144538');

INSERT INTO schema_migrations (version) VALUES ('20150224171514');

INSERT INTO schema_migrations (version) VALUES ('20150224171515');

INSERT INTO schema_migrations (version) VALUES ('20150302192117');SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20130624135746');

INSERT INTO schema_migrations (version) VALUES ('20130624172343');

INSERT INTO schema_migrations (version) VALUES ('20130702142756');

INSERT INTO schema_migrations (version) VALUES ('20130702144914');

INSERT INTO schema_migrations (version) VALUES ('20130702145647');

INSERT INTO schema_migrations (version) VALUES ('20130703054428');

INSERT INTO schema_migrations (version) VALUES ('20130703164741');

INSERT INTO schema_migrations (version) VALUES ('20130709180050');

INSERT INTO schema_migrations (version) VALUES ('20130716192148');

INSERT INTO schema_migrations (version) VALUES ('20130721130759');

INSERT INTO schema_migrations (version) VALUES ('20130721130934');

INSERT INTO schema_migrations (version) VALUES ('20130721131537');

INSERT INTO schema_migrations (version) VALUES ('20130721134237');

INSERT INTO schema_migrations (version) VALUES ('20130721162718');

INSERT INTO schema_migrations (version) VALUES ('20130721163157');

INSERT INTO schema_migrations (version) VALUES ('20130721185750');

INSERT INTO schema_migrations (version) VALUES ('20130722140144');

INSERT INTO schema_migrations (version) VALUES ('20130722165714');

INSERT INTO schema_migrations (version) VALUES ('20130723170943');

INSERT INTO schema_migrations (version) VALUES ('20130723182033');

INSERT INTO schema_migrations (version) VALUES ('20130723184841');

INSERT INTO schema_migrations (version) VALUES ('20130729161906');

INSERT INTO schema_migrations (version) VALUES ('20130731172503');

INSERT INTO schema_migrations (version) VALUES ('20130810142802');

INSERT INTO schema_migrations (version) VALUES ('20130810142817');

INSERT INTO schema_migrations (version) VALUES ('20130810142829');

INSERT INTO schema_migrations (version) VALUES ('20130810142906');

INSERT INTO schema_migrations (version) VALUES ('20130810142945');

INSERT INTO schema_migrations (version) VALUES ('20130810143003');

INSERT INTO schema_migrations (version) VALUES ('20130810203719');

INSERT INTO schema_migrations (version) VALUES ('20130810211013');

INSERT INTO schema_migrations (version) VALUES ('20130811152637');

INSERT INTO schema_migrations (version) VALUES ('20130811154332');

INSERT INTO schema_migrations (version) VALUES ('20130815172348');

INSERT INTO schema_migrations (version) VALUES ('20130816174223');

INSERT INTO schema_migrations (version) VALUES ('20130816174407');

INSERT INTO schema_migrations (version) VALUES ('20130816180443');

INSERT INTO schema_migrations (version) VALUES ('20130817130913');

INSERT INTO schema_migrations (version) VALUES ('20130817131027');

INSERT INTO schema_migrations (version) VALUES ('20130817205708');

INSERT INTO schema_migrations (version) VALUES ('20130823180123');

INSERT INTO schema_migrations (version) VALUES ('20130928183056');

INSERT INTO schema_migrations (version) VALUES ('20140308101924');

INSERT INTO schema_migrations (version) VALUES ('20140406081157');

INSERT INTO schema_migrations (version) VALUES ('20140623135233');

INSERT INTO schema_migrations (version) VALUES ('20140710112953');

INSERT INTO schema_migrations (version) VALUES ('20140715131017');

INSERT INTO schema_migrations (version) VALUES ('20140716104117');

INSERT INTO schema_migrations (version) VALUES ('20140803154250');

INSERT INTO schema_migrations (version) VALUES ('20140807113647');

INSERT INTO schema_migrations (version) VALUES ('20140809212006');

INSERT INTO schema_migrations (version) VALUES ('20140810083823');

INSERT INTO schema_migrations (version) VALUES ('20140810094352');

INSERT INTO schema_migrations (version) VALUES ('20140817135714');

INSERT INTO schema_migrations (version) VALUES ('20140817141834');

INSERT INTO schema_migrations (version) VALUES ('20140817191039');

INSERT INTO schema_migrations (version) VALUES ('20140817200735');

INSERT INTO schema_migrations (version) VALUES ('20140818101422');

INSERT INTO schema_migrations (version) VALUES ('20140818101937');

INSERT INTO schema_migrations (version) VALUES ('20140906125904');

INSERT INTO schema_migrations (version) VALUES ('20140906125940');

INSERT INTO schema_migrations (version) VALUES ('20140906190919');

INSERT INTO schema_migrations (version) VALUES ('20140906210740');

INSERT INTO schema_migrations (version) VALUES ('20140907195704');

INSERT INTO schema_migrations (version) VALUES ('20141004123130');

INSERT INTO schema_migrations (version) VALUES ('20141006104028');

INSERT INTO schema_migrations (version) VALUES ('20141022075500');

INSERT INTO schema_migrations (version) VALUES ('20141107152957');

INSERT INTO schema_migrations (version) VALUES ('20141117184430');

INSERT INTO schema_migrations (version) VALUES ('20141117184431');

INSERT INTO schema_migrations (version) VALUES ('20141117184432');

INSERT INTO schema_migrations (version) VALUES ('20141117184433');

INSERT INTO schema_migrations (version) VALUES ('20141118081705');

INSERT INTO schema_migrations (version) VALUES ('20141130090842');

INSERT INTO schema_migrations (version) VALUES ('20141222124906');

INSERT INTO schema_migrations (version) VALUES ('20141222124925');

INSERT INTO schema_migrations (version) VALUES ('20141222125008');

INSERT INTO schema_migrations (version) VALUES ('20150122155014');

INSERT INTO schema_migrations (version) VALUES ('20150130113732');

INSERT INTO schema_migrations (version) VALUES ('20150209080254');

INSERT INTO schema_migrations (version) VALUES ('20150215175133');

INSERT INTO schema_migrations (version) VALUES ('20150215175134');

INSERT INTO schema_migrations (version) VALUES ('20150215175135');

INSERT INTO schema_migrations (version) VALUES ('20150218205108');

INSERT INTO schema_migrations (version) VALUES ('20150220132938');

INSERT INTO schema_migrations (version) VALUES ('20150220144538');

INSERT INTO schema_migrations (version) VALUES ('20150224171514');

INSERT INTO schema_migrations (version) VALUES ('20150224171515');SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20130624135746');

INSERT INTO schema_migrations (version) VALUES ('20130624172343');

INSERT INTO schema_migrations (version) VALUES ('20130702142756');

INSERT INTO schema_migrations (version) VALUES ('20130702144914');

INSERT INTO schema_migrations (version) VALUES ('20130702145647');

INSERT INTO schema_migrations (version) VALUES ('20130703054428');

INSERT INTO schema_migrations (version) VALUES ('20130703164741');

INSERT INTO schema_migrations (version) VALUES ('20130709180050');

INSERT INTO schema_migrations (version) VALUES ('20130716192148');

INSERT INTO schema_migrations (version) VALUES ('20130721130759');

INSERT INTO schema_migrations (version) VALUES ('20130721130934');

INSERT INTO schema_migrations (version) VALUES ('20130721131537');

INSERT INTO schema_migrations (version) VALUES ('20130721134237');

INSERT INTO schema_migrations (version) VALUES ('20130721162718');

INSERT INTO schema_migrations (version) VALUES ('20130721163157');

INSERT INTO schema_migrations (version) VALUES ('20130721185750');

INSERT INTO schema_migrations (version) VALUES ('20130722140144');

INSERT INTO schema_migrations (version) VALUES ('20130722165714');

INSERT INTO schema_migrations (version) VALUES ('20130723170943');

INSERT INTO schema_migrations (version) VALUES ('20130723182033');

INSERT INTO schema_migrations (version) VALUES ('20130723184841');

INSERT INTO schema_migrations (version) VALUES ('20130729161906');

INSERT INTO schema_migrations (version) VALUES ('20130731172503');

INSERT INTO schema_migrations (version) VALUES ('20130810142802');

INSERT INTO schema_migrations (version) VALUES ('20130810142817');

INSERT INTO schema_migrations (version) VALUES ('20130810142829');

INSERT INTO schema_migrations (version) VALUES ('20130810142906');

INSERT INTO schema_migrations (version) VALUES ('20130810142945');

INSERT INTO schema_migrations (version) VALUES ('20130810143003');

INSERT INTO schema_migrations (version) VALUES ('20130810203719');

INSERT INTO schema_migrations (version) VALUES ('20130810211013');

INSERT INTO schema_migrations (version) VALUES ('20130811152637');

INSERT INTO schema_migrations (version) VALUES ('20130811154332');

INSERT INTO schema_migrations (version) VALUES ('20130815172348');

INSERT INTO schema_migrations (version) VALUES ('20130816174223');

INSERT INTO schema_migrations (version) VALUES ('20130816174407');

INSERT INTO schema_migrations (version) VALUES ('20130816180443');

INSERT INTO schema_migrations (version) VALUES ('20130817130913');

INSERT INTO schema_migrations (version) VALUES ('20130817131027');

INSERT INTO schema_migrations (version) VALUES ('20130817205708');

INSERT INTO schema_migrations (version) VALUES ('20130823180123');

INSERT INTO schema_migrations (version) VALUES ('20130928183056');

INSERT INTO schema_migrations (version) VALUES ('20140308101924');

INSERT INTO schema_migrations (version) VALUES ('20140406081157');

INSERT INTO schema_migrations (version) VALUES ('20140623135233');

INSERT INTO schema_migrations (version) VALUES ('20140710112953');

INSERT INTO schema_migrations (version) VALUES ('20140715131017');

INSERT INTO schema_migrations (version) VALUES ('20140716104117');

INSERT INTO schema_migrations (version) VALUES ('20140803154250');

INSERT INTO schema_migrations (version) VALUES ('20140807113647');

INSERT INTO schema_migrations (version) VALUES ('20140809212006');

INSERT INTO schema_migrations (version) VALUES ('20140810083823');

INSERT INTO schema_migrations (version) VALUES ('20140810094352');

INSERT INTO schema_migrations (version) VALUES ('20140817135714');

INSERT INTO schema_migrations (version) VALUES ('20140817141834');

INSERT INTO schema_migrations (version) VALUES ('20140817191039');

INSERT INTO schema_migrations (version) VALUES ('20140817200735');

INSERT INTO schema_migrations (version) VALUES ('20140818101422');

INSERT INTO schema_migrations (version) VALUES ('20140818101937');

INSERT INTO schema_migrations (version) VALUES ('20140906125904');

INSERT INTO schema_migrations (version) VALUES ('20140906125940');

INSERT INTO schema_migrations (version) VALUES ('20140906190919');

INSERT INTO schema_migrations (version) VALUES ('20140906210740');

INSERT INTO schema_migrations (version) VALUES ('20140907195704');

INSERT INTO schema_migrations (version) VALUES ('20141004123130');

INSERT INTO schema_migrations (version) VALUES ('20141006104028');

INSERT INTO schema_migrations (version) VALUES ('20141022075500');

INSERT INTO schema_migrations (version) VALUES ('20141107152957');

INSERT INTO schema_migrations (version) VALUES ('20141117184430');

INSERT INTO schema_migrations (version) VALUES ('20141117184431');

INSERT INTO schema_migrations (version) VALUES ('20141117184432');

INSERT INTO schema_migrations (version) VALUES ('20141117184433');

INSERT INTO schema_migrations (version) VALUES ('20141118081705');

INSERT INTO schema_migrations (version) VALUES ('20141130090842');

INSERT INTO schema_migrations (version) VALUES ('20141222124906');

INSERT INTO schema_migrations (version) VALUES ('20141222124925');

INSERT INTO schema_migrations (version) VALUES ('20141222125008');

INSERT INTO schema_migrations (version) VALUES ('20150122155014');

INSERT INTO schema_migrations (version) VALUES ('20150130113732');

INSERT INTO schema_migrations (version) VALUES ('20150209080254');

INSERT INTO schema_migrations (version) VALUES ('20150215175133');

INSERT INTO schema_migrations (version) VALUES ('20150215175134');

INSERT INTO schema_migrations (version) VALUES ('20150215175135');

INSERT INTO schema_migrations (version) VALUES ('20150218205108');

INSERT INTO schema_migrations (version) VALUES ('20150220132938');

INSERT INTO schema_migrations (version) VALUES ('20150220144538');

INSERT INTO schema_migrations (version) VALUES ('20150224171514');

INSERT INTO schema_migrations (version) VALUES ('20150224171515');

INSERT INTO schema_migrations (version) VALUES ('20150302192117');