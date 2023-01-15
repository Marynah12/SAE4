CREATE OR REPLACE FUNCTION question10(F_id integer) RETURNS void AS $$
DECLARE 
	-- Création curseur
	cursFactures CURSOR FOR 
		SELECT F.*, Cli.cli_nom, Cli.cli_pnom, Cli.cli_adr, Cli.cli_cp, Cli.cli_ville, Cli.cli_mail FROM factures F 
		INNER JOIN clients Cli ON F.cli_id = Cli.cli_id
		WHERE F.fac_id = F_id;
BEGIN
	FOR F_rec IN cursFactures LOOP
		-- Affiche les informations
		RAISE NOTICE 'ID de la facture : %', F_rec.fac_id;
        RAISE NOTICE 'Date de la facture: %', F_rec.date_fac;
        RAISE NOTICE 'Montant TTC : %', F_rec.montant_TTC;
        RAISE NOTICE 'Nombre d oeuvres: %', F_rec.fac_nb_oeuvre;
        RAISE NOTICE 'ID du client : %', F_rec.cli_id;
        RAISE NOTICE 'Nom du client : %', F_rec.cli_nom;
		RAISE NOTICE 'Prénom du client : %', F_rec.cli_pnom;
        RAISE NOTICE 'Adresse du client : %', F_rec.cli_adr;
        RAISE NOTICE 'Code postal du client : %', F_rec.cli_CP;
        RAISE NOTICE 'Ville du client : %', F_rec.cli_Ville;
        RAISE NOTICE 'Email du client : %', F_rec.cli_Mail;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

select question10(2);