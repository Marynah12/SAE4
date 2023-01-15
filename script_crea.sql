DROP TABLE IF EXISTS Auteurs ;
CREATE TABLE Auteurs (
Auteur_Id SERIAL PRIMARY KEY NOT NULL,
auteur_nom TEXT,
auteur_pnom TEXT,
auteur_maxime text,
auteur_A_Propos text,
Auteur_dateNai DATE);

insert into Auteurs(auteur_nom, auteur_pnom, auteur_maxime, auteur_A_Propos,Auteur_dateNai) values 
('Fermla', 'Inconnu', 'Heureux ou malheureux, riche ou pauvre. Le plus important c est de créer',
'C est au début des années 2000, vers 2003-2004, que Fermla découvre l art du graffiti, dans un premier temps, sur les façades de sa ville puis sur les voies ferrées du RER. Quelques années plus tard, en 2007, il réalise son premier graffiti sur un mur. Il découvre ainsi la sensation de liberté et l adrénaline, qui le font instantanément tomber sous le charme de cet art. Muni de ses bombes de peinture, il pratique cette discipline pendant plusieurs années, principalement illégalement. Peu à peu, Fermla s ouvre à d autres supports et techniques. Tout naturellement, il s essaye donc à la toile et à l acrylique. Il expérimente ainsi une nouvelle façon de créer, sans stress, sur différents supports et en pouvant prendre tout le temps nécessaire. Ses nouvelles perspectives ont permis à Fermla de remettre en question la place du graffiti dans le monde de l art.',
'01-01-1991');
('Miller', 'Jean', 'Les erreurs ont presque toujours un caractère sacré. N essaye jamais de les corriger.',
'Née dans une famille d artistes, Jen MILLER s est familiarisée très tôt avec l art sous toutes ses formes.Grâce à de nombreux voyages et au soutien de ses parents, elle découvre le street art et l impact d une œuvre laissée à la portée de tous.',
'01-01-1985');
('Dashone', 'Inconnu', 'Puisque tout est gris ici, je n ai pas trouvé d autre moyen que d inonder mon quotidien de couleurs ... et comme disait Picasso, quand je n ai pas de bleu, je mets du rouge',
'Dès son plus jeune âge, DASHone se passionne pour l’art. Enfant à la fois réservé et révolté, il se laisse séduire par le mouvement hip-hop. Sa musique, sa danse, ses valeurs et ses codes résonnent en lui et poussent le pré-adolescent à s’intéresser à l’art urbain. Ainsi, à seulement 13 et 14 ans, il s’entraîne déjà sur les murs de la ville de Nancy. En grandissant, DASHone s’oriente vers d’autres supports et d’autres formats. Il fait également de son art, son métier, puisqu’il travaille comme animateur jeunesse et réalise, avec eux, de nombreux projets artistiques.',
'07-30-1979');
('Istraille', 'Inconnu', 'Créez un pont entre le graffiti et l art traditionnel, en les unifiant pour un voyage coloré !',
'C’est à l’âge de 17 ans qu’Istraille débute son apprentissage du dessin, avant de se lancer dans la pratique du graffiti, deux ans plus tard. Autodidacte, il se forme aux techniques graphiques sur le bloc de dessin pour ensuite étendre son art aux surfaces murales des villes. À force de travail, il réussi le concours d’entrée à l’École Pivaut, école supérieure privée des arts appliqués à Nantes, d’où il sort diplômé en 2007. Il commence alors une carrière de directeur artistique et d’illustrateur freelance à Nantes, puis à Saint-Étienne, avant de s’installer dans la ville de Toulouse en 2015. Parallèlement, Istraille poursuit le développement de sa production artistique personnelle.',
'01-01-1982');
('Fifel', 'Inconnu', 'No pain, no gain', 'Passionné par l univers des super-héros, par Marvel et les comics, Fifel utilise les cartoons et allie l univers de la pop culture à ses peintures. Cherchant en permanence à procurer du plaisir et faire sourire son public, l artiste propose des oeuvres très colorées et positives dans un univers pop-art où l on retrouve les icônes de notre jeunesse, de la culture populaire, des mangas, BD et cartoons.\nL artiste se retrouve tout particulièrement dans la citation « no pain, no gain » qui symbolise le goût de l effort et évoque l audace, le plaisir et la récompense du travail. Cette phrase correspond aussi à son ouverture d esprit et à son envie de découvrir de nouvelles expériences artistiques.',
'01-01-1975');

DROP TABLE IF EXISTS Oeuvres ;
CREATE TABLE Oeuvres (
Oeuvre_Id SERIAL PRIMARY KEY NOT NULL,
Oeuvre_titre VARCHAR(50),
oeuvre_descrip TEXT,
oeuvre_dim_larg FLOAT,
oeuvre_dim_haut FLOAT,
prix_TTC FLOAT DEFAULT 0,
en_stock BOOLEAN,
Auteur_Id INTEGER);

insert into Oeuvres (Oeuvre_titre, oeuvre_descrip, oeuvre_dim_larg, oeuvre_dim_haut, prix_TTC, en_stock, Auteur_Id) values 
('GIRL POWER', 'Cette oeuvre d art contemporain unique et originale GIRL POWER a été réalisée par l artiste contemporain Fermla.
L artiste a utilisé la technique Graffiti pour créer cette peinture petit format sur toile de style Street Art sur le thème icones Pop.', 25, 25, 265,
true, 1);
('DIRTY GADGET', 'Cette oeuvre d art contemporain unique et originale DIRTY GADGET a été réalisée par l artiste contemporain Fermla.
L artiste a utilisé la technique Graffiti pour créer cette peinture petit format sur toile de style Street Art sur le thème icones Pop.',
25, 25, 265, true, 1);
('STREET MERMAID', 'Cette oeuvre d art contemporain unique et originale STREET MERMAID a été réalisée par l artiste contemporain Fermla.
L artiste a utilisé la technique Graffiti pour créer cette peinture petit format sur toile de style Street Art sur le thème icones Pop.',
36, 36, 460, true, 1);
('URBAN PANTER', 'Cette oeuvre d art contemporain unique et originale URBAN PANTER a été réalisée par l artiste contemporain Fermla.
L artiste a utilisé la technique Graffiti pour créer cette peinture petit format sur toile de style Street Art sur le thème icones Pop.',
19, 19, 155, true, 1);
('MARSU', 'Cette oeuvre d art contemporain unique et originale MARSU a été réalisée par l artiste contemporain Fermla.
L artiste a utilisé la technique Graffiti pour créer cette peinture petit format sur toile de style Street Art sur le thème icones Pop.',
13, 13, 105, true, 1);
('Izuku Midoriya', 'Cette oeuvre d art contemporain unique et originale Izuku Midorya a été réalisée par l artiste contemporain Miller Jen .
L artiste a utilisé la technique Mixte pour créer cette peinture petit format sur toile de style Street Art sur le thème icones Pop.',
36, 36, 460, true, 2);
('#25.3', 'Cette oeuvre d art contemporain unique et originale #25.3 a été réalisée par l artiste contemporain Dashone.
L artiste a utilisé la technique Mixte pour créer cette peinture petit format sur toile de style Street Art sur le thème animaux.',
25, 25, 265, true, 3);
('NAHEMA', 'Cette oeuvre d art contemporain unique et originale NAHEMA a été réalisée par l artiste contemporain Istraille.
L artiste a utilisé la technique Mixte pour créer cette peinture petit format sur toile de style Street Art sur le thème Portraits.', 25, 25, 265, true, 4);
('Noako', 'Cette oeuvre d art contemporain unique et originale Noako a été réalisée par l artiste contemporain Istraille.
L artiste a utilisé la technique Acrylique pour créer cette peinture petit format sur toile de style Figuratif sur le thème Portraits.',
36, 36, 460,true, 4);
('No comment', 'Cette oeuvre d art contemporain unique et originale No comment a été réalisée par l artiste contemporain Fifel.
L artiste a utilisé la technique Mixte pour créer cette peinture grand format sur toile de style Pop Art sur le thème icones Pop.', 50, 50, 825,true, 5);

DROP TABLE IF EXISTS Clients ;
CREATE TABLE Clients (
cli_id SERIAL PRIMARY KEY NOT NULL,
cli_nom VARCHAR(50),
cli_pnom VARCHAR(50),
cli_adr VARCHAR(50),
cli_CP INTEGER,
cli_Ville VARCHAR(50),
cli_Mail VARCHAR(50),
cli_CA FLOAT DEFAULT 0,
cli_nb_oeuvres INTEGER DEFAULT 0);

insert into Clients (cli_nom, cli_pnom, cli_adr, cli_CP, cli_Ville, cli_Mail, cli_CA, cli_nb_oeuvres) values
('Philippe', 'Gallet-Hardy', '4, avenue de Lenoir', '48529', 'Baron', 'louise.torres@ifrance.com', 0, 0);
('Émile', 'Pinto', '30, impasse Chauvin', '70703', 'Robin-sur-Mer', 'suzanne.fouquet@free.fr', 0, 0);
('Jacques', 'Le Carpentier', '73, chemin Rolland', '13033', 'Legros-la-Forêt', 'michelle39@sfr.fr', 0, 0);
('Inès', 'Bourdon', '7, avenue de Humbert', '61743', 'DescampsVille', 'zguichard@lejeune.net', 0, 0);
('Agnès', 'Le Dupre', '6, place Émile Besson', '51040','Martineau-la-Forêt', 'lamy.thomas@chartier.com', 0, 0);
('Roland', 'Lecomte', '27, rue Frédéric Fernandez', '97589', 'Boyerdan', 'cpages@lemaitre.fr', 0, 0);
('Véronique', 'Ramos', '79, chemin Émile Lacroix', '64663', 'Aubry-sur-Cousin', 'qlemaitre@leroux.fr', 0, 0);
('Victoire', 'Sanchez', '259, place de Philippe', '56575', 'Fournier', 'alphonse.jacques@tele2.fr', 0, 0);
('Honoré', 'Chevalier', '26, rue Élise Hubert', '54722', 'Dumas', 'eevrard@roux.fr', 0, 0);
('Thomas', 'De Sousa', '31, rue de Faure', '38063', 'Menard', 'gilbert54@desousa.org', 0, 0);

DROP TABLE IF EXISTS Factures ;
CREATE TABLE Factures (
fac_id SERIAL PRIMARY KEY NOT NULL,
date_fac DATE,
montant_TTC FLOAT,
fac_nb_oeuvre INTEGER DEFAULT 0,
cli_id INTEGER);

insert into Factures(date_fac, montant_TTC, fac_nb_oeuvre, cli_id) values
('12-03-2022', 0, 0, 8);
('12-04-2022', 0, 0, 3);
('12-05-2022', 0, 0, 5);

DROP TABLE IF EXISTS ventes ;
CREATE TABLE ventes (Vente_Id SERIAL PRIMARY KEY NOT NULL,
Oeuvre_Id INTEGER,
fac_id INTEGER);

insert into ventes(Oeuvre_Id, fac_id) values
(1, 1);
(3, 1);
(10, 3);
(4, 2);
(2, 2);
(8, 2);
(9, 2);
(5, 2);
(7, 3);
(6, 3);

ALTER TABLE Oeuvres ADD CONSTRAINT FK_Oeuvres_Auteur_Id FOREIGN KEY (Auteur_Id) REFERENCES Auteurs (Auteur_Id);
ALTER TABLE Factures ADD CONSTRAINT FK_Factures_cli_id FOREIGN KEY (cli_id) REFERENCES Clients (cli_id);
ALTER TABLE ventes ADD CONSTRAINT FK_ventes_Oeuvre_Id FOREIGN KEY (Oeuvre_Id) REFERENCES Oeuvres (Oeuvre_Id);
ALTER TABLE ventes ADD CONSTRAINT FK_ventes_fac_id FOREIGN KEY (fac_id) REFERENCES Factures (fac_id);