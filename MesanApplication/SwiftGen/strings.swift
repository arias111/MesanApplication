// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {

  internal enum Common {
    /// Отмена
    internal static let cancel = L10n.tr("Localizable", "Common.cancel")
    /// Закрыть
    internal static let close = L10n.tr("Localizable", "Common.close")
    /// Сохранить
    internal static let dave = L10n.tr("Localizable", "Common.dave")
    /// Готово
    internal static let done = L10n.tr("Localizable", "Common.done")
    /// Выйти
    internal static let logout = L10n.tr("Localizable", "Common.logout")
    /// Далее
    internal static let next = L10n.tr("Localizable", "Common.next")
    /// Нет
    internal static let no = L10n.tr("Localizable", "Common.no")
    /// Удалить
    internal static let remove = L10n.tr("Localizable", "Common.remove")
    /// Обновить
    internal static let update = L10n.tr("Localizable", "Common.update")
    /// Да
    internal static let yes = L10n.tr("Localizable", "Common.yes")
  }

  internal enum Error {
    /// Почта уже используется
    internal static let emailAlreadyInUse = L10n.tr("Localizable", "Error.emailAlreadyInUse")
    /// Ошибка
    internal static let error = L10n.tr("Localizable", "Error.error")
    /// Некорректная почта
    internal static let invalidEmail = L10n.tr("Localizable", "Error.invalidEmail")
    /// Некорректная почта
    internal static let invalidRecipientEmail = L10n.tr("Localizable", "Error.invalidRecipientEmail")
    /// Некорректная почта
    internal static let invalidSender = L10n.tr("Localizable", "Error.invalidSender")
    /// Ошибка соединения, попробуйте позже
    internal static let networkError = L10n.tr("Localizable", "Error.networkError")
    /// Аккаунт был заблокирован
    internal static let userDisabled = L10n.tr("Localizable", "Error.userDisabled")
    /// Пользователь не найден
    internal static let userNotFound = L10n.tr("Localizable", "Error.userNotFound")
    /// Слабый пароль
    internal static let weakPassword = L10n.tr("Localizable", "Error.weakPassword")
    /// Неверный пароль
    internal static let wrongPassword = L10n.tr("Localizable", "Error.wrongPassword")
  }

  internal enum Onboarding {
    /// Войти
    internal static let singIn = L10n.tr("Localizable", "Onboarding.singIn")
    /// Зарегистрироваться
    internal static let singUp = L10n.tr("Localizable", "Onboarding.singUp")
    /// Test
    internal static let title = L10n.tr("Localizable", "Onboarding.title")
  }

  internal enum SignIn {
    /// Логин
    internal static let loginPlaceholder = L10n.tr("Localizable", "SignIn.loginPlaceholder")
    /// Пароль
    internal static let passwordPlaceholder = L10n.tr("Localizable", "SignIn.passwordPlaceholder")
  }

  internal enum Tabbar {
    /// Test
    internal static let tab1 = L10n.tr("Localizable", "Tabbar.tab1")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
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
