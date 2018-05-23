-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Sam 12 Août 2017 à 15:35
-- Version du serveur :  10.1.21-MariaDB
-- Version de PHP :  5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `projet_04`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresse_livraison`
--

CREATE TABLE `adresse_livraison` (
  `ID` int(11) NOT NULL,
  `telephone` varchar(10) NOT NULL,
  `adresse` varchar(200) NOT NULL,
  `ville` varchar(100) NOT NULL,
  `code_postale` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Contenu de la table `adresse_livraison`
--

INSERT INTO `adresse_livraison` (`ID`, `telephone`, `adresse`, `ville`, `code_postale`) VALUES
(1, '0666778899', '11 rue du ciel', 'Bordeaux', '33000'),
(2, '0777112233', '22 rue de la terre', 'Pessac', '33600'),
(3, '0655442211', '33 chemin de fer', 'Talence', '33400'),
(4, '0633442200', '44 route de Toulouse', 'Bordeaux', '33000'),
(5, '0600889911', '77 rue du feu', 'Bordeaux Bastide', '33100'),
(6, '0710203040', '55 rue des fleurs', 'Bordeaux Le Bouscat', '33110');

-- --------------------------------------------------------

--
-- Structure de la table `categorie_plat`
--

CREATE TABLE `categorie_plat` (
  `ID` int(11) NOT NULL,
  `categorie` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `categorie_plat`
--

INSERT INTO `categorie_plat` (`ID`, `categorie`) VALUES
(1, 'plat'),
(2, 'dessert');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `ID` int(11) NOT NULL,
  `identifiant` varchar(100) NOT NULL,
  `mot_de_passe` varchar(10) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`ID`, `identifiant`, `mot_de_passe`, `nom`, `prenom`) VALUES
(1, 'Isapetit', '*676243218', 'Petit', 'Isabelle'),
(2, 'Julesm', '*BF1D8B65E', 'Martin', 'Jules'),
(3, 'Manonb', '*871514FFD', 'Bernard', 'Manon'),
(4, 'Luthom', '*7EF7E32EA', 'Thomas', 'Lucas'),
(5, 'Louisbert', '*ECE524BFD', 'Robert', 'Louis'),
(6, 'Arichard', '*91B6722AE', 'Richard', 'Arthur');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `ID` int(11) NOT NULL,
  `date_commande` date NOT NULL,
  `date_livraison` date NOT NULL,
  `temps_estime` time NOT NULL,
  `client_id` int(11) NOT NULL,
  `livreur_id` int(11) NOT NULL,
  `adresse_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Contenu de la table `commande`
--

INSERT INTO `commande` (`ID`, `date_commande`, `date_livraison`, `temps_estime`, `client_id`, `livreur_id`, `adresse_id`) VALUES
(1, '2017-07-31', '2017-07-31', '00:05:00', 1, 1, 1),
(2, '2017-07-31', '2017-07-31', '00:05:00', 1, 1, 1),
(3, '2017-07-31', '2017-07-31', '00:05:00', 1, 1, 1),
(4, '2017-07-31', '2017-07-31', '00:20:00', 2, 2, 2),
(5, '2017-07-31', '2017-07-31', '00:20:00', 2, 2, 2),
(6, '2017-07-31', '2017-07-31', '00:05:00', 3, 2, 3),
(7, '2017-07-31', '2017-07-31', '00:15:00', 4, 3, 4),
(8, '2017-07-31', '2017-07-31', '00:15:00', 4, 3, 4),
(9, '2017-07-31', '2017-07-31', '00:10:00', 5, 4, 5),
(10, '2017-07-31', '2017-07-31', '00:10:00', 5, 4, 5),
(11, '2017-07-31', '2017-07-31', '00:10:00', 5, 4, 5),
(12, '2017-07-31', '2017-07-31', '00:00:00', 6, 5, 6),
(13, '2017-07-28', '2017-07-28', '00:00:00', 1, 1, 1),
(14, '2017-07-28', '2017-07-28', '00:00:00', 2, 2, 2),
(15, '2017-07-28', '2017-07-28', '00:00:00', 3, 3, 3),
(16, '2017-07-28', '2017-07-28', '00:00:00', 6, 5, 6);

-- --------------------------------------------------------

--
-- Structure de la table `email`
--

CREATE TABLE `email` (
  `ID` int(11) NOT NULL,
  `client_email` int(11) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `email`
--

INSERT INTO `email` (`ID`, `client_email`, `email`) VALUES
(1, 1, 'petit@gmail.com'),
(2, 2, 'martinj@yahoo.fr'),
(3, 3, 'bmanon@outlook.com'),
(4, 4, 'luthom@gmail.com'),
(5, 5, 'lrobert@outlook.com'),
(6, 6, 'arichard@yahoo.fr');

-- --------------------------------------------------------

--
-- Structure de la table `historique_commande`
--

CREATE TABLE `historique_commande` (
  `commande_id` int(11) NOT NULL,
  `repas_id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `historique_commande`
--

INSERT INTO `historique_commande` (`commande_id`, `repas_id`, `quantite`) VALUES
(1, 1, 2),
(2, 3, 1),
(3, 4, 1),
(4, 2, 1),
(5, 4, 1),
(6, 1, 2),
(7, 2, 1),
(8, 3, 1),
(9, 2, 1),
(10, 3, 1),
(11, 4, 1),
(12, 2, 2),
(13, 5, 1),
(14, 6, 1),
(15, 7, 1),
(16, 8, 1);

-- --------------------------------------------------------

--
-- Structure de la table `liste_plat`
--

CREATE TABLE `liste_plat` (
  `ID` int(11) NOT NULL,
  `nom_plat` varchar(200) NOT NULL,
  `categorie_id` int(11) NOT NULL,
  `prix` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Contenu de la table `liste_plat`
--

INSERT INTO `liste_plat` (`ID`, `nom_plat`, `categorie_id`, `prix`) VALUES
(1, 'Risotto au parmesan', 1, '8.10'),
(2, 'Tagliatelles aux crevettes', 1, '9.10'),
(3, 'Baba au Rhum', 2, '4.90'),
(4, 'Crumble aux pommes', 2, '3.90'),
(5, 'Risotto aux champignons', 1, '8.10'),
(6, 'Spaghetti aux noix de Saint Jacques', 1, '9.10'),
(7, 'Tarte aux abricots', 2, '3.90'),
(8, 'Tiramisu framboises', 2, '4.90');

-- --------------------------------------------------------

--
-- Structure de la table `livreur`
--

CREATE TABLE `livreur` (
  `ID` int(11) NOT NULL,
  `statut_livreur_id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `identifiant` varchar(100) NOT NULL,
  `mot_de_passe` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `livreur`
--

INSERT INTO `livreur` (`ID`, `statut_livreur_id`, `nom`, `prenom`, `identifiant`, `mot_de_passe`) VALUES
(1, 1, 'Durand', 'Hugo', 'hugod', '*86B6B5283'),
(2, 2, 'Dubois', 'Ethan', 'ethand', '*57E6F32B4'),
(3, 5, 'Simon', 'Mathis', 'mathiss', '*6A17185FB'),
(4, 3, 'Leroy', 'Sarah', 'sarahl', '*3263944ED'),
(5, 4, 'David', 'Martin', 'martind', '*621357025');

-- --------------------------------------------------------

--
-- Structure de la table `repas_du_jour`
--

CREATE TABLE `repas_du_jour` (
  `ID` int(11) NOT NULL,
  `liste_plat_id` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Contenu de la table `repas_du_jour`
--

INSERT INTO `repas_du_jour` (`ID`, `liste_plat_id`, `date`) VALUES
(1, 5, '2017-07-31'),
(2, 6, '2017-07-31'),
(3, 7, '2017-07-31'),
(4, 8, '2017-07-31'),
(5, 1, '2017-07-28'),
(6, 2, '2017-07-28'),
(7, 3, '2017-07-28'),
(8, 4, '2017-07-28');

-- --------------------------------------------------------

--
-- Structure de la table `statut_livreur`
--

CREATE TABLE `statut_livreur` (
  `ID` int(11) NOT NULL,
  `statut` varchar(100) NOT NULL,
  `position` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `statut_livreur`
--

INSERT INTO `statut_livreur` (`ID`, `statut`, `position`) VALUES
(1, 'en_cours_de_livraison', 'Bordeaux centre'),
(2, 'en_cours_de_livraison', 'Pessac'),
(3, 'en_cours_de_livraison', 'Talence'),
(4, 'en_cours_de_livraison', 'Bordeaux Bastide'),
(5, 'libre', 'Bordeaux Le Bouscat');

-- --------------------------------------------------------

--
-- Structure de la table `stock_repas`
--

CREATE TABLE `stock_repas` (
  `livreur_id` int(11) NOT NULL,
  `repas_id` int(11) NOT NULL,
  `quantite_stock_repas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `stock_repas`
--

INSERT INTO `stock_repas` (`livreur_id`, `repas_id`, `quantite_stock_repas`) VALUES
(1, 1, 2),
(1, 3, 1),
(1, 4, 1),
(2, 1, 2),
(2, 2, 1),
(2, 4, 1),
(3, 2, 1),
(3, 3, 1),
(4, 2, 1),
(4, 3, 1),
(4, 4, 1),
(5, 2, 2),
(5, 5, 1),
(5, 6, 1),
(5, 7, 1),
(5, 8, 1);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `adresse_livraison`
--
ALTER TABLE `adresse_livraison`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `categorie_plat`
--
ALTER TABLE `categorie_plat`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `livreur_commande_du_jour_fk1` (`livreur_id`),
  ADD KEY `client_commande_fk` (`client_id`),
  ADD KEY `adresse_id` (`adresse_id`);

--
-- Index pour la table `email`
--
ALTER TABLE `email`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `client_email_fk` (`client_email`);

--
-- Index pour la table `historique_commande`
--
ALTER TABLE `historique_commande`
  ADD PRIMARY KEY (`commande_id`,`repas_id`),
  ADD KEY `repasdujour_composition_fk` (`repas_id`),
  ADD KEY `commande_id` (`commande_id`);

--
-- Index pour la table `liste_plat`
--
ALTER TABLE `liste_plat`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `categorieplat_liste_plat_fk` (`categorie_id`);

--
-- Index pour la table `livreur`
--
ALTER TABLE `livreur`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `statutlivreur_livreur_fk` (`statut_livreur_id`),
  ADD KEY `ID` (`ID`);

--
-- Index pour la table `repas_du_jour`
--
ALTER TABLE `repas_du_jour`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `listeplat_repasdujour_fk` (`liste_plat_id`);

--
-- Index pour la table `statut_livreur`
--
ALTER TABLE `statut_livreur`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `stock_repas`
--
ALTER TABLE `stock_repas`
  ADD PRIMARY KEY (`livreur_id`,`repas_id`),
  ADD KEY `stock_livreur` (`livreur_id`),
  ADD KEY `repas_stock` (`repas_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `adresse_livraison`
--
ALTER TABLE `adresse_livraison`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `categorie_plat`
--
ALTER TABLE `categorie_plat`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT pour la table `email`
--
ALTER TABLE `email`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `liste_plat`
--
ALTER TABLE `liste_plat`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `livreur`
--
ALTER TABLE `livreur`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `repas_du_jour`
--
ALTER TABLE `repas_du_jour`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `statut_livreur`
--
ALTER TABLE `statut_livreur`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `adresse_livraison_commande_fk` FOREIGN KEY (`adresse_id`) REFERENCES `adresse_livraison` (`ID`),
  ADD CONSTRAINT `client_commande_fk` FOREIGN KEY (`client_id`) REFERENCES `client` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `livreur_commande_du_jour_fk1` FOREIGN KEY (`livreur_id`) REFERENCES `livreur` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `email`
--
ALTER TABLE `email`
  ADD CONSTRAINT `client_email_fk` FOREIGN KEY (`client_email`) REFERENCES `client` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `historique_commande`
--
ALTER TABLE `historique_commande`
  ADD CONSTRAINT `commande_composition_fk` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `repasdujour_composition_fk` FOREIGN KEY (`repas_id`) REFERENCES `repas_du_jour` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `liste_plat`
--
ALTER TABLE `liste_plat`
  ADD CONSTRAINT `categorieplat_liste_plat_fk` FOREIGN KEY (`categorie_id`) REFERENCES `categorie_plat` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `livreur`
--
ALTER TABLE `livreur`
  ADD CONSTRAINT `statutlivreur_livreur_fk` FOREIGN KEY (`statut_livreur_id`) REFERENCES `statut_livreur` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `repas_du_jour`
--
ALTER TABLE `repas_du_jour`
  ADD CONSTRAINT `listeplat_repasdujour_fk` FOREIGN KEY (`liste_plat_id`) REFERENCES `liste_plat` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `stock_repas`
--
ALTER TABLE `stock_repas`
  ADD CONSTRAINT `livreur_composition-fk` FOREIGN KEY (`livreur_id`) REFERENCES `livreur` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `repasdujour_composition-fk` FOREIGN KEY (`repas_id`) REFERENCES `repas_du_jour` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
