# Task Management App

Welcome to the **Task Management App**, a Flutter-based project that helps users manage their tasks efficiently with features such as task creation, editing, notifications, and a motivational quote display.

## 📑 Features

1. **Task Management:**

   - Add, edit, delete, and view tasks.
   - Each task includes a title, description, due date, and status (Completed/Incomplete).

2. **Local Storage:**

   - Uses SQLite to persist tasks, so they remain after closing and reopening the app.

3. **Motivational Quotes:**

   - Fetches and displays a motivational quote from an external API on the home screen each time the app is opened.

4. **Notifications:**

   - Reminds users of tasks that are due soon (e.g., within 1 hour) using local notifications.

5. **Responsive UI:**
   - User-friendly and responsive design for a seamless experience across various screen sizes.

## 🚀 Getting Started

Follow these instructions to get the project up and running on your local machine.

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Android Studio](https://developer.android.com/studio) or [Visual Studio Code](https://code.visualstudio.com/)
- A device or emulator running Android/iOS

### Installation

1. **Clone the repository:**

```bash
git clone https://github.com/Yoseph-Gebeyehu/Task-Management.git
cd Task-Management
```

2. **Install dependencies:**

```bash
flutter pub get
```

3. **Run the app:**

```bash
flutter run
```

### API Integration

The app fetches quotes from an external API: [Quotes API](https://type.fit/api/quotes). This is handled in the `QuotesRepository` class, where a random quote is fetched and displayed on the home screen.

### Local Notifications

The app uses the `awesome_notifications` package to schedule notifications. Ensure the app has the necessary permissions for notifications on your device.

## 🛠️ Project Structure

The project follows a clean architecture, with clear separation between UI, state management (Bloc), and data layers. Below is a brief overview of the folder structure:

```
lib/
│
├── data/                    # Data layer (API and Local DB)
│   ├── model/               # Task and Quote models
│   ├── repository/          # Repositories for data management
│
├── features/                # Feature-based modules
│   ├── home/                # Home screen and Bloc
│   ├── add_task/            # Add/Edit Task screen and Bloc
│   ├── drawer/              # Navigation drawer
│
├── domain/                  # Domain constants and utilities
│   ├── constant/            # App constants (themes, images)
│   ├── custom_dialog.dart   # Custom dialog implementation
│
├── main.dart                # Entry point of the app
```

## 🔧 Technologies Used

- **Flutter**: Frontend framework for building natively compiled applications.
- **SQLite**: Local storage for persisting tasks.
- **Bloc**: State management.
- **Awesome Notifications**: For scheduling local notifications.
- **Http**: For API integration with the Quotes API.

Feel free to clone, modify, and share this project! 😊 If you encounter any issues or have suggestions, feel free to open an issue or pull request.
