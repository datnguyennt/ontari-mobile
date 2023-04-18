# Ontari

Ontari platform

##

## Translate

Generate Keys

```bash
$ get generate locales
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

Run:

```bash
$ flutter packages pub run build_runner build --delete-conflicting-outputs
```

## Build Android/iOS release

```bash
fvm flutter build apk --release --flavor <env_name> -t lib/main_<env_name>.dart

fvm flutter build ipa --release --flavor <env_name> -t lib/main_<env_name>.dart
```

Example: Build QA

```bash
fvm flutter build apk --release --flavor dev -t lib/main_dev.dart

fvm flutter build ipa --release --flavor dev -t lib/main_dev.dart
```

## Build web release

### Dev

```bash
fvm flutter build web --web-renderer html --release -t lib/main_dev.dart
```

### Staging

```bash
fvm flutter build web --web-renderer html --release -t lib/main_staging.dart
```
