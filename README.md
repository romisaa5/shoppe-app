# 🛍️ Shoppe App

Shoppe App is a modern **E-commerce Flutter application** that delivers a clean, smooth, and elegant shopping experience.  
The app follows **Clean Architecture** principles and uses **Dependency Injection**, **GoRouter**, and **Cubit** for structured and maintainable code.

---

## 🚀 Overview

Shoppe App focuses on providing a delightful user journey , starting from a visually appealing **Splash & Onboarding** experience,  
all the way to secure authentication and personalized shopping.

---

## 🧠 Tech Stack

| Category | Tools / Packages |
|-----------|------------------|
| **Framework** | Flutter |
| **Routing** | GoRouter |
| **Dependency Injection** | get_it |
| **State Management** | Cubit / Bloc |
| **Responsive UI** | flutter_screenutil |
| **SVG Support** | flutter_svg |
| **Styling** | AppColors & AppTextStyles (Custom Design System) |

---

## 📱 Features

- 🖼️ Splash & Onboarding flow  
- 🔐 Authentication (Login, Signup, Forget Password, Verification)  
- 🛒 Shopping flow with user preferences  
- 💬 Clean navigation with GoRouter  
- 🎨 Fully responsive & adaptive design  
- ⚙️ Modular architecture with Dependency Injection  

---

## 🌈 Splash & Onboarding Screens

## ✨ Splash Screen
The **Splash Screen** is the app’s entry point, introducing users with an animated logo transition before moving to the onboarding view.

#### 🔧 Features
- Smooth logo animation using `AnimatedPositioned`
- Custom transition curve (`Curves.easeOutBack`)
- Auto navigation using `GoRouter`
- Primary theme color background
- Responsive layout using `flutter_screenutil`

#### 🧩 Packages Used
```yaml
flutter_screenutil: For responsive UI design
flutter_svg: For rendering SVG logos
go_router: For route navigation
```

## 💫 Onboarding Screen

The **Onboarding Screen** introduces users to the app’s look and style while allowing them to choose their gender preference before continuing.

---

### 🧩 Overview
The screen features a stylish gradient background, glowing visual effects, and interactive gender selection buttons (Men/Women).  
It’s built to create an elegant and modern first impression for the user.

---

### ✨ Features
- 🎨 **Gradient background** with smooth color transitions  
- 💡 **Glow effect** using `BackdropFilter` and `ImageFilter.blur`  
- 👕 **Gender selection** buttons: Men / Women  
- ⏭️ **Skip option** for quick access  
- 🚀 **Navigation** to the social authentication screen using `GoRouter`  
- 📱 Fully **responsive design** using `flutter_screenutil`

---

### 🧠 Packages Used
```yaml
flutter_screenutil: For responsive scaling
go_router: For navigation
get_it: For dependency injection
```

## 🖼️ Screenshots

<p align="center">
  <img src="https://github.com/user-attachments/assets/ab242930-b329-4186-b920-d6ebf101b4e9" alt="splash" width="250" />
  &nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/1417c7fa-0c6c-4e06-89b1-07cd026a61ea" alt="onboarding" width="250" />
</p>


---

##  API Integration

Shoppe App uses a robust and clean **authentication system** built on top of a well-structured networking layer  
that follows **Clean Architecture** principles and utilizes **Dio**, **Retrofit**, and **Dependency Injection (get_it)**.

---

### 🌍 Base API
The app connects to the official backend:

The app connects to a live RESTful API hosted at  
[`https://accessories-eshop.runasp.net/`](https://accessories-eshop.runasp.net/)

lib/core/networking/
```
│
├── api_constants.dart          # Base URLs & Endpoints
├── api_service.dart            # Retrofit interface for API calls
├── api_service.g.dart          # Auto-generated file by Retrofit
├── dio_factory.dart            # Custom Dio configuration (headers, interceptors, timeouts)
├── api_error_handler.dart      # Centralized error handling
├── api_error_model.dart        # Model for API errors
├── api_result.dart             # Wrapper for success/failure results
├── api_result.freezed.dart     # Generated file using Freezed
```

---

## 🔐 Authentication Module

The **Authentication flow** in Shoppe App provides a complete and secure user experience —  
from signing up and verifying the account via email OTP, to logging in and resetting forgotten passwords.

#### 🔑 Auth Endpoints

| Endpoint | Description |
|-----------|--------------|
| `auth/register` | Register a new user with email, name, and password |
| `auth/login` | Authenticate existing user credentials |
| `auth/verify-email` | Send OTP to verify the registered email |
| `auth/validate-otp` | Validate OTP code to confirm user identity |
| `auth/resend-otp` | Resend OTP code in case the first one expires |

---

### ⚙️ Technologies & Packages

| Purpose | Package |
|----------|----------|
| **HTTP Client** | dio |
| **API Abstraction** | retrofit |
| **Code Generation** | build_runner, retrofit_generator |
| **Error Handling** | freezed, json_serializable |
| **Dependency Injection** | get_it |
| **Logging** | pretty_dio_logger, logger |
| **Secure Token Storage** | flutter_secure_storage |



---

### ⚙️ Features
- 📩 Email verification flow with OTP  
- 🔐 Login & Signup integration with real API  
- 🔁 Resend OTP functionality  
- 🔒 Password recovery (Forget Password & New Password screens)  
- 🧩 Fully handled via **Cubit** states (loading, success, error)  
- 🚦 Navigation using **GoRouter**  
- 📱 Responsive design using **flutter_screenutil**

---
## 🖼️ Screenshots

This section showcases all **Login & Forget Password** related screens , including **Social Authentication**, **Email/Password Login**, and **Password Recovery Flow**.

<p align="center">
  <img src="https://github.com/user-attachments/assets/56dacf37-c043-4c64-bfd9-76630fe0dc1d" alt="social_auth" width="220" />
  &nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/d19a07b2-589b-432d-bbd8-c80961cdcf48" alt="login" width="220" />
  &nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/b5082770-b702-49bd-899a-890daff1cc56" alt="verify_code" width="220" />
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/f9a926ce-b9e2-4187-a20f-81997f078ba4" alt="forget_password" width="220" />
  &nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/cd2b20cf-f99d-419e-b864-51c46fa87ddb" alt="new_password" width="220" />
</p>


This section covers the **user registration flow**, including **email verification** and **OTP validation**. 
Users can easily create a new account, verify their email, and activate their profile securely.

<p align="center">
  <img src="https://github.com/user-attachments/assets/3a17fe9d-d90d-46a4-aee8-e5029f4f07fa" alt="sign_up" width="220" />
  &nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/619ce169-082d-4351-9026-3699b0956e82" alt="verify_email" width="220" />
  &nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/9de32645-185e-4ed5-9e86-d0d5347352f0" alt="otp" width="220" />
</p>

---

## 🚧 Other Features  
Other features will be added soon... stay tuned for the upcoming updates! 💫


