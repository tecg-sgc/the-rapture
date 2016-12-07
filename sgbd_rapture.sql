-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 07 Décembre 2016 à 11:20
-- Version du serveur :  5.7.9
-- Version de PHP :  5.6.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `sgbd_rapture`
--

-- --------------------------------------------------------

--
-- Structure de la table `cities`
--

DROP TABLE IF EXISTS `cities`;
CREATE TABLE IF NOT EXISTS `cities` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `postal` varchar(45) NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `cities`
--

INSERT INTO `cities` (`id`, `postal`, `country_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '4000', 3, '2016-11-30 10:08:26', NULL, NULL),
(2, '69000', 2, '2016-11-30 10:08:26', NULL, NULL),
(3, '75008', 2, '2016-11-30 10:08:26', NULL, NULL),
(4, 'G2G1N2', 1, '2016-11-30 10:08:26', '2016-11-30 10:09:58', NULL),
(5, '4444', 4, '2016-11-30 10:08:26', '2016-11-30 10:10:03', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `city_translations`
--

DROP TABLE IF EXISTS `city_translations`;
CREATE TABLE IF NOT EXISTS `city_translations` (
  `city_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`city_id`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `city_translations`
--

INSERT INTO `city_translations` (`city_id`, `locale`, `name`) VALUES
(1, 'en', 'Liège'),
(2, 'en', 'Lyon'),
(3, 'en', 'Paris'),
(4, 'en', 'Quebec'),
(5, 'en', 'Hampden');

-- --------------------------------------------------------

--
-- Structure de la table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `countries`
--

INSERT INTO `countries` (`id`, `code`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'ca', '2016-11-30 09:55:35', NULL, NULL),
(2, 'fr', '2016-11-30 09:55:35', NULL, NULL),
(3, 'be', '2016-11-30 09:55:35', NULL, NULL),
(4, 'us', '2016-11-30 09:55:35', NULL, NULL),
(5, 'uk', '2016-11-30 09:55:35', NULL, NULL),
(6, 'au', '2016-11-30 09:55:35', NULL, NULL),
(7, 'de', '2016-11-30 09:55:35', NULL, NULL),
(8, 'it', '2016-11-30 09:55:35', NULL, NULL),
(9, 'es', '2016-11-30 09:55:35', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `country_translations`
--

DROP TABLE IF EXISTS `country_translations`;
CREATE TABLE IF NOT EXISTS `country_translations` (
  `country_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`country_id`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `country_translations`
--

INSERT INTO `country_translations` (`country_id`, `locale`, `name`) VALUES
(1, 'en', 'Canada'),
(2, 'en', 'France'),
(3, 'en', 'Belgium'),
(4, 'en', 'United States of America'),
(5, 'en', 'United Kingdoms'),
(6, 'en', 'Australia'),
(7, 'en', 'Germany'),
(8, 'en', 'Italy'),
(9, 'en', 'Spain');

-- --------------------------------------------------------

--
-- Structure de la table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
CREATE TABLE IF NOT EXISTS `currencies` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `code` varchar(45) NOT NULL,
  `symbol` varchar(45) NOT NULL,
  `rate` float NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `symbol`, `rate`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'us dollar', 'usd', '$', 1, '2016-11-30 10:12:19', NULL, NULL),
(2, 'canadian dollar', 'cad', '$', 0.745626, '2016-11-30 10:12:19', NULL, NULL),
(3, 'euros', 'eur', '€', 1.06424, '2016-11-30 10:12:19', NULL, NULL),
(4, 'British Pound', 'GBP', '£', 1.24892, '2016-11-30 10:12:19', NULL, NULL),
(5, 'Australian Dollar', 'aud', '$', 0.746437, '2016-11-30 10:12:19', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` int(10) UNSIGNED NOT NULL,
  `target_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(45) NOT NULL,
  `content` text NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`,`target_id`),
  KEY `target_id` (`target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `notification_translation`
--

DROP TABLE IF EXISTS `notification_translation`;
CREATE TABLE IF NOT EXISTS `notification_translation` (
  `notification_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(45) NOT NULL,
  `title` varchar(45) NOT NULL,
  `content` varchar(45) NOT NULL,
  PRIMARY KEY (`notification_id`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `places`
--

DROP TABLE IF EXISTS `places`;
CREATE TABLE IF NOT EXISTS `places` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `picture` varchar(45) NOT NULL,
  `city_id` int(10) UNSIGNED NOT NULL,
  `host_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`,`host_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `places`
--

INSERT INTO `places` (`id`, `picture`, `city_id`, `host_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '', 1, 1, '2016-11-30 11:23:38', NULL, NULL),
(2, '', 2, 4, '2016-11-30 11:23:38', NULL, NULL),
(3, '', 2, 5, '2016-11-30 11:23:38', NULL, NULL),
(4, '', 2, 3, '2016-11-30 11:23:38', NULL, NULL),
(5, '', 3, 3, '2016-11-30 11:23:38', NULL, NULL),
(6, '', 1, 1, '2016-11-30 12:36:38', NULL, NULL),
(7, '', 2, 4, '2016-11-30 12:36:38', NULL, NULL),
(8, '', 2, 5, '2016-11-30 12:36:38', NULL, NULL),
(9, '', 2, 3, '2016-11-30 12:36:38', NULL, NULL),
(10, '', 3, 3, '2016-11-30 12:36:38', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `place_translations`
--

DROP TABLE IF EXISTS `place_translations`;
CREATE TABLE IF NOT EXISTS `place_translations` (
  `place_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`place_id`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `place_translations`
--

INSERT INTO `place_translations` (`place_id`, `locale`, `name`, `description`) VALUES
(1, 'en', 'Small house on the hill', 'The house is cozy and blue'),
(1, 'fr', 'Petite maison sur la colline', 'La maison est confortable et bleu'),
(2, 'en', 'Barn to sleep in !', 'A bit smelly, but overall confortable'),
(2, 'fr', 'Étable pour dormir !', 'Un peu puant, mais plutôt confortable'),
(3, 'en', 'Bedroom + bathroom', 'Simple room, short stay'),
(3, 'fr', 'Chambre + Salle de bain', 'Chambre simple, court séjour'),
(4, 'en', 'Great view on the Eiffel Tower', 'Small room, but great view'),
(4, 'fr', 'Superbe vue sur la Tour Eiffel', 'Petite chambre, mais belle vue'),
(5, 'en', 'Small Country House', 'Explore the nature around it'),
(5, 'fr', 'Petite maison de campagne', 'Explorez la nature aux alentours');

-- --------------------------------------------------------

--
-- Structure de la table `trips`
--

DROP TABLE IF EXISTS `trips`;
CREATE TABLE IF NOT EXISTS `trips` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `picture` varchar(45) NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `capacity` int(11) NOT NULL,
  `city_id` int(10) UNSIGNED NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `host_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `trips`
--

INSERT INTO `trips` (`id`, `picture`, `price`, `capacity`, `city_id`, `country_id`, `host_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '', 678, 23, 1, 3, 1, '2016-11-30 12:39:37', NULL, NULL),
(2, '', 234, 4, 5, 4, 9, '2016-11-30 12:39:37', NULL, NULL),
(3, '', 638, 5, 3, 2, 3, '2016-11-30 12:39:37', NULL, NULL),
(4, '', 98, 2, 4, 1, 2, '2016-11-30 12:39:37', NULL, NULL),
(5, '', 435, 4, 2, 2, 3, '2016-11-30 12:39:37', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `trip_dates`
--

DROP TABLE IF EXISTS `trip_dates`;
CREATE TABLE IF NOT EXISTS `trip_dates` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `trip_id` int(11) UNSIGNED NOT NULL,
  `begins_at` date NOT NULL,
  `ends_at` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trip_id` (`trip_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `trip_dates`
--

INSERT INTO `trip_dates` (`id`, `trip_id`, `begins_at`, `ends_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '2016-11-09', '2016-11-30', '2016-11-29 23:00:00', NULL, NULL),
(2, 2, '2016-11-11', '2016-11-23', '2016-11-29 23:00:00', NULL, NULL),
(3, 3, '2017-01-05', '2017-03-10', '2016-11-29 23:00:00', NULL, NULL),
(4, 4, '2017-03-03', '2017-07-13', '2016-11-29 23:00:00', NULL, NULL),
(5, 5, '2016-09-06', '2016-11-04', '2016-11-29 23:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `trip_places`
--

DROP TABLE IF EXISTS `trip_places`;
CREATE TABLE IF NOT EXISTS `trip_places` (
  `trip_id` int(10) UNSIGNED NOT NULL,
  `place_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`trip_id`,`place_id`),
  KEY `fk_places_trip` (`place_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `trip_places`
--

INSERT INTO `trip_places` (`trip_id`, `place_id`) VALUES
(1, 1),
(5, 4),
(3, 5);

-- --------------------------------------------------------

--
-- Structure de la table `trip_translations`
--

DROP TABLE IF EXISTS `trip_translations`;
CREATE TABLE IF NOT EXISTS `trip_translations` (
  `trip_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(45) NOT NULL,
  `title` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`trip_id`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `trip_translations`
--

INSERT INTO `trip_translations` (`trip_id`, `locale`, `title`, `description`) VALUES
(1, 'en', 'Nice trip in Belgium', 'Come and drink beer !'),
(2, 'en', 'Maine welcomes you', 'USA ! USA ! USA !'),
(3, 'en', 'Viva la France !', 'Meet French people and their baguettes !'),
(4, 'en', 'Canada', 'Join the 2nd biggest country !'),
(5, 'en', 'France', 'I don''t remember which city');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `picture` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `birthday` date NOT NULL,
  `address` varchar(45) NOT NULL,
  `postal` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `locale` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `account` int(11) NOT NULL,
  `currency_id` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `currency_id_2` (`currency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `password`, `email`, `picture`, `phone`, `birthday`, `address`, `postal`, `city`, `locale`, `country`, `account`, `currency_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Stéphanie', 'Cloutier', 'mdp123', 'stephclou4@gmail.com', '', '0487204373', '1995-01-11', '20 rue Julien Lahaut', '4000', 'Liège', 'fr', 'Belgium', 1, 3, '2016-11-30 11:16:22', '2016-11-30 11:16:49', NULL),
(2, 'Gabrielle', 'Cloutier', 'Mdp321', 'gabylacanadienne@hotmail.com', '', '4181239887', '1997-01-01', '123 rue des petits pois', 'G2G2F3', 'Québec', 'fr', 'Canada', 1, 2, '2016-11-30 11:16:22', '2016-11-30 11:16:53', NULL),
(3, 'Quentin', 'LeBidoof', 'bidoofclavi', 'bidooflemario@wesh.com', '', '0033987654', '1996-11-02', '233 rue des apricots', '59226', 'Rumegies', 'fr', 'France', 1, 3, '2016-11-30 11:16:22', '2016-11-30 11:16:57', NULL),
(4, 'Brice', 'LeSurfeur', 'jesurfcmavi', 'bricelesurfeur@hotmail.com', '', '0000123456', '1990-12-25', '765 Surfers Alley', '4353', 'East Cooyar', 'en', 'Australia', 1, 5, '2016-11-30 11:16:22', '2016-11-30 11:17:00', NULL),
(5, 'Sherlock', 'Holmes', 'JeSuisCucumberBatch', 'sher.lock@holmes.com', '', '0022938475', '1854-01-06', '221B Baker Street', 'NW16XE', 'London', 'en', 'United Kingdom', 1, 4, '2016-11-30 11:16:22', '2016-11-30 11:17:04', NULL),
(6, 'Cédric', 'Müller', 'pass', 'muller.cedric.96@gmail.com', '', '0479278526', '1996-05-30', 'Chaussée de Verviers, 24', '4910', 'Theux', 'fr', 'Belgique', 1, 3, '2016-11-30 11:19:16', NULL, NULL),
(7, 'Xavier', 'Charles', 'MenXXX', 'admin@mutant.com', '', '0478654895', '1750-02-24', 'Rue des mutants, 39', '95450', 'MutantVille', 'en', 'MutantLand', 1, 1, '2016-11-30 11:19:16', NULL, NULL),
(8, 'Harry', 'Potter', 'theBoyWhoLived', 'harrypotter@ministryofmagic.com', '', '04776655', '1980-07-31', 'Privet Drive, 4', 'Surrey', 'Little Whinging', 'en', 'Great Britain', 1, 4, '2016-11-30 11:19:16', NULL, NULL),
(9, 'John', 'Doe', 'iAmNobody', 'whoami@nobody.com', '', '0137912045', '1964-02-07', 'Who knows ?', 'notyou', 'youllneverknow', 'en', 'United States of America', 1, 1, '2016-11-30 11:19:16', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user_notification`
--

DROP TABLE IF EXISTS `user_notification`;
CREATE TABLE IF NOT EXISTS `user_notification` (
  `user_id` int(11) UNSIGNED NOT NULL,
  `notification_id` int(11) UNSIGNED NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`notification_id`,`created_at`),
  KEY `fk_notification_id` (`notification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `user_places`
--

DROP TABLE IF EXISTS `user_places`;
CREATE TABLE IF NOT EXISTS `user_places` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `place_id` int(10) UNSIGNED NOT NULL,
  `rate` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`place_id`),
  KEY `fk_place_id` (`place_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `user_places`
--

INSERT INTO `user_places` (`user_id`, `place_id`, `rate`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 150, '2016-11-30 12:36:50', NULL, NULL),
(3, 4, 234, '2016-11-30 12:36:50', NULL, NULL),
(3, 5, 176, '2016-11-30 12:36:50', NULL, NULL),
(4, 2, 59, '2016-11-30 12:36:50', NULL, NULL),
(5, 3, 112, '2016-11-30 12:36:50', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user_place_reservation`
--

DROP TABLE IF EXISTS `user_place_reservation`;
CREATE TABLE IF NOT EXISTS `user_place_reservation` (
  `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `place_id` int(10) UNSIGNED NOT NULL,
  `participants` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`place_id`,`created_at`),
  KEY `fk_place_id_reservation` (`place_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `user_place_reservation`
--

INSERT INTO `user_place_reservation` (`user_id`, `place_id`, `participants`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 3, '2016-11-30 12:38:39', NULL, NULL),
(1, 4, 1, '2016-11-30 12:38:39', NULL, NULL),
(2, 2, 4, '2016-11-30 12:38:39', NULL, NULL),
(2, 4, 2, '2016-11-30 12:38:39', NULL, NULL),
(3, 1, 3, '2016-11-30 12:38:39', NULL, NULL),
(3, 2, 2, '2016-11-30 12:38:39', NULL, NULL),
(3, 5, 7, '2016-11-30 12:38:39', NULL, NULL),
(5, 4, 3, '2016-11-30 12:38:39', NULL, NULL),
(8, 1, 5, '2016-11-30 12:38:39', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user_trip_dates`
--

DROP TABLE IF EXISTS `user_trip_dates`;
CREATE TABLE IF NOT EXISTS `user_trip_dates` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `trip_date_id` int(10) UNSIGNED NOT NULL,
  `participants` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`trip_date_id`),
  KEY `fk_trip_dates_user` (`trip_date_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `user_trip_dates`
--

INSERT INTO `user_trip_dates` (`user_id`, `trip_date_id`, `participants`, `created_at`, `updated_at`, `deleted_at`) VALUES
(7, 3, 3, '2016-11-30 12:45:25', NULL, NULL),
(8, 1, 2, '2016-11-30 12:45:25', NULL, NULL);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `fk_country_cities` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `city_translations`
--
ALTER TABLE `city_translations`
  ADD CONSTRAINT `fk_cities_translation` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `country_translations`
--
ALTER TABLE `country_translations`
  ADD CONSTRAINT `fk_country_translations` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `fk_author` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_target` FOREIGN KEY (`target_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `notification_translation`
--
ALTER TABLE `notification_translation`
  ADD CONSTRAINT `fk_notification_translations` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `place_translations`
--
ALTER TABLE `place_translations`
  ADD CONSTRAINT `fk_places_translations` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `trip_dates`
--
ALTER TABLE `trip_dates`
  ADD CONSTRAINT `fk_trip_dates` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `trip_places`
--
ALTER TABLE `trip_places`
  ADD CONSTRAINT `fk_places_trip` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_trip_places` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `trip_translations`
--
ALTER TABLE `trip_translations`
  ADD CONSTRAINT `fk_trip_translations` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_currency_user` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `user_notification`
--
ALTER TABLE `user_notification`
  ADD CONSTRAINT `fk_notification_id` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `user_places`
--
ALTER TABLE `user_places`
  ADD CONSTRAINT `fk_place_id` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_id_places` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `user_place_reservation`
--
ALTER TABLE `user_place_reservation`
  ADD CONSTRAINT `fk_place_id_reservation` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`),
  ADD CONSTRAINT `fk_user_id_places_reservation` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `user_trip_dates`
--
ALTER TABLE `user_trip_dates`
  ADD CONSTRAINT `fk_trip_dates_user` FOREIGN KEY (`trip_date_id`) REFERENCES `trip_dates` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_trip_dates` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
