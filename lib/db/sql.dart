// ignore: constant_identifier_names
const DBName = 'iton.db';

Map<String, String> sqls = {
  'base': '''
CREATE TABLE "wallets" (
	"id" INTEGER PRIMARY KEY AUTOINCREMENT,
	"name" text NOT NULL,
	"type" text NOT NULL DEFAULT 'mnemonic',
	"secret" text NOT NULL,
	"address" text NOT NULL,
	"password" text NOT NULL,
  "network" integer,
  "weight" integer DEFAULT 0,
	"hint" text,
	"symbol" text,
	"balance" text NOT NULL DEFAULT '0',
	"decimals" INTEGER NOT NULL DEFAULT 18,
  "chain" text,
	"synced" text NOT NULL DEFAULT '0'
);
CREATE TABLE "tokens" (
	"id" INTEGER PRIMARY KEY AUTOINCREMENT,
	"name" text NOT NULL,
	"wallet" INTEGER NOT NULL,
	"symbol" text NOT NULL,
	"decimals" INTEGER NOT NULL,
	"address" text NOT NULL,
  "type" text NOT NULL DEFAULT 'ERC20',
  "logo" text,
	"balance" text NOT NULL DEFAULT '0',
  "totalSupply" text,
  "owner" text,
  "webUrl" text,
  "description" text,
  "publishTime" text,
  "publisher" text,
  "chain" text
);
CREATE TABLE "dapps" (
	"id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "wallet" INTEGER NOT NULL,
	"name" text NOT NULL,
	"url" text NOT NULL,
  "chain" text
);
CREATE TABLE "contacts" (
	"id" INTEGER PRIMARY KEY AUTOINCREMENT,
	"wallet" INTEGER NOT NULL,
	"name" text NOT NULL,
	"address" text NOT NULL,
	"resolved" text NOT NULL,
  "chain" text,
  "note" text
);
CREATE TABLE "searches" (
	"id" INTEGER PRIMARY KEY AUTOINCREMENT,
	"data" text NOT NULL,
  "keyword" text NOT NULL,
  "date" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  "wallet" INTEGER NOT NULL
);
CREATE TABLE "collections" (
	"id" INTEGER PRIMARY KEY AUTOINCREMENT,
	"data" text,
  "url" text NOT NULL,
  "wallet" INTEGER NOT NULL
);
CREATE TABLE "settings" (
	"id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "name" text NOT NULL,
  "value" text NOT NULL
);
CREATE TABLE "networks" (
	"id" INTEGER PRIMARY KEY AUTOINCREMENT,
	"data" text,
  "chain" text NOT NULL,
  "name" text NOT NULL,
  "type" text
);'''
};
