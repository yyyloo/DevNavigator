/*
 Navicat Premium Data Transfer

 Source Server         : testconn
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : dev_navigator

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 24/10/2024 14:08:52
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
  `interaction_score` decimal(5,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `github_username` varchar(255) NOT NULL,
  `talent_rank` decimal(5,2) DEFAULT '0.00',
  `country` varchar(100) DEFAULT NULL,
  `country_confidence` decimal(5,2) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `field_confidence` decimal(5,2) DEFAULT NULL,
  `blog_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of developer_profile
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for project_contributions
-- ----------------------------
DROP TABLE IF EXISTS `project_contributions`;
CREATE TABLE `project_contributions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `project_id` bigint NOT NULL,
  `developer_id` bigint NOT NULL,
  `contribution_score` decimal(5,2) DEFAULT '0.00',
  `lines_of_code` int DEFAULT '0',
  `commits_count` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `project_name` varchar(255) NOT NULL,
  `importance_score` decimal(5,2) DEFAULT '0.00',
  `github_repo_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of projects
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
