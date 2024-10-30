import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MenuRecord extends FirestoreRecord {
  MenuRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "price" field.
  String? _price;
  String get price => _price ?? '';
  bool hasPrice() => _price != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "type" field.
  List<String>? _type;
  List<String> get type => _type ?? const [];
  bool hasType() => _type != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _price = snapshotData['price'] as String?;
    _description = snapshotData['description'] as String?;
    _type = getDataList(snapshotData['type']);
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('menu');

  static Stream<MenuRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MenuRecord.fromSnapshot(s));

  static Future<MenuRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MenuRecord.fromSnapshot(s));

  static MenuRecord fromSnapshot(DocumentSnapshot snapshot) => MenuRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MenuRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MenuRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MenuRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MenuRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMenuRecordData({
  String? name,
  String? price,
  String? description,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'price': price,
      'description': description,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class MenuRecordDocumentEquality implements Equality<MenuRecord> {
  const MenuRecordDocumentEquality();

  @override
  bool equals(MenuRecord? e1, MenuRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.price == e2?.price &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.type, e2?.type) &&
        e1?.image == e2?.image;
  }

  @override
  int hash(MenuRecord? e) => const ListEquality()
      .hash([e?.name, e?.price, e?.description, e?.type, e?.image]);

  @override
  bool isValidKey(Object? o) => o is MenuRecord;
}
