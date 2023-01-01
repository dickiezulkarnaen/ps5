

class DetailEvent {}

class GetDetailEvent extends DetailEvent {
  final int id;
  GetDetailEvent(this.id);
}

class GetScreenShotsEvent extends DetailEvent {
  final int id;
  GetScreenShotsEvent(this.id);
}