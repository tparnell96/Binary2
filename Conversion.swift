import SwiftUI
import Foundation


class mybigData: ObservableObject {
    @Published var result: String = ""
    func testthis(binaryBits: String) -> String{
        var index = binaryBits.startIndex
        let binaryBits = String(binaryBits.filter { !" \n\t\r".contains($0)})
        while let next = binaryBits.index(index, offsetBy: 8, limitedBy: binaryBits.endIndex) {
            let asciiCode = UInt8(binaryBits[index..<next], radix: 2)!
            result.append(String(UnicodeScalar(asciiCode)))
            index = next
        }
        return (result)
    }
}

