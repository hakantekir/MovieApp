// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Delete Image
  internal static let deleteImage = L10n.tr("Localizable", "delete_image", fallback: "Delete Image")
  /// Don't have an account?
  internal static let dontHaveAccount = L10n.tr("Localizable", "dont_have_account", fallback: "Don't have an account?")
  /// Email
  internal static let email = L10n.tr("Localizable", "email", fallback: "Email")
  /// Forgot Password?
  internal static let forgotPassword = L10n.tr("Localizable", "forgot_password", fallback: "Forgot Password?")
  /// Localizable.strings
  ///   MovieApp
  /// 
  ///   Created by Selim Gungorer on 14.09.2022.
  ///   Copyright © 2022 Adesso Turkey. All rights reserved.
  internal static let helloWorld = L10n.tr("Localizable", "Hello, World!", fallback: "Hello")
  /// Login
  internal static let login = L10n.tr("Localizable", "login", fallback: "Login")
  /// Movies
  internal static let movies = L10n.tr("Localizable", "movies", fallback: "Movies")
  /// Password
  internal static let password = L10n.tr("Localizable", "password", fallback: "Password")
  /// Popular
  internal static let popular = L10n.tr("Localizable", "popular", fallback: "Popular")
  /// Register Now
  internal static let registerNow = L10n.tr("Localizable", "register_now", fallback: "Register Now")
  /// Choose a Photo
  internal static let selectPhoto = L10n.tr("Localizable", "select_photo", fallback: "Choose a Photo")
  /// Camera
  internal static let sourceCamera = L10n.tr("Localizable", "source_camera", fallback: "Camera")
  /// Library
  internal static let sourceLibrary = L10n.tr("Localizable", "source_library", fallback: "Library")
  /// Saved Album
  internal static let sourceSavedAlbum = L10n.tr("Localizable", "source_saved_album", fallback: "Saved Album")
  /// Select a source
  internal static let sourceSelectTitle = L10n.tr("Localizable", "source_select_title", fallback: "Select a source")
  /// Take a Photo
  internal static let takePhoto = L10n.tr("Localizable", "take_photo", fallback: "Take a Photo")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
