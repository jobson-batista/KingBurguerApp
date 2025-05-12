//
//  DataSource.swift
//  KingBurguer
//
//  Created by Jobson on 11/05/25.
//

enum BrazilianState: String, CaseIterable {
    case AC, AL, AP, AM, BA, CE, DF, ES, GO, MA
    case MT, MS, MG, PA, PB, PR, PE, PI, RJ, RN
    case RS, RO, RR, SC, SP, SE, TO

    var name: String {
        switch self {
        case .AC: return "Acre"
        case .AL: return "Alagoas"
        case .AP: return "Amapa"
        case .AM: return "Amazonas"
        case .BA: return "Bahia"
        case .CE: return "Ceara"
        case .DF: return "Distrito Federal"
        case .ES: return "Espirito Santo"
        case .GO: return "Goias"
        case .MA: return "Maranhao"
        case .MT: return "Mato Grosso"
        case .MS: return "Mato Grosso do Sul"
        case .MG: return "Minas Gerais"
        case .PA: return "Para"
        case .PB: return "Paraiba"
        case .PR: return "Parana"
        case .PE: return "Pernambuco"
        case .PI: return "Piaui"
        case .RJ: return "Rio de Janeiro"
        case .RN: return "Rio Grande do Norte"
        case .RS: return "Rio Grande do Sul"
        case .RO: return "Rondonia"
        case .RR: return "Roraima"
        case .SC: return "Santa Catarina"
        case .SP: return "Sao Paulo"
        case .SE: return "Sergipe"
        case .TO: return "Tocantins"
        }
    }
}
