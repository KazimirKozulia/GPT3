//
//  AdaptyKeys.swift
//  GPT3
//
//  Created by Kazimir Kozulia on 20.02.2025.
//

enum GeneralOnboardingKeys: String {
    var rawValueString: String {
        get { self.rawValue }
    }
    case privacyPolicyLink
    case termsOfUseLink

}

protocol RemoteConfigKeyValue {
    var rawValueString: String { get }
}

enum GeneralPaywallKeys: String, RemoteConfigKeyValue {
    var rawValueString: String {
        get { self.rawValue }
    }
    
    case privacyPolicyLink
    case termsOfUseLink

}

