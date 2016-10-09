/**
 * Interprete
 *
 *
 */

import Foundation

/**
 * Primera Parte : Calculadora
 */

let bienvenida: String = "**** Bienvenido a la primera parte del interprete: Calculadora ****"
let ejemplo: String = "Introduce alguna operacion aritmetica.\n Ej. 3 + 5..."
var entrada: String?

func textoUsuario() {
    print(ejemplo)
    entrada = readLine()!
}

class Token {
    var tipo: String    // ENTERO, OPERANDO, EOF (no utilizado)
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
        var posicion: Int = 0
        var firstToken: Bool = false
        var thereIsValue: Bool = false

        while posicion < texto.characters.count {
            let inicioString = texto.startIndex
            let finalString = inicioString.advancedBy(posicion)

            let valorLeido:String = String(texto[finalString])
            let valorActual: String = String(texto[finalString])
            
            if Int(valorLeido) != nil && firstToken == false {
                if thereIsValue == false {
                    tokenValorA = Token(entradaTipo: "ENTERO", entradaValor: valorActual)
                    print("Token creado, valor: \(tokenValorA!.valor)")
                    thereIsValue = true
                    sleep(2)
                } else if thereIsValue == true {
                    tokenValorA!.valor += valorActual
                    print("Token actualizado, valor: \(tokenValorA!.valor)")
                    sleep(2)
                }
            } else if valorActual == "+" || valorActual == "-" || valorActual == "*" || valorActual == "/" {
                tokenValorB = Token(entradaTipo: "OPERANDO", entradaValor: valorActual)
                print("Token creado, valor: \(tokenValorB!.valor)")
                firstToken = true
                thereIsValue = false // CAMBIAR PARA NO CONFUNDIR
                sleep(2)
            } else if Int(valorLeido) != nil && firstToken == true {
                if thereIsValue == false {
                    tokenValorC = Token(entradaTipo: "OPERANDO", entradaValor: valorActual)
                    print("Token creado, valor: \(tokenValorC!.valor)")
                    thereIsValue = true
                    sleep(2)
                }
                else if thereIsValue == true {
                    tokenValorC!.valor += valorActual
                    print("Token actualizado, valor: \(tokenValorC!.valor)")
                    sleep(2)
                }
            }
            
            posicion += 1
        }
    }
    
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
}

let lexer = Lexer()

func main() {
    print(bienvenida)
    sleep(2)
    textoUsuario()
    print("Entrada: \(entrada!)")
    lexer.separandoToken(textoEntrada: entrada!)
    lexer.operaciones(valorOperando: lexer.tokenValorB!.valor)
}

main()