import 'package:bffe/model/bffe_service_error.dart';
import 'package:flutter/foundation.dart';
import 'package:core/core.dart';

abstract class CloudFirestoreInputDTO<T> {
  Map<String, dynamic> toJson();

  ///Use this function to map the responseJson in the exepted model. Typically used with model factory method: RequestOutput.fromJson(json).
  T serialize(Map<String, dynamic> json);

  Future<T> throwableSerialize(Map<String, dynamic> json) async {
    try {
      return compute(serialize, json);
    } catch (error) {
      Logger.instance.error(error);
      rethrow;
    }
  }
}

abstract class CloudFirestoreBffeDTO<Encodable> {
  final Map<String, dynamic> initialObjectJson;
  Encodable? object;
  CloudFirestoreBffeDTO(this.initialObjectJson);

  Encodable initializeFromJson(Map<String, dynamic> json);

  Map<String, dynamic>? toPresentationLayerJson(Map<String, dynamic>? json);

  Map<String, dynamic>? toJson();

  Future<Encodable> throwableSerialize(Map<String, dynamic> json) async {
    try {
      object = await compute(initializeFromJson, json);
      return object!;
    } catch (error) {
      Logger.instance.error('error: $error');
      final bffeError = BffeServiceError(
        code: 'DTO_SER_DECODE_ERROR',
        message: 'Errore durante la decodifica di $json',
        defaultError: error,
      );
      Logger.instance.error('error: $bffeError');
      throw bffeError;
    }
  }

  Future<Map<String, dynamic>?> throwableToPresentationLayer(
      Map<String, dynamic>? json) async {
    try {
      return compute(toPresentationLayerJson, json);
    } catch (error) {
      Logger.instance.error('error: $error');
      final bffeError = BffeServiceError(
        code: 'PR_LAYER_ENCODE_ERROR',
        message: 'Errore durante la ',
        defaultError: error,
      );
      Logger.instance.error('error: $bffeError');
      throw bffeError;
    }
  }
}
