# Todo List - Persistent Flutter Application

A robust and intuitive Todo List application built with Flutter, designed to help users manage their daily tasks efficiently. The app features persistent storage, state management using Provider, and a clean, organized architecture.

## 🚀 Features

- **Task Management:**
  - Create tasks with detailed descriptions.
  - Set specific **Due Dates** and **Due Times** for each task.
  - Toggle task completion status with a simple checkbox.
  - Remove tasks when they are no longer needed.
- **Persistent Storage:**
  - Uses `sqflite` to store tasks locally on the device, ensuring your data is safe even after closing the app.
- **State Management:**
  - Implements the `Provider` package for efficient and reactive state handling.
- **History Tracking:**
  - View completed or archived tasks in a dedicated History section.
- **Search Functionality:**
  - Quickly find specific tasks using the built-in search feature.
- **Modern UI:**
  - Organized navigation with a Bottom Navigation Bar for easy access to Home, Search, History, and Settings.

## 🛠️ Tech Stack

- **Framework:** [Flutter](https://flutter.dev/)
- **State Management:** [Provider](https://pub.dev/packages/provider)
- **Database:** [sqflite](https://pub.dev/packages/sqflite)
- **Utility Libraries:** 
  - `intl` (Date/Time formatting)
  - `path` (File system paths)

## 📁 Project Structure

```text
lib/
├── Models/          # Data models (Task)
├── ViewModel/       # Business logic and state management (TaskProvider)
├── Services/        # Database and local storage helpers (DBHelper)
├── Pages/           # UI Screens (Home, Search, History, Settings)
├── Widgets/         # Reusable UI components
└── main.dart        # Application entry point
```

## 🏁 Getting Started

### Prerequisites

- Flutter SDK installed.
- An Android/iOS emulator or physical device.

### Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/your-username/todo_list.git
    ```
2.  **Navigate to the project directory:**
    ```bash
    cd todo_list
    ```
3.  **Install dependencies:**
    ```bash
    flutter pub get
    ```
4.  **Run the application:**
    ```bash
    flutter run
    ```

## 🔮 Future Plans

- **Notifications & Reminders:** Implement local notifications to alert users about upcoming task deadlines.
- **Google Data Sync:** Enable cloud synchronization using Google Drive or Firebase to access tasks across multiple devices.
- **UI/UX Improvements:** Refine the user interface with custom themes, and smoother animations.
- **Calendar Integration:** Add a calendar view to visualize task distribution and deadlines over weeks or months.

## 🤝 Contributing

Contributions are welcome! If you have suggestions for new features or improvements, feel free to open an issue or submit a pull request.
