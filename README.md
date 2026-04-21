# Hamed Hossam - Personal Portfolio 👋

A stunning, responsive, and performance-optimized personal portfolio built with Flutter Web. This portfolio showcases my experience as a Software Engineer & Flutter Developer, featuring custom animations, a premium dark theme, and interactive design elements.

## ✨ Features
- **Fully Responsive**: Optimized for Mobile, Tablet, and Desktop screens.
- **Premium Dark Theme**: Modern glassmorphic effects, animated background glow, and carefully selected typography.
- **Micro-Animations**: Smooth scroll reveal, text typing effects, floating animations, and hover transitions using `flutter_animate`.
- **Clean Architecture**: Organized file structure separating presentation from data.
- **SEO Optimized**: Pre-configured meta tags in `web/index.html`.

---

## 🚀 How to Run Locally

1. **Pre-requisites**: Make sure you have the [Flutter SDK](https://flutter.dev/docs/get-started/install) installed and configured for Web development.
2. **Clone / Open the repository**.
3. **Install dependencies**:
   ```bash
   flutter pub get
   ```
4. **Run the app**:
   ```bash
   flutter run -d chrome
   ```

---

## 🎨 Where to Replace Assets & Content

To personalize this portfolio, review the code and look for `// TODO:` comments to replace the placeholder details.

### 1. Images & Assets
Add your images to an `assets/images/` folder (create this folder if it doesn't exist) and update `pubspec.yaml` to include them.
- **Profile Picture**: Replace the `Icon` widget with an image in `lib/features/home/presentation/widgets/hero_section.dart` (`// TODO: replace with assets/images/profile.png`).
- **Project Images**: Place screenshots in `assets/images/projects/` and update `lib/data/static_data.dart`. The project card is currently using a placeholder icon that should be swapped for `Image.asset()` or `Image.network()` in `lib/features/home/presentation/widgets/projects_section.dart`.
- **Favicon & OG Image**: Replace `web/favicon.png` with your favicon. Add `og_image.png` to `web/assets/images/og_image.png` for social sharing previews.

### 2. Updating Content
All text, experiences, skills, and projects are centralized in one file for easy editing!
- Navigate to **`lib/data/static_data.dart`**.
- Modify variables like `name`, `title`, `profileSummary`, `experiences`, `skills`, and `projects`.
- If you'd like to adjust social links, those are also located at the top of `static_data.dart`.

### 3. Contact Form
The contact form currently shows a local success snackbar. To make it functional:
- Go to `lib/features/home/presentation/widgets/contact_section.dart`.
- Look for `// TODO: Replace with mailto or API integration` in the `_submitForm()` method. You can implement `mailto:` logic using `url_launcher` or wire it to an email API (like Formspree or EmailJS).

---

## 🚢 How to Deploy

You can easily deploy Flutter Web to [Firebase Hosting](https://firebase.google.com/docs/hosting) or [GitHub Pages](https://pages.github.com/).

### Deploying to GitHub Pages
1. Build the web app:
   ```bash
   flutter build web --release --base-href "/your-repo-name/"
   ```
2. After a successful build, copy the contents of the `build/web` directory and push them to your repository's `gh-pages` branch. (You can also use tools like [peanut](https://pub.dev/packages/peanut) to automate this).

### Deploying to Firebase Hosting
1. Install the Firebase CLI and login: `firebase login`
2. Initialize Firebase in your project: `firebase init hosting`
   - Set the public directory to `build/web`.
   - Choose "Yes" to configure as a single-page app (rewrite all URLs to index.html).
3. Build the web release:
   ```bash
   flutter build web --release
   ```
4. Deploy:
   ```bash
   firebase deploy --only hosting
   ```

Enjoy your new professional portfolio! 💙
