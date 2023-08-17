//
//  SearchViewModel.swift
//  MovieApp
//
//  Created by Hakan Tekir on 11.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

@MainActor
class SearchViewModel: ObservableObject {
    @Published var query: String = ""
    @Published var searchResults: [SearchItemDataModel] = []
    @Published var isLoading: Bool = false
    private var task: Task<Void, Never>?

    func fetchResults() async {
        task?.cancel()
        isLoading = true
        task = Task {
            let response = try? await NetworkService.shared.request(
                with: RequestObject(url: SearchEndpoints.multi(query: query).path),
                responseModel: SearchQueryResponseModel.self
            )
            searchResults = await mapAndUpdateResults(response)
            isLoading = false
        }
    }

    private func mapAndUpdateResults(_ response: SearchQueryResponseModel?) async -> [SearchItemDataModel] {
        guard let response, let responseResults = response.results else {
            return []
        }

        var results = mapQueryResult(with: responseResults)

        for index in results.indices {
            if let id = results[index].id {
                switch results[index].type {
                    case .person:
                        let actorDetails = await getActorDetails(actorID: id)
                        if let birthday = actorDetails?.birthday {
                            results[index].overview = DateFormatter.localizedDateFormatter.string(from: birthday)
                        }
                    case .movie:
                        let movieDetails = await getMovieDetails(movieId: id)
                        results[index].overview = mapCast(cast: movieDetails?.cast)
                    case .tvSeries:
                        let seriesDetails = await getSeriesDetails(tvID: id)
                        results[index].overview = mapCast(cast: seriesDetails?.cast)
                }
            }
        }

        return results
    }

    private func mapQueryResult(with results: [QueryResult]) -> [SearchItemDataModel] {
        var mappedSearchResults: [SearchItemDataModel] = []

        for result in results {
            switch result.mediaType {
                case .person:
                    mappedSearchResults.append(SearchItemDataModel(type: result.mediaType ?? .movie,
                                                                   id: result.id,
                                                                   name: result.name,
                                                                   imagePath: (Configuration.imageURL ?? "") + (result.profilePath ?? "")))
                case .movie:
                    mappedSearchResults.append(SearchItemDataModel(type: result.mediaType ?? .movie,
                                                                   id: result.id,
                                                                   name: result.title,
                                                                   imagePath: (Configuration.imageURL ?? "") + (result.posterPath ?? "")))
                case .tvSeries:
                    mappedSearchResults.append(SearchItemDataModel(type: result.mediaType ?? .movie,
                                                                   id: result.id,
                                                                   name: result.name,
                                                                   imagePath: (Configuration.imageURL ?? "") + (result.posterPath ?? "")))
                case .none:
                    continue
            }
        }

        return mappedSearchResults
    }

    private func getMovieDetails(movieId: Int) async -> ActorsResponseModel? {
        try? await NetworkService.shared.request(with: RequestObject(
            url: SearchEndpoints.movieCast(movieID: movieId).path),
                                                 responseModel: ActorsResponseModel.self)
    }

    private func getSeriesDetails(tvID: Int) async -> ActorsResponseModel? {
        try? await NetworkService.shared.request(with: RequestObject(
            url: SearchEndpoints.tvCast(tvID: tvID).path),
                                                        responseModel: ActorsResponseModel.self)
    }

    private func getActorDetails(actorID: Int) async -> ActorDetailsResponseModel? {
        try? await NetworkService.shared.request(
            with: RequestObject(url: SearchEndpoints.actorDetails(actorID: actorID).path),
            responseModel: ActorDetailsResponseModel.self)
    }

    private func mapCast(cast: [Cast]?) -> String {
        guard let cast else {
            return ""
        }

        let firstThreeCast = Array(cast.prefix(3))
        let names = firstThreeCast.compactMap { $0.name }

        return names.joined(separator: ", ")
    }
}
