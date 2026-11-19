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
- TABLE COMMANDES
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