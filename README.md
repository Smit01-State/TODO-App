# Todo List - Persistent Flutter Application

A robust and intuitive Todo List application built with Flutter, designed to help users manage their daily tasks efficiently. This app offers a seamless experience with local data persistence, customizable themes, and timely reminders.

## 🚀 Key Features

- **Advanced Task Management:**
  - Create tasks with titles, detailed descriptions, and specific **Due Dates/Times**.
  - Interactive task completion tracking.
  - Smart **Filters** to view tasks for Today, This Week, or This Month.
  - Built-in **Search** functionality to quickly locate any task.
- **Notifications & Reminders:**
  - Receive timely alerts for task deadlines.
  - Quick-action notifications: Mark tasks as "Done" directly from the notification tray.
- **Personalization:**
  - **Dynamic Theme Mode:** Toggle between Light and Dark modes.
  - **Color Picker:** Customize the app's accent color to suit your style.
- **Persistent Storage:**
  - Powered by `sqflite` for reliable local data storage, ensuring tasks are saved permanently on your device.
- **Fluid UI:**
  - Enhanced with **Lottie animations** for a more engaging user experience.
  - Organized navigation using a Bottom Navigation Bar.

## 🛠️ Tech Stack

- **Framework:** [Flutter](https://flutter.dev/)
- **State Management:** [Provider](https://pub.dev/packages/provider)
- **Database:** [sqflite](https://pub.dev/packages/sqflite)
- **Notifications:** [flutter_local_notifications](https://pub.dev/packages/flutter_local_notifications)
- **Animations:** [Lottie](https://pub.dev/packages/lottie)
- **Utility:** `intl`, `path_provider`, `package_info_plus`, `url_launcher`

## 📁 Project Structure

```text
lib/
├── Models/          # Data blueprints (Task)
├── ViewModel/       # Business logic & State (TaskProvider, ThemeProvider)
├── Services/        # Infrastructure (Database, Notifications, Feedback)
├── Pages/           # UI Screens (Home, Search, History, Settings)
├── Widgets/         # Reusable UI components (TodoForm, ColorPicker)
└── main.dart        # Entry point
```

## 🏁 Getting Started

### Prerequisites
- Flutter SDK installed.
- Android/iOS emulator or physical device.

### Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/your-username/todo_list.git
    ```
2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```
3.  **Run the application:**
    ```bash
    flutter run
    ```

## 🔮 Future Plans

- [ ] **Google Data Sync:** Synchronize tasks across devices using cloud storage.
- [ ] **Calendar View:** A full-screen calendar for better visualization of upcoming deadlines.
- [ ] **Enhanced Search:** More granular search filters and real-time indexing.
- [ ] **Cloud Backup:** Integration with Firebase or Google Drive.

## 🤝 Feedback & Contributions

Contributions are always welcome! If you have suggestions, feature requests, or find bugs, please feel free to:
- Open an **Issue**.
- Submit a **Pull Request**.
- Contact the developer via the Feedback section in the app settings.
