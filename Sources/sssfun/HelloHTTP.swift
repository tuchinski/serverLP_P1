import Foundation
import HTTP

let json = """
{"palavras":[{"letras":["a","c","o","r","r"],"respostas":["caro","carro","aro","orar","cor","corra"]},{"letras":["a","s","o","r","t"],"respostas":["ator","rato","astro","rotas","tosar"]},{"letras":["r","c","r","o","a"],"respostas":["ar","coa","roa","corra","arco"]},{"letras":["m","a","r","o","a"],"respostas":["aro","mar","mora","amora","aroma"]},{"letras":["r","e","p","n","a"],"respostas":["rena","pena","pare","perna","penar"]}]}
"""

func hello(request: HTTPRequest, response: HTTPResponseWriter) -> HTTPBodyProcessing {
    print("method:\(request.method)\n\n")
    print("target:\(request.target)\n\n")
    print("httpVersion:\(request.httpVersion)\n\n")
    print("headers:\(request.headers)\n\n")

    response.writeHeader(status: .ok)
    response.writeBody(json)
    response.done()
    // response.abort()
    return .discardBody
}