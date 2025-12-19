import 'package:jwt_decoder/jwt_decoder.dart';

import '../../Domain/Entity/user_entity.dart';

class TokenServices{

  static UserEntity getUserFromToken(String token){
    try{
      final decode = JwtDecoder.decode(token);
      return UserEntity(
          id: decode["sub"],
          email: decode['email'],
          role: decode ['role']
      );
    }catch(error){
      throw Exception('Invalid or corrupted token') ;
    }
  }
  static bool isExpired(String token){
    try{
      return JwtDecoder.isExpired(token);
    }catch(e){
      return true;
    }
  }

}