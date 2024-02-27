//
//  PresistenceManager.swift
//  GHFollowers
//
//  Created by Daria on 27.02.2024.
//

import Foundation

enum  PresistenceActionType {
    case add, remove
}

enum PresistenceManager {
    static private var defaults = UserDefaults.standard
    
    enum Keys {
        static let favorites = "favorites"
    }
    static func updateWith(favorite: Follower, actionType: PresistenceActionType, comleted: @escaping (GFError?) -> Void) {
        retrieveFavorite { result in
            switch result {
            case .success(let favorites):
                var retrivedFavorites = favorites
                
                switch actionType {
                case .add:
                    guard !retrivedFavorites.contains(favorite) else {
                        comleted(.alredyInFavorites)
                        return
                    }
                    
                    retrivedFavorites.append(favorite)
                    
                case .remove:
                    retrivedFavorites.removeAll{ $0.login == favorite.login }
                }
                
                comleted(save(favorites: favorites))
                
            case.failure(let error):
                comleted(error)
            }
        }
    }
    
    
    
    static func retrieveFavorite(completed: @escaping (Result<[Follower], GFError>) -> Void) {
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            completed(.success([]))
            return
        }
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoritesData)
            completed(.success(favorites))
        } catch {
            completed(.failure(.unableToFavorite))
        }
    }
    
    static func save (favorites: [Follower]) -> GFError? {
        do {
            let encoder = JSONEncoder()
            let encoderFavorites = try encoder.encode(favorites)
            defaults.set(encoderFavorites, forKey: Keys.favorites)
            return nil
        } catch {
            return .unableToFavorite
        }
    }
}
