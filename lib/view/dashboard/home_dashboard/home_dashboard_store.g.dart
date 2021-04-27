// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_dashboard_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeDashboardStore on _HomeDashboardStore, Store {
  Computed<String> _$currencyComputed;

  @override
  String get currency =>
      (_$currencyComputed ??= Computed<String>(() => super.currency,
              name: '_HomeDashboardStore.currency'))
          .value;

  final _$dashboardBannerAtom =
      Atom(name: '_HomeDashboardStore.dashboardBanner');

  @override
  List<String> get dashboardBanner {
    _$dashboardBannerAtom.reportRead();
    return super.dashboardBanner;
  }

  @override
  set dashboardBanner(List<String> value) {
    _$dashboardBannerAtom.reportWrite(value, super.dashboardBanner, () {
      super.dashboardBanner = value;
    });
  }

  final _$currencySwitchAtom = Atom(name: '_HomeDashboardStore.currencySwitch');

  @override
  CurrencySwitch get currencySwitch {
    _$currencySwitchAtom.reportRead();
    return super.currencySwitch;
  }

  @override
  set currencySwitch(CurrencySwitch value) {
    _$currencySwitchAtom.reportWrite(value, super.currencySwitch, () {
      super.currencySwitch = value;
    });
  }

  final _$marketUpdatesAtom = Atom(name: '_HomeDashboardStore.marketUpdates');

  @override
  List<Market> get marketUpdates {
    _$marketUpdatesAtom.reportRead();
    return super.marketUpdates;
  }

  @override
  set marketUpdates(List<Market> value) {
    _$marketUpdatesAtom.reportWrite(value, super.marketUpdates, () {
      super.marketUpdates = value;
    });
  }

  final _$moreItemsAtom = Atom(name: '_HomeDashboardStore.moreItems');

  @override
  List<MoreItem> get moreItems {
    _$moreItemsAtom.reportRead();
    return super.moreItems;
  }

  @override
  set moreItems(List<MoreItem> value) {
    _$moreItemsAtom.reportWrite(value, super.moreItems, () {
      super.moreItems = value;
    });
  }

  @override
  String toString() {
    return '''
dashboardBanner: ${dashboardBanner},
currencySwitch: ${currencySwitch},
marketUpdates: ${marketUpdates},
moreItems: ${moreItems},
currency: ${currency}
    ''';
  }
}
