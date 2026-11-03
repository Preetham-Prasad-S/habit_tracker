# AGENTS.md

## What this is

Flutter habit-tracker app (Flutter 3.41.9 / Dart 3.11.5, Material + GetX). Early stage:
UI is largely built, but persistence and most actions are stubs. No codegen, no CI, and no
custom lint config beyond `flutter_lints`.

## Commands

- `flutter pub get`
- `flutter analyze` — keep clean; only `package:flutter_lints/flutter.yaml` is enabled.
- `flutter test` — currently fails: `test/widget_test.dart` is the stock counter test and
  does not match `MyApp`. Replace it before treating tests as a gate.
- Single test: `flutter test test/widget_test.dart --plain-name "<test name>"`
- Format: `dart format lib test`
- Regenerate launcher icons: `dart run flutter_launcher_icons` (uses `assets/app_icon.png`).

## Run targets

- `sqflite` supports Android/iOS/macOS only. Do not expect `flutter run -d windows` or
  `-d chrome` to work: `main()` touches `AppDatabase` before `runApp`, so startup throws.
  For desktop/web, add `sqflite_common_ffi` / `sqflite_common_ffi_web` and initialize the
  `databaseFactory` before any `AppDatabase` call.
- Verified toolchain: Flutter 3.41.9 stable, Dart 3.11.5.

## Entry points and flow

- `lib/main.dart` → `GetMaterialApp(home: BaseScreen())`. `lib/splash_screen.dart` is dead
  code (never referenced); don't "restore" it without checking intent.
- `lib/base_screen.dart`: shell with an `IndexedStack` containing only `HomeScreen` and a
  4-item bottom nav. Tabs 1–3 switch state but have no content. The FAB pushes
  `HabitFormScreen` via `Navigator`, not `Get.to`.
- Layout is `lib/features/<feature>/{data,domain,presentation}`. `home` has all three
  layers; `habit` is presentation-only. Follow that split when adding features.
- GetX is used for reactive state (`GetxController`, `.obs`, `Obx`) but not for routing or
  bindings. `HabitFormScreen` registers its controller with `Get.put` in a widget field.

## Current data-layer reality

- `lib/core/services/app_database.dart`: sqflite singleton, DB `schedule_tracker.db`,
  version 1, table `habit(id TEXT PRIMARY KEY, habitTitle TEXT NOT NULL, habitSubTitle TEXT)`.
  `onUpgrade` is empty; add migrations before bumping `databaseVersion`.
- `main()` calls `deleteAppDatabase()` on every launch, wiping the DB each run. Remove that
  call before building or testing persistence.
- `HabitDatasourceImpl.getHabits()` throws `UnimplementedError`, and `HabitModel` lives
  inside `habit_datasource.dart` (there is no `model/` directory).
- `HomeScreen` renders a hardcoded list of `HabitSuccessState`; nothing reads from the DB.
- `HabitFormScreen`'s Save button (`HeaderWidget`) has an empty `onPressed`. Frequency
  selection is local `setState` inside `FrequencyWidget` and is never stored.
- Two parallel models with identical fields: `HabitEntity` + `HabitStatus` (domain) and
  `HabitSuccessState` + `HabitStatusState` (presentation). Choose deliberately; don't mix
  the enums.

## Conventions and quirks

- Widget files are `snake_case_widget.dart` with a `...Widget` class; controllers live under
  `presentation/controller/` (habit) or `presentation/controllers/` (home).
- Use `lib/core/utils/app_colors.dart` (`AppColors`) for colors. Habit palette and icon set
  are index-keyed maps in `habit_colors.dart` / `habit_icons.dart`; the icon grid hardcodes
  `itemCount: 12` to match the icon map size.
- The whole `assets/` directory is bundled. `Inter` is declared in `pubspec.yaml`, but the
  app theme uses `GoogleFonts.outfitTextTheme()` while `splash_screen.dart` uses "Inter".
- Relies on recent Flutter APIs: `Row(spacing:)`, `Divider(radius:)`, and
  `LinearProgressIndicator(borderRadius:)`. Don't downgrade below ~Flutter 3.27.
- `lib/core/utils/helper.dart` is empty. Android `applicationId` is still
  `com.example.schedule_tracker`, and release builds are signed with debug keys.
- The working tree has uncommitted work (e.g. deleted `lib/test/test_screen.dart`). Run
  `git status` before deleting or overwriting files that look unused.
