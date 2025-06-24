# 📚 LMS System - Online Course E-Learning App

A modern **Flutter-based Learning Management System (LMS)** designed to deliver high-quality online education experiences. Built using clean architecture principles and inspired by a sleek UI design from [Figma](https://www.figma.com/design/bwANox5zsU0HBX30EiBwmk/Bahodir---Online-Course---E-Learning-App-UI-Kit--Community-?node-id=727-25421&p=f&t=ugkKnmvcEogRW768-0).


---

## 🚀 Features

- 📹 Course video player
- 📄 PDF viewer & downloader
- 📈 Progress tracking with percent indicators
- 🌐 Multi-language support (`easy_localization`)
- 📱 Phone number authentication
- 🎞️ Lottie animations
- 🔒 Biometric authentication
- 📷 Profile photo uploading
- 📁 Offline storage (Hive & GetStorage)
- 🧭 Smooth navigation using `go_router`
- 📦 Clean architecture using `flutter_bloc` & `get_it`
- 🌐 API requests via Dio with pretty logging
- ✨ Caching, shimmer effects, and SVG support

---

## 🛠 Tech Stack

| Tech              | Description                      |
|-------------------|----------------------------------|
| Flutter           | Frontend SDK                     |
| Hive & GetStorage | Local storage                    |
| Dio + Logger      | HTTP client & logging            |
| Bloc              | State management                 |
| Easy Localization | Multi-language support           |
| Go Router         | Routing solution                 |
| Figma             | UI Design inspiration            |

---

## 📂 Project Structure

```bash
lib/
├── core/              # Constants, themes, utilities
├── features/          # App features grouped by module
├── generated/         # Localization files
├── l10n/              # Localization assets
└── main.dart          # App entry point
````

---

## 📦 Dependencies

Some major packages in use:

* `flutter_bloc`
* `get_it`
* `go_router`
* `dio` + `pretty_dio_logger`
* `flutter_pdfview`
* `permission_handler`
* `video_player`
* `intl_phone_field`
* `local_auth`
* `cached_network_image`

Full list in [`pubspec.yaml`](pubspec.yaml)

---

## 🖼 Assets & Fonts

* **Fonts**: Urbanist
* **Assets**:

  * `assets/icons/`
  * `assets/courses/`
  * `assets/images/`

---

## 📱 How to Run

```bash
git clone https://github.com/MahmudjonA/kursol.git
cd kursol
flutter pub get
flutter run
```

---

## 🌐 Localization

App supports multiple languages using `easy_localization`.

To add more:

* Add ARB/JSON files in `assets/translations/`
* Register in `MaterialApp` → `supportedLocales`

---

## 📜 License

This project is for educational/demo purposes and not yet production-ready. You can fork and customize it based on your needs.

---

## 🔗 Resources

* 💻 [Figma UI Kit](https://www.figma.com/design/bwANox5zsU0HBX30EiBwmk/Bahodir---Online-Course---E-Learning-App-UI-Kit--Community)
* 📦 [All Flutter packages](https://pub.dev)

---

> Built with ❤️ by [Mahmudjon Abdumuratov](https://github.com/MahmudjonA)

```

