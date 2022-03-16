-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mer. 16 mars 2022 à 16:42
-- Version du serveur :  5.7.17
-- Version de PHP :  5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `regisport`
--

-- --------------------------------------------------------

--
-- Structure de la table `competition`
--

CREATE TABLE `competition` (
  `ID_COMPETITION` int(11) NOT NULL,
  `ID_SPORT` int(11) NOT NULL,
  `LIBELLE_C` char(60) DEFAULT NULL,
  `DATE_DEBUT` date DEFAULT NULL,
  `DATE_FIN` date DEFAULT NULL,
  `RECOMPENSE` char(60) DEFAULT NULL,
  `VAINQUEUR` char(60) DEFAULT NULL,
  `NB_PARTICIPANTS` int(11) DEFAULT NULL,
  `LIEU` char(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `competition`
--

INSERT INTO `competition` (`ID_COMPETITION`, `ID_SPORT`, `LIBELLE_C`, `DATE_DEBUT`, `DATE_FIN`, `RECOMPENSE`, `VAINQUEUR`, `NB_PARTICIPANTS`, `LIEU`) VALUES
(1, 1, 'Championnat de France U19 de Roller Hockey', '2021-09-01', '2022-05-31', 'Coupe de Champion de France + Titre associé', NULL, 10, 'France'),
(2, 2, 'Championnat de France U20 de Football', '2021-09-01', '2022-05-31', 'Coupe de Champion de France + Titre associé', NULL, 21, 'France'),
(3, 3, 'Championnat de France U20 de Basketball', '2021-09-01', '2022-05-31', 'Coupe de Champion de France + Titre associé', NULL, 15, 'France');

-- --------------------------------------------------------

--
-- Structure de la table `equipe`
--

CREATE TABLE `equipe` (
  `ID_EQUIPE` int(11) NOT NULL,
  `NOM_E` char(60) DEFAULT NULL,
  `EFFECTIF` int(11) DEFAULT NULL,
  `NOM_COACH` char(60) DEFAULT NULL,
  `VILLE` char(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `equipe`
--

INSERT INTO `equipe` (`ID_EQUIPE`, `NOM_E`, `EFFECTIF`, `NOM_COACH`, `VILLE`) VALUES
(1, 'BaLiGoFoot', 22, 'TheDi4nier', 'Gap'),
(2, 'BaLiGoBasket', 12, 'Arthas', 'Gap'),
(3, 'Les Tigres de StBonnet', 14, 'Cleamlnp', 'StBonnet');

-- --------------------------------------------------------

--
-- Structure de la table `inscrire`
--

CREATE TABLE `inscrire` (
  `ID_EQUIPE` int(11) NOT NULL,
  `ID_COMPETITION` int(11) NOT NULL,
  `ID_PERSONNE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `inscrire`
--

INSERT INTO `inscrire` (`ID_EQUIPE`, `ID_COMPETITION`, `ID_PERSONNE`) VALUES
(1, 2, 1),
(2, 3, 2),
(3, 1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

CREATE TABLE `personne` (
  `ID_PERSONNE` int(11) NOT NULL,
  `ID_EQUIPE` int(11) NOT NULL,
  `NOM_P` char(60) DEFAULT NULL,
  `PRENOM` char(60) DEFAULT NULL,
  `AGE` int(11) DEFAULT NULL,
  `DATE_NAISSANCE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `personne`
--

INSERT INTO `personne` (`ID_PERSONNE`, `ID_EQUIPE`, `NOM_P`, `PRENOM`, `AGE`, `DATE_NAISSANCE`) VALUES
(1, 1, 'Villanueva', 'Diego', 19, '2002-04-19'),
(2, 2, 'Blase', 'Julien', 18, '2003-11-01'),
(3, 3, 'Audibert', 'Baptiste', 18, '2003-11-11');

-- --------------------------------------------------------

--
-- Structure de la table `pratiquer`
--

CREATE TABLE `pratiquer` (
  `ID_EQUIPE` int(11) NOT NULL,
  `ID_SPORT` int(11) NOT NULL,
  `ID_PERSONNE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `pratiquer`
--

INSERT INTO `pratiquer` (`ID_EQUIPE`, `ID_SPORT`, `ID_PERSONNE`) VALUES
(1, 2, 1),
(2, 3, 2),
(3, 1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `sport`
--

CREATE TABLE `sport` (
  `ID_SPORT` int(11) NOT NULL,
  `LIBELLE_S` char(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `sport`
--

INSERT INTO `sport` (`ID_SPORT`, `LIBELLE_S`) VALUES
(1, 'Roller Hockey'),
(2, 'Football'),
(3, 'Basketball');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `competition`
--
ALTER TABLE `competition`
  ADD PRIMARY KEY (`ID_COMPETITION`),
  ADD KEY `ASSOCIER_FK` (`ID_SPORT`);

--
-- Index pour la table `equipe`
--
ALTER TABLE `equipe`
  ADD PRIMARY KEY (`ID_EQUIPE`);

--
-- Index pour la table `inscrire`
--
ALTER TABLE `inscrire`
  ADD PRIMARY KEY (`ID_EQUIPE`,`ID_COMPETITION`,`ID_PERSONNE`),
  ADD KEY `INSCRIRE_FK` (`ID_EQUIPE`),
  ADD KEY `INSCRIRE2_FK` (`ID_COMPETITION`),
  ADD KEY `INSCRIRE3_FK` (`ID_PERSONNE`);

--
-- Index pour la table `personne`
--
ALTER TABLE `personne`
  ADD PRIMARY KEY (`ID_PERSONNE`),
  ADD KEY `CONSTITUER_FK` (`ID_EQUIPE`);

--
-- Index pour la table `pratiquer`
--
ALTER TABLE `pratiquer`
  ADD PRIMARY KEY (`ID_EQUIPE`,`ID_SPORT`,`ID_PERSONNE`),
  ADD KEY `PRATIQUER_FK` (`ID_EQUIPE`),
  ADD KEY `PRATIQUER2_FK` (`ID_SPORT`),
  ADD KEY `PRATIQUER3_FK` (`ID_PERSONNE`);

--
-- Index pour la table `sport`
--
ALTER TABLE `sport`
  ADD PRIMARY KEY (`ID_SPORT`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `competition`
--
ALTER TABLE `competition`
  ADD CONSTRAINT `FK_ASSOCIER` FOREIGN KEY (`ID_SPORT`) REFERENCES `sport` (`ID_SPORT`);

--
-- Contraintes pour la table `inscrire`
--
ALTER TABLE `inscrire`
  ADD CONSTRAINT `FK_INSCRIRE` FOREIGN KEY (`ID_EQUIPE`) REFERENCES `equipe` (`ID_EQUIPE`),
  ADD CONSTRAINT `FK_INSCRIRE2` FOREIGN KEY (`ID_COMPETITION`) REFERENCES `competition` (`ID_COMPETITION`),
  ADD CONSTRAINT `FK_INSCRIRE3` FOREIGN KEY (`ID_PERSONNE`) REFERENCES `personne` (`ID_PERSONNE`);

--
-- Contraintes pour la table `personne`
--
ALTER TABLE `personne`
  ADD CONSTRAINT `FK_CONSTITUER` FOREIGN KEY (`ID_EQUIPE`) REFERENCES `equipe` (`ID_EQUIPE`);

--
-- Contraintes pour la table `pratiquer`
--
ALTER TABLE `pratiquer`
  ADD CONSTRAINT `FK_PRATIQUER` FOREIGN KEY (`ID_EQUIPE`) REFERENCES `equipe` (`ID_EQUIPE`),
  ADD CONSTRAINT `FK_PRATIQUER2` FOREIGN KEY (`ID_SPORT`) REFERENCES `sport` (`ID_SPORT`),
  ADD CONSTRAINT `FK_PRATIQUER3` FOREIGN KEY (`ID_PERSONNE`) REFERENCES `personne` (`ID_PERSONNE`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
