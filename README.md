# Blinkit Bistro Home Screen Assignment

## 📱 Flutter Internship Assignment

Hi! I'm **Vaibhav Shukla**. This repository contains my submission for the Flutter Internship assignment, as discussed in my interview.

---

### 📝 Interview Recap

- **Theory:** Successfully answered all Flutter theory questions.
- **DSA:** Could not solve a live DSA array question but explained my approach honestly.
- **Assignment:** Was asked to showcase my practical Flutter skills by building a UI screen. I chose the main home screen of the Bistro section from the Blinkit app.

---

## 🚀 Assignment Details

**Objective:**  
Recreate the main “Bistro” food listing home screen from the Blinkit (formerly Grofers) app with a focus on clean, modular, and pixel-perfect UI.

---

## 📸 Screenshots

| Home Screen | Home Screen 2 |
|-------------|---------------|
| ![Home Screen](https://drive.google.com/uc?export=view&id=1ukUINkotOD8k1LUFm0tKsTgDr66ieUPo) | ![Home Screen 2](https://drive.google.com/uc?export=view&id=1h017igCZSRsJOGDY7-EsRAR-h56uXRuV) |

| Lower Part 1 | Lower Part 2 |
|--------------|-------------|
| ![Lower Part 1](https://drive.google.com/uc?export=view&id=1FvS7lmPM7oPPG6NQmzBrtVOxZDF91afR) | ![Lower Part 2](https://drive.google.com/uc?export=view&id=1K7aGTWsgCZUesxWtzEMduSTTHaBCmiTX) |

---

## 🔗 APK Download

You can download and try the app directly:

**[Download APK](https://drive.google.com/uc?export=download&id=1dfztOHt9FPtscyL-YTSWrqlWb5ul2-Bw)**

---

## 📂 Folder Structure

```
/lib
  /screens
    bistro_home.dart           # Main Bistro home screen
  /widgets
    food_card.dart             # Widget for each food item card
    offer_banner.dart          # Widget for the offer/banner
    search_bar.dart            # Widget for the search bar
  main.dart                    # App entry point
/assets
  /images                      # Static images for UI visuals
```

---

## 🛠️ Tech Used

- **Flutter** (UI framework)
- **Dart** (language)
- [Google Fonts](https://pub.dev/packages/google_fonts) for custom font styles
- Static asset/network images for food items and banners

---

## 🏗️ Features Implemented

- **Top AppBar:** Delivery info & avatar
- **Search Bar:** With mic icon and “Veg Mode” toggle
- **Offer Banner:** Discount/offer section
- **Horizontal ListView:** For scrolling food cards
- **Food Cards:** Image, title, ratings, delivery time, description, price, “Add” button
- **Bottom “View Cart” Bar**
- **Responsive UI:** Used MediaQuery for adaptive layouts
- **Clean Modular Code:** All major widgets separated for maintainability

---

## 💬 My Approach

- **UI Fidelity:** Matched the Blinkit screen closely (spacing, color, font, layout)
- **Simplicity:** Used only setState for state; no complex state management
- **Static Data:** All food items and banners use static or hardcoded data for review
- **Modularity:** Separated widgets (`FoodCard`, `OfferBanner`, `SearchBar`) for clarity
- **Responsiveness:** Ensured the layout adapts to various screen sizes

---

## 📁 All Assignment Media

**All screenshots and APK are also available in this Google Drive folder:**  
👉 [All Media Google Drive Folder](https://drive.google.com/drive/folders/1NknzqPEy0tCDZ6J3fkFlcHj6s5sjVlyC?usp=sharing)

---

## 🏃‍♂️ How To Run

1. **Clone the repository:**
   ```bash
   git clone https://github.com/theshuklavaibhav/Bistro_Clone_Homescreen-Vaibhav-Shukla.git
   cd Bistro_Clone_Homescreen-Vaibhav-Shukla
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the app:**
   ```bash
   flutter run
   ```

---

## ✨ Bonus

- Tap on “Add” shows a snackbar (if time permits)
- Shimmer loading effect for lists (optional)
- Responsive to different screen sizes

---

## 🙏 Submission Note

Thank you for the opportunity!  
Here’s my submission for the Blinkit Bistro screen assignment. I’ve focused on clean code, UI accuracy, and responsiveness.  
I’m open to feedback and suggestions for improvement.

---

## 🧑‍💻 Contact

- **Email:** vaibhavshukla.dev@gmail.com
- **GitHub:** [@theshuklavaibhav](https://github.com/theshuklavaibhav)

---
