


///Query params
class QueryGraphQLConfigClients{

///Resend verification

  static String resendVerification(String email){
    return """
            query{
              resendVerificationCode(data: {
                email:$email,
              })
        }
    """;
  }

  ///response
  ///{
  //   "data": {
  //     "resendVerificationCode": true
  //   }
  // }


  ///Resend verification
  static  getUserProfile(String email){
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