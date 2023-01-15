-- Création de la fonction
CREATE OR REPLACE FUNCTION question9() RETURNS SETOF varchar AS $$
BEGIN
	RETURN QUERY SELECT Aut.auteur_nom FROM auteurs Aut INNER JOIN oeuvres Oeuv ON Oeuv.auteur_id = Aut.auteur_id
		GROUP BY Aut.auteur_nom
		HAVING COUNT(*) BETWEEN 0.8 * (select best_auteur()) AND 0.9 * (select best_auteur());
END;
$$ LANGUAGE plpgsql;

-- Appel de la fonction
SELECT question9();