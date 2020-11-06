//
//  Pokemon.swift
//  PokeMaster
//
//  Created by 李坤 on 2020/11/6.
//

import Foundation
struct Pokemon: Codable, Identifiable {
    struct `Type`: Codable {
        struct Internal: Codable {
            let name: String
            let url: URL
        }

        let slot: Int
        let type: Internal
    }
    
    struct Stat: Codable {
        enum Case: String, Codable {
            case speed
            case specialDefense = "special-defense"
            case specialAttack = "special-attack"
            case defense
            case attack
            case hp
        }

        struct Internal: Codable {
            let name: Case
        }

        let baseStat: Int
        let stat: Internal
    }
    
    struct SpeciesEntry: Codable {
        let name: String
        let url: URL
    }

    struct AbilityEntry: Codable, Identifiable {
        struct Internal: Codable {
            let name: String
            let url: URL
        }

        var id: URL { ability.url }
        
        let slot: Int
        let ability: Internal
    }
    
    let id: Int
    let types: [Type]
    let abilities: [AbilityEntry]
    let stats: [Stat]
    let species: SpeciesEntry
    let height: Int
    let weight: Int
}

extension Pokemon: CustomDebugStringConvertible {
    var debugDescription: String {
        "Pokemon - \(id) - \(self.species.name)"
    }
}
