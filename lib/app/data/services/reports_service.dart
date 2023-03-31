import 'package:file_picker/file_picker.dart';
import 'package:project_management_frontend/app/data/models/entities/project.dart';
import 'package:project_management_frontend/app/data/models/entities/report.dart';
import 'package:project_management_frontend/app/data/providers/api_provider.dart';
import 'package:http/http.dart' as http;

class ReportsService
{
  ajouterReport({required String id, required Reports report, required PlatformFile file})
  {

    print(file.readStream);
    print(file.size);
    print(file.name);

    var multipartFile = http.MultipartFile.fromBytes("file", file.bytes!, filename: file.name.split('/').last);

    // add file to multipart


     return ApiProvider().post(
         endpoint: "/v1/project/$id/report",
         body: report.toJson(),
         multipartFile: multipartFile,
        isFormData: true
     );


  }
}