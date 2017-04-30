-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Dim 30 Avril 2017 à 20:49
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `pokedb`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Electric'),
(4, 'Fire'),
(9, 'Flying'),
(2, 'Normal'),
(3, 'Poison'),
(10, 'Psychic'),
(8, 'Rock'),
(5, 'Water');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id` int(11) NOT NULL,
  `fos_user_id` int(11) NOT NULL,
  `isValid` tinyint(1) NOT NULL,
  `created_At` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fos_user`
--

CREATE TABLE `fos_user` (
  `id` int(11) NOT NULL,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `fos_user`
--

INSERT INTO `fos_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`) VALUES
(1, 'Admin', 'admin', 'admin@test.com', 'admin@test.com', 1, 'z8kuxW4cDG.sJbdy1QnCOrUB4UZvW63elZqDYMwuJWI', 'Gh4OV+Cz8XpdJ3FFjINWfBs3cDU8jmtSx7TDb2lZ76VtVkVLzFwqnnHZckeVAA14opVBuUCwBwK7QK8yPloxqA==', '2017-04-30 19:03:17', NULL, NULL, 'a:1:{i:0;s:16:"ROLE_SUPER_ADMIN";}');

-- --------------------------------------------------------

--
-- Structure de la table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `details` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `item`
--

INSERT INTO `item` (`id`, `category_id`, `name`, `price`, `color`, `image`, `details`, `height`, `weight`) VALUES
(2, NULL, 'Pikachu', 200, 'Yellow and Black', 'http://www.p-pokemon.com/images-pokemon-actualite/pict_3738_1.jpg', 'Pikachu is a yellow mouse Pokemon from the fictional Pokémon world that was created by Satoshi Tajiri.', 40, 6),
(3, NULL, 'Hypno', 150, 'Yellow and White', 'https://pkmngowiki.com/images/0/06/Hypno_%28Pok%C3%A9mon%29.png', 'Hypno is a bipedal, humanoid Pokémon that has yellow skin. It has two triangular, ears on the top of its head and two sleepy looking eyes with a large nose underneath. On its neck, it has a ruff of white fur, which is longer on the female. Hypno has five', 160, 76),
(4, NULL, 'Bulbasaur', 180, 'Green', 'https://3.bp.blogspot.com/-VwRFuZcful8/VuYPzhZ75NI/AAAAAAAAF8o/I_WCzYQV1LYzheKZ0VYeCckWIUNaKOR2A/s1600/Bulbasaur%2BField.PNG', 'Bulbasaur resembles a small, squatting dinosaur that walks on four legs, but bears three claws on each of its feet and has no tail. It also has large, red eyes and very sharp teeth. Its skin is a light, turquoise color with dark, green spots. It has three', 60, 7),
(5, NULL, 'Meowth', 200, 'Beige', 'https://vignette2.wikia.nocookie.net/villains/images/9/9a/Meowth_2.png/revision/latest?cb=20160226175712', 'Meowth has two white whiskers on each side of its oval-shaped face and two hairs sticking up on either side of the coin-like gem on its forehead, and highly resembles a cat. Meowth\'s tail and feet are cream-colored like the rest of it, but they are brown', 40, 4);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_64C19C15E237E06` (`name`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fos_user`
--
ALTER TABLE `fos_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  ADD UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`),
  ADD UNIQUE KEY `UNIQ_957A6479C05FB297` (`confirmation_token`);

--
-- Index pour la table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1F1B251E5E237E06` (`name`),
  ADD KEY `IDX_1F1B251E12469DE2` (`category_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `fos_user`
--
ALTER TABLE `fos_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `FK_1F1B251E12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
