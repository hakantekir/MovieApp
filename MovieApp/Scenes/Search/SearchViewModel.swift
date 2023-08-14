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
    @Published var searchResults: [SearchItemDataModel]?
    @Published var isLoading: Bool = false

    func fetchResults() async {
        isLoading = true
        let response = try? await NetworkService.shared.request(
            with: RequestObject(url: SearchEndpoints.multi(query: query).path),
            responseModel: SearchQueryResponseModel.self
        )
        searchResults = await mapResponse(response)
        isLoading = false
    }

    private func mapResponse(_ response: SearchQueryResponseModel?) async -> [SearchItemDataModel] {
        guard let response, let results = response.results else {
            return []
        }

        var mappedSearchResults: [SearchItemDataModel] = []

        for result in results {
            switch result.mediaType {
                case .person:
                let actorDetails = await getActorDetails(actorID: result.id ?? 0)
                mappedSearchResults.append(SearchItemDataModel(type: result.mediaType ?? .movie,
                                                               id: result.id,
                                                               name: result.name,
                                                               overview: DateFormatter.localizedDateFormatter.string(from: actorDetails?.birthday ?? .now),
                                                               imagePath: (Configuration.imageURL ?? "") + (actorDetails?.profilePath ?? "")))
                case .movie:
                let movieDetails = await getMovieDetails(movieId: result.id ?? 0)
                mappedSearchResults.append(SearchItemDataModel(type: result.mediaType ?? .movie,
                                                               id: result.id,
                                                               name: result.title,
                                                               overview: mapCast(cast: movieDetails?.cast),
                                                               imagePath: (Configuration.imageURL ?? "") + (result.posterPath ?? "")))
                case .tvSeries:
                let seriesDetails = await getSeriesDetails(tvID: result.id ?? 0)
                mappedSearchResults.append(SearchItemDataModel(type: result.mediaType ?? .movie,
                                                               id: result.id,
                                                               name: result.name,
                                                               overview: mapCast(cast: seriesDetails?.cast),
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
