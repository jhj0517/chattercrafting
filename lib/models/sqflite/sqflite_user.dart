import '../../localdb/localdb.dart';

class SQFLiteUser {
  final int? id;
  final String uid;
  final String email;
  final String nickname;
  final String photoUrl;

  SQFLiteUser({
    this.id,
    required this.uid,
    required this.email,
    required this.nickname,
    required this.photoUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      SQFliteHelper.userColumnUid: uid,
      SQFliteHelper.userColumnEmail: email,
      SQFliteHelper.userColumnNickname: nickname,
      SQFliteHelper.userColumnPhotoUrl: photoUrl,
    };
  }

  factory SQFLiteUser.fromMap(Map<String, dynamic> map) {
    return SQFLiteUser(
      id: map[SQFliteHelper.userColumnId] as int,
      uid: map[SQFliteHelper.userColumnUid] as String,
      email: map[SQFliteHelper.userColumnEmail] as String,
      nickname: map[SQFliteHelper.userColumnNickname] as String,
      photoUrl: map[SQFliteHelper.userColumnPhotoUrl] as String,
    );
  }
}
