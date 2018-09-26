import Foundation
import HTTP
import FirebaseSwift


let jsonPost = """
{"palavras":[{"letras":["a","s","o","r","t"],"respostas":["ator","rato","astro","rotas","tosar"]},{"letras":["r","c","r","o","a"],"respostas":["ar","coa","roa","corra","arco"]},{"letras":["m","a","r","o","a"],"respostas":["aro","mar","mora","amora","aroma"]},{"letras":["r","e","p","n","a"],"respostas":["rena","pena","pare","perna","penar"]}]}
"""

let jsonData = jsonPost.data(using: .utf8)




func hello(request: HTTPRequest, response: HTTPResponseWriter) -> HTTPBodyProcessing {

    let fbase = Firebase(baseURL: "https://projeto1lp-853d4.firebaseio.com/")
    fbase.auth = "xUlnymKPWXZOCzHlsgmtomeIZANUQtFmVO5QSbm4"

    let coiso = fbase.get(path:"highscore")
    print("\n\n\ncoiso:\(coiso!)\n\n\n")

    print("method:\(request.method)\n\n")
    print("target:\(request.target)\n\n")
    print("httpVersion:\(request.httpVersion)\n\n")
    print("headers:\(request.headers)\n\n")
    print(request)

    response.writeHeader(status: .ok)
    
    if request.method == "GET" && request.target == "/getJson" {
        let palavrasBD = fbase.get(path:"palavras/-LNIAqCcpSHZz-uVKnnW")
        let strPalavras = palavrasBD as! String
        response.writeBody(strPalavras)
    }else if request.method == "POST" {
        response.writeBody(jsonPost)
    }

    response.done()
    // response.abort()
    return .discardBody
}