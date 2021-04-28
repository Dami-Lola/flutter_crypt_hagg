


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


  static String resendVerifications(){
    return '''
      query resendToken(\$email: String!){
        
        resendVerificationCode(data: {
          email:\$email,
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
                        emailVerified
                        profile{
                          displayName
                          dateOfBirth
                        }
                  }
              }
    """;
  }



}