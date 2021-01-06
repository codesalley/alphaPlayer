import 'dart:io';

import 'package:alpha/modals/song.dart';
import 'package:audiotagger/audiotagger.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

//TODO  after getting all mp3 files paths, i want to save it on the database 1first 2then render to user from databas.

class AllSongs extends GetxController {
  final allSongsInDevice = <Song>[];
  dynamic songArtWork;

  int get lenght => allSongsInDevice.length;
  @override
  Future<void> onInit() async {
    print('init runner checked');
    super.onInit();
    await getAllSongs();
    print('number of songs ${allSongsInDevice.length}');
  }

  Future<void> getAllSongs() async {
    // request device storage permission using permission handler

    PermissionStatus status = await Permission.storage.request();
// if permission granted
    if (status.isGranted && Platform.isAndroid) {
      //get device storage using path provider

      List<Directory> storagePath = await getExternalStorageDirectories();
      List<Directory> deviceStoragePath = [];

      for (var dir in storagePath) {
        deviceStoragePath.add(Directory(dir.path.split("Android")[0]));
      }

      List<FileSystemEntity> allFoldersInDevice =
          await getAllDeviceFolders(deviceStoragePath);

      searchFolders(allFoldersInDevice);
    } else if (await Permission.storage.isDenied) {
      status = await Permission.storage.request();
    }
  }

  void getAllfilesInFolders(String path) async {
    for (FileSystemEntity file in Directory(path).listSync()) {
      if (FileSystemEntity.isFileSync(file.path) &&
          basename(file.path).endsWith('mp3')) {
        allSongsInDevice.add(await getsongdetails(file.path));
      } else if (FileSystemEntity.isDirectorySync(file.path) &&
          !basename(file.path).endsWith('.') &&
          !file.path.contains('/Android')) {
        getAllfilesInFolders(file.path);
      }
    }
  }

  Future<void> searchFolders(List folders) async {
    for (FileSystemEntity file in folders) {
      if (FileSystemEntity.isFileSync(file.path) &&
          basename(file.path).endsWith('mp3')) {
        allSongsInDevice.add(await getsongdetails(file.path));
      } else if (FileSystemEntity.isDirectorySync(file.path)) {
        getAllfilesInFolders(file.path);
      }
    }
  }

  Future<List<FileSystemEntity>> getAllDeviceFolders(List path) async {
    List<FileSystemEntity> allFoldersInDevice = [];
    for (var dir in path) {
      allFoldersInDevice.addAll([...dir.listSync()]);
    }
    return allFoldersInDevice;
  }

  Future<Song> getsongdetails(String file) async {
    var audiotagger = Audiotagger();

    var audioInfo;
    try {
      audioInfo = await audiotagger.readTagsAsMap(path: file);
    } catch (e) {}
    return Song.fromMap(audioInfo, filePath: file);
  }

  void getArtWork(String path) {
    try {
      Audiotagger().readArtwork(path: path).then((value) =>
          value.length == null ? songArtWork = null : songArtWork = value);
    } catch (e) {
      print(e);
    }
  }
}
