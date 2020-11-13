//
//  AlunoAPI.swift
//  Agenda
//
//  Created by Grazi Berti on 12/11/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import UIKit
import Alamofire

class AlunoAPI: NSObject {
    // Criando método para salvar os alunos no servidor
    
    func salvaAlunosNoServidor(parametros: Array<Dictionary<String, String>> ) {
        //primeiro endereço, para mostrar onde vamos levar esses alunos salvos
        guard let url = URL(string: "http://localhost:8080/api/aluno/lista") else
        {return}
        
        var requisicao = URLRequest(url: url)
        requisicao.httpMethod = "PUT"
        
        let json = try! JSONSerialization.data(withJSONObject: parametros, options: [])
        requisicao.httpBody = json
        
        requisicao.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        Alamofire.request(requisicao)
        
        
    }
}
