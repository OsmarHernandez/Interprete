/**
 * Interprete
 *
 *
 */

import Foundation

/**
 * Primera Parte : Calculadora
 */

let bienvenida: String = "**** Beinvenid a la primera parte del interprete: Calculadora ****"
let ejemplo: String = "Introduce alguna operacion aritmetica.\n Ej. 3 + 5..."
var entrada: String?

func textoUsuario() {
    print(ejemplo)
    entrada = readLine()!
}

class Token {
    var tipo: String    // ENTERO, OPERANDO, EOF
    var valor: String   // [0 - 9], [+ - * /]
    
    init(entradaTipo tipo: String, entradaValor valor: String) {
        self.tipo = tipo
        self.valor = valor
    }
}

class Lexer {
    var tokenValorA: Token?
    var tokenValorB: Token?
    var tokenValorC: Token?
    
    func separandoToken(textoEntrada texto: String) {
        var posicion = 0
        
        while posicion < texto.characters.count {
            let inicioString = texto.startIndex
            let finalString = inicioString.advancedBy(posicion)
            
            if texto[finalString] == "3" {
                tokenValorA = Token(entradaTipo: "ENTERO", entradaValor: "3")
                print("Token creado, valor: \(tokenValorA!.valor)")
                sleep(2)
            }
            
            if texto[finalString] == "+" {
                tokenValorB = Token(entradaTipo: "OPERANDO", entradaValor: "+")
                print("Token creado, valor: \(tokenValorB!.valor)")
                sleep(2)
            }
            
            if texto[finalString] == "2" {
                tokenValorC = Token(entradaTipo: "ENTERO", entradaValor: "2")
                print("Token creado, valor: \(tokenValorC!.valor)")
                sleep(2)
            }
            posicion += 1
        }
    }
}

let lexer = Lexer()

func operaciones(valorOperando operando: String) {
    let valorX: Int? = Int(lexer.tokenValorA!.valor)!
    let valorY: Int? = Int(lexer.tokenValorC!.valor)!
    
    var resultado: Int
    
    switch operando {
    case "+":
        resultado = valorX! + valorY!
    case "-":
        resultado = valorX! - valorY!
    case "*":
        resultado = valorX! * valorY!
    case "/":
        resultado = valorX! / valorY!
    default:
        resultado = 0
    }
    
    print(resultado)
}

func main() {
    print(bienvenida)
    sleep(2)
    textoUsuario()
    print("Entrada: \(entrada!)")
    lexer.separandoToken(textoEntrada: entrada!)
    operaciones(valorOperando: lexer.tokenValorB!.valor)
}

main()