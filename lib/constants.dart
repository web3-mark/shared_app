// ignore_for_file: constant_identifier_names
import 'package:flutter/services.dart';
import 'dart:io';

/// 语言设置键值
const LanguageKey = 'language';

/// 预览
/// https://github.com/anton-bot/locale-enum/blob/master/index.ts
enum Language {
  po('po', display: 'Россия'),
  ja('ja', display: "日本語"),
  es('es', display: "España"),
  en('en', display: 'English'),
  zh('zh', display: "中文"),
  fr('fr', display: "Français"),
  ru('ru', display: "Русский"),
  ko('ko', display: "한국어"),
  vi('vi', display: "Tiếng Việt");

  final String text;
  final String display;
  const Language(this.text, {required this.display});

  static fromText(String text) {
    for (Language enumVariant in Language.values) {
      if (enumVariant.text == text) return enumVariant;
    }
    return en;
  }
}

/// 货币
enum Currency {
  USD('USD', symbol: r"$", display: "USD"),
  CNY('CNY', symbol: "￥", display: "CNY"),
  RUB('RUB', symbol: "₽", display: "RUB"),
  EUR('EUR', symbol: '€', display: "EUR"),
  JPY('JPY', symbol: "￥", display: "JPY");

  final String text;
  final String display;
  final String symbol;
  const Currency(
    this.text, {
    this.display = '',
    required this.symbol,
  });

  static fromText(String text) {
    for (Currency enumVariant in Currency.values) {
      if (enumVariant.text == text) return enumVariant;
    }
    return USD;
  }
}

extension FontWeightExt on FontWeight {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static FontWeight medium =
      Platform.isAndroid ? FontWeight.w600 : FontWeight.w500;
  static const FontWeight semibold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}
