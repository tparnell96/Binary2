import SwiftUI
import UniformTypeIdentifiers
import VisionKit


@available(iOS 16.0, *)
struct BinaryView: View {
    @State private var testtext: String = ""
    @ObservedObject var myresultdata: mybigData
    var body: some View {
        VStack {
            Spacer()
            TextEditor(text: $testtext)
                .overlay(
                    RoundedRectangle(cornerRadius:10)
                        .stroke(.gray, lineWidth: 2))
                .aspectRatio(1.0, contentMode: .fit)
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 100, height: 50)
                    .foregroundColor(.orange)
                Button() {
                    myresultdata.testthis(binaryBits: testtext)
                }
            label:{
                Label("Convert", systemImage: "repeat.circle")
            }
            .foregroundColor(.white)
            }
            TextEditor(text: $myresultdata.result)
                .overlay(
                    RoundedRectangle(cornerRadius:10)
                        .stroke(.gray, lineWidth: 2))
            //.frame(width: 600, height: 100)
                .disabled(true)
                .aspectRatio(1.0, contentMode: .fit)
            Spacer()
            
            
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 200, height: 50)
                    .foregroundColor(.orange)
                Button() {
                    UIPasteboard.general.string = myresultdata.result
                }
            label:{
                Label("Copy to Clipboard", systemImage: "doc.on.doc")  
            }
            .foregroundColor(.white)

            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 100, height: 50)
                    .foregroundColor(.orange)
                Button() {
                    myresultdata.result = ""
                    testtext = ""
                }
            label: {
                Label ("Clear All", systemImage: "eraser")
            }
            .foregroundColor(.white)
            }
            
            
        }
    }
}
