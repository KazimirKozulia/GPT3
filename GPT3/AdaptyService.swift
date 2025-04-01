//
//  AdaptyService.swift
//  GPT3
//
//  Created by Kazimir Kozulia on 02.03.2025.
//

//extension Dictionary where Key == String, Value == Any {
//    func isEqual(to other: [String: Any]) -> Bool {
//        guard self.count == other.count else { return false }
//
//        for (key, value1) in self {
//            guard let value2 = other[key] else { return false }
//
//            if let dict1 = value1 as? [String: Any], let dict2 = value2 as? [String: Any] {
//                if !dict1.isEqual(to: dict2) { return false }
//            } else if let array1 = value1 as? [Any], let array2 = value2 as? [Any] {
//                if !array1.isEqual(to: array2) { return false }
//            } else if "\(value1)" != "\(value2)" {
//                return false
//            }
//        }
//
//        return true
//    }
//}
//
//extension Array where Element == Any {
//    func isEqual(to other: [Any]) -> Bool {
//        guard self.count == other.count else { return false }
//
//        for (index, element1) in self.enumerated() {
//            let element2 = other[index]
//
//            if let dict1 = element1 as? [String: Any], let dict2 = element2 as? [String: Any] {
//                if !dict1.isEqual(to: dict2) { return false }
//            } else if let array1 = element1 as? [Any], let array2 = element2 as? [Any] {
//                if !array1.isEqual(to: array2) { return false }
//            } else if "\(element1)" != "\(element2)" {
//                return false
//            }
//        }
//
//        return true
//    }
//}


struct GeneralPaywall {
    let placementsId: [String]
    let globalSettings: [String:Any]

    init(data: [String: Any]) {
        self.placementsId = data["placementsId"] as? [String] ?? []
        self.globalSettings = data["global_settings"] as? [String: Any] ?? [:]
    }

}
