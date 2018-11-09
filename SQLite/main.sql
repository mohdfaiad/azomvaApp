/*
 Navicat Premium Data Transfer

 Source Server         : azomva.comSQLite
 Source Server Type    : SQLite
 Source Server Version : 3017000
 Source Schema         : main

 Target Server Type    : SQLite
 Target Server Version : 3017000
 File Encoding         : 65001

 Date: 26/10/2018 11:53:15
*/

PRAGMA foreign_keys = false;

-- ----------------------------
-- Table structure for _current_user_old_20181025
-- ----------------------------
DROP TABLE IF EXISTS "_current_user_old_20181025";
CREATE TABLE "_current_user_old_20181025" (
  "id" INTEGER NOT NULL,
  "user_type_id" INTEGER,
  "user_status_id" INTEGER,
  "full_name" TEXT,
  "phone" TEXT,
  "email" TEXT,
  "status_name" TEXT,
  "user_type_name" TEXT,
  "token" TEXT,
  "created" TEXT,
  PRIMARY KEY ("id")
);

-- ----------------------------
-- Table structure for _mainfields_old_20181025
-- ----------------------------
DROP TABLE IF EXISTS "_mainfields_old_20181025";
CREATE TABLE "_mainfields_old_20181025" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "total_apps_count" integer,
  "week_apps_count" integer,
  "Azomva_GCMAppID" text,
  "Azomva_Legacy_server_key" text,
  "MyAppsCount" integer,
  "MyContractsCount" integer
);

-- ----------------------------
-- Table structure for current_user
-- ----------------------------
DROP TABLE IF EXISTS "current_user";
CREATE TABLE "current_user" (
  "user_type_id" INTEGER,
  "user_status_id" INTEGER,
  "full_name" TEXT,
  "phone" TEXT,
  "email" TEXT,
  "status_name" TEXT,
  "user_type_name" TEXT,
  "token" TEXT,
  "created" TEXT
);

-- ----------------------------
-- Table structure for list_property_types
-- ----------------------------
DROP TABLE IF EXISTS "list_property_types";
CREATE TABLE "list_property_types" (
  "id" INTEGER NOT NULL,
  "title" TEXT,
  PRIMARY KEY ("id")
);

-- ----------------------------
-- Table structure for mainfields
-- ----------------------------
DROP TABLE IF EXISTS "mainfields";
CREATE TABLE "mainfields" (
  "total_apps_count" integer,
  "week_apps_count" integer,
  "Azomva_GCMAppID" text,
  "Azomva_Legacy_server_key" text,
  "MyAppsCount" integer,
  "MyContractsCount" integer
);

-- ----------------------------
-- Table structure for pages
-- ----------------------------
DROP TABLE IF EXISTS "pages";
CREATE TABLE "pages" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "title" TEXT,
  "content" TEXT
);

-- ----------------------------
-- Records of "pages"
-- ----------------------------
INSERT INTO "pages" VALUES (1, 'მთავარი გვერდის ტექსტი', 'მთავარი გვერდის ტექსტი, ეს ტექსტი ექვემდებარება რედაქტირებას ადმინისტრატორის აპლიკაციიდან');
INSERT INTO "pages" VALUES (2, 'განცხადების დამატება დასრულებისას', 'პირველი ღილაკით "განცხადების დასრულება" თქვენ ასრულებთ განცხადებას გამოქვეყნებისთვის ხოლო მეორე ღილაკი "ამავე განცხადებაზე სხვა ქონების დამატება" იწყებთ იგივე პროცედურას თავიდან და ავსებთ სხვა ქონების მონაცემებს რათა ერთიდაიგივე განცხადებაში გამოქვეყნდეს რამოდენიმე უძრავი ქონება');
INSERT INTO "pages" VALUES (3, 'Terms & Conditions', 'Terms & Conditions');
INSERT INTO "pages" VALUES (5, 'მიწის ნაკვეთის აზომვა', 'სარეგისტრაციოდ წარდგენილ დოკუმენტაციაზე თანდართული აზომვითი ნახაზის (ქაღალდზე დაბეჭდილი  და მისი იდენტური ელექტრონული ვერსია მყარ დისკზე ჩაწერილი) მომზადება, რომელსაც ქმნის უფლებამოსილი პირი, ან კომპანია თქვენი დაკვეთის შესაბამისად. 
ნახაზის წარდგენა საჭიროა საჯარო რეესტრში მიწის ნაკვეთის პირველადი რეგისტრაციისას, ან დაზუსტებისას. აგრეთვე, უკვე რეგისტრირებული მიწის ნაკვეთის დაყოფა/გაერთიანებისას.
ყურადღება: მიწის ნაკვეთის საკადასტრო აგეგმვითი/აზომვითი სამუშაოს შესრულებისას გამიჯნულია პასუხისმგებლობა ამზომველსა და მესაკუთრეს შორის. კერძოდ, უძრავი ნივთის ადგილმდებარეობასა და საზღვრის იდენტიფიცირებაზე პასუხისმგებელია მესაკუთრე, ხოლო აზომვითი სამუშაოების სრულყოფილად შესრულებასა და ნახაზის სისწორეზე - ამზომველი.');
INSERT INTO "pages" VALUES (6, 'ტოპონახაზი', 'Lorem Ipsum საბეჭდი და ტიპოგრაფიული ინდუსტრიის უშინაარსო ტექსტია. იგი სტანდარტად 1500-იანი წლებიდან იქცა, როდესაც უცნობმა მბეჭდავმა ამწყობ დაზგაზე წიგნის საცდელი ეგზემპლარი დაბეჭდა. მისი ტექსტი არამარტო 5 საუკუნის მანძილზე შემორჩა, არამედ მან დღემდე, ელექტრონული ტიპოგრაფიის დრომდეც უცვლელად მოაღწია. განსაკუთრებული პოპულარობა მას 1960-იან წლებში გამოსულმა Letraset-ის ცნობილმა ტრაფარეტებმა მოუტანა, უფრო მოგვიანებით კი — Aldus PageMaker-ის ტიპის საგამომცემლო პროგრამებმა, რომლებშიც Lorem Ipsum-ის სხვადასხვა ვერსიები იყო ჩაშენებული.');
INSERT INTO "pages" VALUES (7, 'შიდა აზომვითი ნახაზი', 'Lorem Ipsum საბეჭდი და ტიპოგრაფიული ინდუსტრიის უშინაარსო ტექსტია. იგი სტანდარტად 1500-იანი წლებიდან იქცა, როდესაც უცნობმა მბეჭდავმა ამწყობ დაზგაზე წიგნის საცდელი ეგზემპლარი დაბეჭდა. მისი ტექსტი არამარტო 5 საუკუნის მანძილზე შემორჩა, არამედ მან დღემდე, ელექტრონული ტიპოგრაფიის დრომდეც უცვლელად მოაღწია. განსაკუთრებული პოპულარობა მას 1960-იან წლებში გამოსულმა Letraset-ის ცნობილმა ტრაფარეტებმა მოუტანა, უფრო მოგვიანებით კი — Aldus PageMaker-ის ტიპის საგამომცემლო პროგრამებმა, რომლებშიც Lorem Ipsum-ის სხვადასხვა ვერსიები იყო ჩაშენებული.');

-- ----------------------------
-- Table structure for sqlite_sequence
-- ----------------------------
DROP TABLE IF EXISTS "sqlite_sequence";
CREATE TABLE "sqlite_sequence" (
  "name",
  "seq"
);

-- ----------------------------
-- Records of "sqlite_sequence"
-- ----------------------------
INSERT INTO "sqlite_sequence" VALUES ('pages', 7);

-- ----------------------------
-- Auto increment value for pages
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 7 WHERE name = 'pages';

PRAGMA foreign_keys = true;
