-- =========================================
-- 1. CREATION DE LA BASE DE DONNEES
-- =========================================

CREATE DATABASE ivoire_market;


-- =========================================
-- 2. CREATION DES TABLES
-- =========================================

-- TABLE CLIENTS
CREATE TABLE clients (
    id_client SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    ville VARCHAR(50) NOT NULL,
    telephone VARCHAR(20),
    date_inscription DATE NOT NULL
);

-- TABLE PRODUITS
CREATE TABLE produits (
    id_produit SERIAL PRIMARY KEY,
    nom_produit VARCHAR(100) NOT NULL,
    categorie VARCHAR(50) NOT NULL,
    prix_unitaire NUMERIC(12,2) NOT NULL CHECK (prix_unitaire >= 0),
    stock INTEGER NOT NULL CHECK (stock >= 0)
);

-- TABLE COMMANDES
CREATE TABLE commandes (
    id_commande SERIAL PRIMARY KEY,
    id_client INTEGER NOT NULL,
    date_commande DATE NOT NULL,
    statut VARCHAR(30) NOT NULL,
    mode_paiement VARCHAR(30) NOT NULL,

    CONSTRAINT fk_client
        FOREIGN KEY (id_client)
        REFERENCES clients(id_client),

    CONSTRAINT chk_statut
        CHECK (statut IN ('Livree', 'En cours', 'Annulee'))
);

-- TABLE DETAILS_COMMANDES
CREATE TABLE details_commandes (
    id_detail SERIAL PRIMARY KEY,
    id_commande INTEGER NOT NULL,
    id_produit INTEGER NOT NULL,
    quantite INTEGER NOT NULL CHECK (quantite > 0),
    prix_vente NUMERIC(12,2) NOT NULL CHECK (prix_vente >= 0),

    CONSTRAINT fk_commande
        FOREIGN KEY (id_commande)
        REFERENCES commandes(id_commande),

    CONSTRAINT fk_produit
        FOREIGN KEY (id_produit)
        REFERENCES produits(id_produit)
);


-- =========================================
-- 3A. INSERTION DES CLIENTS
-- =========================================

INSERT INTO clients
(nom, prenom, ville, telephone, date_inscription)
VALUES
('Kouassi', 'Jean', 'Abidjan', '0701010101', '2024-01-15'),
('Traore', 'Aminata', 'Bouake', '0502020202', '2024-02-10'),
('Yao', 'Koffi', 'Abidjan', '0703030303', '2024-03-05'),
('Diallo', 'Mariam', 'Yamoussoukro', '0104040404', '2024-03-20'),
('Kone', 'Ibrahim', 'San Pedro', '0705050505', '2024-04-12'),
('Bamba', 'Fatou', 'Abidjan', '0506060606', '2024-04-25'),
('Nguessan', 'Paul', 'Daloa', '0707070707', '2024-05-10'),
('Soro', 'Moussa', 'Korhogo', '0108080808', '2024-05-18'),
('Toure', 'Aicha', 'Abidjan', '0709090909', '2024-06-01'),
('Koffi', 'Arnaud', 'Gagnoa', '0510101010', '2024-06-15'),
('Coulibaly', 'Fatima', 'Abidjan', '0711111111', '2024-07-03'),
('Aka', 'Serge', 'Grand-Bassam', '0512121212', '2024-07-20'),
('Gueye', 'Adama', 'Man', '0713131313', '2024-08-05'),
('Kouame', 'Estelle', 'Abidjan', '0514141414', '2024-08-15'),
('Ouattara', 'Bakary', 'Bouake', '0715151515', '2024-09-01');



-- =========================================
-- 3B. INSERTION DES PRODUITS
-- =========================================

INSERT INTO produits
(nom_produit, categorie, prix_unitaire, stock)
VALUES
('Samsung Galaxy A15', 'Telephonie', 125000, 35),
('iPhone 13', 'Telephonie', 350000, 12),
('Tecno Spark 20', 'Telephonie', 85000, 40),
('Ordinateur HP 250', 'Informatique', 425000, 8),
('Ordinateur Lenovo ThinkPad', 'Informatique', 550000, 10),
('Cle USB 64 Go', 'Accessoires', 7500, 100),
('Disque dur externe 1 To', 'Informatique', 45000, 25),
('Casque Bluetooth JBL', 'Accessoires', 35000, 30),
('Television Smart TV 43 pouces', 'Electromenager', 275000, 15),
('Refrigerateur 250 L', 'Electromenager', 320000, 7),
('Mixeur Moulinex', 'Electromenager', 45000, 20),
('Imprimante HP DeskJet', 'Informatique', 95000, 18),
('Souris sans fil Logitech', 'Accessoires', 12000, 60),
('Clavier Logitech', 'Accessoires', 18000, 45),
('Tablette Samsung', 'Informatique', 185000, 14);



-- =========================================
-- 3C. INSERTION DES COMMANDES
-- =========================================

INSERT INTO commandes
(id_client, date_commande, statut, mode_paiement)
VALUES
(1, '2025-01-05', 'Livree', 'Mobile Money'),
(2, '2025-01-08', 'Livree', 'Carte bancaire'),
(3, '2025-01-12', 'En cours', 'Mobile Money'),
(4, '2025-01-15', 'Livree', 'Especes'),
(5, '2025-01-20', 'Annulee', 'Mobile Money'),
(6, '2025-02-02', 'Livree', 'Carte bancaire'),
(7, '2025-02-10', 'Livree', 'Especes'),
(8, '2025-02-15', 'En cours', 'Mobile Money'),
(9, '2025-02-20', 'Livree', 'Mobile Money'),
(10, '2025-03-01', 'Livree', 'Carte bancaire'),
(11, '2025-03-05', 'Annulee', 'Especes'),
(12, '2025-03-10', 'Livree', 'Mobile Money'),
(13, '2025-03-15', 'En cours', 'Carte bancaire'),
(14, '2025-03-20', 'Livree', 'Mobile Money'),
(15, '2025-04-01', 'Livree', 'Especes'),
(1, '2025-04-05', 'Livree', 'Mobile Money'),
(3, '2025-04-10', 'En cours', 'Carte bancaire'),
(6, '2025-04-15', 'Livree', 'Mobile Money'),
(9, '2025-04-20', 'Livree', 'Carte bancaire'),
(11, '2025-04-25', 'Annulee', 'Mobile Money');


-- =========================================
-- 3D. INSERTION DES DETAILS DE COMMANDES
-- =========================================

INSERT INTO details_commandes
(id_commande, id_produit, quantite, prix_vente)
VALUES
(1, 1, 1, 125000),
(1, 6, 2, 7500),

(2, 3, 1, 85000),
(2, 8, 1, 35000),

(3, 4, 1, 425000),
(3, 13, 2, 12000),

(4, 11, 2, 45000),

(5, 2, 1, 350000),

(6, 9, 1, 275000),
(6, 8, 1, 35000),

(7, 6, 5, 7500),

(8, 5, 1, 550000),
(8, 14, 1, 18000),

(9, 1, 2, 125000),

(10, 12, 1, 95000),
(10, 13, 2, 12000),

(11, 10, 1, 320000),

(12, 3, 2, 85000),
(12, 6, 3, 7500),

(13, 15, 1, 185000),

(14, 2, 1, 350000),
(14, 8, 2, 35000),

(15, 7, 2, 45000),

(16, 1, 1, 125000),
(16, 13, 3, 12000),

(17, 4, 1, 425000),

(18, 11, 1, 45000),
(18, 14, 2, 18000),

(19, 9, 1, 275000),

(20, 5, 1, 550000);



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