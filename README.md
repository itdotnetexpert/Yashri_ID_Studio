# Yashri ID Studio

🪪 A Flutter-based mobile app to generate professional ID cards using custom templates, Hindi/English form inputs, circular photo, and export options.

---

## ✅ Features

- 🖼 Upload a custom background (template)
- 📝 Fill form fields (नाम, दायित्व, क्रमांक)
- 📷 Take live circular photo (camera input)
- 🧲 Drag & place text and photo on template
- 💾 Save all entries (auto + manual)
- 📂 View saved entries anytime
- 📤 Export as JPG (PDF optional)
- 🔠 Hindi input form with English UI
- 🔌 Offline-first with local storage
- 📊 Future-ready: Search, Backup, Print

---

## 📁 Folder Structure

lib/ ├── main.dart                  # App entry point ├── screens/                  # UI screens │   ├── home_screen.dart │   ├── form_screen.dart │   ├── preview_screen.dart │   └── entries_list_screen.dart ├── widgets/                  # Custom draggable components │   ├── draggable_text.dart │   └── circular_photo_frame.dart ├── models/ │   └── card_entry.dart       # Data model ├── services/                 # Image storage & export logic │   ├── storage_service.dart │   └── image_export_service.dart └── database/ └── hive_db.dart          # (Optional) Local DB support

assets/ ├── background.jpg            # Default background template └── logo/yashri_logo.png      # App brand logo

pubspec.yaml                  # Dependencies and assets README.md                     # This file

---

## 🔧 Getting Started

### 1. Clone the project or extract ZIP

```bash
git clone https://github.com/your-name/Yashri_ID_Studio.git
cd Yashri_ID_Studio

2. Get dependencies

flutter pub get

3. Build the APK

flutter build apk

4. Find the APK here:

build/app/outputs/flutter-apk/app-release.apk
