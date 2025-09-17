import 'dart:convert';

import 'package:flutter/foundation.dart';

class MusicModel {
  final List<MusicTrack>? tracks;
  MusicModel({this.tracks});

  MusicModel copyWith({ValueGetter<List<MusicTrack>?>? tracks}) {
    return MusicModel(tracks: tracks != null ? tracks() : this.tracks);
  }

  Map<String, dynamic> toMap() {
    return {'tracks': tracks?.map((x) => x.toMap()).toList()};
  }

  factory MusicModel.fromMap(Map<String, dynamic> map) {
    return MusicModel(
      tracks: map['tracks'] != null
          ? List<MusicTrack>.from(
              map['tracks']?.map((x) => MusicTrack.fromMap(x)),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MusicModel.fromJson(String source) =>
      MusicModel.fromMap(json.decode(source));

  @override
  String toString() => 'MusicModel(tracks: $tracks)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MusicModel && listEquals(other.tracks, tracks);
  }

  @override
  int get hashCode => tracks.hashCode;
}

class MusicTrack {
  final int id;
  final String title;
  final String artistName;
  final String albumTitle;
  final int duration;
  final String previewUrl;
  final int position;
  MusicTrack({
    required this.id,
    required this.title,
    required this.artistName,
    required this.albumTitle,
    required this.duration,
    required this.previewUrl,
    required this.position,
  });

  MusicTrack copyWith({
    int? id,
    String? title,
    String? artistName,
    String? albumTitle,
    int? duration,
    String? previewUrl,
    int? position,
  }) {
    return MusicTrack(
      id: id ?? this.id,
      title: title ?? this.title,
      artistName: artistName ?? this.artistName,
      albumTitle: albumTitle ?? this.albumTitle,
      duration: duration ?? this.duration,
      previewUrl: previewUrl ?? this.previewUrl,
      position: position ?? this.position,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'artistName': artistName,
      'albumTitle': albumTitle,
      'duration': duration,
      'previewUrl': previewUrl,
      'position': position,
    };
  }

  factory MusicTrack.fromMap(Map<String, dynamic> map) {
    return MusicTrack(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      artistName: map['artistName'] ?? '',
      albumTitle: map['albumTitle'] ?? '',
      duration: map['duration']?.toInt() ?? 0,
      previewUrl: map['previewUrl'] ?? '',
      position: map['position']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory MusicTrack.fromJson(String source) =>
      MusicTrack.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MusicTrack(id: $id, title: $title, artistName: $artistName, albumTitle: $albumTitle, duration: $duration, previewUrl: $previewUrl, position: $position)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MusicTrack &&
        other.id == id &&
        other.title == title &&
        other.artistName == artistName &&
        other.albumTitle == albumTitle &&
        other.duration == duration &&
        other.previewUrl == previewUrl &&
        other.position == position;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        artistName.hashCode ^
        albumTitle.hashCode ^
        duration.hashCode ^
        previewUrl.hashCode ^
        position.hashCode;
  }
}

class PlayListModel {
  int? id;
  String? title;
  String? description;
  int? duration;
  bool? public;
  bool? isLovedTrack;
  bool? collaborative;
  int? nbTracks;
  int? fans;
  String? link;
  String? share;
  String? picture;
  String? pictureSmall;
  String? pictureMedium;
  String? pictureBig;
  String? pictureXl;
  String? checksum;
  String? tracklist;
  String? creationDate;
  String? addDate;
  String? modDate;
  String? md5Image;
  String? pictureType;
  Creator? creator;
  String? type;
  Tracks? tracks;
  PlayListModel({
    this.id,
    this.title,
    this.description,
    this.duration,
    this.public,
    this.isLovedTrack,
    this.collaborative,
    this.nbTracks,
    this.fans,
    this.link,
    this.share,
    this.picture,
    this.pictureSmall,
    this.pictureMedium,
    this.pictureBig,
    this.pictureXl,
    this.checksum,
    this.tracklist,
    this.creationDate,
    this.addDate,
    this.modDate,
    this.md5Image,
    this.pictureType,
    this.creator,
    this.type,
    this.tracks,
  });

  PlayListModel copyWith({
    ValueGetter<int?>? id,
    ValueGetter<String?>? title,
    ValueGetter<String?>? description,
    ValueGetter<int?>? duration,
    ValueGetter<bool?>? public,
    ValueGetter<bool?>? isLovedTrack,
    ValueGetter<bool?>? collaborative,
    ValueGetter<int?>? nbTracks,
    ValueGetter<int?>? fans,
    ValueGetter<String?>? link,
    ValueGetter<String?>? share,
    ValueGetter<String?>? picture,
    ValueGetter<String?>? pictureSmall,
    ValueGetter<String?>? pictureMedium,
    ValueGetter<String?>? pictureBig,
    ValueGetter<String?>? pictureXl,
    ValueGetter<String?>? checksum,
    ValueGetter<String?>? tracklist,
    ValueGetter<String?>? creationDate,
    ValueGetter<String?>? addDate,
    ValueGetter<String?>? modDate,
    ValueGetter<String?>? md5Image,
    ValueGetter<String?>? pictureType,
    ValueGetter<Creator?>? creator,
    ValueGetter<String?>? type,
    ValueGetter<Tracks?>? tracks,
  }) {
    return PlayListModel(
      id: id != null ? id() : this.id,
      title: title != null ? title() : this.title,
      description: description != null ? description() : this.description,
      duration: duration != null ? duration() : this.duration,
      public: public != null ? public() : this.public,
      isLovedTrack: isLovedTrack != null ? isLovedTrack() : this.isLovedTrack,
      collaborative: collaborative != null
          ? collaborative()
          : this.collaborative,
      nbTracks: nbTracks != null ? nbTracks() : this.nbTracks,
      fans: fans != null ? fans() : this.fans,
      link: link != null ? link() : this.link,
      share: share != null ? share() : this.share,
      picture: picture != null ? picture() : this.picture,
      pictureSmall: pictureSmall != null ? pictureSmall() : this.pictureSmall,
      pictureMedium: pictureMedium != null
          ? pictureMedium()
          : this.pictureMedium,
      pictureBig: pictureBig != null ? pictureBig() : this.pictureBig,
      pictureXl: pictureXl != null ? pictureXl() : this.pictureXl,
      checksum: checksum != null ? checksum() : this.checksum,
      tracklist: tracklist != null ? tracklist() : this.tracklist,
      creationDate: creationDate != null ? creationDate() : this.creationDate,
      addDate: addDate != null ? addDate() : this.addDate,
      modDate: modDate != null ? modDate() : this.modDate,
      md5Image: md5Image != null ? md5Image() : this.md5Image,
      pictureType: pictureType != null ? pictureType() : this.pictureType,
      creator: creator != null ? creator() : this.creator,
      type: type != null ? type() : this.type,
      tracks: tracks != null ? tracks() : this.tracks,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'duration': duration,
      'public': public,
      'isLovedTrack': isLovedTrack,
      'collaborative': collaborative,
      'nbTracks': nbTracks,
      'fans': fans,
      'link': link,
      'share': share,
      'picture': picture,
      'pictureSmall': pictureSmall,
      'pictureMedium': pictureMedium,
      'pictureBig': pictureBig,
      'pictureXl': pictureXl,
      'checksum': checksum,
      'tracklist': tracklist,
      'creationDate': creationDate,
      'addDate': addDate,
      'modDate': modDate,
      'md5Image': md5Image,
      'pictureType': pictureType,
      'creator': creator?.toMap(),
      'type': type,
      'tracks': tracks?.toMap(),
    };
  }

  factory PlayListModel.fromMap(Map<String, dynamic> map) {
    return PlayListModel(
      id: map['id']?.toInt(),
      title: map['title'],
      description: map['description'],
      duration: map['duration']?.toInt(),
      public: map['public'],
      isLovedTrack: map['isLovedTrack'],
      collaborative: map['collaborative'],
      nbTracks: map['nbTracks']?.toInt(),
      fans: map['fans']?.toInt(),
      link: map['link'],
      share: map['share'],
      picture: map['picture'],
      pictureSmall: map['pictureSmall'],
      pictureMedium: map['pictureMedium'],
      pictureBig: map['pictureBig'],
      pictureXl: map['pictureXl'],
      checksum: map['checksum'],
      tracklist: map['tracklist'],
      creationDate: map['creationDate'],
      addDate: map['addDate'],
      modDate: map['modDate'],
      md5Image: map['md5Image'],
      pictureType: map['pictureType'],
      creator: map['creator'] != null ? Creator.fromMap(map['creator']) : null,
      type: map['type'],
      tracks: map['tracks'] != null ? Tracks.fromMap(map['tracks']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlayListModel.fromJson(String source) =>
      PlayListModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PlayListModel(id: $id, title: $title, description: $description, duration: $duration, public: $public, isLovedTrack: $isLovedTrack, collaborative: $collaborative, nbTracks: $nbTracks, fans: $fans, link: $link, share: $share, picture: $picture, pictureSmall: $pictureSmall, pictureMedium: $pictureMedium, pictureBig: $pictureBig, pictureXl: $pictureXl, checksum: $checksum, tracklist: $tracklist, creationDate: $creationDate, addDate: $addDate, modDate: $modDate, md5Image: $md5Image, pictureType: $pictureType, creator: $creator, type: $type, tracks: $tracks)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PlayListModel &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.duration == duration &&
        other.public == public &&
        other.isLovedTrack == isLovedTrack &&
        other.collaborative == collaborative &&
        other.nbTracks == nbTracks &&
        other.fans == fans &&
        other.link == link &&
        other.share == share &&
        other.picture == picture &&
        other.pictureSmall == pictureSmall &&
        other.pictureMedium == pictureMedium &&
        other.pictureBig == pictureBig &&
        other.pictureXl == pictureXl &&
        other.checksum == checksum &&
        other.tracklist == tracklist &&
        other.creationDate == creationDate &&
        other.addDate == addDate &&
        other.modDate == modDate &&
        other.md5Image == md5Image &&
        other.pictureType == pictureType &&
        other.creator == creator &&
        other.type == type &&
        other.tracks == tracks;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        duration.hashCode ^
        public.hashCode ^
        isLovedTrack.hashCode ^
        collaborative.hashCode ^
        nbTracks.hashCode ^
        fans.hashCode ^
        link.hashCode ^
        share.hashCode ^
        picture.hashCode ^
        pictureSmall.hashCode ^
        pictureMedium.hashCode ^
        pictureBig.hashCode ^
        pictureXl.hashCode ^
        checksum.hashCode ^
        tracklist.hashCode ^
        creationDate.hashCode ^
        addDate.hashCode ^
        modDate.hashCode ^
        md5Image.hashCode ^
        pictureType.hashCode ^
        creator.hashCode ^
        type.hashCode ^
        tracks.hashCode;
  }
}

class Creator {
  final int id;
  final String name;
  final String tracklist;
  final String type;

  Creator({
    required this.id,
    required this.name,
    required this.tracklist,
    required this.type,
  });

  Creator copyWith({
    ValueGetter<int>? id,
    ValueGetter<String>? name,
    ValueGetter<String>? tracklist,
    ValueGetter<String>? type,
  }) {
    return Creator(
      id: id != null ? id() : this.id,
      name: name != null ? name() : this.name,
      tracklist: tracklist != null ? tracklist() : this.tracklist,
      type: type != null ? type() : this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'tracklist': tracklist, 'type': type};
  }

  factory Creator.fromMap(Map<String, dynamic> map) {
    return Creator(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      tracklist: map['tracklist'] ?? '',
      type: map['type'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());
  factory Creator.fromJson(String source) =>
      Creator.fromMap(json.decode(source));

  @override
  String toString() =>
      'Creator(id: $id, name: $name, tracklist: $tracklist, type: $type)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Creator &&
          other.id == id &&
          other.name == name &&
          other.tracklist == tracklist &&
          other.type == type);

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ tracklist.hashCode ^ type.hashCode;
}

class Tracks {
  final List<Data> data;
  final String checksum;

  Tracks({required this.data, required this.checksum});

  Tracks copyWith({
    ValueGetter<List<Data>>? data,
    ValueGetter<String>? checksum,
  }) {
    return Tracks(
      data: data != null ? data() : this.data,
      checksum: checksum != null ? checksum() : this.checksum,
    );
  }

  Map<String, dynamic> toMap() => {
    'data': data.map((x) => x.toMap()).toList(),
    'checksum': checksum,
  };

  factory Tracks.fromMap(Map<String, dynamic> map) => Tracks(
    data: map['data'] != null
        ? List<Data>.from(map['data'].map((x) => Data.fromMap(x)))
        : [],
    checksum: map['checksum'] ?? '',
  );

  String toJson() => json.encode(toMap());
  factory Tracks.fromJson(String source) => Tracks.fromMap(json.decode(source));

  @override
  String toString() => 'Tracks(data: $data, checksum: $checksum)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tracks &&
          listEquals(other.data, data) &&
          other.checksum == checksum);

  @override
  int get hashCode => data.hashCode ^ checksum.hashCode;
}

class Data {
  final int id;
  final bool readable;
  final String title;
  final String titleShort;
  final String titleVersion;
  final String isrc;
  final String link;
  final int duration;
  final int rank;
  final bool explicitLyrics;
  final int explicitContentLyrics;
  final int explicitContentCover;
  final String preview;
  final String md5Image;
  final int timeAdd;
  final Artist artist;
  final Album album;
  final String type;

  Data({
    required this.id,
    required this.readable,
    required this.title,
    required this.titleShort,
    required this.titleVersion,
    required this.isrc,
    required this.link,
    required this.duration,
    required this.rank,
    required this.explicitLyrics,
    required this.explicitContentLyrics,
    required this.explicitContentCover,
    required this.preview,
    required this.md5Image,
    required this.timeAdd,
    required this.artist,
    required this.album,
    required this.type,
  });

  Data copyWith({
    ValueGetter<int>? id,
    ValueGetter<bool>? readable,
    ValueGetter<String>? title,
    ValueGetter<String>? titleShort,
    ValueGetter<String>? titleVersion,
    ValueGetter<String>? isrc,
    ValueGetter<String>? link,
    ValueGetter<int>? duration,
    ValueGetter<int>? rank,
    ValueGetter<bool>? explicitLyrics,
    ValueGetter<int>? explicitContentLyrics,
    ValueGetter<int>? explicitContentCover,
    ValueGetter<String>? preview,
    ValueGetter<String>? md5Image,
    ValueGetter<int>? timeAdd,
    ValueGetter<Artist>? artist,
    ValueGetter<Album>? album,
    ValueGetter<String>? type,
  }) {
    return Data(
      id: id != null ? id() : this.id,
      readable: readable != null ? readable() : this.readable,
      title: title != null ? title() : this.title,
      titleShort: titleShort != null ? titleShort() : this.titleShort,
      titleVersion: titleVersion != null ? titleVersion() : this.titleVersion,
      isrc: isrc != null ? isrc() : this.isrc,
      link: link != null ? link() : this.link,
      duration: duration != null ? duration() : this.duration,
      rank: rank != null ? rank() : this.rank,
      explicitLyrics: explicitLyrics != null
          ? explicitLyrics()
          : this.explicitLyrics,
      explicitContentLyrics: explicitContentLyrics != null
          ? explicitContentLyrics()
          : this.explicitContentLyrics,
      explicitContentCover: explicitContentCover != null
          ? explicitContentCover()
          : this.explicitContentCover,
      preview: preview != null ? preview() : this.preview,
      md5Image: md5Image != null ? md5Image() : this.md5Image,
      timeAdd: timeAdd != null ? timeAdd() : this.timeAdd,
      artist: artist != null ? artist() : this.artist,
      album: album != null ? album() : this.album,
      type: type != null ? type() : this.type,
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'readable': readable,
    'title': title,
    'titleShort': titleShort,
    'titleVersion': titleVersion,
    'isrc': isrc,
    'link': link,
    'duration': duration,
    'rank': rank,
    'explicitLyrics': explicitLyrics,
    'explicitContentLyrics': explicitContentLyrics,
    'explicitContentCover': explicitContentCover,
    'preview': preview,
    'md5Image': md5Image,
    'timeAdd': timeAdd,
    'artist': artist.toMap(),
    'album': album.toMap(),
    'type': type,
  };

  factory Data.fromMap(Map<String, dynamic> map) => Data(
    id: map['id']?.toInt() ?? 0,
    readable: map['readable'] ?? false,
    title: map['title'] ?? '',
    titleShort: map['titleShort'] ?? '',
    titleVersion: map['titleVersion'] ?? '',
    isrc: map['isrc'] ?? '',
    link: map['link'] ?? '',
    duration: map['duration']?.toInt() ?? 0,
    rank: map['rank']?.toInt() ?? 0,
    explicitLyrics: map['explicitLyrics'] ?? false,
    explicitContentLyrics: map['explicitContentLyrics']?.toInt() ?? 0,
    explicitContentCover: map['explicitContentCover']?.toInt() ?? 0,
    preview: map['preview'] ?? '',
    md5Image: map['md5Image'] ?? '',
    timeAdd: map['timeAdd']?.toInt() ?? 0,
    artist: map['artist'] != null
        ? Artist.fromMap(map['artist'])
        : Artist(id: 0, name: '', link: '', tracklist: '', type: ''),
    album: map['album'] != null
        ? Album.fromMap(map['album'])
        : Album(
            id: 0,
            title: '',
            upc: '',
            cover: '',
            coverSmall: '',
            coverMedium: '',
            coverBig: '',
            coverXl: '',
            md5Image: '',
            tracklist: '',
            type: '',
          ),
    type: map['type'] ?? '',
  );

  String toJson() => json.encode(toMap());
  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() => 'Data(id: $id, title: $title, type: $type)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Data &&
          other.id == id &&
          other.title == title &&
          other.artist == artist &&
          other.album == album &&
          other.type == type);

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      artist.hashCode ^
      album.hashCode ^
      type.hashCode;
}

class Artist {
  final int id;
  final String name;
  final String link;
  final String tracklist;
  final String type;

  Artist({
    required this.id,
    required this.name,
    required this.link,
    required this.tracklist,
    required this.type,
  });

  Artist copyWith({
    ValueGetter<int>? id,
    ValueGetter<String>? name,
    ValueGetter<String>? link,
    ValueGetter<String>? tracklist,
    ValueGetter<String>? type,
  }) {
    return Artist(
      id: id != null ? id() : this.id,
      name: name != null ? name() : this.name,
      link: link != null ? link() : this.link,
      tracklist: tracklist != null ? tracklist() : this.tracklist,
      type: type != null ? type() : this.type,
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'link': link,
    'tracklist': tracklist,
    'type': type,
  };
  factory Artist.fromMap(Map<String, dynamic> map) => Artist(
    id: map['id']?.toInt() ?? 0,
    name: map['name'] ?? '',
    link: map['link'] ?? '',
    tracklist: map['tracklist'] ?? '',
    type: map['type'] ?? '',
  );

  String toJson() => json.encode(toMap());
  factory Artist.fromJson(String source) => Artist.fromMap(json.decode(source));

  @override
  String toString() => 'Artist(id: $id, name: $name)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Artist &&
          other.id == id &&
          other.name == name &&
          other.link == link &&
          other.tracklist == tracklist &&
          other.type == type);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      link.hashCode ^
      tracklist.hashCode ^
      type.hashCode;
}

class Album {
  final int id;
  final String title;
  final String upc;
  final String cover;
  final String coverSmall;
  final String coverMedium;
  final String coverBig;
  final String coverXl;
  final String md5Image;
  final String tracklist;
  final String type;

  Album({
    required this.id,
    required this.title,
    required this.upc,
    required this.cover,
    required this.coverSmall,
    required this.coverMedium,
    required this.coverBig,
    required this.coverXl,
    required this.md5Image,
    required this.tracklist,
    required this.type,
  });

  Album copyWith({
    ValueGetter<int>? id,
    ValueGetter<String>? title,
    ValueGetter<String>? upc,
    ValueGetter<String>? cover,
    ValueGetter<String>? coverSmall,
    ValueGetter<String>? coverMedium,
    ValueGetter<String>? coverBig,
    ValueGetter<String>? coverXl,
    ValueGetter<String>? md5Image,
    ValueGetter<String>? tracklist,
    ValueGetter<String>? type,
  }) {
    return Album(
      id: id != null ? id() : this.id,
      title: title != null ? title() : this.title,
      upc: upc != null ? upc() : this.upc,
      cover: cover != null ? cover() : this.cover,
      coverSmall: coverSmall != null ? coverSmall() : this.coverSmall,
      coverMedium: coverMedium != null ? coverMedium() : this.coverMedium,
      coverBig: coverBig != null ? coverBig() : this.coverBig,
      coverXl: coverXl != null ? coverXl() : this.coverXl,
      md5Image: md5Image != null ? md5Image() : this.md5Image,
      tracklist: tracklist != null ? tracklist() : this.tracklist,
      type: type != null ? type() : this.type,
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'upc': upc,
    'cover': cover,
    'coverSmall': coverSmall,
    'coverMedium': coverMedium,
    'coverBig': coverBig,
    'coverXl': coverXl,
    'md5Image': md5Image,
    'tracklist': tracklist,
    'type': type,
  };

  factory Album.fromMap(Map<String, dynamic> map) => Album(
    id: map['id']?.toInt() ?? 0,
    title: map['title'] ?? '',
    upc: map['upc'] ?? '',
    cover: map['cover'] ?? '',
    coverSmall: map['coverSmall'] ?? '',
    coverMedium: map['coverMedium'] ?? '',
    coverBig: map['coverBig'] ?? '',
    coverXl: map['coverXl'] ?? '',
    md5Image: map['md5Image'] ?? '',
    tracklist: map['tracklist'] ?? '',
    type: map['type'] ?? '',
  );

  String toJson() => json.encode(toMap());
  factory Album.fromJson(String source) => Album.fromMap(json.decode(source));

  @override
  String toString() => 'Album(id: $id, title: $title, type: $type)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Album &&
          other.id == id &&
          other.title == title &&
          other.tracklist == tracklist &&
          other.type == type);

  @override
  int get hashCode =>
      id.hashCode ^ title.hashCode ^ tracklist.hashCode ^ type.hashCode;
}
