SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- database: `gdps`

CREATE TABLE `acccomments` (
  `userID` bigint(255) NOT NULL,
  `userName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unused',
  `commentID` bigint(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `likes` int(11) NOT NULL DEFAULT '0',
  `isSpam` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `accounts` (
  `userName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unused',
  `accountID` bigint(255) NOT NULL,
  `saveData` longtext COLLATE utf8_unicode_ci NOT NULL,
  `isAdmin` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(255) NOT NULL,
  `friends` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unused',
  `blockedBy` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unused',
  `blocked` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unused',
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `active` int(11) NOT NULL DEFAULT '0',
  `mS` int(11) NOT NULL DEFAULT '0',
  `frS` int(11) NOT NULL DEFAULT '0',
  `cS` int(11) NOT NULL DEFAULT '0',
  `youtubeurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `twitter` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `twitch` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `registerDate` int(11) NOT NULL DEFAULT '0',
  `friendsCount` int(11) NOT NULL DEFAULT '0',
  `saveKey` blob NOT NULL,
  `discordID` bigint(20) NOT NULL DEFAULT '0',
  `discordLinkReq` bigint(20) NOT NULL DEFAULT '0',
  `isBanned` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `usernameCount` int(11) NOT NULL,
  `usernameChangeDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `actions` (
  `ID` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `value2` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `value3` int(11) NOT NULL DEFAULT '0',
  `value4` int(11) NOT NULL DEFAULT '0',
  `value5` int(11) NOT NULL DEFAULT '0',
  `value6` int(11) NOT NULL DEFAULT '0',
  `account` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `artists` (
  `ID` bigint(255) NOT NULL AUTO_INCREMENT,
  `author` text COLLATE utf8_unicode_ci NOT NULL,
  `YouTube` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE `bannedArtists` (
  `ID` bigint(255) NOT NULL AUTO_INCREMENT,
  `authorID` int(11) NOT NULL,
  `authorName` varchar(69) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE `bannedips` (
  `IP` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '127.0.0.1',
  `ID` bigint(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `blocks` (
  `ID` bigint(255) NOT NULL,
  `person1` bigint(255) NOT NULL,
  `person2` bigint(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `comments` (
  `userID` bigint(255) NOT NULL,
  `userName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `levelID` bigint(255) NOT NULL,
  `commentID` bigint(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `likes` bigint(11) NOT NULL DEFAULT '0',
  `percent` int(11) NOT NULL DEFAULT '0',
  `isSpam` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `cpshares` (
  `shareID` bigint(255) NOT NULL,
  `levelID` bigint(255) NOT NULL,
  `userID` bigint(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `dailyfeatures` (
  `feaID` bigint(255) NOT NULL,
  `levelID` bigint(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `friendreqs` (
  `accountID` bigint(255) NOT NULL,
  `toAccountID` bigint(255) NOT NULL,
  `comment` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `uploadDate` int(11) NOT NULL,
  `ID` bigint(255) NOT NULL,
  `isNew` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `friendships` (
  `ID` bigint(255) NOT NULL,
  `person1` bigint(255) NOT NULL,
  `person2` bigint(255) NOT NULL,
  `isNew1` int(11) NOT NULL,
  `isNew2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `gauntlets` (
  `ID` bigint(255) NOT NULL,
  `level1` bigint(255) NOT NULL,
  `level2` bigint(255) NOT NULL,
  `level3` bigint(255) NOT NULL,
  `level4` bigint(255) NOT NULL,
  `level5` bigint(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `levels` (
  `gameVersion` int(11) NOT NULL,
  `binaryVersion` int(11) NOT NULL DEFAULT '0',
  `userName` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `levelID` bigint(255) NOT NULL,
  `levelName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `levelDesc` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `levelVersion` int(11) NOT NULL,
  `levelLength` int(11) NOT NULL DEFAULT '0',
  `audioTrack` int(11) NOT NULL,
  `auto` int(11) NOT NULL,
  `password` int(11) NOT NULL,
  `original` int(11) NOT NULL,
  `twoPlayer` int(11) NOT NULL DEFAULT '0',
  `songID` bihint(255) NOT NULL DEFAULT '0',
  `objects` bigint(255) NOT NULL DEFAULT '0',
  `coins` int(11) NOT NULL DEFAULT '0',
  `requestedStars` int(11) NOT NULL DEFAULT '0',
  `extraString` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `levelString` longtext COLLATE utf8_unicode_ci,
  `levelInfo` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `secret` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `starDifficulty` int(11) NOT NULL DEFAULT '0' COMMENT '0=N/A 10=EASY 20=NORMAL 30=HARD 40=HARDER 50=INSANE 50=AUTO 50=DEMON',
  `downloads` bigint(255) NOT NULL DEFAULT '0',
  `likes` bigint(255) NOT NULL DEFAULT '0',
  `starDemon` int(1) NOT NULL DEFAULT '0',
  `starAuto` varchar(11) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `starStars` int(11) NOT NULL DEFAULT '0',
  `uploadDate` varchar(1337) COLLATE utf8_unicode_ci NOT NULL,
  `updateDate` bigint(11) NOT NULL,
  `rateDate` bigint(20) NOT NULL DEFAULT '0',
  `starCoins` int(11) NOT NULL DEFAULT '0',
  `starFeatured` int(11) NOT NULL DEFAULT '0',
  `starHall` int(11) NOT NULL DEFAULT '0',
  `starEpic` int(11) NOT NULL DEFAULT '0',
  `starDemonDiff` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(255) NOT NULL,
  `extID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `unlisted` int(11) NOT NULL,
  `originalReup` int(11) NOT NULL DEFAULT '0' COMMENT 'used for levelReupload.php',
  `hostname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `isCPShared` int(11) NOT NULL DEFAULT '0',
  `isDeleted` int(11) NOT NULL DEFAULT '0',
  `isLDM` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `levelscores` (
  `scoreID` bigint(255) NOT NULL,
  `accountID` bigint(255) NOT NULL,
  `levelID` bigint(255) NOT NULL,
  `percent` int(11) NOT NULL,
  `uploadDate` int(11) NOT NULL,
  `attempts` bigint(255) NOT NULL DEFAULT '0',
  `coins` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `links` (
  `ID` bigint(255) NOT NULL,
  `accountID` bigint(255) NOT NULL,
  `targetAccountID` bigint(11) NOT NULL,
  `server` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(11) NOT NULL,
  `userID` bigint(255) NOT NULL,
  `targetUserID` bigint(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `mappacks` (
  `ID` bigint(255) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `levels` varchar(512) COLLATE utf8_unicode_ci NOT NULL COMMENT 'entered as "ID of level 1, ID of level 2, ID of level 3" for example "13,14,15" (without the "s)',
  `stars` bigint(255) NOT NULL,
  `coins` bigint(255) NOT NULL,
  `difficulty` int(11) NOT NULL,
  `rgbcolors` varchar(11) COLLATE utf8_unicode_ci NOT NULL COMMENT 'entered as R,G,B',
  `colors2` varchar(11) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `messages` (
  `userID` bigint(255) NOT NULL,
  `userName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `subject` longtext COLLATE utf8_unicode_ci NOT NULL,
  `accID` bigint(255) NOT NULL,
  `messageID` bigint(255) NOT NULL,
  `toAccountID` bigint(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `secret` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unused',
  `isNew` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `modactions` (
  `ID` bigint(255) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `value2` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `value3` int(11) NOT NULL DEFAULT '0',
  `value4` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `value5` int(11) NOT NULL DEFAULT '0',
  `value6` int(11) NOT NULL DEFAULT '0',
  `account` int(11) NOT NULL DEFAULT '0',
  `value7` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `modipperms` (
  `categoryID` int(11) NOT NULL,
  `actionFreeCopy` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `modips` (
  `ID` bigint(255) NOT NULL,
  `IP` varchar(69) COLLATE utf8_unicode_ci NOT NULL,
  `isMod` int(11) NOT NULL,
  `accountID` bigint(255) NOT NULL,
  `modipCategory` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `poll` (
  `accountID` bigint(255) NOT NULL,
  `pollOption` varchar(255) NOT NULL,
  `optionID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `quests` (
  `ID` bigint(255) NOT NULL,
  `type` int(11) NOT NULL,
  `amount` bigint(255) NOT NULL,
  `reward` bigint(255) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `quests` (`ID`, `type`, `amount`, `reward`, `name`) VALUES
(1, 1, 500, 50, 'Q2'),
(2, 2, 10, 50, 'Q1'),
(3, 3, 20, 50, 'Q3'),
(4, 1, 500, 50, 'Q4'),
(5, 2, 10, 50, 'Q5'),
(6, 3, 20, 50, 'Q6');

CREATE TABLE `reports` (
  `ID` bigint(255) NOT NULL,
  `levelID` bigint(255) NOT NULL,
  `hostname` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `roleassign` (
  `assignID` bigint(255) NOT NULL,
  `roleID` bigint(255) NOT NULL,
  `accountID` bigint(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `roles` (
  `roleID` bigint(255) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `roleName` varchar(255) NOT NULL,
  `commandRate` int(11) NOT NULL DEFAULT '0',
  `commandFeature` int(11) NOT NULL DEFAULT '0',
  `commandEpic` int(11) NOT NULL DEFAULT '0',
  `commandUnepic` int(11) NOT NULL DEFAULT '0',
  `commandVerifycoins` int(11) NOT NULL DEFAULT '0',
  `commandDaily` int(11) NOT NULL DEFAULT '0',
  `commandWeekly` int(11) NOT NULL DEFAULT '0',
  `commandDelete` int(11) NOT NULL DEFAULT '0',
  `commandSetacc` int(11) NOT NULL DEFAULT '0',
  `commandRenameOwn` int(11) NOT NULL DEFAULT '1',
  `commandRenameAll` int(11) NOT NULL DEFAULT '0',
  `commandPassOwn` int(11) NOT NULL DEFAULT '1',
  `commandPassAll` int(11) NOT NULL DEFAULT '0',
  `commandDescriptionOwn` int(11) NOT NULL DEFAULT '1',
  `commandDescriptionAll` int(11) NOT NULL DEFAULT '0',
  `commandPublicOwn` int(11) NOT NULL DEFAULT '1',
  `commandPublicAll` int(11) NOT NULL DEFAULT '0',
  `commandUnlistOwn` int(11) NOT NULL DEFAULT '1',
  `commandUnlistAll` int(11) NOT NULL DEFAULT '0',
  `commandSharecpOwn` int(11) NOT NULL DEFAULT '1',
  `commandSharecpAll` int(11) NOT NULL DEFAULT '0',
  `commandSongOwn` int(11) NOT NULL DEFAULT '1',
  `commandSongAll` int(11) NOT NULL DEFAULT '0',
  `profilecommandDiscord` int(11) NOT NULL DEFAULT '1',
  `actionRateDemon` int(11) NOT NULL DEFAULT '0',
  `actionRateStars` int(11) NOT NULL DEFAULT '0',
  `actionRateDifficulty` int(11) NOT NULL DEFAULT '0',
  `actionRequestMod` int(11) NOT NULL DEFAULT '0',
  `actionSuggestRating` int(11) NOT NULL DEFAULT '0',
  `toolLeaderboardsban` int(11) NOT NULL DEFAULT '0',
  `toolPackcreate` int(11) NOT NULL DEFAULT '0',
  `toolModactions` int(11) NOT NULL DEFAULT '0',
  `toolSuggestlist` int(11) NOT NULL DEFAULT '0',
  `dashboardModTools` int(11) NOT NULL DEFAULT '0',
  `modipCategory` int(11) NOT NULL DEFAULT '0',
  `isDefault` int(11) NOT NULL DEFAULT '0',
  `commentColor` varchar(11) NOT NULL DEFAULT '000,000,000',
  `modBadgeLevel` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `roles` (`roleID`, `priority`, `roleName`, `commandRate`, `commandFeature`, `commandEpic`, `commandUnepic`, `commandVerifycoins`, `commandDaily`, `commandWeekly`, `commandDelete`, `commandSetacc`, `commandRenameOwn`, `commandRenameAll`, `commandPassOwn`, `commandPassAll`, `commandDescriptionOwn`, `commandDescriptionAll`, `commandPublicOwn`, `commandPublicAll`, `commandUnlistOwn`, `commandUnlistAll`, `commandSharecpOwn`, `commandSharecpAll`, `commandSongOwn`, `commandSongAll`, `profilecommandDiscord`, `actionRateDemon`, `actionRateStars`, `actionRateDifficulty`, `actionRequestMod`, `actionSuggestRating`, `toolLeaderboardsban`, `toolPackcreate`, `toolModactions`, `toolSuggestlist`, `dashboardModTools`, `modipCategory`, `isDefault`, `commentColor`, `modBadgeLevel`) VALUES
(1, 1, 'Admin', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '000,242,255', 2),
(2, 1, 'Admin helper', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '255,115,038', 2),
(3, 1, 'Elder Moderator', 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 1, '000,255,000', 2),
(4, 1, 'Elder Moderator Super', 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, '123,66,245', 2),
(5, 1, 'Moderator', 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, '255,255,255', 1),
(6, 1, 'Moderator Super', 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, '221,66,245', 1);

CREATE TABLE `songs` (
  `ID` bigint(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `authorID` bigint(11) NOT NULL,
  `authorName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `size` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `download` varchar(1337) COLLATE utf8_unicode_ci NOT NULL,
  `hash` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `isDisabled` int(11) NOT NULL DEFAULT '0',
  `levelsCount` int(11) NOT NULL DEFAULT '0',
  `reuploadTime` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `suggest` (
  `ID` bigint(255) NOT NULL,
  `suggestBy` bigint(255) NOT NULL DEFAULT '0',
  `suggestLevelId` bigint(255) NOT NULL DEFAULT '0',
  `suggestDifficulty` int(11) NOT NULL DEFAULT '0' COMMENT '0 - NA 10 - Easy 20 - Normal 30 - Hard 40 - Harder 50 - Insane/Demon/Auto',
  `suggestStars` int(11) NOT NULL DEFAULT '0',
  `suggestFeatured` int(11) NOT NULL DEFAULT '0',
  `suggestAuto` int(11) NOT NULL DEFAULT '0',
  `suggestDemon` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `users` (
  `isRegistered` int(11) NOT NULL,
  `userID` bigint(255) NOT NULL,
  `extID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `userName` varchar(69) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'undefined',
  `stars` bigint(255) NOT NULL DEFAULT '0',
  `demons` bihint(255) NOT NULL DEFAULT '0',
  `icon` int(11) NOT NULL DEFAULT '0',
  `color1` int(11) NOT NULL DEFAULT '0',
  `color2` int(11) NOT NULL DEFAULT '3',
  `iconType` int(11) NOT NULL DEFAULT '0',
  `coins` bigint(25) NOT NULL DEFAULT '0',
  `userCoins` bigint(255) NOT NULL DEFAULT '0',
  `special` int(11) NOT NULL DEFAULT '0',
  `gameVersion` int(11) NOT NULL DEFAULT '0',
  `secret` varchar(69) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `accIcon` int(11) NOT NULL DEFAULT '0',
  `accShip` int(11) NOT NULL DEFAULT '0',
  `accBall` int(11) NOT NULL DEFAULT '0',
  `accBird` int(11) NOT NULL DEFAULT '0',
  `accDart` int(11) NOT NULL DEFAULT '0',
  `accRobot` int(11) DEFAULT '0',
  `accGlow` int(11) NOT NULL DEFAULT '0',
  `creatorPoints` double NOT NULL DEFAULT '0',
  `IP` varchar(69) COLLATE utf8_unicode_ci NOT NULL DEFAULT '127.0.0.1',
  `lastPlayed` int(11) NOT NULL DEFAULT '0',
  `diamonds` bigint(255) NOT NULL DEFAULT '0',
  `orbs` bigint(255) NOT NULL DEFAULT '0',
  `completedLvls` int(11) NOT NULL DEFAULT '0',
  `accSpider` int(11) NOT NULL DEFAULT '0',
  `accExplosion` int(11) NOT NULL DEFAULT '0',
  `chest1time` int(11) NOT NULL DEFAULT '0',
  `chest2time` int(11) NOT NULL DEFAULT '0',
  `chest1count` int(11) NOT NULL DEFAULT '0',
  `chest2count` int(11) NOT NULL DEFAULT '0',
  `isBanned` int(11) NOT NULL DEFAULT '0',
  `isCreatorBanned` int(11) NOT NULL DEFAULT '0',
  `isLevelUploadBanned` tinyint(1) NOT NULL DEFAULT '0',
  `isAccCommentBanned` tinyint(1) NOT NULL DEFAULT '0',
  `isCommentBanned` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `acccomments`
  ADD PRIMARY KEY (`commentID`),
  ADD KEY `userID` (`userID`);

ALTER TABLE `accounts`
  ADD PRIMARY KEY (`accountID`),
  ADD UNIQUE KEY `userName` (`userName`),
  ADD KEY `isAdmin` (`isAdmin`),
  ADD KEY `userID` (`userID`);

ALTER TABLE `actions`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `type` (`type`);

ALTER TABLE `bannedips`
  ADD PRIMARY KEY (`ID`);

ALTER TABLE `blocks`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

ALTER TABLE `comments`
  ADD PRIMARY KEY (`commentID`),
  ADD KEY `levelID` (`levelID`);

ALTER TABLE `cpshares`
  ADD PRIMARY KEY (`shareID`);

ALTER TABLE `dailyfeatures`
  ADD PRIMARY KEY (`feaID`);

ALTER TABLE `friendreqs`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `toAccountID` (`toAccountID`);

ALTER TABLE `friendships`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `person1` (`person1`),
  ADD KEY `person2` (`person2`),
  ADD KEY `isNew1` (`isNew1`),
  ADD KEY `isNew2` (`isNew2`);

ALTER TABLE `gauntlets`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `level5` (`level5`);

ALTER TABLE `levels`
  ADD PRIMARY KEY (`levelID`),
  ADD KEY `levelID` (`levelID`),
  ADD KEY `levelName` (`levelName`),
  ADD KEY `starDifficulty` (`starDifficulty`),
  ADD KEY `starFeatured` (`starFeatured`),
  ADD KEY `starEpic` (`starEpic`),
  ADD KEY `starDemonDiff` (`starDemonDiff`),
  ADD KEY `userID` (`userID`),
  ADD KEY `likes` (`likes`),
  ADD KEY `downloads` (`downloads`),
  ADD KEY `starStars` (`starStars`),
  ADD KEY `songID` (`songID`),
  ADD KEY `audioTrack` (`audioTrack`),
  ADD KEY `levelLength` (`levelLength`),
  ADD KEY `twoPlayer` (`twoPlayer`);

ALTER TABLE `levelscores`
  ADD PRIMARY KEY (`scoreID`),
  ADD KEY `levelID` (`levelID`);

ALTER TABLE `links`
  ADD PRIMARY KEY (`ID`);

ALTER TABLE `mappacks`
  ADD PRIMARY KEY (`ID`);

ALTER TABLE `messages`
  ADD PRIMARY KEY (`messageID`),
  ADD KEY `toAccountID` (`toAccountID`);

ALTER TABLE `modactions`
  ADD PRIMARY KEY (`ID`);

ALTER TABLE `modipperms`
  ADD PRIMARY KEY (`categoryID`);

ALTER TABLE `modips`
  ADD PRIMARY KEY (`ID`);

ALTER TABLE `poll`
  ADD PRIMARY KEY (`optionID`);

ALTER TABLE `quests`
  ADD PRIMARY KEY (`ID`);

ALTER TABLE `reports`
  ADD PRIMARY KEY (`ID`);

ALTER TABLE `roleassign`
  ADD PRIMARY KEY (`assignID`);

ALTER TABLE `roles`
  ADD PRIMARY KEY (`roleID`);

ALTER TABLE `songs`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `name` (`name`);

ALTER TABLE `suggest`
  ADD PRIMARY KEY (`ID`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `userName` (`userName`),
  ADD KEY `stars` (`stars`),
  ADD KEY `demons` (`demons`),
  ADD KEY `coins` (`coins`),
  ADD KEY `userCoins` (`userCoins`),
  ADD KEY `gameVersion` (`gameVersion`),
  ADD KEY `creatorPoints` (`creatorPoints`),
  ADD KEY `diamonds` (`diamonds`),
  ADD KEY `orbs` (`orbs`),
  ADD KEY `completedLvls` (`completedLvls`),
  ADD KEY `isBanned` (`isBanned`),
  ADD KEY `isCreatorBanned` (`isCreatorBanned`),
  ADD KEY `isCommentBanned` (`isCommentBanned`);

ALTER TABLE `acccomments`
  MODIFY `commentID` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `accounts`
  MODIFY `accountID` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `actions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `bannedips`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `blocks`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `comments`
  MODIFY `commentID` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `cpshares`
  MODIFY `shareID` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `dailyfeatures`
  MODIFY `feaID` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `friendreqs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `friendships`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `gauntlets`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `levels`
  MODIFY `levelID` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `levelscores`
  MODIFY `scoreID` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `links`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `mappacks`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `messages`
  MODIFY `messageID` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `modactions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `modipperms`
  MODIFY `categoryID` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `modips`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `poll`
  MODIFY `optionID` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `quests`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `reports`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `roleassign`
  MODIFY `assignID` bigint(20) NOT NULL AUTO_INCREMENT;

ALTER TABLE `roles`
  MODIFY `roleID` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

ALTER TABLE `songs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `suggest`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
