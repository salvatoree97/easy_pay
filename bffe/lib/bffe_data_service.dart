import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bffe/firestore/bffe_firestore_executor.dart';
import 'package:bffe/interceptor/bffe_debug_interceptor.dart';
import 'package:bffe/interceptor/bffe_interceptor.dart';
import 'package:bffe/model/cloud_firestore_dto.dart';
import 'package:bffe/model/bffe_service_error.dart';
import 'package:bffe/user/dto/bffe_get_user_dto.dart';
import 'package:bffe/user/dto/bffe_set_user_dto.dart';
import 'package:core/core.dart';

class BffeDataService {
  static late List<BffeInterceptor> interceptors;

  static Future<T> getUser<T>(CloudFirestoreInputDTO<T> dto) async {
    try {
      final firestoreDto = BffeGetUserDTO(dto.toJson());

      final DocumentSnapshot<Map<String, dynamic>> doc =
          await BffeFirestoreExecutor.execute(
        firestoreDto,
        [BffeDebugInterceptor()],
      );

      final json = {'email': doc.id, ...?doc.data()};
      final presentationLayer =
          await firestoreDto.throwableToPresentationLayer(json);

      if (presentationLayer == null) {
        throw BffeServiceError(
          code: 'PR_LAYER_NULL',
          message: 'Il presentation Layer è null',
        );
      }
      return dto.throwableSerialize(presentationLayer);
    } catch (error) {
      Logger.instance.error(error);
      rethrow;
    }
  }

  static Future<T> setUser<T>(CloudFirestoreInputDTO<T> dto) async {
    try {
      final firestoreDto = BffeSetUserDTO(dto.toJson());
      final user =
          await firestoreDto.throwableSerialize(firestoreDto.initialObjectJson);

      final _ = await BffeFirestoreExecutor.execute(
        firestoreDto,
        [BffeDebugInterceptor()],
      );

      final json = {'email': user.email, ...user.toJson()};
      return dto.throwableSerialize(json);
    } catch (error) {
      Logger.instance.error(error);
      rethrow;
    }
  }
}
