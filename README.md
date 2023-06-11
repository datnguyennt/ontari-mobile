# Ontari

Ontari platform

## Configure Firebase Key with multiple environment

Run:
```sh
npm install -g firebase-tools

dart pub global activate flutterfire_cli

flutterfire configure

# Dev environment
flutterfire config \
  --project=ontari-mobile-eb78f \
  --out=lib/firebase_options_dev.dart \
  --ios-bundle-id=com.dev.ontari \
  --android-app-id=com.dev.ontari

# Product environment
flutterfire config \
  --project=ontari-mobile-eb78f \
  --out=lib/firebase_options_prod.dart \
  --ios-bundle-id=com.prod.ontari \
  --android-app-id=com.prod.ontari

```

## Translate, DI, Assets

Run:
```bash
$ flutter packages pub run build_runner build --delete-conflicting-outputs
```


## Generate localizations

Run:

```bash
$  flutter pub run easy_localization:generate -S assets/locales -f keys -O lib/generated -o locale_keys.g.dart
```

## Generate app flavor

View [document](https://pub.dev/packages/flutter_flavorizr) for details

Run:

```bash
$ fvm flutter pub run flutter_flavorizr
```


## Generate icon and splash

```sh
flutter pub get &&
flutter pub run flutter_native_splash:create &&
flutter pub run flutter_launcher_icons
```


## Using FVM

If using FVM, in all command need to add "fvm" before the old command

```bash
$ fvm flutter pub get
```

## Run build_runner



## Build Android/iOS release

```bash
fvm flutter build apk --release --flavor <env_name> -t lib/main_<env_name>.dart

fvm flutter build ipa --release --flavor <env_name> -t lib/main_<env_name>.dart
```

Example: Build Dev

```bash
fvm flutter build apk --release --flavor dev -t lib/main_dev.dart

fvm flutter build ipa --release --flavor dev -t lib/main_dev.dart
```


### Web

```bash
fvm flutter build web --web-renderer html --release -t lib/main_dev.dart
```