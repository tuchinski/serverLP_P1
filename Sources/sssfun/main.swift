import Foundation
import HTTP
import FirebaseSwift

//conecta banco


let server = HTTPServer()
do {
    try server.start(port: 8080, handler: hello)
} catch{
    print("failed to start server:", error)
    exit(42)
}

RunLoop.current.run()