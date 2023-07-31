//
//  KeychainManager.swift
//  MovieApp
//
//  Created by Hakan Tekir on 31.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation
import Security

class KeychainManager {
    static let shared = KeychainManager()

    func save(key: String, value: String) -> Bool {
        let query: CFDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecValueData: value.data(using: .utf8)
        ] as [CFString: Any] as CFDictionary

        let status = SecItemAdd(query, nil)
        return status == errSecSuccess
    }

    func load(key: String) -> String? {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecReturnData: true,
            kSecMatchLimit: kSecMatchLimitOne
        ] as [String: Any]

        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)

        guard status == errSecSuccess, let data = dataTypeRef as? Data else {
            return nil
        }

        return String(data: data, encoding: .utf8)
    }

     func delete(key: String) -> Bool {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key
        ] as [String: Any]

        let status = SecItemDelete(query as CFDictionary)
        return status == errSecSuccess
    }
}
