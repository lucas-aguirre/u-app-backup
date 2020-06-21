import 'package:flutter/material.dart';

class FileModel {
  const FileModel({
    @required this.id,
    @required this.organizationUuid,
    @required this.path,
    @required this.type,
  });

  factory FileModel.fromJson(Map<String, dynamic> json) {
    if ( json != null ) {
      return FileModel(
        id: int.parse(json['id'].toString()),
        organizationUuid: json['organization']['uuid'],
        path: json['path'],
        type: json['type']
      );
    }

    return null;
  }

  final int id;
  final String organizationUuid;
  final String path;
  final String type;

  String get getFilePath {
    return 'https://storage.ummense.com/' + organizationUuid  + '/' + path;
  }

  String get getFileType {
     switch (type) {
        //Tipos de arquivos de imagem
        case 'bmp': case 'gif': case 'jfif': case 'jpg': case 'jpeg': case 'png': case 'raw': case 'svg': case 'tif': case 'tiff': case 'webp':
          return 'image';

        //Tipos de arquivos de vídeo
        case 'amv': case 'avi': case 'f4a': case 'f4b': case 'f4v': case 'flv': case 'm4a': case 'm4b': case 'm4r': case 'm4v': case 'mkv': case 'mov': case 'mp2': case 'mp4': case 'mpe': case 'mpeg': case 'mpg': case 'mpg2': case 'mpg4': case 'mpv': case 'vob': case 'webm': case 'wmv':
          return 'video';

        //Tipos de arquivos de áudio
        case '3gp': case 'aa': case 'aac': case 'aax': case 'act': case 'amr': case 'ape': case 'au': case 'awb': case 'dct': case 'dss': case 'dvf': case 'flac': case 'gsm': case 'iklax': case 'ivs': case 'm4p': case 'mmf': case 'mp3': case 'mpc': case 'msv': case 'nmf': case 'nsf': case 'ogg': case 'vox': case 'wav': case 'wma': case 'wv': case '8svx':
          return 'audio';

        //Tipos de arquivos de documentos
        case '7z': case 'ai': case 'cdr': case 'csv': case 'doc': case 'docx': case 'eps': case 'indd': case 'odp': case 'ods': case 'odt': case 'otp': case 'pdf': case 'pot': case 'pps': case 'ppt': case 'pptx': case 'psd': case 'rar': case 'rtf': case 'targz': case 'tgz': case 'txt': case 'xls': case 'xlsb': case 'xlsx': case 'xml': case 'xps': case 'zip': case 'zipx':
          return 'document';

        default:
            return 'undefined';
    }
  }

  dynamic get getFileThumbnail {
    switch (getFileType) {
      case 'image':
        return Image.network(getFilePath);
      default:
        return Image(
          image: AssetImage('assets/images/app/file-thumbnails/' + type + '.jpg'),
          fit: BoxFit.contain
        );
    }
  }
}