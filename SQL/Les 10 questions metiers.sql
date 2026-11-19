-- =========================================
-- LES 10 QUESTIONS METIERS
-- =========================================


-- 1- Combien de clients sont enregistrés ?
SELECT COUNT(*) As Nombre_Client FROM clients

-- 2- Quels clients habitent à Abidjan ?
SELECT nom, ville FROM clients WHERE ville ='Abidjan'

-- 3- Quels sont les cinq produits les plus chers ?
SELECT nom_produit, prix_unitaire FROM produits ORDER BY prix_unitaire DESC LIMIT 5

-- 4- Quelle est la valeur totale du stock ?
SELECT SUM(prix_unitaire * stock) AS Total_Stock_Produit FROM produits

-- 5- Quel est le prix moyen, minimum et maximum des produits ?
SELECT ROUND(AVG(prix_unitaire),2) AS Prix_Moyen, MIN(prix_unitaire) AS Prix_Minimun, MAX(prix_unitaire) AS Prix_Maximun
FROM Produits

-- 6- Combien de commandes ont été livrées, annulées ou sont en cours ?
SELECT statut, COUNT(*) As Nombre_Commande FROM commandes
GROUP BY statut

-- 7- Quel est le montant total des lignes de commande enregistrées ?
SELECT sum(quantite * prix_vente) As Montant_Total FROM details_commandes

-- 8- Quelle est la quantité totale vendue par produit ?

SELECT p.nom_produit, sum(dt.quantite) AS Quantite_Total
FROM details_commandes AS dt
JOIN produits AS p ON dt.id_produit = p.id_produit
GROUP BY p.nom_produit 
ORDER BY Quantite_Total DESC


-- 9- Quelles catégories ont un prix moyen supérieur à 100 000 FCFA ?
SELECT categorie, ROUND(AVG(prix_unitaire),2) AS Prix_Moyen FROM produits
GROUP BY categorie
HAVING AVG(prix_unitaire) > 100000
ORDER BY Prix_Moyen DESC


-- 10- Quels modes de paiement ont été utilisés pour au moins quatre commandes ?
SELECT mode_paiement, COUNT(*) AS Nombre_Paiement 
FROM commandes
GROUP BY mode_paiement
HAVING COUNT(mode_paiement) >= 4
ORDER BY Nombre_Paiement DESC;