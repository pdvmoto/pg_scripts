--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2-YB-2.20.1.3-b0
-- Dumped by pg_dump version 15.4

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

--
-- Name: fl_stag; Type: TABLE; Schema: public; Owner: yugabyte
--

CREATE TABLE public.fl_stag (
    seq_id integer NOT NULL,
    hiding_date_vc character varying(10),
    hiding_date timestamp without time zone,
    hiding_blz character varying(6),
    hiding_rider character varying(30),
    finder_date_vc character varying(10),
    finder_date timestamp without time zone,
    finder_blz character varying(6),
    finder_rider character varying(30),
    lat_degr real,
    lon_degr real,
    loc_desc character varying(64),
    city character varying(30),
    prov character varying(3),
    distance real,
    "prov " character varying(50)
);


ALTER TABLE public.fl_stag OWNER TO yugabyte;

--
-- Name: fl_stag_seq_id_seq; Type: SEQUENCE; Schema: public; Owner: yugabyte
--

CREATE SEQUENCE public.fl_stag_seq_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 100;


ALTER TABLE public.fl_stag_seq_id_seq OWNER TO yugabyte;

--
-- Name: fl_stag_seq_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yugabyte
--

ALTER SEQUENCE public.fl_stag_seq_id_seq OWNED BY public.fl_stag.seq_id;


--
-- Name: fl_stag seq_id; Type: DEFAULT; Schema: public; Owner: yugabyte
--

ALTER TABLE ONLY public.fl_stag ALTER COLUMN seq_id SET DEFAULT nextval('public.fl_stag_seq_id_seq'::regclass);


--
-- Data for Name: fl_stag; Type: TABLE DATA; Schema: public; Owner: yugabyte
--

COPY public.fl_stag (seq_id, hiding_date_vc, hiding_date, hiding_blz, hiding_rider, finder_date_vc, finder_date, finder_blz, finder_rider, lat_degr, lon_degr, loc_desc, city, prov, distance, "prov ") FROM stdin;
854	08-07-2012	2012-07-08 00:00:00	16/28	BSI	08-07-2012	2012-07-08 00:00:00	16/28	rvdh86	52.1515465	5.54384708	aan knuppelbrug - Paradijs	Barneveld	Ge	\N	\N
1862	15-03-2015	2015-03-15 00:00:00	28/30	Ronald_010	16-03-2015	2015-03-16 00:00:00	28/30	Bomba	52.0792122	4.82634878	bij meterpaaltje Hoge Rijndaijk	Nieuwerbrug	ZH	\N	\N
2550	19-09-2017	2017-09-19 00:00:00	36/02	pdv_moto	20-09-2017	2017-09-20 00:00:00	36/03	Wimis on	52.036499	5.16687012	aan infobord het Rond - Spoorhaag	Houten	Ut	\N	\N
3528	02-06-2020	2020-06-02 00:00:00	40/690	FastEddy	03-06-2020	2020-06-03 00:00:00	40/690	HermanK	52.9226074	6.78348303	in kunstwerk bij brandweerkazerne	Borger	Dr	\N	\N
3998	31-07-2021	2021-07-31 00:00:00	41/136	Deeffox	02-08-2021	2021-08-02 00:00:00	41/136	Hans89	51.7832031	4.65267277	onder voetstuk reclamebord Plaswijkpark	Dordrecht	ZH	\N	\N
1361	21-09-2013	2013-09-21 00:00:00	22/85	Hans89	21-09-2013	2013-09-21 00:00:00	22/86	Buuv	52.0410919	5.69172287	in tanktas motor bij pannekoekenhuis	Ede	Ge	\N	\N
967	28-10-2012	2012-10-28 00:00:00	17/52	BSI	29-10-2012	2012-10-29 00:00:00	17/53	Hasseman	52.1798706	5.97968292	aan bordje Ln v Malkenschoten	Apeldoorn	Ge	\N	\N
1987	11-08-2015	2015-08-11 00:00:00	29/39	Coenster	11-08-2015	2015-08-11 00:00:00	29/39	coffeejunk	52.3239136	4.77397203	aan paaltje bij McDonald	Schiphol	NH	\N	\N
789	28-04-2012	2012-04-28 00:00:00	15/44	Ronald_010	29-04-2012	2012-04-29 00:00:00	15/44	bikedan	51.9909668	5.13123989	bij vistrap stuw Hagestein, Lekdijk, Ut	Lekdijk	Ut	\N	\N
81	04-10-2010	2010-10-04 00:00:00	3/44	Emgi	04-10-2010	2010-10-04 00:00:00	3/44	Soesbabe	51.428688	4.23267078	brug Westelijke Rijnscheldeweg, Rilland, Ze	Rilland	Ze	\N	\N
1311	16-08-2013	2013-08-16 00:00:00	22/23	BSI	17-08-2013	2013-08-17 00:00:00	22/24	Ronald_010	52.1622543	5.59692812	in hoek van hek - Industrieweg	Barneveld	Ge	\N	\N
600	24-10-2011	2011-10-24 00:00:00	13/01	tdemmer	24-10-2011	2011-10-24 00:00:00	13/02	BSI	51.8514137	5.0233078	aan hek golfbaan Julianaweg, Vuren, Ge	Vuren	Ge	\N	\N
4325	21-04-2023	2023-04-21 00:00:00	41/351	pdv_moto	22-04-2023	2023-04-22 00:00:00	41/353	Hans89	51.5368309	3.4777739	tegen paaltje ruiterpad Baaiweg	Aagtekerke	Ze	\N	\N
1435	02-12-2013	2013-12-02 00:00:00	23/92	Sjantaalfoutje	03-12-2013	2013-12-03 00:00:00	23/93	Hasseman	52.2832603	6.55010223	aan stuw - Enterbroekweg	Markelo	Ov	\N	\N
144	19-11-2010	2010-11-19 00:00:00	4/99	V-Strommert	19-11-2010	2010-11-19 00:00:00	5/1	I-accelerate	52.8625221	6.50303221	school Reigerlaan/Gruttolaan, Beilen, Dr	Beilen	Dr	\N	\N
1267	05-07-2013	2013-07-05 00:00:00	21/68	piertje moffel	05-07-2013	2013-07-05 00:00:00	21/69	Bensi	52.3872681	6.14741182	onderstronk zandpad - Onder de Gelder	Wijhe	Ov	\N	\N
1816	31-12-2014	2014-12-31 00:00:00	27/91	Ronald_010	02-01-2015	2015-01-02 00:00:00	27/92	Djoost	51.9774628	4.39382696	onder bruggetje - Overslagpad	Delft	ZH	\N	\N
835	22-06-2012	2012-06-22 00:00:00	16/06	Smuiger	22-06-2012	2012-06-22 00:00:00	16/06	Sander78	52.5508232	4.84500599	aan hek "Rijper Eilanden" - Zuiddijk, de Rijp, NH	de Rijp	NH	\N	\N
1610	27-04-2014	2014-04-27 00:00:00	25/83	BSI	28-04-2014	2014-04-28 00:00:00	25/84	MLB	51.6274185	4.86767817	aan witte fiets - Beneluxweg	Oosterhout	NB	\N	\N
3719	25-10-2020	2020-10-25 00:00:00	40/861	Outdoor Man	26-10-2020	2020-10-26 00:00:00	40/861	ootje	52.3820267	4.9613061	aan hek bij Oranjesluizen	Amsterdam	NH	\N	\N
3512	25-05-2020	2020-05-25 00:00:00	40/676	jaap43	25-05-2020	2020-05-25 00:00:00	40/676	Hans89	51.892643	4.37912893	tegen hek en gemaaltje Hogedijk	Pernis	ZH	\N	\N
4125	13-02-2022	2022-02-13 00:00:00	41/219	pdv_moto	16-02-2022	2022-02-16 00:00:00	41/220	Sjefman	51.4573288	4.01121378	aan hek bij sluizen	Hansweert	Ze	\N	\N
4425	06-11-2023	2023-11-06 00:00:00	41/416	Janhertog	16-11-2023	2023-11-16 00:00:00	41/417	BSI	52.7956314	6.09955883	tegen boom P-terrein Bowling	Tuk	Ov	\N	\N
3376	07-02-2020	2020-02-07 00:00:00	40/563	Ronny Rabbelaar	07-02-2020	2020-02-07 00:00:00	40/563	Amauta	53.3028984	6.86722803	in betonnen blokken Fivelpoort	Appingedam	Gr	\N	\N
4276	01-01-2023	2023-01-01 00:00:00	41/320	Outdoor Man	06-01-2023	2023-01-06 00:00:00	41/321	Roeleey	52.3298759	5.14920521	aan paaltje fietspad	Almere-haven	Fl	\N	\N
2202	12-08-2016	2016-08-12 00:00:00	31/76	bikedan	14-08-2016	2016-08-14 00:00:00	31/77	pdv_moto	51.5408516	3.43806195	aan dijkpaal 195 - Zeedijk	Westkapelle	Ze	\N	\N
4030	15-09-2021	2021-09-15 00:00:00	41/154	ootje	16-09-2021	2021-09-16 00:00:00	41/155	Outdoor Man	52.59618	4.67320204	tegen grenspaal Heilo Vennewatersweg	Heilo	NH	\N	\N
2365	27-03-2017	2017-03-27 00:00:00	33/88	Amauta	30-03-2017	2017-03-30 00:00:00	33/90	Skiddilly	51.4406242	4.92387915	aan paal P-terrein - Molenbaan	Baarle-Hertog/Nassau	NB	\N	\N
2338	16-02-2017	2017-02-16 00:00:00	33/58	Dirk130	16-02-2017	2017-02-16 00:00:00	33/59	tdemmer	51.9883728	4.57457018	in bosje Middelweg - Nesselande	Rotterdam	ZH	\N	\N
3048	20-03-2019	2019-03-20 00:00:00	40/249	pdv_moto	22-03-2019	2019-03-22 00:00:00	40/250	Schwenneh	52.0969772	4.27913713	in bloembak Paulus Buysstraat	Den Haag	ZH	\N	\N
488	04-08-2011	2011-08-04 00:00:00	11/35	Wolvin	05-08-2011	2011-08-05 00:00:00	11/36	Richard117	52.8990669	6.08148289	ophaalbrug bij Lolkemaas Laene, de Hoeve, Fr	de Hoeve	Fr	\N	\N
985	10-11-2012	2012-11-10 00:00:00	17/80	V-Strommert	10-11-2012	2012-11-10 00:00:00	17/80	BSI	52.408905	4.64324903	achter tribune - Jan Gerritslaan	Haarlem	NH	\N	\N
840	26-06-2012	2012-06-26 00:00:00	16/11	BSI	26-06-2012	2012-06-26 00:00:00	16/12	Maegrim	51.9230042	5.79930115	in knotwilg Logtsestraat, Elst, Ge	Elst	Ge	\N	\N
399	02-06-2011	2011-06-02 00:00:00	10/25	Hasseman	02-06-2011	2011-06-02 00:00:00	10/26	Gejabo	52.3593941	6.62986183	WCD bij waterstenen - Groenplein, Almelo, Ov	Almelo	Ov	\N	\N
1012	02-12-2012	2012-12-02 00:00:00	18/20	BSI	04-12-2012	2012-12-04 00:00:00	18/21	Hasseman	52.181797	5.59670305	achter CAI-kast Jan van Galenlaan	Voorthuizen	Ge	\N	\N
3674	25-09-2020	2020-09-25 00:00:00	40/829	Amauta	25-09-2020	2020-09-25 00:00:00	40/830	Janhertog	53.1147499	6.56400013	in boom spottersheuvel vliegveld	Eelde	Dr	\N	\N
3694	07-10-2020	2020-10-07 00:00:00	40/841	Outdoor Man	08-10-2020	2020-10-08 00:00:00	40/842	Roeleey	52.774044	5.10597277	achter E-kast Tramstation Dam 2	Medemblik	NH	\N	\N
984	09-11-2012	2012-11-09 00:00:00	17/79	ootje	09-11-2012	2012-11-09 00:00:00	17/79	V-Strommert	52.4904327	4.61173916	onder bankje - Zeestraat	Wijk aan Zee	NH	\N	\N
149	22-11-2010	2010-11-22 00:00:00	5/6	Hasseman	23-11-2010	2010-11-23 00:00:00	5/9	scheurschuimpje	52.6231155	6.10580206	kijkhut Zwartewaterskloostersweg, Rouveen, Ov	Rouveen	Ov	\N	\N
3626	15-08-2020	2020-08-15 00:00:00	40/785	FastEddy	15-08-2020	2020-08-15 00:00:00	40/785	Ronny Rabbelaar	53.1415977	6.75712681	in balustrade verpoosplek, Windeveer	Nieuwe Compagnie	Gr	\N	\N
1797	14-11-2014	2014-11-14 00:00:00	27/72	Lekkerbekje	21-11-2014	2014-11-21 00:00:00	27/74	frankivo	53.1789703	5.98303795	aan boom bij tunneltje nieuwe rondweg	Garijp	Fr	\N	\N
988	11-11-2012	2012-11-11 00:00:00	17/83	Outdoor Man	11-11-2012	2012-11-11 00:00:00	17/84	Ronald_010	52.3024406	4.84076786	Doorweg	Amstelveen	NH	\N	\N
2680	29-03-2018	2018-03-29 00:00:00	37/98	sanger	29-03-2018	2018-03-29 00:00:00	37/99	HighKing	52.4661217	4.59697199	aan bord brug Middensluis	Ijmuiden	NH	\N	\N
3992	24-07-2021	2021-07-24 00:00:00	41/133	Hans89	24-07-2021	2021-07-24 00:00:00	41/133	jaap43	51.9169197	4.56688499	bij trafohuis Sibeliusweg	Capelle aan den Ijssel	ZH	\N	\N
3933	13-06-2021	2021-06-13 00:00:00	41/092	Brnk	13-06-2021	2021-06-13 00:00:00	41/092	MeanYellowBoy	52.5876923	6.46754694	aan hek bij Kotermeerstal	Dedemsvaart	Ov	\N	\N
3206	11-08-2019	2019-08-11 00:00:00	40/420	Ronald_010	12-08-2019	2019-08-12 00:00:00	40/421	Hans89	51.3546295	6.04552794	aan poot rotondebord Oude Heldenseweg	Maasbree	Li	\N	\N
2687	02-04-2018	2018-04-02 00:00:00	38/06	SadBunny	02-04-2018	2018-04-02 00:00:00	38/07	Roeleey	52.3363075	4.9079628	aan boomstronk Roeiver. Willem III	Amsterdam	NH	\N	\N
3744	10-11-2020	2020-11-10 00:00:00	40/879	Carburateur	13-11-2020	2020-11-13 00:00:00	40/880	BSI	51.5575104	5.40664101	tegen boom Liempdseweg	Sint Oedenrode	NB	\N	\N
3169	12-07-2019	2019-07-12 00:00:00	40/384	pdv_moto	12-07-2019	2019-07-12 00:00:00	40/385	FastEddy	53.0131645	6.90962696	achter kastje Boerveensemond	Stadskanaal	Gr	\N	\N
3989	22-07-2021	2021-07-22 00:00:00	41/130	ootje	23-07-2021	2021-07-23 00:00:00	41/131	HighKing	52.5785408	4.80754185	aan voeten van Vrouwe Salto	Driehuizen	NH	\N	\N
4226	28-07-2022	2022-07-28 00:00:00	41/284	Amauta	28-07-2022	2022-07-28 00:00:00	41/284	Ronny Rabbelaar	53.2957878	6.50530577	aan landhoofd Westsingerzijl Keersluis	Sauwerd	Gr	\N	\N
4378	14-07-2023	2023-07-14 00:00:00	41/387	Coenster	16-07-2023	2023-07-16 00:00:00	41/387	FastEddy	52.6777153	6.949224	onder infopaneeltje smalspoormuseum	Erica	Dr	\N	\N
1273	08-07-2013	2013-07-08 00:00:00	21/72	Coffee	08-07-2013	2013-07-08 00:00:00	21/74	rvdh86	52.1578522	6.11782312	aan bord "Eigen weg" Hengelderweg	Voorst	Ge	\N	\N
2205	21-08-2016	2016-08-21 00:00:00	31/81	pdv_moto	22-08-2016	2016-08-22 00:00:00	31/83	Motormuisje_alice	52.0778389	4.38886786	aan boom Sijtwindebrug	Voorburg	ZH	\N	\N
135	11-11-2010	2010-11-11 00:00:00	4/71	Smuiger	11-11-2010	2010-11-11 00:00:00	4/72	Kaljo	52.5072098	4.88494587	fietsbrug Jisperdijk, Wijdewormer, NH	Wijdewormer	NH	\N	\N
3039	14-03-2019	2019-03-14 00:00:00	40/241	Coenster	14-03-2019	2019-03-14 00:00:00	40/242	HighKing	52.3884544	4.83294296	achter E-huisje Naritaweg	Amsterdam	NH	\N	\N
311	06-04-2011	2011-04-06 00:00:00	8/71	Bensi	06-04-2011	2011-04-06 00:00:00	8/72	BSI	51.8788834	6.04913187	naast hek Lobberdenseweg, Pannerden, Ge	Pannerden	Ge	\N	\N
489	06-08-2011	2011-08-06 00:00:00	11/37	Richard117	06-08-2011	2011-08-06 00:00:00	11/38	BSI	52.9602013	5.81259108	onder kop-schotel DE - rotonde Sewei, Joure, Fr	Joure	Fr	\N	\N
1538	04-03-2014	2014-03-04 00:00:00	25/10	BSI	05-03-2014	2014-03-05 00:00:00	25/10	Dirtbag	52.2391129	6.210392	aan boom Maagdenburgstraat	Deventer	Ov	\N	\N
4151	20-03-2022	2022-03-20 00:00:00	41/237	pdv_moto	24-03-2022	2022-03-24 00:00:00	41/238	bikedan	51.5188789	3.456743	tegen pootbverwijsbord Joosenweg	Westkapelle	Ze	\N	\N
4235	26-08-2022	2022-08-26 00:00:00	41/294	Deeffox	29-08-2022	2022-08-29 00:00:00	41/294	bikedan	51.7328186	4.63597012	aan hek bij spoorweg polder Oudendijk	Dordrecht	ZH	\N	\N
2827	21-07-2018	2018-07-21 00:00:00	39/73	HighKing	21-07-2018	2018-07-21 00:00:00	39/74	bikedan	51.6096916	4.65461111	in heg bij de Zwartenbergsemolen	Prinsenbeek	NB	\N	\N
1687	17-07-2014	2014-07-17 00:00:00	26/66	Dirtbag	18-07-2014	2014-07-18 00:00:00	26/67	Caun	52.3122368	6.10801792	aan struik - Kletterstraat	Olst	Ov	\N	\N
115	29-10-2010	2010-10-29 00:00:00	4/26	Hasseman	30-10-2010	2010-10-30 00:00:00	4/27	Kwaakmans	52.5819321	6.18408489	Noordelijke Ruitenweg, Lichtmis, Ov	Lichtmis	Ov	\N	\N
1688	19-07-2014	2014-07-19 00:00:00	26/67	Caun	19-07-2014	2014-07-19 00:00:00	26/67	BSI	52.3225632	5.57828093	aan struik Holster Engweg	Ermelo	Ge	\N	\N
990	11-11-2012	2012-11-11 00:00:00	17/85	V-Strommert	12-11-2012	2012-11-12 00:00:00	17/87	Dirk130	52.2341347	4.59072399	achter struik kerk - Hoofdweg	Abbenes	NH	\N	\N
4364	25-06-2023	2023-06-25 00:00:00	41/378	FastEddy	25-06-2023	2023-06-25 00:00:00	41/378	Motor-inator	52.6755524	5.91889811	aan macnine waterloopkundig lab.	Marknesse	Fl	\N	\N
4097	15-01-2022	2022-01-15 00:00:00	41/200	HighKing	15-01-2022	2022-01-15 00:00:00	41/200	Outdoor Man	52.4792099	4.65422821	achter kast Stationsplein	Beverwijk	NH	\N	\N
2031	24-10-2015	2015-10-24 00:00:00	29/85	BSI	25-10-2015	2015-10-25 00:00:00	29/86 	pdv_moto	51.276989	4.073102	onder brug Livingtonstraat	Hulst	Ze	\N	\N
3796	02-02-2021	2021-02-02 00:00:00	40/928	Bomba	03-02-2021	2021-02-03 00:00:00	40/928	pdv_moto	51.9197006	4.17744017	tegen witte paalstomp Rhoneweg	Rotterdam	ZH	\N	\N
970	01-11-2012	2012-11-01 00:00:00	17/58	nannol	02-11-2012	2012-11-02 00:00:00	17/60	Buuv	53.0116196	6.72740889	in hazelaar bij hunebed D13	Eext	Dr	\N	\N
4208	15-06-2022	2022-06-15 00:00:00	41/274	Amauta	16-06-2022	2022-06-16 00:00:00	41/274	Pydejong	53.407074	6.2046032	onder trap bij haven	Lauwersoog	Gr	\N	\N
2987	11-01-2019	2019-01-11 00:00:00	40/168	Ronny Rabbelaar	12-01-2019	2019-01-12 00:00:00	40/169	Amauta	53.3116455	6.88436794	aan trap bij Eemskanaal	Appingedam	Gr	\N	\N
1818	03-01-2015	2015-01-03 00:00:00	27/93	Scoot_020/Scoot_2	04-01-2015	2015-01-04 00:00:00	27/93	Corney28	52.2231941	5.15008211	onder container Zuidloswal	Hilversum	NH	\N	\N
2490	18-07-2017	2017-07-18 00:00:00	35/21	pdv_moto	19-07-2017	2017-07-19 00:00:00	35/21	highking	52.0899887	4.27947712	in bloembak - Stadhouderslaan	Den Haag	ZH	\N	\N
3181	29-07-2019	2019-07-29 00:00:00	40/397	Outdoor Man	29-07-2019	2019-07-29 00:00:00	40/397	Coenster	52.3075676	4.87441301	onder boomstam Park Bankras	Amstelveen	NH	\N	\N
367	11-05-2011	2011-05-11 00:00:00	9/65	Scoot_020/Scoot_2	12-05-2011	2011-05-12 00:00:00	9/66	bobcat	52.3966827	4.7325139	bord 30 km/h.op brug Houtrakkerweg, Halfweg, NH	Halfweg	NH	\N	\N
2608	29-12-2017	2017-12-29 00:00:00	36/90	sanger	29-12-2017	2017-12-29 00:00:00	36/91	BSI	52.2867088	4.96211576	op P-plaats Abcouderstraatweg	Amsterdam	NH	\N	\N
3941	17-06-2021	2021-06-17 00:00:00	41/096	Nelfrikandel	18-06-2021	2021-06-18 00:00:00	41/097	BSI	51.993618	4.78312302	onder struik bij zwembad de Loete	Haastrecht	ZH	\N	\N
4049	17-10-2021	2021-10-17 00:00:00	41/167	FastEddy	18-10-2021	2021-10-18 00:00:00	41/167	Brnk	53.0010643	6.954741	tegen plaatsnaamboord de Vloeivelden	Stadskanaal	Gr	\N	\N
3909	21-05-2021	2021-05-21 00:00:00	41/074	BSI	22-05-2021	2021-05-22 00:00:00	41/074	Ronald_010	52.2286415	5.84867477	tegen hek bij infobord Amersfoortseweg	Hoog Soeren	Ge	\N	\N
2438	27-05-2017	2017-05-27 00:00:00	34/59	Rik60NL	29-05-2017	2017-05-29 00:00:00	34/61	Bas600	52.1368065	4.71316719	in knotwilg - Nieuwkoopseweg	Aarlanderveen	ZH	\N	\N
1802	30-11-2014	2014-11-30 00:00:00	27/78	BSI	06-12-2014	2014-12-06 00:00:00	27/79	Phaedrus	52.1597481	5.56999302	onder afdak infobord - Peutweg	Barneveld	Ge	\N	\N
3679	28-09-2020	2020-09-28 00:00:00	40/832	BSI	29-09-2020	2020-09-29 00:00:00	40/832	pdv_moto	52.1766891	5.61567688	aan hek Stroetweg 	Voorthuizen	Ge	\N	\N
1820	04-01-2015	2015-01-04 00:00:00	27/93	BSI	05-01-2015	2015-01-05 00:00:00	27/94	Rainbow600	52.1418686	5.07994699	bij boom P-terrein Inn Style	Maarssen	Ut	\N	\N
1065	05-02-2013	2013-02-05 00:00:00	18/92	BSI	05-02-2013	2013-02-05 00:00:00	18/93	SadBunny	52.1906662	5.62552309	bij boom - Apeldoornsestraat	Voorthuizen	Ge	\N	\N
3370	02-02-2020	2020-02-02 00:00:00	40/559	Okami_Xci	02-02-2020	2020-02-02 00:00:00	40/559	BSI	51.4231644	5.47009087	in struik bij Genneperwatermolen	Eindhoven	NB	\N	\N
4279	08-01-2023	2023-01-08 00:00:00	41/322	Ronny Rabbelaar	09-01-2023	2023-01-09 00:00:00	41/323	FastEddy	52.5619698	6.73450804	tegen boom Pekeldijk	Radewijk	Ov	\N	\N
355	30-04-2011	2011-04-30 00:00:00	9/43	honda_power	01-05-2011	2011-05-01 00:00:00	9/45	Motoroepoe	52.897316	4.95269585	bij zwerfkei - Westerklief, Wieringen, NH	Wieringen	NH	\N	\N
1909	12-05-2015	2015-05-12 00:00:00	28/74	jaap43	12-05-2015	2015-05-12 00:00:00	28/74	sjors078	51.5730171	4.5399251	aan hek - Vaartweg	Bosschenhoofd	NB	\N	\N
2206	23-08-2016	2016-08-23 00:00:00	31/84	Motormuisje_alice	23-08-2016	2016-08-23 00:00:00	31/85	Bensi	51.5910149	4.91815186	in plantenbak Hoofdstraat	Rijen	NB	\N	\N
1974	28-07-2015	2015-07-28 00:00:00	29/29	Ronald_010	29-07-2015	2015-07-29 00:00:00	29/30	jaap43	52.0114746	4.38002586	in reclamezuil Ikea - Olof Palmerstraat	Delft	ZH	\N	\N
189	09-01-2011	2011-01-09 00:00:00	5/91	bobcat	09-01-2011	2011-01-09 00:00:00	5/93	hplaverda	52.8437538	4.77175188	eendenkooi 't Zand - Korte Bosweg 47, 't Zand, NH	t Zand	NH	\N	\N
2754	11-05-2018	2018-05-11 00:00:00	38/83	BSI	15-05-2018	2018-05-15 00:00:00	38/85	Ronald_010	50.9990158	5.87162018	aan hek Dominicanenwal	Sittard	Li	\N	\N
3852	29-03-2021	2021-03-29 00:00:00	41/023	Bomba	31-03-2021	2021-03-31 00:00:00	41/024	pdv_moto	52.4010506	4.55847692	achter E-kast Zeeweg (N200)	Overveen	NH	\N	\N
479	30-07-2011	2011-07-30 00:00:00	11/28	tdemmer	31-07-2011	2011-07-31 00:00:00	11/29	ndeeka	51.9095497	4.56890678	aan hek - Schaardijk, Krimpen a/d IJssel, ZH	Krimpen aan den IJssel	ZH	\N	\N
1615	02-05-2014	2014-05-02 00:00:00	25/89	Bigtwim	02-05-2014	2014-05-02 00:00:00	25/89	black mule	52.5222015	5.06540012	aan schrikdraad Zeevangsedijk	Edam	NH	\N	\N
1592	13-04-2014	2014-04-13 00:00:00	25/66	Bigtwim	14-04-2014	2014-04-14 00:00:00	25/67	Sjakie-77	52.6201706	4.65053606	hek bij kerk - Heerenweg	Egmond a/d Hoef	NH	\N	\N
1456	31-12-2013	2013-12-31 00:00:00	24/15	Ronald_010	31-12-2013	2013-12-31 00:00:00	24/15	tdemmer	52.0218315	4.47651005	bij buis - Pr. Verburghweg	Berkel en Rodenrijs	ZH	\N	\N
2668	22-03-2018	2018-03-22 00:00:00	37/86	Rik60NL	22-03-2018	2018-03-22 00:00:00	37/87	Hjerteknuser	52.2141685	4.86072016	aan boom Dukaton	Mijdrecht	Ut	\N	\N
1806	10-12-2014	2014-12-10 00:00:00	27/81	Dirk130	13-12-2014	2014-12-13 00:00:00	27/82	Ronald_010	52.0696945	4.26525021	aan boom/hek - Mient	Den Haag	ZH	\N	\N
2523	24-08-2017	2017-08-24 00:00:00	35/64	HighKing	24-08-2017	2017-08-24 00:00:00	35/64	Rik60NL	52.1731262	4.46311092	in heg oprijlaan kasteel Endegeest	Oegstgeest	ZH	\N	\N
3492	07-05-2020	2020-05-07 00:00:00	40/659	Outdoor Man	08-05-2020	2020-05-08 00:00:00	40/660	pdv_moto	51.7405853	5.78030682	tegen lindenboomGentstraat	Gassel	NB	\N	\N
2630	02-02-2018	2018-02-02 00:00:00	37/25	Bosso	03-02-2018	2018-02-03 00:00:00	37/26	Okami_Xci	51.3941002	3.89322805	bij zitbank brasserie de Landing	Baarland	Ze	\N	\N
4263	11-11-2022	2022-11-11 00:00:00	41/311	Outdoor Man	14-11-2022	2022-11-14 00:00:00	41/311	ootje	52.4722977	4.69178915	achter megalegoblok Noorderweg	Beverwijk	NH	\N	\N
3380	12-02-2020	2020-02-12 00:00:00	40/566	ey-dzeej	13-02-2020	2020-02-13 00:00:00	40/566	Picobello BV	51.9658089	4.58401585	aan poot HS-mast Bermweg	Rotterdam	ZH	\N	\N
4187	11-05-2022	2022-05-11 00:00:00	41/260	Marsian	11-05-2022	2022-05-11 00:00:00	41/260	Scoot_020	52.3563271	5.22055817	onder container P=plaars Floriade	Almere	Fl	\N	\N
944	07-10-2012	2012-10-07 00:00:00	17/23	jaap43	08-10-2012	2012-10-08 00:00:00	17/26	Bar-E	51.8919487	4.78844595	achter E-kast - Donkseweg	Brandwijk	ZH	\N	\N
3340	26-12-2019	2019-12-26 00:00:00	40/538	Amauta	30-12-2019	2019-12-30 00:00:00	40/539	Outdoor Man	53.3217316	5.7580142	aan hek bij gemaal de Heining	Marrum	Fr	\N	\N
1050	10-01-2013	2013-01-10 00:00:00	18/60	scheurschuimpje	14-01-2013	2013-01-14 00:00:00	18/64	Corney28	52.8824158	6.00826311	in bloembak - Drafsportstraat	Wolvega	Fr	\N	\N
4366	26-06-2023	2023-06-26 00:00:00	41/379	BSI	28-06-2023	2023-06-28 00:00:00	41/379	Okami_Xci	52.3342972	5.77935791	tegen boomstronk P-plaats Winkel kaz.	Vierhouten	Ge	\N	\N
126	05-11-2010	2010-11-05 00:00:00	4/52	Geert-26	05-11-2010	2010-11-05 00:00:00	4/54	jaap43	51.9596863	4.45566988	Bovendijk - Zestienhoven, Rotterdam, ZH	Rotterdam	ZH	\N	\N
509	21-08-2011	2011-08-21 00:00:00	11/61	BSI	21-08-2011	2011-08-21 00:00:00	11/61	rvdh86	52.0904999	5.34090614	bij paaltje - pyramide v Austerlitz, Woudenberg, Ut	Woudenberg	Ut	\N	\N
4424	05-11-2023	2023-11-05 00:00:00	41/416	Outdoor Man	06-11-2023	2023-11-06 00:00:00	41/416	Janhertog	52.5825272	6.19380617	tegen lichtmast P=terrein "de Lichtmis"	Zwolle	Ov	\N	\N
332	16-04-2011	2011-04-16 00:00:00	9/9	Franko P	17-04-2011	2011-04-17 00:00:00	9/11	Dirtbag	51.3973885	5.11179113	bak zandweg bij spartelvijver, Hooge Mierde, NB	Hooge Mierde	NB	\N	\N
1600	20-04-2014	2014-04-20 00:00:00	25/74	bikedan	20-04-2014	2014-04-20 00:00:00	25/74	Ronald_010	51.5284538	4.30130577	aan boom bij schans fort de Rover	Halsteren	NB	\N	\N
3403	06-03-2020	2020-03-06 00:00:00	40/584	pdv_moto	07-03-2020	2020-03-07 00:00:00	40/585	Outdoor Man	52.1138916	4.28810501	bij P-garage Zwolsestraat	Scheveningen	ZH	\N	\N
61	23-09-2010	2010-09-23 00:00:00	3/6	tdemmer	24-09-2010	2010-09-24 00:00:00	3/7	oehTie	51.6784973	4.13811207	, Brouwersdam, Ze	Brouwersdam	Ze	\N	\N
2278	23-10-2016	2016-10-23 00:00:00	32/73	MeanYellowBoy	23-10-2016	2016-10-23 00:00:00	32/73	Amauta	53.4624748	6.81516886	achter afvalbak Borkumkade	Eemshaven	Gr	\N	\N
4278	07-01-2023	2023-01-07 00:00:00	41/322	SwitchUp	07-01-2023	2023-01-07 00:00:00	41/322	Ronny Rabbelaar	53.4650002	6.75175381	onder hekje veerooster 	Uithuizermeeden	Gr	\N	\N
4430	26-11-2023	2023-11-26 00:00:00	41/419	pdv_moto	27-11-2023	2023-11-27 00:00:00	41/419	Picobello BV	52.0879364	4.26936579	achter hek Houtrustlaan	Den Haag	ZH	\N	\N
864	21-07-2012	2012-07-21 00:00:00	16/48	Buuv	21-07-2012	2012-07-21 00:00:00	16/49	rvdh86	52.2088547	6.09340811	bij kast onder portaal A1	Wilp	Ge	\N	\N
3775	22-12-2020	2020-12-22 00:00:00	40/909	SadBunny	23-12-2020	2020-12-23 00:00:00	40/909	Outdoor Man	51.9702644	5.34457922	in begroeiing op schutting Muntstraat	Wijk bij Duurstede	Ut	\N	\N
1232	04-06-2013	2013-06-04 00:00:00	21/25	Hasseman	04-06-2013	2013-06-04 00:00:00	21/26	rvdh86	52.3058586	6.71869612	aan paal fietspad tegenover Esweg	Borne	Ov	\N	\N
407		0001-01-01 00:00:00 BC		black mule		0001-01-01 00:00:00 BC			\N	\N				\N	\N
658	10-12-2011	2011-12-10 00:00:00	13/75	MotorMieke	11-12-2011	2011-12-11 00:00:00	13/76	Hasseman	52.2473679	6.52309513	boom bij bankje hoek Herikeresweg, Markelo, Ov	Markelo	Ov	\N	\N
1510	11-02-2014	2014-02-11 00:00:00	24/77	tdemmer	12-02-2014	2014-02-12 00:00:00	24/78	dolfijneflipper	52.032402	4.5526309	aan hek treinduct - Craenenborgpad	Bleiswijk	ZH	\N	\N
116	30-10-2010	2010-10-30 00:00:00	4/28	Kwaakmans	30-10-2010	2010-10-30 00:00:00	4/31	zZlaapkopZz	52.6133957	6.40547514	Kategerbos - den Kaat, Hardenberg, Ov	Hardenberg	Ov	\N	\N
4051	21-10-2021	2021-10-21 00:00:00	41/168	BSI	24-10-2021	2021-10-24 00:00:00	41/169	Ronald_010	51.4948692	4.29574823	in bloemperk bij NS station	Bergen op Zoom	NB	\N	\N
3745	13-11-2020	2020-11-13 00:00:00	40/880	BSI	13-11-2020	2020-11-13 00:00:00	40/881	wachtbalkje	52.1617813	5.57119083	aan hekpost Nijkerkseweg	Barneveld	Ge	\N	\N
45	11-09-2010	2010-09-11 00:00:00	2/66	Grote Voet	12-09-2010	2010-09-12 00:00:00	2/67	DutchKingKong	52.0482979	5.55822611	Nieuweweg Noord, Veendendaal, Ge	Veenendaal	Ge	\N	\N
3425	22-03-2020	2020-03-22 00:00:00	40/604	Coenster	22-03-2020	2020-03-22 00:00:00	40/605	vuurbloed	52.3445587	4.68242598	in bosje bij Camperpark N205	Vijfhuizen	NH	\N	\N
1346	07-09-2013	2013-09-07 00:00:00	22/69	V-Strommert	08-09-2013	2013-09-08 00:00:00	22/70	Corney28	53.1738091	5.41169977	achter muurtje bij vuurtoren	Harlingen	Fr	\N	\N
553	24-09-2011	2011-09-24 00:00:00	12/32	rvdh86	25-09-2011	2011-09-25 00:00:00	12/32	Bensi	52.224659	5.70711613	onder beeld van paard - Hooiweg, Garderen, Ge	Garderen	Ge	\N	\N
3064	03-04-2019	2019-04-03 00:00:00	40/260	Roeleey	03-04-2019	2019-04-03 00:00:00	40/260	Coenster	52.2796211	4.96755886	in bord bebouwde kom, Abcouderstraatw.	Amsterdam	NH	\N	\N
2525	24-08-2017	2017-08-24 00:00:00	35/66	Coenster	24-08-2017	2017-08-24 00:00:00	35/66	Hjerteknuser	52.4523773	4.6532979	in boom P-terrein Beeckestijn	Velsen	NH	\N	\N
3010	07-02-2019	2019-02-07 00:00:00	40/201	Roeleey	08-02-2019	2019-02-08 00:00:00	40/201	BSI	52.2891006	4.95861912	achter bord Heliplatform Tafelbergweg	Amsterdam	NH	\N	\N
231	09-02-2011	2011-02-09 00:00:00	7/1	V-Strommert	10-02-2011	2011-02-10 00:00:00	7/2	Sjakie-77	52.2867546	4.96224785	golfterrein - Abcouderstraatweg, Amsterdam, NH	Amsterdam	NH	\N	\N
228		0001-01-01 00:00:00 BC		Stokman		0001-01-01 00:00:00 BC			\N	\N				\N	\N
2400	23-04-2017	2017-04-23 00:00:00	34/24	Arriens	25-04-2017	2017-04-25 00:00:00	34/26	pdv_moto	51.8792953	6.04858017	in installatie - Lobberdenseweg	Pannerden	Ge	\N	\N
3120	16-05-2019	2019-05-16 00:00:00	40/329	Amauta	16-05-2019	2019-05-16 00:00:00	40/329	FastEddy	53.0561829	6.39497423	tegen bakje Spannse Kerkhof	Veenhuizen	Dr	\N	\N
751	25-03-2012	2012-03-25 00:00:00	15/04	Ronald_010	25-03-2012	2012-03-25 00:00:00	15/05	Bomba	52.1195602	4.67429876	in struik bij vangrail - Anslag, Alphen a/d Rijn, ZH	Alphen a/d Rijn	ZH	\N	\N
2209	24-08-2016	2016-08-24 00:00:00	31/87	BSI	25-08-2016	2016-08-25 00:00:00	31/88	Rik60NL	52.1384583	4.67061996	achter E-kast - K. Musterstraat	Alphen a/d Rijn	ZH	\N	\N
2799	26-06-2018	2018-06-26 00:00:00	39/37	frankws	26-06-2018	2018-06-26 00:00:00	39/38	scheurschuimpje	52.7032013	5.7698431	tegen ingesnoerde bol Amsterdamseweg	Emmoloord	Fl	\N	\N
2696	08-04-2018	2018-04-08 00:00:00	38/17	MeanYellowBoy	08-04-2018	2018-04-08 00:00:00	38/17	HermanK	52.4856415	6.45317221	tegen boom oprijlaan Kasteel Eerde	Ommen	Ov	\N	\N
3374	05-02-2020	2020-02-05 00:00:00	40/562	Amauta	05-02-2020	2020-02-05 00:00:00	40/562	frankivo	53.0814781	6.5036149	onder bijenhotel Noordseveld	Norg	Dr	\N	\N
3906	16-05-2021	2021-05-16 00:00:00	41/071	pdv_moto	18-05-2021	2021-05-18 00:00:00	41/072	Sjefman	51.3933372	4.23460197	tegen bermmarkering Gerensweg	Rilland-Bath	Ze	\N	\N
3591	20-07-2020	2020-07-20 00:00:00	40/740	Coenster	20-07-2020	2020-07-20 00:00:00	40/741	Bensi	51.9937248	5.84110498	aan poot reclamebord Stationsweg	Oosterbeek	Ge	\N	\N
899	13-08-2012	2012-08-13 00:00:00	16/76	cock	13-08-2012	2012-08-13 00:00:00	16/77	rvdh86	52.5850906	5.56856585	bij bankje Visvijverweg	Lelystad	Fl	\N	\N
3202	10-08-2019	2019-08-10 00:00:00	40/418	jaap43	10-08-2019	2019-08-10 00:00:00	40/418	Meifesto	51.9886932	4.38492918	in populier Thijsseweg	Delft	ZH	\N	\N
3848	27-03-2021	2021-03-27 00:00:00	41/020	BornToReign	28-03-2021	2021-03-28 00:00:00	41/021	pdv_moto	52.0340233	5.68012094	tegen boom bij Nieuwe Kazernelaan	Ede	Ge	\N	\N
572	10-10-2011	2011-10-10 00:00:00	12/62	Hans89	11-10-2011	2011-10-11 00:00:00	12/63	bakfiets1	51.4557495	3.65327001	naast bunker Rammekensweg, Ritthem, Ze	Ritthem	Ze	\N	\N
2581	04-11-2017	2017-11-04 00:00:00	36/49	tdemmer	05-11-2017	2017-11-05 00:00:00	36/50	jaap43	51.9579582	4.64204597	in trekgat steenover	Nieuwerkerk a/d IJssel	ZH	\N	\N
3810	20-02-2021	2021-02-20 00:00:00	40/938	pdv_moto	20-02-2021	2021-02-20 00:00:00	40/939	Amauta	52.6626511	6.74029016	in perk P-terrein Weeshuisstraat	Coevorden	Dr	\N	\N
3699	12-10-2020	2020-10-12 00:00:00	40/845	ootje	12-10-2020	2020-10-12 00:00:00	40/846	Outdoor Man	52.5641251	4.69477701	in hoek monument Schoolstraat	Limmen	NH	\N	\N
3184	30-07-2019	2019-07-30 00:00:00	40/398	Coenster	30-07-2019	2019-07-30 00:00:00	40/399	Outdoor Man	52.3374405	4.63916397	in heg p-plaats gemaal Cruquius	Cruquius	NH	\N	\N
2713	19-04-2018	2018-04-19 00:00:00	38/40	MeanYellowBoy	19-04-2018	2018-04-19 00:00:00	38/40	HermanK	52.5881653	6.39129686	aan paaltje P-terrein Balkerweg	Ommen	Ov	\N	\N
508	19-08-2011	2011-08-19 00:00:00	11/59	rvdh86	21-08-2011	2011-08-21 00:00:00	11/61	BSI	52.2840462	5.74287224	bij I-bord P-plaats - Uddelermeerweg, Garderen, Ge	Garderen	Ge	\N	\N
3224	29-08-2019	2019-08-29 00:00:00	40/443	pdv_moto	30-08-2019	2019-08-30 00:00:00	40/444	Sjefman	51.4286346	4.224617	bij paaltje fietsroute, carpool Oesterdam	Rilland	Ze	\N	\N
2540	07-09-2017	2017-09-07 00:00:00	35/87	Amauta	08-09-2017	2017-09-08 00:00:00	35/88	Okami_Xci	51.9511147	3.96704793	bij hmpaal 15.5 - Maasvlakte	Rotterdam	ZH	\N	\N
4246	28-09-2022	2022-09-28 00:00:00	41/300	k0en	30-09-2022	2022-09-30 00:00:00	41/300	BSI	52.3483772	5.9622798	aan 60 km-bord Tongerenseweg Zijd	Epe	Ge	\N	\N
3395	29-02-2020	2020-02-29 00:00:00	40/578	pdv_moto	01-03-2020	2020-03-01 00:00:00	40/579	Picobello BV	52.0951004	4.27797604	in bloemperk Pr. Mauritsplein	Den Haag	ZH	\N	\N
2789	19-06-2018	2018-06-19 00:00:00	39/24	BornToReign	20-06-2018	2018-06-20 00:00:00	39/25	HermanK	51.9675713	5.80637121	aan boom Drielse stuw, Fonteinallee	Heelsum	Ut	\N	\N
2098	16-04-2016	2016-04-16 00:00:00	30/67	ronk	16-04-2016	2016-04-16 00:00:00	30/68	Rainbow600	51.8244209	5.02765894	bij knotwilg Dalemse Zelving	Dalem	ZH	\N	\N
4154	30-03-2022	2022-03-30 00:00:00	41/240	pdv_moto	31-03-2022	2022-03-31 00:00:00	41/240	Outdoor Man	51.637928	4.37244081	achter paaltje kerkterrein Stoofdijk	Dinteloord	NB	\N	\N
718	02-03-2012	2012-03-02 00:00:00	14/69	Shadowski	03-03-2012	2012-03-03 00:00:00	14/70	BSI	52.0332451	5.93061399	aan driepoot hek - Apeldoornseweg, Arnhem, Ge	Arnhem	Ge	\N	\N
4262	05-11-2022	2022-11-05 00:00:00	41/310	pdv_moto	10-11-2022	2022-11-10 00:00:00	41/311	Outdoor Man	51.6522217	4.56834698	in heg Carpool Langeweg-Noord	Klundert	NB	\N	\N
3213	16-08-2019	2019-08-16 00:00:00	40/428	Hans89	17-08-2019	2019-08-17 00:00:00	40/428	Carburateur	51.9782753	4.6525178	tegen brugleuning bij gemaal A. Kroes	Moordrecht	ZH	\N	\N
1923	02-06-2015	2015-06-02 00:00:00	28/87	frankivo	04-06-2015	2015-06-04 00:00:00	28/88	Amauta	52.9669685	7.00715017	onder kunstwerk bij gemaal	Musselkanaal	Gr	\N	\N
640	26-11-2011	2011-11-26 00:00:00	13/55	wesleyc	26-11-2011	2011-11-26 00:00:00	13/56	Ronald_010	51.9989853	4.37397623	bij ingang TU EWI - Mekelweg 4, Delft, ZH	Delft	ZH	\N	\N
3930	12-06-2021	2021-06-12 00:00:00	41/090	HermanK	12-06-2021	2021-06-12 00:00:00	41/091	Brnk	52.5596428	6.39610815	tegen plaatsnaambord 	Witharen	Ov	\N	\N
3232	03-09-2019	2019-09-03 00:00:00	40/448	HighKing	04-09-2019	2019-09-04 00:00:00	40/449	ootje	52.4417686	4.75341892	onder boomstronk Molen de Paauw	Assendelft	NH	\N	\N
2405	28-04-2017	2017-04-28 00:00:00	34/30	GromToskamp	28-04-2017	2017-04-28 00:00:00	34/30	Rik60NL	52.1958427	5.00788879	bij oplaadpaal - Zandpad	Nieuwersluis	Ut	\N	\N
3952	23-06-2021	2021-06-23 00:00:00	41/103	BigJim	24-06-2021	2021-06-24 00:00:00	41/104	BSI	52.4355698	4.88842487	tegen landhoofd brug Zuiderlaaik	Oostzaan	NH	\N	\N
1935	14-06-2015	2015-06-14 00:00:00	28/98	Ronald_010	15-06-2015	2015-06-15 00:00:00	28/98	Fenrir-sol	51.8998947	4.58132792	naast E-kast Boelewerf	Ridderkerk	ZH	\N	\N
568	07-10-2011	2011-10-07 00:00:00	12/57	jaap43	08-10-2011	2011-10-08 00:00:00	12/58	Ronald_010	52.0541992	4.90761089	aan hek Engherzandweg, Linschoten, Ut	Linschoten	Ut	\N	\N
3391	23-02-2020	2020-02-23 00:00:00	40/575	Ronald_010	25-02-2020	2020-02-25 00:00:00	40/576	pdv_moto	51.3379517	6.14608097	bij ingang openluchttheater, de Drink	Tegelen	Li	\N	\N
4089	09-01-2022	2022-01-09 00:00:00	41/196	SadBunny	09-01-2022	2022-01-09 00:00:00	41/196	Roeleey	52.4471626	4.83310699	tegen boom Martin Luther Kingweg	Zaandam	NH	\N	\N
513	23-08-2011	2011-08-23 00:00:00	11/65	rvdh86	24-08-2011	2011-08-24 00:00:00	11/66	MotorMieke	52.1604004	5.98665714	in wielstel - emplacement VSM, Lieren, Ge	Lieren	Ge	\N	\N
273	18-03-2011	2011-03-18 00:00:00	8/7	wesleyc	19-03-2011	2011-03-19 00:00:00	8/8	ndeeka	52.0240669	4.18044519	steiger wandelpad Vivaldi-Obrecht, Monster, ZH	Monster	ZH	\N	\N
1334	31-08-2013	2013-08-31 00:00:00	22/55	Bludge	31-08-2013	2013-08-31 00:00:00	22/56	D00fis	51.9618263	5.95701504	aan dijkmonument/doorlaat	Westervoort	Ge	\N	\N
1485	19-01-2014	2014-01-19 00:00:00	24/46	MLB	19-01-2014	2014-01-19 00:00:00	24/46	tdemmer	52.0089607	4.1982398	in natuurspeeltuin - Prinsheerlijk	Naaldwijk	ZH	\N	\N
5	19-08-2010	2010-08-19 00:00:00	1/11	smoffler	20-08-2010	2010-08-20 00:00:00	1/13	Hayfork	51.4775772	4.43457079	Kuilweg/Hopmeerweg, Wouwse Plantage, NB	Wouwse Plantage	NB	\N	\N
2475	04-07-2017	2017-07-04 00:00:00	35/05	1cc1kw1pk	04-07-2017	2017-07-04 00:00:00	35/05	Rik60NL	52.3010788	4.47763777	bij gele paal Langevelderslag	Noordwijk	ZH	\N	\N
2591	14-11-2017	2017-11-14 00:00:00	36/63	RiccardoPTI	15-11-2017	2017-11-15 00:00:00	36/64	Rik60NL	52.2157364	4.42753792	bij ingang P-terrein Huigensstraat	Noordwijk	ZH	\N	\N
1260	01-07-2013	2013-07-01 00:00:00	21/58	Hasseman	01-07-2013	2013-07-01 00:00:00	21/59	Sjantaalfoutje	52.2755394	6.71930885	aan hek ijsbaan - Bornsestraat	Ambt Delden	Ov	\N	\N
3743	10-11-2020	2020-11-10 00:00:00	40/879	Picobello BV	10-11-2020	2020-11-10 00:00:00	40/879	Carburateur	52.0258865	4.61584616	onder schakelkast Louis Dobbelmanweg	Waddinxveen	ZH	\N	\N
4063	10-11-2021	2021-11-10 00:00:00	41/177	k0en	11-11-2021	2021-11-11 00:00:00	41/177	Deeffox	51.7837944	4.98702717	tegen hek bij aquaduct 1landmark 2021	Uitwijk	NB	\N	\N
3635	21-08-2020	2020-08-21 00:00:00	40/795	Phaedrus	21-08-2020	2020-08-21 00:00:00	40/795	Outdoor Man	52.1895256	5.41426277	tegen boom bij trafohuisjes Azoren	Amersfoort	Ut	\N	\N
2547	17-09-2017	2017-09-17 00:00:00	35/99	bikedan	17-09-2017	2017-09-17 00:00:00	35/99	Ronald_010	51.7144966	4.67490816	aan hek Zwaluwsedijk	Lage Zwaluwe	NB	\N	\N
1949	27-06-2015	2015-06-27 00:00:00	29/10	Bensi	28-06-2015	2015-06-28 00:00:00	29/11	Amauta	52.1453934	6.14219284	in takkenril paddenpoel - Voorsterweg	Empe	Ge	\N	\N
1535	02-03-2014	2014-03-02 00:00:00	25/07	BSI	02-03-2014	2014-03-02 00:00:00	25/08	Ronald_010	52.1110458	4.2774601	achter put - Scheveningseslag	Scheveningen	ZH	\N	\N
569	08-10-2011	2011-10-08 00:00:00	12/58	Ronald_010	09-10-2011	2011-10-09 00:00:00	12/59	wesleyc	51.9805946	4.54946089	P-terrein Honingzwampad, Bergschenhoek, ZH	Bergschenhoek	ZH	\N	\N
1193	04-05-2013	2013-05-04 00:00:00	20/64	Roeleey	04-05-2013	2013-05-04 00:00:00	20/64	Ronald_010	52.3636017	4.9195838	aan paal bij Muiderpoort	Amsterdam	NH	\N	\N
4046	14-10-2021	2021-10-14 00:00:00	41/165	Outdoor Man	15-10-2021	2021-10-15 00:00:00	41/165	ootje	52.7062836	4.7131381	aan boompje merel. Rotonde Damweg	Schoorl	NH	\N	\N
1454	29-12-2013	2013-12-29 00:00:00	24/14	Ronald_010	29-12-2013	2013-12-29 00:00:00	24/14	tdemmer	52.0145874	4.68858099	aanstruik Goudkade	Gouda	ZH	\N	\N
4057	31-10-2021	2021-10-31 00:00:00	41/172	Phaedrus	31-10-2021	2021-10-31 00:00:00	41/172	Deeffox	51.8437729	4.62157822	in heg bij restaurant Happy Italy	Hendrik Ido Ambacht	ZH	\N	\N
3214	18-08-2019	2019-08-18 00:00:00	40/429	Carburateur	18-08-2019	2019-08-18 00:00:00	40/429	Ronny Rabbelaar	51.5087509	5.38142776	achter E-huis Ph. Van der Goesstraat	Best	NB	\N	\N
4211	21-06-2022	2022-06-21 00:00:00	41/276	BSI	23-06-2022	2022-06-23 00:00:00	41/276	k0en	52.3041878	5.71536207	onder eekhoorn P-plaats P{oolselaan	Ermelo	Ge	\N	\N
1023	11-12-2012	2012-12-11 00:00:00	18/27	JurgenT	14-12-2012	2012-12-14 00:00:00	18/29	Corney28	51.9324951	6.57633305	achter watertoren Ringweg	Aalten	Ge	\N	\N
3346	04-01-2020	2020-01-04 00:00:00	40/543	WillyvD	11-01-2020	2020-01-11 00:00:00	40/544	Sjefman	51.4644852	3.59132099	tegen boom Marnixplein	Vlissingen	Ze	\N	\N
730	10-03-2012	2012-03-10 00:00:00	14/81	ndeeka	10-03-2012	2012-03-10 00:00:00	14/81	ronk	51.8404388	5.00988102	aan boompje ingang Franklinweg 2, Gorinchem, ZH	Gorinchem	ZH	\N	\N
478	30-07-2011	2011-07-30 00:00:00	11/27	wesleyc	30-07-2011	2011-07-30 00:00:00	11/28	tdemmer	51.9962692	4.29407215	tussen struiken bij kerk van 't Woudt, Schipluiden, ZH	Schipluiden	ZH	\N	\N
2519	20-08-2017	2017-08-20 00:00:00	35/58	HighKing	20-08-2017	2017-08-20 00:00:00	35/58	Amauta	52.5697365	4.74546194	aan meerpalen - NH-kanaal	Akersloot	NH	\N	\N
1350	14-09-2013	2013-09-14 00:00:00	22/77	BSI	14-09-2013	2013-09-14 00:00:00	22/77	bikedan	51.2661514	4.04466391	achter Mariakapelletje - Hogeweg	Hulst	Ze	\N	\N
599	23-10-2011	2011-10-23 00:00:00	12/97	Quickly	24-10-2011	2011-10-24 00:00:00	13/01	tdemmer	52.0954475	5.15102386	aan hek tourniquet Archimedeslaan, Utrecht, Ut	Utrecht	Ut	\N	\N
3259	04-10-2019	2019-10-04 00:00:00	40/472	Sjefman	04-10-2019	2019-10-04 00:00:00	40/473	ey-dzeej	51.8682709	4.37170696	in pand Arentis, Mandemakerstraat	Hoogvliet	ZH	\N	\N
4401	17-09-2023	2023-09-17 00:00:00	41/402	jaap43	17-09-2023	2023-09-17 00:00:00	41/403	scheurschuimpje	52.6365089	5.77997684	tegen hekpaal Schokker ringweg	Schokland (Ens)	Fl	\N	\N
948	11-10-2012	2012-10-11 00:00:00	17/30	Hans89	14-10-2012	2012-10-14 00:00:00	17/32	bikedan	51.4875183	3.947855	begraafplaats - Kits Kinderscheweg	Kapelle	Ze	\N	\N
2840	29-07-2018	2018-07-29 00:00:00	39/89	Bassjunky	30-07-2018	2018-07-30 00:00:00	39/90	Ronny Rabbelaar	53.1424789	7.03790903	Bij Joods monument Israelplein	Winschoten	Gr	\N	\N
916	08-09-2012	2012-09-08 00:00:00	16/94	V-Strommert	09-09-2012	2012-09-09 00:00:00	16/94	Bigtwim	52.4177361	4.55408001	P-terrein Parnassiaweg	Bloemendaal	NH	\N	\N
3429	24-03-2020	2020-03-24 00:00:00	40/607	Hans89	25-03-2020	2020-03-25 00:00:00	40/608	Picobello BV	51.8971443	4.59509182	tegen vogelkijkscherm de Zaag	Krimpen aan den Lek	ZH	\N	\N
3041	15-03-2019	2019-03-15 00:00:00	40/243	Hjerteknuser	16-03-2019	2019-03-16 00:00:00	40/244	pdv_moto	52.7349548	4.77659321	aan boom camping de Bongerd	Tuitjenhorn	NH	\N	\N
2535	02-09-2017	2017-09-02 00:00:00	35/79	Coenster	02-09-2017	2017-09-02 00:00:00	35/79	SadBunny	52.1420288	5.42611122	bij Truimphdealer - Koendert	Leusden	Ut	\N	\N
2074	27-02-2016	2016-02-27 00:00:00	30/34	Janhertog	28-02-2016	2016-02-28 00:00:00	30/35	Amauta	52.788372	6.09148693	in heg - Hooidijk	Steenwijk	Ov	\N	\N
946	09-10-2012	2012-10-09 00:00:00	17/27	tdemmer	09-10-2012	2012-10-09 00:00:00	17/27	motorpsycho	51.5234947	5.02480698	Oude Tilburgsebaan	Riel	NB	\N	\N
1310	16-08-2013	2013-08-16 00:00:00	22/22	rvdh86	16-08-2013	2013-08-16 00:00:00	22/22	BSI	52.3035355	5.72333479	onder dode boom - Oude Zwolseweg	Ermelo	Ge	\N	\N
3175	21-07-2019	2019-07-21 00:00:00	40/391	pdv_moto	22-07-2019	2019-07-22 00:00:00	40/392	Sjefman	52.4611626	4.64446497	in heg bij Landhuis Velserbeek, 	Velzen-Zuid	NH	\N	\N
1858	09-03-2015	2015-03-09 00:00:00	28/25	Bensi	12-03-2015	2015-03-12 00:00:00	28/27	Sjantaalfoutje	51.9668007	6.26892185	aan hek P-plaats - Edisonweg	Doetinchem	Ge	\N	\N
2060	29-01-2016	2016-01-29 00:00:00	30/21	tdemmer	31-01-2016	2016-01-31 00:00:00	30/21	Thijs67	51.9635201	4.93349981	aan hek Lekdijk West	Lopik	Ut	\N	\N
723	05-03-2012	2012-03-05 00:00:00	14/73	jaap43	05-03-2012	2012-03-05 00:00:00	14/75	Ronald_010	51.9421921	4.58773279	in struik P-terrein Bermweg, Capelle a/d IJssel, ZH	Capelle aan den Ijssel	ZH	\N	\N
3741	09-11-2020	2020-11-09 00:00:00	40/878	Picobello BV	10-11-2020	2020-11-10 00:00:00	40/878	Hans89	52.0846329	4.29955101	in [lantenbak Anna Paulonaplein	Den Haag	ZH	\N	\N
3678	27-09-2020	2020-09-27 00:00:00	40/831	Amauta	27-09-2020	2020-09-27 00:00:00	40/832	BSI	52.1120033	6.62311316	in overkapping spiraalheuvel Stokkersweg	Eibergen	Ge	\N	\N
263	08-03-2011	2011-03-08 00:00:00	7/82	Wimis on	09-03-2011	2011-03-09 00:00:00	7/83	tdemmer	52.0404015	5.17472792	einde Futenweide - voordeur mr Q, Houten, Ut	Houten	Ut	\N	\N
3290	31-10-2019	2019-10-31 00:00:00	40/497	Hans89	01-11-2019	2019-11-01 00:00:00	40/497	Picobello BV	51.9293137	4.56542301	aan hek J.A. Beijerinkgemaal, Bermeinde	Capelle aan den Ijssel	ZH	\N	\N
243		0001-01-01 00:00:00 BC				0001-01-01 00:00:00 BC		ronk	\N	\N				\N	\N
660		0001-01-01 00:00:00 BC				0001-01-01 00:00:00 BC		blup blup	\N	\N				\N	\N
3135	05-06-2019	2019-06-05 00:00:00	40/348	ey-dzeej	05-06-2019	2019-06-05 00:00:00	40/348	Mitssz	51.9461479	4.42846203	tegen slagboom Linarabaan	Rotterdam	ZH	\N	\N
1265	03-07-2013	2013-07-03 00:00:00	21/65	Bensi	04-07-2013	2013-07-04 00:00:00	21/66	Smurfke RF	52.0344086	6.10569477	aan paal Doesburgsedijk	Dieren	Ge	\N	\N
4358	14-06-2023	2023-06-14 00:00:00	41/374	BSI	14-06-2023	2023-06-14 00:00:00	41/374	Janhertog	52.7850456	6.28059101	tegen paaltje in heg bij Jan van Luuks	Uffelte	Dr	\N	\N
2428	17-05-2017	2017-05-17 00:00:00	34/50	Amauta	18-05-2017	2017-05-18 00:00:00	34/51	Totl	53.2853546	6.34365892	aan brug - Heereburen	Niehove	Gr	\N	\N
2518	19-08-2017	2017-08-19 00:00:00	35/57	Rik60NL	19-08-2017	2017-08-19 00:00:00	35/57	highking	52.1839333	4.84971523	onder brug/stuw Molenkand	Wilnis	Ut	\N	\N
4254	12-10-2022	2022-10-12 00:00:00	41/303	ootje	14-10-2022	2022-10-14 00:00:00	41/304	HighKing	52.5604591	4.63636684	onder boomstam P-terrein "de Hoep"	Castricum	NH	\N	\N
319		0001-01-01 00:00:00 BC		ronk		0001-01-01 00:00:00 BC			\N	\N				\N	\N
1766	09-10-2014	2014-10-09 00:00:00	27/44	Corney28	10-10-2014	2014-10-10 00:00:00	27/45	Roeleey	52.2320023	4.9774251	aan paal Groenlandsekade	Vinkeveen	Ut	\N	\N
3556	27-06-2020	2020-06-27 00:00:00	40/715	BSI	27-06-2020	2020-06-27 00:00:00	40/715	pdv_moto	52.1726303	5.59627914	tegen rechter post, Oude Zeumerseweg	Voorthuizen	Ge	\N	\N
3751	15-11-2020	2020-11-15 00:00:00	40/884	Thijs67	16-11-2020	2020-11-16 00:00:00	40/885	k0en	52.1394081	5.25170994	aan toegangshek politieacademie	Den Dolder	Ut	\N	\N
1249	23-06-2013	2013-06-23 00:00:00	21/48	Phaedrus	23-06-2013	2013-06-23 00:00:00	21/48	bikedan	51.5295181	4.46950388	aan stronk bij St. Josephskerk	Roosendaal	NB	\N	\N
410	05-06-2011	2011-06-05 00:00:00	10/32	Wimis on	05-06-2011	2011-06-05 00:00:00	10/32	black mule	51.73423	5.27473593	parkeerterrein Treurenburg, 's-Hertogenbosch, NB	s-Hertogenbosch	NB	\N	\N
707	19-02-2012	2012-02-19 00:00:00	14/54	MotorMieke	19-02-2012	2012-02-19 00:00:00	14/56	BSI	52.4922142	6.66335821	onder boom aan plas - Kloosterstraat, Sibculo, Ov	Sibculo	Ov	\N	\N
3707	18-10-2020	2020-10-18 00:00:00	40/851	SadBunny	19-10-2020	2020-10-19 00:00:00	40/851	Yosra87	52.3411865	4.81868792	bij beeld in Siegerpark	Amsterdam	NH	\N	\N
3015	13-02-2019	2019-02-13 00:00:00	40/209	HighKing	15-02-2019	2019-02-15 00:00:00	40/209	Amauta	52.5594063	4.85899782	aan poot infozuil Westdijk	Westbeemster	NH	\N	\N
4124	12-02-2022	2022-02-12 00:00:00	41/218	Coenster	13-02-2022	2022-02-13 00:00:00	41/218	pdv_moto	51.576622	4.71347618	achter boom Liesboslaan	Breda	NB	\N	\N
409	05-06-2011	2011-06-05 00:00:00	10/32	NitroMax	05-06-2011	2011-06-05 00:00:00	10/32	Wimis on	51.73423	5.27473593	parkeerterrein Treurenburg, 's-Hertogenbosch, NB	s-Hertogenbosch	NB	\N	\N
3985	20-07-2021	2021-07-20 00:00:00	41/128	ootje	20-07-2021	2021-07-20 00:00:00	41/128	BigJim	52.5192604	4.77637911	achter stoeprand Kantoorweg	Westknollendam	NH	\N	\N
3868	09-04-2021	2021-04-09 00:00:00	41/035	BSI	10-04-2021	2021-04-10 00:00:00	41/035	pdv_moto	52.315197	6.5350318	onder steiger bij molen ter Horst	Rijssen	Ov	\N	\N
3079	19-04-2019	2019-04-19 00:00:00	40/277	SadBunny	19-04-2019	2019-04-19 00:00:00	40/277	Coenster	52.2836342	4.77673388	tegen hek landingslicht Fokkerweg	Schiphol	NH	\N	\N
3271	16-10-2019	2019-10-16 00:00:00	40/482	Coenster	16-10-2019	2019-10-16 00:00:00	40/482	Artemecion	52.2102013	4.66900682	aan railing W. van der Veldenweg	Leimuiden	ZH	\N	\N
2329	13-01-2017	2017-01-13 00:00:00	33/41	Motormuisje_alice	14-01-2017	2017-01-14 00:00:00	33/43	Ronald_010	51.8601418	4.24385405	aan poot Bucephalus	Heenvliet	ZH	\N	\N
539	15-09-2011	2011-09-15 00:00:00	12/08	Quickly	15-09-2011	2011-09-15 00:00:00	12/09	Wimis on	51.9360313	5.15321016	onder bunkermonument - Diefdijk 4, Zijderveld, Ge	Zijderveld	Ge	\N	\N
2041	12-12-2015	2015-12-12 00:00:00	30/03	BSI	16-12-2015	2015-12-16 00:00:00	30/05	pdv_moto	51.2783203	4.05128479	in heg bij de vos Reynaerde	Hulst	Ze	\N	\N
1756	30-09-2014	2014-09-30 00:00:00	27/36	Hans89	03-10-2014	2014-10-03 00:00:00	27/37	jaap43	51.5836868	3.6644249	aan paaltje Onrustweg	Kamperland	Ze	\N	\N
923	16-09-2012	2012-09-16 00:00:00	17/01	Bigtwim	16-09-2012	2012-09-16 00:00:00	17/02	ootje	52.5619164	4.63281822	in kunstwerk camping Bakkum	Castricum	NH	\N	\N
1448	22-12-2013	2013-12-22 00:00:00	24/09	bikedan	23-12-2013	2013-12-23 00:00:00	24/10	Hans89	51.3806953	4.30401421	aan paal Zuidpolderdijk	Ossendrecht	NB	\N	\N
4255	15-10-2022	2022-10-15 00:00:00	41/304	HighKing	16-10-2022	2022-10-16 00:00:00	41/304	ootje	52.7040787	4.80299807	tegen lantaarnpaal de Mossel	Noordscharwoude	NH	\N	\N
759	31-03-2012	2012-03-31 00:00:00	15/14	scheurschuimpje	01-04-2012	2012-04-01 00:00:00	15/15	Ronald_010	51.8150291	4.66131401	aan poot Giraf - Houttuinen, Dordrecht, ZH	Dordrecht	ZH	\N	\N
4391	20-08-2023	2023-08-20 00:00:00	41/395	Motor-inator	21-08-2023	2023-08-21 00:00:00	41/395	wachtbalkje	52.8187828	6.45885515	tegen boom P=plaats Boslounge	Spier	Dr	\N	\N
3231	02-09-2019	2019-09-02 00:00:00	40/447	Roeleey	03-09-2019	2019-09-03 00:00:00	40/448	HighKing	52.3523903	5.19276094	in poot HS-mast, Videostraat	Almere	Fl	\N	\N
1958	11-07-2015	2015-07-11 00:00:00	29/19	Bensi	13-07-2015	2015-07-13 00:00:00	29/19	BSI	52.1294975	6.43683195	onder liggende boom - Lochemseweg	Barchem	Ge	\N	\N
4024	04-09-2021	2021-09-04 00:00:00	41/150	Artemecion	04-09-2021	2021-09-04 00:00:00	41/151	FastEddy	53.1682205	7.0901618	tegen lantaarnpaal Hoofdstraat	Beerta	Gr	\N	\N
437	18-06-2011	2011-06-18 00:00:00	10/70	artikel5	19-06-2011	2011-06-19 00:00:00	10/72	Outdoor Man	52.5004044	6.05992794	onder kraanrails - Katerveersluis, Katerveer, Ov	Katerveer	Ov	\N	\N
3709	19-10-2020	2020-10-19 00:00:00	40/853	Amauta	20-10-2020	2020-10-20 00:00:00	40/853	Outdoor Man	51.7651558	5.35946321	onder boom bij trekpont haven Marina	Kerkdriel	Ge	\N	\N
2833	26-07-2018	2018-07-26 00:00:00	39/82	SadBunny	27-07-2018	2018-07-27 00:00:00	39/82	pdv_moto	52.0373154	4.33724117	in talud oprit A4	Rijswijk	ZH	\N	\N
4095	13-01-2022	2022-01-13 00:00:00	41/199	Roeleey	13-01-2022	2022-01-13 00:00:00	41/199	Marsian	52.3018112	4.99712801	in wilg P-terrein Valburgdreef	Amsterdam	NH	\N	\N
4354	10-06-2023	2023-06-10 00:00:00	41/372	jaap43	11-06-2023	2023-06-11 00:00:00	41/373	BSI	52.2170372	5.78068495	onder boom P-terrein Grevenhout	Nieuw- Milligen	Ge	\N	\N
1467	09-01-2014	2014-01-09 00:00:00	24/28	rutgertjuh	09-01-2014	2014-01-09 00:00:00	24/29	Corney28	52.0967712	5.12555218	aan beeld "de Wolf" - Wolvenplein	Utrecht	Ut	\N	\N
699	05-02-2012	2012-02-05 00:00:00	14/39	ndeeka	07-02-2012	2012-02-07 00:00:00	14/41	onewheeldrive	52.9691734	5.10838795	in handen Steenzette - Afsluitdijk, den Oever, NH	Den Oever	NH	\N	\N
3093	26-04-2019	2019-04-26 00:00:00	40/290	ootje	27-04-2019	2019-04-27 00:00:00	40/291	HighKing	52.5718689	4.69986582	in perk de Burgerij, Dusseldorperweg	Limmen	NH	\N	\N
643	28-11-2011	2011-11-28 00:00:00	13/58	V-Strommert	28-11-2011	2011-11-28 00:00:00	13/58	BigJim	52.2746391	4.63185596	tegen hek Helsinkilaan, Nieuw-Vennep, NH	Nieuw-Vennep	NH	\N	\N
1280	12-07-2013	2013-07-12 00:00:00	21/82	Ronald_010	12-07-2013	2013-07-12 00:00:00	21/83	MLB	51.8988533	4.34536409	aan betonblok Maasboulevard	Vlaardingen	ZH	\N	\N
3533	06-06-2020	2020-06-06 00:00:00	40/695	pdv_moto	06-06-2020	2020-06-06 00:00:00	40/695	Outdoor Man	52.1311951	4.42446709	aan hekpost Papeweg	Wassenaa	ZH	\N	\N
3195	06-08-2019	2019-08-06 00:00:00	40/410	Marsian	07-08-2019	2019-08-07 00:00:00	40/410	HermanK	52.3659363	5.60804176	achter standbeeld Vruchtbaarheid	Zeewolde	Fl	\N	\N
2607	28-12-2017	2017-12-28 00:00:00	36/90	Hjerteknuser	28-12-2017	2017-12-28 00:00:00	36/90	sanger	52.4776421	4.68512583	in knotwilg - Vuurlinie	Beverwijk	NH	\N	\N
1368	25-09-2013	2013-09-25 00:00:00	22/97	Tankiej	26-09-2013	2013-09-26 00:00:00	22/99	Wimis on	52.0867271	5.47793722	aan paal hek - Oud Willaer	Scherpenzeel	Ge	\N	\N
3237	09-09-2019	2019-09-09 00:00:00	40/452	DKP	12-09-2019	2019-09-12 00:00:00	40/453	pdv_moto	50.7582016	5.6836319	tegen hek meetstation hoogte Maaswater	Eijsden	Li	\N	\N
239	17-02-2011	2011-02-17 00:00:00	7/24	jaap43	18-02-2011	2011-02-18 00:00:00	7/25	rutgertjuh	52.0468216	5.39292479	paaltje hoek Maarnse Grindweg, Maarsbergen, Ut	Maarsbergen	Ut	\N	\N
3966	05-07-2021	2021-07-05 00:00:00	41/115	Outdoor Man	05-07-2021	2021-07-05 00:00:00	41/115	BigJim	52.4017067	4.84788609	onder konijn middenberm Nieuwe Hemweg	Amsterdam	NH	\N	\N
3004	02-02-2019	2019-02-02 00:00:00	40/195	FastEddy	02-02-2019	2019-02-02 00:00:00	40/196	Amauta	53.0395584	6.43838692	in wal achter bankje, de Fledder	Veenhuizen	Dr	\N	\N
3704	17-10-2020	2020-10-17 00:00:00	40/849	pdv_moto	17-10-2020	2020-10-17 00:00:00	40/849	Hans89	52.0687408	4.2313509	achter beeld Flora, M. Vrijenhoeklaan	Den Haag	ZH	\N	\N
3468	22-04-2020	2020-04-22 00:00:00	40/643	Roeleey	22-04-2020	2020-04-22 00:00:00	40/643	SadBunny	52.3247795	4.89489794	achter boomstronk Amsteldijk	Amsterdam	NH	\N	\N
2828	22-07-2018	2018-07-22 00:00:00	39/74	bikedan	22-07-2018	2018-07-22 00:00:00	39/75	pdv_moto	51.4362106	4.23053503	onder steiger B6, Schelderijnkanaal	Rilland	Ze	\N	\N
2731	29-04-2018	2018-04-29 00:00:00	38/61	Ronny Rabbelaar	01-05-2018	2018-05-01 00:00:00	38/63	Outdoor Man	53.3097878	5.62561607	aan peilstation bij de Slikwerker	St. Jacobaparochie	Fr	\N	\N
1710	14-08-2014	2014-08-14 00:00:00	26/93	MotorMieke	14-08-2014	2014-08-14 00:00:00	26/94	bikedan	52.3887634	6.37488604	aan boom Blikweg	Luttenberg	Ov	\N	\N
3054	26-03-2019	2019-03-26 00:00:00	40/253	Schwenneh	26-03-2019	2019-03-26 00:00:00	40/254	ey-dzeej	51.834198	4.58846807	tegen hek Groenesteeg	Zwijndrecht	ZH	\N	\N
1845	22-02-2015	2015-02-22 00:00:00	28/17	Corney28	22-02-2015	2015-02-22 00:00:00	28/17	Roeleey	52.3245544	4.97791719	in P-garage Groenhoven	Amsterdam	NH	\N	\N
3158	03-07-2019	2019-07-03 00:00:00	40/374	Roeleey	04-07-2019	2019-07-04 00:00:00	40/375	BSI	52.2940254	4.95814085	kamer 107, UMC, Meibergdreef	Amsterdam	NH	\N	\N
1573	30-03-2014	2014-03-30 00:00:00	25/48	SadBunny	30-03-2014	2014-03-30 00:00:00	25/48	BSI	52.3278694	4.84308386	onder brug Bosbaanweg	Amstelveen	NH	\N	\N
3710	20-10-2020	2020-10-20 00:00:00	40/853	Outdoor Man	20-10-2020	2020-10-20 00:00:00	40/854	k0en	52.3297424	4.90077019	tegen boom P-terrein Ouderkerkerdijk	Amsterdam	NH	\N	\N
3300	12-11-2019	2019-11-12 00:00:00	40/507	pdv_moto	12-11-2019	2019-11-12 00:00:00	40/508	ey-dzeej	52.0986137	4.30036783	tegen lantaarnpaal Hubertusviaduct	Den Haag	ZH	\N	\N
392	29-05-2011	2011-05-29 00:00:00	10/15	Scoot_020/Scoot_2	29-05-2011	2011-05-29 00:00:00	10/15	Ronald_010	51.9067345	4.43190002	scooterdag - Benj. Franklinstraat, Delfshaven, ZH	Delfshaven	ZH	\N	\N
3914	27-05-2021	2021-05-27 00:00:00	41/077	Hans89	28-05-2021	2021-05-28 00:00:00	41/078	WillyvD	51.8992767	4.43267393	aan hekwerk uitzichtpunt Heyplaatweg	Rotterdam	ZH	\N	\N
1276	09-07-2013	2013-07-09 00:00:00	21/76	Ronald_010	09-07-2013	2013-07-09 00:00:00	21/77	VreemdeBeet	52.1019287	4.50912285	aan infobord Noord Aa	Zoeterwoude	ZH	\N	\N
3643	28-08-2020	2020-08-28 00:00:00	40/803	Amauta	29-08-2020	2020-08-29 00:00:00	40/803	pdv_moto	53.2439308	6.55106115	in put bij stadsmarkering Sprikkenburg	Groningen	Gr	\N	\N
4422	30-10-2023	2023-10-30 00:00:00	41/414	Outdoor Man	31-10-2023	2023-10-31 00:00:00	41/414	ootje	52.612606	4.76322699	tegen bankje Laanenderweg	Alkmaar	NH	\N	\N
2792	22-06-2018	2018-06-22 00:00:00	39/28	Bensi	22-06-2018	2018-06-22 00:00:00	39/29	Raviel	51.9808731	6.57167006	bij Iemenschoer, Irenestraat	Lichtenvoorde	Ge	\N	\N
3484	02-05-2020	2020-05-02 00:00:00	40/653	Picobello BV	02-05-2020	2020-05-02 00:00:00	40/654	Hans89	51.9060249	4.35808611	in perkje onkruid Kon. Wilhelminahaven	Vlaardingen	ZH	\N	\N
3025	27-02-2019	2019-02-27 00:00:00	40/222	Roeleey	27-02-2019	2019-02-27 00:00:00	40/222	Coenster	52.3138428	4.93556404	onder voetbrug Holterbergweg	Duivendrecht	NH	\N	\N
1285	18-07-2013	2013-07-18 00:00:00	21/91	Roeleey	19-07-2013	2013-07-19 00:00:00	21/91	BSI	52.457962	5.05036306	aan paal Hemmeland	Monnikendam	NH	\N	\N
3182	30-07-2019	2019-07-30 00:00:00	40/398	Coenster	30-07-2019	2019-07-30 00:00:00	40/398	Outdoor Man	52.1315384	4.98662376	aan paaltje P-terrein Polderweg	Utrecht	Ut	\N	\N
3782	01-01-2021	2021-01-01 00:00:00	40/914	Hans89	09-01-2021	2021-01-09 00:00:00	40/917	Roeleey	51.503746	3.61019111	achter restant van de Noordpoort	Middelburg	Ze	\N	\N
4087	09-01-2022	2022-01-09 00:00:00	41/195	Roeleey	09-01-2022	2022-01-09 00:00:00	41/195	Outdoor Man	52.3032608	4.97802782	tegen boom P-terrein Langbroekpad	Amsterdam	NH	\N	\N
1672	04-07-2014	2014-07-04 00:00:00	26/51	Sjantaalfoutje	04-07-2014	2014-07-04 00:00:00	26/52	Bludge	52.0175896	6.0578351	aan paal bank S. Carmichelt	de Steeg	Ge	\N	\N
4056	29-10-2021	2021-10-29 00:00:00	41/171	WillyvD	30-10-2021	2021-10-30 00:00:00	41/172	Phaedrus	51.8741951	4.54451418	op wiel bagagewagentje Wendeldijk	Rotterdam	ZH	\N	\N
3416	17-03-2020	2020-03-17 00:00:00	40/595	Outdoor Man	17-03-2020	2020-03-17 00:00:00	40/595	HighKing	52.3179398	4.87547207	tegen struik Prof/ E.M. Meijerslaan	Amstelveen	NH	\N	\N
1198	06-05-2013	2013-05-06 00:00:00	20/69	Meifesto	06-05-2013	2013-05-06 00:00:00	20/70	tdemmer	51.8046951	4.70193911	aan motor - Jan Valsterweg	Dordrecht	ZH	\N	\N
1190	02-05-2013	2013-05-02 00:00:00	20/60	tdemmer	03-05-2013	2013-05-03 00:00:00	20/61	Roeleey	50.8106422	5.881392	in holle boom oprijlaan kasteel	Gulpen	Li	\N	\N
322	09-04-2011	2011-04-09 00:00:00	8/87	ndeeka	10-04-2011	2011-04-10 00:00:00	8/88	Wimis on	51.9043274	4.48304415	Bagagemonument - Wilhelminakade, Rotterdam, ZH	Rotterdam	ZH	\N	\N
2488	16-07-2017	2017-07-16 00:00:00	35/18	tdemmer	18-07-2017	2017-07-18 00:00:00	35/20	jaap43	51.3498764	4.22658587	aan waterinlaat Hedwigepolder	Nieuw-Namen	Ze	\N	\N
142	18-11-2010	2010-11-18 00:00:00	4/95	tdemmer	18-11-2010	2010-11-18 00:00:00	4/96	Wimis on	51.9616165	5.17749691	beersluis fort Everdingen, Goilberdingerdijk, Ge	Goilberdingerdijk	Ge	\N	\N
1540	06-03-2014	2014-03-06 00:00:00	25/11	Smuiger	06-03-2014	2014-03-06 00:00:00	25/11	Scoot_020/Scoot_2	52.4225197	4.79196596	aan boom Siciliëweg	Amsterdam	NH	\N	\N
3935	13-06-2021	2021-06-13 00:00:00	41/093	HermanK	13-06-2021	2021-06-13 00:00:00	41/093	MeanYellowBoy	52.6367912	6.31914186	aan bord op de Hoofdweg	Balkbrug	Ov	\N	\N
2814	11-07-2018	2018-07-11 00:00:00	39/58	Outdoor Man	11-07-2018	2018-07-11 00:00:00	39/58	Roeleey	52.3099289	4.89872789	onder kippenbrug Machineweg	Amstelveen	NH	\N	\N
1266	04-07-2013	2013-07-04 00:00:00	21/66	Smurfke RF	05-07-2013	2013-07-05 00:00:00	21/68	piertje moffel	51.8772125	6.19246387	aan vangrail Eltenseweg - Beek	Montferland	Ge	\N	\N
590	16-10-2011	2011-10-16 00:00:00	12/84	Dirk130	16-10-2011	2011-10-16 00:00:00	12/85	V-Strommert	52.1150322	4.33526897	bij monument Waalsdorpervlakte, Den Haag, ZH	Den Haag	ZH	\N	\N
1943	21-06-2015	2015-06-21 00:00:00	29/05	Veraix	21-06-2015	2015-06-21 00:00:00	29/06	Rik60NL	52.2477188	4.84925795	aan brug - Kerkenbovenweg	Amstelveen	NH	\N	\N
1236	06-06-2013	2013-06-06 00:00:00	21/30	VreemdeBeet	06-06-2013	2013-06-06 00:00:00	21/31	MLB	52.1434402	4.50045776	aan brug naar park Cronesteyn	Leiden	ZH	\N	\N
1254	27-06-2013	2013-06-27 00:00:00	21/53	tdemmer	27-06-2013	2013-06-27 00:00:00	21/53	Phaedrus	51.9009056	4.59513283	aan kraan Lekdijk de Noord	Krimpen aan den Lek	ZH	\N	\N
1	17-08-2010	2010-08-17 00:00:00	1/1	vuurbloed	18-08-2010	2010-08-18 00:00:00	1/2	Schwenneh	52.3373337	4.74053621	Tweeduizend El, Lijnden (Schiphol), NH	Lijnden	NH	\N	\N
2527	26-08-2017	2017-08-26 00:00:00	35/69	Coenster	26-08-2017	2017-08-26 00:00:00	35/69	Rik60NL	52.1372757	4.86258602	tegen E-huis Toegang	Woerdense Verlaat	Ut	\N	\N
919	11-09-2012	2012-09-11 00:00:00	16/96	Bigtwim	12-09-2012	2012-09-12 00:00:00	16/97	BSI	52.6280289	4.75506783	bij boom - Voormeer	Alkmaar	NH	\N	\N
4150	19-03-2022	2022-03-19 00:00:00	41/236	Sjefman	20-03-2022	2022-03-20 00:00:00	41/237	pdv_moto	51.7393494	5.11491013	onder vangrail Hoofdstraat	Genderen	NB	\N	\N
2032	25-10-2015	2015-10-25 00:00:00	29/86	pdv_moto	25-10-2015	2015-10-25 00:00:00	29/87	Amauta	51.5450859	3.46806908	bij paaltje Baaiweg/Trommelweg	Westkapelle	Ze	\N	\N
911	05-09-2012	2012-09-05 00:00:00	16/90	V-Strommert	05-09-2012	2012-09-05 00:00:00	16/90	tdemmer	52.2856369	4.62196922	aan hek N-Randweg	Nieuw-Vennep	NH	\N	\N
3983	20-07-2021	2021-07-20 00:00:00	41/126	Outdoor Man	20-07-2021	2021-07-20 00:00:00	41/127	Artemecion	52.5518799	4.71877098	aan  brugleuning Startingweg	Limmen	NH	\N	\N
444	25-06-2011	2011-06-25 00:00:00	10/81	ndeeka	25-06-2011	2011-06-25 00:00:00	10/81	Wimis on	52.0494156	5.11773014	parkeerterrein voor nachtrit, Nieuwegein, Ut	Nieuwegein	Ut	\N	\N
953	17-10-2012	2012-10-17 00:00:00	17/39	Hans89	19-10-2012	2012-10-19 00:00:00	17/40	bikedan	51.5020485	3.63319302	aan hek boven Dampoorttunnel	Middelburg	Ze	\N	\N
3749	15-11-2020	2020-11-15 00:00:00	40/883	SadBunny	15-11-2020	2020-11-15 00:00:00	40/884	Coenster	52.3850746	4.89340115	in billboard Westerdoksdijk	Amsterdam	NH	\N	\N
2977	01-01-2019	2019-01-01 00:00:00	40/154	bikedan	01-01-2019	2019-01-01 00:00:00	40/154	pdv_moto	51.4818115	4.38863611	in berm Plantagebaan/Zoomstraat	Wouwse Plantage	NB	\N	\N
2642	18-02-2018	2018-02-18 00:00:00	37/47	HermanK	19-02-2018	2018-02-19 00:00:00	37/48	Janhertog	52.4988403	6.23526287	in bosje langs N757 Poppenallee	Dalfsen	Ov	\N	\N
4431	28-11-2023	2023-11-28 00:00:00	41/420	Picobello BV	28-11-2023	2023-11-28 00:00:00	41/420	pdv_moto	52.1430702	4.49198198	in hoek P-terrein Lambdakade	Leiden	ZH	\N	\N
1545	09-03-2014	2014-03-09 00:00:00	25/16	bikedan	09-03-2014	2014-03-09 00:00:00	25/16	Ronald_010	51.4467545	4.37906313	in heg bij kruis - Weg naar Wouw	Huybergen	NB	\N	\N
961	23-10-2012	2012-10-23 00:00:00	17/46	Ronald_010	23-10-2012	2012-10-23 00:00:00	17/47	tdemmer	52.0002518	4.45126009	onder voet beeld - Groenekade	Pijnacker	ZH	\N	\N
3045	18-03-2019	2019-03-18 00:00:00	40/247	Rik60NL	19-03-2019	2019-03-19 00:00:00	40/248	Schwenneh	52.195694	4.75866699	op P-terrein Hogendijk	Nieuwveen	ZH	\N	\N
3776	23-12-2020	2020-12-23 00:00:00	40/910	Outdoor Man	25-12-2020	2020-12-25 00:00:00	40/911	pdv_moto	52.5431175	5.03176785	tegen kijkscherm Klemweg Zeevang	Warder	NH	\N	\N
888	08-08-2012	2012-08-08 00:00:00	16/68	tdemmer	08-08-2012	2012-08-08 00:00:00	16/68	jaap43	51.9656067	4.54472399	in houtstapel Kikkerpad	Rotterdam	ZH	\N	\N
335	18-04-2011	2011-04-18 00:00:00	9/12	Bensi	19-04-2011	2011-04-19 00:00:00	9/14	Dirtbag	52.1393509	6.42518902	stronk bij slagboom - zandpad, Lochemse Berg, Ov	LochemseBerg	Ov	\N	\N
1263	02-07-2013	2013-07-02 00:00:00	21/62	piertje moffel	02-07-2013	2013-07-02 00:00:00	21/63	VreemdeBeet	52.3648796	6.16436291	aan hek zandpad bij Boerlestraat	Wijhe	Ov	\N	\N
4193	22-05-2022	2022-05-22 00:00:00	41/265	FastEddy	25-05-2022	2022-05-25 00:00:00	41/266	BSI	51.8623657	6.06193018	tegen hek Rijn uiterwaard	Millingen aan de Rijn	Ge	\N	\N
4282	15-01-2023	2023-01-15 00:00:00	41/324	FastEddy	20-01-2023	2023-01-20 00:00:00	41/325	Ronny Rabbelaar	53.0457382	7.07499409	onder kruiwagenbak Jaskampenweg	Vlagtwedde	Gr	\N	\N
2312	14-12-2016	2016-12-14 00:00:00	33/19	Ronald_010	15-12-2016	2016-12-15 00:00:00	33/19	ArendJan	52.0016022	4.6505208	Parallelweg Noord	Nieuwerkerk a/d IJssel	ZH	\N	\N
465	16-07-2011	2011-07-16 00:00:00	11/07	Bigtwim	17-07-2011	2011-07-17 00:00:00	11/09	BSI	52.4255562	4.62259912	naast torentje - ruine Brederode, Santpoort-Z, NH	Santpoort	NH	\N	\N
3691	04-10-2020	2020-10-04 00:00:00	40/839	Amauta	04-10-2020	2020-10-04 00:00:00	40/839	pdv_moto	53.2564812	5.98248816	in hoek bij Gemaaltje	Veenwouden	Fr	\N	\N
2898	12-09-2018	2018-09-12 00:00:00	40/50	Outdoor Man	13-09-2018	2018-09-13 00:00:00	40/52	Coenster	52.2160225	4.62670279	aan hek bij Aquadect Ringvaar	Haarlemmermeer	NH	\N	\N
3306	15-11-2019	2019-11-15 00:00:00	40/511	pdv_moto	16-11-2019	2019-11-16 00:00:00	40/512	Hans89	51.5266266	3.43765593	aan lantaarnpaal Achterweg	Westkapelle	Ze	\N	\N
435	16-06-2011	2011-06-16 00:00:00	10/66	Hasseman	17-06-2011	2011-06-17 00:00:00	10/66	Outdoor Man	52.5230255	6.0786581	van motor gehaald - Lortzingstraat, Zwolle, Ov	Zwolle	Ov	\N	\N
1961	17-07-2015	2015-07-17 00:00:00	29/21	Amauta	19-07-2015	2015-07-19 00:00:00	29/22	pdv_moto	52.9631653	6.0256362	achter boom 1e Compagnonsweg	Bontebok	Fr	\N	\N
3028	28-02-2019	2019-02-28 00:00:00	40/225	BSI	01-03-2019	2019-03-01 00:00:00	40/226	Marsian	52.2124557	5.50442505	onder brugje Gasterij de Roode Schuur	Nijkerk	Ge	\N	\N
1682	14-07-2014	2014-07-14 00:00:00	26/60	BSI	14-07-2014	2014-07-14 00:00:00	26/61	Chakotay	52.1627274	5.63213778	achterpaaltje Wencopperweg	Barneveld	Ge	\N	\N
3978	12-07-2021	2021-07-12 00:00:00	41/122	Brnk	14-07-2021	2021-07-14 00:00:00	41/123	Amauta	52.356636	6.63632584	tegen E-kast bij flat Mozartstraat	Almelo	Ov	\N	\N
1057	27-01-2013	2013-01-27 00:00:00	18/75	Bigtwim	29-01-2013	2013-01-29 00:00:00	18/77	Smuiger	52.5463905	4.66369295	onder struik Kerkpad	Castricum	NH	\N	\N
3818	01-03-2021	2021-03-01 00:00:00	40/944	pdv_moto	03-03-2021	2021-03-03 00:00:00	40/945	Picobello BV	52.0724373	4.24070501	in struik de Savornin Lohmanlaan	Den Haag	ZH	\N	\N
3764	14-12-2020	2020-12-14 00:00:00	40/900	Carburateur	14-12-2020	2020-12-14 00:00:00	40/900	Outdoor Man	51.8673058	4.47844696	onder tegels Zuiderparkweg	Rotterdam	ZH	\N	\N
2223	31-08-2016	2016-08-31 00:00:00	31/98	SadBunny	01-09-2016	2016-09-01 00:00:00	31/99	ootje	52.4477806	4.57295179	aan E-kast P-terrein Heerenduinweg	Ijmuiden	NH	\N	\N
3887	24-04-2021	2021-04-24 00:00:00	41/053	MeanYellowBoy	24-04-2021	2021-04-24 00:00:00	41/053	pdv_moto	50.7586899	6.004076	in perkje Gemmenicherweg Wolfhaag	Vaals	Li	\N	\N
4324	17-04-2023	2023-04-17 00:00:00	41/351	BSI	20-04-2023	2023-04-20 00:00:00	41/351	pdv_moto	52.0295486	6.65412712	in klimop paal Meddoseweg	Groenlo	Ge	\N	\N
3240	13-09-2019	2019-09-13 00:00:00	40/456	FastEddy	13-09-2019	2019-09-13 00:00:00	40/456	HermanK	52.6867981	6.77144718	bij bouwsel, Driftplein	Dalen	Dr	\N	\N
1136	25-03-2013	2013-03-25 00:00:00	19/78	Corney28	25-03-2013	2013-03-25 00:00:00	19/79	Scoot_020/Scoot_2	52.2742462	4.97028494	achter pijler brug Voordijk	Abcoude	Ut	\N	\N
3936	14-06-2021	2021-06-14 00:00:00	41/093	MeanYellowBoy	14-06-2021	2021-06-14 00:00:00	41/093	FastEddy	52.5987053	6.37241697	aan poot 60 km-bord Zwolseweg	Balkbrug	Ov	\N	\N
2739	06-05-2018	2018-05-06 00:00:00	38/70	Okami_Xci	06-05-2018	2018-05-06 00:00:00	38/71	Outdoor Man	51.7949829	5.25895596	Onder Billboard Suitsupply	Zaltbommel	Ge	\N	\N
348	26-04-2011	2011-04-26 00:00:00	9/32	lichthuis	27-04-2011	2011-04-27 00:00:00	9/34	BSI	52.3416405	5.68472385	paaltje langs pad Beekhuizerzand, Harderwijk, Ge	Harderwijk	Ge	\N	\N
517	26-08-2011	2011-08-26 00:00:00	11/73	Scoot_020/Scoot_2	28-08-2011	2011-08-28 00:00:00	11/76	Ronald_010	52.3587532	4.87520981	aan boom - P.C.Hooftstraat 183, Amsterdam, NH	Amsterdam	NH	\N	\N
663	16-12-2011	2011-12-16 00:00:00	13/80	Chopperholic	18-12-2011	2011-12-18 00:00:00	13/82	Murof	51.9610252	5.98023415	in struik bij Liemersallee, Westervoort, Ge	Westervoort	Ge	\N	\N
4322	16-04-2023	2023-04-16 00:00:00	41/349	Pydejong	16-04-2023	2023-04-16 00:00:00	41/350	Motor-inator	52.5258217	5.47599316	in struik Kofschip	Lelystad	Fl	\N	\N
1587	11-04-2014	2014-04-11 00:00:00	25/61	Sjantaalfoutje	11-04-2014	2014-04-11 00:00:00	25/62	Rainbow600	52.4426994	5.50234079	aan hek politieacademie	Lelystad	Fl	\N	\N
4347	28-05-2023	2023-05-28 00:00:00	41/367	BSI	29-05-2023	2023-05-29 00:00:00	41/368	Hans89	52.0428047	4.54505682	tegen hekpijler Kruisweg	Bleiswijk	ZH	\N	\N
285	24-03-2011	2011-03-24 00:00:00	8/25	me-daph	24-03-2011	2011-03-24 00:00:00	8/26	BSI	52.123188	5.92575121	parkeerterrein de Rimboe - Krimweg, Hoenderloo, Ge	Hoenderloo	Ge	\N	\N
1819	04-01-2015	2015-01-04 00:00:00	27/93	Corney28	04-01-2015	2015-01-04 00:00:00	27/93	BSI	52.1983032	4.92740011	Donkereind	Vinkeveen	Ut	\N	\N
2163	28-06-2016	2016-06-28 00:00:00	31/37	MP_NL	29-06-2016	2016-06-29 00:00:00	31/37	nappertje	52.3702774	6.61999798	aan paal en hek - Bruglaan	Almelo	Ov	\N	\N
3859	01-04-2021	2021-04-01 00:00:00	41/028	HermanK	01-04-2021	2021-04-01 00:00:00	41/028	MeanYellowBoy	52.5212364	6.33613205	tegen sluisdeur van stuw	Vilsteren	Ov	\N	\N
1641	18-05-2014	2014-05-18 00:00:00	26/11	Hasseman	18-05-2014	2014-05-18 00:00:00	26/11	MotorMieke	52.3044167	6.87567711	aan boompje Beldhuismolenweg	Deuringen	Ov	\N	\N
1744	20-09-2014	2014-09-20 00:00:00	27/27	Djoost	20-09-2014	2014-09-20 00:00:00	27/27	Bigtwim	52.3940697	4.92399502	onder fietsbrug - IJtunnel	Amsterdam	NH	\N	\N
3861	02-04-2021	2021-04-02 00:00:00	41/030	Janhertog	03-04-2021	2021-04-03 00:00:00	41/030	Amauta	53.1032066	6.0962882	achter kastje G. Boelensstraat 	Drachten	Fr	\N	\N
1849	26-02-2015	2015-02-26 00:00:00	28/20	Corney28	27-02-2015	2015-02-27 00:00:00	28/20	NinjaNoob	52.0849304	5.1050148	stand Triumph - jaarbeurs 07B010	Utrecht	Ut	\N	\N
629	16-11-2011	2011-11-16 00:00:00	13/43	Scoot_020/Scoot_2	16-11-2011	2011-11-16 00:00:00	13/44	lynx84	52.3572578	4.815238	muurtje fietstunnel Eastonstraat, Amsterdam, NH	Amsterdam	NH	\N	\N
1100	01-03-2013	2013-03-01 00:00:00	19/32	Roeleey	01-03-2013	2013-03-01 00:00:00	19/32	Sjakie-77	52.3973274	4.574862	aan boom Zeeweg	Overveen	NH	\N	\N
1183	26-04-2013	2013-04-26 00:00:00	20/52	Bludge	26-04-2013	2013-04-26 00:00:00	20/53	rvdh86	51.9867287	6.76684904	onder brug golfclub Voorwisch	Winterswijk	Ge	\N	\N
3607	03-08-2020	2020-08-03 00:00:00	40/762	Okami_Xci	03-08-2020	2020-08-03 00:00:00	40/763	Bensi	51.3843193	6.21615314	tegen poot verkeersbord Douane	Venlo	Li	\N	\N
3057	28-03-2019	2019-03-28 00:00:00	40/255	Rik60NL	28-03-2019	2019-03-28 00:00:00	40/255	pdv_moto	52.1581688	4.72632408	in knotwilg Korterseweg	Ter Aar	ZH	\N	\N
3837	16-03-2021	2021-03-16 00:00:00	41/012	Carburateur	20-03-2021	2021-03-20 00:00:00	41/013	Okami_Xci	51.5047226	5.49638891	onder struik bij Driehoek	Son en Breugel	NB	\N	\N
4230	07-08-2022	2022-08-07 00:00:00	41/287	Amauta	08-08-2022	2022-08-08 00:00:00	41/288	Ronny Rabbelaar	53.2705193	6.45009518	in deuropening theehuis Harkema	den Ham	Gr	\N	\N
2708	15-04-2018	2018-04-15 00:00:00	38/31	BSI	15-04-2018	2018-04-15 00:00:00	38/32	HermanK	52.0371971	5.73571587	bij juffr. Tok	Ede	Ge	\N	\N
1102	02-03-2013	2013-03-02 00:00:00	19/33	Bigtwim	02-03-2013	2013-03-02 00:00:00	19/33	Ronald_010	52.4782906	4.64899111	bank bij voliere - park Scheijbeeck	Beverwijk	NH	\N	\N
3672	21-09-2020	2020-09-21 00:00:00	40/824	Amauta	23-09-2020	2020-09-23 00:00:00	40/825	FastEddy	53.0375023	6.21517992	in struik aan de Moskou	Donkerbroek	Fr	\N	\N
226		0001-01-01 00:00:00 BC				0001-01-01 00:00:00 BC		Stokman	\N	\N				\N	\N
889	08-08-2012	2012-08-08 00:00:00	16/68	jaap43	08-08-2012	2012-08-08 00:00:00	16/68	Ronald_010	52.0859032	4.63090611	achter kastje - Roemer	Hazerswoude-Dorp	ZH	\N	\N
744	19-03-2012	2012-03-19 00:00:00	19/96	Hans89	20-03-2012	2012-03-20 00:00:00	14/96	-Floris-	51.5253105	3.94092393	aan strandpaal Oude Zeedijk, Kattendijke, Ze	Kattendijke	Ze	\N	\N
983	09-11-2012	2012-11-09 00:00:00	17/77	Bigtwim	09-11-2012	2012-11-09 00:00:00	17/79	ootje	52.4922409	4.59196186	achter E-kast Julianaplein	Wijk aan Zee	NH	\N	\N
764	03-04-2012	2012-04-03 00:00:00	15/17	Von Stolk	03-04-2012	2012-04-03 00:00:00	15/18	Bomba	52.102993	4.72058296	aan wegmarkering - Spoorlaan, Zwammerdam, ZH	Zwammerdam	ZH	\N	\N
1904	06-05-2015	2015-05-06 00:00:00	28/70	Bomba	07-05-2015	2015-05-07 00:00:00	28/70	jaap43	52.0449219	4.85118198	aan boom kunstwerk - Spportunnel	Oudewater	Ut	\N	\N
3073	12-04-2019	2019-04-12 00:00:00	40/269	BSI	12-04-2019	2019-04-12 00:00:00	40/269	pdv_moto	52.2603493	5.59837818	in heg mnument Razzia 1944	Putten	Ge	\N	\N
3785	14-01-2021	2021-01-14 00:00:00	40/920	Amauta	16-01-2021	2021-01-16 00:00:00	40/921	FastEddy	53.0649986	6.41180277	tegen paaltje bij Witte bruggetje Slokkert	Een	Dr	\N	\N
4116	07-02-2022	2022-02-07 00:00:00	41/213	ootje	07-02-2022	2022-02-07 00:00:00	41/213	HighKing	52.5025826	4.62258005	tegen putdeksel Waterweg	Heemskerk	NH	\N	\N
4299	06-03-2023	2023-03-06 00:00:00	41/334	DRS930	06-03-2023	2023-03-06 00:00:00	41/335	pdv_moto	51.8399429	4.06444979	onder stapel stenen Haringvlietweg	Hellevoetsluis	ZH	\N	\N
3147	15-06-2019	2019-06-15 00:00:00	40/359	HermanK	16-06-2019	2019-06-16 00:00:00	40/360	FastEddy	52.880825	6.64629221	in heg bij school, Schoolweg	Elp	Dr	\N	\N
3454	13-04-2020	2020-04-13 00:00:00	40/630	pdv_moto	13-04-2020	2020-04-13 00:00:00	40/630	Amauta	53.1376457	6.56873703	in struiken bij bibliotheek	Eelde	Dr	\N	\N
2408	29-04-2017	2017-04-29 00:00:00	34/32	Amauta	29-04-2017	2017-04-29 00:00:00	34/32	HermanK	53.1867676	6.37979984	aan hekwerk - Pasop	Midwolde	Gr	\N	\N
2326	03-01-2017	2017-01-03 00:00:00	33/33	Ronald_010	04-01-2017	2017-01-04 00:00:00	33/34	inSaNo	52.3369064	5.26617193	in beukenhaag Waterlandsepad	Almere	Fl	\N	\N
321	09-04-2011	2011-04-09 00:00:00	8/86	lynx84	09-04-2011	2011-04-09 00:00:00	8/87	ndeeka	51.8172989	4.64906788	cai-kast naast Emmastraat 2, Zwijndrecht, ZH	Zwijndrecht	ZH	\N	\N
1530	27-02-2014	2014-02-27 00:00:00	25/03	Ronald_010	27-02-2014	2014-02-27 00:00:00	25/03	Dirk130	51.9592667	4.45788193	aan hek lang HSL - Teugeweg	Rotterdam	ZH	\N	\N
1886	17-04-2015	2015-04-17 00:00:00	28/56	Amauta	18-04-2015	2015-04-18 00:00:00	28/56	rvdh86	53.1239243	6.44480085	aan boom uitkijktrap - Mensingheweg	Roden	Dr	\N	\N
941	06-10-2012	2012-10-06 00:00:00	17/21	Meifesto	06-10-2012	2012-10-06 00:00:00	17/21	Ronald_010	51.9294319	4.60025883	aan hek Groenendijk	Capelle aan den Ijssel	ZH	\N	\N
2910	20-09-2018	2018-09-20 00:00:00	40/64	Bomba	21-09-2018	2018-09-21 00:00:00	40/65	tdemmer	51.9756584	4.95549107	over loopbrug Lopikerweg Oost	Lopik	Ut	\N	\N
4119	08-02-2022	2022-02-08 00:00:00	41/214	Yosra87	09-02-2022	2022-02-09 00:00:00	41/215	pdv_moto	52.0891228	4.31661797	tegen lantaarnpaal bij Montesori lyceum	Den Haag	ZH	\N	\N
2346	01-03-2017	2017-03-01 00:00:00	33/69	Amauta	01-03-2017	2017-03-01 00:00:00	33/69	BornToReign	52.0235291	5.64104319	in rotonde Laan der Verenigde Naties	Ede	Ge	\N	\N
1772	17-10-2014	2014-10-17 00:00:00	27/50	Djoost	18-10-2014	2014-10-18 00:00:00	27/51	Bigtwim	52.4041328	4.5463748	achter E-huisje P-terrein	Bloemendaal	NH	\N	\N
2730	28-04-2018	2018-04-28 00:00:00	38/60	frankivo	29-04-2018	2018-04-29 00:00:00	38/61	Ronny Rabbelaar	53.0311317	7.04393101	tegen muur fietsenstalling Kerklaan	Onstwedde	Gr	\N	\N
2760	22-05-2018	2018-05-22 00:00:00	38/91	SadBunny	23-05-2018	2018-05-23 00:00:00	38/92	Outdoor Man	52.4014435	4.84913492	onder voiaduct Nieuwe Hemweg	Amsterdam	NH	\N	\N
320	09-04-2011	2011-04-09 00:00:00	8/85	ndeeka	09-04-2011	2011-04-09 00:00:00	8/86	lynx84	51.8796158	4.64486694	Molenkade Neederwaart, Kinderdijk, ZH	Kinderdijk	ZH	\N	\N
3866	07-04-2021	2021-04-07 00:00:00	41/033	BSI	08-04-2021	2021-04-08 00:00:00	41/034	Amauta	52.1780205	5.61082888	achter hek wegafzettong Holzenboschlaan	Voorthuizen	Ge	\N	\N
908	02-09-2012	2012-09-02 00:00:00	16/97	Phaedrus	03-09-2012	2012-09-03 00:00:00	16/88	ndeeka	51.8529396	4.56706715	bij P-terrein Wevershoek - Noldijk	Ridderkerk	ZH	\N	\N
2132	20-05-2016	2016-05-20 00:00:00	31/04	BSI	20-05-2016	2016-05-20 00:00:00	31/04	Scoot_020/Scoot_2	52.3375702	4.85710382	in struik - Buitenveldert	Amsterdam	NH	\N	\N
3872	12-04-2021	2021-04-12 00:00:00	41/038	Outdoor Man	12-04-2021	2021-04-12 00:00:00	41/039	HermanK	52.4441338	5.41475821	tegen vogelkijkhut de Poelruiter	Lelystad	Fl	\N	\N
1120	19-03-2013	2013-03-19 00:00:00	19/60	V-Strommert	19-03-2013	2013-03-19 00:00:00	19/61	Roeleey	52.2618332	4.63003492	aan brugpijler Hoofdweg	Nieuw-Vennep	NH	\N	\N
1831	24-01-2015	2015-01-24 00:00:00	28/05	Ronald_010	26-01-2015	2015-01-26 00:00:00	28/05	tdemmer	52.0573921	4.41418886	bij hek Roeleveenseweg	Den Haag	ZH	\N	\N
1992	15-08-2015	2015-08-15 00:00:00	29/44	Bigtwim	16-08-2015	2015-08-16 00:00:00	29/45	Coenster	52.4605904	4.58590889	in kraam P-terrein Trawlerkade	Ijmuiden	NH	\N	\N
483	01-08-2011	2011-08-01 00:00:00	11/31	rvdh86	01-08-2011	2011-08-01 00:00:00	11/31	BSI	52.2321167	5.73022318	aan boom achter bankje - Koesteeg, Garderen, Ge	Garderen	Ge	\N	\N
4200	30-05-2022	2022-05-30 00:00:00	41/269	Pydejong	30-05-2022	2022-05-30 00:00:00	41/269	Janhertog	53.3997421	6.09907913	tegen hekpost Dyksterwei	Lioessens	Fr	\N	\N
819	07-06-2012	2012-06-07 00:00:00	15/80	Outdoor Man	08-06-2012	2012-06-08 00:00:00	15/81	Ronald_010	52.3199387	4.87273693	aan Boom Uilenstede, Amstelveen, NH	Amstelveen	NH	\N	\N
3900	08-05-2021	2021-05-08 00:00:00	41/065	Amauta	08-05-2021	2021-05-08 00:00:00	41/065	Roeleey	53.1611404	5.86196613	in heg van begraafplaats kerk	Warstiens	Fr	\N	\N
1227	01-06-2013	2013-06-01 00:00:00	21/19	Bludge	01-06-2013	2013-06-01 00:00:00	21/19	rvdh86	51.9441338	5.60139418	aan paal krib 84 - Marsdijk	Opheusden	Ge	\N	\N
3129	30-05-2019	2019-05-30 00:00:00	40/341	HighKing	30-05-2019	2019-05-30 00:00:00	40/342	ootje	53.2018623	5.76595592	aan poot kunstwerk B. Bekkerwei	Leeuwarden	Fr	\N	\N
1966	21-07-2015	2015-07-21 00:00:00	29/25	jaap43	21-07-2015	2015-07-21 00:00:00	29/25	Hans89	51.6931305	4.62932205	aan hek Goederenspoorweg	Moerdijk	NB	\N	\N
3254	01-10-2019	2019-10-01 00:00:00	40/469	pdv_moto	01-10-2019	2019-10-01 00:00:00	40/469	Hans89	52.0989799	4.29422188	in heg bij Ver Huëllbank, Ver Huëllweg, 	Den Haag	ZH	\N	\N
3564	30-06-2020	2020-06-30 00:00:00	40/720	Outdoor Man	01-07-2020	2020-07-01 00:00:00	40/721	Roeleey	52.3177681	4.88876295	in heg P-plaats Saskia van Uylenburgweg	Amstelveen	NH	\N	\N
552	24-09-2011	2011-09-24 00:00:00	12/31	Dark Byte	24-09-2011	2011-09-24 00:00:00	12/32	rvdh86	52.0127563	5.97312117	aan boom Terletseweg, Rozendaal, Ge	Rozendaal	Ge	\N	\N
2168	07-07-2016	2016-07-07 00:00:00	31/41	Motormuisje_alice	07-07-2016	2016-07-07 00:00:00	31/41	-Floris-	51.7833748	3.87134695	bij bushalte Museumbus	Ouddorp	ZH	\N	\N
1015	06-12-2012	2012-12-06 00:00:00	18/23	Hasseman	06-12-2012	2012-12-06 00:00:00	18/23	JurgenT	52.3054848	6.71021414	aan hek zijweg Kuipersweg	Borne	Ov	\N	\N
2903	16-09-2018	2018-09-16 00:00:00	40/57	Okami_Xci	16-09-2018	2018-09-16 00:00:00	40/57	jaap43	52.0276146	6.15553188	in tuin bij Wimis On	Houten	Ut	\N	\N
1101	02-03-2013	2013-03-02 00:00:00	19/32	Sjakie-77	02-03-2013	2013-03-02 00:00:00	19/32	Bigtwim	52.5073967	4.69661188	bij P-plaats Communicatieweg	Heemskerk	NH	\N	\N
651		0001-01-01 00:00:00 BC				0001-01-01 00:00:00 BC		blup blup	\N	\N				\N	\N
3365	26-01-2020	2020-01-26 00:00:00	40/554	BSI	27-01-2020	2020-01-27 00:00:00	40/555	Marsian	52.3704338	5.61484718	tegen beschoeiing Blauwe Droom	Zeewolde	Fl	\N	\N
765	04-04-2012	2012-04-04 00:00:00	15/18	Bomba	04-04-2012	2012-04-04 00:00:00	15/19	Hans89	51.863636	4.37916708	in bloembak Kaasmakersstraat, Hoogvliet, ZH	Hoogvliet	ZH	\N	\N
897	12-08-2012	2012-08-12 00:00:00	16/75	BSI	12-08-2012	2012-08-12 00:00:00	16/75	rvdh86	52.2695007	5.35630798	aan paal van palendijk	Eemdijk	Ut	\N	\N
1534	02-03-2014	2014-03-02 00:00:00	25/07	Bomba	02-03-2014	2014-03-02 00:00:00	25/07	BSI	52.0077438	4.86236906	aan hek Hoenkoopsebuurtweg	Oudewater	Ut	\N	\N
500	15-08-2011	2011-08-15 00:00:00	11/50	Hansss	16-08-2011	2011-08-16 00:00:00	11/51	Scoot_020/Scoot_2	52.5325966	4.77818584	aan brandspuit - Prov.weg - fort, Marken-binnen, NH	Marken	NH	\N	\N
339	20-04-2011	2011-04-20 00:00:00	9/16	dolfijneflipper	20-04-2011	2011-04-20 00:00:00	9/17	Scoot_020/Scoot_2	52.307415	4.87799406	buurthuis Alleman - Bl. Wijngaert, Amstelveen, NH	Amstelveen	NH	\N	\N
2615	13-01-2018	2018-01-13 00:00:00	37/04	-Floris-	16-01-2018	2018-01-16 00:00:00	37/06	pdv_moto	51.4996948	3.61911297	tegen boomstronk Binnenhof	Middelburg	Ze	\N	\N
3157	03-07-2019	2019-07-03 00:00:00	40/374	Coenster	03-07-2019	2019-07-03 00:00:00	40/374	Roeleey	52.2940216	4.95808315	in gang toren G, UMC, Meibergdreef	Amsterdam	NH	\N	\N
1262	01-07-2013	2013-07-01 00:00:00	21/61	Bensi	02-07-2013	2013-07-02 00:00:00	21/62	piertje moffel	52.1510048	6.18033218	aan hek zijweg Vliegendijk	Zutphen	Ge	\N	\N
398		0001-01-01 00:00:00 BC				0001-01-01 00:00:00 BC		Eady	\N	\N				\N	\N
1732	04-09-2014	2014-09-04 00:00:00	27/16	Bomba	04-09-2014	2014-09-04 00:00:00	27/16	MLB	51.8974648	4.31310892	onder pijp langs wandelpad	Vlaardingen	ZH	\N	\N
3835	12-03-2021	2021-03-12 00:00:00	41/010	pdv_moto	16-03-2021	2021-03-16 00:00:00	41/011	Hans89	51.9876823	4.13261318	achter luchtpilaar tankstation v/d Burgweg	Hoek van Holland	ZH	\N	\N
2764	26-05-2018	2018-05-26 00:00:00	38/96	Coenster	27-05-2018	2018-05-27 00:00:00	38/97	Okami_Xci	50.7546654	6.00184488	aan paaltje Gemmenicherweg	Vaals	Li	\N	\N
792	01-05-2012	2012-05-01 00:00:00	15/47	meylie-style	02-05-2012	2012-05-02 00:00:00	15/47	Hans89	51.5220337	4.28820276	aan bosrand Langstraat, Halsteren, NB	Halsteren	NB	\N	\N
2468	25-06-2017	2017-06-25 00:00:00	34/94	BSI	25-06-2017	2017-06-25 00:00:00	34/94	nappertje	52.1187668	5.52364683	achter hek Kunstweg - Postweg	de Glind	Ge	\N	\N
3792	25-01-2021	2021-01-25 00:00:00	40/925	wachtbalkje	29-01-2021	2021-01-29 00:00:00	40/925	BSI	52.3158836	5.90081215	aan poot fietsenrek P-plaats Oranjeweg	Emst	Ge	\N	\N
438	19-06-2011	2011-06-19 00:00:00	10/74	Outdoor Man	20-06-2011	2011-06-20 00:00:00	10/74	BSI	52.3812904	5.30019188	onder poot olifant - knooppunt A6, Almere, Fl	Almere	Fl	\N	\N
140	15-11-2010	2010-11-15 00:00:00	4/89	gjvh	16-11-2010	2010-11-16 00:00:00	4/92	jean99	51.7986908	4.62937498	eind fietspad Donker Duyvisweg, Dordrecht, ZH	Dordrecht	ZH	\N	\N
4369	01-07-2023	2023-07-01 00:00:00	41/381	Bensi	02-07-2023	2023-07-02 00:00:00	41/381	FastEddy	51.897644	6.38229895	tegen hekje bij buru over Oude Ijssel	Ulft	Ge	\N	\N
4289	13-02-2023	2023-02-13 00:00:00	41/328	Outdoor Man	18-02-2023	2023-02-18 00:00:00	41/329	Okami_Xci	51.8137016	5.88074923	op terrein GGZ Pro Persona	Nijmegen	Ge	\N	\N
3502	19-05-2020	2020-05-19 00:00:00	40/667	Picobello BV	19-05-2020	2020-05-19 00:00:00	40/668	Coenster	52.1664047	4.55764389	achter boomstam Bospad	Oude Ade	ZH	\N	\N
3109	08-05-2019	2019-05-08 00:00:00	40/314	HermanK	09-05-2019	2019-05-09 00:00:00	40/315	DUCKI3S	52.2310677	7.04967022	bij grenspaal 858, Dubbeleweg	Overdinkel	Ov	\N	\N
845	01-07-2012	2012-07-01 00:00:00	16/19	Maegrim	02-07-2012	2012-07-02 00:00:00	16/21	Bensi	52.2640495	5.47251081	Erkemederweg	Zeewolde	Fl	\N	\N
98	18-10-2010	2010-10-18 00:00:00	3/78	BigJim	19-10-2010	2010-10-19 00:00:00	3/81	ootje	52.5173225	4.90948296	inundatiesluizen kanaaldijk, Beemster, NH	Beemster	NH	\N	\N
4311	31-03-2023	2023-03-31 00:00:00	41/342	Outdoor Man	03-04-2023	2023-04-03 00:00:00	41/343	Coenster	52.4826317	4.64103079	tegen liggende stam Westerhoutpark	Beverwijk	NH	\N	\N
102	21-10-2010	2010-10-21 00:00:00	3/88	Hasseman	21-10-2010	2010-10-21 00:00:00	3/90	Starscream	52.2406235	6.75665617	Olde Meulenweg, Hengelo, Ov	Hengelo	Ov	\N	\N
1247	20-06-2013	2013-06-20 00:00:00	21/44	BSI	21-06-2013	2013-06-21 00:00:00	21/45	piertje moffel	52.2587624	6.12752199	aan hek Bandijk v/d IJssel	Terwolde	Ge	\N	\N
3264	10-10-2019	2019-10-10 00:00:00	40/476	jaap43	10-10-2019	2019-10-10 00:00:00	40/476	Hans89	51.794384	4.2515378	tegen boom uitzicht Beningerwaard	Zuidland	ZH	\N	\N
419	08-06-2011	2011-06-08 00:00:00	10,40	Scoot_020/Scoot_2	08-06-2011	2011-06-08 00:00:00	10/40	Bigtwim	52.3793716	4.79278612	aan brug eind Herman Bonpad, Amsterdam, NH	Amsterdam	NH	\N	\N
1810	21-12-2014	2014-12-21 00:00:00	27/86	Meangreengirl/MeanBlueMan	21-12-2014	2014-12-21 00:00:00	27/86	Bludge	51.9746361	6.01652002	bij kast windmolen - Nieuwgraafsestraat	Duiven	Ge	\N	\N
1244	17-06-2013	2013-06-17 00:00:00	21/40	Hans89	18-06-2013	2013-06-18 00:00:00	21/41	MLB	51.6373138	3.70186591	achter betonblok lamgs N57	Kamperland	Ze	\N	\N
812	27-05-2012	2012-05-27 00:00:00	15/70	Sander78	01-06-2012	2012-06-01 00:00:00	15/74	Outdoor Man	53.0534019	4.74557877	aan boom bij Fontijnsnol - Rozendijk, Texel, NH	Texel	NH	\N	\N
3769	18-12-2020	2020-12-18 00:00:00	40/905	Outdoor Man	18-12-2020	2020-12-18 00:00:00	40/905	Roeleey	52.3001099	5.16279793	in boom vestingwal Waterkeringpad	Naarden	NH	\N	\N
4284	21-01-2023	2023-01-21 00:00:00	41/325	FastEddy	26-01-2023	2023-01-26 00:00:00	41/326	Amauta	52.9460335	7.13604116	onder brug over Ruiten-Aa	Sellingen	Gr	\N	\N
1982	06-08-2015	2015-08-06 00:00:00	29/35	Corney28	08-08-2015	2015-08-08 00:00:00	29/36	BSI	52.0294533	4.16551924	in bosje P-terrein Strandweg	Ter Heide	ZH	\N	\N
4410	04-10-2023	2023-10-04 00:00:00	41/408	BSI	07-10-2023	2023-10-07 00:00:00	41/408	FastEddy	52.2242165	5.70813179	achter boom bij beelden Hooiweg	Garderen	Ge	\N	\N
3323	13-12-2019	2019-12-13 00:00:00	40/527	Carburateur	13-12-2019	2019-12-13 00:00:00	40/527	Hans89	51.8989143	4.53488398	onder boomstronk eilend Brienenoord	Rotterdam	ZH	\N	\N
3661	12-09-2020	2020-09-12 00:00:00	40/817	Hans89	12-09-2020	2020-09-12 00:00:00	40/817	Picobello BV	51.8989296	4.42347288	aan eind steiger Directiekade	Rotterdam	ZH	\N	\N
2564	13-10-2017	2017-10-13 00:00:00	36/27	Janhertog	14-10-2017	2017-10-14 00:00:00	36/28	Amauta	52.8360481	6.11460686	achter kastje - Jgr van Karnebeeklaan	De Pol	Ov	\N	\N
1423	18-11-2013	2013-11-18 00:00:00	23/79	Phaedrus	18-11-2013	2013-11-18 00:00:00	23/81	Ronald_010	51.9096413	4.53959513	aan hek van trap Brienenoordbrug	Rotterdam	ZH	\N	\N
2234	12-09-2016	2016-09-12 00:00:00	32/10	pdv_moto	12-09-2016	2016-09-12 00:00:00	32/11	Dirk130	52.0983925	4.29944611	achter bord van Stolkpark	Den Haag	ZH	\N	\N
3322	12-12-2019	2019-12-12 00:00:00	40/526	Hans89	13-12-2019	2019-12-13 00:00:00	40/526	Carburateur	51.899231	4.47155905	tegen struikje 3e Katendrechtsehoofd	Rotterdam	ZH	\N	\N
2526	25-08-2017	2017-08-25 00:00:00	35/68	Hjerteknuser	25-08-2017	2017-08-25 00:00:00	35/68	Coenster	52.2866287	4.70897913	bij groene pomp - Taurusavenue	Hoofddorp	NH	\N	\N
49		0001-01-01 00:00:00 BC				0001-01-01 00:00:00 BC		italbike	\N	\N				\N	\N
4309	30-03-2023	2023-03-30 00:00:00	41/341	Outdoor Man	30-03-2023	2023-03-30 00:00:00	41/342	ootje	52.4779625	4.65069723	in omkasting naambord Scheybeeck	Beverwijk	NH	\N	\N
4109	03-02-2022	2022-02-03 00:00:00	41/209	BigJim	03-02-2022	2022-02-03 00:00:00	41/209	ootje	52.7610512	4.84024191	in knotwilg Moerbeek	t Veld	NH	\N	\N
336	19-04-2011	2011-04-19 00:00:00	9/14	Dirtbag	19-04-2011	2011-04-19 00:00:00	9/15	BSI	52.2510033	6.13545704	bij paaltje hoek weg bij Zwarte Pad, Deventer, Ov	Deventer	Ov	\N	\N
3944	20-06-2021	2021-06-20 00:00:00	41/098	Outdoor Man	20-06-2021	2021-06-20 00:00:00	41/099	ootje	52.5801849	4.68476582	in heg bij ingang scouting Kapelweg	Limmen	NH	\N	\N
1058	29-01-2013	2013-01-29 00:00:00	18/78	Smuiger	29-01-2013	2013-01-29 00:00:00	18/78	Bigtwim	52.4644699	4.59061718	aan hek bij kleine sluis	IJmuiden	NH	\N	\N
2844	04-08-2018	2018-08-04 00:00:00	39/95	Amauta	04-08-2018	2018-08-04 00:00:00	39/96	Roeleey	53.0192337	5.20964289	achter bord op Afsluitdijk	Breezanddijk	Fr	\N	\N
1287	20-07-2013	2013-07-20 00:00:00	21/93	Sjantaalfoutje	20-07-2013	2013-07-20 00:00:00	21/94	TheMetalhead	52.0244865	5.89105415	aan paal paardenpad - Deelenseweg	Arnhem	Ge	\N	\N
1677	11-07-2014	2014-07-11 00:00:00	26/56	Bas600	12-07-2014	2014-07-12 00:00:00	26/57	Blogem	52.1122856	5.0499649	in bosje Reactorweg - Lageweide	Utrecht	Ut	\N	\N
3153	23-06-2019	2019-06-23 00:00:00	40/365	pdv_moto	26-06-2019	2019-06-26 00:00:00	40/368	MIA	51.5357094	3.47853208	aan lantaarnpaal hoek Baaiweg	Aagtekerke	Ze	\N	\N
2493	20-07-2017	2017-07-20 00:00:00	35/24	HighKing	21-07-2017	2017-07-21 00:00:00	35/25	BSI	52.6942787	5.22371387	bij lantaarnpaal Industrieweg	Grootebroek	NH	\N	\N
750	25-03-2012	2012-03-25 00:00:00	15/04	ndeeka	25-03-2012	2012-03-25 00:00:00	15/04	Ronald_010	51.8981552	4.46589088	aan poot visser - Charloisse hoofd, Rotterdam, ZH	Rotterdam	ZH	\N	\N
4148	17-03-2022	2022-03-17 00:00:00	41/235	pdv_moto	18-03-2022	2022-03-18 00:00:00	41/235	Deeffox	51.7713127	4.94113588	tegen poot rotondebord Doornseweg	Almkerk	NB	\N	\N
3913	26-05-2021	2021-05-26 00:00:00	41/077	Deeffox	27-05-2021	2021-05-27 00:00:00	41/077	Hans89	51.7788773	4.6910758	tegen boom aan de Schenkeldijk	Dordrecht	ZH	\N	\N
1383	03-10-2013	2013-10-03 00:00:00	23/29	V-Strommert	04-10-2013	2013-10-04 00:00:00	23/30	BSI	52.2702179	4.69162893	in autoband Bennebroekerweg	Hoofddorp	NH	\N	\N
3963	01-07-2021	2021-07-01 00:00:00	41/112	Amauta	01-07-2021	2021-07-01 00:00:00	41/112	FastEddy	53.1723404	7.1822381	tegen blok aswinplek Hamdijk	Bad Nieuweschans	Gr	\N	\N
3083	21-04-2019	2019-04-21 00:00:00	40/280	Amauta	21-04-2019	2019-04-21 00:00:00	40/280	pdv_moto	52.8906593	6.53431988	achter huisje Hondenschool Duddboel	Hooghalen	Dr	\N	\N
3487	04-05-2020	2020-05-04 00:00:00	40/655	HighKing	04-05-2020	2020-05-04 00:00:00	40/655	ootje	52.7261848	4.74299383	in plantsoen bij huis nr. 11	Warmenhuizen	NH	\N	\N
2810	07-07-2018	2018-07-07 00:00:00	39/53	MP_NL	07-07-2018	2018-07-07 00:00:00	39/53	Outdoor Man	52.314209	6.99453592	onder gras Luttermolenweg	de Lutte	Ov	\N	\N
1337	02-09-2013	2013-09-02 00:00:00	22/59	Hasseman	02-09-2013	2013-09-02 00:00:00	22/59	Sjantaalfoutje	52.2943306	6.72550392	aan bord bij beek - Graasweg	Ambt Delden	Ov	\N	\N
2130	18-05-2016	2016-05-18 00:00:00	30/99	Sjantaalfoutje	19-05-2016	2016-05-19 00:00:00	31/02	ErikBloot	52.1826477	5.76827097	aan paal 30 km/h - Heetweg	Kootwijk	Ge	\N	\N
2545	15-09-2017	2017-09-15 00:00:00	35/97	Amauta	16-09-2017	2017-09-16 00:00:00	35/97	Okami_Xci	52.9014435	6.40526819	aan hek tuiblok zendmast	Hooge Smilde	Dr	\N	\N
3434	28-03-2020	2020-03-28 00:00:00	40/612	Outdoor Man	28-03-2020	2020-03-28 00:00:00	40/613	BSI	51.9360046	5.15321207	in doorgezaagde bunker Diefdijk	Zijderveld	Ge	\N	\N
232	10-02-2011	2011-02-10 00:00:00	7/3	Sjakie-77	10-02-2011	2011-02-10 00:00:00	7/3	black mule	52.5173111	4.7455678	hek Lagendijk/Krommenieweg, Uitgeest, NH	Uitgeest	NH	\N	\N
2763	25-05-2018	2018-05-25 00:00:00	38/94	Outdoor Man	25-05-2018	2018-05-25 00:00:00	38/95	Coenster	52.3168869	4.88453102	aan boom S. van Uylenburgweg	Amstelveen	NH	\N	\N
1509	11-02-2014	2014-02-11 00:00:00	24/76	Ronald_010	11-02-2014	2014-02-11 00:00:00	24/77	tdemmer	51.9364815	4.41063976	aan lantaarnpaal Overschieseweg	Rotterdam	ZH	\N	\N
1523	21-02-2014	2014-02-21 00:00:00	24/94	BSI	21-02-2014	2014-02-21 00:00:00	24/94	Bomba	52.0842857	5.10653877	tussen strobalen Jaarbeurs	Utrecht	Ut	\N	\N
11	23-08-2010	2010-08-23 00:00:00	1/25	sjoemie	24-08-2010	2010-08-24 00:00:00	1/31	Primo!	52.6769829	6.19464779	Noordweg 2, Staphorst, Ov	Staphorst	Ov	\N	\N
692	24-01-2012	2012-01-24 00:00:00	14/27	Ronald_010	25-01-2012	2012-01-25 00:00:00	14/27	tdemmer	51.9498978	4.41924477	aan boom - Katershofpad, Rotterdam, ZH	Rotterdam	ZH	\N	\N
4225	24-07-2022	2022-07-24 00:00:00	41/283	FastEddy	28-07-2022	2022-07-28 00:00:00	41/284	Amauta	53.3826637	6.52952909	in struik bij Brintahuisje, Warffummerweg	Rasquert	Gr	\N	\N
3432	27-03-2020	2020-03-27 00:00:00	40/610	Artemecion	27-03-2020	2020-03-27 00:00:00	40/611	Hjerteknuser	52.5242844	4.70205879	in bloembak sporthal de Zien	Uitgeest	NH	\N	\N
555		0001-01-01 00:00:00 BC				0001-01-01 00:00:00 BC		MotorMieke	\N	\N				\N	\N
2829	22-07-2018	2018-07-22 00:00:00	39/76	pdv_moto	24-07-2018	2018-07-24 00:00:00	39/78	Roeleey	52.0895767	4.28313923	in bloembak Johan de Wittlaan	Den Haag	ZH	\N	\N
1035	24-12-2012	2012-12-24 00:00:00	18/36	Ronald_010	24-12-2012	2012-12-24 00:00:00	18/36	Bomba	52.1305656	4.91028214	aan brughek - Ootjespad	Kamerik	Ut	\N	\N
4242	15-09-2022	2022-09-15 00:00:00	41/297	Janhertog	16-09-2022	2022-09-16 00:00:00	41/298	FastEddy	52.7911835	6.09914017	tegen boom bij plattegrond Hooidijk	Steenwijk	Ov	\N	\N
4010	24-08-2021	2021-08-24 00:00:00	41/145	Roeleey	24-08-2021	2021-08-24 00:00:00	41/145	Springbok	51.9052544	6.14905596	achter boom Veldhuizenseweg	Babberich	Ge	\N	\N
3506	21-05-2020	2020-05-21 00:00:00	40/670	Bomba	22-05-2020	2020-05-22 00:00:00	40/671	Amauta	51.5925636	4.55629492	achter E-kat Gors hoek Randweg	Oudenbosch	NB	\N	\N
1669	19-06-2014	2014-06-19 00:00:00	26/45	Sjoerd102	21-06-2014	2014-06-21 00:00:00	26/46	Capo-04/06	51.2294998	6.0682869	aan paal p-terrein de Lanck	Swalmen	Li	\N	\N
3266	11-10-2019	2019-10-11 00:00:00	40/477	Deeffox	12-10-2019	2019-10-12 00:00:00	40/478	Hans89	51.8213997	4.7114892	onder boomstam P-terrein huis te Merwe	Dordrecht	ZH	\N	\N
787	23-04-2012	2012-04-23 00:00:00	15/40	BSI	27-04-2012	2012-04-27 00:00:00	15/43	frankwijers	52.2935905	5.08478403	aan steiger sluis Gravelandseweg, Weesp, Ut	Weesp	Ut	\N	\N
3253	28-09-2019	2019-09-28 00:00:00	40/467	BSI	01-10-2019	2019-10-01 00:00:00	40/469	pdv_moto	52.1929855	5.59648991	tegen paaltje 32 Overhorsterweg	Voorthuizen	Ge	\N	\N
4320	13-04-2023	2023-04-13 00:00:00	41/348	pdv_moto	14-04-2023	2023-04-14 00:00:00	41/348	BSI	52.0031776	5.844419	tegen boom Dreyenseweg	Arnhem	Ge	\N	\N
2262	04-10-2016	2016-10-04 00:00:00	32/48	frankivo	04-10-2016	2016-10-04 00:00:00	32/49	Amauta	53.051796	6.55467606	in tjasker Meesterveen	Zeijen	Dr	\N	\N
2284	29-10-2016	2016-10-29 00:00:00	32/82	Amauta	31-10-2016	2016-10-31 00:00:00	32/83	frankivo	53.0501175	6.60759211	aan hek Oudemolenseweg	Ubbena	Dr	\N	\N
1305	13-08-2013	2013-08-13 00:00:00	22/18	piertje moffel	14-08-2013	2013-08-14 00:00:00	22/19	Ronald_010	52.3385086	6.12502718	aan brugrailing - Kleistraat	Olst	Ov	\N	\N
429		0001-01-01 00:00:00 BC		bobcat		0001-01-01 00:00:00 BC			\N	\N				\N	\N
3897	06-05-2021	2021-05-06 00:00:00	41/063	Amauta	06-05-2021	2021-05-06 00:00:00	41/063	MeanYellowBoy	53.1034966	6.42989922	tegen paaltje p-plaats bij Grote Diep	Langelo	Dr	\N	\N
510	21-08-2011	2011-08-21 00:00:00	11/61	rvdh86	22-08-2011	2011-08-22 00:00:00	11/63	lichthuis	52.2906609	5.6433301	onder hekje op rotonde Drieërweg, Ermelo, Ge	Ermelo	Ge	\N	\N
820	08-06-2012	2012-06-08 00:00:00	15/81	Ronald_010	08-06-2012	2012-06-08 00:00:00	15/82	scheurschuimpje	53.0413933	5.78019524	in plantenbak - Buorren 166, Terherne, Fr	Terherne	Fr	\N	\N
3188	02-08-2019	2019-08-02 00:00:00	40/403	Amauta	02-08-2019	2019-08-02 00:00:00	40/403	pdv_moto	53.350235	5.8666501	aan poot gemeentebord Farreweij	Blije	Fr	\N	\N
2966	25-12-2018	2018-12-25 00:00:00	40/139	pdv_moto	25-12-2018	2018-12-25 00:00:00	40/140	Roeleey	52.3321075	5.05388594	onder ophaalbrug Maxisweg	Muiden	NH	\N	\N
3442	04-04-2020	2020-04-04 00:00:00	40/621	Amauta	05-04-2020	2020-04-05 00:00:00	40/621	pdv_moto	53.3997116	6.09905577	tegen hek veerooster Dyksterwei	Paesens	FR	\N	\N
3576	07-07-2020	2020-07-07 00:00:00	40/730	k0en	07-07-2020	2020-07-07 00:00:00	40/730	pdv_moto	52.0437698	5.10964584	aan knotwilg Amsterdam-Rijnkanaal	Nieuwegein	Ut	\N	\N
4411	07-10-2023	2023-10-07 00:00:00	41/408	FastEddy	08-10-2023	2023-10-08 00:00:00	41/409	Outdoor Man	52.6819077	6.00244904	tegen gaspaal bij Evert van Bentum	Sint Jansklooster	Ov	\N	\N
3754	20-11-2020	2020-11-20 00:00:00	40/887	Okami_Xci	21-11-2020	2020-11-21 00:00:00	40/888	Outdoor Man	51.2292061	5.57869577	in boom bij Hoortweg	Budel Dorplein	NB	\N	\N
1248	21-06-2013	2013-06-21 00:00:00	21/46	piertje moffel	22-06-2013	2013-06-22 00:00:00	21/46	Phaedrus	52.3392677	6.11193323	aan boom Kon. Wilhelminastraat	Olst	Ov	\N	\N
1725	28-08-2014	2014-08-28 00:00:00	27/10	Djoost	28-08-2014	2014-08-28 00:00:00	27/11	Rainbow600	52.2986259	5.28526592	aan steiger - Gooimeerpromenade	Huizen	NH	\N	\N
3549	15-06-2020	2020-06-15 00:00:00	40/706	DKP	20-06-2020	2020-06-20 00:00:00	40/709	pdv_moto	51.4009056	3.49474406	aan paal afrastering fietspad Walendijk	Breskens	Ze	\N	\N
1161	09-04-2013	2013-04-09 00:00:00	20/19	Hans89	09-04-2013	2013-04-09 00:00:00	20/21	SadBunny	51.3860855	3.81331491	onder plank bij fort - fortweg	Ellewoutsdijk	Ze	\N	\N
1799	24-11-2014	2014-11-24 00:00:00	27/76	Janhertog	26-11-2014	2014-11-26 00:00:00	27/76	frankivo	52.7918549	6.10079193	onder klomp rotonde Tukseweg	Tuk	Ov	\N	\N
3917	30-05-2021	2021-05-30 00:00:00	41/079	pdv_moto	01-06-2021	2021-06-01 00:00:00	41/081	Outdoor Man	51.5393257	3.45040488	tegen boom bij kijkscherm Slaakweg	Westkapelle	Ze	\N	\N
2435	24-05-2017	2017-05-24 00:00:00	34/58	Corney28	25-05-2017	2017-05-25 00:00:00	34/58	Rik60NL	51.5476227	5.63566208	achter hek Korenmijt	Beek en Donk	NB	\N	\N
233	11-02-2011	2011-02-11 00:00:00	7/5	black mule	12-02-2011	2011-02-12 00:00:00	7/8	ootje	52.6326866	5.02060223	de Hulk/IJsselmeerdijk 16-21, Hoorn, NH	Hoorn	NH	\N	\N
4083	06-01-2022	2022-01-06 00:00:00	41/193	Outdoor Man	06-01-2022	2022-01-06 00:00:00	41/193	Coenster	52.4179611	4.82830715	in struik bij Kissing Couple, Ankerweg	Amsterdam	NH	\N	\N
3443	05-04-2020	2020-04-05 00:00:00	40/622	pdv_moto	05-04-2020	2020-04-05 00:00:00	40/622	Ronny Rabbelaar	52.6632004	6.10003614	in struik op rotonde N375/N334	Wanneperveen	Ov	\N	\N
414	07-06-2011	2011-06-07 00:00:00	10/36	Kato	07-06-2011	2011-06-07 00:00:00	10/37	lichthuis	52.1305618	5.38797283	boompje bij fietspad/Paradijsweg, Leusden, Ut	Leusden	Ut	\N	\N
359	04-05-2011	2011-05-04 00:00:00	9/52	Kato	05-05-2011	2011-05-05 00:00:00	9/53	tdemmer	52.0735512	5.04310799	boompje in meentpark bij de Gessel, de Meern, Ut	de Meern	Ut	\N	\N
4250	06-10-2022	2022-10-06 00:00:00	41/302	Outdoor Man	07-10-2022	2022-10-07 00:00:00	41/302	BSI	52.3047104	5.31610203	onder brug Gooimerdijk-Oost	Almere	Fl	\N	\N
1752	27-09-2014	2014-09-27 00:00:00	27/33	Bigtwim	27-09-2014	2014-09-27 00:00:00	27/34	Ronald_010	52.4936295	4.6807909	aan motorfiets Black Mule	Heemskerk	NH	\N	\N
2892	05-09-2018	2018-09-05 00:00:00	40/45	FastEddy	06-09-2018	2018-09-06 00:00:00	40/45	BSI	52.9310036	6.84242916	achter hangplek Kanaalstraat	Buinen	Dr	\N	\N
2897	11-09-2018	2018-09-11 00:00:00	40/49	Bensi	12-09-2018	2018-09-12 00:00:00	40/50	Outdoor Man	52.1961327	6.54935789	tegen kiosk landgoed Warmelo	Diepenheim	Ov	\N	\N
2682	31-03-2018	2018-03-31 00:00:00	38/02	SadBunny	31-03-2018	2018-03-31 00:00:00	38/03	vuurbloed	52.4113274	4.67298794	bij knotwilg fort bezuiden Spaarndam	Haarlem	NH	\N	\N
4050	18-10-2021	2021-10-18 00:00:00	41/167	Brnk	20-10-2021	2021-10-20 00:00:00	41/168	BSI	52.3647957	6.7089839	tegen paaltje Gravenallee	Almelo	Ov	\N	\N
1532	01-03-2014	2014-03-01 00:00:00	25/05	Ronald_010	01-03-2014	2014-03-01 00:00:00	25/05	tdemmer	51.9377823	4.3978858	aan hek 's-Gravenlandseweg	Schiedam	ZH	\N	\N
3174	20-07-2019	2019-07-20 00:00:00	40/390	Okami_Xci	21-07-2019	2019-07-21 00:00:00	40/391	pdv_moto	50.9669304	5.93913603	tegen lantaarnpaal 210, Geerweg	Bingelrade	Li	\N	\N
3898	07-05-2021	2021-05-07 00:00:00	41/063	MeanYellowBoy	07-05-2021	2021-05-07 00:00:00	41/064	Ronny Rabbelaar	52.5995827	6.39950323	tegen hek de Omloop	Balkbrug	Ov	\N	\N
1174	19-04-2013	2013-04-19 00:00:00	20/39	vuurbloed	19-04-2013	2013-04-19 00:00:00	20/39	BSI	52.1194916	5.08900785	in fort aan de Klop - 1e polderweg	Utrecht	Ut	\N	\N
2373	05-04-2017	2017-04-05 00:00:00	33/98	frankivo	07-04-2017	2017-04-07 00:00:00	33/99	Amauta	53.0173912	6.90747213	aan monument 1787 - Noorderdiep	Stadskanaal	Gr	\N	\N
1231	03-06-2013	2013-06-03 00:00:00	21/23	Bensi	04-06-2013	2013-06-04 00:00:00	21/24	Hasseman	51.8770027	6.25571108	in struik rotonde Lengelseweg	's-Heerenberg	Ge	\N	\N
1825	13-01-2015	2015-01-13 00:00:00	27/98	Rainbow600	14-01-2015	2015-01-14 00:00:00	27/98	Bas600	52.0031242	5.09409189	onder heg - de Kade	Nieuwegein	Ut	\N	\N
2102	29-04-2016	2016-04-29 00:00:00	30/74	pdv_moto	29-04-2016	2016-04-29 00:00:00	30/75	Dirk130	52.0982742	4.30035782	aan voet boom - Hubertusviaduct	Den Haag	ZH	\N	\N
3066	05-04-2019	2019-04-05 00:00:00	40/262	Roeleey	05-04-2019	2019-04-05 00:00:00	40/462	Coenster	52.4142303	4.79988194	in boom Hornweg	Amsterdam	NH	\N	\N
2034	07-11-2015	2015-11-07 00:00:00	29/91	Bassjunky	11-11-2015	2015-11-11 00:00:00	29/93	Kermit de Hond	53.1303215	6.58786488	aan berk P-terrein Douane	Eelde	Dr	\N	\N
936	24-09-2012	2012-09-24 00:00:00	17/12	scheurschuimpje	27-09-2012	2012-09-27 00:00:00	17/14	Kermit de Hond	52.5495949	5.56700516	in observatorium Swifteringweg	Lelystad	Fl	\N	\N
3657	07-09-2020	2020-09-07 00:00:00	40/813	BSI	08-09-2020	2020-09-08 00:00:00	40/814	Hasseman	52.2128563	6.84413004	tegen berkenboom Usselerrondweg	Enschede	Ov	\N	\N
2843	02-08-2018	2018-08-02 00:00:00	39/94	Ronny Rabbelaar	03-08-2018	2018-08-03 00:00:00	39/95	Amauta	52.838192	7.09273815	bij grenspaal Nederland-Hannover 168	munnekemoer	Gr	\N	\N
3062	30-03-2019	2019-03-30 00:00:00	40/257	Rik60NL	30-03-2019	2019-03-30 00:00:00	40/258	SadBunny	52.2333183	4.87401104	aan boom 1e Velddwarsweg	Waverveen	Ut	\N	\N
2324	31-12-2016	2016-12-31 00:00:00	33/31	SadBunny	02-01-2017	2017-01-02 00:00:00	33/32	pdv_moto	52.436573	4.89056921	aan struik Zuiderlaaik	Oostzaan	NH	\N	\N
1546	09-03-2014	2014-03-09 00:00:00	25/17	Ronald_010	10-03-2014	2014-03-10 00:00:00	25/17	Dirk130	51.9134178	4.26491308	aan hek bij spoor - Vlaardingsedijk	Maassluis	ZH	\N	\N
2360	20-03-2017	2017-03-20 00:00:00	33/81	pdv_moto	21-03-2017	2017-03-21 00:00:00	33/82	PatrickSoler	52.1001854	4.29871988	tegen boom - Nieuwe Parklaan	Den Haag	ZH	\N	\N
2749	09-05-2018	2018-05-09 00:00:00	38/78	Roeleey	09-05-2018	2018-05-09 00:00:00	38/79	Outdoor Man	52.3287392	4.89081621	in boom voetgangersbrug Amstelpark	Amsterdam	NH	\N	\N
1979	02-08-2015	2015-08-02 00:00:00	29/33	BSI	02-08-2015	2015-08-02 00:00:00	29/33	NZo	52.2608833	5.49651289	aan paal toegangshek Arlersteeg	Putten	Ge	\N	\N
78	02-10-2010	2010-10-02 00:00:00	3/38	Bart#89!	02-10-2010	2010-10-02 00:00:00	3/40	V-Strommert	53.4330635	6.58278179	haventje, Noordpolderzijl, Gr	Noordpolderzijl	Gr	\N	\N
3620	12-08-2020	2020-08-12 00:00:00	40/778	pdv_moto	13-08-2020	2020-08-13 00:00:00	40/779	Amauta	52.9529305	6.54069901	aan hek militairterrein de Haar	Assen	Dr	\N	\N
64	24-09-2010	2010-09-24 00:00:00	3/10	tdemmer	25-09-2010	2010-09-25 00:00:00	3/11	Knaakie	51.9537506	4.64459419	Groenedijk 129, Nieuwerkerk, ZH	Nieuwerkerk a/d IJssel	ZH	\N	\N
645	29-11-2011	2011-11-29 00:00:00	13/59	Spro	29-11-2011	2011-11-29 00:00:00	13/60	Bigtwim	52.6363068	4.80132818	bij Poldermuseum, Heerhugowaard, NL	Heerhugowaard	NH	\N	\N
1576	30-03-2014	2014-03-30 00:00:00	25/49	Ronald_010	30-03-2014	2014-03-30 00:00:00	25/49	SadBunny	52.0211792	5.11400414	aan damwand - Sluispad	Nieuwegein	Ut	\N	\N
2116	07-05-2016	2016-05-07 00:00:00	30/86	bikedan	07-05-2016	2016-05-07 00:00:00	30/87	Hans89	51.5975456	4.30858278	onder brug - Oosthavendijk	Steenbergen	NB	\N	\N
566	06-10-2011	2011-10-06 00:00:00	12/54	V-Strommert	06-10-2011	2011-10-06 00:00:00	12/54	Komkommer	52.2615623	4.60832214	aan boompje bij Zuidtangent, Nieuw Vennep, NH	Nieuw-Vennep	NH	\N	\N
3507	22-05-2020	2020-05-22 00:00:00	40/671	Amauta	22-05-2020	2020-05-22 00:00:00	40/672	Ronny Rabbelaar	53.4430962	6.87733221	aan hek strekdam	Eemshaven	Gr	\N	\N
4147	14-03-2022	2022-03-14 00:00:00	41/233	scheurschuimpje	17-03-2022	2022-03-17 00:00:00	41/234	pdv_moto	51.3659515	3.37207007	in struik bij grenspaal 369 bij 't Zwin	Retranchement	Ze	\N	\N
4043	05-10-2021	2021-10-05 00:00:00	41/163	pdv_moto	11-10-2021	2021-10-11 00:00:00	41/164	Roeleey	51.5016823	3.48100305	in plantsoen Zeeuwse Boer, Nieuwstraat	Zoutelande	Ze	\N	\N
554	25-09-2011	2011-09-25 00:00:00	12/33	Sandertjer	25-09-2011	2011-09-25 00:00:00	12/34	Starscream	52.091568	6.723804	aan paaltje bij stuw in de Berkel, Rekken, Ge	Rekken	Ge	\N	\N
3303	13-11-2019	2019-11-13 00:00:00	40/510	Hans89	13-11-2019	2019-11-13 00:00:00	40/510	ey-dzeej	51.9151344	4.56950283	aan brug vijver Franckstraat	Capelle aan den Ijssel	ZH	\N	\N
4192	19-05-2022	2022-05-19 00:00:00	41/264	Amauta	21-05-2022	2022-05-21 00:00:00	41/265	FastEddy	53.1847191	7.2012682	in hoek P-terrein Verlengde Hoofdstraat	Bad Nieuweschans	Gr	\N	\N
3827	08-03-2021	2021-03-08 00:00:00	41/004	ootje	08-03-2021	2021-03-08 00:00:00	41/004	Hjerteknuser	52.5346413	4.67748117	bij paaltje Sander Bruinzeel, Heesterweg	Castricum	NH	\N	\N
277	21-03-2011	2011-03-21 00:00:00	8/12	ndeeka	22-03-2011	2011-03-22 00:00:00	8/13	bakfiets1	51.8842392	5.43771696	onder bankje bij boom - Waalstraat, Tiel, Ge	Tiel	Ge	\N	\N
3285	29-10-2019	2019-10-29 00:00:00	40/493	Coenster	29-10-2019	2019-10-29 00:00:00	40/493	Amauta	52.1288567	5.04888678	tegen heg De Fabrique, Westkanaaldijk 7	Utrecht	Ut	\N	\N
1901	05-05-2015	2015-05-05 00:00:00	28/68	Bar-E	05-05-2015	2015-05-05 00:00:00	28/69	-ErikE-	51.7128792	4.63998604	in heg monument Moerdijkbrug	Moerdijk	NB	\N	\N
3824	06-03-2021	2021-03-06 00:00:00	41/002	Coenster	06-03-2021	2021-03-06 00:00:00	41/002	Outdoor Man	52.2735481	4.98120213	in hoek P-terrein de Witte Dame	Abcoude	Ut	\N	\N
1408	04-11-2013	2013-11-04 00:00:00	23/63	V-Strommert	04-11-2013	2013-11-04 00:00:00	23/63	Scoot_020/Scoot_2	52.2564316	4.62184191	onder boomstam - Hoofdweg	Nieuw-Vennep	NH	\N	\N
809	25-05-2012	2012-05-25 00:00:00	15/67	Sander78	25-05-2012	2012-05-25 00:00:00	15/68	Bigtwim	52.6663017	4.63845491	Verspijckweg, Bergen aan Zee, NH	Bergen aan Zee	NH	\N	\N
833	20-06-2012	2012-06-20 00:00:00	16/03	dks_aa	20-06-2012	2012-06-20 00:00:00	16/04	Bigtwim	52.265274	4.54850912	aan bord ingang Keukenhof, Lisse, ZH	Lisse	ZH	\N	\N
3531	05-06-2020	2020-06-05 00:00:00	40/694	Amauta	05-06-2020	2020-06-05 00:00:00	40/694	MeanYellowBoy	52.9020462	6.85578489	aan hekpost zijweg Buinerweg	Eexlo	Dr	\N	\N
1085	18-02-2013	2013-02-18 00:00:00	19/13	frankivo	20-02-2013	2013-02-20 00:00:00	19/14	Roeleey	52.9344749	6.92667294	onder steen - Mondenweg	Nieuw Buinen	Dr	\N	\N
604	27-10-2011	2011-10-27 00:00:00	13/07	MotorMieke	27-10-2011	2011-10-27 00:00:00	13/08	Hasseman	52.3666115	6.717206	paadje bij sluisdeuren - Gravendijk, Albergen, Ov	Albergen	Ov	\N	\N
1971	23-07-2015	2015-07-23 00:00:00	29/27	Roeleey	23-07-2015	2015-07-23 00:00:00	29/28	BSI	52.3033714	4.94956398	aan boom bij Ikea - Huilenbergweg	Amsterdam	NH	\N	\N
3357	19-01-2020	2020-01-19 00:00:00	40/549	Picobello BV	20-01-2020	2020-01-20 00:00:00	40/550	pdv_moto	52.0329666	4.17199993	tegen hek fietsen P-plaats Molenslag	Monster	ZH	\N	\N
3979	15-07-2021	2021-07-15 00:00:00	41/124	Amauta	18-07-2021	2021-07-18 00:00:00	41/124	FastEddy	53.1242256	7.18583488	bij grenspaal 188	Bellingwolde	Gr	\N	\N
3671	20-09-2020	2020-09-20 00:00:00	40/823	Ronny Rabbelaar	21-09-2020	2020-09-21 00:00:00	40/824	Amauta	52.8737221	7.01537418	aan paaltje Vetstukkerweg	Ter Apel	Gr	\N	\N
340	20-04-2011	2011-04-20 00:00:00	9/18	Scoot_020/Scoot_2	22-04-2011	2011-04-22 00:00:00	9/20	Richard117	52.4151421	4.5531888	parkeerterrein Parnassiaweg, Bloemendaal, NH	Bloemendaal	NH	\N	\N
1900	04-05-2015	2015-05-04 00:00:00	28/67	Bomba	05-05-2015	2015-05-05 00:00:00	28/68	Bar-E	51.8747444	4.37168694	onder plank park Oudelandseweg	Hoogvliet	ZH	\N	\N
3892	30-04-2021	2021-04-30 00:00:00	41/057	HighKing	30-04-2021	2021-04-30 00:00:00	41/059	Coenster	52.3295174	4.64888811	onder "de versteende druppel, Kruisweg	Cruquius	NH	\N	\N
3826	07-03-2021	2021-03-07 00:00:00	41/003	HighKing	07-03-2021	2021-03-07 00:00:00	41/003	ootje	52.5307693	4.65282917	in vork van boom Rijksstraatweg	Castricum	NH	\N	\N
107	24-10-2010	2010-10-24 00:00:00	3/101	Michiel	24-10-2010	2010-10-24 00:00:00	4/1	me-daph	52.263382	7.03022003	Ravenshorsterweg, Losser, Ov	Losser	Ov	\N	\N
2743	07-05-2018	2018-05-07 00:00:00	38/73	HighKing	08-05-2018	2018-05-08 00:00:00	38/74	Coenster	52.4970512	4.71182013	achter monument Communicatieweg	Uitgeest	NH	\N	\N
2483	11-07-2017	2017-07-11 00:00:00	35/14	Rik60NL	11-07-2017	2017-07-11 00:00:00	35/15	Bomba	52.1792145	4.91597509	achter E-huis Gagelweg	Wilnis	Ut	\N	\N
2573	27-10-2017	2017-10-27 00:00:00	36/40	BSI	27-10-2017	2017-10-27 00:00:00	36/40	nappertje	52.1760406	5.57321978	bij knooppunt 99 - Rijksstraatweg	Voorthuizen	Ge	\N	\N
41	09-09-2010	2010-09-09 00:00:00	2/57	Smuiger	10-09-2010	2010-09-10 00:00:00	2/59	Bikermamma	52.7836685	4.73057413	houten brug - Grote Sloot, St. Maartensbrug, NH	St.Maartensbrug	NH	\N	\N
4163	15-04-2022	2022-04-15 00:00:00	41/246	Outdoor Man	15-04-2022	2022-04-15 00:00:00	41/247	ootje	52.4769707	4.68411112	in knotwilg bij fort St. Aagtendijk	Beverwijk	NH	\N	\N
351	28-04-2011	2011-04-28 00:00:00	9/38	scheurschuimpje	29-04-2011	2011-04-29 00:00:00	9/38	black mule	52.5221672	5.43589401	ingang Bataviawerf - Oostvaardersweg, Lelystad, Fl	Lelystad	Fl	\N	\N
2780	16-06-2018	2018-06-16 00:00:00	39/19	SadBunny	16-06-2018	2018-06-16 00:00:00	39/19	Roeleey	52.3700104	4.91170692	tegen hek Entrepot Kadijksplein	Amsterdam	NH	\N	\N
2136	25-05-2016	2016-05-25 00:00:00	31/08	Amauta	26-05-2016	2016-05-26 00:00:00	31/09	SadBunny	53.2196121	6.56856585	achter E-kast Martinikerk	Groningen	Gr	\N	\N
2940	04-11-2018	2018-11-04 00:00:00	40/99	Amauta	04-11-2018	2018-11-04 00:00:00	40/100	FastEddy	53.2560501	6.5096221	in striuik bij Sprikkenburg	Aduard	Gr	\N	\N
2449	05-06-2017	2017-06-05 00:00:00	34/73	jaap43	05-06-2017	2017-06-05 00:00:00	34/73	Bomba	51.9781609	4.72103882	achter E-kast - 't Beijersche	Stolwijk	ZH	\N	\N
2416	09-05-2017	2017-05-09 00:00:00	34/40	Amauta	10-05-2017	2017-05-10 00:00:00	34/41	frankivo	53.1662674	6.67114687	onderkant trap gemaal Onnerpolder	Onnen	Gr	\N	\N
418	08-06-2011	2011-06-08 00:00:00	10/39	Outdoor Man	08-06-2011	2011-06-08 00:00:00	10/39	Scoot_020/Scoot_2	52.3257446	4.78991318	in buis bij sloot - Schipholweg, Amsterdam, NH	Amsterdam	NH	\N	\N
3122	17-05-2019	2019-05-17 00:00:00	40/333	HermanK	21-05-2019	2019-05-21 00:00:00	40/335	DKP	50.88377	5.88841581	in heg bij B&B Huiskenshof	Klimmen	Li	\N	\N
2919	30-09-2018	2018-09-30 00:00:00	40/76	Amauta	30-09-2018	2018-09-30 00:00:00	40/77	Ronny Rabbelaar	53.2519875	6.57355499	bij lantaarnpaal Monument	Wolddijk	Gr	\N	\N
540	15-09-2011	2011-09-15 00:00:00	12/09	Wimis on	15-09-2011	2011-09-15 00:00:00	12/10	BSI	51.991375	5.19361305	onder vlonder wasvrouw - De Brink, Schalkwijk, Ut	Schalkwijk	Ut	\N	\N
4106	01-02-2022	2022-02-01 00:00:00	41/208	Roeleey	02-02-2022	2022-02-02 00:00:00	41/208	Outdoor Man	52.3441467	4.98156881	tegen schakelkast HS/GSM-mast	Diemen	NH	\N	\N
1602	21-04-2014	2014-04-21 00:00:00	25/75	BSI	21-04-2014	2014-04-21 00:00:00	25/76	Sjantaalfoutje	52.4614029	5.81451416	onder lichtstand Stobbenweg	Dronten	Fl	\N	\N
630	17-11-2011	2011-11-17 00:00:00	13/45	lynx84	17-11-2011	2011-11-17 00:00:00	13/46	Ronald_010	51.8294525	4.65360594	plaatsnaambord - Ln v Welhorst, H.I. Ambacht, ZH	H.I.Ambacht	ZH	\N	\N
385		0001-01-01 00:00:00 BC		Buikschuiver oet Dre		0001-01-01 00:00:00 BC			\N	\N				\N	\N
1707	09-08-2014	2014-08-09 00:00:00	26/90	Meangreengirl/MeanBlueMan	09-08-2014	2014-08-09 00:00:00	26/90	BSI	51.283577	4.05325985	in knotwilg bij stadsmolen	Hulst	Ze	\N	\N
1018		0001-01-01 00:00:00 BC		Spike1982		0001-01-01 00:00:00 BC			\N	\N				\N	\N
1835	31-01-2015	2015-01-31 00:00:00	28/07	Wimis on	31-01-2015	2015-01-31 00:00:00	28/08	Ronald_010	52.0134125	5.17682886	onder bank bij kasteel Schonauwen	Houten	Ut	\N	\N
3803	09-02-2021	2021-02-09 00:00:00	40/933	Outdoor Man	10-02-2021	2021-02-10 00:00:00	40/933	SadBunny	52.2444839	5.20971298	in boomstapel Zuiderheide	Laren	NH	\N	\N
421	10-06-2011	2011-06-10 00:00:00	10/43	black mule	10-06-2011	2011-06-10 00:00:00	10/44	vuurbloed	52.3853455	4.80206585	aan vangrail - Australiehavenweg, Amsterdam, NH	Amsterdam	NH	\N	\N
3283	28-10-2019	2019-10-28 00:00:00	40/492	Picobello BV	29-10-2019	2019-10-29 00:00:00	40/492	pdv_moto	51.9375687	4.3273139	tegen paaltje P-plaats Watersportweg	Vlaardingen	ZH	\N	\N
2946	15-11-2018	2018-11-15 00:00:00	40/107	HighKing	15-11-2018	2018-11-15 00:00:00	40/108	Roeleey	52.3390846	4.81824923	bij trekpont Siegerpark	Amsterdam	NH	\N	\N
2028	10-10-2015	2015-10-10 00:00:00	29/80	Bensi	11-10-2015	2015-10-11 00:00:00	29/81	BSI	52.1655884	6.39591503	aan paaltje kunstwerk - Rengersweg	Lochem	Ge	\N	\N
1302	12-08-2013	2013-08-12 00:00:00	22/16	Hasseman	12-08-2013	2013-08-12 00:00:00	22/17	me-daph	52.3543472	6.61835814	aan boom Buitenhaven W-zijde	Almelo	Ov	\N	\N
3525	01-06-2020	2020-06-01 00:00:00	40/686	Amauta	01-06-2020	2020-06-01 00:00:00	40/687	FastEddy	53.1618958	6.43217993	tegen weidepomp Oosteinderlaan	Leutingewolde	Dr	\N	\N
328	13-04-2011	2011-04-13 00:00:00	8/99	JerOen	13-04-2011	2011-04-13 00:00:00	8/99	Richard117	51.4174385	5.35057497	paddestoel Toterfout/Grote Vliet, Veldhoven, NB	Veldhoven	NB	\N	\N
3889	27-04-2021	2021-04-27 00:00:00	41/055	Outdoor Man	27-04-2021	2021-04-27 00:00:00	41/055	HighKing	52.4885445	4.59238577	tegen boom in "Zee van Staal"	Wijk aan Zee	NH	\N	\N
2099	17-04-2016	2016-04-17 00:00:00	30/69	Rainbow600	17-04-2016	2016-04-17 00:00:00	30/69	Amauta	52.9578323	6.52782202	in poort P-terrein TT-circuit	Assen	Dr	\N	\N
4164	15-04-2022	2022-04-15 00:00:00	41/247	ootje	15-04-2022	2022-04-15 00:00:00	41/247	Outdoor Man	52.4985466	4.64547014	bij hek stelling Lunetten	Beverwijk	NH	\N	\N
4296	27-02-2023	2023-02-27 00:00:00	41/333	Hans89	04-03-2023	2023-03-04 00:00:00	41/334	Deeffox	51.875576	4.59170818	onder tractorvand Gr. van Prinstererweg	Ridderkerk	ZH	\N	\N
3539	09-06-2020	2020-06-09 00:00:00	40/699	pdv_moto	10-06-2020	2020-06-10 00:00:00	40/700	Picobello BV	52.0781746	4.25396395	onder afdak bijenhotel Kwartellaan	Den Haag	ZH	\N	\N
797	08-05-2012	2012-05-08 00:00:00	15/52	Kermit de Hond	12-05-2012	2012-05-12 00:00:00	15/54	Buuv	53.2758827	6.73265982	Kollerijweg, Woltersum, Gr	Woltersum	Gr	\N	\N
1869	20-03-2015	2015-03-20 00:00:00	28/34	BSI	22-03-2015	2015-03-22 00:00:00	28/35	ootje	52.1705818	5.55634117	aan paal Ei van Barneveld	Ter Schuur	Ge	\N	\N
2538	05-09-2017	2017-09-05 00:00:00	35/83	HermanK	06-09-2017	2017-09-06 00:00:00	35/84	BSI	52.5984154	6.62004805	aan poot gehuchtsbord	Hardenberg	Ov	\N	\N
3136	05-06-2019	2019-06-05 00:00:00	40/348	Mitssz	05-06-2019	2019-06-05 00:00:00	40/349	ey-dzeej	52.0205727	4.34310007	achter oorlogsmonument 't Haantje	Rijswijk	ZH	\N	\N
532	11-09-2011	2011-09-11 00:00:00	11/99	Hasseman	11-09-2011	2011-09-11 00:00:00	12/02	fien	52.1794052	6.92788506	bij grensstenen 844 - Aamsveenweg, Enschede, Ov	Enschede	Ov	\N	\N
3089	24-04-2019	2019-04-24 00:00:00	40/286	Coenster	25-04-2019	2019-04-25 00:00:00	40/287	Artemecion	52.2497406	4.65256882	in bak Rijnlanderweg	Nieuw-Vennep	NH	\N	\N
4048	17-10-2021	2021-10-17 00:00:00	41/166	HighKing	17-10-2021	2021-10-17 00:00:00	41/167	FastEddy	52.5139465	4.68420219	tegen stenen koe de Velst	Heemskerk	NH	\N	\N
2672	23-03-2018	2018-03-23 00:00:00	37/89	HighKing	24-03-2018	2018-03-24 00:00:00	37/90	Roeleey	52.4629326	4.81016207	achter regenpijp Kogerkerk, Kerkstraat	Koog aan de Zaan	NH	\N	\N
2355	16-03-2017	2017-03-16 00:00:00	33/77	Amauta	16-03-2017	2017-03-16 00:00:00	33/77	Coenster	52.2378883	4.79018211	bij infobord fort bij de Kwakel	De Kwakel	NH	\N	\N
1362	22-09-2013	2013-09-22 00:00:00	22/87	Buuv	22-09-2013	2013-09-22 00:00:00	22/89	V-Strommert	53.0876656	6.60463905	in greppel bij beeld dansende haas	Tynaarlo	Dr	\N	\N
2933	20-10-2018	2018-10-20 00:00:00	40/92	ootje	21-10-2018	2018-10-21 00:00:00	40/92	Amauta	51.4590034	6.17134619	aan hek Laagveldweg	Lottum	NB	\N	\N
1955	06-07-2015	2015-07-06 00:00:00	29/16	Kermit de Hond	09-07-2015	2015-07-09 00:00:00	29/17	frankivo	53.0619087	5.52479696	bij boom Broereplein	Bolsward	Fr	\N	\N
1218	21-05-2013	2013-05-21 00:00:00	20/98	BSI	21-05-2013	2013-05-21 00:00:00	21-01	Hasseman	52.4035187	7.03483009	in heg bij grenssteen 047	Denekamp	Ov	\N	\N
1412	09-11-2013	2013-11-09 00:00:00	23/68	Wimis on	09-11-2013	2013-11-09 00:00:00	23/68	dolfijneflipper	52.0156364	5.06532478	Highlands - Hoogland	Ijsselstein	Ut	\N	\N
2218	29-08-2016	2016-08-29 00:00:00	31/95	Einschtein	30-08-2016	2016-08-30 00:00:00	31/95	Rainbow600	52.3307686	5.07286692	aan hek wandelroute Muiderslot	Muiden	NH	\N	\N
526	06-09-2011	2011-09-06 00:00:00	11/90	Kermit de Hond	07-09-2011	2011-09-07 00:00:00	11/91	Buuv	53.2001419	6.646173	onder paal kaartspel - Weendersweg, Groningen, Gr	Groningen	Gr	\N	\N
2242	18-09-2016	2016-09-18 00:00:00	32/20	pdv_moto	19-09-2016	2016-09-19 00:00:00	32/21	Dirk130	52.0893707	4.282022	in rietpol - Pres. Kennedylaan	Den Haag	ZH	\N	\N
595	21-10-2011	2011-10-21 00:00:00	12/93	Scoot_020/Scoot_2	21-10-2011	2011-10-21 00:00:00	12/94	Von Stolk	52.0978012	4.73831511	aan speeltoestel Buitenkerk, Bodegraven, ZH	Bodegraven	ZH	\N	\N
636	21-11-2011	2011-11-21 00:00:00	13/50	Hans89	24-11-2011	2011-11-24 00:00:00	13/52	Ronald_010	51.6833878	3.77529812	in kastje bij Plompetoren, Burgh-Haamstede, Ze	Burgh-Haamstede	Ze	\N	\N
1295	03-08-2013	2013-08-03 00:00:00	22/09	meylie-style	04-08-2013	2013-08-04 00:00:00	22/10	bikedan	50.8553581	5.69312	in struik bij Bassin	Maastricht	Li	\N	\N
3404	07-03-2020	2020-03-07 00:00:00	40/585	Outdoor Man	07-03-2020	2020-03-07 00:00:00	40/585	SadBunny	52.2903099	5.29052877	tegen hek Oostermeent	Blaricum	NH	\N	\N
2347	02-03-2017	2017-03-02 00:00:00	33/70	BornToReign	03-03-2017	2017-03-03 00:00:00	33/71	nappertje	52.0005493	5.62467623	in bunker - Harsloweg	Bennekom	Ge	\N	\N
3333	20-12-2019	2019-12-20 00:00:00	40/532	Mitssz	21-12-2019	2019-12-21 00:00:00	40/533	pdv_moto	52.2350273	5.17284679	onder trap bij vijver Mediapark	Hilversum	NH	\N	\N
4155	01-04-2022	2022-04-01 00:00:00	41/240	Outdoor Man	02-04-2022	2022-04-02 00:00:00	41/241	Artemecion	52.5215378	4.66260099	tegen hek chatteau Marquette	Heemskerk	NH	\N	\N
152	27-11-2010	2010-11-27 00:00:00	5/19	V-Strommert	28-11-2010	2010-11-28 00:00:00	5/21	BigJim	52.2450027	4.69840384	camping de Westeinder, Haarlemmermeer, NH	Haarlemmermeer	NH	\N	\N
3471	23-04-2020	2020-04-23 00:00:00	40/644	Outdoor Man	23-04-2020	2020-04-23 00:00:00	40/644	Coenster	52.4684906	5.06694698	tegen hek Hoogedijk	Katwoude	NH	\N	\N
3505	21-05-2020	2020-05-21 00:00:00	40/669	pdv_moto	21-05-2020	2020-05-21 00:00:00	40/670	Bomba	51.9839363	4.23084593	in kunstwerk "de Engel", Westlandroute	Naaldwijk	ZH	\N	\N
2200	11-08-2016	2016-08-11 00:00:00	31/73	frankivo	11-08-2016	2016-08-11 00:00:00	31/74	Janhertog	52.8223991	6.46985483	onder richtingbord - Moraineweg	Spier	Dr	\N	\N
622	12-11-2011	2011-11-12 00:00:00	13/36	bakfiets1	12-11-2011	2011-11-12 00:00:00	13/38	Hans89	51.5942841	4.00388908	in bunker a/d Molendijk, Stavenisse, Ze	Stavenisse	Ze	\N	\N
2817	14-07-2018	2018-07-14 00:00:00	39/62	BSI	14-07-2018	2018-07-14 00:00:00	39/62	Bomba	52.043869	4.58256006	aan paaltje bij boom Koningsspil	Moerkapelle	ZH	\N	\N
1748	22-09-2014	2014-09-22 00:00:00	27/29	Bigtwim	22-09-2014	2014-09-22 00:00:00	27/29	Djoost	52.5574837	4.60910511	onder bank - Zeeweg	Castricum	NH	\N	\N
3995	26-07-2021	2021-07-26 00:00:00	41/133	WillyvD	26-07-2021	2021-07-26 00:00:00	41/134	Sjefman	51.8752441	4.55423307	in gras bij Zevenbergsedijkje	Ridderkerk	ZH	\N	\N
4045	12-10-2021	2021-10-12 00:00:00	41/165	k0en	13-10-2021	2021-10-13 00:00:00	41/165	Outdoor Man	52.1168938	5.30504179	in bosje bij bushalte Richelleweg	Soesterberg	Ut	\N	\N
3196	07-08-2019	2019-08-07 00:00:00	40/411	HermanK	07-08-2019	2019-08-07 00:00:00	40/412	Outdoor Man	52.5154877	5.72268915	in struik Campellhof	Dronten	Fl	\N	\N
2459	16-06-2017	2017-06-16 00:00:00	34/87	Amauta	16-06-2017	2017-06-16 00:00:00	34/87	Totl	53.2369118	7.20672607	aan Kiekkaast - Nieuw Statenzijl	Drieborg	Gr	\N	\N
1477	15-01-2014	2014-01-15 00:00:00	24/38	Sjakie-77	16-01-2014	2014-01-16 00:00:00	24/40	Roeleey	52.4698792	4.59370422	aan hek P-plaats Heliport loodsen	IJmuiden	NH	\N	\N
3781	30-12-2020	2020-12-30 00:00:00	40/913	pdv_moto	01-01-2021	2021-01-01 00:00:00	40/913	Hans89	52.1062965	4.27011013	tegen lantaarnpaal Strandweg	Scheveningen	ZH	\N	\N
3197	07-08-2019	2019-08-07 00:00:00	40/412	Outdoor Man	07-08-2019	2019-08-07 00:00:00	40/413	Coenster	52.2938461	4.87818813	achter afvalbak P&R N522	Amstelveen	NH	\N	\N
1211	16-05-2013	2013-05-16 00:00:00	20/90	Ronald_010	16-05-2013	2013-05-16 00:00:00	20/91	Sjakie-77	51.9810791	4.45331478	achter paal Braillestraat	Berkel en Rodenrijs	ZH	\N	\N
3675	25-09-2020	2020-09-25 00:00:00	40/830	Janhertog	26-09-2020	2020-09-26 00:00:00	40/830	Amauta	52.7854195	6.06826782	aan paal straatnaambord AF Stroïnkweg	Steenwijkerwold	Ov	\N	\N
1225	30-05-2013	2013-05-30 00:00:00	21/13	Bludge	30-05-2013	2013-05-30 00:00:00	21/13	Sjantaalfoutje	52.2278519	5.94229412	aan boom bij P-terrein 't Loo	Apeldoorn	Ge	\N	\N
1089	22-02-2013	2013-02-22 00:00:00	19/17	V-Strommert	24-02-2013	2013-02-24 00:00:00	19/20	Corney28	52.0841217	5.10188293	in bloempot Rally Stage jaarbeurs	Utrecht	Ut	\N	\N
525	04-09-2011	2011-09-04 00:00:00	11/87	Buuv	06-09-2011	2011-09-06 00:00:00	11/89	Kermit de Hond	52.9300766	6.7973609	achter dode boom - Hunnebedcentrum, Borger, Dr	Borger	Dr	\N	\N
2800	27-06-2018	2018-06-27 00:00:00	39/38	scheurschuimpje	27-06-2018	2018-06-27 00:00:00	39/38	Amauta	52.8158226	6.00587082	aan tent camping Krolsbergen	Paasloo	Ov	\N	\N
3191	05-08-2019	2019-08-05 00:00:00	40/406	pdv_moto	05-08-2019	2019-08-05 00:00:00	40/407	Roeleey	52.2982025	4.98422289	tegen laatste plataan Vianenstraat	Amsterdam	NH	\N	\N
775	15-04-2012	2012-04-15 00:00:00	15/31	BSI	15-04-2012	2012-04-15 00:00:00	15/32	Bensi	52.2926674	5.9668231	bij bruggetje Cannenburgermolen, Vaassen, Ge	Vaassen	Ge	\N	\N
680	01-01-2012	2012-01-01 00:00:00	14/05	Hasseman	02-01-2012	2012-01-02 00:00:00	14/06	MotorMieke	52.2822075	6.77156687	in olifant bij Wegtersweg 34, Hengelo, Ov	Hengelo	Ov	\N	\N
1786	02-11-2014	2014-11-02 00:00:00	27/63	Dirtbag	04-11-2014	2014-11-04 00:00:00	27/64	Rainbow600	52.2512016	6.11898279	achter zuiltje - Dijkhofstraat	Twello	Ge	\N	\N
1385	05-10-2013	2013-10-05 00:00:00	23/32	Ronald_010	06-10-2013	2013-10-06 00:00:00	23/33	Buuv	53.0839577	5.39198589	aan P-paal Hayumerlaan	Cornwerd	Fr	\N	\N
3542	11-06-2020	2020-06-11 00:00:00	40/701	Hans89	11-06-2020	2020-06-11 00:00:00	40/701	ey-dzeej	51.9123497	4.48478794	in bloemperk bij de Boeg, Boompjes	Rotterdam	ZH	\N	\N
2613	08-01-2018	2018-01-08 00:00:00	36/99	JorisK	08-01-2018	2018-01-08 00:00:00	36/99	pdv_moto	51.7742462	4.19323015	op strekdam havenhoofd	Middelharnis	ZH	\N	\N
1883	13-04-2015	2015-04-13 00:00:00	28/52	Janhertog	14-04-2015	2015-04-14 00:00:00	28/52	frankivo	52.8048553	6.10495901	achter struik P-terrein - Bergweg	Tuk	Ov	\N	\N
1903	06-05-2015	2015-05-06 00:00:00	28/69	ArendJan	06-05-2015	2015-05-06 00:00:00	28/70	Bomba	51.9196587	4.32217693	onder stenen - Kooikersweg	Vlaardingen	ZH	\N	\N
2151	11-06-2016	2016-06-11 00:00:00	31/23	Amauta	14-06-2016	2016-06-14 00:00:00	31/25	jaap43	53.0163002	6.50741196	bij monument - Koelenlaan	Huis ter Heide	Dr	\N	\N
2962	20-12-2018	2018-12-20 00:00:00	40/134	HighKing	21-12-2018	2018-12-21 00:00:00	40/135	pdv_moto	52.3836784	4.73519993	tegen boom Silverstone-hal, Weerenweg	Zwanenburg	NH	\N	\N
1398	22-10-2013	2013-10-22 00:00:00	23/51	Janhertog	24-10-2013	2013-10-24 00:00:00	23/53	Sjantaalfoutje	52.7963867	6.04818201	aan boom Thijlingerhof	Steenwijkerwold	Ov	\N	\N
668	23-12-2011	2011-12-23 00:00:00	13/89	V-Strommert	23-12-2011	2011-12-23 00:00:00	13/89	Scoot_020/Scoot_2	52.1623306	4.48580408	onder afscheiding Turfmarkt, Leiden, ZH	Leiden	ZH	\N	\N
1693	21-07-2014	2014-07-21 00:00:00	26/71	Bomba	22-07-2014	2014-07-22 00:00:00	26/72	Chakotay	52.0683212	4.82422304	onder stapel stenen - Molendijk	Nieuwerbrug	ZH	\N	\N
3433	28-03-2020	2020-03-28 00:00:00	40/611	Hjerteknuser	28-03-2020	2020-03-28 00:00:00	40/612	Outdoor Man	52.519558	4.66726398	tegen boom pad slot Marquette	Heemskerk	NH	\N	\N
1753	28-09-2014	2014-09-28 00:00:00	27/34	Ronald_010	28-09-2014	2014-09-28 00:00:00	27/35	Scoot_020/Scoot_2	51.7340393	5.27473593	aan tent cafe Treurenburg	s-Hertogenbosch	NB	\N	\N
1529	26-02-2014	2014-02-26 00:00:00	25/02	BigJim	27-02-2014	2014-02-27 00:00:00	25/03	Ronald_010	52.5493965	4.73246193	aan hek Hemweg	Akersloot	NH	\N	\N
627		0001-01-01 00:00:00 BC		Bigtwim		0001-01-01 00:00:00 BC			\N	\N				\N	\N
3711	20-10-2020	2020-10-20 00:00:00	40/854	k0en	20-10-2020	2020-10-20 00:00:00	40/854	Outdoor Man	52.2256737	5.00742102	achter paaltje onder brug 	Loenen aan de Vecht	Ut	\N	\N
1639	16-05-2014	2014-05-16 00:00:00	26/08	Darkpluisje	17-05-2014	2014-05-17 00:00:00	26/09	BSI	51.7370644	5.23724318	Bokhovense Maasdijk	s-Hertogenbosch	NB	\N	\N
1571	29-03-2014	2014-03-29 00:00:00	25/46	Phaedrus	29-03-2014	2014-03-29 00:00:00	25/47	MLB	52.2854118	6.1288662	aan boomstomp - Schapenzandweg	Diepenveen	Ov	\N	\N
3438	01-04-2020	2020-04-01 00:00:00	40/618	Hans89	01-04-2020	2020-04-01 00:00:00	40/618	Outdoor Man	51.7363701	5.13924503	in opgerold molenzeil walmolen	Heusden	NB	\N	\N
1808	14-12-2014	2014-12-14 00:00:00	27/83	tdemmer	16-12-2014	2014-12-16 00:00:00	27/83	B.B.I.L.	52.022953	6.06478977	aan hek langs spoor - Parallelweg	de Steeg	Ge	\N	\N
4388	15-08-2023	2023-08-15 00:00:00	41/393	k0en	18-08-2023	2023-08-18 00:00:00	41/394	BSI	52.3936768	7.03198624	in heg bij Mariakapel Schotbtoekerweg	Noord-Deurningen	Ov	\N	\N
715	24-02-2012	2012-02-24 00:00:00	14/61	BSI	25-02-2012	2012-02-25 00:00:00	14/62	MotorMieke	52.0857048	5.10440207	motorbeurs - Jaarbeurshallen, Utrecht, Ut	Utrecht	Ut	\N	\N
550		0001-01-01 00:00:00 BC		bobcat		0001-01-01 00:00:00 BC			\N	\N				\N	\N
2783	16-06-2018	2018-06-16 00:00:00	39/20	Roeleey	16-06-2018	2018-06-16 00:00:00	39/20	Outdoor Man	52.2911263	4.96741676	aan voet kunstwerk Schaikstraat	Amsterdam	NH	\N	\N
3255	02-10-2019	2019-10-02 00:00:00	40/469	Hans89	02-10-2019	2019-10-02 00:00:00	40/470	jaap43	51.9395485	4.4912982	in heg vak P, begraafplaats Crooswijk	Rotterdam	ZH	\N	\N
3026	27-02-2019	2019-02-27 00:00:00	40/223	Coenster	27-02-2019	2019-02-27 00:00:00	40/223	Rik60NL	52.2758484	4.61264277	onder gebouwtje Wayesteinsingel	Nieuw-Vennep	NH	\N	\N
3876	14-04-2021	2021-04-14 00:00:00	41/041	MeanYellowBoy	14-04-2021	2021-04-14 00:00:00	41/042	pdv_moto	52.6000023	6.39801788	aan paaltje bij Visvijver, de Omloop	Balkbrug	Ov	\N	\N
4317	10-04-2023	2023-04-10 00:00:00	41/346	SwitchUp	10-04-2023	2023-04-10 00:00:00	41/346	k0en	52.3339539	5.0146699	aan hek Overdiemerweg	Diemen	NH	\N	\N
578	13-10-2011	2011-10-13 00:00:00	12/70	Hans89	13-10-2011	2011-10-13 00:00:00	12/70	bakfiets1	51.7054062	4.83962107	hek koeltoren Amercentrale, Geertruidenberg, NB	Geertruidenberg	NB	\N	\N
635	20-11-2011	2011-11-20 00:00:00	13/49	meijlie-style	21-11-2011	2011-11-21 00:00:00	13/50	Hans89	51.5233231	4.28281021	achter regenpijp - Hazenbos, Halsteren, NB	Halsteren	NB	\N	\N
3336	23-12-2019	2019-12-23 00:00:00	40/535	Ronny Rabbelaar	23-12-2019	2019-12-23 00:00:00	40/535	FastEddy	53.3132782	6.90145588	onder steiger Koperweg	Farmsum	Gr	\N	\N
1515	14-02-2014	2014-02-14 00:00:00	24/83	BSI	16-02-2014	2014-02-16 00:00:00	24/84	bobcat	52.1585121	5.71599102	aan kromme ANWB-paal - Heetweg	Kootwijk	Ge	\N	\N
2137	26-05-2016	2016-05-26 00:00:00	31/09	SadBunny	26-05-2016	2016-05-26 00:00:00	31/10	Scoot_020/Scoot_2	52.2475204	5.490345	aan bord afslag N301	Putten	Ge	\N	\N
870		0001-01-01 00:00:00 BC				0001-01-01 00:00:00 BC		K-jos	\N	\N				\N	\N
1021	08-12-2012	2012-12-08 00:00:00	18/25	de peppel	11-12-2012	2012-12-11 00:00:00	18/27	JurgenT	51.9079056	6.58639479	onder afdakje Kiefteweg	Aalten	Ge	\N	\N
3381	13-02-2020	2020-02-13 00:00:00	40/567	Picobello BV	13-02-2020	2020-02-13 00:00:00	40/567	Hans89	51.9151421	4.52617598	achter fietsenstaalin Erasmus Univ.	Rotterdam	ZH	\N	\N
2645	21-02-2018	2018-02-21 00:00:00	37/51	Bigtwim	22-02-2018	2018-02-22 00:00:00	37/53	pdv_moto	52.5027924	4.65463686	naast kringloopwinkel, Lijnbaan	Heemskerk	NH	\N	\N
2499	28-07-2017	2017-07-28 00:00:00	35/31	frankivo	29-07-2017	2017-07-29 00:00:00	35/31	BSI	52.544754	5.9269681	achter brandkraan - Ijsseldijk	Kampen	OV	\N	\N
952	17-10-2012	2012-10-17 00:00:00	17/39	bikedan	17-10-2012	2012-10-17 00:00:00	17/39	Hans89	51.5838623	3.62505889	aan paaltje wandelpad	Vrouwenpolder	Ze	\N	\N
3090	25-04-2019	2019-04-25 00:00:00	40/287	Artemecion	26-04-2019	2019-04-26 00:00:00	40/288	Rik60NL	52.0167313	4.71827888	aan lantaarnpaal Vosenberghkade	Gouda	ZH	\N	\N
3107	07-05-2019	2019-05-07 00:00:00	40/312	HermanK	07-05-2019	2019-05-07 00:00:00	40/312	scheurschuimpje	52.5790672	6.34837914	in heg bij kerkje 	Vinkenbuurt	Ov	\N	\N
2254	27-09-2016	2016-09-27 00:00:00	32/35	BornToReign	28-09-2016	2016-09-28 00:00:00	32/36	Bensi	52.0156288	5.64597607	aan hek geluidswal A12	Ede	Ge	\N	\N
2226	04-09-2016	2016-09-04 00:00:00	32/03	ootje	04-09-2016	2016-09-04 00:00:00	32/04	Bigtwim	52.4676361	4.65119314	achter rooster goot - Wijkermeerweg	Velsen	NH	\N	\N
869	26-07-2012	2012-07-26 00:00:00	16/53	Franko P	27-07-2012	2012-07-27 00:00:00	16/54	Deadolon	51.3765907	5.31767511	aan boom P-plaats - Steenovens	Duizel	NB	\N	\N
3096	28-04-2019	2019-04-28 00:00:00	40/294	BSI	29-04-2019	2019-04-29 00:00:00	40/295	DKP	52.1905098	5.61768484	tegen boom P-plaats Roelenengweg	Voorthuizen	Ge	\N	\N
3244	22-09-2019	2019-09-22 00:00:00	40/461	pdv_moto	22-09-2019	2019-09-22 00:00:00	40/462	HighKing	51.9817619	4.12122488	tegen lantaarnpaal rotonde Strandweg	Hoek van Holland	ZH	\N	\N
3164	08-07-2019	2019-07-08 00:00:00	40/380	pdv_moto	09-07-2019	2019-07-09 00:00:00	40/380	ootje	51.5318375	3.45960593	aan paal voorrangskruising Rijkseweg	Westkapelle	Ze	\N	\N
895	11-08-2012	2012-08-11 00:00:00	16/73	Merc_xtz750	11-08-2012	2012-08-11 00:00:00	16/74	rvdh86	51.9371185	6.32805204	aan hek Hulleweg/Woudlaan	Doetinchem	Ge	\N	\N
1664	14-06-2014	2014-06-14 00:00:00	26/40	Rainbow600	15-06-2014	2014-06-15 00:00:00	26/41	bikedan	51.9396324	4.8501029	onder kunstwerk bij veerpont	Gelkenes	ZH	\N	\N
1930	10-06-2015	2015-06-10 00:00:00	28/94	coffeejunk	11-06-2015	2015-06-11 00:00:00	28/94	Roeleey	52.3341103	4.65476799	op balken - Groene Weelde	Vijfhuizen	NH	\N	\N
2462	19-06-2017	2017-06-19 00:00:00	34/89	Amauta	21-06-2017	2017-06-21 00:00:00	34/90	Totl	53.0587692	6.486619	achter monument Westerveen	Peest	Dr	\N	\N
470	20-07-2011	2011-07-20 00:00:00	11/15	wesleyc	21-07-2011	2011-07-21 00:00:00	11/17	Scoot_020/Scoot_2	52.0288963	4.16835594	in rechter kanon - Trompmonument, Ter Heijde, ZH	Ter Heijde	ZH	\N	\N
3103	03-05-2019	2019-05-03 00:00:00	40/306	Amauta	03-05-2019	2019-05-03 00:00:00	40/306	pdv_moto	53.4116898	6.23014212	tegen paal schietterein, Kustweg	Lauwersoog	Gr	\N	\N
3462	18-04-2020	2020-04-18 00:00:00	40/637	Outdoor Man	18-04-2020	2020-04-18 00:00:00	40/637	BSI	52.0261536	5.3655839	tegen stronk Sandenburglaan	Doorn	Ut	\N	\N
265	10-03-2011	2011-03-10 00:00:00	7/85	ElBarto	10-03-2011	2011-03-10 00:00:00	7/86	wesleyc	52.1968155	4.46809912	zijweg Haarlemmerstraatweg, Oegstgeest, ZH	Oegstgeest	ZH	\N	\N
2442	31-05-2017	2017-05-31 00:00:00	34/64	Rik60NL	31-05-2017	2017-05-31 00:00:00	34/64	Bas600	52.2667618	4.92489481	bij hek Botshol	Abcoude	Ut	\N	\N
2010	11-09-2015	2015-09-11 00:00:00	29/63	Amauta	12-09-2015	2015-09-12 00:00:00	29/63	BSI	53.4622879	6.83465481	aan paal op havenhoofd	Eemshaven	Gr	\N	\N
1431	25-11-2013	2013-11-25 00:00:00	23/86	Hasseman	25-11-2013	2013-11-25 00:00:00	23/86	Sjantaalfoutje	52.2953911	6.57820606	in struik bij zomp - Bornerbroekseweg	Enter	Ov	\N	\N
2744	08-05-2018	2018-05-08 00:00:00	38/75	Coenster	08-05-2018	2018-05-08 00:00:00	38/76	Rik60NL	52.2646103	4.59655619	bij P-plaats Venneper Lodge	Nieuw Vennep	NH	\N	\N
29	31-08-2010	2010-08-31 00:00:00	2/5	Bensi	01-09-2010	2010-09-01 00:00:00	2/9	B.B.I.L.	52.0203896	6.29412222	Cafe Keyenborgseweg 24/26, Zelhem, Ge	Zelhem	Ge	\N	\N
969	31-10-2012	2012-10-31 00:00:00	17/57	ProSpeed	01-11-2012	2012-11-01 00:00:00	17/58	nannol	52.2777138	6.84220505	aan leuning voetbrug - Pallastweg	Hengelo	Ov	\N	\N
4161	11-04-2022	2022-04-11 00:00:00	41/245	BSI	11-04-2022	2022-04-11 00:00:00	41/246	wachtbalkje	52.25103	6.15010786	tegen boom stadscamping, Worp	Deventer	Ov	\N	\N
1564	23-03-2014	2014-03-23 00:00:00	25/37	Buuv	23-03-2014	2014-03-23 00:00:00	25/37	-juliet-	53.2566986	6.23784399	bij Hilmahuistermolen	Visvliet	Gr	\N	\N
4301	09-03-2023	2023-03-09 00:00:00	41/336	tdemmer	10-03-2023	2023-03-10 00:00:00	41/336	Picobello BV	51.9783134	4.53682423	in uitkijktoren Bergschebos	Bergschenhoek	ZH	\N	\N
4175	29-04-2022	2022-04-29 00:00:00	41/253	FastEddy	30-04-2022	2022-04-30 00:00:00	41/253	Amauta	53.0084114	7.21328306	onder stammen de Linie	Bourtange	Gr	\N	\N
1022		0001-01-01 00:00:00 BC				0001-01-01 00:00:00 BC		Spike1982	\N	\N				\N	\N
1388	10-10-2013	2013-10-10 00:00:00	23/38	Buuv	10-10-2013	2013-10-10 00:00:00	23/39	frankivo	53.0931282	6.37423182	achter E-kast - Amerika 1	Een	Dr	\N	\N
3359	21-01-2020	2020-01-21 00:00:00	40/551	Outdoor Man	21-01-2020	2020-01-21 00:00:00	40/551	HighKing	52.3217773	4.86975098	tegen paaltje talud Uilenstede	Amstelveen	NH	\N	\N
1921	29-05-2015	2015-05-29 00:00:00	28/85	frankivo	29-05-2015	2015-05-29 00:00:00	28/86	Amauta	52.7717209	6.58344984	aan stuwtje - Hoogeveenseweg	Nieuw Balinge	Dr	\N	\N
1357	17-09-2013	2013-09-17 00:00:00	22/81	Phaedrus	17-09-2013	2013-09-17 00:00:00	22/82	tdemmer	51.882885	4.54774904	aan brug in park - Reijerdijk	Rotterdam	ZH	\N	\N
3697	10-10-2020	2020-10-10 00:00:00	40/844	Roeleey	10-10-2020	2020-10-10 00:00:00	40/844	HighKing	52.2888527	4.95835876	tegen boom bij Heliport AMC	Amsterdam	NH	\N	\N
1020	07-12-2012	2012-12-07 00:00:00	18/24	JurgenT	08-12-2012	2012-12-08 00:00:00	18/25	de peppel	52.0529213	6.30840302	bij monument Raadhuisstraat	Hengelo (Ge)	Ge	\N	\N
1887	18-04-2015	2015-04-18 00:00:00	28/56	rvdh86	19-04-2015	2015-04-19 00:00:00	28/57	Amauta	53.1324043	6.5928812	aan boom - Oosterbroek	Eelde	Dr	\N	\N
123	03-11-2010	2010-11-03 00:00:00	4/46	BigJim	04-11-2010	2010-11-04 00:00:00	4/48	Jozefientje123	52.5009995	4.65132093	Ambachtsring, Heemskerk, NH	Heemskerk	NH	\N	\N
4298	05-03-2023	2023-03-05 00:00:00	41/334	Simonshavenaar	06-03-2023	2023-03-06 00:00:00	41/334	DRS930	51.8394775	4.29598093	onder E-kast Rietbroekweg	Simonshaven	ZH	\N	\N
1115	15-03-2013	2013-03-15 00:00:00	19/52	JurgenT	16-03-2013	2013-03-16 00:00:00	19/54	Bensi	52.0191422	6.45847178	achter bank GertJanspad	Halle	Ge	\N	\N
1207	10-05-2013	2013-05-10 00:00:00	20/79	Meangreengirl/MeanBlueMan	11-05-2013	2013-05-11 00:00:00	20/81	SadBunny	51.3477402	4.05312586	naast kapelletje Boudeloodijk	Lamswaarde	Ze	\N	\N
1932	12-06-2015	2015-06-12 00:00:00	28/95	BSI	12-06-2015	2015-06-12 00:00:00	28/96	Fenrir-sol	51.5606346	4.46316481	aan Mariakapel - de Kapelberg	Roosendaal	NB	\N	\N
1159	07-04-2013	2013-04-07 00:00:00	20/14	BSI	08-04-2013	2013-04-08 00:00:00	20/15	Meangreengirl/MeanBlueMan	51.2829056	4.04938698	achter muur - Oude Havensteeg	Hulst	Ze	\N	\N
3958	28-06-2021	2021-06-28 00:00:00	41/108	MeanYellowBoy	28-06-2021	2021-06-28 00:00:00	41/109	Amauta	53.2178574	6.57884884	tegen boom bij Damsterkade	Groningen	Gr	\N	\N
2466	23-06-2017	2017-06-23 00:00:00	34/92	nappertje	24-06-2017	2017-06-24 00:00:00	34/93	BornToReign	52.054081	5.67813206	in vangrail N304	Ede	Ge	\N	\N
646	30-11-2011	2011-11-30 00:00:00	13/60	Bigtwim	30-11-2011	2011-11-30 00:00:00	13/61	V-Strommert	52.503727	4.68701982	bij bankje kasteeltuin Assumburg, Heemstede, NH	Heemstede	NH	\N	\N
2290	18-11-2016	2016-11-18 00:00:00	32/97	pdv_moto	18-11-2016	2016-11-18 00:00:00	32/97	frankivo	51.5043106	5.41343212	bij standbeeld Michael Jackson	Best	NB	\N	\N
3921	03-06-2021	2021-06-03 00:00:00	41/084	BigJim	03-06-2021	2021-06-03 00:00:00	41/084	Outdoor Man	52.4945679	4.70266724	aan hek bij bunker Genieweg	Heemskerk	NH	\N	\N
2158	22-06-2016	2016-06-22 00:00:00	31/31	SadBunny	23-06-2016	2016-06-23 00:00:00	31/31	Sjantaalfoutje	52.3895416	4.84404516	onder brug Hatostraat	Amsterdam	NH	\N	\N
3830	09-03-2021	2021-03-09 00:00:00	41/006	HighKing	10-03-2021	2021-03-10 00:00:00	41/007	Outdoor Man	52.3840675	4.75433016	onder fietsbrug Dubbele Buurt	Halfweg	NH	\N	\N
1047	06-01-2013	2013-01-06 00:00:00	18/54	tdemmer	08-01-2013	2013-01-08 00:00:00	18/56	Hans89	51.5019302	4.99111795	in luchtgat bunker - Oude Tilburgsebaan	Riel	NB	\N	\N
1750	23-09-2014	2014-09-23 00:00:00	27/30	Bigtwim	26-09-2014	2014-09-26 00:00:00	27/32	Djoost	52.5023956	4.69766808	in struiken plantsoen - Ameland	Beverwijk	NH	\N	\N
3629	17-08-2020	2020-08-17 00:00:00	40/788	pdv_moto	18-08-2020	2020-08-18 00:00:00	40/790	Yosra87	52.0956955	4.27808714	tegen boom Prins Mauritsplein	Den Haag	ZH	\N	\N
2690	03-04-2018	2018-04-03 00:00:00	38/09	BornToReign	04-04-2018	2018-04-04 00:00:00	38/10	BSI	51.9951172	5.66779613	achter E-kast DVO, Achterstraat	Bennekom	Ge	\N	\N
2139	28-05-2016	2016-05-28 00:00:00	31/11	Ronald_010	02-06-2016	2016-06-02 00:00:00	31/14	Amauta	50.7736206	5.89912987	aan bord Gerardushoeve - Julianastraat	Epen	Li	\N	\N
1785	01-11-2014	2014-11-01 00:00:00	27/62	BSI	02-11-2014	2014-11-02 00:00:00	27/63	Dirtbag	51.9960403	5.948699	achter KPN-kast - F. van Eedenstraat	Arnhem	Ge	\N	\N
1157	05-04-2013	2013-04-05 00:00:00	20/09	Hans89	05-04-2013	2013-04-05 00:00:00	20/10	bikedan	51.4896049	3.5088551	bij landfront Vlissingen Duinweg	Biggekerke	Ze	\N	\N
905	26-08-2012	2012-08-26 00:00:00	16/83	-Floris-	29-08-2012	2012-08-29 00:00:00	16/85	meylie-style	51.4122849	4.10066795	aan berkenboom - Gaweegsedijk	Waarde	Ze	\N	\N
2370	02-04-2017	2017-04-02 00:00:00	33/94	Bensi	03-04-2017	2017-04-03 00:00:00	33/95	pdv_moto	52.4035606	6.87386513	bij monument 06-11-1940	Agelo	Ov	\N	\N
2861	15-08-2018	2018-08-15 00:00:00	40/13	FastEddy	15-08-2018	2018-08-15 00:00:00	40/14	frankivo	53.1042976	7.07947397	tegen paal bij P-terrein Raadhuisstraat	Blijham	Gr	\N	\N
1002	21-11-2012	2012-11-21 00:00:00	18/06	Bigtwim	22-11-2012	2012-11-22 00:00:00	18/08	BigJim	52.5043068	4.66577482	aan struik Weg Ackers	Heemskerk	NH	\N	\N
721	04-03-2012	2012-03-04 00:00:00	14/72	ndeeka	05-03-2012	2012-03-05 00:00:00	14/73	tdemmer	51.9008141	4.54194021	naast hek eiland Brienenoord, Rotterdam, ZH	Rotterdam	ZH	\N	\N
458	09-07-2011	2011-07-09 00:00:00	10/97	bakfiets1	10-07-2011	2011-07-10 00:00:00	10/98	jaap43	51.4862137	3.51255107	onder boom - Vroonweg, Klein Valkenisse, Ze	Klein Valkenisse	Ze	\N	\N
776	15-04-2012	2012-04-15 00:00:00	15/32	Bensi	15-04-2012	2012-04-15 00:00:00	15/33	Merc_xtz750	51.8745232	6.24168301	in holle boom - Hof van Bergh, 's-Heerenberg, Ge	's-Heerenberg	Ge	\N	\N
303	03-04-2011	2011-04-03 00:00:00	8/59	Hasseman 	03-04-2011	2011-04-03 00:00:00	8/62	Gertman	52.398819	6.78253412	rotonde Oldenzaalseweg/Haarweg, Tubbergen, Ov	Tubbergen	Ov	\N	\N
3091	26-04-2019	2019-04-26 00:00:00	20/288	Rik60NL	26-04-2019	2019-04-26 00:00:00	40/289	Artemecion	52.1889229	4.81982708	tegen hekpaal Hogedijk	Zevenhoven	ZH	\N	\N
3923	05-06-2021	2021-06-05 00:00:00	41/085	Coenster	05-06-2021	2021-06-05 00:00:00	41/086	Outdoor Man	52.1687012	4.66737604	achter zitbank bij monument Herenweg	Woubrugge	ZH	\N	\N
2676	25-03-2018	2018-03-25 00:00:00	37/93	BornToReign	25-03-2018	2018-03-25 00:00:00	37/93	Bensi	52.0337296	5.61339903	achter schakelkast Schutterweg	Ede	Ge	\N	\N
3545	13-06-2020	2020-06-13 00:00:00	40/702	Sjefman	14-06-2020	2020-06-14 00:00:00	40/703	pdv_moto	51.5262604	4.14972019	aan dijkdoorgang Polderdijk	Poortvliet	Ze	\N	\N
2364	26-03-2017	2017-03-26 00:00:00	33/86	SadBunny	27-03-2017	2017-03-27 00:00:00	33/87	Amauta	52.4282494	4.74924612	aan paal Westelijk Havengebied	Amsterdam	NH	\N	\N
178	23-12-2010	2010-12-23 00:00:00	5/59	Cyntia1987	25-12-2010	2010-12-25 00:00:00	5/60	BigJim	51.6564827	5.08224392	mannetje cafe Roestelberg, Kaatsheuvel, NB	Kaatsheuvel	NB	\N	\N
3746	13-11-2020	2020-11-13 00:00:00	40/881	wachtbalkje	13-11-2020	2020-11-13 00:00:00	40/882	Thijs67	52.2823982	5.74957085	aan bochtmarkering Uddelermeerweg	Ermelo	Ge	\N	\N
567	06-10-2011	2011-10-06 00:00:00	12/55	Komkommer	07-10-2011	2011-10-07 00:00:00	12/57	jaap43	52.0563545	5.34381914	aan paaltje op kruispunt Stamerweg, Maarn, Ut	Maarn	Ut	\N	\N
2516	17-08-2017	2017-08-17 00:00:00	35/53	Rik60NL	18-08-2017	2017-08-18 00:00:00	35/55	Scoot_020/Scoot_2	52.2766418	5.01941013	aan boom Kanaaldijk West	Abcoude	Ut	\N	\N
1702	28-07-2014	2014-07-28 00:00:00	26/81	Phaedrus	29-07-2014	2014-07-29 00:00:00	26/81	jaap43	51.8654747	4.55209208	onder bord - Dierensteinlaan	Barendrecht	ZH	\N	\N
2973	28-12-2018	2018-12-28 00:00:00	40/147	Roeleey	28-12-2018	2018-12-28 00:00:00	40/147	BSI	52.2971802	4.95841312	bij toegang Portocabin, Meibergdreef	Amsterdam	NH	\N	\N
3834	12-03-2021	2021-03-12 00:00:00	41/010	Coenster	12-03-2021	2021-03-12 00:00:00	41/010	pdv_moto	52.1578903	4.44343805	tegen paaltje overweg NSS	Valkenburg	ZH	\N	\N
4406	27-09-2023	2023-09-27 00:00:00	41/405	Bensi	29-09-2023	2023-09-29 00:00:00	41/405	blub blub	51.9520531	6.36512184	tegen bord "eigen weg" Willebrordus ab"	Doetinchem	Ge	\N	\N
2542	09-09-2017	2017-09-09 00:00:00	35/90	ronk	10-09-2017	2017-09-10 00:00:00	35/91	BSI	51.8651085	5.1209898	P-terrein Fort de Niuwe steeg	Herwijnen	Ge	\N	\N
4345	26-05-2023	2023-05-26 00:00:00	41/366	Bensi	27-05-2023	2023-05-27 00:00:00	41/367	Ronald_010	51.9346085	6.32086277	tegen paal kanostoep	Terborg	Ge	\N	\N
3078	17-04-2019	2019-04-17 00:00:00	40/273	ey-dzeej	19-04-2019	2019-04-19 00:00:00	40/277	SadBunny	51.9289551	4.49713421	tegen beeld Bep van Klaveren	Rotterdam	ZH	\N	\N
4337	12-05-2023	2023-05-12 00:00:00	41/361	Roeleey	12-05-2023	2023-05-12 00:00:00	41/362	k0en	51.9899712	5.10457706	in heg bin Motorkledingstore	Vianen	Ut	\N	\N
3593	20-07-2020	2020-07-20 00:00:00	40/741	BSI	21-07-2020	2020-07-21 00:00:00	40/742	k0en	52.33638	5.87193108	onder dak hut Verscholen Dorp	Vierhouten	Ge	\N	\N
1560	16-03-2014	2014-03-16 00:00:00	25/27	Phaedrus	16-03-2014	2014-03-16 00:00:00	25/28	Scoot_020/Scoot_2	51.8291054	4.47236586	aan hek Buitendijk	Heinenoord	ZH	\N	\N
2075	28-02-2016	2016-02-28 00:00:00	30/35	Amauta	04-03-2016	2016-03-04 00:00:00	30/36	pdv_moto	53.1791458	6.39188623	aan eind P-terrein Nienoordsingel	Midwolde	Gr	\N	\N
3601	29-07-2020	2020-07-29 00:00:00	40/755	Springbok	30-07-2020	2020-07-30 00:00:00	40/756	Picobello BV	51.9340401	4.82933283	tegen boom aan de Lek, Sportlaan	Groot Ammers	ZH	\N	\N
2745	09-05-2018	2018-05-09 00:00:00	38/76	Rik60NL	09-05-2018	2018-05-09 00:00:00	38/76	Outdoor Man	52.25	4.8701992	aan hek fort Aan de Waver	Waverveen	Ut	\N	\N
2454	11-06-2017	2017-06-11 00:00:00	34/79	Amauta	12-06-2017	2017-06-12 00:00:00	34/81	BSI	52.7819748	6.50136089	aan hek Oefencentrum - Weegbrugweg	Wijster	Dr	\N	\N
1375	30-09-2013	2013-09-30 00:00:00	23/15	V-Strommert	30-09-2013	2013-09-30 00:00:00	23/15	Wimis on	52.3101234	4.95229912	in plantsoen Foppingadreef	Amsterdam	NH	\N	\N
3335	22-12-2019	2019-12-22 00:00:00	40/525	Amauta	22-12-2019	2019-12-22 00:00:00	40/535	Ronny Rabbelaar	53.1048737	6.4105072	onder steen van hunebed D1	Steenbergen	Dr	\N	\N
3742	10-11-2020	2020-11-10 00:00:00	40/878	Hans89	10-11-2020	2020-11-10 00:00:00	40/879	Picobello BV	52.0415497	4.7831111	onder poot aalscholvers, Wierickepad	Driebrugge	ZH	\N	\N
4078	30-12-2021	2021-12-30 00:00:00	41/190	Coenster	01-01-2022	2022-01-01 00:00:00	41/191	Outdoor Man	52.0953026	4.44860411	achter E-kast Dr. Van Noortstraat	Leidschendam	ZH	\N	\N
1978	01-08-2015	2015-08-01 00:00:00	29/32	vuurbloed	02-08-2015	2015-08-02 00:00:00	29/33	BSI	51.936924	5.9599781	aan bolder steiger Looveer	Huissen	Ge	\N	\N
463	15-07-2011	2011-07-15 00:00:00	11/04	vuurbloed	16-07-2011	2011-07-16 00:00:00	11/06	ootje	52.3370285	4.74062204	"the Roots" landingsbaan Schiphol, H'meer, NH	Haarlemmermeer	NH	\N	\N
2288	02-11-2016	2016-11-02 00:00:00	32/88	Amauta	04-11-2016	2016-11-04 00:00:00	32/90	pdv_moto	51.6193962	5.435256	achter muurtje van kerk - Markt	Schijndel	NB	\N	\N
867	23-07-2012	2012-07-23 00:00:00	16/51	Franko P	26-07-2012	2012-07-26 00:00:00	16/53	frankwijers	51.3435173	5.14335299	aan boom op P-plaats Pikoreistraat	Reusel	NB	\N	\N
2857	13-08-2018	2018-08-13 00:00:00	40/09	jaap43	13-08-2018	2018-08-13 00:00:00	40/09	pdv_moto	52.0812263	4.7152071	tegen boom Warmoeskade	Bodegraven	ZH	\N	\N
1713	16-08-2014	2014-08-16 00:00:00	26/95	bikedan	16-08-2014	2014-08-16 00:00:00	26/96	Ronald_010	51.3826332	4.37202978	achter blok kazerne - Putseweg	Ossendrecht	NB	\N	\N
1740	11-09-2014	2014-09-11 00:00:00	27/22	Ronald_010	12-09-2014	2014-09-12 00:00:00	27/22	crazy987	51.9086533	4.37207603	onder metroduct Vlaardingerdijk	Schiedam	ZH	\N	\N
2858	13-08-2018	2018-08-13 00:00:00	40/10	pdv_moto	14-08-2018	2018-08-14 00:00:00	40/11	FastEddy	52.6444244	7.05475283	in gat bij grenspaal H159	Nieuw Schoonebeek	Dr	\N	\N
89		0001-01-01 00:00:00 BC				0001-01-01 00:00:00 BC		Oxi	\N	\N				\N	\N
1668	17-06-2014	2014-06-17 00:00:00	26/44	frankwijers	19-06-2014	2014-06-19 00:00:00	26/45	Sjoerd102	51.326149	6.08553219	in boom Napoleonsbaan-Z	Baarlo	Li	\N	\N
2926	10-10-2018	2018-10-10 00:00:00	40/85	Raviel	10-10-2018	2018-10-10 00:00:00	40/85	Bensi	52.1418686	5.07994699	Grensweg	Woold	Ge	\N	\N
4168	21-04-2022	2022-04-21 00:00:00	41/249	Coenster	21-04-2022	2022-04-21 00:00:00	41/250	jaap43	51.9060669	4.46552181	tegen boom bij Euromast, Parkhaven	Rotterdam	ZH	\N	\N
1019	06-12-2012	2012-12-06 00:00:00	18/23	Bensi	06-12-2012	2012-12-06 00:00:00	18/24	JurgenT	52.0771828	6.2313242	achter geel paaltje Wichmondseweg	Baak	Ge	\N	\N
3813	22-02-2021	2021-02-22 00:00:00	40/940	Outdoor Man	25-02-2021	2021-02-25 00:00:00	40/940	Amauta	52.4581413	5.41757679	onder boomstam vogelkijkhuid de Kluut	Lelystad	Fl	\N	\N
3959	28-06-2021	2021-06-28 00:00:00	41/109	Amauta	29-06-2021	2021-06-29 00:00:00	41/109	FastEddy	52.9262886	7.01763916	tegen boom bij oorlogsmonument	Musselkanaal	Gr	\N	\N
1570	27-03-2014	2014-03-27 00:00:00	25/43	Vins111	28-03-2014	2014-03-28 00:00:00	25/45	Phaedrus	52.1748772	5.82574511	bij deur watertoren Radio Kootwijk	Kootwijk	Ge	\N	\N
3750	15-11-2020	2020-11-15 00:00:00	40/884	Coenster	15-11-2020	2020-11-15 00:00:00	40/884	Thijs67	52.1431541	5.11746311	aan hek burg. Huydecoperweg	Westbroek	Ut	\N	\N
4004	13-08-2021	2021-08-13 00:00:00	41/140	Deeffox	14-08-2021	2021-08-14 00:00:00	41/141	Outdoor Man	52.1484604	5.74099112	tegen paaltje Hoohbuurloseweg	Harskamp	Ge	\N	\N
1751	26-09-2014	2014-09-26 00:00:00	27/32	Djoost	26-09-2014	2014-09-26 00:00:00	27/32	Bigtwim	52.52845	4.95756912	aan brugleuning N244/Westerdraai	Purmerend	NH	\N	\N
3922	04-06-2021	2021-06-04 00:00:00	41/084	Outdoor Man	04-06-2021	2021-06-04 00:00:00	41/085	Coenster	52.6943779	5.02679205	in heg van monument A.C. de Graaf	Wognum	NH	\N	\N
2596	18-11-2017	2017-11-18 00:00:00	36/67	Amauta	23-11-2017	2017-11-23 00:00:00	36/69	pdv_moto	53.2092896	5.7285428	in perkje bij P-plaats Heringastate	Marsum	Fr	\N	\N
451	02-07-2011	2011-07-02 00:00:00	10/90	jaap43	02-07-2011	2011-07-02 00:00:00	10/90	ndeeka	51.8992538	4.59542322	boom bij ingang de Zaag, Krimpen a/d Lek, ZH	Krimpen aan den Lek	ZH	\N	\N
2336	12-02-2017	2017-02-12 00:00:00	33/56	Amauta	13-02-2017	2017-02-13 00:00:00	33/57	pdv_moto	52.1175194	4.99359512	aan boom wandelpad Eikslaan	Utrecht	Ut	\N	\N
2093	04-04-2016	2016-04-04 00:00:00	30/58	Bensi	08-04-2016	2016-04-08 00:00:00	30/60	Amauta	52.0626335	5.89571381	aan hek Deelenseweg	Deelen	Ge	\N	\N
2264	07-10-2016	2016-10-07 00:00:00	32/53	frankivo	07-10-2016	2016-10-07 00:00:00	32/53	MeanYellowBoy	52.5111694	6.35040712	bij E-huis - Vilsterseweg	Vilsteren	Ov	\N	\N
1829	17-01-2015	2015-01-17 00:00:00	28/03	Rainbow600	22-01-2015	2015-01-22 00:00:00	28/04	Phaedrus	51.6591072	5.61160612	tegen muur bij Petruskerk	Uden	NB	\N	\N
4186	09-05-2022	2022-05-09 00:00:00	41/259	BSI	10-05-2022	2022-05-10 00:00:00	41/260	Marsian	52.3142128	5.46764183	in struik bij infopaneel Tuurtoren	Zeewolde	Fl	\N	\N
1618	02-05-2014	2014-05-02 00:00:00	25/90	Bigtwim	02-05-2014	2014-05-02 00:00:00	25/90	thyrif	52.5225525	5.06567907	bij rood zwaailicht - camping de Dijk	Edam	NH	\N	\N
1469	10-01-2014	2014-01-10 00:00:00	24/30	Vins111	10-01-2014	2014-01-10 00:00:00	24/31	Roeleey	52.1570129	5.01704216	aan hek Woerdenseweg	Breukelen	Ut	\N	\N
3493	08-05-2020	2020-05-08 00:00:00	40/660	pdv_moto	08-05-2020	2020-05-08 00:00:00	40/661	Coenster	52.1420288	4.39503002	in heg bij molen de Windlust	Wassenaar	ZH	\N	\N
965	27-10-2012	2012-10-27 00:00:00	17/51	tdemmer	27-10-2012	2012-10-27 00:00:00	17/52	Ronald_010	52.0430984	4.72380114	bij ophaalbrug R. Holststraat	Reeuwijk	ZH	\N	\N
1638	15-05-2014	2014-05-15 00:00:00	26/07	tdemmer	15-05-2014	2014-05-15 00:00:00	26/07	Darkpluisje	51.8658714	5.12233782	aan paal bij fort Nieuwe Steeg	Herwijnen	Ge	\N	\N
1768	11-10-2014	2014-10-11 00:00:00	27/46	Rainbow600	11-10-2014	2014-10-11 00:00:00	27/47	Djoost	51.4605789	3.60185695	in heg Vlissingsestraat	Oost-Souburg	Ze	\N	\N
3693	06-10-2020	2020-10-06 00:00:00	40/841	Yosra87	07-10-2020	2020-10-07 00:00:00	40/841	Outdoor Man	52.1059303	4.33935785	bij afvalbak Waalsdorperlaan	Wassenaar	ZH	\N	\N
1203	08-05-2013	2013-05-08 00:00:00	20/75	meylie-style	08-05-2013	2013-05-08 00:00:00	20/76	bikedan	51.5265961	4.31077623	aan vangrail Schansbaan	Bergen op Zoom	NB	\N	\N
2291	19-11-2016	2016-11-19 00:00:00	32/97	frankivo	20-11-2016	2016-11-20 00:00:00	32/99	pdv_moto	52.8760414	7.07352686	aan hek Kloosterkerk - Sellingerstraat	Ter Apel	Gr	\N	\N
3460	17-04-2020	2020-04-17 00:00:00	40/636	Coenster	17-04-2020	2020-04-17 00:00:00	40/636	vuurbloed	52.3083916	4.68428087	in struiken Ramaerstraat	Hoofddorp	NH	\N	\N
2883	27-08-2018	2018-08-27 00:00:00	40/35	Ronny Rabbelaar	27-08-2018	2018-08-27 00:00:00	40/36	FastEddy	53.3526154	6.83518982	onder stro Kloosterweg	Krewerd	Gr	\N	\N
365	09-05-2011	2011-05-09 00:00:00	9/61	diekooi	10-05-2011	2011-05-10 00:00:00	9/63	Bigtwim	52.6909904	4.98192406	achter vliegermonument - Wadway, Wognum, NH	Wognum	NH	\N	\N
2956	13-12-2018	2018-12-13 00:00:00	40/128	sanger	13-12-2018	2018-12-13 00:00:00	40/128	Roeleey	52.3094482	4.82190609	onder viaduct A9, Nieuwe Meerlaan	Amstelveen	NH	\N	\N
2554	22-09-2017	2017-09-22 00:00:00	36/08	-Floris-	23-09-2017	2017-09-23 00:00:00	36/08	Okami_Xci	51.5296288	3.47687006	aan boom Poppekerkseweg	Westkapelle	Ze	\N	\N
4112	04-02-2022	2022-02-04 00:00:00	41/211	Roeleey	05-02-2022	2022-02-05 00:00:00	41/211	ootje	52.4846306	4.96701479	tegen paal fietspad Versetslaan	Purmerend	NH	\N	\N
3331	19-12-2019	2019-12-19 00:00:00	40/532	Hans89	20-12-2019	2019-12-20 00:00:00	40/532	ey-dzeej	51.9198914	4.50387621	in boom Maasboulevard	Rotterdam	ZH	\N	\N
1663	14-06-2014	2014-06-14 00:00:00	26/40	Ronald_010	14-06-2014	2014-06-14 00:00:00	26/40	Rainbow600	51.8252869	4.70571518	onder wenteltrap Merwedebrug	Papendrecht	ZH	\N	\N
3968	07-07-2021	2021-07-07 00:00:00	41/117	HighKing	07-07-2021	2021-07-07 00:00:00	41/117	ootje	52.5187645	4.67276621	tegen afvalbak Mozartstraat	Heemskerk	NH	\N	\N
136	12-11-2010	2010-11-12 00:00:00	4/73	Kaljo	12-11-2010	2010-11-12 00:00:00	4/76	V-Strommert	52.6367912	5.4161768	Checkpoint Charly - Trintelhaven, Lelystad, Fl	Lelystad	Fl	\N	\N
1365	23-09-2013	2013-09-23 00:00:00	22/92	Sjantaalfoutje	24-09-2013	2013-09-24 00:00:00	22/94	Caun	52.172348	5.94017601	aan paal Engelanderholt	Beekbergen	Ge	\N	\N
771	08-04-2012	2012-04-08 00:00:00	15/26	Ronald_010	10-04-2012	2012-04-10 00:00:00	15/27	scheurschuimpje	52.4776154	5.97975683	aan bordje bij pad - Meerkoetenweg, Lelystad, Fl	Lelystad	Fl	\N	\N
4361	19-06-2023	2023-06-19 00:00:00	41/376	HermanK	20-06-2023	2023-06-20 00:00:00	41/377	Pydejong	52.9970512	6.75870895	tgen hek Abeme, Rondkamp	Gieten	Dr	\N	\N
1765	09-10-2014	2014-10-09 00:00:00	27/43	Lekkerbekje	09-10-2014	2014-10-09 00:00:00	27/44	Corney28	52.2092781	4.64767122	aan huisje Veerstraat	Oude Wetering	ZH	\N	\N
224	07-02-2011	2011-02-07 00:00:00	6/91	Hasseman	07-02-2011	2011-02-07 00:00:00	6/93	Bensi	52.1985245	6.724545	Beckummerweg/Geurtsweg, Haaksbergen, Ov	Haaksbergen	Ov	\N	\N
307	05-04-2011	2011-04-05 00:00:00	8/64	Ted	05-04-2011	2011-04-05 00:00:00	8/65	Mr.Bean	52.4160233	6.01446676	ingang crossbaan Kamperweg, Heerde, Ge	Heerde	Ge	\N	\N
4421	25-10-2023	2023-10-25 00:00:00	41/414	Hans89	29-10-2023	2023-10-29 00:00:00	41/414	Outdoor Man	51.9377403	4.62482309	in bootje Leefgoed Olifant bij de Dames	Nieuwerkerk a/d Ijssel	ZH	\N	\N
1676	11-07-2014	2014-07-11 00:00:00	26/56	tdemmer	11-07-2014	2014-07-11 00:00:00	26/56	Bas600	51.9731216	5.02519894	tussen balken - Lekdijk Oost	Lopikerkapel	Ut	\N	\N
427		0001-01-01 00:00:00 BC				0001-01-01 00:00:00 BC		bobcat	\N	\N				\N	\N
242	21-02-2011	2011-02-21 00:00:00	7/34	Quickly	21-02-2011	2011-02-21 00:00:00	7/35	Richard117	52.040802	4.99130106	slootkant bij hek - Blokland, Montfoort, Ut	Montfoort	Ut	\N	\N
3597	26-07-2020	2020-07-26 00:00:00	40/747	Yosra87	27-07-2020	2020-07-27 00:00:00	40/749	ootje	52.0914726	4.31781483	in plantenbak Koningin Emma 	Den Haag	ZH	\N	\N
625		0001-01-01 00:00:00 BC				0001-01-01 00:00:00 BC		Bigtwim	\N	\N				\N	\N
1718	19-08-2014	2014-08-19 00:00:00	27/02	Dirk130	20-08-2014	2014-08-20 00:00:00	27/02	VinceGSX650f	52.107132	4.32345104	onder kruik - Oudewaalsdorperweg	Den Haag	ZH	\N	\N
432	14-06-2011	2011-06-14 00:00:00	10/59	fien	14-06-2011	2011-06-14 00:00:00	10/60	Hasseman	52.1362228	6.73099804	Watermolenweg, Haaksbergen, Ov	Haaksbergen	Ov	\N	\N
1675	10-07-2014	2014-07-10 00:00:00	26/54	Dirtbag	11-07-2014	2014-07-11 00:00:00	26/56	tdemmer	52.2466888	6.15517282	onder afdak infopaneel - Bolwerksweg	Deventer	Ov	\N	\N
2152	14-06-2016	2016-06-14 00:00:00	31/25	jaap43	16-06-2016	2016-06-16 00:00:00	31/26	Amauta	52.9038506	6.81414413	onder sparretak - Exloërweg	Ees	Dr	\N	\N
2819	15-07-2018	2018-07-15 00:00:00	39/63	jaap43	15-07-2018	2018-07-15 00:00:00	39/63	bikedan	52.0355263	4.7483449	achter lantaarpaal Zoetendijk	Slijpwijk	ZH	\N	\N
2839	29-07-2018	2018-07-29 00:00:00	39/88	Amauta	29-07-2018	2018-07-29 00:00:00	39/89	Bassjunky	53.1969566	6.51541185	onder bord v/d Valk Hotel, Borchsingel	Eelderwolde	Dr	\N	\N
148	21-11-2010	2010-11-21 00:00:00	5/4	bouwvakkertje	22-11-2010	2010-11-22 00:00:00	5/6	Hasseman	52.3177147	6.57680893	"balkon" boven Regge - Enterweg , Enter, Ov	Enter	Ov	\N	\N
3598	27-07-2020	2020-07-27 00:00:00	40/750	ootje	28-07-2020	2020-07-28 00:00:00	40/752	HighKing	52.6088486	4.742836	in boom Parelweg	Alkmaar	NH	\N	\N
2565	14-10-2017	2017-10-14 00:00:00	36/28	Amauta	15-10-2017	2017-10-15 00:00:00	36/29	Ronny Rabbelaar	52.9212265	6.57108212	in bosje bij kamp Westerbork	Hooghalen	Dr	\N	\N
2397	22-04-2017	2017-04-22 00:00:00	34/22	BSI	23-04-2017	2017-04-23 00:00:00	34/23	pdv_moto	52.1677322	5.57830477	aan struik P-terrein Harselaar	Barneveld	Ge	\N	\N
2250	24-09-2016	2016-09-24 00:00:00	32/29	SadBunny	24-09-2016	2016-09-24 00:00:00	32/29	Amauta	52.3978043	4.57449913	aan hek erebegraafplaats - Zeeweg	Overveen	NH	\N	\N
1106	04-03-2013	2013-03-04 00:00:00	19/38	BSI	04-03-2013	2013-03-04 00:00:00	19/39	SadBunny	52.1895485	5.60956717	achter paaltje - Roelenengweg	Voorthuizen	Ge	\N	\N
2304	09-12-2016	2016-12-09 00:00:00	33/14	Amauta	10-12-2016	2016-12-10 00:00:00	33/14	BornToReign	52.0219917	5.77076387	achter E-kast tunnel Kruislaan	Ede	Ge	\N	\N
283	24-03-2011	2011-03-24 00:00:00	8/23	fien	24-03-2011	2011-03-24 00:00:00	8/24	me-daph	52.304657	6.87441206	slagboom recreatiepark Hulsbeek, Deurningen, Ov	Deurningen	Ov	\N	\N
2505	04-08-2017	2017-08-04 00:00:00	35/38	Amauta	05-08-2017	2017-08-05 00:00:00	35/39	Capo-04/06	50.7513733	5.92150688	bij grenspaal 11 - Het Veld	Kuttingen	Li	\N	\N
1964	20-07-2015	2015-07-20 00:00:00	29/24	Kermit de Hond	20-07-2015	2015-07-20 00:00:00	29/24	Ronald_010	52.9962578	6.93585777	in heg bij station Museumweg	Stadskanaal	Gr	\N	\N
1243	15-06-2013	2013-06-15 00:00:00	21/38	Ronald_010	17-06-2013	2013-06-17 00:00:00	21/39	Hans89	51.8048286	4.03118515	aan bruggetje Parkhaven	Stellendam	ZH	\N	\N
3990	23-07-2021	2021-07-23 00:00:00	41/131	HighKing	23-07-2021	2021-07-23 00:00:00	41/132	Nelfrikandel	52.1479607	4.50503683	tegen hek bij speeltuin de Speelschas	Leiden	ZH	\N	\N
4217	08-07-2022	2022-07-08 00:00:00	41/279	rvdh86	12-07-2022	2022-07-12 00:00:00	41/280	BSI	52.3758736	6.0956502	in heg huize Buys, Ijsseldijk	Veessen	Ge	\N	\N
4181	05-05-2022	2022-05-05 00:00:00	41/256	BornToReign	07-05-2022	2022-05-07 00:00:00	41/257	BrommerMetWielen	50.770237	5.79320478	tegen hekpaal Koetsweg	Noorbeek	Li	\N	\N
3384	16-02-2020	2020-02-16 00:00:00	40/568	Janhertog	16-02-2020	2020-02-16 00:00:00	40/569	Amauta	53.2286186	6.17309904	achter steen monument Blauwverlaat	Augustinusga	Fr	\N	\N
2268	09-10-2016	2016-10-09 00:00:00	32/56	SadBunny	09-10-2016	2016-10-09 00:00:00	32/56	Ronald_010	52.1790123	4.6220212	aan hek Groenewoudskade	Roelofarendsveen	ZH	\N	\N
3494	08-05-2020	2020-05-08 00:00:00	40/661	Coenster	08-05-2020	2020-05-08 00:00:00	40/662	Outdoor Man	52.3241997	4.58794785	in heg bin Woonstation Leidsevaart	Vogelenzang	NH	\N	\N
3724	28-10-2020	2020-10-28 00:00:00	40/865	pdv_moto	28-10-2020	2020-10-28 00:00:00	40/865	Picobello BV	52.0773697	4.2488699	tegen poot brievenbus Wildhoeflaan	Den Haag	ZH	\N	\N
1678	12-07-2014	2014-07-12 00:00:00	26/57	Blogem	12-07-2014	2014-07-12 00:00:00	26/58	Chakotay	52.4006538	4.84294415	op motor E-huis - Gyroscoopweg	Amsterdam	NH	\N	\N
598	23-10-2011	2011-10-23 00:00:00	12/96	Wimis on	23-10-2011	2011-10-23 00:00:00	12/97	Quickly	52.0279045	5.1553998	aan boom in parkje Eburonenpoort 30, Houten, Ut	Houten	Ut	\N	\N
2030	19-10-2015	2015-10-19 00:00:00	29/83	Bensi	23-10-2015	2015-10-23 00:00:00	29/85	BSI	52.1150551	6.00039577	achter boom P-plaats ereveld	Loenen	Ge	\N	\N
2484	12-07-2017	2017-07-12 00:00:00	35/15	Bomba	12-07-2017	2017-07-12 00:00:00	35/16	Rik60NL	52.0452499	4.80507803	tegen berk - de Groenendijk	Driebruggen	ZH	\N	\N
3362	24-01-2020	2020-01-24 00:00:00	40/553	Deeffox	24-01-2020	2020-01-24 00:00:00	40/553	Hans89	51.8125839	4.68990612	tegen Baden Powelbrug	Dordrecht	ZH	\N	\N
397	01-06-2011	2011-06-01 00:00:00	10/23	BSI	01-06-2011	2011-06-01 00:00:00	10/24	Hasseman	52.2152061	6.97953701	grenspaal 848, Glanerbrug/Gronau, Ov	Glanerbrug/Gronau	Ov	\N	\N
1109	05-03-2013	2013-03-05 00:00:00	19/41	SadBunny	07-03-2013	2013-03-07 00:00:00	19/43	Buikschuiver oet Dre	53.147274	5.79524517	bij geel paaltje kruispunt Legedijk	Wirdum	Fr	\N	\N
1652	28-05-2014	2014-05-28 00:00:00	26/23	XJ Elff	28-05-2014	2014-05-28 00:00:00	26/24	Ronald_010	51.9113083	4.23426199	aan keermuur Wilgentuin	Rozenburg	ZH	\N	\N
1275	09-07-2013	2013-07-09 00:00:00	21/74	tdemmer	09-07-2013	2013-07-09 00:00:00	21/76	Ronald_010	51.9953575	4.58239079	aan uitkijktoren bij roeibaan	Zevenhuizen	ZH	\N	\N
1633	10-05-2014	2014-05-10 00:00:00	25/101	Ronald_010	10-05-2014	2014-05-10 00:00:00	26/01	BSI	51.9373245	5.59462118	aan infobord molen de Zwaluw	Kesteren	Ge	\N	\N
4032	17-09-2021	2021-09-17 00:00:00	41/155	BSI	18-09-2021	2021-09-18 00:00:00	41/156	Outdoor Man	52.17799	5.7542572	aan poot infobord Heetweg	Kootwijk	Ge	\N	\N
647	30-11-2011	2011-11-30 00:00:00	13/61	V-Strommert	01-12-2011	2011-12-01 00:00:00	13/63	BSI	52.3437233	4.70622778	bij infobord - spottersplaats - IJweg, Vijfhuizen, NH	Vijfhuizen	NH	\N	\N
1747	21-09-2014	2014-09-21 00:00:00	27/28	BSI	21-09-2014	2014-09-21 00:00:00	27/28	Bigtwim	52.2657127	5.20178223	aan paaltje Nieuwe Crailoseweg	Hilversum	NH	\N	\N
4145	11-03-2022	2022-03-11 00:00:00	41/231	Phaedrus	12-03-2022	2022-03-12 00:00:00	41/231	bikedan	51.8357353	4.62325096	tegen hek bij rotonde Ambachtsezoom	Hendrik Ido Ambacht	ZH	\N	\N
2177	20-07-2016	2016-07-20 00:00:00	31/51	pdv_moto	22-07-2016	2016-07-22 00:00:00	31/52	Coenster	52.0876312	4.29020309	achter paal Jacob Catslaan	Den Haag	ZH	\N	\N
959	21-10-2012	2012-10-21 00:00:00	17/44	tdemmer	22-10-2012	2012-10-22 00:00:00	17/45	V-Strommert	52.0262489	4.57854319	bij spoortunnel - Noordeinde	Zevenhuizen	ZH	\N	\N
1061	03-02-2013	2013-02-03 00:00:00	18/86	Corney28	03-02-2013	2013-02-03 00:00:00	18/87	BSI	52.1988258	4.90222216	bij paaltje - Burg. Van Baaklaan	Wilnis	Ut	\N	\N
991	12-11-2012	2012-11-12 00:00:00	17/88	Dirk130	12-11-2012	2012-11-12 00:00:00	17/88	V-Strommert	52.0973434	4.25747585	achter E-kast Houtrustweg	Scheveningen	ZH	\N	\N
1657	03-06-2014	2014-06-03 00:00:00	26/31	BSI	03-06-2014	2014-06-03 00:00:00	26/32	tdemmer	51.2416382	3.44828892	aan hek N251 bijj grensovergang	Eede	Ze	\N	\N
2131	19-05-2016	2016-05-19 00:00:00	31/02	ErikBloot	19-05-2016	2016-05-19 00:00:00	31/02	BSI	52.1124649	5.55344105	bij afvalbak - Walderveensemolen	Lunteren	Ge	\N	\N
2544	10-09-2017	2017-09-10 00:00:00	35/92	MP_NL	15-09-2017	2017-09-15 00:00:00	35/96	Amauta	52.3910103	7.02312183	aan brug Schotbroekweg	Denekamp	Ov	\N	\N
318	09-04-2011	2011-04-09 00:00:00	8/84	Richard117	09-04-2011	2011-04-09 00:00:00	8/84	ndeeka	51.8027611	4.88426399	industrieterrein, Werkendam, NB	Werkendam	NB	\N	\N
1965	20-07-2015	2015-07-20 00:00:00	29/24	Ronald_010	21-07-2015	2015-07-21 00:00:00	29/25	jaap43	51.9304771	4.43821478	in struik bij anker - Kleinpolderplein	Rotterdam	ZH	\N	\N
171		0001-01-01 00:00:00 BC		BigJim		0001-01-01 00:00:00 BC			\N	\N				\N	\N
2437	26-05-2017	2017-05-26 00:00:00	34/59	Coenster	26-05-2017	2017-05-26 00:00:00	34/59	Rik60NL	52.1886902	4.60022783	bij E-kast Lange Dwarsweg	Rijpwetering	ZH	\N	\N
2717	20-04-2018	2018-04-20 00:00:00	38/43	HermanK	20-04-2018	2018-04-20 00:00:00	38/43	MeanYellowBoy	52.4295197	6.24510908	in vladeren klavertje-3, Raalterwg	Heino	Ov	\N	\N
4044	11-10-2021	2021-10-11 00:00:00	41/164	Roeleey	12-10-2021	2021-10-12 00:00:00	41/165	k0en	52.3855057	4.86512899	tegen boom bij schutsluis Westerpark	Amsterdam	NH	\N	\N
3204	10-08-2019	2019-08-10 00:00:00	40/419	Hans89	11-08-2019	2019-08-11 00:00:00	40/419	Meifesto	51.8879013	4.63923311	aan hek oude gemaal Overwaard	Kinderdijk	ZH	\N	\N
799	14-05-2012	2012-05-14 00:00:00	15/56	Hasseman	15-05-2012	2012-05-15 00:00:00	15/57	MotorMieke	52.3120193	6.71349812	achter muur Retraitehuisweg, Zenderen, Ov	Zenderen	Ov	\N	\N
1902	05-05-2015	2015-05-05 00:00:00	28/69	-ErikE-	06-05-2015	2015-05-06 00:00:00	28/69	ArendJan	52.0695076	4.87592077	aan bruggetje tussen A12	Woerden	Ut	\N	\N
2706	13-04-2018	2018-04-13 00:00:00	38/29	MP_NL	14-04-2018	2018-04-14 00:00:00	38/30	Bensi	52.022213	6.62467623	bij E-kast Zwolseweg	Liev4lde	Ge	\N	\N
268	13-03-2011	2011-03-13 00:00:00	7/93	bakfiets1	14-03-2011	2011-03-14 00:00:00	7/97	lynx84	51.5336418	4.33644485	oorlogsmonument Luienhoekweg, Moerstraten, NB	Moerstraten	NB	\N	\N
2790	20-06-2018	2018-06-20 00:00:00	39/25	HermanK	20-06-2018	2018-06-20 00:00:00	39/26	MP_NL	52.2855911	6.41534996	achter gedenkteken Molenbelterweg	Holten	Ov	\N	\N
3490	05-05-2020	2020-05-05 00:00:00	40/658	FastEddy	05-05-2020	2020-05-05 00:00:00	40/657	Amauta	53.2002754	6.66495323	onder viaduct Engelberterweg	Westerbroek	Gr	\N	\N
3348	12-01-2020	2020-01-12 00:00:00	40/545	pdv_moto	12-01-2020	2020-01-12 00:00:00	40/545	Picobello BV	52.0872345	4.29309177	in heg bij monument Carnegielaan	Den Haag	ZH	\N	\N
876	29-07-2012	2012-07-29 00:00:00	16/56	Franko P	01-08-2012	2012-08-01 00:00:00	16/58	tdemmer	51.3405342	5.179389	onder boom langs trimbaan	Reusel	NB	\N	\N
52	16-09-2010	2010-09-16 00:00:00	2/75	Bensi	16-09-2010	2010-09-16 00:00:00	2/75	Dirtbag	52.354248	6.43490887	schuilhut Nijverdalsebergweg, Nijverdal, Ov	Nijverdal	Ov	\N	\N
978	05-11-2012	2012-11-05 00:00:00	17/71	Bomba	05-11-2012	2012-11-05 00:00:00	17/71	BSI	52.0924187	4.71734285	in boom - Hoogendoornlaan	Bodegraven	ZH	\N	\N
2900	14-09-2018	2018-09-14 00:00:00	40/53	Outdoor Man	14-09-2018	2018-09-14 00:00:00	40/54	HighKing	52.4824181	4.84124804	tegen lantaarnpaal Westerdijk	Wijdewormer	NH	\N	\N
3069	06-04-2019	2019-04-06 00:00:00	40/264	Coenster	07-04-2019	2019-04-07 00:00:00	40/265	Roeleey	52.1476898	5.06445312	aan hek P-terrein fort Maarsseveen	Maarssen	Ut	\N	\N
1898	02-05-2015	2015-05-02 00:00:00	28/66	Corney28	03-05-2015	2015-05-03 00:00:00	28/67	Ronald_010	52.894989	5.64568806	achter plantenbak - Koestraat	Sloten	Fr	\N	\N
2936	26-10-2018	2018-10-26 00:00:00	40/95	BornToReign	27-10-2018	2018-10-27 00:00:00	40/95	FastEddy	52.6806984	6.76947594	aan slootkant Reindersdijk	Dalen	Dr	\N	\N
4110	03-02-2022	2022-02-03 00:00:00	41/210	ootje	03-02-2022	2022-02-03 00:00:00	41/210	Outdoor Man	52.3022652	4.88237619	in boompje achter brandweerkazerne	Amstelveen	NH	\N	\N
4126	16-02-2022	2022-02-16 00:00:00	41/220	Sjefman	17-02-2022	2022-02-17 00:00:00	41/221	Roeleey	51.6050682	4.10457706	hoek van P-terrein Havenweg	St. Annaland	Ze	\N	\N
685	13-01-2012	2012-01-13 00:00:00	14/14	tdemmer	14-01-2012	2012-01-14 00:00:00	14/15	Ronald_010	51.9570427	5.34634495	aan hek Prs. Marijkesluis - Lekbandijk, Rijswijk, NB	Rijswijk	NB	\N	\N
3278	23-10-2019	2019-10-23 00:00:00	40/486	Outdoor Man	24-10-2019	2019-10-24 00:00:00	40/487	Coenster	52.5076637	4.79576683	tegen linkerboom Wormerringdijk	Wormer	NH	\N	\N
4403	18-09-2023	2023-09-18 00:00:00	41/403	Janhertog	25-09-2023	2023-09-25 00:00:00	41/403	BSI	52.8511887	6.109694	tegen boom bocht Westvierdeparten	Steggerda	Fr	\N	\N
55	20-09-2010	2010-09-20 00:00:00	2/90	vuurbloed	20-09-2010	2010-09-20 00:00:00	2/92	beeldhouwer	52.296505	4.68221521	politiebureau Hoofdweg, Hoofddorp, NH	Hoofddorp	NH	\N	\N
453	03-07-2011	2011-07-03 00:00:00	10/91	Phaedrus	03-07-2011	2011-07-03 00:00:00	10/92	bakfiets1	51.8899269	4.54084015	boom in park de Twee Heuvels, IJsselmonde, ZH	IJsselmonde	ZH	\N	\N
2235	12-09-2016	2016-09-12 00:00:00	32/11	Dirk130	14-09-2016	2016-09-14 00:00:00	32/12	PatrickSoler	52.0035629	4.13797092	aan bord Nieuwlandsedijk	s-Gravenzande	ZH	\N	\N
3569	03-07-2020	2020-07-03 00:00:00	40/724	Amauta	04-07-2020	2020-07-04 00:00:00	40/725	pdv_moto	51.5122223	3.46457291	tegen GSM-mast P-terrein de Bucksweg	Westkapelle	Ze	\N	\N
2265	07-10-2016	2016-10-07 00:00:00	32/53	MeanYellowBoy	08-10-2016	2016-10-08 00:00:00	32/54	Amauta	52.5072403	6.46212721	aan infobord - Eerderveldweg	Ommen	Ov	\N	\N
2255	28-09-2016	2016-09-28 00:00:00	32/36	Bensi	30-09-2016	2016-09-30 00:00:00	32/38	Janhertog	51.8456078	6.159657	aan hijskraan steenfabriek - Spijksedijk	Spijk	Ge	\N	\N
4115	06-02-2022	2022-02-06 00:00:00	41/212	Outdoor Man	07-02-2022	2022-02-07 00:00:00	41/213	ootje	52.479126	4.64455223	tegen boom P-terrein C. van Baerlehof	Beverwijk	NH	\N	\N
4275	01-01-2023	2023-01-01 00:00:00	41/320	ootje	01-01-2023	2023-01-01 00:00:00	41/320	Outdoor Man	52.5567207	4.69941521	aan hek Uitgeesterweg	Limmen	NH	\N	\N
1480	17-01-2014	2014-01-17 00:00:00	24/42	BSI	17-01-2014	2014-01-17 00:00:00	24/42	Vins111	52.1818962	5.42034197	in vork boom - Holleweg	Amersfoort	Ut	\N	\N
1168	13-04-2013	2013-04-13 00:00:00	20/29	Scoot_020/Scoot_2	13-04-2013	2013-04-13 00:00:00	20/29	Ronald_010	52.4712639	4.85532379	bij knooppunt 50 - Zuiderweg	Wijdewormer	NH	\N	\N
4143	07-03-2022	2022-03-07 00:00:00	41/230	BSI	10-03-2022	2022-03-10 00:00:00	41/230	Deeffox	51.8017273	4.95947504	aan poot infobord 's-Heerenloo	Sleeuwijk	NB	\N	\N
2722	21-04-2018	2018-04-21 00:00:00	38/47	Amauta	21-04-2018	2018-04-21 00:00:00	38/48	jaap43	52.0979424	4.26665592	tussen tonnen Havenmonument	Scheveningen	ZH	\N	\N
2864	16-08-2018	2018-08-16 00:00:00	40/16	pdv_moto	16-08-2018	2018-08-16 00:00:00	40/16	Bomba	52.1791534	4.4062829	aan hekpaal Wassenaarseweg	Katwijk	ZH	\N	\N
1172	16-04-2013	2013-04-16 00:00:00	20/34	Outdoor Man	16-04-2013	2013-04-16 00:00:00	20/35	Bigtwim	52.2947655	4.83463907	bij kerk - Noorddammerlaan	Amstelveen	NH	\N	\N
858	11-07-2012	2012-07-11 00:00:00	16/32	Buuv	12-07-2012	2012-07-12 00:00:00	16/33	frankivo	52.996563	6.52683687	bij kastje Balkengracht 3	Assen	Dr	\N	\N
2441	30-05-2017	2017-05-30 00:00:00	34/63	PatrickSoler	30-05-2017	2017-05-30 00:00:00	34/63	Rik60NL	52.1376038	4.55040121	aan regenpijp van hok - Rindijk	Hazerswoude	ZH	\N	\N
3509	24-05-2020	2020-05-24 00:00:00	40/673	ronk	24-05-2020	2020-05-24 00:00:00	40/674	Deeffox	51.7288399	4.8608942	onder trap grindwerkershut Vissershang	Hank	NB	\N	\N
4330	29-04-2023	2023-04-29 00:00:00	41/355	SwitchUp	30-04-2023	2023-04-30 00:00:00	41/356	Picobello BV	52.5954094	4.65977097	tegen boom in perk Abdij van Egmond	Egmond-binnen	NH	\N	\N
1374	29-09-2013	2013-09-29 00:00:00	23/12	Ronald_010	29-09-2013	2013-09-29 00:00:00	23/13	V-Strommert	52.2296257	4.81445599	aan bord bij fort aan de Drecht	Uithoorn	NH	\N	\N
1994	18-08-2015	2015-08-18 00:00:00	29/47	Rik60NL	18-08-2015	2015-08-18 00:00:00	29/47	Roeleey	52.2869987	5.02291822	achter E-kast  P-plaats Kanaaldijk-O	Weesp	NH	\N	\N
4256	17-10-2022	2022-10-17 00:00:00	41/305	ootje	21-10-2022	2022-10-21 00:00:00	41/305	Outdoor Man	52.6007843	4.73661709	tegen boomstam Nyenburgerweg	Alkmaar	NH	\N	\N
417		0001-01-01 00:00:00 BC		swordsdance		0001-01-01 00:00:00 BC			\N	\N				\N	\N
3475	25-04-2020	2020-04-25 00:00:00	40/647	Amauta	25-04-2020	2020-04-25 00:00:00	40/647	FastEddy	53.3516045	6.45117807	aan remmingswerk bij sluis A. Stok	Eenrum	Fr	\N	\N
1537	03-03-2014	2014-03-03 00:00:00	25/09	tdemmer	04-03-2014	2014-03-04 00:00:00	25/09	BSI	52.123497	5.87482214	aan hek Wesselplantsoen	Hoenderloo	Ge	\N	\N
3771	19-12-2020	2020-12-19 00:00:00	40/906	pdv_moto	19-12-2020	2020-12-19 00:00:00	40/906	Hans89	51.9746208	4.13175297	onder tral toren lichtlijn	Hoek van Holland	ZH	\N	\N
2006	02-09-2015	2015-09-02 00:00:00	29/58	Meifesto	04-09-2015	2015-09-04 00:00:00	29/59	ArendJan	51.8700142	4.51617002	aan lantaarnpaal Maeterlinckpad	Rotterdam	ZH	\N	\N
3982	20-07-2021	2021-07-20 00:00:00	41/126	HighKing	20-07-2021	2021-07-20 00:00:00	41/126	Outdoor Man	52.4573135	4.55898714	in kanon Kennemerboulevard	IJmuiden	NH	\N	\N
3307	16-11-2019	2019-11-16 00:00:00	40/512	Hans89	26-11-2019	2019-11-26 00:00:00	40/517	pdv_moto	51.4547157	3.58089995	tegen boom Algemene begraafplaats	Vlissingen	Ze	\N	\N
904	20-08-2012	2012-08-20 00:00:00	16/81	Hans89	25-08-2012	2012-08-25 00:00:00	16/83	-Floris-	51.4405136	3.58045912	in stalen molenroede - Oranjedijk	Vlissingen	Ze	\N	\N
1274	08-07-2013	2013-07-08 00:00:00	21/74	rvdh86	09-07-2013	2013-07-09 00:00:00	21/74	tdemmer	52.2718849	5.74647903	achter E-kast - Uddelermeerweg	Ermelo	Ge	\N	\N
1563	19-03-2014	2014-03-19 00:00:00	25/32	frankivo	22-03-2014	2014-03-22 00:00:00	25/36	Buuv	52.8193436	6.62260485	in talud bij picknicktafel Spekdiek	Gaminge	Dr	\N	\N
1780	26-10-2014	2014-10-26 00:00:00	27/58	Ronald_010	27-10-2014	2014-10-27 00:00:00	27/59	Lekkerbekje	51.5541344	5.48985195	bij brug over Dommel - Lieshoutseweg	Nijnsel	NB	\N	\N
4341	18-05-2023	2023-05-18 00:00:00	41/364	Pydejong	21-05-2023	2023-05-21 00:00:00	41/365	Okami_Xci	51.5088234	5.37753105	onder houten balk Bestse Klomp	Best	NB	\N	\N
502	17-08-2011	2011-08-17 00:00:00	11/52	Bigtwim	17-08-2011	2011-08-17 00:00:00	11/53	Scoot_020/Scoot_2	52.4178734	4.68079805	aan boom - Liniepad, Spaarndam, NH	Spaarndam	NH	\N	\N
4149	18-03-2022	2022-03-18 00:00:00	41/235	Deeffox	19-03-2022	2022-03-19 00:00:00	41/236	Sjefman	51.8049355	4.69195318	achter boom P-terrein Halmaheiraplein	Dordrecht	ZH	\N	\N
159	04-12-2010	2010-12-04 00:00:00	5/31	Wimis on	05-12-2010	2010-12-05 00:00:00	5/33	BigJim	52.0799828	5.37932014	Henschotermeer - de Heygraeff, Woudenberg, Ut	Woudenberg	Ut	\N	\N
3883	16-04-2021	2021-04-16 00:00:00	41/047	FastEddy	17-04-2021	2021-04-17 00:00:00	41/047	pdv_moto	52.9738655	6.77764893	tegen boom Schaopsteeg	Gasselte	Dr	\N	\N
170	18-12-2010	2010-12-18 00:00:00	5/46	bobcat	18-12-2010	2010-12-18 00:00:00	5/49	rogerno1	52.4679489	4.55695009	havenhoofd Reyndersweg, Velsen-Noord, NH	Velsen	NH	\N	\N
4352	05-06-2023	2023-06-05 00:00:00	41/371	Deeffox	07-06-2023	2023-06-07 00:00:00	41/371	Hans89	51.8045883	4.68971682	tegen boom in perkje Reeweg-Oost	Dordrecht	ZH	\N	\N
4204	03-06-2022	2022-06-03 00:00:00	41/271	BSI	04-06-2022	2022-06-04 00:00:00	41/271	rvdh86	52.239418	5.97845602	onder voorwiel Oranje fiets O.Veluweweg	Apeldoorn	Ge	\N	\N
131	08-11-2010	2010-11-08 00:00:00	4/62	Dirk130	08-11-2010	2010-11-08 00:00:00	4/63	Dennisik	52.0943298	4.50389624	Geerweg, Zoeterwoude, ZH	Zoeterwoude	ZH	\N	\N
3105	05-05-2019	2019-05-05 00:00:00	40/309	Sjefman	05-05-2019	2019-05-05 00:00:00	40/309	bikedan	51.4280586	4.31021786	tegen lantaarnpaal bij tank Onderstal	Woensdrecht	NB	\N	\N
4019	31-08-2021	2021-08-31 00:00:00	41/149	BigJim	31-08-2021	2021-08-31 00:00:00	41/149	Outdoor Man	52.5904503	4.85118914	achter hek museum Nic Jonk, Havendijkje	Grootschermer	NH	\N	\N
312	06-04-2011	2011-04-06 00:00:00	8/72	BSI	07-04-2011	2011-04-07 00:00:00	8/74	Wimis on	52.0412216	5.69316006	hek bij GSM-mast - Arnhemseweg, Ede, Ge	Ede	Ge	\N	\N
3420	20-03-2020	2020-03-20 00:00:00	40/600	ootje	21-03-2020	2020-03-21 00:00:00	40/600	pdv_moto	52.718586	4.83670282	tegen poot Nr. 9, Waarddijk	Heerhugowaard	NH	\N	\N
3137	06-06-2019	2019-06-06 00:00:00	40/349	ey-dzeej	06-06-2019	2019-06-06 00:00:00	40/349	ArendJan	51.9630737	4.57916212	tegen bijenhotel Grote Wielen	Rotterdam	ZH	\N	\N
3239	13-09-2019	2019-09-13 00:00:00	40/455	bikedan	13-09-2019	2019-09-13 00:00:00	40/455	FastEddy	52.5366402	5.73201513	aan poot bord poort 3, Staalwijk	Dronten	Fl	\N	\N
3632	19-08-2020	2020-08-19 00:00:00	40/792	HighKing	20-08-2020	2020-08-20 00:00:00	40/793	Yosra87	52.4496193	4.90979481	tegen hek huis A. Heyboer, Noordeinde	Den Ilp	NH	\N	\N
1131	22-03-2013	2013-03-22 00:00:00	19/71	BSI	22-03-2013	2013-03-22 00:00:00	19/72	Roeleey	52.3844109	5.53635311	aan hek Hoge Knarsluis	Zeewolde	Fl	\N	\N
2663	16-03-2018	2018-03-16 00:00:00	37/79	FastEddy	16-03-2018	2018-03-16 00:00:00	37/79	Amauta	53.1268425	7.18101883	aan hek Wijmeesterweg	Bellingwolde	Gr	\N	\N
4297	05-03-2023	2023-03-05 00:00:00	41/334	Deeffox	05-03-2023	2023-03-05 00:00:00	41/334	Simonshavenaar	51.7664871	4.63727713	in knotwilg Olivein	Dordrecht	ZH	\N	\N
3265	10-10-2019	2019-10-10 00:00:00	40/477	Hans89	11-10-2019	2019-10-11 00:00:00	40/477	Deeffox	51.9264259	4.5956192	tegen steunbeer kerk, Kerklaan	Capelle aan den Ijssel	ZH	\N	\N
4243	16-09-2022	2022-09-16 00:00:00	41/298	FastEddy	22-09-2022	2022-09-22 00:00:00	41/299	Amauta	52.7918663	6.53212404	tussen sten bij VAM-berg	Wijster	Dr	\N	\N
13	24-08-2010	2010-08-24 00:00:00	1/35	I-accelarate	24-08-2010	2010-08-24 00:00:00	1/38	Quark	52.6019783	6.39117813	Hoogeveenseweg, Balkbrug, Ov	Balkbrug	Ov	\N	\N
21	28-08-2010	2010-08-28 00:00:00	1/67	SPutnick	28-08-2010	2010-08-28 00:00:00	1/69	ootje	52.0058708	4.73730087	Provincialeweg West-N228, Gouda, ZH	Gouda	ZH	\N	\N
325	11-04-2011	2011-04-11 00:00:00	8/92	Wimis on	11-04-2011	2011-04-11 00:00:00	8/94	patman vtr	51.2496529	5.65266418	hek bij spoorwegovergang Trancheeweg, Weert, Li	Weert	Li	\N	\N
1033	22-12-2012	2012-12-22 00:00:00	18/35	Geert-26	22-12-2012	2012-12-22 00:00:00	18/35	tdemmer	51.9294777	4.45256281	in hoek vissteiger - Vroesenpark	Rotterdam	ZH	\N	\N
2537	03-09-2017	2017-09-03 00:00:00	35/81	HighKing	04-09-2017	2017-09-04 00:00:00	35/82	HermanK	52.8258514	4.77215385	achter gemaaltje Keinsmerweg	t Zand	NH	\N	\N
1897	01-05-2015	2015-05-01 00:00:00	28/66	Bigtwim	02-05-2015	2015-05-02 00:00:00	28/66	Corney28	53.0757484	5.39300013	in doel voetbalveld op camping	Cornwerd	Fr	\N	\N
4196	27-05-2022	2022-05-27 00:00:00	41/267	Ronny Rabbelaar	28-05-2022	2022-05-28 00:00:00	41/267	scheurschuimpje	52.7842293	5.81889486	in borstwering oude haven Kuinre	Luttelegeest	Fl	\N	\N
1283	14-07-2013	2013-07-14 00:00:00	21/85	bikedan	15-07-2013	2013-07-15 00:00:00	21/88	Kiki92	51.37463	4.3368578	onder stronk - Zandvlietseweg	Ossendrecht	NB	\N	\N
43	11-09-2010	2010-09-11 00:00:00	2/63	Grote Voet	11-09-2010	2010-09-11 00:00:00	2/64	Plexat	52.2530594	5.16473722	infoschuur GNR - Naarderweg, Hilversum, Ut	Hilversum	Ut	\N	\N
713	24-02-2012	2012-02-24 00:00:00	14/61	ndeeka	24-02-2012	2012-02-24 00:00:00	14/61	Kermit de Hond	52.0862312	5.10503578	motorbeurs - Jaarbeurshallen, Utrecht, Ut	Utrecht	Ut	\N	\N
3402	06-03-2020	2020-03-06 00:00:00	40/584	Hans89	06-03-2020	2020-03-06 00:00:00	40/584	pdv_moto	51.4766388	5.37540483	in heg bij E-kast Eindhovensedijk	Oirschot	NB	\N	\N
3482	30-04-2020	2020-04-30 00:00:00	40/652	FastEddy	01-05-2020	2020-05-01 00:00:00	40/652	pdv_moto	53.075901	7.14894819	tegen boom monument Tijdens	Vriescheloo	Gr	\N	\N
857	11-07-2012	2012-07-11 00:00:00	16/31	frankivo	11-07-2012	2012-07-11 00:00:00	16/32	Buuv	52.9724503	6.97513819	bij watertoren - Ceresstraat	Stadskanaal	Gr	\N	\N
38	06-09-2010	2010-09-06 00:00:00	2/46	smoffler	07-09-2010	2010-09-07 00:00:00	2/48	R1.Petje	51.5103645	4.45510578	Molenbeekpad, Roosendaal, NB	Roosendaal	NB	\N	\N
3168	11-07-2019	2019-07-11 00:00:00	40/383	Sjefman	12-07-2019	2019-07-12 00:00:00	40/384	pdv_moto	52.3861771	5.21866989	aan paaltje Rie Mastenbroekpad	Almere	Fl	\N	\N
349	27-04-2011	2011-04-27 00:00:00	9/34	BSI	27-04-2011	2011-04-27 00:00:00	9/35	lichthuis	52.4525757	5.55655479	boomstoel in Larserbos - Zeebiesweg, Lelystad, Fl	Lelystad	Fl	\N	\N
4220	17-07-2022	2022-07-17 00:00:00	41/281	Phaedrus	17-07-2022	2022-07-17 00:00:00	41/281	Deeffox	51.8223381	4.6665678	in steenglooing Merwede, Maaspad	Zwijndrecht	ZH	\N	\N
347	25-04-2011	2011-04-25 00:00:00	9/30	El Rojo	26-04-2011	2011-04-26 00:00:00	9/31	lichthuis	52.1828384	5.22859097	achter hek Zevenlindenweg, Lage Vuursche, Ut	Lage Vuursche	Ut	\N	\N
1938	17-06-2015	2015-06-17 00:00:00	28/101	Fenrir-sol	17-06-2015	2015-06-17 00:00:00	29/01	ArendJan	51.8642235	4.55189514	bij ingang foto Klein - Oosteinde	Barendrecht	ZH	\N	\N
1969	22-07-2015	2015-07-22 00:00:00	29/26	Roeleey	22-07-2015	2015-07-22 00:00:00	29/27	Ronald_010	52.2975006	4.97634697	bij kerk Renswoudestraat	Amsterdam	NH	\N	\N
3948	21-06-2021	2021-06-21 00:00:00	41/100	ootje	21-06-2021	2021-06-21 00:00:00	41/101	BigJim	52.6270714	4.7612381	in oranje amfoor 123tuintechniek	Alkmaar	NH	\N	\N
1963	19-07-2015	2015-07-19 00:00:00	29/23	Amauta	19-07-2015	2015-07-19 00:00:00	29/23	Kermit de Hond	53.2353325	6.52271795	aan trafohuisje Reitdiephaven	Groningen	Gr	\N	\N
86	07-10-2010	2010-10-07 00:00:00	3/52	Franko P	07-10-2010	2010-10-07 00:00:00	3/52	Xevoo	51.3366585	5.18106222	vijver Burg. Willekeslaan, Reusel, NB	Reusel	NB	\N	\N
4304	16-03-2023	2023-03-16 00:00:00	41/338	jaap43	17-03-2023	2023-03-17 00:00:00	41/338	pdv_moto	51.7230568	4.40615082	aan hek bij strandje Haringvliet	Numansdorp	ZH	\N	\N
1434	29-11-2013	2013-11-29 00:00:00	23/89	Hasseman	02-12-2013	2013-12-02 00:00:00	23/92	Sjantaalfoutje	52.3697777	7.00011206	op P-terrein Natura Docet	Denekamp	Ov	\N	\N
1063	04-02-2013	2013-02-04 00:00:00	18/89	SadBunny	04-02-2013	2013-02-04 00:00:00	18/90	Roeleey	52.2764244	4.75068617	aan vangrail Boeingavenue	Schiphol-Rijk	NH	\N	\N
4007	17-08-2021	2021-08-17 00:00:00	41/142	Ronny Rabbelaar	20-08-2021	2021-08-20 00:00:00	41/143	Outdoor Man	51.7615471	5.921772	in struik bij Wacoglider, 1e Colonjes	Groesbeek	Ge	\N	\N
3687	02-10-2020	2020-10-02 00:00:00	40/836	BSI	02-10-2020	2020-10-02 00:00:00	40/837	Outdoor Man	52.2397957	5.23399401	tegen hek bij paal 3 Gooyergracht	Laren	Ut	\N	\N
1742	14-09-2014	2014-09-14 00:00:00	27/24	Bigtwim	15-09-2014	2014-09-15 00:00:00	27/25	BSI	52.7743759	4.74314213	bij hek begraafplaats Kerkepad	Sint Maarten	NH	\N	\N
2963	22-12-2018	2018-12-22 00:00:00	40/136	pdv_moto	24-12-2018	2018-12-24 00:00:00	40/137	Roeleey	50.7587357	6.01783514	tegen bord P-terrein Viergrenzenweg	Vaals	Li	\N	\N
1457	31-12-2013	2013-12-31 00:00:00	24/15	tdemmer	02-01-2014	2014-01-02 00:00:00	24/16	BSI	51.96875	4.55656624	aan hek Wollefoppenweg	Rotterdam	ZH	\N	\N
391	27-05-2011	2011-05-27 00:00:00	10/12	honda_power	28-05-2011	2011-05-28 00:00:00	10/13	Scoot_020/Scoot_2	52.6084175	5.01955986	hek bij monument 1676, Scharwoude, NH	Scharwoude	NH	\N	\N
91	10-10-2010	2010-10-10 00:00:00	3/62	BrouwerER6N	12-10-2010	2010-10-12 00:00:00	3/65	Smuiger	53.1820831	4.85524893	vuurtoren, Texel, NH	Texel	NH	\N	\N
3667	17-09-2020	2020-09-17 00:00:00	40/821	Outdoor Man	17-09-2020	2020-09-17 00:00:00	40/821	BSI	52.4321404	4.72217989	in struik Zijkannal-C-weg	Spaarndam	NH	\N	\N
190	10-01-2011	2011-01-10 00:00:00	5/94	hplaverda	11-01-2011	2011-01-11 00:00:00	5/98	ootje	52.5765266	4.81499386	Meerdijk, Grootschermer, NH	Grootschermer	NH	\N	\N
4376	12-07-2023	2023-07-12 00:00:00	41/385	Outdoor Man	12-07-2023	2023-07-12 00:00:00	41/386	HighKing	52.4971504	4.72767687	aan paal bij kruithuis aan de Dam	Uitgeest	NH	\N	\N
3609	04-08-2020	2020-08-04 00:00:00	40/765	Raviel	04-08-2020	2020-08-04 00:00:00	40/766	Deeffox	51.8602524	4.66115189	tegen muurtje monument Polderstraat	Alblasserdam	ZH	\N	\N
2724	22-04-2018	2018-04-22 00:00:00	38/49	bikedan	23-04-2018	2018-04-23 00:00:00	38/51	Bosso	51.4479141	4.31359005	aan hoekpaal grasperk	Hoogerheide	NB	\N	\N
2922	05-10-2018	2018-10-05 00:00:00	40/81	leeqnl	06-10-2018	2018-10-06 00:00:00	40/81	Amauta	53.2221184	6.65220118	aan hek Woldmeerweg	Groningen	Gr	\N	\N
3436	29-03-2020	2020-03-29 00:00:00	40/614	pdv_moto	30-03-2020	2020-03-30 00:00:00	40/615	Outdoor Man	53.1305428	6.72213697	in struik Woldweg, Wolfsbarge	Kropswolde	Gr	\N	\N
2391	20-04-2017	2017-04-20 00:00:00	34/18	Roeleey	20-04-2017	2017-04-20 00:00:00	34/18	pdv_moto	52.3134155	4.93980598	in struikje - Passage	Amsterdam	NH	\N	\N
1067	06-02-2013	2013-02-06 00:00:00	18/94	Corney28	06-02-2013	2013-02-06 00:00:00	18/95	Ronald_010	52.2083855	4.86770821	achter muur Kerk - Dorpsstraat	Mijdrecht	Ut	\N	\N
693	25-01-2012	2012-01-25 00:00:00	14/28	tdemmer	25-01-2012	2012-01-25 00:00:00	14/28	jaap43	52.0694504	4.74386215	aan brug - P-plaats Europalaan, Bodegraven, ZH	Bodegraven	ZH	\N	\N
2562	11-10-2017	2017-10-11 00:00:00	36/24	Rik60NL	12-10-2017	2017-10-12 00:00:00	36/25	Amauta	52.1713562	4.69791985	in struiken - Aardamseweg	Ter Aar	ZH	\N	\N
3548	14-06-2020	2020-06-14 00:00:00	40/705	Sjefman	15-06-2020	2020-06-15 00:00:00	40/706	DKP	51.5335884	4.33625221	achter oorlogsmonument 	Moerstraten	NB	\N	\N
176		0001-01-01 00:00:00 BC		Lady_Yce		0001-01-01 00:00:00 BC			\N	\N				\N	\N
2164	29-06-2016	2016-06-29 00:00:00	31/38	nappertje	01-07-2016	2016-07-01 00:00:00	31/38	Ronald_010	52.1466217	4.38900614	in bosje ingang Duinrel/Tikibad	Wassenaar	ZH	\N	\N
1843	21-02-2015	2015-02-21 00:00:00	28/16	Ronald_010	21-02-2015	2015-02-21 00:00:00	28/17	Scoot_020/Scoot_2	51.7304878	5.12112999	aan wegwijzer - Heesbeenseweg	Heusden	NB	\N	\N
3399	03-03-2020	2020-03-03 00:00:00	40/581	pdv_moto	04-03-2020	2020-03-04 00:00:00	40/582	Carburateur	51.5427704	3.44440889	onder deksel P-plaats Hogeweg	Westkapelle	Ze	\N	\N
375	17-05-2011	2011-05-17 00:00:00	9/83	jaap43	17-05-2011	2011-05-17 00:00:00	9/84	ndeeka	51.9520454	4.50847387	parkeerplaats Boterdorps verlaat, Rotterdam, ZH	Rotterdam	ZH	\N	\N
2179	23-07-2016	2016-07-23 00:00:00	31/53	Rik60NL	23-07-2016	2016-07-23 00:00:00	31/54	coffeejunk	52.198864	4.81434011	de Hoef Westzijde	Zevenhoven	ZH	\N	\N
2382	13-04-2017	2017-04-13 00:00:00	34/07	Amauta	14-04-2017	2017-04-14 00:00:00	34/08	frankivo	53.1915474	6.50062704	onder huten brug Peizerdiep	Peize	Dr	\N	\N
2773	06-06-2018	2018-06-06 00:00:00	39/12	ItsmeA3	07-06-2018	2018-06-07 00:00:00	39/13	Bomba	51.8500328	4.3911562	aan 7e hek Slaperskade	Poortugaal	ZH	\N	\N
175	20-12-2010	2010-12-20 00:00:00	5/54	Rider_Heleen	21-12-2010	2010-12-21 00:00:00	5/55	Wimis on	52.1910858	5.16377687	glijbaan a/d Zwartebergseweg, Hilversum, NH	Hilversum	NH	\N	\N
1524	21-02-2014	2014-02-21 00:00:00	24/94	Bomba	21-02-2014	2014-02-21 00:00:00	24/95	Roeleey	52.0839958	5.1040659	lopens op de Jaarbeurs	Utrecht	Ut	\N	\N
4398	10-09-2023	2023-09-10 00:00:00	41/401	k0en	14-09-2023	2023-09-14 00:00:00	41/401	BSI	52.0611038	5.11396217	tegen hek Prozeeweg	Utrecht	Ut	\N	\N
3257	02-10-2019	2019-10-02 00:00:00	40/470	Hans89	02-10-2019	2019-10-02 00:00:00	40/470	WillyvD	51.831665	4.52671385	in monument vbrug Oude Maas	Berendrecht	ZH	\N	\N
1421	17-11-2013	2013-11-17 00:00:00	23/78	tdemmer	17-11-2013	2013-11-17 00:00:00	23/79	Meifesto	51.9097672	4.58484697	aan beeld - Industrieweg	Krimpen aan den IJssel	ZH	\N	\N
2737	04-05-2018	2018-05-04 00:00:00	38/69	aisnoek	05-05-2018	2018-05-05 00:00:00	38/69	FastEddy	52.8405685	6.72084999	onder steen Oranjekaan-Zuid	Wezeperbrug	Dr	\N	\N
2281	28-10-2016	2016-10-28 00:00:00	32/77	aisnoek	28-10-2016	2016-10-28 00:00:00	32/79	Janhertog	52.6152382	6.72706318	onder gemeentebord - Vilsterborg	Hardenberg	Ov	\N	\N
2455	12-06-2017	2017-06-12 00:00:00	34/81	BSI	12-06-2017	2017-06-12 00:00:00	34/81	Kevson	52.1636429	5.61847496	achter paaltje Hanzeweg	Barneveld	Ge	\N	\N
3388	20-02-2020	2020-02-20 00:00:00	40/572	FastEddy	21-02-2020	2020-02-21 00:00:00	40/573	wachtbalkje	52.0852127	5.10117579	in R-bloembak achterzijde Jaarbeurshal	Utrecht	Ut	\N	\N
1691	20-07-2014	2014-07-20 00:00:00	26/69	Bomba	20-07-2014	2014-07-20 00:00:00	26/70	Corney28	52.1805916	4.95443296	aan stuw Bosdijk	Nieuwer Ter Aa	Ut	\N	\N
2574	27-10-2017	2017-10-27 00:00:00	36/40	nappertje	28-10-2017	2017-10-28 00:00:00	36/41	SadBunny	52.1245918	5.8319478	in struik bij ingang Hoge Veluwe	Otterlo	Ge	\N	\N
2383	15-04-2017	2017-04-15 00:00:00	34/09	frankivo	15-04-2017	2017-04-15 00:00:00	34/10	Bensi	52.6215858	6.69899178	onder spoorbrug de Vecht	Gramsbergen	Ov	\N	\N
374	16-05-2011	2011-05-16 00:00:00	9/80	Dirk130	17-05-2011	2011-05-17 00:00:00	9/83	jaap43	52.0325813	4.74693584	bij ophaalbrug Zoetendijk/Ree, Sluipwijk, ZH	Sluipwijk	ZH	\N	\N
4090	10-01-2022	2022-01-10 00:00:00	41/196	Roeleey	10-01-2022	2022-01-10 00:00:00	41/197	BSI	52.1682549	5.5653162	aan voet reclamepaal MaDonalds	Terschuur	Ge	\N	\N
2530	27-08-2017	2017-08-27 00:00:00	35/71	SadBunny	28-08-2017	2017-08-28 00:00:00	35/73	BSI	52.3993683	5.16130781	in struik landtong Oostvaardersdijk	Almere	Fl	\N	\N
2134	21-05-2016	2016-05-21 00:00:00	31/05	Amauta	25-05-2016	2016-05-25 00:00:00	31/07	Bassjunky	53.3048706	6.49394083	onder heg bij molen	Garnwerd	Gr	\N	\N
605	27-10-2011	2011-10-27 00:00:00	13/08	Hasseman	28-10-2011	2011-10-28 00:00:00	13/09	MotorMieke	52.2898788	6.73622799	aan struik in bocht Twickelerblokweg, Borne, Ov	Borne	Ov	\N	\N
506	18-08-2011	2011-08-18 00:00:00	11/56	hills89	19-08-2011	2011-08-19 00:00:00	11/58	BSI	52.1751633	4.43407202	bankje spottersplek - Achterweg, Valkenburg, ZH	Valkenburg	ZH	\N	\N
4310	30-03-2023	2023-03-30 00:00:00	41/342	ootje	30-03-2023	2023-03-30 00:00:00	41/342	Outdoor Man	52.4789085	4.81344604	tegen boom bij Kalverringdijk 30	Zaandam	NH	\N	\N
215	31-01-2011	2011-01-31 00:00:00	7/74	horney	01-02-2011	2011-02-01 00:00:00	6/76	V-Strommert	52.4692383	4.76669312	betonblok Vaartdijk, Assendelft, NH	Assendelft	NH	\N	\N
2292	20-11-2016	2016-11-20 00:00:00	32/99	pdv_moto	23-11-2016	2016-11-23 00:00:00	33/02	PatrickSoler	52.0912437	4.28153992	in stapel stenen - Casheuvel	Den Haag	ZH	\N	\N
1582	02-04-2014	2014-04-02 00:00:00	25/55	Vins111	02-04-2014	2014-04-02 00:00:00	25/56	Bomba	51.9613991	5.17816782	onder infobord Goilberdingerdijk	Culemborg	Ge	\N	\N
3207	12-08-2019	2019-08-12 00:00:00	40/421	Hans89	13-08-2019	2019-08-13 00:00:00	40/422	Bomba	51.9064293	4.62575102	aan steiger surfplas Krimpernerhout	Krimpen aan den Lek	ZH	\N	\N
3414	16-03-2020	2020-03-16 00:00:00	40/593	DKP	16-03-2020	2020-03-16 00:00:00	40/593	Hans89	51.4822807	4.466959	tegen kapelletje Broekakkerstraat	Nispen	NB	\N	\N
3127	27-05-2019	2019-05-27 00:00:00	40/339	ootje	27-05-2019	2019-05-27 00:00:00	40/340	Pendragon	52.583416	4.69064999	achter kastje Kapellaan	Heiloo	NH	\N	\N
3020	23-02-2019	2019-02-23 00:00:00	40/216	FastEddy	24-02-2019	2019-02-24 00:00:00	40/217	Amauta	52.8912277	6.8496418	onder boomtal schuilhut	Eexlo	Dr	\N	\N
326	11-04-2011	2011-04-11 00:00:00	8/92	patman vtr	12-04-2011	2011-04-12 00:00:00	8/96	ElBarto	51.3892975	5.59154701	onder brug Rielloop - Stabrecht, Heeze, NB	Heeze	NB	\N	\N
3946	20-06-2021	2021-06-20 00:00:00	41/099	BigJim	20-06-2021	2021-06-20 00:00:00	41/099	Outdoor Man	52.5590897	4.64559317	tegen hek Watertorenpad	Castricum	NH	\N	\N
2335	11-02-2017	2017-02-11 00:00:00	33/55	BSI	12-02-2017	2017-02-12 00:00:00	33/56	Amauta	52.1900826	5.40672588	tegen muur het Hofslot 1	Amersfoort	Ut	\N	\N
2024	08-10-2015	2015-10-08 00:00:00	29/78	jaap43	08-10-2015	2015-10-08 00:00:00	29/78	Hans89	51.9501915	4.60272598	in knotwilg Bermweg	Nieuwerkerk a/d IJssel	ZH	\N	\N
2368	31-03-2017	2017-03-31 00:00:00	33/92	Bensi	01-04-2017	2017-04-01 00:00:00	33/93	BornToReign	51.9211426	6.09087801	onder beeld Kenneth Scott	Zevenaar	Ge	\N	\N
3282	28-10-2019	2019-10-28 00:00:00	40/491	Coenster	28-10-2019	2019-10-28 00:00:00	40/491	Picobello BV	52.280262	4.93535519	aan steiger veerpontje Holendrecht	Abcoude	Ut	\N	\N
1760	05-10-2014	2014-10-05 00:00:00	27/39	crazy987	06-10-2014	2014-10-06 00:00:00	27/40	-juliet-	51.6783638	4.61975098	aan kast berm Koekoekendijk	Moerdijk	NB	\N	\N
1048	08-01-2013	2013-01-08 00:00:00	18/56	Hans89	08-01-2013	2013-01-08 00:00:00	18/57	inSaNo	51.6432724	4.09919882	aan veersteiger	Anna Jacobapolder	Ze	\N	\N
2185	25-07-2016	2016-07-25 00:00:00	31/57	bikedan	26-07-2016	2016-07-26 00:00:00	31/58	Einschtein	51.4017601	4.31942892	aan Geuzenkei - Trambaan	Ossendrecht	NB	\N	\N
2902	15-09-2018	2018-09-15 00:00:00	40/55	Coenster	16-09-2018	2018-09-16 00:00:00	40/56	Okami_Xci	50.7619743	5.99603224	aan paal infobord Wolfhaag	Vaals	Li	\N	\N
1796	13-11-2014	2014-11-13 00:00:00	27/71	Bomba	14-11-2014	2014-11-14 00:00:00	27/72	Lekkerbekje	52.0751801	4.89085579	aan hek Pompmolenlaan	Woerden	Ut	\N	\N
498		0001-01-01 00:00:00 BC		bobcat		0001-01-01 00:00:00 BC			\N	\N				\N	\N
408	05-06-2011	2011-06-05 00:00:00	10/32	mr Q	05-06-2011	2011-06-05 00:00:00	10/32	NitroMax	51.73423	5.27473593	parkeerterrein Treurenburg, 's-Hertogenbosch, NB	s-Hertogenbosch	NB	\N	\N
199	16-01-2011	2011-01-16 00:00:00	6/18	BSI	17-01-2011	2011-01-17 00:00:00	6/20	Hasseman	52.1706352	5.61620808	Stelconplaten Zeumerseweg, Voorthuizen, Ge	Voorthuizen	Ge	\N	\N
811	27-05-2012	2012-05-27 00:00:00	15/69	bikedan	27-05-2012	2012-05-27 00:00:00	15/70	Sander78	51.3899231	3.57248807	aan hek - aan het eind Deltahoek, Breskens, Ze	Breskens	Ze	\N	\N
2907	19-09-2018	2018-09-19 00:00:00	40/61	Amauta	19-09-2018	2018-09-19 00:00:00	40/62	FastEddy	53.1322556	6.71836281	bij windmotor Kikkoman	Kropswolde	Gr	\N	\N
2502	01-08-2017	2017-08-01 00:00:00	35/34	DKP	02-08-2017	2017-08-02 00:00:00	35/35	Capo-04/06	50.7548332	5.69252014	in meetpaal - Schansweg	Voeren/Eijsden	Li	\N	\N
3624	15-08-2020	2020-08-15 00:00:00	40/784	FastEddy	15-08-2020	2020-08-15 00:00:00	40/784	Amauta	52.6674767	6.82098389	onder brug schans Kathaar	Coevorden	Dr	\N	\N
2240	17-09-2016	2016-09-17 00:00:00	32/18	BornToReign	18-09-2016	2016-09-18 00:00:00	32/18	BSI	51.9424171	5.61517286	aan voet metalen paal bij veerpont	Wageningen	Ge	\N	\N
863	20-07-2012	2012-07-20 00:00:00	16/46	Bedumer	21-07-2012	2012-07-21 00:00:00	16/48	Buuv	53.1393471	6.60367918	aan hek Hooidijk	Eelde	Dr	\N	\N
2406	28-04-2017	2017-04-28 00:00:00	34/30	Rik60NL	29-04-2017	2017-04-29 00:00:00	34/31	Djoost	52.1799202	4.84834909	aan hek Amstelkade	Wilnis	Ut	\N	\N
2107	01-05-2016	2016-05-01 00:00:00	30/78	SadBunny	02-05-2016	2016-05-02 00:00:00	30/79	Roeleey	52.4217262	4.77425909	aan waterkant - Havengebied	Amsterdam	NH	\N	\N
1724	26-08-2014	2014-08-26 00:00:00	27/09	Bigtwim	28-08-2014	2014-08-28 00:00:00	27/10	Djoost	52.4924126	4.66694307	onder brug Foreestpad	Beverwijk	NH	\N	\N
1299	07-08-2013	2013-08-07 00:00:00	22/13	k0en	08-08-2013	2013-08-08 00:00:00	22/13	BSI	52.133152	5.05925417	achter paaltje - Oostwaard	Maarssen	Ut	\N	\N
842	27-06-2012	2012-06-27 00:00:00	16/14	Jeff92	28-06-2012	2012-06-28 00:00:00	16/16	Bigtwim	52.4496117	4.56926918	aan struik bij batterij Heerenduin, Ijmuiden, NH	Ijmuiden	NH	\N	\N
2701	10-04-2018	2018-04-10 00:00:00	38/21	HermanK	10-04-2018	2018-04-10 00:00:00	38/21	MeanYellowBoy	52.0291595	6.65430403	achter beukenhaag Meddoseweg	Oost Gelre	Ov	\N	\N
90	09-10-2010	2010-10-09 00:00:00	3/58	Oxi	09-10-2010	2010-10-09 00:00:00	3/60	BrouwerER6N	51.7116623	5.32433987	verkeersautomaat Bruistensingel, Eindhoven, NB	Eindhoven	NB	\N	\N
918	10-09-2012	2012-09-10 00:00:00	16/95	ootje	10-09-2012	2012-09-10 00:00:00	16/95	Bigtwim	52.5552216	4.65040922	aan boom - Duinenboschweg	Castricum	NH	\N	\N
4103	23-01-2022	2022-01-23 00:00:00	41/204	Ronald_010	26-01-2022	2022-01-26 00:00:00	41/204	DKP	51.266468	6.06953287	tegen hekpaal Bussereindseweg	Beesel	Li	\N	\N
3149	20-06-2019	2019-06-20 00:00:00	40/362	MeanYellowBoy	20-06-2019	2019-06-20 00:00:00	40/363	ootje	52.3733826	4.88876486	in bloembak Raadhuisstraat/Singel	Amsterdam	NH	\N	\N
3230	01-09-2019	2019-09-01 00:00:00	40/446	Bomba	02-09-2019	2019-09-02 00:00:00	40/447	Roeleey	52.0748215	4.91790819	in knotwilg zijweg Cattenburgerdijk	Woerden	Ut	\N	\N
2762	24-05-2018	2018-05-24 00:00:00	38/93	HermanK	25-05-2018	2018-05-25 00:00:00	38/94	Outdoor Man	52.5228233	6.44332218	aan melkstation Coevorderweg	Ommen	Ov	\N	\N
1185	27-04-2013	2013-04-27 00:00:00	20/55	Bludge	28-04-2013	2013-04-28 00:00:00	20/55	Mr.Bean	51.9673462	5.96236801	onder spoorbrijg Ijsseldijk	Westervoort	Ge	\N	\N
1743	15-09-2014	2014-09-15 00:00:00	27/25	BSI	19-09-2014	2014-09-19 00:00:00	27/26	Djoost	52.1783485	5.6040678	in boomstronk - Schoonengweg	Voorthuizen	Ge	\N	\N
1459	04-01-2014	2014-01-04 00:00:00	24/18	Wimis on	04-01-2014	2014-01-04 00:00:00	24/18	Vins111	52.0379486	5.13987923	in heg P-terrein - Meidoornkade	Houten	Ut	\N	\N
3867	08-04-2021	2021-04-08 00:00:00	41/034	Amauta	09-04-2021	2021-04-09 00:00:00	41/035	BSI	52.1613579	6.36008406	in boom bij trekpont Berkel	Lochem	Ge	\N	\N
1223	28-05-2013	2013-05-28 00:00:00	21/11	Bludge	29-05-2013	2013-05-29 00:00:00	21/11	Mr.Bean	51.9147758	6.07254791	aan paaltje Ooysedijk	Zevenaar	Ge	\N	\N
1489	23-01-2014	2014-01-23 00:00:00	24/50	Dirk130	23-01-2014	2014-01-23 00:00:00	24/51	tdemmer	52.1412354	4.54340315	aan hek Achthovenseweg	Leiderdorp	ZH	\N	\N
16		0001-01-01 00:00:00 BC		Martijnski		0001-01-01 00:00:00 BC			\N	\N				\N	\N
579		0001-01-01 00:00:00 BC				0001-01-01 00:00:00 BC		MarkieNL	\N	\N				\N	\N
3567	02-07-2020	2020-07-02 00:00:00	40/722	Picobello BV	02-07-2020	2020-07-02 00:00:00	40/723	FastEddy	53.1821289	6.60476923	tegen boom Bolhuissteeg	Haren	Gr	\N	\N
3932	13-06-2021	2021-06-13 00:00:00	41/091	Bensi	13-06-2021	2021-06-13 00:00:00	41/092	Brnk	52.5171089	6.42051697	onder roede molen Konijnenbelt	Ommen	Ov	\N	\N
2990	18-01-2019	2019-01-18 00:00:00	40/174	Capo-04/06	19-01-2019	2019-01-19 00:00:00	40/175	grootkaalnix	51.0064964	5.76801395	aan paal camper-campinfterrein	Urmont	Li	\N	\N
2957	14-12-2018	2018-12-14 00:00:00	40/129	Roeleey	15-12-2018	2018-12-15 00:00:00	40/129	pdv_moto	52.2955513	4.95917797	achter bors AMC-poli, Meiburgdreef	Amsterdam	NH	\N	\N
290		0001-01-01 00:00:00 BC				0001-01-01 00:00:00 BC		riggard	\N	\N				\N	\N
3400	04-03-2020	2020-03-04 00:00:00	40/583	Carburateur	05-03-2020	2020-03-05 00:00:00	40/583	Picobello BV	51.9360924	4.55533886	achter E-huisje Tattistraat	Rotterdam	ZH	\N	\N
573	11-10-2011	2011-10-11 00:00:00	12/63	bakfiets1	11-10-2011	2011-10-11 00:00:00	12/64	Hans89	51.3995056	4.2189908	aan hek spuisluis - Grensweg, Rilland, Ze	Rilland	Ze	\N	\N
2301	30-11-2016	2016-11-30 00:00:00	33/10	Amauta	30-11-2016	2016-11-30 00:00:00	33/11	frankivo	53.1511383	6.51546383	bij gemaaltje Noorddijk	Peize	Dr	\N	\N
59	22-09-2010	2010-09-22 00:00:00	3/1	V-Strommert	22-09-2010	2010-09-22 00:00:00	3/2	Dirk130	52.1220322	4.29472113	Zwartepad, Scheveningen, ZH	Scheveningen	ZH	\N	\N
1387	09-10-2013	2013-10-09 00:00:00	23/36	Kermit de Hond	10-10-2013	2013-10-10 00:00:00	23/38	Buuv	53.0932846	6.68490601	bij beeld Berend Botje - Stationsweg	Tynaarlo	Dr	\N	\N
4132	23-02-2022	2022-02-23 00:00:00	41/223	pdv_moto	23-02-2022	2022-02-23 00:00:00	41/223	Hans89	52.0959435	4.3068099	in struiken koninginnegracht	Den Haag	ZH	\N	\N
1873	30-03-2015	2015-03-30 00:00:00	28/41	BSI	02-04-2015	2015-04-02 00:00:00	28/44	Scoot_020/Scoot_2	52.3368721	4.86424017	aan boom G. Mahlerlaan	Amsterdam	NH	\N	\N
4295	27-02-2023	2023-02-27 00:00:00	41/332	tdemmer	27-02-2023	2023-02-27 00:00:00	41/333	Hans89	51.9729347	4.55199099	onder boomstronk bij Nesseweg	Zevenhuizen	ZH	\N	\N
1167	13-04-2013	2013-04-13 00:00:00	20/28	Roeleey	13-04-2013	2013-04-13 00:00:00	20/28	Scoot_020/Scoot_2	52.292408	4.94577312	bij paal foodstrip - Tafelbergweg	Amsterdam	NH	\N	\N
1705	30-07-2014	2014-07-30 00:00:00	26/84	frankivo	08-08-2014	2014-08-08 00:00:00	26/87	BSI	53.007019	7.21747303	aan bochtenbord N365 grens	Bourtange	Gr	\N	\N
546	18-09-2011	2011-09-18 00:00:00	12/16	Buuv	18-09-2011	2011-09-18 00:00:00	12/17	V-Strommert	53.1285934	6.59140205	in struik P-plek vliegveld Eelde, Eelde, Gr	Eelde	Gr	\N	\N
1572	30-03-2014	2014-03-30 00:00:00	25/47	MLB	30-03-2014	2014-03-30 00:00:00	25/47	SadBunny	52.0602417	4.2112422	achter E-huis - M. Vrijenhoeklaan	Den Haag	ZH	\N	\N
3735	06-11-2020	2020-11-06 00:00:00	40/873	HighKing	06-11-2020	2020-11-06 00:00:00	40/873	k0en	52.5094452	4.6720829	tegen boom bij smiling globe	Heemskerk	NH	\N	\N
4355	11-06-2023	2023-06-11 00:00:00	41/373	BSI	12-06-2023	2023-06-12 00:00:00	41/373	Springbok	51.8197937	5.61473417	tegen hekpaal Maasdijk Stella Polaris	Ravenstein	NB	\N	\N
1356	17-09-2013	2013-09-17 00:00:00	22/81	XJ Elff	17-09-2013	2013-09-17 00:00:00	22/81	Phaedrus	51.8411179	4.49203396	aan bord P-terrein Koedood	Barendrecht	ZH	\N	\N
4249	05-10-2022	2022-10-05 00:00:00	41/301	ootje	05-10-2022	2022-10-05 00:00:00	41/301	Outdoor Man	52.5283661	4.73297691	in afdak infopaneel de Hoop	Uitgeest	NH	\N	\N
3263	09-10-2019	2019-10-09 00:00:00	40/476	Hans89	10-10-2019	2019-10-10 00:00:00	40/476	jaap43	51.8979645	4.53006697	tegen hek eiland van Brienenoord	Rotterdam	ZH	\N	\N
3065	04-04-2019	2019-04-04 00:00:00	40/261	Coenster	04-04-2019	2019-04-04 00:00:00	40/261	Roeleey	52.366806	4.91042805	aan bovenleiding, Plantage Middenlaan	Amsterdam	NH	\N	\N
1915	15-05-2015	2015-05-15 00:00:00	28/77	Ronald_010	15-05-2015	2015-05-15 00:00:00	28/78	bikedan	51.9197083	4.87602186	aan steun schuifhek. Rotonde	Groot Ammers	ZH	\N	\N
786	22-04-2012	2012-04-22 00:00:00	15/40	Buikschuiver oet Dre	23-04-2012	2012-04-23 00:00:00	15/40	BSI	52.9539986	6.34124088	achter aanbouw Boerestreek 7, Appelsga, Fr	Appelsga	Fr	\N	\N
748	23-03-2012	2012-03-23 00:00:00	15/01	Ronald_010	24-03-2012	2012-03-24 00:00:00	15/02	Dirk130	51.9548187	4.16879416	aan vangrail Maeslantkering, Hoek van Holland, ZH	Hoek van Holland	ZH	\N	\N
297	31-03-2011	2011-03-31 00:00:00	8/45	BSI	01-04-2011	2011-04-01 00:00:00	8/48	Hasseman	52.2433319	5.62416697	zwaartepunt Nederland - Peppelerweg, Putten, Ge	Putten	Ge	\N	\N
934	23-09-2012	2012-09-23 00:00:00	17/11	Hasseman	24-09-2012	2012-09-24 00:00:00	17/07	scheurschuimpje	52.2976952	6.83733177	in koker op kruiwagen - Stenendijk	Hasselt	Ov	\N	\N
1773	18-10-2014	2014-10-18 00:00:00	27/51	Bigtwim	18-10-2014	2014-10-18 00:00:00	27/51	vuurbloed	52.4664841	4.5986619	bij bolder Zeesluisen	IJmuiden	NH	\N	\N
4387	14-08-2023	2023-08-14 00:00:00	41/393	BSI	15-08-2023	2023-08-15 00:00:00	41/393	k0en	52.2376213	5.72573805	onder strobaal Koesteeg	Garderen	Ge	\N	\N
1074	10-02-2013	2013-02-10 00:00:00	19/01	Sjakie-77	10-02-2013	2013-02-10 00:00:00	19/02	BSI	52.5163193	4.70588779	bij E-kast aan de Kromme Sloot	Uitgeest	NH	\N	\N
1771	13-10-2014	2014-10-13 00:00:00	27/48	Bigtwim	17-10-2014	2014-10-17 00:00:00	27/50	Djoost	52.6296577	4.74206209	aan waterkant - Clarissenstraat	Alkmaar	NH	\N	\N
3538	08-06-2020	2020-06-08 00:00:00	40/698	k0en	09-06-2020	2020-06-09 00:00:00	40/699	pdv_moto	52.088295	5.13047314	tegen boom bij treinmuseum	Utrecht	ut	\N	\N
1642	18-05-2014	2014-05-18 00:00:00	26/12	MotorMieke	19-05-2014	2014-05-19 00:00:00	26/13	Sjantaalfoutje	52.3539772	6.43504906	onder stam Nijverdalsebergweg	Nijverdal	Ov	\N	\N
3880	16-04-2021	2021-04-16 00:00:00	41/045	MeanYellowBoy	16-04-2021	2021-04-16 00:00:00	41/045	Ronny Rabbelaar	52.6025238	6.40490913	onder heg Coevordeweg	Balkbrug	Ov	\N	\N
808	24-05-2012	2012-05-24 00:00:00	15/66	ootje	24-05-2012	2012-05-24 00:00:00	15/67	Sander78	52.5144577	4.77581501	Noordervaartdijk/Taandijk, Krommenie, NH	Krommenie	NH	\N	\N
1754	28-09-2014	2014-09-28 00:00:00	27/35	Scoot_020/Scoot_2	28-09-2014	2014-09-28 00:00:00	27/34	bikedan	51.7340889	5.27487612	op P-terein Treurenburg	s-Hertogenbosch	NB	\N	\N
1204	09-05-2013	2013-05-09 00:00:00	20/76	bikedan	09-05-2013	2013-05-09 00:00:00	20/76	Hans89	51.4027786	4.238276	bij brug Wester-Schelderijnweg	Rilland	Ze	\N	\N
3820	03-03-2021	2021-03-03 00:00:00	40/946	pdv_moto	03-03-2021	2021-03-03 00:00:00	40/946	Picobello BV	52.0872002	4.26893902	in perk Laan van Poot	Den Haag	ZH	\N	\N
4413	11-10-2023	2023-10-11 00:00:00	41/410	HighKing	13-10-2023	2023-10-13 00:00:00	41/410	SwitchUp	52.5186996	4.68310499	tegen boomstammen Adenauererf	Heemskerk	NH	\N	\N
1637	14-05-2014	2014-05-14 00:00:00	26/06	-juliet-	15-05-2014	2014-05-15 00:00:00	26/06	tdemmer	51.9024086	4.38744879	onder bank Nieuwewaterstraat	Schiedam	ZH	\N	\N
1505	08-02-2014	2014-02-08 00:00:00	24/69	Splinnie/bobcat	09-02-2014	2014-02-09 00:00:00	24/70	ootje	52.5642433	4.69133282	op oprit Zuidkerkenlaan	Limmen	NH	\N	\N
3631	19-08-2020	2020-08-19 00:00:00	40/791	Springbok	19-08-2020	2020-08-19 00:00:00	40/792	HighKing	52.4218597	5.23287201	aan poot hekje fietspad Grote Vaartweg	Almere	Fl	\N	\N
2247	22-09-2016	2016-09-22 00:00:00	32/25	pdv_moto	22-09-2016	2016-09-22 00:00:00	32/25	Bensi	52.0071068	6.34988785	in plantenbak - Ruurloseweg	Zelhem	Ge	\N	\N
3327	18-12-2019	2019-12-18 00:00:00	40/530	Hans89	18-12-2019	2019-12-18 00:00:00	40/530	Picobello BV	52.0152931	4.55548191	onder trap vlonder Bleiswijkse Verlaat	Bleiswijk	ZH	\N	\N
1298	07-08-2013	2013-08-07 00:00:00	22/12	tdemmer	07-08-2013	2013-08-07 00:00:00	22/13	k0en	51.9706306	5.15056276	aan hek bij rustgebied - Lekdijk	Hagestein	Ut	\N	\N
4380	29-07-2023	2023-07-29 00:00:00	41/389	Amauta	30-07-2023	2023-07-30 00:00:00	41/389	FastEddy	52.887104	7.10632181	bij Kruiskapel Veenweg Laudermarke	Ter Apel	Gr	\N	\N
4160	09-04-2022	2022-04-09 00:00:00	41/244	Outdoor Man	09-04-2022	2022-04-09 00:00:00	41/244	MIA	52.3240623	5.14472294	tussen stenen bij Zilverstrand	Almere haven	Fl	\N	\N
2327	04-01-2017	2017-01-04 00:00:00	33/35	inSaNo	05-01-2017	2017-01-05 00:00:00	33/35	pdv_moto	52.9140129	5.77892923	aan hek/infobord - Tjukemarwei	St. Nicolaasga	Fr	\N	\N
443	24-06-2011	2011-06-24 00:00:00	10/79	Scoot_020/Scoot_2	25-06-2011	2011-06-25 00:00:00	10/80	ndeeka	52.300518	4.47775221	paal Hollands duin - Langevelderweg, Noordwijk, ZH	Noordwijk	ZH	\N	\N
492	07-08-2011	2011-08-07 00:00:00	11/40	Hasseman	10-08-2011	2011-08-10 00:00:00	11/43	Paul Hewson	52.3233948	6.9556551	tegen theekoepel - Tankenbergweg, de Lutte, Ov	de Lutte	Ov	\N	\N
472	23-07-2011	2011-07-23 00:00:00	11/18	bakfiets1	23-07-2011	2011-07-23 00:00:00	11/19	Scoot_020/Scoot_2	50.9907722	5.86935997	kastjes bij Shell - Leyenbroekseweg, Sittard, Li	Sittard	Li	\N	\N
1907	10-05-2015	2015-05-10 00:00:00	28/73	BSI	10-05-2015	2015-05-10 00:00:00	28/73	crazy987	51.7705917	5.8898859	achter boomstam - de Mookerheide	Molenhoek	Li	\N	\N
2691	04-04-2018	2018-04-04 00:00:00	38/10	BSI	05-04-2018	2018-04-05 00:00:00	38/11	MeanYellowBoy	52.1977768	5.5782218	aan boom Woudweg	Nijkerk	Ge	\N	\N
1315	19-08-2013	2013-08-19 00:00:00	22/27	Kiki92	19-08-2013	2013-08-19 00:00:00	22/27	me-daph	52.1903648	6.36872196	achter bank Oosterenkweg	Laren	Ov	\N	\N
2043	20-12-2015	2015-12-20 00:00:00	30/07	Dirk130	23-12-2015	2015-12-23 00:00:00	30/08	Ronald_010	52.0506477	4.54518604	aan hek bij Javalaan	Zoetermeer	ZH	\N	\N
3904	14-05-2021	2021-05-14 00:00:00	41/069	Hans89	15-05-2021	2021-05-15 00:00:00	41/069	ey-dzeej	51.9246483	4.50535679	in rietoever plantsoen R. Boeldestraat	Rotterdam	ZH	\N	\N
3215	19-08-2019	2019-08-19 00:00:00	40/430	Ronny Rabbelaar	19-08-2019	2019-08-19 00:00:00	40/431	frankivo	53.3581314	6.56697512	tegen paaltje, onder de Damsterweg	Warffum	Gr	\N	\N
2376	08-04-2017	2017-04-08 00:00:00	33/102	scheurschuimpje	08-04-2017	2017-04-08 00:00:00	33/102	Janhertog	52.8129196	6.02795792	aan hek Raasloregel	Basse	Ov	\N	\N
4108	02-02-2022	2022-02-02 00:00:00	41/208	ootje	02-02-2022	2022-02-02 00:00:00	41/209	BigJim	52.6769104	4.77608299	tegen hek natuurbegraafplaats	Koedijk	NH	\N	\N
1952	01-07-2015	2015-07-01 00:00:00	29/13	Amauta	01-07-2015	2015-07-01 00:00:00	29/14	frankivo	53.0557976	6.44573021	bij boom bij hunnebed D2	Westervelde	Dr	\N	\N
353	29-04-2011	2011-04-29 00:00:00	9/39	black mule	30-04-2011	2011-04-30 00:00:00	9/42	honda_power	52.7043076	4.68494177	hoogste duin - Oorsprongweg, Schoorl, NH	Schoorl	NH	\N	\N
3167	11-07-2019	2019-07-11 00:00:00	40/382	WillyvD	11-07-2019	2019-07-11 00:00:00	40/383	Sjefman	51.6412277	4.47339392	aan hek bij sloot Kastanjelaan	Fijnaart	NB	\N	\N
1189	30-04-2013	2013-04-30 00:00:00	20/58	Ronald_010	02-05-2013	2013-05-02 00:00:00	20/59	tdemmer	51.6853027	5.89145279	bij praatpaal ANWB Totaaltankstation	Haps	NB	\N	\N
200	17-01-2011	2011-01-17 00:00:00	6/21	Hasseman	18-01-2011	2011-01-18 00:00:00	6/25	Gewoon Denis	52.29562	6.68444014	Blokstegenweg 2, Ambt Delden, Ov	Ambt Delden	Ov	\N	\N
3703	16-10-2020	2020-10-16 00:00:00	40/848	SadBunny	17-10-2020	2020-10-17 00:00:00	40/849	pdv_moto	52.2429771	4.97143316	tegen kast/hek GSM-mast	Vinkeveen	Ut	\N	\N
2854	11-08-2018	2018-08-11 00:00:00	40/07	bikedan	12-08-2018	2018-08-12 00:00:00	40/08	BSI	51.3947105	4.29070282	tegen regelhuis GSM-mast Oudedijk	Ossendrecht	NB	\N	\N
12	24-08-2010	2010-08-24 00:00:00	1/31	Primo!	24-08-2010	2010-08-24 00:00:00	1/35	I-accelerate	52.9678345	6.53526688	TT-Circuit, Assen, Dr	Assen	Dr	\N	\N
940	04-10-2012	2012-10-04 00:00:00	17/19	scheurschuimpje	06-10-2012	2012-10-06 00:00:00	17/21	Meifesto	51.5768738	4.92624378	in bloembak 't Vermaeck - Rijksweg	Rijen	NB	\N	\N
1536	02-03-2014	2014-03-02 00:00:00	25/08	Ronald_010	02-03-2014	2014-03-02 00:00:00	25/08	tdemmer	51.9878349	4.13111496	aan hek Kaapweg	Hoek van Holland	ZH	\N	\N
518	28-08-2011	2011-08-28 00:00:00	11/76	Ronald_010	29-08-2011	2011-08-29 00:00:00	11/77	Sjakie-77	51.9090691	4.3758378	aan boom bij hek - K. Doormanweg, Schiedam, ZH	Schiedam	ZH	\N	\N
1558	15-03-2014	2014-03-15 00:00:00	25/26	SparkViv	15-03-2014	2014-03-15 00:00:00	25/26	ndeeka	51.9807892	4.04809189	aan bord in bocht Maasvlakteweg	Rotterdam	ZH	\N	\N
442	23-06-2011	2011-06-23 00:00:00	10/78	Outdoor Man	24-06-2011	2011-06-24 00:00:00	10/79	Scoot_020/Scoot_2	52.3241539	4.89243698	bij Riekermolen - de Borcht, Amsterdam, NH	Amsterdam	NH	\N	\N
838	24-06-2012	2012-06-24 00:00:00	16/09	ootje	25-06-2012	2012-06-25 00:00:00	16/09	Maegrim	51.781311	5.11414099	struik bij veerpont Aalst - Veen, Aalst, Ge	Aalst	Ge	\N	\N
2390	18-04-2017	2017-04-18 00:00:00	34/16	PatrickSoler	19-04-2017	2017-04-19 00:00:00	34/17	Roeleey	52.1961517	4.53452492	aan paal - Zijldijk	Warmond	ZH	\N	\N
2310	13-12-2016	2016-12-13 00:00:00	33/18	Wimis on	13-12-2016	2016-12-13 00:00:00	33/18	pdv_moto	52.0175514	5.19881392	aan hek Oostrumsdijkje	Houten	Ut	\N	\N
73	29-09-2010	2010-09-29 00:00:00	3/29	BigJim	30-09-2010	2010-09-30 00:00:00	3/29	stampertje-35	52.4783707	4.61099577	Noordersluisweg, Velsen-Zuid, NH	Velsen	NH	\N	\N
2891	05-09-2018	2018-09-05 00:00:00	40/44	frankivo	05-09-2018	2018-09-05 00:00:00	40/44	FastEddy	52.8964119	6.74438715	in bord kruising Ellertsweg	Ellertshaar	Dr	\N	\N
255	04-03-2011	2011-03-04 00:00:00	7/68	Hasseman/Eady	05-03-2011	2011-03-05 00:00:00	7/70	Bensi	52.3876801	6.79712009	Oude boom - Fleringer Esch, Lansinksweg, Ov	Lansinksweg	Ov	\N	\N
434	16-06-2011	2011-06-16 00:00:00	10/65	Nis & Nas	17-06-2011	2011-06-17 00:00:00	10/66	Hasseman	52.3535423	6.43430805	in boom - ANWB-tafel, Nijverdalsebergweg, Ov	Nijverdalsebergweg	Ov	\N	\N
2204	14-08-2016	2016-08-14 00:00:00	31/78	-Floris-	21-08-2016	2016-08-21 00:00:00	31/81	pdv_moto	51.3340263	3.82518697	aan boom fietspad Kennedylaan	Terneuzen	Ze	\N	\N
1985	11-08-2015	2015-08-11 00:00:00	29/38	Vertaix	11-08-2015	2015-08-11 00:00:00	29/38	Rik60NL	52.2877769	4.90930986	aan vangrail Polderweg	Ouderkerk a/d amstel	NH	\N	\N
836	22-06-2012	2012-06-22 00:00:00	16/07	Sander78	23-06-2012	2012-06-23 00:00:00	16/07	dks_aa	52.5459671	4.65515804	achter paddestoel - Onderlangs, Castricum, NH	Castricum	NH	\N	\N
1082		0001-01-01 00:00:00 BC				0001-01-01 00:00:00 BC		Miss2	\N	\N				\N	\N
3142	12-06-2019	2019-06-12 00:00:00	40/354	jaap43	13-06-2019	2019-06-13 00:00:00	40/354	Coenster	52.0982857	4.50109816	aan paaltje p-plaats Geerweg	Zoeterwoude	ZH	\N	\N
3047	19-03-2019	2019-03-19 00:00:00	40/248	Coenster	20-03-2019	2019-03-20 00:00:00	40/249	pdv_moto	52.275795	4.53677893	P-terrein bij spookstation Lisse	Halfweg	ZH	\N	\N
2818	15-07-2018	2018-07-15 00:00:00	39/63	Bomba	15-07-2018	2018-07-15 00:00:00	39/63	jaap43	52.064621	4.82014799	onder loopbrug gemaaltje	Nieuwerbrug	ZH	\N	\N
3324	14-12-2019	2019-12-14 00:00:00	40/527	Hans89	14-12-2019	2019-12-14 00:00:00	40/527	Sjefman	51.5281029	4.30060816	onder kanon fort de Roovere	Halsteren	NB	\N	\N
3437	30-03-2020	2020-03-30 00:00:00	40/616	Outdoor Man	01-04-2020	2020-04-01 00:00:00	40/617	Hans89	50.9458122	5.86441898	in holle boom bij wegkruis Slakweg	Schinnen	Li	\N	\N
4363	23-06-2023	2023-06-23 00:00:00	41/377	Ronny Rabbelaar	25-06-2023	2023-06-25 00:00:00	41/378	FastEddy	53.2212181	6.98390388	aan brug over Nieuwe Vaart/Oude Geut	Nieuwo;da	Gr	\N	\N
2928	14-10-2018	2018-10-14 00:00:00	40/88	Raviel	15-10-2018	2018-10-15 00:00:00	40/89	Bensi	52.0033646	6.60047293	in coniferenhaag 't Olde processiepad	Aerdt	Ge	\N	\N
2587	10-11-2017	2017-11-10 00:00:00	36/58	HighKing	11-11-2017	2017-11-11 00:00:00	36/59	Kurros	52.6630135	4.82659721	aan trap vijver - Middenwaard	Heerhugowaard	NH	\N	\N
2718	20-04-2018	2018-04-20 00:00:00	38/44	MeanYellowBoy	20-04-2018	2018-04-20 00:00:00	38/44	HermanK	52.5994377	6.39744711	aan stuur motorfiets bij huis	Balkbrug	Ov	\N	\N
3480	29-04-2020	2020-04-29 00:00:00	40/651	FastEddy	29-04-2020	2020-04-29 00:00:00	40/651	frankivo	53.0060806	6.94912577	in bosje bij Knoalster Achterhuus	Stadskanaal	Gr	\N	\N
1779	25-10-2014	2014-10-25 00:00:00	27/57	Bomba	26-10-2014	2014-10-26 00:00:00	27/58	Ronald_010	51.9619217	5.98063993	aan hek Hamersestraat	Westervoort	Ge	\N	\N
1392	16-10-2013	2013-10-16 00:00:00	23/46	Gee123	18-10-2013	2013-10-18 00:00:00	23/46	Buuv	52.6786575	6.7757349	aan paaltje ingang Plopsaland	Coevorden	Dr	\N	\N
3854	31-03-2021	2021-03-31 00:00:00	41/025	Coenster	31-03-2021	2021-03-31 00:00:00	41/025	Outdoor Man	52.2268791	4.57221603	tegen hekpaaltje Hoofdweg Westzijde	Abbenes	NH	\N	\N
4339	15-05-2023	2023-05-15 00:00:00	41/362	BSI	16-05-2023	2023-05-16 00:00:00	41/363	scheurschuimpje	52.8368835	5.71292019	aan hek Noordermeerdijk	Rutten	Fl	\N	\N
678	30-12-2011	2011-12-30 00:00:00	14/01	king-roy	30-12-2011	2011-12-30 00:00:00	14/02	BSI	51.5652657	5.84865904	bij brug Vrede(peel)weg, Westerbeek, NB	Westerbeek	NB	\N	\N
2923	07-10-2018	2018-10-07 00:00:00	40/82	Amauta	08-10-2018	2018-10-08 00:00:00	40/82	Raviel	51.8083038	5.72819281	in haag Kasteelleen, kasteel Wijchen	Wijchen	Ge	\N	\N
1644	19-05-2014	2014-05-19 00:00:00	26/13	MTFDarkEagle	19-05-2014	2014-05-19 00:00:00	26/14	Hasseman	52.2706566	6.71356487	in heg Twickelerlaan	Ambt Delden	Ov	\N	\N
3925	07-06-2021	2021-06-07 00:00:00	41/087	FastEddy	07-06-2021	2021-06-07 00:00:00	41/087	Ronny Rabbelaar	53.1063309	6.70413113	tegen paaltje bij hoogholtje de Groeve	Zuidlaren	Dr	\N	\N
4336	09-05-2023	2023-05-09 00:00:00	41/360	SwitchUp	12-05-2023	2023-05-12 00:00:00	41/361	Roeleey	52.4116173	4.88138103	tegen muur Bicker Outfit, Netwerkweg 	Amsterdam	NH	\N	\N
2721	20-04-2018	2018-04-20 00:00:00	38/46	FastEddy	21-04-2018	2018-04-21 00:00:00	38/47	Amauta	52.9704971	6.964643	in struik Achterom	Stadskanaal	Gr	\N	\N
1427	21-11-2013	2013-11-21 00:00:00	23/83	Bomba	22-11-2013	2013-11-22 00:00:00	23/84	Dirk130	52.0389404	4.64570093	aan reclamebord - Limaweg	Waddinxveen	ZH	\N	\N
2777	12-06-2018	2018-06-12 00:00:00	39/17	Coenster	13-06-2018	2018-06-13 00:00:00	39/17	Outdoor Man	52.2688408	4.64314222	in struik bij Bruggeman motoren	Nieuw Vennep	NH	\N	\N
3435	28-03-2020	2020-03-28 00:00:00	40/613	BSI	28-03-2020	2020-03-28 00:00:00	40/613	pdv_moto	52.1657181	5.23890686	tegen boom Soestdijkerweg	Den Dolder	Ut	\N	\N
844	30-06-2012	2012-06-30 00:00:00	16/18	Smuiger	01-07-2012	2012-07-01 00:00:00	16/19	Maegrim	52.3376465	5.01897478	aan hek Elektriciteitscentrale, Diemen, NH	Diemen	NH	\N	\N
3534	06-06-2020	2020-06-06 00:00:00	40/695	Outdoor Man	07-06-2020	2020-06-07 00:00:00	40/696	HighKing	52.6647682	4.69057894	tegen voet schuine linde bij het Hof	Bergen	NH	\N	\N
583	14-10-2011	2011-10-14 00:00:00	12/74	Dennisik	14-10-2011	2011-10-14 00:00:00	12/75	Ronald_010	51.9982948	4.55006504	onder steiger Rottedijk, Bleiswijk, ZH	Bleiswijk	ZH	\N	\N
1607	26-04-2014	2014-04-26 00:00:00	25/81	Scoot_020/Scoot_2	26-04-2014	2014-04-26 00:00:00	25/82	Rainbow600	52.0269585	5.06701899	aan glazen wand weg n/d Poort	Nieuwegein	Ut	\N	\N
4173	26-04-2022	2022-04-26 00:00:00	41/252	FastEddy	28-04-2022	2022-04-28 00:00:00	41/252	Amauta	53.0958138	7.14233017	achter stal hertenkamp, Hertenkamp	Vrieseloo	Gr	\N	\N
40	08-09-2010	2010-09-08 00:00:00	2/55	vuurbloed	09-09-2010	2010-09-09 00:00:00	2/57	Smuiger	52.3903809	4.542377	Mickey's cafe - Circuitpark, Zandvoort, NH	Zandvoort	NH	\N	\N
2088	30-03-2016	2016-03-30 00:00:00	30/52	ArendJan	31-03-2016	2016-03-31 00:00:00	30/54	tdemmer	52.0092163	4.73136616	onder dak balkenhuisje waaiersluis	Gouda	ZH	\N	\N
3905	15-05-2021	2021-05-15 00:00:00	41/070	ey-dzeej	16-05-2021	2021-05-16 00:00:00	41/071	pdv_moto	51.982666	4.56675005	onder steiger kijkpunt Zevenhuizerplas	Rotterdam	ZH	\N	\N
1937	16-06-2015	2015-06-16 00:00:00	28/100	nixor	16-06-2015	2015-06-16 00:00:00	28/100	Fenrir-sol	51.4781494	4.47310114	bij paaltje grens Essen/Nispen	Nispen	NB	\N	\N
610	02-11-2011	2011-11-02 00:00:00	13/19	Hans89	03-11-2011	2011-11-03 00:00:00	13/21	V-Strommert	50.7547226	6.0205822	aan paaltje bij bank Drielandenpunt, Vaals, Li	Vaals	Li	\N	\N
563	03-10-2011	2011-10-03 00:00:00	12/46	rvdh86	04-10-2011	2011-10-04 00:00:00	12/49	BSI	52.2485619	5.70767403	achter bankje bij bushalte Houtdorp, Speulde, Ge	Speulde	Ge	\N	\N
3472	23-04-2020	2020-04-23 00:00:00	40/645	Coenster	23-04-2020	2020-04-23 00:00:00	40/645	Outdoor Man	52.3861275	4.74490786	in heg Oude Haarlemmerstraatweg	Halfweg	NH	\N	\N
4006	15-08-2021	2021-08-15 00:00:00	41/141	FastEddy	17-08-2021	2021-08-17 00:00:00	41/142	Ronny Rabbelaar	52.9800568	6.98373985	aan hoek zonnecelpark, Leerlooier	Stadskanaal	Gr	\N	\N
4303	12-03-2023	2023-03-12 00:00:00	41/337	pdv_moto	16-03-2023	2023-03-16 00:00:00	41/338	jaap43	51.6773872	4.14607	tegen E-kast bij windmolen Philipsdam	Bruinisse	Ze	\N	\N
2319	24-12-2016	2016-12-24 00:00:00	33/25	Ronald_010	24-12-2016	2016-12-24 00:00:00	33/25	inSaNo	52.3139954	5.33394623	aan hek Stichtsebrug	Almere	Fl	\N	\N
2100	17-04-2016	2016-04-17 00:00:00	30/69	Amauta	28-04-2016	2016-04-28 00:00:00	60/73	Roeleey	53.2815742	6.2154932	in boom bij grondstation	Burum	Gr	\N	\N
1414	10-11-2013	2013-11-10 00:00:00	23/69	jaap43	10-11-2013	2013-11-10 00:00:00	23/69	V-Strommert	52.0488739	4.56301403	aan hek bij stomp de Oorsprong	Moerkapelle	ZH	\N	\N
1329	28-08-2013	2013-08-28 00:00:00	22/47	Buuv	29-08-2013	2013-08-29 00:00:00	22/49	Bludge	52.97015	6.62585306	aan struik graspad - Klaassteenweg	Eldersloo	Dr	\N	\N
150	23-11-2010	2010-11-23 00:00:00	5/9	scheurschuimpje	26-11-2010	2010-11-26 00:00:00		MIA	52.8805084	6.1342659	eiland Spoekeplas - Spokedam, Noordwolde, Fr	Noordwolde	Fr	\N	\N
3012	09-02-2019	2019-02-09 00:00:00	40/203	Marsian	10-02-2019	2019-02-10 00:00:00	40/205	BSI	52.2526817	5.43859577	onder steiger gemaak Arkemheen	Nijkerk	Ut	\N	\N
238	16-02-2011	2011-02-16 00:00:00	7/22	Komkommer	17-02-2011	2011-02-17 00:00:00	7/24	jaap43	52.1741638	5.8251791	paaltje Radioweg, Radio Kootwijk, Ge	Radio Kootwijk	Ge	\N	\N
4253	11-10-2022	2022-10-11 00:00:00	41/303	Outdoor Man	11-10-2022	2022-10-11 00:00:00	41/303	ootje	52.3122673	4.88489008	onder rooster gemaaltje Bankrasweg	Amstelveen	NH	\N	\N
1791	10-11-2014	2014-11-10 00:00:00	27/68	Bomba	11-11-2014	2014-11-11 00:00:00	27/68	Sjakie-77	51.9189796	4.53008604	v/d. Mandelelaan - Boszoom	Rotterdam	ZH	\N	\N
487	03-08-2011	2011-08-03 00:00:00	11/34	rvdh86	03-08-2011	2011-08-03 00:00:00	11/34	Wolvin	52.3684921	5.56349182	struik bij uitzichtpunt - Knardijk, Zeewolde, Fl	Zeewolde	Fl	\N	\N
3390	22-02-2020	2020-02-22 00:00:00	40/574	Marsian	23-02-2020	2020-02-23 00:00:00	40/575	Ronald_010	52.3202934	5.54831696	aan boom Strandweg	Zeewolde	Fl	\N	\N
2835	27-07-2018	2018-07-27 00:00:00	39/85	vuurbloed	28-07-2018	2018-07-28 00:00:00	39/85	Amauta	52.4049606	4.54727793	aan stuur motorfiets Parnassiaweg	Bloemendaal	NH	\N	\N
2689	03-04-2018	2018-04-03 00:00:00	38/08	Coenster	03-04-2018	2018-04-03 00:00:00	38/08	BornToReign	51.9640274	5.98776579	tegen hek fietspad Dijkgraaf	Duiven	Ge	\N	\N
880	03-08-2012	2012-08-03 00:00:00	16/60	Komkommer	03-08-2012	2012-08-03 00:00:00	16/62	rvdh86	51.9762268	5.55055714	achter prullebak P-terrein - Autoweg	Rhenen	Ut	\N	\N
3141	11-06-2019	2019-06-11 00:00:00	40/353	Deeffox	12-06-2019	2019-06-12 00:00:00	40/354	jaap43	51.8227959	4.83720589	tegen hek GSM-mast Tiendweg	Hardinxveld-Giessendam	ZH	\N	\N
2884	27-08-2018	2018-08-27 00:00:00	40/36	FastEddy	31-08-2018	2018-08-31 00:00:00	40/39	frankivo	53.3429031	6.78611803	in struik Schansweg	Eenum	Gr	\N	\N
4240	11-09-2022	2022-09-11 00:00:00	41/296	Amauta	13-09-2022	2022-09-13 00:00:00	41/297	Pydejong	53.2891731	6.36560297	tussen hek en E-kast Tilstok	Niehove	Gr	\N	\N
1859	12-03-2015	2015-03-12 00:00:00	28/27	Sjantaalfoutje	14-03-2015	2015-03-14 00:00:00	28/28	k0en	52.1821442	5.94684076	in struik Gelre ziekenhuizen	Apeldoorn	Ge	\N	\N
1055	25-01-2013	2013-01-25 00:00:00	18/73	Sjakie-77	26-01-2013	2013-01-26 00:00:00	18/74	ootje	52.5141106	4.69820213	aan vangrail bij infobord - Kerkweg	Uitgeest	NH	\N	\N
97	17-10-2010	2010-10-17 00:00:00	3/74	mastertommy	18-10-2010	2010-10-18 00:00:00	3/77	BigJim	52.3172989	4.90948296	Loevesteinserandweg, Schiphol, NH	Schiphol	NH	\N	\N
1409	05-11-2013	2013-11-05 00:00:00	23/64	Scoot_020/Scoot_2	05-11-2013	2013-11-05 00:00:00	23/64	V-Strommert	52.3375092	4.77815104	aan hek viaduct Sloterweg	Amsterdam	NH	\N	\N
1049	09-01-2013	2013-01-09 00:00:00	18/58	inSaNo	10-01-2013	2013-01-10 00:00:00	18/60	scheurschuimpje	52.4477081	5.4337368	aan steiger Lage Knarsluis	Lelystad	Fl	\N	\N
3392	25-02-2020	2020-02-25 00:00:00	40/576	pdv_moto	26-02-2020	2020-02-26 00:00:00	40/576	Sjefman	52.1161957	4.28787708	in stapel stenen Alkmaarsestraat 	Scheveningen	ZH	\N	\N
3318	10-12-2019	2019-12-10 00:00:00	40/523	pdv_moto	11-12-2019	2019-12-11 00:00:00	40/524	ey-dzeej	52.0935936	4.28416586	in pol gras Churchillplein	Den Haag	ZH	\N	\N
1975	29-07-2015	2015-07-29 00:00:00	29/30	jaap43	29-07-2015	2015-07-29 00:00:00	29/30	NZo	51.9672089	4.45952082	bij boom aan de Landscheiding	Rotterdam	ZH	\N	\N
3964	02-07-2021	2021-07-02 00:00:00	41/113	FastEddy	02-07-2021	2021-07-02 00:00:00	41/113	pdv_moto	52.2434692	5.63433599	aan boom bij Zwaartepunt Nederland	Putten	Ge	\N	\N
4394	28-08-2023	2023-08-28 00:00:00	41/396	FastEddy	31-08-2023	2023-08-31 00:00:00	41/397	Amauta	52.6943092	6.47448111	aan hek steiger in Waterlossing	Alteveer	Dr	\N	\N
739	16-03-2012	2012-03-16 00:00:00	14/90	BSI	16-03-2012	2012-03-16 00:00:00	14/91	Scoot_020/Scoot_2	52.3368645	4.86500406	aan hek Gustav Mahlerlaan, Amsterdam, NH	Amsterdam	NH	\N	\N
3646	30-08-2020	2020-08-30 00:00:00	40/806	Amauta	30-08-2020	2020-08-30 00:00:00	40/806	FastEddy	53.1974182	6.52257299	bij stadsmarkering SO3, Bornster Tol	Groningen	Gr	\N	\N
1486	20-01-2014	2014-01-20 00:00:00	24/47	tdemmer	21-01-2014	2014-01-21 00:00:00	24/48	Ronald_010	51.7186012	4.99091196	in boom Zuiderbroeksedijk	Meeuwen	NB	\N	\N
3907	18-05-2021	2021-05-18 00:00:00	41/072	Sjefman	20-05-2021	2021-05-20 00:00:00	41/073	FastEddy	51.329277	3.82594299	aan paal Stationsweg	Terneuzen	Ze	\N	\N
4035	24-09-2021	2021-09-24 00:00:00	41/158	Brnk	25-09-2021	2021-09-25 00:00:00	41/158	FastEddy	52.3166046	6.69452906	in boom Mariakapel Tusveld	Bornerbroek	Ov	\N	\N
1314	18-08-2013	2013-08-18 00:00:00	22/25	BSI	18-08-2013	2013-08-18 00:00:00	22/26	Kiki92	52.0246048	5.81254816	bij tunnel van Nieuwenhuijzenweg	Wolfheze	Ge	\N	\N
2757	19-05-2018	2018-05-19 00:00:00	38/88	Roeleey	20-05-2018	2018-05-20 00:00:00	38/88	Amauta	53.1796494	7.2046771	in loop van kanon	Bad Nieuweschans	Gr	\N	\N
2599	03-12-2017	2017-12-03 00:00:00	36/75	Ronald_010	09-12-2017	2017-12-09 00:00:00	36/77	Okami_Xci	51.3514977	6.14842081	aan bilboard - Venloseweg	Tegelen	Li	\N	\N
2921	01-10-2018	2018-10-01 00:00:00	40/78	Amauta	05-10-2018	2018-10-05 00:00:00	40/81	leeqnl	53.1641006	6.66680908	aan poot radiobaken , Zuiderhooidijk	Onnen	Gr	\N	\N
2824	18-07-2018	2018-07-18 00:00:00	39/69	Outdoor Man	19-07-2018	2018-07-19 00:00:00	39/71	Coenster	52.2609291	4.96670389	tegen hek Winkeldijk	Abcoude	NH	\N	\N
341	22-04-2011	2011-04-22 00:00:00	9/20	Richard117	22-04-2011	2011-04-22 00:00:00	9/22	scheurschuimpje	53.0909576	5.82492113	hek Burstumerdyk, Grouw, Fr	Grouw	Fr	\N	\N
3870	11-04-2021	2021-04-11 00:00:00	41/037	Outdoor Man	11-04-2021	2021-04-11 00:00:00	41/037	HighKing	52.6729622	4.70417213	in heg bij Russenmonument Russenweg	Bergen	NH	\N	\N
3350	14-01-2020	2020-01-14 00:00:00	40/546	ey-dzeej	14-01-2020	2020-01-14 00:00:00	40/546	Hans89	51.941555	4.48967314	in heg bij verzetskruis Boezemlaan	Rotterdam	ZH	\N	\N
196	16-01-2011	2011-01-16 00:00:00	6/14	Straycat	16-01-2011	2011-01-16 00:00:00	6/14	dolfijneflipper	52.33675	5.06728601	hek bij Westbatterij - Westzeedijk, Muiden, NH	Muiden	NH	\N	\N
3269	13-10-2019	2019-10-13 00:00:00	40/479	Amauta	15-10-2019	2019-10-15 00:00:00	40/480	Outdoor Man	53.1212883	6.30534315	tegen boom Jonkertjespad, 	Zevenhuizen	Gr	\N	\N
2003	29-08-2015	2015-08-29 00:00:00	29/55	Amauta	30-08-2015	2015-08-30 00:00:00	29/55	pdv_moto	53.0677452	7.07213402	onder brug slotgracht Wedderburcht	Wedde	Gr	\N	\N
3670	18-09-2020	2020-09-18 00:00:00	40/822	Amauta	19-09-2020	2020-09-19 00:00:00	40/823	Ronny Rabbelaar	53.4543076	6.8473959	aan schakelhuisje Generator	Eemshaven	Gr	\N	\N
3152	22-06-2019	2019-06-22 00:00:00	40/365	jaap43	22-06-2019	2019-06-22 00:00:00	40/365	pdv_moto	51.7025375	4.63414001	aan reling brug Goederenspoorweg	Moerdijk	NB	\N	\N
4283	20-01-2023	2023-01-20 00:00:00	41/325	Ronny Rabbelaar	20-01-2023	2023-01-20 00:00:00	41/325	FastEddy	53.0359192	6.65710878	aan paal wandelgebied de Gagels	Gasteren	Dr	\N	\N
2938	28-10-2018	2018-10-28 00:00:00	40/96	Amauta	02-11-2018	2018-11-02 00:00:00	40/98	FastEddy	52.4239807	6.89312696	tegen struik Wittenbergerweg	Nutter	Ov	\N	\N
1091	24-02-2013	2013-02-24 00:00:00	19/22	Roeleey	25-02-2013	2013-02-25 00:00:00	19/23	SadBunny	52.325428	4.93054295	bij Motoport - Spaklerweg	Amsterdam	NH	\N	\N
3070	07-04-2019	2019-04-07 00:00:00	40/265	Roeleey	07-04-2019	2019-04-07 00:00:00	40/266	BSI	52.0925331	5.36047316	aan voet waarschuwingsbord	Woudenberg	Ut	\N	\N
3926	08-06-2021	2021-06-08 00:00:00	41/087	Ronny Rabbelaar	08-06-2021	2021-06-08 00:00:00	41/088	FastEddy	53.3115311	6.92750597	aan reling waterkruising Vennendijk	Meedhuizen	Gr	\N	\N
2231	07-09-2016	2016-09-07 00:00:00	32/07	Bigtwim	09-09-2016	2016-09-09 00:00:00	32/08	Djoost	52.4941483	4.5934	aan ABRI Dorpsduinen	Wijk aan Zee	NH	\N	\N
256	05-03-2011	2011-03-05 00:00:00	7/71	Bensi	06-03-2011	2011-03-06 00:00:00	7/72	Wimis on	52.0213661	6.02627993	parkeerplaats Schietbergseweg, Rheden, Ge	Rheden	Ge	\N	\N
1052	15-01-2013	2013-01-15 00:00:00	18/66	Bomba	16-01-2013	2013-01-16 00:00:00	18/67	tdemmer	52.0746078	4.88211489	in knotwilg Kromwijkerdijk	Woerden	Ut	\N	\N
3608	03-08-2020	2020-08-03 00:00:00	40/764	Bensi	03-08-2020	2020-08-03 00:00:00	40/765	Raviel	51.9016762	6.25182915	onder steen wandelpad Bovendorpsstraat	Zeddam	Ge	\N	\N
3805	13-02-2021	2021-02-13 00:00:00	40/934	Outdoor Man	14-02-2021	2021-02-14 00:00:00	40/934	FastEddy	52.7215652	6.8596158	tussen stenen eind Herendijk	Nieuw Amsterdam	Dr	\N	\N
920	12-09-2012	2012-09-12 00:00:00	16/97	BSI	12-09-2012	2012-09-12 00:00:00	16/98	Bigtwim	52.760128	5.11888599	onder kei bij gemaal - Oosterdijk	Medemblik	NH	\N	\N
15	25-08-2010	2010-08-25 00:00:00	1/38	Quark	25-08-2010	2010-08-25 00:00:00	1/40	Melchen	51.4043159	5.4899621	Engelse tuin - Zandweg, Waalre, NB	Waalre	NB	\N	\N
2758	20-05-2018	2018-05-20 00:00:00	38/89	Amauta	21-05-2018	2018-05-21 00:00:00	38/90	BSI	50.8345299	5.67478609	aan brug bij watermolen de Lombok	Maastricht	Li	\N	\N
343	23-04-2011	2011-04-23 00:00:00	9/25	Richard117	23-04-2011	2011-04-23 00:00:00	9/25	Wimis on	51.8278046	4.97988796	hek bij brug Dalempoort, Gorinchem, ZH	Gorinchem	ZH	\N	\N
1066	06-02-2013	2013-02-06 00:00:00	18/93	SadBunny	06-02-2013	2013-02-06 00:00:00	18/93	Corney28	52.3911057	4.87195778	in struik Zaanhof	Amsterdam	NH	\N	\N
1504	08-02-2014	2014-02-08 00:00:00	24/69	Sjakie-77	08-02-2014	2014-02-08 00:00:00	24/69	Splinnie/bobcat	52.5546227	4.71835709	aan paal gasunie langs A9	Akersloot	NH	\N	\N
1394	19-10-2013	2013-10-19 00:00:00	23/48	VreemdeBeet	20-10-2013	2013-10-20 00:00:00	23/49	Ronald_010	52.2671928	6.14905977	aan hek bij watertoren - Ceintuurbaan	Deventer	Ov	\N	\N
3267	12-10-2019	2019-10-12 00:00:00	40/478	Hans89	12-10-2019	2019-10-12 00:00:00	40/478	ey-dzeej	51.9488258	4.51664591	in monument Manna langs A20	Rotterdam	ZH	\N	\N
3294	02-11-2019	2019-11-02 00:00:00	50/500	Picobello BV	02-11-2019	2019-11-02 00:00:00	40/500	ey-dzeej	51.9862862	4.63046408	bij laagste plek Nederland	Nieuwerkerk a/d Ijssel	ZH	\N	\N
2705	12-04-2018	2018-04-12 00:00:00	38/27	aisnoek	13-04-2018	2018-04-13 00:00:00	38/28	MP_NL	52.3888626	6.67178488	aan hek Aadijk	Vriezenveen	Ov	\N	\N
44	11-09-2010	2010-09-11 00:00:00	2/65	Plexat	11-09-2010	2010-09-11 00:00:00	2/65	Grote Voet	52.1977615	5.43577623	Hindelooperkade, Amersfoort, Ut	Amersfoort	Ut	\N	\N
3166	10-07-2019	2019-07-10 00:00:00	40/381	jaap43	10-07-2019	2019-07-10 00:00:00	40/382	WillyvD	51.7578163	4.6237092	aan damwand waterinlaat Kilweg	s-Gravendeel	ZH	\N	\N
1246	19-06-2013	2013-06-19 00:00:00	21/43	Low Profile	20-06-2013	2013-06-20 00:00:00	21/43	BSI	52.2521667	4.87597895	aan boom a/d Waver	Ouderkerk a/d Amstel	NH	\N	\N
480	31-07-2011	2011-07-31 00:00:00	11/29	ndeeka	31-07-2011	2011-07-31 00:00:00	11/29	LauRRR	51.3209572	5.59513903	aan hekvan P-terrein 't Haasje, Maarheze, NB	Maarheeze	NB	\N	\N
837	23-06-2012	2012-06-23 00:00:00	16/08	dks_aa	24-06-2012	2012-06-24 00:00:00	16/09	ootje	52.4597893	5.13083792	aan loopbrug - Dijk om, Marken, NH	Marken	NH	\N	\N
683	06-01-2012	2012-01-06 00:00:00	14/10	tdemmer	09-01-2012	2012-01-09 00:00:00	14/12	Hans89	51.3058891	3.381603	in nis van de Brugse Poort, Sluis, Ze	Sluis	Ze	\N	\N
2853	11-08-2018	2018-08-11 00:00:00	40/07	pdv_moto	11-08-2018	2018-08-11 00:00:00	40/07	bikedan	51.529995	3.44195294	in struik bij molen de Noorman	Westkapelle	Ze	\N	\N
1460	05-01-2014	2014-01-05 00:00:00	24/19	Vins111	05-01-2014	2014-01-05 00:00:00	24/20	Bomba	52.18647	5.07158184	in hoek coniferenheg	Loosdrecht	Ut	\N	\N
2667	21-03-2018	2018-03-21 00:00:00	37/85	Roeleey	22-03-2018	2018-03-22 00:00:00	37/85	Rik60NL	52.3147125	4.99242306	tegen hek Loosdrechtsedreef	Amsterdam	NH	\N	\N
1312	17-08-2013	2013-08-17 00:00:00	22/24	Ronald_010	17-08-2013	2013-08-17 00:00:00	22/24	Scoot_020/Scoot_2	52.2095833	4.81366014	bij oude spoorbrug - de Hoef O-zijde	de Hoef	Ut	\N	\N
4100	16-01-2022	2022-01-16 00:00:00	41/201	Outdoor Man	17-01-2022	2022-01-17 00:00:00	41/202	DKP	51.2166176	5.58294392	onder bord Zuid-Willemsvaart bij grens	Weert	Li	\N	\N
1579	31-03-2014	2014-03-31 00:00:00	25/52	BSI	01-04-2014	2014-04-01 00:00:00	25/54	Vins111	52.2033691	5.63223886	achter bord aardgas - Prinsenweg	Nijkerk	Ge	\N	\N
1497	04-02-2014	2014-02-04 00:00:00	24/60	Sjakie-77	05-02-2014	2014-02-05 00:00:00	24/61	Splinnie	52.5105095	4.70691776	onder brug bij spoor	Uithoorn	NH	\N	\N
2086	28-03-2016	2016-03-28 00:00:00	30/50	Rainbow600	28-03-2016	2016-03-28 00:00:00	30/51	Fuck Het Milieu	51.9041672	4.16415024	bij lantaarnpaal Asylplein	Brielle	ZH	\N	\N
276	20-03-2011	2011-03-20 00:00:00	8/11	jaap43	21-03-2011	2011-03-21 00:00:00	8/12	ndeeka	51.9680099	4.12966681	achter put Noordzeeweg, Rozenburg, ZH	Rozenburg	ZH	\N	\N
1473	13-01-2014	2014-01-13 00:00:00	24/34	Scoot_020/Scoot_2	13-01-2014	2014-01-13 00:00:00	24/35	Roeleey	52.3529625	4.75986719	in struik bij gemaal Lijnden	Lijnden	NH	\N	\N
4362	20-06-2023	2023-06-20 00:00:00	41/377	Pydejong	23-06-2023	2023-06-23 00:00:00	41/377	Ronny Rabbelaar	53.257515	6.14692783	achter steen Dranklinstraat	Buitenpost	Gr	\N	\N
1013	04-12-2012	2012-12-04 00:00:00	18/21	Hasseman	05-12-2012	2012-12-05 00:00:00	18/22	me-daph	52.3032455	6.7145009	aan hek zijweg Kuipersweg	Borne	Ov	\N	\N
4239	05-09-2022	2022-09-05 00:00:00	41/296	BSI	11-09-2022	2022-09-11 00:00:00	41/296	Amauta	52.8688202	6.61766291	aan paal landgoed Timmersholt	Westerbork	Dr	\N	\N
4286	05-02-2023	2023-02-05 00:00:00	41/327	FastEddy	08-02-2023	2023-02-08 00:00:00	41/327	BSI	52.1790695	6.9282732	tegen wilg Zuenboom Aamsveenweg	Enschede	Ov	\N	\N
2328	05-01-2017	2017-01-05 00:00:00	33/36	pdv_moto	13-01-2017	2017-01-13 00:00:00	33/41	Motormuisje_alice	51.6406784	3.71283698	aan paal bij Neeltje Jans	Vrouwenpolder	Ze	\N	\N
2426	16-05-2017	2017-05-16 00:00:00	34/48	Amauta	17-05-2017	2017-05-17 00:00:00	34/49	frankivo	53.2430801	6.49199295	hek bij molen de Jonge Held	Groningen	Gr	\N	\N
1876	08-04-2015	2015-04-08 00:00:00	28/47	Corney28	10-04-2015	2015-04-10 00:00:00	28/48	Djoost	53.0996895	5.38552713	bij busstation Viaduct 3	Zurich	Fr	\N	\N
1008	27-11-2012	2012-11-27 00:00:00	18/15	JurgenT	29-11-2012	2012-11-29 00:00:00	18/16	magnamaniac	52.0251503	6.15943813	aan hek fietspad Grietstraat	Doesburg	Ge	\N	\N
4267	25-11-2022	2022-11-25 00:00:00	41/315	SwitchUp	27-11-2022	2022-11-27 00:00:00	41/315	Outdoor Man	52.3816338	4.90462589	tegen boompje jachthaven Sixhavenweg	Amsterdam	NH	\N	\N
3118	15-05-2019	2019-05-15 00:00:00	40/326	Ronny Rabbelaar	15-05-2019	2019-05-15 00:00:00	40/327	FastEddy	53.2631073	6.79517794	aan paal bij brug	Overschild	Gr	\N	\N
3170	13-07-2019	2019-07-13 00:00:00	40/385	FastEddy	13-07-2019	2019-07-13 00:00:00	40/386	pdv_moto	53.0053635	7.19632721	in struik bij poort Bisschopsweg	Bortange	Gr	\N	\N
315	08-04-2011	2011-04-08 00:00:00	8/80	wesleyc	08-04-2011	2011-04-08 00:00:00	8/82	bakfiets1	51.9548111	4.35053778	in knotwilg - Oostveenseweg, Schipluiden, ZH	Schipluiden	ZH	\N	\N
1332	30-08-2013	2013-08-30 00:00:00	22/53	Bludge	31-08-2013	2013-08-31 00:00:00	22/54	Bensi	51.9785271	5.9776721	onder poten Rijnhert - Meander	Arnhem	Ge	\N	\N
4073	12-12-2021	2021-12-12 00:00:00	41/185	pdv_moto	15-12-2021	2021-12-15 00:00:00	41/186	Roeleey	52.0870934	4.26989079	in struik Tjalie Robinsonpad	Den Haag	ZH	\N	\N
2259	02-10-2016	2016-10-02 00:00:00	32/43	Amauta	03-10-2016	2016-10-03 00:00:00	32/44	frankivo	52.5996475	6.40133619	aan hekje bij molen - de Omloop	Balkbrug	Ov	\N	\N
831	18-06-2012	2012-06-18 00:00:00	15/98	Sjakie-77	18-06-2012	2012-06-18 00:00:00	15/101	Bigtwim	52.4433403	4.65275621	aan hectometerpaal A208, Santpoort-Noord, NH	Santpoort	NH	\N	\N
137	13-11-2010	2010-11-13 00:00:00	4/82	V-Strommert	13-11-2010	2010-11-13 00:00:00	???	niet opgehaald	50.767601	5.71117401	Voerstraat 2, Eijsden, Li	Eijsden	Li	\N	\N
1890	24-04-2015	2015-04-24 00:00:00	28/60	Amauta	25-04-2015	2015-04-25 00:00:00	28/60	Rainbow600	53.2368164	7.20671177	aan kijkhut bij Dollard	Drieborg	Gr	\N	\N
4229	05-08-2022	2022-08-05 00:00:00	41/286	FastEddy	06-08-2022	2022-08-06 00:00:00	41/287	Amauta	52.2756042	6.89892817	achter gebouwtje vliegbasis Twente	Enschede	Ov	\N	\N
794	03-05-2012	2012-05-03 00:00:00	15/48	Dirk130	03-05-2012	2012-05-03 00:00:00	15/49	Ronald_010	52.0836449	4.32525396	in stronk - Bezuidenhoutseweg, Den Haag, ZH	Den Haag	ZH	\N	\N
917	09-09-2012	2012-09-09 00:00:00	16/94	Bigtwim	10-09-2012	2012-09-10 00:00:00	16/95	ootje	52.4790497	4.65390921	bij boom plantsoen Stationsweg	Beverwijk	NH	\N	\N
3957	27-06-2021	2021-06-27 00:00:00	41/108	HermanK	27-06-2021	2021-06-27 00:00:00	41/108	MeanYellowBoy	52.5186768	6.4889369	onder bank Junnerweg	Ommen	Ov	\N	\N
1064	04-02-2013	2013-02-04 00:00:00	18/90	Roeleey	05-02-2013	2013-02-05 00:00:00	18/92	BSI	52.3893509	4.74603224	onder afvalbak - Spaarnwoude/Houtrak	Halfweg	NH	\N	\N
2381	12-04-2017	2017-04-12 00:00:00	34/06	frankivo	13-04-2017	2017-04-13 00:00:00	34/07	Amauta	52.9946632	6.49154377	aan minigemaal Nogervaart	Assen	Dr	\N	\N
1968	22-07-2015	2015-07-22 00:00:00	29/26	bikedan	22-07-2015	2015-07-22 00:00:00	29/26	Roeleey	52.3071289	5.13686323	in heg bij Chrysal - Gooimeer	Naarden	NH	\N	\N
3040	15-03-2019	2019-03-15 00:00:00	40/242	HighKing	15-03-2019	2019-03-15 00:00:00	40/423	Hjerteknuser	52.4886398	4.59204102	tegen "de Poort" bij "Een zee van Staal" 	Wijk aan Zee	NH	\N	\N
4429	22-11-2023	2023-11-22 00:00:00	41/418	Hans89	26-11-2023	2023-11-26 00:00:00	41/419	pdv_moto	51.947834	4.07194424	tegen hek Missouriweg, Maasvlakte	Rotterdam	ZH	\N	\N
1097	28-02-2013	2013-02-28 00:00:00	19/29	SadBunny	28-02-2013	2013-02-28 00:00:00	19/29	Roeleey	52.3416138	4.76426792	aan struik - A'damsebaan	Badhoevedorp	NH	\N	\N
1962	19-07-2015	2015-07-19 00:00:00	29/23	pdv_moto	19-07-2015	2015-07-19 00:00:00	29/23	Amauta	53.4079552	6.15678787	achter huisje Bantswei	Anjum	Fr	\N	\N
4104	26-01-2022	2022-01-26 00:00:00	41/204	DKP	30-01-2022	2022-01-30 00:00:00	41/207	BSI	50.7735443	5.70126677	tegen boom bij P-plaats Slot Eysden	Eijsden	Li	\N	\N
1360	19-09-2013	2013-09-19 00:00:00	22/83	tdemmer	20-09-2013	2013-09-20 00:00:00	22/85	Hans89	51.3147354	3.35927105	aan boom langs N253	Sint Anna ter Muiden	Ze	\N	\N
1634	11-05-2014	2014-05-11 00:00:00	26/02	BSI	11-05-2014	2014-05-11 00:00:00	26/02	Meangreengirl/MeanBlueMan	51.2684402	4.0659008	aan paal infobord Waterstraat	Clinge	Ze	\N	\N
1999	23-08-2015	2015-08-23 00:00:00	29/52	Amauta	24-08-2015	2015-08-24 00:00:00	29/52	leeqnl	53.1978569	6.5140028	aan E-kast transferium	Hoogkerk	Gr	\N	\N
1156	04-04-2013	2013-04-04 00:00:00	20/07	Bludge	05-04-2013	2013-04-05 00:00:00	20/09	Hans89	51.9743423	5.82066822	picknickplaats Westerbouwing	Oosterbeek	Ge	\N	\N
4433	03-12-2023	2023-12-03 00:00:00	41/421	Marsian	12-12-2023	2023-12-12 00:00:00	41/422	pdv_moto	53.0086174	6.55569077	tegen hekje Dierenweide Oranjebond	Assen	Dr	\N	\N
1745	20-09-2014	2014-09-20 00:00:00	27/27	Bigtwim	21-09-2014	2014-09-21 00:00:00	27/28	Djoost	52.4624405	4.64723778	aan paal Noorderdorppad	Velsen	NH	\N	\N
1076	12-02-2013	2013-02-12 00:00:00	19/04	Dirk130	12-02-2013	2013-02-12 00:00:00	19/04	tdemmer	52.09869	4.29082012	onder stam - Scheveningse Bosje	Den Haag	ZH	\N	\N
700	08-02-2012	2012-02-08 00:00:00	14/41	onewheeldrive	09-02-2012	2012-02-09 00:00:00	14/41	Buikschuiver oet Dre	53.0305634	5.66883278	aan tafel bij garage - Oppenhuizenweg, Sneek, Fr	Sneek	Fr	\N	\N
2407	29-04-2017	2017-04-29 00:00:00	34/31	Djoost	29-04-2017	2017-04-29 00:00:00	34/32	Amauta	52.5008125	4.79319191	aan betonnen paal - Noorddijk	Wormerveer	NH	\N	\N
2720	20-04-2018	2018-04-20 00:00:00	38/45	Ronny Rabbelaar	20-04-2018	2018-04-20 00:00:00	38/45	FastEddy	52.9503403	6.74029016	aan hek infocentrum Staatsbosbeheer	Drouwen	Dr	\N	\N
384	22-05-2011	2011-05-22 00:00:00	9/96	Brummetje	23-05-2011	2011-05-23 00:00:00	9-98	Outdoor Man	52.7851219	6.37828779	picknickplek - Benderse, Ruinen, Dr	Ruinen	Dr	\N	\N
712	22-02-2012	2012-02-22 00:00:00	14/59	frankwijers	24-02-2012	2012-02-24 00:00:00	14/60	ndeeka	51.5118179	5.434165	achter bankje verlengde Joe Mannweg, Best, NB	Best	NB	\N	\N
883	05-08-2012	2012-08-05 00:00:00	16/63	dks_aa	05-08-2012	2012-08-05 00:00:00	16/64	Outdoor Man	52.3854218	4.74750996	aan zuil - Haarlemmerstraatweg	Halfweg	NH	\N	\N
4060	04-11-2021	2021-11-04 00:00:00	41/174	Deeffox	05-11-2021	2021-11-05 00:00:00	41/174	pdv_moto	51.7777519	4.74287081	onder trap gemaal bezinkvijver 	Dordrecht	ZH	\N	\N
3273	18-10-2019	2019-10-18 00:00:00	40/483	jaap43	18-10-2019	2019-10-18 00:00:00	40/483	Hans89	51.759388	4.69086981	in bunker Noorderelsweg	Dordrecht	ZH	\N	\N
2980	03-01-2019	2019-01-03 00:00:00	40/158	BSI	03-01-2019	2019-01-03 00:00:00	40/159	BornToReign	51.9549828	5.60025787	tegen muur monument Grebbeberg	Rhenen	Ut	\N	\N
1596	18-04-2014	2014-04-18 00:00:00	25/71	Artemecion	18-04-2014	2014-04-18 00:00:00	25/71	Bigtwim	52.3893433	4.65982294	tegen muur I. Enschedeweg	Haarlem	NH	\N	\N
3954	25-06-2021	2021-06-25 00:00:00	41/105	FastEddy	26-06-2021	2021-06-26 00:00:00	41/106	pdv_moto	52.930172	6.80181122	in struik bij mammoet, Mammoetpad	Borger	Dr	\N	\N
3639	22-08-2020	2020-08-22 00:00:00	40/798	pdv_moto	24-08-2020	2020-08-24 00:00:00	40/800	Hans89	51.5261688	3.44718599	aan lantaarnpaal Krekepad	Westkapelle	Ze	\N	\N
2813	11-07-2018	2018-07-11 00:00:00	39/57	WillyvD	11-07-2018	2018-07-11 00:00:00	39/58	Outdoor Man	51.6946144	5.14767981	tegen boom zijweg Lipsstraat	Drunen	NB	\N	\N
570	09-10-2011	2011-10-09 00:00:00	12/60	wesleyc	09-10-2011	2011-10-09 00:00:00	12/60	ndeeka	52.023674	4.16689777	bij grafkelder Herckenrath - Duinpan, Monster, ZH	Monster	ZH	\N	\N
3154	29-06-2019	2019-06-29 00:00:00	40/366	Deeffox	01-07-2019	2019-07-01 00:00:00	40/371	Carburateur	51.8085136	4.68856478	in heg Boeroestraat	Dordrecht	ZH	\N	\N
143	18-11-2010	2010-11-18 00:00:00	4/97	Wimis on	19-11-2010	2010-11-19 00:00:00	4/98	V-Strommert	51.9548264	5.60074091	Militaire Begraafplaats - Grebbeweg, Rhenen, Ge	Rhenen	Ge	\N	\N
3027	28-02-2019	2019-02-28 00:00:00	40/224	Rik60NL	28-02-2019	2019-02-28 00:00:00	40/224	BSI	52.2178078	4.97258186	onder vlonder Demmeriksekade	Nieuwer Ter Aa	Ut	\N	\N
2634	09-02-2018	2018-02-09 00:00:00	37/33	Amauta	11-02-2018	2018-02-11 00:00:00	37/36	Ronny Rabbelaar	53.158287	6.52680683	aan uitkijktoren De Onlanden	Peize	Dr	\N	\N
1856	05-03-2015	2015-03-05 00:00:00	28/23	tdemmer	06-03-2015	2015-03-06 00:00:00	28/23	BSI	51.9937744	5.45747805	aan paal bij kasteel	Amerongen	Ut	\N	\N
2807	03-07-2018	2018-07-03 00:00:00	39/48	Bensi	05-07-2018	2018-07-05 00:00:00	39/49	Roeleey	51.9012604	6.25110102	aan boom Bovendorpsstraat	Zeddam	Ge	\N	\N
3762	06-12-2020	2020-12-06 00:00:00	40/897	Amauta	12-12-2020	2020-12-12 00:00:00	40/899	pdv_moto	53.1454391	6.24127102	tegen landhoofd tunnel natuurpad	Marum	Gr	\N	\N
3551	21-06-2020	2020-06-21 00:00:00	40/710	Sjefman	23-06-2020	2020-06-23 00:00:00	40/711	Roeleey	51.5530968	4.93164921	tegen boompaal Klein Zwitserland	Gilze	NB	\N	\N
2035	11-11-2015	2015-11-11 00:00:00	29/93	Kermit de Hond	12-11-2015	2015-11-12 00:00:00	29/93	Amauta	53.2087784	6.54023409	in heg P-terrein Tuinland - Peizerweg	Groningen	Gr	\N	\N
763	02-04-2012	2012-04-02 00:00:00	15/17	jaap43	02-04-2012	2012-04-02 00:00:00	15/17	Von Stolk	51.9787636	4.55243301	aan knotwilg - Linker Rottekade, Zevenhuizen, ZH	Zevenhuizen	ZH	\N	\N
2666	19-03-2018	2018-03-19 00:00:00	37/83	Rik60NL	21-03-2018	2018-03-21 00:00:00	37/84	Roeleey	52.2095985	4.85857391	tegen boom P-plaats Ringdijk	Mijdrecht	Ut	\N	\N
1761	06-10-2014	2014-10-06 00:00:00	27/40	-juliet-	07-10-2014	2014-10-07 00:00:00	27/40	pdv_moto	52.0159454	4.42995787	achter E-kast Europalaan	Pijnacker	ZH	\N	\N
4137	28-02-2022	2022-02-28 00:00:00	41/226	Outdoor Man	01-03-2022	2022-03-01 00:00:00	41/226	HermanK	52.6201591	5.77377892	in stronk bij oude kerk van Ens	Schokland	Fl	\N	\N
3098	01-05-2019	2019-05-01 00:00:00	40/298	Capo-04/06	01-05-2019	2019-05-01 00:00:00	40/298	Coenster	50.8988647	5.75169706	tegen hek bij brug Vliegveldweg	Ulestraten	Li	\N	\N
801	17-05-2012	2012-05-17 00:00:00	12/58	rvdh86	17-05-2012	2012-05-17 00:00:00	15/59	Hasseman	52.2410202	6.05864906	aan hek vliegveld Teuge - de Zanden, Teuge, Ge	Teuge	Ge	\N	\N
3811	21-02-2021	2021-02-21 00:00:00	40/939	Amauta	21-02-2021	2021-02-21 00:00:00	40/939	BSI	52.3677711	5.61510897	tussen keien havonhoofd Harderhaven	Zeewolde	Fl	\N	\N
796	05-05-2012	2012-05-05 00:00:00	15/50	Bigtwim	08-05-2012	2012-05-08 00:00:00	15/52	Kermit de Hond	53.4328041	6.58176517	bij kast op de dijk, Noordpolderzijl, Gr	Noordpolderzijl	Gr	\N	\N
1681	13-07-2014	2014-07-13 00:00:00	26/60	SadBunny	14-07-2014	2014-07-14 00:00:00	26/60	BSI	52.2007904	5.04392004	aan hek kampeerterrein fort Spion	Loosdrecht	NH	\N	\N
4133	24-02-2022	2022-02-24 00:00:00	41/223	Hans89	25-02-2022	2022-02-25 00:00:00	41/224	Outdoor Man	52.0148506	4.66488218	achter boomstronk het Weegje	Waddinxveen	ZH	\N	\N
589	16-10-2011	2011-10-16 00:00:00	12/82	Von Stolk	17-10-2011	2011-10-17 00:00:00	12/84	Dirk130	52.0012169	4.72719812	onder elektrahuisje Tiendweg, Gouda, ZH	Gouda	ZH	\N	\N
2866	17-08-2018	2018-08-17 00:00:00	40/19	Amauta	17-08-2018	2018-08-17 00:00:00	40/19	bikedan	51.3658867	3.372087	in struikje bij grenspaal 369, Duinweg	Retranchement	Ze	\N	\N
3163	07-07-2019	2019-07-07 00:00:00	40/378	BSI	08-07-2019	2019-07-08 00:00:00	40/379	pdv_moto	52.2211609	6.86288977	in heg bij HS-mast H. ter Kuilesraat	Enschede	Ov	\N	\N
1525	21-02-2014	2014-02-21 00:00:00	24/95	Roeleey	21-02-2014	2014-02-21 00:00:00	24/95	Scoot_020/Scoot_2	52.2982063	4.98365688	onder motorhoes Vianenstraat	Amsterdam	NH	\N	\N
6	20-08-2010	2010-08-20 00:00:00	1/15	Hayfork	20-08-2010	2010-08-20 00:00:00	1/16	NR34	51.4917068	5.86094904	Langstraat/Deurneseweg, Ysselsteyn, Li	Ysselsteyn	Li	\N	\N
2638	14-02-2018	2018-02-14 00:00:00	37/40 	FastEddy	15-02-2018	2018-02-15 00:00:00	37/42	Amauta	52.9469757	7.13699293	onder fietsbrug Ruiten-Aa	Westerwolde	Gr	\N	\N
2402	27-04-2017	2017-04-27 00:00:00	34/28	-Floris-	27-04-2017	2017-04-27 00:00:00	34/28	bikedan	51.4796143	3.94046092	aan boompje Dijkwelseweg	Kapelle	Ze	\N	\N
1519	17-02-2014	2014-02-17 00:00:00	24/87	Splinnie	17-02-2014	2014-02-17 00:00:00	24/87	BigJim	52.7090034	4.68338299	in struik achter paal - Oossprongweg	Schoorl	NH	\N	\N
924	16-09-2012	2012-09-16 00:00:00	17/02	ootje	17-09-2012	2012-09-17 00:00:00	17/03	magnamaniac	51.7838898	5.1620388	aan spindel sluis - Eendenkade	Delwijnen	Ge	\N	\N
3439	02-04-2020	2020-04-02 00:00:00	40/618	Outdoor Man	02-04-2020	2020-04-02 00:00:00	40/619	HighKing	52.7488518	4.91530609	in hoop debris Reine Victoriaweg	Wimkel	NH	\N	\N
3839	21-03-2021	2021-03-21 00:00:00	41/014	Amauta	21-03-2021	2021-03-21 00:00:00	41/014	Ronald_010	51.8354721	5.67652178	in boom bij kasteel Hernen	Wijchen	Ge	\N	\N
4195	27-05-2022	2022-05-27 00:00:00	41/266	FastEddy	27-05-2022	2022-05-27 00:00:00	41/267	Ronny Rabbelaar	52.8293571	6.84107494	aan paal bij fietstunnel	Oddornerveen	Dr	\N	\N
2411	30-04-2017	2017-04-30 00:00:00	34/34	pdv_moto	06-05-2017	2017-05-06 00:00:00	34/37	Ronald_010	51.5502625	3.59588909	in struiken kerk	Serooskerke	Ze	\N	\N
1132		0001-01-01 00:00:00 BC		SadBunny		0001-01-01 00:00:00 BC			\N	\N				\N	\N
2778	13-06-2018	2018-06-13 00:00:00	39/17	Outdoor Man	14-06-2018	2018-06-14 00:00:00	39/18	Coenster	52.2735023	4.86270523	aan hek achter schuur Nesserlaan	Amstelveen	NH	\N	\N
202	19-01-2011	2011-01-19 00:00:00	6/34	USED	19-01-2011	2011-01-19 00:00:00	6/36	bouwvakkertje	52.1945686	6.58938313	braamstruik - Hengevelderweg, Diepenheim, Ov	Diepenheim	Ov	\N	\N
3981	19-07-2021	2021-07-19 00:00:00	41/125	Amauta	19-07-2021	2021-07-19 00:00:00	41/125	HighKing	52.9476967	4.78716803	in struik bij koopvaarderssluis	Den Helder	NH	\N	\N
2096	15-04-2016	2016-04-15 00:00:00	30/65	Coenster	15-04-2016	2016-04-15 00:00:00	30/66	Wimis on	52.0254784	5.1738348	aan geluidsscherm Oude Station	Houten	Ut	\N	\N
929	20-09-2012	2012-09-20 00:00:00	17/07	MotorMieke	21-09-2012	2012-09-21 00:00:00	17/08	BSI	52.3625221	6.61283112	aan boompje bij hek Aadorpsweg	Wierden	Ov	\N	\N
3838	20-03-2021	2021-03-20 00:00:00	41/013	Okami_Xci	20-03-2021	2021-03-20 00:00:00	41/013	Amauta	51.5664139	5.2231369	tegen boom Rosepfreef bij rest. de Eyck	Oisterwijk	NB	\N	\N
3474	25-04-2020	2020-04-25 00:00:00	40/646	Coenster	25-04-2020	2020-04-25 00:00:00	40/647	Amauta	53.2405128	5.85681915	tegen Tegeltjesbrug, 	Miedum	Fr	\N	\N
3108	08-05-2019	2019-05-08 00:00:00	40/312	scheurschuimpje	08-05-2019	2019-05-08 00:00:00	40/314	HermanK	52.758358	5.83489609	in struik bij ingang Orgideeënhoeve	Luttelgeest	Fl	\N	\N
2384	15-04-2017	2017-04-15 00:00:00	34/10	Bensi	16-04-2017	2017-04-16 00:00:00	34/12	GromToskamp	52.0025635	6.35881519	bij paal Plumersdijk	Zelhem	Ge	\N	\N
2984	05-01-2019	2019-01-05 00:00:00	40/163	FastEddy	05-01-2019	2019-01-05 00:00:00	40/163	Amauta	52.9775467	6.95001888	in heg bij Dantsepoort	Nieuw Buinen	Dr	\N	\N
2546	16-09-2017	2017-09-16 00:00:00	35/97	Okami_Xci	17-09-2017	2017-09-17 00:00:00	35/98	bikedan	51.5193901	5.61187601	onder Bavariavord - De Stater	Lieshout	NB	\N	\N
3529	03-06-2020	2020-06-03 00:00:00	40/692	HermanK	04-06-2020	2020-06-04 00:00:00	40/692	MeanYellowBoy	52.5575829	6.39292622	aan paaltje van schrikdraad Witharenweg	Witharen	Ov	\N	\N
2005	01-09-2015	2015-09-01 00:00:00	29/57	Dirk130	02-09-2015	2015-09-02 00:00:00	29/58	Meifesto	52.0608749	4.38263798	bij ADO-stadion - Haagskwartier	Den Haag	ZH	\N	\N
284		0001-01-01 00:00:00 BC		Foncelot		0001-01-01 00:00:00 BC		blup blup	\N	\N				\N	\N
1908	10-05-2015	2015-05-10 00:00:00	28/73	crazy987	12-05-2015	2015-05-12 00:00:00	28/74	jaap43	51.7072601	4.81768894	aan GSM-mast - Marinaweg	Drimmelen	NB	\N	\N
2669	22-03-2018	2018-03-22 00:00:00	37/87	Hjerteknuser	22-03-2018	2018-03-22 00:00:00	37/88	sanger	52.5076828	4.69252014	tegen boom bij infopaneel P-terrein	Heemskerk	NH	\N	\N
2430	19-05-2017	2017-05-19 00:00:00	34/52	Amauta	19-05-2017	2017-05-19 00:00:00	34/52	frankivo	52.773983	6.44435883	tussen steen Shell Green Planet	Pesse	Dr	\N	\N
4194	25-05-2022	2022-05-25 00:00:00	41/266	BSI	26-05-2022	2022-05-26 00:00:00	41/266	FastEddy	52.1950874	5.78015804	tegen hekwerk Nieuwmillingseweg	Kootwijk	Ge	\N	\N
3615	08-08-2020	2020-08-08 00:00:00	40/770	SadBunny	08-08-2020	2020-08-08 00:00:00	40/770	HighKing	52.2906418	4.79847097	aan boom Rietwijkeroordweg	Aalsmeer	NH	\N	\N
565	05-10-2011	2011-10-05 00:00:00	12/53	Scoot_020/Scoot_2	05-10-2011	2011-10-05 00:00:00	12/53	V-Strommert	52.3885193	4.82069397	in heg P-terrein CBR - Naritaweg, Amsterdam, NH	Amsterdam	NH	\N	\N
778	16-04-2012	2012-04-16 00:00:00	15/34	Bensi	16-04-2012	2012-04-16 00:00:00	15/34	Shadowski	52.0192375	6.06723881	onder steen P-terrein Middachten, de Steeg, Ge	de Steeg	Ge	\N	\N
2753	11-05-2018	2018-05-11 00:00:00	38/81	vuurbloed	11-05-2018	2018-05-11 00:00:00	38/82	BSI	50.7503853	5.91507387	achter grenspaal 12	Sippenaken	Li	\N	\N
179		0001-01-01 00:00:00 BC				0001-01-01 00:00:00 BC		Smuiger	\N	\N				\N	\N
1086	20-02-2013	2013-02-20 00:00:00	19/15	Roeleey	20-02-2013	2013-02-20 00:00:00	19/15	Scoot_020/Scoot_2	52.3447876	4.98113203	onder paddestoel - Vlinderweg	Diemen	NH	\N	\N
4013	26-08-2021	2021-08-26 00:00:00	41/146	Outdoor Man	27-08-2021	2021-08-27 00:00:00	41/147	Roeleey	52.3249016	4.8225112	in struiken achter bankjes Bosbaan	Amsterdam	NH	\N	\N
2521	21-08-2017	2017-08-21 00:00:00	35/60	Okami_Xci	23-08-2017	2017-08-23 00:00:00	35/62	pdv_moto	51.4591179	5.49641085	aan hek schietterrein - Amazonelaan	Eindhoven	NB	\N	\N
1528	23-02-2014	2014-02-23 00:00:00	24/97	Dirk130	25-02-2014	2014-02-25 00:00:00	24/99	BigJim	52.6360512	5.06290007	onder steiger Oostereiland	Hoorn	NH	\N	\N
262	08-03-2011	2011-03-08 00:00:00	7/79	Quickly	08-03-2011	2011-03-08 00:00:00	7/81	Wimis on	52.0367851	5.11230898	einde landtong bij Plofsluis, Nieuwegein, Ut	Nieuwegein	Ut	\N	\N
1354	16-09-2013	2013-09-16 00:00:00	22/80	jaap43	16-09-2013	2013-09-16 00:00:00	22/80	SparkViv	51.8330421	4.29608202	achter E-huisje Hogeweg	Simonshaven	ZH	\N	\N
1737	06-09-2014	2014-09-06 00:00:00	27/19	Hans89	07-09-2014	2014-09-07 00:00:00	27/20	bikedan	51.5033531	3.62110806	bij E-huisje Veerse Bolwerk	Middelburg	Ze	\N	\N
1995	19-08-2015	2015-08-19 00:00:00	29/48	Roeleey	19-08-2015	2015-08-19 00:00:00	29/48	Lekkerbekje	52.297184	4.95840788	onder treeplank portocabin	Amsterdam	NH	\N	\N
1848	26-02-2015	2015-02-26 00:00:00	28/19	Scoot_020/Scoot_2	26-02-2015	2015-02-26 00:00:00	28/20	Corney28	52.0846291	5.10592699	stand Peugeot - jaarbeurs 07A050	Utrecht	Ut	\N	\N
3971	08-07-2021	2021-07-08 00:00:00	41/118	HighKing	08-07-2021	2021-07-08 00:00:00	41/118	pdv_moto	52.5154762	4.6860652	tegen boom bij mozaiekbank Marlelaan	Heemskerk	NH	\N	\N
475	29-07-2011	2011-07-29 00:00:00	11/24	BSI	29-07-2011	2011-07-29 00:00:00	11/25	wesleyc	52.2488441	4.75739288	aan hek - Fortbocht, Kudelstaart, NH	Kudelstaart	NH	\N	\N
1138	26-03-2013	2013-03-26 00:00:00	19/81	Roeleey	26-03-2013	2013-03-26 00:00:00	19/81	V-Strommert	52.3397484	5.01505089	bij bushokje Overdiemerweg	Amsterdam	NH	\N	\N
2909	20-09-2018	2018-09-20 00:00:00	40/63	Amauta	20-09-2018	2018-09-20 00:00:00	40/64	Bomba	51.9095345	4.48877907	in struikje Meeuwenstraat, Noordereiland	Rotterdam	ZH	\N	\N
575	11-10-2011	2011-10-11 00:00:00	12/65	Dirk130	12-10-2011	2011-10-12 00:00:00	12/66	jaap43	51.7773552	4.74387312	in knotwilg bij Oosthaven - Oostdijk, Dordrecht, ZH	Dordrecht	ZH	\N	\N
2506	05-08-2017	2017-08-05 00:00:00	35/39	Capo-04/06	06-08-2017	2017-08-06 00:00:00	35/40	pdv_moto	50.9813461	5.97714901	aan berk - P-terrein Eindweg	Schinveld	Li	\N	\N
2439	29-05-2017	2017-05-29 00:00:00	34/61	Bas600	29-05-2017	2017-05-29 00:00:00	34/62	Rik60NL	52.0394363	5.06119585	op tak P-terrein Nedereindseweg	Utrecht	Ut	\N	\N
3123	21-05-2019	2019-05-21 00:00:00	40/335	DKP	24-05-2019	2019-05-24 00:00:00	40/336	Carburateur	51.3058853	4.18148899	aan paal 60 km/h Engelbertusstraat	Nieuw-Namen	Ze	\N	\N
1991	14-08-2015	2015-08-14 00:00:00	29/44	Artemecion	15-08-2015	2015-08-15 00:00:00	29/44	Bigtwim	52.5332985	4.716115	aan hek molen de Kat - Limmerweg	Uitgeest	NH	\N	\N
2534	01-09-2017	2017-09-01 00:00:00	35/78	Djoost	01-09-2017	2017-09-01 00:00:00	35/78	Coenster	52.4212456	4.82589722	in struik Hemkade	Zaandam	NH	\N	\N
2221	31-08-2016	2016-08-31 00:00:00	31/97	vuurbloed	31-08-2016	2016-08-31 00:00:00	31/97	Rik60NL	52.3370705	4.74045515	bij landingslicht - Hoofdweg Oostzijde	Lijnden	NH	\N	\N
4408	30-09-2023	2023-09-30 00:00:00	41/406	Bensi	01-10-2023	2023-10-01 00:00:00	41/406	FastEddy	52.3751831	6.09355116	in plantenbak bij Kozakkenveer	Veessen	Ge	\N	\N
3470	23-04-2020	2020-04-23 00:00:00	40/644	Hans89	23-04-2020	2020-04-23 00:00:00	40/644	Outdoor Man	51.9031677	4.53014421	in boom polder de Esch	Rotterdam	ZH	\N	\N
51		0001-01-01 00:00:00 BC		italbike		0001-01-01 00:00:00 BC			\N	\N				\N	\N
2413	06-05-2017	2017-05-06 00:00:00	34/38	pdv_moto	07-05-2017	2017-05-07 00:00:00	34/38	BSI	51.7332802	4.40994692	aan vangrail Viaduct bij	Numansdorp	ZH	\N	\N
3748	14-11-2020	2020-11-14 00:00:00	40/883	k0en	15-11-2020	2020-11-15 00:00:00	40/883	SadBunny	51.8322983	5.25902224	tegen hek spoorwegviaduct	Waardenburg	Ge	\N	\N
4212	23-06-2022	2022-06-23 00:00:00	41/276	k0en	29-06-2022	2022-06-29 00:00:00	41/277	BSI	52.0774422	5.14079809	aan hek Tamboersdijk	Utrecht	Ut	\N	\N
1242	14-06-2013	2013-06-14 00:00:00	21/38	bikedan	15-06-2013	2013-06-15 00:00:00	21/38	Ronald_010	51.7196846	4.72680283	aan hek Amerweg	Lage Zwaluwe	NB	\N	\N
105	23-10-2010	2010-10-23 00:00:00	3/96	MP_NL	23-10-2010	2010-10-23 00:00:00	3/97	Wilddam	52.4279137	6.55351591	Esweg, Daarle, Ov	Daarle	Ov	\N	\N
3535	07-06-2020	2020-06-07 00:00:00	40/696	HighKing	07-06-2020	2020-06-07 00:00:00	40/697	k0en	52.5497246	4.6566062	in graspol bij ingang kinderboerderij	Castricum	NH	\N	\N
3708	19-10-2020	2020-10-19 00:00:00	40/852	Yosra87	19-10-2020	2020-10-19 00:00:00	40/852	Amauta	52.0970039	4.332551	in struik ingang park Clingendael	Den Haag	ZH	\N	\N
3272	17-10-2019	2019-10-17 00:00:00	40/482	Artemecion	17-10-2019	2019-10-17 00:00:00	40/483	jaap43	52.0143471	4.70315695	achter schakelkast van Beveringhlaan	Gouda	ZH	\N	\N
1763	07-10-2014	2014-10-07 00:00:00	27/41	MLB	08-10-2014	2014-10-08 00:00:00	27/42	Dirk130	52.0300331	4.22720623	aan paal afvalbak P. Captijnlaan	Poeldijk	ZH	\N	\N
1196	05-05-2013	2013-05-05 00:00:00	20/67	Ronald_010	05-05-2013	2013-05-05 00:00:00	20/68	tdemmer	51.9772758	4.65246916	onder brug gemaal	Nieuwerkerk a/d IJssel	ZH	\N	\N
2001	25-08-2015	2015-08-25 00:00:00	29/53	Amauta	28-08-2015	2015-08-28 00:00:00	29/54	leoniie	53.1683578	6.4747901	aan hek - Hoofdstraat	Roderwolde	Dr	\N	\N
2846	05-08-2018	2018-08-05 00:00:00	39/97	SadBunny	06-08-2018	2018-08-06 00:00:00	39/97	Roeleey	52.1398163	5.24110603	in heg p-terrein Paduaweg	Den Dolder	Ut	\N	\N
2198	08-08-2016	2016-08-08 00:00:00	31/70	BSI	09-08-2016	2016-08-09 00:00:00	31/72	MotorMieke	52.2911224	6.89983797	aan paal knooppunt 95	Oldenzaal	Ov	\N	\N
548		0001-01-01 00:00:00 BC				0001-01-01 00:00:00 BC		bobcat	\N	\N				\N	\N
3488	04-05-2020	2020-05-04 00:00:00	40/656	ootje	05-05-2020	2020-05-05 00:00:00	40/657	HighKing	52.7618828	4.72634792	in knotwilg Dijkstalwiel	Sint Maarten	NH	\N	\N
3630	18-08-2020	2020-08-18 00:00:00	40/791	Yosra87	18-08-2020	2020-08-18 00:00:00	40/791	Springbok	52.1413918	4.54017305	aan poot plaatsnaambord Achthovenerw.	Leiderdorp	ZH	\N	\N
2018	29-09-2015	2015-09-29 00:00:00	29/72	Amauta	30-09-2015	2015-09-30 00:00:00	29/72	pdv_moto	52.2412453	7.06571484	onder steen Drielandsteen	Overdinkel	Ov	\N	\N
615	07-11-2011	2011-11-07 00:00:00	13/27	wesleyc	07-11-2011	2011-11-07 00:00:00	13/28	Scoot_020/Scoot_2	52.0185242	4.17370319	onder steiger Havenstraat, Monster, ZH	Monster	ZH	\N	\N
1343	05-09-2013	2013-09-05 00:00:00	22/65	Ronald_010	05-09-2013	2013-09-05 00:00:00	22/66	Corney28	52.1426392	4.64878607	aan paaltje - van Oordtkade	Alphen a/d Rijn	ZH	\N	\N
1318	20-08-2013	2013-08-20 00:00:00	22/30	Bensi	21-08-2013	2013-08-21 00:00:00	22/31	Hasseman	52.1780052	6.41271591	achter paaltje Aardappeldijk	Lochem	Ge	\N	\N
3151	21-06-2019	2019-06-21 00:00:00	40/364	Coenster	22-06-2019	2019-06-22 00:00:00	40/364	jaap43	52.106884	4.73880911	aan lantaarnpaal, Ziendeweg	Zwammerdam	ZH	\N	\N
3227	31-08-2019	2019-08-31 00:00:00	40/445	Meifesto	31-08-2019	2019-08-31 00:00:00	40/445	Hans89	51.9217873	4.58085203	in boomstronk Dief en Duifhuis	Capelle aan den Ijssel	ZH	\N	\N
1134	24-03-2013	2013-03-24 00:00:00	19/74	V-Strommert	24-03-2013	2013-03-24 00:00:00	19/75	SadBunny	52.3059578	4.6916852	achter E-kast Raadhuislaan	Hoofddorp	NH	\N	\N
3555	24-06-2020	2020-06-24 00:00:00	40/713	Bensi	27-06-2020	2020-06-27 00:00:00	40/714	BSI	51.9325829	6.35658979	achter heg Steveninkstraat	Gaanderen	Ge	\N	\N
3655	04-09-2020	2020-09-04 00:00:00	40/811	FastEddy	05-09-2020	2020-09-05 00:00:00	40/812	Janhertog	52.9275627	6.25784588	tegen boom bij camping 2 grenzen	Zorgvlied	Dr	\N	\N
250	24-02-2011	2011-02-24 00:00:00	7/47	Hansss	24-02-2011	2011-02-24 00:00:00	7/48	vuurbloed	52.0875244	5.10486603	parkeerterrein Graadt van Roggenweg, Utrecht, Ut	Utrecht	Ut	\N	\N
2755	15-05-2018	2018-05-15 00:00:00	38/85	Ronald_010	19-05-2018	2018-05-19 00:00:00	38/86	HighKing	51.3194275	6.11464787	aan paal kast bij stuw 	Belfeld	Li	\N	\N
2080	13-03-2016	2016-03-13 00:00:00	30/43	bikedan	16-03-2016	2016-03-16 00:00:00	30/44	ad patat	51.512886	4.005301	aan boom P-terrein	Wemeldinge	Ze	\N	\N
7	21-08-2010	2010-08-21 00:00:00	1/19	NR34	21-08-2010	2010-08-21 00:00:00	1/18	Jeltel	51.7985115	5.93227386	Begraafplaats - 7 Heuvelenweg, Groesbeek, Ge	Groesbeek	Ge	\N	\N
849		0001-01-01 00:00:00 BC		Eady		0001-01-01 00:00:00 BC			\N	\N				\N	\N
3121	16-05-2019	2019-05-16 00:00:00	40/330	FastEddy	17-05-2019	2019-05-17 00:00:00	40/332	HermanK	52.993721	6.9397049	onder draaischjf Museumweg	Stadskanaal	Gr	\N	\N
3465	20-04-2020	2020-04-20 00:00:00	40/639	Amauta	20-04-2020	2020-04-20 00:00:00	40/640	HermanK	52.6962776	6.44971323	in bremstruik bij fitstunnel Alteveer	Hoogeveen	Dr	\N	\N
1036	25-12-2012	2012-12-25 00:00:00	18/37	Bomba	26-12-2012	2012-12-26 00:00:00	18/38	Corney28	52.0377655	4.77150011	aan brug - Wierickepad	Reeuwijk	ZH	\N	\N
3114	11-05-2019	2019-05-11 00:00:00	40/321	Ronald_010	12-05-2019	2019-05-12 00:00:00	40/321	Amauta	51.3304977	6.16870117	achter zuil grenskantoor	Tegelen	Li	\N	\N
538	14-09-2011	2011-09-14 00:00:00	12/08	Alpha	15-09-2011	2011-09-15 00:00:00	12/08	Quickly	51.9670982	4.77082396	bankje picknickplaats - De Vaartweg, Stolwijk, ZH	Stolwijk	ZH	\N	\N
2644	20-02-2018	2018-02-20 00:00:00	37/50	HighKing	20-02-2018	2018-02-20 00:00:00	37/51	Bigtwim	52.4965172	4.6788969	in struik rotonde Beneluxlaan	Heemskerk	NH	\N	\N
1245	19-06-2013	2013-06-19 00:00:00	21/41	MLB	19-06-2013	2013-06-19 00:00:00	21/42	Low Profile	52.0771599	5.1802249	aan boom bij fort a/d Zandlaan	Bunnik	Ut	\N	\N
3319	12-12-2019	2019-12-12 00:00:00	40/525	ey-dzeej	12-12-2019	2019-12-12 00:00:00	40/525	Carburateur	52.0262947	4.57859612	aan hek spoorlijn/A12, Noordeinde	Zevenhuizen	ZH	\N	\N
1176	20-04-2013	2013-04-20 00:00:00	20/41	Bensi	20-04-2013	2013-04-20 00:00:00	20/42	JurgenT	52.1673088	6.24918509	3e boom laantje bij Wagenvoortsedijk	Eefde	Ge	\N	\N
219	03-02-2011	2011-02-03 00:00:00	6/80	tdemmer	03-02-2011	2011-02-03 00:00:00	6/81	Hasseman	52.1336708	6.00710678	waterval, Loenen/Beekbergen, Ge	Loenen	Ge	\N	\N
4018	30-08-2021	2021-08-30 00:00:00	41/149	ootje	30-08-2021	2021-08-30 00:00:00	41/149	BigJim	52.5251122	4.74576902	onder steiger kano-oversteek,Lagendijk	Uitgeest	NH	\N	\N
3722	27-10-2020	2020-10-27 00:00:00	40/863	ootje	27-10-2020	2020-10-27 00:00:00	40/863	HighKing	52.557518	4.65679407	bij monument geboorte Beatrix, vd Mijlweg	Castricum	NH	\N	\N
2270	09-10-2016	2016-10-09 00:00:00	32/57	tdemmer	10-10-2016	2016-10-10 00:00:00	32/58	Bomba	52.1344147	4.55350399	aan boom tankstation - Rijndijk	Hazerswoude	ZH	\N	\N
3345	02-01-2020	2020-01-02 00:00:00	40/542	Hans89	03-01-2020	2020-01-03 00:00:00	40/543	WillyvD	51.499958	3.62361693	in linkerstruik bij kanon Maisbaai	Middelburg	Ze	\N	\N
96	16-10-2010	2010-10-16 00:00:00	3/73	stampertje-35	17-10-2010	2010-10-17 00:00:00	3/74	mastertommy	52.3880272	4.54336214	circuit, Zandvoort, NH	Zandvoort	NH	\N	\N
1551	11-03-2014	2014-03-11 00:00:00	25/20	Lekkerbekje	11-03-2014	2014-03-11 00:00:00	25/21	tdemmer	51.9996185	5.07667112	tussen keien onder bruggen	Nieuwegein	Ut	\N	\N
2954	09-12-2018	2018-12-09 00:00:00	40/124	Amauta	10-12-2018	2018-12-10 00:00:00	40/125	Hjerteknuser	52.4557686	4.55997992	bij strandpost reddingsbrigade	IJmuiden	NH	\N	\N
42	10-09-2010	2010-09-10 00:00:00	2/61	Bikermamma	10-09-2010	2010-09-10 00:00:00	2/62	Grote Voet	52.5790672	4.99778223	industrieterrein Westeinde, Oosthuizen, NH	Oosthuizen	NH	\N	\N
1866	17-03-2015	2015-03-17 00:00:00	28/32	Rainbow600	17-03-2015	2015-03-17 00:00:00	28/32	Bas600	51.9754829	5.15449619	aan paal bochtmarkering - Lekdijk	Tull	Ut	\N	\N
50	15-09-2010	2010-09-15 00:00:00	2/73	J-oram	15-09-2010	2010-09-15 00:00:00	2/74	Bensi	51.9276505	6.11259985	onder brug - de Braak, Zevenaar, Ge	Zevenaar	Ge	\N	\N
1126	21-03-2013	2013-03-21 00:00:00	19/66	V-Strommert	21-03-2013	2013-03-21 00:00:00	19/68	Roeleey	52.2865753	4.70370388	in pijp stellingdeel Rijnlanderweg	Hoofddorp	NH	\N	\N
32	02-09-2010	2010-09-02 00:00:00	2/20	NR34	02-09-2010	2010-09-02 00:00:00	2/25	magnamaniac	52.7415543	5.95332384	picnickplek Holleweg/St. Jansberg, Milsbeek, Li	Milsbeek	Li	\N	\N
454	03-07-2011	2011-07-03 00:00:00	10/92	bakfiets1	05-07-2011	2011-07-05 00:00:00	10/93	KennethMusters	51.396328	3.79749608	hek Westerscheldetunnelweg, Ellewoutsdijk, Ze	Ellewoutsdijk	Ze	\N	\N
1996	19-08-2015	2015-08-19 00:00:00	29/48	Lekkerbekje	20-08-2015	2015-08-20 00:00:00	29/49	Amauta	51.9992027	4.36668587	onder boom - de Nieuwe Haven	Delft	ZH	\N	\N
3242	15-09-2019	2019-09-15 00:00:00	40/457	BSI	20-09-2019	2019-09-20 00:00:00	40/459	Janhertog	53.2189827	5.90552521	in struik bij kunstwerk	Tietjerk	Fr	\N	\N
664	18-12-2011	2011-12-18 00:00:00	13/82	Murof	19-12-2011	2011-12-19 00:00:00	13/84	rvdh86	52.1698837	5.76126194	onder boom bij uitkijktoren, Kootwijkerzand, Ge	Kootwijkerzand	Ge	\N	\N
208	25-01-2011	2011-01-25 00:00:00	6/56	Remond-Frl	25-01-2011	2011-01-25 00:00:00	6/57	scheurschuimpje	52.9358368	5.91557407	bij steen Oude Postweg/Sydtakke, Rottum, Fr	Rottum	Fr	\N	\N
619	08-11-2011	2011-11-08 00:00:00	13/32	Shadowski	09-11-2011	2011-11-09 00:00:00	13/33	frankwijers	51.8759804	5.9747858	aan paal bij gans (gent) - Waaldijk, Gendt, Ge	Gendt	Ge	\N	\N
1229	02-06-2013	2013-06-02 00:00:00	21/21	Bensi	02-06-2013	2013-06-02 00:00:00	21/22	Bludge	51.8186455	5.94045496	onder dode boom - Duivelsberg	Berg en Dal	Ge	\N	\N
2173	17-07-2016	2016-07-17 00:00:00	31/47	BSI	17-07-2016	2016-07-17 00:00:00	31/47	BornToReign	52.0370216	5.73406982	aan boom bij airbornmonument Ginkel	Ede	Ge	\N	\N
755	27-03-2012	2012-03-27 00:00:00	15/08	tdemmer	27-03-2012	2012-03-27 00:00:00	15/08	Ronald_010	51.9878693	4.51118088	aan hek - Leeuwenhoekweg, Bergschenhoek, ZH	Bergschenhoek	ZH	\N	\N
259	07-03-2011	2011-03-07 00:00:00	7/74	jaap43	07-03-2011	2011-03-07 00:00:00	7/75	lynx84	51.8405228	4.49299002	parkeerplaats Carnisse Grienden, Barendrecht, ZH	Barendrecht	ZH	\N	\N
2385	16-04-2017	2017-04-16 00:00:00	34/12	GromToskamp	16-04-2017	2017-04-16 00:00:00	34/13	Coenster	52.2261467	5.2026701	in boomstronk - Anton Philipsweg	Hilversum	NH	\N	\N
2794	24-06-2018	2018-06-24 00:00:00	39/31	Bensi	24-06-2018	2018-06-24 00:00:00	39/32	BSI	52.1074791	6.07260895	aan boom bij oliemolen	Eerbeek	Ge	\N	\N
383		0001-01-01 00:00:00 BC				0001-01-01 00:00:00 BC		Buikschuiver oet Dre	\N	\N				\N	\N
1940	19-06-2015	2015-06-19 00:00:00	29/03	Bomba	20-06-2015	2015-06-20 00:00:00	29/04	Ronald_010	52.0688896	4.85450888	aan hek Parallelweg West	Woerden	Ut	\N	\N
4117	07-02-2022	2022-02-07 00:00:00	41/213	HighKing	08-02-2022	2022-02-08 00:00:00	41/214	pdv_moto	52.0704842	5.05435514	in hoek tegen wilgenbomen	Utrecht	Ut	\N	\N
3337	23-12-2019	2019-12-23 00:00:00	40/536	FastEddy	23-12-2019	2019-12-23 00:00:00	40/536	Amauta	53.0416412	6.81152391	onder kei Elzemaat	Exterveen	Dr	\N	\N
1553	12-03-2014	2014-03-12 00:00:00	25/22	Ronald_010	12-03-2014	2014-03-12 00:00:00	25/22	Dirk130	52.0415115	4.4586401	bij brug over Floraplas	Zoetermeer	ZH	\N	\N
4414	13-10-2023	2023-10-13 00:00:00	41/410	SwitchUp	16-10-2023	2023-10-16 00:00:00	41/411	Outdoor Man	52.1364937	5.24711609	tegen poot infopaneel Vrijheidsbank	Den Dolder	Ut	\N	\N
611	04-11-2011	2011-11-04 00:00:00	13/21	V-Strommert	04-11-2011	2011-11-04 00:00:00	13/22	Scoot_020/Scoot_2	52.408741	4.60674477	aan muurtje van uitzichttoren, Bloemendaal, NH	Bloemendaal	NH	\N	\N
2129	16-05-2016	2016-05-16 00:00:00	30/97	BSI	17-05-2016	2016-05-17 00:00:00	30/98	Sjantaalfoutje	52.1289444	6.04536915	in molensteen de Middelste Molen	Loenen	Ge	\N	\N
1316	19-08-2013	2013-08-19 00:00:00	22/28	me-daph	19-08-2013	2013-08-19 00:00:00	22/28	Hasseman	52.3557816	6.84339285	in struiken bij kerk van het Stift	Weerselo	Ov	\N	\N
3939	16-06-2021	2021-06-16 00:00:00	41/095	HermanK	17-06-2021	2021-06-17 00:00:00	41/096	Picobello BV	52.5288963	5.67260599	onder afdak fietsenstalling AbeMec	Dronten	Fl	\N	\N
2855	12-08-2018	2018-08-12 00:00:00	40/08	BSI	12-08-2018	2018-08-12 00:00:00	40/08	pdv_moto	52.0805016	5.44990301	in NS-lokomotief 218, Parallelweg	Woudenberg	Ut	\N	\N
3401	05-03-2020	2020-03-05 00:00:00	40/583	Picobello BV	05-03-2020	2020-03-05 00:00:00	40/584	Hans89	51.9202118	4.53408194	bij paaltje talud A16, P-plaats	Rotterdam	ZH	\N	\N
980	06-11-2012	2012-11-06 00:00:00	17/73	Corney28	07-11-2012	2012-11-07 00:00:00	17/73	Bigtwim	52.2334442	4.95799398	onder steiger 4e eiland	Vinkeveen	Ut	\N	\N
1798	21-11-2014	2014-11-21 00:00:00	27/74	frankivo	24-11-2014	2014-11-24 00:00:00	27/76	Janhertog	52.5198288	6.12279081	aan hek Boerendanserdijk	Zwolle	Ov	\N	\N
4434	13-12-2023	\N	41/422	pdv_moto		\N			\N	\N	achter betonnen paaltje Badweg	Hoek van Holland	ZH	\N	\N
1038	28-12-2012	2012-12-28 00:00:00	18/39	frankwijers	31-12-2012	2012-12-31 00:00:00	18/41	Ronald_010	51.4859581	6.17295122	achter E-kast Brouwerij Hertog Jan	Arcen	Li	\N	\N
3292	01-11-2019	2019-11-01 00:00:00	40/498	Hans89	01-11-2019	2019-11-01 00:00:00	40/499	ey-dzeej	51.9223289	4.58325005	bij ophaalbrug Slot Capelle a/d Ijssel	Capelle aan den Ijssel	ZH	\N	\N
1070	07-02-2013	2013-02-07 00:00:00	18/96	tdemmer	08-02-2013	2013-02-08 00:00:00	18/96	Corney28	51.6935158	4.61980391	aan hek Appelweg	Moerdijk	NB	\N	\N
4062	07-11-2021	2021-11-07 00:00:00	41/175	BadBert	10-11-2021	2021-11-10 00:00:00	41/176	k0en	51.5571251	4.37713099	onder container modelvliegveld 	Kruisland	NB	\N	\N
873	28-07-2012	2012-07-28 00:00:00	16/54	MarkieNL	28-07-2012	2012-07-28 00:00:00	16/55	Franko P	51.5126839	5.11529207	bij slagboom camping	Beekse Bergen	NB	\N	\N
1234	05-06-2013	2013-06-05 00:00:00	21/27	BSI	05-06-2013	2013-06-05 00:00:00	21/28	Corney28	51.9875679	5.28237104	hek bij grenspaal XVII - Trechtweg	Cothen	Ut	\N	\N
2069	11-02-2016	2016-02-11 00:00:00	30/28	Amauta	12-02-2016	2016-02-12 00:00:00	30/29	Janhertog	52.763485	5.89987803	aan trap bij Kruithuis	Blankenham	Ov	\N	\N
2089	01-04-2016	2016-04-01 00:00:00	30/54	tdemmer	02-04-2016	2016-04-02 00:00:00	30/56	Bensi	52.0284576	6.05260086	aan boom P-plaats Beekhuizenseweg	Rheden	Ge	\N	\N
1774	18-10-2014	2014-10-18 00:00:00	27/51	vuurbloed	18-10-2014	2014-10-18 00:00:00	27/52	Bigtwim	52.4136009	4.67902613	aan hek IJdijk	Spaarndam	NH	\N	\N
3659	09-09-2020	2020-09-09 00:00:00	40/815	FastEddy	12-09-2020	2020-09-12 00:00:00	40/817	SadBunny	51.3147964	3.35869098	aan poot reclamebord  	Sint Anna ter Muiden	Ze	\N	\N
594	21-10-2011	2011-10-21 00:00:00	12/92	tdemmer	21-10-2011	2011-10-21 00:00:00	12/92	Scoot_020/Scoot_2	51.9399872	4.85487318	achter bochtmarkering veerstoep, Gelkenes, ZH	Gelkenes	ZH	\N	\N
2351	05-03-2017	2017-03-05 00:00:00	33/74	Amauta	06-03-2017	2017-03-06 00:00:00	33/74	frankivo	53.2126427	6.5589242	onder brug prof H.C. van Hallpad	Groningen	Gr	\N	\N
2879	24-08-2018	2018-08-24 00:00:00	40/31	Coenster	24-08-2018	2018-08-24 00:00:00	40/32	HighKing	52.1549492	5.09553623	in bosje bij fietsknooppunt Kerkdijk	Westbroek	Ut	\N	\N
576	12-10-2011	2011-10-12 00:00:00	12/66	jaap43	13-10-2011	2011-10-13 00:00:00	12/68	Dirk130	52.0180397	4.67805099	aan hek - Wilhelminakade/Stoofkade, Gouda, ZH	Gouda	ZH	\N	\N
4266	19-11-2022	2022-11-19 00:00:00	41/314	pdv_moto	24-11-2022	2022-11-24 00:00:00	41/314	SwitchUp	51.5356445	3.43952298	aan plaatsnaambord Oude Zandweg	Westkapelle	Ze	\N	\N
2520	20-08-2017	2017-08-20 00:00:00	35/59	Amauta	21-08-2017	2017-08-21 00:00:00	35/60	Okami_Xci	53.1804581	7.22606993	in wilg - Europaweg	Bad Nieuweschans	Gr	\N	\N
1056	27-01-2013	2013-01-27 00:00:00	18/74	ootje	27-01-2013	2013-01-27 00:00:00	18/75	Bigtwim	52.5820045	4.67829323	bij e-kast - Zanddijk	Castricum	NH	\N	\N
2531	28-08-2017	2017-08-28 00:00:00	35/73	BSI	29-08-2017	2017-08-29 00:00:00	35/75	Rik60NL	52.1786156	5.59694815	aan hek naast fietspad	Voorthuizen	Ge	\N	\N
2937	27-10-2018	2018-10-27 00:00:00	40/96	FastEddy	28-10-2018	2018-10-28 00:00:00	40/96	Amauta	52.9791908	6.99168015	in wilg Gedempte Vleddermond	Stadskanaal	Gr	\N	\N
2996	27-01-2019	2019-01-27 00:00:00	40/183	Thijs67	27-01-2019	2019-01-27 00:00:00	40/183	FastEddy	52.1616249	5.27226686	aan E-kast, verl. Oude Utrechtseweg	Soest	Ut	\N	\N
1259	30-06-2013	2013-06-30 00:00:00	21/57	de peppel	01-07-2013	2013-07-01 00:00:00	21/58	Hasseman	52.2409935	6.66811085	aan Zodiac - Beldsweg	Ambt Delden	Ov	\N	\N
3603	31-07-2020	2020-07-31 00:00:00	40/758	Yosra87	01-08-2020	2020-08-01 00:00:00	40/759	Coenster	51.9231949	4.34588385	in perkje bij "Nooit meer Hiroshima"	Vlaardingen	ZH	\N	\N
4203	01-06-2022	2022-06-01 00:00:00	41/270	Kato	03-06-2022	2022-06-03 00:00:00	41/271	BSI	52.7223625	7.06400681	tegen landenbord Duitsland A37	Borger Compascuum	Dr	\N	\N
2251	25-09-2016	2016-09-25 00:00:00	32/30	Amauta	25-09-2016	2016-09-25 00:00:00	32/30	ArendJan	52.092392	5.3595171	aan boompje Trekerweg	Woudenberg	Ut	\N	\N
3886	23-04-2021	2021-04-23 00:00:00	41/052	HermanK	23-04-2021	2021-04-23 00:00:00	41/052	MeanYellowBoy	52.5422554	6.3724699	tegen boompje oude Woestendijk	Ommen	Ov	\N	\N
2486	14-07-2017	2017-07-14 00:00:00	35/17	Bomba	15-07-2017	2017-07-15 00:00:00	35/18	jaap43	52.0857048	4.89850092	bij paaltje in heg - Beneluxlaan	Woerden	Ut	\N	\N
1925	06-06-2015	2015-06-06 00:00:00	28/89	Rainbow600	07-06-2015	2015-06-07 00:00:00	28/89	BSI	51.4625473	5.56352091	aan hek toegang Eventsbakery	Nuenen	NB	\N	\N
3768	18-12-2020	2020-12-18 00:00:00	40/904	HighKing	18-12-2020	2020-12-18 00:00:00	40/904	Outdoor Man	52.5499115	4.72642517	aan hekpost Museumgemaal	Akersloot	NH	\N	\N
2851	08-08-2018	2018-08-08 00:00:00	40/04	pdv_moto	09-08-2018	2018-08-09 00:00:00	40/05	Roeleey	52.1079521	4.30306005	tegen boompje Pompstationsweg	Den Haag	ZH	\N	\N
1271	07-07-2013	2013-07-07 00:00:00	21/71	rvdh86	08-07-2013	2013-07-08 00:00:00	21/72	Sjantaalfoutje	52.172802	5.91298819	aan boom - Hoenderloseweg	Ugchelen	Ge	\N	\N
2678	25-03-2018	2018-03-25 00:00:00	37/94	Arriens	27-03-2018	2018-03-27 00:00:00	37/96	HighKing	52.0248146	5.97611618	onder afdak infoboor Rozendaalseweld	Rheden	Ge	\N	\N
206	22-01-2011	2011-01-22 00:00:00	6/43	scheurschuimpje	23-01-2011	2011-01-23 00:00:00	6/51	Buikschuiver oet Dre	52.8668594	6.126616	vlaggemast Zuiderweg 29, Vinkega, Fr	Vinkega	Fr	\N	\N
3891	28-04-2021	2021-04-28 00:00:00	41/056	Outdoor Man	29-04-2021	2021-04-29 00:00:00	41/057	HighKing	52.6326637	5.02099514	tegen hek op Iijsselmeerdijk	Hoorn	NH	\N	\N
703	13-02-2012	2012-02-13 00:00:00	14/45	Hasseman	15-02-2012	2012-02-15 00:00:00	14/48	CN	52.3557014	6.8425808	in heg bij Stiftskerk - Het Stift, Weerselo, Ov	Weerselo	Ov	\N	\N
3850	28-03-2021	2021-03-28 00:00:00	41/022	bikedan	28-03-2021	2021-03-28 00:00:00	41/022	pdv_moto	51.401989	4.23454285	onder brug Westelijke Spuikanaalweg	Rilland	Ze	\N	\N
2156	21-06-2016	2016-06-21 00:00:00	31/29	Scoot_020/Scoot_2	21-06-2016	2016-06-21 00:00:00	31/30	Sjakie-77	52.3409958	4.81188202	bij stadplan - Anderlechtlaan	Amsterdam	NH	\N	\N
182	29-12-2010	2010-12-29 00:00:00	5/67	hplaverda	30-12-2010	2010-12-30 00:00:00	5/71	BigJim	52.5720482	4.86178493	hekje Oostdijkje 7, de Rijp, NH	de Rijp	NH	\N	\N
2434	23-05-2017	2017-05-23 00:00:00	34/56	Rik60NL	24-05-2017	2017-05-24 00:00:00	34/57	Corney28	52.1306114	4.91133308	aan boom recreatieterrein Oortjespad	Kamerik	Ut	\N	\N
2552	21-09-2017	2017-09-21 00:00:00	36/04	SadBunny	21-09-2017	2017-09-21 00:00:00	36/05	pdv_moto	52.3691139	4.90261316	voor Hema - Joodenbreestraat	Amsterdam	NH	\N	\N
4074	16-12-2021	2021-12-16 00:00:00	41/187	Roeleey	16-12-2021	2021-12-16 00:00:00	41/187	pdv_moto	51.9673805	5.99350977	aan bord P-terrein Nieuwgraaf	Duiven	Ge	\N	\N
4114	06-02-2022	2022-02-06 00:00:00	41/212	Roeleey	06-02-2022	2022-02-06 00:00:00	41/212	Outdoor Man	52.3489838	4.94581985	tegen hek ingang Jaap Eden Ijsbaan	Amsterdam	NH	\N	\N
3387	19-02-2020	2020-02-19 00:00:00	40/571	frankivo	19-02-2020	2020-02-19 00:00:00	40/571	FastEddy	52.8932724	7.06494522	aan omheining kuilvoersilo, Hogeweg	Ter Apel	Gr	\N	\N
2768	28-05-2018	2018-05-28 00:00:00	39/02	MeanYellowBoy	28-05-2018	2018-05-28 00:00:00	39/03	Roeleey	52.6564331	6.906569	aan hek picknickplaats Oostersebos	Schoonebeek	Dr	\N	\N
648	01-12-2011	2011-12-01 00:00:00	13/63	BSI	02-12-2011	2011-12-02 00:00:00	13/64	rvdh86	52.1909027	5.60654116	in heg monument - Rubensstraat, Voorthuizen, Ge	Voorthuizen	Ge	\N	\N
2589	13-11-2017	2017-11-13 00:00:00	36/61	BSI	13-11-2017	2017-11-13 00:00:00	36/61	Rik60NL	52.3382988	4.87267399	in plantenbak Cyclespace - Zuidas	Amsterdam	NH	\N	\N
3688	03-10-2020	2020-10-03 00:00:00	40/837	Outdoor Man	03-10-2020	2020-10-03 00:00:00	40/837	Bensi	51.7692947	5.73108816	tegen paaltje bij bunker	Grave	NB	\N	\N
296	28-03-2011	2011-03-28 00:00:00	8/40	Scoot_020/Scoot_2	31-03-2011	2011-03-31 00:00:00	8/45	BSI	52.3053246	4.75770187	parkeergarage - Havenmeesterweg, Schiphol, NH	Schiphol	NH	\N	\N
4285	27-01-2023	2023-01-27 00:00:00	41/326	Amauta	04-02-2023	2023-02-04 00:00:00	41/327	FastEddy	53.3605461	6.2902379	tegen lantaarnpaal P-terein Hoofdstraat	Vierhuizen	Gr	\N	\N
4190	13-05-2022	2022-05-13 00:00:00	41/262	HighKing	14-05-2022	2022-05-14 00:00:00	41/263	Ronny Rabbelaar	52.7405624	6.91412401	aan hek B&B het Veurhuuske	Erica	Dr	\N	\N
2781	16-06-2018	2018-06-16 00:00:00	39/19	Roeleey	16-06-2018	2018-06-16 00:00:00	39/19	Outdoor Man	52.4116364	4.88170481	in struik Netwerkweg	Amsterdam	NH	\N	\N
1144	29-03-2013	2013-03-29 00:00:00	19/89	Ronald_010	30-03-2013	2013-03-30 00:00:00	19/90	Meifesto	51.8638115	4.31212521	aan km-bord - Brielse Maasdijk	Spijkenisse	ZH	\N	\N
181	28-12-2010	2010-12-28 00:00:00	5/64	honda_power	28-12-2010	2010-12-28 00:00:00	5/66	hplaverda	52.8809471	4.7148571	vuurtoren Groote Kaap, Julianadorp, NH	Julianadorp	NH	\N	\N
2563	12-10-2017	2017-10-12 00:00:00	36/26	Amauta	13-10-2017	2017-10-13 00:00:00	36/27	Janhertog	52.8544998	6.34627819	aan poot laadconstructie kalkoven	Dieverbrug	Dr	\N	\N
1667	15-06-2014	2014-06-15 00:00:00	26/42	MLB	16-06-2014	2014-06-16 00:00:00	26/43	frankwijers	51.9728546	3.97068691	op strand 2e Maasvlakte	Rotterdam	ZH	\N	\N
229	08-02-2011	2011-02-08 00:00:00	6/97	Scoot_020/Scoot_2	09-02-2011	2011-02-09 00:00:00	6/98	BSI	52.3637886	4.77219009	Lutkemeerweg 149, Amsterdam Osdorp, NH	Amsterdam	NH	\N	\N
2692	05-04-2018	2018-04-05 00:00:00	38/12	MeanYellowBoy	06-04-2018	2018-04-06 00:00:00	38/12	Ronny Rabbelaar	52.5990562	6.40131712	onder bank looppad Omloop	Balkbrug	Ov	\N	\N
3940	17-06-2021	2021-06-17 00:00:00	41/096	Picobello BV	17-06-2021	2021-06-17 00:00:00	41/096	Nelfrikandel	52.1278305	4.45666504	in groen achter kering, Leeuwenhoekkade	Voorschoten	ZH	\N	\N
4277	06-01-2023	2023-01-06 00:00:00	41/321	Roeleey	07-01-2023	2023-01-07 00:00:00	41/322	SwitchUp	52.2982101	4.98361015	in struik Vianenstraat	Amsterdam	NH	\N	\N
3145	14-06-2019	2019-06-14 00:00:00	40/356	ootje	14-06-2019	2019-06-14 00:00:00	40/357	MeanYellowBoy	52.5640678	4.66054106	in 35e knotwilg, Karhok	Castricum	NH	\N	\N
113	28-10-2010	2010-10-28 00:00:00	4/20	Wimis on	28-10-2010	2010-10-28 00:00:00	4/22	Quickly	52.0436287	5.18562222	Nieuw Wulven - Binnenweg, Houten, Ut	Houten	Ut	\N	\N
884	05-08-2012	2012-08-05 00:00:00	16/64	Outdoor Man	05-08-2012	2012-08-05 00:00:00	16/64	dks_aa	52.3802338	4.70978689	aan hek - Krommespieringweg	Zwanenburg	NH	\N	\N
1355	16-09-2013	2013-09-16 00:00:00	22/80	SparkViv	16-09-2013	2013-09-16 00:00:00	22/81	XJ Elff	51.8318901	4.39541101	aan bord Kerkhofsdijk	Spijkenisse	ZH	\N	\N
2452	09-06-2017	2017-06-09 00:00:00	34/77	SadBunny	10-06-2017	2017-06-10 00:00:00	34/78	Roeleey	52.385849	4.85683393	aan boom Sloterdijkerweg	Amsterdam	NH	\N	\N
971	02-11-2012	2012-11-02 00:00:00	17/60	Buuv	02-11-2012	2012-11-02 00:00:00	17/60	nannol	53.0116005	6.72006512	achter E-kast Torenweg	Eext	Dr	\N	\N
848	03-07-2012	2012-07-03 00:00:00	16/22	Hasseman	04-07-2012	2012-07-04 00:00:00	16/23	Bensi	51.9698257	6.27291393	bij kunstwerk Keppelseweg	Doetinchem	Ge	\N	\N
48	14-09-2010	2010-09-14 00:00:00	2/71	BrouwerER6N	14-09-2010	2010-09-14 00:00:00	2/72	J-oram	51.8455009	6.16604996	Spijksedijk, Spijk, Ge	Spijk	Ge	\N	\N
2515	16-08-2017	2017-08-16 00:00:00	35/51	Hjerteknuser	17-08-2017	2017-08-17 00:00:00	35/53	Rik60NL	52.5773468	4.65924215	in pol bij boom - Duinweg	Castricum	NH	\N	\N
47	12-09-2010	2010-09-12 00:00:00	2/68	Bensi	13-09-2010	2010-09-13 00:00:00	2/70	BrouwerER6N	52.1080666	6.49124908	brug Zwarteweg, Hall, Ge	Borculo	Ge	\N	\N
708	19-02-2012	2012-02-19 00:00:00	14/56	BSI	20-02-2012	2012-02-20 00:00:00	14/56	Hasseman	52.2499504	5.6278162	toren Schovenhorst - Garderenseweg, Putten, Ge 	Putten	Ge	\N	\N
1030	19-12-2012	2012-12-19 00:00:00	18/33	Hans89	21-12-2012	2012-12-21 00:00:00	18/33	tdemmer	51.6808205	4.36196995	in boom fort Prins Frederik	Ooltgensplaat	ZH	\N	\N
3146	14-06-2019	2019-06-14 00:00:00	40/358	MeanYellowBoy	15-06-2019	2019-06-15 00:00:00	40/358	HermanK	52.5529747	6.68393087	in perk Duitslandweg	Venebrugge	Ov	\N	\N
2372	04-04-2017	2017-04-04 00:00:00	33/96	Amauta	05-04-2017	2017-04-05 00:00:00	33/97	frankivo	53.4352341	6.58177805	aan steiger haven Noordpolderzijl	Usquert	Gr	\N	\N
853	07-07-2012	2012-07-07 00:00:00	16/27	Drey	07-07-2012	2012-07-07 00:00:00	16/27	BSI	51.5198364	5.2643609	Spoordonkseweg	Oirschot	NB	\N	\N
3510	24-05-2020	2020-05-24 00:00:00	40/675	Deeffox	25-05-2020	2020-05-25 00:00:00	40/675	Hans89	51.775238	4.65506601	tussen blokken rotonde Circus Maximum	Dordrecht	ZH	\N	\N
3993	24-07-2021	2021-07-24 00:00:00	41/133	jaap43	24-07-2021	2021-07-24 00:00:00	41/133	Hans89	51.9557419	4.40326405	omnder aan trap uitzichtpunt Tempelweg	Rotterdam	ZH	\N	\N
3942	18-06-2021	2021-06-18 00:00:00	41/097	BSI	19-06-2021	2021-06-19 00:00:00	41/097	Bensi	52.0326996	5.92890787	tegen boom bij fietsbrug over de A50	Arnhem	Ge	\N	\N
2448	05-06-2017	2017-06-05 00:00:00	34/72	Wimis on	05-06-2017	2017-06-05 00:00:00	34/72	jaap43	51.9876633	5.24531889	achter E-kast Kanaaldijk Zuid	Houten	Ut	\N	\N
3305	15-11-2019	2019-11-15 00:00:00	40/511	Carburateur	15-11-2019	2019-11-15 00:00:00	40/511	pdv_moto	50.823288	5.66514778	tegen struik Zeenendaalweg	Maastricht	Li	\N	\N
1577	30-03-2014	2014-03-30 00:00:00	25/50	SadBunny	31-03-2014	2014-03-31 00:00:00	25/51	Corney28	52.366291	4.95983315	in afwatergat brug Zuiderzeeweg	Amsterdam	NH	\N	\N
2769	29-05-2018	2018-05-29 00:00:00	39/04	Roeleey	31-05-2018	2018-05-31 00:00:00	39/05	BSI	51.315155	3.35803199	aan boom langs grens Belgie	St. Anna ter Muiden	Ze	\N	\N
3186	31-07-2019	2019-07-31 00:00:00	40/400	HermanK	01-08-2019	2019-08-01 00:00:00	40/402	MeanYellowBoy	52.5171928	6.41993189	in heg p-plaats Zwolseweg	Ommen	Ov	\N	\N
2752	10-05-2018	2018-05-10 00:00:00	38/80	Outdoor Man	10-05-2018	2018-05-10 00:00:00	38/80	vuurbloed	52.2954521	4.87976408	aan stammetje P-terrein Krijgsman	Amstelveen	NH	\N	\N
1881	12-04-2015	2015-04-12 00:00:00	28/50	Djoost	12-04-2015	2015-04-12 00:00:00	28/51	JurgenT	52.1601372	5.98519993	bij huisnummerpaaltje - Dorpsstraat	Lieren	Ge	\N	\N
2020	02-10-2015	2015-10-02 00:00:00	29/74	jaap43	03-10-2015	2015-10-03 00:00:00	29/75	Amauta	51.6564178	5.15232086	in bord Giersbergen	Giersbergen	NB	\N	\N
3605	02-08-2020	2020-08-02 00:00:00	40/761	BSI	02-08-2020	2020-08-02 00:00:00	40/761	MP_NL	52.2913818	6.61189985	aan paaltje Reintszijweg	Enter	Ov	\N	\N
3496	11-05-2020	2020-05-11 00:00:00	40/663	DKP	16-05-2020	2020-05-16 00:00:00	40/664	Ronald_010	50.7662659	5.84852791	tegen muurtje kappel Schilbergerweg	Slenaken	Li	\N	\N
1116	16-03-2013	2013-03-16 00:00:00	19/54	Bensi	17-03-2013	2013-03-17 00:00:00	19/57	SadBunny	52.0320435	6.64778519	bij muur - Oude Winterswijkseweg	Groenlo	Ge	\N	\N
928	19-09-2012	2012-09-19 00:00:00	17/06	Hasseman	20-09-2012	2012-09-20 00:00:00	17/06	MotorMieke	52.2976952	6.83733177	bij tuincentrum - Vliegveldweg	Deurningen	Ov	\N	\N
1213	17-05-2013	2013-05-17 00:00:00	20/92	Bigtwim	17-05-2013	2013-05-17 00:00:00	20/93	Corney28	52.5101204	4.67146111	in heg op kerkhof - Kerkplein	Heemskerk	NH	\N	\N
350	27-04-2011	2011-04-27 00:00:00	9/36	lichthuis	28-04-2011	2011-04-28 00:00:00	9/37	scheurschuimpje	52.336834	5.87182808	het verscholen dorp - Pas-opweg, Nunspeet, Ge	Nunspeet	Ge	\N	\N
2239	16-09-2016	2016-09-16 00:00:00	32/16	Amauta	17-09-2016	2016-09-17 00:00:00	32/18	BornToReign	52.6372643	6.07971001	aan boom bij brug	Zwartsluis	Ov	\N	\N
3919	02-06-2021	2021-06-02 00:00:00	41/083	BigJim	02-06-2021	2021-06-02 00:00:00	41/083	Outdoor Man	52.4185448	4.73568821	tegen heg Lancastermonumrnt	Amsterdam	NH	\N	\N
881	03-08-2012	2012-08-03 00:00:00	16/62	rvdh86	04-08-2012	2012-08-04 00:00:00	16/62	BSI	52.251976	5.43869591	bij vuilcontainer gemaal Reynout	Nijkerk	Ge	\N	\N
894	10-08-2012	2012-08-10 00:00:00	16/72	JurgenT	10-08-2012	2012-08-10 00:00:00	16/72	Merc_xtz750	51.8518257	6.3982358	aan brug - Landfortseweg	Megchelen	Ge	\N	\N
564	05-10-2011	2011-10-05 00:00:00	12/49	BSI	05-10-2011	2011-10-05 00:00:00	12/51	Scoot_020/Scoot_2	52.3366241	4.84657192	aan steiger Jaagpad - Nieuwe Meer, A'dam, NH	Amsterdam	NH	\N	\N
3712	21-10-2020	2020-10-21 00:00:00	40/855	Outdoor Man	22-10-2020	2020-10-22 00:00:00	40/856	HighKing	52.4794922	4.65138912	achter gashuisje Rode Kruis Ziekenhuis	Beverwijk	NH	\N	\N
4374	10-07-2023	2023-07-10 00:00:00	41/384	Picobello BV	10-07-2023	2023-07-10 00:00:00	41/384	Coenster	52.1679878	4.60058689	tegen struikje P-plaats N446	Hoogmade	ZH	\N	\N
2269	09-10-2016	2016-10-09 00:00:00	32/56	Ronald_010	09-10-2016	2016-10-09 00:00:00	32/57	tdemmer	52.0814819	4.60137796	aan bruggehoofd - 3e Tocht	Hazerswoude-Dorp	ZH	\N	\N
376	17-05-2011	2011-05-17 00:00:00	9/84	ndeeka	18-05-2011	2011-05-18 00:00:00	9/85	lynx84	51.8341331	4.53650618	bij uillestam - Achterzeedijk, Barendrecht, ZH	Barendrecht	ZH	\N	\N
4040	01-10-2021	2021-10-01 00:00:00	41/162	HermanK	03-10-2021	2021-10-03 00:00:00	41/162	Outdoor Man	50.7690086	5.80686903	tegen paaltje Martelehöfke	Noorbeek	Li	\N	\N
3705	17-10-2020	2020-10-17 00:00:00	40/849	Hans89	17-10-2020	2020-10-17 00:00:00	40/850	Outdoor Man	51.9404259	4.52689695	tegen boom hertenkam Boszoom	Rotterdam	ZH	\N	\N
1462	05-01-2014	2014-01-05 00:00:00	24/21	Blogem	06-01-2014	2014-01-06 00:00:00	24/23	Scoot_020/Scoot_2	52.4341202	5.08884287	aan hek bij windmolens - Zeedijk	Uitdam	NH	\N	\N
1068	06-02-2013	2013-02-06 00:00:00	18/95	Ronald_010	06-02-2013	2013-02-06 00:00:00	18/95	Meifesto	51.9487686	4.41370106	achter muurtje Matlingeweg	Rotterdam	ZH	\N	\N
1481	17-01-2014	2014-01-17 00:00:00	24/43	Vins111	18-01-2014	2014-01-18 00:00:00	24/43	BSI	52.1137886	5.2908349	aan hek Kampweg	Soesterberg	Ut	\N	\N
1447	19-12-2013	2013-12-19 00:00:00	24/07	Hans89	22-12-2013	2013-12-22 00:00:00	24/09	bikedan	51.4634094	3.60335398	aan brug in ringwal	Oost-Souburg	Ze	\N	\N
3604	01-08-2020	2020-08-01 00:00:00	40/759	Coenster	01-08-2020	2020-08-01 00:00:00	40/760	BSI	52.2307358	4.66915083	aan poot knooppuntenbord	Leimuiderbrug	NH	\N	\N
2015	21-09-2015	2015-09-21 00:00:00	29/68	BSI	22-09-2015	2015-09-22 00:00:00	29/69	Bigtwim	52.3246498	4.93851089	achter stalling - Rijksstraatweg	Duivendrecht	NH	\N	\N
4329	24-04-2023	2023-04-24 00:00:00	41/354	pdv_moto	29-04-2023	2023-04-29 00:00:00	41/355	SwitchUp	51.5396233	3.44972491	achter pallisade kijkscherm Slaakweg	Weskapelle	Ze	\N	\N
634	19-11-2011	2011-11-19 00:00:00	13/48	bakfiets1	20-11-2011	2011-11-20 00:00:00	13/49	meijlie-style	51.426548	4.35384989	schoorsteen bunker Buitendreef, Hoogerheide, NB	Hoogerheide	NB	\N	\N
989	11-11-2012	2012-11-11 00:00:00	17/85	Ronald_010	11-11-2012	2012-11-11 00:00:00	17/85	V-Strommert	51.8422737	4.42279291	aan infobord Oude Maaspad	Rhoon	ZH	\N	\N
214	31-01-2011	2011-01-31 00:00:00	7/73	BigJim	31-01-2011	2011-01-31 00:00:00	6/74	horney	52.3771667	4.78173494	hek Joris van den Berghweg, Amsterdam, NH	Amsterdam	NH	\N	\N
614	06-11-2011	2011-11-06 00:00:00	13/25	Ronald_010	06-11-2011	2011-11-06 00:00:00	13/27	wesleyc	51.9034576	4.44837379	onder steiger Schiehaven, Rotterdam, ZH	Rotterdam	ZH	\N	\N
3504	20-05-2020	2020-05-20 00:00:00	40/668	Outdoor Man	21-05-2020	2020-05-21 00:00:00	40/669	pdv_moto	52.1210175	5.14109278	in bosje P-terrein Gageldijk	Groenekan	Ut	\N	\N
958	20-10-2012	2012-10-20 00:00:00	17/43	Meifesto	21-10-2012	2012-10-21 00:00:00	17/44	tdemmer	51.9120255	4.56254816	achter kast - Sonarstraat	Capelle aan den Ijssel	ZH	\N	\N
2830	24-07-2018	2018-07-24 00:00:00	39/79	Roeleey	25-07-2018	2018-07-25 00:00:00	39/79	HighKing	52.2973633	4.94899797	in E-kast Muntbergweg	Amsterdam	NH	\N	\N
2646	22-02-2018	2018-02-22 00:00:00	37/53	pdv_moto	25-02-2018	2018-02-25 00:00:00	37/55	Amauta	51.9305992	6.71419191	achter bloembak Gosselinkweg	Woold	Ge	\N	\N
2357	17-03-2017	2017-03-17 00:00:00	33/77	BSI	18-03-2017	2017-03-18 00:00:00	33/79	Ronald_010	52.1344337	5.27681589	onder plankier Nat. Mil. Museum	Soesterberg	Ut	\N	\N
1269	06-07-2013	2013-07-06 00:00:00	21/70	Smurfke RF	07-07-2013	2013-07-07 00:00:00	21/70	BSI	52.0836639	6.24692822	aan boom - Toverstraat /Vordenseweg	Baak	Ge	\N	\N
1039	31-12-2012	2012-12-31 00:00:00	18/42	Ronald_010	01-01-2013	2013-01-01 00:00:00	18/42	motorex	51.8647041	5.12194109	aan ANWB-paal - Tiendweg	Herwijnen	Ge	\N	\N
1155	03-04-2013	2013-04-03 00:00:00	20/05	Mr.Bean	04-04-2013	2013-04-04 00:00:00	20/07	Bludge	51.9042969	6.15283108	grenssteen - Veldhuizenseweg	Babberich	Ge	\N	\N
2153	16-06-2016	2016-06-16 00:00:00	31/26	Amauta	16-06-2016	2016-06-16 00:00:00	31/26	jaap43	52.9114227	6.80638313	in boom - Zwijnsdrift	Ees	Dr	\N	\N
1255	28-06-2013	2013-06-28 00:00:00	21/54	Phaedrus	28-06-2013	2013-06-28 00:00:00	21/54	piertje moffel	52.2938309	6.14001608	aan hek Kerkpad	Diepenveen	Ov	\N	\N
1893	28-04-2015	2015-04-28 00:00:00	28/63	Bigtwim	28-04-2015	2015-04-28 00:00:00	28/63	Artemecion	52.6049385	4.71256495	achter muur Witte Kerk - Heerenweg	Heiloo	NH	\N	\N
2812	10-07-2018	2018-07-10 00:00:00	39/57	jaap43	10-07-2018	2018-07-10 00:00:00	39/57	WillyvD	51.5897484	4.49853277	achter E-kast Standdaarbuitenseweg	Oud-Gastel	NB	\N	\N
963	25-10-2012	2012-10-25 00:00:00	17/49	jaap43	25-10-2012	2012-10-25 00:00:00	17/49	Bar-E	51.8913269	4.223176	achter boom P-terrein - Visserijweg	Brielle	ZH	\N	\N
3663	13-09-2020	2020-09-13 00:00:00	40/818	SadBunny	14-09-2020	2020-09-14 00:00:00	40/818	HighKing	52.3888206	4.75436115	tegen hek Zijkanaal F	Halfweg	NH	\N	\N
2775	09-06-2018	2018-06-09 00:00:00	39/14	BSI	11-06-2018	2018-06-11 00:00:00	39/15	Roeleey	51.4716301	5.07827711	achter E-kast bij grenspaal NB 209	Hilvarenbeek	NB	\N	\N
2582	05-11-2017	2017-11-05 00:00:00	36/50	jaap43	06-11-2017	2017-11-06 00:00:00	36/51	Bomba	51.9471893	4.3210001	tegen betonrand a/d Vliet	Schipluiden	ZH	\N	\N
2145	06-06-2016	2016-06-06 00:00:00	31/19	SadBunny	07-06-2016	2016-06-07 00:00:00	31/19	BSI	52.331295	4.9004488	aan vangrail - Ringweg Zuid	Amsterdam	NH	\N	\N
2344	27-02-2017	2017-02-27 00:00:00	33/66	HermanK	28-02-2017	2017-02-28 00:00:00	33/67	pdv_moto	52.5560188	6.39763498	bij Koningslinde Balkerweg	Witharen	Ov	\N	\N
3046	19-03-2019	2019-03-19 00:00:00	40/248	Schwenneh	19-03-2019	2019-03-19 00:00:00	40/248	Coenster	52.3395996	4.74096298	aan hek Hoofdweg	Lijnden	NH	\N	\N
1491	25-01-2014	2014-01-25 00:00:00	24/53	Hans89	27-01-2014	2014-01-27 00:00:00	24/55	tdemmer	51.3071022	3.63314199	bij monument Isabellaweg	IJzendijke	Ze	\N	\N
4123	11-02-2022	2022-02-11 00:00:00	41/217	Outdoor Man	11-02-2022	2022-02-11 00:00:00	41/218	Coenster	52.2791557	4.87489891	onder trap circuswagen, de Afslag	Amstelveen	NH	\N	\N
3606	02-08-2020	2020-08-02 00:00:00	40/761	MP_NL	03-08-2020	2020-08-03 00:00:00	40/762	Okami_Xci	52.1814461	6.87754488	tgen boom Bruninkstraat	Enschede	Ov	\N	\N
3293	02-11-2019	2019-11-02 00:00:00	40/499	ey-dzeej	02-11-2019	2019-11-02 00:00:00	40/500	Picobello BV	51.9323311	4.43737507	achter kastje onder Klein Polderplein	Rotterdam	ZH	\N	\N
198	16-01-2011	2011-01-16 00:00:00	6/15	GroteVoet	16-01-2011	2011-01-16 00:00:00	6/16	BSI	52.2312851	5.234025	verkoopbord Heidelaan, Eemnes, Ut	Eemnes	Ut	\N	\N
618	08-11-2011	2011-11-08 00:00:00	13/30	tdemmer	08-11-2011	2011-11-08 00:00:00	13/31	Shadowski	52.1491508	5.99970293	aan boom zandput - Hulhorstweg, Beekbergen, Ge	Beekbergen	Ge	\N	\N
3951	23-06-2021	2021-06-23 00:00:00	41/102	ootje	23-06-2021	2021-06-23 00:00:00	41/103	BigJim	52.4808617	4.80902004	aan steiger bij Club Showboat	Wormerveer	NH	\N	\N
9	22-08-2010	2010-08-22 00:00:00	1/22	BrouwerER6N	22-08-2010	2010-08-22 00:00:00	1/23	Mckay1	52.1854172	6.88907099	Stroinksweg, Enschede, Ov	Enschede	Ov	\N	\N
1731	03-09-2014	2014-09-03 00:00:00	27/16	Rainbow600	04-09-2014	2014-09-04 00:00:00	27/16	Bomba	52.1680565	4.92950583	onder picknincktafel Dooijersluis	Ronde Venen	Ut	\N	\N
4011	24-08-2021	2021-08-24 00:00:00	41/145	Springbok	25-08-2021	2021-08-25 00:00:00	41/145	BSI	51.9344025	5.69948292	tegen paaltje Molenstraat	Hemmen	Ge	\N	\N
304		0001-01-01 00:00:00 BC				0001-01-01 00:00:00 BC		Miss2	\N	\N				\N	\N
491	06-08-2011	2011-08-06 00:00:00	11/39	scheurschuimpje	07-08-2011	2011-08-07 00:00:00	11/39	Hasseman	52.8456841	6.18857479	op rotonde in N855 - Vledderweg, Vledder, Dr	Vledder	Dr	\N	\N
1041	01-01-2013	2013-01-01 00:00:00	18/44	tdemmer	01-01-2013	2013-01-01 00:00:00	18/45	SadBunny	51.9549026	4.72661018	aan muurtje Benedenheulseweg	Stolwijk	ZH	\N	\N
3807	17-02-2021	2021-02-17 00:00:00	40/936	MeanYellowBoy	18-02-2021	2021-02-18 00:00:00	40/937	HermanK	52.5612907	6.39583015	tegen paal Balkerweg	Witharen	Ov	\N	\N
3934	13-06-2021	2021-06-13 00:00:00	41/092	MeanYellowBoy	13-06-2021	2021-06-13 00:00:00	41/092	HermanK	52.6003685	6.3959012	onder vlaggemast van school de Omloop	Balkbrug	Ov	\N	\N
1341	04-09-2013	2013-09-04 00:00:00	22/63	Dirk130	04-09-2013	2013-09-04 00:00:00	22/63	Guvner	51.9837189	4.10971594	aan km 1031 - Noorderhoofd	Hoek van Holland	ZH	\N	\N
1286	19-07-2013	2013-07-19 00:00:00	21/92	BSI	20-07-2013	2013-07-20 00:00:00	21/93	Sjantaalfoutje	52.1930618	5.80136919	achter E-kast Asselseweg	Kootwijk	Ge	\N	\N
1770	12-10-2014	2014-10-12 00:00:00	27/47	Blogem	13-10-2014	2014-10-13 00:00:00	27/48	Bigtwim	52.6620369	4.82820606	in bosje Middenwaard	Heerhugowaard	NH	\N	\N
1830	22-01-2015	2015-01-22 00:00:00	28/04	Phaedrus	24-01-2015	2015-01-24 00:00:00	28/05	Ronald_010	51.8827744	4.55297709	onder struik - Kouwenoord	Rotterdam	ZH	\N	\N
1659	05-06-2014	2014-06-05 00:00:00	26/34	TwoFace B	06-06-2014	2014-06-06 00:00:00	26/34	Ronald_010	52.0189095	4.31990385	aan hek Noordhoornseweg	den Hoorn	ZH	\N	\N
1472	12-01-2014	2014-01-12 00:00:00	24/33	Ronald_010	12-01-2014	2014-01-12 00:00:00	24/34	Scoot_020/Scoot_2	51.8772583	4.50409079	aan hek E-verdeelsation - Slinge	Rotterdam	ZH	\N	\N
4228	03-08-2022	2022-08-03 00:00:00	41/285	scheurschuimpje	05-08-2022	2022-08-05 00:00:00	41/286	FastEddy	52.80196	5.63461781	bij fietsknooppunt 9, Noordermeerpad	Rutten	Fl	\N	\N
3841	23-03-2021	2021-03-23 00:00:00	41/015	Outdoor Man	23-03-2021	2021-03-23 00:00:00	41/016	HighKing	52.3887863	4.735322	tegen ifopaaltje Batterijweg	Halfweg	NH	\N	\N
2614	08-01-2018	2018-01-08 00:00:00	36/99	pdv_moto	12-01-2018	2018-01-12 00:00:00	37/03	-Floris-	51.5226097	3.44163203	bij trap KNRM-loods	Westkapelle	Ze	\N	\N
3449	10-04-2020	2020-04-10 00:00:00	40/626	Deeffox	10-04-2020	2020-04-10 00:00:00	40/627	Hans89	51.8169746	4.74847603	tegen boomstronk Vogelaarsweg	Dordrecht	ZH	\N	\N
4092	11-01-2022	2022-01-11 00:00:00	41/198	Outdoor Man	11-01-2022	2022-01-11 00:00:00	41/198	Coenster	52.3285484	4.78420782	in struik  bij bushalte Schipholweg	Badhoevedorp	NH	\N	\N
706	17-02-2012	2012-02-17 00:00:00	14/52	Foncelot	18-02-2012	2012-02-18 00:00:00	14/53	MotorMieke	52.2278519	6.98597097	achter kapelletje klooster St. Ephrem, Losser, Ov	Losser	Ov	\N	\N
2901	14-09-2018	2018-09-14 00:00:00	40/54	HighKing	14-09-2018	2018-09-14 00:00:00	40/54	Coenster	52.5965004	4.70844793	heg achter poortje Kennemerstraatweg	Heiloo	NH	\N	\N
585	15-10-2011	2011-10-15 00:00:00	12/77	Phaedrus	15-10-2011	2011-10-15 00:00:00	12/77	ndeeka	51.8772163	4.54716682	aan vlonder in park Prinsendijk, Rotterdam, ZH	Rotterdam	ZH	\N	\N
4269	01-12-2022	2022-12-01 00:00:00	41/316	Scoot_020	02-12-2022	2022-12-02 00:00:00	41/316	Outdoor Man	52.3163948	4.81639624	tegen bord Nieuwe Meerdijk	Badhoevedorp	NH	\N	\N
3354	16-01-2020	2020-01-16 00:00:00	40/548	DKP	16-01-2020	2020-01-16 00:00:00	40/548	Sjefman	51.3762894	4.3929472	aan hek Noordweg / Herenbaan	Putte	NB	\N	\N
4072	11-12-2021	2021-12-11 00:00:00	41/185	Hans89	12-12-2021	2021-12-12 00:00:00	41/185	pdv_moto	51.9149284	4.57535124	tegen gaas hek Nijverheidsstraat	Capelle aan den Ijssel	ZH	\N	\N
3338	24-12-2019	2019-12-24 00:00:00	40/536	Amauta	24-12-2019	2019-12-24 00:00:00	40/537	Ronny Rabbelaar	53.2063904	6.6145792	onder hoogholt Hooghoudtstraat	Groningen	Gr	\N	\N
1080	16-02-2013	2013-02-16 00:00:00	19/08	Hasseman	16-02-2013	2013-02-16 00:00:00	19/08	MotorMieke	52.2973976	6.77896976	bij kapelletje Tuinlaan	Hengelo	Ov	\N	\N
291	25-03-2011	2011-03-25 00:00:00	8/32	d-s	25-03-2011	2011-03-25 00:00:00	8/33	Hansss	52.7121925	4.64087915	GSM-mast Hargerstrandweg, Schoorl, NH	Schoorl	NH	\N	\N
777	15-04-2012	2012-04-15 00:00:00	15/33	Merc_xtz750	16-04-2012	2012-04-16 00:00:00	15/33	Bensi	51.9041557	6.43982315	bij zuil Arcadia - Kasteellaan 4, Sinderen, Ge	Sinderen	Ge	\N	\N
3817	28-02-2021	2021-02-28 00:00:00	40/944	FastEddy	01-03-2021	2021-03-01 00:00:00	40/944	pdv_moto	52.1058083	5.42719507	tegen boom bij stootblok Leusbroekerweg	Leusden	Ut	\N	\N
2342	25-02-2017	2017-02-25 00:00:00	33/62	pdv_moto	25-02-2017	2017-02-25 00:00:00	33/63	Amauta	53.2317276	7.20729494	onder betonnen balk	Nieuw Statenzijl	Gr	\N	\N
2627	27-01-2018	2018-01-27 00:00:00	37/20	HighKing	27-01-2018	2018-01-27 00:00:00	37/20	pdv_moto	52.295845	5.16305017	achter regenpijp Grote Kerk	Naarden	NH	\N	\N
3251	27-09-2019	2019-09-27 00:00:00	40/466	Coenster	27-09-2019	2019-09-27 00:00:00	40/467	pdv_moto	52.2961311	4.50588417	tegen boom zweefvliegveld	Noordwijk	ZH	\N	\N
2026	09-10-2015	2015-10-09 00:00:00	29/79	tdemmer	09-10-2015	2015-10-09 00:00:00	29/79	Ronald_010	51.9751511	4.54681206	onder berk - Ivoorzwampad	Rotterdam	ZH	\N	\N
639	26-11-2011	2011-11-26 00:00:00	13/54	jaap43	26-11-2011	2011-11-26 00:00:00	13/55	wesleyc	52.0213623	4.38812208	aan hek bij molen - Noordeindseweg, Delfgauw, ZH	Delfgauw	ZH	\N	\N
1379	01-10-2013	2013-10-01 00:00:00	23/24	evolver86	02-10-2013	2013-10-02 00:00:00	23/25	Wimis on	52.0561256	5.1661458	aan hoekpaal bij fort - Marsdijk	Bunnik	Ut	\N	\N
580	13-10-2011	2011-10-13 00:00:00	12/70	bakfiets1	13-10-2011	2011-10-13 00:00:00	12/70	wesleyc	51.6554565	4.85767603	onder brug kasteelpark Strijen, Oosterhout, NB	Oosterhout	NB	\N	\N
1884	14-04-2015	2015-04-14 00:00:00	28/53	frankivo	15-04-2015	2015-04-15 00:00:00	28/54	leeqnl	52.9422569	6.61300707	aan boom - Amerweg	Amen	Dr	\N	\N
1683	14-07-2014	2014-07-14 00:00:00	26/61	Chakotay	16-07-2014	2014-07-16 00:00:00	26/63	Sjantaalfoutje	52.1819801	5.42079115	op heuveltje - Lübeckweg	Amersfoort	Ut	\N	\N
3379	11-02-2020	2020-02-11 00:00:00	40/565	pdv_moto	12-02-2020	2020-02-12 00:00:00	40/566	ey-dzeej	52.096653	4.26526499	in bloembak Hellingweg	Scheveningen	ZH	\N	\N
4179	02-05-2022	2022-05-02 00:00:00	41/255	BSI	02-05-2022	2022-05-02 00:00:00	41/255	Ronald_010	51.4459534	5.87221718	in fietsenstalling Toon Kortoompark	Deurne	NB	\N	\N
1166	12-04-2013	2013-04-12 00:00:00	20/26	Corney28	12-04-2013	2013-04-12 00:00:00	20/27	Roeleey	50.8499413	5.70190382	aan paal Wilhelminasingel	Maastricht	Li	\N	\N
2213	26-08-2016	2016-08-26 00:00:00	31/90	Motormuisje_alice	26-08-2016	2016-08-26 00:00:00	31/91	pdv_moto	51.868042	4.32803679	aan bord  bij Botlekbrug	Rotterdam	ZH	\N	\N
3325	14-12-2019	2019-12-14 00:00:00	40/528	Sjefman	15-12-2019	2019-12-15 00:00:00	40/528	pdv_moto	51.4922409	4.25925493	onder laatste trede trap fort Waterschans	Bergen op Zoom	NB	\N	\N
2728	27-04-2018	2018-04-27 00:00:00	38/58	Hjerteknuser	27-04-2018	2018-04-27 00:00:00	38/59	FastEddy	52.7249031	6.88331413	aan hek v/d Valk-hotel	Nieuw-Amsterdam	Dr	\N	\N
2719	20-04-2018	2018-04-20 00:00:00	38/44	HermanK	20-04-2018	2018-04-20 00:00:00	38/45	Ronny Rabbelaar	52.5987625	6.37847281	bij Brugkerk het Bastion	Balkbrug	Ov	\N	\N
504	18-08-2011	2011-08-18 00:00:00	11/54	vuurbloed	18-08-2011	2011-08-18 00:00:00	11/55	Scoot_020/Scoot_2	52.2894859	4.72325993	balie McDonald's A4 - Vuursteen, Hoofddorp, NH	Hoofddorp	NH	\N	\N
3247	23-09-2019	2019-09-23 00:00:00	40/463	Outdoor Man	24-09-2019	2019-09-24 00:00:00	40/464	Roeleey	52.3855782	4.84579706	tegen putrand Molenwerf	Amsterdam	NH	\N	\N
885	05-08-2012	2012-08-05 00:00:00	16/65	dks_aa	06-08-2012	2012-08-06 00:00:00	16/65	ootje	52.5075645	4.78943014	in hoek Brokking - Noorddijk	Wormerveer	NH	\N	\N
3298	08-11-2019	2019-11-08 00:00:00	40/505	Amauta	09-11-2019	2019-11-09 00:00:00	40/506	Ronald_010	51.8967552	6.58478594	in berm Hamaland route	Aalten	Ge	\N	\N
112	26-10-2010	2010-10-26 00:00:00	4/16	Yamahahahaha	27-10-2010	2010-10-27 00:00:00	4/19	Wimis on	52.6879387	5.25267696	Broekerhaven, Bovenkarspel, NH	Bovenkarspel	NH	\N	\N
4214	29-06-2022	2022-06-29 00:00:00	41/278	Outdoor Man	01-07-2022	2022-07-01 00:00:00	41/278	FastEddy	52.3128853	4.88767195	tegen boom natuurgebied Middenpolder	Amstelveen	NH	\N	\N
3884	18-04-2021	2021-04-18 00:00:00	41/048	pdv_moto	22-04-2021	2021-04-22 00:00:00	41/050	tdemmer	51.5277214	3.44097495	achter muurtje Moriakerk, Markt	Westkapelle	Ze	\N	\N
666	21-12-2011	2011-12-21 00:00:00	13/86	BSI	22-12-2011	2011-12-22 00:00:00	13/87	Scoot_020/Scoot_2	52.2091217	5.14568901	achter muurtje - Loosdrechtse bos, Hilversum, Ut	Hilversum	Ut	\N	\N
741	17-03-2012	2012-03-17 00:00:00	14/93	Ronald_010	17-03-2012	2012-03-17 00:00:00	14/93	tdemmer	51.9904175	4.8008132	aan hek langs Westvlisserdijk, Vlist, ZH	Vlist	ZH	\N	\N
1533	01-03-2014	2014-03-01 00:00:00	25/05	tdemmer	02-03-2014	2014-03-02 00:00:00	25/06	Bomba	52.021183	4.94302082	aan knotwilg - Blokland	Montfoort	Ut	\N	\N
3988	22-07-2021	2021-07-22 00:00:00	41/130	HighKing	22-07-2021	2021-07-22 00:00:00	41/130	ootje	52.4943047	4.76638699	tegen flitspaal N203 - Vlietsend	Krommenie	NH	\N	\N
2419	13-05-2017	2017-05-13 00:00:00	34/43	Eztys	13-05-2017	2017-05-13 00:00:00	34/43	Amauta	53.2450714	6.53468609	achter paaltje de Mudden	Groningen	Gr	\N	\N
415		0001-01-01 00:00:00 BC				0001-01-01 00:00:00 BC		swordsdance	\N	\N				\N	\N
2685	01-04-2018	2018-04-01 00:00:00	38/05	Roeleey	01-04-2018	2018-04-01 00:00:00	38/05	Rik60NL	52.302578	4.84775782	achter struiken Bouwenland	Amstelveen	NH	\N	\N
4353	08-06-2023	2023-06-08 00:00:00	41/371	Hans89	09-06-2023	2023-06-09 00:00:00	41/372	jaap43	51.9055519	4.53904486	in damwandkoker van Oord Schaardijk	Rotterdam	ZH	\N	\N
1016		0001-01-01 00:00:00 BC				0001-01-01 00:00:00 BC		Spike1982	\N	\N				\N	\N
191	12-01-2011	2011-01-12 00:00:00	6/2	ootje	12-01-2011	2011-01-12 00:00:00	6/2	mr Q	52.0347672	5.11429691	Plofsluis - Heemsteedsebrug, Nieuwegein, Ut	Nieuwegein	Ut	\N	\N
2464	21-06-2017	2017-06-21 00:00:00	34/91	frankivo	23-06-2017	2017-06-23 00:00:00	34/92	Amauta	52.973835	6.54450417	in heg bocht de Haar TT-circuit	Assen	Dr	\N	\N
77	01-10-2010	2010-10-01 00:00:00	3/35	I-accelarate	01-10-2010	2010-10-01 00:00:00	3/37	Bart#89!	53.2228851	7.19713879	schotbalkenhuisje, Stadspolder, Gr	Stadspolder	Gr	\N	\N
4152	25-03-2022	2022-03-25 00:00:00	41/238	bikedan	26-03-2022	2022-03-26 00:00:00	41/239	BadBert	51.3938942	4.32275295	in hoek P-terrein Kerkstraat	Ossendrecht	NB	\N	\N
3063	31-03-2019	2019-03-31 00:00:00	40/258	SadBunny	02-04-2019	2019-04-02 00:00:00	40/260	Roeleey	53.0440865	4.85585499	onder vlonder uitkijktoren de Haven	Oude Schild	NH	\N	\N
1336	01-09-2013	2013-09-01 00:00:00	22/57	Bensi	02-09-2013	2013-09-02 00:00:00	22/59	Hasseman	52.3648376	6.44194889	achter bank Sallandse Heuvelrug	Nijverdal	Ov	\N	\N
1704	29-07-2014	2014-07-29 00:00:00	26/83	Dirtbag	30-07-2014	2014-07-30 00:00:00	26/84	frankivo	52.2786827	6.10811901	aan paaltje bij hek - Bandijk	Terwolde	Ge	\N	\N
2572	20-10-2017	2017-10-20 00:00:00	36/37	Amauta	27-10-2017	2017-10-27 00:00:00	36/40	BSI	53.0820122	6.26561594	aan uitkijktoren	Bakkeveen	Fr	\N	\N
1620	02-05-2014	2014-05-02 00:00:00	25/90	Bigtwim	02-05-2014	2014-05-02 00:00:00	25/90	Ronald_010	52.5248337	5.064713	in brievenbus nr. 5 - Zeevangsedijk	Edam	NH	\N	\N
1143	29-03-2013	2013-03-29 00:00:00	19/88	Meifesto	29-03-2013	2013-03-29 00:00:00	19/89	Ronald_010	52.1018829	4.50131512	bij knotwilg - Zuidbuurtseweg	Zoeterwoude	ZH	\N	\N
1837	02-02-2015	2015-02-02 00:00:00	28/09	Phaedrus	12-02-2015	2015-02-12 00:00:00	28/11	-juliet-	51.4113503	5.46389103	aan struik prof. Polslaan	Eindhoven	NB	\N	\N
3071	07-04-2019	2019-04-07 00:00:00	40/266	BSI	08-04-2019	2019-04-08 00:00:00	40/266	Marsian	52.1703568	5.55478287	naast muurtje speelgoedmuseun	Terschuur	Ge	\N	\N
3033	09-03-2019	2019-03-09 00:00:00	40/235	Coenster	09-03-2019	2019-03-09 00:00:00	40/235	pdv_moto	52.2909966	4.68168497	in bloembak Motorservive, Diamantlaan	Hoofddorp	NH	\N	\N
279	23-03-2011	2011-03-23 00:00:00	8/17	Hasseman	23-03-2011	2011-03-23 00:00:00	8/19	…Marco…	52.1931458	6.85953808	bij man + hond - Breukheurne Ring, Enschede, Ov	Enschede	Ov	\N	\N
2033	25-10-2015	2015-10-25 00:00:00	29/87	Amauta	07-11-2015	2015-11-07 00:00:00	29/91	Bassjunky	53.465889	6.74953985	onder bank bij "hemelpoort"	Uithuizermeeden	Gr	\N	\N
3430	25-03-2020	2020-03-25 00:00:00	40/608	Picobello BV	26-03-2020	2020-03-26 00:00:00	40/609	HighKing	51.9891815	4.36125517	in bosje Motorenweg	Delft	ZH	\N	\N
2637	14-02-2018	2018-02-14 00:00:00	37/39	Bassjunky	14-02-2018	2018-02-14 00:00:00	37/40 	FastEddy	53.1064262	6.84304905	achter liggende boom P-terrein Bergweg	Veendam	Gr	\N	\N
1557	14-03-2014	2014-03-14 00:00:00	25/25	jaap43	14-03-2014	2014-03-14 00:00:00	25/26	SparkViv	51.9008064	4.06989002	aan toegangshek Strijpemonde	Rockanje	ZH	\N	\N
499	14-08-2011	2011-08-14 00:00:00	11/48	honda_power	15-08-2011	2011-08-15 00:00:00	11/49	Hansss	52.7847862	4.81330299	struik achter brug en poort - Dreef, Schagen, NH	Schagen	NH	\N	\N
4120	09-02-2022	2022-02-09 00:00:00	41/215	pdv_moto	10-02-2022	2022-02-10 00:00:00	41/216	Outdoor Man	51.9037323	4.28256512	tegen hek Maasslissedijk, Baek	Vlaardingen	ZH	\N	\N
3485	02-05-2020	2020-05-02 00:00:00	40/654	Hans89	03-05-2020	2020-05-03 00:00:00	40/654	pdv_moto	51.6464233	3.91750097	tegen waterkering Westhavendijk	Zierikzee	Ze	\N	\N
1976	30-07-2015	2015-07-30 00:00:00	29/31	NZo	31-07-2015	2015-07-31 00:00:00	29/32	coffeejunk	52.2113609	4.40239096	onder boei parkeerplaats	Katwijk aan Zee	ZH	\N	\N
425	11-06-2011	2011-06-11 00:00:00	10/49	BigJim	11-06-2011	2011-06-11 00:00:00	10/49	Outdoor Man	52.723484	5.05286121	bij spoorwegovergang - Broerdijk, Midwoud, NH	Midwoud	NH	\N	\N
2215	27-08-2016	2016-08-27 00:00:00	31/92	Ronald_010	27-08-2016	2016-08-27 00:00:00	31/92	SadBunny	52.3741646	5.29179478	aan kast GSM-mast - Eksterweg	Almere	Fl	\N	\N
4107	02-02-2022	2022-02-02 00:00:00	41/208	Outdoor Man	02-02-2022	2022-02-02 00:00:00	41/208	ootje	52.6591263	4.69541216	in holle knotwilg Groeneweg	Bergen	NH	\N	\N
1589	12-04-2014	2014-04-12 00:00:00	25/63	Roeleey	12-04-2014	2014-04-12 00:00:00	25/64	SadBunny	52.3899345	4.79397106	achter stenen Australiehavenweg	Amsterdam	NH	\N	\N
2950	24-11-2018	2018-11-24 00:00:00	40/114	Sjefman	25-11-2018	2018-11-25 00:00:00	40/115	scheurschuimpje	51.4998512	4.29569721	tussen betonblokken Buitenvest	Bergen op Zoom	NB	\N	\N
2101	29-04-2016	2016-04-29 00:00:00	30/73	Roeleey	29-04-2016	2016-04-29 00:00:00	30/74	pdv_moto	51.9851799	4.1003089	aan voet radarpost 3	Hoek van Holland	ZH	\N	\N
1217	19-05-2013	2013-05-19 00:00:00	20/96	bikedan	20-05-2013	2013-05-20 00:00:00	20/98	BSI	51.4245186	4.38946676	in boom bij GP249 - Staartseduin	Huybergen	NB	\N	\N
3363	24-01-2020	2020-01-24 00:00:00	40/553	Hans89	25-01-2020	2020-01-25 00:00:00	40/554	pdv_moto	51.9257812	4.45413494	tegen pijler ingang dierentuin Blijdorp	Rotterdam	ZH	\N	\N
2348	03-03-2017	2017-03-03 00:00:00	33/72	nappertje	03-03-2017	2017-03-03 00:00:00	33/72	BSI	52.0672874	5.64629221	achter paal Doesburger Molenweg	Ede	Ge	\N	\N
2119	08-05-2016	2016-05-08 00:00:00	30/88	SadBunny	09-05-2016	2016-05-09 00:00:00	30/88	Scoot_020/Scoot_2	52.3849335	5.2387228	aan boompje Weg 1940-1945	Almere	Fl	\N	\N
681	02-01-2012	2012-01-02 00:00:00	14/06	MotorMieke	04-01-2012	2012-01-04 00:00:00	14/08	Ronald_010	52.1691971	6.42297602	in boomstronk - Laan Ampsen 17, Lochem, Ge	Lochem	Ge	\N	\N
2911	22-09-2018	2018-09-22 00:00:00	40/66	tdemmer	22-09-2018	2018-09-22 00:00:00	40/66	BSI	52.1324158	5.92057991	achter bord Berg en Dalweg/Zuidweg	Beekbergen	Ge	\N	\N
2750	09-05-2018	2018-05-09 00:00:00	38/79	Outdoor Man	10-05-2018	2018-05-10 00:00:00	38/79	Rik60NL	52.3219376	4.87796307	aan boom arboretum Uilemstede	Amstelveen	NH	\N	\N
2175	18-07-2016	2016-07-18 00:00:00	31/49	Bensi	19-07-2016	2016-07-19 00:00:00	31/50	Coenster	52.2349815	6.11457396	achter bankje bij kasteel Hackfort	Twello	Ge	\N	\N
2222	31-08-2016	2016-08-31 00:00:00	31/98	Rik60NL	31-08-2016	2016-08-31 00:00:00	31/98	SadBunny	52.1854744	4.9558959	aan boom Boterwal	Kockengen	Ut	\N	\N
4052	24-10-2021	2021-10-24 00:00:00	41/169	Ronald_010	25-10-2021	2021-10-25 00:00:00	41/169	Carburateur	51.5860519	5.17732716	in heg bij Kerkhovense molen	Oisterwijk	NB	\N	\N
2994	25-01-2019	2019-01-25 00:00:00	40/180	grootkaalnix	26-01-2019	2019-01-26 00:00:00	40/181	ronk	51.8268547	5.1048522	tegen peilschaal Waaldijk	Herwijnen	Ge	\N	\N
3464	19-04-2020	2020-04-19 00:00:00	40/638	Ronald_010	20-04-2020	2020-04-20 00:00:00	40/639	Amauta	51.6763649	6.01138783	onder afdak mariakapelletje	Heijen	Li	\N	\N
1626	06-05-2014	2014-05-06 00:00:00	25/95	Phaedrus	06-05-2014	2014-05-06 00:00:00	25/96	tdemmer	51.8342209	4.5413599	bij smalspoor - Achter Zeedijk	Barendrecht	ZH	\N	\N
3491	06-05-2020	2020-05-06 00:00:00	40/658	Amauta	07-05-2020	2020-05-07 00:00:00	40/659	Outdoor Man	52.3716698	6.08915901	in struik bij ooievaarsnest	Den Nul	Ov	\N	\N
1741	12-09-2014	2014-09-12 00:00:00	27/22	crazy987	14-09-2014	2014-09-14 00:00:00	27/23	Bigtwim	53.0843658	4.7649579	achter paal Bosrandweg - de Koog	Texel	NH	\N	\N
3446	07-04-2020	2020-04-07 00:00:00	40/624	frankivo	07-04-2020	2020-04-07 00:00:00	40/624	Amauta	53.0313492	6.39381981	tegen boom bij koepelkerk, Herenkrul	Veenhuizen	Dr	\N	\N
2162	26-06-2016	2016-06-26 00:00:00	31/35	Amauta	28-06-2016	2016-06-28 00:00:00	31/36	MP_NL	52.4855385	6.45398808	ingang P-terrein Kasteel	Eerde	Ov	\N	\N
737	14-03-2012	2012-03-14 00:00:00	14/88	Komkommer	15-03-2012	2012-03-15 00:00:00	14/89	rvdh86	52.095974	5.42863798	aan hek Ekris, Woudenberg, Ut	Woudenberg	Ut	\N	\N
4101	17-01-2022	2022-01-17 00:00:00	41/202	DKP	20-01-2022	2022-01-20 00:00:00	41/202	Amauta	50.8991013	5.75507307	tegen paal Meerssenerbergweg	Ulestraten	Li	\N	\N
4071	04-12-2021	2021-12-04 00:00:00	41/183	pdv_moto	11-12-2021	2021-12-11 00:00:00	41/185	Hans89	51.8112717	3.86462498	tegen poot infopaneel vuurtoren	Ouddorp	ZH	\N	\N
4342	21-05-2023	2023-05-21 00:00:00	41/365	Okami_Xci	21-05-2023	2023-05-21 00:00:00	41/365	Bensi	52.1975403	5.3943758	aan hek spaceshuttle	Amersfoort	Ut	\N	\N
814	02-06-2012	2012-06-02 00:00:00	15/75	dks_aa	03-06-2012	2012-06-03 00:00:00	15/76	Outdoor Man	52.4496078	4.67593813	in bocht van Valleiweg, Spaarnewoude, NH	Spaarnewoude	NH	\N	\N
446	26-06-2011	2011-06-26 00:00:00	10/82	BSI	27-06-2011	2011-06-27 00:00:00	10/83	Outdoor Man	51.8523407	6.40896702	huize Landfort - grenspaal 718, Gendringen, Ge	Gendringen	Ge	\N	\N
2399	23-04-2017	2017-04-23 00:00:00	34/23	Wimis on	23-04-2017	2017-04-23 00:00:00	34/24	Arriens	52.0421944	5.14752817	aan hek vruchtenschuur - Utrechtseweg	Houten	Ut	\N	\N
2662	16-03-2018	2018-03-16 00:00:00	37/79	Bassjunky	16-03-2018	2018-03-16 00:00:00	37/79	FastEddy	53.1116524	7.02696323	langs fietspad Turfweg	Oude Pekela	Gr	\N	\N
2868	19-08-2018	2018-08-19 00:00:00	40/21	Outdoor Man	19-08-2018	2018-08-19 00:00:00	40/21	Roeleey	52.3857155	4.70441484	tegen kast bij GSM-mast Oude Notweg	Spaarndam	NH	\N	\N
4039	28-09-2021	2021-09-28 00:00:00	41/160	Brnk	30-09-2021	2021-09-30 00:00:00	41/161	HermanK	52.3780899	6.78688622	aan hek bij molen Grobbenhoeksweg	Fleringen	Gr	\N	\N
194	14-01-2011	2011-01-14 00:00:00	6/8	mr Q	15-01-2011	2011-01-15 00:00:00	6/9	Scoot_020/Scoot_2	52.3207932	4.93880796	sporthal ASSV Ouderkerkerlaan, Duivendrecht, NH	Duivendrecht	NH	\N	\N
1805	09-12-2014	2014-12-09 00:00:00	27/81	-juliet-	10-12-2014	2014-12-10 00:00:00	27/81	Dirk130	52.2613792	4.68533421	aan paal spiegelafstelplaats	Rijsenhout	NH	\N	\N
738	15-03-2012	2012-03-15 00:00:00	14/89	rvdh86	15-03-2012	2012-03-15 00:00:00	14/89	BSI	52.1900558	5.70350599	aan boom  Houtbeekweg, Stroe, Ge	Stroe	Ge	\N	\N
490	06-08-2011	2011-08-06 00:00:00	11/38	BSI	06-08-2011	2011-08-06 00:00:00	11/38	scheurschuimpje	52.7273788	5.76652718	plantenbak v/d Valk Restaurant, Emmeloord, Fl	Emmeloord	Fl	\N	\N
2491	19-07-2017	2017-07-19 00:00:00	35/22	HighKing	19-07-2017	2017-07-19 00:00:00	35/22	Coenster	52.2535057	4.62506723	aan plaatsnaambord - Eurolaan	Nieuw-Vennep	NH	\N	\N
1643	19-05-2014	2014-05-19 00:00:00	26/13	Sjantaalfoutje	19-05-2014	2014-05-19 00:00:00	26/13	MTFDarkEagle	52.1289253	6.14581013	aan zuil van poort - Voorsterweg	Brummen	Ge	\N	\N
1769	11-10-2014	2014-10-11 00:00:00	27/47	Djoost	12-10-2014	2014-10-12 00:00:00	27/47	Blogem	52.4967308	4.80248499	in boom bi tankstation - Florastraat	Wormer	NH	\N	\N
2187	28-07-2016	2016-07-28 00:00:00	31/60	-Floris-	29-07-2016	2016-07-29 00:00:00	31/62	Einschtein	51.4990921	3.60184312	in bosje park de Griffioen	Middelburg	Ze	\N	\N
302	03-04-2011	2011-04-03 00:00:00	8/56	Pinky Ramone	03-04-2011	2011-04-03 00:00:00	8/58	Hasseman	52.5644188	6.76212788	Scholtmansdiek, Laar, Ov	Laar	Ov	\N	\N
3234	05-09-2019	2019-09-05 00:00:00	40/450	Coenster	05-09-2019	2019-09-05 00:00:00	40/450	Roeleey	52.1257591	5.06703615	aan hekje Stadstuin, Daalseweg	Maarssen	Ut	\N	\N
2625	25-01-2018	2018-01-25 00:00:00	37/17	SadBunny	25-01-2018	2018-01-25 00:00:00	37/17	pdv_moto	52.0439186	4.33737516	in heg P-terrein Burg. Elsenlaan	Rijswijk	ZH	\N	\N
2751	10-05-2018	2018-05-10 00:00:00	38/79	Rik60NL	10-05-2018	2018-05-10 00:00:00	38/80	Outdoor Man	52.1617775	5.0291872	aan paaltje bij fort Tienhoven	Maarssen	Ut	\N	\N
2317	20-12-2016	2016-12-20 00:00:00	33/23	pdv_moto	22-12-2016	2016-12-22 00:00:00	33/24	Dirk130	52.1083183	4.32577181	achter paaltje Landscheidingsweg	Den Haag	ZH	\N	\N
672	25-12-2011	2011-12-25 00:00:00	13/92	jaap43	25-12-2011	2011-12-25 00:00:00	13/92	Von Stolk	51.9200134	4.78432798	onder loopbrug bij veerstoep, Bergambacht, ZH	Bergambacht	ZH	\N	\N
3568	02-07-2020	2020-07-02 00:00:00	40/723	FastEddy	02-07-2020	2020-07-02 00:00:00	40/724	Amauta	53.1526566	7.17757702	tegen infopaneel Boneschanskerweg	Bad Nieuweschans	Gr	\N	\N
2404	28-04-2017	2017-04-28 00:00:00	34/29	pdv_moto	28-04-2017	2017-04-28 00:00:00	34/30	GromToskamp	51.5532799	4.55174112	aan paal van vliegtuig - vliegveld Seppe	Rucphen	NB	\N	\N
3371	03-02-2020	2020-02-03 00:00:00	40/559	BSI	03-02-2020	2020-02-03 00:00:00	40/559	HighKing	52.3370628	4.85104418	achter boom bokkade Damloperspad	Amsterdam	NH	\N	\N
1674	07-07-2014	2014-07-07 00:00:00	26/53	Bensi	10-07-2014	2014-07-10 00:00:00	26/54	Dirtbag	51.9968262	6.12693214	aan boom - het Klooster	Angerlo	Ge	\N	\N
1188	30-04-2013	2013-04-30 00:00:00	20/58	SadBunny	30-04-2013	2013-04-30 00:00:00	20/58	Ronald_010	52.3995552	4.8691802	aan hek bij Archangelkade	Amsterdam	NH	\N	\N
141	17-11-2010	2010-11-17 00:00:00	4/93	jean99	18-11-2010	2010-11-18 00:00:00	4/95	tdemmer	51.9128609	4.46938992	Erasmus Univ. Wytemaweg, Rotterdam, ZH	Rotterdam	ZH	\N	\N
2243	19-09-2016	2016-09-19 00:00:00	32/21	Dirk130	20-09-2016	2016-09-20 00:00:00	32/22	Simonshavenaar	51.91502	4.06055117	aan paal bij slagboom - Strandweg	Oostvoorne	ZH	\N	\N
3495	09-05-2020	2020-05-09 00:00:00	40/662	Outdoor Man	10-05-2020	2020-05-10 00:00:00	40/663	DKP	50.8264465	5.67803001	achter boomstronk van Schaikweg	Maastricht	Li	\N	\N
939	02-10-2012	2012-10-02 00:00:00	17/17	Buikschuiver oet Dre	04-10-2012	2012-10-04 00:00:00	17/19	scheurschuimpje	52.6654701	6.10860395	langs kanaal bij Baarlo	Zwartsluis	Ov	\N	\N
3640	25-08-2020	2020-08-25 00:00:00	40/800	Hans89	27-08-2020	2020-08-27 00:00:00	40/801	Yosra87	51.5548363	3.76148105	achter boom bij haventje	Geerdijk	Ze	\N	\N
3924	06-06-2021	2021-06-06 00:00:00	41/086	Outdoor Man	07-06-2021	2021-06-07 00:00:00	41/086	FastEddy	52.6744614	6.99883223	tegen boom pad naar schaapskooi	Weiteveen	Dr	\N	\N
850	04-07-2012	2012-07-04 00:00:00	16/23	Bensi	05-07-2012	2012-07-05 00:00:00	16/24	Maegrim	51.8247414	5.91505718	bij bankje - Oude Holleweg	Berg en Dal	Ge	\N	\N
2578	01-11-2017	2017-11-01 00:00:00	36/45	Scoot_020/Scoot_2	03-11-2017	2017-11-03 00:00:00	36/47	Amauta	52.3553696	5.21254778	aan pilaar restaurant Onderweg	Almere	Fl	\N	\N
727	08-03-2012	2012-03-08 00:00:00	14/78	tdemmer	08-03-2012	2012-03-08 00:00:00	14/79	wesleyc	52.1766319	4.82898521	achter beschoeing Hogedijk, Zevenhoven, ZH	Zevenhoven	ZH	\N	\N
373	16-05-2011	2011-05-16 00:00:00	9/77	wesleyc	16-05-2011	2011-05-16 00:00:00	9/77	Dirk130	52.0620422	4.21798277	onder hek op uitzichtpunt puinduinen, Kijkduin, ZH	Kijkduin	ZH	\N	\N
234	13-02-2011	2011-02-13 00:00:00	7/10	ootje	13-02-2011	2011-02-13 00:00:00	7/11	rutgertjuh	51.9914436	5.50740099	paaltjes bij Driftweg 55, Elst, Ut	Elst	Ut	\N	\N
3943	19-06-2021	2021-06-19 00:00:00	41/097	Bensi	19-06-2021	2021-06-19 00:00:00	41/098	Outdoor Man	51.9985847	6.19529486	aan ligplaats 31 steiger Oude Ijssel	Laag Keppel	Ge	\N	\N
3654	04-09-2020	2020-09-04 00:00:00	40/811	MeanYellowBoy	04-09-2020	2020-09-04 00:00:00	40/811	FastEddy	53.1005287	6.88596916	onder Molenbrug / Vrijheidslaan	Veendam	Gr	\N	\N
4350	03-06-2023	2023-06-03 00:00:00	41/370	FastEddy	04-06-2023	2023-06-04 00:00:00	41/370	bikedan	51.3293648	3.69071198	tegen bruggenhoofd Havenstraat	Biervliet	Ze	\N	\N
3579	11-07-2020	2020-07-11 00:00:00	40/733	pdv_moto	11-07-2020	2020-07-11 00:00:00	40/733	bikedan	51.3901024	4.3145628	in heg bij infobord Lanheweg	Ossendrecht	NB	\N	\N
3642	28-08-2020	2020-08-28 00:00:00	40/802	HighKing	28-08-2020	2020-08-28 00:00:00	40/803	Amauta	52.5149574	4.6672349	tegen boom bij Florisheem	Heemstede	NH	\N	\N
705	16-02-2012	2012-02-16 00:00:00	14/50	Hasseman	17-02-2012	2012-02-17 00:00:00	14/52	Foncelot	52.4038887	6.77222204	bij beeld Schaepman - Tubbergse Es, Tubbergen, Ov	Tubbergen	Ov	\N	\N
1099	28-02-2013	2013-02-28 00:00:00	19/30	Corney28	01-03-2013	2013-03-01 00:00:00	19/31	Roeleey	52.1946869	4.9151082	in bord Korenmolenweg	Wilnis	Ut	\N	\N
1449	23-12-2013	2013-12-23 00:00:00	24/10	Hans89	23-12-2013	2013-12-23 00:00:00	24/10	Ronald_010	51.5344048	4.07019377	aan paal Kasteleinsweg	Sint Maartensdijk	Ze	\N	\N
2155	19-06-2016	2016-06-19 00:00:00	31/27	BSI	20-06-2016	2016-06-20 00:00:00	31/29	Scoot_020/Scoot_2	52.3346329	5.09184694	aan hek bij Radiobaken Pampus	Muiden	NH	\N	\N
995	15-11-2012	2012-11-15 00:00:00	17/92	Smuiger	16-11-2012	2012-11-16 00:00:00	17/94	Sjakie-77	52.4878769	4.81299019	aan struik - Bartelsluispad	Wormer	NH	\N	\N
3733	04-11-2020	2020-11-04 00:00:00	40/871	Okami_Xci	05-11-2020	2020-11-05 00:00:00	40/872	Outdoor Man	51.1331558	5.85003996	achter oplaadpilaar P-terrein Sportlaan	Stevensweert	Li	\N	\N
2395	21-04-2017	2017-04-21 00:00:00	34/20	Scoot_020/Scoot_2	22-04-2017	2017-04-22 00:00:00	34/21	GromToskamp	52.3765373	5.28393602	in liggend hek - Betonpad	Almere	Fl	\N	\N
3018	22-02-2019	2019-02-22 00:00:00	40/214	Totl	22-02-2019	2019-02-22 00:00:00	40/215	Amauta	53.0608635	6.35917282	onder brug Hauleurekstervaart	Heulerwijk	Fr	\N	\N
588	16-10-2011	2011-10-16 00:00:00	12/81	Quickly	16-10-2011	2011-10-16 00:00:00	12/82	Von Stolk	51.9842606	4.90766191	aan hek bij eind van Groene Kade, Lopik, Ut	Lopik	Ut	\N	\N
1527	22-02-2014	2014-02-22 00:00:00	24/96	Ronald_010	23-02-2014	2014-02-23 00:00:00	24/97	Dirk130	51.9681053	4.402565	aan paal camera - Rijksstraatweg	Delft	ZH	\N	\N
3200	09-08-2019	2019-08-09 00:00:00	40/417	Mitssz	09-08-2019	2019-08-09 00:00:00	40/417	Hans89	51.9354591	4.40615797	aan hek van Vlissingenstraat	Schiedam	ZH	\N	\N
1912	14-05-2015	2015-05-14 00:00:00	28/76	crazy987	14-05-2015	2015-05-14 00:00:00	28/76	bikedan	51.6258392	4.58648491	aan hek bij fietsbrug over de Mark	Hoeven	NB	\N	\N
3478	27-04-2020	2020-04-27 00:00:00	40/649	Ronald_010	28-04-2020	2020-04-28 00:00:00	40/650	frankivo	52.7180443	5.78628588	onder Billboard MKB	Emmeloord	Fl	\N	\N
94	15-10-2010	2010-10-15 00:00:00	3/69	Motoropoe	16-10-2010	2010-10-16 00:00:00	3/71	bobcat	53.073597	5.33714485	parkeerplaats, Kornwerderzand, Fr	Kornwerderzand	Fr	\N	\N
65	25-09-2010	2010-09-25 00:00:00	3/12	Knaakie	25-09-2010	2010-09-25 00:00:00	3/12	El Rojo	52.0375786	5.14437008	Ijsbaan, Houten, Ut	Houten	Ut	\N	\N
3874	13-04-2021	2021-04-13 00:00:00	41/040	MeanYellowBoy	13-04-2021	2021-04-13 00:00:00	41/040	HermanK	52.6016998	6.40107489	onder oegangshek molen de Star	Balkbrug	Ov	\N	\N
3612	06-08-2020	2020-08-06 00:00:00	40/768	Picobello BV	06-08-2020	2020-08-06 00:00:00	40/768	Andijviestamppot	52.0969582	4.3115468	achter E-kast Oostduinlaan	Den Haag	ZH	\N	\N
1348	09-09-2013	2013-09-09 00:00:00	22/72	BSI	12-09-2013	2013-09-12 00:00:00	22/75	Corney28	51.7976112	5.93098593	achter heg bij ingang ereveld	Groesbeek	Ge	\N	\N
1624	04-05-2014	2014-05-04 00:00:00	25/92	Phaedrus	05-05-2014	2014-05-05 00:00:00	25/93	SparkViv	51.8801918	4.53263378	aan bord parkeergarage Maasstad	Rotterdam	ZH	\N	\N
3159	04-07-2019	2019-07-04 00:00:00	40/375	BSI	05-07-2019	2019-07-05 00:00:00	40/376	Bomba	52.1725388	5.59362078	tegen boom kruispunt	Voorthuizen	Ge	\N	\N
1836	31-01-2015	2015-01-31 00:00:00	28/08	Ronald_010	01-02-2015	2015-02-01 00:00:00	28/08	Phaedrus	52.0255928	4.6681881	aan struik - Nieuwe Gouwe	Waddinxveen	ZH	\N	\N
2389	18-04-2017	2017-04-18 00:00:00	34/15	pdv_moto	18-04-2017	2017-04-18 00:00:00	34/16	PatrickSoler	52.1702423	4.45384789	achter struik Corpus	Oegstgeest	ZH	\N	\N
3793	29-01-2021	2021-01-29 00:00:00	40/925	BSI	30-01-2021	2021-01-30 00:00:00	40/926	pdv_moto	52.1341515	5.3610692	achter bankje trap kamp Amersfoort	Amersfoort	Ut	\N	\N
3035	10-03-2019	2019-03-10 00:00:00	40/237	Amauta	10-03-2019	2019-03-10 00:00:00	40/237	pdv_moto	53.1987419	6.5092082	tegen hek gemaaltje Ruskenveen	Peize	Dr	\N	\N
1382	03-10-2013	2013-10-03 00:00:00	23/28	Scoot_020/Scoot_2	03-10-2013	2013-10-03 00:00:00	23/28	V-Strommert	52.3768997	4.76662922	aan paaltje bij viaduct A5	Amsterdam	NH	\N	\N
241	20-02-2011	2011-02-20 00:00:00	7/32	Wimis on	20-02-2011	2011-02-20 00:00:00	7/33	Quickly	52.0117188	5.32721281	pleintje bij kerk - Doornseweg, Langbroek, Ut	Langbroek	Ut	\N	\N
4420	24-10-2023	2023-10-24 00:00:00	41/413	tdemmer	24-10-2023	2023-10-24 00:00:00	41/413	Hans89	51.9596786	4.55308723	tegen poot infopaneel Cymbelkruid	Rotterdam	ZH	\N	\N
1386	07-10-2013	2013-10-07 00:00:00	23/34	Buuv	08-10-2013	2013-10-08 00:00:00	23/35	Kermit de Hond	52.9856987	6.83690691	achter afvalbak bij de Juffer	Gasselternijveen	Dr	\N	\N
3088	23-04-2019	2019-04-23 00:00:00	40/284	Rik60NL	24-04-2019	2019-04-24 00:00:00	40/285	Coenster	52.2119026	4.84471893	onder stammen, Ringdijk 3e bedijking	Mijdrecht	Ut	\N	\N
2650	05-03-2018	2018-03-05 00:00:00	37/61	pdv_moto	06-03-2018	2018-03-06 00:00:00	37/62	-Floris-	51.4656372	3.65409994	aan betonnenpaal, Koedijk	Ritthem	Ze	\N	\N
101	21-10-2010	2010-10-21 00:00:00	3/87	rutgertjuh	21-10-2010	2010-10-21 00:00:00	3/87	Hasseman	52.3687859	6.585145	1e Lageveldweg, Wierden, Ov	Wierden	Ov	\N	\N
3885	23-04-2021	2021-04-23 00:00:00	41/051	tdemmer	23-04-2021	2021-04-23 00:00:00	41/051	HermanK	52.1857491	5.84451294	in boom Alverschotenseweg Hoog Buurlo	Radio Kootwijk	Ge	\N	\N
3268	12-10-2019	2019-10-12 00:00:00	40/479	ey-dzeej	13-10-2019	2019-10-13 00:00:00	40/479	Amauta	51.90242	4.37100983	tegen hek Vijfsluizerhaven	Schiedam	ZH	\N	\N
2071	19-02-2016	2016-02-19 00:00:00	30/31	Amauta	22-02-2016	2016-02-22 00:00:00	30/32	frankivo	52.9530563	6.54075003	aan hek bij TT-circuit	Assen	Dr	\N	\N
1160	08-04-2013	2013-04-08 00:00:00	20/17	Meangreengirl/MeanBlueMan	09-04-2013	2013-04-09 00:00:00	20/19	Hans89	51.3969193	4.01703119	onder laadperron veer	Perkpolder	Ze	\N	\N
323	10-04-2011	2011-04-10 00:00:00	8/89	Wimis on	10-04-2011	2011-04-10 00:00:00	8/91	ndeeka	52.0264015	5.23034	Grenspaal Limes - Achterdijk 45, Werkhoven, Ut	Werkhoven	Ut	\N	\N
3797	03-02-2021	2021-02-03 00:00:00	40/928	pdv_moto	03-02-2021	2021-02-03 00:00:00	40/929	Coenster	52.0677948	4.39908409	op rotonde Zoetermeerse Rijweg	Den Haag	ZH	\N	\N
1452	28-12-2013	2013-12-28 00:00:00	24/12	Wimis on	28-12-2013	2013-12-28 00:00:00	24/12	Bomba	52.0257072	5.15250683	aan hoek stenen poort - Warinenpoort	Houten	Ut	\N	\N
2166	02-07-2016	2016-07-02 00:00:00	31/39	Motormuisje_alice	03-07-2016	2016-07-03 00:00:00	31/39	Ronald_010	51.8516541	4.30383015	aan kuipboom - Bohrweg	Spijkenisse	ZH	\N	\N
3571	05-07-2020	2020-07-05 00:00:00	40/726	Outdoor Man	05-07-2020	2020-07-05 00:00:00	40/727	HighKing	52.5420265	4.83924818	aan hekpost bij fort Spijkerboor	Westbeemster	NH	\N	\N
2675	25-03-2018	2018-03-25 00:00:00	37/92	BSI	25-03-2018	2018-03-25 00:00:00	37/93	BornToReign	51.980835	5.4970932	aan hek Ingenseveer, 	Elst	Ut	\N	\N
2998	28-01-2019	2019-01-28 00:00:00	40/187	Ronny Rabbelaar	29-01-2019	2019-01-29 00:00:00	40/189	Amauta	53.4006996	6.42545319	tegen tronk Wierhuisterweg	Pieterburen	Gr	\N	\N
1721	21-08-2014	2014-08-21 00:00:00	27/05	bikedan	23-08-2014	2014-08-23 00:00:00	27/06	Corney28	51.4887695	3.87187791	aan hek reclamezuil P-terrein - Deltaweg	Goes	Ze	\N	\N
3822	05-03-2021	2021-03-05 00:00:00	41/001	HighKing	05-03-2021	2021-03-05 00:00:00	41/001	BSI	52.5482216	4.66831493	in plantenbak de Goede Herderkerk	Castricum	NH	\N	\N
2841	31-07-2018	2018-07-31 00:00:00	39/91	Ronny Rabbelaar	31-07-2018	2018-07-31 00:00:00	39/92	Amauta	53.3369637	6.60747385	aan steiger bij gemaal den Deel	Middelstum	Gr	\N	\N
1555	12-03-2014	2014-03-12 00:00:00	25/23	-juliet-	13-03-2014	2014-03-13 00:00:00	25/24	SparkViv	51.9596939	4.40830994	achter E-kast W. Abtspolderseweg	Rotterdam	ZH	\N	\N
3284	29-10-2019	2019-10-29 00:00:00	40/492	pdv_moto	29-10-2019	2019-10-29 00:00:00	40/492	Coenster	52.0105705	4.31266212	aan boom P-terrein Peulwijk-Oost	Den Hoorn	ZH	\N	\N
4381	30-07-2023	2023-07-30 00:00:00	41/389	FastEddy	01-08-2023	2023-08-01 00:00:00	41/390	k0en	53.01334	7.19781494	tegen hek bij redoute Bakhoven	Bourtange	Gr	\N	\N
966	27-10-2012	2012-10-27 00:00:00	17/52	Ronald_010	28-10-2012	2012-10-28 00:00:00	17/52	BSI	51.9375381	4.86988211	aan boompje het Hoofd	Nieuwpoort	ZH	\N	\N
921	13-09-2012	2012-09-13 00:00:00	16/98	Bigtwim	15-09-2012	2012-09-15 00:00:00	16/101	ootje	53.1311951	4.81559181	bij uitzichtpunt Slufter - Cocksdorp	Texel	NH	\N	\N
729	09-03-2012	2012-03-09 00:00:00	14/80	Dirk130	09-03-2012	2012-03-09 00:00:00	14/80	ndeeka	52.0245667	4.33009577	aan paal in Wilhelminapark, Rijswijk, ZH	Rijswijk	ZH	\N	\N
2914	26-09-2018	2018-09-26 00:00:00	40/68	HighKing	26-09-2018	2018-09-26 00:00:00	40/68	Outdoor Man	52.3418007	4.81838799	achter hek Sloterweg	Amsterdam	NH	\N	\N
3316	09-12-2019	2019-12-09 00:00:00	40/522	Hans89	09-12-2019	2019-12-09 00:00:00	40/523	Picobello BV	51.8809738	4.236938	tegen hek keerlus Nieuwe Sluisweg	Rotterdam	ZH	\N	\N
1591	13-04-2014	2014-04-13 00:00:00	25/65	ootje	13-04-2014	2014-04-13 00:00:00	25/66	Bigtwim	52.5777626	4.66258907	in knotwilg Madeweg	Castricum	NH	\N	\N
561	02-10-2011	2011-10-02 00:00:00	12/44	Ronald_010	02-10-2011	2011-10-02 00:00:00	12/44	Wimis on	51.8180504	5.02070379	aan steiger bij slot Loevestein, Poederoijen, Ge	Poederoijen	Ge	\N	\N
83	05-10-2010	2010-10-05 00:00:00	3/46	smoffler	05-10-2010	2010-10-05 00:00:00	3/47	toroque	51.5297432	4.46226788	Vrouwenhoflaan, Roosendaal, NB	Roosendaal	NB	\N	\N
257	06-03-2011	2011-03-06 00:00:00	7/72	Wimis on	06-03-2011	2011-03-06 00:00:00	7/73	tdemmer	52.0008698	5.04851818	wachthuisje Nozema - Biezendijk, Lopikerkapel, Ut	Lopikerkapel	Ut	\N	\N
1309	15-08-2013	2013-08-15 00:00:00	22/21	Bensi	16-08-2013	2013-08-16 00:00:00	22/22	rvdh86	52.0503922	6.11388111	achter muurtje sluis kanaal	Spankeren	Ge	\N	\N
2620	20-01-2018	2018-01-20 00:00:00	37/11	Rik60NL	21-01-2018	2018-01-21 00:00:00	37/13	Roeleey	52.2457924	4.841362	in boom looppad Hollandsedijk	Uithoorn	NH	\N	\N
2045	24-12-2015	2015-12-24 00:00:00	30/09	Meifesto	24-12-2015	2015-12-24 00:00:00	30/09	pdv_moto	51.868824	4.5001359	in bosje P-terrein Zuiderpark	Rotterdam	ZH	\N	\N
4038	26-09-2021	2021-09-26 00:00:00	41/159	Amauta	28-09-2021	2021-09-28 00:00:00	41/160	Brnk	53.1520882	7.12861109	tegen bord bij stuw de Bult	Beerta	Gr	\N	\N
915	07-09-2012	2012-09-07 00:00:00	16/93	tdemmer	08-09-2012	2012-09-08 00:00:00	16/93	V-Strommert	51.9749985	4.845469	aan hek - Slangeweg	Vlist	ZH	\N	\N
519	29-08-2011	2011-08-29 00:00:00	11/78	Sjakie-77	30-08-2011	2011-08-30 00:00:00	11/80	Scoot_020/Scoot_2	52.4761772	4.68552923	achter info-bord langs Waterlinie, Akersloot, NH	Akersloot	NH	\N	\N
4209	16-06-2022	2022-06-16 00:00:00	41/275	Pydejong	19-06-2022	2022-06-19 00:00:00	41/275	HermanK	50.8962784	6.02922916	aan pijler spoorbrug Dr. Calsstraat	Landgraaf	Li	\N	\N
3056	27-03-2019	2019-03-27 00:00:00	40/254	ArendJan	28-03-2019	2019-03-28 00:00:00	40/255	Rik60NL	51.9888802	4.63395977	aan hek langs Laagste Land Route	Moordrecht	ZH	\N	\N
2113	04-05-2016	2016-05-04 00:00:00	30/84	Sander78	04-05-2016	2016-05-04 00:00:00	30/85	Artemecion	52.6365929	4.7362318	aan hek van Teylingenstraat	Alkmaar	NH	\N	\N
4061	05-11-2021	2021-11-05 00:00:00	41/174	pdv_moto	06-11-2021	2021-11-06 00:00:00	41/175	BadBert	51.4318237	4.2711482	aan poot welkomstbord Reimerwielweg	Eornsdrecht	NB	\N	\N
745	20-03-2012	2012-03-20 00:00:00	14/97	-Floris-	22-03-2012	2012-03-22 00:00:00	14/97	meylie-style	51.5065994	3.56083488	aan boom bij kerk - Meinersweg, Grijpskerke, Ze	Grijpskerke	Ze	\N	\N
2597	24-11-2017	2017-11-24 00:00:00	36/69	pdv_moto	24-11-2017	2017-11-24 00:00:00	36/70	Okami_Xci	52.0938339	4.27345324	in bloembak Statenlaan	Den Haag	ZH	\N	\N
2601	18-12-2017	2017-12-18 00:00:00	36/81	pdv_moto	20-12-2017	2017-12-20 00:00:00	36/82	-Floris-	51.5490341	3.45984697	aan paal verkeersbord - Baaiweg	Westkapelle	Ze	\N	\N
3328	18-12-2019	2019-12-18 00:00:00	40/530	Picobello BV	19-12-2019	2019-12-19 00:00:00	40/530	ey-dzeej	51.9570312	4.39893293	onder schakelkast bij Hofwijk	Rotterdam	ZH	\N	\N
3447	07-04-2020	2020-04-07 00:00:00	40/624	Amauta	09-04-2020	2020-04-09 00:00:00	40/625	Outdoor Man	53.4037743	6.35355091	tegen hek bij zendmast Waddenweg	Hornhuizen	Gr	\N	\N
71	29-09-2010	2010-09-29 00:00:00	3/27	Smuiger	29-09-2010	2010-09-29 00:00:00	3/29	BigJim	53.1289062	5.42626381	fam Heida - Dijksterburen, Zurich, Fr	Zurich	Fr	\N	\N
1776	21-10-2014	2014-10-21 00:00:00	27/53	Scoot_020/Scoot_2	22-10-2014	2014-10-22 00:00:00	27/54	BSI	52.331852	4.80669308	onder stenen - Oude Haagseweg	Amsterdam	NH	\N	\N
2885	31-08-2018	2018-08-31 00:00:00	40/39	frankivo	31-08-2018	2018-08-31 00:00:00	40/40	Ronny Rabbelaar	53.2423592	6.95255995	aan paal knooppuntenbord	Nieuwolda	Gr	\N	\N
736	14-03-2012	2012-03-14 00:00:00	14/87	MotorMieke	14-03-2012	2012-03-14 00:00:00	14/88	Komkommer	52.2360306	6.44150686	aan paaltje zendtoren Larenseweg,  Markelo, Ov	Markelo	Ov	\N	\N
3920	03-06-2021	2021-06-03 00:00:00	41/083	Outdoor Man	03-06-2021	2021-06-03 00:00:00	41/084	BigJim	52.7070503	4.68808985	tegen boom bij monument kamp Schoorl	Schoorl	NH	\N	\N
1389	11-10-2013	2013-10-11 00:00:00	23/40	frankivo	11-10-2013	2013-10-11 00:00:00	23/40	Buuv	52.9253693	6.81125784	aan paal bij D28/D29	Buinen	Dr	\N	\N
60	23-09-2010	2010-09-23 00:00:00	3/5	Dirk130	23-09-2010	2010-09-23 00:00:00	3/5	tdemmer	52.1220322	4.29472113	overgegeven door ongeluk, , ZH	Den Haag	ZH	\N	\N
2536	02-09-2017	2017-09-02 00:00:00	35/80	SadBunny	02-09-2017	2017-09-02 00:00:00	35/80	highking	52.1958122	5.43872023	op viaduct - Verbindingsweg	Amersfoort	Ut	\N	\N
954	19-10-2012	2012-10-19 00:00:00	17/40	bikedan	19-10-2012	2012-10-19 00:00:00	17/40	Ronald_010	51.6672707	4.09327888	aan lantaarnpaal Werkhavenweg	Bruinisse	Ze	\N	\N
986	10-11-2012	2012-11-10 00:00:00	17/80	BSI	11-11-2012	2012-11-11 00:00:00	17/82	V-Strommert	52.3724976	4.52551079	onder scheepsromp - Strandweg	Zandvoort	NH	\N	\N
523	02-09-2011	2011-09-02 00:00:00	11/84	BSI	03-09-2011	2011-09-03 00:00:00	11/86	Luus	53.0866013	7.08569288	aan achterkant van bord - Molenweg, Wedde, Gr	Wedde	Gr	\N	\N
3696	09-10-2020	2020-10-09 00:00:00	40/843	Outdoor Man	10-10-2020	2020-10-10 00:00:00	40/844	Roeleey	51.2476692	3.45019794	achter muurtje monument Brieverstraat	Eede	Ze	\N	\N
979	05-11-2012	2012-11-05 00:00:00	17/71	BSI	06-11-2012	2012-11-06 00:00:00	17/72	Corney28	52.1865463	5.60528803	aan hek Koninginnelaan	Voorthuizen	Ge	\N	\N
3899	07-05-2021	2021-05-07 00:00:00	41/064	Ronny Rabbelaar	08-05-2021	2021-05-08 00:00:00	41/065	Amauta	53.2794266	7.06621218	aan paal bochtmarkering	Termunten	Gr	\N	\N
2207	23-08-2016	2016-08-23 00:00:00	31/85	Bensi	23-08-2016	2016-08-23 00:00:00	31/85	pdv_moto	52.1153793	6.52071619	onder brug - Het Eiland	Borculo	Ge	\N	\N
3519	30-05-2020	2020-05-30 00:00:00	40/682	Amauta	30-05-2020	2020-05-30 00:00:00	40/683	Ronald_010	52.7339249	6.95992184	tegen laantaanrpaal bij Giraf A37	Nieuw-Dordrecht	Dr	\N	\N
503	18-08-2011	2011-08-18 00:00:00	11/55	Scoot_020/Scoot_2	18-08-2011	2011-08-18 00:00:00	11/54	vuurbloed	52.3410187	4.81190395	aan infobord - Anderlechtlaan, Amsterdam, NH	Amsterdam	NH	\N	\N
2253	27-09-2016	2016-09-27 00:00:00	32/33	Coenster	27-09-2016	2016-09-27 00:00:00	32/35	BornToReign	52.2334671	5.97733688	aan bordje brandkraan - Fauststraat	Apeldoorn	Ge	\N	\N
2412	06-05-2017	2017-05-06 00:00:00	34/37	Ronald_010	06-05-2017	2017-05-06 00:00:00	34/38	pdv_moto	51.8478661	4.55818176	achter wiel wals Stationsweg	Varendrecht	ZH	\N	\N
1054	23-01-2013	2013-01-23 00:00:00	18/71	ootje	24-01-2013	2013-01-24 00:00:00	18/72	Sjakie-77	52.4786606	4.83693409	aan zuiltje - Westerdijk	Wijdewormer	NH	\N	\N
2456	12-06-2017	2017-06-12 00:00:00	34/82	Kevson	13-06-2017	2017-06-13 00:00:00	34/82	BornToReign	52.3048248	5.31629515	onder bord Stichtsepad	Almere	Fl	\N	\N
862	18-07-2012	2012-07-18 00:00:00	16/42	Directeur	20-07-2012	2012-07-20 00:00:00	16/46	Bedumer	53.4032593	6.60937119	bij boom aan de Raadhuislaan	Usquert	Gr	\N	\N
1550	10-03-2014	2014-03-10 00:00:00	25/20	Ronald_010	11-03-2014	2014-03-11 00:00:00	25/20	Lekkerbekje	52.0147629	4.27827692	aan beschoeiing bij Motoport	Wateringen	ZH	\N	\N
3334	21-12-2019	2019-12-21 00:00:00	40/533	pdv_moto	21-12-2019	2019-12-21 00:00:00	40/534	Amauta	52.0900803	4.30556488	onder yucca Nassauplein	Den Haag	ZH	\N	\N
1441	11-12-2013	2013-12-11 00:00:00	23/100	Roeleey	13-12-2013	2013-12-13 00:00:00	24/02	Ronald_010	52.3303413	5.07289886	aan brugleuning Waterkeringpad	Muiden	NH	\N	\N
2904	16-09-2018	2018-09-16 00:00:00	40/58	jaap43	17-09-2018	2018-09-17 00:00:00	40/59	pdv_moto	52.0067749	4.56089401	in struik Tweemanspolder	Zevenhuizen	ZH	\N	\N
305	04-04-2011	2011-04-04 00:00:00	8/63	Gertman	04-04-2011	2011-04-04 00:00:00	8/63	Ted	52.5682373	5.89853621	bij clubhuis Hells Angels - Loswal, Kampen, Ov	Kampen	Ov	\N	\N
2507	06-08-2017	2017-08-06 00:00:00	35/40	pdv_moto	07-08-2017	2017-08-07 00:00:00	35/41	bikedan	51.5675774	3.55491996	in bloemperk Bike-Rent - Noordweg	Oostkapelle	Ze	\N	\N
937	27-09-2012	2012-09-27 00:00:00	17/14	Kermit de Hond	01-10-2012	2012-10-01 00:00:00	17/16	Sytze	53.4103432	6.19279099	aan hek Gerbrandyweg	Lauwersoog	Gr	\N	\N
3459	17-04-2020	2020-04-17 00:00:00	40/635	Outdoor Man	17-04-2020	2020-04-17 00:00:00	40/636	Coenster	52.202816	4.64340782	onder spiegel Plantage	Oude Wetering	ZH	\N	\N
1152	02-04-2013	2013-04-02 00:00:00	20/01	Bludge	03-04-2013	2013-04-03 00:00:00	20/03	sirdrinksalotofpetrol	51.9165459	5.99641085	bij tunnelingang - Kandiadijk	Pannerden	Ge	\N	\N
1046	05-01-2013	2013-01-05 00:00:00	18/53	Ronald_010	05-01-2013	2013-01-05 00:00:00	18/53	tdemmer	52.0714035	4.46098089	in liggende boomstam - Daliepad	Zoetermeer	ZH	\N	\N
1187	29-04-2013	2013-04-29 00:00:00	20/57	Bludge	30-04-2013	2013-04-30 00:00:00	20/57	SadBunny	51.8390236	5.55830383	in boom bij Blauwe Sluis	Appeltern	Ge	\N	\N
2298	26-11-2016	2016-11-26 00:00:00	33/06	Ronald_010	26-11-2016	2016-11-26 00:00:00	33/06	BornToReign	52.3556938	5.21154404	in heg naast ingang McDrive	Almere	Fl	\N	\N
165		0001-01-01 00:00:00 BC				0001-01-01 00:00:00 BC		BigJim	\N	\N				\N	\N
295	28-03-2011	2011-03-28 00:00:00	8/39	BigJim	28-03-2011	2011-03-28 00:00:00	8/40	Scoot_020/Scoot_2	52.4805984	4.73081589	naast houten brug Zuiderweg, Assendelft, NH	Assendelft	NH	\N	\N
2632	04-02-2018	2018-02-04 00:00:00	37/28	BSI	05-02-2018	2018-02-05 00:00:00	37/30	HermanK	52.1896019	5.60952806	achter paal Roelenengweg	Voorthuizen	Ge	\N	\N
1650	27-05-2014	2014-05-27 00:00:00	26/21	Wimis on	27-05-2014	2014-05-27 00:00:00	26/22	Bas600	52.0500069	5.14411783	aan paal infopaneel - Fortweg	Houten	Ut	\N	\N
1426	20-11-2013	2013-11-20 00:00:00	23/83	tdemmer	21-11-2013	2013-11-21 00:00:00	23/83	Bomba	51.9998894	4.91981697	 in knotwilg Benedeneind Zz	Benschop	Ut	\N	\N
2825	20-07-2018	2018-07-20 00:00:00	39/72	Coenster	20-07-2018	2018-07-20 00:00:00	39/72	Outdoor Man	52.2202835	4.55811405	tegen boom Hoofdweg	Buitenkaag	NH	\N	\N
696	26-01-2012	2012-01-26 00:00:00	14/30	Komkommer	28-01-2012	2012-01-28 00:00:00	14/32	Ronald_010	51.9738388	5.02823496	aan hek Noorder Lekdijk, Lopikerkapel, Ut	Lopikerkapel	Ut	\N	\N
3238	12-09-2019	2019-09-12 00:00:00	40/454	pdv_moto	12-09-2019	2019-09-12 00:00:00	40/454	bikedan	51.397049	4.22739887	tegen paal straatnaambord Spuiweg	Rilland	Ze	\N	\N
2420	14-05-2017	2017-05-14 00:00:00	34/43	Amauta	14-05-2017	2017-05-14 00:00:00	34/44	Totl	53.3538551	6.63667297	tegen boom op kerkhof	Toorwerd	Gr	\N	\N
3326	15-12-2019	2019-12-15 00:00:00	40/528	pdv_moto	17-12-2019	2019-12-17 00:00:00	40/530	Hans89	51.5496902	3.46199989	in struikje P-terrein Schelpweg	Domburg	ZH	\N	\N
2970	26-12-2018	2018-12-26 00:00:00	40/143	Amauta	26-12-2018	2018-12-26 00:00:00	40/144	FastEddy	53.1958694	6.51839018	op P-terrein MaDonalds	Hoogkerk	Gr	\N	\N
616	07-11-2011	2011-11-07 00:00:00	13/28	Scoot_020/Scoot_2	07-11-2011	2011-11-07 00:00:00	13/29	Ronald_010	52.3416634	4.79892492	naast banpaal - Sloterweg 1204, Amsterdam, NH	Amsterdam	NH	\N	\N
3728	30-10-2020	2020-10-30 00:00:00	40/868	Carburateur	31-10-2020	2020-10-31 00:00:00	40/868	pdv_moto	52.1189156	4.53583193	in boomstoel Weddepad/Burmadeweg	Benthuizen	ZH	\N	\N
2194	06-08-2016	2016-08-06 00:00:00	31/68	Rik60NL	06-08-2016	2016-08-06 00:00:00	31/68	Rainbow600	52.2441711	4.84733009	aan boom Hollandsedijk	Amstelveen	NH	\N	\N
3648	31-08-2020	2020-08-31 00:00:00	40/807	Amauta	31-08-2020	2020-08-31 00:00:00	40/807	FastEddy	53.23703	6.63606977	aan kromme wilg stadsmarkering S07	Groningen	Gr	\N	\N
773	12-04-2012	2012-04-12 00:00:00	15/29	Kermit de Hond	14-04-2012	2012-04-14 00:00:00	15/31	Buuv	53.1828499	6.57399797	op damwand - Hoornsedijk, Groningen, Gr	Groningen	Gr	\N	\N
4409	01-10-2023	2023-10-01 00:00:00	41/407	FastEddy	04-10-2023	2023-10-04 00:00:00	41/408	BSI	52.6492119	6.70636082	tegen boom bij grenspaal Dr/Ov	Coevorden	Dr	\N	\N
4188	12-05-2022	2022-05-12 00:00:00	41/261	Scoot_020	12-05-2022	2022-05-12 00:00:00	41/261	Outdoor Man	52.3057289	4.75929213	aan motor P-plaats Havenmeestersweg	Schiphol	NH	\N	\N
3314	08-12-2019	2019-12-08 00:00:00	40/522	pdv_moto	08-12-2019	2019-12-08 00:00:00	40/522	Picobello BV	52.0815926	4.2641449	achter hokje bij Haga Ziekenhuis	Den Haag	ZH	\N	\N
1757	03-10-2014	2014-10-03 00:00:00	27/37	jaap43	04-10-2014	2014-10-04 00:00:00	27/38	bikedan	51.6818237	4.48042297	in boom Oostdijk	Willemstad	NB	\N	\N
2192	05-08-2016	2016-08-05 00:00:00	31/66	Rik60NL	05-08-2016	2016-08-05 00:00:00	31/67	Einschtein	52.1928329	4.97159386	in struik Oudekoperdijk	Nieuwer Ter Aa	Ut	\N	\N
92	12-10-2010	2010-10-12 00:00:00	3/65	Smuiger	13-10-2010	2010-10-13 00:00:00	3/66	Hansss	52.4849548	4.89078283	Rustpunt - Zuiderweg, Wijdewormer, NH	Wijdewormer	NH	\N	\N
1186	28-04-2013	2013-04-28 00:00:00	20/56	Mr.Bean	29-04-2013	2013-04-29 00:00:00	20/57	Bludge	51.9714775	5.95545387	bij monument fort Westervoort	Arnhem	Ge	\N	\N
2422	15-05-2017	2017-05-15 00:00:00	34/46	frankivo	15-05-2017	2017-05-15 00:00:00	34/46	Amauta	52.9489594	6.34160614	bij poort openluchttheater - Bosberg	Appelsga	Fr	\N	\N
2283	29-10-2016	2016-10-29 00:00:00	32/82	frankivo	29-10-2016	2016-10-29 00:00:00	32/82	Amauta	52.9079056	6.44755983	aan hek Speelstad Oranje	Oranje	Dr	\N	\N
1397	20-10-2013	2013-10-20 00:00:00	23/50	VreemdeBeet	22-10-2013	2013-10-22 00:00:00	23/51	Janhertog	52.2945328	6.2084012	aan brugleuning - Avergoorsedijk	Schalkhaar	Ov	\N	\N
3665	15-09-2020	2020-09-15 00:00:00	40/819	Artemecion	16-09-2020	2020-09-16 00:00:00	40/820	HighKing	52.534893	4.70665979	aan poot bankje Kemphaanstraat	Uitgeest	NH	\N	\N
3043	18-03-2019	2019-03-18 00:00:00	40/246	BSI	18-03-2019	2019-03-18 00:00:00	40/246	Coenster	52.3396683	4.85632277	aan paal vlaggemast Tripolis-complex	Amsterdam	NH	\N	\N
2217	28-08-2016	2016-08-28 00:00:00	31/93	Roeleey	28-08-2016	2016-08-28 00:00:00	31/94	Einschtein	52.3363953	4.99408484	aan bord Welkom in Overdiemen	Diemen	NH	\N	\N
2916	27-09-2018	2018-09-27 00:00:00	40/70	SadBunny	28-09-2018	2018-09-28 00:00:00	40/72	Outdoor Man	52.3848953	4.86030483	in struik bij molen, Vredenhofpad	Amsterdam	NH	\N	\N
3042	16-03-2019	2019-03-16 00:00:00	40/245	pdv_moto	17-03-2019	2019-03-17 00:00:00	40/245	BSI	52.0900917	4.26675701	aan hek gemaal Verversingskanaal	Den Haag	ZH	\N	\N
1304	13-08-2013	2013-08-13 00:00:00	22/18	Hasseman	13-08-2013	2013-08-13 00:00:00	22/18	piertje moffel	52.3043633	6.87937498	aan wegwijzer - Oldenzaalsedijk	Deurningen	Ov	\N	\N
3788	18-01-2021	2021-01-18 00:00:00	40/922	FastEddy	22-01-2021	2021-01-22 00:00:00	40/923	Amauta	53.1484795	6.76478195	tegen verkeerspaaltje Dassenburcht	Hoogezand	Gr	\N	\N
1608	26-04-2014	2014-04-26 00:00:00	25/82	Rainbow600	27-04-2014	2014-04-27 00:00:00	25/83	Bomba	52.0706291	5.07961082	onder brug Orteliuslaan - Papendorp	Utrecht	Ut	\N	\N
4359	14-06-2023	2023-06-14 00:00:00	41/375	Janhertog	15-06-2023	2023-06-15 00:00:00	41/375	Pydejong	52.8057098	6.09745789	tegen hek uitkijktoren Woldberg	Baars	Ov	\N	\N
4156	02-04-2022	2022-04-02 00:00:00	41/241	Artemicion	02-04-2022	2022-04-02 00:00:00	41/241	Outdoor Man	52.5344658	4.70941591	tegen hek vvorm dagopvang Regenboog	Uitgeest	NH	\N	\N
1895	30-04-2015	2015-04-30 00:00:00	28/65	Bigtwim	01-05-2015	2015-05-01 00:00:00	28/66	Artemecion	53.0758057	5.39311123	aan motor op camping Sotterum	Cornwerd	Fr	\N	\N
130	07-11-2010	2010-11-07 00:00:00	4/60	jean99	08-11-2010	2010-11-08 00:00:00	4/62	Dirk130	51.8276672	4.66746187	uitzichtpunt Rozand, Zwijndrecht, ZH	Zwijndrecht	ZH	\N	\N
1735	05-09-2014	2014-09-05 00:00:00	27/18	Ronald_010	06-09-2014	2014-09-06 00:00:00	27/18	bikedan	51.7210426	4.41738081	aan paaltje golfclub	Numansdorp	ZH	\N	\N
3256	02-10-2019	2019-10-02 00:00:00	40/470	jaap43	02-10-2019	2019-10-02 00:00:00	40/470	Hans89	51.8301849	4.67217016	tegen rand laad/losplaats, Industrieweg	Papendrecht	ZH	\N	\N
188	07-01-2011	2011-01-07 00:00:00	5/86	Smuiger	08-01-2011	2011-01-08 00:00:00	5/90	bobcat	52.4620361	4.77654982	hek Relkepad, Westzaan, NH	Westzaan	NH	\N	\N
1250	23-06-2013	2013-06-23 00:00:00	21/48	bikedan	24-06-2013	2013-06-24 00:00:00	21/50	Hans89	51.6278152	4.25821018	aan boom op de gorzen bij	de Heen	NB	\N	\N
3799	04-02-2021	2021-02-04 00:00:00	40/929	pdv_moto	05-02-2021	2021-02-05 00:00:00	40/930	Picobello BV	51.9527283	4.29177713	tegen boom knooppunt 32 Kwakelweg	Maasland	ZH	\N	\N
1490	24-01-2014	2014-01-24 00:00:00	24/52	tdemmer	24-01-2014	2014-01-24 00:00:00	24/53	Hans89	51.5501671	3.54637909	aan hek Hoge Duvekotseweg	Oostkapelle	Ze	\N	\N
2594	17-11-2017	2017-11-17 00:00:00	36/65	SadBunny	17-11-2017	2017-11-17 00:00:00	36/65	Bigtwim	52.3587494	4.88027811	in plantenbak van der Veldestraat	Amsterdam	NH	\N	\N
1098	28-02-2013	2013-02-28 00:00:00	19/30	Roeleey	28-02-2013	2013-02-28 00:00:00	19/30	Corney28	52.3608513	4.93238115	achter bord Muiderpoortstation	Amsterdam	NH	\N	\N
4017	29-08-2021	2021-08-29 00:00:00	41/148	Roeleey	29-08-2021	2021-08-29 00:00:00	41/149	ootje	52.3858604	4.74434519	tegen poot bord Testlocatie	Halfweg	NH	\N	\N
3407	08-03-2020	2020-03-08 00:00:00	40/587	Amauta	08-03-2020	2020-03-08 00:00:00	40/587	FastEddy	53.1352768	6.43406391	tegen boom bij Winginkhof	Roden	Dr	\N	\N
2125	13-05-2016	2016-05-13 00:00:00	30/94	Amauta	13-05-2016	2016-05-13 00:00:00	30/95	frankivo	53.0074806	7.193995	onder wachttoren op Wal	Bourtange	Gr	\N	\N
827		0001-01-01 00:00:00 BC		ootje		0001-01-01 00:00:00 BC			\N	\N				\N	\N
3397	01-03-2020	2020-03-01 00:00:00	40/579	pdv_moto	02-03-2020	2020-03-02 00:00:00	40/580	Outdoor Man	52.0849991	4.27396917	onder standbeeld Amazone, Conradkade	Den Haag	ZH	\N	\N
426	11-06-2011	2011-06-11 00:00:00	10/49	Outdoor Man	12-06-2011	2011-06-12 00:00:00	10/51	BigJim	52.7235031	5.05263281	aan steiger - Broerdijk, Midwoud, NH	Midwoud	NH	\N	\N
3611	05-08-2020	2020-08-05 00:00:00	40/767	Bensi	06-08-2020	2020-08-06 00:00:00	40/768	Picobello BV	51.9875488	6.05096722	aan plaatsnaambord Uitmeensestraat	Giesbeek	Ge	\N	\N
1800	27-11-2014	2014-11-27 00:00:00	27/77	frankivo	28-11-2014	2014-11-28 00:00:00	27/77	pinpoint	52.7333794	6.52083302	achter kast - Achteromsedijk	Hoogeveen	Dr	\N	\N
3051	24-03-2019	2019-03-24 00:00:00	40/251	jaap43	24-03-2019	2019-03-24 00:00:00	40/251	Bomba	52.1025581	4.61310577	aan paalje bij molen bij de Papenvaart	Hazerswoude-Dorp	ZH	\N	\N
3755	22-11-2020	2020-11-22 00:00:00	40/888	Outdoor Man	25-11-2020	2020-11-25 00:00:00	40/891	HermanK	52.7014465	5.27681923	tegen boom bij Koepoort	Enkhuizen	NH	\N	\N
682	04-01-2012	2012-01-04 00:00:00	14/09	Ronald_010	05-01-2012	2012-01-05 00:00:00	14/09	tdemmer	51.859108	4.64140177	aan paal bij Oostmolendijk, Ridderkerk, ZH	Ridderkerk	ZH	\N	\N
652	03-12-2011	2011-12-03 00:00:00	13/66	me-daph	04-12-2011	2011-12-04 00:00:00	13/67	Hasseman	52.2939148	6.5600338	aan hek bij Carpoolplaats Rijssenseweg, Enter, Ov	Enter	Ov	\N	\N
2323	30-12-2016	2016-12-30 00:00:00	33/30	Amauta	31-12-2016	2016-12-31 00:00:00	33/30	SadBunny	52.9270287	5.04959488	aan eind strekdam haven	Den Oever	NH	\N	\N
2580	04-11-2017	2017-11-04 00:00:00	36/48	pdv_moto	04-11-2017	2017-11-04 00:00:00	36/49	tdemmer	51.5465126	3.50992393	tegen kerkmuur	Aagtekerke	Ze	\N	\N
474	28-07-2011	2011-07-28 00:00:00	11/24	tdemmer	29-07-2011	2011-07-29 00:00:00	11/24	BSI	52.1623917	4.85446787	Uitweg 22, Woerdense Verlaat, ZH	Woerdense Verlaat	ZH	\N	\N
2618	19-01-2018	2018-01-19 00:00:00	37/09	HighKing	19-01-2018	2018-01-19 00:00:00	37/10	pdv_moto	52.1550636	5.387012	aan kademuur bij OLV-toren	Amersfoort	Ut	\N	\N
2201	12-08-2016	2016-08-12 00:00:00	31/74	Janhertog	12-08-2016	2016-08-12 00:00:00	31/75	bikedan	50.7686653	5.99555206	aan lantaarnpaal - Vaalsbroek	Vaals	Li	\N	\N
1709	10-08-2014	2014-08-10 00:00:00	26/91	Hasseman	13-08-2014	2014-08-13 00:00:00	26/93	MotorMieke	52.3302498	6.61385012	aan hek Leemslagenweg naast A35	Enter	Ov	\N	\N
4065	13-11-2021	2021-11-13 00:00:00	41/178	pdv_moto	18-11-2021	2021-11-18 00:00:00	41/179	ootje	51.5184746	3.46396399	aan hek Boudewijnskerke	Zoutelande	Ze	\N	\N
2460	16-06-2017	2017-06-16 00:00:00	34/87	Totl	19-06-2017	2017-06-19 00:00:00	34/89	Janhertog	52.8607292	5.39333487	naast muur P-plek Skarl - Rode Klif	Warns	Gr	\N	\N
3058	28-03-2019	2019-03-28 00:00:00	40/255	pdv_moto	29-03-2019	2019-03-29 00:00:00	40/256	Rik60NL	52.111557	4.27842283	tegen muur Scheveningseslag	Scheveningen	ZH	\N	\N
875	29-07-2012	2012-07-29 00:00:00	16/56	MarkieNL	29-07-2012	2012-07-29 00:00:00	16/56	Franko P	51.4330254	5.15728378	onder boom bij Neterselsedijk	Esbeek	NB	\N	\N
1455	30-12-2013	2013-12-30 00:00:00	24/14	tdemmer	31-12-2013	2013-12-31 00:00:00	24/15	Ronald_010	51.8117256	4.76740599	in knotwilg - Baanhoekweg	Dordrecht	ZH	\N	\N
3806	14-02-2021	2021-02-14 00:00:00	40/934	FastEddy	17-02-2021	2021-02-17 00:00:00	40/936	MeanYellowBoy	52.5165596	6.56787491	aan hek bij vistrap Vecht	Marienberg	Ov	\N	\N
134	10-11-2010	2010-11-10 00:00:00	4/70	dolfijneflipper	10-11-2010	2010-11-10 00:00:00	4/71	Smuiger	52.2762108	4.85391283	fietspad Gondel/Galjoen, Amstelveen, NH	Amstelveen	NH	\N	\N
17	25-08-2010	2010-08-25 00:00:00	1/40	Melchen	25-08-2010	2010-08-25 00:00:00	1/43	Jessica33	51.5014648	5.39108992	Witte de Withstraat, Best, NB	Best	NB	\N	\N
932	23-09-2012	2012-09-23 00:00:00	17/10	BSI	23-09-2012	2012-09-23 00:00:00	17/10	Hasseman	52.505188	6.02271891	achter kast -  Gemaal - Geldersedijk	Hattem	Ge	\N	\N
3106	06-05-2019	2019-05-06 00:00:00	40/310	bikedan	07-05-2019	2019-05-07 00:00:00	40/311	HermanK	52.0310478	5.64160919	in struik Morsestraat	Ede	Ge	\N	\N
4395	31-08-2023	2023-08-31 00:00:00	41/397	Amauta	01-09-2023	2023-09-01 00:00:00	41/398	Pydejong	53.1975555	6.4485178	in wilg aan de Matsloot	Oostwold	Gr	\N	\N
1197	05-05-2013	2013-05-05 00:00:00	20/68	tdemmer	06-05-2013	2013-05-06 00:00:00	20/69	Meifesto	51.911705	4.5725379	in struik Stormpolder	Krimpen aan den IJssel	ZH	\N	\N
3086	22-04-2019	2019-04-22 00:00:00	40/283	pdv_moto	23-04-2019	2019-04-23 00:00:00	40/283	Coenster	52.1013412	4.29452276	in heg naast brug Cremerweg	Den Haag	ZH	\N	\N
2912	23-09-2018	2018-09-23 00:00:00	40/66	BSI	25-09-2018	2018-09-25 00:00:00	40/67	Outdoor Man	52.2850723	5.73712206	in heg bij de watermolen	Staverden	Ge	\N	\N
4162	12-04-2022	2022-04-12 00:00:00	41/246	wachtbalkje	14-04-2022	2022-04-14 00:00:00	41/246	Outdoor Man	51.8672714	5.98104715	bij beeld "dijk van een Wijf"	Gendt	Ge	\N	\N
3857	01-04-2021	2021-04-01 00:00:00	41/027	Outdoor Man	01-04-2021	2021-04-01 00:00:00	41/027	Amauta	52.4971542	4.59235811	achter wesp op brommer, Relweg	Wijk aan Zee	NH	\N	\N
3000	30-01-2019	2019-01-30 00:00:00	40/191	FastEddy	01-02-2019	2019-02-01 00:00:00	40/193	Amauta	52.9256058	6.81154013	in hulststruik bij hunebed D29	Borger	Dr	\N	\N
3669	17-09-2020	2020-09-17 00:00:00	40/822	wachtbalkje	18-09-2020	2020-09-18 00:00:00	40/822	Amauta	52.3674088	6.07320595	tegen paal Valkennestkast, IJsseldijk	Veessen	Ge	\N	\N
1339	03-09-2013	2013-09-03 00:00:00	22/61	Scoot_020/Scoot_2	03-09-2013	2013-09-03 00:00:00	22/62	Ronald_010	52.3502159	4.8040638	bij bootje aan waterkant Hoekens	Amsterdam	NH	\N	\N
2333	22-01-2017	2017-01-22 00:00:00	33/47	inSaNo	10-02-2017	2017-02-10 00:00:00	33/55	Corney28	53.449379	5.62523603	bij paaltje P-terrein vuurtoren Ameland	Hollum	Fr	\N	\N
2017	26-09-2015	2015-09-26 00:00:00	29/70	ootje	29-09-2015	2015-09-29 00:00:00	29/71	Amauta	52.9903831	5.49316978	aan hek fietspad	Nijhuizum	Fr	\N	\N
4340	17-05-2023	2023-05-17 00:00:00	41/363	scheurschuimpje	17-05-2023	2023-05-17 00:00:00	41/364	Pydejong	52.8367805	5.9354558	achter boom Lindedijk	Nijetrijne	Fr	\N	\N
925	17-09-2012	2012-09-17 00:00:00	17/03	magnamaniac	18-09-2012	2012-09-18 00:00:00	17/04	Hasseman	51.835598	5.68137503	hoek Dorpsstraat/Broekstraat	Hernen	Ge	\N	\N
10	22-08-2010	2010-08-22 00:00:00	1/23	Mckay1	23-08-2010	2010-08-23 00:00:00	1/25	sjoemie	52.672039	6.43694687	Oosterweg, Zuidwolde, Dr	Zuidwolde	Dr	\N	\N
1171	15-04-2013	2013-04-15 00:00:00	20/33	SadBunny	16-04-2013	2013-04-16 00:00:00	20/34	Outdoor Man	52.1706657	5.00245905	in heg bij Expertwinkel - Straatweg	Breukelen	Ut	\N	\N
702	10-02-2012	2012-02-10 00:00:00	14/42	scheurschuimpje	13-02-2012	2012-02-13 00:00:00	14/45	Hasseman	52.8359489	6.1177268	achter boom zijweg v. Karnebeeklaan, Eese, Ov	Eese	Ov	\N	\N
1854	27-02-2015	2015-02-27 00:00:00	28/21	-juliet-	01-03-2015	2015-03-01 00:00:00	28/22	MotorDonkey	52.0845757	5.10212421	stand zelftrailrijden - jaarbeurs 10C021	Utrecht	Ut	\N	\N
2339	17-02-2017	2017-02-17 00:00:00	33/59	tdemmer	18-02-2017	2017-02-18 00:00:00	33/60	pdv_moto	51.6823311	4.41978312	aan hek Helsedijk - Heyningen	Willemstad	NB	\N	\N
2508	07-08-2017	2017-08-07 00:00:00	35/41	bikedan	07-08-2017	2017-08-07 00:00:00	35/42	pdv_moto	51.4248047	4.0728488	bij molen de Hoed - Havenoordseweg	Waarde	Ze	\N	\N
2623	24-01-2018	2018-01-24 00:00:00	37/15	BSI	24-01-2018	2018-01-24 00:00:00	37/16	HighKing	52.1548233	5.37144995	achter E-kast Piet Mondriaanplein	Amersfoort	Ut	\N	\N
3521	30-05-2020	2020-05-30 00:00:00	40/683	Amauta	31-05-2020	2020-05-31 00:00:00	40/684	pdv_moto	53.1828461	6.57398605	achter bord 60 bij mast 1040	Groningen	Gr	\N	\N
1809	17-12-2014	2014-12-17 00:00:00	27/84	B.B.I.L.	21-12-2014	2014-12-21 00:00:00	27/85	Meangreengirl/MeanBlueMan	51.9191246	5.86094904	aan blauw kunstwerk - Coloseum	Elst	Ge	\N	\N
3423	21-03-2020	2020-03-21 00:00:00	40/602	vuurbloed	21-03-2020	2020-03-21 00:00:00	40/602	HighKing	52.2726669	4.64607477	onder brugdek Maanweg	Nieuw-Vennep	NH	\N	\N
4172	26-04-2022	2022-04-26 00:00:00	41/251	Amauta	26-04-2022	2022-04-26 00:00:00	41/252	FastEddy	53.061573	6.47597313	achter monument 8-4-1945 Veldweg	Norg	Dr	\N	\N
1240	11-06-2013	2013-06-11 00:00:00	21/35	jaap43	11-06-2013	2013-06-11 00:00:00	21/35	Hans89	51.6098099	4.66444111	aan hek Strijpenseweg	Prinsenbeek	NB	\N	\N
1701	26-07-2014	2014-07-26 00:00:00	26/79	MLB	28-07-2014	2014-07-28 00:00:00	26/81	Phaedrus	51.5575905	5.29425478	bij stuw Beerze - Koevoortseweg	Boxtel	NB	\N	\N
469	20-07-2011	2011-07-20 00:00:00	11/14	tdemmer	20-07-2011	2011-07-20 00:00:00	11/14	wesleyc	52.0153008	4.55550718	Bleiswijkse verlaat - Rottedijk, Bleiswijk, ZH	Bleiswijk	ZH	\N	\N
1003	23-11-2012	2012-11-23 00:00:00	18/08	BigJim	23-11-2012	2012-11-23 00:00:00	18/08	Bigtwim	52.6141663	4.76682711	aan knotwilg - Zeglis	Alkmaar	NH	\N	\N
4026	10-09-2021	2021-09-10 00:00:00	41/153	Janhertog	12-09-2021	2021-09-12 00:00:00	41/153	BSI	52.7947273	6.09825802	achter doek bouw school Tukseweg	Tuk	Ov	\N	\N
3975	09-07-2021	2021-07-09 00:00:00	41/120	gieli0	11-07-2021	2021-07-11 00:00:00	41/121	BSI	51.9566078	5.59228182	bij ingang Laarsenberg	Rhenen	Ut	\N	\N
3076	15-04-2019	2019-04-15 00:00:00	40/271	Coenster	15-04-2019	2019-04-15 00:00:00	40/271	pdv_moto	52.3658943	4.90966606	achter struik Plantage Middenweg	Amsterdam	NH	\N	\N
2881	25-08-2018	2018-08-25 00:00:00	40/33	HermanK	26-08-2018	2018-08-26 00:00:00	40/34	FastEddy	52.6200294	6.3720808	tegen hekpost bij Reestkerk	Oud Avereest	Ov	\N	\N
2146	07-06-2016	2016-06-07 00:00:00	31/20	BSI	07-06-2016	2016-06-07 00:00:00	31/20	nappertje	52.1461792	5.56220198	aan hekpost Otelaarseweg	Barneveld	Ge	\N	\N
4081	02-01-2022	2022-01-02 00:00:00	41/191	Outdoor Man	03-01-2022	2022-01-03 00:00:00	41/192	BSI	52.5821838	4.69218588	bij trap Calvarieberg Diocesaan H'dom	Heiloo	NH	\N	\N
3134	04-06-2019	2019-06-04 00:00:00	40/346	Sjefman	04-06-2019	2019-06-04 00:00:00	40/347	ey-dzeej	51.8712234	4.33447123	aan paal Venkelweg	Hoogvliet	ZH	\N	\N
1574	30-03-2014	2014-03-30 00:00:00	25/48	BSI	30-03-2014	2014-03-30 00:00:00	25/49	Wimis on	52.1062012	5.07555723	in konijnenhol - Isotopenweg	Utrecht	Ut	\N	\N
164	12-12-2010	2010-12-12 00:00:00	5/38	Wimis on	13-12-2010	2010-12-13 00:00:00	5/39	bobcat	52.0096397	5.05202103	zendmast Hogebiezendijk, IJsselstein, Ut	IJsselstein	Ut	\N	\N
3747	13-11-2020	2020-11-13 00:00:00	40/882	Thijs67	14-11-2020	2020-11-14 00:00:00	40/882	k0en	52.1069183	5.25757694	in struik Blanckenhagenweg	Huis ter Heide	Ut	\N	\N
1349	13-09-2013	2013-09-13 00:00:00	22/76	Corney28	13-09-2013	2013-09-13 00:00:00	22/76	BSI	52.8480682	5.6809721	bij gemaal Wouda - Gemaalweg	Lemmer	Fr	\N	\N
2610	30-12-2017	2017-12-30 00:00:00	36/93	BornToReign	30-12-2017	2017-12-30 00:00:00	36/93	Okami_Xci	51.8055305	5.96561289	tegen boom Oude Kleefsebaan	Groesbeek	Li	\N	\N
2809	06-07-2018	2018-07-06 00:00:00	39/51	Amauta	06-07-2018	2018-07-06 00:00:00	39/52	MP_NL	52.2619514	5.04253197	aan boom kasteel Nederhorst	Nederhorst den Berg	NH	\N	\N
2875	22-08-2018	2018-08-22 00:00:00	40/27	HighKing	23-08-2018	2018-08-23 00:00:00	40/28	Coenster	52.9328003	4.79109716	in struik Oostoeverweg	Den Helder	NH	\N	\N
3411	12-03-2020	2020-03-12 00:00:00	40/590	Outdoor Man	15-03-2020	2020-03-15 00:00:00	40/591	pdv_moto	52.3059464	6.9004302	tegen E-kast Bornsedijk	oldenzaal	Ov	\N	\N
2549	19-09-2017	2017-09-19 00:00:00	36/01	ArendJan	19-09-2017	2017-09-19 00:00:00	36/02	pdv_moto	51.9013367	4.29875994	bij AWZI Maaslandsedijk	Vlaardingen	ZH	\N	\N
4068	23-11-2021	2021-11-23 00:00:00	41/181	Bensi	26-11-2021	2021-11-26 00:00:00	41/182	BSI	52.0475578	6.31941509	tegen paaltje bij stuw Aaltenseweg	Hengelo	Ge	\N	\N
935		0001-01-01 00:00:00 BC		Eady		0001-01-01 00:00:00 BC			\N	\N				\N	\N
1660	06-06-2014	2014-06-06 00:00:00	26/35	Ronald_010	13-06-2014	2014-06-13 00:00:00	26/38	Roeleey	50.7653046	5.84499693	aan paal einde fietspad - Schilberg	Slenaken	Li	\N	\N
2233	11-09-2016	2016-09-11 00:00:00	32/09	Amauta	11-09-2016	2016-09-11 00:00:00	32/10	pdv_moto	52.8958092	6.95844984	bij bank de Modderman - Dreef	Valthermond	Dr	\N	\N
3304	14-11-2019	2019-11-14 00:00:00	40/510	ey-dzeej	14-11-2019	2019-11-14 00:00:00	40/510	Carburateur	51.976696	4.57297182	aan boom Zevenhuizerplas, Kosboulevaar	Rotterdam	ZH	\N	\N
1782	27-10-2014	2014-10-27 00:00:00	27/60	Dirtbag	31-10-2014	2014-10-31 00:00:00	27/61	BSI	52.2361641	6.1391468	in heg P-terrein Wilpsedijk	Wilp	Ge	\N	\N
1738	07-09-2014	2014-09-07 00:00:00	27/20	bikedan	08-09-2014	2014-09-08 00:00:00	27/21	crazy987	51.4282036	4.31037617	in heg bij tank WO2 - Onderstal	Woensdrecht	NB	\N	\N
2612	06-01-2018	2018-01-06 00:00:00	36/97	pdv_moto	08-01-2018	2018-01-08 00:00:00	36/99	JorisK	51.3749428	4.24516678	onder trapje - grensweg	Rilland	Ze	\N	\N
2806	03-07-2018	2018-07-03 00:00:00	39/47	Raviel	03-07-2018	2018-07-03 00:00:00	39/48	Bensi	51.8542061	6.09246016	aan peilschaal Astreastraat	Tolkamer-Lobith	Ge	\N	\N
2138	27-05-2016	2016-05-27 00:00:00	31/10	Scoot_020/Scoot_2	27-05-2016	2016-05-27 00:00:00	31/11	Ronald_010	51.6804848	5.3675971	aan boom Poeldonk	Den Dungen	NB	\N	\N
2225	03-09-2016	2016-09-03 00:00:00	32/02	Bigtwim	04-09-2016	2016-09-04 00:00:00	32/02	ootje	52.4667091	4.60314322	aan bord Middensluiseiland	Ijmuiden	NH	\N	\N
1556	13-03-2014	2014-03-13 00:00:00	25/24	SparkViv	14-03-2014	2014-03-14 00:00:00	25/25	jaap43	51.8925972	4.33795118	aan hek eind Vondelingenweg	Rotterdam	ZH	\N	\N
423	10-06-2011	2011-06-10 00:00:00	10/45	Scoot_020/Scoot_2	10-06-2011	2011-06-10 00:00:00	10/46	Outdoor Man	52.3794098	4.79278612	aan boom - Langbroekdreef, Amsterdam, NH	Amsterdam	NH	\N	\N
2379	11-04-2017	2017-04-11 00:00:00	34/04	frankivo	11-04-2017	2017-04-11 00:00:00	34/05	Amauta	53.1766815	6.57492924	aan beschoeing bij molen de Helper	Haren	Gr	\N	\N
1071	08-02-2013	2013-02-08 00:00:00	18/97	Corney28	08-02-2013	2013-02-08 00:00:00	18/97	Roeleey	52.1971779	4.88609409	aan ophaalbrug - Wilnissezijweg	Wilnis	Ut	\N	\N
1498	05-02-2014	2014-02-05 00:00:00	24/62	Splinnie	06-02-2014	2014-02-06 00:00:00	24/64	BigJim	52.4876595	4.63358402	aan boom op eiland Zeestraatvijver	Beverwijk	NH	\N	\N
1320	21-08-2013	2013-08-21 00:00:00	22/32	Bensi	22-08-2013	2013-08-22 00:00:00	22/33	Corney28	52.6924553	5.28018713	bij zendmast - Zuiderzeemuseum	Enkhuizen	NH	\N	\N
103	21-10-2010	2010-10-21 00:00:00	3/90	Starscream	21-10-2010	2010-10-21 00:00:00	3/91	Bensi	52.1167183	6.66267204	watertoren, Eibergen, Ge	Eibergen	Ge	\N	\N
2496	23-07-2017	2017-07-23 00:00:00	35/27	Amauta	23-07-2017	2017-07-23 00:00:00	35/27	Okami_Xci	50.826004	5.695436	achter poort slavante	Maastricht	Li	\N	\N
1474	14-01-2014	2014-01-14 00:00:00	24/35	Roeleey	14-01-2014	2014-01-14 00:00:00	24/36	Corney28	52.2970123	4.95851421	bij chauffeurshok - Meibergdreef	Amsterdam	NH	\N	\N
1202	08-05-2013	2013-05-08 00:00:00	20/74	Hans89	08-05-2013	2013-05-08 00:00:00	20/75	meylie-style	51.5022659	4.3325901	achter bank ereveld	Bergen op Zoom	NB	\N	\N
898	12-08-2012	2012-08-12 00:00:00	16/76	rvdh86	13-08-2012	2012-08-13 00:00:00	16/76	cock	52.4907494	5.43951988	aan hek Buizerdweg	Lelystad	Fl	\N	\N
960	22-10-2012	2012-10-22 00:00:00	17/45	V-Strommert	23-10-2012	2012-10-23 00:00:00	17/46	Ronald_010	52.263176	4.62909603	aan brug - Haeringenplt	Nieuw-Vennep	NH	\N	\N
264	10-03-2011	2011-03-10 00:00:00	7/83	tdemmer	10-03-2011	2011-03-10 00:00:00	7/84	ElBarto	52.4480553	4.64333296	tuinbaaswoning - P.C. Hooftlaan 93, Driehuis, NH	Driehuis	NH	\N	\N
2282	28-10-2016	2016-10-28 00:00:00	32/80	Janhertog	29-10-2016	2016-10-29 00:00:00	32/82	frankivo	52.7561531	5.96284389	onder brug Rieweg gehucht 	Nederland	Ov	\N	\N
2361	22-03-2017	2017-03-22 00:00:00	33/83	PatrickSoler	22-03-2017	2017-03-22 00:00:00	33/83	pdv_moto	52.4350624	4.81097698	in bosje P-vak Westzanerdijk	Zaandam	NH	\N	\N
4407	29-09-2023	2023-09-29 00:00:00	41/406	blub blub 	30-09-2023	2023-09-30 00:00:00	41/406	Bensi	52.0286217	6.05166101	in hoek P-plaats "de Lappendeken"	de Steegh	Ge	\N	\N
1696	23-07-2014	2014-07-23 00:00:00	26/74	Roeleey	24-07-2014	2014-07-24 00:00:00	26/75	Blogem	52.2912254	5.07437801	aan poot ANWB-bord - Gooilandseweg	Weesp	NH	\N	\N
2567	15-10-2017	2017-10-15 00:00:00	36/30	Amauta	16-10-2017	2017-10-16 00:00:00	36/32	frankivo	53.1644745	6.39384222	in heg bij kast W.L. van Nassaulaan	Midwolde	Gr	\N	\N
1853	27-02-2015	2015-02-27 00:00:00	28/21	me-daph	27-02-2015	2015-02-27 00:00:00	28/21	-juliet-	52.0847816	5.10296106	stand ik wil … jaarbeurs 09E061	Utrecht	Ut	\N	\N
3515	26-05-2020	2020-05-26 00:00:00	40/677	pdv_moto	26-05-2020	2020-05-26 00:00:00	40/677	ey-dzeej	52.0988846	4.29872084	in heg bij Madurodam	Den Haag	ZH	\N	\N
544	16-09-2011	2011-09-16 00:00:00	12/12	V-Strommert	16-09-2011	2011-09-16 00:00:00	12/14	Scoot_020/Scoot_2	52.2642212	4.63517618	aan telefooncel - Venneperweg, Nieuw Vennep, NH	Nieuw-Vennep	NH	\N	\N
3389	22-02-2020	2020-02-22 00:00:00	40/574	wachtbalkje	22-02-2020	2020-02-22 00:00:00	40/573	Marsian	52.2648697	5.68089199	aan bord Dodenweg, 	Ermelo	Ge	\N	\N
4042	04-10-2021	2021-10-04 00:00:00	41/163	k0en	04-10-2021	2021-10-04 00:00:00	41/163	pdv_moto	52.1140137	5.13870192	in spoortstaaf hoek Kapelweg	Utrecht	Ut	\N	\N
2325	02-01-2017	2017-01-02 00:00:00	33/32	pdv_moto	03-01-2017	2017-01-03 00:00:00	33/33	Ronald_010	52.0967827	4.28578901	aan boompje van Stolkweg	Den Haag	ZH	\N	\N
3179	28-07-2019	2019-07-28 00:00:00	40/395	ronk	28-07-2019	2019-07-28 00:00:00	40/396	Deeffox	51.8602333	4.98015785	aan hek MC de Bougie, Vlietsekade	Arkel	ZH	\N	\N
2707	14-04-2018	2018-04-14 00:00:00	38/30	Bensi	15-04-2018	2018-04-15 00:00:00	38/31	BSI	52.1180077	6.53797483	aan kunstwerk Hekweg	Borculo	Ge	\N	\N
4054	28-10-2021	2021-10-28 00:00:00	41/171	Sjefman	28-10-2021	2021-10-28 00:00:00	41/171	Hans89	51.8486214	4.26976204	tegen hekpaal Ringdijk	Geervliet	ZH	\N	\N
788	27-04-2012	2012-04-27 00:00:00	15/43	frankwijers	28-04-2012	2012-04-28 00:00:00	15/44	Ronald_010	52.0232697	5.28570604	bij paaltje slot Sterkenburg, Driebergen, Ut	Driebergen	Ut	\N	\N
3881	16-04-2021	2021-04-16 00:00:00	41/045	Ronny Rabbelaar	16-04-2021	2021-04-16 00:00:00	41/045	Amauta	51.5876579	5.08682394	tegen boom bij motorhuis Brabant	Tilburg	NB	\N	\N
724	05-03-2012	2012-03-05 00:00:00	14/75	Ronald_010	06-03-2012	2012-03-06 00:00:00	14/76	Dirk130	51.9783745	4.42675495	in knotwilg - Molenweg, Berkel en Rodenrijs, ZH	Berkel en Rodenrijs	ZH	\N	\N
3636	21-08-2020	2020-08-21 00:00:00	40/796	Outdoor Man	21-08-2020	2020-08-21 00:00:00	40/796	Roeleey	52.2870216	4.935184	onder vlonder weidemolentje 	Ouderlerk a/d Amstel	NH	\N	\N
3994	24-07-2021	2021-07-24 00:00:00	41/133	Hans89	25-07-2021	2021-07-25 00:00:00	41/133	WillyvD	51.9172745	4.53804922	aan kunstwerk Bahialaan Rivium	Capelle aan den Ijssel	ZH	\N	\N
4005	14-08-2021	2021-08-14 00:00:00	41/141	Outdoor Man	15-08-2021	2021-08-15 00:00:00	41/141	FastEddy	52.3255577	4.89434385	tegen hek in Amstelpark Buitenveldert	Amsterdam	NH	\N	\N
1502	07-02-2014	2014-02-07 00:00:00	24/67	bobcat	08-02-2014	2014-02-08 00:00:00	24/68	ootje	52.5008316	4.68214798	onder bruggetje bij de Weid	Heemskerk	NH	\N	\N
673	25-12-2011	2011-12-25 00:00:00	13/92	Von Stolk	26-12-2011	2011-12-26 00:00:00	13/94	tdemmer	52.0065956	4.72058916	langs voetpad Haastrechtsebrug, Gouda, ZH	Gouda	ZH	\N	\N
72		0001-01-01 00:00:00 BC				0001-01-01 00:00:00 BC		bobcat	\N	\N				\N	\N
153	28-11-2010	2010-11-28 00:00:00	5/21	BigJim	28-11-2010	2010-11-28 00:00:00	5/23	hplaverda	52.5873032	4.83935404	molen Menningweerdijk, Grootschermer, NH	Grootschermer	NH	\N	\N
2127	15-05-2016	2016-05-15 00:00:00	30/95	Amauta	15-05-2016	2016-05-15 00:00:00	30/96	Ronald_010	52.8518486	6.31381989	achter steen molen de Vlijt - Oldendiever	Diever	Dr	\N	\N
1140	26-03-2013	2013-03-26 00:00:00	19/83	Ronald_010	27-03-2013	2013-03-27 00:00:00	19/83	Geert-26	51.9038391	4.36965609	aan portaal Schiedamsedijk	Vlaardingen	ZH	\N	\N
3715	23-10-2020	2020-10-23 00:00:00	40/858	pdv_moto	23-10-2020	2020-10-23 00:00:00	40/858	Sjefman	52.096138	4.33013105	tegen boom ANWB Wassenaarseweg	Den Haag	ZH	\N	\N
2913	25-09-2018	2018-09-25 00:00:00	40/67	Outdoor Man	25-09-2018	2018-09-25 00:00:00	40/68	HighKing	52.3861046	4.84692717	achter beeld van de Verdwenen Boer	Amsterdam	NH	\N	\N
2951	25-11-2018	2018-11-25 00:00:00	40/115	scheurschuimpje	04-12-2018	2018-12-04 00:00:00	40/119	DKP	51.295681	3.86216903	tegen E-kast kruising N290/N62	Terneuzen	Ze	\N	\N
467	18-07-2011	2011-07-18 00:00:00	11/10	Wimis on	19-07-2011	2011-07-19 00:00:00	11/12	Ronald_010	51.5762482	5.06387091	achter muurtje plantsoen - Hasseltplein, Tilburg, NB	Tilburg	NB	\N	\N
1998	22-08-2015	2015-08-22 00:00:00	29/51	leeqnl	23-08-2015	2015-08-23 00:00:00	29/51	Amauta	53.2188797	6.54914522	in heg bij watertoren	Groningen	Gr	\N	\N
816	05-06-2012	2012-06-05 00:00:00	15/78	scheurschuimpje	06-06-2012	2012-06-06 00:00:00	15/79	Outdoor Man	52.8769379	6.00156116	in restaurant 't Lagerhuis, Wolvega, Fr	Wolvega	Fr	\N	\N
288	25-03-2011	2011-03-25 00:00:00	8/28	Smuiger	25-03-2011	2011-03-25 00:00:00	8/30	Outdoor Man	52.7337303	4.9331398	hek bij Koningspade 36, Hoogwoud, NH	Hoogwoud	NH	\N	\N
184	01-01-2011	2011-01-01 00:00:00	5/75	black mule	02-01-2011	2011-01-02 00:00:00	5/78	moturist	53.2197342	6.56884813	nis kerkmuur - Martinikerkhof, Groningen, Gr	Groningen	Gr	\N	\N
3731	01-11-2020	2020-11-01 00:00:00	40/869	Outdoor Man	02-11-2020	2020-11-02 00:00:00	40/870	Bensi	51.9665451	6.78483915	achter kijkscherm kalkgroeve	Winterswijk	Ge	\N	\N
2715	19-04-2018	2018-04-19 00:00:00	38/41	MeanYellowBoy	19-04-2018	2018-04-19 00:00:00	38/41	aisnoek	52.605896	6.38608789	achter bord Heuveltjesbosbad	Balkbrug	Ov	\N	\N
4077	20-12-2021	2021-12-20 00:00:00	41/188	pdv_moto	28-12-2021	2021-12-28 00:00:00	41/189	MIA	52.0695419	4.22182989	in plantsoen Deltaplein	Kijkduin	ZH	\N	\N
2128	15-05-2016	2016-05-15 00:00:00	30/96	Ronald_010	16-05-2016	2016-05-16 00:00:00	30/97	BSI	52.1278534	4.58276892	in hoop stenen rotonde	Hazerswoude-Rijndijk	ZH	\N	\N
1154	03-04-2013	2013-04-03 00:00:00	20/03	Bludge	03-04-2013	2013-04-03 00:00:00	20/05	Mr.Bean	51.8504486	6.10494089	in boom Europakade	Tolkamer	Ge	\N	\N
3980	18-07-2021	2021-07-18 00:00:00	41/125	FastEddy	19-07-2021	2021-07-19 00:00:00	41/125	Amauta	53.0155029	6.99926376	aan hek bij kijkscherm Sikkenbergweg	Stadskanaal	Gr	\N	\N
731	11-03-2012	2012-03-11 00:00:00	14/81	ronk	11-03-2012	2012-03-11 00:00:00	14/82	jaap43	51.8301659	4.96587896	aan schotbalkhuis. Wolphertsedijk, Gorinchem, ZH	Gorinchem	ZH	\N	\N
3767	17-12-2020	2020-12-17 00:00:00	40/903	Outdoor Man	17-12-2020	2020-12-17 00:00:00	40/904	HighKing	52.2938728	5.08148718	in knotwilg bij fort Uitermeer	Weesp	NH	\N	\N
476	29-07-2011	2011-07-29 00:00:00	11/26	wesleyc	29-07-2011	2011-07-29 00:00:00	11/26	jaap43	51.9881935	4.11832809	bunker Strandboulevard, Hoek van Holland, ZH	Hoek van Holland	ZH	\N	\N
1601	20-04-2014	2014-04-20 00:00:00	25/74	Ronald_010	20-04-2014	2014-04-20 00:00:00	25/75	BSI	51.5627251	4.55541515	in stronk Oude A.postbaan	Bosschenhoofd	NB	\N	\N
3851	28-03-2021	2021-03-28 00:00:00	41/022	pdv_moto	29-03-2021	2021-03-29 00:00:00	41/023	Bomba	52.1210556	4.67453194	tegen kunstwerk Oranje Nassausingel	Alphen aan den Rijn	ZH	\N	\N
3299	10-11-2019	2019-11-10 00:00:00	40/506	Ronald_010	11-11-2019	2019-11-11 00:00:00	40/507	pdv_moto	52.6365509	5.77722979	tegen E-huisje Middebuurt,	Schokland	Fl	\N	\N
3524	01-06-2020	2020-06-01 00:00:00	40/686	BSI	01-06-2020	2020-06-01 00:00:00	40/686	Amauta	53.0062675	5.875175	bij gemaal Hooivaartsweg	Haskerdijken	Fr	\N	\N
1950	28-06-2015	2015-06-28 00:00:00	29/11	Amauta	29-06-2015	2015-06-29 00:00:00	29/12	Kermit de Hond	53.1832085	6.46989822	aan paal bij Stobbenven - Hooiweg	Roderwolde	Dr	\N	\N
3037	13-03-2019	2019-03-13 00:00:00	40/240	Coenster	13-03-2019	2019-03-13 00:00:00	40/240	Rik60NL	52.3103065	4.95240402	bij ingang P-garage Haardstee	Amsterdam	NH	\N	\N
3580	11-07-2020	2020-07-11 00:00:00	40/733	bikedan	12-07-2020	2020-07-12 00:00:00	40/734	BSI	51.5102539	4.45522404	aan boompje bij stuw Kleine Aa	Roosendaal	NB	\N	\N
1453	28-12-2013	2013-12-28 00:00:00	24/13	Bomba	29-12-2013	2013-12-29 00:00:00	24/14	Ronald_010	52.0059929	4.8966589	onder brug bij P-plaats Damweg	Oudewater	Ut	\N	\N
2157	21-06-2016	2016-06-21 00:00:00	31/30	Sjakie-77	22-06-2016	2016-06-22 00:00:00	31/31	SadBunny	52.5141182	4.69819212	onder vangrail - Tolweg	Uitgeest	NH	\N	\N
1340	04-09-2013	2013-09-04 00:00:00	22/62	Ronald_010	04-09-2013	2013-09-04 00:00:00	22/62	Dirk130	52.0722618	4.41214895	aan ANWB-paal - Veenweg	Den Haag	ZH	\N	\N
4334	05-05-2023	2023-05-05 00:00:00	41/358	SwitchUp	07-05-2023	2023-05-07 00:00:00	41/359	Toereloer	52.3836136	4.89491987	in hoek scherm Paleis van Justitie, Ijdok	Amsterdam	NH	\N	\N
1105	03-03-2013	2013-03-03 00:00:00	19/36	Roeleey	04-03-2013	2013-03-04 00:00:00	19/36	BSI	52.2974358	4.98809624	aan trafohuisje - Wisseloordplein	Amsterdam	NH	\N	\N
2261	03-10-2016	2016-10-03 00:00:00	32/46	MeanYellowBoy	04-10-2016	2016-10-04 00:00:00	32/47	frankivo	52.5994492	6.39747095	achter E-kast - de Wieken	Balkbrug	Ov	\N	\N
1338	02-09-2013	2013-09-02 00:00:00	22/60	Sjantaalfoutje	03-09-2013	2013-09-03 00:00:00	22/61	Scoot_020/Scoot_2	52.4260178	4.6549468	aan hek Slaperdijkweg	Santpoort	NH	\N	\N
2274	12-10-2016	2016-10-12 00:00:00	32/62	BornToReign	14-10-2016	2016-10-14 00:00:00	32/64	tdemmer	51.9771919	5.64743185	op P-terrein Meteogroup	Wageningen	Ge	\N	\N
4236	29-08-2022	2022-08-29 00:00:00	41/295	bikedan	02-09-2022	2022-09-02 00:00:00	41/295	Outdoor Man	53.190094	6.99053288	tegen boom ingang camping de Bouwte	Midwolde	Gr	\N	\N
3185	31-07-2019	2019-07-31 00:00:00	40/400	Outdoor Man	31-07-2019	2019-07-31 00:00:00	40/400	HermanK	52.580616	5.75667906	aan struik Ketelmeerhaven	Dronten	Fl	\N	\N
2693	07-04-2018	2018-04-07 00:00:00	38/14	Ronny Rabbelaar	07-04-2018	2018-04-07 00:00:00	38/14	FastEddy	53.0755501	6.76305008	achter boom P-terrein Spijkerboorsdijk	Annen	Dr	\N	\N
1073	09-02-2013	2013-02-09 00:00:00	18/98	Ronald_010	10-02-2013	2013-02-10 00:00:00	18/99	Sjakie-77	52.3371964	4.81444597	aan boom Anderlechtlaan	Amsterdam	NH	\N	\N
1028	16-12-2012	2012-12-16 00:00:00	18/31	jaap43	16-12-2012	2012-12-16 00:00:00	18/32	tdemmer	51.9577827	4.68904305	in knotwilg Wellepoort	Berkenwoude	ZH	\N	\N
3095	28-04-2019	2019-04-28 00:00:00	40/292	Pendragon	28-04-2019	2019-04-28 00:00:00	40/293	BSI	52.617363	4.93296909	onder voetbrug Walingsdijk	Ursem	NH	\N	\N
3173	14-07-2019	2019-07-14 00:00:00	40/388	pdv_moto	19-07-2019	2019-07-19 00:00:00	40/390	Okami_Xci	51.5366058	3.436728	in struik op dijk N287	Westkapelle	Ze	\N	\N
1730	01-09-2014	2014-09-01 00:00:00	27/14	Bigtwim	03-09-2014	2014-09-03 00:00:00	27/15	Rainbow600	52.4835129	4.67266893	aan struik Zeesterpad	Beverwijk	NH	\N	\N
2633	05-02-2018	2018-02-05 00:00:00	37/30	HermanK	09-02-2018	2018-02-09 00:00:00	37/33	Amauta	52.520237	6.01203918	onder aan trap Zalkerdijk	Zalk	Ov	\N	\N
2494	21-07-2017	2017-07-21 00:00:00	35/25	BSI	22-07-2017	2017-07-22 00:00:00	35/26	Rik60NL	52.2329826	5.87754202	achter huisje echoput	Hoog Soeren	Ge	\N	\N
2392	20-04-2017	2017-04-20 00:00:00	34/18	pdv_moto	20-04-2017	2017-04-20 00:00:00	34/19	BSI	52.2479858	5.25022697	achter kastje - Bramenberg	Eemnes	Ut	\N	\N
345	24-04-2011	2011-04-24 00:00:00	9/27	mr Q	24-04-2011	2011-04-24 00:00:00	9/29	Scoot_020/Scoot_2	52.1353188	5.10992479	HS-mast Burg. Huydecooperweg, Westbroek, Ut	Westbroek	Ut	\N	\N
2619	19-01-2018	2018-01-19 00:00:00	37/10	pdv_moto	20-01-2018	2018-01-20 00:00:00	37/11	Rik60NL	51.9636536	4.93314409	aan hek Lekdijk West	Lopik/Jaarsveld	Ut	\N	\N
4008	20-08-2021	2021-08-20 00:00:00	41/143	Outdoor Man	21-08-2021	2021-08-21 00:00:00	41/144	Coenster	52.3198242	4.8725009	tegen boom Uilenstede	Amstelveen	NH	\N	\N
2331	15-01-2017	2017-01-15 00:00:00	33/44	pdv_moto	21-01-2017	2017-01-21 00:00:00	33/45	Ronald_010	51.7084999	3.69210696	onder houtstapel vuurtoren	Burgh-Haamstede	Ze	\N	\N
1135	24-03-2013	2013-03-24 00:00:00	19/75	SadBunny	24-03-2013	2013-03-24 00:00:00	19/77	Corney28	52.3644104	4.8471818	in Rembrandtpark - Postjesweg	Amsterdam	NH	\N	\N
2144	05-06-2016	2016-06-05 00:00:00	31/17	Amauta	06-06-2016	2016-06-06 00:00:00	31/19	SadBunny	53.3382912	6.29638481	bij uitkijktoren	Zoutkamp	Gr	\N	\N
4031	16-09-2021	2021-09-16 00:00:00	41/155	Outdoor Man	16-09-2021	2021-09-16 00:00:00	41/155	BSI	52.3491058	4.85694695	aan paal infobord Amstelveenseweg	Amsterdam	NH	\N	\N
1584	04-04-2014	2014-04-04 00:00:00	25/57	tdemmer	05-04-2014	2014-04-05 00:00:00	25/57	Ronald_010	51.9831429	4.62637615	aan boompje langs 2e Tochtweg	Moordrecht	ZH	\N	\N
3217	20-08-2019	2019-08-20 00:00:00	40/432	FastEddy	20-08-2019	2019-08-20 00:00:00	40/433	Ronny Rabbelaar	52.8237877	7.04182386	onder trap Schuilmijt	Emmer-Compascuum	Dr	\N	\N
545	17-09-2011	2011-09-17 00:00:00	12/15	Scoot_020/Scoot_2	18-09-2011	2011-09-18 00:00:00	12/16	Buuv	52.9473152	5.43359804	aan infohuisje camping - Lange Leane, Workum, Fr	Workum	Fr	\N	\N
2893	07-09-2018	2018-09-07 00:00:00	40/45	BSI	08-09-2018	2018-09-08 00:00:00	40/46	Bensi	52.1472664	5.66510391	tussen molenstenen	Kootwijkerbroek	Ge	\N	\N
192	13-01-2011	2011-01-13 00:00:00	6/4	mr Q	13-01-2011	2011-01-13 00:00:00	6/5	Wimis on	51.9791298	5.10988712	bruggetje Hooglandseweg, Hagestein, Ut	Hagestein	Ut	\N	\N
3602	30-07-2020	2020-07-30 00:00:00	40/757	Picobello BV	30-07-2020	2020-07-30 00:00:00	40/757	Yosra87	51.9559479	4.35706186	aan paaltje Passeerplek, Oostveenseweg	Schipluiden	ZH	\N	\N
2949	20-11-2018	2018-11-20 00:00:00	40/112	DKP	24-11-2018	2018-11-24 00:00:00	40/113	Sjefman	50.832756	5.65104294	in heg sportterrein Heukelommerweg	Maastricht	Li	\N	\N
1034	23-12-2012	2012-12-23 00:00:00	18/36	tdemmer	24-12-2012	2012-12-24 00:00:00	18/36	Ronald_010	51.9999542	5.0771718	aan rooster oude Lekbrug	Nieuwegein	Ut	\N	\N
4070	30-11-2021	2021-11-30 00:00:00	41/182	Deeffox	03-12-2021	2021-12-03 00:00:00	41/183	pdv_moto	51.8133621	4.68491411	aan poot plattegrond Onranjelaan	Dordrecht	ZH	\N	\N
3801	06-02-2021	2021-02-06 00:00:00	40/931	Coenster	06-02-2021	2021-02-06 00:00:00	40/931	Hjerteknuser	52.5117264	4.62985611	onder E-kastje Achterweg	Heemskerk	NH	\N	\N
772	11-04-2012	2012-04-11 00:00:00	15/27	scheurschuimpje	12-04-2012	2012-04-12 00:00:00	15/29	Kermit de Hond	52.9498825	5.97971916	op Belvédère Oranjewoud, Heerenveen, Fr	Heerenveen	Fr	\N	\N
1708	10-08-2014	2014-08-10 00:00:00	26/90	BSI	10-08-2014	2014-08-10 00:00:00	26/91	Hasseman	52.1647568	5.56654596	op P-terrein Harselaarsweg	Barneveld	Ge	\N	\N
2765	27-05-2018	2018-05-27 00:00:00	38/97	Okami_Xci	27-05-2018	2018-05-27 00:00:00	38/97	BSI	51.4334717	5.50437403	achter paaltje Hugo van der Goeslaan	Eindhoven	NB	\N	\N
460	10-07-2011	2011-07-10 00:00:00	10/99	bakfiets1	10-07-2011	2011-07-10 00:00:00	10/100	zeepok	51.5059891	4.24916601	Meerpaal - Zuiderstrekdam, Bergen op Zoom, NB	Bergen op Zoom	NB	\N	\N
1037	26-12-2012	2012-12-26 00:00:00	18/38	Corney28	28-12-2012	2012-12-28 00:00:00	18/39	frankwijers	51.3097229	5.64053917	aan boom zijpad Valkenlaan	Maarheeze	NB	\N	\N
2068	11-02-2016	2016-02-11 00:00:00	30/28	ArendJan	11-02-2016	2016-02-11 00:00:00	30/28	Amauta	52.0243034	4.67845297	aan gevel - Burg. Van Reenensingel	Gouda	ZH	\N	\N
2330	14-01-2017	2017-01-14 00:00:00	33/43	Ronald_010	15-01-2017	2017-01-15 00:00:00	33/44	pdv_moto	51.8959999	4.37411118	onder loopbrug ventilatiegebouw	Pernis	ZH	\N	\N
3795	01-02-2021	2021-02-01 00:00:00	40/927	Hans89	02-02-2021	2021-02-02 00:00:00	40/927	Bomba	51.9693298	4.62848997	onder steigermolen Windlust	Nieuwerkerk a/d Ijssel	ZH	\N	\N
2894	08-09-2018	2018-09-08 00:00:00	40/46	Bensi	09-09-2018	2018-09-09 00:00:00	40/47	BSI	52.1037292	5.95234585	tegen hek Monument Woeste Hoeve	Beekbergen	Ge	\N	\N
3821	04-03-2021	2021-03-04 00:00:00	40/946	Picobello BV	04-03-2021	2021-03-04 00:00:00	40/947	HighKing	52.0113487	4.33534288	in perkje van Blommensteinstraat	Delft	ZH	\N	\N
2266	08-10-2016	2016-10-08 00:00:00	32/54	Amauta	08-10-2016	2016-10-08 00:00:00	32/55	Ronald_010	52.0105095	4.14404583	aan toilethok - Verl. Strandweg	s-Gravenzande	ZH	\N	\N
4022	01-09-2021	2021-09-01 00:00:00	41/150	BigJim	02-09-2021	2021-09-02 00:00:00	41/150	HighKing	52.538559	4.83615303	achter zuiltje bij gaskast Westdijk	Westbeemster	NH	\N	\N
4189	12-05-2022	2022-05-12 00:00:00	41/261	Outdoor Man	12-05-2022	2022-05-12 00:00:00	41/262	HighKing	52.5605583	5.04260302	aan hek Ijsselmeerdijk	Warder	NH	\N	\N
1393	18-10-2013	2013-10-18 00:00:00	23/47	Buuv	19-10-2013	2013-10-19 00:00:00	23/48	VreemdeBeet	53.018013	6.60578299	aan paaltje van hek - Vrieseweg	Loon	Dr	\N	\N
2734	02-05-2018	2018-05-02 00:00:00	38/65	Rik60NL	02-05-2018	2018-05-02 00:00:00	38/66	Okami_Xci	52.1239052	4.99832201	in struiken bij ingang Haarzuilen	Utrecht	Ut	\N	\N
4091	10-01-2022	2022-01-10 00:00:00	41/197	BSI	11-01-2022	2022-01-11 00:00:00	41/198	Outdoor Man	52.1306992	5.29667902	aan hek bij F-104 Starfighter	Soeterberg	Ut	\N	\N
2260	03-10-2016	2016-10-03 00:00:00	32/45	frankivo	03-10-2016	2016-10-03 00:00:00	32/45	MeanYellowBoy	52.7288971	6.63811207	bij bunker - verl. Hoogeveensevaart	Zwinderen	Dr	\N	\N
2340	18-02-2017	2017-02-18 00:00:00	33/60	pdv_moto	20-02-2017	2017-02-20 00:00:00	33/60	-Floris-	51.5342178	3.56152201	in struik bij kerk - Kerkring	Grijpskerke	Ze	\N	\N
1666	15-06-2014	2014-06-15 00:00:00	26/41	Ronald_010	15-06-2014	2014-06-15 00:00:00	26/42	MLB	51.9183044	4.22559881	aan keienmuur P-terrein - Boulevard	Rozenburg	ZH	\N	\N
19	26-08-2010	2010-08-26 00:00:00	1/56	ThaGaruda	27-08-2010	2010-08-27 00:00:00	1/59	GSxie	52.211216	4.40552807	Noordduinseweg, Katwijk, ZH	Katwijk	ZH	\N	\N
282		0001-01-01 00:00:00 BC				0001-01-01 00:00:00 BC		Foncelot	\N	\N				\N	\N
3013	10-02-2019	2019-02-10 00:00:00	40/205	BSI	12-02-2019	2019-02-12 00:00:00	40/206	Roeleey	52.0994453	5.6431942	bij uitzichtount Hessenhut	Lunteren	Ge	\N	\N
2297	25-11-2016	2016-11-25 00:00:00	33/05	pdv_moto	26-11-2016	2016-11-26 00:00:00	33/06	Ronald_010	52.0719032	5.02759695	in struik P-terrein Starbucks	de Meern	Ut	\N	\N
1665	15-06-2014	2014-06-15 00:00:00	26/41	bikedan	15-06-2014	2014-06-15 00:00:00	26/41	Ronald_010	51.4301796	4.37547398	achter cai-kast Westerstraat	Huybergen	NB	\N	\N
1396	20-10-2013	2013-10-20 00:00:00	23/50	BSI	20-10-2013	2013-10-20 00:00:00	23/50	VreemdeBeet	52.2995453	6.42920113	naast muurtje ereveld - Eekhoornweg	Holten	Ov	\N	\N
4167	19-04-2022	2022-04-19 00:00:00	41/248	k0en	20-04-2022	2022-04-20 00:00:00	41/249	Coenster	51.9780159	5.41010809	onder bord parkeerstrook stuw Lekdijk	Amerongen	Ut	\N	\N
998	17-11-2012	2012-11-17 00:00:00	17/96	ootje	17-11-2012	2012-11-17 00:00:00	17/97	BigJim	52.5550842	4.64311695	begraafplaats Duin en Bosch	Castricum	NH	\N	\N
1863	16-03-2015	2015-03-16 00:00:00	28/30	Bomba	16-03-2015	2015-03-16 00:00:00	28/31	k0en	52.0973015	4.90972185	in schoen brugpijler N198	Woerden	Ut	\N	\N
1146	30-03-2013	2013-03-30 00:00:00	19/93	tdemmer	01-04-2013	2013-04-01 00:00:00	19/94	SadBunny	51.7015877	4.32775497	hek Bosweg - Hellegatsplein	Ooltgensplaat	ZH	\N	\N
2586	09-11-2017	2017-11-09 00:00:00	36/56	Bigtwim	10-11-2017	2017-11-10 00:00:00	36/58	highking	52.4788933	4.67330599	onder zadel tractor - Ringvaartweg	Beverwijk	NH	\N	\N
2081	17-03-2016	2016-03-17 00:00:00	30/45	ad patat	23-03-2016	2016-03-23 00:00:00	30/47	Amauta	51.5351677	4.07993603	onder bord camping Gorishoek	Scherpenisse	Ze	\N	\N
2037	15-11-2015	2015-11-15 00:00:00	29/95	Bensi	19-11-2015	2015-11-19 00:00:00	29/96	ootje	52.1009064	6.31997108	onder brug Baakse Beek bij kasteel	Vorden	Ge	\N	\N
4290	18-02-2023	2023-02-18 00:00:00	41/329	Okami_Xci	19-02-2023	2023-02-19 00:00:00	41/329	Ronald_010	51.4381523	5.4955411	in reclamekar "vloer het zelf" 	Einhoven	NB	\N	\N
36	06-09-2010	2010-09-06 00:00:00	2/43	The_Daphne	06-09-2010	2010-09-06 00:00:00	2/44	DutchKingKong	51.9491463	5.05487013	Hei en Boeicopseweg 164, Hei en Boeicop, ZH	Heien Boeicop	ZH	\N	\N
4270	03-12-2022	2022-12-03 00:00:00	41/317	Outdoor Man	11-12-2022	2022-12-11 00:00:00	41/317	MIA	52.2931328	4.87357521	tegen regenpijp E-huis Ambulancepoort	Amstelveen	NH	\N	\N
2982	04-01-2019	2019-01-04 00:00:00	40/160	Marsian	04-01-2019	2019-01-04 00:00:00	40/161	Ronny Rabbelaar	52.3142014	5.46768522	in struik bij Stille kern	Zeewolde	Fl	\N	\N
868	26-07-2012	2012-07-26 00:00:00	16/53	frankwijers	26-07-2012	2012-07-26 00:00:00	16/53	Franko P	51.4475937	4.94386578	aan plaatsbord	Baarle-Hertog/Nassau	NB	\N	\N
4326	22-04-2023	2023-04-22 00:00:00	41/353	Hans89	23-04-2023	2023-04-23 00:00:00	41/353	pdv_moto	51.4852371	3.54154897	tegen hoek bunker 631	Koudekerke	Ze	\N	\N
2142	03-06-2016	2016-06-03 00:00:00	31/16	nappertje	04-06-2016	2016-06-04 00:00:00	31/16	ErikBloot	52.1094475	5.57670021	aan lsntssrnpssl - Brinkhofweg	Lunteren	Ge	\N	\N
1284	16-07-2013	2013-07-16 00:00:00	21/88	Kiki92	17-07-2013	2013-07-17 00:00:00	21/90	Roeleey	51.6895447	5.03267384	aan hek Winterdijk	Sprang-Capelle	NB	\N	\N
3871	11-04-2021	2021-04-11 00:00:00	41/037	HighKing	12-04-2021	2021-04-12 00:00:00	41/038	Outdoor Man	52.6372948	4.69340992	onder hek bunkercomplex vliegveld	Egmond aan de Hoef	NH	\N	\N
1807	13-12-2014	2014-12-13 00:00:00	27/82	Ronald_010	14-12-2014	2014-12-14 00:00:00	27/83	tdemmer	52.0281258	4.67900896	in knotwilg - Waddinxveensepad	Gouda	ZH	\N	\N
1846	23-02-2015	2015-02-23 00:00:00	28/18	Roeleey	24-02-2015	2015-02-24 00:00:00	28/18	Corney28	52.298111	4.98347378	bij speeltuintje - Vianenstraat	Amsterdam	NH	\N	\N
4402	18-09-2023	2023-09-18 00:00:00	41/403	scheurschuimpje	18-09-2023	2023-09-18 00:00:00	41/403	Janhertog	52.8169479	6.03822517	achter zuiltje "Welkom" Paasloregel	Basse	Ov	\N	\N
536	14-09-2011	2011-09-14 00:00:00	12/07	jaap43	14-09-2011	2011-09-14 00:00:00	12/07	tdemmer	51.9298134	4.71652794	aan hek Zuidbroekse Opweg 28, Bergambacht, ZH	Bergambacht	ZH	\N	\N
1671	02-07-2014	2014-07-02 00:00:00	26/50	BSI	04-07-2014	2014-07-04 00:00:00	26/51	Sjantaalfoutje	52.0387726	5.72765303	aan paal P-plaats - Belgenmonument	Ede	Ge	\N	\N
1027	15-12-2012	2012-12-15 00:00:00	18/30	tdemmer	16-12-2012	2012-12-16 00:00:00	18/31	jaap43	51.9608421	4.54742813	in tunneltje metro Ommoord	Rotterdam	ZH	\N	\N
2203	14-08-2016	2016-08-14 00:00:00	31/77	pdv_moto	14-08-2016	2016-08-14 00:00:00	31/77	-Floris-	51.5155983	3.46551895	aan lantaarnpaal Paulusweg	Westkapelle	Ze	\N	\N
770	08-04-2012	2012-04-08 00:00:00	15/26	scheurschuimpje	08-04-2012	2012-04-08 00:00:00	15/26	Ronald_010	52.6212883	6.56313801	bij brievenbus - Zwartedijk, Slagharen, Ov	Slagharen	Ov	\N	\N
891	09-08-2012	2012-08-09 00:00:00	16/69	tdemmer	09-08-2012	2012-08-09 00:00:00	16/69	JurgenT	52.0993462	5.99520588	onder boomstronk - Droefakkers	Loenen	Ge	\N	\N
1184	27-04-2013	2013-04-27 00:00:00	20/54	rvdh86	27-04-2013	2013-04-27 00:00:00	20/55	Bludge	51.9645767	6.27676582	bij bankje Stokhorstweg	Doetinchem	Ge	\N	\N
2387	17-04-2017	2017-04-17 00:00:00	34/13	vuurbloed	18-04-2017	2017-04-18 00:00:00	34/14	Rik60NL	52.3463936	4.67177391	aan hek Liniepad - Spieringdweg	Vijfhuizen	NH	\N	\N
2084	26-03-2016	2016-03-26 00:00:00	30/49	pdv_moto	26-03-2016	2016-03-26 00:00:00	30/49	BSI	51.7331505	5.52082109	tegen lataarnpaal - Kerkstraat	Heesch	NB	\N	\N
1330	29-08-2013	2013-08-29 00:00:00	22/49	Bludge	29-08-2013	2013-08-29 00:00:00	22/50	Bensi	51.9130554	5.99645185	in wilg bij Oude Rijn - Kandiadijk	Pannerden	Ge	\N	\N
3352	15-01-2020	2020-01-15 00:00:00	40/547	ey-dzeej	15-01-2020	2020-01-15 00:00:00	40/547	Sjefman	51.8693008	4.5546422	in hoek carpoolplaats Ijsselmonde	Ridderkerk	ZH	\N	\N
1239	08-06-2013	2013-06-08 00:00:00	21/33	bikedan	11-06-2013	2013-06-11 00:00:00	21/35	jaap43	51.4297485	4.38150406	onder brug in park St. Marie	Huijbergen	NB	\N	\N
2374	07-04-2017	2017-04-07 00:00:00	33/99	Amauta	07-04-2017	2017-04-07 00:00:00	33/100	Janhertog	52.7444649	5.99606895	onder viaduct N333 - Muggenbeet	Wetering	Ov	\N	\N
694	25-01-2012	2012-01-25 00:00:00	14/28	jaap43	25-01-2012	2012-01-25 00:00:00	14/29	tdemmer	52.0650673	4.69337177	aan hek - Driepolderpunt - Tempeldijk, Reeuwijk, ZH	Reeuwijk	ZH	\N	\N
2811	08-07-2018	2018-07-08 00:00:00	39/55	Outdoor Man	10-07-2018	2018-07-10 00:00:00	39/56	jaap43	51.4035988	4.17554617	tegen dijkpaal 73, Dumoulinweg	Rilland	Ze	\N	\N
3150	20-06-2019	2019-06-20 00:00:00	40/363	ootje	21-06-2019	2019-06-21 00:00:00	40/364	Coenster	52.5487938	4.90659094	aan hek KDV Ootje Tontel	Middenbeemster	NH	\N	\N
2065	07-02-2016	2016-02-07 00:00:00	30/25	Ronald_010	09-02-2016	2016-02-09 00:00:00	30/26	Meifesto	51.8676414	4.437006	aan hek eind Stationsstraat	Rhoon	ZH	\N	\N
4080	01-01-2022	2022-01-01 00:00:00	41/191	Coenster	01-01-2022	2022-01-01 00:00:00	41/191	Outdoor Man	52.2203522	4.55848598	in heg Hoofdweg O-zijde	Buitenkaag	NH	\N	\N
1517	16-02-2014	2014-02-16 00:00:00	24/85	BigJim	16-02-2014	2014-02-16 00:00:00	24/85	Smuiger	52.4551697	4.8286252	bij bankje Karel Lotsylaan	Zaanstad	NH	\N	\N
3226	30-08-2019	2019-08-30 00:00:00	40/444	Hans89	31-08-2019	2019-08-31 00:00:00	40/445	Meifesto	51.9044647	4.46739101	tegen muur Maastunnel, Parkhaven	Rotterdam	ZH	\N	\N
1946	24-06-2015	2015-06-24 00:00:00	29/08	ArendJan	26-06-2015	2015-06-26 00:00:00	29/09	BSI	51.8982506	4.3063798	aan hek Koggehaven - Overbospad	Vlaardingen	ZH	\N	\N
516	26-08-2011	2011-08-26 00:00:00	11/72	BSI	26-08-2011	2011-08-26 00:00:00	11/73	Scoot_020/Scoot_2	52.1702232	5.60792017	grasveld Zeumerseweg/Stroetweg, Barneveld, Ge	Barneveld	Ge	\N	\N
3740	09-11-2020	2020-11-09 00:00:00	40/877	pdv_moto	09-11-2020	2020-11-09 00:00:00	40/877	Picobello BV	52.054985	4.39159679	in buis Ypenburgsestationsweg	Den Haag	ZH	\N	\N
975	04-11-2012	2012-11-04 00:00:00	17/67	Bedumer	05-11-2012	2012-11-05 00:00:00	17/69	Ronald_010	51.8704681	4.41304111	aan paal W. Barentszstraat	Pernis	ZH	\N	\N
667	22-12-2011	2011-12-22 00:00:00	13/88	Scoot_020/Scoot_2	22-12-2011	2011-12-22 00:00:00	13/88	V-Strommert	52.3134308	4.84711218	bij banpaal - Amsterdamseweg, Amstelveen, NH	Amstelveen	NH	\N	\N
1697	24-07-2014	2014-07-24 00:00:00	26/75	Blogem	24-07-2014	2014-07-24 00:00:00	26/75	Roeleey	52.4139595	4.86848211	onder stenen - Toetsenbordweg	Amsterdam	NH	\N	\N
128	06-11-2010	2010-11-06 00:00:00	4/56	Dirk130	06-11-2010	2010-11-06 00:00:00	4/57	tdemmer	52.0877457	4.29400206	paadje Carnegielaan, Den Haag, ZH	Den Haag	ZH	\N	\N
2315	17-12-2016	2016-12-17 00:00:00	33/20	pdv_moto	17-12-2016	2016-12-17 00:00:00	33/21	BSI	51.6633835	4.67834377	aan paaltje Tangostation	Zevenbergschenhoek	NB	\N	\N
3916	30-05-2021	2021-05-30 00:00:00	41/078	bikedan	30-05-2021	2021-05-30 00:00:00	41/079	pdv_moto	51.6566696	5.439116	in struik P-plaats kasteel Heeswijk	Heeswijk-Dinther	NB	\N	\N
695	26-01-2012	2012-01-26 00:00:00	14/29	tdemmer	26-01-2012	2012-01-26 00:00:00	14/30	Komkommer	52.1243248	4.99661684	P-terrein Ockhuizerweg, Haarzuilens, Ut	Haarzuilens	Ut	\N	\N
2208	23-08-2016	2016-08-23 00:00:00	31/86	pdv_moto	24-08-2016	2016-08-24 00:00:00	31/86	BSI	52.0458832	5.68392992	bij hm-paal 39.5 - N224	Ede	Ge	\N	\N
1395	20-10-2013	2013-10-20 00:00:00	23/49	Ronald_010	20-10-2013	2013-10-20 00:00:00	23/50	BSI	52.5275192	6.14010477	tegen E-huisje v/d Valk Restaurant	Zwolle	Ov	\N	\N
2871	20-08-2018	2018-08-20 00:00:00	40/23	Roeleey	20-08-2018	2018-08-20 00:00:00	40/23	SadBunny	52.3500938	4.93359995	achter boomstronk Hugo de Vrieslaan	Amsterdam	NH	\N	\N
2306	11-12-2016	2016-12-11 00:00:00	33/15	pdv_moto	11-12-2016	2016-12-11 00:00:00	33/16	Ronald_010	52.1016502	4.29443312	naast brugpijler - Cremerweg	Den Haag	ZH	\N	\N
1226	30-05-2013	2013-05-30 00:00:00	21/13	Sjantaalfoutje	31-05-2013	2013-05-31 00:00:00	21/15	MIA	52.1182404	5.88259077	in boomholte - Delerweg	Hoenderloo	Ge	\N	\N
406	05-06-2011	2011-06-05 00:00:00	10/32	Bigtwim	05-06-2011	2011-06-05 00:00:00	10/32	mr Q	51.73423	5.27473593	parkeerterrein Treurenburg, 's-Hertogenbosch, NB	s-Hertogenbosch	NB	\N	\N
3927	08-06-2021	2021-06-08 00:00:00	41/088	FastEddy	08-06-2021	2021-06-08 00:00:00	41/088	Amauta	53.3260117	6.9317131	aan hek P-terrein Visserijweg	Farmsum	Gr	\N	\N
2181	23-07-2016	2016-07-23 00:00:00	31/54	Rik60NL	24-07-2016	2016-07-24 00:00:00	31/55	Bomba	52.2826424	4.88372278	hek Rondehoep West	Ouderkerk a/d Amstel	NH	\N	\N
3458	16-04-2020	2020-04-16 00:00:00	40/634	Marsian	17-04-2020	2020-04-17 00:00:00	40/635	Outdoor Man	52.4548569	5.80907488	in struik P-terrein Beachclub	Biddinghuizen	Fl	\N	\N
912	05-09-2012	2012-09-05 00:00:00	16/90	tdemmer	05-09-2012	2012-09-05 00:00:00	16/91	Delcasa	52.1001244	4.74579191	bij knotwilg - Kerkweg/de Meije	Bodegraven	ZH	\N	\N
903	19-08-2012	2012-08-19 00:00:00	16/80	bikedan	20-08-2012	2012-08-20 00:00:00	16/81	Hans89	51.5864143	4.72194576	aan lantaarnpaal - Vinkenbergseweg	Breda	NB	\N	\N
1418	14-11-2013	2013-11-14 00:00:00	23/74	Corney28	15-11-2013	2013-11-15 00:00:00	23/76	tdemmer	52.1700783	4.98910189	aan hek van Kortrijksemolen	Breukelen	Ut	\N	\N
3683	30-09-2020	2020-09-30 00:00:00	40/834	ey-dzeej	01-10-2020	2020-10-01 00:00:00	40/834	Hans89	51.9866295	4.56617117	tegen paal waterinlaat Egelskoplaantje	Zevenhuizen	ZH	\N	\N
4261	03-11-2022	2022-11-03 00:00:00	41/309	Phaedrus	04-11-2022	2022-11-04 00:00:00	41/310	pdv_moto	52.1617355	5.029284	tegen hek fort bij Tienhoven	Breukelen	Ut	\N	\N
3312	03-12-2019	2019-12-03 00:00:00	40/520	BSI	07-12-2019	2019-12-07 00:00:00	40/521	BornToReign	52.1767921	5.58737183	bij ingang maisdoolhof	Voorthuizen	Ge	\N	\N
2822	17-07-2018	2018-07-17 00:00:00	39/68	jaap43	17-07-2018	2018-07-17 00:00:00	39/68	WillyvD	51.6468658	4.34588814	aan hekpost Schenkeldijk	Dinteloord	NB	\N	\N
4418	18-10-2023	2023-10-18 00:00:00	41/412	BSI	20-10-2023	2023-10-20 00:00:00	41/412	Outdoor Man	52.2359543	5.69698715	achter steen Armendennenpad	Garderen	Ge	\N	\N
3621	13-08-2020	2020-08-13 00:00:00	40/779	Amauta	13-08-2020	2020-08-13 00:00:00	40/779	frankivo	53.1053505	6.47362423	onder landhoofd van gemaaltje	Lieveren	Dr	\N	\N
1833	30-01-2015	2015-01-30 00:00:00	28/06	Rainbow600	30-01-2015	2015-01-30 00:00:00	28/07	BSI	52.2654991	5.25725985	aan boom P-Plaats - Eemakker	Eemnes	Ut	\N	\N
2353	10-03-2017	2017-03-10 00:00:00	33/75	Amauta	15-03-2017	2017-03-15 00:00:00	33/76	frankivo	52.8462791	7.08390713	aan boom Eikenlaan	Ter Apel	Gr	\N	\N
2595	17-11-2017	2017-11-17 00:00:00	36/66	Bigtwim	17-11-2017	2017-11-17 00:00:00	36/67	Amauta	52.4859161	4.65823603	bij boom - Breestraat	Beverwijk	NH	\N	\N
197	16-01-2011	2011-01-16 00:00:00	6/15	dolfijneflipper	16-01-2011	2011-01-16 00:00:00	6/15	Grote Voet	52.1474915	5.22036695	infobord - Soestdijkseweg Noord, Bilthoven, Ut	Bilthoven	Ut	\N	\N
4034	22-09-2021	2021-09-22 00:00:00	41/157	Amauta	24-09-2021	2021-09-24 00:00:00	41/157	Brnk	53.1084023	6.44258595	bij uitkijktoren Zuideresch	Lieveren	Dr	\N	\N
3594	21-07-2020	2020-07-21 00:00:00	40/743	k0en	22-07-2020	2020-07-22 00:00:00	40/743	Yosra87	51.6428795	5.27523518	achter schakelkast Spechtrand	Vught	NB	\N	\N
556	26-09-2011	2011-09-26 00:00:00	12/34	Starscream	27-09-2011	2011-09-27 00:00:00	12/36	Bensi	52.3947906	6.59915113	onder betonblok Nwe Wierdenseweg, H. Hexel, Ov	H.Hexel	Ov	\N	\N
795	04-05-2012	2012-05-04 00:00:00	15/50	Ronald_010	05-05-2012	2012-05-05 00:00:00	15/50	Bigtwim	53.326725	6.4258728	onder bord Roodehaansterweg, Warfhuizen, Fr	Warfhuizen	Fr	\N	\N
1832	27-01-2015	2015-01-27 00:00:00	28/06	tdemmer	29-01-2015	2015-01-29 00:00:00	28/06	Rainbow600	51.9155464	5.13599586	in holle boom - Diefdijk	Schoonrewoerd	ZH	\N	\N
4016	28-08-2021	2021-08-28 00:00:00	41/148	HighKing	29-08-2021	2021-08-29 00:00:00	41/148	Roeleey	52.3358803	5.06669617	onder loopbrug Westbatterij	Muiden	NH	\N	\N
3248	25-09-2019	2019-09-25 00:00:00	40/465	Roeleey	25-09-2019	2019-09-25 00:00:00	40/465	Coenster	52.2971916	4.95842218	onder opstap bushuisje Holendrecht	Amsterdam	NH	\N	\N
3077	15-04-2019	2019-04-15 00:00:00	40/272	pdv_moto	16-04-2019	2019-04-16 00:00:00	40/273	ey-dzeej	52.0862923	4.30486917	in struik bij standbeeld Plein 1813	Den Haag	ZH	\N	\N
4158	04-04-2022	2022-04-04 00:00:00	41/242	HighKing	08-04-2022	2022-04-08 00:00:00	41/243	Hjerteknuser	52.964344	4.772089	tegen paal aan de Hoofdgracht	Den Helder	NH	\N	\N
2450	06-06-2017	2017-06-06 00:00:00	34/73	Bomba	08-06-2017	2017-06-08 00:00:00	34/75	Kevson	52.0763474	4.88930321	achter E-kast Vijzelmolenlaan	Worden	Ut	\N	\N
1875	04-04-2015	2015-04-04 00:00:00	28/45	BSI	07-04-2015	2015-04-07 00:00:00	28/47	Corney28	51.3795624	5.98471308	aan vlaggenmast AC-restaurant	Sevenum	Li	\N	\N
4357	13-06-2023	2023-06-13 00:00:00	41/374	Motor-inator	14-06-2023	2023-06-14 00:00:00	41/374	BSI	52.1138077	5.71909094	achter schakelkast in heg	Wekerom	Ge	\N	\N
2539	06-09-2017	2017-09-06 00:00:00	35/85	BSI	06-09-2017	2017-09-06 00:00:00	35/86	Amauta	52.7285652	6.90535212	in stapel stenen - Sandurdreef	Emmen	Dr	\N	\N
1296	05-08-2013	2013-08-05 00:00:00	22/11	bikedan	05-08-2013	2013-08-05 00:00:00	22/11	Bar-E	51.58918	4.52846909	in bloembak bij kerk	Oudenbosch	NB	\N	\N
3553	23-06-2020	2020-06-23 00:00:00	40/712	k0en	23-06-2020	2020-06-23 00:00:00	40/712	MBKNLD	52.0753708	5.12094593	aan kentekenbord Heuveloord	Utrecht	Ut	\N	\N
4349	01-06-2023	2023-06-01 00:00:00	41/369	Bensi	03-06-2023	2023-06-03 00:00:00	41/369	FastEddy	52.0178566	6.12941122	tegen muurtje Burg	Doesburg	Ge	\N	\N
1458	02-01-2014	2014-01-02 00:00:00	24/16	BSI	04-01-2014	2014-01-04 00:00:00	24/18	Wimis on	52.1412582	5.35397482	aan hek bij het Klooster	Amersfoort	Ut	\N	\N
938	01-10-2012	2012-10-01 00:00:00	17/16	Sytze	02-10-2012	2012-10-02 00:00:00	17/17	Buikschuiver oet Dre	53.0866165	6.30587292	op P-plaats - Nije Drintsewey	Bakkeveen	Fr	\N	\N
3413	15-03-2020	2020-03-15 00:00:00	40/591	Ronald_010	16-03-2020	2020-03-16 00:00:00	40/593	DKP	52.0439987	4.65930891	achter E-kasr Hefbrug, Nesse	Waddinxveen	ZH	\N	\N
2148	08-06-2016	2016-06-08 00:00:00	31/21	Bensi	08-06-2016	2016-06-08 00:00:00	31/21	BSI	52.1081619	5.93803692	bij boomstronk - Woeste Hoefweg	Hoenderloo	Ge	\N	\N
2296	25-11-2016	2016-11-25 00:00:00	33/05	Scoot_020/Scoot_2	25-11-2016	2016-11-25 00:00:00	33/05	pdv_moto	52.3871117	5.28363895	in perkje - Seringstraat	Almere	Fl	\N	\N
3513	25-05-2020	2020-05-25 00:00:00	40/676	Hans89	25-05-2020	2020-05-25 00:00:00	40/677	Picobello BV	51.8767624	4.04560089	achter schutting de Paddenstoel, 2e slag	Oostvoorne	ZH	\N	\N
3394	29-02-2020	2020-02-29 00:00:00	40/578	Hans89	29-02-2020	2020-02-29 00:00:00	40/578	pdv_moto	51.33498	3.81775093	in voetstuk monument Binnenvaartweg	Terneuzen	Ze	\N	\N
2742	07-05-2018	2018-05-07 00:00:00	38/72	Bas600	07-05-2018	2018-05-07 00:00:00	38/73	HighKing	52.1791115	4.83409786	aan infopnaal Groene Jonker	Zevenhoven	ZH	\N	\N
1372	28-09-2013	2013-09-28 00:00:00	23/10	Ronald_010	28-09-2013	2013-09-28 00:00:00	23/11	tdemmer	51.9019012	4.06943703	aan infobord P-terrein Duinstraat	Rockanje	ZH	\N	\N
3832	10-03-2021	2021-03-10 00:00:00	41/008	Coenster	10-03-2021	2021-03-10 00:00:00	41/008	Outdoor Man	52.2303162	4.63054419	onder betonblok bij HSL, Lisserweg	Abbenes	NH	\N	\N
3031	07-03-2019	2019-03-07 00:00:00	40/233	Rik60NL	07-03-2019	2019-03-07 00:00:00	40/233	pdv_moto	52.0912209	4.94834995	in struik bij P-vak N419	Harmelen	Ut	\N	\N
249	23-02-2011	2011-02-23 00:00:00	7/44	Perrymy	24-02-2011	2011-02-24 00:00:00	7/46	Hansss	52.5964012	4.64352322	achter kapel - Sint Adelbertusweg, Egmond, NH	Egmond-Binnen	NH	\N	\N
3274	18-10-2019	2019-10-18 00:00:00	40/484	Hans89	19-10-2019	2019-10-19 00:00:00	40/484	jaap43	51.937809	4.54643297	onder trap Vierkant in de Plas	Rotterdam	ZH	\N	\N
1468	10-01-2014	2014-01-10 00:00:00	24/29	Corney28	10-01-2014	2014-01-10 00:00:00	24/30	Vins111	52.2699471	4.97326899	aan paal in plantsoen - Voordijk	Abcoude	Ut	\N	\N
2095	12-04-2016	2016-04-12 00:00:00	30/63	pdv_moto	14-04-2016	2016-04-14 00:00:00	30/65	Coenster	52.090683	4.27927685	in plantsoen Gem. Museum	Den Haag	ZH	\N	\N
1307	14-08-2013	2013-08-14 00:00:00	22/19	Scoot_020/Scoot_2	15-08-2013	2013-08-15 00:00:00	22/20	Sjantaalfoutje	52.3721733	4.96343422	aan paal infobord Zeeburg	Amsterdam	NH	\N	\N
3330	19-12-2019	2019-12-19 00:00:00	40/531	Picobello BV	19-12-2019	2019-12-19 00:00:00	40/531	Hans89	51.9071922	4.51960802	in heg uitzichtpunt de Esch	Rotterdam	ZH	\N	\N
974	03-11-2012	2012-11-03 00:00:00	17/65	nannol	04-11-2012	2012-11-04 00:00:00	17/67	Bedumer	52.8505669	7.08413696	aan paal Rutenbroekerweg	Ter Apel	Gr	\N	\N
1417	14-11-2013	2013-11-14 00:00:00	23/73	BSI	14-11-2013	2013-11-14 00:00:00	23/74	Corney28	52.3360023	4.85486078	in P-garage kantoor Skutjespad	Amsterdam	NH	\N	\N
843	28-06-2012	2012-06-28 00:00:00	16/16	Bigtwim	30-06-2012	2012-06-30 00:00:00	16/18	Smuiger	52.6569481	5.7797761	aan meerpaal vluchthaven, Schokland, Fl	Schokland	Fl	\N	\N
3599	28-07-2020	2020-07-28 00:00:00	40/754	HighKing	29-07-2020	2020-07-29 00:00:00	40/754	Yosra87	52.4603996	4.57316494	tegen hm-paaltje Seinpostweg	Ijmuiden	NH	\N	\N
3068	05-04-2019	2019-04-05 00:00:00	40/263	pdv_moto	06-04-2019	2019-04-06 00:00:00	40/264	Coenster	52.0867386	4.27274084	in struik van Boetzelaerlaan	Den Haag 	ZH	\N	\N
2710	16-04-2018	2018-04-16 00:00:00	38/34	MP_NL	17-04-2018	2018-04-17 00:00:00	38/35	BornToReign	52.1963043	6.10478687	in struiken Bleomenksweg	Voorst	Ge	\N	\N
3723	27-10-2020	2020-10-27 00:00:00	40/864	HighKing	28-10-2020	2020-10-28 00:00:00	40/864	pdv_moto	52.5219536	4.68357801	in beeld planeet aarde, Noordermaatweg	Heemstede	NH	\N	\N
2366	30-03-2017	2017-03-30 00:00:00	33/90	Skiddilly	31-03-2017	2017-03-31 00:00:00	33/91	BSI	51.4030075	5.91344976	onder brug Helenavaart	Helenaveen	NB	\N	\N
3732	02-11-2020	2020-11-02 00:00:00	40/870	Bensi	04-11-2020	2020-11-04 00:00:00	40/871	Okami_Xci	51.8995972	6.20932102	tegen boom Peeskesweg	Beek (Monferland)	Ge	\N	\N
1031	21-12-2012	2012-12-21 00:00:00	18/33	tdemmer	21-12-2012	2012-12-21 00:00:00	18/34	Ronald_010	51.7883873	4.91027403	in rooster Papsluis	Hank	NB	\N	\N
2477	05-07-2017	2017-07-05 00:00:00	35/07	HighKing	06-07-2017	2017-07-06 00:00:00	35/08	Amauta	52.622757	4.77138281	in struik Korte Schermerdijk	Alkmaar	NH	\N	\N
3291	01-11-2019	2019-11-01 00:00:00	40/497	Picobello BV	01-11-2019	2019-11-01 00:00:00	40/498	Hans89	51.9165688	4.52883482	aan hek Erasmusplaza, Kralingsezoom	Rotterdam	ZH	\N	\N
3385	17-02-2020	2020-02-17 00:00:00	40/569	Amauta	18-02-2020	2020-02-18 00:00:00	40/570	FastEddy	53.0590134	6.52710915	onder struik monument Zeyer Strubben	Zeyen	Dr	\N	\N
2986	08-01-2019	2019-01-08 00:00:00	40/166	FastEddy	11-01-2019	2019-01-11 00:00:00	40/168	Ronny Rabbelaar	53.0129471	6.95903206	aan voetbrug Kanaal	Stadskanaal	Gr	\N	\N
638	26-11-2011	2011-11-26 00:00:00	13/53	tdemmer	26-11-2011	2011-11-26 00:00:00	13/53	jaap43	51.9864159	4.63026524	laagste punt van Vliet, Nieuwerkerk a/d IJssel, ZH	Nieuwerkerk a/d IJssel	ZH	\N	\N
1261	01-07-2013	2013-07-01 00:00:00	21/59	Sjantaalfoutje	01-07-2013	2013-07-01 00:00:00	21/60	Bensi	52.2452011	6.05495977	aan stuw bij de Zanden	Teuge	Ge	\N	\N
310	06-04-2011	2011-04-06 00:00:00	8/70	Mr.Bean	06-04-2011	2011-04-06 00:00:00	8/71	Bensi	51.869133	6.2271452	onder brug Hinthorsterstraat, Stokkum, Ge	Stokkum	Ge	\N	\N
1043	02-01-2013	2013-01-02 00:00:00	18/46	BSI	03-01-2013	2013-01-03 00:00:00	18/48	jeffrey120	52.1585236	5.50324917	aan bord Stoutenburgerweg	Terschuur	Ge	\N	\N
2847	06-08-2018	2018-08-06 00:00:00	39/98	Roeleey	06-08-2018	2018-08-06 00:00:00	39/98	Coenster	52.2991905	4.97465086	in boom Meerkerkdreef	Amsterdam	NH	\N	\N
1366	24-09-2013	2013-09-24 00:00:00	22/94	Caun	25-09-2013	2013-09-25 00:00:00	22/95	BSI	52.4056091	5.84394789	achter plaat Bovenweg/Bodweg	Doornspijk	Ge	\N	\N
395	30-05-2011	2011-05-30 00:00:00	10/18	wesleyc	30-05-2011	2011-05-30 00:00:00	10/20	Dirk130	52.0392265	4.1831069	Bloedberg - uitzichtpunt langs Slaperdijk, Monster, ZH	Monster	ZH	\N	\N
3373	04-02-2020	2020-02-04 00:00:00	40/561	ootje	04-02-2020	2020-02-04 00:00:00	40/561	Amauta	52.5692215	4.7442832	tegen fietsenrek p-plaats Uiterdam	Akersloot	NH	\N	\N
1122	19-03-2013	2013-03-19 00:00:00	19/62	SadBunny	20-03-2013	2013-03-20 00:00:00	19/63	Corney28	52.3382149	5.13781118	aan einde IJmeerdijk	Almere	Fl	\N	\N
813	01-06-2012	2012-06-01 00:00:00	15/74	Outdoor Man	02-06-2012	2012-06-02 00:00:00	15/75	dks_aa	52.935215	5.04224491	bij vuurtoren, Den Oever, NH	Den Oever	NH	\N	\N
3532	05-06-2020	2020-06-05 00:00:00	40/694	MeanYellowBoy	06-06-2020	2020-06-06 00:00:00	40/695	pdv_moto	51.7402496	5.87002277	aan hek Tourmalijnlaan	Cuijk	NB	\N	\N
914	06-09-2012	2012-09-06 00:00:00	16/92	Bomba	07-09-2012	2012-09-07 00:00:00	16/93	tdemmer	52.0492477	4.809659	aan boom - Westeinde	Waarder	ZH	\N	\N
358	03-05-2011	2011-05-03 00:00:00	9/50	Smuiger	03-05-2011	2011-05-03 00:00:00	9/50	Kato	52.2540436	5.25196409	rotonde bij koeien - Zuidersingel, Eemnes, Ut	Eemnes	Ut	\N	\N
1578	31-03-2014	2014-03-31 00:00:00	25/51	Corney28	31-03-2014	2014-03-31 00:00:00	25/52	BSI	52.3454857	4.91675186	aan motor P-garage Hogeschool	Amsterdam	NH	\N	\N
4232	11-08-2022	2022-08-11 00:00:00	41/290	Outdoor Man	11-08-2022	2022-08-11 00:00:00	41/291	pdv_moto	52.5617065	4.6906271	achter container Uitgeesterweg	Limmen	NH	\N	\N
2975	30-12-2018	2018-12-30 00:00:00	40/150	pdv_moto	31-12-2018	2018-12-31 00:00:00	40/151	DKP	51.5298233	3.46389794	aan paaltje Poppekerkseweg	Westkapelle	Ze	\N	\N
2272	11-10-2016	2016-10-11 00:00:00	32/60	PatrickSoler	12-10-2016	2016-10-12 00:00:00	32/61	BSI	52.1447449	4.49485207	onder boom Kanaalpark	Leiden	ZH	\N	\N
1981	05-08-2015	2015-08-05 00:00:00	29/34	Roeleey	05-08-2015	2015-08-05 00:00:00	29/35	Corney28	52.2947273	4.94432592	aan hek gamma Sijsjesbergweg	Amsterdam	NH	\N	\N
1552	11-03-2014	2014-03-11 00:00:00	25/21	tdemmer	12-03-2014	2014-03-12 00:00:00	25/22	Ronald_010	51.9618378	4.54692602	aan steiger Lutulisingel - Ommoord	Rotterdam	ZH	\N	\N
3588	19-07-2020	2020-07-19 00:00:00	40/739	Bensi	19-07-2020	2020-07-19 00:00:00	40/739	Arriens	52.0200462	6.12796783	achter ingegevane tank Ellecomsedijk	Ellecom	Ge	\N	\N
2447	03-06-2017	2017-06-03 00:00:00	34/70	Bomba	04-06-2017	2017-06-04 00:00:00	34/71	Wimis on	52.1187935	4.83094978	aan hek Rondweg	Zegveld	Ut	\N	\N
828	16-06-2012	2012-06-16 00:00:00	15/94	Ronald_010	17-06-2012	2012-06-17 00:00:00	15/95	Muffin	52.211338	4.40240908	aan hek P-terrein - Buitensluis, Katwijk, ZH	Katwijk	ZH	\N	\N
743	18-03-2012	2012-03-18 00:00:00	14/94	Ronald_010	19-03-2012	2012-03-19 00:00:00	14/96	Hans89	51.5044365	4.78043413	in bosje bij grenspaal 218, Strijbeek, NB	Strijbeek	NB	\N	\N
530	10-09-2011	2011-09-10 00:00:00	11/97	rvdh86	10-09-2011	2011-09-10 00:00:00	11/97	Buuv	52.344471	5.70588112	in locomotief - Hierdenseweg, Hulshorst, Ge	Hulshorst	Ge	\N	\N
1878	11-04-2015	2015-04-11 00:00:00	28/49	ootje	11-04-2015	2015-04-11 00:00:00	28/49	Djoost	52.4926567	4.82094288	aan hek Engewormer	Wormer	NH	\N	\N
1201	08-05-2013	2013-05-08 00:00:00	20/73	Bar-E	08-05-2013	2013-05-08 00:00:00	20/74	Hans89	51.5970993	4.74110699	aan hek Korte Huyfakkerstraat	Breda	NB	\N	\N
2191	01-08-2016	2016-08-01 00:00:00	31/65	nixor	05-08-2016	2016-08-05 00:00:00	31/66	Rik60NL	51.4721489	4.46324778	in bosje Restaurant - Essenseweg	Nispen	NB	\N	\N
3140	09-06-2019	2019-06-09 00:00:00	40/352	Sjefman	11-06-2019	2019-06-11 00:00:00	40/353	Deeffox	51.6989098	4.86568213	in bosje bij W. Letscherbrug	Geertruidenberg	NB	\N	\N
632	18-11-2011	2011-11-18 00:00:00	13/46	jaap43	18-11-2011	2011-11-18 00:00:00	13/47	Ronald_010	51.9685059	4.63177299	aan paaltje - IJsseldijk N, Ouderkerk a/d IJssel, ZH	Ouderkerk a/d IJssel	ZH	\N	\N
2664	17-03-2018	2018-03-17 00:00:00	37/80	Amauta	18-03-2018	2018-03-18 00:00:00	37/81	BSI	53.1121941	4.8199439	achter E-kast Eilandgalerij	de Cocksdorp	NH	\N	\N
161	05-12-2010	2010-12-05 00:00:00	5/34	bobcat	07-12-2010	2010-12-07 00:00:00	5/35	Smuiger	52.8022194	5.01121902	T-kruising Flevoweg-Westermiddenmeerweg, Middenmeer, NH	Middenmeer	NH	\N	\N
907	01-09-2012	2012-09-01 00:00:00	16/87	bikedan	02-09-2012	2012-09-02 00:00:00	16/87	Phaedrus	51.6963806	4.4397769	aan vuurtoren - Lantaarndijk	Willemstad	NB	\N	\N
3124	25-05-2019	2019-05-25 00:00:00	40/337	Carburateur	25-05-2019	2019-05-25 00:00:00	40/338	Bomba	51.9558754	4.39648819	aan struik p-terrein Kandelaarweg	Overschie	ZH	\N	\N
2021	03-10-2015	2015-10-03 00:00:00	29/75	Amauta	05-10-2015	2015-10-05 00:00:00	29/77	pdv_moto	50.9410019	5.85472679	aan kalfjebij Huize ten Dijcken	Spaubeek	Li	\N	\N
785	21-04-2012	2012-04-21 00:00:00	15/39	scheurschuimpje	21-04-2012	2012-04-21 00:00:00	15/39	Buikschuiver oet Dre	52.7814026	6.30727577	onder afdakje Rheebruggen, Uffelte, Dr	Uffelte	Dr	\N	\N
2182	24-07-2016	2016-07-24 00:00:00	31/55	Bomba	24-07-2016	2016-07-24 00:00:00	31/56	bikedan	51.5400391	4.58681011	aan hek Kerkenheidestraat	Sprundel	NB	\N	\N
2305	10-12-2016	2016-12-10 00:00:00	33/15	BornToReign	11-12-2016	2016-12-11 00:00:00	33/15	pdv_moto	51.9955826	5.60149002	onder brug Werftweg	Bennekom	Ge	\N	\N
2906	18-09-2018	2018-09-18 00:00:00	40/60	Coenster	18-09-2018	2018-09-18 00:00:00	40/61	Amauta	51.9919815	5.84885311	in boompot van Limburg Stirumweg	Oosterbeek	Ge	\N	\N
766	04-04-2012	2012-04-04 00:00:00	15/19	Hans89	05-04-2012	2012-04-05 00:00:00	15/20	tdemmer	51.4703979	4.58846617	in holte boom - Roosendaalsebaan, Zundert, NB	Zundert	NB	\N	\N
2603	22-12-2017	2017-12-22 00:00:00	36/83	pdv_moto	24-12-2017	2017-12-24 00:00:00	36/85	-Floris-	51.4827957	3.65696001	bij lantaarnpaal kerk 	Nieuw en St. Joosland	Ze	\N	\N
1716	17-08-2014	2014-08-17 00:00:00	26/98	Roeleey	18-08-2014	2014-08-18 00:00:00	27/01	Blogem	52.3771248	4.9463501	onder bordes KNMS-laan	Amsterdam	NH	\N	\N
2865	16-08-2018	2018-08-16 00:00:00	40/17	Bomba	17-08-2018	2018-08-17 00:00:00	40/18	Amauta	51.9750557	4.9741621	tegen hek aan eind Alterenlaan	Lopik	Ut	\N	\N
3610	05-08-2020	2020-08-05 00:00:00	40/766	Deeffox	05-08-2020	2020-08-05 00:00:00	40/767	Bensi	51.9914932	5.08040285	tegen plaatsnaambord Viaanse Bos	Vianen	Ut	\N	\N
274	19-03-2011	2011-03-19 00:00:00	8/9	ndeeka	19-03-2011	2011-03-19 00:00:00	8/9	bakfiets1	51.6941032	4.4209671	bij bord aan de Hellegatsweg, Willemstad, NB	Willemstad	NB	\N	\N
1163	10-04-2013	2013-04-10 00:00:00	20/23	Corney28	11-04-2013	2013-04-11 00:00:00	20/24	Roeleey	52.1871834	4.90513515	aan berkenboom - Wilnisse Zuwe	Wilnis	Ut	\N	\N
1313	17-08-2013	2013-08-17 00:00:00	22/24	Scoot_020/Scoot_2	17-08-2013	2013-08-17 00:00:00	22/25	BSI	52.429142	4.77941322	aan afvalbak - Westzanerweg	Westzaan	NH	\N	\N
2673	24-03-2018	2018-03-24 00:00:00	37/91	Roeleey	25-03-2018	2018-03-25 00:00:00	37/91	Okami_Xci	52.3294868	4.91573286	in haltebord GVB, Joan Muyskenweg	Amsterdam	NH	\N	\N
3351	14-01-2020	2020-01-14 00:00:00	40/546	Hans89	14-01-2020	2020-01-14 00:00:00	40/546	ey-dzeej	51.9437447	4.60604382	onder boomstam Blaardorpseweg	Nieuwerkerk a/d Ijssel	ZH	\N	\N
3517	28-05-2020	2020-05-28 00:00:00	40/679	Hans89	29-05-2020	2020-05-29 00:00:00	40/680	pdv_moto	51.9044685	4.4836421	in heg bij schoorstenen, Wiljelminapier	Rotterdam	ZH	\N	\N
1405	30-10-2013	2013-10-30 00:00:00	23/58	Corney28	01-11-2013	2013-11-01 00:00:00	23/59	SadBunny	52.3469162	4.89539003	onder bouwcontainer - Maasstraat	Amsterdam	NH	\N	\N
2056	20-01-2016	2016-01-20 00:00:00	30/18	Hans89	26-01-2016	2016-01-26 00:00:00	30/19	tdemmer	51.9858437	4.67175817	aan muur Veerstoep	Moordrecht	ZH	\N	\N
2788	18-06-2018	2018-06-18 00:00:00	39/23	Coenster	19-06-2018	2018-06-19 00:00:00	39/24	BornToReign	51.9838753	6.00562811	aan voet lantaarnpaal Bandijk	Lathum	Ge	\N	\N
3773	20-12-2020	2020-12-20 00:00:00	40/906	ey-dzeej	21-12-2020	2020-12-21 00:00:00	40/908	Outdoor Man	51.967907	4.59241676	onder landhoofd viaduct over A20	Nieuwerkerk a/d Ijssel	ZH	\N	\N
1479	16-01-2014	2014-01-16 00:00:00	24/41	Blogem	17-01-2014	2014-01-17 00:00:00	24/42	BSI	52.3548584	4.96252108	aan 150 kV-station - Kruisweg	Amsterdam	NH	\N	\N
3180	29-07-2019	2019-07-29 00:00:00	40/396	Deeffox	29-07-2019	2019-07-29 00:00:00	40/397	Outdoor Man	51.8340416	4.7588191	aan hek bij E-huisje Parallelweg	Sliedrecht	ZH	\N	\N
124	04-11-2010	2010-11-04 00:00:00	4/48	josefientje123	04-11-2010	2010-11-04 00:00:00	4/49	tdemmer	52.4449806	4.66867685	Oostbroekerweg, Velsen zuid, NH	Velsen	NH	\N	\N
2877	23-08-2018	2018-08-23 00:00:00	40/30	Outdoor Man	23-08-2018	2018-08-23 00:00:00	40/30	Roeleey	52.3155708	4.89915609	onder bruggetje Kostverlorenkade	Amstelveen	NH	\N	\N
976	05-11-2012	2012-11-05 00:00:00	17/69	Ronald_010	05-11-2012	2012-11-05 00:00:00	17/70	tdemmer	51.9121094	4.24258995	aan bankje Veerstroep	Rozenburg	ZH	\N	\N
3565	01-07-2020	2020-07-01 00:00:00	40/721	Roeleey	01-07-2020	2020-07-01 00:00:00	40/721	pdv_moto	52.2982178	4.98365784	aan scooter Vianenstraat	Amsterdam	NH	\N	\N
4397	09-09-2023	2023-09-09 00:00:00	41/400	Marsian	10-09-2023	2023-09-10 00:00:00	41/401	k0en	52.4015541	5.61455202	tegen paaltje ingang Harderbos Sternweg	Zeewolde	Fl	\N	\N
977	05-11-2012	2012-11-05 00:00:00	17/70	tdemmer	05-11-2012	2012-11-05 00:00:00	17/71	Bomba	52.020977	4.60299206	bij buis in talud - N. Dwarsweg	Zevenhuizen	ZH	\N	\N
3483	01-05-2020	2020-05-01 00:00:00	40/653	pdv_moto	01-05-2020	2020-05-01 00:00:00	40/653	Picobello BV	52.0981865	4.25817204	tegen pol  helmgras Buitenhaven	Scheveningen	ZH	\N	\N
1495	03-02-2014	2014-02-03 00:00:00	24/59	tdemmer	03-02-2014	2014-02-03 00:00:00	24/59	Ronald_010	51.9840317	4.62522507	aan hek 2e Tochtweg	Nieuwerkerk a/d IJssel	ZH	\N	\N
1007	25-11-2012	2012-11-25 00:00:00	18/12	magnamaniac	26-11-2012	2012-11-26 00:00:00	18/14	JurgenT	51.8629074	5.78030777	onder kruik - van Heemstraweg	Beuningen	Ge	\N	\N
1611	28-04-2014	2014-04-28 00:00:00	25/84	MLB	29-04-2014	2014-04-29 00:00:00	25/85	Hans89	51.609581	5.088624	onder bruggetje Udenhoutseweg	Oosterhout	NB	\N	\N
893	10-08-2012	2012-08-10 00:00:00	16/71	de peppel	10-08-2012	2012-08-10 00:00:00	16/72	JurgenT	52.0114708	6.33030796	aan paal Langenberg - Oude Esweg	Zelhem	Ge	\N	\N
2503	02-08-2017	2017-08-02 00:00:00	35/35	Capo-04/06	02-08-2017	2017-08-02 00:00:00	35/36	Okami_Xci	50.8523026	5.82681608	in H-balk - HeunsJ2505:J2534bergerweg	Valkenburg	Li	\N	\N
58	22-09-2010	2010-09-22 00:00:00	2/99	Ukkie	22-09-2010	2010-09-22 00:00:00	2/100	V-Strommert	52.3248405	4.8901391	kunstwerk Boshuizenstraat, Amsterdam, NH	Amsterdam	NH	\N	\N
2227	04-09-2016	2016-09-04 00:00:00	32/04	Bigtwim	05-09-2016	2016-09-05 00:00:00	32/04	Djoost	52.475029	4.65610981	aan bord wegomlegging - Parallelweg	Beverwijk	NH	\N	\N
1241	11-06-2013	2013-06-11 00:00:00	21/36	Hans89	14-06-2013	2013-06-14 00:00:00	21/37	bikedan	51.4410896	4.00733519	onder anker op kop Voorhaven	Hansweert	Ze	\N	\N
4265	17-11-2022	2022-11-17 00:00:00	41/313	Okami_Xci	19-11-2022	2022-11-19 00:00:00	41/313	pdv_moto	51.4625092	5.48699903	in bosje achter paal J.F. Kennedylaan	Eindhoven	NB	\N	\N
3681	30-09-2020	2020-09-30 00:00:00	40/833	Picobello BV	30-09-2020	2020-09-30 00:00:00	40/834	Hans89	52.0278549	4.48661709	tegen hek Poortmanweg	Berkel en Rodenrijs	ZH	\N	\N
2543	10-09-2017	2017-09-10 00:00:00	35/91	BSI	10-09-2017	2017-09-10 00:00:00	35/92	MP_NL	52.283226	6.77571392	in heg Txaco - Holstersweg	Hengelo	Ov	\N	\N
698	31-01-2012	2012-01-31 00:00:00	14/35	Wolvin	05-02-2012	2012-02-05 00:00:00	14/39	ndeeka	53.21912	5.82684612	aan steiger jachthaven Tolhuswei, Leeuwarden, Fr	Leeuwarden	Fr	\N	\N
3332	20-12-2019	2019-12-20 00:00:00	40/532	ey-dzeej	20-12-2019	2019-12-20 00:00:00	40/532	Mitssz	51.9117851	4.37236977	in struik bij sluis Vijfsluizen	Schiedam	ZH	\N	\N
2647	25-02-2018	2018-02-25 00:00:00	37/55	Amauta	27-02-2018	2018-02-27 00:00:00	37/56	pdv_moto	52.0785179	6.44798899	in bosje p-plaats kasteel	Ruurlo	Ge	\N	\N
2626	26-01-2018	2018-01-26 00:00:00	37/18	pdv_moto	26-01-2018	2018-01-26 00:00:00	37/18	HighKing	52.0744781	5.07304001	op samenkomst 2 viaducten	Utrecht	Ut	\N	\N
2967	25-12-2018	2018-12-25 00:00:00	40/140	Roeleey	25-12-2018	2018-12-25 00:00:00	40/140	FastEddy	52.3320084	5.05384016	aan paal op kruispunt Maxixweg	Muiden	NH	\N	\N
4139	02-03-2022	2022-03-02 00:00:00	41/227	BSI	03-03-2022	2022-03-03 00:00:00	41/227	FastEddy	52.6533394	6.87327814	achter betonnen plaat	Schoonebeek	Dr	\N	\N
1123	20-03-2013	2013-03-20 00:00:00	19/64	Corney28	20-03-2013	2013-03-20 00:00:00	19/64	SadBunny	52.2149811	4.82146692	Toer. Overstapplek de Hoef	Mijdrecht	Ut	\N	\N
2418	12-05-2017	2017-05-12 00:00:00	34/42	Amauta	13-05-2017	2017-05-13 00:00:00	34/43	Eztys	53.3371658	6.37728405	bij molen de Zwaluw -Noeshorn	Zuurdijk	Gr	\N	\N
3038	13-03-2019	2019-03-13 00:00:00	40/241	Rik60NL	13-03-2019	2019-03-13 00:00:00	40/241	Coenster	52.2610016	4.87305593	in struikje St. Urbanuskerk	Nes aan de Amstel	NH	\N	\N
1270	07-07-2013	2013-07-07 00:00:00	21/71	BSI	07-07-2013	2013-07-07 00:00:00	21/71	rvdh86	52.2220383	5.52833319	aan boom Deuverdenseweg	Nijkerk	Ge	\N	\N
654	04-12-2011	2011-12-04 00:00:00	13/68	Hasseman	04-12-2011	2011-12-04 00:00:00	13/69	Starscream	52.4060555	6.88388395	aan hek bij joodse begraafplaats, Ootmarsum, Ov	Ootmarsum	Ov	\N	\N
3262	06-10-2019	2019-10-06 00:00:00	40/474	pdv_moto	09-10-2019	2019-10-09 00:00:00	40/475	Hans89	51.5290031	3.44674706	tegen paaltje Kerkeweg	Westkapelle	Ze	\N	\N
896	11-08-2012	2012-08-11 00:00:00	16/74	rvdh86	12-08-2012	2012-08-12 00:00:00	16/75	BSI	52.2862854	5.78397179	aan bospad bij Molenweg	Elspeet	Ge	\N	\N
3279	24-10-2019	2019-10-24 00:00:00	40/488	Coenster	25-10-2019	2019-10-25 00:00:00	40/488	SadBunny	52.1173553	5.00543499	aan boom P-plaats Termaterweg	Vleuten	Ut	\N	\N
2890	03-09-2018	2018-09-03 00:00:00	40/43	FastEddy	05-09-2018	2018-09-05 00:00:00	40/44	frankivo	52.8414841	6.52347088	aan 9e knotwilg sluis Holthe	Beilen	Dr	\N	\N
2471	27-06-2017	2017-06-27 00:00:00	34/95	Wimis on	27-06-2017	2017-06-27 00:00:00	34/96	Rik60NL	52.0233498	5.15939283	in heg bij brandweer - Hefbrug	Houten	Ut	\N	\N
70	29-09-2010	2010-09-29 00:00:00	3/25	*Jet*	29-09-2010	2010-09-29 00:00:00	3/26	Smuiger	52.7141838	5.28739786	sprookjesland, Purmerend, NH	Purmerend	NH	\N	\N
2929	15-10-2018	2018-10-15 00:00:00	40/89	Bensi	17-10-2018	2018-10-17 00:00:00	40/90	Arriens	52.0081177	5.96424913	tegen boom park Rosendael	Rozendaal	Ge	\N	\N
3044	18-03-2019	2019-03-18 00:00:00	40/247	Coenster	18-03-2019	2019-03-18 00:00:00	40/247	Rik60NL	52.2640839	4.59309483	aan paal IJ-weg	Nieuw-Vennep	NH	\N	\N
109	25-10-2010	2010-10-25 00:00:00	4/10	BigJim	25-10-2010	2010-10-25 00:00:00	4/12	vuurbloed	52.4554863	4.89346504	bruggetje Luyendijkje, de Ilp, NH	Den Ilp	NH	\N	\N
697	28-01-2012	2012-01-28 00:00:00	14/32	Ronald_010	30-01-2012	2012-01-30 00:00:00	14/33	scheurschuimpje	51.8066597	5.19333315	aan betonnen bulldozer Waalbandijk, Gameren, Ge	Gameren	Ge	\N	\N
4344	24-05-2023	2023-05-24 00:00:00	41/366	blub blub	26-05-2023	2023-05-26 00:00:00	41/366	Bensi	52.1966286	6.3675108	in infopaneel Molenveld	Laren	Ge	\N	\N
275	19-03-2011	2011-03-19 00:00:00	8/9	bakfiets1	20-03-2011	2011-03-20 00:00:00	8/10	jaap43	51.6610565	4.31681204	voet laatste molen - Mariadijk, Ooltgensplaat, ZH	Ooltgensplaat	ZH	\N	\N
2479	07-07-2017	2017-07-07 00:00:00	35/09	Rik60NL	07-07-2017	2017-07-07 00:00:00	35/10	Kevson	52.1991425	5.06093979	bij bord bebouwde kom - Bloklaan	Loosdrecht	NH	\N	\N
1149	01-04-2013	2013-04-01 00:00:00	19/96	BSI	01-04-2013	2013-04-01 00:00:00	19/97	rvdh86	52.1862144	5.60678482	bij monument - Koninginnelaan	Voorthuizen	Ge	\N	\N
1871	25-03-2015	2015-03-25 00:00:00	28/39	Bomba	27-03-2015	2015-03-27 00:00:00	28/40	Rainbow600	52.1863785	4.67328119	bij kast GSM-mast - Herenweg	Woubrugge	ZH	\N	\N
1658	03-06-2014	2014-06-03 00:00:00	26/33	tdemmer	05-06-2014	2014-06-05 00:00:00	26/34	TwoFace B	51.574276	4.17274904	aan hek Zoetendijk	Nieuw Vossemeer	Ze	\N	\N
3021	24-02-2019	2019-02-24 00:00:00	40/218	Amauta	24-02-2019	2019-02-24 00:00:00	40/219	SadBunny	52.2140007	4.86201811	op rotonde Dukaton	Mijdrecht	Ut	\N	\N
1075	11-02-2013	2013-02-11 00:00:00	19/03	BSI	12-02-2013	2013-02-12 00:00:00	19/03	Dirk130	52.1783371	5.96277285	aan paal P-terrein Achmea	Apeldoorn	Ge	\N	\N
4238	04-09-2022	2022-09-04 00:00:00	41/296	Roeleey	04-09-2022	2022-09-04 00:00:00	41/296	BSI	52.3233833	4.89379501	aan bord Aemstel Schooltuinen	Amsterdam	NH	\N	\N
3882	16-04-2021	2021-04-16 00:00:00	41/046	Amauta	16-04-2021	2021-04-16 00:00:00	41/046	FastEddy	52.5996132	6.40135479	achter bordje Avereest molen "de Star" 	Balkbrug	Ov	\N	\N
2388	18-04-2017	2017-04-18 00:00:00	34/14	Rik60NL	18-04-2017	2017-04-18 00:00:00	34/15	pdv_moto	52.2271309	4.80176783	aan boom P-plaats - Amsteldijk Zuid	Uithoorn	NH	\N	\N
3176	22-07-2019	2019-07-22 00:00:00	40/393	Sjefman	26-07-2019	2019-07-26 00:00:00	40/394	Deeffox	51.4856033	4.50065613	in boomvork langs het Dreefje	Schijf	NB	\N	\N
3863	03-04-2021	2021-04-03 00:00:00	41/031	Ronny Rabbelaar	04-04-2021	2021-04-04 00:00:00	41/031	pdv_moto	52.8371735	5.71290112	tegen hek bij gemaal Buma, Gemaalweg	Rutte	Fl	\N	\N
2779	14-06-2018	2018-06-14 00:00:00	39/18	Coenster	16-06-2018	2018-06-16 00:00:00	39/19	SadBunny	51.9663048	5.98963881	in coniferenhaag Dijkgraaf	Duiven	Ge	\N	\N
1823	07-01-2015	2015-01-07 00:00:00	27/96	Rainbow600	11-01-2015	2015-01-11 00:00:00	27/97	Scoot_020/Scoot_2	52.3476334	5.24099016	Kasteel Almere - oude Waterlandseweg	Almere	Fl	\N	\N
2480	07-07-2017	2017-07-07 00:00:00	35/10	Kevson	08-07-2017	2017-07-08 00:00:00	35/11	BSI	52.225502	5.22231388	bij speelbos 't Laer - Oude Postweg	Laren	NH	\N	\N
3489	05-05-2020	2020-05-05 00:00:00	40/657	HighKing	05-05-2020	2020-05-05 00:00:00	40/657	FastEddy	53.4111061	6.18951988	in struik bij Cleveringshuizen	Anjum	Fr	\N	\N
3856	31-03-2021	2021-03-31 00:00:00	41/026	k0en	31-03-2021	2021-03-31 00:00:00	41/026	Outdoor Man	52.0948524	5.07066822	tegen trap dienstgebouw A2, Berlijnplein	Utrecht	Ut	\N	\N
280		0001-01-01 00:00:00 BC		Eady		0001-01-01 00:00:00 BC			\N	\N				\N	\N
2258	01-10-2016	2016-10-01 00:00:00	32/42	frankivo	01-10-2016	2016-10-01 00:00:00	32/42	Amauta	53.2295303	6.53342485	aan betonwand langs Reitdiep	Groningen	Gr	\N	\N
3329	19-12-2019	2019-12-19 00:00:00	40/531	ey-dzeej	19-12-2019	2019-12-19 00:00:00	40/531	Picobello BV	51.9799957	4.632792	bij hek spoorwegovergang 2e Tochtweg	Nieuwerkerk a/d Ijssel	ZH	\N	\N
644	28-11-2011	2011-11-28 00:00:00	13/58	BigJim	29-11-2011	2011-11-29 00:00:00	13/59	Spro	52.3832207	4.75013018	Stoomgemaal - Haarlemmermeerweg, Halfweg, NH	Halfweg	NH	\N	\N
1192	04-05-2013	2013-05-04 00:00:00	20/63	SadBunny	04-05-2013	2013-05-04 00:00:00	20/64	Roeleey	52.4085693	4.83961678	aan boom Benzolweg	Amsterdam	NH	\N	\N
2979	02-01-2019	2019-01-02 00:00:00	40/155	Sjefman	03-01-2019	2019-01-03 00:00:00	40/157	BSI	51.549118	4.52972078	in heg bij tankstation A58	Rucphen	NB	\N	\N
994	14-11-2012	2012-11-14 00:00:00	17/91	Bigtwim	15-11-2012	2012-11-15 00:00:00	17/92	Smuiger	52.6528664	4.83550215	bij muur Schaapskuilmeer	Heerhugowaard	NH	\N	\N
1162	10-04-2013	2013-04-10 00:00:00	20/22	SadBunny	10-04-2013	2013-04-10 00:00:00	20/22	Corney28	52.3794174	4.87604284	aan paal Fr. Hendr. Plantsoen	Amsterdam	NH	\N	\N
2180	23-07-2016	2016-07-23 00:00:00	31/54	coffeejunk	23-07-2016	2016-07-23 00:00:00	31/54	Rik60NL	52.2816238	4.78378296	op P-terrein de Beach	Aalsmeer	NH	\N	\N
1645	20-05-2014	2014-05-20 00:00:00	26/14	Hasseman	22-05-2014	2014-05-22 00:00:00	26/15	frankivo	52.2963409	6.72961712	aan paal - Azelosestraat	Borne	Ov	\N	\N
670	24-12-2011	2011-12-24 00:00:00	13/91	Ronald_010	24-12-2011	2011-12-24 00:00:00	13/91	tdemmer	52.0424957	4.56179619	aan paaltje voetbrug Rottedijk, Moerkapelle, ZH	Moerkapelle	ZH	\N	\N
621		0001-01-01 00:00:00 BC				0001-01-01 00:00:00 BC		MarkieNL	\N	\N				\N	\N
2079	12-03-2016	2016-03-12 00:00:00	30/42	pdv_moto	13-03-2016	2016-03-13 00:00:00	30/42	bikedan	51.4990807	3.52570105	aan poort van de kerk	Biggekerke	Ze	\N	\N
2112	04-05-2016	2016-05-04 00:00:00	30/83	Roeleey	04-05-2016	2016-05-04 00:00:00	30/83	Sander78	52.3929405	4.86850405	bij koeien - Spaarndammerdijk	Amsterdam	NH	\N	\N
1514	14-02-2014	2014-02-14 00:00:00	24/81	Rainbow600	14-02-2014	2014-02-14 00:00:00	24/81	BSI	52.3552704	5.22157621	aan boom P&R 't Oor - Ooorweg	Almere	Fl	\N	\N
1877	10-04-2015	2015-04-10 00:00:00	28/48	Djoost	11-04-2015	2015-04-11 00:00:00	28/49	ootje	52.3492088	4.92630005	in heg Intratuin - Nobelweg	Amsterdam	NH	\N	\N
2308	11-12-2016	2016-12-11 00:00:00	33/16	pdv_moto	12-12-2016	2016-12-12 00:00:00	33/17	Ronald_010	52.0901566	4.29401493	aan boom beeld Scheveningseweg	Den Haag	ZH	\N	\N
956	20-10-2012	2012-10-20 00:00:00	17/42	Meifesto	20-10-2012	2012-10-20 00:00:00	17/42	Ronald_010	51.9097519	4.55352688	aan hek - IJsseldijk	Capelle aan den Ijssel	ZH	\N	\N
1277	10-07-2013	2013-07-10 00:00:00	21/77	VreemdeBeet	10-07-2013	2013-07-10 00:00:00	21/78	Guvner	52.1579399	4.49213886	in bloembak Koornbeursbrug	Leiden	ZH	\N	\N
3030	02-03-2019	2019-03-02 00:00:00	40/230	Okami_Xci	07-03-2019	2019-03-07 00:00:00	40/232	Rik60NL	51.4531212	5.40256596	onder looppad P-garage Flight Forum	Eindhoven	NB	\N	\N
910	04-09-2012	2012-09-04 00:00:00	16/89	tdemmer	04-09-2012	2012-09-04 00:00:00	16/89	V-Strommert	52.1582642	4.726336	aan knotwilg - Korteraarseweg	ter Aar	ZH	\N	\N
4076	18-12-2021	2021-12-18 00:00:00	41/188	Springbok	20-12-2021	2021-12-20 00:00:00	41/188	pdv_moto	51.9695587	5.53926897	tegen boompje Utrechtsestraatweg	Rhenen	Ut	\N	\N
3355	16-01-2020	2020-01-16 00:00:00	40/548	Sjefman	19-01-2020	2020-01-19 00:00:00	40/549	pdv_moto	51.4689903	4.2923851	achter afvalbak P-terrein Fianestraat	Bergen op Zoom	NB	\N	\N
3297	06-11-2019	2019-11-06 00:00:00	40/504	Arriens	08-11-2019	2019-11-08 00:00:00	40/505	Amauta	52.0291519	6.65447617	aan paal plaatsnaambord Zwolle	Groenlo	Ge	\N	\N
3725	28-10-2020	2020-10-28 00:00:00	40/865	Picobello BV	28-10-2020	2020-10-28 00:00:00	40/866	Carburateur	52.2119865	4.60974503	tegen landhoofd brug	Nieuwe Wetering	ZH	\N	\N
212	30-01-2011	2011-01-30 00:00:00	6/69	BSI	30-01-2011	2011-01-30 00:00:00	6/71	vuurbloed	52.1143303	4.65198612	poort Archeon, Alphen a/d Rijn, ZH	Alphen a/d Rijn	ZH	\N	\N
34	04-09-2010	2010-09-04 00:00:00	2/38	Hayfork	04-09-2010	2010-09-04 00:00:00	2/40	El Rojo	51.5270882	5.97583818	Cafe de Uitmarkt - Grote Markt 1, Venray, Li	Venray	Li	\N	\N
1487	21-01-2014	2014-01-21 00:00:00	24/48	Ronald_010	22-01-2014	2014-01-22 00:00:00	24/49	SparkViv	51.8654213	4.54377222	aan hek Lorentzweg	Barendrecht	ZH	\N	\N
3633	20-08-2020	2020-08-20 00:00:00	40/793	Yosra87	20-08-2020	2020-08-20 00:00:00	40/794	Hans89	51.9012871	4.4598999	tegen slavernij monument, Lloydstraat	Rotterdam	ZH	\N	\N
3128	27-05-2019	2019-05-27 00:00:00	40/340	Pendragon	29-05-2019	2019-05-29 00:00:00	40/341	HighKing	52.5339775	4.99016809	tegen bord boerderijproducten Kleenweg	Kwadijk	NH	\N	\N
2061	01-02-2016	2016-02-01 00:00:00	30/22	Thijs67	02-02-2016	2016-02-02 00:00:00	30/22	pdv_moto	52.1437721	5.28289223	aan paaltje Heerspoor W-zijde	Soest	Ut	\N	\N
4399	15-09-2023	2023-09-15 00:00:00	41/401	BSI	15-09-2023	2023-09-15 00:00:00	41/401	Hans89	52.1030426	4.26607704	aan trap boulevard Vissershavenweg	Scheveningen	ZH	\N	\N
2485	13-07-2017	2017-07-13 00:00:00	35/16	Rik60NL	14-07-2017	2017-07-14 00:00:00	35/17	Bomba	52.2526436	4.98149586	in boom - Kleiweg	Baambrugge	Ut	\N	\N
1087	20-02-2013	2013-02-20 00:00:00	19/15	Scoot_020/Scoot_2	21-02-2013	2013-02-21 00:00:00	19/16	BSI	52.2865448	4.7689352	aan paal Fokkerweg	Schiphol-Oost	NH	\N	\N
3864	04-04-2021	2021-04-04 00:00:00	41/031	pdv_moto	06-04-2021	2021-04-06 00:00:00	41/032	Outdoor Man	52.0151672	4.25456285	tegen boom bij tuindersknecht, Kerkstraat	Kwintsheul	ZH	\N	\N
577	13-10-2011	2011-10-13 00:00:00	12/68	Dirk130	13-10-2011	2011-10-13 00:00:00	12/69	Hans89	52.1400337	4.38527918	aan hek bij infobord - Jagerslaan, Wassenaar, ZH	Wassenaar	ZH	\N	\N
2736	04-05-2018	2018-05-04 00:00:00	38/68	Amauta	04-05-2018	2018-05-04 00:00:00	38/68	aisnoek	52.6836586	6.21345711	bij uitkijktoren Reggersweg/Reestouwe	Staphorst	Ov	\N	\N
3452	12-04-2020	2020-04-12 00:00:00	40/629	Coenster	12-04-2020	2020-04-12 00:00:00	40/629	Outdoor Man	52.216114	4.70945406	onder randP-plaats Vriezekoop-Noord	Leimuiden	ZH	\N	\N
3367	30-01-2020	2020-01-30 00:00:00	40/557	HermanK	30-01-2020	2020-01-30 00:00:00	40/557	Marsian	52.4891968	5.77069187	op zijn werk, Holsterweg	Dronten	Fl	\N	\N
2354	16-03-2017	2017-03-16 00:00:00	33/76	frankivo	16-03-2017	2017-03-16 00:00:00	33/77	Amauta	53.1825333	6.73470402	achter brandkraan molen Entreprice	Kolham	Gr	\N	\N
299	01-04-2011	2011-04-01 00:00:00	8/49	Hasseman	02-04-2011	2011-04-02 00:00:00	8/50	MotorMieke	52.3937988	6.26588202	Am. Motor Museum - Hondemotsweg, Raalte, Ov	Raalte	Ov	\N	\N
2238	15-09-2016	2016-09-15 00:00:00	32/15	Ronald_010	16-09-2016	2016-09-16 00:00:00	32/15	Amauta	51.9030685	4.35320187	aan boom Wilhelminahaven	Vlaardingen	ZH	\N	\N
877	01-08-2012	2012-08-01 00:00:00	16/58	tdemmer	01-08-2012	2012-08-01 00:00:00	16/58	jaap43	52.0158539	4.60961199	aan hek langs N219	Zevenhuizen	ZH	\N	\N
2703	11-04-2018	2018-04-11 00:00:00	38/24	aisnoek	11-04-2018	2018-04-11 00:00:00	38/25	MeanYellowBoy	52.6777954	6.33425999	op punr bij Ossesluis	de Wijk	Dr	\N	\N
2303	02-12-2016	2016-12-02 00:00:00	33/12	Janhertog	09-12-2016	2016-12-09 00:00:00	33/14	Amauta	52.7986679	6.09640598	bij voordeur huis 30	Tuk	Ov	\N	\N
3573	06-07-2020	2020-07-06 00:00:00	40/728	ootje	06-07-2020	2020-07-06 00:00:00	40/728	HighKing	52.4934616	4.58864689	onder hek hotelparking 	Wijk aan Zee	NH	\N	\N
3996	26-07-2021	2021-07-26 00:00:00	41/134	Sjefman	27-07-2021	2021-07-27 00:00:00	41/135	Hans89	51.5011749	4.32801008	aan railing brug Gareelweg	Bergen op Zoom	NB	\N	\N
1648	25-05-2014	2014-05-25 00:00:00	26/18	BSI	25-05-2014	2014-05-25 00:00:00	26/19	Rainbow600	52.6102333	5.84149408	aan stijl trapleuning - Balgweg	Kampen	Ov	\N	\N
2815	11-07-2018	2018-07-11 00:00:00	39/59	Roeleey	13-07-2018	2018-07-13 00:00:00	39/60	Amauta	52.1920624	5.40881777	in struik Finse Mark	Amersfoort	Ut	\N	\N
2509	07-08-2017	2017-08-07 00:00:00	35/42	pdv_moto	08-08-2017	2017-08-08 00:00:00	35/43	jaap43	51.4096375	4.09041309	tegen hek dijkovergang  Zusterzand	Waarde	Ze	\N	\N
3190	04-08-2019	2019-08-04 00:00:00	40/405	Sjefman	04-08-2019	2019-08-04 00:00:00	40/406	pdv_moto	51.6508293	4.17675018	aan paal natuurgebied Krammersluizen	Bruinisse	Ze	\N	\N
1506	09-02-2014	2014-02-09 00:00:00	24/70	ootje	09-02-2014	2014-02-09 00:00:00	24/72	BigJim	52.5841599	4.68628788	trap voetgangerstunnel - Kapellaan	Limmen	NH	\N	\N
2054	16-01-2016	2016-01-16 00:00:00	30/17	Hans89	18-01-2016	2016-01-18 00:00:00	30/17	-Floris-	51.5547791	3.60100889	aan boom molen Jonge Johannes	Serooskerke	Ze	\N	\N
874	29-07-2012	2012-07-29 00:00:00	16/55	Franko P	29-07-2012	2012-07-29 00:00:00	16/56	MarkieNL	51.280632	5.28084803	achter bankje Postelheideweg	Luyksgestel	NB	\N	\N
559	29-09-2011	2011-09-29 00:00:00	12/40	Shadowski	30-09-2011	2011-09-30 00:00:00	12/41	tdemmer	51.8970222	5.46448278	in bord Waalbandijk/Prins Willemsweg, Echteld, Ge	Echteld	Ge	\N	\N
4144	10-03-2022	2022-03-10 00:00:00	41/231	Deeffox	11-03-2022	2022-03-11 00:00:00	41/231	Phaedrus	51.8046722	4.68927717	bij fietstunneltje Crayensteynstraat	Dordrecht	ZH	\N	\N
2432	21-05-2017	2017-05-21 00:00:00	34/55	BSI	21-05-2017	2017-05-21 00:00:00	34/55	BornToReign	52.02145	5.72357702	achter stam - Renkumseweg	Ede	Ge	\N	\N
1233	04-06-2013	2013-06-04 00:00:00	21/26	rvdh86	04-06-2013	2013-06-04 00:00:00	21/27	BSI	52.225605	5.71644115	onder stronk - Garderense Engweg	Garderen	Ge	\N	\N
1758	04-10-2014	2014-10-04 00:00:00	27/38	bikedan	05-10-2014	2014-10-05 00:00:00	27/38	pdv_moto	51.5066795	4.30899715	in heg Potlodenlaan	Bergen op Zoom	NB	\N	\N
1784	01-11-2014	2014-11-01 00:00:00	27/62	Dirtbag	01-11-2014	2014-11-01 00:00:00	27/62	BSI	52.0819931	6.15318823	op rotonde Arnhemseweg	Brummen	Ge	\N	\N
720	04-03-2012	2012-03-04 00:00:00	14/71	Ronald_010	04-03-2012	2012-03-04 00:00:00	14/72	ndeeka	51.8796959	4.74014091	aan brugpijler Nieuwe Zijdeweg, Oud Alblas, ZH	Oud Alblas	ZH	\N	\N
2176	19-07-2016	2016-07-19 00:00:00	31/50	Coenster	20-07-2016	2016-07-20 00:00:00	31/51	pdv_moto	52.2629929	4.61042786	aan hek Bramersveld	Nieuw-Vennep	NH	\N	\N
3758	27-11-2020	2020-11-27 00:00:00	40/893	Amauta	01-12-2020	2020-12-01 00:00:00	40/894	FastEddy	53.1788635	6.36431217	tegen boompje, parallelweg aan A7	Tolbert	Gr	\N	\N
272	17-03-2011	2011-03-17 00:00:00	8/5	Smuiger	18-03-2011	2011-03-18 00:00:00	8/6	wesleyc	52.5345612	4.95900822	hek fort benoorden Purmerend, Kwadijkerweg, NH	Kwadijkerweg	NH	\N	\N
2478	06-07-2017	2017-07-06 00:00:00	35/08	Amauta	06-07-2017	2017-07-06 00:00:00	35/08	Rik60NL	52.5871315	5.55145884	aan paaltje - Ijsselmeerdijk	Lelystad	Fl	\N	\N
313	07-04-2011	2011-04-07 00:00:00	8/74	Wimis on	07-04-2011	2011-04-07 00:00:00	8/76	Outdoor Man	52.260067	5.37393999	onder staart Orca - Westdijk, Spakenburg, Ge	Spakenburg	Ge	\N	\N
1926	07-06-2015	2015-06-07 00:00:00	28/90	BSI	08-06-2015	2015-06-08 00:00:00	28/90	Vins111	52.0491638	5.80589724	aan hek Hoge Veluwe - Reemsterweg	Otterlo	Ge	\N	\N
3894	02-05-2021	2021-05-02 00:00:00	41/060	Ronald_010	02-05-2021	2021-05-02 00:00:00	41/061	Coenster	52.5787811	5.7587328	in heg bij Vossemeerdijk	Dronten	Fl	\N	\N
2924	08-10-2018	2018-10-08 00:00:00	40/82	Raviel	08-10-2018	2018-10-08 00:00:00	40/83	Bensi	52.1037407	5.95233393	achter monument Woeste Hoeve	Beekbergen	Ge	\N	\N
1586	06-04-2014	2014-04-06 00:00:00	25/58	de peppel	10-04-2014	2014-04-10 00:00:00	25/60	Sjantaalfoutje	52.046032	6.24079084	aan euromast planetarium - Hoogstraat	Toldijk	Ge	\N	\N
2465	23-06-2017	2017-06-23 00:00:00	34/92	Amauta	23-06-2017	2017-06-23 00:00:00	34/92	nappertje	52.0702782	5.54619217	achter boom Kasteel Renswoude	Renswoude	Ge	\N	\N
53	16-09-2010	2010-09-16 00:00:00	2/77	Dirtbag	16-09-2010	2010-09-16 00:00:00	2/78	Ted	52.1866684	6.16061687	ruïne Nijenbeek - Nijenbeekseweg, Voorst, Ge	Voorst	Ge	\N	\N
847		0001-01-01 00:00:00 BC				0001-01-01 00:00:00 BC		Eady	\N	\N				\N	\N
2055	19-01-2016	2016-01-19 00:00:00	30/18	-Floris-	19-01-2016	2016-01-19 00:00:00	30/18	Hans89	51.441288	3.59666395	aan steiger bij Piet Heinkade	Vlissingen	Ze	\N	\N
4199	29-05-2022	2022-05-29 00:00:00	41/268	Amauta	29-05-2022	2022-05-29 00:00:00	41/268	Pydejong	53.2047386	6.57418489	tegen boom bij geheugenbalkon Hereweg	Groningen	Gr	\N	\N
2976	31-12-2018	2018-12-31 00:00:00	40/151	DKP	31-12-2018	2018-12-31 00:00:00	40/152	bikedan	51.3783112	4.31420088	aan hekwerk depot Langeweg	Ossendrecht	NB	\N	\N
2850	08-08-2018	2018-08-08 00:00:00	40/03	Coenster	08-08-2018	2018-08-08 00:00:00	40/04	pdv_moto	52.2599068	4.53775311	tussenboom en hek Spekkelaan	Lisse	ZH	\N	\N
2322	29-12-2016	2016-12-29 00:00:00	33/29	-Floris-	29-12-2016	2016-12-29 00:00:00	33/29	Amauta	51.4757462	3.60455608	aan post Abeelseweg	Oost-Souburg	Ze	\N	\N
2047	28-12-2015	2015-12-28 00:00:00	30/10	wesleyc	28-12-2015	2015-12-28 00:00:00	30/11	Dirk130	52.0384216	4.23797989	bij boom P-terrein de Uithof	Den Haag	ZH	\N	\N
2821	16-07-2018	2018-07-16 00:00:00	39/66	DKP	17-07-2018	2018-07-17 00:00:00	39/67	jaap43	51.374485	4.39370584	in vork van boom Krommeweg	Putte	NB	\N	\N
3221	24-08-2019	2019-08-24 00:00:00	40/437	pdv_moto	28-08-2019	2019-08-28 00:00:00	40/440	Sjefman	51.5487328	3.46053696	aan paal verkeersbord Baaiweg	Domburg	Ze	\N	\N
317		0001-01-01 00:00:00 BC				0001-01-01 00:00:00 BC		ronk	\N	\N				\N	\N
2141	03-06-2016	2016-06-03 00:00:00	31/15	Rainbow600	03-06-2016	2016-06-03 00:00:00	31/16	nappertje	52.1010017	5.64609385	bij geografisch middelpunt Nederlsmd	Lunteren	Ge	\N	\N
378	18-05-2011	2011-05-18 00:00:00	9-86	Richard117	18-05-2011	2011-05-18 00:00:00	9/88	Wimis on	51.8277702	4.99014282	grenspalen - Dalemsedijk, Gorinchem, ZH	Gorinchem	ZH	\N	\N
2568	16-10-2017	2017-10-16 00:00:00	36/32	frankivo	17-10-2017	2017-10-17 00:00:00	36/32	Amauta	53.0641212	6.63792515	aan paaltje fietspad - Munnikakker	Zeegse	Dr	\N	\N
955	19-10-2012	2012-10-19 00:00:00	17/41	Ronald_010	20-10-2012	2012-10-20 00:00:00	17/42	Meifesto	51.8858643	4.45714617	in bosje - van Woudrichemstraat	Rotterdam	ZH	\N	\N
2661	16-03-2018	2018-03-16 00:00:00	37/77	Ronny Rabbelaar	16-03-2018	2018-03-16 00:00:00	37/78	Bassjunky	53.3275223	6.84007502	bij spoorwegovergang Christophotiepad	Appingedam	Gr	\N	\N
3001	01-02-2019	2019-02-01 00:00:00	40/193	Amauta	01-02-2019	2019-02-01 00:00:00	40/194	FastEddy	53.1800423	7.03105879	tegen bankje wandelpad Niesoord	Midwolda	Gr	\N	\N
826	14-06-2012	2012-06-14 00:00:00	15/90	Smuiger	16-06-2012	2012-06-16 00:00:00	15/94	Ronald_010	52.7813644	5.10314894	in boompje - Zuiderdijkweg, Wieringerwerf, NH	Wieringerwerf	NH	\N	\N
278	22-03-2011	2011-03-22 00:00:00	8/14	bakfiets1	22-03-2011	2011-03-22 00:00:00	8/15	Hasseman	52.3044777	6.72428703	achter boom Vaaltweg, Borne, Ov	Borne	Ov	\N	\N
2414	07-05-2017	2017-05-07 00:00:00	34/39	BSI	08-05-2017	2017-05-08 00:00:00	34/39	nappertje	51.9538918	5.87180185	achter plant Gelderse poort	Arnhem	Ge	\N	\N
3684	01-10-2020	2020-10-01 00:00:00	40/835	Hans89	01-10-2020	2020-10-01 00:00:00	40/835	ey-dzeej	51.9317741	4.5214591	in heg bij molen de Ster, Plaszoom	Rotterdam	ZH	\N	\N
4001	12-08-2021	2021-08-12 00:00:00	41/138	Outdoor Man	12-08-2021	2021-08-12 00:00:00	41/139	HighKing	52.3226662	4.86875486	tegen bruggenhoofd Beneluxbaam	Amsterdam	NH	\N	\N
4351	04-06-2023	2023-06-04 00:00:00	41/370	bikedan	05-06-2023	2023-06-05 00:00:00	41/371	Deeffox	51.7935028	4.84274292	tegen E-kast Braspenning/Bandijk	Werkendam	NB	\N	\N
2747	09-05-2018	2018-05-09 00:00:00	38/77	Roeleey	09-05-2018	2018-05-09 00:00:00	38/78	Outdoor Man	52.2924004	5.16637087	aan struik kazemat 	Naarden	NH	\N	\N
942	06-10-2012	2012-10-06 00:00:00	17/21	Ronald_010	06-10-2012	2012-10-06 00:00:00	17/22	Meifesto	51.9643898	4.39265108	achter E-kast - Rotterdamserijweg	Overschie	ZH	\N	\N
3828	09-03-2021	2021-03-09 00:00:00	41/005	Hjerteknuser	09-03-2021	2021-03-09 00:00:00	41/005	DKP	52.5013695	4.73669195	tegen poot infopaneel fort aan de Ham	Uitgeest	NH	\N	\N
1919	22-05-2015	2015-05-22 00:00:00	28/83	Amauta	27-05-2015	2015-05-27 00:00:00	28/84	Kermit de Hond	53.2001381	6.64617777	onder klaver-Aas - de Joker	Groningen	Gr	\N	\N
3804	11-02-2021	2021-02-11 00:00:00	40/933	SadBunny	11-02-2021	2021-02-11 00:00:00	40/934	Outdoor Man	52.3907051	4.87178516	in bosjes Zaanstraat	Amsterdam	NH	\N	\N
1451	25-12-2013	2013-12-25 00:00:00	24/11	tdemmer	28-12-2013	2013-12-28 00:00:00	24/12	Wimis on	51.8979454	6.1822691	aan struik Melkweg	Beek	Ge	\N	\N
2888	01-09-2018	2018-09-01 00:00:00	40/42	BSI	01-09-2018	2018-09-01 00:00:00	40/42	Ronny Rabbelaar	53.0828247	7.07869101	in boom Wedderbergenweg	Wedde	Gr	\N	\N
389	26-05-2011	2011-05-26 00:00:00	10/8	Alexnieuwenhuize	26-05-2011	2011-05-26 00:00:00	10/9	black mule	52.3056679	4.9058938	bij banpaal - Amsteldijk Noord, Amstelveen, NH	Amstelveen	NH	\N	\N
3503	20-05-2020	2020-05-20 00:00:00	40/668	Coenster	20-05-2020	2020-05-20 00:00:00	40/668	Outdoor Man	52.1406212	5.11515617	tegen toeganfsbord Gagelbos, kooidijk	Utrecht	Ut	\N	\N
3977	11-07-2021	2021-07-11 00:00:00	41/121	Springbok	12-07-2021	2021-07-12 00:00:00	41/122	Brnk	51.9276466	5.62858391	tegen grijs paaltje bij Smschtkamp	Opheusden	Ge	\N	\N
3276	20-10-2019	2019-10-20 00:00:00	40/485	ey-dzeej	21-10-2019	2019-10-21 00:00:00	40/486	Hans89	52.0304337	4.34708309	achter E-huisje Zuiderweg	Rijswijk	ZH	\N	\N
3853	31-03-2021	2021-03-31 00:00:00	41/024	pdv_moto	31-03-2021	2021-03-31 00:00:00	41/025	Coenster	52.0790482	4.24608994	achter hekje Laan van Poot	Den Haag	ZH	\N	\N
817	06-06-2012	2012-06-06 00:00:00	15/79	Outdoor Man	06-06-2012	2012-06-06 00:00:00	15/80	Scoot_020/Scoot_2	52.3263435	4.84769297	Dachaumonument - Bosbaan, Amstelveen, NH	Amstelveen	NH	\N	\N
4128	19-02-2022	2022-02-19 00:00:00	41/221	Outdoor Man	20-02-2022	2022-02-20 00:00:00	41/222	SadBunny	52.4343681	5.42632389	tegen stam P-plaats A6	Lelystad	Fl	\N	\N
606	29-10-2011	2011-10-29 00:00:00	13/10	MotorMieke	29-10-2011	2011-10-29 00:00:00	13/11	Shadowski	52.0944939	5.64274502	aan paaltje P-terrein Uilenbos, Lunteren, Ge	Lunteren	Ge	\N	\N
623		0001-01-01 00:00:00 BC		MarkieNL		0001-01-01 00:00:00 BC			\N	\N				\N	\N
468	19-07-2011	2011-07-19 00:00:00	11/12	Ronald_010	20-07-2011	2011-07-20 00:00:00	11/14	tdemmer	51.9305458	4.84121323	struik bij parkeerplaats Ooievaarsdorp, Liesveld, ZH	Liesveld	ZH	\N	\N
2022	06-10-2015	2015-10-06 00:00:00	29/77	pdv_moto	08-10-2015	2015-10-08 00:00:00	29/78	Dirk130	52.0980339	4.29428387	achter E-kast Prof. Ver_Huellweg	Den Haag	ZH	\N	\N
866	22-07-2012	2012-07-22 00:00:00	16/50	frankwijers	23-07-2012	2012-07-23 00:00:00	16/51	Franko P	51.6081161	5.3203249	Groene poort - Bosscheweg	Boxtel	NB	\N	\N
1268	06-07-2013	2013-07-06 00:00:00	21/69	Bensi	06-07-2013	2013-07-06 00:00:00	21/69	Smurfke RF	52.3408928	5.94939899	op autoband - P-terrein Zoo Wissel	Epe	Ge	\N	\N
2363	25-03-2017	2017-03-25 00:00:00	33/85	PatrickSoler	26-03-2017	2017-03-26 00:00:00	33/85	SadBunny	52.1609077	4.55986595	bij infocentrum A4-HSL	Leiderdorp	ZH	\N	\N
2639	16-02-2018	2018-02-16 00:00:00	37/43	Amauta	17-02-2018	2018-02-17 00:00:00	37/44	FastEddy	52.872776	5.36534119	in struik op strekdam jachthaven Marina	Stavoren	Fr	\N	\N
4178	01-05-2022	2022-05-01 00:00:00	41/254	rvdh86	01-05-2022	2022-05-01 00:00:00	41/254	BSI	52.2394981	5.72290087	tegen berkendrieling, Solseweg	Garderen	Ge	\N	\N
54	17-09-2010	2010-09-17 00:00:00	2/80	Ted	18-09-2010	2010-09-18 00:00:00		MIA	50.7581711	5.68348312	Meethuisje bij Schansweg, Eijsden, Li	Eijsden	Li	\N	\N
760	01-04-2012	2012-04-01 00:00:00	15/15	Ronald_010	01-04-2012	2012-04-01 00:00:00	15/15	Bomba	51.8367653	4.5162549	aan brug bij ingang fietstunnel, Barendrecht, ZH	Barendrecht	ZH	\N	\N
1178	21-04-2013	2013-04-21 00:00:00	20/42	Mr.Bean	22-04-2013	2013-04-22 00:00:00	20/43	sirdrinksalotofpetrol	52.0027771	6.36401701	aan hek bij camping - Pluimersdijk	Zelhem	Ge	\N	\N
3650	31-08-2020	2020-08-31 00:00:00	40/808	Ronny Rabbelaar	01-09-2020	2020-09-01 00:00:00	40/808	Amauta	53.1364517	6.74470806	tegen kastjes Wolfsbargerweg	Kropswolde	Gr	\N	\N
4053	25-10-2021	2021-10-25 00:00:00	41/169	Carburateur	27-10-2021	2021-10-27 00:00:00	41/170	Sjefman	50.8953094	5.8423419	tegen boom Bosscheweg	Hulsberg	Li	\N	\N
2117	07-05-2016	2016-05-07 00:00:00	30/87	Hans89	08-05-2016	2016-05-08 00:00:00	30/87	Meifesto	51.912159	4.56808519	bij bootje - Aert van Nesstraat	Capelle aan den Ijssel	ZH	\N	\N
689	20-01-2012	2012-01-20 00:00:00	14/19	madmarv	20-01-2012	2012-01-20 00:00:00	14/21	Delcasa	52.0704041	5.17887783	aan boomstronk Rhijnauwenselaan 16, Bunnik, Ut	Bunnik	Ut	\N	\N
810	26-05-2012	2012-05-26 00:00:00	15/68	Bigtwim	27-05-2012	2012-05-27 00:00:00	15/69	bikedan	51.6384621	5.34997177	aan hek - P Dondersplein, St. Michielsgestel, NB	St.Michielsgestel	NB	\N	\N
2740	06-05-2018	2018-05-06 00:00:00	38/71	Outdoor Man	06-05-2018	2018-05-06 00:00:00	38/72	Rik60NL	52.3119659	4.90018511	aan hek boezem Middelpolder	Amstelveen	NH	\N	\N
710	21-02-2012	2012-02-21 00:00:00	14/57	blub blub	21-02-2012	2012-02-21 00:00:00	14/58	Shadowski	52.0111427	6.03655195	onder struik kantoor Pinkelseweg, Rheden, Ge	Rheden	Ge	\N	\N
258	06-03-2011	2011-03-06 00:00:00	7/73	tdemmer	07-03-2011	2011-03-07 00:00:00	7/74	jaap43	51.9047852	4.57558012	achter fietsstalling Fast Ferry, Krimpen/IJssel, ZH	Krimpen aan den IJssel	ZH	\N	\N
3714	22-10-2020	2020-10-22 00:00:00	40/857	ootje	23-10-2020	2020-10-23 00:00:00	40/858	pdv_moto	52.5740967	4.65528488	tegen toegangshek Duinreservaat	Castricum	NH	\N	\N
2733	02-05-2018	2018-05-02 00:00:00	38/64	HighKing	02-05-2018	2018-05-02 00:00:00	38/65	Rik60NL	52.0734291	5.05589104	aan paal Strijkviertelplas	Utrecht	Ut	\N	\N
1025	15-12-2012	2012-12-15 00:00:00	18/29	Corney28	15-12-2012	2012-12-15 00:00:00	18/30	Ronald_010	52.2020607	4.90504122	aan brug voetpad 06 20 - Ringdijk	Wilnis	Ut	\N	\N
4027	12-09-2021	2021-09-12 00:00:00	41/153	BSI	12-09-2021	2021-09-12 00:00:00	41/153	BornToReign	52.1565247	5.96916294	tegen zijkant monument 1940-1945	Beekbergen	Ge	\N	\N
1128	21-03-2013	2013-03-21 00:00:00	19/69	Corney28	21-03-2013	2013-03-21 00:00:00	19/70	V-Strommert	52.1999321	4.87385798	aan infobord RK-kerk	Wilnis	Ut	\N	\N
3562	29-06-2020	2020-06-29 00:00:00	40/719	Picobello BV	29-06-2020	2020-06-29 00:00:00	40/719	BBen	51.9665833	4.45424318	achter damwand Landscheiding	Rotterdam	ZH	\N	\N
3815	26-02-2021	2021-02-26 00:00:00	40/942	Ronny Rabbelaar	27-02-2021	2021-02-27 00:00:00	40/942	Amauta	53.3990746	6.45258904	achter paal P-terrein zeehondencentrum	Pieterburen	Gr	\N	\N
2073	26-02-2016	2016-02-26 00:00:00	30/33	Amauta	27-02-2016	2016-02-27 00:00:00	30/34	Janhertog	52.5163765	6.08301306	aan trap Katerdijk	Zwolle	Ov	\N	\N
1617	02-05-2014	2014-05-02 00:00:00	25/89	Artemecion	02-05-2014	2014-05-02 00:00:00	25/90	Bigtwim	52.5225182	5.06541586	in melkbuis aan de Zeevangsedijk	Edam	NH	\N	\N
3738	08-11-2020	2020-11-08 00:00:00	40/876	pdv_moto	08-11-2020	2020-11-08 00:00:00	40/876	Yosra87	52.0929527	4.27573013	in gevelbegroeing E-huis, Statenlaan	Den Haag	ZH	\N	\N
1411	07-11-2013	2013-11-07 00:00:00	23/66	BSI	09-11-2013	2013-11-09 00:00:00	23/68	Wimis on	52.1562653	5.38075113	aan hek P-terrein Smallepad	Amersfoort	Ut	\N	\N
3347	12-01-2020	2020-01-12 00:00:00	40/544	Sjefman	12-01-2020	2020-01-12 00:00:00	40/545	pdv_moto	51.5614357	4.28755188	aan hek de Linie	Steenbergen	NB	\N	\N
2635	11-02-2018	2018-02-11 00:00:00	37/36	Ronny Rabbelaar	12-02-2018	2018-02-12 00:00:00	37/37	FastEddy	53.2754059	6.84048319	in bloempot Damsterweg	Steendam	Gr	\N	\N
1206	09-05-2013	2013-05-09 00:00:00	20/77	bikedan	10-05-2013	2013-05-10 00:00:00	20/78	Meangreengirl/MeanBlueMan	51.4901161	3.94853592	achter E-kast - Goesestraatweg	Kapelle	Ze	\N	\N
344	24-04-2011	2011-04-24 00:00:00	9/26	Wimis on	24-04-2011	2011-04-24 00:00:00	9/26	mr Q	52.0319633	5.12282085	toegangshek van kasteel Heemstede, Houten, Ut	Houten	Ut	\N	\N
3361	23-01-2020	2020-01-23 00:00:00	40/552	pdv_moto	24-01-2020	2020-01-24 00:00:00	40/553	Deeffox	51.4049034	5.44850683	onder vangrail viaduct A2	Eindhoven	NB	\N	\N
1476	14-01-2014	2014-01-14 00:00:00	24/37	Blogem	14-01-2014	2014-01-14 00:00:00	24/37	Sjakie-77	52.4831734	4.73421097	aan hek - Communicatieweg-W	Assendelft	NH	\N	\N
2947	16-11-2018	2018-11-16 00:00:00	40/109	Roeleey	17-11-2018	2018-11-17 00:00:00	40/109	pdv_moto	52.3436966	5.01301622	bij eieren Diemer Zeedijk	Diemen	NH	\N	\N
753	26-03-2012	2012-03-26 00:00:00	15/06	tdemmer	26-03-2012	2012-03-26 00:00:00	15/06	BSI	51.9741135	5.41117191	aan steiger bij vistrap Eiland van, Maurik, Ge	Maurik	Ge	\N	\N
1129	22-03-2013	2013-03-22 00:00:00	19/71	V-Strommert	22-03-2013	2013-03-22 00:00:00	19/71	BSI	52.4567299	5.53005695	in wielkast F-50 - Aviodrome	Lelystad	Fl	\N	\N
2252	26-09-2016	2016-09-26 00:00:00	32/31	ArendJan	26-09-2016	2016-09-26 00:00:00	32/32	Coenster	51.9173126	4.25078678	tegen betonen schutting - Deltaweg	Maassluis	ZH	\N	\N
1147	01-04-2013	2013-04-01 00:00:00	19/95	SadBunny	01-04-2013	2013-04-01 00:00:00	19/95	V-Strommert	52.1088867	4.47537184	aan hek bij brug - Westeinde	Leidschendam	ZH	\N	\N
2463	21-06-2017	2017-06-21 00:00:00	34/91	Totl	21-06-2017	2017-06-21 00:00:00	34/91	frankivo	53.0055809	6.36946201	achter wegwijspaal	Fochteloërveen	Fr	\N	\N
2377	08-04-2017	2017-04-08 00:00:00	33/102	Janhertog	09-04-2017	2017-04-09 00:00:00	33/103	MP_NL	52.7806473	6.13797379	onder steen kunstwerk - Scahnsweg	Steenwijk	Ov	\N	\N
1993	16-08-2015	2015-08-16 00:00:00	29/45	Coenster	17-08-2015	2015-08-17 00:00:00	29/47	Rik60NL	52.2668419	4.61671019	in heg Componistenweg	Nieuw-Vennep	NH	\N	\N
3477	26-04-2020	2020-04-26 00:00:00	40/648	Amauta	26-04-2020	2020-04-26 00:00:00	40/648	Ronald_010	53.1750488	6.46848392	in hoek kerkhof Sandebuur	Roderwolde	Dr	\N	\N
4417	17-10-2023	2023-10-17 00:00:00	41/411	Outdoor Man	18-10-2023	2023-10-18 00:00:00	41/412	BSI	52.3178749	4.87507296	in boomstoel E.M. Meyerslaan	Amstelveen	NH	\N	\N
2920	30-09-2018	2018-09-30 00:00:00	40/78	Ronny Rabbelaar	01-10-2018	2018-10-01 00:00:00	40/78	Amauta	53.2877502	6.78528404	achter E-kast Hoekmeersterweg	Garrelsweer	Gr	\N	\N
1415	10-11-2013	2013-11-10 00:00:00	23/70	V-Strommert	13-11-2013	2013-11-13 00:00:00	23/71	vuurbloed	52.3016663	4.64774179	achter E-huis P-terrein IJweg	Hoofddorp	NH	\N	\N
1812	23-12-2014	2014-12-23 00:00:00	27/87	Ronald_010	24-12-2014	2014-12-24 00:00:00	27/88	bikedan	52.0194054	4.62539005	bij windmolen - Nijverheidsweg	Waddinxveen	ZH	\N	\N
981	07-11-2012	2012-11-07 00:00:00	17/74	Bigtwim	08-11-2012	2012-11-08 00:00:00	17/76	BigJim	52.4609871	4.61203909	in struik Evertsenstraat	IJmuiden	NH	\N	\N
2500	30-07-2017	2017-07-30 00:00:00	35/32	BSI	31-07-2017	2017-07-31 00:00:00	35/32	Capo-04/06	51.1318321	5.84271002	in struik achter bank - Maaspoort	Stevensweert	Li	\N	\N
1520	18-02-2014	2014-02-18 00:00:00	24/88	BigJim	18-02-2014	2014-02-18 00:00:00	24/89	bobcat	52.5127411	4.62994289	onder stam P-terrein - Achterweg	Heemskerk	NH	\N	\N
1141	27-03-2013	2013-03-27 00:00:00	19/85	Geert-26	27-03-2013	2013-03-27 00:00:00	19/86	Bomba	52.0696335	4.74530506	aan bord P-terrein - Europaweg	Bodegraven	ZH	\N	\N
641	26-11-2011	2011-11-26 00:00:00	13/56	Ronald_010	27-11-2011	2011-11-27 00:00:00	13/56	Dirk130	52.0883751	4.43309879	bij bankje Stompwijkseweg, Leidschendam, ZH	Leidschendam	ZH	\N	\N
4247	30-09-2022	2022-09-30 00:00:00	41/300	BSI	01-10-2022	2022-10-01 00:00:00	41/301	Outdoor Man	52.2322655	5.70112419	aan plaatsnaambord Roeëkamperweg	Garderen	Ge	\N	\N
1647	23-05-2014	2014-05-23 00:00:00	26/17	pinpoint	25-05-2014	2014-05-25 00:00:00	26/18	BSI	52.844223	6.66551208	in struik - Holsdiek	Orvelte	Dr	\N	\N
2576	29-10-2017	2017-10-29 00:00:00	36/43	HighKing	31-10-2017	2017-10-31 00:00:00	36/44	Hjerteknuser	52.4904976	4.68776989	achter pot Christiaan Sepplaan	Beverwijk	NH	\N	\N
2271	11-10-2016	2016-10-11 00:00:00	32/59	Bomba	11-10-2016	2016-10-11 00:00:00	32/60	PatrickSoler	52.0652199	4.38664579	bij geluidswal de Moezel	Den Haag	ZH	\N	\N
1103	03-03-2013	2013-03-03 00:00:00	19/34	Ronald_010	03-03-2013	2013-03-03 00:00:00	19/35	Corney28	51.6902504	5.22651386	aan brug Halve Zolenlijntje	Vlijmen	NB	\N	\N
172	19-12-2010	2010-12-19 00:00:00	5/50	rogerno1	19-12-2010	2010-12-19 00:00:00	5/51	toetje87	52.2951584	5.15647411	tunneltje Bastion Nieuwe Molen, Naarden, NH	Naarden	NH	\N	\N
4231	09-08-2022	2022-08-09 00:00:00	41/289	Ronny Rabbelaar	11-08-2022	2022-08-11 00:00:00	41/290	Outdoor Man	52.8349953	4.81043577	tegen landhoofd "oude sluis"	Anna Paulowna	NH	\N	\N
3369	01-02-2020	2020-02-01 00:00:00	40/558	BSI	01-02-2020	2020-02-01 00:00:00	40/558	Okami_Xci	51.9864082	5.86402607	tegen boom bij waterval Mariëndaal	Oosterbeek	Ge	\N	\N
3116	13-05-2019	2019-05-13 00:00:00	40/324	FastEddy	14-05-2019	2019-05-14 00:00:00	40/325	Amauta	52.8731117	7.11356688	onder brug de Bruilweg/Grens	Ter Apel	Gr	\N	\N
2161	25-06-2016	2016-06-25 00:00:00	31/34	Bensi	26-06-2016	2016-06-26 00:00:00	31/34	Amauta	52.1814728	6.13532114	aan boom bij bankje Appenseweg	Voorst	Ge	\N	\N
2804	01-07-2018	2018-07-01 00:00:00	39/44	Roeleey	01-07-2018	2018-07-01 00:00:00	39/44	Amauta	53.2204857	5.47665501	tegen houtwal vaast hek Liaukemastate	Sexbierum	Fr	\N	\N
3418	19-03-2020	2020-03-19 00:00:00	40/597	Artemecion	19-03-2020	2020-03-19 00:00:00	40/597	HighKing	52.5262451	4.72302818	achter bord kano-opstapplaats	Uitdam	NH	\N	\N
1084		0001-01-01 00:00:00 BC		Miss2		0001-01-01 00:00:00 BC			\N	\N				\N	\N
3660	12-09-2020	2020-09-12 00:00:00	40/817	SadBunny	12-09-2020	2020-09-12 00:00:00	40/817	Hans89	52.0403671	4.32833481	in struiken bij De Loods, Treubstraat	Rijswijk	ZH	\N	\N
4245	23-09-2022	2022-09-23 00:00:00	41/299	BSI	28-09-2022	2022-09-28 00:00:00	41/300	k0en	52.1012077	5.17875814	aan 10 km-bord Kloosterlaan	De Bilt	Ut	\N	\N
521	01-09-2011	2011-09-01 00:00:00	11/81	Jethro	01-09-2011	2011-09-01 00:00:00	11/83	Wolvin	52.5387459	5.69587994	aan hek - Guldenweg bij spoorviaduct, Dronten, Fl	Dronten	Fl	\N	\N
1142	28-03-2013	2013-03-28 00:00:00	19/87	Bomba	28-03-2013	2013-03-28 00:00:00	19/87	Meifesto	52.0325165	4.87094688	in beeld dood paard - Kabelslag	Oudewater	Ut	\N	\N
2053	14-01-2016	2016-01-14 00:00:00	30/16	Dirk130	16-01-2016	2016-01-16 00:00:00	30/17	Hans89	51.8289146	4.00764179	in boom Havendijk	Goedereede	ZH	\N	\N
2915	26-09-2018	2018-09-26 00:00:00	40/69	Outdoor Man	26-09-2018	2018-09-26 00:00:00	40/68	SadBunny	52.5219231	5.42530107	in de Ijzeren Reus (Exposure) Strekdam	Lelystad	Fl	\N	\N
2140	02-06-2016	2016-06-02 00:00:00	31/14	Amauta	03-06-2016	2016-06-03 00:00:00	31/15	Rainbow600	52.2432709	5.63413	bij zwaartepunt Nederland	Putten	Ge	\N	\N
1370	27-09-2013	2013-09-27 00:00:00	23/04	Meangreengirl/MeanBlueMan	28-09-2013	2013-09-28 00:00:00	23/09	bikedan	51.3048286	4.14577579	aan bord - Arenbergstraat	Nieuw-Namen	Ze	\N	\N
2965	25-12-2018	2018-12-25 00:00:00	40/139	SadBunny	25-12-2018	2018-12-25 00:00:00	40/139	pdv_moto	52.6975899	5.20441103	tegen fietsenhok Azalealaan	Lutjebroek	NH	\N	\N
3055	27-03-2019	2019-03-27 00:00:00	40/253	ey-dzeej	27-03-2019	2019-03-27 00:00:00	40/254	ArendJan	51.9861832	4.63021994	aan voet laagste punt Nederland	Nieuwerkerk a/d IJssel	ZH	\N	\N
3802	06-02-2021	2021-02-06 00:00:00	40/932	Hjerteknuser	09-02-2021	2021-02-09 00:00:00	40/932	Outdoor Man	52.5938377	4.68297005	tegen hek P-terrein Sportvereniging	Heilo	NH	\N	\N
4419	21-10-2023	2023-10-21 00:00:00	41/412	Outdoor Man	24-10-2023	2023-10-24 00:00:00	41/413	tdemmer	51.9705582	4.97995996	tegen hek Bombermonument	Jaarsveld	Ut	\N	\N
1257	29-06-2013	2013-06-29 00:00:00	21/55	Phaedrus	29-06-2013	2013-06-29 00:00:00	21/55	Bensi	52.2388382	6.23347807	aan trap Oxersteeg	Deventer	Ov	\N	\N
3969	07-07-2021	2021-07-07 00:00:00	41/117	ootje	07-07-2021	2021-07-07 00:00:00	41/117	BigJim	52.5819931	4.66948891	tegen stuwtje in sloot langs Zanddijk	Castricum	NH	\N	\N
3777	25-12-2020	2020-12-25 00:00:00	40/911	pdv_moto	26-12-2020	2020-12-26 00:00:00	40/911	Hans89	51.9675522	4.14764309	onder anker overgang Slachthuisweg	Hoek van Holland	ZH	\N	\N
2985	05-01-2019	2019-01-05 00:00:00	40/164	Amauta	08-01-2019	2019-01-08 00:00:00	40/166	FastEddy	53.3214111	6.18184805	aan boom P-terrein Slikweg	Kollummerpomp	Fr	\N	\N
1402	27-10-2013	2013-10-27 00:00:00	23/55	jaap43	27-10-2013	2013-10-27 00:00:00	23/55	SadBunny	51.9535446	4.86647081	aan hek bij wilg - Lopikkerweg	Schoonhoven	ZH	\N	\N
1004	23-11-2012	2012-11-23 00:00:00	18/09	Bigtwim	23-11-2012	2012-11-23 00:00:00	18/09	Sjakie-77	52.5294991	4.7112999	achter bankje kerk	Uitgeest	NH	\N	\N
3110	09-05-2019	2019-05-09 00:00:00	40/316	DUCKI3S	10-05-2019	2019-05-10 00:00:00	40/318	BSI	52.1801682	6.83090115	in heg bij Skicentrum Moser	Enschede	Ov	\N	\N
1746	21-09-2014	2014-09-21 00:00:00	27/28	Djoost	21-09-2014	2014-09-21 00:00:00	27/28	BSI	52.4123383	4.86103678	onder object - Petroleumhavenweg	Amsterdam	NH	\N	\N
1566	24-03-2014	2014-03-24 00:00:00	25/39	BSI	24-03-2014	2014-03-24 00:00:00	25/39	Dirtbag	52.3190994	5.86511421	aan boom Vierhoutenseweg	Gortel	Ge	\N	\N
4105	31-01-2022	2022-01-31 00:00:00	41/207	BSI	01-02-2022	2022-02-01 00:00:00	41/207	Roeleey	52.1107979	5.99688816	tegen wildscherm Groenendaalseweg	Loenen	Ge	\N	\N
1400	26-10-2013	2013-10-26 00:00:00	23/54	BSI	26-10-2013	2013-10-26 00:00:00	23/54	Ronald_010	52.1419678	5.58904982	achter borstbeeld - Stationsweg	Barneveld	Ge	\N	\N
2115	06-05-2016	2016-05-06 00:00:00	30/85	jaap43	07-05-2016	2016-05-07 00:00:00	30/86	bikedan	52.0596046	4.55676413	aan kastanjeboom P-plaats N209	Bleiswijk	ZH	\N	\N
2674	25-03-2018	2018-03-25 00:00:00	37/91	Okami_Xci	25-03-2018	2018-03-25 00:00:00	37/92	BSI	52.0676765	5.35682201	in heg naast bord, De Hoogt	Maarn	Ut	\N	\N
1561	16-03-2014	2014-03-16 00:00:00	25/29	Scoot_020/Scoot_2	17-03-2014	2014-03-17 00:00:00	25/29	Corney28	52.3859482	4.73098707	in struik Zwanenburgerdijk	Halfweg	ZH	\N	\N
195	15-01-2011	2011-01-15 00:00:00	6/10	Scoot_020/Scoot_2	16-01-2011	2011-01-16 00:00:00	6/13	Straycat	52.3323746	4.83209085	bankje Jaagpad 160/Riekerweg, Amsterdam, NH	Amsterdam	NH	\N	\N
1173	17-04-2013	2013-04-17 00:00:00	20/36	Bigtwim	18-04-2013	2013-04-18 00:00:00	20/38	vuurbloed	52.4819183	4.65933514	in heg St. Agathakerk	Beverwijk	NH	\N	\N
3929	11-06-2021	2021-06-11 00:00:00	41/089	FastEddy	11-06-2021	2021-06-11 00:00:00	41/090	HermanK	52.8479004	5.52393198	tegen boom achter Luchtwachttoren 6H3	Oude Mirdum	Fr	\N	\N
1941	20-06-2015	2015-06-20 00:00:00	29/04	Ronald_010	20-06-2015	2015-06-20 00:00:00	29/04	Rik60NL	52.2034187	4.81524181	aan hek de Hoef O-zijde	de Hoef	Ut	\N	\N
2532	29-08-2017	2017-08-29 00:00:00	35/75	Rik60NL	31-08-2017	2017-08-31 00:00:00	35/77	Scoot_020/Scoot_2	52.1958733	4.90552807	tegen muurtje Kon. Julianastraat	Wilnis	Ut	\N	\N
3668	17-09-2020	2020-09-17 00:00:00	40/821	BSI	17-09-2020	2020-09-17 00:00:00	40/822	wachtbalkje	52.3046036	5.69166088	achter spandoek The Links Valley	Ermelo	Ge	\N	\N
244	21-02-2011	2011-02-21 00:00:00	7/36	Richard117	21-02-2011	2011-02-21 00:00:00	7/38	wesleyc	51.821106	5.02966785	parkeerterrein Waaldijk bij Fort Vuren, Vuren, Ge	Vuren	Ge	\N	\N
369	13-05-2011	2011-05-13 00:00:00	9/70	BSI	13-05-2011	2011-05-13 00:00:00	9/71	Wimis on	52.1896324	6.05139112	grenssteen hoek De Kar/Leigraaf, Apeldoorn, Ge	Apeldoorn	Ge	\N	\N
608	30-10-2011	2011-10-30 00:00:00	13/16	king-roy	31-10-2011	2011-10-31 00:00:00	13/17	Big Sexy	51.3140373	5.78871107	bij E-huisje Reutskamerdijk/Casseweg, Ospel, NB	Ospel	NB	\N	\N
3162	06-07-2019	2019-07-06 00:00:00	40/377	Raviel	07-07-2019	2019-07-07 00:00:00	40/378	BSI	51.879303	6.0489912	onder struik Lobberdenseweg	Pannerden	Ge	\N	\N
1685	16-07-2014	2014-07-16 00:00:00	26/64	Chakotay	17-07-2014	2014-07-17 00:00:00	26/65	Sjantaalfoutje	52.158886	5.42514992	aan paal fietspad Kopermolenpad	Amersfoort	Ut	\N	\N
4205	04-06-2022	2022-06-04 00:00:00	41/272	rvdh86	05-06-2022	2022-06-05 00:00:00	41/272	FastEddy	52.0452042	5.90150785	o hoek P-terrein landgoed Vrijland	Arnhem	Ge	\N	\N
2767	27-05-2018	2018-05-27 00:00:00	38/99	HermanK	28-05-2018	2018-05-28 00:00:00	39/01	MeanYellowBoy	52.4146729	5.78762817	aan paal monument Drostenweg	Doornspijk	Ge	\N	\N
1894	29-04-2015	2015-04-29 00:00:00	28/64	Artemecion	29-04-2015	2015-04-29 00:00:00	28/64	Bigtwim	52.5294075	4.73491287	aan knotwilg Zwaansmeer	Uitgeest	NH	\N	\N
2444	31-05-2017	2017-05-31 00:00:00	34/65	Rik60NL	01-06-2017	2017-06-01 00:00:00	34/66	Corney28	52.1873016	4.833251	aan hek naar weiland - Kade	Zevenhoven	ZH	\N	\N
1482	18-01-2014	2014-01-18 00:00:00	24/43	BSI	18-01-2014	2014-01-18 00:00:00	24/44	Sjantaalfoutje	52.1922455	5.60187578	onder afdak - Overhorsterweg	Voorthuizen	Ge	\N	\N
2935	25-10-2018	2018-10-25 00:00:00	40/94	HermanK	26-10-2018	2018-10-26 00:00:00	40/94	BornToReign	52.6113968	6.34041595	aan slootkant Westenhuizingerweg	Balkbrug	Ov	\N	\N
2174	17-07-2016	2016-07-17 00:00:00	31/48	BornToReign	18-07-2016	2016-07-18 00:00:00	31/48	Bensi	52.2190666	5.87271214	aan bankje bij Kapel	Hoog Soeren	Ge	\N	\N
2267	08-10-2016	2016-10-08 00:00:00	32/55	Ronald_010	09-10-2016	2016-10-09 00:00:00	32/55	SadBunny	51.8609009	4.47168493	in wilgstruik - Rhonnsebaan	Rhoon	ZH	\N	\N
3249	25-09-2019	2019-09-25 00:00:00	40/465	Coenster	26-09-2019	2019-09-26 00:00:00	40/466	Outdoor Man	52.2591171	4.63015509	onder dissel bouwkeet Zuiderdreef	Nieuw-Vennep	NH	\N	\N
1924	05-06-2015	2015-06-05 00:00:00	28/88	Amauta	05-06-2015	2015-06-05 00:00:00	28/89	Rainbow600	52.4158707	5.29816723	aan hek afvalplaats Oostvaarders	Almere	Fl	\N	\N
3928	08-06-2021	2021-06-08 00:00:00	41/088	Amauta	11-06-2021	2021-06-11 00:00:00	41/089	FastEddy	53.2704086	6.60302591	in hoek P-terrein Krimptermolen	Zuidwolde	Gr	\N	\N
4127	18-02-2022	2022-02-18 00:00:00	41/221	Roeleey	18-02-2022	2022-02-18 00:00:00	41/221	Outdoor Man	52.3055153	4.80957699	in struik bij ophaalbrug	Aalsmeer	NH	\N	\N
582	14-10-2011	2011-10-14 00:00:00	12/72	wesleyc	14-10-2011	2011-10-14 00:00:00	12/74	Dennisik	51.9527359	4.29159307	onder brug Kwakelweg, Maassluis, ZH	Maassluis	ZH	\N	\N
1929	10-06-2015	2015-06-10 00:00:00	28/93	Corney28	10-06-2015	2015-06-10 00:00:00	28/94	coffeejunk	52.1785431	4.85735893	aan bak recreatieterrein de Snoek	Wilnis	Ut	\N	\N
1446	17-12-2013	2013-12-17 00:00:00	24/06	Corney28	19-12-2013	2013-12-19 00:00:00	24/07	Hans89	52.3693504	4.70107508	aan stuw bij Schipholweg	Vijfhuizen	NH	\N	\N
2123	11-05-2016	2016-05-11 00:00:00	30/91	Roeleey	11-05-2016	2016-05-11 00:00:00	30/92	Artemecion	52.2887497	4.85308218	in heg de Meerkamp	Amstelveen	NH	\N	\N
2249	23-09-2016	2016-09-23 00:00:00	32/27	BornToReign	23-09-2016	2016-09-23 00:00:00	32/28	SadBunny	51.9622231	5.80805588	onder loopbrug bij stuw	Driel	Ge	\N	\N
2738	05-05-2018	2018-05-05 00:00:00	38/69	FastEddy	05-05-2018	2018-05-05 00:00:00	38/70	Okami_Xci	52.3796272	6.96974421	onder boom Schiphorstdijk	Rossum	Ov	\N	\N
4207	12-06-2022	2022-06-12 00:00:00	41/273	Pydejong	15-06-2022	2022-06-15 00:00:00	41/274	Amauta	53.2566032	6.14490223	tegen boompje bij station	Buitenpost	Fr	\N	\N
4171	24-04-2022	2022-04-24 00:00:00	41/251	FastEddy	25-04-2022	2022-04-25 00:00:00	41/251	Amauta	52.981926	6.97078323	tegen hek E-kast P-terrein Nautilusweg	Stadskanaal	Gr	\N	\N
2039	27-11-2015	2015-11-27 00:00:00	29/98	Bigtwim	02-12-2015	2015-12-02 00:00:00	29/100	ootje	52.4851723	4.67094898	bij paaltje St. Aagtendijk	Beverwijk	NH	\N	\N
1470	10-01-2014	2014-01-10 00:00:00	24/31	Roeleey	11-01-2014	2014-01-11 00:00:00	24/32	BSI	52.4022446	4.90474176	aan paal Metaalbewerkersstraat	Amsterdam	NH	\N	\N
2649	04-03-2018	2018-03-04 00:00:00	37/60	Bosso	05-03-2018	2018-03-05 00:00:00	37/61	pdv_moto	51.4526749	3.81949401	in struik Oudekamerseweg	Bosele	Ze	\N	\N
2445	02-06-2017	2017-06-02 00:00:00	34/68	Corney28	02-06-2017	2017-06-02 00:00:00	34/68	Rik60NL	52.1699486	4.98933077	in struikje Kortrijkse molen	Breukelen	Ut	\N	\N
1413	09-11-2013	2013-11-09 00:00:00	23/69	dolfijneflipper	10-11-2013	2013-11-10 00:00:00	23/69	jaap43	52.1151695	4.58644915	aan paal fietsrek - Gemeneweg	Hazerswoude	ZH	\N	\N
4037	25-09-2021	2021-09-25 00:00:00	41/159	Janhertog	25-09-2021	2021-09-25 00:00:00	41/159	Amauta	53.1811523	6.3718338	tegen boom bij Motoport Leek	Tolbert	Gr	\N	\N
269	15-03-2011	2011-03-15 00:00:00	7/99	lynx84	15-03-2011	2011-03-15 00:00:00	7/100	Richard117	51.8255806	4.66659307	in bosje - Noordpark, Zwijndrecht, ZH	Zwijndrecht	ZH	\N	\N
1822	06-01-2015	2015-01-06 00:00:00	27/95	Bas600	06-01-2015	2015-01-06 00:00:00	27/95	Rainbow600	51.9750404	5.09802914	onder struik - Laanakkerweg	Vianen	Ut	\N	\N
2513	11-08-2017	2017-08-11 00:00:00	35/47	bikedan	12-08-2017	2017-08-12 00:00:00	35/48	pdv_moto	51.393589	4.33009386	bij kanon - Zr. Marie Adolphstraat	Ossendrecht	NB	\N	\N
23	28-08-2010	2010-08-28 00:00:00	1/73	josefientje123	28-08-2010	2010-08-28 00:00:00	1/74	Jeroen P	52.3833542	4.58919477	Visserspad, Overveen, NH	Overveen	NH	\N	\N
2403	28-04-2017	2017-04-28 00:00:00	34/28	bikedan	28-04-2017	2017-04-28 00:00:00	34/29	pdv_moto	51.4255867	4.34136009	achter E-huis - Jac Jansenweg	Hoogerheide	NB	\N	\N
3689	03-10-2020	2020-10-03 00:00:00	40/838	Bensi	04-10-2020	2020-10-04 00:00:00	40/839	pdv_moto	52.1795311	6.2030282	tegen paaltje Eefdense Enkweg	Eefde	Ge	\N	\N
4153	27-03-2022	2022-03-27 00:00:00	41/239	BadBert	30-03-2022	2022-03-30 00:00:00	41/240	pdv_moto	51.4304886	4.23551512	aan hekpost Oostelijke Rijnscheldeweg	Rilland	Ze	\N	\N
2896	10-09-2018	2018-09-10 00:00:00	40/48	Amauta	11-09-2018	2018-09-11 00:00:00	40/49	Bensi	52.4256325	6.84937906	Langs pad wartermolen de Mast	Vasse	Ov	\N	\N
855	08-7-2012	2012-07-08 00:00:00	16/28	rvdh86	09-07-2012	2012-07-09 00:00:00	16/29	scheurschuimpje	52.2387199	5.97522306	aan brugpijler - Kanaal Noord	Apeldoorn	Ge	\N	\N
3412	15-03-2020	2020-03-15 00:00:00	40/591	pdv_moto	15-03-2020	2020-03-15 00:00:00	40/591	Ronald_010	52.0760765	4.25090599	achtere-kast met pauw, Sportlaan 	Den Haag	ZH	\N	\N
119	02-11-2010	2010-11-02 00:00:00	4/41	Smuiger	02-11-2010	2010-11-02 00:00:00	4/42	V-Strommert	52.4745216	4.84106493	Westerringdijk, Wijdewormer, NH	Wijdewormer	NH	\N	\N
1719	20-08-2014	2014-08-20 00:00:00	27/03	VinceGSX650f	20-08-2014	2014-08-20 00:00:00	27/03	crazy987	51.497139	4.9021101	aan boom P-terrein - Alphensebaan	Chaam	NB	\N	\N
804	19-05-2012	2012-05-19 00:00:00	15/61	rvdh86	19-05-2012	2012-05-19 00:00:00	15/61	BSI	52.2176132	5.78477097	ingangsbord Rabitt Hill - Grevenhout, Uddel, Ge	Uddel	Ge	\N	\N
2948	17-11-2018	2018-11-17 00:00:00	40/109	pdv_moto	20-11-2018	2018-11-20 00:00:00	40/111	DKP	50.7693558	5.84330797	aan welkomstbord Limburg	Noorbeek	Li	\N	\N
3500	18-05-2020	2020-05-18 00:00:00	40/666	Coenster	18-05-2020	2020-05-18 00:00:00	40/667	Bertus Beemer	52.1899414	4.91955614	tegen afvalbak Donkereind	Vinkeveen	Ut	\N	\N
381	20-05-2011	2011-05-20 00:00:00	9/92	Richard117	21-05-2011	2011-05-21 00:00:00	9/95	scheurschuimpje	53.2406693	5.85670805	achter bank bij Canterlandsebrug, Miedum, Fr	Miedum	Fr	\N	\N
3499	17-05-2020	2020-05-17 00:00:00	40/666	k0en	18-05-2020	2020-05-18 00:00:00	40/666	Coenster	52.0877609	5.15824604	achter schakelkast Rijnsweerd-N	Utrecht	Ut	\N	\N
2872	20-08-2018	2018-08-20 00:00:00	40/24	SadBunny	20-08-2018	2018-08-20 00:00:00	40/24	Roeleey	52.3482704	4.93628979	in bosje tegen toren Koningskerk	Amsterdam	NH	\N	\N
4183	08-05-2022	2022-05-08 00:00:00	41/258	Outdoor Man	08-05-2022	2022-05-08 00:00:00	41/258	SadBunny	52.463501	4.68327808	achter infopaneel Damsluis Vuurlinie	Beverwijk	NH	\N	\N
1635	12-05-2014	2014-05-12 00:00:00	26/03	Meangreengirl/MeanBlueMan	12-05-2014	2014-05-12 00:00:00	26/04	Bludge	52.0303268	6.05019617	aan hekpaal - Diepesteeg	de Steeg	Ge	\N	\N
1060	02-02-2013	2013-02-02 00:00:00	18/82	SadBunny	02-02-2013	2013-02-02 00:00:00	18/82	Corney28	52.3210411	4.89945793	aan cai-kast Amsteldijk	Amsterdam	NH	\N	\N
3479	28-04-2020	2020-04-28 00:00:00	40/650	frankivo	29-04-2020	2020-04-29 00:00:00	40/650	FastEddy	52.98489	7.00390482	tegen slagboom fietspad	Vledderveen	Dr	\N	\N
4012	26-08-2021	2021-08-26 00:00:00	41/146	BSI	26-08-2021	2021-08-26 00:00:00	41/146	Outdoor Man	52.1903038	5.62430191	tegen muurtje Apeldoornsestraat	Voorthuizen	Ge	\N	\N
1733	04-09-2014	2014-09-04 00:00:00	27/17	MLB	05-09-2014	2014-09-05 00:00:00	27/17	tdemmer	51.9391479	4.30025291	aan hoekpaal - Duifpolder	Maasland	ZH	\N	\N
2862	15-08-2018	2018-08-15 00:00:00	40/14	frankivo	15-08-2018	2018-08-15 00:00:00	40/14	FastEddy	53.0243759	7.08206606	tegen paaltje P-Gasterij	Smeerling	Gr	\N	\N
1450	23-12-2013	2013-12-23 00:00:00	24/10	Ronald_010	25-12-2013	2013-12-25 00:00:00	24/11	tdemmer	51.8653603	4.45395994	aan hek Driemanssteeweg	Rotterdam	ZH	\N	\N
3902	09-05-2021	2021-05-09 00:00:00	41/066	pdv_moto	13-05-2021	2021-05-13 00:00:00	41/068	Sjefman	51.5250702	3.47145605	tegen wandelpaaltje Schoutsweg	Westkapelle	Ze	\N	\N
1195	05-05-2013	2013-05-05 00:00:00	20/67	MLB	05-05-2013	2013-05-05 00:00:00	20/67	Ronald_010	51.9543648	4.34993601	hek kruising A4-Oostveenseweg	Schipluiden	ZH	\N	\N
2529	26-08-2017	2017-08-26 00:00:00	35/71	Bomba	27-08-2017	2017-08-27 00:00:00	35/71	SadBunny	52.0666809	4.77865791	aan hekpost Parallelweg-Noord	Bodegraven	ZH	\N	\N
3618	10-08-2020	2020-08-10 00:00:00	40/775	Hans89	11-08-2020	2020-08-11 00:00:00	40/775	Bensi	51.9296532	4.71736479	in fundament weidemolen de Loet	Bergambacht	ZH	\N	\N
684	09-01-2012	2012-01-09 00:00:00	14/12	Hans89	13-01-2012	2012-01-13 00:00:00	14/14	tdemmer	51.5425339	3.77027702	aan infobord - Muidenweg, Wolphaartsdijk, Ze	Wolphaartsdijk	Ze	\N	\N
1422	17-11-2013	2013-11-17 00:00:00	23/79	Meifesto	17-11-2013	2013-11-17 00:00:00	23/79	Phaedrus	51.9015236	4.54279804	onder brug Brienenoordeiland	Rotterdam	ZH	\N	\N
1507	09-02-2014	2014-02-09 00:00:00	24/73	BigJim	10-02-2014	2014-02-10 00:00:00	24/73	Scoot_020/Scoot_2	52.6529236	4.69827604	onder bruggetje - Groeneweg	Bergen	NH	\N	\N
4375	10-07-2023	2023-07-10 00:00:00	41/384	Coenster	12-07-2023	2023-07-12 00:00:00	41/385	Outdoor Man	52.6358986	5.41319799	aan paal bij uitkijk de schakel	Lelystad	Fl	\N	\N
185	02-01-2011	2011-01-02 00:00:00	5/79	moturist	04-01-2011	2011-01-04 00:00:00	5/81	Buikschuiver oet Dre	53.0758858	6.76278782	recreatieterrein Hunzedal, Spijkerboor, Dr	Spijkerboor	Dr	\N	\N
3842	23-03-2021	2021-03-23 00:00:00	41/016	HighKing	24-03-2021	2021-03-24 00:00:00	41/016	ootje	52.4598389	4.669631	in keien beschoeiïng Noordzeekanaal	Beverwijk	NH	\N	\N
1335	31-08-2013	2013-08-31 00:00:00	22/56	D00fis	01-09-2013	2013-09-01 00:00:00	22/57	Bensi	51.7673683	5.73088312	aan hek bij bunker in bocht N324	Grave	NB	\N	\N
2457	13-06-2017	2017-06-13 00:00:00	34/83	BornToReign	14-06-2017	2017-06-14 00:00:00	34/84	BSI	51.847126	5.87027502	bij treurberk Valkhofpark	Nijmegen	Ge	\N	\N
2802	29-06-2018	2018-06-29 00:00:00	39/41	Coenster	29-06-2018	2018-06-29 00:00:00	39/41	pdv_moto	52.2219086	4.67958021	tegen poot bebouwde kom Vriezekoop	Leimuiden	ZH	\N	\N
1698	24-07-2014	2014-07-24 00:00:00	26/75	Roeleey	24-07-2014	2014-07-24 00:00:00	26/76	Hooglander1	52.3340263	4.91606617	aan hek P-terrein Fennengastraat	Amsterdam	NH	\N	\N
2285	31-10-2016	2016-10-31 00:00:00	32/84	frankivo	31-10-2016	2016-10-31 00:00:00	32/85	Amauta	52.9999924	6.7291131	aan einde rails - Provinciale weg	Eext	Dr	\N	\N
1281	12-07-2013	2013-07-12 00:00:00	21/84	MLB	13-07-2013	2013-07-13 00:00:00	21/84	Guvner	52.0392952	4.1830759	aan hek uitzichtpunt Bloedberg	Monster	ZH	\N	\N
1107	04-03-2013	2013-03-04 00:00:00	19/39	SadBunny	05-03-2013	2013-03-05 00:00:00	19/39	Corney28	52.1394386	5.23966217	aan heg - Paduaweg	Den Dolder	Ut	\N	\N
4272	14-12-2022	2022-12-14 00:00:00	41/318	Outdoor Man	20-12-2022	2022-12-20 00:00:00	41/318	ootje	52.5125732	4.62918711	aan hek duiningang Achterweg	Heemskerk	NH	\N	\N
557		0001-01-01 00:00:00 BC		MotorMieke		0001-01-01 00:00:00 BC			\N	\N				\N	\N
3999	03-08-2021	2021-08-03 00:00:00	41/137	Hans89	04-08-2021	2021-08-04 00:00:00	41/137	Roeleey	51.7641678	4.03387499	bij vogelkijkwand Slikken van Flakkee	Melissant	ZH	\N	\N
4315	06-04-2023	2023-04-06 00:00:00	41/345	Toereloer	08-04-2023	2023-04-08 00:00:00	41/345	Outdoor Man	52.7437096	5.06042719	achter muurtje theaterkerk Hemels	Twisk	NH	\N	\N
3246	23-09-2019	2019-09-23 00:00:00	40/463	Coenster	23-09-2019	2019-09-23 00:00:00	40/463	Outdoor Man	52.301548	4.62624407	aan slagboom P-terrein Park 21	Hoofddorp	NH	\N	\N
3779	29-12-2020	2020-12-29 00:00:00	40/913	Carburateur	29-12-2020	2020-12-29 00:00:00	40/913	Picobello BV	51.9256897	4.55370283	in struik Ringvaartweg	Rotterdam	ZH	\N	\N
157	01-12-2010	2010-12-01 00:00:00	5/28	bobcat	03-12-2010	2010-12-03 00:00:00	5/30	ootje	52.4601936	4.57292986	bocht gedenknaald Seinpostweg, IJmuiden, NH	IJmuiden	NH	\N	\N
528	09-09-2011	2011-09-09 00:00:00	11/94	Kermit de Hond	09-09-2011	2011-09-09 00:00:00	11/96	Buuv	53.1649628	6.79284191	toegangshek kerk - Noorderweg, Sappemeer, Gr	Sappemeer	Gr	\N	\N
2184	25-07-2016	2016-07-25 00:00:00	31/56	pdv_moto	25-07-2016	2016-07-25 00:00:00	31/57	bikedan	51.6167336	4.43157291	aan vangrail Noordzeedijk	Dinteloord	NB	\N	\N
2886	31-08-2018	2018-08-31 00:00:00	40/41	Ronny Rabbelaar	31-08-2018	2018-08-31 00:00:00	40/41	FastEddy	53.1085281	7.06319284	aan paal fietspad Verlengde Schoollaan	Blijham	Gr	\N	\N
512	23-08-2011	2011-08-23 00:00:00	11/63	The Dutchy	23-08-2011	2011-08-23 00:00:00	11/65	rvdh86	52.0411911	5.6933322	achter hek GSM-mast - Arnhemseweg, Ede, Ge	Ede	Ge	\N	\N
1868	19-03-2015	2015-03-19 00:00:00	28/34	Corney28	20-03-2015	2015-03-20 00:00:00	28/34	BSI	52.2343216	4.92508698	aan lantaarnpaal Botholsedijk	Vinkeveen	Ut	\N	\N
309	05-04-2011	2011-04-05 00:00:00	8/68	BrouwerER6N	06-04-2011	2011-04-06 00:00:00	8/70	Mr.Bean	52.060051	6.02121592	parkeerplek Schaapsallee/Langejuffer, Rheden, Ge	Rheden	Ge	\N	\N
2704	11-04-2018	2018-04-11 00:00:00	38/25	MeanYellowBoy	12-04-2018	2018-04-12 00:00:00	38/27	aisnoek	52.4915161	6.57493019	aan beschoeiing Oosterwg	Beerzerveld	Ov	\N	\N
2371	03-04-2017	2017-04-03 00:00:00	33/96	pdv_moto	04-04-2017	2017-04-04 00:00:00	33/96	Amauta	51.548275	3.66907096	in bloembak - Markt	Veere	Ze	\N	\N
2598	24-11-2017	2017-11-24 00:00:00	36/71	Okami_Xci	03-12-2017	2017-12-03 00:00:00	36/75	Ronald_010	50.7944489	5.69944382	aan hek - P-terrein Kasteellaan	Eijsden	Li	\N	\N
2624	24-01-2018	2018-01-24 00:00:00	37/16	HighKing	24-01-2018	2018-01-24 00:00:00	37/17	SadBunny	52.333168	5.07136106	aan poot infobord Muiderslot	Muiden	NH	\N	\N
1967	21-07-2015	2015-07-21 00:00:00	29/25	Hans89	21-07-2015	2015-07-21 00:00:00	29/25	bikedan	51.4216156	3.91457891	in heg Boeiertweg	Hoedekenskerke	Ze	\N	\N
3193	05-08-2019	2019-08-05 00:00:00	40/408	Coenster	06-08-2019	2019-08-06 00:00:00	40/408	BSI	52.2426682	4.85101223	aan einde uitstroomgoot gemaal Legmeer	Amstelveen	NH	\N	\N
1430	24-11-2013	2013-11-24 00:00:00	23/85	BSI	25-11-2013	2013-11-25 00:00:00	23/85	Hasseman	52.2068787	6.81949377	aan geluidsscherm - Brouwerslaan	Enschede	Ov	\N	\N
1371	28-09-2013	2013-09-28 00:00:00	23/09	bikedan	28-09-2013	2013-09-28 00:00:00	23/09	Ronald_010	51.4091148	4.34070206	achter kast OLV ter Duinenlaan	Ossendrecht	NB	\N	\N
3408	08-03-2020	2020-03-08 00:00:00	40/587	FastEddy	10-03-2020	2020-03-10 00:00:00	40/588	pdv_moto	52.9243011	6.78957415	tegen boom Hoofdstraat	Borger	Dr	\N	\N
3685	01-10-2020	2020-10-01 00:00:00	40/835	ey-dzeej	02-10-2020	2020-10-02 00:00:00	40/836	pdv_moto	51.9123917	4.42614508	onder bankschroef bij de Citrus Veiling	Rotterdam	ZH	\N	\N
308	05-04-2011	2011-04-05 00:00:00	8/65	Mr.Bean	05-04-2011	2011-04-05 00:00:00	8/67	BrouwerER6N	51.9926033	6.00576878	onder brug bij Lathumse Veerweg, Velp, Ge	Velp	Ge	\N	\N
3915	29-05-2021	2021-05-29 00:00:00	41/078	WillyvD	29-05-2021	2021-05-29 00:00:00	41/078	bikedan	51.6888962	4.21257687	tegen hek spuisluis oude haven	Oude-Tonge	ZH	\N	\N
271	16-03-2011	2011-03-16 00:00:00	8/3	Outdoor Man	17-03-2011	2011-03-17 00:00:00	8/5	Smuiger	52.2659912	4.94159508	steiger aan Winkeldijk, Abcoude, NH	Abcoude	NH	\N	\N
574	11-10-2011	2011-10-11 00:00:00	12/64	Hans89	11-10-2011	2011-10-11 00:00:00	12/65	Dirk130	51.5853882	3.85493493	in boog bij P-terrein - Parallelweg, Colijnsplaat, Ze	Colijnsplaat	Ze	\N	\N
69	28-09-2010	2010-09-28 00:00:00	3/21	Wimis on	28-09-2010	2010-09-28 00:00:00	3/23	*Jet*	52.4029236	5.34073305	Trekweg langs kanaal, Almere, Fl	Almere	Fl	\N	\N
3321	12-12-2019	2019-12-12 00:00:00	40/526	Picobello BV	12-12-2019	2019-12-12 00:00:00	40/526	Hans89	51.9027061	4.41139412	onder bloembak Mercuriusweg	Schiedam	ZH	\N	\N
2605	27-12-2017	2017-12-27 00:00:00	36/87	pdv_moto	27-12-2017	2017-12-27 00:00:00	36/88	Rik60NL	52.3713455	4.53483009	onder heg Koninginneweg	Zandvoort	NH	\N	\N
4082	03-01-2022	2022-01-03 00:00:00	41/192	BSI	06-01-2022	2022-01-06 00:00:00	41/193	Outdoor Man	52.1991768	5.43625212	achter meertje bij 't Hammetje, Domstraat	Hooglanderveen	Ut	\N	\N
2557	29-09-2017	2017-09-29 00:00:00	36/12	Okami_Xci	29-09-2017	2017-09-29 00:00:00	36/14	Amauta	51.6766167	5.64604998	Bij paal P-plats - Vluchtoord	Uden	NB	\N	\N
183	31-12-2010	2010-12-31 00:00:00	5/73	BigJim	01-01-2011	2011-01-01 00:00:00	5/75	black mule	52.9438896	5.02599001	uiteinde havenhoofd, Den Oever, NH	Den Oever	NH	\N	\N
1860	14-03-2015	2015-03-14 00:00:00	28/28	k0en	15-03-2015	2015-03-15 00:00:00	28/29	Wimis on	52.0436363	5.14514589	achter CAI-kast - Utrechtseweg	Houten	Ut	\N	\N
1914	15-05-2015	2015-05-15 00:00:00	28/77	BSI	15-05-2015	2015-05-15 00:00:00	28/77	Ronald_010	51.7884064	4.90999317	aan Papsluis - Bakkerskil	Nieuwendijk	NB	\N	\N
4379	16-07-2023	2023-07-16 00:00:00	41/387	FastEddy	29-07-2023	2023-07-29 00:00:00	41/389	Amauta	52.9879608	6.96772623	aan hek Doctor Kinglaan	Stadskanaal	Gr	\N	\N
520	30-08-2011	2011-08-30 00:00:00	11/80	Scoot_020/Scoot_2	01-09-2011	2011-09-01 00:00:00	11/81	Jethro	52.2582779	5.17168379	aan hek bij sportpark Crailoo, Hilversum, NH	Hilversum	NH	\N	\N
1500	07-02-2014	2014-02-07 00:00:00	24/65	Splinnie	07-02-2014	2014-02-07 00:00:00	24/66	Sjakie-77	52.5460854	4.65496492	aan boom fietspad - Kramerweg	Castricum	NH	\N	\N
1194	04-05-2013	2013-05-04 00:00:00	20/65	Ronald_010	05-05-2013	2013-05-05 00:00:00	20/66	MLB	51.8288956	4.13001394	onder sluisdeur vesting	Hellevoetsluis	ZH	\N	\N
4288	11-02-2023	2023-02-11 00:00:00	41/328	Bensi	12-02-2023	2023-02-12 00:00:00	41/328	Outdoor Man	52.0812073	6.35424089	onder tek Lindenseweg 	Vorden	Ge	\N	\N
4373	09-07-2023	2023-07-09 00:00:00	41/384	Outdoor Man	10-07-2023	2023-07-10 00:00:00	41/384	Picobello BV	52.3854523	4.80323696	tegen betonnen kolom Brettenburg	Amsterdam	NH	\N	\N
2094	09-04-2016	2016-04-09 00:00:00	30/61	Amauta	12-04-2016	2016-04-12 00:00:00	30/63	pdv_moto	53.3909607	6.67424583	aan brug Veilingweg	Doodstil	Gr	\N	\N
677	29-12-2011	2011-12-29 00:00:00	13/98	frankwijers	30-12-2011	2011-12-30 00:00:00	13/100	king-roy	51.394352	5.98689222	bij bankje Helenaveenseweg, Kronenberg, Li	Kronenberg	Li	\N	\N
676	28-12-2011	2011-12-28 00:00:00	13/97	Ronald_010	29-12-2011	2011-12-29 00:00:00	13/98	frankwijers	51.6636238	5.61244202	bij E-huisje - Burg. Buskensstraat, Uden, NB	Uden	NB	\N	\N
2470	27-06-2017	2017-06-27 00:00:00	34/95	Rik60NL	27-06-2017	2017-06-27 00:00:00	34/95	Wimis on	52.2393379	4.97561598	bij fietstunnel - Zuwe	Baambrugge	Ut	\N	\N
747	23-03-2012	2012-03-23 00:00:00	14/99	vuurbloed	23-03-2012	2012-03-23 00:00:00	14/100	Ronald_010	51.9853897	4.39551306	bankje picknickplaats A13, Delft, ZH	Delft	ZH	\N	\N
2122	10-05-2016	2016-05-10 00:00:00	30/90	Corney28	10-05-2016	2016-05-10 00:00:00	30/91	Roeleey	52.2209282	4.97192383	aan bruggehoofd N201	Vinkeveen	Ut	\N	\N
1944	22-06-2015	2015-06-22 00:00:00	29/06	Rik60NL	22-06-2015	2015-06-22 00:00:00	29/06	Bomba	52.116436	4.80499411	aan boom Hazekade	Bodegraven	ZH	\N	\N
3115	12-05-2019	2019-05-12 00:00:00	40/322	Amauta	13-05-2019	2019-05-13 00:00:00	40/323	FastEddy	53.0993919	6.40365982	bij steenhopen Meeuwenweg	Steenbergen	Dr	\N	\N
728	09-03-2012	2012-03-09 00:00:00	14/79	wesleyc	09-03-2012	2012-03-09 00:00:00	14/80	Dirk130	51.9780006	4.1738472	hek Papedijk/Oude Hooislag, 's-Gravezande, ZH	s-Gravenzande	ZH	\N	\N
3349	12-01-2020	2020-01-12 00:00:00	40/545	Picobello BV	13-01-2020	2020-01-13 00:00:00	40/546	ey-dzeej	51.9779129	4.12154484	tegen hek van Oord, Cruwuiusweg	Hoek van Holland	ZH	\N	\N
3956	26-06-2021	2021-06-26 00:00:00	41/107	MeanYellowBoy	27-06-2021	2021-06-27 00:00:00	41/108	HermanK	52.6399536	6.36415577	aan elkomstbord de Pieperij	Veeningen	Ov	\N	\N
593	19-10-2011	2011-10-19 00:00:00	12/89	Dirk130	21-10-2011	2011-10-21 00:00:00	12/92	tdemmer	52.1363182	4.41153097	in boom Raephorst - Papeweg, Wassenaar, ZH	Wassenaar	ZH	\N	\N
2528	26-08-2017	2017-08-26 00:00:00	35/69	Rik60NL	26-08-2017	2017-08-26 00:00:00	35/70	Bomba	52.135437	4.6937561	in knotwilg Nieuwkoopselaan	Alphen a/d Rijn	ZH	\N	\N
2359	19-03-2017	2017-03-19 00:00:00	33/80	BSI	20-03-2017	2017-03-20 00:00:00	33/81	pdv_moto	52.0694809	4.55900192	onder voetbrug N20	Benthuizen	ZH	\N	\N
4122	11-02-2022	2022-02-11 00:00:00	41/217	HighKing	11-02-2022	2022-02-11 00:00:00	41/217	Outdoor Man	52.5157814	4.68050718	tegen boompje bij fietscrossbaan	Heemskerk	NH	\N	\N
2311	13-12-2016	2016-12-13 00:00:00	33/18	pdv_moto	14-12-2016	2016-12-14 00:00:00	33/19	Ronald_010	52.0924873	4.29762983	aan hek Prinsenvinkenpark	Den Haag	ZH	\N	\N
1051	14-01-2013	2013-01-14 00:00:00	18/64	Corney28	15-01-2013	2013-01-15 00:00:00	18/66	Bomba	52.2074165	4.88804197	aan hek zwembad Optisport	Mijdrecht	Ut	\N	\N
2124	12-05-2016	2016-05-12 00:00:00	30/92	Artemecion	12-05-2016	2016-05-12 00:00:00	30/93	Amauta	52.5146027	4.68565416	naast E-huisje - Maerelaan	Heemskerk	NH	\N	\N
3315	09-12-2019	2019-12-09 00:00:00	40/522	Picobello BV	09-12-2019	2019-12-09 00:00:00	40/522	Hans89	51.9410324	4.87774706	achter paaltje Lekdijk West	Lopik	Ut	\N	\N
2795	24-06-2018	2018-06-24 00:00:00	39/33	BSI	25-06-2018	2018-06-25 00:00:00	39/33	BornToReign	52.1756096	5.59501123	tegen boom Verbindingsweg	Voorthuizen	Ge	\N	\N
3455	13-04-2020	2020-04-13 00:00:00	40/631	Amauta	14-04-2020	2020-04-14 00:00:00	40/632	MP_NL	52.2222023	6.56490612	in boomstronk knotwilg bij reggesyfon	Markelo	Ov	\N	\N
3652	02-09-2020	2020-09-02 00:00:00	40/809	ootje	02-09-2020	2020-09-02 00:00:00	40/810	Amauta	53.0494537	5.5042181	aab hek bij E-huisje Eemswouderlaan	Tjerkwerd	Fr	\N	\N
3784	11-01-2021	2021-01-11 00:00:00	40/919	FastEddy	13-01-2021	2021-01-13 00:00:00	40/920	Amauta	52.986557	6.9937458	tegen poot HS-mast Noorderkanaalweg	Stadskanaal	Gr	\N	\N
3541	10-06-2020	2020-06-10 00:00:00	40/700	ey-dzeej	10-06-2020	2020-06-10 00:00:00	40/701	Hans89	51.9618721	4.57432413	aan hek gemaaltje Korne	Rotterdam	ZH	\N	\N
1621	02-05-2014	2014-05-02 00:00:00	25/90	Ronald_010	02-05-2014	2014-05-02 00:00:00	25/91	Bigtwim	52.5175858	5.07141685	achter hek camping Strandbad	Edam	NH	\N	\N
87	08-10-2010	2010-10-08 00:00:00	3/53	Xevoo	08-10-2010	2010-10-08 00:00:00	3/54	dopey'85	51.4949303	5.41114187	Golflaan, Best, NB	Best	NB	\N	\N
3218	21-08-2019	2019-08-21 00:00:00	40/433	Ronny Rabbelaar	21-08-2019	2019-08-21 00:00:00	40/434	Amauta	53.2757568	6.85084486	tegen kabouterpaaltje Kabouterpad	Tjuchem (Steendam)	Gr	\N	\N
551	23-09-2011	2011-09-23 00:00:00	11/29	BSI	24-09-2011	2011-09-24 00:00:00	12/31	Dark Byte	52.2315063	6.23387814	aan boom bij P-terrein - Oxerhof, Colmschate, Ov	Colmschate	Ov	\N	\N
2583	06-11-2017	2017-11-06 00:00:00	36/51	Bomba	07-11-2017	2017-11-07 00:00:00	36/52	ItsmeA3	51.8935394	4.2289629	aan paal Rozenburgsesluis	Rotterdam	ZH	\N	\N
3550	20-06-2020	2020-06-20 00:00:00	40/709	pdv_moto	21-06-2020	2020-06-21 00:00:00	40/710	Sjefman	50.9491577	5.89414406	aan paal bij de Kakkert	Oirsbeek	Li	\N	\N
628	15-11-2011	2011-11-15 00:00:00	13/42	V-Strommert	16-11-2011	2011-11-16 00:00:00	13/43	Scoot_020/Scoot_2	52.2646828	4.7813859	achter rode deur van HollandFlora, Aalsmeer, NH	Aalsmeer	NH	\N	\N
1764	08-10-2014	2014-10-08 00:00:00	27/42	Dirk130	08-10-2014	2014-10-08 00:00:00	27/43	Lekkerbekje	51.9935608	4.31668377	achter heg K. Engelbrechtweg	Schipluiden	ZH	\N	\N
1844	21-02-2015	2015-02-21 00:00:00	28/17	Scoot_020/Scoot_2	21-02-2015	2015-02-21 00:00:00	28/17	Corney28	52.2150841	4.93372202	achter hek bij kerk	Vinkeveen	Ut	\N	\N
2711	17-04-2018	2018-04-17 00:00:00	38/36	BornToReign	18-04-2018	2018-04-18 00:00:00	38/37	Amauta	52.0615044	5.8981638	bij P-terrein museum Deelen	Arnhem	Ge	\N	\N
722	05-03-2012	2012-03-05 00:00:00	14/73	tdemmer	05-03-2012	2012-03-05 00:00:00	14/73	jaap43	52.0031776	4.54668808	aan boom cafe 't Zeeltje - Kooilaan, Bleiswijk, ZH	Bleiswijk	ZH	\N	\N
1404	29-10-2013	2013-10-29 00:00:00	23/57	Scoot_020/Scoot_2	30-10-2013	2013-10-30 00:00:00	23/57	Corney28	52.3662262	4.94524384	aan boom Zeeburgerdijk	Amsterdam	NH	\N	\N
4	19-08-2010	2010-08-19 00:00:00	1/8	Red Devil	19-08-2010	2010-08-19 00:00:00	1/10	smoffler	52.1655769	5.39040279	Keerkring 11, Amersfoort, Ut	Amersfoort	Ut	\N	\N
1892	27-04-2015	2015-04-27 00:00:00	28/63	Scoot_020/Scoot_2	27-04-2015	2015-04-27 00:00:00	28/63	Bigtwim	52.3705902	4.96159697	aanANWB-paal - Zuiderzeeweg	Amsterdam	NH	\N	\N
4036	25-09-2021	2021-09-25 00:00:00	41/158	FastEddy	25-09-2021	2021-09-25 00:00:00	41/158	Janhertog	52.6702766	6.33249998	tegen paaltje bij muur tegen geweld	de Wijk	Dr	\N	\N
1324	24-08-2013	2013-08-24 00:00:00	22/40	Ronald_010	25-08-2013	2013-08-25 00:00:00	22/40	BSI	51.6097832	4.6545229	in heg - Zwartenbergsemolen	Etten-Leur	NB	\N	\N
3875	13-04-2021	2021-04-13 00:00:00	41/040	HermanK	14-04-2021	2021-04-14 00:00:00	41/041	MeanYellowBoy	52.5984612	6.51256323	onder kastje Spekopswijk	Dedemsvaart	Ov	\N	\N
2577	31-10-2017	2017-10-31 00:00:00	36/44	Hjerteknuser	01-11-2017	2017-11-01 00:00:00	36/45	Scoot_020/Scoot_2	52.2914658	4.72472382	aan vlaggemast - Hoeksteen	Hoofddorp	NH	\N	\N
4308	25-03-2023	2023-03-25 00:00:00	41/340	Picobello BV	29-03-2023	2023-03-29 00:00:00	41/341	Outdoor Man	52.2234955	4.63346815	in struik landweg langs A4	Abbenes	NH	\N	\N
3014	13-02-2019	2019-02-13 00:00:00	40/207	Roeleey	13-02-2019	2019-02-13 00:00:00	40/207	HighKing	52.3701248	4.83718586	achter schakelkast Jan Tooropstraat	Amsterdam	NH	\N	\N
4170	23-04-2022	2022-04-23 00:00:00	41/250	Hans89	24-04-2022	2022-04-24 00:00:00	41/250	FastEddy	51.7873116	4.54254007	in heg bij Polderschemolen, Polderdijk	Maasdam	ZH	\N	\N
352		0001-01-01 00:00:00 BC				0001-01-01 00:00:00 BC		Bigtwim	\N	\N				\N	\N
2280	27-10-2016	2016-10-27 00:00:00	32/76	frankivo	27-10-2016	2016-10-27 00:00:00	32/77	aisnoek	52.7255592	6.54980803	aan hek Noord Hoofddiep	Nieuweroord	Dr	\N	\N
822	12-06-2012	2012-06-12 00:00:00	15/85	Buuv	13-06-2012	2012-06-13 00:00:00	15/86	frankivo	52.9700737	6.54217482	aan poort bij verkeerspark - TT-circuit, Assen, Dr	Assen	Dr	\N	\N
3277	21-10-2019	2019-10-21 00:00:00	40/486	Hans89	23-10-2019	2019-10-23 00:00:00	40/486	Outdoor Man	52.0081825	4.65224981	tegen geschutsopsttelling, 5e Tochtweg	Moordrecht	ZH	\N	\N
1686	17-07-2014	2014-07-17 00:00:00	26/65	Sjantaalfoutje	17-07-2014	2014-07-17 00:00:00	26/66	Dirtbag	52.1746483	5.91091824	aan struik parallelweg - Otterloseweg	Ugchelen	Ge	\N	\N
1438	08-12-2013	2013-12-08 00:00:00	23/96	Sjantaalfoutje	09-12-2013	2013-12-09 00:00:00	23/97	Ronald_010	52.1834412	5.83970499	in boom bij bank Turfbergweg	Radio Kootwijk	Ge	\N	\N
973	02-11-2012	2012-11-02 00:00:00	17/62	Directeur	03-11-2012	2012-11-03 00:00:00	17/63	nannol	53.3365173	6.92760086	onder bankje Zeebadweg	Delfzijl	Gr	\N	\N
3896	04-05-2021	2021-05-04 00:00:00	41/062	Outdoor Man	06-05-2021	2021-05-06 00:00:00	41/062	Amauta	50.7698402	5.72497702	aan poot van bord "Welkom in Limburg"	Eijsden	Li	\N	\N
2417	10-05-2017	2017-05-10 00:00:00	34/41	frankivo	12-05-2017	2017-05-12 00:00:00	34/42	Amauta	53.3026047	7.03853083	tegen muur uitstort gemaal	Termunterzijl	Gr	\N	\N
400		0001-01-01 00:00:00 BC		Eady		0001-01-01 00:00:00 BC			\N	\N				\N	\N
3823	05-03-2021	2021-03-05 00:00:00	41/001	BSI	06-03-2021	2021-03-06 00:00:00	41/002	Coenster	52.323204	5.0613451	aan hek Weesperweg	Muiden	NH	\N	\N
769	07-04-2012	2012-04-07 00:00:00	15/25	rvdh86	08-04-2012	2012-04-08 00:00:00	15/25	scheurschuimpje	52.4549026	5.80905485	bij P-terrein Bremerbergdijk, Biddinghuizen, Fl	Biddinghuizen	Fl	\N	\N
2873	21-08-2018	2018-08-21 00:00:00	40/24	Roeleey	21-08-2018	2018-08-21 00:00:00	40/24	Coenster	52.3319893	5.05444288	tegen hek Amsterdamsestraatweg	Muiden	NH	\N	\N
260	07-03-2011	2011-03-07 00:00:00	7/75	lynx84	07-03-2011	2011-03-07 00:00:00	7/76	Richard117	51.8307533	4.65219021	rotonde Laan van Welhorst/Rietlaan, Ambacht, ZH	Ambacht	ZH	\N	\N
1358	18-09-2013	2013-09-18 00:00:00	22/82	tdemmer	18-09-2013	2013-09-18 00:00:00	22/82	Ronald_010	51.9546509	4.52150393	aan boom Ommoordsehof	Rotterdam	ZH	\N	\N
1119	18-03-2013	2013-03-18 00:00:00	19/59	SadBunny	19-03-2013	2013-03-19 00:00:00	19/60	V-Strommert	52.2756004	4.53739119	in bord - Stationsweg bij Halfweg	Lisse	ZH	\N	\N
3666	16-09-2020	2020-09-16 00:00:00	40/820	HighKing	17-09-2020	2020-09-17 00:00:00	40/821	Outdoor Man	52.5356445	4.69604588	aan hek Uitgeesterweg	Uitgeest	NH	\N	\N
18	25-08-2010	2010-08-25 00:00:00	1/45	Jessica33	25-08-2010	2010-08-25 00:00:00	1/48	ThaGaruda	51.6882401	5.66242504	Udenseweg, Zeeland, NB	Zeeland	NB	\N	\N
3546	14-06-2020	2020-06-14 00:00:00	40/703	pdv_moto	14-06-2020	2020-06-14 00:00:00	40/704	bikedan	51.5402107	3.4380939	n struik bij uitzichtkiosk	Westkapelle	Ze	\N	\N
767	05-04-2012	2012-04-05 00:00:00	15/20	tdemmer	06-04-2012	2012-04-06 00:00:00	MIA	MIA	52.1321678	6.02549982	bij stootblok VSM - Veldhuizen, Loenen, Ge	Loenen	Ge	\N	\N
4029	13-09-2021	2021-09-13 00:00:00	41/154	Outdoor Man	14-09-2021	2021-09-14 00:00:00	41/154	ootje	52.3766327	4.74471378	in heg van klokkenstoel begraafplaats	Amstelveen	NH	\N	\N
2991	19-01-2019	2019-01-19 00:00:00	40/176	grootkaalnix	20-01-2019	2019-01-20 00:00:00	40/176	Okami_Xci	51.4095764	5.49014187	aan hekpost Eikenburg, Roostenlaan	Eindhoven	NB	\N	\N
1910	12-05-2015	2015-05-12 00:00:00	28/75	sjors078	14-05-2015	2015-05-14 00:00:00	28/75	bikedan	51.8585548	4.51663399	in zandhoop Voordijk	Barendrecht	ZH	\N	\N
2524	24-08-2017	2017-08-24 00:00:00	35/65	Rik60NL	24-08-2017	2017-08-24 00:00:00	35/65	Coenster	52.2327576	4.71598196	aan E-huisje Westeinderplas	Leimuiden	ZH	\N	\N
2964	24-12-2018	2018-12-24 00:00:00	40/138	Roeleey	24-12-2018	2018-12-24 00:00:00	40/138	SadBunny	52.2994003	4.98402786	achter E-kasr Vreelandplein	Amsterdam	NH	\N	\N
1104	03-03-2013	2013-03-03 00:00:00	19/35	Corney28	03-03-2013	2013-03-03 00:00:00	19/35	Roeleey	52.2522202	4.87636995	ophaalbrug Waver	Ouderkerk a/d Amstel	NH	\N	\N
1032	21-12-2012	2012-12-21 00:00:00	18/34	Ronald_010	22-12-2012	2012-12-22 00:00:00	18/34	Geert-26	51.8817406	4.89787483	in boom Postkade	Giessenburg	ZH	\N	\N
66	26-09-2010	2010-09-26 00:00:00	3/13	El Rojo	26-09-2010	2010-09-26 00:00:00	3/14	Wimis on	52.0494308	5.32706785	Broekweg, Doorn, Ut	Doorn	Ut	\N	\N
1775	18-10-2014	2014-10-18 00:00:00	27/52	Bigtwim	21-10-2014	2014-10-21 00:00:00	27/53	Scoot_020/Scoot_2	52.4366455	4.67135715	achter muur Tacitustunnel	Velsen	NH	\N	\N
3766	16-12-2020	2020-12-16 00:00:00	40/901	ootje	17-12-2020	2020-12-17 00:00:00	40/903	Outdoor Man	52.6128883	4.66440105	in boom Rinnegommerlaan	Egmond aan de Hoef	NH	\N	\N
154	29-11-2010	2010-11-29 00:00:00	5/25	hplaverda	29-11-2010	2010-11-29 00:00:00	5/26	ootje	52.5634727	4.8113842	vogelkijkhut Leyweg, Graft/de Rijp, NH	de Rijp	NH	\N	\N
2467	25-06-2017	2017-06-25 00:00:00	34/93	BornToReign	25-06-2017	2017-06-25 00:00:00	34/93	BSI	52.2578392	5.96481085	aan boom bij Wenumse watermolen	Wenum	Ge	\N	\N
1622	03-05-2014	2014-05-03 00:00:00	25/91	Bigtwim	04-05-2014	2014-05-04 00:00:00	25/91	Roeleey	52.5222359	5.06593513	aan hek ingang camping de Dijk	Edam	NH	\N	\N
1939	17-06-2015	2015-06-17 00:00:00	29/01	ArendJan	18-06-2015	2015-06-18 00:00:00	29/03	Bomba	51.9846992	4.65752983	in knotwilg 4e Tochtweg	Moordrecht	ZH	\N	\N
709	20-02-2012	2012-02-20 00:00:00	14/56	Hasseman	20-02-2012	2012-02-20 00:00:00	14/57	blup blup	52.3206367	6.75869513	poort openluchttheater Hertmerweg, Hertme, Ov	Hertme	Ov	\N	\N
992	12-11-2012	2012-11-12 00:00:00	17/88	V-Strommert	13-11-2012	2012-11-13 00:00:00	17/89	Scoot_020/Scoot_2	52.304493	4.69090414	aan paal - Hoofdweg	Hoofddorp	NH	\N	\N
117	30-10-2010	2010-10-30 00:00:00	4/31	zZlaapkopZz	31-10-2010	2010-10-31 00:00:00	4/35	BigJim	52.7661552	6.91375923	circuitpark - Kapt. Antiferstraat, Emmen, Dr	Emmen	Dr	\N	\N
2246	22-09-2016	2016-09-22 00:00:00	32/24	bikedan	22-09-2016	2016-09-22 00:00:00	32/25	pdv_moto	51.5414162	4.45247221	aan paal bij Suikerunie - Borchwerf	Roosendaal	NB	\N	\N
4370	02-07-2023	2023-07-02 00:00:00	41/382	FastEddy	03-07-2023	2023-07-03 00:00:00	41/382	BSI	52.9678612	6.86408186	in heg begraafplaats 	Drouwenermond	Dr	\N	\N
3498	17-05-2020	2020-05-17 00:00:00	40/665	BSI	17-05-2020	2020-05-17 00:00:00	40/665	k0en	52.1500511	5.56779099	tegen paaltje branweerkazerne	Barneveld	Ge	\N	\N
2677	25-03-2018	2018-03-25 00:00:00	37/93	Bensi	25-03-2018	2018-03-25 00:00:00	37/94	Arriens	52.003624	5.88868523	in boom Zijpendaalseweg	Arnhem	Ge	\N	\N
913	06-09-2012	2012-09-06 00:00:00	16/91	Delcasa	06-09-2012	2012-09-06 00:00:00	16/92	Bomba	52.2934914	4.92678022	op eiland - Ouderkerkerplas	Ouderkerk a/d Amstel	NH	\N	\N
3160	05-07-2019	2019-07-05 00:00:00	40/376	Bomba	06-07-2019	2019-07-06 00:00:00	40/377	Arriens	51.9890518	6.13604212	aan hekpaal Ganzepoelweg	Angerlo	Ge	\N	\N
4287	08-02-2023	2023-02-08 00:00:00	41/327	BSI	10-02-2023	2023-02-10 00:00:00	41/328	Bensi	52.2281761	5.73392916	tussen beukenstammen Hulakkerweg	Garderen	Ge	\N	\N
1279	11-07-2013	2013-07-11 00:00:00	21/82	tdemmer	11-07-2013	2013-07-11 00:00:00	21/82	Ronald_010	51.691906	4.64419699	aan spandoek Steenweg	Moerdijk	NB	\N	\N
906	29-08-2012	2012-08-29 00:00:00	16/85	meylie-style	31-08-2012	2012-08-31 00:00:00	16/86	bikedan	51.4996147	4.31282616	aan vangrail Ruyterhoveweg	Bergen op Zoom	NB	\N	\N
4064	11-11-2021	2021-11-11 00:00:00	41/178	Deeffox	12-11-2021	2021-11-12 00:00:00	41/178	pdv_moto	51.8070793	4.69773197	in 3e knotwilg Wantijpark 	Dordrecht	ZH	\N	\N
4015	28-08-2021	2021-08-28 00:00:00	41/147	ootje	28-08-2021	2021-08-28 00:00:00	41/147	HighKing	52.4901123	4.80020285	aan walkant Zaanweg	Wormer	NH	\N	\N
477	29-07-2011	2011-07-29 00:00:00	11/26	jaap43	29-07-2011	2011-07-29 00:00:00	11/27	wesleyc	52.1058807	4.32091522	aan boom - Oude Waalsdorperweg, Den Haag, ZH	Den Haag	ZH	\N	\N
3947	20-06-2021	2021-06-20 00:00:00	41/099	Outdoor Man	20-06-2021	2021-06-20 00:00:00	41/100	ootje	52.5554047	4.70160913	tegen poot bochtmarkering Uitgeesterweg	Limmen	NH	\N	\N
4003	13-08-2021	2021-08-13 00:00:00	41/140	BSI	13-08-2021	2021-08-13 00:00:00	41/140	Deeffox	52.2341423	5.71153212	tegen boom p-terrein ijssalon de Ijstijd	Garderen	Ge	\N	\N
602	25-10-2011	2011-10-25 00:00:00	13/03	Hasseman	25-10-2011	2011-10-25 00:00:00	13/04	fien	52.2774887	6.71612501	aan paaltje bij Noordmolen 5, Ambt Delden, Ov	Ambt Delden	Ov	\N	\N
430	12-06-2011	2011-06-12 00:00:00	10/54	scheurschuimpje	13-06-2011	2011-06-13 00:00:00	10/55	MotorMieke	52.8079376	6.08779097	in holle boom - Geologisch Monument, Baars, Ov	Baars	Ov	\N	\N
4079	01-01-2022	2022-01-01 00:00:00	41/191	Outdoor Man	01-01-2022	2022-01-01 00:00:00	41/191	Coenster	52.3229675	5.06415415	tegen paal Lange Muiderweg	Muiden	NH	\N	\N
254	02-03-2011	2011-03-02 00:00:00	7/62	I-accelarate	02-03-2011	2011-03-02 00:00:00		MIA	52.5856972	6.39449406	kastje Balkerweg - Ommerschans, Vinkenbuurt, Ov	Vinkenbuurt	Ov	\N	\N
1795	12-11-2014	2014-11-12 00:00:00	27/70	-juliet-	13-11-2014	2014-11-13 00:00:00	27/70	Bomba	51.8993797	4.48417187	bij roer schip - Maashavenkade	Rotterdam	ZH	\N	\N
3101	03-05-2019	2019-05-03 00:00:00	40/304	Hjerteknuser	03-05-2019	2019-05-03 00:00:00	40/304	ootje	52.4753036	4.6917758	bij TOP de Buitenlanden	Beverwijk	NH	\N	\N
1024		0001-01-01 00:00:00 BC		Spike1982		0001-01-01 00:00:00 BC			\N	\N				\N	\N
653		0001-01-01 00:00:00 BC		blup blup		0001-01-01 00:00:00 BC			\N	\N				\N	\N
2429	18-05-2017	2017-05-18 00:00:00	34/51	Totl	18-05-2017	2017-05-18 00:00:00	34/52	Amauta	53.1381989	6.20880604	in bosje Kloosterweg	Marum	Gr	\N	\N
331	16-04-2011	2011-04-16 00:00:00	9/8	ndeeka	16-04-2011	2011-04-16 00:00:00	9/8	Franko P	51.4357681	4.93173504	hek bij garage - Turnhoutseweg, Baarle-Nassau, NB	Baarle-Hertog/Nassau	NB	\N	\N
1640	17-05-2014	2014-05-17 00:00:00	26/09	BSI	17-05-2014	2014-05-17 00:00:00	26/10	Hasseman	52.4952507	6.58003187	onder brug - Nwe Stroomkanaal	Beerzerveld	Ov	\N	\N
2654	10-03-2018	2018-03-10 00:00:00	37/68	FastEddy	11-03-2018	2018-03-11 00:00:00	37/70	Kato	53.0861893	7.08621883	aan hek Molenweg	Wedde	Gr	\N	\N
780	17-04-2012	2012-04-17 00:00:00	15/35	Bensi	19-04-2012	2012-04-19 00:00:00	15/36	Merc_xtz750	51.7852592	5.93706417	achter Robin Hood - Wylerbaan, Groesbeek, Ge	Groesbeek	Ge	\N	\N
3281	27-10-2019	2019-10-27 00:00:00	40/490	pdv_moto	27-10-2019	2019-10-27 00:00:00	40/490	Coenster	52.0698547	4.2215271	aan perkrand Deltaplein	Kijkduin	ZH	\N	\N
803	19-05-2012	2012-05-19 00:00:00	15/61	Merc_xtz750	19-05-2012	2012-05-19 00:00:00	15/61	rvdh86	51.9394913	6.32206297	bij boompje - Woudlaan, Doetinchem, Ge	Doetinchem	Ge	\N	\N
4393	27-08-2023	2023-08-27 00:00:00	41/386	me-daph	28-08-2023	2023-08-28 00:00:00	41/396	FastEddy	51.9246597	6.24646711	in heg P-terrein Hettenheuvel	Braamt	Ge	\N	\N
4130	21-02-2022	2022-02-21 00:00:00	41/222	BSI	21-02-2022	2022-02-21 00:00:00	41/222	Roeleey	52.1509933	5.56781721	aan slootkant zijweg bij Esso-benzine	Barneveld	Ge	\N	\N
2643	19-02-2018	2018-02-19 00:00:00	37/48	Janhertog	20-02-2018	2018-02-20 00:00:00	37/50	HighKing	52.8063698	6.09490013	tegen ANWP-paal A43/N334	Baars	Ov	\N	\N
1345	06-09-2013	2013-09-06 00:00:00	22/67	Scoot_020/Scoot_2	06-09-2013	2013-09-06 00:00:00	22/68	V-Strommert	52.2914352	4.89964104	aan boom Polderweg	Ouderkerk a/d Amstel	NH	\N	\N
3308	26-11-2019	2019-11-26 00:00:00	40/517	pdv_moto	29-11-2019	2019-11-29 00:00:00	40/518	tdemmer	51.5275002	3.44026899	in bloembak , Markt	Westkapelle	Ze	\N	\N
382	21-05-2011	2011-05-21 00:00:00	9/95	scheurschuimpje	22-05-2011	2011-05-22 00:00:00	9/96	Brummetje	53.2136269	6.56712103	hek Rem. Kerk - Coehoornsingel, Groningen, Gr	Groningen	Gr	\N	\N
4059	01-11-2021	2021-11-01 00:00:00	41/173	ronk	04-11-2021	2021-11-04 00:00:00	41/174	Deeffox	51.8299484	5.08988094	onder steiger aanlegplaats veer Brakel	Vuren	Ge	\N	\N
1403	28-10-2013	2013-10-28 00:00:00	23/56	SadBunny	28-10-2013	2013-10-28 00:00:00	23/56	Scoot_020/Scoot_2	52.377037	4.80926323	bij GSM-mast - Burg. Röellstraat	Amsterdam	NH	\N	\N
356	02-05-2011	2011-05-02 00:00:00	9/46	Motoropoe	02-05-2011	2011-05-02 00:00:00	9/47	Outdoor Man	52.7472305	4.95273113	monument wielen - Schoolstraat, Aartswoude, NH	Aartswoude	NH	\N	\N
3467	22-04-2020	2020-04-22 00:00:00	40/641	pdv_moto	22-04-2020	2020-04-22 00:00:00	40/642	Roeleey	52.0966148	4.30042791	achter bollen ingang gemeentewerf	Den Haag	ZH	\N	\N
839	25-06-2012	2012-06-25 00:00:00	16/10	Maegrim	26-06-2012	2012-06-26 00:00:00	16/11	BSI	51.8454895	6.16604996	aan hek bij grens met Duitsland, Spijk, Ge	Spijk	Ge	\N	\N
3641	27-08-2020	2020-08-27 00:00:00	40/801	Yosra87	27-08-2020	2020-08-27 00:00:00	40/802	HighKing	51.9834824	4.33713818	in bloembak Sadatweg	Delft	ZH	\N	\N
1679	12-07-2014	2014-07-12 00:00:00	26/58	Chakotay	13-07-2014	2014-07-13 00:00:00	26/58	Scoot_020/Scoot_2	52.3407173	4.79191017	aan brugpijler - Langsom	Amsterdam	NH	\N	\N
4371	03-07-2023	2023-07-03 00:00:00	41/382	BSI	04-07-2023	2023-07-04 00:00:00	41/382	Bensi	52.2841797	5.73279715	aan hek bij kapel Slot Staverden	Ermelo	Ge	\N	\N
2510	08-08-2017	2017-08-08 00:00:00	35/43	jaap43	10-08-2017	2017-08-10 00:00:00	35/45	WillyvD	51.7443466	4.64348602	in wilg Polder Oudendijk	Dordrecht	ZH	\N	\N
3466	21-04-2020	2020-04-21 00:00:00	40/640	HermanK	22-04-2020	2020-04-22 00:00:00	40/641	pdv_moto	52.5054855	6.02251101	tegen Gelders gemaal, Geldersedijk	Zalk	Ov	\N	\N
2699	09-04-2018	2018-04-09 00:00:00	38/19	Janhertog	09-04-2018	2018-04-09 00:00:00	38/19	MeanYellowBoy	52.7727509	6.0900321	tegen E-huisje Beulakerweg	Giethoorn	Ov	\N	\N
3559	28-06-2020	2020-06-28 00:00:00	40/717	Nelfrikandel	29-06-2020	2020-06-29 00:00:00	40/718	pdv_moto	51.9818649	4.29641485	aan hekpaal van Wijklaan	de Lier	ZH	\N	\N
3845	25-03-2021	2021-03-25 00:00:00	41/018	Amauta	26-03-2021	2021-03-26 00:00:00	41/019	k0en	52.2475662	6.15496778	tegen hek uiterwaard Ijssel	Deventer	Ov	\N	\N
1815	30-12-2014	2014-12-30 00:00:00	27/91	Phaedrus	31-12-2014	2014-12-31 00:00:00	27/91	Ronald_010	51.8864288	4.52287006	achter muurtje - Molenvliet	Rotterdam	ZH	\N	\N
1616	02-05-2014	2014-05-02 00:00:00	25/89	black mule	02-05-2014	2014-05-02 00:00:00	25/89	Artemecion	52.5224152	5.06618977	bij rode pijp op de Zeevangsedijk	Edam	NH	\N	\N
3798	03-02-2021	2021-02-03 00:00:00	40/929	Coenster	04-02-2021	2021-02-04 00:00:00	40/929	pdv_moto	52.2567787	4.62017822	tegen bord losloopgebied Venneperhout	Nieuw Vennep	NH	\N	\N
2796	25-06-2018	2018-06-25 00:00:00	39/34	BornToReign	25-06-2018	2018-06-25 00:00:00	39/34	Bensi	51.966301	5.78770781	aan ifobord kasteel Doorwerth	Heelsum	Ge	\N	\N
3910	22-05-2021	2021-05-22 00:00:00	41/074	Ronald_010	23-05-2021	2021-05-23 00:00:00	41/075	pdv_moto	52.7758904	6.55782318	in heg bij camping "de Stal", Kanaal-Oz	Drijber	Dr	\N	\N
3938	15-06-2021	2021-06-15 00:00:00	41/094	MeanYellowBoy	16-06-2021	2021-06-16 00:00:00	41/095	HermanK	52.5930557	6.39777517	tegen paal Molenweg	Balkbrug	Ov	\N	\N
3543	11-06-2020	2020-06-11 00:00:00	40/701	ey-dzeej	11-06-2020	2020-06-11 00:00:00	40/702	Picobello BV	51.9665565	4.52147818	onder brug Rottbandreef	Rotterdam	ZH	\N	\N
1081	16-02-2013	2013-02-16 00:00:00	19/09	MotorMieke	16-02-2013	2013-02-16 00:00:00	19/10	Hasseman	52.268261	6.47224522	aan paal dagcamping - Borkeldsweg	Markelo	Ov	\N	\N
4206	05-06-2022	2022-06-05 00:00:00	41/272	FastEddy	12-06-2022	2022-06-12 00:00:00	41/273	Pydejong	53.2971458	6.99909401	bij sluishoofd sluis Lalleweer	Farmsum	Gr	\N	\N
4210	20-06-2022	2022-06-20 00:00:00	41/276	HermanK	21-06-2022	2022-06-21 00:00:00	41/276	BSI	52.4253426	6.332757	aan ANWB-paal Achterkampweg	Raalte	Ov	\N	\N
1889	20-04-2015	2015-04-20 00:00:00	28/58	frankivo	24-04-2015	2015-04-24 00:00:00	28/60	Amauta	52.9936714	6.93979597	aan draaischijf - Museum	Stadskanaal	Gr	\N	\N
1879	11-04-2015	2015-04-11 00:00:00	28/49	Djoost	11-04-2015	2015-04-11 00:00:00	28/50	Scoot_020/Scoot_2	52.4427834	4.83544207	onder trap A. de Kombrug	Zaandam	NH	\N	\N
746	22-03-2012	2012-03-22 00:00:00	14/97	meylie-style	23-03-2012	2012-03-23 00:00:00	14/99	vuurbloed	51.5331039	4.27678585	bij splitsing Beeklaan 25, Halsteren, NB	Halsteren	NB	\N	\N
1006	24-11-2012	2012-11-24 00:00:00	18/12	BSI	25-11-2012	2012-11-25 00:00:00	18/12	magnamaniac	51.848217	5.86952686	aan reling St. Nicolaaskapel	Nijmegen	Ge	\N	\N
220	04-02-2011	2011-02-04 00:00:00	6/82	Hasseman	04-02-2011	2011-02-04 00:00:00	6/84	BSI	52.271389	6.71224403	kwekerij de Border - Twickelerlaan 11, Delden, Ov	Ambt Delden	Ov	\N	\N
1717	19-08-2014	2014-08-19 00:00:00	27/01	Blogem	19-08-2014	2014-08-19 00:00:00	27/02	Dirk130	52.3697968	4.91269588	in bloemperk - Laagte Kadijk	Amsterdam	NH	\N	\N
1121	19-03-2013	2013-03-19 00:00:00	19/61	Roeleey	19-03-2013	2013-03-19 00:00:00	19/61	SadBunny	52.3091202	4.93010092	aan boom Burg. Stramanweg	Amsterdam	NH	\N	\N
3561	29-06-2020	2020-06-29 00:00:00	40/719	Nelfrikandel	29-06-2020	2020-06-29 00:00:00	40/719	Picobello BV	51.9783859	4.42643023	aan hekpost Molenweg 	Berkel en Rodenrijs	ZH	\N	\N
1604	22-04-2014	2014-04-22 00:00:00	25/77	rvdh86	23-04-2014	2014-04-23 00:00:00	25/78	steve_m	52.1237259	5.75783491	aan boompje oorlogsmonument	Harskamp	Ge	\N	\N
4118	08-02-2022	2022-02-08 00:00:00	41/214	pdv_moto	08-02-2022	2022-02-08 00:00:00	41/214	Yosra87	52.0323944	4.17491007	tegen hekpaal Molenslag	Monster	ZH	\N	\N
30	01-09-2010	2010-09-01 00:00:00	2/9	B.B.I.L.	01-09-2010	2010-09-01 00:00:00	2/14	Jeltel	52.9672699	5.96222782	Ijsseldijk 18, Westervoort, Ge	Westervoort	Ge	\N	\N
968	29-10-2012	2012-10-29 00:00:00	17/53	Hasseman	31-10-2012	2012-10-31 00:00:00	17/57	ProSpeed	52.2656593	6.70942688	in heg Watertorenstraat	Ambt Delden	Ov	\N	\N
2652	08-03-2018	2018-03-08 00:00:00	37/65	pdv_moto	09-03-2018	2018-03-09 00:00:00	37/66	Amauta	51.7999115	4.93491507	naast trap fort Altena	Werkendam	NB	\N	\N
2604	25-12-2017	2017-12-25 00:00:00	36/86	-Floris-	27-12-2017	2017-12-27 00:00:00	36/87	pdv_moto	52.7091904	5.72161102	aan boom P-terrein Pilotenweg	Emmeloord	Fl	\N	\N
1110	08-03-2013	2013-03-08 00:00:00	19/43	Buikschuiver oet Dre	10-03-2013	2013-03-10 00:00:00	19/45	BSI	52.7230873	6.24616194	Bij sparwinkel Havelterweg	Ruinerwold	Dr	\N	\N
2154	17-06-2016	2016-06-17 00:00:00	31/27	jaap43	18-06-2016	2016-06-18 00:00:00	31/27	BSI	52.9058151	6.7637701	aan ophaalbrug	Westdorp	Dr	\N	\N
3275	19-10-2019	2019-10-19 00:00:00	40/484	jaap43	19-10-2019	2019-10-19 00:00:00	40/485	ey-dzeej	51.998848	4.55037403	achter E-huisje Rottedijk	Bleiswijk	ZH	\N	\N
823	13-06-2012	2012-06-13 00:00:00	15/86	frankivo	13-06-2012	2012-06-13 00:00:00	15/87	Buuv	52.7264595	6.49313879	E-kast - de V. van Steenwijklaan, Hoogeveen, Dr	Hoogeveen	Dr	\N	\N
405		0001-01-01 00:00:00 BC				0001-01-01 00:00:00 BC		black mule	\N	\N				\N	\N
177	22-12-2010	2010-12-22 00:00:00	5/57	Wimis on	23-12-2010	2010-12-23 00:00:00	5/58	Cynthia1987	51.5636559	5.03328323	achter kastje Oude Warande 1, Tilburg, NB	Tilburg	NB	\N	\N
3974	09-07-2021	2021-07-09 00:00:00	41/119	BSI	09-07-2021	2021-07-09 00:00:00	41/120	gieli0	52.1591492	5.38540077	in heg bij Stoney stuw, Grote Spui	Amersfoort	Ut	\N	\N
1045	05-01-2013	2013-01-05 00:00:00	18/52	tdemmer	05-01-2013	2013-01-05 00:00:00	18/52	Ronald_010	51.9675865	4.51519299	in boom Bergscheplas	Bergschenhoek	ZH	\N	\N
68	27-09-2010	2010-09-27 00:00:00	3/18	BaRRt	27-09-2010	2010-09-27 00:00:00	3/19	Wimis on	52.1759567	5.19872713	camping Karnemelksweg, Hollandse Rading, Ut	Hollandse Rading	Ut	\N	\N
3008	05-02-2019	2019-02-05 00:00:00	40/199	HighKing	06-02-2019	2019-02-06 00:00:00	40/200	Hjerteknuser	52.4648361	4.65315723	aan hek ventilatiegebouw Velsertunnel	Velsen-Noord	NH	\N	\N
1692	20-07-2014	2014-07-20 00:00:00	26/70	Corney28	21-07-2014	2014-07-21 00:00:00	26/71	Bomba	52.2165604	4.93284988	aan lantaarnpaal - Kloosterplein	Vinkeveen	Ut	\N	\N
945	08-10-2012	2012-10-08 00:00:00	17/26	Bar-E	08-10-2012	2012-10-08 00:00:00	17/27	tdemmer	51.860939	4.35046005	aan deur Goede Verwachtinghof	Hoogvliet	ZH	\N	\N
4033	19-09-2021	2021-09-19 00:00:00	41/156	Outdoor Man	22-09-2021	2021-09-22 00:00:00	41/157	Amauta	52.9013786	5.05823421	aan poot uitkijktoren Robbenbos	Wieringerwerf	NH	\N	\N
2167	03-07-2016	2016-07-03 00:00:00	31/40	Ronald_010	07-07-2016	2016-07-07 00:00:00	31/41	Motormuisje_alice	51.8201752	4.12893105	in struik restaurant Aquarius	Hellevoetsluis	ZH	\N	\N
1700	25-07-2014	2014-07-25 00:00:00	26/78	jaap43	26-07-2014	2014-07-26 00:00:00	26/79	MLB	51.4689598	5.89074707	achter muur Duitsereveld	Ysselsteyn	Li	\N	\N
2067	09-02-2016	2016-02-09 00:00:00	30/26	Fuck Het Milieu	10-02-2016	2016-02-10 00:00:00	30/27	ArendJan	51.918293	4.40276289	aan ruine Broersvest	Schiedam	ZH	\N	\N
57	21-09-2010	2010-09-21 00:00:00	2/97	ninanoob	21-09-2010	2010-09-21 00:00:00	2/97	Ukkie	52.3381195	5.13808298	slagboom IJmeerdijk, Almere, Fl	Almere	Fl	\N	\N
186	05-01-2011	2011-01-05 00:00:00	5/81	Buikschuiver oet Dre	06-01-2011	2011-01-06 00:00:00	5/83	Smuiger	52.876255	6.22651196	hut recreatieterrein Storklaan, Vledder, Dr	Vledder	Dr	\N	\N
441	23-06-2011	2011-06-23 00:00:00	10/77	Scoot_020/Scoot_2	23-06-2011	2011-06-23 00:00:00	10/78	Outdoor Man	52.3658104	4.82656288	onder kunstwerk Oostoever, Amsterdam, NH	Amsterdam	NH	\N	\N
431	13-06-2011	2011-06-13 00:00:00	10/58	MotorMieke	14-06-2011	2011-06-14 00:00:00	10/58	fien	52.382103	6.51095486	bij schaapsstal - Dalkruid, Nijverdal, Ov	Nijverdal	Ov	\N	\N
4234	24-08-2022	2022-08-24 00:00:00	41/293	WillyvD	26-08-2022	2022-08-26 00:00:00	41/294	Deeffox	51.8739433	4.55105209	aan paal hek Pesetastraat	Ridderkerk	ZH	\N	\N
4318	10-04-2023	2023-04-10 00:00:00	41/347	k0en	10-04-2023	2023-04-10 00:00:00	41/347	Hans89	51.8948746	4.50777817	tegen kerktoren Hillevliet	Rotterdam	ZH	\N	\N
3772	19-12-2020	2020-12-19 00:00:00	40/906	Hans89	20-12-2020	2020-12-20 00:00:00	40/906	ey-dzeej	51.9078903	4.45001411	in struik bij stanbeeld Piet Hein	Rotterdam	ZH	\N	\N
701	09-02-2012	2012-02-09 00:00:00	14/42	Buikschuiver oet Dre	10-02-2012	2012-02-10 00:00:00	14/42	scheurschuimpje	52.6843491	6.00201893	bij huisje P-plaats - Leeuwte, St. Jansklooster, Ov	St.Jansklooster	Ov	\N	\N
1882	12-04-2015	2015-04-12 00:00:00	28/51	JurgenT	13-04-2015	2015-04-13 00:00:00	28/52	Janhertog	52.0985527	6.27886581	in bord bij P-terrein - Baakseweg	Vorden	Ge	\N	\N
2533	31-08-2017	2017-08-31 00:00:00	35/77	Scoot_020/Scoot_2	01-09-2017	2017-09-01 00:00:00	35/78	Djoost	52.4221878	5.23076677	tegen kunstwerk Oostvaardersdijk	Almere	Fl	\N	\N
2150	11-06-2016	2016-06-11 00:00:00	31/23	SadBunny	11-06-2016	2016-06-11 00:00:00	31/24	Amauta	52.322506	4.89333487	aan voetbrug Kaljeslaan	Amsterdam	NH	\N	\N
4138	01-03-2022	2022-03-01 00:00:00	41/226	HermanK	02-03-2022	2022-03-02 00:00:00	41/227	BSI	52.6224098	6.19349813	tegen poot van blauwe bank	Rouveen	Ov	\N	\N
3800	05-02-2021	2021-02-05 00:00:00	40/931	Picobello BV	05-02-2021	2021-02-05 00:00:00	40/931	Coenster	52.2929153	4.5163269	bij hemaaltje Duinschooten	Noordwijk	ZH	\N	\N
169		0001-01-01 00:00:00 BC				0001-01-01 00:00:00 BC		BigJim	\N	\N				\N	\N
2512	11-08-2017	2017-08-11 00:00:00	35/46	jaap43	11-08-2017	2017-08-11 00:00:00	35/47	bikedan	51.8637886	4.3122139	aan hekpaal Brielse Maasdijk	Spijkenisse	ZH	\N	\N
3840	21-03-2021	2021-03-21 00:00:00	41/014	Ronald_010	23-03-2021	2021-03-23 00:00:00	41/015	Outdoor Man	51.5970459	6.02431297	in 4e knotwilg Staaiweg	Vierlingsbeek	NB	\N	\N
3638	21-08-2020	2020-08-21 00:00:00	40/797	k0en	22-08-2020	2020-08-22 00:00:00	40/797	pdv_moto	52.1053352	5.07773209	tegen boomperk Keulsekade	Utrecht	Ut	\N	\N
2716	19-04-2018	2018-04-19 00:00:00	38/42	aisnoek	19-04-2018	2018-04-19 00:00:00	38/42	HermanK	52.5628815	6.39613199	in hoek P-terrein Triangel	Witharen	Ov	\N	\N
1603	21-04-2014	2014-04-21 00:00:00	25/76	Sjantaalfoutje	22-04-2014	2014-04-22 00:00:00	25/77	rvdh86	52.1640244	6.07803106	in boom Kopermolenweg	Klarenbeek	Ge	\N	\N
2958	16-12-2018	2018-12-16 00:00:00	40/130	pdv_moto	18-12-2018	2018-12-18 00:00:00	40/131	DKP	52.0853195	4.29150486	tegen struik, Groothertoginnelaan	Den Haag	ZH	\N	\N
2178	22-07-2016	2016-07-22 00:00:00	31/53	Coenster	23-07-2016	2016-07-23 00:00:00	31/53	Rik60NL	52.2722015	4.54437494	bij stalen pijp P-terrein Keukenhof	Lisse	ZH	\N	\N
2511	10-08-2017	2017-08-10 00:00:00	35/46	WillyvD	11-08-2017	2017-08-11 00:00:00	35/46	jaap43	51.9760132	4.53342581	tegen boom - Hoeksekade	Bergschenhoek	ZH	\N	\N
4372	04-07-2023	2023-07-04 00:00:00	41/383	Bensi	09-07-2023	2023-07-09 00:00:00	41/384	Outdoor Man	52.0026855	6.3648138	achterschakelkastje Stikkenweg	Zelhem	Ge	\N	\N
2972	28-12-2018	2018-12-28 00:00:00	40/146	pdv_moto	28-12-2018	2018-12-28 00:00:00	40/146	Roeleey	52.2744637	4.97042418	achter bootje Amsterdamsestraatweg	Abcoude	Ut	\N	\N
3059	29-03-2019	2019-03-29 00:00:00	40/256	Rik60NL	30-03-2019	2019-03-30 00:00:00	40/257	Coenster	52.1675415	4.9311018	onder boomstam Recreatie de Geer	Kockengen	ZH	\N	\N
1531	28-02-2014	2014-02-28 00:00:00	25/04	Dirk130	28-02-2014	2014-02-28 00:00:00	25/04	Ronald_010	52.0410843	4.35309505	onder reclamebord Ypenburg	Den Haag	NH	\N	\N
1410	06-11-2013	2013-11-06 00:00:00	23/65	V-Strommert	06-11-2013	2013-11-06 00:00:00	23/66	BSI	52.2855797	4.84905291	aan Shooting Star - Beneluxbaan	Amstelveen	NH	\N	\N
1811	21-12-2014	2014-12-21 00:00:00	27/86	Bludge	23-12-2014	2014-12-23 00:00:00	27/87	Ronald_010	51.9588699	6.02959204	aan beschoeiing langs E35	Duiven	Ge	\N	\N
4129	20-02-2022	2022-02-20 00:00:00	41/222	SadBunny	21-02-2022	2022-02-21 00:00:00	41/222	BSI	52.272213	5.7687192	achter boom Schaarweg/Weideweg	Elspeet	Ge	\N	\N
380	19-05-2011	2011-05-19 00:00:00	9/89	BSI	20-05-2011	2011-05-20 00:00:00	9/91	Richard117	52.1708755	5.62817383	landingsboot - Grote Bosweg, Voorthuizen, Ge	Voorthuizen	Ge	\N	\N
2256	30-09-2016	2016-09-30 00:00:00	32/39	Janhertog	30-09-2016	2016-09-30 00:00:00	32/40	Amauta	52.3990822	6.7819519	aan boom bij rotonde N745	Tubbergen	Ov	\N	\N
2495	23-07-2017	2017-07-23 00:00:00	35/26	Rik60NL	23-07-2017	2017-07-23 00:00:00	35/26	Amauta	52.1791153	4.93660784	tegen paaltje Hoorenmolenweg	Wilnis	Ut	\N	\N
742	18-03-2012	2012-03-18 00:00:00	14/94	tdemmer	18-03-2012	2012-03-18 00:00:00	14/94	Ronald_010	51.921608	5.00719595	Picknickplek Kleine Kanaaldijk, Meerkerk, ZH	Meerkerk	ZH	\N	\N
2655	11-03-2018	2018-03-11 00:00:00	37/70	Kato	11-03-2018	2018-03-11 00:00:00	37/72	Ronny Rabbelaar	53.0517693	6.55448914	in struik bij Tjasker "Veenmeester"	Zeijen	Dr	\N	\N
3717	23-10-2020	2020-10-23 00:00:00	40/859	Hans89	25-10-2020	2020-10-25 00:00:00	40/860	pdv_moto	51.9699898	4.01422501	tegen vangrail bij vuurtoren Europaweg	Rotterdam	ZH	\N	\N
3343	01-01-2020	2020-01-01 00:00:00	40/541	Picobello BV	01-01-2020	2020-01-01 00:00:00	40/541	pdv_moto	51.9288826	4.47331715	in bloembak Schiekade	Rotterdam	ZH	\N	\N
493	10-08-2011	2011-08-10 00:00:00	11/43	Paul Hewson	10-08-2011	2011-08-10 00:00:00	11/43	Bensi	52.2402496	6.44301224	aan paaltje Brummellaarsweg, Markelo, Ov	Markelo	Ov	\N	\N
782	20-04-2012	2012-04-20 00:00:00	15/37	Hasseman	20-04-2012	2012-04-20 00:00:00	15/38	fien	52.2959557	6.68742085	achter huisje Blokstegenweg, Ambt Delden, Ov	Ambt Delden	Ov	\N	\N
2472	28-06-2017	2017-06-28 00:00:00	34/96	Rik60NL	29-06-2017	2017-06-29 00:00:00	34/98	DKP	52.2029114	4.83166981	achter E-kast Schattekerkerweg	Mijdrecht	Ut	\N	\N
447	27-06-2011	2011-06-27 00:00:00	10/83	Outdoor Man	28-06-2011	2011-06-28 00:00:00	10/85	BSI	51.9941826	5.84696102	achter kruis Airborn Cemetry, Oosterbeek, Ge	Oosterbeek	Ge	\N	\N
927	18-09-2012	2012-09-18 00:00:00	17/05	fien	19-09-2012	2012-09-19 00:00:00	17/05	Hasseman	52.2425995	6.75529909	aan boom Albersdijk	Hengelo	Ov	\N	\N
3965	02-07-2021	2021-07-02 00:00:00	41/114	pdv_moto	05-07-2021	2021-07-05 00:00:00	41/115	Outdoor Man	51.5306549	3.4659729	aan poot plaatsnaambord Poppekerke	Westkapelle	Ze	\N	\N
138	14-11-2010	2010-11-14 00:00:00	4/85	V-Strommert	15-11-2010	2010-11-15 00:00:00	4/88	jaap43	52.1985893	4.61440802	A4 - rotonde eind afslag 5, Roelofarendsveen, ZH	Roelofarendsveen	ZH	\N	\N
872		0001-01-01 00:00:00 BC		K-jos		0001-01-01 00:00:00 BC			\N	\N				\N	\N
3695	08-10-2020	2020-10-08 00:00:00	40/843	Roeleey	08-10-2020	2020-10-08 00:00:00	40/843	Outdoor Man	52.277523	4.79000187	tegen E-kast Machineweg	Aalsmeer	NH	\N	\N
1548	10-03-2014	2014-03-10 00:00:00	25/18	jaap43	10-03-2014	2014-03-10 00:00:00	25/19	-juliet-	51.802372	4.28359604	aan e-kast eind Noordweg	Goudswaard	ZH	\N	\N
3858	01-04-2021	2021-04-01 00:00:00	41/027	Amauta	01-04-2021	2021-04-01 00:00:00	41/028	HermanK	52.3244438	5.51708889	in boot Snijers, rotonde	Zeewolde	Fl	\N	\N
2109	03-05-2016	2016-05-03 00:00:00	30/81	Corney28	03-05-2016	2016-05-03 00:00:00	30/81	Roeleey	52.4056244	4.89215279	aan zijn motor - Klaprozenweg	Amsterdam	NH	\N	\N
887	07-08-2012	2012-08-07 00:00:00	16/67	Ronald_010	07-08-2012	2012-08-07 00:00:00	16/67	tdemmer	51.9347916	3.97825193	aan hek strandweg 2e Maasvlakte	Rotterdam	ZH	\N	\N
88	08-10-2010	2010-10-08 00:00:00	3/55	dopey'85	08-10-2010	2010-10-08 00:00:00	3/57	Quark	51.4091034	5.48634911	St. Joris internaat Eikenburglaan, Eindhoven, NB	Eindhoven	NB	\N	\N
3658	08-09-2020	2020-09-08 00:00:00	40/814	Hasseman	09-09-2020	2020-09-09 00:00:00	40/815	FastEddy	52.3233681	6.62894487	tegen brugpijler Broesegge	Bornerbroek	Ov	\N	\N
2295	25-11-2016	2016-11-25 00:00:00	33/04	PatrickSoler	25-11-2016	2016-11-25 00:00:00	33/04	Scoot_020/Scoot_2	52.433567	4.81474495	onder bruggetje - Houtveldweg	Zaandam	NH	\N	\N
314	07-04-2011	2011-04-07 00:00:00	8/76	Outdoor Man	08-04-2011	2011-04-08 00:00:00	8/79	wesleyc	52.3052368	5.09254122	achter klaphek Visserijpad/Keversdijk, Weesp, NH	Weesp	NH	\N	\N
3757	26-11-2020	2020-11-26 00:00:00	40/892	FastEddy	27-11-2020	2020-11-27 00:00:00	40/893	Amauta	53.0530014	7.07598686	onder houten bouwsel Veelerweg	Onstwedde	Gr	\N	\N
2008	06-09-2015	2015-09-06 00:00:00	29/60	pdv_moto	09-09-2015	2015-09-09 00:00:00	29/61	-Floris-	51.5681953	3.52375197	achter witte zuil - kasteel Westhove	Domburg	Ze	\N	\N
3410	11-03-2020	2020-03-11 00:00:00	40/589	Picobello BV	11-03-2020	2020-03-11 00:00:00	40/589	Outdoor Man	51.9132156	4.26432323	aan boom P-terrein Scouting Paulusgroep	Maassluis	ZH	\N	\N
2149	09-06-2016	2016-06-09 00:00:00	31/22	BSI	10-06-2016	2016-06-10 00:00:00	31/23	SadBunny	51.6931725	4.64535379	aan lantaarnpaal - Steenweg	Moerdijk	NB	\N	\N
1377	01-10-2013	2013-10-01 00:00:00	23/20	mr Q	01-10-2013	2013-10-01 00:00:00	23/22	Wimis on	52.1940498	5.15419579	bij eettent Noodweg/Egelshoek	Hilversum	Ut	\N	\N
1465	07-01-2014	2014-01-07 00:00:00	24/25	Vins111	07-01-2014	2014-01-07 00:00:00	24/25	Wimis on	52.1031685	5.19715786	tussen stammen - De Holle Bilt	de Bilt	Ut	\N	\N
4257	22-10-2022	2022-10-22 00:00:00	41/305	Outdoor Man	26-10-2022	2022-10-26 00:00:00	41/306	Deeffox	51.8843689	5.31660223	aan plaatsnaambord Lingedijk	Geldermalsen	Ge	\N	\N
1539	05-03-2014	2014-03-05 00:00:00	25/10	Dirtbag	06-03-2014	2014-03-06 00:00:00	25/11	Smuiger	52.2715836	6.10600519	in molensteen - Wijkseweg	Terwolde	Ge	\N	\N
2653	09-03-2018	2018-03-09 00:00:00	37/66	Amauta	10-03-2018	2018-03-10 00:00:00	37/67	FastEddy	53.0667763	6.46122599	aan kooi v/d Draak, Kerkpad/Brink	Norg	Dr	\N	\N
3133	02-06-2019	2019-06-02 00:00:00	40/345	Okami_Xci	03-06-2019	2019-06-03 00:00:00	40/346	Sjefman	51.4008331	6.2108922	aan paal grensbord Wesselseweg	Venlo	Li	\N	\N
1838	13-02-2015	2015-02-13 00:00:00	28/12	-juliet-	14-02-2015	2015-02-14 00:00:00	28/12	Ronald_010	51.9995766	4.36877394	aan boomstomp - Leeghwaterstraat	Delft	ZH	\N	\N
1216	18-05-2013	2013-05-18 00:00:00	20/95	evolver86	19-05-2013	2013-05-19 00:00:00	20/96	bikedan	51.6114273	5.06509876	op P-plaats Cirkelbaan	Loon op Zand	NB	\N	\N
3566	01-07-2020	2020-07-01 00:00:00	40/721	pdv_moto	01-07-2020	2020-07-01 00:00:00	40/722	Picobello BV	51.9970245	4.13178778	in struik p-plaats Nieuwlandsedijk	s-Gravezande	ZH	\N	\N
3194	06-08-2019	2019-08-06 00:00:00	40/409	BSI	06-08-2019	2019-08-06 00:00:00	40/409	Marsian	52.229847	5.39404821	in struik bij TOP de Kooi	Bunschoten	Ut	\N	\N
1478	16-01-2014	2014-01-16 00:00:00	24/41	Roeleey	16-01-2014	2014-01-16 00:00:00	24/41	Blogem	52.3818817	4.886271	in plantenbak - Brouwersgracht	Amsterdam	NH	\N	\N
2431	19-05-2017	2017-05-19 00:00:00	34/53	frankivo	21-05-2017	2017-05-21 00:00:00	34/54	BSI	51.5739594	5.95744991	aan boom ingang kerkhof	Overloon	NB	\N	\N
987	11-11-2012	2012-11-11 00:00:00	17/82	V-Strommert	11-11-2012	2012-11-11 00:00:00	17/83	Outdoor Man	52.3469162	4.6728878	bij Wilhelminalinde - Spieringweg	Vijfhuizen	NH	\N	\N
972	02-11-2012	2012-11-02 00:00:00	17/61	nannol	02-11-2012	2012-11-02 00:00:00	17/62	Directeur	53.0522614	6.99630022	op P-paats Iepenlaan	Alteveer	Gr	\N	\N
2066	09-02-2016	2016-02-09 00:00:00	30/26	Meifesto	09-02-2016	2016-02-09 00:00:00	30/26	Fuck Het Milieu	51.8709106	4.56827307	aan slootkant Krommeweg	Ridderkerk	ZH	\N	\N
2190	31-07-2016	2016-07-31 00:00:00	31/64	bikedan	01-08-2016	2016-08-01 00:00:00	31/65	nixor	51.4561424	4.30265093	aan paaltje - Vossenweg	Hoogerheide	NB	\N	\N
3295	03-11-2019	2019-11-03 00:00:00	50/501	ey-dzeej	04-11-2019	2019-11-04 00:00:00	40/502	Bensi	51.9168816	6.34874296	aan paaltje bij brug Oude Ijssel	Zetten	Ge	\N	\N
1321	22-08-2013	2013-08-22 00:00:00	22/36	Corney28	23-08-2013	2013-08-23 00:00:00	22/37	Bludge	53.162838	4.82051992	aan paal Strandwacht paal 28	de Cocksdorp	NH	\N	\N
2224	01-09-2016	2016-09-01 00:00:00	31/99	ootje	02-09-2016	2016-09-02 00:00:00	32/01	Bigtwim	52.4213028	4.6917491	aan vangrail St. Aagtendijk	Beverwijk	NH	\N	\N
957	20-10-2012	2012-10-20 00:00:00	17/42	Ronald_010	20-10-2012	2012-10-20 00:00:00	17/43	Meifesto	51.9188042	4.25645399	aan bankje bij molen - Zuiddijk	Maassluis	ZH	\N	\N
1614	02-05-2014	2014-05-02 00:00:00	25/89	Corney28	02-05-2014	2014-05-02 00:00:00	25/89	Bigtwim	52.5223656	5.06561708	onder tentflap camping de Dijk	Edam	NH	\N	\N
926	18-09-2012	2012-09-18 00:00:00	17/04	Hasseman	18-09-2012	2012-09-18 00:00:00	17/05	fien	52.2615395	6.78082323	in holle boom - Julianalaan	Hengelo	Ov	\N	\N
2279	23-10-2016	2016-10-23 00:00:00	32/73	Amauta	26-10-2016	2016-10-26 00:00:00	32/75	frankivo	53.2146454	6.50062799	aan lantaarnpaal Fabriekslaan	Groningen	Gr	\N	\N
2887	01-09-2018	2018-09-01 00:00:00	40/42	FastEddy	01-09-2018	2018-09-01 00:00:00	40/42	BSI	53.0928841	7.10114479	bij paal rooster gemaal, Bisschopsweg	Vriescheloo	Gr	\N	\N
362	06-05-2011	2011-05-06 00:00:00	9/56	tdemmer	07-05-2011	2011-05-07 00:00:00	9/58	Ruppert	51.8311234	5.28807688	bij steigertje - Waalbandijk, Neerijnen, Ge	Neerijnen	Ge	\N	\N
1344	06-09-2013	2013-09-06 00:00:00	22/67	Corney28	06-09-2013	2013-09-06 00:00:00	22/67	Scoot_020/Scoot_2	52.3469734	4.91843605	 	Amsterdam	NH	\N	\N
3713	22-10-2020	2020-10-22 00:00:00	40/857	HighKing	22-10-2020	2020-10-22 00:00:00	40/857	ootje	52.5147858	4.67228079	tegen boom Bachstraat	Heemskerk	NH	\N	\N
931	21-09-2012	2012-09-21 00:00:00	17/08	magnamaniac	22-09-2012	2012-09-22 00:00:00	17/09	BSI	51.902977	5.63883495	onder platen - Waalbandijk	Doodewaard	Ge	\N	\N
900	13-08-2012	2012-08-13 00:00:00	16/77	rvdh86	17-08-2012	2012-08-17 00:00:00	16/79	Phaedrus	52.3701668	5.81683302	achter bankje Eperweg	Nunspeet	Ge	\N	\N
1788	08-11-2014	2014-11-08 00:00:00	27/65	-juliet-	09-11-2014	2014-11-09 00:00:00	27/66	Djoost	52.9805298	5.93932295	aan betonnen paaltje - Mars 26	Heerenveen	Fr	\N	\N
1220	23-05-2013	2013-05-23 00:00:00	21/05	MotorMieke	26-05-2013	2013-05-26 00:00:00	21/07	DKP	52.4363823	6.44587994	in boomstoel - Zuid-Kanaaldijk	Hellendoorn	Ov	\N	\N
3760	05-12-2020	2020-12-05 00:00:00	40/896	Amauta	05-12-2020	2020-12-05 00:00:00	40/896	FastEddy	53.1778984	7.05289984	onder steiger in Oldambtmeer	Oldambt	Gr	\N	\N
3918	02-06-2021	2021-06-02 00:00:00	41/082	Outdoor Man	02-06-2021	2021-06-02 00:00:00	41/082	BigJim	52.6644516	4.79939318	in hek bij Twuyvermolen	Sint Pancras	NH	\N	\N
922	15-09-2012	2012-09-15 00:00:00	17/01	ootje	16-09-2012	2012-09-16 00:00:00	17/01	Bigtwim	52.7542038	4.6816678	in schotbalkenhuisje	Burgerbrug	NH	\N	\N
3199	08-08-2019	2019-08-08 00:00:00	40/414	pdv_moto	08-08-2019	2019-08-08 00:00:00	40/416	Mitssz	52.0060425	6.33393288	achter E-kast rotonde Hummeloseweg	Zelhem	Ge	\N	\N
2345	28-02-2017	2017-02-28 00:00:00	33/67	pdv_moto	01-03-2017	2017-03-01 00:00:00	33/68	Amauta	52.0982513	4.30404806	aan boom St. Hubertusweg	Den Haag	ZH	\N	\N
1613	01-05-2014	2014-05-01 00:00:00	25/87	SadBunny	01-05-2014	2014-05-01 00:00:00	25/88	Corney28	52.3893776	4.85991478	bij voetpad - Spaarndammerdijk	Amsterdam	NH	\N	\N
2797	26-06-2018	2018-06-26 00:00:00	39/36	Bensi	26-06-2018	2018-06-26 00:00:00	39/36	MeanYellowBoy	52.1473312	6.20456123	bij beeld Philip Sidny, Coehoornsingel	Zutphen	Ge	\N	\N
1599	19-04-2014	2014-04-19 00:00:00	25/73	Hans89	19-04-2014	2014-04-19 00:00:00	25/74	bikedan	51.4986343	3.6677959	in band van trailer - Kanaaldijk	Arnemuiden	Ze	\N	\N
2046	25-12-2015	2015-12-25 00:00:00	30/09	pdv_moto	28-12-2015	2015-12-28 00:00:00	30/10	wesleyc	51.9877205	4.11754322	in bosje Strandboulevard	Hoek van Holland	ZH	\N	\N
2791	21-06-2018	2018-06-21 00:00:00	39/27	MP_NL	22-06-2018	2018-06-22 00:00:00	39/28	Bensi	52.2400398	6.84204292	in heg bij Gouden Bol, Capitool	Enschede	Ov	\N	\N
3873	13-04-2021	2021-04-13 00:00:00	41/039	HermanK	13-04-2021	2021-04-13 00:00:00	41/039	MeanYellowBoy	52.5627975	6.3890481	in vogelhuisje Olde Veneweg	Witharen	Ov	\N	\N
890	08-08-2012	2012-08-08 00:00:00	16/68	Ronald_010	09-08-2012	2012-08-09 00:00:00	16/69	tdemmer	51.8079681	4.59181786	aan paal 800 - Lindtsedijk	Zwijndrecht	ZH	\N	\N
2880	24-08-2018	2018-08-24 00:00:00	40/32	HighKing	24-08-2018	2018-08-24 00:00:00	40/32	HermanK	52.3288803	5.1098032	tegen spiegel i Echobos, Dijkweg	Muiderberg	NH	\N	\N
100	20-10-2010	2010-10-20 00:00:00	3/84	Wimis on	20-10-2010	2010-10-20 00:00:00	3/85	rutgertjuh	51.9634399	5.28107595	pontje Veerweg, Beusichem, Ut	Beusichem	Ut	\N	\N
2983	04-01-2019	2019-01-04 00:00:00	40/161	Ronny Rabbelaar	04-01-2019	2019-01-04 00:00:00	40/161	FastEddy	53.353302	6.86213684	onder afvalvat, Krewerderweg	Holwierde	Gr	\N	\N
3878	14-04-2021	2021-04-14 00:00:00	41/042	MeanYellowBoy	14-04-2021	2021-04-14 00:00:00	41/043	HermanK	52.6001549	6.3966651	in heeg bij paadje de Omloop	Balkbrug	Ov	\N	\N
3453	12-04-2020	2020-04-12 00:00:00	40/629	Outdoor Man	13-04-2020	2020-04-13 00:00:00	40/630	pdv_moto	52.3046036	5.19420004	achter boomstronk Oud Valkeveen	Naarden	NH	\N	\N
4423	03-11-2023	2023-11-03 00:00:00	41/415	ootje	04-11-2023	2023-11-04 00:00:00	41/415	Outdoor Man	52.4684639	4.78935099	aan steigerpaal 443 Guirpad	Westzaan	NH	\N	\N
1001	21-11-2012	2012-11-21 00:00:00	18/05	Smuiger	21-11-2012	2012-11-21 00:00:00	18/05	Bigtwim	52.4630775	4.81137323	aan paal van brug	Koog aan de Zaan	NH	\N	\N
163	10-12-2010	2010-12-10 00:00:00	5/36	V-Strommert	12-12-2010	2010-12-12 00:00:00	5/38	Wimis on	52.2487488	4.75734806	fort Kuddelstaartseweg, Kuddelstaart, NH	Kudelstaart	NH	\N	\N
3156	02-07-2019	2019-07-02 00:00:00	40/373	Deeffox	02-07-2019	2019-07-02 00:00:00	40/374	Coenster	51.7996674	4.93229389	onder kunstwerk Fort Altena	Werkendam	NB	\N	\N
2905	17-09-2018	2018-09-17 00:00:00	40/59	pdv_moto	18-09-2018	2018-09-18 00:00:00	40/60	Coenster	52.0784187	4.56685305	aan voet van boom Hoogeveenseweg	Hazerswoude-Dorp	ZH	\N	\N
1857	06-03-2015	2015-03-06 00:00:00	28/24	BSI	08-03-2015	2015-03-08 00:00:00	28/25	Bensi	52.2515678	6.4223218	aan boomstronk Beusebergerweg	Holten	Ov	\N	\N
3481	30-04-2020	2020-04-30 00:00:00	40/651	frankivo	30-04-2020	2020-04-30 00:00:00	40/652	FastEddy	52.9723015	6.88425112	tegen achterwiel reclamewagen	Drouwenermond	Dr	\N	\N
396	31-05-2011	2011-05-31 00:00:00	10/20	Dirk130	31-05-2011	2011-05-31 00:00:00	10/22	BSI	52.179203	4.62253523	bankje bij Veendermolen, Roelofarendsveen, ZH	Roelofarendsveen	ZH	\N	\N
1445	16-12-2013	2013-12-16 00:00:00	24/05	BSI	17-12-2013	2013-12-17 00:00:00	24/06	Corney28	52.3440285	4.85037518	in houten palisade Parkeiland	Amsterdam	NH	\N	\N
1918	17-05-2015	2015-05-17 00:00:00	28/81	Bensi	22-05-2015	2015-05-22 00:00:00	28/83	Amauta	52.1484184	6.30262184	achter E-kast - Lage Lochemseweg	Warnsveld	Ge	\N	\N
2869	19-08-2018	2018-08-19 00:00:00	40/22	Roeleey	19-08-2018	2018-08-19 00:00:00	40/22	Outdoor Man	52.2810555	4.95812988	in knotwilg langs Hogendijk	Amsterdam	NH	\N	\N
4218	13-07-2022	2022-07-13 00:00:00	41/280	BSI	13-07-2022	2022-07-13 00:00:00	41/280	Hans89	51.8232994	4.13356209	in heg bij rode lichtboei Kanaalweg Wz	Hellevoetsluis	ZH	\N	\N
1437	08-12-2013	2013-12-08 00:00:00	23/96	BSI	08-12-2013	2013-12-08 00:00:00	23/96	Sjantaalfoutje	52.0618362	5.64853907	aan hek bij Doesburger molen	Ede	Ge	\N	\N
2025	08-10-2015	2015-10-08 00:00:00	29/78	Hans89	09-10-2015	2015-10-09 00:00:00	29/79	tdemmer	51.9169235	4.57867193	aan infobord Algerastuw	Capelle aan den Ijssel	ZH	\N	\N
4041	03-10-2021	2021-10-03 00:00:00	41/162	Outdoor Man	04-10-2021	2021-10-04 00:00:00	41/163	k0en	52.3185806	4.87190819	in heg P-terrein prof. J.H. Barinklaan	Amstelveen	NH	\N	\N
779	16-04-2012	2012-04-16 00:00:00	15/34	Shadowski	17-04-2012	2012-04-17 00:00:00	15/35	Bensi	51.9347801	5.94274807	achter heg Dominicanerklooster, Huissen, Ge	Huissen	Ge	\N	\N
129	07-11-2010	2010-11-07 00:00:00	4/58	tdemmer	07-11-2010	2010-11-07 00:00:00	4/59	jean99	51.7647705	4.77929688	uitzichtpunt Petrusplaat, Biesbosch, NB	Biesbosch	NB	\N	\N
4321	14-04-2023	2023-04-14 00:00:00	41/348	BSI	15-04-2023	2023-04-15 00:00:00	41/349	Pydejong	52.5735397	6.08308697	aan hekpost rotonde Hasseltseweg	Hasselt	Ov	\N	\N
4252	08-10-2022	2022-10-08 00:00:00	41/302	Ronald_010	10-10-2022	2022-10-10 00:00:00	41/303	Outdoor Man	51.3935051	5.98109722	aan boom ingang P-terrein Toverland	Sevenum	Li	\N	\N
37	06-09-2010	2010-09-06 00:00:00	2/45	DutchKingKong	06-09-2010	2010-09-06 00:00:00	2/46	smoffler	51.7703629	5.0259552	Eendenveld 3, Giessen, NB 	Giessen	NB	\N	\N
2831	25-07-2018	2018-07-25 00:00:00	39/80	HighKing	25-07-2018	2018-07-25 00:00:00	39/81	Roeleey	52.5054359	4.68404913	in heg plantsoen P-terrein StayOkay	Heemstede	ZH	\N	\N
2085	26-03-2016	2016-03-26 00:00:00	30/49	BSI	27-03-2016	2016-03-27 00:00:00	30/50	Rainbow600	50.8610268	5.82352304	bij monument Cauberg	Valkenburg	Li	\N	\N
99	19-10-2010	2010-10-19 00:00:00	3/81	ootje	19-10-2010	2010-10-19 00:00:00	3/82	Wimis on	52.5787086	4.68141985	spoorwegovergang Westerweg, Limmen, NH	Limmen	NH	\N	\N
4386	06-08-2023	2023-08-06 00:00:00	41/392	Ronny Rabbelaar	14-08-2023	2023-08-14 00:00:00	41/393	BSI	52.9443436	5.40345907	tegen muurtje De Hylper Marjtplaat	Hindelopen	Fr	\N	\N
3445	06-04-2020	2020-04-06 00:00:00	40/623	FastEddy	07-04-2020	2020-04-07 00:00:00	40/624	frankivo	53.2169876	6.80532694	aan toegangshek P3 Noorderweg	Slochteren	Gr	\N	\N
267	12-03-2011	2011-03-12 00:00:00	7/90	BSI	12-03-2011	2011-03-12 00:00:00	7/92	bakfiets1	51.2155685	3.94689798	grenspaal 293 - Kloosterweg, Koewacht, Ze	Koewacht	Ze	\N	\N
3211	15-08-2019	2019-08-15 00:00:00	40/426	Hans89	16-08-2019	2019-08-16 00:00:00	40/427	jaap43	51.9709244	4.12436581	in struik landtong Rozenburg	Rozenburg	ZH	\N	\N
1496	03-02-2014	2014-02-03 00:00:00	24/59	Ronald_010	04-02-2014	2014-02-04 00:00:00	24/60	Sjakie-77	51.9833412	4.32626581	aan hek Abtsrechtseweg	Schipluiden	ZH	\N	\N
210	28-01-2011	2011-01-28 00:00:00	6/65	Miss2	30-01-2011	2011-01-30 00:00:00	6/67	scheurschuimpje	52.6348267	5.77719879	parkeerplaats Museum Schokland, NO-polder, Fl.	NO-polder	Fl	\N	\N
3178	27-07-2019	2019-07-27 00:00:00	40/395	jaap43	28-07-2019	2019-07-28 00:00:00	40/395	ronk	52.0191231	4.67918015	achter boomstronk P-terrein Stoofkade	Waddinxveen	ZH	\N	\N
3949	22-06-2021	2021-06-22 00:00:00	41/101	BigJim	22-06-2021	2021-06-22 00:00:00	41/101	Outdoor Man	52.707859	4.77953482	omder brug Lorrie 	Oudkarspel	NH	\N	\N
1651	27-05-2014	2014-05-27 00:00:00	26/22	Bas600	28-05-2014	2014-05-28 00:00:00	26/23	XJ Elff	51.8881798	4.89646292	in bosje bij toiletgebouw - de Hoogt	Goudriaan	Ut	\N	\N
1253	26-06-2013	2013-06-26 00:00:00	21/51	SparkViv	27-06-2013	2013-06-27 00:00:00	21/52	tdemmer	51.8068199	4.28862	aan boom Bernisse Spuidijk	Zuidland	ZH	\N	\N
1164	11-04-2013	2013-04-11 00:00:00	20/24	Roeleey	11-04-2013	2013-04-11 00:00:00	20/24	Outdoor Man	52.340477	4.84751892	aan muurtje Ijsbaanpad	Amsterdam	NH	\N	\N
1872	28-03-2015	2015-03-28 00:00:00	28/40	Rainbow600	29-03-2015	2015-03-29 00:00:00	28/41	BSI	52.1195908	5.89116478	onder struik Krimweg	Hoenderloo	Ge	\N	\N
3698	11-10-2020	2020-10-11 00:00:00	40/845	HighKing	12-10-2020	2020-10-12 00:00:00	40/845	ootje	52.5574684	4.60907984	achter boomstam Strandplateau	Castricum	NH	\N	\N
3233	04-09-2019	2019-09-04 00:00:00	40/449	ootje	04-09-2019	2019-09-04 00:00:00	40/449	Coenster	52.4183807	4.98361588	tegen beschoeiing gemaaltje Brekergouw	Zunderdorp	NH	\N	\N
3912	26-05-2021	2021-05-26 00:00:00	41/076	Roeleey	26-05-2021	2021-05-26 00:00:00	41/076	Deeffox	51.5815773	4.83386898	tegen paal Motorparkeerplaats Dcatlon	Breda	NB	\N	\N
1714	16-08-2014	2014-08-16 00:00:00	26/97	Ronald_010	17-08-2014	2014-08-17 00:00:00	26/97	SadBunny	51.9283638	4.44346905	bij ingang Blijdorp - Blijdorplaan	Rotterdam	ZH	\N	\N
3113	10-05-2019	2019-05-10 00:00:00	40/320	Artemecion	11-05-2019	2019-05-11 00:00:00	40/321	Ronald_010	51.9927597	6.53186798	in schuur camping Woltas	Ziewent	Ge	\N	\N
2446	02-06-2017	2017-06-02 00:00:00	34/68	Rik60NL	03-06-2017	2017-06-03 00:00:00	34/69	Bomba	52.2717018	4.88088989	achter kastje - Nesserlaan	Amstelveen	NH	\N	\N
445	26-06-2011	2011-06-26 00:00:00	10/82	Wimis on	26-06-2011	2011-06-26 00:00:00	10/82	BSI	52.0211678	5.11405802	buitendeur oude sluis - sluispad, Nieuwegein, Ut	Nieuwegein	Ut	\N	\N
266	11-03-2011	2011-03-11 00:00:00	7/87	wesleyc	11-03-2011	2011-03-11 00:00:00	7/89	BSI	52.0089874	4.24576807	museum - Midden Broekweg, Honselersdijk, ZH	Honselersdijk	ZH	\N	\N
2995	26-01-2019	2019-01-26 00:00:00	40/182	ronk	26-01-2019	2019-01-26 00:00:00	40/182	Thijs67	52.2291985	4.83763599	tegen hek bij fort	Amstelhoek	Ut	\N	\N
4293	21-02-2023	2023-02-21 00:00:00	41/330	scheurschuimpje	26-02-2023	2023-02-26 00:00:00	41/331	pdv_moto	51.3571053	4.39423084	in plantenbak bij Jacob Jordaens	Putte	NB	\N	\N
2337	13-02-2017	2017-02-13 00:00:00	33/57	pdv_moto	15-02-2017	2017-02-15 00:00:00	33/58	Dirk130	52.0871391	4.28402996	bij boom Alexander Gogelweg	Den Haag	ZH	\N	\N
3833	11-03-2021	2021-03-11 00:00:00	41/009	Outdoor Man	11-03-2021	2021-03-11 00:00:00	41/009	Coenster	52.3480835	4.85539913	in bloembak Karperweg	Amsterdam	NH	\N	\N
2349	03-03-2017	2017-03-03 00:00:00	33/72	BSI	04-03-2017	2017-03-04 00:00:00	33/73	HermanK	52.2114182	6.87836504	onder kei - Pathmosstraat	Enschede	Ov	\N	\N
1625	05-05-2014	2014-05-05 00:00:00	25/94	SparkViv	06-05-2014	2014-05-06 00:00:00	25/95	Phaedrus	51.840065	4.50022793	bij paal heuvel Koedood	Barendrecht	ZH	\N	\N
261	07-03-2011	2011-03-07 00:00:00	7/77	Richard117	07-03-2011	2011-03-07 00:00:00	7/78	Quickly	51.9948273	5.08755779	hek bij poort - Hofplein 43, Vianen, Ut	Vianen	Ut	\N	\N
859	12-07-2012	2012-07-12 00:00:00	16/33	frankivo	13-07-2012	2012-07-13 00:00:00	16/34	Bedumer	53.041851	6.86740208	bij raam Nat. Geo. Unikenstraat	Stadskanaal	Gr	\N	\N
2729	28-04-2018	2018-04-28 00:00:00	38/59	FastEddy	28-04-2018	2018-04-28 00:00:00	38/60	frankivo	52.9754562	6.98996782	achter E-kast Kijlsterweg	Stadskanaal	Gr	\N	\N
2275	14-10-2016	2016-10-14 00:00:00	32/64	tdemmer	16-10-2016	2016-10-16 00:00:00	32/67	Amauta	51.9784813	4.54866982	aan boom Hoge Bergse Bos	Bergschenhoek	ZH	\N	\N
4169	22-04-2022	2022-04-22 00:00:00	41/250	jaap43	22-04-2022	2022-04-22 00:00:00	41/250	Hans89	52.0263023	4.55965614	in heg bij 3e molen Molenviergang	Zevenhuizen	ZH	\N	\N
2504	03-08-2017	2017-08-03 00:00:00	35/36	Okami_Xci	04-08-2017	2017-08-04 00:00:00	35/37	Amauta	51.4434624	5.51451302	op P-terrein Gen. Bothastraat	Eindhoven	NB	\N	\N
4135	27-02-2022	2022-02-27 00:00:00	41/225	Artemicion	27-02-2022	2022-02-27 00:00:00	41/225	Hjerteknuser	52.5320358	4.70692205	achter muurtje gangetje 	Uitgeest	NH	\N	\N
1839	14-02-2015	2015-02-14 00:00:00	28/12	Ronald_010	14-02-2015	2015-02-14 00:00:00	28/12	coffeejunk	52.1792526	4.6225791	in wilg - Groenewoudsekade	Roelofarendsveen	ZH	\N	\N
4198	29-05-2022	2022-05-29 00:00:00	41/268	FastEddy	29-05-2022	2022-05-29 00:00:00	41/268	Amauta	52.9136238	6.79743195	onder trap uitkijktorenroren Mandelanden	Ees	Dr	\N	\N
3526	01-06-2020	2020-06-01 00:00:00	40/687	FastEddy	01-06-2020	2020-06-01 00:00:00	40/688	Amauta	52.7937279	6.49940205	tegen paal infobord treinkaping 	Wijster	Dr	\N	\N
3973	08-07-2021	2021-07-08 00:00:00	41/119	K0en	09-07-2021	2021-07-09 00:00:00	41/119	BSI	52.1862259	5.17217493	tegen boom achter hek Noodweg	Hilversum	NH	\N	\N
2611	31-12-2017	2017-12-31 00:00:00	36/94	Okami_Xci	06-01-2018	2018-01-06 00:00:00	36/97	pdv_moto	51.2357826	5.58231688	in buxusperk - Rector van Nestestraar	Budel	NB	\N	\N
4157	02-04-2022	2022-04-02 00:00:00	41/241	Outdoor Man	03-04-2022	2022-04-03 00:00:00	41/242	HighKing	52.5083923	4.69277382	aan hekwerk Communicatieweg 	Heemskerk	NH	\N	\N
2774	07-06-2018	2018-06-07 00:00:00	39/13	Bomba	09-06-2018	2018-06-09 00:00:00	39/14	BSI	52.0965157	4.86153316	achter stenen Hoofdweg	Zegveld	Ut	\N	\N
287	25-03-2011	2011-03-25 00:00:00	8/27	BSI	25-03-2011	2011-03-25 00:00:00	8/28	Smuiger	52.3367767	4.85708904	achter kastje Amstelveenseweg, Amsterdam, NH	Amsterdam	NH	\N	\N
1053	16-01-2013	2013-01-16 00:00:00	18/67	tdemmer	20-01-2013	2013-01-20 00:00:00	18/69	ootje	52.0302162	4.50433493	in wilg Munnikenweg	Berkel en Rodenrijs	ZH	\N	\N
4182	07-05-2022	2022-05-07 00:00:00	41/257	BrommerMetWielen	08-05-2022	2022-05-08 00:00:00	41/258	Outdoor Man	51.9714584	5.95544195	bij monument fort Westervoort	Arnhem	Ge	\N	\N
2453	11-06-2017	2017-06-11 00:00:00	34/79	Roeleey	11-06-2017	2017-06-11 00:00:00	34/79	Amauta	52.2566719	4.95985508	achter infobord Fort - Winkeldijk	Abcoude	Ut	\N	\N
3616	08-08-2020	2020-08-08 00:00:00	40/770	HighKing	09-08-2020	2020-08-09 00:00:00	40/771	Yosra87	52.4633636	4.61983824	onder trap perron Vislijn	IJmuiden	NH	\N	\N
2052	12-01-2016	2016-01-12 00:00:00	30/15	tdemmer	14-01-2016	2016-01-14 00:00:00	30/16	Dirk130	52.0218239	4.47646523	in boon Negenhovensepad	Berkel en Rodenrijs	ZH	\N	\N
173	20-12-2010	2010-12-20 00:00:00	5/52	toetje87	20-12-2010	2010-12-20 00:00:00	5/53	Rider_Heleen	52.3322258	4.90191412	boom in park Ouderkerkerdijkje, Amsterdam, NH	Amsterdam	NH	\N	\N
3302	13-11-2019	2019-11-13 00:00:00	40/509	Picobello BV	13-11-2019	2019-11-13 00:00:00	40/509	Hans89	51.9398422	4.41666985	aan pomp Schie-eiland	Overschie	ZH	\N	\N
388	25-05-2011	2011-05-25 00:00:00	10/6	Bigtwim	26-05-2011	2011-05-26 00:00:00	10/7	Alexnieuwenhuize	52.4487076	4.67690611	puinhoop Dance Valley - Valleiweg, Velsen-Z, NH	Velsen	NH	\N	\N
3664	14-09-2020	2020-09-14 00:00:00	40/818	HighKing	14-09-2020	2020-09-14 00:00:00	40/819	Artemecion	52.4820709	4.69294214	aan hek Genieweg	Beverwijk	NH	\N	\N
3716	23-10-2020	2020-10-23 00:00:00	40/859	Sjefman	23-10-2020	2020-10-23 00:00:00	40/859	Hans89	51.7496529	4.33801794	tegen paaltje Nieuwendijk	Nieuw-Beijerland	ZH	\N	\N
1715	17-08-2014	2014-08-17 00:00:00	26/97	SadBunny	17-08-2014	2014-08-17 00:00:00	26/97	Roeleey	52.352417	4.87879515	aan regenpijp FonsVitaelyceum	Amsterdam	NH	\N	\N
2356	16-03-2017	2017-03-16 00:00:00	33/77	Coenster	17-03-2017	2017-03-17 00:00:00	33/78	BSI	52.2726669	4.64618683	aan hek Hoofdweg	Nieuw-Vennep	NH	\N	\N
217	01-02-2011	2011-02-01 00:00:00	6/77	tdemmer	02-02-2011	2011-02-02 00:00:00	6/79	jaap43	51.9745789	4.53117418	T-splitsing Hoeksekade, Bergschenhoek, ZH	Bergschenhoek	ZH	\N	\N
1951	29-06-2015	2015-06-29 00:00:00	29/12	Kermit de Hond	01-07-2015	2015-07-01 00:00:00	29/13	Amauta	53.0379639	6.45069885	bij monument werkkamp de Fledders	Zuidvelde	Dr	\N	\N
1605	23-04-2014	2014-04-23 00:00:00	25/78	steve_m	24-04-2014	2014-04-24 00:00:00	25/79	vuurbloed	52.289959	4.70985889	onder fietbrug Siriusdreef	Hoofddorp	NH	\N	\N
235	14-02-2011	2011-02-14 00:00:00	7/13	rutgertjuh	14-02-2011	2011-02-14 00:00:00	7/15	Komkommer	51.8932076	5.22683716	langs voetpad Appeldijk/Groenedijk, Deil, Ge	Deil	Ge	\N	\N
4174	28-04-2022	2022-04-28 00:00:00	41/252	Amauta	29-04-2022	2022-04-29 00:00:00	41/253	FastEddy	53.0984039	7.14194918	tegen boom bij Hoofdweg 4 (mig21)	Bellingwolde	Gr	\N	\N
4332	01-05-2023	2023-05-01 00:00:00	41/357	pdv_moto	04-05-2023	2023-05-04 00:00:00	41/357	Okami_Xci	50.768116	6.00859213	tegen poot plaatsnaambord	Vaals	Li	\N	\N
2286	01-11-2016	2016-11-01 00:00:00	32/86	Amauta	01-11-2016	2016-11-01 00:00:00	32/86	frankivo	53.1068344	6.70465803	aan muur uitloop Molen - Hunzeweg	de Groeve	Dr	\N	\N
2091	03-04-2016	2016-04-03 00:00:00	30/57	Amauta	03-04-2016	2016-04-03 00:00:00	30/57	BSI	52.9553223	4.72579002	aan hek bij Lange Jaap	Huisduinen	NH	\N	\N
4184	08-05-2022	2022-05-08 00:00:00	41/258	SadBunny	08-05-2022	2022-05-08 00:00:00	41/258	Outdoor Man	52.4653549	4.76380491	in heg achter halte Communicatieweg	Assendelft	NH	\N	\N
2040	03-12-2015	2015-12-03 00:00:00	30/01	ootje	11-12-2015	2015-12-11 00:00:00	30/03	BSI	51.8386574	5.94651508	aan hek bij E-huis - Thornsestraat	Persingen	Ge	\N	\N
1133	23-03-2013	2013-03-23 00:00:00	19/73	Roeleey	23-03-2013	2013-03-23 00:00:00	19/74	V-Strommert	52.3045616	5.01289701	aan boom bij bushalte	Driemond	NH	\N	\N
1547	10-03-2014	2014-03-10 00:00:00	25/17	Dirk130	10-03-2014	2014-03-10 00:00:00	25/18	jaap43	51.9293556	4.14383888	aan wilg bij Brielsemeer	Oostvoorne	ZH	\N	\N
4136	27-02-2022	2022-02-27 00:00:00	41/225	Hjerteknuser	27-02-2022	2022-02-27 00:00:00	41/225	Outdoor Man	52.5190887	4.68111277	tegen paal p-plein P.H. Spaakerf	Heemskerk	NH	\N	\N
3778	26-12-2020	2020-12-26 00:00:00	40/912	Hans89	28-12-2020	2020-12-28 00:00:00	40/912	Carburateur	51.8935013	4.65734291	bij kijkscherm eendenkooi Bakkerwaal	Lekkerkerk	ZH	\N	\N
2714	19-04-2018	2018-04-19 00:00:00	38/41	HermanK	19-04-2018	2018-04-19 00:00:00	38/41	MeanYellowBoy	52.6131058	6.47304678	aan boompje Noord Stegeren	Dedemsvaart	Ov	\N	\N
3189	03-08-2019	2019-08-03 00:00:00	40/404	pdv_moto	04-08-2019	2019-08-04 00:00:00	40/405	Sjefman	51.5336647	3.44573402	aan poot gemeentebord Noordweg	Westkapelle	Ze	\N	\N
3364	25-01-2020	2020-01-25 00:00:00	40/554	pdv_moto	25-01-2020	2020-01-25 00:00:00	40/554	BSI	52.113533	4.28420019	tegen lantaarnpaal Gevers Duynootweg	Scheveningen	ZH	\N	\N
156	01-12-2010	2010-12-01 00:00:00	5/28	Smuiger	01-12-2010	2010-12-01 00:00:00	5/28	bobcat	52.5078011	4.70330191	hek viaduct Communicatieweg, Uitgeest, NH	Uitgeest	NH	\N	\N
2012	13-09-2015	2015-09-13 00:00:00	29/65	Bensi	19-09-2015	2015-09-19 00:00:00	29/67	Sjantaalfoutje	51.9986496	6.19387484	aan steiger Oude Ijssel - Emilweg	Hoog Keppel	Ge	\N	\N
613	05-11-2011	2011-11-05 00:00:00	13/24	rvdh86	06-11-2011	2011-11-06 00:00:00	13/25	Ronald_010	52.359333	5.69652987	boom bij kasteel Essenburgh, Hierden, Ge	Hierden	Ge	\N	\N
2087	28-03-2016	2016-03-28 00:00:00	30/51	Fuck Het Milieu	29-03-2016	2016-03-29 00:00:00	30/52	ArendJan	51.9264412	4.4010911	aan voet geluidsscherm A20	Schiedam	ZH	\N	\N
294	27-03-2011	2011-03-27 00:00:00	8/35	BSI	27-03-2011	2011-03-27 00:00:00	8/37	BigJim	52.3963051	5.45437908	onder brug Aardwerk - Vogelweg, Zeewolde, Fl	Zeewolde	Fl	\N	\N
75	30-09-2010	2010-09-30 00:00:00	3/32	ootje	30-09-2010	2010-09-30 00:00:00	3/33	Nohome	52.4693985	5.50964403	Ootje Konkel - IJsselmeerdijk, Scharwoude, NH	Scharwoude	NH	\N	\N
860	14-07-2012	2012-07-14 00:00:00	16/35	Bedumer	14-07-2012	2012-07-14 00:00:00	16/37	Directeur	53.2002411	6.64639902	bij banpaal - Weendersweg	Groningen	Gr	\N	\N
790	29-04-2012	2012-04-29 00:00:00	15/44	bikedan	29-04-2012	2012-04-29 00:00:00		MIA	51.356472	4.384583	bij theekoepel - landgoed Moretus, Putte, NB	Putte	NB	\N	\N
4121	10-02-2022	2022-02-10 00:00:00	41/217	Outdoor Man	10-02-2022	2022-02-10 00:00:00	41/217	HighKing	52.4828568	4.67808914	achter stam bij P-terrein St. Aagtenpark	Beverwijk	NH	\N	\N
3888	24-04-2021	2021-04-24 00:00:00	41/053	pdv_moto	26-04-2021	2021-04-26 00:00:00	41/054	Outdoor Man	51.1759033	5.87288094	op rotonde Heelderweg	Heel	Li	\N	\N
3721	26-10-2020	2020-10-26 00:00:00	40/862	HighKing	27-10-2020	2020-10-27 00:00:00	40/863	ootje	52.5100555	4.67944384	in boom C. Huygemsstraat	Heemstede	NH	\N	\N
207	24-01-2011	2011-01-24 00:00:00	6/53	Buikschuiver oet Dre	24-01-2011	2011-01-24 00:00:00	6/56	Remond-Frl	52.7406197	6.08184481	hek sportterrein Kerkweg, Giethoorn, Ov	Giethoorn	Ov	\N	\N
4237	02-09-2022	2022-09-02 00:00:00	41/295	Outdoor Man	04-09-2022	2022-09-04 00:00:00	41/295	Roeleey	52.3231888	4.89386797	aan brughoofd Kalfjeslaan	Amsterdam	NH	\N	\N
1440	10-12-2013	2013-12-10 00:00:00	23/98	SadBunny	10-12-2013	2013-12-10 00:00:00	23/99	Roeleey	52.3822327	4.90346384	aan oliebollerie - Buiksloterweg	Amsterdam	NH	\N	\N
3427	23-03-2020	2020-03-23 00:00:00	40/606	Hans89	23-03-2020	2020-03-23 00:00:00	40/606	Picobello BV	51.9804535	4.41083097	tegen poot uitkijktoren Tureluur	Pijnacker	ZH	\N	\N
2772	04-06-2018	2018-06-04 00:00:00	39/11	jaap43	06-06-2018	2018-06-06 00:00:00	39/12	ItsmeA3	51.9273224	4.04661417	aan paal bij infobord Oostvoornsemeer	Oostvoorne	ZH	\N	\N
2656	12-03-2018	2018-03-12 00:00:00	37/72	Ronny Rabbelaar	12-03-2018	2018-03-12 00:00:00	37/73	FastEddy	53.3046074	6.95316505	op rotonde N991	Weiwerd	Gr	\N	\N
2501	31-07-2017	2017-07-31 00:00:00	35/33	Capo-04/06	01-08-2017	2017-08-01 00:00:00	35/33	DKP	50.9176559	5.8505311	achter wegkruis - Maastrichterweg	Nuth	Li	\N	\N
84	06-10-2010	2010-10-06 00:00:00	3/48	toroque	06-10-2010	2010-10-06 00:00:00	3/49	Cynthia1987	51.6324463	4.936903	klooster Schoolstraat, Dongen, NB	Dongen	NB	\N	\N
3808	18-02-2021	2021-02-18 00:00:00	40/937	HermanK	19-02-2021	2021-02-19 00:00:00	40/938	MeanYellowBoy	52.5167503	6.56747007	aan paaltje Stuwdijk	Marienberg	Ov	\N	\N
2712	18-04-2018	2018-04-18 00:00:00	38/38	Amauta	19-04-2018	2018-04-19 00:00:00	38/39	MeanYellowBoy	53.2042274	5.72442913	onder bruggetje molen Terpzicht	Marsum	Fr	\N	\N
3440	02-04-2020	2020-04-02 00:00:00	40/619	HighKing	02-04-2020	2020-04-02 00:00:00	40/619	Outdoor Man	52.6807327	4.8068099	tegen boom bij Broekerveiling	Broek op Langedijk	NH	\N	\N
3759	01-12-2020	2020-12-01 00:00:00	40/894	FastEddy	04-12-2020	2020-12-04 00:00:00	40/895	Amauta	52.9905968	6.64573002	tegen paal Hunebedweg	Rolde	Dr	\N	\N
749	24-03-2012	2012-03-24 00:00:00	15/02	Dirk130	24-03-2012	2012-03-24 00:00:00	15/03	ndeeka	51.6594009	4.10301781	aan hek wandelpad zeedijk, Bruinisse, Ze	Bruinisse	Ze	\N	\N
420	09-06-2011	2011-06-09 00:00:00	10/40	Bigtwim	10-06-2011	2011-06-10 00:00:00	10/43	black mule	52.4953766	4.67023611	Bij kunstwerk - Foreestpad, Beverwijk, NH	Beverwijk	NH	\N	\N
4300	06-03-2023	2023-03-06 00:00:00	41/335	pdv_moto	09-03-2023	2023-03-09 00:00:00	41/336	tdemmer	51.5280533	3.44747496	in struik bij bushalte N238	Westkapelle	Ze	\N	\N
1864	16-03-2015	2015-03-16 00:00:00	28/31	k0en	17-03-2015	2015-03-17 00:00:00	28/31	Wimis on	52.0739365	5.12086105	aan hek Rotsoord	Otrecht	Ut	\N	\N
3097	29-04-2019	2019-04-29 00:00:00	40/295	DKP	30-04-2019	2019-04-30 00:00:00	40/297	Capo-04/06	50.7946815	5.70094109	in hoek P-terrein Wildpark	Eijsden	Li	\N	\N
3220	23-08-2019	2019-08-23 00:00:00	40/436	Roeleey	24-08-2019	2019-08-24 00:00:00	40/437	pdv_moto	51.4909554	4.7397089	tegen afvalbak p-plaats Hazeldonk	Rijsbergen	NB	\N	\N
3622	13-08-2020	2020-08-13 00:00:00	40/781	frankivo	14-08-2020	2020-08-14 00:00:00	40/781	Amauta	53.173111	6.11361504	aan poot 30 km bord Seadwei	Eastermar	Fr	\N	\N
4180	02-05-2022	2022-05-02 00:00:00	41/255	Ronald_010	05-05-2022	2022-05-05 00:00:00	41/255	BornToReign	51.4723129	6.06040478	tegen zuil van beeld Aardbeienland	Horst	Li	\N	\N
1712	15-08-2014	2014-08-15 00:00:00	26/95	crazy987	15-08-2014	2014-08-15 00:00:00	26/95	bikedan	51.6526451	4.6081419	aan hek Schansdijk	Zevenbergen	NB	\N	\N
3067	05-04-2019	2019-04-05 00:00:00	40/263	Coenster	05-04-2019	2019-04-05 00:00:00	40/463	pdv_moto	52.2924309	4.52217388	Landal Dunimar, Ruygenhoekerweg	Noordwijkerhout	ZH	\N	\N
4146	13-03-2022	2022-03-13 00:00:00	41/232	bikedan	13-03-2022	2022-03-13 00:00:00	41/232	scheurschuimpje	51.4042854	4.32029009	aan hek Hoeve Calfven, Oude Trambaan	Ossendrecht	NB	\N	\N
1391	13-10-2013	2013-10-13 00:00:00	23/43	Janhertog	16-10-2013	2013-10-16 00:00:00	23/45	Gee123	52.7981758	6.08653688	aan beuk op doodlopende weg	Tuk	Ov	\N	\N
3644	29-08-2020	2020-08-29 00:00:00	40/804	pdv_moto	29-08-2020	2020-08-29 00:00:00	40/804	FastEddy	52.4381752	6.09301376	achter struikje Werverdijk	Wapenveld	Ge	\N	\N
3791	24-01-2021	2021-01-24 00:00:00	40/924	BSI	25-01-2021	2021-01-25 00:00:00	40/923	wachtbalkje	52.2674026	5.69902992	tegen stomp berkenboom Sprielderweg	Ermelo	Ge	\N	\N
333	17-04-2011	2011-04-17 00:00:00	9/11	Dirtbag	18-04-2011	2011-04-18 00:00:00	9/11	Hasseman	52.2796974	6.35104179	molen de Hegeman - Dijkershoekseweg, Holten, Ov	Holten	Ov	\N	\N
2640	18-02-2018	2018-02-18 00:00:00	37/46	FastEddy	18-02-2018	2018-02-18 00:00:00	37/46	Amauta	52.9651222	6.57021379	lancastermonument, propellerpad	Assen	Dr	\N	\N
1581	01-04-2014	2014-04-01 00:00:00	25/54	Wimis on	01-04-2014	2014-04-01 00:00:00	25/55	Vins111	52.0417671	5.13970423	aan hek bij Langeweg	Houten	Ut	\N	\N
2725	23-04-2018	2018-04-23 00:00:00	38/52	Bosso	25-04-2018	2018-04-25 00:00:00	38/54	HighKing	52.9527435	4.77436495	achter E-kast Ruyghweg	Den Helder	NH	\N	\N
1549	10-03-2014	2014-03-10 00:00:00	25/19	-juliet-	10-03-2014	2014-03-10 00:00:00	25/19	Ronald_010	52.0052986	4.36013412	aan boord sleepboot Westervaart - Zuidwal	Delft	ZH	\N	\N
4343	21-05-2023	2023-05-21 00:00:00	41/365	Bensi	24-05-2023	2023-05-24 00:00:00	41/366	blub blub	51.9998932	6.25975418	P-terrein Hessenweg	Hummelo	Ge	\N	\N
1175	20-04-2013	2013-04-20 00:00:00	20/40	BSI	20-04-2013	2013-04-20 00:00:00	20/41	Bensi	52.2442818	6.38188696	bij sluis Schipbeek - Bronsvoorderdijk	Gorssel	Ge	\N	\N
802	18-05-2012	2012-05-18 00:00:00	15/59	Hasseman	19-05-2012	2012-05-19 00:00:00	15/61	Merc_xtz750	52.2633705	7.0301528	aan infobord - Ravenhorsterweg, Losser, Ov	Losser	Ov	\N	\N
1568	25-03-2014	2014-03-25 00:00:00	25/41	BSI	26-03-2014	2014-03-26 00:00:00	25/42	Sjantaalfoutje	52.1662598	5.9757309	onder hek - Tullekensmolenweg	Beekbergen	Ge	\N	\N
1783	31-10-2014	2014-10-31 00:00:00	27/61	BSI	01-11-2014	2014-11-01 00:00:00	27/62	Dirtbag	52.2125854	6.85636997	in struik - Fre Cohenlaan	Enschede	Ov	\N	\N
4305	17-03-2023	2023-03-17 00:00:00	41/338	pdv_moto	18-03-2023	2023-03-18 00:00:00	41/339	Amauta	53.2904701	6.83757687	achter rioolbuis gemaal Groeveweg	Overschild	Gr	\N	\N
2845	05-08-2018	2018-08-05 00:00:00	39/97	Roeleey	05-08-2018	2018-08-05 00:00:00	39/97	SadBunny	52.4325523	4.87656879	tegen bruggetje aan de Skoon	Oostzaan	NH	\N	\N
4244	22-09-2022	2022-09-22 00:00:00	41/299	Amauta	23-09-2022	2022-09-23 00:00:00	41/299	BSI	52.3587608	5.01753807	tegen hek P-terrein strand Blijburg	Amsterdam	NH	\N	\N
2943	09-11-2018	2018-11-09 00:00:00	40/103	BornToReign	09-11-2018	2018-11-09 00:00:00	40/103	BSI	52.0194817	5.80537319	achter bank P-plaats Planken Wambuis	Wolfheze	Ge	\N	\N
3144	14-06-2019	2019-06-14 00:00:00	40/355	Artemecion	14-06-2019	2019-06-14 00:00:00	40/356	ootje	52.5296822	4.71236181	tegen kerkhofmuur Kerkbuurt	Uitgeest	NH	\N	\N
1378	01-10-2013	2013-10-01 00:00:00	23/23	Wimis on	01-10-2013	2013-10-01 00:00:00	23/24	evolver86	52.0270805	5.14724207	achter p-paaltje AT&IC - Voorveste	Houten	Ut	\N	\N
752	25-03-2012	2012-03-25 00:00:00	15/05	Bomba	25-03-2012	2012-03-25 00:00:00	15/06	tdemmer	52.0859032	4.83932781	bij boom P-plaats - Barwoutswaarder, Woerden, Ut	Woerden	Ut	\N	\N
2082	23-03-2016	2016-03-23 00:00:00	30/47	Amauta	24-03-2016	2016-03-24 00:00:00	30/47	Bensi	52.0091743	6.35089922	aan bord 30 km - Ruurloseweg	Zelhem	Ge	\N	\N
2133	20-05-2016	2016-05-20 00:00:00	31/04	Scoot_020/Scoot_2	20-05-2016	2016-05-20 00:00:00	31/04	Amauta	52.3881569	5.28432989	aan boom - Gerberastraat	Almere	Fl	\N	\N
459	10-07-2011	2011-07-10 00:00:00	10/98	jaap43	10-07-2011	2011-07-10 00:00:00	10/99	bakfiets1	51.5593452	4.55267906	aan hek - Oude Antw.postbaan, Bosschenhoofd, NB	Bosschenhoofd	NB	\N	\N
3426	23-03-2020	2020-03-23 00:00:00	40/605	vuurbloed	23-03-2020	2020-03-23 00:00:00	40/606	Hans89	52.264473	4.75129318	in locomotief Stommeerweg	Aalsmeer	NH	\N	\N
485	02-08-2011	2011-08-02 00:00:00	11/32	rvdh86	02-08-2011	2011-08-02 00:00:00	11/33	BSI	52.248661	5.75460386	onder dode boom - Paleisweg, Ermelo, Ge	Ermelo	Ge	\N	\N
2776	11-06-2018	2018-06-11 00:00:00	39/15	Roeleey	12-06-2018	2018-06-12 00:00:00	39/16	Coenster	52.1700172	4.98934507	aan infopaneel Kortrijksemolen	Breukelen	Ut	\N	\N
2293	23-11-2016	2016-11-23 00:00:00	33/03	PatrickSoler	24-11-2016	2016-11-24 00:00:00	33/03	pdv_moto	52.1789894	4.62199879	aan hek Groenewoudskade	Roelofarendsveen	ZH	\N	\N
334	18-04-2011	2011-04-18 00:00:00	9/12	Hasseman	18-04-2011	2011-04-18 00:00:00	9/12	Bensi	52.4294548	6.2452178	kunstwerk Raalterdwarsweg, Heino, Ov	Heino	Ov	\N	\N
4067	21-11-2021	2021-11-21 00:00:00	41/180	BSI	22-11-2021	2021-11-22 00:00:00	41/181	Bensi	52.2361221	5.68848515	tegen hekpaaltje klimbos Putterweg	Garderen	Ge	\N	\N
1736	06-09-2014	2014-09-06 00:00:00	27/18	bikedan	06-09-2014	2014-09-06 00:00:00	27/19	Hans89	51.4418449	3.58646894	aan paal stadswal - Commandoweg	Vlissingen	Ze	\N	\N
3417	18-03-2020	2020-03-18 00:00:00	40/596	HighKing	18-03-2020	2020-03-18 00:00:00	40/597	Artemecion	52.5442505	4.65833807	onder stenen in talud Huis van Hilde	Castricum aan Zee	NH	\N	\N
1327	27-08-2013	2013-08-27 00:00:00	22/45	frankivo	28-08-2013	2013-08-28 00:00:00	22/46	Gee123	52.9319534	6.66905212	aan paal 60 km - Heetlagendijk	Grolloo	Dr	\N	\N
3393	26-02-2020	2020-02-26 00:00:00	40/577	Sjefman	28-02-2020	2020-02-28 00:00:00	40/577	Hans89	51.5130157	4.31103802	tegen boom Moerstraatsebaan	Bergen op Zoom	NB	\N	\N
1728	29-08-2014	2014-08-29 00:00:00	27/12	Rainbow600	30-08-2014	2014-08-30 00:00:00	27/13	Djoost	52.0475502	5.08873415	onder bol Hometradecentre	Nieuwegein	Ut	\N	\N
1840	15-02-2015	2015-02-15 00:00:00	28/13	coffeejunk	17-02-2015	2015-02-17 00:00:00	28/13	Roeleey	52.3785591	4.6913228	aan hek Vijfhuizerdijk	Vijfhuizen	NH	\N	\N
505	18-08-2011	2011-08-18 00:00:00	11/55	Scoot_020/Scoot_2	18-08-2011	2011-08-18 00:00:00	11/56	hills89	52.2159576	4.62711096	aan viaduct Ringvaart - Huigsloterdijk, Abbenes, NH	Abbenes	NH	\N	\N
2492	20-07-2017	2017-07-20 00:00:00	35/23	Coenster	20-07-2017	2017-07-20 00:00:00	35/23	highking	52.3904152	4.67222404	bij paaltje P-terrein Molen "de Veer" 	Haarlem	NH	\N	\N
1367	25-09-2013	2013-09-25 00:00:00	22/95	BSI	25-09-2013	2013-09-25 00:00:00	22/96	Tankiej	52.2532272	5.59352112	in autoband - van Geenweg	Putten	Ge	\N	\N
440	23-06-2011	2011-06-23 00:00:00	10/77	Outdoor Man	23-06-2011	2011-06-23 00:00:00	10/77	Scoot_020/Scoot_2	52.3288956	4.82050419	aan einde pad - Koenenkade, Amsterdam, NH	Amsterdam	NH	\N	\N
690	21-01-2012	2012-01-21 00:00:00	14/22	Delcasa	21-01-2012	2012-01-21 00:00:00	14/23	Scoot_020/Scoot_2	52.3081627	4.82354498	aan paal rotonde Burg. Colijnweg, Amstelveen, NH	Amstelveen	NH	\N	\N
1108	05-03-2013	2013-03-05 00:00:00	19/39	Corney28	05-03-2013	2013-03-05 00:00:00	19/40	SadBunny	52.1195488	4.98460722	aan paal - Bochtdijk	Haarzuilens	Ut	\N	\N
3587	18-07-2020	2020-07-18 00:00:00	40/738	Roeleey	19-07-2020	2020-07-19 00:00:00	40/739	Bensi	51.8208656	5.8282299	aan infopaneel Weg door Jonkerbos	Nijmegen	Ge	\N	\N
1483	18-01-2014	2014-01-18 00:00:00	24/44	Sjantaalfoutje	18-01-2014	2014-01-18 00:00:00	24/45	Bomba	52.1175499	5.47896814	achter kijkscherm Moorsterweg	Leusden	Ut	\N	\N
1814	25-12-2014	2014-12-25 00:00:00	27/90	dopey85	30-12-2014	2014-12-30 00:00:00	27/91	Phaedrus	51.424469	5.47371006	bij boom - Boutenslaan	Eindhoven	NB	\N	\N
735	13-03-2012	2012-03-13 00:00:00	14/86	Hasseman	14-03-2012	2012-03-14 00:00:00	14/87	MotorMieke	52.3276443	6.71386194	aan boom bij hek de Vloedbelt, Zenderen, Ov	Zenderen	Ov	\N	\N
1471	11-01-2014	2014-01-11 00:00:00	24/32	BSI	12-01-2014	2014-01-12 00:00:00	24/33	Ronald_010	52.2476273	5.53419304	aan brugleuning bij Kerkestraat	Putten	Ge	\N	\N
2974	29-12-2018	2018-12-29 00:00:00	40/148	BSI	30-12-2018	2018-12-30 00:00:00	40/149	pdv_moto	50.8479347	5.69542313	aan eind kademuur, Maaspromenade	Maastricht	Li	\N	\N
1251	24-06-2013	2013-06-24 00:00:00	21/50	Hans89	25-06-2013	2013-06-25 00:00:00	21/50	Ronald_010	51.6486435	3.92646909	aan struik a/d Wandeling	Zierikzee	Ze	\N	\N
1199	06-05-2013	2013-05-06 00:00:00	20/71	tdemmer	06-05-2013	2013-05-06 00:00:00	20/71	jaap43	51.9711723	4.55262613	in takkebos Nessepolder	Rotterdam	ZH	\N	\N
2808	06-07-2018	2018-07-06 00:00:00	39/50	Roeleey	06-07-2018	2018-07-06 00:00:00	39/51	Amauta	52.3311157	4.95617723	op rotonde Diemerdreef	Diemen	NH	\N	\N
1781	27-10-2014	2014-10-27 00:00:00	27/59	Lekkerbekje	27-10-2014	2014-10-27 00:00:00	27/60	Dirtbag	51.7341423	4.96786213	bij boom P-terrein Kasteel Dussen	Dussen	NB	\N	\N
3984	20-07-2021	2021-07-20 00:00:00	41/127	Artemecion	20-07-2021	2021-07-20 00:00:00	41/127	ootje	52.5177879	4.74525309	tegen hek fort K'ijk, Lagendijk	Uirgeest	NH	\N	\N
1419	15-11-2013	2013-11-15 00:00:00	23/76	tdemmer	16-11-2013	2013-11-16 00:00:00	23/77	jaap43	52.0363007	5.99112988	in houtstapel - Beekhuizenseweg	Rheden	Ge	\N	\N
63	24-09-2010	2010-09-24 00:00:00	3/9	Dennisik	24-09-2010	2010-09-24 00:00:00	3/10	tdemmer	51.9652901	4.45484018	Doenkade, Landscheiding, ZH	Landscheiding	ZH	\N	\N
1632	10-05-2014	2014-05-10 00:00:00	25/100	Rainbow600	10-05-2014	2014-05-10 00:00:00	25/101	Ronald_010	51.9706116	4.97990704	aan hek monument Lekdijk	Jaarsveld	Ut	\N	\N
1723	24-08-2014	2014-08-24 00:00:00	27/08	SadBunny	25-08-2014	2014-08-25 00:00:00	27/09	Bigtwim	52.7589989	4.91416597	aan boom bij garage - Dorpsstraat	Winkel	NH	\N	\N
522	01-09-2011	2011-09-01 00:00:00	11/83	Wolvin	02-09-2011	2011-09-02 00:00:00	11/84	BSI	52.6626625	5.59228897	onder kei aan strand - Staversekade, Urk, Fl	Urk	Fl	\N	\N
879	02-08-2012	2012-08-02 00:00:00	16/59	BSI	03-08-2012	2012-08-03 00:00:00	16/60	Komkommer	52.1639786	5.58552313	poot Eiffeltoren - Harselaarseweg	Barneveld	Ge	\N	\N
354		0001-01-01 00:00:00 BC		Bigtwim		0001-01-01 00:00:00 BC			\N	\N				\N	\N
1292	27-07-2013	2013-07-27 00:00:00	22/03	Kiki92	27-07-2013	2013-07-27 00:00:00	22/04	bikedan	51.5101624	4.46332884	aan paal P-plaats - Kruisstraat	Roosendaal	NB	\N	\N
1238	07-06-2013	2013-06-07 00:00:00	21/32	Hans89	08-06-2013	2013-06-08 00:00:00	21/33	bikedan	51.5323257	3.56668591	in houtstapel Munnkenhof	Grijpskerke	Ze	\N	\N
2489	18-07-2017	2017-07-18 00:00:00	35/20	jaap43	18-07-2017	2017-07-18 00:00:00	35/21	pdv_moto	51.7571716	4.29705191	aan hekpost  Nieuwendijk	Nieuw-Beijerland	ZH	\N	\N
230	09-02-2011	2011-02-09 00:00:00	6/99	BSI	09-02-2011	2011-02-09 00:00:00	6/99	V-Strommert	52.168705	4.591084	Vlietmolen - Parallelweg 1, Hoogmade, ZH	Hoogmade	ZH	\N	\N
2090	02-04-2016	2016-04-02 00:00:00	30/56	Bensi	02-04-2016	2016-04-02 00:00:00	30/56	Amauta	52.1538925	5.98188686	achter E-kast Hulleweg	Beekbergen	Ge	\N	\N
1264	02-07-2013	2013-07-02 00:00:00	21/64	VreemdeBeet	03-07-2013	2013-07-03 00:00:00	21/65	Bensi	52.1867981	6.16125679	aan hek bij kasteel Nyenbeek	Voorst	Ge	\N	\N
3718	25-10-2020	2020-10-25 00:00:00	40/860	pdv_moto	25-10-2020	2020-10-25 00:00:00	40/860	Outdoor Man	52.1059647	4.26972818	tegen vlaggenmast Strandweg	Scheveningen	ZH	\N	\N
2172	12-07-2016	2016-07-12 00:00:00	31/46	Amauta	17-07-2016	2016-07-17 00:00:00	31/47	BSI	50.9903717	5.87827015	aan hek kapelletje - Kapellerweg	Sittard	Li	\N	\N
2517	18-08-2017	2017-08-18 00:00:00	35/56	Scoot_020/Scoot_2	19-08-2017	2017-08-19 00:00:00	35/56	Rik60NL	52.3918419	5.28047514	achter kast Dahliaweg	Almere	Fl	\N	\N
3734	05-11-2020	2020-11-05 00:00:00	40/872	Outdoor Man	05-11-2020	2020-11-05 00:00:00	40/872	HighKing	52.3193016	4.87057209	in parkeerkelder Regus Kronenburg	Amstelveen	NH	\N	\N
3165	09-07-2019	2019-07-09 00:00:00	40/381	ootje	09-07-2019	2019-07-09 00:00:00	40/381	jaap43	51.9553452	4.69429111	aan hek E-huis Graafkade	Berkenwoude	ZH	\N	\N
1300	09-08-2013	2013-08-09 00:00:00	22/14	BSI	11-08-2013	2013-08-11 00:00:00	22/15	rvdh86	52.9208984	6.57348013	onder stronk in Zonnestelsel	Hooghalen	Dr	\N	\N
2237	15-09-2016	2016-09-15 00:00:00	32/14	pdv_moto	15-09-2016	2016-09-15 00:00:00	32/15	Ronald_010	52.1735115	4.53211689	aan bord Bebouwde Kom	Leiderdorp	ZH	\N	\N
3019	22-02-2019	2019-02-22 00:00:00	40/215	Amauta	22-02-2019	2019-02-22 00:00:00	40/215	FastEddy	53.0764885	6.44060612	onder stenen Pollingbank	Norg	Dr	\N	\N
3270	15-10-2019	2019-10-15 00:00:00	40/481	Outdoor Man	16-10-2019	2019-10-16 00:00:00	40/481	Coenster	52.3302155	4.67121601	tegen hek uitzichtpunt Paviljoenlaan	Hoofddorp	NH	\N	\N
386	23-05-2011	2011-05-23 00:00:00	9/98	Outdoor Man	25-05-2011	2011-05-25 00:00:00	10/4	dolfijneflipper	52.661274	5.18356514	boom bij kerk van Hem, Drechterland, NH	Drechterland	NH	\N	\N
2375	07-04-2017	2017-04-07 00:00:00	33/101	Janhertog	08-04-2017	2017-04-08 00:00:00	33/101	scheurschuimpje	52.8106117	6.08399677	aan hek viaduct A32	Wolterholten	Ov	\N	\N
67	26-09-2010	2010-09-26 00:00:00	3/16	Wimis on	26-09-2010	2010-09-26 00:00:00	3/17	BaRRt	52.0448303	5.41439295	paaltje Scherpenzeelseweg, Maarsbergen, Ut	Maarsbergen	Ut	\N	\N
2908	19-09-2018	2018-09-19 00:00:00	40/62	FastEddy	19-09-2018	2018-09-19 00:00:00	40/63	Amauta	53.3210907	6.94005013	onder sokkel monument de Ontmoeting	Farmsum	Gr	\N	\N
834	21-06-2012	2012-06-21 00:00:00	16/04	Bigtwim	22-06-2012	2012-06-22 00:00:00	16/05	Smuiger	52.655941	4.78508711	aan boom - Destreelaan, Sint Pancras, NH	Sint Pancras	NH	\N	\N
1494	29-01-2014	2014-01-29 00:00:00	24/57	Hans89	02-02-2014	2014-02-02 00:00:00	24/58	tdemmer	51.5111198	3.6147871	bij struik - Brandenburglaan 32	Middelburg	Ze	\N	\N
3342	31-12-2019	2019-12-31 00:00:00	40/540	pdv_moto	31-12-2019	2019-12-31 00:00:00	40/541	Picobello BV	52.0817337	4.31366205	in bloembak Lange Voorhout	Den Haag	ZH	\N	\N
2433	22-05-2017	2017-05-22 00:00:00	34/55	BornToReign	23-05-2017	2017-05-23 00:00:00	34/56	Rik60NL	51.9860382	5.56356907	bij monument Oude Veensegrindweg	Rhenen	Ge	\N	\N
448	28-06-2011	2011-06-28 00:00:00	10/85	BSI	30-06-2011	2011-06-30 00:00:00	10/87	ndeeka	52.0828934	5.64821196	holle boom bij Koepeltje - Galgenberg, Lunteren, Ge	Lunteren	Ge	\N	\N
2617	18-01-2018	2018-01-18 00:00:00	37/07	SadBunny	18-01-2018	2018-01-18 00:00:00	37/08	HighKing	52.9318542	5.04001284	tegen Vikingboot - vZuiderhaven	Den Oever	NH	\N	\N
1826	14-01-2015	2015-01-14 00:00:00	27/98	Bas600	14-01-2015	2015-01-14 00:00:00	27/99	Rainbow600	52.2411423	4.83636284	achter bord - Anton Pgilipsweg	Uithoorn	NH	\N	\N
1734	05-09-2014	2014-09-05 00:00:00	27/17	tdemmer	05-09-2014	2014-09-05 00:00:00	27/17	Ronald_010	52.022953	4.51610994	aan hek trap HSL - Groendalseweg	Bleiswijk	ZH	\N	\N
2415	08-05-2017	2017-05-08 00:00:00	34/39	nappertje	08-05-2017	2017-05-08 00:00:00	34/40	Amauta	51.9895096	5.94755077	in auto P-terrein HAN	Arnhem	Ge	\N	\N
1139	26-03-2013	2013-03-26 00:00:00	19/82	V-Strommert	26-03-2013	2013-03-26 00:00:00	19/83	Ronald_010	52.1470032	4.52412319	in put van brug over Oude Rijn	Leiderdorp	ZH	\N	\N
996	16-11-2012	2012-11-16 00:00:00	17/94	Sjakie-77	16-11-2012	2012-11-16 00:00:00	17/95	Bigtwim	52.5158997	4.70704603	Paardenkamplaan	Uitgeest	NH	\N	\N
2955	10-12-2018	2018-12-10 00:00:00	40/126	Hjerteknuser	12-12-2018	2018-12-12 00:00:00	40/127	sanger	52.5225258	4.63963318	Kruisbergweg	Heemskerk	NH	\N	\N
1855	01-03-2015	2015-03-01 00:00:00	28/22	MotorDonkey	05-03-2015	2015-03-05 00:00:00	28/23	tdemmer	51.8274994	5.25590611	in brug monument - Waalbandijk	Waardenburg	Ge	\N	\N
2927	11-10-2018	2018-10-11 00:00:00	40/86	Bensi	13-10-2018	2018-10-13 00:00:00	40/87	Raviel	52.0033035	6.60016012	tegen hek Engelse schans	Lichtenvoorde	Ge	\N	\N
3558	28-06-2020	2020-06-28 00:00:00	40/717	Picobello BV	28-06-2020	2020-06-28 00:00:00	40/717	Nelfrikandel	51.9056549	4.44305801	in expeditiezone Vierhavenstraat	Rotterdam	ZH	\N	\N
3619	11-08-2020	2020-08-11 00:00:00	40/776	Bensi	12-08-2020	2020-08-12 00:00:00	40/777	pdv_moto	52.2975159	6.42119598	tegen boom p-plaats Wullenbergweg	Holten	Ov	\N	\N
3625	15-08-2020	2020-08-15 00:00:00	40/784	Amauta	15-08-2020	2020-08-15 00:00:00	40/785	FastEddy	53.1127892	6.42653179	tegen plaatsnaambord Alteveer, Stuwweg	Noorderveld	Dr	\N	\N
1947	26-06-2015	2015-06-26 00:00:00	29/10	BSI	26-06-2015	2015-06-26 00:00:00	29/10	Sjantaalfoutje	52.1336861	6.00594711	achter boom bij Loenense waterval	Loenen	Ge	\N	\N
3148	16-06-2019	2019-06-16 00:00:00	40/360	FastEddy	19-06-2019	2019-06-19 00:00:00	40/361	MeanYellowBoy	53.0366669	7.08040285	aan reling ter Wuppingerweg	Onstwedde	Gr	\N	\N
1977	31-07-2015	2015-07-31 00:00:00	29/32	coffeejunk	01-08-2015	2015-08-01 00:00:00	29/32	vuurbloed	52.2841568	4.6615448	aan paal knooppunt 62	Hoofddorp	NH	\N	\N
3530	04-06-2020	2020-06-04 00:00:00	40/693	MeanYellowBoy	05-06-2020	2020-06-05 00:00:00	40/693	Amauta	52.6140175	6.54490519	aan bochtmarkering Stobbeplasweg	Lutten	Ov	\N	\N
2930	17-10-2018	2018-10-17 00:00:00	40/90	Arriens	18-10-2018	2018-10-18 00:00:00	40/90	nappertje	51.9877205	5.94499111	tegen hek Ruitenbergerlaan	Arnhem	Ge	\N	\N
1543	08-03-2014	2014-03-08 00:00:00	25/14	Scoot_020/Scoot_2	08-03-2014	2014-03-08 00:00:00	25/14	Ronald_010	52.6358681	5.10989285	aan hek bij molen Zuiderdijk	Schellinkhout	NH	\N	\N
784	21-04-2012	2012-04-21 00:00:00	15/39	Hasseman	21-04-2012	2012-04-21 00:00:00	15/39	scheurschuimpje	52.2961693	6.91889811	in wals Temmink - Kleibultweg, Oldenzaal, Ov	Oldenzaal	Ov	\N	\N
3879	15-04-2021	2021-04-15 00:00:00	41/044	HermanK	15-04-2021	2021-04-15 00:00:00	41/044	MeanYellowBoy	51.8963509	5.734972	tegen perenboom Waalstraat	Andelst	Ge	\N	\N
168	15-12-2010	2010-12-15 00:00:00	5/45	ootje	17-12-2010	2010-12-17 00:00:00	5/45	bobcat	52.3807068	4.70929384	monument - Kr. Spieringweg, Zwanenburg, NH	Zwanenburg	NH	\N	\N
2007	04-09-2015	2015-09-04 00:00:00	29/59	ArendJan	05-09-2015	2015-09-05 00:00:00	29/59	pdv_moto	52.0066185	4.68779278	achter E-kasten - Voltaweg	Gouda	ZH	\N	\N
3473	24-04-2020	2020-04-24 00:00:00	40/645	Outdoor Man	24-04-2020	2020-04-24 00:00:00	40/646	Coenster	52.295208	4.9022522	achter E-kast Kerkstraat	Ouderkerk a/d Amstel	NH	\N	\N
1069	07-02-2013	2013-02-07 00:00:00	18/95	Meifesto	07-02-2013	2013-02-07 00:00:00	18/96	tdemmer	51.9353218	4.60053301	op rotonde Westerlengte	Capelle aan den Ijssel	ZH	\N	\N
2341	21-02-2017	2017-02-21 00:00:00	33/60	-Floris-	24-02-2017	2017-02-24 00:00:00	33/62	pdv_moto	51.4454994	3.57831502	aan hel/muur - Jan Weugkade	Vlissingen	Ze	\N	\N
3155	01-07-2019	2019-07-01 00:00:00	40/372	Carburateur	02-07-2019	2019-07-02 00:00:00	40/372	Deeffox	51.8604546	4.63918781	aan lantaarnpaal Oostmolendijk	Ridderkerk	ZH	\N	\N
2212	26-08-2016	2016-08-26 00:00:00	31/89	ArendJan	26-08-2016	2016-08-26 00:00:00	31/89	Motormuisje_alice	51.9114761	4.31648207	aan boom Heempark - Marnixlaan	Vlaardingen	ZH	\N	\N
3586	17-07-2020	2020-07-17 00:00:00	40/738	k0en	17-07-2020	2020-07-17 00:00:00	40/738	Roeleey	52.0865631	5.11502218	tegen kastje Rechtbank, Moreelsepark	Utrecht	Ut	\N	\N
1282	13-07-2013	2013-07-13 00:00:00	21/84	Guvner	13-07-2013	2013-07-13 00:00:00	21/85	bikedan	51.3285065	3.81827998	aan boei Portaal van Vlaanderen	Terneuzen	Ze	\N	\N
1364	23-09-2013	2013-09-23 00:00:00	22/91	Scoot_020/Scoot_2	23-09-2013	2013-09-23 00:00:00	22/92	Sjantaalfoutje	52.3920212	4.67924213	aan poot infobord fort - Lagedijk	Spaarndam	NH	\N	\N
3208	13-08-2019	2019-08-13 00:00:00	40/423	Bomba	13-08-2019	2019-08-13 00:00:00	40/423	Hans89	52.0705032	4.85607719	in berm Waardsedijk	Woerden	Ut	\N	\N
495	13-08-2011	2011-08-13 00:00:00	11/46	ootje	13-08-2011	2011-08-13 00:00:00	11/47	BigJim	52.7733879	4.87291098	paaltje bij eind rail - Weereweg 69, Lutjewinkel, NH	Lutjewinkel	NH	\N	\N
211	30-01-2011	2011-01-30 00:00:00	6/69	scheurschuimpje	30-01-2011	2011-01-30 00:00:00	6/69	BSI	52.1008339	5.64611101	Middelpunt Nederland, Lunteren, Ge	Lunteren	Ge	\N	\N
597	22-10-2011	2011-10-22 00:00:00	12/95	Quickly	22-10-2011	2011-10-22 00:00:00	12/96	Wimis on	51.99366	5.07625198	aan wilg Middelwaardseplas, Vianen, Ut	Vianen	Ut	\N	\N
4166	18-04-2022	2022-04-18 00:00:00	41/248	Coenster	18-04-2022	2022-04-18 00:00:00	41/248	k0en	52.086174	5.1319809	bij Spoorwegmuseum Oosterstraat	Utrecht	Ut	\N	\N
882	04-08-2012	2012-08-04 00:00:00	16/62	BSI	05-08-2012	2012-08-05 00:00:00	16/63	dks_aa	52.522419	5.42525578	bij hurkende man - strekdam	Lelystad	Fl	\N	\N
1980	03-08-2015	2015-08-03 00:00:00	29/33	NZo	05-08-2015	2015-08-05 00:00:00	29/34	Roeleey	52.3479538	4.65791798	in wildrooster Vlinderpad	Haarlem	NH	\N	\N
3720	26-10-2020	2020-10-26 00:00:00	40/862	ootje	26-10-2020	2020-10-26 00:00:00	40/862	HighKing	52.4867859	4.81150198	aan waterkant Veerdijk	Wormer	NH	\N	\N
416	07-06-2011	2011-06-07 00:00:00	10/37	lichthuis	08-06-2011	2011-06-08 00:00:00	10/39	Outdoor Man	52.3684998	5.61570311	lichtstand op havenhoofd - Harderdijk, Dronten, Fl	Dronten	Fl	\N	\N
2741	07-05-2018	2018-05-07 00:00:00	38/72	Rik60NL	07-05-2018	2018-05-07 00:00:00	38/72	Bas600	52.1598473	4.86549187	aan helk waterinlaat poldermolen	Woerdens Verlaat	ZH	\N	\N
3700	13-10-2020	2020-10-13 00:00:00	40/846	Outdoor Man	14-10-2020	2020-10-14 00:00:00	40/847	Bensi	51.7553368	5.78908587	aan zuiltje 073 Maasbandijk	Overasselt	Ge	\N	\N
756	27-03-2012	2012-03-27 00:00:00	15/08	Ronald_010	27-03-2012	2012-03-27 00:00:00	15/09	Dave1411	52.1943054	4.55882978	aan paal van hek - Waterloospolder, Oud Ade, ZH	Oud Ade	ZH	\N	\N
413	06-06-2011	2011-06-06 00:00:00	10/35	Bigtwim	07-06-2011	2011-06-07 00:00:00	10/36	Kato	52.455162	4.58205509	aan lantaarnpaal Texelstraat 45, IJmuiden, NH	IJmuiden	NH	\N	\N
637	24-11-2011	2011-11-24 00:00:00	13/52	Ronald_010	25-11-2011	2011-11-25 00:00:00	13/53	tdemmer	51.8998909	4.22502422	aan hek bij Botlekbrug - Neckarweg, Botlek, ZH	Botlek	ZH	\N	\N
1256	29-06-2013	2013-06-29 00:00:00	21/55	piertje moffel	29-06-2013	2013-06-29 00:00:00	21/55	Phaedrus	52.3694878	6.0917058	aan hek Laarzenpad - Fortmondeweg	Olst	Ov	\N	\N
825		0001-01-01 00:00:00 BC				0001-01-01 00:00:00 BC		ootje	\N	\N				\N	\N
3100	02-05-2019	2019-05-02 00:00:00	40/301	pdv_moto	02-05-2019	2019-05-02 00:00:00	40/302	Hjerteknuser	52.2630043	4.71053219	tegen boom P-terrein Allsmeerderweg	Rijsenhout	NH	\N	\N
4086	08-01-2022	2022-01-08 00:00:00	41/194	Outdoor Man	08-01-2022	2022-01-08 00:00:00	41/195	Roeleey	52.3329353	4.89078093	in struik Europaboulevard	Amsterdam	NH	\N	\N
2971	27-12-2018	2018-12-27 00:00:00	40/145	FastEddy	28-12-2018	2018-12-28 00:00:00	40/145	pdv_moto	53.0427132	6.90595007	op Pick-nickplaats Hoetmansmeer	Nieuwe Pekela	Gr	\N	\N
1083	17-02-2013	2013-02-17 00:00:00	19/11	Hasseman	18-02-2013	2013-02-18 00:00:00	19/13	frankivo	52.6276703	6.65015411	aan ANWB-paal - Anerveenseweg	Anerveen	Ov	\N	\N
3125	25-05-2019	2019-05-25 00:00:00	40/338	Bomba	25-05-2019	2019-05-25 00:00:00	40/338	Mitssz	51.9544182	4.64820194	onder steiger IJsseldijk-Noord	Ouderkerk a/d Ijssel	ZH	\N	\N
2476	05-07-2017	2017-07-05 00:00:00	35/05	Rik60NL	05-07-2017	2017-07-05 00:00:00	35/06	highking	52.1876831	4.82347393	in wilg - Hoge Dijk	Zevenhoven	ZH	\N	\N
3794	30-01-2021	2021-01-30 00:00:00	40/926	pdv_moto	01-02-2021	2021-02-01 00:00:00	40/926	Hans89	51.9622269	4.18116283	tegen paaltje Hoeksebaan/Bonnenweg	Hoek van Holland	ZH	\N	\N
1516	16-02-2014	2014-02-16 00:00:00	24/84	bobcat	16-02-2014	2014-02-16 00:00:00	24/84	BigJim	52.4831467	4.66175413	aan boompje naast deur - Schans	Beverwijk	NH	\N	\N
1662	14-06-2014	2014-06-14 00:00:00	26/39	Scoot_020/Scoot_2	14-06-2014	2014-06-14 00:00:00	26/39	Ronald_010	51.8768578	4.5202179	onder brug Spinozapark	Rotterdam	ZH	\N	\N
2380	12-04-2017	2017-04-12 00:00:00	34/05	Amauta	12-04-2017	2017-04-12 00:00:00	34/06	frankivo	53.0891304	6.31158304	in bosje bij grenspaal 148	Bakkeveen	Dr	\N	\N
3937	15-06-2021	2021-06-15 00:00:00	41/094	FastEddy	15-06-2021	2021-06-15 00:00:00	41/094	MeanYellowBoy	52.8522072	6.75150204	in hoek bij museum Ellert en Brammert	Schoonoord	Dr	\N	\N
462	14-07-2011	2011-07-14 00:00:00	11/03	krhilbil	14-07-2011	2011-07-14 00:00:00	11/04	vuurbloed	51.4961586	4.03642702	in bosje bij Schuitweg, Yerseke, Ze	Yerseke	Ze	\N	\N
1526	22-02-2014	2014-02-22 00:00:00	24/96	Scoot_020/Scoot_2	22-02-2014	2014-02-22 00:00:00	24/96	Ronald_010	51.7336693	5.27305079	tegen sluisdeur Crevecoeur	s-Hertogenbosch	NB	\N	\N
1729	31-08-2014	2014-08-31 00:00:00	27/13	Djoost	01-09-2014	2014-09-01 00:00:00	27/14	Bigtwim	52.4438972	4.83949995	achter muurtje - Vermiljoenweg	Zaandam	NH	\N	\N
3104	04-05-2019	2019-05-04 00:00:00	40/307	pdv_moto	05-05-2019	2019-05-05 00:00:00	40/308	Sjefman	51.518528	3.46079803	tegen boom Grindweg	Westkapelle	Ze	\N	\N
3893	01-05-2021	2021-05-01 00:00:00	41/059	Coenster	01-05-2021	2021-05-01 00:00:00	41/060	Ronald_010	52.2320099	4.99599504	tegen boom theekoepel Rijksstraatweg	Baambrugge	Ut	\N	\N
2697	08-04-2018	2018-04-08 00:00:00	38/17	HermanK	08-04-2018	2018-04-08 00:00:00	38/17	MeanYellowBoy	52.5205498	6.52086782	axhter boom Spijkerweg	Stegeren	Ov	\N	\N
3085	22-04-2019	2019-04-22 00:00:00	40/282	Sjefman	22-04-2019	2019-04-22 00:00:00	40/283	pdv_moto	51.5128479	4.16592884	in VHF-bord havenhoofd Gortzakweg	Tholen	Ze	\N	\N
3953	25-06-2021	2021-06-25 00:00:00	41/104	BSI	25-06-2021	2021-06-25 00:00:00	41/105	FastEddy	52.9469414	5.42353678	tegen E-kast GSM-mast Stationsweg	Hindeloopen	Fr	\N	\N
1436	03-12-2013	2013-12-03 00:00:00	23/93	Hasseman	07-12-2013	2013-12-07 00:00:00	23/95	BSI	52.2684326	6.99238205	onder treinwagon - Havezatensingel	Losser	Ov	\N	\N
3825	07-03-2021	2021-03-07 00:00:00	41/002	Outdoor Man	07-03-2021	2021-03-07 00:00:00	41/003	HighKing	52.9056168	4.71659994	achter bunker Batterijmuseum Zanddijk	Julianadorp	NH	\N	\N
1673	04-07-2014	2014-07-04 00:00:00	26/52	Bludge	07-07-2014	2014-07-07 00:00:00	26/53	Bensi	51.9321938	6.02885294	achter E-kast Bedeaux - Dorpstraat	Groessen	Ge	\N	\N
1583	02-04-2014	2014-04-02 00:00:00	25/56	Bomba	04-04-2014	2014-04-04 00:00:00	25/57	tdemmer	51.9852066	4.91190195	onder bruggetje P-terrein - Damweg	Lopik	Ut	\N	\N
3590	19-07-2020	2020-07-19 00:00:00	40/740	Outdoor Man	19-07-2020	2020-07-19 00:00:00	40/740	Coenster	52.322998	5.07928419	aan boompje P-terrein Hackelaar	Muiden	NH	\N	\N
3082	21-04-2019	2019-04-21 00:00:00	40/280	pdv_moto	21-04-2019	2019-04-21 00:00:00	40/280	Amauta	52.975441	6.95673323	in bord bebouwde kom N374	Stadskanaal	Gr	\N	\N
27	30-08-2010	2010-08-30 00:00:00	1/89	Miss2	30-08-2010	2010-08-30 00:00:00	1/92	Ted	52.5582771	5.86463881	Schansdijk, Kampen, Ov	Kampen	Ov	\N	\N
151	27-11-2010	2010-11-27 00:00:00	5/18	vuurbloed	27-11-2010	2010-11-27 00:00:00	5/19	V-Strommert	52.3295288	4.64886904	druppel Kruisweg-Spieringsweg, Qruquius, NH	Qruquius	NH	\N	\N
4102	21-01-2022	2022-01-21 00:00:00	41/203	Amauta	23-01-2022	2022-01-23 00:00:00	41/204	Ronald_010	50.8223076	5.69393778	aan hek van hoeve Lichtenberg	Maastricht	Li	\N	\N
3656	06-09-2020	2020-09-06 00:00:00	40/812	Janhertog	06-09-2020	2020-09-06 00:00:00	40/813	BSI	52.9417458	5.99704504	in bouwwerk Ecokathedraal	Mildam	Fr	\N	\N
3219	21-08-2019	2019-08-21 00:00:00	40/434	Amauta	22-08-2019	2019-08-22 00:00:00	40/435	Roeleey	53.2818565	6.27142286	aan lantaarnpaal Wester Waarddijk	Pieterzijl	Gr	\N	\N
4219	14-07-2022	2022-07-14 00:00:00	41/280	Hans89	16-07-2022	2022-07-16 00:00:00	41/281	Phaedrus	51.9083061	4.46850586	in struik bij Noorse Seemanskerk	Rotterdam	ZH	\N	\N
3424	21-03-2020	2020-03-21 00:00:00	40/602	HighKing	22-03-2020	2020-03-22 00:00:00	40/603	Coenster	52.3727455	4.94273281	aan brugpijler Red Bridge	Amsterdam	NH	\N	\N
515	25-08-2011	2011-08-25 00:00:00	11/69	Hasseman	26-08-2011	2011-08-26 00:00:00	11/72	BSI	52.3070374	6.99063921	in struik bij P-terrein - Lossersestraat, de Lutte, Ov	de Lutte	Ov	\N	\N
2352	07-03-2017	2017-03-07 00:00:00	33/75	frankivo	10-03-2017	2017-03-10 00:00:00	33/75	Amauta	53.2028122	6.54465294	aan monument Scholten - Stadpark	Groningen	Gr	\N	\N
1488	23-01-2014	2014-01-23 00:00:00	24/49	SparkViv	23-01-2014	2014-01-23 00:00:00	24/50	Dirk130	52.0811615	4.33123779	aan paal hoek afrit Utrechtsebaan	Den Haag	ZH	\N	\N
1852	27-02-2015	2015-02-27 00:00:00	28/21	JurgenT	27-02-2015	2015-02-27 00:00:00	28/21	me-daph	52.0847893	5.10293388	stand ik wil … jaarbeurs 09D057	Utrecht	Ut	\N	\N
1847	24-02-2015	2015-02-24 00:00:00	28/18	Corney28	25-02-2015	2015-02-25 00:00:00	28/19	Scoot_020/Scoot_2	52.2034569	4.81491423	aan paal de Strooppot	de Hoef	Ut	\N	\N
1493	28-01-2014	2014-01-28 00:00:00	24/56	bikedan	29-01-2014	2014-01-29 00:00:00	24/56	Hans89	51.3913765	4.33757591	bij Maria met kind - Moleneind	Ossendrecht	NB	\N	\N
4432	28-11-2023	2023-11-28 00:00:00	41/420	pdv_moto	02-12-2023	2023-12-02 00:00:00	41/421	Marsian	52.2998619	5.32474995	tegen paaltje 19,6 langs N704	Zeewolde	Fl	\N	\N
1466	07-01-2014	2014-01-07 00:00:00	24/25	Wimis on	09-01-2014	2014-01-09 00:00:00	24/27	rutgertjuh	52.0530167	5.15042496	aan bermpaaltje - Fortweg	Houten	Ut	\N	\N
1353	16-09-2013	2013-09-16 00:00:00	22/79	Ronald_010	16-09-2013	2013-09-16 00:00:00	22/80	jaap43	51.9099884	4.30035019	aan paaltje golfterrein - Zuidbuurt	Vlaardingen	ZH	\N	\N
1169	14-04-2013	2013-04-14 00:00:00	20/30	Ronald_010	14-04-2013	2013-04-14 00:00:00	20/31	Wimis on	51.8647346	5.88044977	onder gastank Wijnforf - Bemmelsedijk	Lent	Ge	\N	\N
507	19-08-2011	2011-08-19 00:00:00	11/58	BSI	19-08-2011	2011-08-19 00:00:00	11/59	rvdh86	52.0855484	5.66920805	aan hek Scheleberg - Immenweg, Lunteren, Ge	Lunteren	Ge	\N	\N
3617	09-08-2020	2020-08-09 00:00:00	40/772	Yosra87	10-08-2020	2020-08-10 00:00:00	40/774	Hans89	51.8764687	4.50447512	tegen hek Zuiderbegraafplaats, Slinge	Rotterdam	ZH	\N	\N
79	02-10-2010	2010-10-02 00:00:00	3/40	V-Strommert	03-10-2010	2010-10-03 00:00:00	3/42	niet opgehaald	53.3989716	6.45595884	hoogholtje Martenspad, Pieterburen, Gr	Pieterburen	Gr	\N	\N
4258	26-10-2022	2022-10-26 00:00:00	41/306	Deeffox	27-10-2022	2022-10-27 00:00:00	41/306	Phaedrus	51.7945709	4.71506977	tegen E-huis Kromme Zandweg	Dordrecht	NH	\N	\N
3752	16-11-2020	2020-11-16 00:00:00	40/885	k0en	16-11-2020	2020-11-16 00:00:00	40/886	Carburateur	51.6494217	5.2711339	in perk 4 kolommen Helvoirtseweg	Vught	NB	\N	\N
3789	23-01-2021	2021-01-23 00:00:00	40/923	Amauta	23-01-2021	2021-01-23 00:00:00	40/923	BornToReign	52.1681137	4.82391024	tegen boom sportpark Gerberastraat	Noorden	ZH	\N	\N
3653	02-09-2020	2020-09-02 00:00:00	40/810	Amauta	03-09-2020	2020-09-03 00:00:00	40/810	MeanYellowBoy	53.1913872	6.55349302	onder blok stadsmarkering SO2	Groningen	Gr	\N	\N
1627	06-05-2014	2014-05-06 00:00:00	25/96	tdemmer	06-05-2014	2014-05-06 00:00:00	25/96	XJ Elff	51.7756958	4.26471519	bij paaltje Oudendijk	Goudswaard	ZH	\N	\N
2837	28-07-2018	2018-07-28 00:00:00	39/86	Outdoor Man	28-07-2018	2018-07-28 00:00:00	39/87	Hjerteknuser	52.2967033	4.88986111	bij peilschaal Elsenhove	Amstelveen	NH	\N	\N
3222	28-08-2019	2019-08-28 00:00:00	40/441	Sjefman	29-08-2019	2019-08-29 00:00:00	40/442	Hans89	51.4538116	4.30958509	tegen boom Beukendreef, Mattemburg	Hoogerheide	NB	\N	\N
3637	21-08-2020	2020-08-21 00:00:00	40/796	Roeleey	21-08-2020	2020-08-21 00:00:00	40/797	k0en	52.3381844	4.9856348	in bloempot Overdiemerweg	Diemen	NH	\N	\N
1088	22-02-2013	2013-02-22 00:00:00	19/16	BSI	22-02-2013	2013-02-22 00:00:00	19/17	V-Strommert	52.0838013	5.10029316	onder beeld jaarbeurs	Utrecht	Ut	\N	\N
1182	25-04-2013	2013-04-25 00:00:00	20/49	Roeleey	25-04-2013	2013-04-25 00:00:00	20/51	Bludge	52.9647636	4.77843618	onder affuit Havenplein	Den Helder	NH	\N	\N
3117	14-05-2019	2019-05-14 00:00:00	40/325	Amauta	14-05-2019	2019-05-14 00:00:00	40/326	Ronny Rabbelaar	53.4242096	6.86055422	in hek P-terrein Google	Eemshaven	Gr	\N	\N
1542	07-03-2014	2014-03-07 00:00:00	25/13	Rainbow600	07-03-2014	2014-03-07 00:00:00	25/13	Scoot_020/Scoot_2	52.3332024	5.07124281	achter muur oprijlaan Muiderslot	Muiden	NH	\N	\N
1630	08-05-2014	2014-05-08 00:00:00	25/98	MLB	09-05-2014	2014-05-09 00:00:00	25/99	XJ Elff	51.9816742	4.10940409	achter muur Noorderhoofd	Hoek van Holland	ZH	\N	\N
2313	15-12-2016	2016-12-15 00:00:00	33/19	ArendJan	16-12-2016	2016-12-16 00:00:00	33/20	Motormuisje_alice	51.9148598	4.31992912	bij trap - Floris de Goedestraat	Vlaardingen	ZH	\N	\N
2186	26-07-2016	2016-07-26 00:00:00	31/58	Einschtein	28-07-2016	2016-07-28 00:00:00	31/60	-Floris-	51.3346786	3.82109499	achter E-kast Binnenvaartweg	Terneuzen	Ze	\N	\N
248	22-02-2011	2011-02-22 00:00:00	7/41	V-Strommert	22-02-2011	2011-02-22 00:00:00	7/42	Perrymy	52.3760376	4.63347006	trap Gasthuisvest/Groot Heiligland, Haarlem, NH	Haarlem	NH	\N	\N
361	05-05-2011	2011-05-05 00:00:00	9/55	jaap43	06-05-2011	2011-05-06 00:00:00	9/56	tdemmer	51.791317	4.75713587	aan hek bij paaltje - Ottersluis, Dordrecht, ZH	Dordrecht	ZH	\N	\N
4023	03-09-2021	2021-09-03 00:00:00	41/150	HighKing	03-09-2021	2021-09-03 00:00:00	41/150	Artemecion	52.7195244	4.87800217	tegen muurtje hek ingang Ruïnekerk	Oude Niedorp	NH	\N	\N
2189	31-07-2016	2016-07-31 00:00:00	31/63	pdv_moto	31-07-2016	2016-07-31 00:00:00	31/63	bikedan	51.7217331	4.40433693	aan bord langs A29	Numansdorp	ZH	\N	\N
4389	19-08-2023	2023-08-19 00:00:00	41/394	BSI	20-08-2023	2023-08-20 00:00:00	41/394	Bensi	52.1862946	5.69224977	aan poot aanplakboord Olaats. Belang	Stroe	Ge	\N	\N
346		0001-01-01 00:00:00 BC				0001-01-01 00:00:00 BC		El Rojo	\N	\N				\N	\N
596	22-10-2011	2011-10-22 00:00:00	12/95	Von Stolk	22-10-2011	2011-10-22 00:00:00	12/95	Quickly	52.0316696	5.00603485	aan hek Stuivenbergweg, IJsselstein, Ut	IJsselstein	Ut	\N	\N
1212	16-05-2013	2013-05-16 00:00:00	20/91	Sjakie-77	16-05-2013	2013-05-16 00:00:00	20/92	Bigtwim	52.4898987	4.69976091	bij infobord fietspad Genieweg	Heemskerk	NH	\N	\N
2004	30-08-2015	2015-08-30 00:00:00	29/56	pdv_moto	01-09-2015	2015-09-01 00:00:00	29/57	Dirk130	52.0928078	4.29002714	naast hek - Scheveningseweg	Den Haag	ZH	\N	\N
626	13-11-2011	2011-11-13 00:00:00	13/40	black mule	15-11-2011	2011-11-15 00:00:00	13/42	V-Strommert	52.4853439	4.63323879	in luchtkoker van bunker - Zeestraat, Beverwijk, NH	Beverwijk	NH	\N	\N
1945	22-06-2015	2015-06-22 00:00:00	29/07	Bomba	23-06-2015	2015-06-23 00:00:00	29/08	ArendJan	52.0661049	4.80745697	aan boom - Molendijkerdwarsweg	Nieuwerbrug	ZH	\N	\N
2	18-08-2010	2010-08-18 00:00:00	1/2	Schwenneh	18-08-2010	2010-08-18 00:00:00	1/4	Stephan	52.1676598	4.99448204	Kanaaldijk West, Breukelen, Ut	Breukelen	Ut	\N	\N
1623	04-05-2014	2014-05-04 00:00:00	25/92	Roeleey	04-05-2014	2014-05-04 00:00:00	25/92	Phaedrus	52.0441437	5.55626917	achter E-kast Voorpoort	Veenendaal	Ge	\N	\N
740	16-03-2012	2012-03-16 00:00:00	14/91	Scoot_020/Scoot_2	17-03-2012	2012-03-17 00:00:00	14/92	Ronald_010	52.0066223	5.04343319	aan vangrail bij Arie Molenaar, IJsselstein, Ut	IJsselstein	Ut	\N	\N
1954	03-07-2015	2015-07-03 00:00:00	29/16	Amauta	06-07-2015	2015-07-06 00:00:00	29/16	Kermit de Hond	53.303463	7.08096218	aan hoek dijkversterking Dollard	Termunten	Gr	\N	\N
3540	10-06-2020	2020-06-10 00:00:00	40/700	Picobello BV	10-06-2020	2020-06-10 00:00:00	40/700	ey-dzeej	51.9764824	4.12652397	aan vlaggenmast bij ferry Stenaline	Hoek van Holland	ZH	\N	\N
240	18-02-2011	2011-02-18 00:00:00	7/27	rutgertjuh	19-02-2011	2011-02-19 00:00:00	7/30	Wimis on	51.952446	5.28946114	in DAF-44 - Sportveldstraat 80?, Beusichem, Ge	Beusichem	Ge	\N	\N
2104	30-04-2016	2016-04-30 00:00:00	30/75	bikedan	01-05-2016	2016-05-01 00:00:00	30/76	pdv_moto	51.3995018	4.21909285	aan paal bij schutsluis	Rilland	Ze	\N	\N
1319	21-08-2013	2013-08-21 00:00:00	22/31	Hasseman	21-08-2013	2013-08-21 00:00:00	22/31	Bensi	52.2880096	6.732934	aan hek Zonne Spoor	Ambt Delden	Ov	\N	\N
3692	05-10-2020	2020-10-05 00:00:00	40/840	pdv_moto	05-10-2020	2020-10-05 00:00:00	40/840	Yosra87	52.0904922	4.267313	in perkje Kranenburgweg	Den Haag	ZH	\N	\N
2999	30-01-2019	2019-01-30 00:00:00	40/190	Amauta	30-01-2019	2019-01-30 00:00:00	40/191	FastEddy	53.039341	6.50030804	in akkerwal Veldweg	Zeijerveld	Dr	\N	\N
1801	29-11-2014	2014-11-29 00:00:00	27/78	pinpoint	30-11-2014	2014-11-30 00:00:00	27/78	BSI	52.2242889	5.70809412	achter beeld - Hooiweg	Garderen	Ge	\N	\N
725	06-03-2012	2012-03-06 00:00:00	14/76	Dirk130	07-03-2012	2012-03-07 00:00:00	14/78	Ronald_010	52.1000595	4.26311922	aan hek NZHRM - Visafslagweg, Scheveningen, ZH	Scheveningen	ZH	\N	\N
1040	01-01-2013	2013-01-01 00:00:00	18/42	motorex	01-01-2013	2013-01-01 00:00:00	18/44	tdemmer	51.8209763	4.84471798	aan hek Rivierdijk	Hardinxveld-Giessendam	ZH	\N	\N
2409	30-04-2017	2017-04-30 00:00:00	34/33	HermanK	30-04-2017	2017-04-30 00:00:00	34/33	BSI	52.4170723	5.78418398	aan brug beek - Oude Zeeweg	Doornspijk	Ge	\N	\N
964	25-10-2012	2012-10-25 00:00:00	17/50	Bar-E	26-10-2012	2012-10-26 00:00:00	17/51	tdemmer	51.8405151	4.28693724	aan hekje Biertsedijk	Simonshaven	ZH	\N	\N
2823	18-07-2018	2018-07-18 00:00:00	39/68	WillyvD	18-07-2018	2018-07-18 00:00:00	39/69	Outdoor Man	51.7278824	5.05524588	tegen boomstam Molensteeg	Eethen	NB	\N	\N
2257	01-10-2016	2016-10-01 00:00:00	32/41	Amauta	01-10-2016	2016-10-01 00:00:00	32/41	frankivo	53.2566528	5.52790594	aan hek bij de visser - Sedijk	Tzummarum	Fr	\N	\N
1124	20-03-2013	2013-03-20 00:00:00	19/65	SadBunny	21-03-2013	2013-03-21 00:00:00	19/65	Roeleey	52.3408585	4.95202303	aan boom Hartveldseweg	Amsterdam	NH	\N	\N
3320	12-12-2019	2019-12-12 00:00:00	40/525	Carburateur	12-12-2019	2019-12-12 00:00:00	40/525	Picobello BV	51.9964485	4.37140083	onder boomstronk park, Rotterdamseweg	Delft	ZH	\N	\N
216	01-02-2011	2011-02-01 00:00:00	6/77	V-Strommert	01-02-2011	2011-02-01 00:00:00	6/77	tdemmer	52.1071892	4.323421	rotonde Oude Waalsdorperweg, Den Haag, ZH	Den Haag	ZH	\N	\N
174		0001-01-01 00:00:00 BC				0001-01-01 00:00:00 BC		Lady_Yce	\N	\N				\N	\N
4020	31-08-2021	2021-08-31 00:00:00	41/149	Outdoor Man	01-09-2021	2021-09-01 00:00:00	41/150	ootje	52.5627174	4.83252811	bij schuurtje Zerkenvloer, Raadhuisstraat	Graft	NH	\N	\N
2616	16-01-2018	2018-01-16 00:00:00	37/06	pdv_moto	17-01-2018	2018-01-17 00:00:00	37/07	SadBunny	52.0993423	4.28271723	aan monument - Scheveningseweg	Den Haag	ZH	\N	\N
2077	08-03-2016	2016-03-08 00:00:00	30/39	Meangreengirl/MeanBlueMan	10-03-2016	2016-03-10 00:00:00	30/40	Amauta	51.2451744	3.91936803	onder trog - Fortdijk-West	Koewacht	Ze	\N	\N
2622	23-01-2018	2018-01-23 00:00:00	37/15	HighKing	23-01-2018	2018-01-23 00:00:00	37/15	BSI	52.1994896	5.27596903	op pad naar scouting	Baarn	Ut	\N	\N
4427	18-11-2023	2023-11-18 00:00:00	41/417	Hans89	18-11-2023	2023-11-18 00:00:00	41/417	WillyvD	51.9174728	4.55855608	in heg perk Tjaikovskistraat	Capelle aan den Ijssel	ZH	\N	\N
2036	13-11-2015	2015-11-13 00:00:00	29/93	Amauta	14-11-2015	2015-11-14 00:00:00	29/94	Bensi	52.4140816	6.21602488	achter boomstam - Assendorperdijk	Wijhe	Ov	\N	\N
1326	27-08-2013	2013-08-27 00:00:00	22/44	Buuv	27-08-2013	2013-08-27 00:00:00	22/45	frankivo	53.0189743	6.54338217	aan paal bord - Ten Oeverstraat	Zeijerveen	Dr	\N	\N
1593	16-04-2014	2014-04-16 00:00:00	25/67	Sjakie-77	16-04-2014	2014-04-16 00:00:00	25/68	Artemecion	52.5153084	4.70716286	Kalverkamplaan	Uitgeest	NH	\N	\N
514	25-08-2011	2011-08-25 00:00:00	11/68	MotorMieke	25-08-2011	2011-08-25 00:00:00	11/69	Hasseman	52.3192749	6.39127493	paadje bij monument - Haarlerweg, Holten, Ov	Holten	Ov	\N	\N
2049	31-12-2015	2015-12-31 00:00:00	30/12	Ronald_010	03-01-2016	2016-01-03 00:00:00	30/13	BSI	51.956234	4.46100903	onder reclameplateau - 16-Hoven	Rotterdam	ZH	\N	\N
4216	06-07-2022	2022-07-06 00:00:00	41/279	BSI	08-07-2022	2022-07-08 00:00:00	41/279	rvdh86	52.2486572	5.76075315	in klimoppagode 't Koetshuis	Uddel	Ge	\N	\N
1443	15-12-2013	2013-12-15 00:00:00	24/03	SparkViv	15-12-2013	2013-12-15 00:00:00	24/04	SadBunny	51.8943558	4.38873577	achter muurtje Pernisserhoofd	Pernis	ZH	\N	\N
2665	18-03-2018	2018-03-18 00:00:00	37/82	BSI	19-03-2018	2018-03-19 00:00:00	37/82	Rik60NL	52.2206306	5.60790586	achter steenwal rotonde	Putten	Ge	\N	\N
436	16-06-2011	2011-06-16 00:00:00	10/66	Outdoor Man	18-06-2011	2011-06-18 00:00:00	10/70	artikel5	52.6203156	5.77165794	grondvest toren - Ruinepad, Schokland, Fl	Schokland	Fl	\N	\N
2686	01-04-2018	2018-04-01 00:00:00	38/06	Rik60NL	02-04-2018	2018-04-02 00:00:00	38/06	SadBunny	52.2043839	4.84468317	aan hek P-terrein Oosterlandweg	Mijdrecht	Ut	\N	\N
3111	10-05-2019	2019-05-10 00:00:00	40/318	BSI	10-05-2019	2019-05-10 00:00:00	40/319	Bensi	52.1866226	6.24948788	onder afdak karting Eefde, Elzendijk	Joppe	Ge	\N	\N
2648	27-02-2018	2018-02-27 00:00:00	37/56	pdv_moto	04-03-2018	2018-03-04 00:00:00	37/60	Bosso	51.4950333	3.74373794	in heg Postweg/Lewedijk	Lewedorp	Ze	\N	\N
4384	04-08-2023	2023-08-04 00:00:00	41/391	Pydejong	05-08-2023	2023-08-05 00:00:00	41/392	FastEddy	53.2994461	7.07379198	tegen hekpost bij fort Fiemel	Termunten	Gr	\N	\N
1703	29-07-2014	2014-07-29 00:00:00	26/82	jaap43	29-07-2014	2014-07-29 00:00:00	26/82	Dirtbag	51.6087875	4.49935007	onder hek - St. Anthoniedijk	Oud-Gastel	NB	\N	\N
2276	16-10-2016	2016-10-16 00:00:00	32/68	Amauta	18-10-2016	2016-10-18 00:00:00	32/69	Capo-04/06	50.9276657	5.73812914	aan hekpilaar Kaakvoetpad	Geulle a/d Maas	Li	\N	\N
2848	07-08-2018	2018-08-07 00:00:00	39/100	Coenster	07-08-2018	2018-08-07 00:00:00	40/01	Hjerteknuser	52.3908043	4.66825199	achter brievenbus A. Hofmanweg	Haarlem	NH	\N	\N
3171	13-07-2019	2019-07-13 00:00:00	40/386	pdv_moto	13-07-2019	2019-07-13 00:00:00	40/386	Raviel	51.8941689	6.05207586	aan paal uitzichtpunt Beuningsestraat	Aerdt	Ge	\N	\N
2083	24-03-2016	2016-03-24 00:00:00	30/48	Bensi	26-03-2016	2016-03-26 00:00:00	30/49	pdv_moto	51.7038078	5.67697287	in bosje bij molen - Kerkstraat	Zeeland	NB	\N	\N
1351	14-09-2013	2013-09-14 00:00:00	22/77	bikedan	15-09-2013	2013-09-15 00:00:00	22/78	tdemmer	51.3983917	4.33766985	bij boom zandpad - Eikenlaan	Ossendrecht	NB	\N	\N
2588	11-11-2017	2017-11-11 00:00:00	36/59	Kurros	12-11-2017	2017-11-12 00:00:00	36/60	BSI	52.6164474	4.62019777	aan trap Zeeweg	Egmond aan Zee	NH	\N	\N
330	15-04-2011	2011-04-15 00:00:00	9/6	tdemmer	15-04-2011	2011-04-15 00:00:00	9/7	ndeeka	51.8224525	4.04495907	hek bij radarpost, Haringvlietdam, ZH	Haringvlietdam	ZH	\N	\N
3060	30-03-2019	2019-03-30 00:00:00	40/257	Coenster	30-03-2019	2019-03-30 00:00:00	40/257	vuurbloed	52.3027267	4.53643417	klem tussen borden bij Waternet	De Zilk	NH	\N	\N
1541	07-03-2014	2014-03-07 00:00:00	25/12	Scoot_020/Scoot_2	07-03-2014	2014-03-07 00:00:00	25/13	Rainbow600	52.3521004	4.78358507	achter muur - Joop Woortmanplein	Amsterdam	NH	\N	\N
1118	18-03-2013	2013-03-18 00:00:00	19/58	Ronald_010	18-03-2013	2013-03-18 00:00:00	19/59	SadBunny	51.978157	4.1217432	aan boom Cruquiusweg	Hoek van Holland	ZH	\N	\N
3645	30-08-2020	2020-08-30 00:00:00	40/805	FastEddy	30-08-2020	2020-08-30 00:00:00	40/806	Amauta	52.9861298	6.98760509	bij kei rest. De Rode Loper, Tinnegieter	Stadskanaal	Gr	\N	\N
122	03-11-2010	2010-11-03 00:00:00	4/46	V-Strommert	03-11-2010	2010-11-03 00:00:00	4/46	BigJim	52.2671509	4.60794687	Leusveld, Nieuw Vennep, NH	Nieuw-Vennep	NH	\N	\N
8	21-08-2010	2010-08-21 00:00:00	1/20	Jeltel	21-08-2010	2010-08-21 00:00:00	1/20	BrouwerER6N	52.0600243	5.93931484	Terlet - Apeldoornseweg, Arnhem, Ge	Arnhem	Ge	\N	\N
3677	26-09-2020	2020-09-26 00:00:00	40/831	Ronny Rabbelaar	26-09-2020	2020-09-26 00:00:00	40/831	Amauta	53.3277359	6.92673206	onder ankerlier bij Noorderpoort	Delfzijl	Gr	\N	\N
2103	30-04-2016	2016-04-30 00:00:00	30/75	Dirk130	30-04-2016	2016-04-30 00:00:00	30/75	bikedan	51.6703033	4.08126783	aan groene boei - Jachthavenvweg	Bruinisse	Ze	\N	\N
3339	25-12-2019	2019-12-25 00:00:00	40/537	Ronny Rabbelaar	25-12-2019	2019-12-25 00:00:00	40/537	Amauta	52.9983177	6.60795116	aan hek bij stuw Deurzerdiep	Assen	Dr	\N	\N
3537	08-06-2020	2020-06-08 00:00:00	40/698	MBKNLD	08-06-2020	2020-06-08 00:00:00	40/698	k0en	52.16259	5.03170586	aan hekpost bij fort Tienhoven	Breukelen	Ut	\N	\N
2803	29-06-2018	2018-06-29 00:00:00	39/42	pdv_moto	30-06-2018	2018-06-30 00:00:00	39/43	Roeleey	51.5426483	3.44662905	tegen bord voorrangskruising Hogeweg	Westkapelle	Ze	\N	\N
3005	03-02-2019	2019-02-03 00:00:00	40/196	Amauta	03-02-2019	2019-02-03 00:00:00	40/197	HighKing	52.7118149	4.64305305	tussen betonblokken P-plaats Hargen	Schoorl	NH	\N	\N
3280	25-10-2019	2019-10-25 00:00:00	40/489	SadBunny	27-10-2019	2019-10-27 00:00:00	40/489	pdv_moto	52.2341728	4.96034384	aan steiger Zandeiland 4	Vinkeveen	Ut	\N	\N
1475	14-01-2014	2014-01-14 00:00:00	24/36	Corney28	14-01-2014	2014-01-14 00:00:00	24/36	Blogem	52.2530212	4.90245819	in slagboomvoet brug Waverdijk	Waverveen	Ut	\N	\N
2307	11-12-2016	2016-12-11 00:00:00	33/16	Ronald_010	11-12-2016	2016-12-11 00:00:00	33/16	pdv_moto	51.9090652	4.36755323	aan vlaggemast - P-terrein	Vlaardingen	ZH	\N	\N
1215	18-05-2013	2013-05-18 00:00:00	20/94	SadBunny	18-05-2013	2013-05-18 00:00:00	20/94	evolver86	52.388958	4.85743618	aan hek bij spoor - Contactweg	Amsterdam	NH	\N	\N
3378	10-02-2020	2020-02-10 00:00:00	40/564	Outdoor Man	11-02-2020	2020-02-11 00:00:00	40/565	pdv_moto	52.3221016	4.867836	in holle boomstam Buitenverldert	Amsterdam	NH	\N	\N
2497	24-07-2017	2017-07-24 00:00:00	35/28	Okami_Xci	27-07-2017	2017-07-27 00:00:00	35/29	Rik60NL	51.4086914	5.4760499	bij slagboom Charles Roelslaan	Eindhoven	NB	\N	\N
209	26-01-2011	2011-01-26 00:00:00	6/60	scheurschuimpje	28-01-2011	2011-01-28 00:00:00	6/64	Miss2	52.8109055	7.07119894	afdakje Kloosterweg, Emmercompascuum, Dr	Emmer-Compascuum	Dr	\N	\N
3049	22-03-2019	2019-03-22 00:00:00	40/250	Schwenneh	23-03-2019	2019-03-23 00:00:00	40/250	Rik60NL	52.3856239	4.70714808	tegen brugpijler Oude Notweg	Spaarndam	NH	\N	\N
800	15-05-2012	2012-05-15 00:00:00	12/57	MotorMieke	17-05-2012	2012-05-17 00:00:00	15/58	rvdh86	52.2777634	6.66875505	paddestoel - Langenhorsterweg, Ambt Delden, Ov	Ambt Delden	Ov	\N	\N
3229	01-09-2019	2019-09-01 00:00:00	40/446	jaap43	01-09-2019	2019-09-01 00:00:00	40/446	Bomba	52.014061	4.80342484	achter buis sluisje Steinsedijk	Haastrecht	ZH	\N	\N
562	03-10-2011	2011-10-03 00:00:00	12/45	Wimis on	03-10-2011	2011-10-03 00:00:00	12/46	rvdh86	52.0255585	5.17362213	achter scherm bij oude station, Houten, Ut	Houten	Ut	\N	\N
3970	07-07-2021	2021-07-07 00:00:00	41/117	BigJim	08-07-2021	2021-07-08 00:00:00	41/118	HighKing	52.6070061	4.76485491	tegen brug over uitstort gemaal	Alkmaar	NH	\N	\N
2832	26-07-2018	2018-07-26 00:00:00	39/81	Roeleey	26-07-2018	2018-07-26 00:00:00	39/81	SadBunny	52.2917824	4.95193291	achter betonbalk Muntbergweg	Amsterdam	NH	\N	\N
3183	30-07-2019	2019-07-30 00:00:00	40/398	Outdoor Man	30-07-2019	2019-07-30 00:00:00	40/398	Coenster	52.3163567	4.84225798	onder bruggetje J.P.Thijsepark	Amstelveen	NH	\N	\N
2658	13-03-2018	2018-03-13 00:00:00	37/74	frankivo	14-03-2018	2018-03-14 00:00:00	37/75	FastEddy	52.9898682	6.98528385	onder afdak infobord Dwarsweg	Stadskanaal	Gr	\N	\N
145	20-11-2010	2010-11-20 00:00:00	5/2	I-accelarate	20-11-2010	2010-11-20 00:00:00	5/2	Foncelot	52.5514755	6.71916914	Wielenweg/Melkweg, Hardenberg, Ov	Hardenberg	Ov	\N	\N
2593	16-11-2017	2017-11-16 00:00:00	36/64	Bigtwim	17-11-2017	2017-11-17 00:00:00	36/65	SadBunny	52.48592	4.65824223	in hoek Wijkertoren - Kerkstraat	Beverwijk	NH	\N	\N
3007	05-02-2019	2019-02-05 00:00:00	40/198	Coenster	05-02-2019	2019-02-05 00:00:00	40/198	HighKing	52.1275101	5.04682779	tegen struik P-terrein Techniekweg	Utrecht	Ut	\N	\N
1983	09-08-2015	2015-08-09 00:00:00	29/36	BSI	10-08-2015	2015-08-10 00:00:00	29/37	Roeleey	52.1284676	4.65171909	aan bunker Weteringpad	Alphen a/d Rijn	ZH	\N	\N
1821	05-01-2015	2015-01-05 00:00:00	27/94	Rainbow600	06-01-2015	2015-01-06 00:00:00	27/95	Bas600	52.0097084	5.05713081	onder bruggetje - Techniekweg	Ijsselstein	Ut	\N	\N
3050	23-03-2019	2019-03-23 00:00:00	40/250	Rik60NL	24-03-2019	2019-03-24 00:00:00	40/251	jaap43	52.1016312	4.75224686	aan knotwilg de Meije	Bodegraven	ZH	\N	\N
412	06-06-2011	2011-06-06 00:00:00	10/34	Scoot_020/Scoot_2	06-06-2011	2011-06-06 00:00:00	10/35	Bigtwim	52.3419266	4.81742191	boom bij bruggetje - Sloterweg, Amsterdam, NH	Amsterdam	NH	\N	\N
2487	15-07-2017	2017-07-15 00:00:00	35/18	jaap43	15-07-2017	2017-07-15 00:00:00	35/18	tdemmer	51.9207153	4.629529	aan hek Tiendweg	Krimpen aan den IJssel	ZH	\N	\N
3572	06-07-2020	2020-07-06 00:00:00	40/727	HighKing	06-07-2020	2020-07-06 00:00:00	40/727	ootje	52.5024071	4.69294596	tegen paaltje struinpad Zuidermaatweg	Heemskerk	NH	\N	\N
2932	19-10-2018	2018-10-19 00:00:00	40/91	BornToReign	20-10-2018	2018-10-20 00:00:00	40/91	ootje	52.0059128	5.79022598	tegen hekpost P&R Parallelweg	Wolfheze	Ge	\N	\N
1179	22-04-2013	2013-04-22 00:00:00	20/44	sirdrinksalotofpetrol	22-04-2013	2013-04-22 00:00:00	20/44	Bludge	52.0613899	5.89788485	in vliegtuig luchtvaartmuseum	Deelen	Ge	\N	\N
930	21-09-2012	2012-09-21 00:00:00	17/08	BSI	21-09-2012	2012-09-21 00:00:00	17/08	magnamaniac	52.2259293	6.01258993	in struik Deventersestraat	Apeldoorn	Ge	\N	\N
132	08-11-2010	2010-11-08 00:00:00	4/65	Dennisik	08-11-2010	2010-11-08 00:00:00	4/65	tdemmer	51.9543915	4.17346382	Gemaal Westland, Hoek van Holland, ZH	Hoek van Holland	ZH	\N	\N
4191	15-05-2022	2022-05-15 00:00:00	41/263	Ronny Rabbelaar	18-05-2022	2022-05-18 00:00:00	41/264	Amauta	53.1140442	6.6601429	aan boom bij bankje Heiveen	Midlaren	Dr	\N	\N
3009	06-02-2019	2019-02-06 00:00:00	40/200	Hjerteknuser	07-02-2019	2019-02-07 00:00:00	40/201	Roeleey	52.4939194	4.58698082	aan paaltje bij Luistervink	Wijk aan Zee	NH	\N	\N
892	09-08-2012	2012-08-09 00:00:00	16/70	JurgenT	10-08-2012	2012-08-10 00:00:00	16/71	de peppel	52.0536842	6.37834692	in bord - Varsselseweg bij molen	Varssel	Ge	\N	\N
366	10-05-2011	2011-05-10 00:00:00	9/64	Bigtwim	11-05-2011	2011-05-11 00:00:00	9/65	Scoot_020/Scoot_2	52.4632797	4.58254099	kade - kop van de haven Sluisplein, IJmuiden, NH	IJmuiden	NH	\N	\N
4085	07-01-2022	2022-01-07 00:00:00	41/193	pdv_moto	07-01-2022	2022-01-07 00:00:00	41/194	Outdoor Man	52.0694656	4.22191381	in bloembak Deltaplein	Kijkduin	ZH	\N	\N
3860	02-04-2021	2021-04-02 00:00:00	41/029	MeanYellowBoy	02-04-2021	2021-04-02 00:00:00	41/029	Janhertog	52.5999069	6.39787912	achter schakelkast de Korte Spruit	Balkbrug	Ov	\N	\N
807	21-05-2012	2012-05-21 00:00:00	15/64	Bigtwim	23-05-2012	2012-05-23 00:00:00	15/66	ootje	52.4670944	4.55501604	trap op Noorderhavenhoofd, IJmuiden, NH	IJmuiden	NH	\N	\N
3508	23-05-2020	2020-05-23 00:00:00	40/672	Ronny Rabbelaar	23-05-2020	2020-05-23 00:00:00	40/673	ronk	51.8582077	5.02885199	onder aan dijkhuisje Zuiderlingedijk	Spijk	Ge	\N	\N
4281	14-01-2023	2023-01-14 00:00:00	41/324	Amauta	15-01-2023	2023-01-15 00:00:00	41/324	FastEddy	53.0046654	6.9793849	onder visvlonder bij Onstwedderweg	Stadskanaal	Gr	\N	\N
821	09-06-2012	2012-06-09 00:00:00	15/82	scheurschuimpje	12-06-2012	2012-06-12 00:00:00	15/85	Buuv	52.8642616	6.12072277	aan paal landgoed -Zuiderweg, Vinkega, Fr	Vinkega	Fr	\N	\N
1759	05-10-2014	2014-10-05 00:00:00	27/38	pdv_moto	05-10-2014	2014-10-05 00:00:00	27/39	crazy987	51.5066795	4.30899715	in heg Potlodenlaan	Bergen op Zoom	NB	\N	\N
3997	27-07-2021	2021-07-27 00:00:00	41/135	Hans89	31-07-2021	2021-07-31 00:00:00	41/136	Deeffox	51.5220947	3.56210589	zzn zinkerpaaltje Poppendamseweg	Grijpskerk	Ze	\N	\N
2786	17-06-2018	2018-06-17 00:00:00	39/21	Coenster	18-06-2018	2018-06-18 00:00:00	39/22	Roeleey	52.2093887	4.81436491	aan reclamezuil 1e Hoefweg	de Hoef	Ut	\N	\N
3450	11-04-2020	2020-04-11 00:00:00	40/627	Hans89	12-04-2020	2020-04-12 00:00:00	40/628	pdv_moto	51.9169617	4.48223209	in bloembak Maritiem museum, 	Rotterdam	ZH	\N	\N
3006	04-02-2019	2019-02-04 00:00:00	40/197	HighKing	04-02-2019	2019-02-04 00:00:00	40/198	Coenster	52.3341255	4.81379795	onder steiger strand Oeverlanden	Amsterdam	NH	\N	\N
1072	08-02-2013	2013-02-08 00:00:00	18/97	Roeleey	09-02-2013	2013-02-09 00:00:00	18/98	Ronald_010	52.3022575	4.99824286	op P-terrein - Valburgdreef	Amsterdam	NH	\N	\N
3372	03-02-2020	2020-02-03 00:00:00	40/560	HighKing	04-02-2020	2020-02-04 00:00:00	40/561	ootje	52.620285	4.77577877	aan beschoeiing Ventweg	Alkmaar	NH	\N	\N
289	25-03-2011	2011-03-25 00:00:00	8/31	Outdoor Man	25-03-2011	2011-03-25 00:00:00	8/31	d-s	52.6432152	4.65673399	parkeerterrein Woudweg, Bergen aan Zee, NH	Bergen aan Zee	NH	\N	\N
2695	08-04-2018	2018-04-08 00:00:00	38/16	Kato	08-04-2018	2018-04-08 00:00:00	38/16	MeanYellowBoy	53.0389252	6.5002389	aan stam Veldweg	Huis ter Heide	Dr	\N	\N
865	21-07-2012	2012-07-21 00:00:00	16/49	rvdh86	21-07-2012	2012-07-21 00:00:00	16/50	frankwijers	52.0640373	5.69228506	achter infobord P-plaats - Hessenweg	Ede	Ge	\N	\N
401	02-06-2011	2011-06-02 00:00:00	10/26	Gejabo	03-06-2011	2011-06-03 00:00:00	10/28	Hayfork	51.9073105	5.97200203	monument boortunnel Betuwelijn, Angeren, Ge	Angeren	Ge	\N	\N
2320	25-12-2016	2016-12-25 00:00:00	33/26	inSaNo	26-12-2016	2016-12-26 00:00:00	33/27	pdv_moto	52.6347656	5.77720308	in infobord Middelbuurt	Schokland	Fl	\N	\N
2058	28-01-2016	2016-01-28 00:00:00	30/20	ArendJan	28-01-2016	2016-01-28 00:00:00	30/20	Hans89	51.9238014	4.41680288	aan brug Thurledeweg	Rotterdam	ZH	\N	\N
4111	04-02-2022	2022-02-04 00:00:00	41/210	Outdoor Man	04-02-2022	2022-02-04 00:00:00	41/211	Roeleey	52.3173676	4.84718418	tegen boom p-terrein Amsterdamsebos	Amstelveen	NH	\N	\N
450	02-07-2011	2011-07-02 00:00:00	10/89	Ronald_010	02-07-2011	2011-07-02 00:00:00	10/90	jaap43	51.9387512	4.18861008	Noordzeeweg - landtong, Rozenburg, ZH	Rozenburg	ZH	\N	\N
3130	30-05-2019	2019-05-30 00:00:00	40/342	ootje	31-05-2019	2019-05-31 00:00:00	40/343	Amauta	52.9903908	5.49334383	in bus aan hek Brekkenpaad	Nijhuizum	Fr	\N	\N
1342	05-09-2013	2013-09-05 00:00:00	22/64	Guvner	05-09-2013	2013-09-05 00:00:00	22/64	Ronald_010	52.184948	4.54204702	aan boom Leidseweg	Oud Ade	ZH	\N	\N
686	14-01-2012	2012-01-14 00:00:00	14/15	Ronald_010	15-01-2012	2012-01-15 00:00:00	14/15	Scoot_020/Scoot_2	52.1762581	4.90377903	bij boom op P-terrein - Bovendijk 2, Wilnis, Ut	Wilnis	Ut	\N	\N
1288	20-07-2013	2013-07-20 00:00:00	21/94	TheMetalhead	21-07-2013	2013-07-21 00:00:00	21/95	de peppel	51.9451256	6.02870083	Kuiperstraat	Duiven	Ge	\N	\N
1727	29-08-2014	2014-08-29 00:00:00	27/12	Roeleey	29-08-2014	2014-08-29 00:00:00	27/12	Rainbow600	52.3034515	5.02238512	aan hek Verlengde Buitenweer	Weesp	NH	\N	\N
1762	07-10-2014	2014-10-07 00:00:00	27/41	pdv_moto	07-10-2014	2014-10-07 00:00:00	27/41	MLB	52.0966263	4.26409197	achter container Hellingweg	Scheveningen	ZH	\N	\N
324	10-04-2011	2011-04-10 00:00:00	8/91	ndeeka	10-04-2011	2011-04-10 00:00:00	8/91	Wimis on	52.1385117	4.95676804	bankje Wagendijk/Schutterskade, Kockengen, Ut	Kockengen	Ut	\N	\N
1090	24-02-2013	2013-02-24 00:00:00	19/20	Corney28	24-02-2013	2013-02-24 00:00:00	19/22	Roeleey	52.2074051	4.92843294	aan schraag ophaalbrug Ringdijk	Vinkeveen	Ut	\N	\N
2118	08-05-2016	2016-05-08 00:00:00	30/87	Meifesto	08-05-2016	2016-05-08 00:00:00	30/87	SadBunny	51.8674545	4.38512421	tussen rioolputten - Hofweg	Poortugaal	ZH	\N	\N
688	16-01-2012	2012-01-16 00:00:00	14/17	BSI	19-01-2012	2012-01-19 00:00:00	14/18	madmarv	52.1227951	5.5695529	lichtzuil brug Scherpenzeelseweg, Barneveld, Ge	Barneveld	Ge	\N	\N
3592	20-07-2020	2020-07-20 00:00:00	40/741	Bensi	20-07-2020	2020-07-20 00:00:00	40/741	BSI	52.0185585	6.06753922	aan 5e boom pad bij kasteel Middachten	De Steeg	Ge	\N	\N
1767	10-10-2014	2014-10-10 00:00:00	27/46	Roeleey	10-10-2014	2014-10-10 00:00:00	27/46	Rainbow600	52.3361244	4.88976002	aan paal Europaboulevard	Amsterdam	NH	\N	\N
3676	26-09-2020	2020-09-26 00:00:00	40/830	Amauta	26-09-2020	2020-09-26 00:00:00	40/831	Ronny Rabbelaar	53.2629623	6.16798306	in struik bij knoppunt 46	Buitenpost	Fr	\N	\N
2294	24-11-2016	2016-11-24 00:00:00	33/03	pdv_moto	24-11-2016	2016-11-24 00:00:00	33/03	PatrickSoler	52.0939293	4.29948187	achter pilaar park Kerkhoflaan	Den Haag	ZH	\N	\N
292		0001-01-01 00:00:00 BC		riggard		0001-01-01 00:00:00 BC			\N	\N				\N	\N
3846	26-03-2021	2021-03-26 00:00:00	41/019	k0en	26-03-2021	2021-03-26 00:00:00	41/019	BSI	52.0647202	5.17093611	tegen hek pad naar fort Rhijnauwen	Bunnik	Ut	\N	\N
815	03-06-2012	2012-06-03 00:00:00	15/76	Outdoor Man	04-06-2012	2012-06-04 00:00:00	15/78	scheurschuimpje	52.5708466	5.80968189	Herdenkingsbos - Roggebotweg, Dronten, Fl	Dronten	Fl	\N	\N
1655	31-05-2014	2014-05-31 00:00:00	26/28	Dirk130	31-05-2014	2014-05-31 00:00:00	26/28	Rainbow600	50.8211861	5.80303192	aan paaltje bij mil. begr. plaats	Margraten	Li	\N	\N
1420	16-11-2013	2013-11-16 00:00:00	23/77	jaap43	16-11-2013	2013-11-16 00:00:00	23/78	tdemmer	51.7989655	4.53143883	aan boom - Polderdijk	Maasdam	ZH	\N	\N
2606	27-12-2017	2017-12-27 00:00:00	36/89	Rik60NL	28-12-2017	2017-12-28 00:00:00	36/89	Hjerteknuser	52.2157288	4.81975889	onder vlonder - Kromme Mijdrecht	de Hoef	Ut	\N	\N
861	15-07-2012	2012-07-15 00:00:00	16/38	Directeur	17-07-2012	2012-07-17 00:00:00	16/40	MIA	53.3915138	5.88267422	achter aan bord op de Grândyk	Holwerd	Fr	\N	\N
3461	18-04-2020	2020-04-18 00:00:00	40/636	vuurbloed	18-04-2020	2020-04-18 00:00:00	40/637	Outdoor Man	52.3301926	4.6711688	aan hekwerk uitzichtpunt plas	Hoofddorp	NH	\N	\N
3514	26-05-2020	2020-05-26 00:00:00	40/677	Picobello BV	26-05-2020	2020-05-26 00:00:00	40/677	pdv_moto	51.9221153	4.41517496	aan billboard Schievesteweg	Schiedam	ZH	\N	\N
1439	09-12-2013	2013-12-09 00:00:00	23/97	Ronald_010	10-12-2013	2013-12-10 00:00:00	23/98	SadBunny	51.9741745	4.38294506	aan paaltje bij camping Delflandhoeve	Delft	ZH	\N	\N
2694	07-04-2018	2018-04-07 00:00:00	38/15	FastEddy	07-04-2018	2018-04-07 00:00:00	38/15	Kato	53.0232735	6.81248283	0nder brug over Hunze, Noordveensedijk	Gieter	Dr	\N	\N
4248	02-10-2022	2022-10-02 00:00:00	41/301	Outdoor Man	03-10-2022	2022-10-03 00:00:00	41/301	ootje	52.573288	4.83632088	onder brug Noordeinde	Noordeinde	NH	\N	\N
798	12-05-2012	2012-05-12 00:00:00	15/54	Buuv	13-05-2012	2012-05-13 00:00:00	15/55	Hasseman	53.0316429	6.57733393	onder bord Zwedenlaan, Assen, Dr	Assen	Dr	\N	\N
2424	16-05-2017	2017-05-16 00:00:00	34/47	Totl	16-05-2017	2017-05-16 00:00:00	34/47	Eztys	53.0952301	6.23894882	in bosje Klauwertswei	Siegerswoude	Fr	\N	\N
856	09-7-2012	2012-07-09 00:00:00	16/30	scheurschuimpje	10-07-2012	2012-07-10 00:00:00	16/30	frankivo	52.888813	6.31536007	aan infobord monument	Oude Willem	Dr	\N	\N
221	05-02-2011	2011-02-05 00:00:00	6/85	BSI	05-02-2011	2011-02-05 00:00:00	6/85	MotorMieke	52.2774849	5.74605322	gevallen boom - Uddelermeerweg 26, Staveren, Ge	Staveren	Ge	\N	\N
497	13-08-2011	2011-08-13 00:00:00	11/47	BigJim	14-08-2011	2011-08-14 00:00:00	11/48	honda_power	52.7059555	4.95138216	in bloempot monument - de Graafweg, Opmeer, NH	Opmeer	NH	\N	\N
3730	31-10-2020	2020-10-31 00:00:00	40/869	k0en	31-10-2020	2020-10-31 00:00:00	40/869	Outdoor Man	52.0527115	5.103127	tegen paaltje onder Jutfasebrug	Nieuwegein	Ut	\N	\N
1834	31-01-2015	2015-01-31 00:00:00	28/07	BSI	31-01-2015	2015-01-31 00:00:00	28/07	Wimis on	52.0899582	5.17504406	in knotwil - Harvardlaan	Utrecht	Ut	\N	\N
2316	18-12-2016	2016-12-18 00:00:00	33/22	BSI	20-12-2016	2016-12-20 00:00:00	33/23	pdv_moto	52.1687622	5.60600424	achter legosteen - Mercuriusweg	Barneveld	Ge	\N	\N
3161	06-07-2019	2019-07-06 00:00:00	40/377	Arriens	06-07-2019	2019-07-06 00:00:00	40/377	Raviel	51.8995705	6.20935297	aan paaltje Peekerweg	Beek	Ge	\N	\N
2726	25-04-2018	2018-04-25 00:00:00	38/56	HighKing	26-04-2018	2018-04-26 00:00:00	38/57	Roeleey	52.4856911	4.95040607	achter boo McDonalds, Verzetlaan	Purmerend	NH	\N	\N
501	16-08-2011	2011-08-16 00:00:00	11/51	Scoot_020/Scoot_2	17-08-2011	2011-08-17 00:00:00	11/52	Bigtwim	52.6351357	4.8754549	aan paal - de Gouden Karper - Oostdijk, Ursem, NH	Ursem	NH	\N	\N
679	31-12-2011	2011-12-31 00:00:00	14/03	BSI	01-01-2012	2012-01-01 00:00:00	14/05	Hasseman	52.6683693	6.26674509	aan boom bij tolhuis - Gemeenteweg, de Wijk, Dr	de Wijk	Dr	\N	\N
3787	17-01-2021	2021-01-17 00:00:00	40/921	Amauta	18-01-2021	2021-01-18 00:00:00	40/921	FastEddy	53.0260468	6.9196229	in bosje riet Pekelderstraat	Stadskanaal	Gr	\N	\N
1885	15-04-2015	2015-04-15 00:00:00	28/54	leeqnl	17-04-2015	2015-04-17 00:00:00	28/55	Amauta	53.2027702	6.54464579	achter monument Concourslaan	Groningen	Gr	\N	\N
3119	15-05-2019	2019-05-15 00:00:00	40/327	FastEddy	15-05-2019	2019-05-15 00:00:00	40/329	Amauta	53.1486053	7.07752895	tegen hek bij schutsluis	Winschoten	Gr	\N	\N
1870	24-03-2015	2015-03-24 00:00:00	28/37	ootje	25-03-2015	2015-03-25 00:00:00	28/38	Bomba	52.5640373	4.69469786	aan hek Schoolweg	Limmen	NH	\N	\N
3962	30-06-2021	2021-06-30 00:00:00	41/110	MeanYellowBoy	01-07-2021	2021-07-01 00:00:00	41/112	Amauta	52.6158752	6.37068701	tegen hekje Nieuwedijk	Balkbrug	Ov	\N	\N
2798	26-06-2018	2018-06-26 00:00:00	39/37	MeanYellowBoy	26-06-2018	2018-06-26 00:00:00	39/37	frankws	52.6202087	6.42495108	achter E-kast den Oosterhuis	Balkbrug	Ov	\N	\N
3341	30-12-2019	2019-12-30 00:00:00	40/540	Outdoor Man	31-12-2019	2019-12-31 00:00:00	40/540	pdv_moto	52.3208504	4.78692102	aan hek Loevensteinse Randweg	Schiphol	NH	\N	\N
281	23-03-2011	2011-03-23 00:00:00	8/19	…Marco…	24-03-2011	2011-03-24 00:00:00	8/22	fien	52.284832	6.92905807	onder bord McDrive - Hanzepoort, Oldenzaal, Ov	Oldenzaal	Ov	\N	\N
1927	08-06-2015	2015-06-08 00:00:00	28/91	Vins111	08-06-2015	2015-06-08 00:00:00	28/91	Rik60NL	52.1053467	4.99891186	achter heg P-terrein bij	Vleuten	Ut	\N	\N
2558	30-09-2017	2017-09-30 00:00:00	36/15	Amauta	01-10-2017	2017-10-01 00:00:00	36/16	MP_NL	53.3475685	6.42521095	bij boom luchtwachttoren 701	Warfhuizen	Gr	\N	\N
3419	19-03-2020	2020-03-19 00:00:00	40/598	HighKing	20-03-2020	2020-03-20 00:00:00	40/599	ootje	52.6323051	4.78119087	tegem brugpijler Schermerdijk	Alkmaar	NH	\N	\N
2229	06-09-2016	2016-09-06 00:00:00	32/05	Bigtwim	06-09-2016	2016-09-06 00:00:00	32/05	ootje	52.4961166	4.65501595	aan boom rotonde Plesmanweg	Beverwijk	NH	\N	\N
2671	23-03-2018	2018-03-23 00:00:00	37/89	Amauta	23-03-2018	2018-03-23 00:00:00	37/89	HighKing	52.6366463	5.06388998	in hoogd Willem Bontekoe, Houten hoofd	Hoornsterzwaag	NH	\N	\N
4367	28-06-2023	2023-06-28 00:00:00	41/379	Okami_Xci	29-06-2023	2023-06-29 00:00:00	41/380	MIA	52.0433578	5.55594683	in heg bij laadpaal Op Traverse	Veenendaal	Ut	\N	\N
549	22-09-2011	2011-09-22 00:00:00	12/26	BigJim	23-09-2011	2011-09-23 00:00:00	12/27	BSI	52.4719505	4.81550407	museumwinkel AH - Zaanse Schans, Zaandam, NH	Zaandam	NH	\N	\N
1148	01-04-2013	2013-04-01 00:00:00	19/96	V-Strommert	01-04-2013	2013-04-01 00:00:00	19/96	BSI	52.2494278	4.43421698	in bosje helm - Zeereep	Noordwijk	ZH	\N	\N
2216	28-08-2016	2016-08-28 00:00:00	31/92	SadBunny	28-08-2016	2016-08-28 00:00:00	31/93	Roeleey	52.405571	4.85799217	aan hek Coenhavenstraat	Amsterdam	NH	\N	\N
2321	26-12-2016	2016-12-26 00:00:00	33/27	pdv_moto	28-12-2016	2016-12-28 00:00:00	33/28	-Floris-	51.5067558	3.56118107	bij toegangshek Kapel	Grijpskerke	Ze	\N	\N
225	08-02-2011	2011-02-08 00:00:00	6/94	Bensi	08-02-2011	2011-02-08 00:00:00	6/95	Outdoor Man	52.0127029	6.06737089	parkeerterrein Rhedense Veerweg, Giesbeek, Ge	Giesbeek	Ge	\N	\N
1699	24-07-2014	2014-07-24 00:00:00	26/76	Hooglander1	25-07-2014	2014-07-25 00:00:00	26/77	jaap43	51.2996292	5.49029922	achter muur ingang Achelsekluis	Leende	NB	\N	\N
3289	31-10-2019	2019-10-31 00:00:00	40/496	Picobello BV	31-10-2019	2019-10-31 00:00:00	40/497	Hans89	51.9559593	4.36856318	onder picknicktafel, Harreweg	Schiedam	ZH	\N	\N
204	21-01-2011	2011-01-21 00:00:00	6/39	MotorMieke	21-01-2011	2011-01-21 00:00:00	6/40	Gertman	52.4933891	6.43166924	Boswachterij Ommen - Hammerweg, Ommen, Ov	Ommen	Ov	\N	\N
473	23-07-2011	2011-07-23 00:00:00	11/19	Scoot_020/Scoot_2	28-07-2011	2011-07-28 00:00:00	11/23	tdemmer	50.9050217	5.98776293	aan paal kruispunt Heiweg/Kapelweg, Heerlen, Li	Heerlen	Li	\N	\N
46	12-09-2010	2010-09-12 00:00:00	2/67	DutchKingKong	12-09-2010	2010-09-12 00:00:00	2/67	Bensi	52.0357971	6.09042978	Zutphensestraatweg, Ellecom, Ge	Ellecom	Ge	\N	\N
1303	12-08-2013	2013-08-12 00:00:00	22/17	me-daph	12-08-2013	2013-08-12 00:00:00	22/17	Hasseman	52.2851181	6.76164818	aan hek bij viaduct Schildsweg	Hengelo	Ov	\N	\N
4233	11-08-2022	2022-08-11 00:00:00	41/291	pdv_moto	24-08-2022	2022-08-24 00:00:00	41/293	WillyvD	51.5301857	3.4648819	aan paal gemeentebord Poppekerke	Westkapelle	Ze	\N	\N
1880	11-04-2015	2015-04-11 00:00:00	28/50	Scoot_020/Scoot_2	11-04-2015	2015-04-11 00:00:00	28/50	Djoost	52.4812584	4.92609882	aan hek Purmerland	Purmerland	NH	\N	\N
4346	27-05-2023	2023-05-27 00:00:00	41/367	Ronald_010	28-05-2023	2023-05-28 00:00:00	41/367	BSI	52.3277168	6.26464987	in pol pampasgras bij Spekhoekbrug	Heeten	Ov	\N	\N
2023	08-10-2015	2015-10-08 00:00:00	29/78	Dirk130	08-10-2015	2015-10-08 00:00:00	29/78	jaap43	51.9512482	4.8513341	aan fietsbrug Opweg	Schoonhoven	ZH	\N	\N
1609	27-04-2014	2014-04-27 00:00:00	25/83	Bomba	27-04-2014	2014-04-27 00:00:00	25/83	BSI	52.1673584	5.29194212	aan paaltje speelveld Valeriaanstraat	Soest	Ut	\N	\N
3634	20-08-2020	2020-08-20 00:00:00	40/794	Hans89	20-08-2020	2020-08-20 00:00:00	40/794	Phaedrus	51.9171371	4.55356503	onder trap in torentje Fascinatio	Capelle aan den Ijssel	ZH	\N	\N
3094	27-04-2019	2019-04-27 00:00:00	40/291	HighKing	28-04-2019	2019-04-28 00:00:00	40/292	Pendragon	52.5642014	4.69116497	achter CAI-kastje, Zuidkerkenlaan	Limmen	NH	\N	\N
2350	05-03-2017	2017-03-05 00:00:00	33/73	HermanK	05-03-2017	2017-03-05 00:00:00	33/74	Amauta	52.3974991	6.37836313	aan hek Buzelaarstraat	Luttenberg	Ov	\N	\N
2369	01-04-2017	2017-04-01 00:00:00	33/93	BornToReign	01-04-2017	2017-04-01 00:00:00	33/93	Bensi	52.0086555	5.79525423	tegen bord airbornmonument	Wolfheze	Ge	\N	\N
4215	01-07-2022	2022-07-01 00:00:00	41/278	FastEddy	06-07-2022	2022-07-06 00:00:00	41/279	BSI	52.7494736	6.83447599	tegen boom Wijnbergsteeg	Erm 	Dr	\N	\N
1913	14-05-2015	2015-05-14 00:00:00	28/76	bikedan	15-05-2015	2015-05-15 00:00:00	28/77	BSI	51.4998779	4.26610804	bij paal  - Bongaertweg	Bergen op Zoom	NB	\N	\N
3398	02-03-2020	2020-03-02 00:00:00	40/580	Outdoor Man	03-03-2020	2020-03-03 00:00:00	40/581	pdv_moto	52.4346275	5.08928823	onder slagboom Zeedijk	Uitdam	NH	\N	\N
3945	20-06-2021	2021-06-20 00:00:00	41/099	ootje	20-06-2021	2021-06-20 00:00:00	41/099	BigJim	52.5180321	4.68454313	tegen schutting Prof. ten Doeschatestraat	Heemskerk	NH	\N	\N
3225	30-08-2019	2019-08-30 00:00:00	40/444	Sjefman	30-08-2019	2019-08-30 00:00:00	40/444	Hans89	51.6797905	4.63618803	tegen struik aan de Lapdijk	Moerdijk	NB	\N	\N
3831	10-03-2021	2021-03-10 00:00:00	41/007	Outdoor Man	10-03-2021	2021-03-10 00:00:00	41/008	Coenster	52.3395348	5.07687807	aan eind tankversperring Waterliniepad	Muiden	NH	\N	\N
1380	02-10-2013	2013-10-02 00:00:00	23/26	Wimis on	02-10-2013	2013-10-02 00:00:00	23/26	Low Profile	52.0331497	5.1853199	achter betonnen paaltje - Kruisweg	Houten	Ut	\N	\N
1508	10-02-2014	2014-02-10 00:00:00	24/74	Scoot_020/Scoot_2	10-02-2014	2014-02-10 00:00:00	24/76	Ronald_010	52.3537102	4.79638577	aan tuinhek Rosa Manusstraat	Amsterdam	NH	\N	\N
2551	20-09-2017	2017-09-20 00:00:00	36/03	Wimis on	21-09-2017	2017-09-21 00:00:00	36/04	SadBunny	52.0280304	5.12733078	aan schutting Carpoolplaats	Houten	Ut	\N	\N
665	19-12-2011	2011-12-19 00:00:00	13/85	rvdh86	21-12-2011	2011-12-21 00:00:00	13/86	BSI	52.3323288	5.8250308	aan hek Nunspeterweg, Vierhouten, Ge	Vierhouten	Ge	\N	\N
3476	26-04-2020	2020-04-26 00:00:00	40/648	FastEddy	26-04-2020	2020-04-26 00:00:00	40/648	Amauta	52.8475113	6.86623478	bij grafheuvel Eppiesbarchien Bergseweg	Valthe	Dr	\N	\N
104	22-10-2010	2010-10-22 00:00:00	3/92	Bensi	22-10-2010	2010-10-22 00:00:00	3/94	MP_NL	51.9031906	6.2530551	molenbelt, Zeddam, Ge	Zeddam	Ge	\N	\N
2960	18-12-2018	2018-12-18 00:00:00	40/132	ey-dzeej	19-12-2018	2018-12-19 00:00:00	40/132	pdv_moto	51.967308	4.59889793	in poot vlaggemast rotonde Europalaan	Nieuwerkerk a/d IJssel	ZH	\N	\N
3431	27-03-2020	2020-03-27 00:00:00	40/609	HighKing	27-03-2020	2020-03-27 00:00:00	40/610	Artemecion	52.5127335	4.6683259	in kruiwagen rotonde Marquettelaan	Heemskerk	NH	\N	\N
3627	16-08-2020	2020-08-16 00:00:00	40/786	Ronny Rabbelaar	16-08-2020	2020-08-16 00:00:00	40/786	Amauta	53.2412224	6.09579611	bij picknickplek SBB, de Wedze	Twijzel	Fr	\N	\N
2569	17-10-2017	2017-10-17 00:00:00	36/33	Amauta	17-10-2017	2017-10-17 00:00:00	36/33	Ronny Rabbelaar	53.236145	6.65015507	aan betonnen hekpaal	Schoterdiep. Harkstede	Gr	\N	\N
3309	30-11-2019	2019-11-30 00:00:00	40/518	tdemmer	01-12-2019	2019-12-01 00:00:00	40/519	BSI	52.1481667	6.00392818	in vangrail spoorlijn Immenbergweg	Beekbergen	Ge	\N	\N
80	03-10-2010	2010-10-03 00:00:00	3/42	V-Strommert	04-10-2010	2010-10-04 00:00:00	3/43	Emgi	51.5284233	3.43333507	Zeedijk, Westkapelle, Ze	Westkapelle	Ze	\N	\N
933		0001-01-01 00:00:00 BC				0001-01-01 00:00:00 BC		Eady	\N	\N				\N	\N
3356	19-01-2020	2020-01-19 00:00:00	40/549	pdv_moto	19-01-2020	2020-01-19 00:00:00	40/549	Picobello BV	52.1207771	4.29568911	aan eind ZwartePad	Scheveningen	ZH	\N	\N
3628	16-08-2020	2020-08-16 00:00:00	40/786	Amauta	17-08-2020	2020-08-17 00:00:00	40/787	pdv_moto	53.1992378	6.59880877	aan tui stadsmarkering Duinkerkenstraat	Groningen	Gr	\N	\N
3469	22-04-2020	2020-04-22 00:00:00	40/643	SadBunny	23-04-2020	2020-04-23 00:00:00	40/643	Hans89	52.1111946	4.67142487	bij aquaduct Boskoopseweg	Alphen a/d Rijn	ZH	\N	\N
1917	17-05-2015	2015-05-17 00:00:00	28/80	BSI	17-05-2015	2015-05-17 00:00:00	28/80	Bensi	52.2369576	6.64140415	aan brug - Veldhuisweg	Ambt Delden	Ov	\N	\N
2541	08-09-2017	2017-09-08 00:00:00	35/89	Okami_Xci	09-09-2017	2017-09-09 00:00:00	35/89	ronk	51.8146133	5.25759315	in wilgenstruik - Stadsdijk	Zaltbommel	Ge	\N	\N
301	02-04-2011	2011-04-02 00:00:00	8/52	MotorMieke	03-04-2011	2011-04-03 00:00:00	8/55	Pinky Ramone	52.3233948	6.9556551	bij theekoepeltje - Tankenbergweg, de Lutte, Ov	de Lutte	Ov	\N	\N
2092	03-04-2016	2016-04-03 00:00:00	30/57	BSI	04-04-2016	2016-04-04 00:00:00	30/58	Bensi	52.1791458	5.59791183	bij hek Baron van Nagellstraat	Voorthuizen	Ge	\N	\N
2013	19-09-2015	2015-09-19 00:00:00	29/67	Sjantaalfoutje	20-09-2015	2015-09-20 00:00:00	29/67	Bensi	51.9097786	6.10677385	aan paal - Babberichseweg	Babberich	Ge	\N	\N
4134	26-02-2022	2022-02-26 00:00:00	41/224	Outdoor Man	26-02-2022	2022-02-26 00:00:00	41/224	Artemecion	52.5032768	4.68601799	tegen boom bij slot Assumburg	Heemskerk	NH	\N	\N
3783	10-01-2021	2021-01-10 00:00:00	40/918	Roeleey	11-01-2021	2021-01-11 00:00:00	40/918	FastEddy	52.5637283	5.63027191	in beton buis bij hek Boslaan	Swifterband	Fl	\N	\N
832	19-06-2012	2012-06-19 00:00:00	16/01	Bigtwim	20-06-2012	2012-06-20 00:00:00	16/03	dks_aa	52.5942039	4.65999222	aan paal infobord Abdij Egmond, Egmond, NH	Egmond	NH	\N	\N
2961	19-12-2018	2018-12-19 00:00:00	40/133	pdv_moto	20-12-2018	2018-12-20 00:00:00	40/134	HighKing	52.1200333	4.58430576	aan boom carpoolplaats	Hazerswoude	ZH	\N	\N
1501	07-02-2014	2014-02-07 00:00:00	24/66	Sjakie-77	07-02-2014	2014-02-07 00:00:00	24/67	bobcat	52.5261497	4.73359013	onder afdak infobord - Lagendijk	Uitgeest	NH	\N	\N
2458	15-06-2017	2017-06-15 00:00:00	34/86	BSI	15-06-2017	2017-06-15 00:00:00	34/86	Amauta	51.279171	3.37564206	aan hek tegen grens België	Sluis	Ze	\N	\N
3260	04-10-2019	2019-10-04 00:00:00	40/473	ey-dzeej	05-10-2019	2019-10-05 00:00:00	40/473	Hans89	51.9815941	4.55314589	in boord "buit eruit" Strandweg	Zevenhuizen	ZH	\N	\N
14		0001-01-01 00:00:00 BC				0001-01-01 00:00:00 BC		Martijnski	\N	\N				\N	\N
3428	23-03-2020	2020-03-23 00:00:00	40/606	Picobello BV	23-03-2020	2020-03-23 00:00:00	40/607	Hans89	51.9205513	4.42075777	in stapel bigbags, Horvathweg	Schiedam	ZH	\N	\N
3836	16-03-2021	2021-03-16 00:00:00	41/011	Hans89	16-03-2021	2021-03-16 00:00:00	41/012	Carburateur	51.9103546	4.49849987	in kraanpoot Entrepothaven	Rotterdam	ZH	\N	\N
1948	26-06-2015	2015-06-26 00:00:00	29/10	Sjantaalfoutje	27-06-2015	2015-06-27 00:00:00	29/10	Bensi	52.256813	6.007617	aan paal picknickplek - Beemterweg	Beemte	Ge	\N	\N
2160	24-06-2016	2016-06-24 00:00:00	31/32	BSI	25-06-2016	2016-06-25 00:00:00	31/34	Bensi	52.2201538	5.7483511	bij monument reg. Infanterie	Nieuw Millingen	Ge	\N	\N
2078	11-03-2016	2016-03-11 00:00:00	30/41	Amauta	12-03-2016	2016-03-12 00:00:00	30/41	pdv_moto	53.2333336	7.16856384	aan kunstwerk "Hongerige Wolf"	Drieborg	Gr	\N	\N
2514	12-08-2017	2017-08-12 00:00:00	35/48	pdv_moto	16-08-2017	2017-08-16 00:00:00	35/49	Hjerteknuser	51.5442467	3.62522101	aan hek kerk - Schotsehoek	Gapinge	Ze	\N	\N
1850	27-02-2015	2015-02-27 00:00:00	28/20	NinjaNoob	27-02-2015	2015-02-27 00:00:00	28/20	Bomba	52.0833549	5.10314608	tribune trialdemo - jaarbeurs 11G054	Utrecht	Ut	\N	\N
1228	01-06-2013	2013-06-01 00:00:00	21/20	rvdh86	01-06-2013	2013-06-01 00:00:00	21/20	Bensi	51.9440155	6.34173203	in heg bij infobord - Kerkstraat	Doetinchem	Ge	\N	\N
1114	14-03-2013	2013-03-14 00:00:00	19/51	Bensi	15-03-2013	2013-03-15 00:00:00	19/52	JurgenT	51.9599762	6.36401796	aan brug P-terrein Slangenburg	Doetinchem	Ge	\N	\N
4390	20-08-2023	2023-08-20 00:00:00	41/395	Bensi	20-08-2023	2023-08-20 00:00:00	41/395	Motor-inator	51.9865608	6.74292612	tegen paaltje ingang 't Wieskamp	Winterswijk	Ge	\N	\N
3847	27-03-2021	2021-03-27 00:00:00	41/020	BSI	27-03-2021	2021-03-27 00:00:00	41/020	BornToReign	52.2065392	5.77857018	onder boom P.plaats Caitwick	Nieuw Millingen	Ge	\N	\N
2770	01-06-2018	2018-06-01 00:00:00	39/06	BSI	02-06-2018	2018-06-02 00:00:00	39/08	Outdoor Man	52.9408379	5.02923679	onder steiger uitkijkplatform	Den Oever	NH	\N	\N
2211	25-08-2016	2016-08-25 00:00:00	31/89	Ronald_010	26-08-2016	2016-08-26 00:00:00	31/89	ArendJan	51.907383	4.74435806	aan bord peilstation Lekdijk West	Bergambacht	ZH	\N	\N
1841	17-02-2015	2015-02-17 00:00:00	28/14	Roeleey	19-02-2015	2015-02-19 00:00:00	28/15	Scoot_020/Scoot_2	52.3127213	5.01584101	bij containers - Stammerlandweg	Amsterdam	NH	\N	\N
3087	23-04-2019	2019-04-23 00:00:00	40/284	Coenster	23-04-2019	2019-04-23 00:00:00	40/284	Rik60NL	52.1285973	5.10448885	in hoek tegen blokkenwand Gageldijk	Overvecht	Ut	\N	\N
533	11-09-2011	2011-09-11 00:00:00	12/02	fien	12-09-2011	2011-09-12 00:00:00	12/03	bakfiets1	52.2300949	6.8362608	onder afdak Burg Stroinkstraat, Enschede, Ov	Enschede	Ov	\N	\N
2566	15-10-2017	2017-10-15 00:00:00	36/30	Ronny Rabbelaar	15-10-2017	2017-10-15 00:00:00	36/30	Amauta	53.2169228	6.80606222	bij pilaar brug Freylemaborg	Slochteren	Gr	\N	\N
781	19-04-2012	2012-04-19 00:00:00	15/36	Merc_xtz750	20-04-2012	2012-04-20 00:00:00	15/37	Hasseman	51.8555145	6.47374678	aan paal aardbol - Anholtseweg, Dinxperlo, Ge	Dinxperlo	Ge	\N	\N
1567	24-03-2014	2014-03-24 00:00:00	25/39	Dirtbag	25-03-2014	2014-03-25 00:00:00	25/41	BSI	52.3111572	5.99772596	onder watergoot - Smallertse Plas	Emst	Ge	\N	\N
35	05-09-2010	2010-09-05 00:00:00	2/41	El Rojo	05-09-2010	2010-09-05 00:00:00	2/42	The_Daphne	52.1753616	5.24942589	Biltseweg/Wieksloterweg Westzijde, Soest, Ut	Soest	Ut	\N	\N
3383	15-02-2020	2020-02-15 00:00:00	40/568	HighKing	16-02-2020	2020-02-16 00:00:00	40/568	Janhertog	52.7838097	5.98116589	aan boom Hoogeweg	Kalenberg	Ov	\N	\N
1333	31-08-2013	2013-08-31 00:00:00	22/54	Bensi	31-08-2013	2013-08-31 00:00:00	22/54	Bludge	51.9304848	5.82827377	aan vlonder - 2e Weteringsewal	Elst	Ge	\N	\N
1095	27-02-2013	2013-02-27 00:00:00	19/27	Roeleey	27-02-2013	2013-02-27 00:00:00	19/27	Ronald_010	52.3295746	4.91612387	aan boom Joan Muyskenweg	Amsterdam	NH	\N	\N
1230	02-06-2013	2013-06-02 00:00:00	21/22	Bludge	03-06-2013	2013-06-03 00:00:00	21/23	Bensi	51.8386002	5.94652224	onder trap E-huisje - Thornsestraat	Persingen	Ge	\N	\N
270	15-03-2011	2011-03-15 00:00:00	8/1	Richard117	16-03-2011	2011-03-16 00:00:00	8/3	Outdoor Man	51.8162575	5.02430296	in holle boom - Slot Loevestein, Poederoyen, Ge	Poederoijen	Ge	\N	\N
1554	12-03-2014	2014-03-12 00:00:00	25/22	Dirk130	12-03-2014	2014-03-12 00:00:00	25/23	-juliet-	51.913147	4.29431677	bij E-kasten - Zuidbuurt	Vlaardingen	ZH	\N	\N
2038	21-11-2015	2015-11-21 00:00:00	29/97	ootje	26-11-2015	2015-11-26 00:00:00	29/97	Bigtwim	52.5473289	4.66288424	in P-garage Bakkerspleintje	Castricum	NH	\N	\N
3843	24-03-2021	2021-03-24 00:00:00	41/017	ootje	24-03-2021	2021-03-24 00:00:00	41/017	Hjerteknuser	52.5434875	4.65424585	onder trap uitzichtpunt Papenberg	Castricum	NH	\N	\N
1896	01-05-2015	2015-05-01 00:00:00	28/66	Artemecion	01-05-2015	2015-05-01 00:00:00	28/66	Bigtwim	53.075985	5.39236212	tussen wielen caravan op camping	Cornwerd	Fr	\N	\N
655	05-12-2011	2011-12-05 00:00:00	13/69	Starscream	08-12-2011	2011-12-08 00:00:00	13/71	MotorMieke	52.4445496	6.67623186	achter infobord - Oude Hoevenweg, Vriezenveen, Ov	Vriezenveen	Ov	\N	\N
2014	20-09-2015	2015-09-20 00:00:00	29/67	Bensi	20-09-2015	2015-09-20 00:00:00	28/68	BSI	51.8874474	6.03443813	aan boompje - Rijndijk	Pannerden	Ge	\N	\N
2727	26-04-2018	2018-04-26 00:00:00	38/57	Roeleey	27-04-2018	2018-04-27 00:00:00	38/58	Hjerteknuser	52.3013763	4.9837141	achter E-kast Valburgdreef	Amsterdam	NH	\N	\N
3131	31-05-2019	2019-05-31 00:00:00	40/343	Amauta	01-06-2019	2019-06-01 00:00:00	40/343	MeanYellowBoy	52.8087273	6.45842695	aan uitzichtpunt Holtveen	Dwingelo	Dr	\N	\N
3727	30-10-2020	2020-10-30 00:00:00	40/867	Okami_Xci	30-10-2020	2020-10-30 00:00:00	40/868	Carburateur	51.4374886	5.4943738	onder container De Kade	Eindhoven	NB	\N	\N
1078	14-02-2013	2013-02-14 00:00:00	19/05	JurgenT	15-02-2013	2013-02-15 00:00:00	19/06	Bensi	52.0385704	6.40741587	bij E-huisje Klaverdijk	Hengelo	Ge	\N	\N
2670	23-03-2018	2018-03-23 00:00:00	37/88	sanger	23-03-2018	2018-03-23 00:00:00	37/89	Amauta	52.4248848	4.62241507	naast infobord slot Brederode	Bloemendaal	NH	\N	\N
1237	07-06-2013	2013-06-07 00:00:00	21/31	MLB	07-06-2013	2013-06-07 00:00:00	21/32	Hans89	51.5196953	3.4549911	aan boom bij bankje - Grindweg	Westkapelle	Ze	\N	\N
3486	03-05-2020	2020-05-03 00:00:00	40/654	pdv_moto	03-05-2020	2020-05-03 00:00:00	40/655	HighKing	52.113472	4.34664106	tegen poot infopaneel Buurtweg	Wassenaar	ZH	\N	\N
1562	17-03-2014	2014-03-17 00:00:00	25/29	Corney28	19-03-2014	2014-03-19 00:00:00	25/32	frankivo	53.3014984	6.60306215	in stapel stenen bij scheve kerktoren	Bedum	Gr	\N	\N
1384	04-10-2013	2013-10-04 00:00:00	23/30	BSI	04-10-2013	2013-10-04 00:00:00	23/31	Ronald_010	51.8175049	5.00841904	in boomstronk - Rijkswal	Woudrichem	NB	\N	\N
1096	27-02-2013	2013-02-27 00:00:00	19/27	Ronald_010	27-02-2013	2013-02-27 00:00:00	19/28	SadBunny	52.0337639	4.50680017	onder stam - Lansinghagaweg	Zoetermeer	ZH	\N	\N
1956	10-07-2015	2015-07-10 00:00:00	29/18	frankivo	10-07-2015	2015-07-10 00:00:00	29/18	Amauta	52.8518105	6.6823988	aan paal Orvelterweg	Orvelte	Dr	\N	\N
56	21-09-2010	2010-09-21 00:00:00	2/93	beeldhouwer	21-09-2010	2010-09-21 00:00:00	2/95	ninanoob	52.4198418	4.82708597	pont Hemkade, Zaandam, NH	Zaandam	NH	\N	\N
901	18-08-2012	2012-08-18 00:00:00	16/80	Phaedrus	18-08-2012	2012-08-18 00:00:00	16/80	Ronald_010	51.8887634	4.42419577	in kunstwerk Waalhavenweg	Rotterdam	ZH	\N	\N
4404	25-09-2023	2023-09-25 00:00:00	41/403	BSI	26-09-2023	2023-09-26 00:00:00	41/404	blub blub	52.2394257	5.70905685	achter bord Laakweg	Garderen	Ge	\N	\N
2126	14-05-2016	2016-05-14 00:00:00	30/95	frankivo	14-05-2016	2016-05-14 00:00:00	30/95	Amauta	52.9824982	6.95234919	aan boom achter Roodkapje	Stadskanaal	Gr	\N	\N
1942	20-06-2015	2015-06-20 00:00:00	29/04	Rik60NL	20-06-2015	2015-06-20 00:00:00	29/05	Vertaix	52.1391716	4.89307308	aan blikvanger - Houtkade	Kamerik	Ut	\N	\N
452	02-07-2011	2011-07-02 00:00:00	10/90	ndeeka	03-07-2011	2011-07-03 00:00:00	10/91	Phaedrus	51.8195038	4.66848898	plantsoen Damiatenbolwerk, Dordrecht, ZH	Dordrecht	ZH	\N	\N
1813	24-12-2014	2014-12-24 00:00:00	27/88	bikedan	24-12-2014	2014-12-24 00:00:00	27/89	dopey85	51.3828201	4.27903891	aan brug - Havenweg	Ossendrecht	NB	\N	\N
1406	01-11-2013	2013-11-01 00:00:00	23/59	SadBunny	02-11-2013	2013-11-02 00:00:00	23/60	Roeleey	53.0208702	5.20792389	aan vangrail viaduct - Afsluitdijk	Breezanddijk	Fr	\N	\N
3223	29-08-2019	2019-08-29 00:00:00	40/442	Hans89	29-08-2019	2019-08-29 00:00:00	40/442	pdv_moto	51.6955414	4.43646717	onder aan versprerring Singel	Willemstad	NB	\N	\N
1827	14-01-2015	2015-01-14 00:00:00	27/99	Rainbow600	15-01-2015	2015-01-15 00:00:00	28/01	Bomba	52.0460434	4.95709801	onder struik - Anne Franklaan	Montfoort	Ut	\N	\N
1559	15-03-2014	2014-03-15 00:00:00	25/26	ndeeka	15-03-2014	2014-03-15 00:00:00	25/27	Phaedrus	51.8586578	4.60745287	onder brug P-terrein Oosterparklaan	Ridderkerk	ZH	\N	\N
601	24-10-2011	2011-10-24 00:00:00	13/02	BSI	25-10-2011	2011-10-25 00:00:00	13/03	Hasseman	52.1437721	5.5921402	aan steiger bij Slot Schaffelaar, Barneveld, Ge	Barneveld	Ge	\N	\N
1959	14-07-2015	2015-07-14 00:00:00	29/20	BSI	15-07-2015	2015-07-15 00:00:00	29/20	Roeleey	52.3354836	4.85399103	achter kastje - Jachthavenweg	Amsterdam	NH	\N	\N
2660	15-03-2018	2018-03-15 00:00:00	37/76	Bassjunky	15-03-2018	2018-03-15 00:00:00	37/77	Ronny Rabbelaar	53.3012924	7.03923178	aan boom P-terrein	Termunterzijl	Gr	\N	\N
774	15-04-2012	2012-04-15 00:00:00	15/31	Buuv	15-04-2012	2012-04-15 00:00:00	15/31	BSI	53.0216789	6.57266283	aan poot van bord Groene Dijk ZZ, Assen, Dr	Assen	Dr	\N	\N
2925	08-10-2018	2018-10-08 00:00:00	40/83	Bensi	09-10-2018	2018-10-09 00:00:00	40/84	Raviel	52.0014877	6.27172899	bij monument Werkkamp Wittebrink	Hummelo	Ge	\N	\N
3138	06-06-2019	2019-06-06 00:00:00	40/350	ArendJan	06-06-2019	2019-06-06 00:00:00	40/350	Carburateur	51.9156456	4.49713612	tegen boom Maaskade	Rotterdam	ZH	\N	\N
3809	20-02-2021	2021-02-20 00:00:00	40/938	MeanYellowBoy	20-02-2021	2021-02-20 00:00:00	40/938	pdv_moto	52.4011574	7.01261997	in bloembak Johanninksweg	Denekamp	Ov	\N	\N
3765	14-12-2020	2020-12-14 00:00:00	40/900	Outdoor Man	16-12-2020	2020-12-16 00:00:00	40/901	ootje	52.4017792	4.89025021	achter put NDSM-pier	Amsterdam	NH	\N	\N
1661	14-06-2014	2014-06-14 00:00:00	26/39	Roeleey	14-06-2014	2014-06-14 00:00:00	26/39	Scoot_020/Scoot_2	52.4146881	4.80888987	aan fietspaalpad - Elbaweg	Amsterdam	NH	\N	\N
3187	02-08-2019	2019-08-02 00:00:00	40/402	MeanYellowBoy	02-08-2019	2019-08-02 00:00:00	40/403	Amauta	52.7106323	5.76385784	tussen palen op rotonde Langedreef	Emmeloord	Fl	\N	\N
2988	13-01-2019	2019-01-13 00:00:00	40/170	Amauta	15-01-2019	2019-01-15 00:00:00	40/171	DKP	51.3592339	6.2239871	achter boomstam Grote Heideweg	Venlo	Li	\N	\N
3236	06-09-2019	2019-09-06 00:00:00	40/451	Artemecion	09-09-2019	2019-09-09 00:00:00	40/452	DKP	50.7856598	5.9062438	een hekpost Schweiberghoeve	Mechelen	Li	\N	\N
1399	24-10-2013	2013-10-24 00:00:00	23/53	Sjantaalfoutje	25-10-2013	2013-10-25 00:00:00	23/54	BSI	52.2648392	5.98566914	aan boom P-terrein Apeldoornskanaal	Beemte	Ge	\N	\N
732	11-03-2012	2012-03-11 00:00:00	14/82	jaap43	11-03-2012	2012-03-11 00:00:00	14/82	madmarv	51.8872414	5.0982461	aan struik Oude Zuiderlingedijk, Asperen, Ge	Asperen	Ge	\N	\N
3441	03-04-2020	2020-04-03 00:00:00	40/619	Outdoor Man	04-04-2020	2020-04-04 00:00:00	40/621	Amauta	52.2776299	5.3052001	bij gemaaltje Harderwijkerweg	Eemmeer	NH	\N	\N
1512	13-02-2014	2014-02-13 00:00:00	24/80	rutgertjuh	13-02-2014	2014-02-13 00:00:00	24/80	Vins111	52.0355988	5.10003519	aan auto op P-terrein Plettenburg	Nieuwegein	Ut	\N	\N
4338	13-05-2023	2023-05-13 00:00:00	41/362	k0en	15-05-2023	2023-05-15 00:00:00	41/362	BSI	52.0754585	5.23842001	aan hekpost Blikkenburgerlaan	Zeist	Ut	\N	\N
1137	25-03-2013	2013-03-25 00:00:00	19/79	Scoot_020/Scoot_2	25-03-2013	2013-03-25 00:00:00	19/80	Roeleey	52.3593864	4.78598785	op grasveld Osdorperban	Amsterdam	NH	\N	\N
612	04-11-2011	2011-11-04 00:00:00	13/23	Scoot_020/Scoot_2	05-11-2011	2011-11-05 00:00:00	13/24	rvdh86	52.3857384	4.87470007	aan hek bij Wester Gasfabriek, Amsterdam, NH	Amsterdam	NH	\N	\N
2398	23-04-2017	2017-04-23 00:00:00	34/23	pdv_moto	23-04-2017	2017-04-23 00:00:00	34/23	Wimis on	52.0486107	5.55819321	achter E-kast overweg	Veenendaal	Ge	\N	\N
1235	05-06-2013	2013-06-05 00:00:00	21/29	Corney28	06-06-2013	2013-06-06 00:00:00	21/29	VreemdeBeet	52.2053223	4.96346378	aan brug Demmeriksekade	Vinkeveen	Ut	\N	\N
3726	28-10-2020	2020-10-28 00:00:00	40/866	Carburateur	29-10-2020	2020-10-29 00:00:00	40/867	Okami_Xci	51.5681114	5.33894491	tegen dode boom Oirschotseweg	Boxtel	NB	\N	\N
3701	14-10-2020	2020-10-14 00:00:00	40/847	Bensi	15-10-2020	2020-10-15 00:00:00	40/847	k0en	51.8161774	5.88922882	tegen boom Mgr. Suyslaan	Heilige Land Stichting	Ge	\N	\N
3301	13-11-2019	2019-11-13 00:00:00	40/508	ey-dzeej	13-11-2019	2019-11-13 00:00:00	40/509	Picobello BV	51.9509926	4.41881895	teen landhoofd Doenbrug	Rotterdam	ZH	\N	\N
1180	22-04-2013	2013-04-22 00:00:00	20/45	Bludge	24-04-2013	2013-04-24 00:00:00	20/47	Corney28	51.8696404	6.04002285	aan paal bij radiopost	Millingen aan de Rijn	Ge	\N	\N
3003	02-02-2019	2019-02-02 00:00:00	40/195	Amauta	02-02-2019	2019-02-02 00:00:00	40/195	FastEddy	53.175457	6.35393715	in bomenrij Parallelweg A7	Tolbert	Gr	\N	\N
1720	20-08-2014	2014-08-20 00:00:00	27/04	crazy987	21-08-2014	2014-08-21 00:00:00	27/04	bikedan	51.5865211	4.72198582	bij uitkijktoren Leursebaan	Etten-Leur	NB	\N	\N
486	02-08-2011	2011-08-02 00:00:00	11/33	BSI	03-08-2011	2011-08-03 00:00:00	11/34	rvdh86	52.0864334	5.55506086	bij bruggetje fort Daatselaar, Renswoude, Ut	Renswoude	Ut	\N	\N
3702	16-10-2020	2020-10-16 00:00:00	40/848	k0en	16-10-2020	2020-10-16 00:00:00	40/848	SadBunny	52.0583534	5.11096621	tegen boompje Liesboschpad	Nieuwegein	Ut	\N	\N
3198	08-08-2019	2019-08-08 00:00:00	40/414	Coenster	08-08-2019	2019-08-08 00:00:00	40/414	pdv_moto	52.1253166	5.02188587	aan paal hoogste portaal	Maarssen	Ut	\N	\N
1755	29-09-2014	2014-09-29 00:00:00	27/35	bikedan	29-09-2014	2014-09-29 00:00:00	27/36	Hans89	51.3841438	4.35641479	bij GSM zendmast - Pannenhoef	Ossendrecht	NB	\N	\N
2135	25-05-2016	2016-05-25 00:00:00	31/08	Bassjunky	25-05-2016	2016-05-25 00:00:00	31/08	Amauta	53.1566467	7.05288792	aan hek einde weg	Winschoten	Gr	\N	\N
2969	26-12-2018	2018-12-26 00:00:00	40/142	Bassjunky	26-12-2018	2018-12-26 00:00:00	40/142	Amauta	53.2324638	7.20680618	aan hek bij Waaiboei	Nieuw Statenzijl	Gr	\N	\N
1518	16-02-2014	2014-02-16 00:00:00	24/86	Smuiger	16-02-2014	2014-02-16 00:00:00	24/86	Splinnie	52.471241	4.90876389	aan hek fietspad - Oostzanerrijweg	Den Ilp	NH	\N	\N
1407	03-11-2013	2013-11-03 00:00:00	23/61	Roeleey	03-11-2013	2013-11-03 00:00:00	23/62	V-Strommert	52.3630753	4.62220478	aan boom bij Kon HFC - Emauslaan	Haarlem	NH	\N	\N
1777	22-10-2014	2014-10-22 00:00:00	27/54	BSI	23-10-2014	2014-10-23 00:00:00	27/55	Lekkerbekje	52.1197128	5.87974977	aan boom bij Kerk - Heldringsweg	Hoenderloo	Ge	\N	\N
586	15-10-2011	2011-10-15 00:00:00	12/78	ndeeka	15-10-2011	2011-10-15 00:00:00	12/79	Ronald_010	51.8700943	4.77356005	aan boom bij molen Heulenslag, Bleskensgraaf, ZH	Bleskensgraaf	ZH	\N	\N
3582	13-07-2020	2020-07-13 00:00:00	40/735	Coenster	13-07-2020	2020-07-13 00:00:00	40/735	Roeleey	52.2600174	4.60545492	tegen boom P&R Zuidtangent	Nieuw-Vennep	NH	\N	\N
584	14-10-2011	2011-10-14 00:00:00	12/75	Ronald_010	15-10-2011	2011-10-15 00:00:00	12/77	Phaedrus	51.8600616	4.34241486	in pijler van oude Spijkenisserbrug, Hoogvliet, ZH	Hoogvliet	ZH	\N	\N
2277	18-10-2016	2016-10-18 00:00:00	32/69	Capo-04/06	22-10-2016	2016-10-22 00:00:00	32/72	MeanYellowBoy	50.9514847	5.86112499	in holle boom - Weg langs Stamme	Puth	Li	\N	\N
3903	13-05-2021	2021-05-13 00:00:00	41/068	Sjefman	14-05-2021	2021-05-14 00:00:00	41/068	Hans89	51.4975395	4.41803217	tegen paaltje bochtmarkering 	Tolberg	NB	\N	\N
1363	23-09-2013	2013-09-23 00:00:00	22/90	V-Strommert	23-09-2013	2013-09-23 00:00:00	22/90	Scoot_020/Scoot_2	52.2959824	4.87226582	aan paaltje hoek Groenelaan	Amstelveen	NH	\N	\N
1916	16-05-2015	2015-05-16 00:00:00	28/78	bikedan	16-05-2015	2015-05-16 00:00:00	28/79	BSI	51.2078438	3.80499411	achter E-paal Vredekaai	Sas van Gent	Ze	\N	\N
1381	03-10-2013	2013-10-03 00:00:00	23/28	Low Profile	03-10-2013	2013-10-03 00:00:00	23/28	Scoot_020/Scoot_2	52.3845482	4.73944092	bij motorzaak Zwanenburgsedijk	Zwanenburg	NH	\N	\N
2299	27-11-2016	2016-11-27 00:00:00	33/07	BornToReign	28-11-2016	2016-11-28 00:00:00	33/08	inSaNo	52.4931984	5.48411703	aan hek Ketelmeerstraat	Lelystad	Fl	\N	\N
1595	17-04-2014	2014-04-17 00:00:00	25/69	Bigtwim	17-04-2014	2014-04-17 00:00:00	25/70	Artemecion	52.4885254	4.65579224	op muurtje bij kerk - Galgenweg	Beverwijk	NH	\N	\N
390	26-05-2011	2011-05-26 00:00:00	10/9	black mule	27-05-2011	2011-05-27 00:00:00	10/10	honda_power	52.6253471	4.65095615	houtstapel - klooster Karmel, Egmond a/d Hoef, NH	Egmond a/d Hoef	NH	\N	\N
2746	09-05-2018	2018-05-09 00:00:00	38/77	Outdoor Man	09-05-2018	2018-05-09 00:00:00	38/77	Roeleey	52.3055725	4.85011005	aan boom Broersepark	Amstelveen	NH	\N	\N
4131	22-02-2022	2022-02-22 00:00:00	41/223	Roeleey	23-02-2022	2022-02-23 00:00:00	41/223	pdv_moto	52.3466949	5.20336723	tegen boompje in lus Beginweg bij VTV	Almere	Fl	\N	\N
793	02-05-2012	2012-05-02 00:00:00	15/47	Hans89	03-05-2012	2012-05-03 00:00:00	15/48	Dirk130	51.7086678	3.69196391	onder dode boom bij Vuurtoren, Haamstede, Ze	Haamstede	Ze	\N	\N
4014	27-08-2021	2021-08-27 00:00:00	41/147	Roeleey	28-08-2021	2021-08-28 00:00:00	41/147	ootje	52.2160225	4.87070704	aan poot bochtmarkering 	Mijdrecht	Ut	\N	\N
1062	03-02-2013	2013-02-03 00:00:00	18/88	BSI	04-02-2013	2013-02-04 00:00:00	18/89	SadBunny	52.0747414	5.10585403	in put bij Red Pully - Europalaan	Utrecht	Ut	\N	\N
3600	29-07-2020	2020-07-29 00:00:00	40/755	Yosra87	29-07-2020	2020-07-29 00:00:00	40/755	Springbok	52.1539001	4.50256014	tegen boom bij Venus, Plaantsoen	Leiden	ZH	\N	\N
2002	28-08-2015	2015-08-28 00:00:00	29/54	leoniie	29-08-2015	2015-08-29 00:00:00	29/55	Amauta	52.9878311	6.51062393	aan boom P-plaats Baggelhuizen	Assen	Dr	\N	\N
3311	02-12-2019	2019-12-02 00:00:00	40/519	Outdoor Man	03-12-2019	2019-12-03 00:00:00	40/520	BSI	52.3300591	4.85622883	in stapel bilzen bij museumtramlijn	Amsterdam	NH	\N	\N
805	20-05-2012	2012-05-20 00:00:00	15/62	BSI	20-05-2012	2012-05-20 00:00:00	15/63	ootje	52.2029457	5.31686783	bij gemaal Zeldert - Slaagseweg, Hoogland, Ut	Hoogland	Ut	\N	\N
2097	16-04-2016	2016-04-16 00:00:00	30/66	Wimis on	16-04-2016	2016-04-16 00:00:00	30/66	ronk	52.0496902	5.14468098	achter boom P-plaats fort 't Hemeltje	Houten	Ut	\N	\N
1631	09-05-2014	2014-05-09 00:00:00	25/99	XJ Elff	09-05-2014	2014-05-09 00:00:00	25/100	Rainbow600	51.8973999	4.63531113	aan boom Neptuneshof	Krimpen aan den Lek	ZH	\N	\N
4316	09-04-2023	2023-04-09 00:00:00	41/346	Outdoor Man	09-04-2023	2023-04-09 00:00:00	41/346	SwitchUp	52.5269814	4.64916706	in dode boomstam Geversduin	Heemskerk	NH	\N	\N
1158	05-04-2013	2013-04-05 00:00:00	20/11	bikedan	07-04-2013	2013-04-07 00:00:00	20/13	BSI	51.398407	4.35339594	bij Dennenheuvel - Putseweg	Ossendrecht	NB	\N	\N
2461	19-06-2017	2017-06-19 00:00:00	34/89	Janhertog	19-06-2017	2017-06-19 00:00:00	34/89	Amauta	53.0186768	6.17154598	aan stuwtje St. Magnuswei	Hoornsterzwaag	Fr	\N	\N
111	26-10-2010	2010-10-26 00:00:00	4/15	Smuiger	26-10-2010	2010-10-26 00:00:00	4/16	Yamahahahaha	52.4660263	4.80828094	molen het Pink, Koog a/d Zaan, NH	Koog aan de Zaan	NH	\N	\N
3421	21-03-2020	2020-03-21 00:00:00	40/600	pdv_moto	21-03-2020	2020-03-21 00:00:00	40/601	Coenster	52.0665779	4.22353077	tegen betonning Kijkduinsestraat	Den Haag	ZH	\N	\N
1200	07-05-2013	2013-05-07 00:00:00	20/72	jaap43	07-05-2013	2013-05-07 00:00:00	20/73	Bar-E	51.8754311	4.04361486	achter E-huis Tweede Slad	Rockanje	ZH	\N	\N
3310	02-12-2019	2019-12-02 00:00:00	40/519	BSI	02-12-2019	2019-12-02 00:00:00	40/519	Outdoor Man	52.3367157	4.858284	tegen wilg VUmc, Amstelveenseweg	Amsterdam	NH	\N	\N
4274	22-12-2022	2022-12-22 00:00:00	41/319	Outdoor Man	28-12-2022	2022-12-28 00:00:00	41/319	ootje	52.493145	4.63743782	achter E-kast bij Duinrust, Bankenlaan	Beverwijk	NH	\N	\N
2700	10-04-2018	2018-04-10 00:00:00	38/20	MeanYellowBoy	10-04-2018	2018-04-10 00:00:00	38/21	HermanK	52.3726196	5.79936314	achter E-kast Groenelaantje	Zwolle	Ov	\N	\N
711	21-02-2012	2012-02-21 00:00:00	14/58	Shadowski	22-02-2012	2012-02-22 00:00:00	14/59	frankwijers	51.9606934	5.76660299	Airbornemonument - Drielse Rijndijk, Heteren, Ge	Heteren	Ge	\N	\N
1933	13-06-2015	2015-06-13 00:00:00	28/96	Fenrir-sol	13-06-2015	2015-06-13 00:00:00	28/97	bikedan	51.5079994	4.38506985	aan paal Akkerweg	Wouw	NB	\N	\N
3544	11-06-2020	2020-06-11 00:00:00	40/702	Picobello BV	13-06-2020	2020-06-13 00:00:00	40/702	Sjefman	51.9513359	4.18107414	in wilgenstruik langs Hoekselijn	Hoek van Holland	ZH	\N	\N
1289	21-07-2013	2013-07-21 00:00:00	21/95	de peppel	25-07-2013	2013-07-25 00:00:00	21/98	jaap43	51.8744087	6.41604805	aan paal windzak - Stakenborgweg	Voorst	Ge	\N	\N
93	13-10-2010	2010-10-13 00:00:00	3/67	Hansss	15-10-2010	2010-10-15 00:00:00	3/69	Motoroepoe	52.7729416	5.11259317	parkeerplek - Kasteel Radbout, Medemblik, NH	Medemblik	NH	\N	\N
662		0001-01-01 00:00:00 BC		blup blup		0001-01-01 00:00:00 BC			\N	\N				\N	\N
1629	07-05-2014	2014-05-07 00:00:00	25/97	Ronald_010	08-05-2014	2014-05-08 00:00:00	25/98	MLB	51.9357719	4.42811203	achter E-kast Burg. Baumannlaan	Rotterdam	ZH	\N	\N
338		0001-01-01 00:00:00 BC				0001-01-01 00:00:00 BC		paardevisn	\N	\N				\N	\N
783	20-04-2012	2012-04-20 00:00:00	15/38	fien	21-04-2012	2012-04-21 00:00:00	15/39	Hasseman	52.44561	6.84263992	bij de Molen van Bels - Bergweg, Mander, Ov	Mander	Ov	\N	\N
1258	30-06-2013	2013-06-30 00:00:00	21/56	Bensi	30-06-2013	2013-06-30 00:00:00	21/57	de peppel	52.1546593	6.43340111	aan boom ingang Cloese - Keppellaan	Lochem	Ge	\N	\N
402	03-06-2011	2011-06-03 00:00:00	10/28	Hayfork	04-06-2011	2011-06-04 00:00:00	10/30	ndeeka	51.5192032	5.97114182	boom bij rotonde Zuidsingel/Langstraat, Venray, Li	Venray	Li	\N	\N
704	15-02-2012	2012-02-15 00:00:00	14/48	CN	16-02-2012	2012-02-16 00:00:00	14/50	Hasseman	52.2492104	6.92197418	hek bij molen - Lonnekermolenweg, Lonneker, OV	Lonneker	Ov	\N	\N
1429	23-11-2013	2013-11-23 00:00:00	23/84	Ronald_010	23-11-2013	2013-11-23 00:00:00	23/85	BSI	51.9653893	5.73134422	aan hek Renkumse Veer	Heteren	Ge	\N	\N
223	06-02-2011	2011-02-06 00:00:00	6/90	Bensi	07-02-2011	2011-02-07 00:00:00	6/91	Hasseman	52.0021019	6.43987703	kunstwerk Halsedijk/Landeweerweg, Halle, Ge	Halle	Ge	\N	\N
2631	03-02-2018	2018-02-03 00:00:00	37/26	Okami_Xci	04-02-2018	2018-02-04 00:00:00	37/28	BSI	51.8275108	5.25588417	in monument oude Waalbrug	Waardenburg	Ge	\N	\N
1636	12-05-2014	2014-05-12 00:00:00	26/04	Bludge	13-05-2014	2014-05-13 00:00:00	26/05	-juliet-	51.9275322	6.0537529	aan boom Groeneweg	Zevenaar	Ge	\N	\N
3287	30-10-2019	2019-10-30 00:00:00	40/495	FastEddy	31-10-2019	2019-10-31 00:00:00	40/495	pdv_moto	52.9950066	6.94470215	aan ophaalbrug Brevrijderslaan	Stadskanaal	Gr	\N	\N
734	13-03-2012	2012-03-13 00:00:00	14/85	madmarv	13-03-2012	2012-03-13 00:00:00	14/86	Hasseman	52.1119232	5.28915024	aan paal Kampdwarsweg, Zeist, Ut	Zeist	Ut	\N	\N
2801	27-06-2018	2018-06-27 00:00:00	39/39	Amauta	29-06-2018	2018-06-29 00:00:00	39/41	Coenster	53.0636177	5.34043217	aan bunker bij Lorentzsluizen	Kornwerderzand	Fr	\N	\N
1792	11-11-2014	2014-11-11 00:00:00	27/68	Sjakie-77	11-11-2014	2014-11-11 00:00:00	27/68	Scoot_020/Scoot_2	52.4970474	4.71182203	bij monument - Communicatieweg	Uitgeest	NH	\N	\N
2882	26-08-2018	2018-08-26 00:00:00	40/34	FastEddy	26-08-2018	2018-08-26 00:00:00	40/34	Ronny Rabbelaar	52.9924583	6.97112989	tegen boom bij bruggetje Manegelaan	Stadskanaal	Gr	\N	\N
1867	18-03-2015	2015-03-18 00:00:00	28/33	Bas600	18-03-2015	2015-03-18 00:00:00	28/34	Corney28	52.2160645	4.87595606	aan reclamebord Meesters N201	Mijdrecht	Ut	\N	\N
2110	03-05-2016	2016-05-03 00:00:00	30/82	Roeleey	04-05-2016	2016-05-04 00:00:00	30/83	SadBunny	52.3336182	5.02323294	aan boom P-terrein Maxis	Muiden	NH	\N	\N
1653	29-05-2014	2014-05-29 00:00:00	26/24	Ronald_010	29-05-2014	2014-05-29 00:00:00	26/25	XJ Elff	52.0353966	4.40507698	aan boom P-terrein - Oudeweg	Nootdorp	ZH	\N	\N
246	22-02-2011	2011-02-22 00:00:00	7/39	wesleyc	22-02-2011	2011-02-22 00:00:00	7/40	lynx84	51.9795494	4.15447903	Nieuwlandsedijk, Hoek van Holland, ZH	Hoek van Holland	ZH	\N	\N
3844	25-03-2021	2021-03-25 00:00:00	41/017	Hjerteknuser	25-03-2021	2021-03-25 00:00:00	41/018	Amauta	52.2921371	4.70011282	in heg tegen boom Scorpius	Hoofddorp	NH	\N	\N
22	28-08-2010	2010-08-28 00:00:00	1/70	ootje	28-08-2010	2010-08-28 00:00:00	1/71	Jozefientje123	52.5643501	4.68515205	Zuidkerkenlaan, Limmen, NH	Limmen	NH	\N	\N
1177	20-04-2013	2013-04-20 00:00:00	20/42	JurgenT	21-04-2013	2013-04-21 00:00:00	20/42	Mr.Bean	52.1225281	6.31487799	in struik bij ingang - Almenseweg	Vorden	Ge	\N	\N
3763	12-12-2020	2020-12-12 00:00:00	40/899	pdv_moto	13-12-2020	2020-12-13 00:00:00	40/900	Carburateur	51.9807396	4.11339808	tegen blokken Kon. Emmaboulevard	Hoek van Holland	ZH	\N	\N
1953	01-07-2015	2015-07-01 00:00:00	29/14	frankivo	03-07-2015	2015-07-03 00:00:00	29/15	Amauta	52.7308998	6.50545979	onder metalen huisje - Edisonstraat	Hoogeveen	Dr	\N	\N
3706	18-10-2020	2020-10-18 00:00:00	40/850	Outdoor Man	18-10-2020	2020-10-18 00:00:00	40/851	SadBunny	52.9374924	5.03534317	bij struik strekdam vuurtoren	Den Oever	NH	\N	\N
3501	18-05-2020	2020-05-18 00:00:00	40/667	Bertus Beemer	19-05-2020	2020-05-19 00:00:00	40/667	Picobello BV	52.1058197	4.89401102	tegen houten paaltje P-plaats Mijzijde	Kamerik	Ut	\N	\N
2570	18-10-2017	2017-10-18 00:00:00	36/34	Ronny Rabbelaar	19-10-2017	2017-10-19 00:00:00	36/36	frankivo	53.3647804	6.74252176	aan paal vlonder Gasthuizermaar	Zeerijp	Gr	\N	\N
2953	06-12-2018	2018-12-06 00:00:00	40/122	scheurschuimpje	09-12-2018	2018-12-09 00:00:00	40/124	Amauta	52.5078011	6.09107208	aan hek Stationsweg	Zwolle	Ov	\N	\N
4142	06-03-2022	2022-03-06 00:00:00	41/229	pdv_moto	07-03-2022	2022-03-07 00:00:00	41/230	BSI	51.5396271	3.44869709	tegen paaltje Hogeweg/Oude Zandweg	Westkapelle	Ze	\N	\N
2427	17-05-2017	2017-05-17 00:00:00	34/49	frankivo	17-05-2017	2017-05-17 00:00:00	34/50	Amauta	53.2769928	6.69264984	in heg bij kerk Wigboldstraat	ten Boer	Gr	\N	\N
3172	13-07-2019	2019-07-13 00:00:00	40/387	Raviel	14-07-2019	2019-07-14 00:00:00	40/387	pdv_moto	51.8895302	6.08926678	aan paal kruisbeeld Heuvelakkersestraat	Aerdt	Ge	\N	\N
2997	27-01-2019	2019-01-27 00:00:00	40/185	FastEddy	28-01-2019	2019-01-28 00:00:00	40/186	Ronny Rabbelaar	53.3089867	6.96513891	in portaal achter hek Kerk Heveskes	Farmsum	Gr	\N	\N
529	10-09-2011	2011-09-10 00:00:00	11/96	Buuv	10-09-2011	2011-09-10 00:00:00	11/97	rvdh86	53.0289993	6.59128523	aan hek eind betonpad Kleuverveld, Assen, Dr	Assen	Dr	\N	\N
3386	18-02-2020	2020-02-18 00:00:00	40/570	FastEddy	19-02-2020	2020-02-19 00:00:00	40/570	frankivo	52.9981804	6.9745369	onder steen de Renne	Stadskanaal	Gr	\N	\N
714	24-02-2012	2012-02-24 00:00:00	14/61	Kermit de Hond	24-02-2012	2012-02-24 00:00:00	14/61	BSI	52.0852623	5.10392189	motorbeurs - Jaarbeurshallen, Utrecht, Ut	Utrecht	Ut	\N	\N
830	18-06-2012	2012-06-18 00:00:00	15/97	Bigtwim	18-06-2012	2012-06-18 00:00:00	15/98	Sjakie-77	52.4968796	4.66369581	op parkeerdek Wijkerbaan, Beverwijk, NH	Beverwijk	NH	\N	\N
120	02-11-2010	2010-11-02 00:00:00	4/42	V-Strommert	03-11-2010	2010-11-03 00:00:00	4/45	Jozefientje123	52.2155266	4.55764198	Vogelkamp, de Kaag, ZH	de Kaag	ZH	\N	\N
2072	22-02-2016	2016-02-22 00:00:00	30/32	frankivo	26-02-2016	2016-02-26 00:00:00	30/33	Amauta	52.9893875	6.86610603	onder venster AVeBe - Vaart	Gasselternijveen	Dr	\N	\N
3581	12-07-2020	2020-07-12 00:00:00	40/734	BSI	13-07-2020	2020-07-13 00:00:00	40/734	Coenster	52.1901779	5.49563694	aan paaltje Blokhuizersteeg	Nijkerk	Ge	\N	\N
1899	03-05-2015	2015-05-03 00:00:00	28/67	Ronald_010	04-05-2015	2015-05-04 00:00:00	28/67	Bomba	52.0693512	4.75131416	aan regelkast zuil - Europaweg	Bodegraven	ZH	\N	\N
1092	25-02-2013	2013-02-25 00:00:00	19/23	SadBunny	25-02-2013	2013-02-25 00:00:00	19/24	Roeleey	52.3767242	4.91285896	in pijp Dijkgracht	Amsterdam	NH	\N	\N
3662	12-09-2020	2020-09-12 00:00:00	40/817	Picobello BV	13-09-2020	2020-09-13 00:00:00	40/818	SadBunny	51.9146004	4.2582531	tegen hek Vlaardingsedijk	Maassluis	ZH	\N	\N
2944	10-11-2018	2018-11-10 00:00:00	40/104	BSI	10-11-2018	2018-11-10 00:00:00	40/104	pdv_moto	52.0806808	5.101933	in stalen constructie Ov. Den Oudenlaan	Utrecht	Ut	\N	\N
24	28-08-2010	2010-08-28 00:00:00	1/77	Jeroen P	29-08-2010	2010-08-29 00:00:00	1/78	ootje	52.2805634	4.4822979	parkeerplaats Randweg, Noordwijk, ZH	Noordwijk	ZH	\N	\N
733	11-03-2012	2012-03-11 00:00:00	14/82	madmarv	12-03-2012	2012-03-12 00:00:00	14/84	Komkommer	52.0658607	5.68835878	P-terrein steakhouse Amadeus, Ede, Ge	Ede	Ge	\N	\N
3099	01-05-2019	2019-05-01 00:00:00	40/298	Coenster	02-05-2019	2019-05-02 00:00:00	40/300	pdv_moto	52.2667122	4.67736721	aan paaltje, Rijnlanderweg 	Nieuw-Vennep	NH	\N	\N
3112	10-05-2019	2019-05-10 00:00:00	40/319	Bensi	10-05-2019	2019-05-10 00:00:00	40/320	Artemecion	52.1015091	6.28009319	p-terrein kasteel Hackfort	Vorden	Ge	\N	\N
950	15-10-2012	2012-10-15 00:00:00	17/33	magnamaniac	15-10-2012	2012-10-15 00:00:00	17/35	Hasseman	51.8096848	5.72994423	bij de Oude Molen - Brockhorstlaan	Wijchen	Ge	\N	\N
687	15-01-2012	2012-01-15 00:00:00	14/15	Scoot_020/Scoot_2	16-01-2012	2012-01-16 00:00:00	14/17	BSI	51.9560394	5.58827877	aan paal P-terrein Grebbeweg 111, Rhenen, Ge	Rhenen	Ge	\N	\N
1580	01-04-2014	2014-04-01 00:00:00	25/54	Vins111	01-04-2014	2014-04-01 00:00:00	25/54	Wimis on	52.0763206	5.07943821	achter E-kast Taatsendijk	Utrecht	Ut	\N	\N
1376	30-09-2013	2013-09-30 00:00:00	23/17	Wimis on	30-09-2013	2013-09-30 00:00:00	23/18	mr Q	52.0343018	5.16613197	in bloembak Het Kant - Imkerseind	Houten	Ut	\N	\N
3575	07-07-2020	2020-07-07 00:00:00	40/729	pdv_moto	07-07-2020	2020-07-07 00:00:00	40/730	k0en	52.0872993	4.28094292	achter muurtje Stadhouderslaan	Den Haag	ZH	\N	\N
3527	02-06-2020	2020-06-02 00:00:00	40/688	Amauta	02-06-2020	2020-06-02 00:00:00	40/690	FastEddy	53.0113602	6.72709417	onder hunebed D13	Eext	Dr	\N	\N
3987	22-07-2021	2021-07-22 00:00:00	41/129	Artemecion	22-07-2021	2021-07-22 00:00:00	41/129	HighKing	52.4570351	4.71798086	naast paaltje fietsroute de Akere	Assendelft	NH	\N	\N
3578	10-07-2020	2020-07-10 00:00:00	40/732	Sjefman	11-07-2020	2020-07-11 00:00:00	40/732	pdv_moto	51.4559479	4.37286615	tegen boom Moerkantsebaan	Huijbergen	NB	\N	\N
943	07-10-2012	2012-10-07 00:00:00	17/21	Meifesto	07-10-2012	2012-10-07 00:00:00	17/23	jaap43	51.9399147	4.59284306	aan hek 's-Gravenweg	Capelle aan den Ijssel	ZH	\N	\N
4176	30-04-2022	2022-04-30 00:00:00	41/253	Amauta	30-04-2022	2022-04-30 00:00:00	41/254	Ronny Rabbelaar	53.2783012	6.87804079	tegen landhoofd brug Koopmanslaan	Tjuchem	Gr	\N	\N
3313	07-12-2019	2019-12-07 00:00:00	40/521	BornToReign	08-12-2019	2019-12-08 00:00:00	40/521	pdv_moto	51.9771385	5.64767694	in heg MeteoGroup, Agro Business Park	Wageningen	Ge	\N	\N
674	27-12-2011	2011-12-27 00:00:00	13/95	tdemmer	27-12-2011	2011-12-27 00:00:00	13/95	Hans89	51.5490837	3.66006994	in bosje langs voetpad Langedam, Veere, Ze	Veere	Ze	\N	\N
245		0001-01-01 00:00:00 BC		ronk		0001-01-01 00:00:00 BC			\N	\N				\N	\N
1010	30-11-2012	2012-11-30 00:00:00	18/18	tdemmer	01-12-2012	2012-12-01 00:00:00	18/19	Ronald_010	51.9488564	4.51663923	monument operatie manna	Rotterdam	ZH	\N	\N
675	27-12-2011	2011-12-27 00:00:00	13/96	Hans89	28-12-2011	2011-12-28 00:00:00	13/97	Ronald_010	51.5695419	3.52385902	onder boom langs Groeneweg, Domburg, Ze	Domburg	Ze	\N	\N
852	07-07-2012	2012-07-07 00:00:00	16/26	MarkieNL	07-07-2012	2012-07-07 00:00:00	16/26	Drey	51.5059738	4.75341892	hoek hek Rijsbergsebaan	Breda	NB	\N	\N
3967	06-07-2021	2021-07-06 00:00:00	41/116	BigJim	06-07-2021	2021-07-06 00:00:00	41/116	HighKing	52.7356453	4.71009493	tegen trap kasteel Nuwendoorn	Sint Maarten	NH	\N	\N
2474	30-06-2017	2017-06-30 00:00:00	35/01	Amauta	03-07-2017	2017-07-03 00:00:00	35/04	1cc1kw1pk	53.4869499	6.14647818	aan schuur vuurtoren	Schiermonnikoog	Fr	\N	\N
3595	23-07-2020	2020-07-23 00:00:00	40/744	Yosra87	25-07-2020	2020-07-25 00:00:00	40/745	Springbok	52.0803757	4.30401087	tegen wachthuis paleis Noordeinde	Den Haag	ZH	\N	\N
4382	02-08-2023	2023-08-02 00:00:00	41/390	k0en	02-08-2023	2023-08-02 00:00:00	41/390	Amauta	52.9528503	6.54068708	tegen hek zijingang TT-circuit	Assen	Dr	\N	\N
4069	27-11-2021	2021-11-27 00:00:00	41/182	BSI	29-11-2021	2021-11-29 00:00:00	41/182	Deeffox	52.1685448	5.46328211	aan bruggetje de Wel	Hoevelaken	Ge	\N	\N
1401	26-10-2013	2013-10-26 00:00:00	23/54	Ronald_010	26-10-2013	2013-10-26 00:00:00	23/55	jaap43	51.9674835	4.45529079	bij E-kast fietstunnel - Doenkade	Rotterdam	ZH	\N	\N
449	01-07-2011	2011-07-01 00:00:00	10/87	ndeeka	02-07-2011	2011-07-02 00:00:00	10/89	Ronald_010	51.7542343	4.317276	bij het veer naar tiengemeten, Zuid-Beijerland, ZH	Zuid-Beijerland	ZH	\N	\N
4002	12-08-2021	2021-08-12 00:00:00	41/138	HighKing	13-08-2021	2021-08-13 00:00:00	41/139	BSI	52.5105515	4.70642519	onder looppad spoorbrug	Uitgeest	NH	\N	\N
2876	23-08-2018	2018-08-23 00:00:00	40/28	Coenster	23-08-2018	2018-08-23 00:00:00	40/30	Outdoor Man	52.1785622	4.41254711	P-terrein sportpark 1e Mientlaan	Katwijk	ZH	\N	\N
3814	25-02-2021	2021-02-25 00:00:00	40/941	Amauta	26-02-2021	2021-02-26 00:00:00	40/942	Ronny Rabbelaar	53.2362785	6.64643383	aan trap damwand Jan B. Bronssluis	Garmerwolde	Gr	\N	\N
1973	26-07-2015	2015-07-26 00:00:00	29/29	Djoost	28-07-2015	2015-07-28 00:00:00	29/29	Ronald_010	52.4388504	4.76220512	aan bord - Overtoom	Westzaan	NH	\N	\N
1325	25-08-2013	2013-08-25 00:00:00	22/41	BSI	27-08-2013	2013-08-27 00:00:00	22/44	Buuv	53.3231163	5.99789619	naast ingang molen - Molenpad	Dokkum	Fr	\N	\N
1294	31-07-2013	2013-07-31 00:00:00	22/07	Hans89	02-08-2013	2013-08-02 00:00:00	22/09	meylie-style	51.3295822	4.14830112	aan begin vlonder - Emmaweg	Nieuw-Namen	Ze	\N	\N
1219	21-05-2013	2013-05-21 00:00:00	21/01	Hasseman	23-05-2013	2013-05-23 00:00:00	21/04	MotorMieke	52.3005295	6.80527592	aan infobord Bornsedijk	Hengelo	Ov	\N	\N
4094	12-01-2022	2022-01-12 00:00:00	41/198	Outdoor Man	12-01-2022	2022-01-12 00:00:00	41/199	Roeleey	52.3988304	4.93177223	tegen boom De Die, Loenermark 900	Amsterdam	NH	\N	\N
3017	17-02-2019	2019-02-17 00:00:00	40/212	FastEddy	21-02-2019	2019-02-21 00:00:00	40/214	Totl	52.994976	6.98432207	onder brug aan de Pageplas	Stadskanaal	Gr	\N	\N
3955	26-06-2021	2021-06-26 00:00:00	41/106	pdv_moto	26-06-2021	2021-06-26 00:00:00	41/106	MeanYellowBoy	52.5010605	6.38125181	p-plaats Oude Hammerweg	Giethmen	Ov	\N	\N
4099	15-01-2022	2022-01-15 00:00:00	41/201	Roeleey	15-01-2022	2022-01-15 00:00:00	41/201	Outdoor Man	52.3087883	4.97546577	achter rechter kastje Langbroekerdreef	Amsterdam	NH	\N	\N
357	02-05-2011	2011-05-02 00:00:00	9/47	Outdoor Man	02-05-2011	2011-05-02 00:00:00	9/49	Smuiger	52.541378	4.83795118	fort Spijkerboor - Westdijk, Westbeemster, NH	Westbeemster	NH	\N	\N
1444	15-12-2013	2013-12-15 00:00:00	24/04	SadBunny	16-12-2013	2013-12-16 00:00:00	24/05	BSI	52.3490028	4.84121418	tegen geluidsscherm A10	Amsterdam	NH	\N	\N
3577	07-07-2020	2020-07-07 00:00:00	40/730	pdv_moto	10-07-2020	2020-07-10 00:00:00	40/732	Sjefman	51.5196304	3.45583391	tegen boom Grinsweg (N288)	Westkapelle	Ze	\N	\N
2522	23-08-2017	2017-08-23 00:00:00	35/63	pdv_moto	23-08-2017	2017-08-23 00:00:00	35/63	highking	51.9869881	5.82151222	in struik Oude Herberg	Oosterbeek	Ge	\N	\N
494	11-08-2011	2011-08-11 00:00:00	11/44	Bensi	12-08-2011	2011-08-12 00:00:00	11/45	ootje	51.9468384	6.7056241	boom bij watermolen - Wooldseweg, Winterswijk, Ge	Winterswijk	Ge	\N	\N
1928	09-06-2015	2015-06-09 00:00:00	28/91	Rik60NL	10-06-2015	2015-06-10 00:00:00	28/93	Corney28	52.1769981	4.82969379	aan bordje - Hogendijk	Zevenhoven	ZH	\N	\N
4096	14-01-2022	2022-01-14 00:00:00	41/199	Marsian	14-01-2022	2022-01-14 00:00:00	41/200	HighKing	52.4092026	4.60664797	naast hek het Kopje	Bloemendaal	NH	\N	\N
2641	18-02-2018	2018-02-18 00:00:00	37/47	Amauta	18-02-2018	2018-02-18 00:00:00	37/47	HermanK	53.1189804	5.9555788	bij vogelkijkhut Jan Dirkspolder	Oudega	Fr	\N	\N
1290	25-07-2013	2013-07-25 00:00:00	21/98	jaap43	25-07-2013	2013-07-25 00:00:00	21/98	tdemmer	51.9947472	4.29429579	aan hek 't Woudt	t Woudt	ZH	\N	\N
4291	19-02-2023	2023-02-19 00:00:00	41/329	Ronald_010	20-02-2023	2023-02-20 00:00:00	41/330	Okami_Xci	51.3522835	6.18166685	onder container Fanshop VVV.Venlo	Venlo	Li	\N	\N
1044	04-01-2013	2013-01-04 00:00:00	18/48	jeffrey120	04-01-2013	2013-01-04 00:00:00	18/51	tdemmer	52.0332031	4.73672295	aan steiger plas Elfhoeven	Reeuwijk	ZH	\N	\N
2111	04-05-2016	2016-05-04 00:00:00	30/83	SadBunny	04-05-2016	2016-05-04 00:00:00	30/83	Roeleey	52.3908806	4.87116003	aan hek spoor - Zaanstraat	Amsterdam	NH	\N	\N
4140	04-03-2022	2022-03-04 00:00:00	41/228	FastEddy	04-03-2022	2022-03-04 00:00:00	41/228	Amauta	53.0735855	7.19513321	tegen boom bij oud Douanekantoor	Bellingwolde	Gr	\N	\N
4093	11-01-2022	2022-01-11 00:00:00	41/198	Coenster	11-01-2022	2022-01-11 00:00:00	41/198	Outdoor Man	52.2733269	4.62865019	in reclamebord bij Transportmuseum	Nieuw-Vennep	NH	\N	\N
997	16-11-2012	2012-11-16 00:00:00	17/95	Bigtwim	16-11-2012	2012-11-16 00:00:00	17/96	ootje	52.4930649	4.59035587	struik achter RK-kerk	Wijk aan Zee	NH	\N	\N
3950	23-06-2021	2021-06-23 00:00:00	41/102	Outdoor Man	23-06-2021	2021-06-23 00:00:00	41/102	ootje	52.1294746	5.37829113	in hoek monument Russisch ereveld	Leusden	Ut	\N	\N
247	22-02-2011	2011-02-22 00:00:00	7/40	lynx84	22-02-2011	2011-02-22 00:00:00	7/41	V-Strommert	51.9620781	4.44663286	gebouwtje Doenkade, Rotterdam, ZH	Rotterdam	ZH	\N	\N
1499	06-02-2014	2014-02-06 00:00:00	24/64	BigJim	07-02-2014	2014-02-07 00:00:00	24/65	Splinnie	52.6284752	4.6864562	aan boom Egmondermeer	Egmond a/d Hoef	NH	\N	\N
1656	01-06-2014	2014-06-01 00:00:00	26/29	Rainbow600	02-06-2014	2014-06-02 00:00:00	26/31	BSI	53.4625359	6.81547213	bij radarpost Borkumkade	Eemshaven	Gr	\N	\N
3690	04-10-2020	2020-10-04 00:00:00	40/839	pdv_moto	04-10-2020	2020-10-04 00:00:00	40/839	Amauta	53.2195358	6.56945705	in struik tegen Martinikerk	Groningen	Gr	\N	\N
2009	09-09-2015	2015-09-09 00:00:00	29/61	-Floris-	10-09-2015	2015-09-10 00:00:00	29/62	Amauta	51.455719	3.65333295	achter paaltje - fort Rammekens	Ritthem	Ze	\N	\N
2436	26-05-2017	2017-05-26 00:00:00	34/58	Rik60NL	26-05-2017	2017-05-26 00:00:00	34/58	Coenster	52.2268906	4.81415987	in struik Ruigekade	de Hoef	Ut	\N	\N
364	08-05-2011	2011-05-08 00:00:00	9/59	BSI	08-05-2011	2011-05-08 00:00:00	9/59	diekooi	52.0431366	5.55730581	parkeerterrein Traverse, Veenendaal, Ut	Veenendaal	Ut	\N	\N
1094	26-02-2013	2013-02-26 00:00:00	19/26	Corney28	27-02-2013	2013-02-27 00:00:00	19/26	Roeleey	52.2023354	4.88641405	aan hekwerk Veenweg	Wilnis	Ut	\N	\N
2362	22-03-2017	2017-03-22 00:00:00	33/84	pdv_moto	25-03-2017	2017-03-25 00:00:00	33/85	PatrickSoler	52.0995979	4.29248095	achter boom Duinweg - Duinweg	Den Haag	ZH	\N	\N
2889	02-09-2018	2018-09-02 00:00:00	40/42	Ronny Rabbelaar	03-09-2018	2018-09-03 00:00:00	40/43	FastEddy	53.1036186	6.64532614	achter stammetje Tolhuisweg	Midlaren	Dr	\N	\N
1706	09-08-2014	2014-08-09 00:00:00	26/89	BSI	09-08-2014	2014-08-09 00:00:00	26/89	Meangreengirl/MeanBlueMan	51.2831535	4.05133295	in herenkrul stadswal Tivoliweg	Hulst	Ze	\N	\N
2016	23-09-2015	2015-09-23 00:00:00	29/69	Bigtwim	24-09-2015	2015-09-24 00:00:00	29/70	ootje	52.5960693	4.6501112	aan bord heemtuin	Egmond-Binnen	NH	\N	\N
2440	29-05-2017	2017-05-29 00:00:00	34/62	Rik60NL	30-05-2017	2017-05-30 00:00:00	34/63	PatrickSoler	52.1390915	4.95845222	in knotwilg Schutterskade	Kockenge	Ut	\N	\N
2214	26-08-2016	2016-08-26 00:00:00	31/91	pdv_moto	27-08-2016	2016-08-27 00:00:00	31/92	Ronald_010	52.0986938	4.30054808	bij boom - van Stolkpark	Den Haag	ZH	\N	\N
127	06-11-2010	2010-11-06 00:00:00	4/55	jaap43	06-11-2010	2010-11-06 00:00:00	4/55	Dirk130	51.969799	4.18121481	Bonnenlaan - Staelduinen, Westland, ZH	Westland	ZH	\N	\N
193	14-01-2011	2011-01-14 00:00:00	6/7	Wimis on	14-01-2011	2011-01-14 00:00:00	6/8	mr Q	52.0563354	5.16535521	bruggetje Romeinse toren - Marsdijk, Bunnik, Ut	Bunnik	Ut	\N	\N
2183	24-07-2016	2016-07-24 00:00:00	31/56	bikedan	25-07-2016	2016-07-25 00:00:00	31/56	pdv_moto	51.5360985	4.45253992	ingang van Gilse - Industriestraat	Roosendaal	NB	\N	\N
726	07-03-2012	2012-03-07 00:00:00	14/78	Ronald_010	08-03-2012	2012-03-08 00:00:00	14/78	tdemmer	52.0780525	4.57184887	naast E-huisje Hoogeveenseweg, Benthuizen, ZH	Benthuizen	ZH	\N	\N
1165	11-04-2013	2013-04-11 00:00:00	20/24	Outdoor Man	12-04-2013	2013-04-12 00:00:00	20/25	Corney28	52.3085213	4.89894295	aan slootkant pad - Bankrasweg	Amstelveen	NH	\N	\N
4302	10-03-2023	2023-03-10 00:00:00	41/336	Picobello BV	12-03-2023	2023-03-12 00:00:00	41/337	pdv_moto	52.1703033	4.56535387	aan bruggetje Blauwemolenweg	Oude Ade	ZH	\N	\N
2443	31-05-2017	2017-05-31 00:00:00	34/65	Bas600	31-05-2017	2017-05-31 00:00:00	34/65	Rik60NL	52.0497017	5.12933207	aan hek Waaijensedijk	Houten	Ut	\N	\N
4405	26-09-2023	2023-09-26 00:00:00	41/404	blub blub 	27-09-2023	2023-09-27 00:00:00	41/405	Bensi	51.9557495	6.74459219	aan brugleuning Kottenseweg	Winterswijk	Ge	\N	\N
541		0001-01-01 00:00:00 BC				0001-01-01 00:00:00 BC		rvdh86	\N	\N				\N	\N
2481	09-07-2017	2017-07-09 00:00:00	35/11	BSI	09-07-2017	2017-07-09 00:00:00	35/12	Bensi	51.8471985	5.87238216	onder brug Hunnerpark	Nijmegen	Ge	\N	\N
1005	24-11-2012	2012-11-24 00:00:00	18/11	Sjakie-77	24-11-2012	2012-11-24 00:00:00	18/11	BSI	52.2972527	4.96059895	bij perron Nieuwegeinlaan	Amsterdam	NH	\N	\N
1544	08-03-2014	2014-03-08 00:00:00	25/14	Ronald_010	09-03-2014	2014-03-09 00:00:00	25/15	bikedan	52.1574593	4.44330311	in locomotor - Pellenbargweg	Valkenburg	ZH	\N	\N
3552	23-06-2020	2020-06-23 00:00:00	40/711	Roeleey	23-06-2020	2020-06-23 00:00:00	40/711	k0en	52.2670555	4.9621501	in boompje P&R 	Abcoude	Ut	\N	\N
2193	05-08-2016	2016-08-05 00:00:00	31/67	Einschtein	06-08-2016	2016-08-06 00:00:00	31/67	Rik60NL	52.0043716	4.89279795	aan hek Damweg	Oudewater	Ut	\N	\N
2451	08-06-2017	2017-06-08 00:00:00	34/76	Kevson	09-06-2017	2017-06-09 00:00:00	34/77	SadBunny	52.2422676	5.18361521	in struik Erfgooiersstraat	Hilversum	NH	\N	\N
466	17-07-2011	2011-07-17 00:00:00	11/09	BSI	17-07-2011	2011-07-17 00:00:00	11/09	Wimis on	52.0823708	4.78618717	loopbrug fort Wierickerschans, Bodegraven, ZH	Bodegraven	ZH	\N	\N
2410	30-04-2017	2017-04-30 00:00:00	34/33	BSI	30-04-2017	2017-04-30 00:00:00	34/33	pdv_moto	52.1588936	5.39777708	achter poot Stier - Rotonde Kamp	Amersfoort	Ut	\N	\N
617	07-11-2011	2011-11-07 00:00:00	13/29	Ronald_010	08-11-2011	2011-11-08 00:00:00	13/30	tdemmer	51.9726562	4.45152807	aan hek Rodenrijseweg, Berkel en Rodenrijs, ZH	Berkel en Rodenrijs	ZH	\N	\N
3143	13-06-2019	2019-06-13 00:00:00	40/355	Coenster	13-06-2019	2019-06-13 00:00:00	40/355	Artemecion	52.2405968	4.67887211	achter e-kast Oude Venneperweg	Burgerveen	NH	\N	\N
1989	12-08-2015	2015-08-12 00:00:00	29/40	Artemecion	13-08-2015	2015-08-13 00:00:00	29/41	Bigtwim	52.5322762	4.77950716	aan hek voetbalveld - Monnikbinnen	de Rijp	NH	\N	\N
2248	22-09-2016	2016-09-22 00:00:00	32/26	Bensi	23-09-2016	2016-09-23 00:00:00	32/27	BornToReign	51.8525696	6.31024504	aan boom Jonkerstraat	Netterden	Ge	\N	\N
591	17-10-2011	2011-10-17 00:00:00	12/86	V-Strommert	18-10-2011	2011-10-18 00:00:00	12/87	lynx84	52.2415199	4.67986679	aan boompje Alkmaarderweg, Rijsenhout, NH	Rijsenhout	NH	\N	\N
1565	23-03-2014	2014-03-23 00:00:00	25/37	-juliet-	24-03-2014	2014-03-24 00:00:00	25/38	BSI	52.9768906	5.79355812	aan boom bij DE - Leeuwarderweg	Joure	Fr	\N	\N
4416	17-10-2023	2023-10-17 00:00:00	41/411	Scoot_020	17-10-2023	2023-10-17 00:00:00	41/411	Outdoor Man	52.3586655	5.20622206	tegen hek Hlmondstraat	Almere	Fl	\N	\N
2561	11-10-2017	2017-10-11 00:00:00	36/24	HighKing	11-10-2017	2017-10-11 00:00:00	36/24	Rik60NL	52.2160759	4.5131669	in heg bij watertoren	Sassenheim	ZH	\N	\N
3052	24-03-2019	2019-03-24 00:00:00	40/251	Bomba	25-03-2019	2019-03-25 00:00:00	40/252	Coenster	52.0024338	4.95297194	aan voet uitkijktoren recratie Rosenboom	Benschop	Ut	\N	\N
4177	01-05-2022	2022-05-01 00:00:00	41/254	Ronny Rabbelaar	01-05-2022	2022-05-01 00:00:00	41/254	rvdh86	52.150074	6.44782114	tegen boom bij kap de Witte Wieven	Lochem	Ge	\N	\N
1009	29-11-2012	2012-11-29 00:00:00	18/17	magnamaniac	30-11-2012	2012-11-30 00:00:00	18/18	tdemmer	51.9785995	5.97761011	onder hert heuvel IJsseloord II	Arnhem	Ge	\N	\N
2334	10-02-2017	2017-02-10 00:00:00	33/55	Corney28	10-02-2017	2017-02-10 00:00:00	33/55	BSI	52.1189537	5.04288483	in P-garage Zonnebaan	Utrecht	Ut	\N	\N
26	30-08-2010	2010-08-30 00:00:00	1/85	Bikermamma	30-08-2010	2010-08-30 00:00:00	1/88	Miss2	53.0319862	5.63278913	Schoenmakersstraat, Sneek, Fr	Sneek	Fr	\N	\N
1181	25-04-2013	2013-04-25 00:00:00	20/48	Corney28	25-04-2013	2013-04-25 00:00:00	20/49	Roeleey	52.2893753	4.95832109	bij heliplatform - Tafelbergweg	Amsterdam	NH	\N	\N
671	24-12-2011	2011-12-24 00:00:00	13/91	tdemmer	24-12-2011	2011-12-24 00:00:00	13/92	jaap43	51.9582253	4.54981995	voortuin tdemmer - Bolkruid, Rotterdam, ZH	Rotterdam	ZH	\N	\N
237	16-02-2011	2011-02-16 00:00:00	7/18	Scoot_020/Scoot_2	16-02-2011	2011-02-16 00:00:00	7/21	Komkommer	52.2037468	5.02597189	provinciepaal Bloklaan, Loosdrecht, NH	Loosdrecht	NH	\N	\N
1328	28-08-2013	2013-08-28 00:00:00	22/46	Gee123	28-08-2013	2013-08-28 00:00:00	22/47	Buuv	52.8449745	6.66312218	achter e-kast - Brugstraat	Orvelte	Dr	\N	\N
82	04-10-2010	2010-10-04 00:00:00	3/44	Soesbabe	04-10-2010	2010-10-04 00:00:00	3/45	smoffler	51.4936829	3.81957603	Panhoeveweg, Hr Arendskerke, Ze	Hr Arendskerke	Ze	\N	\N
4241	14-09-2022	2022-09-14 00:00:00	41/297	Pydejong	15-09-2022	2022-09-15 00:00:00	41/297	Janhertog	53.212326	6.20861578	tegen hek woonhuis Rysloane	Surhuizum	Fr	\N	\N
457	07-07-2011	2011-07-07 00:00:00	10/95	jaap43	09-07-2011	2011-07-09 00:00:00	10/97	bakfiets1	51.7727852	4.19352913	struik op piertje bij havenhoofd, Middelharnis, ZH	Middelharnis	ZH	\N	\N
4392	21-08-2023	2023-08-21 00:00:00	41/395	wachtbalkje	27-08-2023	2023-08-27 00:00:00	41/396	me-daph	52.2268295	5.90467978	tegen boom P-plaats Julianatoren	Hoog-Soeren	Ge	\N	\N
1272	08-07-2013	2013-07-08 00:00:00	21/72	Sjantaalfoutje	08-07-2013	2013-07-08 00:00:00	21/72	Coffee	52.1230698	5.88951111	bij picknicktafel - Oudeweg	Hoenderloo	Ge	\N	\N
2396	22-04-2017	2017-04-22 00:00:00	34/22	GromToskamp	22-04-2017	2017-04-22 00:00:00	34/22	BSI	52.1798286	5.22119522	aan boom P-plaats	Lage Vuursche	Ut	\N	\N
2571	19-10-2017	2017-10-19 00:00:00	36/36	frankivo	20-10-2017	2017-10-20 00:00:00	36/37	Amauta	53.1866035	7.03961611	aan hek uitlaat - Groeveweg	Oostwold	Gr	\N	\N
2836	28-07-2018	2018-07-28 00:00:00	39/85	Amauta	28-07-2018	2018-07-28 00:00:00	39/86	Outdoor Man	53.1756592	6.42223406	achter E-kast Meerweg	Nietap	Dr	\N	\N
1787	05-11-2014	2014-11-05 00:00:00	27/64	Rainbow600	07-11-2014	2014-11-07 00:00:00	27/65	-juliet-	52.3385925	5.26897621	aan paal zonnecel - Kemphaanlaan	Almere	Fl	\N	\N
4314	05-04-2023	2023-04-05 00:00:00	41/344	ootje	06-04-2023	2023-04-06 00:00:00	41/345	Toereloer	52.6041336	4.65182209	achter naambord Liobastichting	Egmond-Binnen	NH	\N	\N
3557	27-06-2020	2020-06-27 00:00:00	40/715	pdv_moto	27-06-2020	2020-06-27 00:00:00	40/716	Picobello BV	52.0634689	4.2178669	aan hekpost Maghiel Vrijenhoeklaan	Den Haag	ZH	\N	\N
158	03-12-2010	2010-12-03 00:00:00	5/30	ootje	03-12-2010	2010-12-03 00:00:00	5/30	Wimis on	51.9909325	5.1313982	vistrap stuw Lekdijk, Hagestein, Ut	Hagestein	Ut	\N	\N
2548	17-09-2017	2017-09-17 00:00:00	35/100	Ronald_010	19-09-2017	2017-09-19 00:00:00	36/01	ArendJan	51.9277077	4.43039608	in boompje Taludweg	Rotterdam	ZH	\N	\N
1588	11-04-2014	2014-04-11 00:00:00	25/62	Rainbow600	12-04-2014	2014-04-12 00:00:00	25/63	Roeleey	52.3591042	5.21274424	tussen E-kasten de Fantasie	Almere	Fl	\N	\N
2787	18-06-2018	2018-06-18 00:00:00	39/22	Roeleey	18-06-2018	2018-06-18 00:00:00	39/23	Coenster	52.3254318	4.93055391	achter Honda-reclamezuil Spaklerweg	Amsterdam	NH	\N	\N
114	29-10-2010	2010-10-29 00:00:00	4/23	Quickly	29-10-2010	2010-10-29 00:00:00	4/24	Hasseman	51.9704971	4.97990704	Halifax monument - Lekdijk Oost, Jaarsveld, Ut	Jaarsveld	Ut	\N	\N
2659	14-03-2018	2018-03-14 00:00:00	37/75	FastEddy	15-03-2018	2018-03-15 00:00:00	37/76	Bassjunky	52.9921417	7.15117121	in greppel Willinghuizerweg	Vlagtwedde	Gr	\N	\N
39	07-09-2010	2010-09-07 00:00:00	2/50	R1.Petje	08-09-2010	2010-09-08 00:00:00	2/54	vuurbloed	51.5543251	4.73171711	hekje Effenseweg 1, Breda, NB	Breda	NB	\N	\N
2245	20-09-2016	2016-09-20 00:00:00	32/22	Motormuisje_alice	22-09-2016	2016-09-22 00:00:00	32/24	bikedan	51.5163422	4.27674818	in muurtje Halsterseweg	Halsteren	NB	\N	\N
118	01-11-2010	2010-11-01 00:00:00	4/38	BigJim	01-11-2010	2010-11-01 00:00:00	4/40	Smuiger	52.4701996	4.70564604	Zeedijk 7-8, Assendelft, NH	Assendelft	NH	\N	\N
2878	24-08-2018	2018-08-24 00:00:00	40/31	Roeleey	24-08-2018	2018-08-24 00:00:00	40/31	Coenster	52.3000641	4.96715212	aan voet kunstwerk Meerkerkdreef	Amsterdam	NH	\N	\N
3518	29-05-2020	2020-05-29 00:00:00	40/680	pdv_moto	29-05-2020	2020-05-29 00:00:00	40/681	MIA	52.1136627	4.28327322	in bloembak bij AKO, strandweg	Scheveningen	ZH	\N	\N
3737	07-11-2020	2020-11-07 00:00:00	40/874	SadBunny	08-11-2020	2020-11-08 00:00:00	40/875	pdv_moto	52.7723427	5.11337996	achter nutskast kasteel Radboud	Medemblik	NH	\N	\N
4000	04-08-2021	2021-08-04 00:00:00	41/137	Roeleey	11-08-2021	2021-08-11 00:00:00	41/138	Outdoor Man	51.5304337	3.4794631	tegen paaltje wegmarkering, Baaiweg	Aagtekerke	Ze	\N	\N
4312	03-04-2023	2023-04-03 00:00:00	41/343	Coenster	04-04-2023	2023-04-04 00:00:00	41/343	Outdoor Man	52.1919823	4.68828821	tegen populier, Woudsedijk-Zuid	Woudsend	ZH	\N	\N
4141	04-03-2022	2022-03-04 00:00:00	41/228	Amauta	05-03-2022	2022-03-05 00:00:00	41/228	pdv_moto	53.1969185	6.41263008	tegen gemaal Luttelberterdijk	Luttelbert	Gr	\N	\N
293	26-03-2011	2011-03-26 00:00:00	8/33	Hansss	27-03-2011	2011-03-27 00:00:00	8/35	BSI	52.9310112	4.98538399	bij trap Bierdijk - Hyppolytushoef, Wieringen, NH	Wieringen	NH	\N	\N
2197	07-08-2016	2016-08-07 00:00:00	31/69	bikedan	07-08-2016	2016-08-07 00:00:00	31/70	BSI	51.4606133	4.38319683	aan boom Plantage Centr.	Wouwse Plantage	NB	\N	\N
2838	28-07-2018	2018-07-28 00:00:00	39/87	Hjerteknuser	29-07-2018	2018-07-29 00:00:00	39/88	Amauta	52.4922104	4.70026302	onder overstaptrapje Genieweg	Heemskerk	NH	\N	\N
2241	18-09-2016	2016-09-18 00:00:00	32/19	BSI	18-09-2016	2016-09-18 00:00:00	32/19	pdv_moto	52.0037079	5.88846922	tegen steen - Schelmseweg	Arnhem	Ge	\N	\N
1308	15-08-2013	2013-08-15 00:00:00	22/20	Sjantaalfoutje	15-08-2013	2013-08-15 00:00:00	22/21	Bensi	52.1674461	5.95514822	achter bankje Engelanderweg	Beekbergen	Ge	\N	\N
656	09-12-2011	2011-12-09 00:00:00	13/71	MotorMieke	09-12-2011	2011-12-09 00:00:00	13/73	Hasseman	52.4949722	6.1998558	onder brug "te Horte" - Poppenallee, Dalfsen, Ov	Dalfsen	Ov	\N	\N
2849	07-08-2018	2018-08-07 00:00:00	40/02	Hjerteknuser	08-08-2018	2018-08-08 00:00:00	40/03	Coenster	52.5249557	4.68000507	bij infobord Noordermaatweg	Heemskerk	NH	\N	\N
3382	14-02-2020	2020-02-14 00:00:00	40/567	Hans89	15-02-2020	2020-02-15 00:00:00	40/568	HighKing	52.0902748	5.34169817	aan hek pyramide van Austerlitz	Woudenberg	Ut	\N	\N
1125	21-03-2013	2013-03-21 00:00:00	19/66	Roeleey	21-03-2013	2013-03-21 00:00:00	19/66	V-Strommert	52.3107681	4.985322	in boomvak plei Gaasperpark	Amsterdam	NH	\N	\N
2816	13-07-2018	2018-07-13 00:00:00	39/60	Amauta	13-07-2018	2018-07-13 00:00:00	39/61	BSI	51.8937263	5.99918985	onder loopbrug Kasteel Doornenburg	Doornenburg	Ge	\N	\N
422	10-06-2011	2011-06-10 00:00:00	10/44	vuurbloed	10-06-2011	2011-06-10 00:00:00	10/45	Scoot_020/Scoot_2	52.3241768	4.67606688	Steiger - IJweg, Hoofddorp, NH	Hoofddorp	NH	\N	\N
818	06-06-2012	2012-06-06 00:00:00	15/80	Scoot_020/Scoot_2	07-06-2012	2012-06-07 00:00:00	15/80	Outdoor Man	52.3509865	4.79349422	de Zwerm - Pieter Calandlaan, Amsterdam, NH	Amsterdam	NH	\N	\N
3536	07-06-2020	2020-06-07 00:00:00	40/697	k0en	08-06-2020	2020-06-08 00:00:00	40/697	MBKNLD	52.082283	5.069314	aan poot bord knooppunt Stadsdambrug	Utrecht	Ut	\N	\N
4428	20-11-2023	2023-11-20 00:00:00	41/418	WillyvD	21-11-2023	2023-11-21 00:00:00	41/418	Hans89	51.8736649	4.54362917	op stoep Hordijk	Rotterdam	ZH	\N	\N
1920	28-05-2015	2015-05-28 00:00:00	28/84	Kermit de Hond	28-05-2015	2015-05-28 00:00:00	28/85	frankivo	53.0761223	6.57182884	onder hoop stenen - Nieuwe Holtenweg	Vries	Dr	\N	\N
1347	08-09-2013	2013-09-08 00:00:00	22/70	Corney28	08-09-2013	2013-09-08 00:00:00	22/71	BSI	52.1598778	4.9588809	achter brughokje Portengensebrug	Kockengen	Ut	\N	\N
1077	13-02-2013	2013-02-13 00:00:00	19/04	tdemmer	14-02-2013	2013-02-14 00:00:00	19/05	JurgenT	52.1486092	6.00214195	aan Boom - Immenbergweg	Beekbergen	Ge	\N	\N
829	17-06-2012	2012-06-17 00:00:00	15/96	Muffin	17-06-2012	2012-06-17 00:00:00	15/96	Bigtwim	52.5936165	4.71686792	aan hek St. Willibrordusstichting, Heiloo, NH	Heiloo	NH	\N	\N
3258	03-10-2019	2019-10-03 00:00:00	40/471	WillyvD	04-10-2019	2019-10-04 00:00:00	40/472	Sjefman	51.6356735	4.46827507	onder bakje Voorstraat	Fijnaart	NB	\N	\N
1695	23-07-2014	2014-07-23 00:00:00	26/73	Bas600	23-07-2014	2014-07-23 00:00:00	26/74	Roeleey	52.2630501	4.76527119	aan hek Wellantcollege	Aalsmeer	NH	\N	\N
251	24-02-2011	2011-02-24 00:00:00	7/48	vuurbloed	27-02-2011	2011-02-27 00:00:00	xxx	FietsFanatic	52.0843201	5.10106993	op de motorbeurs van 24-02-2011 t/m 27-02-2011, Utrecht, Ut	Utrecht	Ut	\N	\N
659	11-12-2011	2011-12-11 00:00:00	13/76	Hasseman	14-12-2011	2011-12-14 00:00:00	13/79	me-daph	52.334671	6.73098993	bij elektrahuisje - Bekkingvelderweg, Zenderen, Ov	Zenderen	Ov	\N	\N
403	05-06-2011	2011-06-05 00:00:00	10/32	ndeeka	05-06-2011	2011-06-05 00:00:00	10/32	gasbaas	52.0720062	5.02888107	parkeerterrein AC-restaurant, De Meern, Ut	de Meern	Ut	\N	\N
1594	16-04-2014	2014-04-16 00:00:00	25/69	Artemecion	17-04-2014	2014-04-17 00:00:00	25/69	Bigtwim	52.5335999	4.721663	achter hek parallelweg	Uitgeest	NH	\N	\N
2931	19-10-2018	2018-10-19 00:00:00	40/91	nappertje	19-10-2018	2018-10-19 00:00:00	40/91	BornToReign	51.9542961	5.60882378	tegen paal hek Grebbeweg	Rhenen	Ut	\N	\N
342	22-04-2011	2011-04-22 00:00:00	9/22	scheurschuimpje	23-04-2011	2011-04-23 00:00:00	9/24	Richard117	52.9713287	5.89282417	brievenbus Bike Fit - de Loads, Heerenveen, Fr	Heerenveen	Fr	\N	\N
1690	20-07-2014	2014-07-20 00:00:00	26/68	Chakotay	20-07-2014	2014-07-20 00:00:00	26/69	Bomba	52.1866455	5.3586669	aan brugleuning - Oudeweg	Hoogland	Ut	\N	\N
2220	30-08-2016	2016-08-30 00:00:00	31/96	Roeleey	30-08-2016	2016-08-30 00:00:00	31/97	vuurbloed	52.3314896	4.91665983	aan zuiltje bij Metro Overamstel	Amsterdam	NH	\N	\N
1960	16-07-2015	2015-07-16 00:00:00	29/20	Roeleey	17-07-2015	2015-07-17 00:00:00	29/21	Amauta	52.6340332	5.41592979	achter boom Houtribdijk Tintelhaven	Lelystad	Fl	\N	\N
4412	09-10-2023	2023-10-09 00:00:00	41/409	Outdoor Man	11-10-2023	2023-10-11 00:00:00	41/409	HighKing	52.5232849	4.62656021	bij uitkijktoren Kruisberg	Heemskerk	NH	\N	\N
4066	19-11-2021	2021-11-19 00:00:00	41/180	ootje	21-11-2021	2021-11-21 00:00:00	41/180	BSI	52.1273193	5.87868309	tegen boom Otterloseweg	Hoenderloo	Ge	\N	\N
846	02-07-2012	2012-07-02 00:00:00	16/21	Bensi	03-07-2012	2012-07-03 00:00:00	16/22	Hasseman	51.9934921	6.22278118	hek bij vlondertje Molen	Laag Keppel	Ge	\N	\N
3296	04-11-2019	2019-11-04 00:00:00	40/502	Bensi	06-11-2019	2019-11-06 00:00:00	40/504	Arriens	52.0093803	6.35252905	in bloembak Jan Steenstraat	Zelhem	Ge	\N	\N
3584	14-07-2020	2020-07-14 00:00:00	40/736	k0en	15-07-2020	2020-07-15 00:00:00	40/737	Roeleey	52.0776482	5.13246012	tegen hekpost P-plaats Gansstraat	Utrecht	Ut	\N	\N
1042	02-01-2013	2013-01-02 00:00:00	18/46	SadBunny	02-01-2013	2013-01-02 00:00:00	18/46	BSI	52.3126373	4.81504488	op tunneltje Nieuwemeerdijk	Badhoevedorp	NH	\N	\N
1891	26-04-2015	2015-04-26 00:00:00	28/61	Rainbow600	26-04-2015	2015-04-26 00:00:00	28/62	Scoot_020/Scoot_2	51.2791824	3.37564993	bij brug grens Belgie	Sluis	Ze	\N	\N
1252	25-06-2013	2013-06-25 00:00:00	21/50	Ronald_010	26-06-2013	2013-06-26 00:00:00	21/51	SparkViv	51.8663979	4.27002096	aan boarding Nieuwe Sluisweg	Rotterdam	ZH	\N	\N
2852	10-08-2018	2018-08-10 00:00:00	40/06	Roeleey	10-08-2018	2018-08-10 00:00:00	40/06	pdv_moto	52.3846283	4.90605021	aan boompje Ranonkelkade	Amsterdam	NH	\N	\N
3991	23-07-2021	2021-07-23 00:00:00	41/132	Nelfrikandel	23-07-2021	2021-07-23 00:00:00	41/132	Hans89	52.0214348	4.38795185	in pomphuis Noordeindseweg	Delfgauw	ZH	\N	\N
2939	03-11-2018	2018-11-03 00:00:00	40/99	FastEddy	03-11-2018	2018-11-03 00:00:00	40/99	Amauta	52.943367	7.18018007	aan hek Hassebergerweg	Sellingen	Gr	\N	\N
2105	01-05-2016	2016-05-01 00:00:00	30/76	pdv_moto	01-05-2016	2016-05-01 00:00:00	30/77	bikedan	51.422596	4.18774319	aan paal rotondebord	Rilland	Ze	\N	\N
2560	09-10-2017	2017-10-09 00:00:00	36/22	HermanK	10-10-2017	2017-10-10 00:00:00	36/23	highking	52.529686	5.71447802	aan bord Fendt - Havenweg	Dronten	Fl	\N	\N
1503	08-02-2014	2014-02-08 00:00:00	24/68	ootje	08-02-2014	2014-02-08 00:00:00	24/68	Sjakie-77	52.5652618	4.69804382	achter bankje - Schoollaan	Limmen	NH	\N	\N
2425	16-05-2017	2017-05-16 00:00:00	34/48	Eztys	16-05-2017	2017-05-16 00:00:00	34/48	Amauta	53.1848259	6.07038498	aan boom bij kerkhof d'Aldtoer	Eastermar	Fr	\N	\N
1851	27-02-2015	2015-02-27 00:00:00	28/21	Bomba	27-02-2015	2015-02-27 00:00:00	28/21	JurgenT	52.0846748	5.10218	stand Transalpclub - jaarbeurs 10A012	Utrecht	Ut	\N	\N
1726	28-08-2014	2014-08-28 00:00:00	27/11	Rainbow600	29-08-2014	2014-08-29 00:00:00	27/12	Roeleey	52.3522034	5.22241402	onder steen bij paal - De Steiger	Almere	Fl	\N	\N
3029	01-03-2019	2019-03-01 00:00:00	40/226	Marsian	02-03-2019	2019-03-02 00:00:00	40/228	Okami_Xci	52.3399506	5.26936817	in haag terrein Kemphaanlaan	Almere	Fl	\N	\N
982	08-11-2012	2012-11-08 00:00:00	17/76	BigJim	09-11-2012	2012-11-09 00:00:00	17/77	Bigtwim	52.6211395	4.75727892	Avonturenheuvel park Oosterhout	Alkmaar	NH	\N	\N
62	24-09-2010	2010-09-24 00:00:00	3/7	oehTie	24-09-2010	2010-09-24 00:00:00	3/9	Dennisik	51.9282417	4.26035118	Parallelweg, Maassluis, ZH	Maassluis	ZH	\N	\N
4292	20-02-2023	2023-02-20 00:00:00	41/330	Okami_Xci	20-02-2023	2023-02-20 00:00:00	41/330	scheurschuimpje	51.459877	4.69871807	achter bord "welkom in Brabant"	Zundert	NB	\N	\N
2553	21-09-2017	2017-09-21 00:00:00	36/06	pdv_moto	22-09-2017	2017-09-22 00:00:00	36/07	-Floris-	51.7595825	3.84815311	in pol helm - Brouwersdam	Ouddorp	ZH	\N	\N
1646	23-05-2014	2014-05-23 00:00:00	26/16	frankivo	23-05-2014	2014-05-23 00:00:00	26/17	pinpoint	52.8282852	7.04456902	fort voor het water	Emmer-Compascuum	Dr	\N	\N
3761	05-12-2020	2020-12-05 00:00:00	40/896	FastEddy	06-12-2020	2020-12-06 00:00:00	40/896	Amauta	53.1802979	7.19840002	onder voetgangersbrug Aadijk	Bad Nieuweschans	Gr	\N	\N
2863	16-08-2018	2018-08-16 00:00:00	40/15	FastEddy	16-08-2018	2018-08-16 00:00:00	40/15	pdv_moto	52.5273514	6.49701309	bij huisje P-terrein Junneweg	Ommen	Ov	\N	\N
719	04-03-2012	2012-03-04 00:00:00	14/71	BSI	04-03-2012	2012-03-04 00:00:00	14/71	Ronald_010	51.9042702	4.73356199	aan brug uiterwaard Opperduit, Lekkerkerk, ZH	Lekkerkerk	ZH	\N	\N
993	13-11-2012	2012-11-13 00:00:00	17/90	Scoot_020/Scoot_2	14-11-2012	2012-11-14 00:00:00	17/91	Bigtwim	52.3572731	4.83568001	bij schep busstation Lelylaan	Amsterdam	NH	\N	\N
4224	23-07-2022	2022-07-23 00:00:00	41/283	Amauta	24-07-2022	2022-07-24 00:00:00	41/283	FastEddy	53.3928795	6.30605316	tegen hek bij Zeedijk 	Lauwersoog	Gr	\N	\N
2968	25-12-2018	2018-12-25 00:00:00	40/141	FastEddy	26-12-2018	2018-12-26 00:00:00	40/142	Bassjunky	52.9862213	6.97252321	bij brug Spreeuwenhof	Stadskanaal	Gr	\N	\N
3023	25-02-2019	2019-02-25 00:00:00	40/220	Coenster	25-02-2019	2019-02-25 00:00:00	40/220	Rik60NL	52.3159294	4.94483995	ketelhuis B. Pasternakstraat	Amsterdam	NH	\N	\N
3786	16-01-2021	2021-01-16 00:00:00	40/921	FastEddy	17-01-2021	2021-01-17 00:00:00	40/921	Amauta	53.0566292	7.08085299	onder steen Giezelbarg	Vlagtwedde	Gr	\N	\N
1297	06-08-2013	2013-08-06 00:00:00	22/12	Bar-E	07-08-2013	2013-08-07 00:00:00	22/12	tdemmer	51.7114677	5.07142878	aan hek Gansoyensesteeg	Waalwijk	NB	\N	\N
4360	15-06-2023	2023-06-15 00:00:00	41/375	Pydejong	19-06-2023	2023-06-19 00:00:00	41/376	HermanK	50.8963127	6.02909899	tegen viaductpijler Dr. Calsstraat	Landgraaf	Li	\N	\N
2859	14-08-2018	2018-08-14 00:00:00	40/11	FastEddy	14-08-2018	2018-08-14 00:00:00	40/12	frankivo	52.9591141	6.97350502	bij gemaaltje Tweederdeweg Zuid	Nieuw Buinen	Dr	\N	\N
2287	01-11-2016	2016-11-01 00:00:00	32/87	frankivo	01-11-2016	2016-11-01 00:00:00	32/87	Amauta	53.0335655	6.3876791	bij boom bierbrouwerij Maallust	Veenhuizen	Dr	\N	\N
187		0001-01-01 00:00:00 BC				0001-01-01 00:00:00 BC		moturist	\N	\N				\N	\N
1612	29-04-2014	2014-04-29 00:00:00	25/85	Hans89	30-04-2014	2014-04-30 00:00:00	25/86	SadBunny	51.4313774	3.71283793	aan hek koelwateruitlaat	Borsele	Ze	\N	\N
1306	14-08-2013	2013-08-14 00:00:00	22/19	Ronald_010	14-08-2013	2013-08-14 00:00:00	22/19	Scoot_020/Scoot_2	52.2989388	5.15897894	aan boompje Adm. Helfrichweg	Naarden	NH	\N	\N
3819	03-03-2021	2021-03-03 00:00:00	40/945	Picobello BV	03-03-2021	2021-03-03 00:00:00	40/946	pdv_moto	52.1441917	4.51202297	in takkenstapel P-terrein v/d Madeweg	Leiden	ZH	\N	\N
3911	23-05-2021	2021-05-23 00:00:00	41/075	pdv_moto	25-05-2021	2021-05-25 00:00:00	41/076	Roeleey	51.5157051	3.46485901	aan 2e lantaarnpaal Paulusweg	Westkapelle	Ze	\N	\N
2121	10-05-2016	2016-05-10 00:00:00	30/90	Roeleey	10-05-2016	2016-05-10 00:00:00	30/90	Corney28	52.3818741	4.88623095	aan motor Brouwersgracht 226	Amsterdam	NH	\N	\N
2062	02-02-2016	2016-02-02 00:00:00	30/22	pdv_moto	04-02-2016	2016-02-04 00:00:00	30/24	Dirk130	52.1130409	4.2940321	in bloembak Harstenhoekweg	Den Haag	ZH	\N	\N
147	21-11-2010	2010-11-21 00:00:00	5/4	Fibershark	21-11-2010	2010-11-21 00:00:00	5/4	bouwvakkertje	52.2973251	6.71626186	Brug over Azelerbeek - Bruggeweg, Azelo, Ov	Azelo	Ov	\N	\N
3261	05-10-2019	2019-10-05 00:00:00	40/473	Hans89	06-10-2019	2019-10-06 00:00:00	40/474	pdv_moto	51.784935	3.86937189	achter kastje GSM-mast Brouwersdam	Ouddorp	ZH	\N	\N
1988	11-08-2015	2015-08-11 00:00:00	29/40	coffeejunk	12-08-2015	2015-08-12 00:00:00	29/40	Artemecion	52.6109543	4.7074542	achter E-kast Nijenburg	Heiloo	NH	\N	\N
3102	03-05-2019	2019-05-03 00:00:00	40/304	ootje	03-05-2019	2019-05-03 00:00:00	40/305	Amauta	52.5809517	4.72211123	in bus bordje , Landweg	Heiloo	NH	\N	\N
2934	21-10-2018	2018-10-21 00:00:00	40/92	Amauta	25-10-2018	2018-10-25 00:00:00	40/94	HermanK	52.6530914	5.61250496	in strik op rotonde N352/Meep	Urk	Fl	\N	\N
2761	23-05-2018	2018-05-23 00:00:00	38/92	Outdoor Man	23-05-2018	2018-05-23 00:00:00	38/93	HermanK	52.6643066	6.74499321	in van Heutzpark	Coevorden	Dr	\N	\N
4165	15-04-2022	2022-04-15 00:00:00	41/247	Outdoor Man	17-04-2022	2022-04-17 00:00:00	41/247	Coenster	52.3059158	4.89607286	teggen brugje Middenpolder	Amstelveen	NH	\N	\N
1619	02-05-2014	2014-05-02 00:00:00	25/90	thyrif	02-05-2014	2014-05-02 00:00:00	25/90	Bigtwim	52.5247192	5.06546783	bij putje pijlbuis - Zeevangsedijk	Edam	NH	\N	\N
2401	25-04-2017	2017-04-25 00:00:00	34/26	pdv_moto	26-04-2017	2017-04-26 00:00:00	34/27	-Floris-	51.5767021	3.61631298	achter muurtje Pelgrimskerk	Vrouwenpolder	Ze	\N	\N
3074	12-04-2019	2019-04-12 00:00:00	40/270	pdv_moto	13-04-2019	2019-04-13 00:00:00	40/270	Schwenneh	52.0855675	4.28548908	in struik Groot Hertoginnelaan	Den Haag	ZH	\N	\N
3209	13-08-2019	2019-08-13 00:00:00	40/424	Hans89	14-08-2019	2019-08-14 00:00:00	40/424	Outdoor Man	51.9548035	4.44240093	tegen pijler Staketsel bistro Waalhaven	Rotterdam	ZH	\N	\N
1972	23-07-2015	2015-07-23 00:00:00	29/28	BSI	26-07-2015	2015-07-26 00:00:00	29/29	Djoost	52.1036606	5.26376104	achter boomstam carpool N238	Zeist	Ut	\N	\N
3574	06-07-2020	2020-07-06 00:00:00	40/729	HighKing	07-07-2020	2020-07-07 00:00:00	40/729	pdv_moto	52.4962807	4.65903902	in struiken Almaarseweg	Beverwijk	NH	\N	\N
1127	21-03-2013	2013-03-21 00:00:00	19/68	Roeleey	21-03-2013	2013-03-21 00:00:00	19/68	Corney28	52.2982445	4.98364305	aan huis Vianenstraat	Amsterdam	NH	\N	\N
3011	08-02-2019	2019-02-08 00:00:00	40/202	BSI	09-02-2019	2019-02-09 00:00:00	40/203	Marsian	52.3981323	5.45244408	onder 2e brug Aartzee, Lepelaartocht	Zeewolde	Fl	\N	\N
4396	02-09-2023	2023-09-02 00:00:00	41/399	Pydejong	09-09-2023	2023-09-09 00:00:00	41/400	Marsian	52.8828583	4.86982298	tegen bruggenhoofd van gemaaltje	Anna Paulowna	NH	\N	\N
1794	12-11-2014	2014-11-12 00:00:00	27/70	Ronald_010	12-11-2014	2014-11-12 00:00:00	27/70	-juliet-	51.9968529	4.39319611	aan hek N479 bij rotonde A13	Delft	ZH	\N	\N
3849	28-03-2021	2021-03-28 00:00:00	41/021	pdv_moto	28-03-2021	2021-03-28 00:00:00	41/021	bikedan	51.5186195	3.44935799	tegen boom ein P-terrein Joossesweg	Westkapelle	Ze	\N	\N
377	18-05-2011	2011-05-18 00:00:00	9/86	lynx84	18-05-2011	2011-05-18 00:00:00	9/86	Richard117	51.8386383	4.65800905	uitzichtpunt - Onderdijkse Rijweg, H.I. Ambacht, ZH	H.I.Ambacht	ZH	\N	\N
4319	11-04-2023	2023-04-11 00:00:00	41/347	Hans89	13-04-2023	2023-04-13 00:00:00	41/348	pdv_moto	51.9520378	4.5078969	tegen walkant Boterdorps Verlaat	Rotterdam	ZH	\N	\N
1442	14-12-2013	2013-12-14 00:00:00	24/02	Ronald_010	14-12-2013	2013-12-14 00:00:00	24/03	SparkViv	51.9261093	4.33710718	aan poot infobord - Watersportweg	Vlaardingen	ZH	\N	\N
657	09-12-2011	2011-12-09 00:00:00	13/73	Hasseman	09-12-2011	2011-12-09 00:00:00	13/75	MotorMieke	52.5276642	6.49793291	achter bank vistrap Vecht - Junnerweg, Ommen, Ov	Ommen	Ov	\N	\N
3736	06-11-2020	2020-11-06 00:00:00	40/873	k0en	07-11-2020	2020-11-07 00:00:00	40/874	SadBunny	52.492775	5.07456207	tegen beschoeiing Zuideinde haven	Volendam	NH	\N	\N
1153	03-04-2013	2013-04-03 00:00:00	20/03	sirdrinksalotofpetrol	03-04-2013	2013-04-03 00:00:00	20/03	Bludge	52.0255127	6.05711508	onder boom P-terrein Diepesteegn	de Steeg	Ge	\N	\N
2735	03-05-2018	2018-05-03 00:00:00	38/67	Okami_Xci	04-05-2018	2018-05-04 00:00:00	38/68	Amauta	51.2888794	5.46978712	aan snelheidslimieten Maastrichterweg	Valkenswaard	NB	\N	\N
2473	29-06-2017	2017-06-29 00:00:00	34/99	DKP	30-06-2017	2017-06-30 00:00:00	34/100	Amauta	53.4689178	6.20094395	in Taxibord - veerdam	Schiermonnikoog	Fr	\N	\N
28	31-08-2010	2010-08-31 00:00:00	2/1	Ted	31-08-2010	2010-08-31 00:00:00	2/3	Bensi	52.1695099	5.98214102	De Els, Lieren/Beekbergen, Ge	Lieren	Ge	\N	\N
3739	08-11-2020	2020-11-08 00:00:00	40/876	Yosra87	09-11-2020	2020-11-09 00:00:00	40/877	pdv_moto	52.0906105	4.29590082	achter schakelkast Timorstraat	Den Haag	ZH	\N	\N
4356	13-06-2023	2023-06-13 00:00:00	41/373	Springbok	13-06-2023	2023-06-13 00:00:00	41/373	Motor-inator	51.9408646	5.60222578	hek bij wachttoren Rijnbandijk	Opheusden	Ge	\N	\N
2600	10-12-2017	2017-12-10 00:00:00	36/78	Okami_Xci	18-12-2017	2017-12-18 00:00:00	36/80	pdv_moto	51.4409904	5.5022378	achter bord P-terrein - Crabethstraat	Eindhoven	NB	\N	\N
1390	12-10-2013	2013-10-12 00:00:00	23/42	Buuv	13-10-2013	2013-10-13 00:00:00	23/43	Janhertog	52.7669029	6.42241478	aan berk bij P-plaats N375	Pesse	Dr	\N	\N
213	31-01-2011	2011-01-31 00:00:00	6/71	vuurbloed	31-01-2011	2011-01-31 00:00:00	6/73	BigJim	52.2840385	4.6615448	Calatravabrug - Nwe Bennebroekseweg, Hoofddorp, NH	Hoofddorp	NH	\N	\N
3406	08-03-2020	2020-03-08 00:00:00	40/586	pdv_moto	08-03-2020	2020-03-08 00:00:00	40/587	Amauta	53.2283897	7.13319016	aan sluis Carel Coenraad Polder	Finsterwolde	Gr	\N	\N
560	30-09-2011	2011-09-30 00:00:00	12/41	tdemmer	02-10-2011	2011-10-02 00:00:00	12/44	Ronald_010	51.8297806	4.00743484	aan mand beeld visser - Haveneind, Stellendam, ZH	Stellendam	ZH	\N	\N
3250	26-09-2019	2019-09-26 00:00:00	40/466	Outdoor Man	26-09-2019	2019-09-26 00:00:00	40/466	Coenster	52.2378845	5.14140415	achter boom Corverslaan	Hilversum	Ut	\N	\N
4306	18-03-2023	2023-03-18 00:00:00	41/339	Amauta	18-03-2023	2023-03-18 00:00:00	41/339	pdv_moto	53.4011421	6.60910702	in heg van stationsperron	Usquert	Gr	\N	\N
2895	09-09-2018	2018-09-09 00:00:00	40/47	BSI	10-09-2018	2018-09-10 00:00:00	40/48	Amauta	51.9689522	5.34377003	in tapel stammen Kasteel Duurstede	Wijk bij Duurstede	Ut	\N	\N
3409	10-03-2020	2020-03-10 00:00:00	40/589	pdv_moto	11-03-2020	2020-03-11 00:00:00	40/589	Picobello BV	51.9828987	4.11250114	tegen betonningswagen, Strandweg	Hoek van Holland	ZH	\N	\N
3673	23-09-2020	2020-09-23 00:00:00	40/826	FastEddy	24-09-2020	2020-09-24 00:00:00	40/827	Amauta	53.0403404	6.39191818	in struik bij monument (gebroken goot)	Veenhuizen	Dr	\N	\N
1331	30-08-2013	2013-08-30 00:00:00	22/52	Bensi	30-08-2013	2013-08-30 00:00:00	22/53	Bludge	51.5242462	6.03445005	aan berk ingang "de Witte Vennen"	Oostrum	Li	\N	\N
4307	18-03-2023	2023-03-18 00:00:00	41/339	pdv_moto	24-03-2023	2023-03-24 00:00:00	41/340	Picobello BV	51.7570229	3.84113097	tegen bord Brouwersdam Binnenzijde	Ellemeet	Ze	\N	\N
471	21-07-2011	2011-07-21 00:00:00	11/17	Scoot_020/Scoot_2	22-07-2011	2011-07-22 00:00:00	11/18	bakfiets1	51.5902748	3.66110301	paal parkeerplaats - Banjaard, Kamperland, Ze	Kamperland	Ze	\N	\N
3614	07-08-2020	2020-08-07 00:00:00	40/769	BSI	08-08-2020	2020-08-08 00:00:00	40/769	SadBunny	52.1069603	5.66535616	aan hekpost Hoge Valksedijk	Lunteren	Ge	\N	\N
74	30-09-2010	2010-09-30 00:00:00	3/30	stampertje_35	30-09-2010	2010-09-30 00:00:00	3/31	ootje	52.4340897	5.08868504	molens Zeedijk, Uitdam / Marken, NH	Uitdam	NH	\N	\N
1711	15-08-2014	2014-08-15 00:00:00	26/94	bikedan	15-08-2014	2014-08-15 00:00:00	26/94	crazy987	51.7157516	4.88814878	bij afvalbak Maaspad	Raamsdonkveer	NB	\N	\N
824	13-06-2012	2012-06-13 00:00:00	15/87	Buuv	14-06-2012	2012-06-14 00:00:00	15/89	Smuiger	52.987751	6.51027679	achter paddestoel - Baggelhuizen, Assen, Dr	Assen	Dr	\N	\N
3177	26-07-2019	2019-07-26 00:00:00	40/394	Deeffox	27-07-2019	2019-07-27 00:00:00	40/394	jaap43	51.7701759	4.62896919	aan hek waterinlaat Wieldrechtse Zeedijk	Dordrecht	ZH	\N	\N
298		0001-01-01 00:00:00 BC				0001-01-01 00:00:00 BC		Eady	\N	\N				\N	\N
3448	10-04-2020	2020-04-10 00:00:00	40/625	Outdoor Man	10-04-2020	2020-04-10 00:00:00	40/626	Deeffox	51.7218933	4.61573505	in stronk bij luchtwachttoren Mariapolder	Strijensas	ZH	\N	\N
2236	15-09-2016	2016-09-15 00:00:00	32/13	PatrickSoler	15-09-2016	2016-09-15 00:00:00	32/14	pdv_moto	52.1586609	4.54865599	op voet reclamebord - Elisabethhof	Leiden	ZH	\N	\N
4197	28-05-2022	2022-05-28 00:00:00	41/268	scheurschuimpje	29-05-2022	2022-05-29 00:00:00	41/268	FastEddy	52.8501129	5.9907608	tegen hek gemaal Stroomkantpad	Blesdijke	Fr	\N	\N
2289	04-11-2016	2016-11-04 00:00:00	32/90	pdv_moto	18-11-2016	2016-11-18 00:00:00	32/97	pdv_moto	51.4084053	5.45788383	tegen hoek p-garage P6 - HTC	Eindhoven	NB	\N	\N
4268	27-11-2022	2022-11-27 00:00:00	41/315	Outdoor Man	30-11-2022	2022-11-30 00:00:00	41/316	Scoot_020	52.3692131	5.22454023	achter E-kast Flevoziekenhuis	Almere	Fl	\N	\N
4400	16-09-2023	2023-09-16 00:00:00	41/402	Hans89	16-09-2023	2023-09-16 00:00:00	41/402	jaap43	51.9238739	4.59122705	in struik steiger Fuyckterrein	Capelle aan den Ijssel	ZH	\N	\N
791	30-04-2012	2012-04-30 00:00:00	15/46	bikedan	01-05-2012	2012-05-01 00:00:00	15/47	meylie-style	51.3890152	4.33423805	aan hek Leemberg, Ossendrecht, NB	Ossendrecht	NB	\N	\N
1214	17-05-2013	2013-05-17 00:00:00	20/93	Corney28	18-05-2013	2013-05-18 00:00:00	20/94	SadBunny	52.2294312	4.83653784	naast heg Ringdijk 2e Bedijking	Mijdrecht	Ut	\N	\N
2244	20-09-2016	2016-09-20 00:00:00	32/22	Simonshavenaar	20-09-2016	2016-09-20 00:00:00	32/22	Motormuisje_alice	51.820137	4.30254507	aan hek zijweg Garsdijk	Simonshaven	ZH	\N	\N
1461	05-01-2014	2014-01-05 00:00:00	24/21	Bomba	05-01-2014	2014-01-05 00:00:00	24/22	Blogem	52.1088371	4.72255421	achter sokkel Schaatser	Alphen a/d Rijn	ZH	\N	\N
4251	07-10-2022	2022-10-07 00:00:00	41/302	BSI	08-10-2022	2022-10-08 00:00:00	41/302	Ronald_010	51.9430618	5.61764288	aan hekpost Blaauwe kamer	Wageningen	Ge	\N	\N
4294	26-02-2023	2023-02-26 00:00:00	41/331	pdv_moto	27-02-2023	2023-02-27 00:00:00	41/332	tdemmer	51.5182343	3.460922	tegen boompje langs Grindweg	Westkapelle	Ze	\N	\N
2394	21-04-2017	2017-04-21 00:00:00	34/20	Rik60NL	21-04-2017	2017-04-21 00:00:00	34/20	Scoot_020/Scoot_2	52.2544518	4.83675289	achter kastje Bovenkerkerweg	Amstelveen	NH	\N	\N
3375	05-02-2020	2020-02-05 00:00:00	40/562	frankivo	07-02-2020	2020-02-07 00:00:00	40/563	Ronny Rabbelaar	53.111969	6.55852318	aan hek vliegveld Eelde,Eekhoornstraat	Yde	Dr	\N	\N
3061	30-03-2019	2019-03-30 00:00:00	40/257	vuurbloed	30-03-2019	2019-03-30 00:00:00	40/257	Rik60NL	52.1424103	4.74743605	tegen paaltje Aarlanderveenseweg	Aarlanderveen	ZH	\N	\N
3770	18-12-2020	2020-12-18 00:00:00	40/905	Roeleey	19-12-2020	2020-12-19 00:00:00	40/906	pdv_moto	52.2084312	4.86783314	aan hek Janskerk	Mijdrecht	Ut	\N	\N
461	11-07-2011	2011-07-11 00:00:00	11/1	zeepok	13-07-2011	2011-07-13 00:00:00	11/3	krhilbil	51.4267159	4.62403202	aan struik bij grens - Wernhoutseweg, Zundert, NB	Zundert	NB	\N	\N
2378	09-04-2017	2017-04-09 00:00:00	34/01	MP_NL	10-04-2017	2017-04-10 00:00:00	34/02	frankivo	52.7401924	6.94473505	in struik Blatterswijk	Nieuw-Dordrecht	Dr	\N	\N
2143	05-06-2016	2016-06-05 00:00:00	31/17	ErikBloot	05-06-2016	2016-06-05 00:00:00	31/17	Amauta	52.2058868	5.91676998	in holle boom - Asselsestraat	Apeldoorn	Ge	\N	\N
3415	16-03-2020	2020-03-16 00:00:00	40/593	Hans89	17-03-2020	2020-03-17 00:00:00	40/594	Outdoor Man	51.6846428	4.36454201	aan trap uitlijktoren Steygersdijk	Ooltgensplaat	ZH	\N	\N
761	01-04-2012	2012-04-01 00:00:00	15/16	Bomba	02-04-2012	2012-04-02 00:00:00	15/16	tdemmer	52.0593414	4.87116194	aan infobord langs Zwarte Dijkje, Linschoten, Ut	Linschoten	Ut	\N	\N
524	03-09-2011	2011-09-03 00:00:00	11/86	Luus	04-09-2011	2011-09-04 00:00:00	11/87	Buuv	52.9678154	6.53528023	in rioolbuis bij TT-circuit - Witterhaar, Assen, Dr	Assen	Dr	\N	\N
3516	26-05-2020	2020-05-26 00:00:00	40/677	ey-dzeej	27-05-2020	2020-05-27 00:00:00	40/679	Hans89	51.9519081	4.16142893	tegen paal bij Maeslantkring	Rozenburg	ZH	\N	\N
379	19-05-2011	2011-05-19 00:00:00	9/88	Wimis on	19-05-2011	2011-05-19 00:00:00	9/89	BSI	52.0103989	5.18737316	infobord Romeinse Villa - Hoogdijk, Houten, Ut	Houten	Ut	\N	\N
1428	22-11-2013	2013-11-22 00:00:00	23/84	Dirk130	22-11-2013	2013-11-22 00:00:00	23/84	Ronald_010	52.0820885	4.31837177	in Plantsoen - Casuaristraat	Den Haag	ZH	\N	\N
2978	01-01-2019	2019-01-01 00:00:00	40/154	pdv_moto	02-01-2019	2019-01-02 00:00:00	40/155	Sjefman	52.0061035	4.31197309	aan paaltje Woudselaan	Den Hoorn	ZH	\N	\N
1789	09-11-2014	2014-11-09 00:00:00	27/66	Djoost	09-11-2014	2014-11-09 00:00:00	27/66	Corney28	52.2270622	4.79795599	aan paal bij gemaal - Amsterldijk Z	Uithoorn	NH	\N	\N
1861	15-03-2015	2015-03-15 00:00:00	28/29	Wimis on	15-03-2015	2015-03-15 00:00:00	28/30	Ronald_010	52.0315094	5.14009809	bij hek P-terrein de Colonie - Koedijk	Houten	Ut	\N	\N
4426	16-11-2023	2023-11-16 00:00:00	41/417	BSI	17-11-2023	2023-11-17 00:00:00	41/417	Hans89	51.9882545	5.81711292	in buis bij Hotel Bilderberg, Bredelaan	Oosterbeek	Ge	\N	\N
871	27-07-2012	2012-07-27 00:00:00	16/54	Deadolon	28-07-2012	2012-07-28 00:00:00	16/54	MarkieNL	51.666153	5.37221813	in heg Pilotenstraat 4	Den Dungen	NB	\N	\N
4260	29-10-2022	2022-10-29 00:00:00	41/308	Amauta	02-11-2022	2022-11-02 00:00:00	41/309	Phaedrus	50.8516769	5.70430899	in boom P-terrein Stationsplein	Maastricht	Li	\N	\N
3816	27-02-2021	2021-02-27 00:00:00	40/493	Amauta	27-02-2021	2021-02-27 00:00:00	40/943	FastEddy	52.6499214	6.71292782	bij berkenboom Poort van Drenthe	Coevorden	Dr	\N	\N
1209	15-05-2013	2013-05-15 00:00:00	20/88	Corney28	15-05-2013	2013-05-15 00:00:00	20/89	Phaedrus	51.8224525	4.60122681	aan hek Munnikensteeg	Zwijndrecht	ZH	\N	\N
587	16-10-2011	2011-10-16 00:00:00	12/79	Ronald_010	16-10-2011	2011-10-16 00:00:00	12/81	Quickly	51.7127762	4.63999081	in heg bij monument Moerdijkbrug, Moerdijk, NB	Moerdijk	NB	\N	\N
1463	06-01-2014	2014-01-06 00:00:00	24/23	Scoot_020/Scoot_2	06-01-2014	2014-01-06 00:00:00	24/23	Corney28	52.3523865	4.81084108	aan hek sportveld - L. Davidsstraat	Amsterdam	NH	\N	\N
3547	14-06-2020	2020-06-14 00:00:00	40/704	bikedan	14-06-2020	2020-06-14 00:00:00	40/705	Sjefman	51.5998535	4.30591297	tegen paal bij fort Henricus, Schansdijk	Steenbergen	NB	\N	\N
33	03-09-2010	2010-09-03 00:00:00	2/30	magnamaniac	03-09-2010	2010-09-03 00:00:00	2/32	Hayfork	51.4197006	6.14726877	ijssalon Clevers - Lottumseweg, Grubbenvorst, Li	Grubbenvorst	Li	\N	\N
2636	13-02-2018	2018-02-13 00:00:00	37/37	FastEddy	13-02-2018	2018-02-13 00:00:00	37/39	Bassjunky	53.0426598	6.87169409	onder 1e firtsbrug langs Dalkanaal	Wildervank	Gr	\N	\N
1432	25-11-2013	2013-11-25 00:00:00	23/86	Sjantaalfoutje	27-11-2013	2013-11-27 00:00:00	23/87	MotorMieke	52.3780479	6.64554501	aan paaltje Gasunie - Aadijk	Almelo	Ov	\N	\N
1598	19-04-2014	2014-04-19 00:00:00	25/73	Rainbow600	19-04-2014	2014-04-19 00:00:00	25/73	Hans89	51.4638786	3.54539108	in bloempot Verdilaan	Vlissingen	Ze	\N	\N
1323	24-08-2013	2013-08-24 00:00:00	22/38	Bensi	24-08-2013	2013-08-24 00:00:00	22/39	Ronald_010	51.8857117	6.21538019	aan eenzame boom - Boterweg	Beek	Ge	\N	\N
1585	05-04-2014	2014-04-05 00:00:00	25/57	Ronald_010	06-04-2014	2014-04-06 00:00:00	25/58	de peppel	52.3745117	6.99344587	achter heg ingang Ellenweg	Denekamp	Ov	\N	\N
4213	29-06-2022	2022-06-29 00:00:00	41/277	BSI	29-06-2022	2022-06-29 00:00:00	41/278	Outdoor Man	52.1326141	5.60340309	in heg bij pluimveemuseum	Barneveld	Ge	\N	\N
3368	31-01-2020	2020-01-31 00:00:00	40/558	Marsian	31-01-2020	2020-01-31 00:00:00	40/558	BSI	52.3823051	5.14191914	tegen boom bij Lover en Fire	Almere	Fl	\N	\N
4259	27-10-2022	2022-10-27 00:00:00	41/307	Phaedrus	28-10-2022	2022-10-28 00:00:00	41/307	Amauta	52.6886673	6.26144886	tegen paaltje midden Noorderkanaalweg 	Rogat	Dr	\N	\N
609	31-10-2011	2011-10-31 00:00:00	13/18	Big Sexy	02-11-2011	2011-11-02 00:00:00	13/19	Hans89	51.2147789	5.92860508	achter gaszuiltje - Heythuyserweg, Horn, Li	Horn	Li	\N	\N
1905	07-05-2015	2015-05-07 00:00:00	28/71	jaap43	07-05-2015	2015-05-07 00:00:00	28/71	sjors078	51.8143044	4.76586723	aan stam - P-terrein Baanhoekweg	Dordrecht	ZH	\N	\N
3344	01-01-2020	2020-01-01 00:00:00	40/541	pdv_moto	02-01-2020	2020-01-02 00:00:00	40/542	Hans89	51.5472832	3.45370293	in struik P-terrein Westkaap	Westkapelle	Ze	\N	\N
464	16-07-2011	2011-07-16 00:00:00	11/06	ootje	16-07-2011	2011-07-16 00:00:00	11/07	Bigtwim	52.3363609	5.06617785	paal bij hek - Westzeedijk, Muiden, NH	Muiden	NH	\N	\N
806	20-05-2012	2012-05-20 00:00:00	15/63	ootje	21-05-2012	2012-05-21 00:00:00	15/64	Bigtwim	52.5818672	4.69829082	bij grenspaal - Kennemerstraatweg, Limmen, NH	Limmen	NH	\N	\N
558	28-09-2011	2011-09-28 00:00:00	12/38	Bensi	28-09-2011	2011-09-28 00:00:00	12/38	Shadowski	51.8935394	5.99838781	achter bank bij slot Doornenburg, Doornenburg, Ge	Doornenburg	Ge	\N	\N
2482	09-07-2017	2017-07-09 00:00:00	35/11	Bensi	10-07-2017	2017-07-10 00:00:00	35/13	Rik60NL	52.0009346	6.1455822	tegen boom Parallelweg den Helder	Doesburg	Ge	\N	\N
3651	01-09-2020	2020-09-01 00:00:00	40/808	Amauta	02-09-2020	2020-09-02 00:00:00	40/809	ootje	53.2378883	6.51257801	tegen poot naambord bij stadsmarkering	Groningen	Gr	\N	\N
2834	27-07-2018	2018-07-27 00:00:00	39/82	pdv_moto	27-07-2018	2018-07-27 00:00:00	39/83	vuurbloed	52.2697906	4.75333214	in bak studio's Alsmeer, van Cleeffkade	Alsmeer	NH	\N	\N
757	28-03-2012	2012-03-28 00:00:00	15/10	Dave1411	29-03-2012	2012-03-29 00:00:00	15/11	Dirk130	52.3787537	4.99892092	aan hek bij Durgerdammerdijk, Amsterdam, NH	Amsterdam	NH	\N	\N
3895	03-05-2021	2021-05-03 00:00:00	41/061	Coenster	03-05-2021	2021-05-03 00:00:00	41/061	Outdoor Man	52.2813911	4.56552315	in boom Hyacinthenlaan	Hillegom	ZH	\N	\N
433	15-06-2011	2011-06-15 00:00:00	10/61	Hasseman	15-06-2011	2011-06-15 00:00:00	10/63	Nis & Nas	52.244175	6.67236185	steiger - Kanaal Zuidzijde, Ambt Delden, Ov	Ambt Delden	Ov	\N	\N
2386	16-04-2017	2017-04-16 00:00:00	34/13	Coenster	16-04-2017	2017-04-16 00:00:00	34/13	vuurbloed	52.3058662	4.68199396	in voortuin vuurbloed (Petpappa)	Hoofddorp	NH	\N	\N
3241	14-09-2019	2019-09-14 00:00:00	40/456	HermanK	15-09-2019	2019-09-15 00:00:00	40/457	BSI	52.6373024	6.53783989	aan poot klokkenstoel OLV van Fatima	Schuinesloot	Ov	\N	\N
691	22-01-2012	2012-01-22 00:00:00	14/25	Scoot_020/Scoot_2	24-01-2012	2012-01-24 00:00:00	14/27	Ronald_010	52.3833618	4.96546412	achter kastje Wijkergouw, Amsterdam, NH	Amsterdam	NH	\N	\N
327	12-04-2011	2011-04-12 00:00:00	8/96	ElBarto	13-04-2011	2011-04-13 00:00:00	8/98	JerOen	51.4497795	5.46336508	parkeerhof 's-Gravesandestraat, Eindhoven, NB	Eindhoven	NB	\N	\N
527	07-09-2011	2011-09-07 00:00:00	11/92	Buuv	08-09-2011	2011-09-08 00:00:00	11/93	Kermit de Hond	52.9907074	6.52523184	achter bankje v/d Valkhotel - Balkenweg, Assen, Dr	Assen	Dr	\N	\N
2575	28-10-2017	2017-10-28 00:00:00	36/42	SadBunny	29-10-2017	2017-10-29 00:00:00	36/42	highking	52.5154572	5.00240803	verwaaid tegen hek Voltastraat	Purmerend	NH	\N	\N
3790	23-01-2021	2021-01-23 00:00:00	40/923	BornToReign	24-01-2021	2021-01-24 00:00:00	40/923	BSI	52.0499458	5.53008318	tegen hek/boom Kooiweg	Renswoude	Ut	\N	\N
886	06-08-2012	2012-08-06 00:00:00	16/66	ootje	06-08-2012	2012-08-06 00:00:00	16/67	Ronald_010	52.5365524	4.88511801	aan boompje Volgerweg	Beemster	NH	\N	\N
2756	19-05-2018	2018-05-19 00:00:00	38/86	HighKing	19-05-2018	2018-05-19 00:00:00	38/87	Roeleey	52.6217766	4.65378189	in muur ruine slot Egmond	Egmond	NH	\N	\N
2421	14-05-2017	2017-05-14 00:00:00	34/45	Totl	15-05-2017	2017-05-15 00:00:00	34/45	frankivo	53.181839	6.15455103	in struikje - Havenweg	Surhuisterveen	Fr	\N	\N
2959	18-12-2018	2018-12-18 00:00:00	40/131	DKP	18-12-2018	2018-12-18 00:00:00	40/132	ey-dzeej	51.857975	4.30401993	aan boom tankstation Hartelweg	Spijkenisse	ZH	\N	\N
3456	14-04-2020	2020-04-14 00:00:00	40/632	MP_NL	15-04-2020	2020-04-15 00:00:00	40/633	BSI	52.3554726	6.63983488	tegen kast Bellinckhof, Wierdensestraat	Almelo	Ov	\N	\N
482	01-08-2011	2011-08-01 00:00:00	11/30	patman vtr	01-08-2011	2011-08-01 00:00:00	11/30	rvdh86	51.4351883	5.440238	aan steun brug - Dillenburgstraat, Eindhoven, NB	Eindhoven	NB	\N	\N
1112	11-03-2013	2013-03-11 00:00:00	19/48	sirdrinksalotofpetrol	12-03-2013	2013-03-12 00:00:00	19/48	Mr.Bean	52.0430794	5.55851078	aan hek P-terrein MacDonalds	Veenendaal	Ut	\N	\N
3890	28-04-2021	2021-04-28 00:00:00	41/056	HighKing	28-04-2021	2021-04-28 00:00:00	41/056	Outdoor Man	52.5207863	4.67451191	onder stoel in parkje Mozartstraat	Heemskerk	NH	\N	\N
1934	14-06-2015	2015-06-14 00:00:00	28/97	bikedan	14-06-2015	2015-06-14 00:00:00	28/98	Ronald_010	51.3929977	4.31454086	aan knotlinde - Aanwas	Ossendrecht	NB	\N	\N
2992	20-01-2019	2019-01-20 00:00:00	40/176	Okami_Xci	21-01-2019	2019-01-21 00:00:00	40/177	DKP	51.5012054	5.48600578	tegen hek Ekkersrijt	Son	NB	\N	\N
456	06-07-2011	2011-07-06 00:00:00	10/94	bakfiets1	07-07-2011	2011-07-07 00:00:00	10/95	jaap43	51.6593399	4.16341591	struik uitzichtpunt Krammesluizen, Bruinisse, Ze	Bruinisse	Ze	\N	\N
3497	16-05-2020	2020-05-16 00:00:00	40/665	Ronald_010	17-05-2020	2020-05-17 00:00:00	40/665	BSI	51.3397408	6.15602303	onder stapel stenen Watertoren	Tegelen	Li	\N	\N
3205	11-08-2019	2019-08-11 00:00:00	40/419	Meifesto	11-08-2019	2019-08-11 00:00:00	40/420	Ronald_010	51.8636093	4.51315784	aan GSM-mast Carnisseweg	Barendrecht	ZH	\N	\N
878	01-08-2012	2012-08-01 00:00:00	16/58	jaap43	02-08-2012	2012-08-02 00:00:00	16/59	BSI	51.8503838	4.6182518	in heg Achterambachtseweg	H.I.Ambacht	ZH	\N	\N
3522	31-05-2020	2020-05-31 00:00:00	40/684	pdv_moto	31-05-2020	2020-05-31 00:00:00	40/685	Bensi	52.0078735	5.77841902	tegen poot plaatsnaambord Parallelweg	Wolfheze	Ge	\N	\N
2759	21-05-2018	2018-05-21 00:00:00	38/90	BSI	21-05-2018	2018-05-21 00:00:00	38/90	SadBunny	51.9681702	5.69639111	aan hek watertoren	Wageningen	Ge	\N	\N
1778	23-10-2014	2014-10-23 00:00:00	27/55	Lekkerbekje	25-10-2014	2014-10-25 00:00:00	27/56	Bomba	51.9906769	5.48121214	achter boom P-terrein - Elsterstraatweg	Elst	Ut	\N	\N
762	02-04-2012	2012-04-02 00:00:00	15/16	tdemmer	02-04-2012	2012-04-02 00:00:00	15/17	jaap43	51.9706688	4.60682297	pleintje Oostringdijk, Nieuwerkerk a/d IJssel, ZH	Nieuwerkerk a/d IJssel	ZH	\N	\N
2556	25-09-2017	2017-09-25 00:00:00	36/10	Ronald_010	28-09-2017	2017-09-28 00:00:00	36/12	Okami_Xci	51.3396111	6.14369392	in haag NS-Station de Drink	Tegelen	Li	\N	\N
4368	30-06-2023	2023-06-30 00:00:00	41/381	BSI	30-06-2023	2023-06-30 00:00:00	41/381	Bensi	51.9933014	6.22336197	aan hek bruggenhoofd Wehlsedijk	Laag Keppel	Ge	\N	\N
3812	21-02-2021	2021-02-21 00:00:00	40/939	BSI	22-02-2021	2021-02-22 00:00:00	40/939	Outdoor Man	52.1474762	5.56510878	in boom Thorbeckelaan	Barneveld	Ge	\N	\N
2188	30-07-2016	2016-07-30 00:00:00	31/62	Einschtein	31-07-2016	2016-07-31 00:00:00	31/63	pdv_moto	51.9166489	4.72625303	bij afvalbak - Hoekseweg	Lekkerkerk	ZH	\N	\N
2989	15-01-2019	2019-01-15 00:00:00	40/172	DKP	18-01-2019	2019-01-18 00:00:00	40/174	Capo-04/06	51.0918961	5.80068588	onder aan trap P-terrein	Roosteren	Li	\N	\N
4222	20-07-2022	2022-07-20 00:00:00	41/282	Phaedrus	21-07-2022	2022-07-21 00:00:00	41/282	Outdoor Man	51.1597862	6.07286978	achter bord Nat. Park Meinweg	Herkenbosch	Li	\N	\N
3901	09-05-2021	2021-05-09 00:00:00	41/065	Roeleey	09-05-2021	2021-05-09 00:00:00	41/066	pdv_moto	51.6019363	3.84537601	tefen toegangszuil tempel Nehallennia	Colijnsplaat	Ze	\N	\N
4201	30-05-2022	2022-05-30 00:00:00	41/269	Janhertog	31-05-2022	2022-05-31 00:00:00	41/270	FastEddy	53.1056938	6.0955348	in gangetje Sander Israëlplein	Drachten	Fr	\N	\N
3877	14-04-2021	2021-04-14 00:00:00	41/042	pdv_moto	14-04-2021	2021-04-14 00:00:00	41/042	MeanYellowBoy	52.5456047	6.49970388	achter e-kast de Hongerige Wolf	Stegeren	Ov	\N	\N
3463	19-04-2020	2020-04-19 00:00:00	40/638	BSI	19-04-2020	2020-04-19 00:00:00	40/638	Ronald_010	51.6487083	5.68687677	aan boomstronk vliegbasis, Scheiweg	Volkel	NB	\N	\N
841	26-06-2012	2012-06-26 00:00:00	16/12	Maegrim	27-06-2012	2012-06-27 00:00:00	16/14	Jeff92	52.1984406	5.43945599	aan boom Domstraat, Amersfoort, Ut	Amersfoort	Ut	\N	\N
2219	30-08-2016	2016-08-30 00:00:00	31/95	Rainbow600	30-08-2016	2016-08-30 00:00:00	31/96	Roeleey	52.3524361	5.22269392	op te halen op Kantoor - de Steiger	Almere	Fl	\N	\N
1011	01-12-2012	2012-12-01 00:00:00	18/19	Ronald_010	02-12-2012	2012-12-02 00:00:00	18/20	BSI	51.6886292	4.4089241	achter hek Volkeraksluizen	Willemstad	NB	\N	\N
3075	14-04-2019	2019-04-14 00:00:00	40/270	Schwenneh	14-04-2019	2019-04-14 00:00:00	40/270	Coenster	52.2203178	4.55816889	tegen boom gemaal Leeghwater	Buitenkaag	NH	\N	\N
1513	13-02-2014	2014-02-13 00:00:00	24/80	Vins111	13-02-2014	2014-02-13 00:00:00	24/81	Rainbow600	51.9677048	5.20709515	aan hek achter E-kast - Lekdijk	Schalkwijk	Ut	\N	\N
3589	19-07-2020	2020-07-19 00:00:00	40/739	Arriens	19-07-2020	2020-07-19 00:00:00	40/739	Outdoor Man	52.02005	6.12796116	idem, geen tijd om te verbergen	Elllecom	Ge	\N	\N
631	17-11-2011	2011-11-17 00:00:00	13/46	Ronald_010	18-11-2011	2011-11-18 00:00:00	jaap43	jaap43	51.895771	4.3737092	hek ventilatiegebouw Bakkersoordweg, Pernis, ZH	Pernis	ZH	\N	\N
1990	13-08-2015	2015-08-13 00:00:00	29/42	Bigtwim	14-08-2015	2015-08-14 00:00:00	29/43	Artemecion	52.5012054	4.69492483	bij bankje aan de Richel	Heemskerk	NH	\N	\N
3034	09-03-2019	2019-03-09 00:00:00	40/236	pdv_moto	10-03-2019	2019-03-10 00:00:00	40/237	Amauta	53.3336143	6.92396021	in bloembak NS-station 	Delfzijl	Gr	\N	\N
393	29-05-2011	2011-05-29 00:00:00	10/15	Ronald_010	30-05-2011	2011-05-30 00:00:00	10/16	Dirk130	51.9584541	4.40872622	aan boompje - Tempelweg, Rotterdam, ZH	Rotterdam	ZH	\N	\N
1191	03-05-2013	2013-05-03 00:00:00	20/62	Roeleey	04-05-2013	2013-05-04 00:00:00	20/63	SadBunny	52.4745483	4.82302999	onder brug Zaanse Schans	Zaandam	NH	\N	\N
2942	07-11-2018	2018-11-07 00:00:00	40/102	Amauta	08-11-2018	2018-11-08 00:00:00	40/102	BornToReign	52.6890907	6.15637302	tegen lichtopstand wachthaven	Wanneperveen	Ov	\N	\N
2621	22-01-2018	2018-01-22 00:00:00	37/13	Roeleey	22-01-2018	2018-01-22 00:00:00	37/14	HighKing	52.3863373	4.86573219	in boom bij kunstwerk Westerpark	Amsterdam	NH	\N	\N
1079	15-02-2013	2013-02-15 00:00:00	19/07	Bensi	15-02-2013	2013-02-15 00:00:00	19/07	Hasseman	52.0182152	6.12776423	aan boompje Middelwaard	Ellecom	Ge	\N	\N
1151	02-04-2013	2013-04-02 00:00:00	19/98	SadBunny	02-04-2013	2013-04-02 00:00:00	19/99	Bludge	52.3285217	5.82663822	op P-terrein Elspeterbosweg	Vierhouten	Ge	\N	\N
1093	25-02-2013	2013-02-25 00:00:00	19/24	Roeleey	26-02-2013	2013-02-26 00:00:00	19/25	Corney28	52.3846054	4.96055079	aan boom Schellingwouderdijk	Amsterdam	NH	\N	\N
3961	29-06-2021	2021-06-29 00:00:00	41/110	Amauta	29-06-2021	2021-06-29 00:00:00	41/110	MeanYellowBoy	52.5514755	6.71916914	in spleet boom Wielenweg	Radewijk	Ov	\N	\N
3554	24-06-2020	2020-06-24 00:00:00	40/712	MBKNLD	24-06-2020	2020-06-24 00:00:00	40/712	Bensi	51.9717484	5.16711617	aan hekpost in uiterwaard	Tull en het Wiel	Ut	\N	\N
3032	08-03-2019	2019-03-08 00:00:00	40/233	pdv_moto	09-03-2019	2019-03-09 00:00:00	40/235	Coenster	52.3958855	4.63567114	in bloembak Ned. Hout, Kleverlaan	Haarlem	NH	\N	\N
387	25-05-2011	2011-05-25 00:00:00	10/4	dolfijneflipper	25-05-2011	2011-05-25 00:00:00	10/6	Bigtwim	52.3038063	4.90479517	hek bij molen de Zwaan, Ouderkerk a/d Amstel, NH	Ouderkerk a/d Amstel	NH	\N	\N
4377	13-07-2023	2023-07-13 00:00:00	41/386	HighKing	14-07-2023	2023-07-14 00:00:00	41/386	Coenster	52.5578499	4.67285299	tegen boom bij biljarthal Wagnerstraat	Castricum	NH	\N	\N
768	07-04-2012	2012-04-07 00:00:00	15/23	BSI	07-04-2012	2012-04-07 00:00:00	15/25	rvdh86	52.1790733	5.61876106	in boom - Blotekampenweg, Voorthuizen, Ge	Voorthuizen	Ge	\N	\N
2870	19-08-2018	2018-08-19 00:00:00	40/22	Outdoor Man	19-08-2018	2018-08-19 00:00:00	40/22	Roeleey	52.3058167	4.81343603	in bosje bij Nieuwe Meerlaan	Amstelveen	NH	\N	\N
3451	12-04-2020	2020-04-12 00:00:00	40/628	pdv_moto	12-04-2020	2020-04-12 00:00:00	40/628	Coenster	52.0161972	4.30497122	achter putdeksel, Ln van Wateringseveld	Wateringen	ZH	\N	\N
1464	07-01-2014	2014-01-07 00:00:00	24/24	Corney28	07-01-2014	2014-01-07 00:00:00	24/25	Vins111	52.806366	5.69728804	in struiken bij Plantsoenweg	Rutten	Fl	\N	\N
2993	21-01-2019	2019-01-21 00:00:00	40/177	DKP	23-01-2019	2019-01-23 00:00:00	40/178	grootkaalnix	51.3503838	5.13035011	in haag bij Fletcher restaurant	Reusel	NB	\N	\N
316	08-04-2011	2011-04-08 00:00:00	8/83	bakfiets1	08-04-2011	2011-04-08 00:00:00	8/84	Richard117	51.5866356	4.72257614	uitzichttoren Leursebaan, Breda West, NB	Breda	NB	\N	\N
1026	15-12-2012	2012-12-15 00:00:00	18/30	Ronald_010	15-12-2012	2012-12-15 00:00:00	18/30	tdemmer	51.9740295	4.48160982	bij Radiobaken Zestienhoven	Rotterdam	ZH	\N	\N
2918	30-09-2018	2018-09-30 00:00:00	40/75	FastEddy	30-09-2018	2018-09-30 00:00:00	40/76	Amauta	53.0061722	6.96718407	aan stam Eerste Veldweg	Stadskanaal	Gr	\N	\N
2860	15-08-2018	2018-08-15 00:00:00	40/12	frankivo	15-08-2018	2018-08-15 00:00:00	40/12	FastEddy	53.1317787	6.72170782	tegen hek langs fietspad	Kropswolde	Gr	\N	\N
3132	01-06-2019	2019-06-01 00:00:00	40/344	MeanYellowBoy	02-06-2019	2019-06-02 00:00:00	40/344	Okami_Xci	52.4521713	6.19124508	aan paal weg naar Colckhof	Laag Zuthem	Ov	\N	\N
203	19-01-2011	2011-01-19 00:00:00	6/36	bouwvakkertje/sofie	20-01-2011	2011-01-20 00:00:00	6/37	MotorMieke	52.1368752	6.82081079	Munsterdijk, Buursen, Ov	Buursen	Ov	\N	\N
2196	07-08-2016	2016-08-07 00:00:00	31/69	pdv_moto	07-08-2016	2016-08-07 00:00:00	31/69	bikedan	52.0882187	4.29538012	in bosje monument Carnegielaan	Den Haag	ZH	\N	\N
4331	30-04-2023	2023-04-30 00:00:00	41/356	Picobello BV	01-05-2023	2023-05-01 00:00:00	41/356	pdv_moto	52.1955643	4.60623217	achter blokken Korte Dwarsweg	Nieuwe Wetering	ZH	\N	\N
428	12-06-2011	2011-06-12 00:00:00	10/51	BigJim	12-06-2011	2011-06-12 00:00:00	10/53	scheurschuimpje	52.8574829	5.10957289	eind krib - Noorderdijkweg, Wieringerwerf, NH	Wieringerwerf	NH	\N	\N
2941	04-11-2018	2018-11-04 00:00:00	40/100	FastEddy	07-11-2018	2018-11-07 00:00:00	40/102	Amauta	52.9927444	6.98176003	tegen boompje club Latimeria	Stadskanaal	Gr	\N	\N
1017	06-12-2012	2012-12-06 00:00:00	18/23	JurgenT	06-12-2012	2012-12-06 00:00:00	18/23	Bensi	52.1005211	6.3241291	aan landhoofd Knopenlaantje	Vorden	Ge	\N	\N
2702	11-04-2018	2018-04-11 00:00:00	38/23	MeanYellowBoy	11-04-2018	2018-04-11 00:00:00	38/24	aisnoek	52.5790787	6.35317516	aan boom Koloniedijk	Ommen	Ov	\N	\N
3317	10-12-2019	2019-12-10 00:00:00	40/523	Picobello BV	10-12-2019	2019-12-10 00:00:00	40/523	pdv_moto	52.0386314	4.50470686	tegen paal reclamebord Vernispad	Zoetermeer	ZH	\N	\N
3405	08-03-2020	2020-03-08 00:00:00	40/586	SadBunny	08-03-2020	2020-03-08 00:00:00	40/586	pdv_moto	52.3583679	4.94490623	onder Curiebrug Valentijnkade	Amsterdam	NH	\N	\N
2688	02-04-2018	2018-04-02 00:00:00	38/07	Roeleey	03-04-2018	2018-04-03 00:00:00	38/07	Coenster	52.3410263	4.87546015	aan berk, Strawinskylaan 	Amsterdam	NH	\N	\N
4333	05-05-2023	2023-05-05 00:00:00	41/358	Okami_Xci	05-05-2023	2023-05-05 00:00:00	41/358	SwitchUp	51.3964806	5.67121077	aan stuw in Peelrijt	Someren	NB	\N	\N
2106	01-05-2016	2016-05-01 00:00:00	30/77	bikedan	01-05-2016	2016-05-01 00:00:00	30/77	SadBunny	51.4894066	4.29573679	achter E-kast watertoren	Bergen op Zoom	NB	\N	\N
1865	17-03-2015	2015-03-17 00:00:00	28/32	Wimis on	17-03-2015	2015-03-17 00:00:00	28/32	Rainbow600	52.0183182	5.19801998	aan sirenemast - Oostrumsedijk	Houten	Ut	\N	\N
2684	01-04-2018	2018-04-01 00:00:00	38/04	Coenster	01-04-2018	2018-04-01 00:00:00	38/05	Roeleey	52.2575378	4.71714401	ibfietknooppuntbord 2	Rijenhout	NH	\N	\N
3976	11-07-2021	2021-07-11 00:00:00	41/121	BSI	11-07-2021	2021-07-11 00:00:00	41/121	Springbok	51.8547859	5.86223698	tegen trfahuisje Oosterhoutsedijk	Nijmegen	Ge	\N	\N
661	14-12-2011	2011-12-14 00:00:00	13/79	me-daph	15-12-2011	2011-12-15 00:00:00	13/80	Shadowski	52.2384071	6.17858601	P-terrein Berenschot - Bergweidijk, Deventer, Ov	Deventer	Ov	\N	\N
286		0001-01-01 00:00:00 BC		blup blup		0001-01-01 00:00:00 BC			\N	\N				\N	\N
227	08-02-2011	2011-02-08 00:00:00	6/95	Outdoor Man	08-02-2011	2011-02-08 00:00:00	6/96	Scoot_020/Scoot_2	52.3187637	4.8755908	in boom achter bank - Uilenstede, Amstelveen, NH	Amstelveen	NH	\N	\N
1522	19-02-2014	2014-02-19 00:00:00	24/92	Blogem	20-02-2014	2014-02-20 00:00:00	24/93	BSI	52.3997078	4.54215813	achter bankje - Boulevard Barnaart	Zandvoort	NH	\N	\N
1359	18-09-2013	2013-09-18 00:00:00	22/83	Ronald_010	18-09-2013	2013-09-18 00:00:00	22/83	tdemmer	51.9893265	4.365839	aan snuffelpaal - Energieweg	Delft	ZH	\N	\N
3360	21-01-2020	2020-01-21 00:00:00	40/551	HighKing	22-01-2020	2020-01-22 00:00:00	40/552	pdv_moto	52.497509	4.65659523	in heg P-plaats Bastion	Beverwijk	NH	\N	\N
2230	06-09-2016	2016-09-06 00:00:00	32/05	ootje	06-09-2016	2016-09-06 00:00:00	32/06	Bigtwim	52.5461845	4.70644903	aan hek Uitgeesterweg	Uitgeest	NH	\N	\N
3212	16-08-2019	2019-08-16 00:00:00	40/427	jaap43	16-08-2019	2019-08-16 00:00:00	40/427	Hans89	51.9201202	4.74308395	tegen hekpost Wetering-Oost	Lekkerkerk	ZH	\N	\N
2629	31-01-2018	2018-01-31 00:00:00	37/22	-Floris-	02-02-2018	2018-02-02 00:00:00	37/25	Bosso	51.4474983	3.61555409	onder fietbrug - Westhoekweg	Ritthem	Ze	\N	\N
947	10-10-2012	2012-10-10 00:00:00	17/29	motorpsycho	11-10-2012	2012-10-11 00:00:00	17/30	Hans89	51.4267464	4.62406397	achter bord - Wernhoutseweg	Zundert	NB	\N	\N
2555	23-09-2017	2017-09-23 00:00:00	36/09	Okami_Xci	24-09-2017	2017-09-24 00:00:00	36/09	Ronald_010	50.7550697	6.02045393	in perk - Drielandenpunt	Vaals	Li	\N	\N
1793	11-11-2014	2014-11-11 00:00:00	27/69	Scoot_020/Scoot_2	11-11-2014	2014-11-11 00:00:00	27/69	Ronald_010	52.3232384	4.82215023	aan hek Bosbaanweg	Amstelveen	NH	\N	\N
3203	10-08-2019	2019-08-10 00:00:00	40/418	Meifesto	10-08-2019	2019-08-10 00:00:00	40/418	Hans89	51.8527412	4.46909809	in boom Koedoodpad	Rhoon	ZH	\N	\N
607	30-10-2011	2011-10-30 00:00:00	13/13	Shadowski	30-10-2011	2011-10-30 00:00:00	13/15	king-roy	51.3434753	6.19534016	in rotstuin bij voordeur - Expeditieweg 2, Venlo, Li	Venlo	Li	\N	\N
3931	13-06-2021	2021-06-13 00:00:00	41/091	Brnk	13-06-2021	2021-06-13 00:00:00	41/091	Bensi	52.4129219	6.67695284	tegen boom bij bank Weitemansweg	Geesteren	Ov	\N	\N
951	15-10-2012	2012-10-15 00:00:00	17/35	Hasseman	16-10-2012	2012-10-16 00:00:00	17/37	bikedan	52.2402573	6.82283306	aan infobord - Boeierdpad	Enschede	Ov	\N	\N
2732	01-05-2018	2018-05-01 00:00:00	38/63	Outdoor Man	02-05-2018	2018-05-02 00:00:00	38/63	HighKing	52.3196564	4.872612	achter muurtje Uilenstede	Amstelveen	NH	\N	\N
2309	12-12-2016	2016-12-12 00:00:00	33/17	Ronald_010	13-12-2016	2016-12-13 00:00:00	33/18	Wimis on	51.9687424	4.5923028	aan bord geluidswal Nesselande	Rotterdam	ZH	\N	\N
31	01-09-2010	2010-09-01 00:00:00	2/9	Jeltel	01-09-2010	2010-09-01 00:00:00	2/18	NR34	51.8478088	5.87045383	ruine Valkhof - Kefkensbos 59, Nijmegen, Ge	Nijmegen	Ge	\N	\N
2042	16-12-2015	2015-12-16 00:00:00	30/05	pdv_moto	20-12-2015	2015-12-20 00:00:00	30/06	Dirk130	52.0972519	4.30655479	in omranding klok - Plesmanweg	Den Haag	ZH	\N	\N
3862	03-04-2021	2021-04-03 00:00:00	41/030	Amauta	03-04-2021	2021-04-03 00:00:00	41/030	Ronny Rabbelaar	53.2303619	7.20631218	in knotwilg Drieborg	Nieuw Statenzijl	Gr	\N	\N
2070	12-02-2016	2016-02-12 00:00:00	30/29	Janhertog	19-02-2016	2016-02-19 00:00:00	30/31	Amauta	52.8036385	6.08492804	achter E-kast - Ruxveenseweg	Tuk	Ov	\N	\N
3753	16-11-2020	2020-11-16 00:00:00	40/885	Carburateur	19-11-2020	2020-11-19 00:00:00	40/886	Okami_Xci	51.4383087	5.35694885	in struikje Scherpenerring	Eindhoven	NB	\N	\N
3216	19-08-2019	2019-08-19 00:00:00	40/431	frankivo	19-08-2019	2019-08-19 00:00:00	40/431	FastEddy	52.9347954	6.92746401	 balk gebroken lijn Drentse Mondenweg	1e Exloërmond	Dr	\N	\N
4098	15-01-2022	2022-01-15 00:00:00	41/200	Outdoor Man	15-01-2022	2022-01-15 00:00:00	41/201	Roeleey	52.3155708	5.46944618	tegen boom p-terrein Flehiterweg	Zeewolde	Fl	\N	\N
3422	21-03-2020	2020-03-21 00:00:00	40/601	Coenster	21-03-2020	2020-03-21 00:00:00	40/601	vuurbloed	52.1592445	4.55724812	tegen hek tunnelingang	Leiderdorp	ZH	\N	\N
3192	05-08-2019	2019-08-05 00:00:00	40/407	Roeleey	05-08-2019	2019-08-05 00:00:00	40/407	Coenster	52.2854004	5.00400019	hangend aan boot Gein-Noord	Abcoude	Ut	\N	\N
2945	11-11-2018	2018-11-11 00:00:00	40/104	pdv_moto	14-11-2018	2018-11-14 00:00:00	40/107	HighKing	52.0835838	4.28575182	achter paaltje Sweelinckplein	Den Haag	ZH	\N	\N
2826	20-07-2018	2018-07-20 00:00:00	39/72	Outdoor Man	20-07-2018	2018-07-20 00:00:00	39/73	HighKing	52.3286934	4.80228186	bij boom aan Koekoekslaan	Badhoevedorp	NH	\N	\N
2609	30-12-2017	2017-12-30 00:00:00	36/92	BSI	30-12-2017	2017-12-30 00:00:00	36/92	BornToReign	52.1155128	5.53783178	tegen stenen - Scherpenzeelseweg	Barneveld	Ge	\N	\N
4058	01-11-2021	2021-11-01 00:00:00	41/173	Deeffox	01-11-2021	2021-11-01 00:00:00	41/173	ronk	51.7943649	4.90140104	tegen paal oorlogsmonument 	Werkendam	NB	\N	\N
547	18-09-2011	2011-09-18 00:00:00	12/18	V-Strommert	21-09-2011	2011-09-21 00:00:00	12/24	BigJim	52.9703178	5.11020803	aan hek P-terrein afsluitdijk bij, Den Oever, NH	Den Oever	NH	\N	\N
2709	15-04-2018	2018-04-15 00:00:00	38/32	HermanK	16-04-2018	2018-04-16 00:00:00	38/34	MP_NL	52.2496986	6.15866709	achter muurtje Welle	Deventer	Ov	\N	\N
4159	08-04-2022	2022-04-08 00:00:00	41/243	Hjerteknuser	09-04-2022	2022-04-09 00:00:00	41/244	Outdoor Man	52.5101433	4.67169189	achter muurtje bij schaats	Heemskerk	NH	\N	\N
3520	30-05-2020	2020-05-30 00:00:00	40/683	Ronald_010	30-05-2020	2020-05-30 00:00:00	40/683	Amauta	52.9493294	6.44573402	achter paaltje koepelkerk Veenhofseweg	Smilde	Dr	\N	\N
167		0001-01-01 00:00:00 BC		BigJim		0001-01-01 00:00:00 BC			\N	\N				\N	\N
1170	14-04-2013	2013-04-14 00:00:00	20/31	Wimis on	15-04-2013	2013-04-15 00:00:00	20/33	SadBunny	51.9677048	5.2070961	achter E-kast bij tunneltje - Lekdijk	Schalkwijk	Ut	\N	\N
1986	11-08-2015	2015-08-11 00:00:00	29/38	Rik60NL	11-08-2015	2015-08-11 00:00:00	29/39	Coenster	52.1997108	4.99869108	aan bolder A'dam-Rijnkanaal	Nieuwersluis	Ut	\N	\N
1425	19-11-2013	2013-11-19 00:00:00	23/82	SparkViv	19-11-2013	2013-11-19 00:00:00	23/82	tdemmer	51.9951286	4.48929977	aan paal Berkelseweg	Berkel en Rodenrijs	ZH	\N	\N
3682	30-09-2020	2020-09-30 00:00:00	40/834	Hans89	30-09-2020	2020-09-30 00:00:00	40/834	ey-dzeej	51.9407082	4.59445906	achter boon Heemtuin 's-Gravenweg	Capelle aan den Ijssel	ZH	\N	\N
4273	21-12-2022	2022-12-21 00:00:00	41/319	ootje	21-12-2022	2022-12-21 00:00:00	41/319	Outdoor Man	52.0987778	5.145576	tegen boom park Voorvelderpolder	Utrecht	Ut	\N	\N
2027	10-10-2015	2015-10-10 00:00:00	29/79	Ronald_010	10-10-2015	2015-10-10 00:00:00	29/80	Bensi	52.3221817	6.50120497	op rotonde N 347	Rijssen	Ov	\N	\N
4227	29-07-2022	2022-07-29 00:00:00	41/284	Ronny Rabbelaar	03-08-2022	2022-08-03 00:00:00	41/285	scheurschuimpje	52.8850822	5.75462484	achter bord op P-terrein	Follega	Fr	\N	\N
1997	21-08-2015	2015-08-21 00:00:00	29/50	Amauta	22-08-2015	2015-08-22 00:00:00	29/50	leeqnl	53.1692543	7.19653416	aan muur doorgang - Hamdijk	Nieuweschans	Gr	\N	\N
1649	26-05-2014	2014-05-26 00:00:00	26/20	Rainbow600	26-05-2014	2014-05-26 00:00:00	26/21	Wimis on	52.0018654	5.07776499	aan paal bij P&R - Lekboulevard	Nieuwegein	Ut	\N	\N
2063	04-02-2016	2016-02-04 00:00:00	30/24	Dirk130	06-02-2016	2016-02-06 00:00:00	30/24	Fuck Het Milieu	52.089962	4.64876699	aan hek sporovergang Paddegat	Boskoop	ZH	\N	\N
3072	08-04-2019	2019-04-08 00:00:00	40/267	Marsian	12-04-2019	2019-04-12 00:00:00	40/269	BSI	52.4383888	5.87265396	tegen bruggetje Broekdijk	t Harde	Ge	\N	\N
1680	13-07-2014	2014-07-13 00:00:00	26/59	Scoot_020/Scoot_2	13-07-2014	2014-07-13 00:00:00	26/60	SadBunny	52.3069153	4.76341009	trap P-garage - Havenmeesterweg	Schiphol	NH	\N	\N
3396	01-03-2020	2020-03-01 00:00:00	40/579	Picobello BV	01-03-2020	2020-03-01 00:00:00	40/579	pdv_moto	51.9471092	4.38849688	in bigbag spoorovergang Kandelaarweg	Kethel	ZH	\N	\N
371	15-05-2011	2011-05-15 00:00:00	9/74	Quickly	15-05-2011	2011-05-15 00:00:00	9/75	ndeeka	51.6494865	4.66413593	achter kastje - Hamseweg, Langeweg, NB	Langeweg	NB	\N	\N
125	04-11-2010	2010-11-04 00:00:00	4/49	tdemmer	04-11-2010	2010-11-04 00:00:00	4/51	Geert-26	51.9765205	4.5485301	uitzichtpunt Rottebandreef, Rotterdam, ZH	Rotterdam	ZH	\N	\N
133	09-11-2010	2010-11-09 00:00:00	4/67	tdemmer	10-11-2010	2010-11-10 00:00:00	4/69	dolfijneflipper	51.6842651	3.84444189	Uitzichttoren Bootsweg, Kerkwerve, Ze	Kerkwerve	Ze	\N	\N
4385	05-08-2023	2023-08-05 00:00:00	41/392	FastEddy	05-08-2023	2023-08-05 00:00:00	41/392	Ronny Rabbelaar	53.2649498	6.85138178	onder bek Maanvis Kultuureiland	Steendam	Gr	\N	\N
404	05-06-2011	2011-06-05 00:00:00	10/32	gasbaas	05-06-2011	2011-06-05 00:00:00	10/32	Bigtwim	51.73423	5.27473593	parkeerterrein Treurenburg, 's-Hertogenbosch, NB	s-Hertogenbosch	NB	\N	\N
3457	15-04-2020	2020-04-15 00:00:00	40/633	BSI	16-04-2020	2020-04-16 00:00:00	40/634	Marsian	52.2504349	5.60678387	aan hek tuincentrum Welkoop	Putten	Ge	\N	\N
1670	21-06-2014	2014-06-21 00:00:00	26/46	Capo-04/06	02-07-2014	2014-07-02 00:00:00	26/49	BSI	50.9222527	5.73860979	aan leuning/hek Geulderlei	Geulle	Li	\N	\N
3092	26-04-2019	2019-04-26 00:00:00	40/290	Artemecion	26-04-2019	2019-04-26 00:00:00	40/290	ootje	52.537796	4.71903276	tegen ceder Westerwerf	Uitgeest	NH	\N	\N
962	24-10-2012	2012-10-24 00:00:00	17/47	tdemmer	25-10-2012	2012-10-25 00:00:00	17/49	jaap43	51.7772293	4.74308014	in knotwilg - Oostdijk - Biesbosch	Dordrecht	ZH	\N	\N
1689	19-07-2014	2014-07-19 00:00:00	26/67	BSI	20-07-2014	2014-07-20 00:00:00	26/68	Chakotay	52.1094131	5.57676792	aan lantaarnpaal - Brinkhofweg	Lunteren	Ge	\N	\N
1000	20-11-2012	2012-11-20 00:00:00	18/03	Bigtwim	21-11-2012	2012-11-21 00:00:00	18/05	Smuiger	52.5175133	4.66535282	achter bank chateau Marquette	Heemstede	NH	\N	\N
1416	13-11-2013	2013-11-13 00:00:00	23/72	vuurbloed	14-11-2013	2013-11-14 00:00:00	23/73	BSI	52.3370438	4.74052191	aan hek van landingslicht - Hoofdweg	Lijnden	NH	\N	\N
2000	24-08-2015	2015-08-24 00:00:00	29/52	leeqnl	25-08-2015	2015-08-25 00:00:00	29/53	Amauta	53.2410431	6.60198307	bij klimtoren Bjoeks - Bieskemaar	Groningen	Gr	\N	\N
4185	09-05-2022	2022-05-09 00:00:00	41/258	Outdoor Man	09-05-2022	2022-05-09 00:00:00	41/259	BSI	52.1702194	5.37184095	in struik oprit ziekenhuis, Maatweg	Amersfoort	Ut	\N	\N
2657	13-03-2018	2018-03-13 00:00:00	37/74	FastEddy	13-03-2018	2018-03-13 00:00:00	37/74	frankivo	53.1365166	6.85387993	ib bloembak Luppenhof	Muntendam	Gr	\N	\N
1029	17-12-2012	2012-12-17 00:00:00	18/32	tdemmer	19-12-2012	2012-12-19 00:00:00	18/33	Hans89	51.9328117	4.07169724	onder steen Oostvoornsemeer	Oostvoorne	ZH	\N	\N
2273	12-10-2016	2016-10-12 00:00:00	32/61	BSI	13-10-2016	2016-10-13 00:00:00	32/62	BornToReign	52.157341	5.62408209	aan stuw - Hanzeweg	Barneveld	Ge	\N	\N
1922	29-05-2015	2015-05-29 00:00:00	28/86	Amauta	01-06-2015	2015-06-01 00:00:00	28/87	frankivo	53.1745262	6.9937501	tegen fietstunnel A7/Boslaan	Midwolde	Gr	\N	\N
1511	12-02-2014	2014-02-12 00:00:00	24/78	dolfijneflipper	13-02-2014	2014-02-13 00:00:00	24/80	rutgertjuh	51.951664	5.29413891	aan muur Margrietlaan	Beusichem	Ge	\N	\N
1521	19-02-2014	2014-02-19 00:00:00	24/90	bobcat	19-02-2014	2014-02-19 00:00:00	24/91	Blogem	52.4851875	4.65493584	aan boom bij Romekerkweg	Beverwijk	NH	\N	\N
4383	03-08-2023	2023-08-03 00:00:00	41/390	Amauta	03-08-2023	2023-08-03 00:00:00	41/391	Pydejong	53.1408539	6.389184	tegen E-kastjes Scheperij	Nietap	Dr	\N	\N
2585	08-11-2017	2017-11-08 00:00:00	36/55	SadBunny	09-11-2017	2017-11-09 00:00:00	36/55	Bigtwim	52.3613052	4.873528	bij muur Vondelkerk - Vondellaan	Amsterdam	NH	\N	\N
2199	10-08-2016	2016-08-10 00:00:00	31/72	MotorMieke	10-08-2016	2016-08-10 00:00:00	31/73	frankivo	52.2943115	6.52909994	onder kiepwagen - Rijsserberg	Rijssen	Ov	\N	\N
2029	11-10-2015	2015-10-11 00:00:00	29/81	BSI	19-10-2015	2015-10-19 00:00:00	29/83	Bensi	52.1278801	5.60326004	aan watertappunt NS-station	Barneveld	Ge	\N	\N
1278	11-07-2013	2013-07-11 00:00:00	21/80	Guvner	11-07-2013	2013-07-11 00:00:00	21/81	tdemmer	51.9280014	4.51933289	aan boompje Plaszoom	Rotterdam	ZH	\N	\N
2698	09-04-2018	2018-04-09 00:00:00	38/18	MeanYellowBoy	09-04-2018	2018-04-09 00:00:00	38/18	Janhertog	52.5169563	6.05752802	achter E-kasr Branderweg	Zwolle	Ov	\N	\N
1739	09-09-2014	2014-09-09 00:00:00	27/21	crazy987	11-09-2014	2014-09-11 00:00:00	27/22	Ronald_010	51.6286926	4.76817894	aan paal bij brug - Hartelweg	Breda	NB	\N	\N
3036	10-03-2019	2019-03-10 00:00:00	40/238	pdv_moto	12-03-2019	2019-03-12 00:00:00	40/239	Coenster	52.0998383	4.28922796	tegen boom bij slagboom Duinweg	Den Haag	ZH	\N	\N
3613	06-08-2020	2020-08-06 00:00:00	40/769	Andijviestamppot	07-08-2020	2020-08-07 00:00:00	40/769	BSI	52.1314087	5.88400221	bij E-huisje Brouwersweg	Hoenderloo	Ge	\N	\N
337	20-04-2011	2011-04-20 00:00:00	9/15	BSI	20-04-2011	2011-04-20 00:00:00	9/16	dolfijneflipper	52.3352699	4.84836102	boompje jollenpad - Nieuwemeer, Amsterdam-Z, NH	Amsterdam	NH	\N	\N
2232	09-09-2016	2016-09-09 00:00:00	32/08	Djoost	10-09-2016	2016-09-10 00:00:00	32/09	Amauta	52.6921654	5.02764511	aan boom Nieuweweg	Wognum	NH	\N	\N
370	13-05-2011	2011-05-13 00:00:00	9/71	Wimis on	14-05-2011	2011-05-14 00:00:00	9/73	Quickly	52.1139221	5.297019	hek Richelleweg - Kamp Zeist, Soesterberg, Ut	Soesterberg	Ut	\N	\N
649	02-12-2011	2011-12-02 00:00:00	13/64	rvdh86	03-12-2011	2011-12-03 00:00:00	13/65	BSI	52.1895638	5.79321194	links van ingang park Berkenhorst, Kootwijk, Ge	Kootwijk	Ge	\N	\N
372	15-05-2011	2011-05-15 00:00:00	9/75	ndeeka	16-05-2011	2011-05-16 00:00:00	9/76	wesleyc	51.9052734	4.466506	naast trap Euromast - Parkhaven, Rotterdam, ZH	Rotterdam	ZH	\N	\N
851	06-07-2012	2012-07-06 00:00:00	16/25	Maegrim	06-07-2012	2012-07-06 00:00:00	16/25	MarkieNL	52.0134163	5.46852303	Bergweg	Amerongen	Ut	\N	\N
1654	29-05-2014	2014-05-29 00:00:00	26/25	XJ Elff	30-05-2014	2014-05-30 00:00:00	26/26	Dirk130	52.1208115	4.29553509	onder stenen eind Zwartepad	Scheveningen	ZH	\N	\N
535	13-09-2011	2011-09-13 00:00:00	12/06	tdemmer	14-09-2011	2011-09-14 00:00:00	12/06	jaap43	52.0018425	4.55346012	achter bord Zevenhuizer Verlaat, Zevenhuizen, ZH	Zevenhuizen	ZH	\N	\N
2805	02-07-2018	2018-07-02 00:00:00	39/45	Amauta	03-07-2018	2018-07-03 00:00:00	39/46	Raviel	51.9775047	6.28188515	in boom Kelderlaan	Doetinchem	Ge	\N	\N
76	30-09-2010	2010-09-30 00:00:00	3/34	Nohome	01-10-2010	2010-10-01 00:00:00	3/34	I-accelerate	52.9554863	4.72645998	vuurtoren Lange Jaap - Zeeweg, Huisduinen, NH	Huisduinen	NH	\N	\N
3084	21-04-2019	2019-04-21 00:00:00	40/281	pdv_moto	22-04-2019	2019-04-22 00:00:00	40/282	Sjefman	51.518898	3.45643902	in heg tegen boom, Grindweg	Westkapelle	Ze	\N	\N
2602	20-12-2017	2017-12-20 00:00:00	36/82	-Floris-	22-12-2017	2017-12-22 00:00:00	36/83	pdv_moto	51.5515404	3.51349711	achter monument crash	Aagtekerke	Ze	\N	\N
2147	07-06-2016	2016-06-07 00:00:00	31/20	nappertje	08-06-2016	2016-06-08 00:00:00	31/21	Bensi	52.0702477	5.64430523	aan biels - Peteweg	Ede	Ge	\N	\N
2011	13-09-2015	2015-09-13 00:00:00	29/64	BSI	13-09-2015	2015-09-13 00:00:00	29/64	Bensi	51.9836998	5.82698822	achter stammetje bij monument	Oosterbeek	Ge	\N	\N
3024	25-02-2019	2019-02-25 00:00:00	40/220	Rik60NL	26-02-2019	2019-02-26 00:00:00	40/221	Roeleey	52.2391052	4.85227585	aan steiger Amstelkade	Amstelhoek	NH	\N	\N
1373	29-09-2013	2013-09-29 00:00:00	23/12	tdemmer	29-09-2013	2013-09-29 00:00:00	23/12	Ronald_010	52.069191	4.74452686	aan paal bij Goedhart motoren	Bodegraven	ZH	\N	\N
2171	12-07-2016	2016-07-12 00:00:00	31/45	frankivo	12-07-2016	2016-07-12 00:00:00	31/45	Amauta	53.0069046	6.94678879	onder stammetjes de Vloeivelden	Stadskanaal	Gr	\N	\N
4365	25-06-2023	2023-06-25 00:00:00	41/378	Motor-inator	26-06-2023	2023-06-26 00:00:00	41/379	BSI	52.9148865	6.35318184	tegen boom bij grenspaal 79 (Fr/Dr)	Diever	Dr	\N	\N
146	21-11-2010	2010-11-21 00:00:00	5/3	Foncelot	21-11-2010	2010-11-21 00:00:00	5/4	Fibershark	52.4061775	6.88410091	ANWB uitzichtpunt - Almelosestraat, Vasse, Ov	Vasse	Ov	\N	\N
4327	23-04-2023	2023-04-23 00:00:00	41/353	pdv_moto	24-04-2023	2023-04-24 00:00:00	41/354	Hans89	51.3867912	3.819664	tegen slagboom op dijk	Ellewoutsdijk	Ze	\N	\N
2559	01-10-2017	2017-10-01 00:00:00	36/17	MP_NL	08-10-2017	2017-10-08 00:00:00	36/21	HermanK	52.523407	6.32974911	in struik P-terrein - Oude Oever	Dalfsen	Ov	\N	\N
1804	08-12-2014	2014-12-08 00:00:00	27/80	tdemmer	08-12-2014	2014-12-08 00:00:00	27/81	-juliet-	51.9661674	4.51719618	aan voet berk - Rottebandreef	Rotterdam	ZH	\N	\N
2358	18-03-2017	2017-03-18 00:00:00	33/80	Ronald_010	19-03-2017	2017-03-19 00:00:00	33/80	BSI	52.1125488	4.65446281	in knotwilg P-terrein Archeon	Alphen a/d Rijn	ZH	\N	\N
1205	09-05-2013	2013-05-09 00:00:00	20/77	Hans89	09-05-2013	2013-05-09 00:00:00	20/77	bikedan	51.5505142	3.66238189	in brandnetels - wal bij kanonnen	Veere	Ze	\N	\N
155	29-11-2010	2010-11-29 00:00:00	5/26	ootje	01-12-2010	2010-12-01 00:00:00	5/28	Smuiger	52.5963211	4.64374304	St Adelbertuskapelweg, Egmond-Binnen, NH	Egmond-Binnen	NH	\N	\N
999	18-11-2012	2012-11-18 00:00:00	17/98	BigJim	20-11-2012	2012-11-20 00:00:00	18/03	Bigtwim	52.6823997	4.76452112	aan pallisade Kleimeer	Broek op Langedijk	NH	\N	\N
2423	15-05-2017	2017-05-15 00:00:00	34/46	Amauta	16-05-2017	2017-05-16 00:00:00	343/46	Totl	53.4160004	6.48605394	tegen boom monument	Westernieland	Gr	\N	\N
4323	16-04-2023	2023-04-16 00:00:00	41/350	Motor-inator	17-04-2023	2023-04-17 00:00:00	41/350	BSI	52.1600761	5.51628685	onder landhoofd stuw Esvelderbeek	Terschuur	Ge	\N	\N
3511	25-05-2020	2020-05-25 00:00:00	40/675	Hans89	25-05-2020	2020-05-25 00:00:00	40/676	jaap43	51.9571571	4.63413286	in fundament Essemolen	Nieuwerkerk a/d Ijssel	ZH	\N	\N
1936	15-06-2015	2015-06-15 00:00:00	28/99	Fenrir-sol	16-06-2015	2015-06-16 00:00:00	28/100	nixor	51.5229034	4.46086121	bij zendmast Melis Stokelaan	Roosendaal	NB	\N	\N
1301	11-08-2013	2013-08-11 00:00:00	22/15	rvdh86	12-08-2013	2013-08-12 00:00:00	22/16	Hasseman	52.2739944	6.11370611	aan hek bij gemaal - Bandijk	Terwolde	Ge	\N	\N
3647	30-08-2020	2020-08-30 00:00:00	40/806	FastEddy	30-08-2020	2020-08-30 00:00:00	40/806	Amauta	52.9748192	6.98083878	aan boom Vleddermond	Stadskanaal	Gr	\N	\N
3560	29-06-2020	2020-06-29 00:00:00	40/718	pdv_moto	29-06-2020	2020-06-29 00:00:00	40/718	Nelfrikandel	52.019146	4.31814098	aan boom Noordhoornseweg	Den Hoorn	ZH	\N	\N
2679	28-03-2018	2018-03-28 00:00:00	37/97	HighKing	28-03-2018	2018-03-28 00:00:00	37/98	sanger	52.5141335	4.78091002	in bloembak tenniscentrum	Wormerveer	NH	\N	\N
2899	13-09-2018	2018-09-13 00:00:00	40/53	Coenster	14-09-2018	2018-09-14 00:00:00	40/53	Outdoor Man	52.1276741	5.04575586	heg achter bord, Computerweg	Utrecht	Ut	\N	\N
3986	21-07-2021	2021-07-21 00:00:00	41/129	BigJim	21-07-2021	2021-07-21 00:00:00	41/129	Artemecion	52.6104546	4.7234149	tegen hek langoed Nijenburg	Heiloo	NH	\N	\N
110	26-10-2010	2010-10-26 00:00:00	4/13	vuurbloed	26-10-2010	2010-10-26 00:00:00	4/14	Smuiger	52.3376923	4.63850212	gemaal Cruquius - Ringdijk, Haarlemmermeer, NH	Haarlemmermeer	NH	\N	\N
1597	18-04-2014	2014-04-18 00:00:00	25/71	Bigtwim	18-04-2014	2014-04-18 00:00:00	25/72	Rainbow600	52.4513016	4.6785388	in buis - Amsterdamseweg	Velsen	NH	\N	\N
2820	15-07-2018	2018-07-15 00:00:00	39/64	bikedan	16-07-2018	2018-07-16 00:00:00	39/66	DKP	51.3858452	4.32828379	aan e-kast Koeleweg	Ossendrecht	NB	\N	\N
2498	27-07-2017	2017-07-27 00:00:00	35/30	Rik60NL	28-07-2017	2017-07-28 00:00:00	35/31	frankivo	52.74403	5.06005478	aan paal P-terrein kerk - Dorpsweg	Twisk	NH	\N	\N
2314	16-12-2016	2016-12-16 00:00:00	33/20	Motormuisje_alice	17-12-2016	2016-12-17 00:00:00	33/20	pdv_moto	52.0053444	4.72184801	aan rail rotonde Stolwijkersluis	Gouda	ZH	\N	\N
2856	12-08-2018	2018-08-12 00:00:00	40/08	pdv_moto	12-08-2018	2018-08-12 00:00:00	40/09	jaap43	52.1045494	4.3185091	achter muurtje Waalsdorperweg	Den Haag	ZH	\N	\N
2050	04-01-2016	2016-01-04 00:00:00	30/13	BSI	08-01-2016	2016-01-08 00:00:00	30/15	pdv_moto	52.1616402	5.59833002	onder fietsenberging NS	Barneveld	Ge	\N	\N
108	24-10-2010	2010-10-24 00:00:00	4/3	me-daph	24-10-2010	2010-10-24 00:00:00	4/5	BigJim	52.1623497	6.35758591	theekoepel Almen, Lochem, Ge	Lochem	Ge	\N	\N
4028	12-09-2021	2021-09-12 00:00:00	41/153	BornToReign	13-09-2021	2021-09-13 00:00:00	41/154	Outdoor Man	51.9409332	5.6144948	bij kersenboom veer Wageningen	Opheusden	Ge	\N	\N
2748	09-05-2018	2018-05-09 00:00:00	38/78	Outdoor Man	09-05-2018	2018-05-09 00:00:00	38/78	Roeleey	52.3135071	4.84724998	achter banpaal Amsteldijk-N	Amstelveen	NH	\N	\N
2343	26-02-2017	2017-02-26 00:00:00	33/63	Amauta	27-02-2017	2017-02-27 00:00:00	33/65	HermanK	52.6346588	7.04428291	onder brug Dieakendiek	Nieuw Schoonebeek	Dr	\N	\N
642	27-11-2011	2011-11-27 00:00:00	13/57	Dirk130	28-11-2011	2011-11-28 00:00:00	13/58	V-Strommert	52.0708542	4.22308588	tegen muur van rond uitzichtpunt, Kijkduin,  ZH	Kijkduin	ZH	\N	\N
2393	20-04-2017	2017-04-20 00:00:00	34/19	BSI	21-04-2017	2017-04-21 00:00:00	34/19	Rik60NL	52.3768501	4.62150621	aan boom St. Bavo-kathedraal	Haarlem	NH	\N	\N
363	07-05-2011	2011-05-07 00:00:00	9/59	Ruppert	08-05-2011	2011-05-08 00:00:00	9/59	BSI	52.0446014	5.55874395	hek achter gebouwtje Arsenaal, Veenendaal, Ut	Veenendaal	Ut	\N	\N
139	15-11-2010	2010-11-15 00:00:00	4/88	jaap43	15-11-2010	2010-11-15 00:00:00	4/88	gjvh	51.9174767	4.78742695	Abri pontje Bergstoep, Groot Ammers, ZH	Groot Ammers	ZH	\N	\N
3855	31-03-2021	2021-03-31 00:00:00	41/025	Outdoor Man	31-03-2021	2021-03-31 00:00:00	41/026	k0en	52.2760391	4.99464703	in struik bij Oostzijdse molen	Abcoude	Ut	\N	\N
1590	12-04-2014	2014-04-12 00:00:00	25/64	SadBunny	13-04-2014	2014-04-13 00:00:00	25/65	ootje	52.2963142	4.79454422	aan bankje langs Ringvaart	Aalsmeer	NH	\N	\N
2842	31-07-2018	2018-07-31 00:00:00	39/92	Amauta	02-08-2018	2018-08-02 00:00:00	39/93	Ronny Rabbelaar	53.4248924	6.87174606	aan bord Robbenplaatweg, 380kV-plant	Eemshaven	Gr	\N	\N
2165	02-07-2016	2016-07-02 00:00:00	31/39	Ronald_010	02-07-2016	2016-07-02 00:00:00	31/39	Motormuisje_alice	51.8506889	4.51101208	aan paal infobord OutdoorXL	Barendrecht	ZH	\N	\N
2579	03-11-2017	2017-11-03 00:00:00	36/47	Amauta	03-11-2017	2017-11-03 00:00:00	36/48	pdv_moto	52.1047897	6.66254807	in takkenril - Mallumsemolen	Eibergen	Ge	\N	\N
3126	26-05-2019	2019-05-26 00:00:00	40/339	Mitssz	27-05-2019	2019-05-27 00:00:00	40/339	ootje	52.1626205	4.35121012	achter E-kast p-plaats wassenaarseslag	Wassenaar	ZH	\N	\N
909	03-09-2012	2012-09-03 00:00:00	16/88	ndeeka	04-09-2012	2012-09-04 00:00:00	16/89	tdemmer	51.8099136	4.60482883	bij van Leeuwen - Lindtsedijk	Zwijndrecht	ZH	\N	\N
4264	15-11-2022	2022-11-15 00:00:00	41/312	ootje	16-11-2022	2022-11-16 00:00:00	41/312	Okami_Xci	52.5069618	4.74873781	tegen hek Noorderdam	Krommenie	NH	\N	\N
3908	20-05-2021	2021-05-20 00:00:00	41/073	FastEddy	21-05-2021	2021-05-21 00:00:00	41/074	BSI	52.9570656	7.0090251	onder showbank Verbindingsweg 	Musselkanaal	Gr	\N	\N
1208	11-05-2013	2013-05-11 00:00:00	20/82	SadBunny	14-05-2013	2013-05-14 00:00:00	20/87	Corney28	53.4114418	6.20009804	in stootrubber op havenhoofd	Lauwersoog	Gr	\N	\N
1694	22-07-2014	2014-07-22 00:00:00	26/72	Chakotay	23-07-2014	2014-07-23 00:00:00	26/73	Bas600	52.2981339	4.64314079	aan boom P-terrein Ijweg	Hoofddorp	NH	\N	\N
2159	23-06-2016	2016-06-23 00:00:00	31/32	Sjantaalfoutje	24-06-2016	2016-06-24 00:00:00	31/32	BSI	52.2982101	5.99962521	aan paal bij sluis Apeldoornskanaal	Vaassen	Ge	\N	\N
531	10-09-2011	2011-09-10 00:00:00	11/98	Buuv	11-09-2011	2011-09-11 00:00:00	11/98	Hasseman	52.5881157	6.18268585	aan hek Koezenkooiweg, Rouveen, Ov	Rouveen	Ov	\N	\N
2228	05-09-2016	2016-09-05 00:00:00	32/04	Djoost	06-09-2016	2016-09-06 00:00:00	32/05	Bigtwim	52.3947182	4.76991081	aan voetbrug - de Heining	Amsterdam	NH	\N	\N
1293	28-07-2013	2013-07-28 00:00:00	22/05	bikedan	31-07-2013	2013-07-31 00:00:00	22/07	Hans89	50.8229218	6.0178299	achter betonblok P-plaats	Bocholtz	Li	\N	\N
300		0001-01-01 00:00:00 BC		Eady		0001-01-01 00:00:00 BC			\N	\N				\N	\N
2059	28-01-2016	2016-01-28 00:00:00	30/21	Hans89	29-01-2016	2016-01-29 00:00:00	30/21	tdemmer	51.9193459	4.58876324	aan hek streekmuseum	Krimpen aan den IJssel	ZH	\N	\N
2628	27-01-2018	2018-01-27 00:00:00	37/20	pdv_moto	30-01-2018	2018-01-30 00:00:00	37/22	-Floris-	51.5269737	3.43759799	in bloembak ijssalon	Westkapelle	Ze	\N	\N
1210	15-05-2013	2013-05-15 00:00:00	20/89	Phaedrus	15-05-2013	2013-05-15 00:00:00	20/89	Ronald_010	51.8502274	4.49231291	brug Portlandsebaan/Koedood	Barendrecht	ZH	\N	\N
85	06-10-2010	2010-10-06 00:00:00	3/50	Cynthia1987	07-10-2010	2010-10-07 00:00:00	3/52	Franko P	51.66996	5.37538004	sporthal Tennispad, Den Dungen, NB	Den Dungen	NB	\N	\N
3972	08-07-2021	2021-07-08 00:00:00	41/118	pdv_moto	08-07-2021	2021-07-08 00:00:00	41/119	k0en	52.0333862	5.34523201	tegen boom bij Maartenskerk, Dorpsplein	Utrecht	Ut	\N	\N
3829	09-03-2021	2021-03-09 00:00:00	41/005	DKP	09-03-2021	2021-03-09 00:00:00	41/006	HighKing	52.3436699	4.7072401	tegen boom Bulderbos, Ijweg	Vijfhuizen	NH	\N	\N
3053	25-03-2019	2019-03-25 00:00:00	40/252	Coenster	25-03-2019	2019-03-25 00:00:00	40/253	Schwenneh	52.2828255	4.56300879	in boomstronk, Hancithenlaan	Hillegom	ZH	\N	\N
162	08-12-2010	2010-12-08 00:00:00	5/35	Smuiger	10-12-2010	2010-12-10 00:00:00	5/36	V-Strommert	52.3838501	4.97596693	paal Liergouw/Zwartegouw, Amsterdam-N, NH	Amsterdam	NH	\N	\N
3080	19-04-2019	2019-04-19 00:00:00	40/278	Coenster	20-04-2019	2019-04-20 00:00:00	40/279	jaap43	52.1785812	5.22150087	in heg achter bord Koudelaan	Lage Vuursche	Ut	\N	\N
624	12-11-2011	2011-11-12 00:00:00	13/38	Hans89	13-11-2011	2011-11-13 00:00:00	13/39	black mule	51.5006065	3.61804509	bij standbeeld Emma - Damplein, Middelburg, Ze	Middelburg	Ze	\N	\N
4025	04-09-2021	2021-09-04 00:00:00	41/151	FastEddy	10-09-2021	2021-09-10 00:00:00	41/153	Janhertog	53.2154274	7.13583708	aan hek gemaal Hongerige Wolf	Hongerige Wolf	Gr	\N	\N
3756	25-11-2020	2020-11-25 00:00:00	40/892	HermanK	26-11-2020	2020-11-26 00:00:00	40/892	FastEddy	52.5133896	6.60181904	aan paal sluiswachtershuisje	Gouden Ploeg	Ov	\N	\N
1059	30-01-2013	2013-01-30 00:00:00	18/79	Bigtwim	01-02-2013	2013-02-01 00:00:00	18/81	SadBunny	52.4948044	4.66756392	aan boom - Laan der Nederlanden	Beverwijk	NH	\N	\N
1014	06-12-2012	2012-12-06 00:00:00	18/22	me-daph	06-12-2012	2012-12-06 00:00:00	18/22	Hasseman	52.2794685	6.42652178	achter muurtje hoek Oranjestraat	Holten	Ov	\N	\N
205	21-01-2011	2011-01-21 00:00:00	6/41	Gertman	22-01-2011	2011-01-22 00:00:00	6/42	scheurschuimpje	52.9139366	5.77877378	Uilesprong - Tsjukemarwei, Doniaga, Fr	Doniaga	Fr	\N	\N
2300	28-11-2016	2016-11-28 00:00:00	33/09	inSaNo	29-11-2016	2016-11-29 00:00:00	33/10	Amauta	52.7891273	5.79989719	in infobus - natuurcamping Kuinderbos	Bant	Fl	\N	\N
201	18-01-2011	2011-01-18 00:00:00	6/28	Gewoon Denis	18-01-2011	2011-01-18 00:00:00	6/29	USED	52.2350655	6.7821908	P2 - Oude Hengelosedijk, Hengelo, Ov	Hengelo	Ov	\N	\N
3774	21-12-2020	2020-12-21 00:00:00	40/908	Outdoor Man	22-12-2020	2020-12-22 00:00:00	40/909	SadBunny	52.4874344	5.38650513	onder vogelkijkhut de Grote Zilverreiger	Lelystad	Fl	\N	\N
542	15-09-2011	2011-09-15 00:00:00	12/10	BSI	16-09-2011	2011-09-16 00:00:00	12/12	V-Strommert	52.1597939	5.5377388	aan hek Dronkelaarseweg 13, Terschuur, Ge	Terschuur	Ge	\N	\N
1628	07-05-2014	2014-05-07 00:00:00	25/97	XJ Elff	07-05-2014	2014-05-07 00:00:00	25/97	Ronald_010	51.957058	4.45796204	aan boompje - Soetserbergstraat	Rotterdam	ZH	\N	\N
2263	05-10-2016	2016-10-05 00:00:00	32/50	Amauta	06-10-2016	2016-10-06 00:00:00	32/52	frankivo	53.0849113	6.35262918	in graspol bij schans - Schansweg	Noordenveld	Dr	\N	\N
2044	23-12-2015	2015-12-23 00:00:00	30/08	Ronald_010	24-12-2015	2015-12-24 00:00:00	30/09	Meifesto	51.9720688	4.46167898	aan hek Spoorhaven	Berkel en Rodenrijs	ZH	\N	\N
2590	13-11-2017	2017-11-13 00:00:00	36/61	Rik60NL	13-11-2017	2017-11-13 00:00:00	36/62	RiccardoPTI	52.2487335	4.75733614	aan Elzeboom - Kudelstaartseweg	Kudelstaart	NH	\N	\N
3865	06-04-2021	2021-04-06 00:00:00	41/033	Outdoor Man	07-04-2021	2021-04-07 00:00:00	41/033	BSI	52.2610245	5.37543488	onder steen eind pier	Spakenburg	NH	\N	\N
4348	29-05-2023	2023-05-29 00:00:00	41/368	Hans89	01-06-2023	2023-06-01 00:00:00	41/369	Bensi	52.0152779	5.98755312	tegen E-kast Beekhuizenseweg	Velp	Ge	\N	\N
1569	26-03-2014	2014-03-26 00:00:00	25/42	Sjantaalfoutje	27-03-2014	2014-03-27 00:00:00	25/43	Vins111	52.1898918	5.95542812	aan hek Politieacademie	Apeldoorn	Ge	\N	\N
106	23-10-2010	2010-10-23 00:00:00	3/98	Wilddam	23-10-2010	2010-10-23 00:00:00	3/98	Michiel	52.2840118	6.67321301	Krudersweg, Ambt Delden, Ov	Ambt Delden	Ov	\N	\N
717	28-02-2012	2012-02-28 00:00:00	14/67	Hasseman	02-03-2012	2012-03-02 00:00:00	14/69	Shadowski	52.3086472	6.7473731	in heg naast stoel Oostermaat 7, Borne, Ov	Borne	Ov	\N	\N
3228	31-08-2019	2019-08-31 00:00:00	40/445	Hans89	01-09-2019	2019-09-01 00:00:00	40/446	jaap43	51.9536209	4.64134789	onder infobord, dubbeltje …, Groenendijk	Nieuwerkerk a/d Ijssel	ZH	\N	\N
394	30-05-2011	2011-05-30 00:00:00	10/17	Dirk130	30-05-2011	2011-05-30 00:00:00	10/18	wesleyc	52.0995598	4.34805584	bij Louwman - Leidsesstraatweg, Den Haag, ZH	Den Haag	ZH	\N	\N
1111	10-03-2013	2013-03-10 00:00:00	19/46	BSI	11-03-2013	2013-03-11 00:00:00	19/47	sirdrinksalotofpetrol	52.1975784	5.70087385	onder struik bij rotonde N310/Wolweg	Stroe	Ge	\N	\N
180	25-12-2010	2010-12-25 00:00:00	5/61	BigJim	27-12-2010	2010-12-27 00:00:00	5/63	honda_power	52.483551	4.70827484	trafogebouwtje - Groenedijk 4, Heemskerk, NH	Heemskerk	NH	\N	\N
4009	21-08-2021	2021-08-21 00:00:00	41/144	Coenster	23-08-2021	2021-08-23 00:00:00	41/144	Roeleey	51.9632339	5.21564913	aan vangrail Veerweg	Schalkwijk	Ut	\N	\N
411	05-06-2011	2011-06-05 00:00:00	10/32	black mule	05-06-2011	2011-06-05 00:00:00	10/33	Scoot_020/Scoot_2	52.4304504	4.75497198	aan lantaarnpaal Kanaaldijk, Westzaan, NH	Westzaan	NH	\N	\N
1224	29-05-2013	2013-05-29 00:00:00	21/11	Mr.Bean	30-05-2013	2013-05-30 00:00:00	21/12	Bludge	51.9103127	6.09484291	aan paaltje Gemeende Gronden	Babberich	Ge	\N	\N
620	10-11-2011	2011-11-10 00:00:00	13/35	frankwijers	12-11-2011	2011-11-12 00:00:00	13/36	bakfiets1	51.2990417	5.448843	aan boom bij Dorpsstraat 65, Valkenswaard, NB	Valkenswaard	NB	\N	\N
2766	27-05-2018	2018-05-27 00:00:00	38/98	BSI	27-05-2018	2018-05-27 00:00:00	38/99	HermanK	51.9845505	5.45602894	aan paal vogelgebied Rijnsteeg	Amerongen	Ut	\N	\N
4221	18-07-2022	2022-07-18 00:00:00	41/281	Deeffox	20-07-2022	2022-07-20 00:00:00	41/282	Phaedrus	51.7999268	4.8654952	tegen paaltje bij knooppunt 11, Bandijk	Werkendam	NB	\N	\N
1433	27-11-2013	2013-11-27 00:00:00	23/88	MotorMieke	29-11-2013	2013-11-29 00:00:00	23/89	Hasseman	52.3441811	6.60444593	aan lantaarnpaal - Zuidbroeksweg	Almelo	Ov	\N	\N
1492	27-01-2014	2014-01-27 00:00:00	24/55	tdemmer	28-01-2014	2014-01-28 00:00:00	24/55	bikedan	51.6973457	4.2311759	aan stutje tankstation N59	Oude Tonge	ZH	\N	\N
496		0001-01-01 00:00:00 BC				0001-01-01 00:00:00 BC		bobcat	\N	\N				\N	\N
2019	01-10-2015	2015-10-01 00:00:00	29/73	pdv_moto	02-10-2015	2015-10-02 00:00:00	29/74	jaap43	52.0982094	4.30445719	bij beeld Plesman - Plesmanweg	Den Haag	ZH	\N	\N
121	03-11-2010	2010-11-03 00:00:00	4/45	josefientje123	03-11-2010	2010-11-03 00:00:00	4/46	V-Strommert	52.3309097	4.580019	tuincentrum - Vogelenzangseweg, Vogelenzang, NH	Vogelenzang	NH	\N	\N
669	23-12-2011	2011-12-23 00:00:00	13/90	Scoot_020/Scoot_2	24-12-2011	2011-12-24 00:00:00	13/91	Ronald_010	52.3469963	4.84861612	huisje begraafplaats huis te Vraag, Amsterdam, NH	Amsterdam	NH	\N	\N
3243	20-09-2019	2019-09-20 00:00:00	40/459	Janhertog	22-09-2019	2019-09-22 00:00:00	40/460	pdv_moto	52.8281174	6.04513121	aan boom ruiterpad Eikenlaan	Blesdijk	Fr	\N	\N
222	06-02-2011	2011-02-06 00:00:00	6/88	MotorMieke	06-02-2011	2011-02-06 00:00:00	6/90	Bensi	52.076664	6.17723513	park Onderstraat, Bronckhorst, Ge	Bronckhorst	Ge	\N	\N
1317	19-08-2013	2013-08-19 00:00:00	22/29	Hasseman	20-08-2013	2013-08-20 00:00:00	22/29	Bensi	52.2945023	6.72607088	aan paaltje bij tunnel Graasweg	Ambt Delden	Ov	\N	\N
4084	06-01-2022	2022-01-06 00:00:00	41/193	Coenster	07-01-2022	2022-01-07 00:00:00	41/193	pdv_moto	52.2823219	4.60076714	achter paal pnooppunt 54	Nieuw-Vennep	NH	\N	\N
2651	06-03-2018	2018-03-06 00:00:00	37/63	-Floris-	08-03-2018	2018-03-08 00:00:00	37/65	pdv_moto	51.4774704	3.61745405	tegen bunker Reyersweg	Oost Souburg	Ze	\N	\N
3869	10-04-2021	2021-04-10 00:00:00	41/035	pdv_moto	11-04-2021	2021-04-11 00:00:00	41/036	Outdoor Man	52.0109444	4.14408398	tegen paaltje hek Verlengde Strandweg	s-Gravenzande	ZH	\N	\N
2120	09-05-2016	2016-05-09 00:00:00	30/89	Scoot_020/Scoot_2	09-05-2016	2016-05-09 00:00:00	30/89	Roeleey	52.3367233	4.818367	bij paal P-terrein Oude Haagseweg	Amsterdam	NH	\N	\N
252	28-02-2011	2011-02-28 00:00:00	7/56	FietsFanatic	01-03-2011	2011-03-01 00:00:00	7/59	scheurschuimpje	52.6851196	5.74367714	boompje Platinaweg 1, Emmeloord, Fl	Emmeloord	Fl	\N	\N
1352	15-09-2013	2013-09-15 00:00:00	22/78	tdemmer	16-09-2013	2013-09-16 00:00:00	22/79	Ronald_010	51.9710617	4.51821995	aan boom Reeënpad	Bergschenhoek	ZH	\N	\N
716	26-02-2012	2012-02-26 00:00:00	14/63	MotorMieke	28-02-2012	2012-02-28 00:00:00	14/66	Hasseman	52.274086	6.84551811	in wagentje - Lonnekermeerweg, Lonneker, Ov	Lonneker	Ov	\N	\N
3686	02-10-2020	2020-10-02 00:00:00	40/836	pdv_moto	02-10-2020	2020-10-02 00:00:00	40/836	BSI	52.2821159	4.77650785	achter vangrail Aalsmeerderdijk	Oude Meer	NH	\N	\N
3286	29-10-2019	2019-10-29 00:00:00	40/493	Amauta	29-10-2019	2019-10-29 00:00:00	40/494	FastEddy	53.104454	6.33867598	tegen landhoofd brug, Bremerweg	de Haspel	Gr	\N	\N
3245	22-09-2019	2019-09-22 00:00:00	40/462	HighKing	23-09-2019	2019-09-23 00:00:00	40/462	Coenster	52.465847	4.65837383	onder tegel gemaaltje Basisweg	Velen-Noord	NH	\N	\N
253	01-03-2011	2011-03-01 00:00:00	7/59	scheurschuimpje	02-03-2011	2011-03-02 00:00:00	7/62	I-accelerate	52.6568756	5.78091097	plankier Vluchthavenpad, Schokland, Fl	Schokland	Fl	\N	\N
1113	12-03-2013	2013-03-12 00:00:00	19/49	Mr.Bean	14-03-2013	2013-03-14 00:00:00	19/50	Bensi	51.9117279	6.14914703	in holle boom - Landeweer	Didam	Ge	\N	\N
534	12-09-2011	2011-09-12 00:00:00	12/03	bakfiets1	13-09-2011	2011-09-13 00:00:00	12/05	tdemmer	51.4390068	4.32076979	steenfabriek - Antwerpsestraatweg, Hoogerheide, NB	Hoogerheide	NB	\N	\N
1970	22-07-2015	2015-07-22 00:00:00	29/27	Ronald_010	22-07-2015	2015-07-22 00:00:00	29/27	Roeleey	52.1930313	4.61275578	aan poot bord Veenderveld	Roelofarendsveen	ZH	\N	\N
4047	16-10-2021	2021-10-16 00:00:00	41/166	ootje	16-10-2021	2021-10-16 00:00:00	41/166	HighKing	52.5842094	4.6661458	bij zorgboerderij "Landje van Tingeling"	Castricum	NH	\N	\N
1606	24-04-2014	2014-04-24 00:00:00	25/80	vuurbloed	25-04-2014	2014-04-25 00:00:00	25/81	Scoot_020/Scoot_2	52.2974358	4.74165201	bij reclamezuil - Pelikaanweg	Schiphol	NH	\N	\N
2076	05-03-2016	2016-03-05 00:00:00	30/37	pdv_moto	07-03-2016	2016-03-07 00:00:00	30/38	Meangreengirl/MeanBlueMan	51.3458672	4.2318511	aan hek Lignestraat	Nieuw-Namen	Ze	\N	\N
1221	26-05-2013	2013-05-26 00:00:00	21/08	DKP	27-05-2013	2013-05-27 00:00:00	21/08	frankwijers	51.4635849	5.41866302	aan boom achter Tegenbosch	Eindhoven	NB	\N	\N
2874	22-08-2018	2018-08-22 00:00:00	40/26	Coenster	22-08-2018	2018-08-22 00:00:00	40/27	HighKing	52.9643402	4.77207518	aan paal Hoofdgracht	Den Helder	NH	\N	\N
1369	26-09-2013	2013-09-26 00:00:00	22/99	Wimis on	26-09-2013	2013-09-26 00:00:00	23/02	Meangreengirl/MeanBlueMan	52.0192146	5.14127588	aan hekwerk Veerwagenweg	Houten	Ut	\N	\N
1484	19-01-2014	2014-01-19 00:00:00	24/45	Bomba	19-01-2014	2014-01-19 00:00:00	24/45	MLB	52.0685692	4.79168892	aan hek - Weiweg	Nieuwerbrug	ZH	\N	\N
2469	26-06-2017	2017-06-26 00:00:00	34/94	nappertje	26-06-2017	2017-06-26 00:00:00	34/95	Rik60NL	52.2843437	5.73222685	tegen boom - Postweg	Ermelo	Ge	\N	\N
650	03-12-2011	2011-12-03 00:00:00	13/65	BSI	03-12-2011	2011-12-03 00:00:00	13/66	me-daph	52.2129478	6.85465622	aan hek achtertuin Fre Cohenlaan, Enschede, Ov	Enschede	Ov	\N	\N
3002	01-02-2019	2019-02-01 00:00:00	40/194	FastEddy	02-02-2019	2019-02-02 00:00:00	40/195	Amauta	53.0863609	7.18767691	in struik Grenslaan	Bellingwolde	Gr	\N	\N
1984	10-08-2015	2015-08-10 00:00:00	29/37	Roeleey	10-08-2015	2015-08-10 00:00:00	29/38	Vertaix	52.3246269	4.89252615	aan boom de Borcht	Amsterdam	NH	\N	\N
3563	29-06-2020	2020-06-29 00:00:00	40/719	BBen	30-06-2020	2020-06-30 00:00:00	40/720	Outdoor Man	52.0724182	4.45720911	tegen noodtrap Snowworld	Zoetermeer	ZH	\N	\N
2051	09-01-2016	2016-01-09 00:00:00	30/15	pdv_moto	12-01-2016	2016-01-12 00:00:00	30/15	tdemmer	51.9594536	4.29990101	aan brug Gaagweg/Oostgaag	Schipluiden	ZH	\N	\N
603	26-10-2011	2011-10-26 00:00:00	13/05	fien	27-10-2011	2011-10-27 00:00:00	13/07	MotorMieke	52.3771935	6.98085022	onder brug watermolen Singraven, Denekamp, Ov	Denekamp	Ov	\N	\N
3353	15-01-2020	2020-01-15 00:00:00	40/547	Sjefman	16-01-2020	2020-01-16 00:00:00	40/548	DKP	51.6255608	4.37748098	bij wiel vrachtwagen bij carpoolplaats	Dinteloord	NB	\N	\N
2793	23-06-2018	2018-06-23 00:00:00	39/29	Raviel	24-06-2018	2018-06-24 00:00:00	39/31	Bensi	51.8983917	6.05933905	aan hek ooievaarsnest Aerdtsedijk	Aerdt	Ge	\N	\N
1117	17-03-2013	2013-03-17 00:00:00	19/57	SadBunny	18-03-2013	2013-03-18 00:00:00	19/58	Ronald_010	52.0653267	4.21386719	aan hek Duinfietspad	Kijkduin	ZH	\N	\N
3523	31-05-2020	2020-05-31 00:00:00	40/685	Bensi	31-05-2020	2020-05-31 00:00:00	40/685	BSI	52.0097809	5.9058919	regen stem bij koepel Openluchtmuseum	Arnhem	Ge	\N	\N
2683	31-03-2018	2018-03-31 00:00:00	38/03	vuurbloed	31-03-2018	2018-03-31 00:00:00	38/04	Coenster	52.2890549	4.67740011	in boot vijver President	Hoofddorp	NH	\N	\N
4223	22-07-2022	2022-07-22 00:00:00	41/282	Outdoor Man	23-07-2022	2022-07-23 00:00:00	41/283	Amauta	52.9165916	4.79640818	onder trap uitkijktoren Balgzandpolder	Den Helder	NH	\N	\N
2771	03-06-2018	2018-06-03 00:00:00	39/10	Outdoor Man	04-06-2018	2018-06-04 00:00:00	39/11	jaap43	51.7159615	4.47486019	aan boom gemaal Cromstrijen	Numansdorp	ZH	\N	\N
2318	23-12-2016	2016-12-23 00:00:00	33/25	Dirk130	23-12-2016	2016-12-23 00:00:00	33/25	Ronald_010	52.0863457	4.27721977	in slakkenhuis - Pres. Kennedylaan	Den Haag	ZH	\N	\N
484	02-08-2011	2011-08-02 00:00:00	11/32	BSI	02-08-2011	2011-08-02 00:00:00	11/32	rvdh86	52.1623611	5.5983839	parking transferium, Barneveld Noord, Ge	Barneveld	Ge	\N	\N
3377	07-02-2020	2020-02-07 00:00:00	40/563	Amauta	10-02-2020	2020-02-10 00:00:00	40/564	Outdoor Man	53.2483177	6.30944014	onder steiger vlonder sluis Gaarkeuken	Grijpskerk	Gr	\N	\N
95	16-10-2010	2010-10-16 00:00:00	3/71	bobcat	16-10-2010	2010-10-16 00:00:00	3/72	stampertje-35	52.4477768	4.67291212	brug Valeiweg, Velsen Zuid, NH	Velsen	NH	\N	\N
4088	09-01-2022	2022-01-09 00:00:00	41/196	Outdoor Man	09-01-2022	2022-01-09 00:00:00	41/196	SadBunny	52.4516144	4.90390301	tegen grote wilgenboom Polderweg	Den Ilp	NH	\N	\N
2210	25-08-2016	2016-08-25 00:00:00	31/88	Rik60NL	25-08-2016	2016-08-25 00:00:00	31/88	Ronald_010	52.2224922	4.86182594	achter kastje - Tweede Zijweg	Mijdrecht	Ut	\N	\N
1888	19-04-2015	2015-04-19 00:00:00	28/57	Amauta	20-04-2015	2015-04-20 00:00:00	28/58	frankivo	53.0376244	6.39102697	aan boom bij El-centrale	Veenhuizen	Dr	\N	\N
3358	20-01-2020	2020-01-20 00:00:00	40/550	pdv_moto	21-01-2020	2020-01-21 00:00:00	40/550	Outdoor Man	52.1281891	4.49462509	in plantenbak bij La Plce,	Zoeterwoude	ZH	\N	\N
3780	30-12-2020	2020-12-30 00:00:00	40/913	Picobello BV	30-12-2020	2020-12-30 00:00:00	40/913	pdv_moto	52.1139908	4.29385185	achter palen veerooster Harstenhoekweg	Scheveningen	ZH	\N	\N
1722	23-08-2014	2014-08-23 00:00:00	27/06	Corney28	24-08-2014	2014-08-24 00:00:00	27/07	SadBunny	53.1802559	4.85197401	aan hek zendmast P-terrein vuurtoren	Texel	NH	\N	\N
4415	16-10-2023	2023-10-16 00:00:00	41/411	Outdoor Man	16-10-2023	2023-10-16 00:00:00	41/411	Scoot_020	52.3331451	4.8034029	in struikje viaduct A4 Ringvaartdijk	Amsterdam (Sloten)	NH	\N	\N
1130		0001-01-01 00:00:00 BC				0001-01-01 00:00:00 BC		SadBunny	\N	\N				\N	\N
633	19-11-2011	2011-11-19 00:00:00	13/47	Ronald_010	19-11-2011	2011-11-19 00:00:00	13/48	bakfiets1	51.8640251	4.24902391	aan boom sluis in Bernisse - Toldijk, Geervliet, ZH	Geervliet	ZH	\N	\N
3288	31-10-2019	2019-10-31 00:00:00	40/496	pdv_moto	31-10-2019	2019-10-31 00:00:00	40/496	Picobello BV	52.0946999	4.30134916	in heg Kerkhoflaan/Bankastraat	Den Haag	ZH	\N	\N
1824	11-01-2015	2015-01-11 00:00:00	27/97	Scoot_020/Scoot_2	13-01-2015	2015-01-13 00:00:00	27/98	Rainbow600	52.1511307	5.35196209	in struik W. Wuytierslaan	Amersfoort	Ut	\N	\N
2723	21-04-2018	2018-04-21 00:00:00	38/48	jaap43	21-04-2018	2018-04-21 00:00:00	38/49	bikedan	51.7106285	4.49379492	achter E-kast Korte Boompjes	Numansdorp	ZH	\N	\N
4313	04-04-2023	2023-04-04 00:00:00	41/344	Outdoor Man	05-04-2023	2023-04-05 00:00:00	41/344	ootje	52.4840508	4.63310099	onder boomstronk bij Crematorium	Beverwijk	NH	\N	\N
1931	11-06-2015	2015-06-11 00:00:00	28/94	Roeleey	12-06-2015	2015-06-12 00:00:00	28/95	BSI	52.3830223	4.89359903	in plantsoentje - Westerdoksdijk	Amsterdam	NH	\N	\N
3210	14-08-2019	2019-08-14 00:00:00	40/425	Outdoor Man	14-08-2019	2019-08-14 00:00:00	40/425	Hans89	52.3346176	5.06588221	bij hek fort Westbatterij	Muiden	NH	\N	\N
3081	20-04-2019	2019-04-20 00:00:00	40/279	jaap43	20-04-2019	2019-04-20 00:00:00	40/279	pdv_moto	51.9890404	4.6500988	tegen boom Oude Spoorbaan	Moordrecht	ZH	\N	\N
2981	03-01-2019	2019-01-03 00:00:00	40/159	BornToReign	04-01-2019	2019-01-04 00:00:00	40/159	Marsian	51.9798088	5.72396612	achter bankje oliemolenbeek	Renkum	Ge	\N	\N
218	02-02-2011	2011-02-02 00:00:00	6/79	jaap43	02-02-2011	2011-02-02 00:00:00	6/80	tdemmer	51.9030609	4.53147411	hek Schaardijk, Rotterdam, ZH	Rotterdam	ZH	\N	\N
439	20-06-2011	2011-06-20 00:00:00	10/75	BSI	23-06-2011	2011-06-23 00:00:00	10/76	Outdoor Man	52.2846298	5.68997383	bij Romeins marskamp - Flevoweg, Ermelo, Ge	Ermelo	Ge	\N	\N
3252	27-09-2019	2019-09-27 00:00:00	40/467	pdv_moto	27-09-2019	2019-09-27 00:00:00	40/467	BSI	52.2692719	4.75380993	tegen paal cameratoezicht Casino Seven	Aalsmeer	NH	\N	\N
306		0001-01-01 00:00:00 BC		Miss2		0001-01-01 00:00:00 BC			\N	\N				\N	\N
2048	29-12-2015	2015-12-29 00:00:00	30/11	Dirk130	30-12-2015	2015-12-30 00:00:00	30/12	Ronald_010	51.9222412	4.46623087	in heg speeltuin - Diergaardesingel	Rotterdam	ZH	\N	\N
1291	26-07-2013	2013-07-26 00:00:00	22/01	tdemmer	26-07-2013	2013-07-26 00:00:00	22/02	Kiki92	51.5211945	4.54360199	onder dode boom - Kromme Elleboog	Rucphen	NB	\N	\N
3680	29-09-2020	2020-09-29 00:00:00	40/833	pdv_moto	29-09-2020	2020-09-29 00:00:00	40/833	Picobello BV	52.0915604	4.26460123	in bloembak Houtrustweg	Den Haag	ZH	\N	\N
3022	24-02-2019	2019-02-24 00:00:00	40/219	SadBunny	24-02-2019	2019-02-24 00:00:00	40/219	Coenster	52.2637405	4.80226183	aan hek remise, Meerlandenweg	Amstelveen	NH	\N	\N
3570	05-07-2020	2020-07-05 00:00:00	40/726	pdv_moto	05-07-2020	2020-07-05 00:00:00	40/726	Outdoor Man	52.100029	4.27314615	in struik Westduinweg	Scheveningen	ZH	\N	\N
1575	30-03-2014	2014-03-30 00:00:00	25/49	Wimis on	30-03-2014	2014-03-30 00:00:00	25/49	Ronald_010	52.0264015	5.13287306	aan hek bij inrit de Staart	Houten	Ut	\N	\N
592	19-10-2011	2011-10-19 00:00:00	12/88	lynx84	19-10-2011	2011-10-19 00:00:00	12/88	Dirk130	51.9204254	4.37128115	achter elektrakast - Olympiaweg, Schiedam, ZH	Schiedam	ZH	\N	\N
758	29-03-2012	2012-03-29 00:00:00	15/11	Dirk130	31-03-2012	2012-03-31 00:00:00	15/13	scheurschuimpje	52.2803574	4.53872681	aan hek bij Zuider Leidse Vaart, Lisse, ZH	Lisse	ZH	\N	\N
1684	16-07-2014	2014-07-16 00:00:00	26/63	Sjantaalfoutje	16-07-2014	2014-07-16 00:00:00	26/64	Chakotay	52.1039925	5.7562108	aan boom Westenengerdijk	Otterlo	Ge	\N	\N
368	12-05-2011	2011-05-12 00:00:00	9/66	bobcat	13-05-2011	2011-05-13 00:00:00	9/68	BSI	52.343792	5.01245689	onder trap Diemerdammersluis, Amsterdam, NH	Amsterdam	NH	\N	\N
3583	14-07-2020	2020-07-14 00:00:00	40/736	Roeleey	14-07-2020	2020-07-14 00:00:00	40/736	k0en	52.3228226	4.99193096	bij boom kinderboerderij Bijlmerweide	Amsterdam	NH	\N	\N
1842	20-02-2015	2015-02-20 00:00:00	28/15	Scoot_020/Scoot_2	21-02-2015	2015-02-21 00:00:00	28/16	Ronald_010	51.9478874	4.4301672	tegen hek - Zestienhoven	Rotterdam	ZH	\N	\N
3139	06-06-2019	2019-06-06 00:00:00	40/350	Carburateur	09-06-2019	2019-06-09 00:00:00	40/352	Sjefman	51.6248245	4.63375521	aan paal p-plaats Zeedijk	Etten-Leur	NB	\N	\N
3235	05-09-2019	2019-09-05 00:00:00	40/450	Roeleey	05-09-2019	2019-09-05 00:00:00	40/451	Artemecion	52.5573387	4.60915899	tegen paal infobord	Castricum aan Zee	NH	\N	\N
3596	25-07-2020	2020-07-25 00:00:00	40/745	Springbok	26-07-2020	2020-07-26 00:00:00	40/746	Yosra87	52.1157417	4.57211924	tegen gaspaal Vierheemskinderenweg	Hazerswoude-Dorp	ZH	\N	\N
360	05-05-2011	2011-05-05 00:00:00	9/53	tdemmer	05-05-2011	2011-05-05 00:00:00	9/55	jaap43	51.9747429	4.6296382	fietspad naast ringvaart, Nieuwerkerk a/d Ijssel, ZH	Nieuwerkerk a/d IJssel	ZH	\N	\N
2057	27-01-2016	2016-01-27 00:00:00	30/19	tdemmer	27-01-2016	2016-01-27 00:00:00	30/19	ArendJan	51.9738998	4.54610586	aan steiger Koraalzwampad	Rotterdam	ZH	\N	\N
949	14-10-2012	2012-10-14 00:00:00	17/33	bikedan	15-10-2012	2012-10-15 00:00:00	17/33	magnamaniac	51.961586	5.17723703	aan hek - Goilberdingerdijk	Culemborg	Ge	\N	\N
424	10-06-2011	2011-06-10 00:00:00	10/46	Outdoor Man	10-06-2011	2011-06-10 00:00:00	10/47	BigJim	52.3071899	4.97358799	aan boom - Langbroekdreef, Amsterdam, NH	Amsterdam	NH	\N	\N
236	14-02-2011	2011-02-14 00:00:00	7/16	Komkommer	15-02-2011	2011-02-15 00:00:00	7/18	Scoot_020/Scoot_2	52.0176926	5.43903685	bosbad - Scherpenzeelseweg 45, Leersum, Ut	Leersum	Ut	\N	\N
2867	18-08-2018	2018-08-18 00:00:00	40/20	bikedan	19-08-2018	2018-08-19 00:00:00	40/21	Outdoor Man	51.8030968	5.03702307	voor E-kasten bij fort Loevestein	Poederoyen	Ge	\N	\N
1817	02-01-2015	2015-01-02 00:00:00	27/92	Djoost	03-01-2015	2015-01-03 00:00:00	27/92	Scoot_020/Scoot_2	52.4318542	4.87340593	onder steen bij peen - Skoon	Oostzaan	NH	\N	\N
2784	16-06-2018	2018-06-16 00:00:00	39/20	Outdoor Man	17-06-2018	2018-06-17 00:00:00	39/21	Roeleey	52.3069153	4.84114408	in boom Blekerskade	Amstelveen	NH	\N	\N
4202	31-05-2022	2022-05-31 00:00:00	41/270	FastEddy	31-05-2022	2022-05-31 00:00:00	41/270	Kato	53.0343857	6.56258583	tegen gaspaaltje Dr. Picardtweg	Rhee	Dr	\N	\N
4280	10-01-2023	2023-01-10 00:00:00	41/323	FastEddy	14-01-2023	2023-01-14 00:00:00	41/324	Amauta	52.9891167	7.16254997	achter bunker Ruiten-A-kanaal	Vlagtwedde	Gr	\N	\N
2169	07-07-2016	2016-07-07 00:00:00	31/42	-Floris-	08-07-2016	2016-07-08 00:00:00	31/42	Amauta	51.7364807	3.78036189	achter boompje - Slot Moermont	Renesse	ZH	\N	\N
4113	05-02-2022	2022-02-05 00:00:00	41/211	ootje	05-02-2022	2022-02-05 00:00:00	41/211	Roeleey	52.520977	4.86920595	in schotbalk bij Jispersluis	Spijkerboor	NH	\N	\N
3	18-08-2010	2010-08-18 00:00:00	1/4	Stephan	19-08-2010	2010-08-19 00:00:00	1/6	Red Devil	52.1116333	5.29073191	Kampdwarsweg, Soesterberg, Ut	Soesterberg	Ut	\N	\N
1803	07-12-2014	2014-12-07 00:00:00	27/80	Phaedrus	07-12-2014	2014-12-07 00:00:00	27/80	tdemmer	51.8817902	4.54491186	aan hek Reijerdijk	Rotterdam	ZH	\N	\N
4271	12-12-2022	2022-12-12 00:00:00	41/318	BSI	13-12-2022	2022-12-13 00:00:00	41/318	Outdoor Man	52.2340279	5.71073008	tegen bomen bij Versteghehof	Garderen	Ge	\N	\N
1911	14-05-2015	2015-05-14 00:00:00	28/75	bikedan	14-05-2015	2015-05-14 00:00:00	28/76	crazy987	51.4753113	4.29116297	onder trap orientatiepunt	Bergen op Zoom	NB	\N	\N
2064	07-02-2016	2016-02-07 00:00:00	30/25	Fuck Het Milieu	07-02-2016	2016-02-07 00:00:00	30/25	Ronald_010	51.9524002	4.31684923	aan boompje - Schouwkade	Maasland	ZH	\N	\N
329	13-04-2011	2011-04-13 00:00:00	8/99	Richard117	14-04-2011	2011-04-14 00:00:00	9/3	tdemmer	51.8269844	4.9760561	in boom Kriekenmarkt/Altenawal, Gorinchem, ZH	Gorinchem	ZH	\N	\N
3729	31-10-2020	2020-10-31 00:00:00	40/868	pdv_moto	31-10-2020	2020-10-31 00:00:00	40/868	k0en	52.0995598	4.30102921	op rotonde Plemanweg	Den Haag	ZH	\N	\N
1957	10-07-2015	2015-07-10 00:00:00	29/18	Amauta	11-07-2015	2015-07-11 00:00:00	29/19	Bensi	52.2164421	6.58702421	in boom Weldammerlaan	Markelo	Ov	\N	\N
1222	27-05-2013	2013-05-27 00:00:00	21/09	frankwijers	28-05-2013	2013-05-28 00:00:00	21/11	Bludge	51.6546059	5.47198296	p-terrein abdij Berne	Heeswijk-Dinther	NB	\N	\N
3649	31-08-2020	2020-08-31 00:00:00	40/807	FastEddy	31-08-2020	2020-08-31 00:00:00	40/807	Ronny Rabbelaar	53.2272682	7.05280209	tegen gemaaltje Lutje Loug	Oldambt	Gr	\N	\N
2170	09-07-2016	2016-07-09 00:00:00	31/43	Amauta	11-07-2016	2016-07-11 00:00:00	31/44	frankivo	53.1275558	7.180089	tegen bunker Wymeersterweg	Bellingwolde	Gr	\N	\N
2785	17-06-2018	2018-06-17 00:00:00	39/21	Roeleey	17-06-2018	2018-06-17 00:00:00	39/21	Coenster	52.3019257	4.97934198	in kunstwerk Langbroekdreef	Amsterdam	NH	\N	\N
2584	07-11-2017	2017-11-07 00:00:00	36/52	ItsmeA3	08-11-2017	2017-11-08 00:00:00	36/54	SadBunny	51.8423004	4.44965696	Aan hek Schenkeldijk	Rhoon	ZH	\N	\N
3366	27-01-2020	2020-01-27 00:00:00	40/555	Marsian	29-01-2020	2020-01-29 00:00:00	40/556	HermanK	52.3240547	5.31798077	tegen boom Groene Kathedraal	Almere	Fl	\N	\N
2917	28-09-2018	2018-09-28 00:00:00	40/72	Outdoor Man	29-09-2018	2018-09-29 00:00:00	40/75	FastEddy	52.1232872	5.04616499	aan damwand achter Joost Motoren	Utrecht	Ut	\N	\N
4075	16-12-2021	2021-12-16 00:00:00	41/187	pdv_moto	18-12-2021	2021-12-18 00:00:00	41/188	Springbok	51.977169	5.90866518	tegen bedieningskast Eusebiusplein	Arnhem	Ge	\N	\N
543		0001-01-01 00:00:00 BC		rvdh86		0001-01-01 00:00:00 BC			\N	\N				\N	\N
2367	31-03-2017	2017-03-31 00:00:00	33/91	BSI	31-03-2017	2017-03-31 00:00:00	33/92	Bensi	51.8743019	6.23995018	onder boon - Hof van Bergh	's-Heerenberg	Ge	\N	\N
2952	04-12-2018	2018-12-04 00:00:00	40/119	DKP	05-12-2018	2018-12-05 00:00:00	40/120	scheurschuimpje	51.2564812	4.06590319	tegen paaltje Kapelstraat	Kapellebrug	Ze	\N	\N
4335	08-05-2023	2023-05-08 00:00:00	41/360	Toereloer	08-05-2023	2023-05-08 00:00:00	41/360	SwitchUp	52.7813454	5.10289192	aan hek bij windmolen Zuiderdijkweg	Wieringerwerf	NH	\N	\N
754	26-03-2012	2012-03-26 00:00:00	15/07	BSI	27-03-2012	2012-03-27 00:00:00	15/08	tdemmer	52.1502151	4.85811377	aan hek gemaaltje Bosweg, Nieuwkoop, ZH	Nieuwkoop	ZH	\N	\N
4055	28-10-2021	2021-10-28 00:00:00	41/171	Hans89	29-10-2021	2021-10-29 00:00:00	41/171	WillyvD	51.8853874	4.41883898	in krul vangrail Eemlandweg	Rotterdam	ZH	\N	\N
2332	21-01-2017	2017-01-21 00:00:00	33/45	Ronald_010	21-01-2017	2017-01-21 00:00:00	33/46	inSaNo	51.8703117	4.41420984	bij kastje W. Barentszstraat	Albrandswaard	ZH	\N	\N
1828	16-01-2015	2015-01-16 00:00:00	28/01	Bomba	16-01-2015	2015-01-16 00:00:00	28/02	Rainbow600	52.068634	4.93005085	in boom Weidepad	Linschoten	Ut	\N	\N
537	14-09-2011	2011-09-14 00:00:00	12/07	tdemmer	14-09-2011	2011-09-14 00:00:00	12/08	Alpha	51.993412	4.78288794	aan bord bij P-terrein - Bredeweg, Haastrecht, ZH	Haastrecht	ZH	\N	\N
1874	03-04-2015	2015-04-03 00:00:00	28/45	Scoot_020/Scoot_2	04-04-2015	2015-04-04 00:00:00	28/45	BSI	51.3443451	5.88588285	in heg Raadhuisplein	Meijel	Li	\N	\N
2681	30-03-2018	2018-03-30 00:00:00	37/99	HighKing	30-03-2018	2018-03-30 00:00:00	38/01	SadBunny	52.6336212	4.75061989	in bloembaak Noorderarcade	Alkmaar	NH	\N	\N
25	29-08-2010	2010-08-29 00:00:00	1/78	ootje	29-08-2010	2010-08-29 00:00:00	1/81	Bikermamma	52.4693413	4.57368088	uitkijkplaats Reyndersweg, Velzen Noord, NH	Velsen	NH	\N	\N
1749	22-09-2014	2014-09-22 00:00:00	27/30	Djoost	22-09-2014	2014-09-22 00:00:00	27/30	Bigtwim	52.3605499	4.87140417	achter bak - ingang Vondelpark	Amsterdam	NH	\N	\N
2302	01-12-2016	2016-12-01 00:00:00	33/11	frankivo	02-12-2016	2016-12-02 00:00:00	33/12	Janhertog	53.1744194	6.99294186	aan hek fietstunnel onder A7	Scheemda	Gr	\N	\N
3016	15-02-2019	2019-02-15 00:00:00	40/210	Amauta	17-02-2019	2019-02-17 00:00:00	40/211	FastEddy	52.1594734	6.12709522	tegen boom fietspad Leusvelderweg	Voorst	Ge	\N	\N
1424	18-11-2013	2013-11-18 00:00:00	23/81	Ronald_010	19-11-2013	2013-11-19 00:00:00	23/81	SparkViv	52.0220261	4.38748884	aan hek Noordeindseweg	Delfgauw	ZH	\N	\N
166	13-12-2010	2010-12-13 00:00:00	5/40	bobcat	14-12-2010	2010-12-14 00:00:00	5/41	ootje	52.5299988	4.80944777	Hek paardenwei - Starnmeerdijk, Starnmeer, NH	Starnmeer	NH	\N	\N
1145	30-03-2013	2013-03-30 00:00:00	19/91	Meifesto	30-03-2013	2013-03-30 00:00:00	19/92	tdemmer	51.9146423	4.53889799	onder buxushaag - Rivium	Capelle aan den Ijssel	ZH	\N	\N
2108	02-05-2016	2016-05-02 00:00:00	30/79	Roeleey	03-05-2016	2016-05-03 00:00:00	30/81	Corney28	52.3266106	4.98723984	in kunstwerk - Provincialeweg	Diemen	NH	\N	\N
581		0001-01-01 00:00:00 BC		MarkieNL		0001-01-01 00:00:00 BC			\N	\N				\N	\N
571	09-10-2011	2011-10-09 00:00:00	12/61	ndeeka	10-10-2011	2011-10-10 00:00:00	12/62	Hans89	51.7837143	3.87166595	bij hek overweg - RET trammuseum, Ouddorp, ZH	Ouddorp	ZH	\N	\N
455	06-07-2011	2011-07-06 00:00:00	10/94	KennethMusters	06-07-2011	2011-07-06 00:00:00	10/94	bakfiets1	51.4341507	4.24076986	paaltje 1e Hogerwaarddwarsweg, Rilland, Ze	Rilland	Ze	\N	\N
20	27-08-2010	2010-08-27 00:00:00	1/63	GSxie	27-08-2010	2010-08-27 00:00:00	1/65	SPutnick	52.1205254	4.78497505	Meye 51, Bodegraven, ZH	Bodegraven	ZH	\N	\N
2114	05-05-2016	2016-05-05 00:00:00	30/85	Artemecion	06-05-2016	2016-05-06 00:00:00	30/85	jaap43	51.9932556	6.53212881	camping Woltas - Ziewentseweg	Lichtenvoorde	Ge	\N	\N
3960	29-06-2021	2021-06-29 00:00:00	41/109	FastEddy	29-06-2021	2021-06-29 00:00:00	41/110	Amauta	53.0131264	6.90945816	tegen paaltje talud museumspoorlijn	Stadskanaal	Gr	\N	\N
4021	01-09-2021	2021-09-01 00:00:00	41/150	ootje	01-09-2021	2021-09-01 00:00:00	41/150	BigJim	52.7194176	4.84083891	aan paal kanaal Alkmaar-Kolhorn	Waarland	NH	\N	\N
1906	08-05-2015	2015-05-08 00:00:00	28/72	sjors078	10-05-2015	2015-05-10 00:00:00	28/73	BSI	51.8761559	4.63702106	onder plank brug Molenkade	Kinderdijk	ZH	\N	\N
2195	06-08-2016	2016-08-06 00:00:00	31/68	Rainbow600	07-08-2016	2016-08-07 00:00:00	31/69	pdv_moto	52.0634346	4.21125412	aan paal Zuiderstrand 2A	Kijkduin	ZH	\N	\N
511	22-08-2011	2011-08-22 00:00:00	11/63	lichthuis	22-08-2011	2011-08-22 00:00:00	11/63	The Dutchy	52.3151245	5.48212719	ankerketting - Stille kern - Flediteweg, Zeewolde, Fl	Zeewolde	Fl	\N	\N
2592	15-11-2017	2017-11-15 00:00:00	36/64	Rik60NL	16-11-2017	2017-11-16 00:00:00	36/64	Bigtwim	52.2292404	4.837605	aan hek ingang fort Mijdrechtse Zuwe	Mijdrecht	Ut	\N	\N
1790	10-11-2014	2014-11-10 00:00:00	27/67	Corney28	10-11-2014	2014-11-10 00:00:00	27/67	Bomba	52.171093	4.98914194	aan paaltje - de Corridor	Breukelen	Ut	\N	\N
3201	09-08-2019	2019-08-09 00:00:00	40/417	Hans89	10-08-2019	2019-08-10 00:00:00	40/417	jaap43	51.9062614	4.58463192	aan hek toegang Stormpolder Vloedbos	Krimpen aan den IJssel	ZH	\N	\N
902	18-08-2012	2012-08-18 00:00:00	16/80	Ronald_010	19-08-2012	2012-08-19 00:00:00	16/80	bikedan	51.8983459	4.27710295	in wildrooster prof. Gerbrandyweg	Rotterdam	ZH	\N	\N
2782	16-06-2018	2018-06-16 00:00:00	39/19	Outdoor Man	16-06-2018	2018-06-16 00:00:00	39/20	Roeleey	52.3217087	4.85629082	achter boomstam Nieuwe Kalfjeslaan	Amsterdam	NH	\N	\N
160	05-12-2010	2010-12-05 00:00:00	5/33	BigJim	05-12-2010	2010-12-05 00:00:00	5/34	bobcat	52.4380951	4.68360901	modelspoorterrein Genieweg, Velsen-Zuid, NH	Velsen	NH	\N	\N
4328	24-04-2023	2023-04-24 00:00:00	41/354	Hans89	24-04-2023	2023-04-24 00:00:00	41/354	pdv_moto	51.4998322	3.61381102	in taxushaag Abdij Groenmarkt	Middelburg	Ze	\N	\N
481	31-07-2011	2011-07-31 00:00:00	11/29	LauRRR	01-08-2011	2011-08-01 00:00:00	11/30	patman vtr	51.3289032	5.69337797	achter kapelletje hoek Kerkendijk, Someren, NB	Someren	NB	\N	\N
3585	15-07-2020	2020-07-15 00:00:00	40/737	Roeleey	16-07-2020	2020-07-16 00:00:00	40/737	k0en	52.3522453	4.95463514	aan lantaarnpaal C. MacGillavrylaan	Amsterdam	NH	\N	\N
3444	05-04-2020	2020-04-05 00:00:00	40/623	Ronny Rabbelaar	06-04-2020	2020-04-06 00:00:00	40/623	FastEddy	53.0673866	6.86688709	in struik Dalweg	Wildervank	Gr	\N	\N
1150	01-04-2013	2013-04-01 00:00:00	19/97	rvdh86	02-04-2013	2013-04-02 00:00:00	19/97	SadBunny	52.2327499	5.69537783	aan bord 50 km - Koudhoornseweg	Garderen	Ge	\N	\N
1322	24-08-2013	2013-08-24 00:00:00	22/38	Bludge	24-08-2013	2013-08-24 00:00:00	22/38	Bensi	51.9330559	6.02883577	aan boomspeeltuin - Kampstraat	Groessen	Ge	\N	\N
3623	14-08-2020	2020-08-14 00:00:00	40/782	Amauta	14-08-2020	2020-08-14 00:00:00	40/783	FastEddy	53.1301842	6.47532415	aan poot plaatsnaambord Altena	Peize	Dr	\N	\N
\.


--
-- Name: fl_stag_seq_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yugabyte
--

SELECT pg_catalog.setval('public.fl_stag_seq_id_seq', 4500, true);


--
-- Name: fl_stag fl_stag_pkey; Type: CONSTRAINT; Schema: public; Owner: yugabyte
--

ALTER TABLE ONLY public.fl_stag
    ADD CONSTRAINT fl_stag_pkey PRIMARY KEY (seq_id);


--
-- PostgreSQL database dump complete
--

