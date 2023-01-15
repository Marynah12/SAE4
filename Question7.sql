-- Création de la table
CREATE TABLE archives_client(arch_cli_id int PRIMARY KEY, arch_cli_nom varchar(50), arch_cli_pnom varchar(50), arch_cli_adr varchar(50), arch_cli_CP integer, 
							 arch_cli_ville varchar(50), arch_cli_mail varchar(50), arch_cli_CA float, arch_cli_nb_oeuvres integer, utilisateur_supp text, 
							 archivage_date date);

CREATE OR REPLACE FUNCTION archivage_clients() RETURNS trigger AS $$
DECLARE 
	date_suppression DATE;
	utilisateur text;
BEGIN
  	-- Récupération de la date courante
  	date_suppression = current_timestamp;
  	-- Récupération de l'utilisateur connecté
  	utilisateur = current_user;

  	-- Insertion des données clientes supprimées ainsi que la date et l'utilisateur
  	INSERT INTO archives_client (arch_cli_id, arch_cli_nom, arch_cli_pnom, arch_cli_adr, arch_cli_CP, arch_cli_ville, arch_cli_mail, arch_cli_CA, arch_cli_nb_oeuvres, utilisateur_supp, archivage_date)
  	VALUES (OLD.cli_id, OLD.cli_nom, OLD.cli_pnom, OLD.cli_adr, OLD.cli_CP, OLD.cli_ville, OLD.cli_mail, OLD.cli_CA, OLD.cli_nb_oeuvres, utilisateur, date_suppression);

	RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER archivage_clients
AFTER DELETE ON clients
FOR EACH ROW EXECUTE PROCEDURE archivage_clients();