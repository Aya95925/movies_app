import 'package:flutter_application_new/feature/movies/data/models/remote_movie.dart';
import 'package:flutter_application_new/feature/movies/domain/entities/movie_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class MovieMapper {
  MovieEntity fromRemote(RemoteMovie remote) {
    return MovieEntity(
      id: remote.id ?? 0,
      title: remote.titleLong ?? remote.title ?? 'Unknown Title',
      year: remote.year ?? 0,
      rating: (remote.rating ?? 0.0).toDouble(),
      summary:
          remote.descriptionFull ?? remote.summary ?? 'No summary available.',
      mediumCoverImage: remote.mediumCoverImage ?? '',
      largeCoverImage: remote.largeCoverImage ?? '',

      screenshot1:
          remote.mediumScreenshotImage1 ?? remote.backgroundImage ?? '',
      screenshot2:
          remote.mediumScreenshotImage2 ?? remote.backgroundImageOriginal ?? '',
      screenshot3:
          remote.mediumScreenshotImage3 ?? remote.largeCoverImage ?? '',

      genres: remote.genres ?? [],
      cast: remote.cast?.map(castFromRemote).toList(),
      runtime: remote.runtime ?? 0,
      url: remote.url ?? '',
    );
  }

  List<MovieEntity> listFromRemote(List<RemoteMovie> remoteList) {
    return remoteList.map(fromRemote).toList();
  }

  CastEntity castFromRemote(RemoteCast remote) {
    return CastEntity(
      name: remote.name ?? 'Unknown Actor',
      characterName: remote.characterName ?? 'Unknown Character',
      urlSmallImage: remote.urlSmallImage,
    );
  }
}
