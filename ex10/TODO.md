# TODO List for Exercise 10: Manual User Login Authentication using Google Firestore

## Steps to Complete

1. **Update pubspec.yaml**: Add dependencies for firebase_core and cloud_firestore.
2. **Update android/build.gradle.kts**: Add the Google services Gradle plugin as a dependency.
3. **Update android/app/build.gradle.kts**: Add the google-services plugin and Firebase BoM to dependencies.
4. **Create lib/screens/login_screen.dart**: Implement the login screen with email and password fields, and login button logic to query Firestore and validate credentials.
5. **Create lib/screens/dashboard_screen.dart**: Implement the dashboard screen to display "Welcome, <user name>".
6. **Update lib/main.dart**: Initialize Firebase in main(), set home to LoginScreen, and handle navigation.
7. **Run flutter pub get**: Execute to install new dependencies.
8. **Manually add users to Firestore**: Create 'users' collection with sample user documents (name, email, phone, password).
9. **Test the application**: Run the app and verify login functionality.

## Progress Tracking
- [x] Step 1: Update pubspec.yaml
- [x] Step 2: Update android/build.gradle.kts
- [x] Step 3: Update android/app/build.gradle.kts
- [x] Step 4: Create lib/screens/login_screen.dart
- [x] Step 5: Create lib/screens/dashboard_screen.dart
- [x] Step 6: Update lib/main.dart
- [x] Step 7: Run flutter pub get
- [ ] Step 8: Manually add users to Firestore
- [ ] Step 9: Test the application
