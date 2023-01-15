CREATE OR REPLACE FUNCTION mise_a_jour_table() RETURNS TRIGGER AS $$
DECLARE
  rec record;
  rec_old record;
  rec_cli record;
  rec_cli_old record;
BEGIN
	if(tg_table_name='ventes') then
	if(tg_op = 'UPDATE') then
			SELECT prix_TTC INTO rec FROM oeuvres WHERE oeuvre_id = NEW.oeuvre_id; 
			SELECT prix_TTC INTO rec_old FROM oeuvres WHERE oeuvre_id = OLD.oeuvre_id;
			SELECT cli_id into rec_cli from clients where cli_id in (select cli_id from factures where fac_id = NEW.fac_id);
			SELECT cli_id into rec_cli_old from clients where cli_id in (select cli_id from factures where fac_id = OLD.fac_id);

			-- UPDATE
			-- Mise à jour du stock
			UPDATE Oeuvres SET en_stock = true WHERE oeuvre_id = OLD.oeuvre_id;
			UPDATE Oeuvres SET en_stock = false WHERE oeuvre_id = NEW.oeuvre_id;
			
			-- Mise à jour de la facture
			UPDATE Factures SET montant_TTC = montant_TTC + rec.prix_TTC WHERE fac_id = NEW.fac_id;
			UPDATE Factures SET montant_TTC = montant_TTC - rec_old.prix_TTC WHERE fac_id = OLD.fac_id;
			UPDATE Factures SET fac_nb_oeuvre = fac_nb_oeuvre + 1 WHERE fac_id = NEW.fac_id;
			UPDATE Factures SET fac_nb_oeuvre = fac_nb_oeuvre - 1 WHERE fac_id = OLD.fac_id;
			
			-- Mise à jour du nombre d'oeuvres achetés par client et le prix_TTC
			UPDATE Clients SET cli_nb_oeuvres = cli_nb_oeuvres + 1 WHERE cli_id = rec_cli.cli_id;
			UPDATE Clients SET cli_nb_oeuvres = cli_nb_oeuvres - 1 WHERE cli_id = rec_cli_old.cli_id;
			UPDATE Clients SET cli_ca = cli_ca + rec.prix_TTC WHERE cli_id =  rec_cli.cli_id;
			UPDATE Clients SET cli_ca = cli_ca - rec_old.prix_TTC WHERE cli_id = rec_cli_old.cli_id;

		end if;
		
		if(tg_op = 'INSERT') then
			SELECT cli_id into rec_cli from clients where cli_id in (select cli_id from factures where fac_id = NEW.fac_id);
			SELECT prix_TTC into rec from oeuvres where oeuvre_id = NEW.oeuvre_id; 
			
			-- UPDATE
  	    	-- Mise à jour du stock
  			UPDATE Oeuvres SET en_stock = false	where oeuvre_id = NEW.oeuvre_id;
			-- Mise à jour de la facture
  			UPDATE Factures SET fac_nb_oeuvre = fac_nb_oeuvre + 1, montant_TTC = montant_TTC + rec.prix_TTC WHERE fac_id = NEW.fac_id;
			-- Mise à jour du nombre d'oeuvres achetés par client et le prix_TTC
			UPDATE Clients SET cli_nb_oeuvres = cli_nb_oeuvres + 1, cli_ca = cli_ca + rec.prix_TTC where cli_id = rec_cli.cli_id;
		end if;
			
		if(tg_op = 'DELETE') then
			SELECT cli_id into rec_cli from clients where cli_id in (select cli_id from factures where fac_id = OLD.fac_id);
			SELECT prix_TTC into rec from oeuvres where oeuvre_id = OLD.oeuvre_id; 
			
			-- UPDATE
			-- Mise à jour de la table en_stock
			UPDATE Oeuvres SET en_stock = true	where oeuvre_id = OLD.oeuvre_id;
		  	-- Mise à jour de la facture
			UPDATE Factures SET fac_nb_oeuvre = fac_nb_oeuvre - 1, montant_TTC = montant_TTC - rec.prix_TTC WHERE fac_id = OLD.fac_id;
			-- Mise à jour de nombre d'oeuvres achetés par le client et le prix_TTC
			UPDATE Clients SET cli_nb_oeuvres = cli_nb_oeuvres - 1, cli_ca = cli_ca - rec.prix_TTC where cli_id = rec_cli.cli_id;
		end if;
		
	end if;
RETURN NEW;	
END;
$$ LANGUAGE plpgsql;


CREATE or replace TRIGGER mise_a_jour 
AFTER INSERT or DELETE or UPDATE ON ventes FOR EACH ROW 
EXECUTE PROCEDURE mise_a_jour_table();