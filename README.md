# Flutter Push Notifications App

## 📌 Overview
This Flutter application integrates **Firebase Cloud Messaging (FCM)** to send and receive push notifications. The app supports both foreground and background notifications using **flutter_local_notifications**.

## 🚀 Features
- 🔔 Receive push notifications via Firebase Cloud Messaging (FCM)
- 🌐 Works in **foreground**, **background**, and **terminated** states
- 📌 Displays local notifications using **flutter_local_notifications** when app is in the foreground
- 🔗 Fetches and prints **FCM Token** for debugging

---

## 📂 Project Structure
```
📦 notifications_app
 ┣ 📂 lib
 ┃ ┣ 📜 main.dart
 ┃ ┣ 📂 api
 ┃ ┃ ┣ 📜 firebase_api.dart
 ┃ ┣ 📂 pages
 ┃ ┃ ┣ 📜 homepage.dart
 ┣ 📜 pubspec.yaml
 ┣ 📜 README.md
```

---

## 🛠️ Installation

### 1️⃣ **Clone the Repository**
```sh
git clone https://github.com/your-repo/flutter-push-notifications.git
cd flutter-push-notifications
```

### 2️⃣ **Install Dependencies**
```sh
flutter pub get
```

### 3️⃣ **Setup Firebase**
1. Go to [Firebase Console](https://console.firebase.google.com/).
2. Create a new project or select an existing one.
3. Add an **Android** and/or **iOS** app.
4. Download the `google-services.json` file and place it inside `android/app/`.
5. Enable **Cloud Messaging** in Firebase settings.

### 4️⃣ **Run the App**
```sh
flutter run
```

---

## 🔧 Configuration

### **Android Setup**
- Ensure you have **Google Play Services** enabled.
- Update `AndroidManifest.xml` with necessary permissions:
```xml
<uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
<uses-permission android:name="android.permission.FOREGROUND_SERVICE"/>
```

### **iOS Setup**
- Add the following permissions to `ios/Runner/Info.plist`:
```xml
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
</dict>
<key>FirebaseMessagingAutoInitEnabled</key>
<false/>
```
- Run this command in the iOS folder:
```sh
pod install
```

---

## 🔥 Usage

### **1️⃣ Get FCM Token**
When you run the app, the FCM Token will be printed in the console:
```
TOKEN: xxxxxxxx:yyyyyy:zzzzzz
```
Use this token to send notifications via Firebase or Postman.

### **2️⃣ Sending Notifications via Firebase Console**
1. Go to **Firebase Console** → **Cloud Messaging**
2. Click **Send your first message**
3. Enter a **title** and **message**
4. Select **Send to a test device** and enter your FCM Token
5. Click **Send Message**

### **3️⃣ Handle Foreground Notifications**
By default, Firebase does not show notifications in the foreground. This app uses `flutter_local_notifications` to manually display them.

---

## 🎯 Troubleshooting

### **Notifications Not Showing in Foreground?**
Make sure you have `flutter_local_notifications` configured properly:
```sh
flutter pub add flutter_local_notifications
```

### **FCM Token Not Generating?**
- Ensure Firebase is properly set up and `google-services.json` is added.
- Try `flutter clean` and re-run the app.

---

## 🤝 Contributing
1. Fork the repository.
2. Create a new branch (`feature-branch`).
3. Commit your changes.
4. Push to your fork and submit a PR.

---

## 📩 Contact
For any queries, feel free to reach out:
- **Email:** your.smabd7409@gmail.com


