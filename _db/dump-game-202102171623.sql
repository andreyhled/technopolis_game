PGDMP                         y            game    12.5    12.5 (    c           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            d           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            e           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            f           1262    16385    game    DATABASE     v   CREATE DATABASE game WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE game;
                game    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                postgres    false            g           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   postgres    false    4            �            1259    24611    game    TABLE     �   CREATE TABLE public.game (
    id integer NOT NULL,
    player bigint NOT NULL,
    question bigint NOT NULL,
    score interval(0) NOT NULL,
    time_start time(0) without time zone NOT NULL
);
    DROP TABLE public.game;
       public         heap    game    false    4            �            1259    24609    game_id_seq    SEQUENCE     �   CREATE SEQUENCE public.game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.game_id_seq;
       public          game    false    4    215            h           0    0    game_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.game_id_seq OWNED BY public.game.id;
          public          game    false    214            �            1259    17397    points    TABLE     �   CREATE TABLE public.points (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    geom public.geometry(Point,4326)
);
    DROP TABLE public.points;
       public         heap    game    false    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4            �            1259    17395    points_id_seq    SEQUENCE     �   CREATE SEQUENCE public.points_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.points_id_seq;
       public          game    false    209    4            i           0    0    points_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.points_id_seq OWNED BY public.points.id;
          public          game    false    208            �            1259    24581 	   questions    TABLE     n  CREATE TABLE public.questions (
    id integer NOT NULL,
    question text NOT NULL,
    answer1 character varying(100) NOT NULL,
    answer2 character varying(100) NOT NULL,
    answer3 character varying(100) NOT NULL,
    answer4 character varying(100) NOT NULL,
    correct_answer character(1) NOT NULL,
    linked_point bigint NOT NULL,
    next_point bigint
);
    DROP TABLE public.questions;
       public         heap    game    false    4            �            1259    24579    questions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.questions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.questions_id_seq;
       public          game    false    4    211            j           0    0    questions_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.questions_id_seq OWNED BY public.questions.id;
          public          game    false    210            �            1259    24603    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    password character varying(20) NOT NULL,
    full_name character varying(100)
);
    DROP TABLE public.users;
       public         heap    game    false    4            �            1259    24601    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          game    false    213    4            k           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          game    false    212            �           2604    24614    game id    DEFAULT     b   ALTER TABLE ONLY public.game ALTER COLUMN id SET DEFAULT nextval('public.game_id_seq'::regclass);
 6   ALTER TABLE public.game ALTER COLUMN id DROP DEFAULT;
       public          game    false    215    214    215            �           2604    17400 	   points id    DEFAULT     f   ALTER TABLE ONLY public.points ALTER COLUMN id SET DEFAULT nextval('public.points_id_seq'::regclass);
 8   ALTER TABLE public.points ALTER COLUMN id DROP DEFAULT;
       public          game    false    208    209    209            �           2604    24584    questions id    DEFAULT     l   ALTER TABLE ONLY public.questions ALTER COLUMN id SET DEFAULT nextval('public.questions_id_seq'::regclass);
 ;   ALTER TABLE public.questions ALTER COLUMN id DROP DEFAULT;
       public          game    false    210    211    211            �           2604    24606    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          game    false    213    212    213            `          0    24611    game 
   TABLE DATA           G   COPY public.game (id, player, question, score, time_start) FROM stdin;
    public          game    false    215            Z          0    17397    points 
   TABLE DATA           0   COPY public.points (id, name, geom) FROM stdin;
    public          game    false    209            \          0    24581 	   questions 
   TABLE DATA              COPY public.questions (id, question, answer1, answer2, answer3, answer4, correct_answer, linked_point, next_point) FROM stdin;
    public          game    false    211            �          0    16691    spatial_ref_sys 
   TABLE DATA           X   COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
    public          game    false    204            ^          0    24603    users 
   TABLE DATA           >   COPY public.users (id, name, password, full_name) FROM stdin;
    public          game    false    213            l           0    0    game_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.game_id_seq', 1, false);
          public          game    false    214            m           0    0    points_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.points_id_seq', 6, true);
          public          game    false    208            n           0    0    questions_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.questions_id_seq', 2, true);
          public          game    false    210            o           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 1, false);
          public          game    false    212            �           2606    24616    game game_pk 
   CONSTRAINT     J   ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_pk PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.game DROP CONSTRAINT game_pk;
       public            game    false    215            �           2606    17423    points points_pk 
   CONSTRAINT     N   ALTER TABLE ONLY public.points
    ADD CONSTRAINT points_pk PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.points DROP CONSTRAINT points_pk;
       public            game    false    209            �           2606    24589    questions questions_pk 
   CONSTRAINT     T   ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pk PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.questions DROP CONSTRAINT questions_pk;
       public            game    false    211            �           2606    24608    users users_pk 
   CONSTRAINT     L   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pk;
       public            game    false    213            �           1259    24600    points_geom_idx    INDEX     A   CREATE INDEX points_geom_idx ON public.points USING gist (geom);
 #   DROP INDEX public.points_geom_idx;
       public            game    false    209    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4    4            �           2606    24617    game game_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_fk FOREIGN KEY (question) REFERENCES public.questions(id) ON DELETE SET NULL;
 6   ALTER TABLE ONLY public.game DROP CONSTRAINT game_fk;
       public          game    false    211    4301    215            �           2606    24622    game game_fk_1    FK CONSTRAINT        ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_fk_1 FOREIGN KEY (player) REFERENCES public.users(id) ON DELETE SET NULL;
 8   ALTER TABLE ONLY public.game DROP CONSTRAINT game_fk_1;
       public          game    false    213    4303    215            �           2606    24590    questions questions_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_fk FOREIGN KEY (linked_point) REFERENCES public.points(id) ON UPDATE SET NULL ON DELETE SET NULL;
 @   ALTER TABLE ONLY public.questions DROP CONSTRAINT questions_fk;
       public          game    false    4299    211    209            �           2606    24595    questions questions_fk_next    FK CONSTRAINT     �   ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_fk_next FOREIGN KEY (next_point) REFERENCES public.points(id) ON UPDATE SET NULL ON DELETE SET NULL;
 E   ALTER TABLE ONLY public.questions DROP CONSTRAINT questions_fk_next;
       public          game    false    209    211    4299            `      x������ � �      Z     x�m�MJ�0�u{��@&���,��Sx_��� ��Ѕ��ey����z��<�i��&��~�g"*~�}���5�»|�<�gY��aS�(����𘈬M�B�JA�����
j����<���7�3>�h	D�@a�FC�J㏚���s����x�+�Ҙ���A�b�K�$3#����ϛB���׿�T�t�����v�I��!��'��Wh�8��_H+��.z�i�RIZrA��'e[��Ҩ�',ߔ�y��
N`���s6FҠS�jg�����o�۬�      \   J   x�3�0�¾�/6\�w�QA���¼�M6]�z�	�c��1V@�pqrq�fD�Y�F3����� L�P�      �      x������ � �      ^      x������ � �     