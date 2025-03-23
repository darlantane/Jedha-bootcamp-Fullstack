SELECT * FROM categories;
SELECT * FROM clients;
SELECT * FROM commandes;
SELECT * FROM expeditions;
SELECT * FROM paiement;
SELECT * FROM produits;
SELECT * FROM produits_commandes;

-- Les produits les plus populaires
SELECT produits.nom, produits.quantite_stock, sum(paiement.montant) FROM produits
JOIN produits_commandes on produits_commandes.produit_id = produits.produit_id
JOIN commandes on commandes.commande_id = produits_commandes.commande_id
JOIN paiement on paiement.paiement_id = commandes.paiement_id
group by produits.nom, produits.quantite_stock
order by sum(paiement.montant) DESC ;

-- Les clients les plus rentables
SELECT clients.nom, clients.prenom, clients.ville, sum(paiement.montant) FROM clients
JOIN commandes on commandes.commande_id = clients.commande_id
JOIN paiement on paiement.paiement_id = commandes.paiement_id
group by clients.nom, clients.prenom, clients.ville
order by sum(paiement.montant) DESC ;

