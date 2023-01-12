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
                    foreign key (id_categorie) references CATEGORIE(id_categorie));


-- ---------------------------- --
--           PRODUCTEUR         --
-- ---------------------------- --
drop table if exists PRODUCTEUR;
create table PRODUCTEUR (id_producteur integer primary key auto_increment not null,
                            nom_producteur varchar(50) not null,
                            prenom_producteur varchar(50) not null);


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
insert into FILM (id_film, id_categorie, titre, film_description, image_path, prix)
values (1, 1, "Bullet Train", "Cinq tueurs à gages se retrouvent dans un train à grande vitesse voyageant entre Tokyo et Morioka et ne faisant que très peu d'arrêts. Les cinq criminels vont découvrir qu'ils sont tous liés par leur mission, se demandent qui va en sortir vivant et s'interrogent sur ce qui les attend à la gare d'arrivée.", "images/bullet_train.jpg", 13.99),
        (2, 1, "007 Spectre", "Un message cryptique surgi du passé entraîne James Bond dans une mission très personnelle à Mexico puis à Rome, où il rencontre Lucia Sciarra, la très belle veuve d'un célèbre criminel. Bond réussit à infiltrer une réunion secrète révélant une redoutable organisation baptisée Spectre. Pendant ce temps, à Londres, Max Denbigh, le nouveau directeur du Centre pour la Sécurité Nationale, remet en cause les actions de Bond et l'existence même du MI6, dirigé par M.", "images/spectre.jpg", 9.99),
        (3, 1, "Uncharted", "Le chasseur de trésors Victor Sully Sullivan recrute Nathan Drake pour l'aider à récupérer une fortune vieille de 500 ans amassée par l'explorateur Ferdinand Magellan. Ce qui commence comme un cambriolage devient rapidement une course de globe-trotters pour atteindre le prix avant que l'impitoyable Santiago Moncada ne puisse mettre la main dessus.", "images/uncharted.jpg", 9.99),
        (4, 1, "Black Widow", "Lorsqu'un complot dangereux en lien avec son passé ressurgit, Natasha Romanoff, alias Black Widow, doit y faire face. Tandis qu'elle se fait poursuivre par une force qui ne s'arrête devant rien, Natasha confronte des liens brisés ainsi que les conséquences de son passé en tant qu'espionne dans un temps avant qu'elle fasse partie des Avengers.", "images/black_widow.jpg", 16.99),
        (5, 1, "Top Gun : Maverick", "Après plus de 30 ans de service en tant que l'un des meilleurs aviateurs de la Marine, Pete Maverick Mitchell est à sa place, repoussant les limites en tant que pilote d'essai courageux et esquivant l'avancement de grade qui le mettrait à la terre. Entraînant de jeunes diplômés pour une mission spéciale, Maverick doit affronter les fantômes de son passé et ses peurs les plus profondes, aboutissant à une mission qui exige le sacrifice ultime de ceux qui choisissent de la piloter.", "images/top_gun.jpg", 14.99),
        (6, 1, "Thor: Love and Thunder", "Thor se lance dans un voyage différent de tout ce qu'il a connu jusqu'à présent : une quête de paix intérieure. Cependant, sa retraite est interrompue par Gorr le boucher des dieux, un tueur galactique qui cherche l'extinction des dieux. Pour combattre la menace, Thor fait appel à l'aide du roi Valkyrie, de Korg et de Jane Foster. Ensemble, ils se lancent dans une aventure cosmique déchirante pour découvrir le mystère de la vengeance du Boucher des Dieux.", "images/thor.jpg", 16.99),
        (7, 1, "Jurassic World : Le monde d'après", "Isla Nublar et son parc ont été détruits, mais les problèmes ne sont pas terminés. Alors que les dinosaures se sont propagés à travers le monde, les relations tendues entre le présent et le passé alimentent de nouveaux conflits. Le fragile équilibre est mis à l'épreuve et l'avenir fait face à une nouvelle direction. Il est décidé une fois pour toutes quelles espèces doivent exister sur terre.", "images/jurassic_world.jpg", 9.99),
        (8, 1, "Doctor Strange in the Multiverse of Madness", "Le Docteur Stephen Strange continue ses recherches sur la Pierre du Temps. Cependant, un vieil ami devenu ennemi tente de détruire tous les sorciers de la Terre, ce qui perturbe le plan de Strange.", "images/docteur_strange.jpg", 16.99),
        (9, 1, "The Batman", "Dans sa deuxième année de lutte contre le crime, le milliardaire et justicier masqué Batman explore la corruption qui sévit à Gotham et notamment comment elle pourrait être liée à sa propre famille, les Wayne, à qui il doit toute sa fortune. En parallèle, il enquête sur les meurtres d'un tueur en série qui se fait connaître sous le nom de Sphinx et sème des énigmes cruelles sur son passage.", "images/batman.jpg", 19.99),
        (10, 1, "John Wick", "Ce qui aurait pu être le banal vol d'une voiture de collection se transforme en une chasse à l'homme sans merci entre un légendaire ex-tueur à gages et le fils d'un des plus grands pontes de la mafia. Entre un homme qui se croit au-dessus des lois et un autre à qui on a pris les deux seuls souvenirs qui le rendaient encore humain, l'affrontement sera de haute volée. Personne n'est décidé à rendre les armes et la guerre sera totale.", "images/john_wick.jpg", 11.99),
        (11, 1, "Lucy", "Lucy Miller est une jeune femme vivant à Taipei (Taiwan), dans un monde où les humains n'utilisent que 10 pourcent des capacités de leur cerveau. Prise dans un guet-apens par la mafia coréenne, elle est contrainte de faire la mule pour des trafiquants de drogue qui insèrent un paquet de poudre bleue dans son ventre, le CPH4, produit de synthèse expérimental.", "images/lucy.jpg", 9.99),
        (12, 1, "Deadpool", "Wade Wilson, un ancien militaire des forces spéciales, est devenu mercenaire. Après avoir subi une expérimentation hors-norme qui va accélérer ses pouvoirs de guérison, il va devenir Deadpool. Armé de ses nouvelles capacités et d'un humour noir survolté, il va traquer l'homme qui a bien failli anéantir sa vie.", "images/deadpool.jpg", 11.99),
        (13, 2, "Athena", "Quelques heures après la mort tragique de leur plus jeune frère dans des circonstances inexpliquées, la vie de la famille restante est bouleversée. La fratrie se retrouve rapidement dans un chaos qu'elle a du mal à surmonter.", "images/athena.jpg", 15.99),
        (14, 2, "La méthode Williams", "Armé d'une vision claire et d'un plan de 78 pages, Richard Williams est déterminé à ce que ses deux filles, Vénus et Serena, écrivent l'Histoire. S'entraînant sur des courts de tennis à Compton, en Californie, Richard façonne l'engagement inébranlable et la vive intuition des filles. Ensemble, la famille Williams défie les probabilités apparemment insurmontables et les attentes qui se présentent à elles.", "images/williams.jpg", 7.99),
        (15, 2, "Parasite", "Les différences de classe entre une famille pauvre et une famille aisée apparaissent au grand jour. Lorsque Ki-woo obtient un poste de tuteur chez les riches Parks, il fait en sorte que ses parents et sa soeur soient également engagés. La famille profite du mode de vie luxueux des Parks, mais ils découvrent alors un sombre secret. Un incident survient et la situation dégénère.", "images/parasite.jpg", 7.99),
        (16, 2, "Tu ne tuera point", "1945. Alors que la guerre dans le Pacifique faisait rage et que les forces américaines menaient l'une des batailles les plus acharnées du conflit sur l'île d'Okinawa, un soldat s'est distingué. Desmond T. Doss, un objecteur de conscience, qui bien qu'ayant fait le serment de ne jamais tuer ni toucher à une arme, voulut servir son pays et s'engagea dans l'infanterie. Fidèle à ses convictions et armé de son seul courage, il a sauvé la vie de dizaines de soldats blessés en les ramenant un par un.", "images/tu_ne_tuera_point.jpg", 11.99),
        (17, 2, "A Star Is Born", "Star de country un peu oubliée, Jackson Maine découvre Ally, une jeune chanteuse très prometteuse. Tandis qu'ils tombent follement amoureux l'un de l'autre, Jack propulse Ally sur le devant de la scène et fait d'elle une artiste adulée par le public. Bientôt éclipsé par le succès de la jeune femme, il vit de plus en plus de mal son propre déclin.", "images/a_star_is_born.jpg", 4.99),
        (18, 2, "Bohemian Rhapsody", "Le chanteur Freddie Mercury, le guitariste Brian May, le batteur Roger Taylor et le guitariste John Deacon prennent d'assaut le monde de la musique lorsqu'ils forment le groupe de rock Queen en 1970. Entouré d'influences sombres, Mercury décide de quitter Queen pour poursuivre une carrière solo. Après avoir reçu un diagnostic de SIDA dans les années 1980, le leader du groupe rejoint le groupe pour le concert-bénéfice Live Aid -- menant le groupe à l'une des performances les plus inoubliables.", "images/bohemian_rhapsody.jpg", 9.99),
        (19, 2, "Call Me By Your Name", "Été 1983. Elio Perlman, 17 ans, passe ses vacances dans la villa du XVIIe siècle que possède sa famille en Italie, à jouer de la musique classique, à lire et à flirter avec son amie Marzia. Son père, éminent professeur, et sa mère, traductrice, lui ont donné une excellente éducation. Un jour, Oliver, un séduisant Américain qui prépare son doctorat, vient travailler auprès du père d'Elio. Elio et Oliver vont bientôt découvrir l'éveil du désir.", "images/by_your_name.jpg", 5.99),
        (20, 2, "Green Book : Sur les routes du Sud", "En 1962, alors que règne la ségrégation, Tony Lip, un videur italo-américain du Bronx, est engagé pour conduire et protéger le Dr Don Shirley, un pianiste noir de renommée mondiale, lors d'une tournée de concerts. Durant leur périple de Manhattan jusqu'au Sud profond, ils doivent se confronter aux humiliations, perceptions et persécutions, tout en devant trouver des établissements accueillant les personnes de couleurs.", "images/green_book.jpg", 8.99),
        (21, 2, "Gatsby le magnifique", "Printemps 1922. L'époque est propice au relâchement des mœurs, à l'essor du jazz et à l'enrichissement des contrebandiers d'alcool... Apprenti écrivain, Nick Carraway quitte la région du Middle-West pour s'installer à New York. Voulant sa part du rêve américain, il vit désormais entouré d'un mystérieux millionnaire, Jay Gatsby, qui s'étourdit en fêtes mondaines, et de sa cousine Daisy et de son mari volage, Tom Buchanan, issu de sang noble.", "images/gatsby.jpg", 4.99),
        (22, 2, "Django Unchained", "Deux ans avant la Guerre civile, un ancien esclave du nom de Django s'associe avec un chasseur de primes d'origine allemande qui l'a libéré: il accepte de traquer avec lui des criminels recherchés. En échange, il l'aidera à retrouver sa femme perdue depuis longtemps et esclave elle aussi.", "images/django.jpg", 5.99),
        (23, 2, "L'Etrange Histoire de Benjamin Button", "'Curieux destin que le mien'. Ainsi commence l'étrange histoire de Benjamin Button, cet homme qui naquit à 80 ans et vécut sa vie à l'envers, sans pouvoir arrêter le cours du temps. Situé à La Nouvelle-Orléans et adapté d'une nouvelle de F. Scott Fitzgerald, le film suit ses tribulations de 1918 à nos jours.", "images/benjamin_button.jpg", 4.99),
        (24, 2, "Into the wild", "Tout juste diplômé, Christopher McCandless, 22 ans, est promis à un brillant avenir. Pourtant, tournant le dos à l'existence confortable et sans surprise qui l'attend, le jeune homme décide de prendre la route en laissant tout derrière lui. Des champs de blé du Dakota aux flots tumultueux du Colorado, en passant par les communautés hippies de Californie, Christopher va rencontrer des personnages hauts en couleur. Chacun, à sa manière, va façonner sa vision de la vie et des autres.", "images/into_the_wild.jpg", 13.99);


-- ---------------------------- --
--        DATA PRODUCTEUR       --
-- ---------------------------- --
insert into PRODUCTEUR (id_producteur, nom_producteur, prenom_producteur)
values (1, "Leitch", "David"), -- bullet / john wick
        (2, "Broccoli", "Barbara"), -- spectre
        (3, "G. Wilson", "Michael"), -- spectre
        (4, "Arad", "Avi"), -- uncharted
        (5, "Roven", "Charles"), -- uncharted
        (6, "Feige", "Kevin"), -- black window / thor
        (7, "Cruise", "Tom"), -- Top gun
        (8, "McQuarrie", "Christopher"), -- top gun
        (9, "Marshall", "Frank"), -- jurassic
        (10, "Raimi", "Sam"), -- doctor strange
        (11, "Reeves", "Matt"), -- the batman
        (12, "Stahelski", "Chad"), -- john wick
        (13, "Longoria", "Eva"), -- john wick
        (14, "Besson-Silla", "Virginie"), -- lucy
        (15, "Reynolds", "Ryan"), -- deadpool
        (16, "Shuler Donner", "Lauren"), -- deadpool
        (17, "Duhamel", "Jean"), -- athena
        (18, "Smith", "Will"), -- la methode williams
        (19, "Joon-ho", "Bong"), -- parasite
        (20, "Benedict", "Terry"), -- tu ne tuera point
        (21, "Mechanic", "Bill"), -- tu ne tuera point
        (22, "Permut", "Davey"), -- tu ne tuera point
        (23, "Cooper", "Bradley"), -- a star is born
        (24, "Howell", "Lynette"), -- a star is born
        (25, "Singer", "Bryan"), -- rhapsody
        (26, "De Niro", "Robert"), -- rhapsody
        (27, "Guadagnino", "Luca"), -- call me by
        (28, "Ivory", "james"), -- call me by
        (29, "Vallelonga", "Nick"), -- green book
        (30, "Farrelly", "Peter"), -- green book
        (31, "Luhrmann", "Baz"), -- gatsby
        (32, "Tarantino", "Quentin"), -- django
        (33, "Fincher", "David"), -- benjamin
        (34, "Penn", "Sean"); -- into the wild


-- ---------------------------- --
--          DATA ACTEUR         --
-- ---------------------------- --
insert into ACTEUR (id_acteur, nom_acteur, prenom_acteur)
values (1, "Taylor-Johnson", "Aaron"), -- bullet 
        (2, "Pitt", "Brad"), -- bullet / benjamin button
        (3, "King", "Joey"), -- bullet
        (4, "Craig", "Daniel"), -- spectre
        (5, "Seydoux", "Léa"), -- spectre
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
        (20, "Kravitz", "Zoë"), -- batman
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
        (34, "Chalamet", "Timothée"), -- call me by
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