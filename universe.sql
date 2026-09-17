--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    is_active boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    orbital_period_days integer,
    diameter_km integer,
    is_tidally_locked boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    planet_type_id integer,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    diameter_km integer,
    distance_from_star numeric(10,2)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    is_terrestrial boolean,
    has_atmosphere boolean
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    description text,
    has_life boolean,
    age_in_millions_of_years integer,
    temperature_k integer,
    is_variable boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy, a barred spiral galaxy.', true, 13000, 0, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Closest major galaxy to the Milky Way.', false, 10000, 2537000, true);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 'Grand-design spiral galaxy with bright arms.', false, 3000, 23600000, true);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 'Large spiral galaxy in the Local Group.', false, 6000, 2700000, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral galaxy with a prominent dust lane.', false, 8000, 29000000, true);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Face-on spiral galaxy with a bright nucleus.', false, 21000, 21000000, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 'Earths natural satellite.', false, true, 27, 3474, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'Mars largest moon.', false, true, 0, 22, true);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'Smaller moon of Mars.', false, true, 1, 12, true);
INSERT INTO public.moon VALUES (4, 'Io', 5, 'Volcanically active moon of Jupiter.', false, true, 2, 3643, true);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 'Ice-covered moon with a possible ocean below.', false, true, 3, 3122, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 'Largest moon in the Solar System.', false, true, 7, 5268, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 'Heavily cratered outer moon of Jupiter.', false, true, 17, 4821, true);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 'Moon with a thick atmosphere and methane lakes.', false, true, 16, 5150, true);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 'Icy moon of Saturn.', false, true, 4, 1528, true);
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, 'Bright icy moon with water plumes.', false, true, 1, 504, true);
INSERT INTO public.moon VALUES (11, 'Dione', 6, 'Bright moon with icy cliffs.', false, true, 2, 1123, true);
INSERT INTO public.moon VALUES (12, 'Tethys', 6, 'Large icy moon of Saturn.', false, true, 1, 1062, true);
INSERT INTO public.moon VALUES (13, 'Miranda', 7, 'Small moon with varied terrain.', false, true, 1, 472, true);
INSERT INTO public.moon VALUES (14, 'Ariel', 7, 'Bright icy moon of Uranus.', false, true, 2, 1158, true);
INSERT INTO public.moon VALUES (15, 'Titania', 7, 'Largest moon of Uranus.', false, true, 9, 1578, true);
INSERT INTO public.moon VALUES (16, 'Oberon', 7, 'Outer moon of Uranus.', false, true, 13, 1523, true);
INSERT INTO public.moon VALUES (17, 'Triton', 8, 'Large retrograde moon of Neptune.', false, true, 5, 2707, true);
INSERT INTO public.moon VALUES (18, 'Proteus', 8, 'Oddly shaped moon of Neptune.', false, true, 1, 420, true);
INSERT INTO public.moon VALUES (19, 'Nereid', 8, 'Irregular moon of Neptune.', false, true, 360, 340, true);
INSERT INTO public.moon VALUES (20, 'Charon', 9, 'Largest moon of Pluto.', false, true, 6, 1212, true);
INSERT INTO public.moon VALUES (21, 'Hydra', 9, 'Small moon of Pluto.', false, true, 38, 55, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 1, 'Closest planet to the Sun.', false, true, 4600, 4879, 0.39);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 1, 'Cloud-covered world with a dense atmosphere.', false, true, 4600, 12104, 0.72);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1, 'Our home planet with abundant liquid water.', true, true, 4540, 12742, 1.00);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 1, 'Rocky desert planet with polar ice caps.', false, true, 4600, 6779, 1.52);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 2, 'Largest planet in the Solar System.', false, true, 4600, 139820, 5.20);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 2, 'Ringed gas giant.', false, true, 4600, 116460, 9.58);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 3, 'Ice giant with a tilted axis.', false, true, 4600, 50724, 19.20);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 3, 'Farthest major planet from the Sun.', false, true, 4600, 49244, 30.05);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, 4, 'Dwarf planet in the Kuiper Belt.', false, true, 4600, 2376, 39.48);
INSERT INTO public.planet VALUES (10, 'Kepler-442b', 2, 4, 'Potentially rocky exoplanet in a habitable zone.', false, true, 5000, 15400, 0.41);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1e', 3, 1, 'Temperate rocky exoplanet around a red dwarf.', false, true, 7000, 12200, 0.03);
INSERT INTO public.planet VALUES (12, 'HD 40307 g', 5, 4, 'Potentially habitable exoplanet.', false, true, 6000, 17800, 0.13);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial', 'Rocky planet with solid surface.', true, true);
INSERT INTO public.planet_type VALUES (2, 'Gas Giant', 'Large planet composed mainly of gases.', false, true);
INSERT INTO public.planet_type VALUES (3, 'Ice Giant', 'Planet rich in volatile substances like water and ammonia.', false, true);
INSERT INTO public.planet_type VALUES (4, 'Super-Earth', 'Larger than Earth but smaller than Neptune.', true, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type main-sequence star at the center of our solar system.', true, 4600, 5778, false);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'Brightest star in Earths night sky.', false, 250, 9940, false);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'Red supergiant in Orion.', false, 10, 3500, true);
INSERT INTO public.star VALUES (4, 'Andromeda Star A', 2, 'Bright star in the Andromeda galaxy.', false, 5000, 6200, false);
INSERT INTO public.star VALUES (5, 'Whirlpool Star 1', 3, 'Young massive star in Whirlpool galaxy.', false, 120, 22000, true);
INSERT INTO public.star VALUES (6, 'Triangulum Star X', 4, 'Blue star in the Triangulum galaxy.', false, 900, 18000, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_type planet_type_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_unique UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

