import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubcategoriesRecord extends FirestoreRecord {
  SubcategoriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "backgroundcolor" field.
  Color? _backgroundcolor;
  Color? get backgroundcolor => _backgroundcolor;
  bool hasBackgroundcolor() => _backgroundcolor != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  bool hasIcon() => _icon != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _question = snapshotData['question'] as String?;
    _backgroundcolor = getSchemaColor(snapshotData['backgroundcolor']);
    _icon = snapshotData['icon'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('subcategories')
          : FirebaseFirestore.instance.collectionGroup('subcategories');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('subcategories').doc(id);

  static Stream<SubcategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubcategoriesRecord.fromSnapshot(s));

  static Future<SubcategoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubcategoriesRecord.fromSnapshot(s));

  static SubcategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubcategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubcategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubcategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubcategoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubcategoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubcategoriesRecordData({
  String? name,
  String? question,
  Color? backgroundcolor,
  String? icon,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'question': question,
      'backgroundcolor': backgroundcolor,
      'icon': icon,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubcategoriesRecordDocumentEquality
    implements Equality<SubcategoriesRecord> {
  const SubcategoriesRecordDocumentEquality();

  @override
  bool equals(SubcategoriesRecord? e1, SubcategoriesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.question == e2?.question &&
        e1?.backgroundcolor == e2?.backgroundcolor &&
        e1?.icon == e2?.icon;
  }

  @override
  int hash(SubcategoriesRecord? e) => const ListEquality()
      .hash([e?.name, e?.question, e?.backgroundcolor, e?.icon]);

  @override
  bool isValidKey(Object? o) => o is SubcategoriesRecord;
}
