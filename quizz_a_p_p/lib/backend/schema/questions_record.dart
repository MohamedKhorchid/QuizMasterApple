import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionsRecord extends FirestoreRecord {
  QuestionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "serie" field.
  String? _serie;
  String get serie => _serie ?? '';
  bool hasSerie() => _serie != null;

  // "answers" field.
  List<String>? _answers;
  List<String> get answers => _answers ?? const [];
  bool hasAnswers() => _answers != null;

  // "number" field.
  int? _number;
  int get number => _number ?? 0;
  bool hasNumber() => _number != null;

  // "correct" field.
  String? _correct;
  String get correct => _correct ?? '';
  bool hasCorrect() => _correct != null;

  void _initializeFields() {
    _question = snapshotData['question'] as String?;
    _serie = snapshotData['serie'] as String?;
    _answers = getDataList(snapshotData['answers']);
    _number = castToType<int>(snapshotData['number']);
    _correct = snapshotData['correct'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('questions');

  static Stream<QuestionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuestionsRecord.fromSnapshot(s));

  static Future<QuestionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuestionsRecord.fromSnapshot(s));

  static QuestionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuestionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuestionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuestionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuestionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuestionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuestionsRecordData({
  String? question,
  String? serie,
  int? number,
  String? correct,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'question': question,
      'serie': serie,
      'number': number,
      'correct': correct,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuestionsRecordDocumentEquality implements Equality<QuestionsRecord> {
  const QuestionsRecordDocumentEquality();

  @override
  bool equals(QuestionsRecord? e1, QuestionsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.question == e2?.question &&
        e1?.serie == e2?.serie &&
        listEquality.equals(e1?.answers, e2?.answers) &&
        e1?.number == e2?.number &&
        e1?.correct == e2?.correct;
  }

  @override
  int hash(QuestionsRecord? e) => const ListEquality()
      .hash([e?.question, e?.serie, e?.answers, e?.number, e?.correct]);

  @override
  bool isValidKey(Object? o) => o is QuestionsRecord;
}
