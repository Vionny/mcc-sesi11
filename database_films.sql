-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 12, 2022 at 10:20 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database_films`
--

-- --------------------------------------------------------

--
-- Table structure for table `films`
--

CREATE TABLE `films` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `genre` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `films`
--

INSERT INTO `films` (`id`, `title`, `genre`, `image`, `description`) VALUES
(1, 'Avengers Infinity War', 'Action', 'https://m.media-amazon.com/images/M/MV5BMjMxNjY2MDU1OV5BMl5BanBnXkFtZTgwNzY1MTUwNTM@._V1_FMjpg_UX1000_.jpg', 'The Avengers must stop Thanos, an intergalactic warlord, from getting his hands on all the infinity stones.'),
(2, 'Avengers End Game', 'Action', 'https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_.jpg', 'After Thanos, the Avengers must reunite and assemble again to reinvigorate their trounced allies and restore balance.'),
(3, 'Loki', 'Action', 'https://m.media-amazon.com/images/M/MV5BNTkwOTE1ZDYtODQ3Yy00YTYwLTg0YWQtYmVkNmFjNGZlYmRiXkEyXkFqcGdeQXVyNTc4MjczMTM@._V1_FMjpg_UX1000_.jpg', 'Loki, steps out of his brother\'s shadow to embark on an adventure that takes place after the events of End Game.'),
(4, 'Hawkeye', 'Action', 'https://m.media-amazon.com/images/M/MV5BYmY2NjQ5OTAtMGZmYS00ZTllLWI4YTctMjlhYjcyMjYzYWFhXkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_.jpg', 'Clint Barton and Kate Bishop shoot a few arrows and try to avoid becoming the target themselves.'),
(5, 'Wanda Vision', 'Action', 'https://m.media-amazon.com/images/M/MV5BZGEwYmMwZmMtMTQ3MS00YWNhLWEwMmQtZTU5YTIwZmJjZGQ0XkEyXkFqcGdeQXVyMTI5MzA5MjA1._V1_FMjpg_UX1000_.jpg', 'Super-powered beings Wanda and Vision begin to suspect that everything is not as it seems.'),
(6, 'What If ?', 'Action', 'https://m.media-amazon.com/images/M/MV5BMGUzODlkMGQtMjhiMi00NzQ5LThmMzctNmE3N2FkNDJjMWEyXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg', 'Reimagining noteworthy events in the Marvel Cinematic Universe and creating a multiverse of infinite possibilities.'),
(7, 'Spiderman No Way Home', 'Action', 'https://m.media-amazon.com/images/M/MV5BNWQ1OTZlZjgtNDEzYS00MWRmLWE5ZTEtODA4NmY3YjU3ZTE5XkEyXkFqcGdeQXVyODkzNTgxMDg@._V1_FMjpg_UX1000_.jpg', 'Peter Parker seeks Doctor Strange\'s help to make people forget about Spiderman\'s identity.'),
(8, 'Spiderman Homecoming', 'Action', 'https://m.media-amazon.com/images/M/MV5BOGQ5YTM3YzctOTVmMC00OGIyLWFkZTYtMWYwOWZhMjA2MWMwXkEyXkFqcGdeQXVyMjUyMTE5MA@@._V1_.jpg', 'Spider-Man: Homecoming is a 2017 American superhero film based on the Marvel Comics character Spider-Man.'),
(9, 'The Amazing Spiderman', 'Action', 'https://m.media-amazon.com/images/M/MV5BMjMyOTM4MDMxNV5BMl5BanBnXkFtZTcwNjIyNzExOA@@._V1_.jpg', 'Peter Parker, an outcast high school student, gets bitten by a radioactive spider and attains superpowers.'),
(10, 'Spiderman 3', 'Action', 'https://m.media-amazon.com/images/M/MV5BYTk3MDljOWQtNGI2My00OTEzLTlhYjQtOTQ4ODM2MzUwY2IwXkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_FMjpg_UX1000_.jpg', 'Peter Parker becomes one with a symbiotic alien that bolsters his Spider-Man avatar and affects his psyche.'),
(11, 'Doctor Strange', 'Action', 'https://cdnb.artstation.com/p/assets/images/images/021/449/133/large/narinder-singh-docter-strange.jpg?1571734835', 'Doctor Strange is a 2016 American superhero film based on the Marvel Comics character of the same name.'),
(12, 'Doctor Strange : Multiverse of Madness', 'Action', 'https://m.media-amazon.com/images/M/MV5BNWM0ZGJlMzMtZmYwMi00NzI3LTgzMzMtNjMzNjliNDRmZmFlXkEyXkFqcGdeQXVyMTM1MTE1NDMx._V1_FMjpg_UX1000_.jpg', 'Dr Stephen Strange casts a forbidden spell that opens a portal to the multiverse.'),
(13, 'Iron Man', 'Action', 'https://m.media-amazon.com/images/M/MV5BMTczNTI2ODUwOF5BMl5BanBnXkFtZTcwMTU0NTIzMw@@._V1_FMjpg_UX1000_.jpg', 'When Tony Stark, an industrialist, is captured, he constructs a high-tech armoured suit to escape.'),
(14, 'Iron Man 3', 'Action', 'https://m.media-amazon.com/images/M/MV5BMjE5MzcyNjk1M15BMl5BanBnXkFtZTcwMjQ4MjcxOQ@@._V1_FMjpg_UX1000_.jpg', 'After failing to defeat his enemy, Tony embarks on a journey of self-discovery as he fights against the powerful Mandarin.'),
(15, 'The Incredible Hulk', 'Action', 'https://m.media-amazon.com/images/M/MV5BMTUyNzk3MjA1OF5BMl5BanBnXkFtZTcwMTE1Njg2MQ@@._V1_FMjpg_UX1000_.jpg', 'Dr Bruce Banner subjects himself to high levels of gamma radiation which triggers his transformation into a huge green creature.'),
(16, 'Thor Ragnarok', 'Action', 'https://m.media-amazon.com/images/M/MV5BMjMyNDkzMzI1OF5BMl5BanBnXkFtZTgwODcxODg5MjI@._V1_FMjpg_UX1000_.jpg', 'Deprived of his mighty hammer Mjolnir, Thor must escape the other side of the universe to save his home, Asgard.'),
(17, 'Thor Love and Thunder', 'Action', 'https://m.media-amazon.com/images/M/MV5BYmMxZWRiMTgtZjM0Ny00NDQxLWIxYWQtZDdlNDNkOTEzYTdlXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg', 'Thor embarks on a journey unlike anything he\'s ever faced -- a quest for inner peace.'),
(18, 'The Winter Soldier', 'Action', 'https://m.media-amazon.com/images/M/MV5BMzA2NDkwODAwM15BMl5BanBnXkFtZTgwODk5MTgzMTE@._V1_FMjpg_UX1000_.jpg', 'As Steve Rogers adapts to the complexities of a contemporary world, he joins Natasha Romanoff and Sam Wilson.'),
(19, 'The First Avenger', 'Action', 'https://m.media-amazon.com/images/M/MV5BMTYzOTc2NzU3N15BMl5BanBnXkFtZTcwNjY3MDE3NQ@@._V1_FMjpg_UX1000_.jpg', 'During World War II, Steve Rogers decides to volunteer in an experiment that transforms his weak body.'),
(20, 'Guardian of The Galaxy', 'Action', 'https://m.media-amazon.com/images/M/MV5BMTAwMjU5OTgxNjZeQTJeQWpwZ15BbWU4MDUxNDYxODEx._V1_FMjpg_UX1000_.jpg', 'Peter escapes from the planet Morag with a valuable orb that Ronan the Accuser wants.'),
(21, 'Guardian of The Galaxy Vol 2', 'Action', 'https://m.media-amazon.com/images/M/MV5BNjM0NTc0NzItM2FlYS00YzEwLWE0YmUtNTA2ZWIzODc2OTgxXkEyXkFqcGdeQXVyNTgwNzIyNzg@._V1_FMjpg_UX1000_.jpg', 'After a successful mission, Quill and his team of galactic defenders meet Ego, a man claiming to be Quill\'s father.'),
(22, 'Avengers Age of Ultron', 'Action', 'https://m.media-amazon.com/images/M/MV5BMTM4OGJmNWMtOTM4Ni00NTE3LTg3MDItZmQxYjc4N2JhNmUxXkEyXkFqcGdeQXVyNTgzMDMzMTg@._V1_FMjpg_UX1000_.jpg', 'Tony Stark builds an artificial intelligence system named Ultron with the help of Bruce Banner.'),
(23, 'The Avengers', 'Action', 'https://m.media-amazon.com/images/M/MV5BNDYxNjQyMjAtNTdiOS00NGYwLWFmNTAtNThmYjU5ZGI2YTI1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg', 'Nick Fury is compelled to launch the Avengers Initiative when Loki poses a threat to planet Earth.'),
(24, 'Civil War', 'Action', 'https://m.media-amazon.com/images/M/MV5BMjQ0MTgyNjAxMV5BMl5BanBnXkFtZTgwNjUzMDkyODE@._V1_.jpg', 'Friction arises between the Avengers when one group supports the government\'s decision.'),
(25, 'Captain Marvel', 'Action', 'https://m.media-amazon.com/images/M/MV5BMTE0YWFmOTMtYTU2ZS00ZTIxLWE3OTEtYTNiYzBkZjViZThiXkEyXkFqcGdeQXVyODMzMzQ4OTI@._V1_FMjpg_UX1000_.jpg', 'Amidst a mission, Vers, a Kree warrior, gets separated from her team and is stranded on Earth.'),
(26, 'Frozen 2', 'Action', 'https://m.media-amazon.com/images/M/MV5BMjA0YjYyZGMtN2U0Ni00YmY4LWJkZTItYTMyMjY3NGYyMTJkXkEyXkFqcGdeQXVyNDg4NjY5OTQ@._V1_FMjpg_UX1000_.jpg', 'Queen Elsa begins to hear a mysterious melodic voice calling to her. Unsettled, she answers it, thus awakening the elemental spirits.'),
(27, 'Hobbs and Shaw', 'Action', 'https://m.media-amazon.com/images/M/MV5BOTIzYmUyMmEtMWQzNC00YzExLTk3MzYtZTUzYjMyMmRiYzIwXkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_FMjpg_UX1000_.jpg', 'US agent Luke Hobbs and British mercenary Deckard Shaw are forced to put their rivalry side.'),
(28, 'Fast and Furious 9', 'Action', 'https://m.media-amazon.com/images/M/MV5BMjI0NmFkYzEtNzU2YS00NTg5LWIwYmMtNmQ1MTU0OGJjOTMxXkEyXkFqcGdeQXVyMjMxOTE0ODA@._V1_.jpg', 'Dominic Toretto is forced to put his retirement on hold when Cipher, the dangerous cyberterrorist.'),
(29, 'Tokyo Drift', 'Action', 'https://m.media-amazon.com/images/M/MV5BMTQ2NTMxODEyNV5BMl5BanBnXkFtZTcwMDgxMjA0MQ@@._V1_FMjpg_UX1000_.jpg', 'In order to avoid jail time, an errant car racer is sent to live with his father in Tokyo.'),
(30, 'The Incredibles', 'Action', 'https://m.media-amazon.com/images/M/MV5BMTY5OTU0OTc2NV5BMl5BanBnXkFtZTcwMzU4MDcyMQ@@._V1_FMjpg_UX1000_.jpg', 'Forced to adopt a civilian identity and stuck in a white-collar job, Mr Incredible itches to get back into action.'),
(31, '2012', 'Action', 'https://m.media-amazon.com/images/M/MV5BMTY0MjEyODQzMF5BMl5BanBnXkFtZTcwMTczMjQ4Mg@@._V1_FMjpg_UX1000_.jpg', 'It\'s the end of the world and only a select few millionaires were warned while the rest of the people are left to fend for themselves.'),
(32, 'Stranger Things Season 4', 'Action', 'https://m.media-amazon.com/images/M/MV5BZjNhMzk5ZTAtNjk3Ni00MjIxLTg0YmUtNGYwNDQxNTdmODhiXkEyXkFqcGdeQXVyMTM0MTIyNzY4._V1_.jpg', 'In 1980s Indiana, a group of young friends witness supernatural forces and secret government exploits.'),
(86, 'Cumi-cumi', 'sea', 'https://m.media-amazon.com/images/M/MV5BZjNhMzk5ZTAtNjk3Ni00MjIxLTg0YmUtNGYwNDQxNTdmODhiXkEyXkFqcGdeQXVyMTM0MTIyNzY4._V1_.jpg', 'tesDeescCumi'),
(90, 'Just', 'Test', 'http://10.0.2.2:3000/assets/image_picker-468709774.jpg', 'Test');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userId` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userId`, `username`, `password`, `token`) VALUES
(1, 'Vincent', 'benedict', 'qcivkrx2z531i77ksy6w'),
(2, 'Joshua', 'Joshua', '92984lem3r06tll2am4y'),
(3, 'benedictvincentrpj7@gmail.com', '', 'ya29.a0AVA9y1szxcmRnsO0TDfjtVv6zZSQ1idYOqr1rpXSXJMBaCFx0O32y1UH5ZXtXmoorE_W499Ez6jZjI4PdVhIc8ikU2JMLKmoV8lYpPR0pfWDcPxAdwbFSrn84b8cy7VMTHg4j1m8E627nv8nFcqxRYSTsgY7aCgYKATASAQASFQE65dr8LrjuDKWUZmgN_bpDoH1KCA0163'),
(6, 'myUsername', 'myPassword', 'mhpwjccbf8'),
(7, 'Felix', 'Gozali', 'peb08qgy6q'),
(8, 'myUsername', 'myPassword', '9t2h59fu3cq5oto'),
(9, 'Lukas', 'Lukas', '7c649undefinedq5r8zltwt');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `films`
--
ALTER TABLE `films`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `films`
--
ALTER TABLE `films`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
