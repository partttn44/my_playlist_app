import 'package:music_app/models/position_data_model.dart';

import 'package:rxdart/rxdart.dart';

Stream<PositionData> combinePositionStreams({
  required Stream<Duration> positionStream,
  required Stream<Duration> bufferedStream,
  required Stream<Duration?>? durationStream,
}) {
  return Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
    positionStream,
    bufferedStream,
    durationStream ?? Stream.value(null),
    (position, buffered, total) =>
        PositionData(position, buffered, total ?? Duration.zero),
  );
}
