import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class DataBaseServices {
  Future<void> addUser(model) {
    return FirebaseFirestore.instance
        .collection('users')
        .add(model)
        .then((value) => print('User Added'))
        .catchError((error) => print('Failed to add User $error'));
  }

  Stream<dynamic> displayData(documnetId) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(documnetId)
        .snapshots();
  }

  Future<void> deleteData(docId) {
    print(docId);
    return FirebaseFirestore.instance
        .collection('users')
        .doc(docId)
        .delete()
        .then((value) => print('Data Deleted'))
        .catchError((error) => print('Failed to Delete Data $error'));
  }

  Future<void> updateData(docId) {
    print(docId);
    return FirebaseFirestore.instance
        .collection('users')
        .doc(docId)
        .update({})
        .then((value) => print('Data Update'))
        .catchError((error) => print('Failed to Update Data $error'));
  }

  void fireStoreTansactions(transId, type) async {
    print(transId);
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('users').doc(transId);
    return FirebaseFirestore.instance
        .runTransaction((transaction) async {
          DocumentSnapshot documentSnapshot =
              await transaction.get(documentReference);

          if (!documentSnapshot.exists) {
            throw Exception('User does not exists');
          }

          int newFollowerCount = type == 'plus'
              ? documentSnapshot.data()['count'] + 1
              : documentSnapshot.data()['count'] - 1;
          transaction.update(documentReference, {'count': newFollowerCount});

          return newFollowerCount;
        })
        .then((value) => print('follower count updated to $value'))
        .catchError(
            (error) => print('Failed to update user followers: $error'));
  }

  Future<void> batchWeites() {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    WriteBatch batch = FirebaseFirestore.instance.batch();

    return users.get().then(
      (querySnapshot) {
        querySnapshot.docs.forEach(
          (document) {
            batch.delete(document.reference);
          },
        );
        return batch.commit();
      },
    );
  }
}
