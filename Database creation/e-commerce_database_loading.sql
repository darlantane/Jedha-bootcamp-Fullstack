LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/faker/clients.csv'
INTO TABLE clients
FIELDS TERMINATED BY ','  -- Délimiteur de champ (virgule pour CSV)
ENCLOSED BY '"'          -- Délimiteur de texte (souvent utilisé pour entourer les valeurs de texte)
LINES TERMINATED BY '\n' -- Délimiteur de ligne
IGNORE 1 LINES;			-- Ignore l'en-tête du fichier CSV

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/faker/categories.csv'
INTO TABLE categories
FIELDS TERMINATED BY ','  
ENCLOSED BY '"'      
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/faker/commandes.csv'
INTO TABLE commandes
FIELDS TERMINATED BY ','  
ENCLOSED BY '"'      
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/faker/expeditions.csv'
INTO TABLE expeditions
FIELDS TERMINATED BY ','  
ENCLOSED BY '"'      
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/faker/paiement.csv'
INTO TABLE paiement
FIELDS TERMINATED BY ','  
ENCLOSED BY '"'      
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/faker/produits.csv'
INTO TABLE produits
FIELDS TERMINATED BY ','  
ENCLOSED BY '"'      
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/faker/produits_commandes.csv'
INTO TABLE produits_commandes
FIELDS TERMINATED BY ','  
ENCLOSED BY '"'      
LINES TERMINATED BY '\n'
IGNORE 1 LINES;





