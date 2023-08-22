// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Born:
  internal static let actorDetailsBorn = L10n.tr("Localizable", "actorDetails_born", fallback: "Born:")
  /// See less >>
  internal static let actorDetailsHideBio = L10n.tr("Localizable", "actorDetails_hideBio", fallback: "See less >>")
  /// See full bio >>
  internal static let actorDetailsShowBio = L10n.tr("Localizable", "actorDetails_showBio", fallback: "See full bio >>")
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
  /// Cast
  internal static let movieDetailsCast = L10n.tr("Localizable", "movieDetails_cast", fallback: "Cast")
  /// min
  internal static let movieDetailsDuration = L10n.tr("Localizable", "movieDetails_duration", fallback: "min")
  /// Movies
  internal static let movies = L10n.tr("Localizable", "movies", fallback: "Movies")
  /// Password
  internal static let password = L10n.tr("Localizable", "password", fallback: "Password")
  /// Popular
  internal static let popular = L10n.tr("Localizable", "popular", fallback: "Popular")
  /// Unknown Error
  internal static let profileError = L10n.tr("Localizable", "profile_error", fallback: "Unknown Error")
  /// Hello 👋
  internal static let profileHello = L10n.tr("Localizable", "profile_hello", fallback: "Hello 👋")
  /// Profile
  internal static let profileNavigationTitle = L10n.tr("Localizable", "profile_navigationTitle", fallback: "Profile")
  /// Register Now
  internal static let registerNow = L10n.tr("Localizable", "register_now", fallback: "Register Now")
  /// Movie
  internal static let searchMovie = L10n.tr("Localizable", "search_movie", fallback: "Movie")
  /// Search
  internal static let searchNavigationTitle = L10n.tr("Localizable", "search_navigationTitle", fallback: "Search")
  /// your search didn’t have any results
  internal static let searchNone = L10n.tr("Localizable", "search_none", fallback: "your search didn’t have any results")
  /// Person
  internal static let searchPerson = L10n.tr("Localizable", "search_person", fallback: "Person")
  /// Movies or Series
  internal static let searchSearchBar = L10n.tr("Localizable", "search_searchBar", fallback: "Movies or Series")
  /// TV Series
  internal static let searchSeries = L10n.tr("Localizable", "search_series", fallback: "TV Series")
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
  /// TV Series
  internal static let tvSeriesNavigationTitle = L10n.tr("Localizable", "tvSeries_navigationTitle", fallback: "TV Series")
  /// Top Rated
  internal static let tvSeriesTopRated = L10n.tr("Localizable", "tvSeries_topRated", fallback: "Top Rated")
  /// Cast
  internal static let tvSeriesDetailsCast = L10n.tr("Localizable", "tvSeriesDetails_cast", fallback: "Cast")
  /// min
  internal static let tvSeriesDetailsDuration = L10n.tr("Localizable", "tvSeriesDetails_duration", fallback: "min")
  /// seasons
  internal static let tvSeriesDetailsSeasons = L10n.tr("Localizable", "tvSeriesDetails_seasons", fallback: "seasons")
  /// TV Series
  internal static let tvSeriesDetailsTvSeries = L10n.tr("Localizable", "tvSeriesDetails_tvSeries", fallback: "TV Series")
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
