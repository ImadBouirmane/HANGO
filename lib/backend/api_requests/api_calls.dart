import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start SendGrid API Group Code

class SendGridAPIGroup {
  static String baseUrl = 'https://api.sendgrid.com/v3/';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer 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',
  };
  static SendEmailCall sendEmailCall = SendEmailCall();
}

class SendEmailCall {
  Future<ApiCallResponse> call({
    String? receiverEmail = '',
    String? subjectEmail = '',
    String? bodyEmail = '',
  }) {
    final ffApiRequestBody = '''
{
  "personalizations": [
    {
      "to": [
        {
          "email": "${receiverEmail}"
        }
      ],
      "subject": "${subjectEmail}"
    }
  ],
  "content": [
    {
      "type": "text/plain",
      "value": "${bodyEmail}"
    }
  ],
  "from": {
    "email": "contact@hango.ch",
    "name": "HANGO"
  },
  "reply_to": {
    "email": "contact@hango.ch",
    "name": "HANGO"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send Email',
      apiUrl: '${SendGridAPIGroup.baseUrl}mail/send',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer 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',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End SendGrid API Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
