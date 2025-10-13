# MathPlay - Interactive Math Learning Game (Flutter APP)

MathPlay is an engaging and interactive mobile application designed to help children practice basic arithmetic operations through a fun drag-and-drop game interface. 
Built with Flutter, the app provides an intuitive and visually appealing experience to make learning math enjoyable.

## 🎮 Features

* **Drag & Drop Gameplay**: Users solve math problems by dragging numbers into the correct answer zone.
* **Modern UI/UX**: Smooth animations, colorful gradients, and responsive design tailored for kids.
* **10 Question Rounds**: Each game session presents 10 randomly generated math questions (addition & subtraction).
* **Score Tracking**: Real-time score updates and a final results screen with performance feedback.
* **Interactive Feedback**: Visual cues for correct and incorrect answers to enhance learning.
* **Exit Button**: Center-aligned exit button for a clean and accessible user experience.
* **Fully English Interface**: All texts and messages are in English for a universal user base.
  

## 🚀 Getting Started

### Prerequisites

* Flutter SDK >=3.7.0
* Android Studio or Visual Studio Code
* Android device/emulator

### Installation

```bash
flutter pub get
flutter run
```

### Project Structure

```
lib/
 ├── main.dart
 ├── game_screen.dart
 ├── models/
 │    └── question.dart
 └── widgets/
      ├── draggable_number.dart
      └── answer_drop_zone.dart
assets/
 ├── audio/
 │    ├── success.mp3
 │    └── fail.mp3
 └── images/
      
```

## 🛠️ Key Files

### main.dart

* Entry point of the app.
* Sets global theme and launches `GameScreen`.

### game\_screen.dart

* Manages game logic (questions, score, progression).
* Handles UI transitions, animations, and final result screen.

### question.dart

* Defines the `MathQuestion` model structure.

### draggable\_number.dart

* Custom widget for draggable number bubbles with interactive visual feedback.

### answer\_drop\_zone.dart

* Target zone where users drop their selected answer.
* Dynamically changes appearance based on correct/incorrect answers.

## 🎨 UI/UX Principles Applied

* Gradient backgrounds with child-friendly color palettes.
* Large, tappable elements designed for small hands.
* Smooth animations (AnimatedSwitcher & Container animations).
* Centralized Exit button positioned ergonomically.

## 🧩 Future Improvements

* Add multiplication & division modes.
* Sound effects for correct/wrong answers.
* High-score leaderboard.
* Reward system (stars, badges).

## 🤝 Contributing

Contributions are welcome! Feel free to open issues, submit PRs, or suggest features.

## 📄 License

This project is licensed under the MIT License.

## 👤 Developer

**Bektaş Sarı**<br>
PhD in Advertising, AI + Creativity researcher<br>
Flutter Developer & Software Educator<br>

- **Email:** [bektas.sari@gmail.com](mailto:bektas.sari@gmail.com)  
- **GitHub:** [github.com/bektas-sari](https://github.com/bektas-sari)  
- **LinkedIn:** [linkedin.com/in/bektas-sari](https://www.linkedin.com/in/bektas-sari)  
- **Researchgate:** [researchgate.net/profile/Bektas-Sari-3](https://www.researchgate.net/profile/Bektas-Sari-3)  
- **Academia:** [independent.academia.edu/bektassari](https://independent.academia.edu/bektassari)

---

> "Learning math should be fun and visual. MathPlay brings numbers to life!"

