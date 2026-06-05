<![CDATA[# ✅ Todo List — Persistent Flutter Application

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter"/>
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart"/>
  <img src="https://img.shields.io/badge/SQLite-003B57?style=for-the-badge&logo=sqlite&logoColor=white" alt="SQLite"/>
  <img src="https://img.shields.io/badge/Provider-6C63FF?style=for-the-badge&logoColor=white" alt="Provider"/>
</p>

<p align="center">
  A robust and intuitive Todo List application built with <strong>Flutter</strong>, designed to help users manage daily tasks efficiently with local data persistence, customizable themes, and timely reminders.
</p>

---

## 📸 Screenshots

<div align="center">
  <table>
    <tr>
      <td align="center"><strong>Home (Empty)</strong></td>
      <td align="center"><strong>Add New Task</strong></td>
      <td align="center"><strong>Tasks List</strong></td>
    </tr>
    <tr>
      <td><img src="Screenshot/Screenshot_20260605_090758.png" width="180" /></td>
      <td><img src="Screenshot/Screenshot_20260605_090831.png" width="180" /></td>
      <td><img src="Screenshot/Screenshot_20260605_091029.png" width="180" /></td>
    </tr>
    <tr>
      <td align="center"><strong>Week Filter</strong></td>
      <td align="center"><strong>Task History</strong></td>
      <td align="center"><strong>Settings</strong></td>
    </tr>
    <tr>
      <td><img src="Screenshot/Screenshot_20260605_091056.png" width="180" /></td>
      <td><img src="Screenshot/Screenshot_20260605_091315.png" width="180" /></td>
      <td><img src="Screenshot/Screenshot_20260605_091346.png" width="180" /></td>
    </tr>
    <tr>
      <td align="center" colspan="3"><strong>Color Picker</strong></td>
    </tr>
    <tr>
      <td align="center" colspan="3"><img src="Screenshot/Screenshot_20260605_091525.png" width="180" /></td>
    </tr>
  </table>
</div>

---

## 🚀 Key Features

| Category | Feature |
|---|---|
| **📋 Task Management** | Create tasks with title, description, due date & time |
| | Interactive task completion tracking |
| | Smart filters — *Today*, *This Week*, *This Month* |
| | Built-in search to quickly locate any task |
| **🔔 Notifications** | Timely alerts for task deadlines |
| | Quick-action: mark tasks "Done" from notification tray |
| **🎨 Personalization** | Toggle between Light & Dark modes |
| | Custom accent color via Color Picker |
| **💾 Persistence** | Powered by `sqflite` for reliable local storage |
| **✨ Fluid UI** | Lottie animations for engaging experience |
| | Bottom Navigation Bar for organized navigation |

---

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| **Framework** | [Flutter](https://flutter.dev/) |
| **State Management** | [Provider](https://pub.dev/packages/provider) |
| **Database** | [sqflite](https://pub.dev/packages/sqflite) |
| **Notifications** | [flutter_local_notifications](https://pub.dev/packages/flutter_local_notifications) |
| **Animations** | [Lottie](https://pub.dev/packages/lottie) |
| **Utilities** | `intl` · `path_provider` · `package_info_plus` · `url_launcher` |

---

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

---

## 🏁 Getting Started

### Prerequisites

- Flutter SDK installed
- Android / iOS emulator or physical device

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/your-username/todo_list.git

# 2. Navigate to the project
cd todo_list

# 3. Install dependencies
flutter pub get

# 4. Run the application
flutter run
```

---

## 🔮 Future Plans

- [ ] **Google Data Sync** — Synchronize tasks across devices using cloud storage
- [ ] **Calendar View** — Full-screen calendar for better deadline visualization
- [ ] **Enhanced Search** — More granular filters and real-time indexing
- [ ] **Cloud Backup** — Integration with Firebase or Google Drive

---

## 🤝 Feedback & Contributions

Contributions are always welcome! If you have suggestions, feature requests, or find bugs:

- 🐛 Open an **Issue**
- 🔀 Submit a **Pull Request**
- 💬 Use the **Feedback** section in the app settings

---

<p align="center">
  Made with ❤️ using Flutter
</p>
]]>
