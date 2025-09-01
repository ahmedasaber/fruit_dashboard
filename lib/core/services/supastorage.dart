import 'dart:io';
import 'package:fruit_dashboard/core/services/storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../utils/keys.dart';
import 'package:path/path.dart' as b;


class SupaStorageService implements StorageService{
  static late Supabase _supabase;

  static Future<void> supaBaseInit() async{
    _supabase = await Supabase.initialize(
      url: kSupaBaseUrl,
      anonKey: kSupaBaseKey,
    );
  }
  static createBuckets(String bucketName) async{
    final buckets = await _supabase.client.storage.listBuckets();
    bool isBucketExist = false;
    for(var bucket in buckets){
      if(bucket.id == bucketName){
        isBucketExist = true;
        break;
      }
    }
    if(!isBucketExist){
      await _supabase.client.storage.createBucket(bucketName);
    }
  }
  @override
  Future<String> uploadFile(File file, String path) async{
    String baseName = b.basename(file.path);
    await _supabase.client.storage.from(kFruitsImagesBucket).upload('$path/$baseName', file);
    String url =  _supabase.client.storage.from(kFruitsImagesBucket).getPublicUrl('$path/$baseName');
    return url;
  }
  
}