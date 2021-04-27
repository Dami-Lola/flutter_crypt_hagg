


///Query params
class QueryGraphQLConfigClients{

///Resend verification

  static String resendVerification(String email){
    return '''
        query{
      resendVerificationCode(data: {
        email:"$email",
      })
}
    
    ''';
  }



  ///Resend verification
  static  getUserProfile(){
    return """
            query 
                {
                 user{
                        _id
                        email
                        phonenumber
                        referralCode
                        username
                        phoneNumberVerified
                        profile{
                          displayName
                          dateOfBirth
                        }
                  }
              }
    """;
  }



}