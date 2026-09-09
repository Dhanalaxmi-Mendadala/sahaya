# Sahaya — Together We Help

Flutter UI implementation for all 20 screens of the Sahaya community-help app mockup.

## Folder Structure

```
lib/
├── main.dart                          # App entry point
├── core/
│   ├── theme/
│   │   ├── app_colors.dart            # Brand colors, category & urgency colors
│   │   └── app_theme.dart             # ThemeData (buttons, inputs, appbar, nav bar)
│   └── constants/
│       └── app_constants.dart         # App name, tagline, category & urgency lists
├── models/
│   ├── help_request.dart              # HelpRequest model + sample feed
│   ├── user_model.dart                # UserModel, BadgeModel, CommunityGroup
│   └── notification_model.dart        # NotificationModel, ChatMessage
├── widgets/
│   ├── common/
│   │   ├── custom_button.dart
│   │   ├── custom_text_field.dart
│   │   └── app_bottom_nav.dart        # Shared Home/Requests/Map/Chat/Profile nav bar
│   └── cards/
│       ├── category_card.dart         # Food/Medical/Transport... icon grid card
│       ├── request_card.dart          # Request list item card
│       ├── badge_card.dart            # Reputation badge card
│       └── group_card.dart            # Community/NGO group card
└── screens/
    ├── splash/splash_screen.dart                       # 1. Splash Screen
    ├── onboarding/onboarding_screen.dart                # 2. Welcome / Onboarding
    ├── auth/
    │   ├── sign_up_screen.dart                          # 3. Sign Up / Login
    │   └── profile_setup_screen.dart                    # 4. Profile Setup
    ├── home/home_dashboard_screen.dart                  # 5. Home Dashboard
    ├── help_request/create_help_request_screen.dart     # 6. Create Help Request
    ├── requests/
    │   ├── nearby_requests_map_screen.dart              # 7. Nearby Requests (Map)
    │   ├── nearby_requests_list_screen.dart             # 8. Nearby Requests (List)
    │   ├── request_details_screen.dart                  # 9. Request Details
    │   └── request_status_screen.dart                   # 13. My Requests / Status
    ├── volunteer/volunteer_mode_screen.dart              # 10. Volunteer Mode
    ├── chat/chat_screen.dart                             # 11. Chat
    ├── navigation/navigation_screen.dart                 # 12. Navigation (Maps)
    ├── emergency/emergency_screen.dart                   # 14. Emergency Button (SOS)
    ├── notifications/notifications_screen.dart           # 15. Notifications
    ├── profile/
    │   ├── profile_screen.dart                           # 16. Profile
    │   └── reputation_badges_screen.dart                 # 17. Reputation & Badges
    ├── community/community_groups_screen.dart            # 18. Community Groups
    └── ngo/ngo_profile_screen.dart                       # 19. NGO / Organization
```

Screen 20 ("Additional Features" — Blood Donation, Lost & Found, etc.) is represented
as extra entries in `AppConstants.helpCategories` / the category grid, since it's a
menu of shortcuts rather than a unique screen layout — add more `CategoryCard`s or a
dedicated `MoreServicesScreen` if you want it as its own page.

## Setup

1. Copy the `sahaya/` folder into your Flutter workspace (or create a new project with
   `flutter create sahaya` and drop these files in, overwriting `lib/`, `pubspec.yaml`,
   and `analysis_options.yaml`).
2. Run:
   ```bash
   flutter pub get
   flutter run
   ```

## Notes / Next Steps

- **Fonts**: the theme references `Poppins`; either add the font files under
  `assets/fonts/` and uncomment the `fonts:` section in `pubspec.yaml`, or remove the
  `fontFamily` line in `app_theme.dart` to use the system default.
- **Maps**: screens 7 (Nearby Requests Map) and 12 (Navigation) currently use
  placeholder containers standing in for a real map. Add `google_maps_flutter` and
  `geolocator` (already listed, commented out, in `pubspec.yaml`) to wire up live maps,
  markers, and turn-by-turn routes.
- **Backend**: all data currently comes from static sample data in `models/`. Swap the
  `sample()` methods for real API/Firestore calls once your backend is ready.
- **Auth**: `sign_up_screen.dart` has button hooks for phone/email/Google — wire these
  to Firebase Auth or your own auth service.
- **State management**: the app currently uses local `StatefulWidget` state only. For a
  production app, introduce `provider`, `riverpod`, or `bloc` to share request/user
  state across screens instead of passing sample data around.
