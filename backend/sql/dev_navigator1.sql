/*
 Navicat Premium Data Transfer

 Source Server         : testconn
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : dev_navigator1

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 03/11/2024 19:55:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for developer_network
-- ----------------------------
DROP TABLE IF EXISTS `developer_network`;
CREATE TABLE `developer_network` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `developer_id` bigint NOT NULL,
  `connected_developer_id` bigint NOT NULL,
  `interaction_score` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of developer_network
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for developer_profile
-- ----------------------------
DROP TABLE IF EXISTS `developer_profile`;
CREATE TABLE `developer_profile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `github_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `talent_rank` decimal(10,0) DEFAULT NULL,
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `country_confidence` decimal(5,2) DEFAULT NULL,
  `blog_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `github_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `followers` int DEFAULT NULL,
  `stars_count` int DEFAULT NULL,
  `commit_count` int DEFAULT NULL,
  `repo_count` int DEFAULT NULL,
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of developer_profile
-- ----------------------------
BEGIN;
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (5, 'ruanyf', 137655, '中国', NULL, 'https://twitter.com/ruanyf', 'https://github.com/ruanyf', 79322, 47366, 596, 72, 'https://avatars.githubusercontent.com/u/905434?v=4');
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (6, 'liyupi', 18536, 'United States', NULL, 'https://www.code-nav.cn', 'https://github.com/liyupi', 17375, 5666, 664, 82, 'https://avatars.githubusercontent.com/u/26037703?v=4');
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (7, 'halfrost', 67221, '[California, Singapore, China]', NULL, 'https://halfrost.com', 'https://github.com/halfrost', 17037, 32937, 153, 32, 'https://avatars.githubusercontent.com/u/10825609?v=4');
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (8, 'halfrost', 67221, '[California, Singapore, China]', NULL, 'https://halfrost.com', 'https://github.com/halfrost', 17037, 32937, 153, 32, 'https://avatars.githubusercontent.com/u/10825609?v=4');
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (9, 'justjavac', 176817, '中国', NULL, 'https://twitter.com/justjavac', 'https://github.com/justjavac', 16926, 111563, 904, 376, 'https://avatars.githubusercontent.com/u/359395?v=4');
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (10, 'justjavac', 176817, '中国', NULL, 'https://twitter.com/justjavac', 'https://github.com/justjavac', 16926, 111563, 904, 376, 'https://avatars.githubusercontent.com/u/359395?v=4');
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (11, 'liyupi', 18540, 'United States', NULL, 'https://www.code-nav.cn', 'https://github.com/liyupi', 17381, 5668, 664, 82, 'https://avatars.githubusercontent.com/u/26037703?v=4');
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (12, 'kamranahmedse', 368816, 'United Kingdom', NULL, 'https://kamranahmed.info', 'https://github.com/kamranahmedse', 34706, 295570, 2682, 102, 'https://avatars.githubusercontent.com/u/4921183?v=4');
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (13, 'programthink', 59821, '中国', NULL, 'https://program-think.blogspot.com/', 'https://github.com/programthink', 21389, 18319, 0, 5, 'https://avatars.githubusercontent.com/u/4027957?v=4');
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (14, 'phodal', 34513, '中国', NULL, 'https://www.phodal.com/', 'https://github.com/phodal', 20066, 10131, 9392, 367, 'https://avatars.githubusercontent.com/u/472311?v=4');
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (15, 'michaelliao', 29922, '中国', NULL, 'https://liaoxuefeng.com', 'https://github.com/michaelliao', 37262, 6247, 754, 99, 'https://avatars.githubusercontent.com/u/470058?v=4');
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (16, 'cyrilmottier', 1721, 'France', NULL, 'https://cyrilmottier.com', 'https://github.com/cyrilmottier', 4295, 2581, 9, 23, 'https://avatars.githubusercontent.com/u/92794?v=4');
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (17, 'frontend-joe', 4439, 'United Kingdom', NULL, 'frontendjoe.com', 'https://github.com/frontend-joe', 9425, 703, 841, 94, 'https://avatars.githubusercontent.com/u/59584407?v=4');
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (18, 'iamshaunjp', 18879, 'United Kingdom', NULL, 'https://netninja.dev/', 'https://github.com/iamshaunjp', 30988, 1835, 37, 130, 'https://avatars.githubusercontent.com/u/9838872?v=4');
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (19, 'halfrost', 67239, '[California, Singapore, China]', NULL, 'https://halfrost.com', 'https://github.com/halfrost', 17042, 32942, 153, 32, 'https://avatars.githubusercontent.com/u/10825609?v=4');
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (20, 'fzaninotto', 31434, 'France', NULL, 'https://marmelab.com/', 'https://github.com/fzaninotto', 4252, 26788, 2818, 71, 'https://avatars.githubusercontent.com/u/99944?v=4');
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (21, 'cloudwu', 29368, '中国', NULL, 'http://blog.codingnow.com', 'https://github.com/cloudwu', 20977, 13325, 697, 134, 'https://avatars.githubusercontent.com/u/729648?v=4');
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (22, 'gentilkiwi', 30194, 'France', NULL, 'https://blog.gentilkiwi.com', 'https://github.com/gentilkiwi', 4137, 19405, 131, 24, 'https://avatars.githubusercontent.com/u/2307945?v=4');
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (23, 'liyupi', 18592, 'United States', NULL, 'https://www.code-nav.cn', 'https://github.com/liyupi', 17415, 5680, 668, 82, 'https://avatars.githubusercontent.com/u/26037703?v=4');
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (24, 'justjavac', 176890, '中国', NULL, 'https://twitter.com/justjavac', 'https://github.com/justjavac', 16931, 111597, 906, 376, 'https://avatars.githubusercontent.com/u/359395?v=4');
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (25, 'ogrisel', 5101, 'France', NULL, 'https://ogrisel.com', 'https://github.com/ogrisel', 4745, 1592, 900, 208, 'https://avatars.githubusercontent.com/u/89061?v=4');
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (26, 'ruanyf', 137782, '中国', NULL, 'https://twitter.com/ruanyf', 'https://github.com/ruanyf', 79334, 47432, 603, 72, 'https://avatars.githubusercontent.com/u/905434?v=4');
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (27, 'jwasham', 239713, 'United States', NULL, 'https://startupnextdoor.com', 'https://github.com/jwasham', 23676, 306306, 42, 30, 'https://avatars.githubusercontent.com/u/3771963?v=4');
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (28, 'dennybritz', 36436, '日本', NULL, 'https://twitter.com/dennybritz', 'https://github.com/dennybritz', 9471, 20552, 2215, 61, 'https://avatars.githubusercontent.com/u/403133?v=4');
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (29, 'ornicar', 22441, 'France', NULL, 'https://mas.to/@thibault', 'https://github.com/ornicar', 5739, 15583, 6654, 414, 'https://avatars.githubusercontent.com/u/140370?v=4');
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (30, 'alexellis', 39402, 'United Kingdom', NULL, 'https://www.alexellis.io/', 'https://github.com/alexellis', 4892, 25148, 3171, 441, 'https://avatars.githubusercontent.com/u/6358735?v=4');
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (31, 'samuelcolvin', 5019, 'United Kingdom', NULL, 'https://pydantic.dev/logfire', 'https://github.com/samuelcolvin', 4951, 77106, 2253, 262, 'https://avatars.githubusercontent.com/u/4039449?v=4');
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (32, 'mattn', 21636, 'Osaka, Japan', NULL, 'https://mattn.kaoriya.net/', 'https://github.com/mattn', 12443, 7996, 2239, 2019, 'https://avatars.githubusercontent.com/u/10111?v=4');
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (33, 'CoreyMSchafer', 20163, 'United States', NULL, 'http://coreyms.com', 'https://github.com/CoreyMSchafer', 12659, 10347, 24, 5, 'https://avatars.githubusercontent.com/u/4048251?v=4');
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (34, 'kenjinote', 7531, '日本', NULL, 'hack.jp', 'https://github.com/kenjinote', 16766, 413, 714, 604, 'https://avatars.githubusercontent.com/u/2605401?v=4');
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (35, 'lepture', 12043, '日本', NULL, 'https://lepture.com', 'https://github.com/lepture', 8701, 4553, 358, 175, 'https://avatars.githubusercontent.com/u/290496?v=4');
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (36, 'keijiro', 22724, '日本', NULL, 'https://www.keijiro.tokyo', 'https://github.com/keijiro', 21859, 3978, 1884, 820, 'https://avatars.githubusercontent.com/u/343936?v=4');
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (37, 'daimajia', 40680, 'Beijing, China', NULL, 'daimajia.com', 'https://github.com/daimajia', 24631, 12428, 1055, 89, 'https://avatars.githubusercontent.com/u/2503423?v=4');
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (38, 'jgilfelt', 18379, 'United Kingdom', NULL, '', 'https://github.com/jgilfelt', 4712, 5359, 1770, 34, 'https://avatars.githubusercontent.com/u/175697?v=4');
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (39, 'craftzdog', 15191, 'Osaka, Japan', NULL, 'https://www.craftz.dog/', 'https://github.com/craftzdog', 10823, 6394, 2070, 155, 'https://avatars.githubusercontent.com/u/1332805?v=4');
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (40, 'wasabeef', 86914, 'Tokyo, Japan', NULL, 'https://wasabeef.jp', 'https://github.com/wasabeef', 9370, 50620, 2882, 46, 'https://avatars.githubusercontent.com/u/1833474?v=4');
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (41, 'milsaware', 2022, 'United Kingdom', NULL, '', 'https://github.com/milsaware', 4594, 66, 34, 20, 'https://avatars.githubusercontent.com/u/95859352?v=4');
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (42, 'onevcat', 48793, 'Yokohama, Japan / China', NULL, 'https://onev.cat', 'https://github.com/onevcat', 15447, 23393, 1492, 213, 'https://avatars.githubusercontent.com/u/1019875?v=4');
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (43, 'kiku-lyf', 4, 'Germany (100.0%)', NULL, '', 'https://github.com/kiku-lyf', 0, 1, 19, 4, 'https://avatars.githubusercontent.com/u/158173778?v=4');
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (44, 'Mrkuib', 42, 'I love San Francisco (50.0%)', NULL, '', 'https://github.com/Mrkuib', 1, 65, 180, 4, 'https://avatars.githubusercontent.com/u/67945139?v=4');
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (45, 'hakimel', 102016, 'Sverige', NULL, 'https://hakim.se', 'https://github.com/hakimel', 12434, 67859, 1099, 31, 'https://avatars.githubusercontent.com/u/629429?v=4');
INSERT INTO `developer_profile` (`id`, `github_username`, `talent_rank`, `country`, `country_confidence`, `blog_url`, `github_url`, `followers`, `stars_count`, `commit_count`, `repo_count`, `avatar_url`) VALUES (46, 'hakimel', 102016, 'Sverige', NULL, 'https://hakim.se', 'https://github.com/hakimel', 12434, 67859, 1099, 31, 'https://avatars.githubusercontent.com/u/629429?v=4');
COMMIT;

-- ----------------------------
-- Table structure for domain
-- ----------------------------
DROP TABLE IF EXISTS `domain`;
CREATE TABLE `domain` (
  `id` int NOT NULL AUTO_INCREMENT,
  `github_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of domain
-- ----------------------------
BEGIN;
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (41, 'ruanyf', 'JavaScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (42, 'ruanyf', 'Shell');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (43, 'ruanyf', 'HTML');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (44, 'ruanyf', 'CSS');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (45, 'liyupi', 'Java');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (46, 'liyupi', 'TypeScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (47, 'liyupi', 'JavaScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (48, 'liyupi', 'Vue');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (49, 'halfrost', 'Go');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (50, 'halfrost', 'Python');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (51, 'halfrost', 'CSS');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (52, 'halfrost', 'Objective-C');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (53, 'halfrost', 'Go');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (54, 'halfrost', 'Python');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (55, 'halfrost', 'CSS');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (56, 'halfrost', 'Objective-C');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (57, 'halfrost', 'Go');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (58, 'halfrost', 'Python');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (59, 'halfrost', 'CSS');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (60, 'halfrost', 'Objective-C');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (61, 'justjavac', 'HTML');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (62, 'justjavac', 'JavaScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (63, 'justjavac', 'TypeScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (64, 'justjavac', 'Shell');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (65, 'justjavac', 'HTML');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (66, 'justjavac', 'JavaScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (67, 'justjavac', 'TypeScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (68, 'justjavac', 'Shell');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (69, 'liyupi', 'TypeScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (70, 'liyupi', 'Java');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (71, 'liyupi', 'HTML');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (72, 'liyupi', 'JavaScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (73, 'kamranahmedse', 'TypeScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (74, 'kamranahmedse', 'JavaScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (75, 'kamranahmedse', 'Astro');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (76, 'kamranahmedse', 'SCSS');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (77, 'michaelliao', 'JavaScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (78, 'michaelliao', 'CSS');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (79, 'michaelliao', 'Java');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (80, 'michaelliao', 'HTML');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (81, 'daimajia', 'Java');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (82, 'daimajia', 'TypeScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (83, 'daimajia', 'Groovy');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (84, 'daimajia', 'CSS');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (85, 'fabpot', 'PHP');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (86, 'fabpot', 'CSS');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (87, 'fabpot', 'JavaScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (88, 'fabpot', 'Twig');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (89, 'programthink', 'Python');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (90, 'liyupi', 'JavaScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (91, 'liyupi', 'TypeScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (92, 'liyupi', 'Java');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (93, 'liyupi', 'HTML');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (94, 'JacksonTian', 'Go');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (95, 'JacksonTian', 'JavaScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (96, 'JacksonTian', 'HTML');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (97, 'JacksonTian', 'Shell');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (98, 'cloudwu', 'C');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (99, 'cloudwu', 'Lua');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (100, 'cloudwu', 'HTML');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (101, 'cloudwu', 'Makefile');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (102, 'halfrost', 'Go');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (103, 'halfrost', 'Python');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (104, 'halfrost', 'CSS');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (105, 'halfrost', 'Objective-C');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (106, 'phodal', 'Rich Text Format');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (107, 'phodal', 'Jupyter Notebook');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (108, 'phodal', 'Kotlin');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (109, 'phodal', 'HTML');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (110, 'Akryum', 'Perl');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (111, 'Akryum', 'TypeScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (112, 'Akryum', 'Vue');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (113, 'Akryum', 'JavaScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (114, 'fzaninotto', 'PHP');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (115, 'fzaninotto', 'TypeScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (116, 'fzaninotto', 'JavaScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (117, 'fzaninotto', 'HTML');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (118, 'atinux', 'JavaScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (119, 'atinux', 'TypeScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (120, 'atinux', 'Vue');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (121, 'atinux', 'HTML');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (122, 'cyrilmottier', 'Java');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (123, 'cyrilmottier', 'Swift');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (124, 'cyrilmottier', 'Python');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (125, 'cyrilmottier', 'JavaScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (126, 'dennybritz', 'Jupyter Notebook');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (127, 'dennybritz', 'Python');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (128, 'dennybritz', 'JavaScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (129, 'dennybritz', 'Shell');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (130, 'fasterthanlime', 'Rust');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (131, 'fasterthanlime', 'TypeScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (132, 'fasterthanlime', 'Go');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (133, 'fasterthanlime', 'HTML');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (134, 'ogrisel', 'Jupyter Notebook');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (135, 'ogrisel', 'Python');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (136, 'ogrisel', 'C++');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (137, 'ogrisel', 'Shell');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (138, 'jgilfelt', 'JavaScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (139, 'jgilfelt', 'Java');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (140, 'jgilfelt', 'CSS');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (141, 'jgilfelt', 'ActionScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (142, 'frontend-joe', 'CSS');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (143, 'frontend-joe', 'HTML');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (144, 'frontend-joe', 'JavaScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (145, 'frontend-joe', 'Vue');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (146, 'kenjinote', 'Java');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (147, 'kenjinote', 'Python');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (148, 'kenjinote', 'C++');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (149, 'kenjinote', 'HTML');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (150, 'matz', 'Ruby');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (151, 'matz', 'C');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (152, 'matz', 'Yacc');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (153, 'matz', 'Java');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (154, 'gentilkiwi', 'C');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (155, 'gentilkiwi', 'Python');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (156, 'gentilkiwi', 'C++');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (157, 'gentilkiwi', 'Shell');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (158, 'jhaddix', 'PHP');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (159, 'jhaddix', 'Python');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (160, 'jhaddix', 'Go');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (161, 'jhaddix', 'Shell');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (162, 'ornicar', 'Scala');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (163, 'ornicar', 'TypeScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (164, 'ornicar', 'Python');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (165, 'ornicar', 'JavaScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (166, 'florina-muntenescu', 'Kotlin');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (167, 'florina-muntenescu', 'Java');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (168, 'florina-muntenescu', 'HTML');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (169, 'florina-muntenescu', 'Shell');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (170, 'alexellis', 'Go');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (171, 'alexellis', 'HTML');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (172, 'alexellis', 'Shell');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (173, 'alexellis', 'Makefile');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (174, 'lepture', 'Python');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (175, 'lepture', 'CSS');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (176, 'lepture', 'JavaScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (177, 'lepture', 'HTML');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (178, 'keijiro', 'C#');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (179, 'keijiro', 'HLSL');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (180, 'keijiro', 'ShaderLab');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (181, 'keijiro', 'GLSL');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (182, 'zcbenz', 'C++');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (183, 'zcbenz', 'C');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (184, 'zcbenz', 'JavaScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (185, 'zcbenz', 'Python');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (186, 'ruanyf', 'JavaScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (187, 'ruanyf', 'HTML');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (188, 'ruanyf', 'Shell');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (189, 'ruanyf', 'CSS');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (190, 'mattn', 'C');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (191, 'mattn', 'Go');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (192, 'mattn', 'Zig');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (193, 'mattn', 'C++');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (194, 'onevcat', 'Swift');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (195, 'onevcat', 'TypeScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (196, 'onevcat', 'Objective-C');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (197, 'onevcat', 'SCSS');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (198, 'samuelcolvin', 'Python');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (199, 'samuelcolvin', 'Rust');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (200, 'samuelcolvin', 'Shell');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (201, 'samuelcolvin', 'HTML');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (202, 'CoreyMSchafer', 'HTML');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (203, 'CoreyMSchafer', 'Python');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (204, 'CoreyMSchafer', 'CSS');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (205, 'CoreyMSchafer', 'Java');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (206, 'iamshaunjp', 'JavaScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (207, 'iamshaunjp', 'CSS');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (208, 'craftzdog', 'JavaScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (209, 'craftzdog', 'Lua');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (210, 'craftzdog', 'TypeScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (211, 'craftzdog', 'Shell');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (212, 'justjavac', 'JavaScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (213, 'justjavac', 'Rust');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (214, 'justjavac', 'Shell');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (215, 'justjavac', 'TypeScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (216, 'rougier', 'Python');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (217, 'rougier', 'Emacs Lisp');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (218, 'rougier', 'TeX');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (219, 'rougier', 'Makefile');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (220, 'jwasham', 'C++');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (221, 'jwasham', 'Python');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (222, 'jwasham', 'CSS');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (223, 'jwasham', 'C');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (224, 'GrahamCampbell', 'PHP');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (225, 'GrahamCampbell', 'HTML');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (226, 'GrahamCampbell', 'Makefile');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (227, 'GrahamCampbell', 'Pascal');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (228, 'milsaware', 'JavaScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (229, 'milsaware', 'PHP');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (230, 'milsaware', 'CSS');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (231, 'milsaware', 'Blade');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (232, 'wasabeef', 'Dart');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (233, 'wasabeef', 'Kotlin');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (234, 'wasabeef', 'Java');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (235, 'wasabeef', 'JavaScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (236, 'kiku-lyf', 'Java');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (237, 'kiku-lyf', 'PLpgSQL');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (238, 'Mrkuib', 'Go');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (239, 'Mrkuib', 'TypeScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (240, 'Mrkuib', 'Vue');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (241, 'Mrkuib', 'JavaScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (242, 'yuding-x', 'JavaScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (243, 'yuding-x', 'HTML');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (244, 'yuding-x', 'Go');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (245, 'yuding-x', 'Jupyter Notebook');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (246, 'hakimel', 'JavaScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (247, 'hakimel', 'HTML');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (248, 'hakimel', 'SCSS');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (249, 'hakimel', 'CSS');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (250, 'hakimel', 'JavaScript');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (251, 'hakimel', 'HTML');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (252, 'hakimel', 'SCSS');
INSERT INTO `domain` (`id`, `github_username`, `language`) VALUES (253, 'hakimel', 'CSS');
COMMIT;

-- ----------------------------
-- Table structure for project_contributions
-- ----------------------------
DROP TABLE IF EXISTS `project_contributions`;
CREATE TABLE `project_contributions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `project_id` bigint NOT NULL,
  `developer_id` bigint NOT NULL,
  `contribution_score` decimal(5,2) DEFAULT NULL,
  `commit_count` int DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of project_contributions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for projects
-- ----------------------------
DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `project_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `stars_count` int DEFAULT NULL,
  `total_commit` int DEFAULT NULL,
  `commit_count` int DEFAULT NULL,
  `github_repo_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `owner_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of projects
-- ----------------------------
BEGIN;
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (31, 'weekly', 47366, 639, 560, NULL, 'ruanyf');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (32, 'es6tutorial', 21244, 1888, 1689, NULL, 'ruanyf');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (33, 'jstraining', 19475, 89, 69, NULL, 'ruanyf');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (34, 'codefather', 5666, 86, 31, NULL, 'liyupi');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (35, 'mianshiya', 4210, 35, 26, NULL, 'liyupi');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (36, 'sql-generator', 3412, 19, 17, NULL, 'liyupi');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (37, 'LeetCode-Go', 32937, 1620, 1397, NULL, 'halfrost');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (38, 'Halfrost-Field', 12931, 1037, 1032, NULL, 'halfrost');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (39, 'vue-objccn', 1997, 104, 97, NULL, 'halfrost');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (40, 'LeetCode-Go', 32937, 1620, 1397, NULL, 'halfrost');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (41, 'Halfrost-Field', 12931, 1037, 1032, NULL, 'halfrost');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (42, 'vue-objccn', 1997, 104, 97, NULL, 'halfrost');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (43, 'LeetCode-Go', 32937, 1620, 1397, NULL, 'halfrost');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (44, 'Halfrost-Field', 12931, 1037, 1032, NULL, 'halfrost');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (45, 'vue-objccn', 1997, 104, 97, NULL, 'halfrost');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (46, 'free-programming-books-zh_CN', 111563, 762, 557, NULL, 'justjavac');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (47, 'awesome-wechat-weapp', 45838, 397, 315, NULL, 'justjavac');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (48, 'Google-IPs', 3451, 32, 32, NULL, 'justjavac');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (49, 'free-programming-books-zh_CN', 111563, 762, 557, NULL, 'justjavac');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (50, 'awesome-wechat-weapp', 45838, 397, 315, NULL, 'justjavac');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (51, 'Google-IPs', 3451, 32, 32, NULL, 'justjavac');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (52, 'codefather', 5668, 86, 31, NULL, 'liyupi');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (53, 'mianshiya', 4209, 35, 26, NULL, 'liyupi');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (54, 'sql-generator', 3413, 19, 17, NULL, 'liyupi');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (55, 'AICommand', 3978, 14, 14, NULL, 'keijiro');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (56, 'Skinner', 3344, 84, 83, NULL, 'keijiro');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (57, 'KinoGlitch', 2511, 5, 5, NULL, 'keijiro');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (58, 'learn-python3', 6247, 67, 65, NULL, 'michaelliao');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (59, 'awesome-python3-webapp', 2408, 3, 3, NULL, 'michaelliao');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (60, 'awesome-python-webapp', 2197, 6, 6, NULL, 'michaelliao');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (61, 'AndroidViewAnimations', 12428, 135, 106, NULL, 'daimajia');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (62, 'AndroidSwipeLayout', 12377, 158, 109, NULL, 'daimajia');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (63, 'NumberProgressBar', 6069, 60, 36, NULL, 'daimajia');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (64, 'books', 18319, 1229, 1229, NULL, 'programthink');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (65, 'zhao', 13539, 475, 475, NULL, 'programthink');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (66, 'opensource', 4912, 129, 125, NULL, 'programthink');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (67, 'lila', 15583, 60888, 50545, NULL, 'ornicar');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (68, 'lichobile', 2034, 3319, 328, NULL, 'ornicar');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (69, 'chessground', 1047, 1779, 1270, NULL, 'ornicar');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (70, 'codefather', 5680, 88, 32, NULL, 'liyupi');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (71, 'mianshiya', 4214, 35, 26, NULL, 'liyupi');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (72, 'sql-generator', 3414, 19, 17, NULL, 'liyupi');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (73, 'skynet', 13325, 2044, 1755, NULL, 'cloudwu');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (74, 'coroutine', 2455, 8, 7, NULL, 'cloudwu');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (75, 'pbc', 1620, 199, 164, NULL, 'cloudwu');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (76, 'developer-roadmap', 295570, 3775, 2540, NULL, 'kamranahmedse');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (77, 'design-patterns-for-humans', 45359, 125, 92, NULL, 'kamranahmedse');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (78, 'driver.js', 22792, 489, 452, NULL, 'kamranahmedse');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (79, 'github', 10131, 228, 168, NULL, 'phodal');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (80, 'growth-ebook', 7791, 635, 571, NULL, 'phodal');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (81, 'awesome-iot', 4321, 508, 441, NULL, 'phodal');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (82, 'LeetCode-Go', 32942, 1620, 1397, NULL, 'halfrost');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (83, 'Halfrost-Field', 12938, 1037, 1032, NULL, 'halfrost');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (84, 'vue-objccn', 1997, 104, 97, NULL, 'halfrost');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (85, 'GreenDroid', 2581, 13, 0, NULL, 'cyrilmottier');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (86, 'Polaris', 434, 9, 0, NULL, 'cyrilmottier');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (87, 'QueryHighlighter', 277, 2, 0, NULL, 'cyrilmottier');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (88, 'Faker', 26788, 1506, 993, NULL, 'fzaninotto');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (89, 'uptime', 3617, 522, 430, NULL, 'fzaninotto');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (90, 'screenshot-as-a-service', 1101, 150, 53, NULL, 'fzaninotto');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (91, 'parallel_ml_tutorial', 1592, 212, 209, NULL, 'ogrisel');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (92, 'scikit-learn-mooc', 1033, 573, 41, NULL, 'ogrisel');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (93, 'notebooks', 565, 249, 249, NULL, 'ogrisel');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (94, 'frontendjoe', 703, 1, 0, NULL, 'frontend-joe');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (95, 'css-reels', 209, 23, 23, NULL, 'frontend-joe');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (96, 'css-navbars', 202, 15, 15, NULL, 'frontend-joe');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (97, 'reinforcement-learning', 20552, 229, 171, NULL, 'dennybritz');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (98, 'cnn-text-classification-tf', 5647, 72, 61, NULL, 'dennybritz');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (99, 'deeplearning-papernotes', 4404, 438, 301, NULL, 'dennybritz');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (100, 'SystemBarTint', 5359, 63, 54, NULL, 'jgilfelt');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (101, 'chuck', 4688, 138, 119, NULL, 'jgilfelt');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (102, 'android-viewbadger', 3017, 21, 21, NULL, 'jgilfelt');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (103, 'mimikatz', 19405, 346, 331, NULL, 'gentilkiwi');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (104, 'kekeo', 1420, 75, 75, NULL, 'gentilkiwi');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (105, 'wanakiwi', 781, 18, 9, NULL, 'gentilkiwi');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (106, 'cmdchat', 413, 6, 6, NULL, 'kenjinote');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (107, 'kenjinote', 64, 143, 143, NULL, 'kenjinote');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (108, 'kenji.blog', 38, 1900, 904, NULL, 'kenjinote');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (109, 'faas', 25148, 1925, 1473, NULL, 'alexellis');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (110, 'k3sup', 6267, 416, 329, NULL, 'alexellis');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (111, 'arkade', 4237, 870, 470, NULL, 'alexellis');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (112, 'authlib', 4553, 1332, 1237, NULL, 'lepture');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (113, 'oauthlib', 2815, 604, 20, NULL, 'lepture');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (114, 'editor', 2794, 70, 44, NULL, 'lepture');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (115, 'fastapi', 77106, 1569, 4, NULL, 'samuelcolvin');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (116, 'rq', 9858, 1186, 25, NULL, 'samuelcolvin');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (117, 'arq', 2146, 368, 272, NULL, 'samuelcolvin');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (118, 'go-sqlite3', 7996, 773, 542, NULL, 'mattn');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (119, 'emmet-vim', 6434, 1040, 968, NULL, 'mattn');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (120, 'tablewriter', 4290, 36, 0, NULL, 'mattn');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (121, 'weekly', 47432, 641, 562, NULL, 'ruanyf');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (122, 'es6tutorial', 21250, 1888, 1689, NULL, 'ruanyf');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (123, 'jstraining', 19482, 89, 69, NULL, 'ruanyf');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (124, 'Kingfisher', 23393, 2720, 2486, NULL, 'onevcat');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (125, 'VVDocumenter-Xcode', 8303, 310, 235, NULL, 'onevcat');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (126, 'FengNiao', 3401, 121, 94, NULL, 'onevcat');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (127, 'Complete-React-Tutorial', 1835, 2, 2, NULL, 'iamshaunjp');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (128, 'flutter-beginners-tutorial', 1757, 5, 5, NULL, 'iamshaunjp');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (129, 'modern-javascript', 1284, 5, 4, NULL, 'iamshaunjp');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (130, 'code_snippets', 10347, 76, 73, NULL, 'CoreyMSchafer');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (131, 'dotfiles', 860, 57, 56, NULL, 'CoreyMSchafer');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (132, 'game-of-life', 25, 247, 0, NULL, 'CoreyMSchafer');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (133, 'dotfiles-public', 6394, 170, 149, NULL, 'craftzdog');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (134, 'craftzdog-homepage', 2320, 76, 64, NULL, 'craftzdog');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (135, 'solarized-osaka.nvim', 690, 467, 28, NULL, 'craftzdog');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (136, 'free-programming-books-zh_CN', 111597, 762, 557, NULL, 'justjavac');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (137, 'awesome-wechat-weapp', 45870, 397, 315, NULL, 'justjavac');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (138, 'Google-IPs', 3451, 32, 32, NULL, 'justjavac');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (139, 'javascript-roulette', 66, 16, 15, NULL, 'milsaware');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (140, 'wordled', 54, 54, 46, NULL, 'milsaware');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (141, 'php-community-social-media', 20, 8, 8, NULL, 'milsaware');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (142, 'coding-interview-university', 306306, 1690, 877, NULL, 'jwasham');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (143, 'computer-science-flash-cards', 8447, 230, 106, NULL, 'jwasham');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (144, 'practice-python', 1671, 80, 77, NULL, 'jwasham');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (145, 'awesome-android-ui', 50620, 407, 322, NULL, 'wasabeef');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (146, 'recyclerview-animators', 11517, 290, 256, NULL, 'wasabeef');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (147, 'glide-transformations', 9899, 237, 215, NULL, 'wasabeef');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (148, 'DevNavigator', 1, 7, 7, NULL, 'kiku-lyf');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (149, 'LeetCode', 0, 1, 1, NULL, 'kiku-lyf');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (150, 'juc', 0, 1, 1, NULL, 'kiku-lyf');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (151, 'scooter-WSVA', 65, 595, 154, NULL, 'Mrkuib');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (152, 'builder', 0, 419, 90, NULL, 'Mrkuib');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (153, 'scooter-WSVA', 0, 595, 154, NULL, 'Mrkuib');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (154, 'reveal.js', 67859, 2692, 2402, NULL, 'hakimel');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (155, 'Ladda', 7846, 177, 96, NULL, 'hakimel');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (156, 'css', 4431, 36, 36, NULL, 'hakimel');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (157, 'reveal.js', 67859, 2692, 2402, NULL, 'hakimel');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (158, 'Ladda', 7846, 177, 96, NULL, 'hakimel');
INSERT INTO `projects` (`id`, `project_name`, `stars_count`, `total_commit`, `commit_count`, `github_repo_url`, `owner_name`) VALUES (159, 'css', 4431, 36, 36, NULL, 'hakimel');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
