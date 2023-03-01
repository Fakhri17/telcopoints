-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table telcopoints.tp_addresses
CREATE TABLE IF NOT EXISTS `tp_addresses` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tp_fk_qxvavofzjjgozholkdtrcwggpvmujbqsqdfk` (`ownerId`),
  CONSTRAINT `tp_fk_eyjxwriokzzzosbcidipollnweveogfwtuyd` FOREIGN KEY (`id`) REFERENCES `tp_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tp_fk_qxvavofzjjgozholkdtrcwggpvmujbqsqdfk` FOREIGN KEY (`ownerId`) REFERENCES `tp_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_addresses: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_addresses` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_announcements
CREATE TABLE IF NOT EXISTS `tp_announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tp_idx_camlrzwjcjhiucknviesewhhfwmsuvlpfzgv` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `tp_idx_cizfqeqcyzyyhjdnqkiliyiwdaxphkokwlps` (`dateRead`),
  KEY `tp_fk_gwwrgasnuoloshqmgtbuiklzgwiqaodyxbbt` (`pluginId`),
  CONSTRAINT `tp_fk_gwwrgasnuoloshqmgtbuiklzgwiqaodyxbbt` FOREIGN KEY (`pluginId`) REFERENCES `tp_plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tp_fk_isfejzwinblweapmwfttbgrdjbeptjjrqqvu` FOREIGN KEY (`userId`) REFERENCES `tp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_announcements: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_announcements` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_assetindexdata
CREATE TABLE IF NOT EXISTS `tp_assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` int(11) NOT NULL,
  `volumeId` int(11) NOT NULL,
  `uri` text,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int(11) DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tp_idx_jqgdhoqbatatoskzbotkxhsevjndetedyuoo` (`sessionId`,`volumeId`),
  KEY `tp_idx_qdhcapojxvjxmgqurdqcfappsujpqltzftod` (`volumeId`),
  CONSTRAINT `tp_fk_hflsarowikdmkwiwulomjniupwojxisbunfs` FOREIGN KEY (`sessionId`) REFERENCES `tp_assetindexingsessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tp_fk_uxeypwpynqkvciiakkuaymahhkpgqxlblelc` FOREIGN KEY (`volumeId`) REFERENCES `tp_volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_assetindexdata: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_assetindexdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_assetindexdata` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_assetindexingsessions
CREATE TABLE IF NOT EXISTS `tp_assetindexingsessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text,
  `totalEntries` int(11) DEFAULT NULL,
  `processedEntries` int(11) NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_assetindexingsessions: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_assetindexingsessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_assetindexingsessions` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_assets
CREATE TABLE IF NOT EXISTS `tp_assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text,
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tp_idx_lzagywygvziczggekiexebwdotdbnlfjalmo` (`filename`,`folderId`),
  KEY `tp_idx_erobsrfwokkrbynrqeyjuplgxjnggwbynqdy` (`folderId`),
  KEY `tp_idx_nevmhyhnpmphjexknjbzfiuvmvlnkathhvjj` (`volumeId`),
  KEY `tp_fk_rhwrahzlwoetygcutsiuclowcuwckqfisfwe` (`uploaderId`),
  CONSTRAINT `tp_fk_blshnzhlnnxkfykenwujeizvkvkqpzyqssna` FOREIGN KEY (`folderId`) REFERENCES `tp_volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tp_fk_ktdpblregdoyhofzgoqnhrenrwpznrafxwrp` FOREIGN KEY (`id`) REFERENCES `tp_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tp_fk_rhwrahzlwoetygcutsiuclowcuwckqfisfwe` FOREIGN KEY (`uploaderId`) REFERENCES `tp_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tp_fk_xdejfvyvrwtnrrdzdethcqdpekjvzdvawbll` FOREIGN KEY (`volumeId`) REFERENCES `tp_volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_assets: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_assets` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_categories
CREATE TABLE IF NOT EXISTS `tp_categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tp_idx_midhmzrqjaeumxfmxfssvrcnggszpqajpocg` (`groupId`),
  KEY `tp_fk_bqffrjjnmkaljxrwyndtzcaozuwewtwgjpwz` (`parentId`),
  CONSTRAINT `tp_fk_bqffrjjnmkaljxrwyndtzcaozuwewtwgjpwz` FOREIGN KEY (`parentId`) REFERENCES `tp_categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tp_fk_glcidhlxqixpzkbzcsxaeirnptykmbztfjhq` FOREIGN KEY (`groupId`) REFERENCES `tp_categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tp_fk_hkygxqxteyozrqeyqnptopjguudqzarnhytf` FOREIGN KEY (`id`) REFERENCES `tp_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_categories: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_categories` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_categorygroups
CREATE TABLE IF NOT EXISTS `tp_categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tp_idx_dayqxoybeehcglqbhvdopektrambqogdwqft` (`name`),
  KEY `tp_idx_tjhusslhcmwagcyeyhwjxmkojaerhjxjvkpu` (`handle`),
  KEY `tp_idx_lkjqacgdjhswgtzwniheiaaklqtzradenlmf` (`structureId`),
  KEY `tp_idx_idjygwqwkhcprhbajjkzedgixyldcahmgopy` (`fieldLayoutId`),
  KEY `tp_idx_lxuxspfrqaepgavtxgppjehvwihfwzngdeuh` (`dateDeleted`),
  CONSTRAINT `tp_fk_denueahkwprofpbombwosxukqsbkdikrtful` FOREIGN KEY (`fieldLayoutId`) REFERENCES `tp_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tp_fk_leporbnlyvtkfmbvcnvokiwqajjeppaxuaye` FOREIGN KEY (`structureId`) REFERENCES `tp_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_categorygroups: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_categorygroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_categorygroups` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_categorygroups_sites
CREATE TABLE IF NOT EXISTS `tp_categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tp_idx_oerefndzkhfydjivsgyhylmopnxexmavmcbm` (`groupId`,`siteId`),
  KEY `tp_idx_sikqizdwzugmwrhanphjzccbglqlucdnclyc` (`siteId`),
  CONSTRAINT `tp_fk_ggvouospstnzfilncmsaaipbpkpjxnulvzof` FOREIGN KEY (`groupId`) REFERENCES `tp_categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tp_fk_wtyompcntgphfmnqrelkeyixavmwsqsuunkn` FOREIGN KEY (`siteId`) REFERENCES `tp_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_categorygroups_sites: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_categorygroups_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_categorygroups_sites` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_changedattributes
CREATE TABLE IF NOT EXISTS `tp_changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `tp_idx_froxgkphtblslqtjzmsugrxgnlmvbgoqwnqf` (`elementId`,`siteId`,`dateUpdated`),
  KEY `tp_fk_urixtarrbvwrwouclilnvjhyuxebjpurlyke` (`siteId`),
  KEY `tp_fk_giunfznvgguoplibfvxrjwzxdqwrxmlzqjcf` (`userId`),
  CONSTRAINT `tp_fk_giunfznvgguoplibfvxrjwzxdqwrxmlzqjcf` FOREIGN KEY (`userId`) REFERENCES `tp_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `tp_fk_kpthlwdgtrphmmpbplbupsfvczgjrbpphsws` FOREIGN KEY (`elementId`) REFERENCES `tp_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tp_fk_urixtarrbvwrwouclilnvjhyuxebjpurlyke` FOREIGN KEY (`siteId`) REFERENCES `tp_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_changedattributes: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_changedattributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_changedattributes` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_changedfields
CREATE TABLE IF NOT EXISTS `tp_changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `tp_idx_jywgyjzgxgtcsxvoxobnjdvmaeosvbfuzqli` (`elementId`,`siteId`,`dateUpdated`),
  KEY `tp_fk_lqfoafjglkvtiynhqlehujqlsironkxwsvmv` (`siteId`),
  KEY `tp_fk_gmmartprabrlhsivfvksfmifqrdhajakzgre` (`fieldId`),
  KEY `tp_fk_cxlodkisdbetetnhomquojvqanczsiaexyig` (`userId`),
  CONSTRAINT `tp_fk_cxlodkisdbetetnhomquojvqanczsiaexyig` FOREIGN KEY (`userId`) REFERENCES `tp_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `tp_fk_gmmartprabrlhsivfvksfmifqrdhajakzgre` FOREIGN KEY (`fieldId`) REFERENCES `tp_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tp_fk_lqfoafjglkvtiynhqlehujqlsironkxwsvmv` FOREIGN KEY (`siteId`) REFERENCES `tp_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tp_fk_xhtkokudvxalpakqfpnskiwkbbaujhozfjww` FOREIGN KEY (`elementId`) REFERENCES `tp_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_changedfields: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_changedfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_changedfields` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_content
CREATE TABLE IF NOT EXISTS `tp_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tp_idx_ddraoxolsawhfjercwosvmreghgbsanvaimk` (`elementId`,`siteId`),
  KEY `tp_idx_wqtublntlnhocetvfwczyhqnmlqgqdcgmkek` (`siteId`),
  KEY `tp_idx_lbklttadhjvspdnquflqlepwxtysquaiksxv` (`title`),
  CONSTRAINT `tp_fk_gsdqzyyuwoshlgafdpxuseunirhzgkxcszak` FOREIGN KEY (`siteId`) REFERENCES `tp_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tp_fk_jfbcwjkksowptavxjkzqtpnhoyakmhirxsrh` FOREIGN KEY (`elementId`) REFERENCES `tp_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_content: ~1 rows (approximately)
/*!40000 ALTER TABLE `tp_content` DISABLE KEYS */;
INSERT INTO `tp_content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`) VALUES
	(1, 1, 1, NULL, '2023-02-14 06:32:58', '2023-02-14 06:32:58', '59bd173e-93dd-4661-8992-488df5a108ba');
/*!40000 ALTER TABLE `tp_content` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_craftidtokens
CREATE TABLE IF NOT EXISTS `tp_craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tp_fk_rbwswjofpddrooxwgotouspdczbqhjkumokr` (`userId`),
  CONSTRAINT `tp_fk_rbwswjofpddrooxwgotouspdczbqhjkumokr` FOREIGN KEY (`userId`) REFERENCES `tp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_craftidtokens: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_craftidtokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_craftidtokens` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_deprecationerrors
CREATE TABLE IF NOT EXISTS `tp_deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tp_idx_okmtvtasfethowtptcnpgffeijkchozolddu` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_deprecationerrors: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_deprecationerrors` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_deprecationerrors` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_drafts
CREATE TABLE IF NOT EXISTS `tp_drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `tp_idx_mamzzalqncyyzxrqjbgkoajaetxvblubmade` (`creatorId`,`provisional`),
  KEY `tp_idx_vzjwjzfzwcnhjgkjedyadrgrvexwmzdzohoh` (`saved`),
  KEY `tp_fk_dwfczxoxhqxtusnoewoswmosqulqlowaeddt` (`canonicalId`),
  CONSTRAINT `tp_fk_dwfczxoxhqxtusnoewoswmosqulqlowaeddt` FOREIGN KEY (`canonicalId`) REFERENCES `tp_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tp_fk_mzqjbldhnagjmroxwsgaaqadzhtlcssvwuqo` FOREIGN KEY (`creatorId`) REFERENCES `tp_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_drafts: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_drafts` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_drafts` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_elements
CREATE TABLE IF NOT EXISTS `tp_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tp_idx_yptmcnogjmhsivphrsctzgjagsflvntoeump` (`dateDeleted`),
  KEY `tp_idx_susjgnrtiwvbxdlgkoqkoagaypatooweqacc` (`fieldLayoutId`),
  KEY `tp_idx_vfozcqdnmivsfzjfdvybiqpvysyfeqztzaqv` (`type`),
  KEY `tp_idx_iyarspromkuwaknrilmejerevqabqomzonoj` (`enabled`),
  KEY `tp_idx_omrxpvdrordulrntlkmuzuickrvwzbamyiwe` (`archived`,`dateCreated`),
  KEY `tp_idx_rlsrketlymoorhdgnfjbzmimioydeujgrkir` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `tp_idx_ijfvrulmcvrlsktleskejyyjgeryvnrzbxiz` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `tp_fk_yaqzjnslgwxftjffelzydggkluccxvpmaxlp` (`canonicalId`),
  KEY `tp_fk_hmhodjeoziigmutnywgogjponlsvwjooxskn` (`draftId`),
  KEY `tp_fk_sjiaamgiumzjdmkjomzaavoesyomtxrpduvr` (`revisionId`),
  CONSTRAINT `tp_fk_hmhodjeoziigmutnywgogjponlsvwjooxskn` FOREIGN KEY (`draftId`) REFERENCES `tp_drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tp_fk_sjiaamgiumzjdmkjomzaavoesyomtxrpduvr` FOREIGN KEY (`revisionId`) REFERENCES `tp_revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tp_fk_xksnclulsirdhrbxpwjpnydzcieihhtxjwlv` FOREIGN KEY (`fieldLayoutId`) REFERENCES `tp_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tp_fk_yaqzjnslgwxftjffelzydggkluccxvpmaxlp` FOREIGN KEY (`canonicalId`) REFERENCES `tp_elements` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_elements: ~1 rows (approximately)
/*!40000 ALTER TABLE `tp_elements` DISABLE KEYS */;
INSERT INTO `tp_elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES
	(1, NULL, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2023-02-14 06:32:58', '2023-02-14 06:32:58', NULL, NULL, 'dd91fa36-a23d-4fbe-a3b4-8ce66e956ebe');
/*!40000 ALTER TABLE `tp_elements` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_elements_sites
CREATE TABLE IF NOT EXISTS `tp_elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tp_idx_tuwrdvjvvjoqhyodytyinrbhhgmyzslkmuig` (`elementId`,`siteId`),
  KEY `tp_idx_hdqkrjhxxxllubyumnjywgglwzfskdcxnldz` (`siteId`),
  KEY `tp_idx_krkekjjqvrkcnbwcnlfxoqauqccmzgdvftnm` (`slug`,`siteId`),
  KEY `tp_idx_pnwegegkgajsbmscpvjnphjtwtnvflpwtyjc` (`enabled`),
  KEY `tp_idx_bydpuqpromyrkwjrgbvoztsriiqmccdszhaa` (`uri`,`siteId`),
  CONSTRAINT `tp_fk_haktaykuxepcilexghgbmbxspinknotescyr` FOREIGN KEY (`siteId`) REFERENCES `tp_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tp_fk_lelnhkvhrcyxooxhvigbkoqxykcncgmijxuy` FOREIGN KEY (`elementId`) REFERENCES `tp_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_elements_sites: ~1 rows (approximately)
/*!40000 ALTER TABLE `tp_elements_sites` DISABLE KEYS */;
INSERT INTO `tp_elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
	(1, 1, 1, NULL, NULL, 1, '2023-02-14 06:32:58', '2023-02-14 06:32:58', 'c26d2dca-c1f9-4c8c-bb48-283da8d9cadc');
/*!40000 ALTER TABLE `tp_elements_sites` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_entries
CREATE TABLE IF NOT EXISTS `tp_entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tp_idx_besunkdwrbynhboshwsdestptmjqcpbykgmr` (`postDate`),
  KEY `tp_idx_ycsihfxmzmidvzuskwyehyoddnfdpsshhpym` (`expiryDate`),
  KEY `tp_idx_kxelfcpysurzhvqeefwtghkwppooxsiwprwt` (`authorId`),
  KEY `tp_idx_auormovspyoczgrlxnpvwjhmmwapiybdsmbx` (`sectionId`),
  KEY `tp_idx_jkllfbqpmasxslfswaxuewkdfgysptuoiytx` (`typeId`),
  KEY `tp_fk_tqfqlwldrdkuwsrtrijkckxmaloxszsmraeh` (`parentId`),
  CONSTRAINT `tp_fk_edihqbpkvbidpwpcinkdkwyawqumziqfuhao` FOREIGN KEY (`id`) REFERENCES `tp_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tp_fk_qbepjbxkcbimcvkdbpdiitcunnxikjklvypp` FOREIGN KEY (`typeId`) REFERENCES `tp_entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tp_fk_rfyaugkzkpeweddyknudiybdikruetqrlzqs` FOREIGN KEY (`authorId`) REFERENCES `tp_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tp_fk_tqfqlwldrdkuwsrtrijkckxmaloxszsmraeh` FOREIGN KEY (`parentId`) REFERENCES `tp_entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tp_fk_yjliipiyydrmjaedluwxbqmswzwrcumnwojw` FOREIGN KEY (`sectionId`) REFERENCES `tp_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_entries: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_entries` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_entrytypes
CREATE TABLE IF NOT EXISTS `tp_entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tp_idx_hkeybubahjeyaearnkqeyxtcmmfokuzyhggp` (`name`,`sectionId`),
  KEY `tp_idx_wkesltnilxluaogtthortitnismzyvobnqnu` (`handle`,`sectionId`),
  KEY `tp_idx_dlluqeozfmienoyortwwhjwnyjxogrzzoopm` (`sectionId`),
  KEY `tp_idx_ucxouoadnhuxnmqlphsrbzcpjwdfyaxoqoho` (`fieldLayoutId`),
  KEY `tp_idx_qdjqbpzgavddxzemzamhatgspkevppulvqvq` (`dateDeleted`),
  CONSTRAINT `tp_fk_imqhbwqkfgkdbtvrodykpejsuqcxnuthzxbf` FOREIGN KEY (`fieldLayoutId`) REFERENCES `tp_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tp_fk_ypgghpyfpaeepxndbnvqstgfbsezcykregrk` FOREIGN KEY (`sectionId`) REFERENCES `tp_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_entrytypes: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_entrytypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_entrytypes` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_fieldgroups
CREATE TABLE IF NOT EXISTS `tp_fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tp_idx_zajuxnjvwcroqsznlvdarxavvtnwfavwultd` (`name`),
  KEY `tp_idx_bveulifocikwekelbyxqjphmezldocdckdui` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_fieldgroups: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_fieldgroups` DISABLE KEYS */;
INSERT INTO `tp_fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
	(1, 'Common', '2023-02-14 06:32:58', '2023-02-14 06:32:58', NULL, 'ca8c6a64-a648-4dcf-9b70-f800be9f3459');
/*!40000 ALTER TABLE `tp_fieldgroups` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_fieldlayoutfields
CREATE TABLE IF NOT EXISTS `tp_fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tp_idx_wwzxohzrdizoeypnnjkmpapgwfqdorsbplyn` (`layoutId`,`fieldId`),
  KEY `tp_idx_ztdunxclgkfgmxmdycxgcwjtfukvzyftzsbo` (`sortOrder`),
  KEY `tp_idx_gtgsearssmpvsjwgcztuymvcnbrmufuzeqvm` (`tabId`),
  KEY `tp_idx_wzerlwoclrziqaynihlkkoetlilnykheizmb` (`fieldId`),
  CONSTRAINT `tp_fk_lufluxhhiltotyjvihndwwdqkiwiulttwkog` FOREIGN KEY (`tabId`) REFERENCES `tp_fieldlayouttabs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tp_fk_mnavmoxgbtbrfdnempszcrdntmgxcgbdtvuh` FOREIGN KEY (`layoutId`) REFERENCES `tp_fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tp_fk_vqcxkcbizzejffsgomnpjyimdnacdumaflfb` FOREIGN KEY (`fieldId`) REFERENCES `tp_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_fieldlayoutfields: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_fieldlayoutfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_fieldlayoutfields` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_fieldlayouts
CREATE TABLE IF NOT EXISTS `tp_fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tp_idx_popwdqaxfrbnnuwwiffyhzcheijwqkylrcou` (`dateDeleted`),
  KEY `tp_idx_wdxqowfhuqnssfdjalmkbidnvqivpkpqidjg` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_fieldlayouts: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_fieldlayouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_fieldlayouts` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_fieldlayouttabs
CREATE TABLE IF NOT EXISTS `tp_fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `settings` text,
  `elements` text,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tp_idx_vwuowbysdhcpvrfmnlsrsxhtyjsrbxhfkowv` (`sortOrder`),
  KEY `tp_idx_fohqyugrkxbveiyitqujbkgbmaafdthjgpgx` (`layoutId`),
  CONSTRAINT `tp_fk_sutwcumafzklmcpyhiybpfjphgaamzmjaflf` FOREIGN KEY (`layoutId`) REFERENCES `tp_fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_fieldlayouttabs: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_fieldlayouttabs` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_fieldlayouttabs` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_fields
CREATE TABLE IF NOT EXISTS `tp_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tp_idx_osjvnxnazmhkmkeviryxajbnlsxxvwjaxiss` (`handle`,`context`),
  KEY `tp_idx_fsgrsugvrnbsfhsrvhqpcagpfevedcctporb` (`groupId`),
  KEY `tp_idx_fjvsdbtybuiawlgyvwhmarfrilkxbnpjxbvv` (`context`),
  CONSTRAINT `tp_fk_kpehxqkhrezcgkcrctopyctkrrmzyfmxrrzf` FOREIGN KEY (`groupId`) REFERENCES `tp_fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_fields: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_fields` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_globalsets
CREATE TABLE IF NOT EXISTS `tp_globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tp_idx_rlkicttplilkifjqqqufnfaobeuqzuxoxidg` (`name`),
  KEY `tp_idx_xexmlfunwrpfctddreyokoqbvbwmlvqrwgcq` (`handle`),
  KEY `tp_idx_sokhvnpftifdvislfhssbgiwgidekgwpoiyi` (`fieldLayoutId`),
  KEY `tp_idx_wbbjyhygwjetjsfxiikktwvehejloyvitetx` (`sortOrder`),
  CONSTRAINT `tp_fk_hlswjmlequrjuswgddgdfgnnwumsdkqganxh` FOREIGN KEY (`id`) REFERENCES `tp_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tp_fk_paosevdngrdxogojsfknxbgvbvgrvmamqzha` FOREIGN KEY (`fieldLayoutId`) REFERENCES `tp_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_globalsets: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_globalsets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_globalsets` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_gqlschemas
CREATE TABLE IF NOT EXISTS `tp_gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` text,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_gqlschemas: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_gqlschemas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_gqlschemas` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_gqltokens
CREATE TABLE IF NOT EXISTS `tp_gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tp_idx_wmcxsaviysydfcwkccuuzlxrwvcolzxetdxt` (`accessToken`),
  UNIQUE KEY `tp_idx_sfnmuzeatwtydegwhfhkihoulvqtngfywffx` (`name`),
  KEY `tp_fk_zwfmtoraoanxqwglgjalmnlgikquiqwkoaxn` (`schemaId`),
  CONSTRAINT `tp_fk_zwfmtoraoanxqwglgjalmnlgikquiqwkoaxn` FOREIGN KEY (`schemaId`) REFERENCES `tp_gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_gqltokens: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_gqltokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_gqltokens` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_imagetransformindex
CREATE TABLE IF NOT EXISTS `tp_imagetransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tp_idx_vijvzwtieixllqedlqprhjfxjiiwujmhqyxe` (`assetId`,`transformString`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_imagetransformindex: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_imagetransformindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_imagetransformindex` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_imagetransforms
CREATE TABLE IF NOT EXISTS `tp_imagetransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tp_idx_tpyehrongjqiooktpwjmkarkxumighqqpfcj` (`name`),
  KEY `tp_idx_exidfazafoemeuphzreqqiiaxwylzsuwlrpz` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_imagetransforms: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_imagetransforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_imagetransforms` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_info
CREATE TABLE IF NOT EXISTS `tp_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_info: ~1 rows (approximately)
/*!40000 ALTER TABLE `tp_info` DISABLE KEYS */;
INSERT INTO `tp_info` (`id`, `version`, `schemaVersion`, `maintenance`, `configVersion`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES
	(1, '4.3.8.2', '4.0.0.9', 0, 'pdseumskhgli', '3@ochbtzvzox', '2023-02-14 06:32:58', '2023-02-14 06:34:45', 'e4018a1d-7e0c-446d-92cf-3ca9ad31a621');
/*!40000 ALTER TABLE `tp_info` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_matrixblocks
CREATE TABLE IF NOT EXISTS `tp_matrixblocks` (
  `id` int(11) NOT NULL,
  `primaryOwnerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tp_idx_nxzdrukhzantcwejbarclbkzadunzlgptggg` (`primaryOwnerId`),
  KEY `tp_idx_ueqzpguisgadpxmuzlcfemdsycyaiicgbllv` (`fieldId`),
  KEY `tp_idx_nchqharmpsuwjwtjiefmgugxnowqiolzkote` (`typeId`),
  CONSTRAINT `tp_fk_eubeluvosvdtfdixvdpxvycykfwxkjpkcqck` FOREIGN KEY (`primaryOwnerId`) REFERENCES `tp_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tp_fk_pfcucuebmpviwtkilmmwemxucmeufgvjkjub` FOREIGN KEY (`fieldId`) REFERENCES `tp_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tp_fk_ufmipmhxfdxnlnrqlckbapduarchhuqiibyy` FOREIGN KEY (`id`) REFERENCES `tp_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tp_fk_ynfzwaiiifzqpxvqehbsgzjqqpghwjxnnpfe` FOREIGN KEY (`typeId`) REFERENCES `tp_matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_matrixblocks: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_matrixblocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_matrixblocks` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_matrixblocks_owners
CREATE TABLE IF NOT EXISTS `tp_matrixblocks_owners` (
  `blockId` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`blockId`,`ownerId`),
  KEY `tp_fk_iajiflawsizbxvxysfdhnpgrgfilblqglmzr` (`ownerId`),
  CONSTRAINT `tp_fk_iajiflawsizbxvxysfdhnpgrgfilblqglmzr` FOREIGN KEY (`ownerId`) REFERENCES `tp_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tp_fk_jntqiintnhkbkttimypdbardtswuklipwhjg` FOREIGN KEY (`blockId`) REFERENCES `tp_matrixblocks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_matrixblocks_owners: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_matrixblocks_owners` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_matrixblocks_owners` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_matrixblocktypes
CREATE TABLE IF NOT EXISTS `tp_matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tp_idx_yrpowntuusbkyfrulspxhrvvripbjjevgptm` (`name`,`fieldId`),
  KEY `tp_idx_lbyiutuhznwaghcawtkxhdeohbcqlypuazth` (`handle`,`fieldId`),
  KEY `tp_idx_agsjeaapaumhrrgdsxftynaezcnocohfqhfw` (`fieldId`),
  KEY `tp_idx_xjraktvvgisldzrplouqhxhwuvkvoifxtycd` (`fieldLayoutId`),
  CONSTRAINT `tp_fk_ibraaadmtximuzyfwoxjfjhoroklfdlxogsu` FOREIGN KEY (`fieldId`) REFERENCES `tp_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tp_fk_lbgnsdfkrgllzkntmsfrftvcxxkxmsasvcxa` FOREIGN KEY (`fieldLayoutId`) REFERENCES `tp_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_matrixblocktypes: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_matrixblocktypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_matrixblocktypes` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_migrations
CREATE TABLE IF NOT EXISTS `tp_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tp_idx_dxowhajanabigsdsvdyemtuwhycsxdstqxvy` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_migrations: ~25 rows (approximately)
/*!40000 ALTER TABLE `tp_migrations` DISABLE KEYS */;
INSERT INTO `tp_migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
	(1, 'craft', 'Install', '2023-02-14 06:32:59', '2023-02-14 06:32:59', '2023-02-14 06:32:59', 'cdb4d610-6b92-4709-98fd-6a48649b4e0a'),
	(2, 'craft', 'm210121_145800_asset_indexing_changes', '2023-02-14 06:32:59', '2023-02-14 06:32:59', '2023-02-14 06:32:59', '5caf85ce-0480-4cfb-824e-977901b22ab3'),
	(3, 'craft', 'm210624_222934_drop_deprecated_tables', '2023-02-14 06:32:59', '2023-02-14 06:32:59', '2023-02-14 06:32:59', '63ce9637-9fde-4a99-b911-9c636d9283cb'),
	(4, 'craft', 'm210724_180756_rename_source_cols', '2023-02-14 06:32:59', '2023-02-14 06:32:59', '2023-02-14 06:32:59', '8978fbf9-f1a9-4ca5-bb00-7bba340e00c8'),
	(5, 'craft', 'm210809_124211_remove_superfluous_uids', '2023-02-14 06:32:59', '2023-02-14 06:32:59', '2023-02-14 06:32:59', '2c7f09fe-7629-43da-81dd-6e640c4126f8'),
	(6, 'craft', 'm210817_014201_universal_users', '2023-02-14 06:32:59', '2023-02-14 06:32:59', '2023-02-14 06:32:59', '19ea4d18-9b7e-4748-875c-21506f5d0d42'),
	(7, 'craft', 'm210904_132612_store_element_source_settings_in_project_config', '2023-02-14 06:32:59', '2023-02-14 06:32:59', '2023-02-14 06:32:59', '0170cc75-0a83-4585-9051-220b3ead42f6'),
	(8, 'craft', 'm211115_135500_image_transformers', '2023-02-14 06:32:59', '2023-02-14 06:32:59', '2023-02-14 06:32:59', '8a4737b1-55d5-44ea-bf84-61a0050b8bd3'),
	(9, 'craft', 'm211201_131000_filesystems', '2023-02-14 06:32:59', '2023-02-14 06:32:59', '2023-02-14 06:32:59', '3594bf0e-4052-496c-9d72-3bc132bd558c'),
	(10, 'craft', 'm220103_043103_tab_conditions', '2023-02-14 06:32:59', '2023-02-14 06:32:59', '2023-02-14 06:32:59', 'bd8a1e17-c224-4d00-8c35-c38f34e1d238'),
	(11, 'craft', 'm220104_003433_asset_alt_text', '2023-02-14 06:32:59', '2023-02-14 06:32:59', '2023-02-14 06:32:59', 'fd9d6a08-0b2f-48a6-9a07-f0cd20f39e3b'),
	(12, 'craft', 'm220123_213619_update_permissions', '2023-02-14 06:32:59', '2023-02-14 06:32:59', '2023-02-14 06:32:59', '42a29c85-7fb5-45fc-b9fd-dac055f5c02c'),
	(13, 'craft', 'm220126_003432_addresses', '2023-02-14 06:32:59', '2023-02-14 06:32:59', '2023-02-14 06:32:59', '857d748f-7808-47da-b268-1e31fd8d9f7f'),
	(14, 'craft', 'm220209_095604_add_indexes', '2023-02-14 06:32:59', '2023-02-14 06:32:59', '2023-02-14 06:32:59', '573dcb86-c798-473e-90f3-d77360468c50'),
	(15, 'craft', 'm220213_015220_matrixblocks_owners_table', '2023-02-14 06:32:59', '2023-02-14 06:32:59', '2023-02-14 06:32:59', '5fb0b464-de26-4a9a-8a38-7f5484091e16'),
	(16, 'craft', 'm220214_000000_truncate_sessions', '2023-02-14 06:32:59', '2023-02-14 06:32:59', '2023-02-14 06:32:59', '375c3a85-e012-4398-b685-2b3df146c29b'),
	(17, 'craft', 'm220222_122159_full_names', '2023-02-14 06:32:59', '2023-02-14 06:32:59', '2023-02-14 06:32:59', 'dd8d416c-f2b0-4c68-b1f4-3d41020a506e'),
	(18, 'craft', 'm220223_180559_nullable_address_owner', '2023-02-14 06:32:59', '2023-02-14 06:32:59', '2023-02-14 06:32:59', '62f66ae1-7248-4141-bdcf-6e32d3888219'),
	(19, 'craft', 'm220225_165000_transform_filesystems', '2023-02-14 06:32:59', '2023-02-14 06:32:59', '2023-02-14 06:32:59', 'd7476c75-45d5-4f62-bf65-fd28b8476dab'),
	(20, 'craft', 'm220309_152006_rename_field_layout_elements', '2023-02-14 06:32:59', '2023-02-14 06:32:59', '2023-02-14 06:32:59', '6716df9c-1b17-4944-a3d0-77b7fa077c3f'),
	(21, 'craft', 'm220314_211928_field_layout_element_uids', '2023-02-14 06:32:59', '2023-02-14 06:32:59', '2023-02-14 06:32:59', 'a20da6e3-3348-444c-94c1-e099548ecdbe'),
	(22, 'craft', 'm220316_123800_transform_fs_subpath', '2023-02-14 06:32:59', '2023-02-14 06:32:59', '2023-02-14 06:32:59', 'cc6721ef-5abf-4d70-af21-915defd33590'),
	(23, 'craft', 'm220317_174250_release_all_jobs', '2023-02-14 06:32:59', '2023-02-14 06:32:59', '2023-02-14 06:32:59', 'f1bdc90b-a863-47c1-a336-f477b7215a6b'),
	(24, 'craft', 'm220330_150000_add_site_gql_schema_components', '2023-02-14 06:32:59', '2023-02-14 06:32:59', '2023-02-14 06:32:59', '1003440a-3b23-45d4-88e7-be8be8d35d32'),
	(25, 'craft', 'm220413_024536_site_enabled_string', '2023-02-14 06:32:59', '2023-02-14 06:32:59', '2023-02-14 06:32:59', 'b4d2a1de-3dc3-4763-a792-0926239649a9');
/*!40000 ALTER TABLE `tp_migrations` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_plugins
CREATE TABLE IF NOT EXISTS `tp_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tp_idx_zwifjvovmtxgicmpmnfanxbixgdpatniezto` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_plugins: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_plugins` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_plugins` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_projectconfig
CREATE TABLE IF NOT EXISTS `tp_projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_projectconfig: ~27 rows (approximately)
/*!40000 ALTER TABLE `tp_projectconfig` DISABLE KEYS */;
INSERT INTO `tp_projectconfig` (`path`, `value`) VALUES
	('dateModified', '1676356379'),
	('email.fromEmail', '"admin@gmail.com"'),
	('email.fromName', '"telcopoints"'),
	('email.transportType', '"craft\\\\mail\\\\transportadapters\\\\Sendmail"'),
	('fieldGroups.ca8c6a64-a648-4dcf-9b70-f800be9f3459.name', '"Common"'),
	('meta.__names__.5f9b6819-1692-464d-adb5-8974c35e9d03', '"telcopoints"'),
	('meta.__names__.ca8c6a64-a648-4dcf-9b70-f800be9f3459', '"Common"'),
	('meta.__names__.fe9a96dd-f659-48a1-9d2c-a7e9df599648', '"telcopoints"'),
	('siteGroups.5f9b6819-1692-464d-adb5-8974c35e9d03.name', '"telcopoints"'),
	('sites.fe9a96dd-f659-48a1-9d2c-a7e9df599648.baseUrl', '"$PRIMARY_SITE_URL"'),
	('sites.fe9a96dd-f659-48a1-9d2c-a7e9df599648.handle', '"default"'),
	('sites.fe9a96dd-f659-48a1-9d2c-a7e9df599648.hasUrls', 'true'),
	('sites.fe9a96dd-f659-48a1-9d2c-a7e9df599648.language', '"en-US"'),
	('sites.fe9a96dd-f659-48a1-9d2c-a7e9df599648.name', '"telcopoints"'),
	('sites.fe9a96dd-f659-48a1-9d2c-a7e9df599648.primary', 'true'),
	('sites.fe9a96dd-f659-48a1-9d2c-a7e9df599648.siteGroup', '"5f9b6819-1692-464d-adb5-8974c35e9d03"'),
	('sites.fe9a96dd-f659-48a1-9d2c-a7e9df599648.sortOrder', '1'),
	('system.edition', '"solo"'),
	('system.live', 'true'),
	('system.name', '"telcopoints"'),
	('system.schemaVersion', '"4.0.0.9"'),
	('system.timeZone', '"America/Los_Angeles"'),
	('users.allowPublicRegistration', 'false'),
	('users.defaultGroup', 'null'),
	('users.photoSubpath', 'null'),
	('users.photoVolumeUid', 'null'),
	('users.requireEmailVerification', 'true');
/*!40000 ALTER TABLE `tp_projectconfig` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_queue
CREATE TABLE IF NOT EXISTS `tp_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `tp_idx_neqajvvqspjpcendlmwbcaprtcxumbwdswmn` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `tp_idx_ghdafyvadrubqqxfeupjctdcypubvvjeaena` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_queue: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_queue` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_relations
CREATE TABLE IF NOT EXISTS `tp_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tp_idx_gtqtflvlwbdouvghiojrctnnapdsqjleqnwp` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `tp_idx_uagopfezzumacnwqalbpmfhemxexmddocykj` (`sourceId`),
  KEY `tp_idx_bcnumodccignoboujckwijegabulrvsolusy` (`targetId`),
  KEY `tp_idx_opuxvjxwxqpppflosdvrdxoxyufvmgdaphbz` (`sourceSiteId`),
  CONSTRAINT `tp_fk_cklsgbdankqfximyfsqfxkranzjqtsfxazxj` FOREIGN KEY (`sourceId`) REFERENCES `tp_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tp_fk_fydpheudroqbvakjrwwjtmwtughnntneqrsq` FOREIGN KEY (`targetId`) REFERENCES `tp_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tp_fk_lpbryipaurmsqympxjqmnixdvkisqkineoqz` FOREIGN KEY (`sourceSiteId`) REFERENCES `tp_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tp_fk_mssyggqrsvkcidgikltcmbpovwyitxuqtldh` FOREIGN KEY (`fieldId`) REFERENCES `tp_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_relations: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_relations` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_resourcepaths
CREATE TABLE IF NOT EXISTS `tp_resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_resourcepaths: ~23 rows (approximately)
/*!40000 ALTER TABLE `tp_resourcepaths` DISABLE KEYS */;
INSERT INTO `tp_resourcepaths` (`hash`, `path`) VALUES
	('13b44220', '@craft/web/assets/fabric/dist'),
	('39ed41e', '@craft/web/assets/utilities/dist'),
	('3b067537', '@craft/web/assets/garnish/dist'),
	('43123545', '@craft/web/assets/updateswidget/dist'),
	('4359ca9d', '@craft/web/assets/d3/dist'),
	('4838c32a', '@craft/web/assets/iframeresizer/dist'),
	('5231f4be', '@craft/web/assets/tailwindreset/dist'),
	('55244e9c', '@craft/web/assets/selectize/dist'),
	('596cecd4', '@craft/web/assets/cp/dist'),
	('655de272', '@craft/web/assets/axios/dist'),
	('7da8772b', '@craft/web/assets/recententries/dist'),
	('8277c776', '@craft/web/assets/elementresizedetector/dist'),
	('8797d89e', '@bower/jquery/dist'),
	('8d704888', '@craft/web/assets/jqueryui/dist'),
	('930b9e23', '@craft/web/assets/fileupload/dist'),
	('a2e8d8c3', '@craft/web/assets/dashboard/dist'),
	('d1397356', '@craft/web/assets/jquerypayment/dist'),
	('d16aac34', '@craft/web/assets/jquerytouchevents/dist'),
	('d4ae71e1', '@craft/web/assets/velocity/dist'),
	('dbabfe08', '@craft/web/assets/feed/dist'),
	('e4bec34c', '@craft/web/assets/craftsupport/dist'),
	('e6da1488', '@craft/web/assets/xregexp/dist'),
	('ed62a988', '@craft/web/assets/picturefill/dist');
/*!40000 ALTER TABLE `tp_resourcepaths` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_revisions
CREATE TABLE IF NOT EXISTS `tp_revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tp_idx_zbuqtvjcddefcmfbujmtvztmmyrnaffurxjb` (`canonicalId`,`num`),
  KEY `tp_fk_kkxpimwrbpdqcxeylwcpjggkjzpunauqwgbx` (`creatorId`),
  CONSTRAINT `tp_fk_kkxpimwrbpdqcxeylwcpjggkjzpunauqwgbx` FOREIGN KEY (`creatorId`) REFERENCES `tp_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tp_fk_vpovtemyttdfhvttdwruohmiopyohiauluqb` FOREIGN KEY (`canonicalId`) REFERENCES `tp_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_revisions: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_revisions` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_searchindex
CREATE TABLE IF NOT EXISTS `tp_searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `tp_idx_yhhonadflijiouitogmkqjbwshrngbopqfcx` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_searchindex: ~6 rows (approximately)
/*!40000 ALTER TABLE `tp_searchindex` DISABLE KEYS */;
INSERT INTO `tp_searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES
	(1, 'email', 0, 1, ' admin gmail com '),
	(1, 'firstname', 0, 1, ''),
	(1, 'fullname', 0, 1, ''),
	(1, 'lastname', 0, 1, ''),
	(1, 'slug', 0, 1, ''),
	(1, 'username', 0, 1, ' admin ');
/*!40000 ALTER TABLE `tp_searchindex` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_sections
CREATE TABLE IF NOT EXISTS `tp_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tp_idx_gpfyhzmkcseecondoexjuijsgnjycbdpimkj` (`handle`),
  KEY `tp_idx_metclpgzfxaggwgmgbotvsnwbxgdcnfdtwyx` (`name`),
  KEY `tp_idx_flieezhsycygbnrnpmaysdmupoggllzvtlmh` (`structureId`),
  KEY `tp_idx_szyqpcpiizedysyxrxwsgdmhslxeeycwzpjd` (`dateDeleted`),
  CONSTRAINT `tp_fk_znflaonfluymynewcdwznnhwwszkojxikzwn` FOREIGN KEY (`structureId`) REFERENCES `tp_structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_sections: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_sections` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_sections_sites
CREATE TABLE IF NOT EXISTS `tp_sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tp_idx_monunmyvqsvirrbgsobzjlednnldwtuiyayp` (`sectionId`,`siteId`),
  KEY `tp_idx_pqfpaibmkycuiojswehedsxdsxtyuuysyuzu` (`siteId`),
  CONSTRAINT `tp_fk_jcnbzhyokgwoqxkllaoeioikgwkxmfxqclui` FOREIGN KEY (`sectionId`) REFERENCES `tp_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tp_fk_vkagbwspkejijzareojktsuisljpsqfbrdso` FOREIGN KEY (`siteId`) REFERENCES `tp_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_sections_sites: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_sections_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_sections_sites` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_sequences
CREATE TABLE IF NOT EXISTS `tp_sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_sequences: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_sequences` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_sequences` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_sessions
CREATE TABLE IF NOT EXISTS `tp_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tp_idx_swsqxhkgmzqmzlawypnlgcgzyqadyisxolls` (`uid`),
  KEY `tp_idx_jswglhggyybksbprcrvzmmszqtyxhzyazhom` (`token`),
  KEY `tp_idx_fzltwkgiltpunrvhhqnlujoycmiazrtapvqd` (`dateUpdated`),
  KEY `tp_idx_hhhszqrvnkzvivyjsbltvwnwnnfhpuxlwatw` (`userId`),
  CONSTRAINT `tp_fk_jxambanrekhflwgxnyzjwviohwybcuhqopbs` FOREIGN KEY (`userId`) REFERENCES `tp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_sessions: ~1 rows (approximately)
/*!40000 ALTER TABLE `tp_sessions` DISABLE KEYS */;
INSERT INTO `tp_sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
	(1, 1, 'u-O-cgKc3fuc311QnsPgjAdP7xUGLS0HkE6clhMcQkQVfPOnuQsBbk0tX5s2p7rY_DkT5tYfFFAuxA_uRckRFC2dk39q0TeVxIa2', '2023-02-14 06:34:58', '2023-02-14 06:40:13', 'deaaaaa4-5be2-42f5-8680-44552410e35a');
/*!40000 ALTER TABLE `tp_sessions` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_shunnedmessages
CREATE TABLE IF NOT EXISTS `tp_shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tp_idx_hoasvxiarurjovnifbxnhindtzvjbetsmqve` (`userId`,`message`),
  CONSTRAINT `tp_fk_vmdasklllfbpocihyjsybggztujrrtcivsun` FOREIGN KEY (`userId`) REFERENCES `tp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_shunnedmessages: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_shunnedmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_shunnedmessages` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_sitegroups
CREATE TABLE IF NOT EXISTS `tp_sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tp_idx_xaenigjzcxwcnyurreuuscvihkkgtkguuaxa` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_sitegroups: ~1 rows (approximately)
/*!40000 ALTER TABLE `tp_sitegroups` DISABLE KEYS */;
INSERT INTO `tp_sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
	(1, 'telcopoints', '2023-02-14 06:32:58', '2023-02-14 06:32:58', NULL, '5f9b6819-1692-464d-adb5-8974c35e9d03');
/*!40000 ALTER TABLE `tp_sitegroups` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_sites
CREATE TABLE IF NOT EXISTS `tp_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tp_idx_kjdovuqzxukeotuxuyyuwowfpidornffurlp` (`dateDeleted`),
  KEY `tp_idx_bsppymbhxnllpzlpuggucdcdotytfbbrsffq` (`handle`),
  KEY `tp_idx_zkasfeehtxhlbbcxhlceszcwioqfhhtmjxnx` (`sortOrder`),
  KEY `tp_fk_blcvlpobukljddwwebxctstkidwtszkzlzmd` (`groupId`),
  CONSTRAINT `tp_fk_blcvlpobukljddwwebxctstkidwtszkzlzmd` FOREIGN KEY (`groupId`) REFERENCES `tp_sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_sites: ~1 rows (approximately)
/*!40000 ALTER TABLE `tp_sites` DISABLE KEYS */;
INSERT INTO `tp_sites` (`id`, `groupId`, `primary`, `enabled`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
	(1, 1, 1, 'true', 'telcopoints', 'default', 'en-US', 1, '$PRIMARY_SITE_URL', 1, '2023-02-14 06:32:58', '2023-02-14 06:32:58', NULL, 'fe9a96dd-f659-48a1-9d2c-a7e9df599648');
/*!40000 ALTER TABLE `tp_sites` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_structureelements
CREATE TABLE IF NOT EXISTS `tp_structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tp_idx_wosroravfjhcmwkilzdtaddrdrdhnlbxxcwz` (`structureId`,`elementId`),
  KEY `tp_idx_ynlfhvocdswlrfmrfstmxbdgqdnjfrbupnbf` (`root`),
  KEY `tp_idx_aftjnpshkoovzagpsgmznajxzjrqrzczfxcp` (`lft`),
  KEY `tp_idx_qdzfjyrwnvghjdkrgbbrgqamdosmegyfxjel` (`rgt`),
  KEY `tp_idx_ktifmzniggaudcyzevsihxwrqbjqtkgxbqsz` (`level`),
  KEY `tp_idx_hojbnnbttyufvmqzaznbtzurqyizkcagwtmq` (`elementId`),
  CONSTRAINT `tp_fk_kkbkeacvpbqgswzygdpqreppokxuvsgefygv` FOREIGN KEY (`elementId`) REFERENCES `tp_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tp_fk_tgtnurufigsmrzspvtixrfmmjrrdlvxrlphl` FOREIGN KEY (`structureId`) REFERENCES `tp_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_structureelements: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_structureelements` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_structureelements` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_structures
CREATE TABLE IF NOT EXISTS `tp_structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tp_idx_kuskmcutmwmqgujkkjxtlrolysxkkyjzyhwl` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_structures: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_structures` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_structures` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_systemmessages
CREATE TABLE IF NOT EXISTS `tp_systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tp_idx_ohapijbhjwrynsikdtryrqwsllthuzvuebah` (`key`,`language`),
  KEY `tp_idx_isoiqobhudrcycnroigbiazenzxmykgzocov` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_systemmessages: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_systemmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_systemmessages` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_taggroups
CREATE TABLE IF NOT EXISTS `tp_taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tp_idx_jtxvicwyfhbtixjoaeghuaetitrmemmexngv` (`name`),
  KEY `tp_idx_mpbztbszqgafjeabfnwwdvfjloyfdeqxgewg` (`handle`),
  KEY `tp_idx_zlwgmydguedufcvfyfrsfrpprrgeazofnxvq` (`dateDeleted`),
  KEY `tp_fk_zhsijcoadcnficdayjhhkvkbzyagfkolqnon` (`fieldLayoutId`),
  CONSTRAINT `tp_fk_zhsijcoadcnficdayjhhkvkbzyagfkolqnon` FOREIGN KEY (`fieldLayoutId`) REFERENCES `tp_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_taggroups: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_taggroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_taggroups` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_tags
CREATE TABLE IF NOT EXISTS `tp_tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tp_idx_xywkdnvhbizuhxjnsofvynbwkdlftswhyopn` (`groupId`),
  CONSTRAINT `tp_fk_ejbwpttifeipbzyjndnnmmhdmxjrnsmvhtcm` FOREIGN KEY (`groupId`) REFERENCES `tp_taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tp_fk_wznxmwkjmcqkewdwbjuogmxjooynkrityiue` FOREIGN KEY (`id`) REFERENCES `tp_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_tags: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_tags` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_tokens
CREATE TABLE IF NOT EXISTS `tp_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tp_idx_zdupxooikchyhqinvstmbwssrwumfpnaicno` (`token`),
  KEY `tp_idx_mfckrobfonmjfvrkagggovnwnczpdspawmgu` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_tokens: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_tokens` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_usergroups
CREATE TABLE IF NOT EXISTS `tp_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tp_idx_ohrwvgciayvbjnlmwgkktqaubkxhrdoagimj` (`handle`),
  KEY `tp_idx_huiuyqcmmqlonxjekeibhfnhrwqrbtazffrg` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_usergroups: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_usergroups` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_usergroups_users
CREATE TABLE IF NOT EXISTS `tp_usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tp_idx_yxdwfvvvfneqyugudkcoymyhlvhgdfybmwkx` (`groupId`,`userId`),
  KEY `tp_idx_xvtkzkfssapdstpjjohzkddyoexedmgihork` (`userId`),
  CONSTRAINT `tp_fk_gionohmhhmywzstpmjbvhqchnpkpsbotvfdr` FOREIGN KEY (`groupId`) REFERENCES `tp_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tp_fk_oxktahgwtuobdszwcacllcvbhrnxsollnekb` FOREIGN KEY (`userId`) REFERENCES `tp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_usergroups_users: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_usergroups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_usergroups_users` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_userpermissions
CREATE TABLE IF NOT EXISTS `tp_userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tp_idx_mssjxvdfitdoqrnipsmdohaxfelgnuzraqlb` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_userpermissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_userpermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_userpermissions` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_userpermissions_usergroups
CREATE TABLE IF NOT EXISTS `tp_userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tp_idx_ftwrfhdvyrcaayxqaylapfohhivmgtufwenh` (`permissionId`,`groupId`),
  KEY `tp_idx_esbiuobuynkqtkrsslqsppbwzqojvdvjjwwn` (`groupId`),
  CONSTRAINT `tp_fk_lxvaxbwnrvlaklhylnuyzgqzfmdkigsskkxt` FOREIGN KEY (`groupId`) REFERENCES `tp_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tp_fk_ueunynbalmhzfnzxxyxzaepiifnpnrkgungi` FOREIGN KEY (`permissionId`) REFERENCES `tp_userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_userpermissions_usergroups: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_userpermissions_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_userpermissions_usergroups` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_userpermissions_users
CREATE TABLE IF NOT EXISTS `tp_userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tp_idx_lsaeuxdpkknwbwanyqvusquaturoyqkvfmbh` (`permissionId`,`userId`),
  KEY `tp_idx_xfauspwfqfpyjsyqsmlwmcofplhmpzeknoyd` (`userId`),
  CONSTRAINT `tp_fk_stsshgxawqkqynuucicohbkzqyecckluerah` FOREIGN KEY (`userId`) REFERENCES `tp_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tp_fk_ybqdwhfefpfbgihqhcytibussnfaapoqfyex` FOREIGN KEY (`permissionId`) REFERENCES `tp_userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_userpermissions_users: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_userpermissions_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_userpermissions_users` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_userpreferences
CREATE TABLE IF NOT EXISTS `tp_userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text,
  PRIMARY KEY (`userId`),
  CONSTRAINT `tp_fk_fzmllqpekpvdrtaitixmyyifdtnrxbkdcyag` FOREIGN KEY (`userId`) REFERENCES `tp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_userpreferences: ~1 rows (approximately)
/*!40000 ALTER TABLE `tp_userpreferences` DISABLE KEYS */;
INSERT INTO `tp_userpreferences` (`userId`, `preferences`) VALUES
	(1, '{"language":"en-US"}');
/*!40000 ALTER TABLE `tp_userpreferences` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_users
CREATE TABLE IF NOT EXISTS `tp_users` (
  `id` int(11) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tp_idx_vjsnwtjljpqqutiujnoucctimhpxocaycomo` (`active`),
  KEY `tp_idx_wwmztyrkzcqqmnpehmitrwirazdpxvlxdcwg` (`locked`),
  KEY `tp_idx_yxoidgdosedmnooelcltevaycdbzhyfdnnxx` (`pending`),
  KEY `tp_idx_izwztzjzjeiryfewixqhyzjxoucjszmtwwhi` (`suspended`),
  KEY `tp_idx_ipvpyoznstkpmlihhuisoqhzuxyxwnuktrol` (`verificationCode`),
  KEY `tp_idx_iylqpcigpboldogmebshfsduayaiiihqaqee` (`email`),
  KEY `tp_idx_jiwfyefouszqrgxjshvqmynjfeblxpkffzmg` (`username`),
  KEY `tp_fk_srhjgikpyuyctxodyhfngogcdagssjmzxahd` (`photoId`),
  CONSTRAINT `tp_fk_cdcasjcsvuughxpdxogsxbdisolkmzdimrjz` FOREIGN KEY (`id`) REFERENCES `tp_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tp_fk_srhjgikpyuyctxodyhfngogcdagssjmzxahd` FOREIGN KEY (`photoId`) REFERENCES `tp_assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_users: ~1 rows (approximately)
/*!40000 ALTER TABLE `tp_users` DISABLE KEYS */;
INSERT INTO `tp_users` (`id`, `photoId`, `active`, `pending`, `locked`, `suspended`, `admin`, `username`, `fullName`, `firstName`, `lastName`, `email`, `password`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`) VALUES
	(1, NULL, 1, 0, 0, 0, 1, 'admin', NULL, NULL, NULL, 'admin@gmail.com', '$2y$13$iNGqE.BbB4X2nKZkJNs13.FMw3255DBSO/Zs.Cwj3.0sZQ2zLIo0q', '2023-02-14 06:34:58', NULL, NULL, NULL, '2023-02-14 06:34:54', NULL, 1, NULL, NULL, NULL, 0, '2023-02-14 06:32:59', '2023-02-14 06:32:59', '2023-02-14 06:34:58');
/*!40000 ALTER TABLE `tp_users` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_volumefolders
CREATE TABLE IF NOT EXISTS `tp_volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tp_idx_anccdtgevnaldkltgzqkiafocclxabvtyphw` (`name`,`parentId`,`volumeId`),
  KEY `tp_idx_nmakriexuyrtskosybiysaxbeladjkdpedeo` (`parentId`),
  KEY `tp_idx_stsavrmfrwiwjdmmqwupxxsdxnrxfqnqvjwc` (`volumeId`),
  CONSTRAINT `tp_fk_duihcrswiumvijwqffytrxqsacansbpoeyhs` FOREIGN KEY (`parentId`) REFERENCES `tp_volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tp_fk_dwjnupydpeydlchzgrqfxbtxotijzdromkvb` FOREIGN KEY (`volumeId`) REFERENCES `tp_volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_volumefolders: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_volumefolders` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_volumefolders` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_volumes
CREATE TABLE IF NOT EXISTS `tp_volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tp_idx_ywehdxnmmiywbmrnftjentrulusbpwzlvbjc` (`name`),
  KEY `tp_idx_brmthckaktncnltduywmfsxtbdqyphzywkck` (`handle`),
  KEY `tp_idx_tdllgqnxbyhilgfeewkzwdmhtdoagpqxilmu` (`fieldLayoutId`),
  KEY `tp_idx_tlwnlfurhpqkkmgxzlpetoxegbpaacttrhpn` (`dateDeleted`),
  CONSTRAINT `tp_fk_kiegwozhnotcvjvvmraxpyaqerznoskuwtub` FOREIGN KEY (`fieldLayoutId`) REFERENCES `tp_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_volumes: ~0 rows (approximately)
/*!40000 ALTER TABLE `tp_volumes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tp_volumes` ENABLE KEYS */;

-- Dumping structure for table telcopoints.tp_widgets
CREATE TABLE IF NOT EXISTS `tp_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tp_idx_iekebtbyitvunizowpsdhluexetnqgsdahzi` (`userId`),
  CONSTRAINT `tp_fk_ahgdlpectdzshelwocxxgccfwznvawmwghak` FOREIGN KEY (`userId`) REFERENCES `tp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table telcopoints.tp_widgets: ~4 rows (approximately)
/*!40000 ALTER TABLE `tp_widgets` DISABLE KEYS */;
INSERT INTO `tp_widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
	(1, 1, 'craft\\widgets\\RecentEntries', 1, NULL, '{"siteId":1,"section":"*","limit":10}', 1, '2023-02-14 06:34:58', '2023-02-14 06:34:58', 'e95859a9-83cc-45e4-95de-8c7f1c6283a2'),
	(2, 1, 'craft\\widgets\\CraftSupport', 2, NULL, '[]', 1, '2023-02-14 06:34:58', '2023-02-14 06:34:58', '45da1cd2-e64d-48cb-a1a6-ad0cb4ac01c6'),
	(3, 1, 'craft\\widgets\\Updates', 3, NULL, '[]', 1, '2023-02-14 06:34:58', '2023-02-14 06:34:58', '7e7b41c9-745a-41e5-bd41-0dbc90a663e0'),
	(4, 1, 'craft\\widgets\\Feed', 4, NULL, '{"url":"https://craftcms.com/news.rss","title":"Craft News","limit":5}', 1, '2023-02-14 06:34:58', '2023-02-14 06:34:58', '0639f72a-425e-4bf1-9857-4619a1d0ba3f');
/*!40000 ALTER TABLE `tp_widgets` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
