-- Création de la base (facultatif si déjà déclarée dans Docker)
-- CREATE DATABASE gestion_produits;

-- Utilisation de la base
-- \c gestion_produits;

-- Table produits
DROP TABLE IF EXISTS produits;
CREATE TABLE produits (
  PRO_id SERIAL PRIMARY KEY,
  PRO_lib VARCHAR(200) NOT NULL,
  PRO_prix NUMERIC(10,2) NOT NULL,
  PRO_description TEXT
);

-- Table ressources
DROP TABLE IF EXISTS ressources;
CREATE TABLE ressources (
  RE_id SERIAL PRIMARY KEY,
  RE_type VARCHAR(100) NOT NULL,
  RE_url VARCHAR(1000) NOT NULL,
  RE_nom VARCHAR(100),
  PRO_id INT NOT NULL,
  CONSTRAINT ressources_produits_FK FOREIGN KEY (PRO_id) REFERENCES produits(PRO_id)
);

-- Table utilisateurs
DROP TABLE IF EXISTS utilisateurs;
CREATE TABLE utilisateurs (
  US_id SERIAL PRIMARY KEY,
  US_login VARCHAR(100) NOT NULL UNIQUE,
  US_password VARCHAR(100) NOT NULL
);

-- Données (exemple pour `produits`)
INSERT INTO produits (PRO_lib, PRO_prix, PRO_description) VALUES
  ('Pédales Shimano XT M8040 M/L', 74.99, 'Les pédales plates SHIMANO XT PD-M8040...'),
  ('Selle FIZIK ARIONE VERSUS Rails Kium', 59.99, 'Modèle confortable avant tout, la selle FIZIK...');

-- Ajoute les INSERT pour ressources et utilisateurs ici aussi
