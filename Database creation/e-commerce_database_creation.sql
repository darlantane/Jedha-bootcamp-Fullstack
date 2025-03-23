CREATE TABLE Produits_commandes(
   Id INT,
   produit_id INT,
   commande_id INT,
   quantite INT,
   prix DECIMAL(10,2),
   PRIMARY KEY(Id)
);

CREATE TABLE Paiement(
   paiement_id INT,
   commande_id INT,
   montant DECIMAL(10,2),
   date_paiement DATETIME,
   moyen_de_paiement VARCHAR(50),
   statut VARCHAR(50),
   PRIMARY KEY(paiement_id)
);

CREATE TABLE Expeditions(
   expedition_id INT,
   commande_id INT,
   date_expedition DATETIME,
   date_livraison_estimee DATETIME,
   statut VARCHAR(50),
   adresse_livraison VARCHAR(50),
   PRIMARY KEY(expedition_id)
);

CREATE TABLE Produits(
   produit_id INT,
   nom VARCHAR(255),
   description VARCHAR(255),
   prix DECIMAL(10,2),
   quantite_stock INT,
   category_id INT,
   image_url VARCHAR(255),
   date_ajout DATETIME,
   Id INT NOT NULL,
   PRIMARY KEY(produit_id),
   FOREIGN KEY(Id) REFERENCES Produits_commandes(Id)
);

CREATE TABLE Categories(
   category_id INT,
   nom VARCHAR(100),
   produit_id INT NOT NULL,
   PRIMARY KEY(category_id),
   FOREIGN KEY(produit_id) REFERENCES Produits(produit_id)
);

CREATE TABLE Commandes(
   commande_id INT,
   client_id VARCHAR(100),
   date_commande DATETIME,
   statut VARCHAR(50),
   total DECIMAL(10,2),
   expedition_id INT NOT NULL,
   paiement_id INT NOT NULL,
   Id INT NOT NULL,
   PRIMARY KEY(commande_id),
   FOREIGN KEY(expedition_id) REFERENCES Expeditions(expedition_id),
   FOREIGN KEY(paiement_id) REFERENCES Paiement(paiement_id),
   FOREIGN KEY(Id) REFERENCES Produits_commandes(Id)
);

CREATE TABLE Clients(
   client_id INT,
   nom VARCHAR(100),
   prenom VARCHAR(100),
   email VARCHAR(255),
   mot_de_passe VARCHAR(255),
   adresse_ligne1 VARCHAR(255),
   adresse_ligne2 VARCHAR(255),
   ville VARCHAR(100),
   code_postal VARCHAR(100),
   pays VARCHAR(100),
   telephone VARCHAR(100),
   date_creation DATETIME,
   commande_id INT NOT NULL,
   PRIMARY KEY(client_id),
   FOREIGN KEY(commande_id) REFERENCES Commandes(commande_id)
);
