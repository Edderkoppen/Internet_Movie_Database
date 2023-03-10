-- ---------------------------- --
--        BDD InternetMovies    --
-- ---------------------------- --

drop database if exists internetMovies;

create database internetMovies default character set utf8;
use internetMovies;


-- ---------------------------- --
--           CATEGORIE          --
-- ---------------------------- --
drop table if exists CATEGORIE;
create table CATEGORIE (id_categorie integer primary key auto_increment not null,
                        nom_categorie varchar(100) NOT NULL);


-- ---------------------------- --
--             FILM             --
-- ---------------------------- --
drop table if exists FILM;
create table FILM (id_film integer primary key auto_increment not null,
                    id_categorie integer not null,
                    titre varchar(100) not null,
                    film_description varchar(1000) not null,
                    image_path varchar(100),
                    prix float not null,
                    lien varchar(500) not null,
                    foreign key (id_categorie) references CATEGORIE(id_categorie));


-- ---------------------------- --
--           PRODUCTEUR         --
-- ---------------------------- --
drop table if exists PRODUCTEUR;
create table PRODUCTEUR (id_producteur integer primary key auto_increment not null,
                            nom_producteur varchar(50) not null,
                            prenom_producteur varchar(50) not null,
                            photo varchar(200) not null );


-- ---------------------------- --
--             ACTEUR           --
-- ---------------------------- --
drop table if exists ACTEUR;
create table ACTEUR (id_acteur integer primary key auto_increment not null,
                        nom_acteur varchar(50) not null,
                        prenom_acteur varchar(50) not null);


-- ---------------------------- --
--           IDENTIFIANT        --
-- ---------------------------- --
drop table if exists IDENTIFIANT;
create table IDENTIFIANT (id_identifiant integer primary key auto_increment not null,
                            nom_utilisateur varchar(100) not null,
                            mot_de_passe varchar(100) not null);


-- ---------------------------- --
--            CLIENT            --
-- ---------------------------- --
drop table if exists CLIENT;
create table CLIENT (id_client integer primary key auto_increment not null,
                        id_identifiant integer not null,
                        nom_client varchar(50) not null,
                        prenom_client varchar(50) not null,
                        adresse_email varchar(200),
                        date_naissance_client date not null,
                        foreign key (id_identifiant) references IDENTIFIANT(id_identifiant));


-- ---------------------------- --
--            CASTING           --
-- ---------------------------- --
drop table if exists CASTING;
create table CASTING (id_film integer not null,
                        id_acteur integer not null,
                        foreign key (id_film) references FILM(id_film),
                        foreign key (id_acteur) references ACTEUR(id_acteur));


-- ---------------------------- --
--             ACHETE           --
-- ---------------------------- --
drop table if exists ACHETE;
create table ACHETE (id_film integer not null,
                        id_client integer not null,
                        foreign key (id_film) references FILM(id_film),
                        foreign key (id_client) references CLIENT(id_client));


-- ---------------------------- --
--             PRODUIT          --
-- ---------------------------- --
drop table if exists PRODUIT;
create table PRODUIT (id_film integer not null,
                        id_producteur integer not null,
                        foreign key (id_film) references FILM(id_film),
                        foreign key (id_producteur) references PRODUCTEUR(id_producteur));






-- ---------------------------- --
--         DATA CATEGORIE       --
-- ---------------------------- --
insert into CATEGORIE (id_categorie, nom_categorie)
values (1, "Action"),
        (2, "Drame"),
        (3, "Comedie");


-- ---------------------------- --
--           DATA FILM          --
-- ---------------------------- --
insert into FILM (id_film, id_categorie, titre, film_description, image_path, prix, lien)
values (1, 1, "Bullet Train", "Cinq tueurs ?? gages se retrouvent dans un train ?? grande vitesse voyageant entre Tokyo et Morioka et ne faisant que tr??s peu d'arr??ts. Les cinq criminels vont d??couvrir qu'ils sont tous li??s par leur mission, se demandent qui va en sortir vivant et s'interrogent sur ce qui les attend ?? la gare d'arriv??e.", "./images/bullet_train.jpg", 13.99, "https://www.youtube.com/embed/Zahyq8X3oY4"),
        (2, 1, "007 Spectre", "Un message cryptique surgi du pass?? entra??ne James Bond dans une mission tr??s personnelle ?? Mexico puis ?? Rome, o?? il rencontre Lucia Sciarra, la tr??s belle veuve d'un c??l??bre criminel. Bond r??ussit ?? infiltrer une r??union secr??te r??v??lant une redoutable organisation baptis??e Spectre. Pendant ce temps, ?? Londres, Max Denbigh, le nouveau directeur du Centre pour la S??curit?? Nationale, remet en cause les actions de Bond et l'existence m??me du MI6, dirig?? par M.", "./images/spectre.jpg", 9.99, "https://www.youtube.com/embed/ujmoYyEyDP8"),
        (3, 1, "Uncharted", "Le chasseur de tr??sors Victor Sully Sullivan recrute Nathan Drake pour l'aider ?? r??cup??rer une fortune vieille de 500 ans amass??e par l'explorateur Ferdinand Magellan. Ce qui commence comme un cambriolage devient rapidement une course de globe-trotters pour atteindre le prix avant que l'impitoyable Santiago Moncada ne puisse mettre la main dessus.", "./images/uncharted.jpg", 9.99, "https://www.youtube.com/embed/eHp3MbsCbMg"),
        (4, 1, "Black Widow", "Lorsqu'un complot dangereux en lien avec son pass?? ressurgit, Natasha Romanoff, alias Black Widow, doit y faire face. Tandis qu'elle se fait poursuivre par une force qui ne s'arr??te devant rien, Natasha confronte des liens bris??s ainsi que les cons??quences de son pass?? en tant qu'espionne dans un temps avant qu'elle fasse partie des Avengers.", "./images/black_widow.jpg", 16.99, "https://www.youtube.com/embed/riQKcIbnRMk"),
        (5, 1, "Top Gun : Maverick", "Apr??s plus de 30 ans de service en tant que l'un des meilleurs aviateurs de la Marine, Pete Maverick Mitchell est ?? sa place, repoussant les limites en tant que pilote d'essai courageux et esquivant l'avancement de grade qui le mettrait ?? la terre. Entra??nant de jeunes dipl??m??s pour une mission sp??ciale, Maverick doit affronter les fant??mes de son pass?? et ses peurs les plus profondes, aboutissant ?? une mission qui exige le sacrifice ultime de ceux qui choisissent de la piloter.", "./images/top_gun.jpg", 14.99, "https://www.youtube.com/embed/JYaFU81-t6c"),
        (6, 1, "Thor: Love and Thunder", "Thor se lance dans un voyage diff??rent de tout ce qu'il a connu jusqu'?? pr??sent : une qu??te de paix int??rieure. Cependant, sa retraite est interrompue par Gorr le boucher des dieux, un tueur galactique qui cherche l'extinction des dieux. Pour combattre la menace, Thor fait appel ?? l'aide du roi Valkyrie, de Korg et de Jane Foster. Ensemble, ils se lancent dans une aventure cosmique d??chirante pour d??couvrir le myst??re de la vengeance du Boucher des Dieux.", "./images/thor.jpg", 16.99, "https://www.youtube.com/embed/K8iHxGiPyZk"),
        (7, 1, "Jurassic World", "Isla Nublar et son parc ont ??t?? d??truits, mais les probl??mes ne sont pas termin??s. Alors que les dinosaures se sont propag??s ?? travers le monde, les relations tendues entre le pr??sent et le pass?? alimentent de nouveaux conflits. Le fragile ??quilibre est mis ?? l'??preuve et l'avenir fait face ?? une nouvelle direction. Il est d??cid?? une fois pour toutes quelles esp??ces doivent exister sur terre.", "./images/jurassic_world.jpg", 9.99, "https://www.youtube.com/embed/8UZ6NOLR9sQ"),
        (8, 1, "Doctor Strange in the Multiverse of Madness", "Le Docteur Stephen Strange continue ses recherches sur la Pierre du Temps. Cependant, un vieil ami devenu ennemi tente de d??truire tous les sorciers de la Terre, ce qui perturbe le plan de Strange.", "./images/docteur_strange.jpg", 16.99, "https://www.youtube.com/embed/KtNV22LOT84"),
        (9, 1, "The Batman", "Dans sa deuxi??me ann??e de lutte contre le crime, le milliardaire et justicier masqu?? Batman explore la corruption qui s??vit ?? Gotham et notamment comment elle pourrait ??tre li??e ?? sa propre famille, les Wayne, ?? qui il doit toute sa fortune. En parall??le, il enqu??te sur les meurtres d'un tueur en s??rie qui se fait conna??tre sous le nom de Sphinx et s??me des ??nigmes cruelles sur son passage.", "./images/batman.jpg", 19.99, "https://www.youtube.com/embed/hGQo1axtj60"),
        (10, 1, "John Wick", "Ce qui aurait pu ??tre le banal vol d'une voiture de collection se transforme en une chasse ?? l'homme sans merci entre un l??gendaire ex-tueur ?? gages et le fils d'un des plus grands pontes de la mafia. Entre un homme qui se croit au-dessus des lois et un autre ?? qui on a pris les deux seuls souvenirs qui le rendaient encore humain, l'affrontement sera de haute vol??e. Personne n'est d??cid?? ?? rendre les armes et la guerre sera totale.", "./images/john_wick.jpg", 11.99, "https://www.youtube.com/embed/6itn_8L6-Z8"),
        (11, 1, "Lucy", "Lucy Miller est une jeune femme vivant ?? Taipei (Taiwan), dans un monde o?? les humains n'utilisent que 10 pourcent des capacit??s de leur cerveau. Prise dans un guet-apens par la mafia cor??enne, elle est contrainte de faire la mule pour des trafiquants de drogue qui ins??rent un paquet de poudre bleue dans son ventre, le CPH4, produit de synth??se exp??rimental.", "./images/lucy.jpg", 9.99, "https://www.youtube.com/embed/7gPrNpHaFX8"),
        (12, 1, "Deadpool", "Wade Wilson, un ancien militaire des forces sp??ciales, est devenu mercenaire. Apr??s avoir subi une exp??rimentation hors-norme qui va acc??l??rer ses pouvoirs de gu??rison, il va devenir Deadpool. Arm?? de ses nouvelles capacit??s et d'un humour noir survolt??, il va traquer l'homme qui a bien failli an??antir sa vie.", "./images/deadpool.jpg", 11.99, "https://www.youtube.com/embed/XWtH7anz7io"),
        (13, 2, "Athena", "Quelques heures apr??s la mort tragique de leur plus jeune fr??re dans des circonstances inexpliqu??es, la vie de la famille restante est boulevers??e. La fratrie se retrouve rapidement dans un chaos qu'elle a du mal ?? surmonter.", "./images/athena.jpg", 15.99, "https://www.youtube.com/embed/I4Fr6xokozw"),
        (14, 2, "La m??thode Williams", "Arm?? d'une vision claire et d'un plan de 78 pages, Richard Williams est d??termin?? ?? ce que ses deux filles, V??nus et Serena, ??crivent l'Histoire. S'entra??nant sur des courts de tennis ?? Compton, en Californie, Richard fa??onne l'engagement in??branlable et la vive intuition des filles. Ensemble, la famille Williams d??fie les probabilit??s apparemment insurmontables et les attentes qui se pr??sentent ?? elles.", "./images/williams.jpg", 7.99, "https://www.youtube.com/embed/wEDuTxKaMTI"),
        (15, 2, "Parasite", "Les diff??rences de classe entre une famille pauvre et une famille ais??e apparaissent au grand jour. Lorsque Ki-woo obtient un poste de tuteur chez les riches Parks, il fait en sorte que ses parents et sa soeur soient ??galement engag??s. La famille profite du mode de vie luxueux des Parks, mais ils d??couvrent alors un sombre secret. Un incident survient et la situation d??g??n??re.", "./images/parasite.jpg", 7.99, "https://www.youtube.com/embed/-Yo_lxZ6Z0k"),
        (16, 2, "Tu ne tuera point", "1945. Alors que la guerre dans le Pacifique faisait rage et que les forces am??ricaines menaient l'une des batailles les plus acharn??es du conflit sur l'??le d'Okinawa, un soldat s'est distingu??. Desmond T. Doss, un objecteur de conscience, qui bien qu'ayant fait le serment de ne jamais tuer ni toucher ?? une arme, voulut servir son pays et s'engagea dans l'infanterie. Fid??le ?? ses convictions et arm?? de son seul courage, il a sauv?? la vie de dizaines de soldats bless??s en les ramenant un par un.", "./images/tu_ne_tuera_point.jpg", 11.99, "https://www.youtube.com/embed/ckL-Rf8K__Q"),
        (17, 2, "A Star Is Born", "Star de country un peu oubli??e, Jackson Maine d??couvre Ally, une jeune chanteuse tr??s prometteuse. Tandis qu'ils tombent follement amoureux l'un de l'autre, Jack propulse Ally sur le devant de la sc??ne et fait d'elle une artiste adul??e par le public. Bient??t ??clips?? par le succ??s de la jeune femme, il vit de plus en plus de mal son propre d??clin.", "./images/a_star_is_born.jpg", 4.99, "https://www.youtube.com/embed/nSbzyEJ8X9E"),
        (18, 2, "Bohemian Rhapsody", "Le chanteur Freddie Mercury, le guitariste Brian May, le batteur Roger Taylor et le guitariste John Deacon prennent d'assaut le monde de la musique lorsqu'ils forment le groupe de rock Queen en 1970. Entour?? d'influences sombres, Mercury d??cide de quitter Queen pour poursuivre une carri??re solo. Apr??s avoir re??u un diagnostic de SIDA dans les ann??es 1980, le leader du groupe rejoint le groupe pour le concert-b??n??fice Live Aid -- menant le groupe ?? l'une des performances les plus inoubliables.", "./images/bohemian_rhapsody.jpg", 9.99, "https://www.youtube.com/embed/6S9c5nnDd_s"),
        (19, 2, "Call Me By Your Name", "??t?? 1983. Elio Perlman, 17 ans, passe ses vacances dans la villa du XVIIe si??cle que poss??de sa famille en Italie, ?? jouer de la musique classique, ?? lire et ?? flirter avec son amie Marzia. Son p??re, ??minent professeur, et sa m??re, traductrice, lui ont donn?? une excellente ??ducation. Un jour, Oliver, un s??duisant Am??ricain qui pr??pare son doctorat, vient travailler aupr??s du p??re d'Elio. Elio et Oliver vont bient??t d??couvrir l'??veil du d??sir.", "./images/by_your_name.jpg", 5.99, "https://www.youtube.com/embed/Z9AYPxH5NTM"),
        (20, 2, "Green Book : Sur les routes du Sud", "En 1962, alors que r??gne la s??gr??gation, Tony Lip, un videur italo-am??ricain du Bronx, est engag?? pour conduire et prot??ger le Dr Don Shirley, un pianiste noir de renomm??e mondiale, lors d'une tourn??e de concerts. Durant leur p??riple de Manhattan jusqu'au Sud profond, ils doivent se confronter aux humiliations, perceptions et pers??cutions, tout en devant trouver des ??tablissements accueillant les personnes de couleurs.", "./images/green_book.jpg", 8.99, "https://www.youtube.com/embed/q1D0oB6-IfQ"),
        (21, 2, "Gatsby le magnifique", "Printemps 1922. L'??poque est propice au rel??chement des m??urs, ?? l'essor du jazz et ?? l'enrichissement des contrebandiers d'alcool... Apprenti ??crivain, Nick Carraway quitte la r??gion du Middle-West pour s'installer ?? New York. Voulant sa part du r??ve am??ricain, il vit d??sormais entour?? d'un myst??rieux millionnaire, Jay Gatsby, qui s'??tourdit en f??tes mondaines, et de sa cousine Daisy et de son mari volage, Tom Buchanan, issu de sang noble.", "./images/gatsby.jpg", 4.99, "https://www.youtube.com/embed/3DZBGR0vP8I"),
        (22, 2, "Django Unchained", "Deux ans avant la Guerre civile, un ancien esclave du nom de Django s'associe avec un chasseur de primes d'origine allemande qui l'a lib??r??: il accepte de traquer avec lui des criminels recherch??s. En ??change, il l'aidera ?? retrouver sa femme perdue depuis longtemps et esclave elle aussi.", "./images/django.jpg", 5.99, "https://www.youtube.com/embed/K2XjgsfzDrU"),
        (23, 2, "L'Etrange Histoire de Benjamin Button", "'Curieux destin que le mien'. Ainsi commence l'??trange histoire de Benjamin Button, cet homme qui naquit ?? 80 ans et v??cut sa vie ?? l'envers, sans pouvoir arr??ter le cours du temps. Situ?? ?? La Nouvelle-Orl??ans et adapt?? d'une nouvelle de F. Scott Fitzgerald, le film suit ses tribulations de 1918 ?? nos jours.", "./images/benjamin_button.jpg", 4.99, "https://www.youtube.com/embed/dDyJ4pSxC20"),
        (24, 2, "Into the wild", "Tout juste dipl??m??, Christopher McCandless, 22 ans, est promis ?? un brillant avenir. Pourtant, tournant le dos ?? l'existence confortable et sans surprise qui l'attend, le jeune homme d??cide de prendre la route en laissant tout derri??re lui. Des champs de bl?? du Dakota aux flots tumultueux du Colorado, en passant par les communaut??s hippies de Californie, Christopher va rencontrer des personnages hauts en couleur. Chacun, ?? sa mani??re, va fa??onner sa vision de la vie et des autres.", "./images/into_the_wild.jpg", 13.99, "https://www.youtube.com/embed/wRLMEEFEf1M");


-- ---------------------------- --
--        DATA PRODUCTEUR       --
-- ---------------------------- --
insert into PRODUCTEUR (id_producteur, nom_producteur, prenom_producteur, photo)
values (1, "Leitch", "David", "./images/producteurs/david_leitch.jpeg"), -- bullet / john wick
        (2, "Broccoli", "Barbara", "./images/producteurs/barbara_broccoli.jpg"), -- spectre
        (3, "G. Wilson", "Michael", "./images/producteurs/michael_g_wilson.jpeg"), -- spectre
        (4, "Arad", "Avi", "./images/producteurs/avi_arad.jpeg"), -- uncharted
        (5, "Roven", "Charles", "./images/producteurs/charles_roven.jpeg"), -- uncharted
        (6, "Feige", "Kevin", "./images/producteurs/kevin_feige.jpg"), -- black window / thor
        (7, "Cruise", "Tom", "./images/producteurs/tom_cruise.jpg"), -- Top gun
        (8, "McQuarrie", "Christopher", "./images/producteurs/christopher_mcquarrie.jpeg"), -- top gun
        (9, "Marshall", "Frank", "./images/producteurs/frank_marshall.jpeg"), -- jurassic
        (10, "Raimi", "Sam", "./images/producteurs/sam_raimi.jpeg"), -- doctor strange
        (11, "Reeves", "Matt", "./images/producteurs/matt_reeves.jpeg"), -- the batman
        (12, "Stahelski", "Chad", "./images/producteurs/chad_stahelski.jpeg"), -- john wick
        (13, "Longoria", "Eva", "./images/producteurs/eva_longoria.jpg"), -- john wick
        (14, "Besson-Silla", "Virginie", "./images/producteurs/virginie_besson_silla.jpeg"), -- lucy
        (15, "Reynolds", "Ryan", "./images/producteurs/ryan_reynolds.jpg"), -- deadpool
        (16, "Shuler Donner", "Lauren", "./images/producteurs/lauren_shuler_donner.jpeg"), -- deadpool
        (17, "Duhamel", "Jean", "./images/producteurs/jean_duhamel.jpg"), -- athena
        (18, "Smith", "Will", "./images/producteurs/will_smith.jpg"), -- la methode williams
        (19, "Joon-ho", "Bong", "./images/producteurs/bong_joon_ho.jpg"), -- parasite
        (20, "Benedict", "Terry", "./images/producteurs/terry_benedict.jpg"), -- tu ne tuera point
        (21, "Mechanic", "Bill", "./images/producteurs/bill_mechanic.jpeg"), -- tu ne tuera point
        (22, "Permut", "Davey", "./images/producteurs/david_permut.jpeg"), -- tu ne tuera point
        (23, "Cooper", "Bradley", "./images/producteurs/bradley_cooper.jpeg"), -- a star is born
        (24, "Howell", "Lynette", "./images/producteurs/lynette_howell.jpeg"), -- a star is born
        (25, "Singer", "Bryan", "./images/producteurs/bryan_singer.jpg"), -- rhapsody
        (26, "De Niro", "Robert", "./images/producteurs/robert_de_niro.jpeg"), -- rhapsody
        (27, "Guadagnino", "Lucas", "./images/producteurs/lucas_guadagnino.jpeg"), -- call me by
        (28, "Ivory", "james", "./images/producteurs/james_ivory.jpeg"), -- call me by
        (29, "Vallelonga", "Nick", "./images/producteurs/nick_vallelonga.jpeg"), -- green book
        (30, "Farrely", "Peter", "./images/producteurs/peter_farrely.jpeg"), -- green book
        (31, "Luhrmann", "Baz", "./images/producteurs/baz_luhrmann.jpeg"), -- gatsby
        (32, "Tarantino", "Quentin", "./images/producteurs/quentin_tarantino.jpg"), -- django
        (33, "Fincher", "David", "./images/producteurs/david_fincher.jpeg"), -- benjamin
        (34, "Penn", "Sean", "./images/producteurs/sean_penn.jpeg"); -- into the wild


-- ---------------------------- --
--          DATA ACTEUR         --
-- ---------------------------- --
insert into ACTEUR (id_acteur, nom_acteur, prenom_acteur)
values (1, "Taylor-Johnson", "Aaron"), -- bullet 
        (2, "Pitt", "Brad"), -- bullet / benjamin button
        (3, "King", "Joey"), -- bullet
        (4, "Craig", "Daniel"), -- spectre
        (5, "Seydoux", "L??a"), -- spectre
        (6, "Holland", "Tom"), -- uncharted
        (7, "Wahlberg", "Mark"), -- uncharted
        (8, "Gabrielle", "Tati"), -- uncharted
        (9, "Johansson", "Scarlet"), -- black widow / lucy
        (10, "Pugh", "Florence"), -- black widow
        (11, "Cruise", "Tom"), -- top gun
        (12, "Teller", "Miles"), -- top gun
        (13, "Bale", "Christian"), -- thor
        (14, "Hemsworth", "Chris"), -- thor
        (15, "Portman", "Natalie"), -- thor
        (16, "Dallas Howard", "Bryce"), -- jurassic
        (17, "Pratt", "Chris"), -- jurassic
        (18, "Cumberbatch", "Benedict"), -- doctor strange
        (19, "Pattinson", "Robert"), -- batman
        (20, "Kravitz", "Zo??"), -- batman
        (21, "Reeves", "Keanu"), -- john wick
        (22, "Freeman", "Morgan"), -- lucy
        (23, "Reynolds", "Ryan"), -- deadpool
        (24, "Baccarin", "Morena"), -- deadpool
        (25, "Benssalah", "Dali"), -- athena
        (26, "Smith", "Will"), -- la methode williams
        (27, "Yeo-jeong", "Cho"), -- parasite
        (28, "So-dam", "Park"), -- parasite
        (29, "Woo-shik", "Choi"), -- parasite
        (30, "Garfield", "Andrew"), -- tu en tuera
        (31, "Cooper", "Bradley"), -- a star is born
        (32, "Gaga", "Lady"), -- a start is born
        (33, "Malek", "Rami"), -- rhapsody
        (34, "Chalamet", "Timoth??e"), -- call me by
        (35, "Hammer", "Armie"), -- call me by
        (36, "Mortensen", "Vigo"), -- green book
        (37, "Mashershala", "Ali"), -- green book / benjamin button
        (38, "DiCaprio", "Leonardo"), -- gatsby / django
        (39, "Maguire", "Tobey"), -- gatsby
        (40, "Waltz", "Christoph"), -- django / spectre
        (41, "Foxx", "Jamie"), -- django
        (42, "L. Jackson", "Samuel"), -- django
        (43, "Blanchett", "Cate"), -- benjamin button
        (44, "Hirsch", "Emile"), -- into the wild
        (45, "Stewart", "Kristen"), -- into the wild
        (46, "Vaughn", "Vince"); -- into the wild / tu ne tuera


-- ---------------------------- --
--        DATA IDENTIFIANT      --
-- ---------------------------- --
insert into IDENTIFIANT(id_identifiant, nom_utilisateur, mot_de_passe) 
values (1, "Mathieu", "1234"),
        (2, "Ryan", "1234");


-- ---------------------------- --
--          DATA CLIENT         --
-- ---------------------------- --
insert into CLIENT(id_client, id_identifiant, nom_client, prenom_client, adresse_email, date_naissance_client)
values (1, 1, "Cartron", "Mathieu", "mathieu.cartron@gmail.com", "1997-04-06"),
        (2, 2, "Ellama", "Ryan", "ryan.ellama@gmail.com", "2001-09-12");


-- ---------------------------- --
--          DATA CASTING        --
-- ---------------------------- --
insert into CASTING(id_film, id_acteur)
values (1, 1),
        (1, 2),
        (1, 3),
        (2, 4),
        (2, 5),
        (2, 40),
        (3, 6),
        (3, 7),
        (3, 8),
        (4, 9),
        (4, 10),
        (5, 11),
        (5, 12),
        (6, 13),
        (6, 14),
        (6, 15),
        (7, 16),
        (7, 17),
        (8, 18),
        (9, 19),
        (9, 20),
        (10, 21),
        (11, 22),
        (11, 9),
        (12, 23),
        (12, 24),
        (13, 25),
        (14, 26),
        (15, 27),
        (15, 28),
        (15, 29),
        (16, 30),
        (16, 46),
        (17, 31),
        (17, 32),
        (18, 33),
        (19, 34),
        (19, 35),
        (20, 36),
        (20, 37),
        (21, 38),
        (21, 39),
        (22, 38),
        (22, 40),
        (22, 41),
        (22, 42),
        (23, 43),
        (23, 37),
        (23, 2),
        (24, 44),
        (24, 45),
        (24, 46);


-- ---------------------------- --
--         DATA ACHETE          --
-- ---------------------------- --
insert into ACHETE(id_film, id_client)
values (20, 1),
        (24, 1),
        (3, 1),
        (2, 1),
        (5, 1),
        (15, 1),
        (17, 2),
        (6, 2),
        (1, 2),
        (12, 2);


-- ---------------------------- --
--         DATA PRODUIT         --
-- ---------------------------- --
insert into PRODUIT(id_film, id_producteur)
values (1, 1),
        (2, 2),
        (2, 3),
        (3, 4),
        (3, 5),
        (4, 6),
        (5, 7),
        (5, 8),
        (6, 6),
        (7, 9),
        (8, 10),
        (9, 11),
        (10, 1),
        (10, 12),
        (10, 13),
        (11, 14),
        (12, 15),
        (12, 16),
        (13, 17),
        (14, 18),
        (15, 19),
        (16, 20),
        (16, 21),
        (16, 22),
        (17, 23),
        (17, 24),
        (18, 25),
        (18, 26),
        (19, 27),
        (19, 28),
        (20, 29),
        (20, 30),
        (21, 31),
        (22, 32),
        (23, 33),
        (24, 34);