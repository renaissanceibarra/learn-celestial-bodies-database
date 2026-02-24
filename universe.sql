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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    diameter_km numeric(10,2) NOT NULL,
    discovery_year integer NOT NULL,
    is_hazardous boolean NOT NULL,
    has_water_ice boolean NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    galaxy_types character varying(60),
    ages_in_millions_of_years integer,
    distance_from_earth numeric(10,1)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    is_spherical boolean,
    ages_in_millions_of_years integer,
    distance_from_earth numeric(10,1),
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    planet_types character varying(60),
    has_life boolean,
    is_spherical boolean,
    ages_in_millions_of_years integer,
    distance_from_earth numeric(10,1),
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    is_spherical boolean,
    ages_in_millions_of_years integer,
    distance_from_earth numeric(10,1),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 'The largest object in the asteroid belt and a dwarf planet.', 939.40, 1801, false, true);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 'The second-most massive body in the asteroid belt.', 525.40, 1807, false, false);
INSERT INTO public.asteroid VALUES (3, 'Bennu', 'A carbonaceous asteroid and a potential Earth impactor.', 0.49, 1999, true, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy containing the Solar System.', 'Spiral', 13600, 0.0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The closest major spiral neighbor to the Milky Way and the largest member of the Local Group.', 'Barred Spiral', 10000, 2.5);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A smaller, pure-disk spiral galaxy known for its intense star formation and lack of central bulge.', 'Spiral', 3000, 3.0);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'A massive galaxy featuring a brilliant bulbus core and a thick, dark dust lane that resembles a Mexican hat.', 'Spiral', 12000, 31.0);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'A classic "grand-design" spiral galaxy that is famously interacting with a smaller companion dwarf galaxy.', 'Spiral', 400, 31.0);
INSERT INTO public.galaxy VALUES (6, 'Carthwheel', 'A rare ring-shaped galaxy created by a high-speed collision between two galaxies approximately 200 million years ago.', 'Lenticular Ring', 300, 500.0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth''s only natural satellite and the fifth largest moon.', true, 4500, 0.4, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'The larger and closer of the two Martian moons.', false, 4500, 78.4, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Small, lumpy, and cratered moon of Mars.', false, 4500, 78.4, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'The most volcanically active world in the solar system.', true, 4500, 628.7, 6);
INSERT INTO public.moon VALUES (5, 'Europa', 'Icy moon of Jupiter with a subsurface salty ocean.', true, 4500, 628.7, 6);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'The largest moon in the solar system, even bigger than Mercury.', true, 4500, 628.7, 6);
INSERT INTO public.moon VALUES (7, 'Callisto', 'The most heavily cratered object in the solar system.', true, 4500, 628.7, 6);
INSERT INTO public.moon VALUES (8, 'Amalthea', 'The reddest object in the solar system, oddly shaped.', false, 4500, 628.7, 6);
INSERT INTO public.moon VALUES (9, 'Himalia', 'Largest of Jupiter''s irregular satellites.', false, 4500, 628.7, 6);
INSERT INTO public.moon VALUES (10, 'Titan', 'The only moon known to have a dense atmosphere and liquid lakes.', true, 4500, 1277.0, 7);
INSERT INTO public.moon VALUES (11, 'Rhea', 'Saturn''s second-largest moon, heavily cratered and icy.', true, 4500, 1277.0, 7);
INSERT INTO public.moon VALUES (12, 'Iapetus', 'Known for its dramatic "two-toned" coloring.', true, 4500, 1277.0, 7);
INSERT INTO public.moon VALUES (13, 'Dione', 'Icy moon with bright cliffs created by tectonic fractures.', true, 4500, 1277.0, 7);
INSERT INTO public.moon VALUES (14, 'Tethys', 'Features a massive impact crater called Odysseus.', true, 4500, 1277.0, 7);
INSERT INTO public.moon VALUES (15, 'Enceladus', 'Famous for active geysers spraying water into space.', true, 4500, 1277.0, 7);
INSERT INTO public.moon VALUES (16, 'Mimas', 'Often compared to the "Death Star" due to its Herschel crater.', true, 4500, 1277.0, 7);
INSERT INTO public.moon VALUES (17, 'Phoebe', 'A dark, scarred moon likely captured from the Kuiper Belt.', false, 4500, 1277.0, 7);
INSERT INTO public.moon VALUES (18, 'Ariel', 'The brightest of the Uranian moons with a young surface.', true, 4500, 2721.0, 8);
INSERT INTO public.moon VALUES (19, 'Umbriel', 'The darkest of Uranus''s large moons.', true, 4500, 2721.0, 8);
INSERT INTO public.moon VALUES (20, 'Titania', 'The largest moon of Uranus, named after the Queen of Fairies.', true, 4500, 2721.0, 8);
INSERT INTO public.moon VALUES (21, 'Oberon', 'The outermost major moon of Uranus, old and cratered.', true, 4500, 2721.0, 8);
INSERT INTO public.moon VALUES (22, 'Miranda', 'Possesses the most extreme and varied topography in the solar system.', true, 4500, 2721.0, 8);
INSERT INTO public.moon VALUES (23, 'Triton', 'Neptune''s largest moon, which orbits in a retrograde direction.', true, 4500, 4347.0, 9);
INSERT INTO public.moon VALUES (24, 'Proteus', 'One of the largest non-spherical moons in the solar system.', false, 4500, 4347.0, 9);
INSERT INTO public.moon VALUES (25, 'Nereid', 'Known for having one of the most eccentric orbits of any moon.', false, 4500, 4347.0, 9);
INSERT INTO public.moon VALUES (26, 'Charon', 'Pluto''s largest moon, so big they are like a double-planet system.', true, 4500, 5906.0, 10);
INSERT INTO public.moon VALUES (27, 'Nix', 'One of Pluto''s small, icy outer moons.', false, 4500, 5906.0, 10);
INSERT INTO public.moon VALUES (28, 'Hydra', 'The outermost of Pluto''s five known moons.', false, 4500, 5906.0, 10);
INSERT INTO public.moon VALUES (29, 'Kerberos', 'Tiny moon of Pluto with a double-lobed shape.', false, 4500, 5906.0, 10);
INSERT INTO public.moon VALUES (30, 'Dysnomia', 'The only known moon of the dwarf planet Eris.', false, 4500, 10125.0, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Smallest planet, closest to the Sun.', 'Terrestrial', false, true, 4568, 91.7, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Hottest planet with a thick toxic atmosphere.', 'Terrestrial', false, true, 4568, 41.4, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Our home;; the only known world with life.', 'Terrestrial', true, true, 4568, 0.0, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'The ""Red Planet,,"" home to Olympus Mons.', 'Terrestrial', false, true, 4568, 78.3, 1);
INSERT INTO public.planet VALUES (5, 'Ceres', 'Largest object in the asteroid belt.', 'Dwarf', false, true, 4568, 264.0, 1);
INSERT INTO public.planet VALUES (6, 'Jupiter', 'Largest planet;; a gas giant with a Great Red Spot.', 'Gas Giant', false, true, 4568, 628.7, 1);
INSERT INTO public.planet VALUES (7, 'Saturn', 'Famous for its complex and bright ring system.', 'Gas Giant', false, true, 4568, 1277.0, 1);
INSERT INTO public.planet VALUES (8, 'Uranus', 'An "ice giant" that rotates on its side.', 'Ice Giant', false, true, 4568, 2721.0, 1);
INSERT INTO public.planet VALUES (9, 'Neptune', 'Windiest planet, located farthest from the Sun.', 'Ice Giant', false, true, 4568, 4347.0, 1);
INSERT INTO public.planet VALUES (10, 'Pluto', 'Icy world in the Kupier Belt;; former 9th planet.', 'Dwarf', false, true, 4568, 5750.0, 1);
INSERT INTO public.planet VALUES (11, 'Charon', 'Pluto''s largest moon ((part of 2006''s ""12"" list)).', 'Dwarf', false, true, 4568, 5750.0, 1);
INSERT INTO public.planet VALUES (12, 'Eris', 'Massive dwarf planet beyond Pluto''s orbit.', 'Dwarf', false, true, 4568, 10125.0, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'A nearly perfect sphere of hot plasma at the center of our solar system that provides the energy for life on Earth.', true, 4600, 0.0, 1);
INSERT INTO public.star VALUES (2, 'Sirius A', 'The brightest star in Earth''s night sky, a brilliant white main-sequence star.', true, 240, 8.6, 1);
INSERT INTO public.star VALUES (3, 'Vega', 'A bright blue-white star in Lyra;; it was once the North Star.', false, 455, 25.0, 1);
INSERT INTO public.star VALUES (4, 'Rigel', 'A blue supeergiant and the brightest star in the constellation Orion.', true, 8, 860.0, 1);
INSERT INTO public.star VALUES (5, 'Polaris', 'The current North Star, located in the constellation Ursa Minor.', true, 70, 433.0, 1);
INSERT INTO public.star VALUES (6, 'Achernar', 'The flattest star known;; it spins so fast that its equaator bulges significantly.', false, 37, 139.0, 1);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id UNIQUE (star_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: asteroid unique_asteroid_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT unique_asteroid_name UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

