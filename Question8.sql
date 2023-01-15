-- Création de la vue
CREATE OR REPLACE VIEW nb_ventes AS SELECT COUNT(*) AS nbr_ventes FROM oeuvres Oeuv 
INNER JOIN auteurs Aut ON Oeuv.auteur_id = Aut.auteur_id WHERE Oeuv.en_stock = 'f' GROUP BY Aut.auteur_id;

CREATE OR REPLACE FUNCTION best_auteur() RETURNS SETOF bigint AS $$
BEGIN 
	RETURN QUERY SELECT MAX(nbr_ventes) FROM nb_ventes;
END;
$$ LANGUAGE plpgsql;

-- Appel de la fonction
SELECT best_auteur();