# Analyse des ventes e-commerce avec SQL et PostgreSQL

## 1. Contexte business

### a. Présentation du projet
Ce projet consiste à analyser les données commerciales d'une entreprise fictive de commerce électronique opérant en Côte d'Ivoire.
L'objectif est d'utiliser SQL et PostgreSQL pour explorer les données, identifier des indicateurs commerciaux et répondre à des questions métier.

### b. Contexte métier
- Entreprise : **IVOIRE MARKET**
- Secteur : Commerce électronique
- Pays : Côte d'Ivoire
- Devise : FCFA (XOF)
- Outil : PostgreSQL

## 2. Objectifs du projet
- Explorer une base de données relationnelle.
- Analyser les informations sur les clients.
- Examiner le catalogue des produits.
- Étudier les commandes et les modes de paiement.
- Calculer des indicateurs commerciaux.
- Répondre à des questions métier à l'aide de SQL.

## 3. Architecture de la base de données
La base de données comporte quatre tables :

| Table	| Description | enregistrements |
|---|---:|---|
|clients | Informations sur les clients | 15 |
|produits | Catalogue des produits | 15 |
|commandes | Historique des commandes | 20 |
|details_commandes | Détails des achats | 30 |
| TOTAL | | 80
Volume de données : 80 enregistrements.

## 4. Technologies utilisées
- PostgreSQL
- SQL
- pgAdmin 4
- Git
- GitHub

## 5. Questions métier
### 1.	Combien de clients sont enregistrés ?
#### - La requête SQL utilisée : 
```sql 
SELECT COUNT(*) As Nombre_Client FROM clients 
```
#### - Le résultat obtenu : 15

### 2.	Quels clients habitent à Abidjan ?
#### - La requête SQL utilisée :
```sql 
SELECT nom, ville FROM clients WHERE ville ='Abidjan'
```
#### - Le résultat obtenu :

| nom | ville |
|---|---:|
| Kouassi |	Abidjan |
| Yao | Abidjan |
| Bamba | Abidjan |
| Toure | Abidjan |
| Coulibaly | Abidjan |
| Kouame | Abidjan |

Nous avons 6 clients qui habitent à Abidjan.
### 3.	Quels sont les cinq produits les plus chers ?
#### - La requête SQL utilisée : 
```sql 
SELECT nom_produit, prix_unitaire FROM produits ORDER BY prix_unitaire DESC LIMIT 5
```
#### - Le résultat obtenu :

|nom_produit | prix_unitaire |
|---|---:|
|Ordinateur Lenovo ThinkPad | 550000.00 |
|Ordinateur HP 250 | 425000.00 |
|iPhone 13 | 350000.00 |
|Refrigerateur 250 L |	320000.00 |
|Television Smart TV 43 pouces | 275000.00 |

L' Ordinateur Lenovo ThinkPad est le produit qui a la plus grande valeur.

### 4.	Quelle est la valeur totale du stock ?
#### - La requête SQL utilisée :
```sql 
SELECT SUM(prix_unitaire * stock) AS Total_Stock_Produit FROM produits
```
#### - Le résultat obtenu : 36895000.00

### 5. Quel est le prix moyen, minimum et maximum des produits ?
#### - La requête SQL utilisée :
```sql 
SELECT ROUND(AVG(prix_unitaire),2) AS Prix_Moyen, MIN(prix_unitaire) AS Prix_Minimun, MAX(prix_unitaire) AS Prix_Maximun
FROM Produits
```
#### - Le résultat obtenu :

|Prix_Moyen | Prix_Minimun | Prix_Maximun |
|---|---:|--- |
|171500.00 | 7500.00 | 550000.00 |

### 6. Combien de commandes ont été livrées, annulées ou sont en cours ?
#### - La requête SQL utilisée :
```sql 
SELECT statut, COUNT(*) As Nombre_Commande FROM commandes
GROUP BY statut
```
#### - Le résultat obtenu :

|statut | Nombre_Commande |
|---|---:|
|Annulee |	3 |
|En cours |	4 |
|Livree | 13 |

### 7.	Quel est le montant total des lignes de commande enregistrées ?
#### - La requête SQL utilisée :
```sql
SELECT sum(quantite * prix_vente) As Montant_Total FROM details_commandes
```
#### - Le résultat obtenu : 5133000.00

### 8.	Quelle est la quantité totale vendue par produit ?
#### - La requête SQL utilisée :
```sql
SELECT p.nom_produit, sum(dt.quantite) AS Quantite_Total
FROM details_commandes AS dt
JOIN produits AS p ON dt.id_produit = p.id_produit
GROUP BY p.nom_produit 
ORDER BY Quantite_Total DESC
```
#### - Le résultat obtenu :

|nom_produit | Quantite_Total |
|---|---:|
|Cle USB 64 Go"	10 |
|Souris sans fil Logitech |	7 |
|Samsung Galaxy A15 | 4 |
|Casque Bluetooth JBL |	4 |
|Mixeur Moulinex | 3 |
|Clavier Logitech |	3 |
|Tecno Spark 20	| 3 |
|Disque dur externe 1 To |	2 |
|Ordinateur Lenovo ThinkPad | 2 |
|Television Smart TV 43 pouces | 2 |
|iPhone 13 | 2 |
|Ordinateur HP 250 	| 2 |
|Refrigerateur 250 L |	1 |
|Tablette Samsung |	1 |
|Imprimante HP DeskJet | 1 |

la Cle USB 64 Go est le TOP produit.

### 9.	Quelles catégories ont un prix moyen supérieur à 100 000 FCFA ?
#### - La requête SQL utilisée :
```sql
SELECT categorie, ROUND(AVG(prix_unitaire),2) AS Prix_Moyen FROM produits
GROUP BY categorie
HAVING AVG(prix_unitaire) > 100000
ORDER BY Prix_Moyen DESC
```

#### - Le résultat obtenu :

| categorie | Prix_Moyen |
|---|---:|
| Informatique |	260000.00 |
| Electromenager |	213333.33 |
| Telephonie |	186666.67 |

### 10.	Quels modes de paiement ont été utilisés pour au moins quatre commandes ?
#### - La requête SQL utilisée :
```sql
SELECT mode_paiement, COUNT(*) AS Nombre_Paiement 
FROM commandes
GROUP BY mode_paiement
HAVING COUNT(mode_paiement) >= 4
ORDER BY Nombre_Paiement DESC;
```
#### - Le résultat obtenu : 

| mode_paiement | Nombre_Paiement |
|---|---:|
|Mobile Money | 10 |
|Carte bancaire | 6 |
|Especes | 4 |

Le Mobile Money est le paiement le plus utilisé.

## 6. Comment reproduire le projet

> git clone https://github.com/soro-moussa/IVOIRE_MARKET_SQL_POSTGRESQL.git