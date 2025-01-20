import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SeriesRecord extends FirestoreRecord {
  SeriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "serieID" field.
  String? _serieID;
  String get serieID => _serieID ?? '';
  bool hasSerieID() => _serieID != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "randomkey" field.
  int? _randomkey;
  int get randomkey => _randomkey ?? 0;
  bool hasRandomkey() => _randomkey != null;

  void _initializeFields() {
    _serieID = snapshotData['serieID'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _title = snapshotData['title'] as String?;
    _category = snapshotData['category'] as String?;
    _randomkey = castToType<int>(snapshotData['randomkey']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('series');

  static Stream<SeriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SeriesRecord.fromSnapshot(s));

  static Future<SeriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SeriesRecord.fromSnapshot(s));

  static SeriesRecord fromSnapshot(DocumentSnapshot snapshot) => SeriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SeriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SeriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SeriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SeriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSeriesRecordData({
  String? serieID,
  DateTime? date,
  String? title,
  String? category,
  int? randomkey,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'serieID': serieID,
      'date': date,
      'title': title,
      'category': category,
      'randomkey': randomkey,
    }.withoutNulls,
  );

  return firestoreData;
}

class SeriesRecordDocumentEquality implements Equality<SeriesRecord> {
  const SeriesRecordDocumentEquality();

  @override
  bool equals(SeriesRecord? e1, SeriesRecord? e2) {
    return e1?.serieID == e2?.serieID &&
        e1?.date == e2?.date &&
        e1?.title == e2?.title &&
        e1?.category == e2?.category &&
        e1?.randomkey == e2?.randomkey;
  }

  @override
  int hash(SeriesRecord? e) => const ListEquality()
      .hash([e?.serieID, e?.date, e?.title, e?.category, e?.randomkey]);

  @override
  bool isValidKey(Object? o) => o is SeriesRecord;
}
