# 📱 Flutter BLoC Authentication & Photo Gallery App

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![BLoC](https://img.shields.io/badge/BLoC-5C2D91?style=for-the-badge&logo=bloc&logoColor=white)

A production-ready Flutter application demonstrating modern app development with **BLoC state management**, **form validation**, and **API integration**. This app features a secure login flow and a beautiful photo gallery powered by the Picsum Photos API.

## ✨ Key Features

- **Secure Authentication Flow** with email/password validation
- **BLoC State Management** for predictable state handling
- **Clean Architecture** with proper separation of concerns
- **Responsive UI** with dynamic image sizing
- **Form Validation** with complex password requirements
- **API Integration** with error handling
- **Custom Typography** using Montserrat font family

## 📸 Screenshots

| Login Screen | Home Screen |
|--------------|-------------|
| ![Login Screen](https://i.imgur.com/JQ7X8Kj.png) | ![Home Screen](https://i.imgur.com/9Z8Y7vT.png) |

## 🛠️ Technical Implementation

### Architecture

```
📂 lib/
├── 📂 api/          # API clients and networking
├── 📂 bloc/         # BLoC state management
├── 📂 models/       # Data models
├── 📂 screens/      # Application screens
├── 📂 utils/        # Utilities and helpers
└── 📂 widgets/      # Reusable UI components
```

### Key Packages

- **flutter_bloc**: For state management
- **equatable**: For value equality
- **http**: For API calls
- **google_fonts**: For beautiful typography
- **formz**: For form validation

## 🔑 Login Requirements

- **Email**: Must be valid format (user@example.com)
- **Password**: Must contain:
  - At least 8 characters
  - 1 uppercase letter
  - 1 lowercase letter
  - 1 number
  - 1 special character

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (>= 3.0.0)
- Dart (>= 2.17.0)

### Installation

1. Clone the repository
   ```sh
   git clone https://github.com/your-username/flutter-bloc-auth-app.git
   ```
2. Install dependencies
   ```sh
   flutter pub get
   ```
3. Run the app
   ```sh
   flutter run
   ```

## 🤝 Contributing

Contributions are welcome! Please open an issue or submit a pull request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

**Built with ❤️ using Flutter**  
**Happy Coding!** 🚀
