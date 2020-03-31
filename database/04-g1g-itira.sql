-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: itira-mariaDB
-- Generation Time: Mar 18, 2020 at 05:20 AM
-- Server version: 10.3.8-MariaDB-1:10.3.8+maria~bionic
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `g1g-itira`
--
CREATE DATABASE IF NOT EXISTS `g1g-itira` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `g1g-itira`;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
  `countryID` int(11) UNSIGNED NOT NULL,
  `country` varchar(255) NOT NULL,
  `abbr` char(2) NOT NULL,
  `abbr3` char(3) NOT NULL,
  `country_numeric_code` int(5) UNSIGNED NOT NULL,
  `capital` varchar(255) NOT NULL,
  `country_demonym` varchar(100) NOT NULL,
  `total_area` int(11) UNSIGNED NOT NULL,
  `population` int(11) UNSIGNED DEFAULT NULL,
  `idd_code` int(5) UNSIGNED NOT NULL,
  `currency_code` char(3) DEFAULT NULL,
  `currency_name` varchar(100) DEFAULT NULL,
  `lang_code` char(2) NOT NULL,
  `lang_name` varchar(100) NOT NULL,
  `cctld` char(2) NOT NULL,
  `eu` tinyint(1) DEFAULT 0,
  `eea` tinyint(1) DEFAULT 0,
  `schengen` tinyint(1) DEFAULT 0,
  `efta` tinyint(1) DEFAULT 0,
  `commonwealth` tinyint(1) DEFAULT 0,
  `user` varchar(255) NOT NULL,
  `timestamp` int(10) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`countryID`, `country`, `abbr`, `abbr3`, `country_numeric_code`, `capital`, `country_demonym`, `total_area`, `population`, `idd_code`, `currency_code`, `currency_name`, `lang_code`, `lang_name`, `cctld`, `eu`, `eea`, `schengen`, `efta`, `commonwealth`, `user`, `timestamp`, `updated_at`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', 4, 'Kabul', 'Afghans', 652230, 36373176, 93, 'AFN', 'Afghan Afghani', 'FA', 'Persian', 'af', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(2, 'Albania', 'AL', 'ALB', 8, 'Tirana', 'Albanians', 28748, 2934363, 355, 'ALL', 'Albanian Lek', 'SQ', 'Albanian', 'al', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(3, 'Algeria', 'DZ', 'DZA', 12, 'Algiers', 'Algerians', 2381741, 42008054, 213, 'DZD', 'Algerian Dinar', 'AR', 'Arabic', 'dz', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(4, 'American Samoa', 'AS', 'ASM', 16, 'Pago Pago', 'American Samoans', 199, 55679, 1684, 'USD', 'United States Dollar', 'EN', 'Samoan', 'as', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(5, 'Andorra', 'AD', 'AND', 20, 'Andorra la Vella', 'Andorrans', 468, 76953, 376, 'EUR', 'Euro', 'CA', 'Catalana', 'ad', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(6, 'Angola', 'AO', 'AGO', 24, 'Luanda', 'Angolans', 1246700, 30774205, 244, 'AOA', 'Angolan Kwanza', 'PT', 'Portuguese', 'ao', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(7, 'Anguilla', 'AI', 'AIA', 660, 'The Valley', 'Anguillans', 91, 15045, 1264, 'XCD', 'East Caribbean Dollar', 'EN', 'English', 'ai', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(8, 'Antarctica', 'AQ', 'ATA', 10, '-', 'Antarctic residents', 14000000, 0, 672, NULL, NULL, 'RU', 'Russian', 'aq', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(9, 'Antigua and Barbuda', 'AG', 'ATG', 28, 'Saint John\'s', 'Antiguans or Barbudans', 442, 103050, 1268, 'XCD', 'East Caribbean Dollar', 'EN', 'English', 'ag', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:15:10'),
(10, 'Argentina', 'AR', 'ARG', 32, 'Buenos Aires', 'Argentines', 2780400, 44688864, 54, 'ARS', 'Argentine Peso', 'ES', 'Spanish', 'ar', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(11, 'Armenia', 'AM', 'ARM', 51, 'Yerevan', 'Armenians', 29743, 2934152, 374, 'AMD', 'Armenian Dram', 'HY', 'Armenian', 'am', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(12, 'Aruba', 'AW', 'ABW', 533, 'Oranjestad', 'Arubans', 180, 105670, 297, 'AWG', 'Aruban Florin', 'NL', 'Dutch', 'aw', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(13, 'Australia', 'AU', 'AUS', 36, 'Canberra', 'Australians', 7741220, 24772247, 61, 'AUD', 'Australian Dollar', 'EN', 'English', 'au', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:25:17'),
(14, 'Austria', 'AT', 'AUT', 40, 'Vienna', 'Austrians', 83871, 8751820, 43, 'EUR', 'Euro', 'DE', 'German', 'at', 1, 1, 1, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(15, 'Azerbaijan', 'AZ', 'AZE', 31, 'Baku', 'Azerbaijanis', 86600, 9923914, 994, 'AZN', 'Azerbaijani Manat', 'AZ', 'Azerbaijani', 'az', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(16, 'Bahamas', 'BS', 'BHS', 44, 'Nassau', 'Bahamians', 13880, 399285, 1242, 'BSD', 'Bahamian Dollar', 'EN', 'English', 'bs', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:15:17'),
(17, 'Bahrain', 'BH', 'BHR', 48, 'Manama', 'Bahrainis', 760, 1566993, 973, 'BHD', 'Bahraini Dinar', 'AR', 'Arabic', 'bh', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(18, 'Bangladesh', 'BD', 'BGD', 50, 'Dhaka', 'Bangladeshis', 143998, 166368149, 880, 'BDT', 'Bangladeshi Taka', 'BN', 'Bangla', 'bd', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:15:27'),
(19, 'Barbados', 'BB', 'BRB', 52, 'Bridgetown', 'Barbadians', 430, 286388, 1246, 'USD', 'United States Dollar', 'EN', 'English', 'bb', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:15:32'),
(20, 'Belarus', 'BY', 'BLR', 112, 'Minsk', 'Belarusians', 207600, 9452113, 375, 'BYR', 'Belarusian Ruble', 'BE', 'Belarusian', 'by', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(21, 'Belgium', 'BE', 'BEL', 56, 'Brussels', 'Belgians', 30528, 11498519, 32, 'EUR', 'Euro', 'NL', 'Dutch', 'be', 1, 1, 1, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(22, 'Belize', 'BZ', 'BLZ', 84, 'Belmopan', 'Belizeans', 22966, 382444, 501, 'BZD', 'Belize Dollar', 'EN', 'English', 'bz', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:15:49'),
(23, 'Benin', 'BJ', 'BEN', 204, 'Porto-Novo', 'Beninese', 112622, 11485674, 229, 'XOF', 'Cfa Franc Bceao', 'FR', 'French', 'bj', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(24, 'Bermuda', 'BM', 'BMU', 60, 'Hamilton', 'Bermudians', 54, 61070, 1441, 'BMD', 'Bermudian Dollar', 'EN', 'English', 'bm', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(25, 'Bhutan', 'BT', 'BTN', 64, 'Thimphu', 'Bhutanese', 38394, 817054, 975, 'BTN', 'Bhutanese Ngultrum', 'EN', 'Dzongkha', 'bt', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(26, 'Bolivia, Plurinational State of', 'BO', 'BOL', 68, 'Sucre', 'Bolivians', 1098581, 11215674, 591, 'BOB', 'Boliviano', 'ES', 'Spanish', 'bo', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(27, 'Bosnia and Herzegovina', 'BA', 'BIH', 70, 'Sarajevo', 'Bosnians or Herzegovinians', 51197, 3503554, 387, 'BAM', 'Bosnia And Herzegovina Convertible Mark', 'HR', 'Croatian', 'ba', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(28, 'Botswana', 'BW', 'BWA', 72, 'Gaborone', 'Motswana', 581730, 2333201, 267, 'BWP', 'Botswana Pula', 'EN', 'English', 'bw', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:10:28'),
(29, 'Bouvet Island', 'BV', 'BVT', 74, '-', '', 49, 0, 47, 'NOK', 'Norwegian Kroner', 'EN', 'English', 'bv', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(30, 'Brazil', 'BR', 'BRA', 76, 'Brasileia', 'Brazilians', 8514877, 210867954, 55, 'BRL', 'Brazilian Real', 'PT', 'Portuguese', 'br', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', 86, 'Diego Garcia', 'British', 54400, 3000, 246, 'GBP', 'British Pound', 'EN', 'English', 'io', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(32, 'Brunei Darussalam', 'BN', 'BRN', 96, 'Bandar Seri Begawan', 'Bruneians', 5765, 434076, 673, 'SGD', 'Brunei Dollar', 'MS', 'Malay', 'bn', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:22:44'),
(33, 'Bulgaria', 'BG', 'BGR', 100, 'Sofia', 'Bulgarians', 110879, 7036848, 359, 'BGN', 'Bulgarian Lev', 'GB', 'Bulgarian', 'bg', 1, 1, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(34, 'Burkina Faso', 'BF', 'BFA', 854, 'Ouagadougou', 'Burkinabe', 274200, 19751651, 226, 'XOF', 'Cfa Franc Bceao', 'FR', 'French', 'bf', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(35, 'Burundi', 'BI', 'BDI', 108, 'Bujumbura', 'Burundians', 27830, 11216450, 257, 'BIF', 'Burundian Franc', 'FR', 'French', 'bi', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(36, 'Cambodia', 'KH', 'KHM', 116, 'Phnom Penh', 'Cambodians', 181035, 16245729, 855, 'KHR', 'Cambodian Riel', 'KM', 'Khmer', 'kh', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(37, 'Cameroon', 'CM', 'CMR', 120, 'Yaounde', 'Cameroonians', 475440, 24678234, 237, 'XAF', 'Cfa Franc Beac', 'FR', 'French', 'cm', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:10:33'),
(38, 'Canada', 'CA', 'CAN', 124, 'Ottawa', 'Canadians', 9984670, 36953765, 1, 'CAD', 'Canadian Dollar', 'FR', 'French', 'ca', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:15:54'),
(39, 'Cabo Verde', 'CV', 'CPV', 132, 'Praia', 'Cabo Verdeans', 4033, 553335, 238, 'CVE', 'Cape Verde Escudo', 'PT', 'Portuguese', 'cv', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(40, 'Cayman Islands', 'KY', 'CYM', 136, 'George Town', 'Caymanians', 264, 62348, 1345, 'KYD', 'Cayman Islands Dollar', 'EN', 'English', 'ky', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(41, 'Central African Republic', 'CF', 'CAF', 140, 'Bangui', 'Central Africans', 622984, 4737423, 236, 'XAF', 'Cfa Franc Beac', 'FR', 'French', 'cf', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(42, 'Chad', 'TD', 'TCD', 148, 'N\'djamena', 'Chadians', 1284000, 15353184, 235, 'XAF', 'Cfa Franc Beac', 'AR', 'Arabic', 'td', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(43, 'Chile', 'CL', 'CHL', 152, 'Santiago', 'Chileans', 756102, 18197209, 56, 'CLP', 'Chilean Peso', 'ES', 'Spanish', 'cl', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(44, 'China', 'CN', 'CHN', 156, 'Beijing', 'Chinese', 9596961, 1415045928, 86, 'CNY', 'Chinese Yuan Renminbi', 'ZH', 'Chinese', 'cn', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(45, 'Christmas Island', 'CX', 'CXR', 162, 'Flying Fish Cove', 'Christmas Islanders', 135, 2205, 61, 'AUD', 'Australian Dollar', 'EN', 'English', 'cx', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK', 166, 'West Island', 'Cocos Islanders', 14, 628, 61, 'AUD', 'Australian Dollar', 'EN', 'English', 'cc', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(47, 'Colombia', 'CO', 'COL', 170, 'Bogota', 'Colombians', 1138910, 49464683, 57, 'COP', 'Colombian Peso', 'ES', 'Spanish', 'co', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(48, 'Comoros', 'KM', 'COM', 174, 'Moroni', 'Comorans', 2235, 832347, 269, 'KMF', 'Comoro Franc', 'AR', 'Arabic', 'km', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(49, 'Congo', 'CG', 'COG', 178, 'Brazzaville', 'Congolese', 342000, 5399895, 242, 'XAF', 'Cfa Franc Beac', 'EN', 'Niger-congo', 'cg', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(50, 'Cook Islands', 'CK', 'COK', 184, 'Avarua', 'Cook Islanders', 236, 17411, 682, 'NZD', 'New Zealand Dollar', 'EN', 'English', 'ck', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(51, 'Costa Rica', 'CR', 'CRI', 188, 'San Jose', 'Costa Ricans', 51100, 4953199, 506, 'CRC', 'Costa Rican Colon', 'ES', 'Spanish', 'cr', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(52, 'Cote D\'ivoire', 'CI', 'CIV', 384, 'Yamoussoukro', 'Ivorians', 322463, 24905843, 225, 'XOF', 'Cfa Franc Bceao', 'EN', 'English', 'ci', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(53, 'Croatia', 'HR', 'HRV', 191, 'Zagreb', 'Croatians', 56594, 4164783, 385, 'HRK', 'Croatian Kuna', 'HR', 'Croatian', 'hr', 1, 1, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(54, 'Cuba', 'CU', 'CUB', 192, 'Havana', 'Cubans', 110860, 11489082, 53, 'CUC', 'Cuban Convertible Peso', 'ES', 'Spanish', 'cu', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(55, 'Cyprus', 'CY', 'CYP', 196, 'Nicosia', 'Cypriots', 9251, 1189085, 357, 'EUR', 'Euro', 'EL', 'Greek', 'cy', 1, 1, 0, 0, 1, '0', 0, '2019-09-16 06:24:15'),
(56, 'Czech Republic', 'CZ', 'CZE', 203, 'Prague', 'Czechs', 78867, 10625250, 420, 'CZK', 'Czech Koruna', 'CS', 'Czech', 'cz', 1, 1, 1, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(57, 'Denmark', 'DK', 'DNK', 208, 'Copenhagen', 'Danes', 43094, 5754356, 45, 'DKK', 'Danish Krone', 'DA', 'Danish', 'dk', 1, 1, 1, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(58, 'Djibouti', 'DJ', 'DJI', 262, 'Djibouti', 'Djiboutians', 23200, 971408, 253, 'DJF', 'Djiboutian Franc', 'FR', 'French', 'dj', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(60, 'Dominica', 'DM', 'DMA', 212, 'Roseau', 'Dominicans', 751, 74308, 1767, 'XCD', 'East Caribbean Dollar', 'FR', 'French', 'dm', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:16:21'),
(61, 'Dominican Republic', 'DO', 'DOM', 214, 'Santo Domingo', 'Dominicans', 48670, 10882996, 1829, 'DOP', 'Dominican Peso', 'ES', 'Spanish', 'do', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(62, 'Timor-Leste', 'TL', 'TLS', 626, 'Dili', 'Timorese', 14874, 1324094, 670, 'NZD', 'New Zealand Dollar', 'PT', 'Portuguese', 'tl', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(63, 'Ecuador', 'EC', 'ECU', 218, 'Quito', 'Ecuadorians', 283561, 16863425, 593, 'USD', 'United States Dollar', 'ES', 'Spanish', 'ec', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(64, 'Egypt', 'EG', 'EGY', 818, 'Cairo', 'Egyptians', 1001450, 99375741, 20, 'EGP', 'Egyptian Pound', 'AR', 'Arabic', 'eg', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(65, 'El Salvador', 'SV', 'SLV', 222, 'San Salvador', 'Salvadorans', 21041, 6411558, 503, 'NOK', 'Norwegian Kroner', 'ES', 'Spanish', 'sv', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(66, 'Equatorial Guinea', 'GQ', 'GNQ', 226, 'Malabo', 'Equatorial Guineans', 28051, 1313894, 240, 'XAF', 'Cfa Franc Beac', 'ES', 'Spanish', 'gq', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(67, 'Eritrea', 'ER', 'ERI', 232, 'Asmara', 'Eritreans', 117600, 5187948, 291, 'ERN', 'Eritrean Nakfa', 'TI', 'Tigrinya', 'er', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(68, 'Estonia', 'EE', 'EST', 233, 'Tallinn', 'Estonians', 45228, 1306788, 372, 'EUR', 'Euro', 'ET', 'Estoniana', 'ee', 1, 1, 1, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(69, 'Ethiopia', 'ET', 'ETH', 231, 'Addis Ababa', 'Ethiopians', 1104300, 107534882, 251, 'ETB', 'Ethiopian Birr', 'AM', 'Amharic', 'et', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(70, 'Falkland Islands (Malvinas)', 'FK', 'FLK', 238, 'Stanley', 'Falkland Islanders', 12173, 2922, 500, 'FKP', 'Falkland Islands Pound', 'EN', 'English', 'fk', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(71, 'Faroe Islands', 'FO', 'FRO', 234, 'Torshavn', 'Faroese', 1393, 49489, 298, 'DKK', 'Danish Krone', 'FO', 'Faroese', 'fo', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(72, 'Fiji', 'FJ', 'FJI', 242, 'Suva', 'Fijians', 18274, 912241, 679, 'FJD', 'Fijian Dollar', 'HI', 'Hindi', 'fj', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:25:30'),
(73, 'Finland', 'FI', 'FIN', 246, 'Helsinki', 'Finns', 338145, 5542517, 358, 'EUR', 'Euro', 'FI', 'Finnish', 'fi', 1, 1, 1, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(74, 'France', 'FR', 'FRA', 250, 'Paris', 'French', 643801, 65233271, 33, 'EUR', 'Euro', 'FR', 'French', 'fr', 1, 1, 1, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(75, 'Gabon', 'GA', 'GAB', 266, 'Libreville', 'Gabonese', 267667, 2067561, 241, 'XAF', 'Cfa Franc Beac', 'FR', 'French', 'ga', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(76, 'Gambia', 'GM', 'GMB', 270, 'Banjul', 'Gambians', 11295, 2163765, 220, 'GMD', 'Gambian Dalasi', 'EN', 'English', 'gm', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:10:47'),
(77, 'Georgia', 'GE', 'GEO', 268, 'Tbilisi', 'Georgians', 69700, 3907131, 995, 'GEL', 'Georgian Lari', 'KA', 'Georgian', 'ge', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(78, 'Germany', 'DE', 'DEU', 276, 'Berlin', 'Germans', 357022, 82293457, 49, 'EUR', 'Euro', 'DE', 'German', 'de', 1, 1, 1, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(79, 'Ghana', 'GH', 'GHA', 288, 'Accra', 'Ghanaians', 238533, 29463643, 233, 'GHS', 'Ghanaian New Cedi', 'EE', 'Ewe', 'gh', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:10:56'),
(80, 'Gibraltar', 'GI', 'GIB', 292, 'Gibraltar', 'Gibraltarians', 6, 34733, 350, 'GIP', 'Gibraltar Pound', 'ES', 'Spanish', 'gi', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(81, 'Greece', 'GR', 'GRC', 300, 'Athens', 'Greeks', 131957, 11142161, 30, 'EUR', 'Euro', 'EL', 'Greek', 'gr', 1, 1, 1, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(82, 'Greenland', 'GL', 'GRL', 304, 'Nuuk', 'Greenlanders', 2166086, 56565, 299, 'DKK', 'Danish Krone', 'DA', 'Danish', 'gl', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(83, 'Grenada', 'GD', 'GRD', 308, 'Saint George\'s', 'Grenadians', 344, 108339, 1473, 'XCD', 'East Caribbean Dollar', 'EN', 'English', 'gd', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:16:30'),
(84, 'Guam', 'GU', 'GUM', 316, 'Hagatna', 'Guamanians', 544, 165718, 1671, 'USD', 'United States Dollar', 'EN', 'English', 'gu', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(85, 'Guatemala', 'GT', 'GTM', 320, 'Guatemala City', 'Guatemalans', 108889, 17245346, 502, 'GTQ', 'Guatemalan Quetzal', 'ES', 'Spanish', 'gt', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(86, 'Guinea', 'GN', 'GIN', 324, 'Conakry', 'Guineans', 245857, 13052608, 224, 'GNF', 'Guinean Franc', 'FR', 'French', 'gn', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(87, 'Guinea-Bissau', 'GW', 'GNB', 624, 'Bissau', 'Bissau-Guineans', 36125, 1907268, 245, 'XOF', 'Cfa Franc Bceao', 'PT', 'Portuguese', 'gw', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(88, 'Guyana', 'GY', 'GUY', 328, 'Georgetown', 'Guyanese', 214969, 782225, 592, 'GYD', 'Guyanese Dollar', 'EN', 'English', 'gy', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:17:23'),
(89, 'Haiti', 'HT', 'HTI', 332, 'Port-au-prince', 'Haitians', 27750, 11112945, 509, 'HTG', 'Haitian Gourde', 'FR', 'French', 'ht', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(90, 'Heard Island and Mcdonald Islands', 'HM', 'HMD', 334, '-', '', 412, 0, 61, 'AUD', 'Australian Dollar', 'EN', '', 'hm', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(91, 'Honduras', 'HN', 'HND', 340, 'Tegucigalpa', 'Hondurans', 112090, 9417167, 504, 'HNL', 'Honduran Lempira', 'ES', 'Spanish', 'hn', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(92, 'Hong Kong', 'HK', 'HKG', 344, '-', 'Hong Kongese', 1104, 7428887, 852, 'HKD', 'Hong Kong Dollar', 'ZH', 'Chinese', 'hk', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(93, 'Hungary', 'HU', 'HUN', 348, 'Budapest', 'Hungarians', 93028, 9688847, 36, 'HUF', 'Hungarian Forint', 'HU', 'Hungarian', 'hu', 1, 1, 1, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(94, 'Iceland', 'IS', 'ISL', 352, 'Reykjavik', 'Icelanders', 103000, 337780, 354, 'ISK', 'Iceland Krona', 'IS', 'Icelandic', 'is', 0, 1, 1, 1, 0, '0', 0, '0000-00-00 00:00:00'),
(95, 'India', 'IN', 'IND', 356, 'New Delhi', 'Indians', 3287263, 1354051854, 91, 'INR', 'Indian Rupee', 'HI', 'Hindi, English', 'in', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:22:59'),
(96, 'Indonesia', 'ID', 'IDN', 360, 'Jakarta', 'Indonesians', 1904569, 266794980, 62, 'IDR', 'Indonesian Rupiah', 'ID', 'Indonesian', 'id', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(97, 'Iran (Islamic Republic of)', 'IR', 'IRN', 364, 'Tehran', 'Iranians', 1648195, 82011735, 98, 'IRR', 'Iranian Rial', 'FA', 'Persian', 'ir', 0, 0, 0, 0, 0, '0', 0, '2019-09-16 09:15:53'),
(98, 'Iraq', 'IQ', 'IRQ', 368, 'Baghdad', 'Iraqis', 438317, 39339753, 964, 'IQD', 'Iraqi Dinar', 'AR', 'Arabic', 'iq', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(99, 'Ireland', 'IE', 'IRL', 372, 'Dublin', 'Irish', 70273, 4803748, 353, 'EUR', 'Euro', 'GA', 'Irish', 'ie', 1, 1, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(100, 'Israel', 'IL', 'ISR', 376, 'Jerusalem', 'Israelis', 20770, 8452841, 972, 'ILS', 'Israeli New Shekel', 'HE', 'Hebrew', 'il', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(101, 'Italy', 'IT', 'ITA', 380, 'Roma', 'Italians', 301340, 59290969, 39, 'EUR', 'Euro', 'IT', 'Italian', 'it', 1, 1, 1, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(102, 'Jamaica', 'JM', 'JAM', 388, 'Kingston', 'Jamaicans', 10991, 2898677, 1876, 'JMD', 'Jamaican Dollar', 'EN', 'English (jamaican English)', 'jm', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:17:28'),
(103, 'Japan', 'JP', 'JPN', 392, 'Tokyo', 'Japanese', 377915, 127185332, 81, 'JPY', 'Japanese Yen', 'JA', 'Japanese', 'jp', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(104, 'Jordan', 'JO', 'JOR', 400, 'Amman', 'Jordanians', 89342, 9903802, 962, 'JOD', 'Jordanian Dinar', 'AR', 'Arabic', 'jo', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(105, 'Kazakhstan', 'KZ', 'KAZ', 398, 'Astana', 'Kazakhstanis', 2724900, 18403860, 7, 'KZT', 'Kazakhstani Tenge', 'RU', 'Russian', 'kz', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(106, 'Kenya', 'KE', 'KEN', 404, 'Nairobi', 'Kenyans', 580367, 50950879, 254, 'KES', 'Kenyan Shilling', 'EN', 'English', 'ke', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:11:11'),
(107, 'Kiribati', 'KI', 'KIR', 296, 'Tarawa', 'I-Kiribati', 811, 118414, 686, 'AUD', 'Australian Dollar', 'EN', 'English', 'ki', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:25:42'),
(108, 'North Korea', 'KP', 'PRK', 408, 'Pyongyang', 'Koreans', 120538, 25610672, 850, 'KPW', 'North Korean Won', 'KO', 'Korean', 'kp', 0, 0, 0, 0, 0, '0', 0, '2019-09-16 09:12:49'),
(109, 'South Korea', 'KR', 'KOR', 410, 'Seoul', 'Koreans', 99720, 51164435, 82, 'KRW', 'South-korean Won', 'KO', 'Korean', 'kr', 0, 0, 0, 0, 0, '0', 0, '2019-09-16 09:13:16'),
(110, 'Kuwait', 'KW', 'KWT', 414, 'Kuwait', 'Kuwaitis', 17818, 4197128, 965, 'KWD', 'Kuwaiti Dinar', 'AR', 'Arabic', 'kw', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(111, 'Kyrgyzstan', 'KG', 'KGZ', 417, 'Bishkek', 'Kyrgyzstanis', 199951, 6132932, 996, 'KGS', 'Kyrgyzstani Som', 'RU', 'Russian', 'kg', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(112, 'Lao People\'s Democratic Republic', 'LA', 'LAO', 418, 'Vientiane', 'Laos', 236800, 6961210, 856, 'LAK', 'Lao Kip', 'LO', 'Lao', 'la', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(113, 'Latvia', 'LV', 'LVA', 428, 'Riga', 'Latvians', 64589, 1929938, 371, 'EUR', 'Euro', 'LV', 'Latvian', 'lv', 1, 1, 1, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(114, 'Lebanon', 'LB', 'LBN', 422, 'Beirut', 'Lebanese', 10400, 6093509, 961, 'LBP', 'Lebanese Pound', 'AR', 'Arabica', 'lb', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(115, 'Lesotho', 'LS', 'LSO', 426, 'Maseru', 'Basotho', 30355, 2263010, 266, 'LSL', 'Lesotho Loti', 'EN', 'English', 'ls', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:12:12'),
(116, 'Liberia', 'LR', 'LBR', 430, 'Monrovia', 'Liberians', 111369, 4853516, 231, 'LRD', 'Liberian Dollar', 'EN', 'English', 'lr', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(117, 'Libya', 'LY', 'LBY', 434, 'Tripoli', 'Libyans', 1759540, 6470956, 218, 'LYD', 'Libyan Dinar', 'AR', 'Arabic', 'ly', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(118, 'Liechtenstein', 'LI', 'LIE', 438, 'Vaduz', 'Liechtensteiners', 160, 38155, 423, 'CHF', 'Swiss Franc', 'DE', 'German', 'li', 0, 1, 1, 1, 0, '0', 0, '0000-00-00 00:00:00'),
(119, 'Lithuania', 'LT', 'LTU', 440, 'Vilnius', 'Lithuanians', 65300, 2876475, 370, 'LTL', 'Lithuanian Litas', 'LT', 'Lithuanian', 'lt', 1, 1, 1, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(120, 'Luxembourg', 'LU', 'LUX', 442, 'Luxembourg', 'Luxembourgers', 2586, 590321, 352, 'EUR', 'Euro', 'FR', 'French', 'lu', 1, 1, 1, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(121, 'Macao', 'MO', 'MAC', 446, '-', 'Macanese', 31, 632418, 853, 'HKD', 'Hong Kong Dollar', 'ZH', 'Chinese', 'mo', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(122, 'North Macedonia', 'MK', 'MKD', 807, 'Skopje', 'Macedonians', 25713, 2085051, 389, 'MKD', 'Macedonian Denar', 'MK', 'Macedonian', 'mk', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(123, 'Madagascar', 'MG', 'MDG', 450, 'Antananarivo', 'Malagasy', 587041, 26262810, 261, 'MGA', 'Malagasy Ariary', 'FR', 'French', 'mg', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(124, 'Malawi', 'MW', 'MWI', 454, 'Lilongwe', 'Malawians', 118484, 19164728, 265, 'MWK', 'Malawian Kwacha', 'EN', 'English', 'mw', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:12:22'),
(125, 'Malaysia', 'MY', 'MYS', 458, 'Kuala Lumpur', 'Malaysians', 329847, 32042458, 60, 'MYR', 'Malaysian Ringgit', 'MS', 'Malay', 'my', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:23:20'),
(126, 'Maldives', 'MV', 'MDV', 462, 'Male', 'Maldivians', 298, 444259, 960, 'MVR', 'Maldivian Rufiyaa', 'DV', 'Maldivian', 'mv', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(127, 'Mali', 'ML', 'MLI', 466, 'Bamako', 'Malians', 1240192, 19107706, 223, 'XOF', 'Cfa Franc Bceao', 'FR', 'French', 'ml', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(128, 'Malta', 'MT', 'MLT', 470, 'Valletta', 'Maltese', 316, 432089, 356, 'EUR', 'Euro', 'MT', 'Maltese', 'mt', 1, 1, 1, 0, 1, '0', 0, '2019-09-16 06:24:24'),
(129, 'Marshall Islands', 'MH', 'MHL', 584, 'Majuro', 'Marshallese', 181, 53167, 692, 'USD', 'United States Dollar', 'EN', 'English', 'mh', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(130, 'Mauritania', 'MR', 'MRT', 478, 'Nouakchott', 'Mauritanians', 1030700, 4540068, 222, 'MRO', 'Mauritanian Ouguiya', 'AR', 'Arabic', 'mr', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(131, 'Mauritius', 'MU', 'MUS', 480, 'Port Louis', 'Mauritians', 2040, 1268315, 230, 'MUR', 'Mauritian Rupee', 'FR', 'French', 'mu', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:12:32'),
(132, 'Mexico', 'MX', 'MEX', 484, 'Mexico City', 'Mexicans', 1964375, 130759074, 52, 'MXN', 'Mexican Peso', 'ES', 'Spanish', 'mx', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(133, 'Micronesia, Federated States of', 'FM', 'FSM', 583, 'Palikir', 'Micronesians', 702, 106227, 691, 'USD', 'United States Dollar', 'EN', 'English', 'fm', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(134, 'Moldova, Republic of', 'MD', 'MDA', 498, 'Chisinau', 'Moldovans', 33851, 4041065, 373, 'MDL', 'Moldovan Leu', 'RO', 'Romanian', 'md', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(135, 'Monaco', 'MC', 'MCO', 492, 'Monaco', 'Monacans', 2, 38897, 377, 'EUR', 'Euro', 'FR', 'French', 'mc', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(136, 'Mongolia', 'MN', 'MNG', 496, 'Ulaanbaatar', 'Mongolians', 1564116, 3121772, 976, 'MNT', 'Mongolian Tugrik', 'MN', 'Mongolian', 'mn', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(137, 'Montserrat', 'MS', 'MSR', 500, 'Plymouth', 'Montserratians', 102, 5203, 1664, 'XCD', 'East Caribbean Dollar', 'EN', 'English', 'ms', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(138, 'Morocco', 'MA', 'MAR', 504, 'Rabat', 'Moroccans', 446550, 36191805, 212, 'MAD', 'Moroccan Dirham', 'AR', 'Arabic', 'ma', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(139, 'Mozambique', 'MZ', 'MOZ', 508, 'Maputo', 'Mozambicans', 799380, 30528673, 258, 'MZN', 'Mozambican Metical', 'PT', 'Portuguese', 'mz', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:12:37'),
(140, 'Myanmar', 'MM', 'MMR', 104, 'Pyinmana', 'Burmese', 676578, 53855735, 95, 'MMK', 'Myanmar Kyat', 'MY', 'Burmese', 'mm', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(141, 'Namibia', 'NA', 'NAM', 516, 'Windhoek', 'Namibians', 824292, 2587801, 264, 'NAD', 'Namibian Dollar', 'EN', 'English', 'na', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:12:50'),
(142, 'Nauru', 'NR', 'NRU', 520, 'Yaren', 'Nauruans', 21, 11312, 674, 'AUD', 'Australian Dollar', 'EN', 'English', 'nr', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:25:53'),
(143, 'Nepal', 'NP', 'NPL', 524, 'Kathmandu', 'Nepalese', 147181, 29624035, 977, 'NPR', 'Nepalese Rupee', 'NE', 'Nepali', 'np', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(144, 'Netherlands', 'NL', 'NLD', 528, 'Amsterdam', 'Netherlanders', 41543, 17110161, 31, 'EUR', 'Euro', 'NL', 'Dutch', 'nl', 1, 1, 1, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(146, 'New Zealand', 'NZ', 'NZL', 554, 'Wellington', 'New Zealanders', 267710, 4749598, 64, 'NZD', 'New Zealand Dollar', 'EN', 'English', 'nz', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:25:56'),
(147, 'Nicaragua', 'NI', 'NIC', 558, 'Managua', 'Nicaraguans', 130370, 6284757, 505, 'NIO', 'Nicaraguan CÃ?rdoba', 'ES', 'Spanish', 'ni', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(148, 'Niger', 'NE', 'NER', 562, 'Niamey', 'Nigeriens', 1186408, 22311375, 227, 'NZD', 'New Zealand Dollar', 'FR', 'French', 'ne', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(149, 'Nigeria', 'NG', 'NGA', 566, 'Abuja', 'Nigerians', 923768, 195875237, 234, 'NGN', 'Nigerian Naira', 'EN', 'English', 'ng', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:12:58'),
(150, 'Niue', 'NU', 'NIU', 570, 'Alofi', 'Niueans', 260, 1624, 683, 'NZD', 'New Zealand Dollar', 'EN', 'English', 'nu', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(151, 'Norfolk Island', 'NF', 'NFK', 574, 'Kingston', 'Norfolk Islanders', 36, 2210, 672, 'AUD', 'Australian Dollar', 'EN', 'English', 'nf', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(152, 'Northern Mariana Islands', 'MP', 'MNP', 580, 'Saipan', 'Northern Marianans', 464, 55194, 1670, 'USD', 'United States Dollar', 'EN', 'English', 'mp', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(153, 'Norway', 'NO', 'NOR', 578, 'Oslo', 'Norwegians', 323802, 5353363, 47, 'NOK', 'Norwegian Kroner', 'NO', 'Norwegian', 'no', 0, 1, 1, 1, 0, '0', 0, '0000-00-00 00:00:00'),
(154, 'Oman', 'OM', 'OMN', 512, 'Muscat', 'Omanis', 309500, 4829946, 968, 'OMR', 'Omani Rial', 'AR', 'Arabic', 'om', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(155, 'Pakistan', 'PK', 'PAK', 586, 'Islamabad', 'Pakistanis', 796095, 200813818, 92, 'PKR', 'Pakistan Rupee', 'UR', 'Urdu', 'pk', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:23:31'),
(156, 'Palau', 'PW', 'PLW', 585, 'Melekeok - Palau State Capital', 'Palauans', 459, 21964, 680, 'USD', 'United States Dollar', 'EN', 'English', 'pw', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(157, 'Panama', 'PA', 'PAN', 591, 'Panama', 'Panamanians', 75420, 4162618, 507, 'PAB', 'Panamanian Balboa', 'ES', 'Spanish', 'pa', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(158, 'Papua New Guinea', 'PG', 'PNG', 598, 'Port Moresby', 'Papua New Guineans', 462840, 8418346, 675, 'PGK', 'Papua New Guinean Kina', 'EN', 'English', 'pg', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:26:06'),
(159, 'Paraguay', 'PY', 'PRY', 600, 'Asuncion', 'Paraguayans', 406752, 6896908, 595, 'PYG', 'Paraguayan GuaranÃ', 'ES', 'Spanish', 'py', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(160, 'Peru', 'PE', 'PER', 604, 'Lima', 'Peruvians', 1285216, 32551815, 51, 'PEN', 'Peruvian Nuevo Sol', 'ES', 'Spanish', 'pe', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(161, 'Philippines', 'PH', 'PHL', 608, 'Manila', 'Filipinos', 300000, 106512074, 63, 'PHP', 'Philippine Peso', 'EN', 'English', 'ph', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(162, 'Pitcairn', 'PN', 'PCN', 612, 'Adamstown', 'Pitcairn Islanders', 47, 54, 872, 'NZD', 'New Zealand Dollar', 'EN', 'English', 'pn', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(163, 'Poland', 'PL', 'POL', 616, 'Warsaw', 'Poles', 312685, 38104832, 48, 'PLN', 'Polish Zloty', 'PL', 'Polish', 'pl', 1, 1, 1, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(164, 'Portugal', 'PT', 'PRT', 620, 'Lisbon', 'Portuguese', 92090, 10291196, 351, 'EUR', 'Euro', 'PT', 'Portuguese', 'pt', 1, 1, 1, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(165, 'Puerto Rico', 'PR', 'PRI', 630, 'San Juan', 'Puerto Ricans', 13790, 3659007, 1939, 'USD', 'United States Dollar', 'ES', 'Spanish', 'pr', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(166, 'Qatar', 'QA', 'QAT', 634, 'Doha', 'Qataris', 11586, 2694849, 974, 'QAR', 'Qatari Riyal', 'AR', 'Arabic', 'qa', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(167, 'Romania', 'RO', 'ROU', 642, 'Bucharest', 'Romanians', 238391, 19580634, 40, 'RON', 'Romanian New Lei', 'RO', 'Romanian', 'ro', 1, 1, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(168, 'Russian Federation', 'RU', 'RUS', 643, 'Moscow', 'Russians', 17098242, 143964709, 7, 'RUB', 'Russian Rouble', 'RU', 'Russian', 'ru', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(169, 'Rwanda', 'RW', 'RWA', 646, 'Kigali', 'Rwandans', 26338, 12501156, 250, 'RWF', 'Rwandan Franc', 'FR', 'French', 'rw', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:13:06'),
(170, 'Saint Kitts and Nevis', 'KN', 'KNA', 659, 'Basseterre', 'Kittitians or Nevisians', 261, 55850, 1869, 'XCD', 'East Caribbean Dollar', 'EN', 'English', 'kn', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:17:41'),
(171, 'Saint Lucia', 'LC', 'LCA', 662, 'Castries', 'Saint Lucians', 616, 179667, 1758, 'XCD', 'East Caribbean Dollar', 'EN', 'English', 'lc', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:17:46'),
(172, 'Saint Vincent and The Grenadines', 'VC', 'VCT', 670, 'Kingstown', 'Saint Vincentians', 389, 110200, 1784, 'XCD', 'East Caribbean Dollar', 'EN', 'English', 'vc', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:24:40'),
(173, 'Samoa', 'WS', 'WSM', 882, 'Apia', 'Samoans', 2831, 197695, 685, 'WST', 'Samoan Tala', 'EN', 'English', 'ws', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:26:16'),
(174, 'San Marino', 'SM', 'SMR', 674, 'San Marino', 'Senegalese', 61, 33557, 378, 'EUR', 'Euro', 'IT', 'Italian', 'sm', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(175, 'Sao Tome and Principe', 'ST', 'STP', 678, 'Sao Tome', 'Sao Tomeans', 964, 208818, 239, 'STD', 'Droba', 'PT', 'Portuguese', 'st', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(176, 'Saudi Arabia', 'SA', 'SAU', 682, 'Riyadh', 'Saudis', 2149690, 33554343, 966, 'SAR', 'Saudi Riyal', 'AR', 'Arabic', 'sa', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(177, 'Senegal', 'SN', 'SEN', 686, 'Dakar', 'Somalis', 196722, 16294270, 221, 'XOF', 'Cfa Franc Bceao', 'FR', 'French', 'sn', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(178, 'Seychelles', 'SC', 'SYC', 690, 'Victoria', 'Seychellois', 455, 95235, 248, 'SCR', 'Seychelles Rupee', 'FR', 'French', 'sc', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:13:15'),
(179, 'Sierra Leone', 'SL', 'SLE', 694, 'Freetown', 'Sammarinese', 71740, 7719729, 232, 'SLL', 'Sierra Leonean Leone', 'EN', 'English', 'sl', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:13:21'),
(180, 'Singapore', 'SG', 'SGP', 702, 'Singapore', 'Singaporeans', 697, 5791901, 65, 'SGD', 'Singapore Dollar', 'EN', 'English', 'sg', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:23:48'),
(181, 'Slovakia', 'SK', 'SVK', 703, 'Bratislava', 'Sierra Leoneans', 49035, 5449816, 421, 'EUR', 'Euro', 'SK', 'Slovak', 'sk', 1, 1, 1, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(182, 'Slovenia', 'SI', 'SVN', 705, 'Ljubljana', 'Slovenes', 20273, 2081260, 386, 'EUR', 'Euro', 'SL', 'Slovene', 'si', 1, 1, 1, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(183, 'Solomon Islands', 'SB', 'SLB', 90, 'Honiara', 'Solomon Islanders', 28896, 623281, 677, 'SBD', 'Solomon Islands Dollar', 'EN', 'English', 'sb', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:26:34'),
(184, 'Somalia', 'SO', 'SOM', 706, 'Mogadishu', 'Somalilanders', 637657, 15181925, 252, 'SOS', 'Somali Shilling', 'AR', 'Arabic', 'so', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(185, 'South Africa', 'ZA', 'ZAF', 710, 'Cape Town', 'South Africans', 1219090, 57398421, 27, 'ZAR', 'South African Rand', 'AF', 'Afrikaans', 'za', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:13:31'),
(186, 'South Georgia and The South Sandwich Islands', 'GS', 'SGS', 239, 'Grytviken', 'South Georgian or South Sandwich Islander', 3903, 100, 0, 'GBP', 'Pound Sterling', 'EN', 'English', 'gs', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(187, 'Spain', 'ES', 'ESP', 724, 'Madrid', 'Spaniards', 505370, 46397452, 34, 'EUR', 'Euro', 'ES', 'Spanish', 'es', 1, 1, 1, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(188, 'Sri Lanka', 'LK', 'LKA', 144, 'Sri Jayewardenepura Kotte', 'Sri Lankans', 65610, 20950041, 94, 'LKR', 'Sri Lanka Rupee', 'TA', 'Tamil', 'lk', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:24:00'),
(189, 'Saint Helena, Ascension and Tristan Da Cunha', 'SH', 'SHN', 654, 'Jamestown', 'Saint Helenians', 122, 4074, 290, 'SHP', 'Saint Helena Pound', 'EN', 'English', 'sh', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(190, 'Sudan', 'SD', 'SDN', 729, 'Khartoum', 'Sudanese', 1861484, 41511526, 249, 'SDG', 'Sudanese Pound', 'AR', 'Arabic', 'sd', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(191, 'Suriname', 'SR', 'SUR', 740, 'Paramaribo', 'Surinamers', 163820, 568301, 597, 'SRD', 'Surinamese Dollar', 'NL', 'Dutch', 'sr', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(192, 'Svalbard and Jan Mayen', 'SJ', 'SJM', 744, 'Longyearbyen', 'Slovakians', 62045, 2667, 47, 'NOK', 'Norwegian Krone', 'NO', 'Norwegian', 'sj', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(193, 'Swaziland', 'SZ', 'SWZ', 748, 'Mbabane', 'Swazis', 17364, 1391385, 268, 'SZL', 'Swazi Lilangeni', 'EN', 'English', 'sz', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:12:01'),
(194, 'Sweden', 'SE', 'SWE', 752, 'Stockholm', 'Swedes', 450295, 9982709, 46, 'SEK', 'Swedish Krona', 'SV', 'Swedish', 'se', 1, 1, 1, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(195, 'Switzerland', 'CH', 'CHE', 756, 'Bern', 'Swiss', 41277, 8544034, 41, 'CHF', 'Swiss Franc', 'DE', 'German', 'ch', 0, 0, 1, 1, 0, '0', 0, '0000-00-00 00:00:00'),
(196, 'Syrian Arab Republic', 'SY', 'SYR', 760, 'Damascus', 'Syrians', 185180, 18284407, 963, 'SYP', 'Syrian Pound', 'AR', 'Arabic', 'sy', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(197, 'Taiwan, Province of China', 'TW', 'TWN', 158, 'Taipei', 'Taiwanese', 35980, 23694089, 886, 'TWD', 'Taiwan Dollar', 'ZH', 'Chinese Tw', 'tw', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(198, 'Tajikistan', 'TJ', 'TJK', 762, 'Dushanbe', 'Tajikistanis', 143100, 9107211, 992, 'TJS', 'Tajikistani Somoni', 'FA', 'Persian', 'tj', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(199, 'Tanzania, United Republic of', 'TZ', 'TZA', 834, 'Dodoma', 'Tanzanians', 947300, 59091392, 255, 'TZS', 'Tanzanian Shilling', 'EN', 'English', 'tz', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:13:56'),
(200, 'Thailand', 'TH', 'THA', 764, 'Bangkok', 'Thai', 513120, 69183173, 66, 'THB', 'Thai Baht', 'TH', 'Thai', 'th', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(201, 'Togo', 'TG', 'TGO', 768, 'Lome', 'Togolese', 56785, 7990926, 228, 'XOF', 'Cfa Franc Bceao', 'FR', 'French', 'tg', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(202, 'Tokelau', 'TK', 'TKL', 772, '-', 'Tokelauans', 12, 1319, 690, 'NZD', 'New Zealand Dollar', 'EN', 'English', 'tk', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(203, 'Tonga', 'TO', 'TON', 776, 'Nuku\'alofa', 'Tongans', 747, 109008, 676, 'TOP', 'Tongan Pa\'anga', 'EN', 'English', 'to', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:26:36'),
(204, 'Trinidad and Tobago', 'TT', 'TTO', 780, 'Port of Spain', 'Trinidadians or Tobagonians', 5128, 1372598, 1868, 'TTD', 'Trinidad/tobago Dollar', 'EN', 'English', 'tt', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:18:02'),
(205, 'Tunisia', 'TN', 'TUN', 788, 'Tunis', 'Tunisians', 163610, 11659174, 216, 'TND', 'Tunisian Dinar', 'AR', 'Literary Arabic', 'tn', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(206, 'Turkey', 'TR', 'TUR', 792, 'Ankara', 'Turks', 783562, 81916871, 90, 'TRY', 'Turkish Lira', 'TR', 'Turkish', 'tr', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(207, 'Turkmenistan', 'TM', 'TKM', 795, 'Ashgabat', 'Turkmens', 488100, 5851466, 993, 'TMT', 'Turkmenistani Manat', 'RU', 'Russian', 'tm', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(208, 'Turks and Caicos Islands', 'TC', 'TCA', 796, 'Cockburn Town', 'Turks and Caicos Islanders', 948, 35963, 1649, 'USD', 'United States Dollar', 'EN', 'English', 'tc', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(209, 'Tuvalu', 'TV', 'TUV', 798, 'Funafuti', 'Tuvaluans', 26, 11287, 688, 'AUD', 'Australian Dollar', 'EN', 'Tuvaluan English', 'tv', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:26:45'),
(210, 'Uganda', 'UG', 'UGA', 800, 'Kampala', 'Ugandans', 241038, 44270563, 256, 'UGX', 'Ugandan Shilling', 'EN', 'English', 'ug', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:13:43'),
(211, 'Ukraine', 'UA', 'UKR', 804, 'Kiev', 'Ukrainians', 603550, 44009214, 380, 'UAH', 'Ukrainian Hryvnia', 'UK', 'Ukrainian', 'ua', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(212, 'United Arab Emirates', 'AE', 'ARE', 784, 'Abu Dhabi', 'Emirians', 83600, 9541615, 971, 'AED', 'United Arab Emirates Dirham', 'AR', 'Arabic', 'ae', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(213, 'United Kingdom', 'GB', 'GBR', 826, 'London', 'British', 243610, 66573504, 44, 'GBP', 'British Pound', 'EN', 'English', 'gb', 1, 1, 0, 0, 1, '0', 0, '2019-09-16 06:25:00'),
(214, 'United States', 'US', 'USA', 840, 'Washington, D.C.', 'Americans', 9826675, 326766748, 1, 'USD', 'United States Dollar', 'EN', 'English', 'us', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(215, 'United States Minor Outlying Islands', 'UM', 'UMI', 581, '-', 'â??American Islander', 34, 300, 0, 'USD', 'United States Dollar', 'EN', 'English', 'um', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(216, 'Uruguay', 'UY', 'URY', 858, 'Montevideo', 'Uruguayans', 176215, 3469551, 598, 'UYI', 'Uruguay Peso En Unidades Indexadas', 'ES', 'Spanish', 'uy', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(217, 'Uzbekistan', 'UZ', 'UZB', 860, 'Tashkent', 'Uzbekistanis', 447400, 32364996, 998, 'UZS', 'Uzbekistan Som', 'UZ', 'Uzbek', 'uz', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(218, 'Vanuatu', 'VU', 'VUT', 548, 'Port-vila', 'Ni-Vanuatu', 12189, 282117, 678, 'VUV', 'Vanuatu Vatu', 'FR', 'French', 'vu', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:26:57'),
(219, 'Holy See', 'VA', 'VAT', 336, 'Vatican City', 'Vatican citizens', 0, 801, 39, 'EUR', 'Euro', 'EN', 'Latin', 'va', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(220, 'Venezuela, Bolivarian Republic of', 'VE', 'VEN', 862, 'Caracas', 'Venezuelans', 912050, 32381221, 58, 'VEF', 'Venezuelan Bolivar Fuerte', 'ES', 'Spanish', 've', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(221, 'Viet Nam', 'VN', 'VNM', 704, 'Ha Noi', 'Vietnamese', 331210, 96491146, 84, 'VND', 'Vietnamese Dong', 'VI', 'Vietnamese', 'vn', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(222, 'Virgin Islands (British)', 'VG', 'VGB', 92, 'Road Town', 'British Virgin Islanders', 151, 31719, 1284, 'USD', 'United States Dollar', 'EN', 'English', 'vg', 0, 0, 0, 0, 0, '0', 0, '2019-09-16 09:19:29'),
(223, 'Virgin Islands (U.S.)', 'VI', 'VIR', 850, 'Charlotte Amalie', 'U.S. Virgin Islanders', 1910, 104914, 1340, 'USD', 'United States Dollar', 'EN', 'English', 'vi', 0, 0, 0, 0, 0, '0', 0, '2019-09-16 09:19:56'),
(224, 'Western Sahara', 'EH', 'ESH', 732, 'Laayoune / El Aaiun', 'Sahrawis', 266000, 567421, 21, 'MAD', 'Moroccan Dirham', 'ES', 'Spanish', 'eh', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(225, 'Yemen', 'YE', 'YEM', 887, 'Sanaa', 'Yemenis', 527968, 28915284, 967, 'YER', 'Yemeni Rial', 'AR', 'Arabic', 'ye', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(228, 'Zambia', 'ZM', 'ZMB', 894, 'Lusaka', 'Zambians', 752618, 17609178, 260, 'ZMW', 'Zambian Kwacha', 'EN', 'English', 'zm', 0, 0, 0, 0, 1, '0', 0, '2019-09-16 06:14:06'),
(229, 'Zimbabwe', 'ZW', 'ZWE', 716, 'Harare', 'Zimbabweans', 390757, 16913261, 263, 'ZWD', 'Zimbabwe Dollar', 'EN', 'English', 'zw', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(230, 'Aland Islands', 'AX', 'ALA', 248, 'Mariehamn', 'Aland Islanders', 1552, 29013, 358, 'EUR', 'Euro', 'SV', 'Swedish', 'ax', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(231, 'Saint Barthelemy', 'BL', 'BLM', 652, 'Gustavia', 'Barthelemois', 21, 8450, 590, 'EUR', 'Euro', 'FR', 'French', 'gp', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(232, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', 535, 'Kralendijk', 'Bonaire Dutch', 328, 24548, 599, 'USD', 'United States Dollar', 'NL', 'Dutch', 'bq', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(233, 'Democratic Republic of Congo', 'CD', 'COD', 180, 'Kinshasa', 'Congolese', 2344858, 84004989, 243, 'CDF', 'Congolese Franc', 'EN', '', 'cd', 0, 0, 0, 0, 0, '0', 0, '2019-09-16 09:17:59'),
(234, 'Curacao', 'CW', 'CUW', 531, 'Willemstad', 'Curacaoans', 444, 161577, 5999, 'ANG', 'Nl Antillian Guilder', 'NL', 'Dutch', 'cw', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(235, 'French Guiana', 'GF', 'GUF', 254, 'Cayenne', 'French Guianese', 86504, 289763, 594, 'EUR', 'Euro', 'FR', 'French', 'gf', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(236, 'Guernsey', 'GG', 'GGY', 831, 'Saint Peter Port', 'Channel Islanders', 78, 66502, 44, 'GBP', 'Pound Sterling', 'FR', 'French', 'gg', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(237, 'Guadeloupe', 'GP', 'GLP', 312, 'Basse-terre', 'Guadeloupians', 1630, 449173, 590, 'EUR', 'Euro', 'FR', 'French', 'gp', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(238, 'Isle of Man', 'IM', 'IMN', 833, 'Douglas', 'Manx', 572, 84831, 44, 'GBP', 'British Pound', 'EN', 'English', 'im', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(239, 'Jersey', 'JE', 'JEY', 832, 'Saint Helier', 'Channel Islanders', 116, 166083, 44, 'GBP', 'British Pound', 'FR', 'French', 'je', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(240, 'Montenegro', 'ME', 'MNE', 499, 'Podgorica', 'Montenegrins', 13812, 629219, 382, 'EUR', 'Euro', 'SR', 'Serbian', 'me', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(241, 'Saint Martin (French Part)', 'MF', 'MAF', 663, 'Marigot', 'Saint-Martinois', 54, 33100, 590, 'EUR', 'Euro', 'FR', 'French', 'gp', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(242, 'Martinique', 'MQ', 'MTQ', 474, 'Fort-de-france', 'Martiniquais', 1128, 385065, 596, 'EUR', 'Euro', 'FR', 'French', 'mq', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(243, 'New Caledonia', 'NC', 'NCL', 540, 'Noumea', 'New Caledonians', 18575, 279821, 687, 'XPF', 'Cfp Franc', 'FR', 'French', 'nc', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(244, 'French Polynesia', 'PF', 'PYF', 258, 'Papeete', 'French Polynesians', 4167, 285859, 689, 'XPF', 'Cfp Franc', 'FR', 'French', 'pf', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(245, 'Saint Pierre and Miquelon', 'PM', 'SPM', 666, 'Saint-pierre', 'Saint-Pierrais or Miquelonnais', 242, 6342, 508, 'EUR', 'Euro', 'FR', 'French', 'pm', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(246, 'Palestine', 'PS', 'PSE', 275, '-', 'Palestinians', 5860, 5052776, 972, 'ILS', 'Israeli New Shekel', 'EN', 'English', 'ps', 0, 0, 0, 0, 0, '0', 0, '2019-09-16 09:21:27'),
(247, 'Reunion', 'RE', 'REU', 638, 'Saint-denis', 'Runionese', 2512, 883247, 262, 'EUR', 'Euro', 'EN', 'English', 're', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(248, 'Serbia', 'RS', 'SRB', 688, 'Belgrade', 'Serbians', 77474, 8762027, 381, 'RSD', 'Serbian Dinar', 'SR', 'Serbian', 'rs', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(249, 'South Sudan', 'SS', 'SSD', 728, 'Juba', 'South Sudanese', 644329, 12919053, 211, 'SSP', 'South Sudanese Pound', 'EN', 'English', 'ss', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(250, 'Sint Maarten (Dutch Part)', 'SX', 'SXM', 534, 'Philipsburg', 'Sint Maartener', 34, 40552, 1721, 'ANG', 'Nl Antillian Guilder', 'NL', 'Dutch', 'sx', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(251, 'French Southern Territories', 'TF', 'ATF', 260, 'Port-aux-francais', 'French', 439781, 140, 262, 'EUR', 'Euro', 'FR', 'French', 'tf', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(252, 'Wallis and Futuna', 'WF', 'WLF', 876, 'Mata\'utu', 'Wallisians or Futunans', 142, 11683, 681, 'XPF', 'Cfp Franc', 'FR', 'French', 'wf', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00'),
(253, 'Mayotte', 'YT', 'MYT', 175, 'Mamoudzou', 'Mahorans', 374, 259682, 262, 'EUR', 'Euro', 'FR', 'French', 'yt', 0, 0, 0, 0, 0, '0', 0, '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`countryID`),
  ADD KEY `countryID` (`countryID`),
  ADD KEY `countryName` (`country`),
  ADD KEY `abbr` (`abbr`),
  ADD KEY `abbr3` (`abbr3`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `countryID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=254;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
