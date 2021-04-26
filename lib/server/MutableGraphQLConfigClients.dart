



class MutableGraphQLConfigClients{





///createUser
   String createUser(String email, String username,
      String password, String country,String currency,
      String phonenumber) {
    return """
        mutation{
        register(data: {
          email:"$email",
          username: "$username",
          password: "$password",
          country:" $country,"
          currency: "$currency",
          phonenumber: "$phonenumber",
         
        }){
          token
          user{
            _id
            email
            phonenumber
            referralCode
            username
            phoneNumberVerified
          }
        }
      }
    """;
  }


  ///login
   String login(String email,
          String password) {
        return '''
            mutation{
              login(data: {
                input:"$email",
                password: "$password"
              }){
                token
                user{
                  _id
                  email
                  phonenumber
                  referralCode
                  username
                  phoneNumberVerified
                }
              }
            }
        ''';
      }


  ///    verifyUser with code # Require token
   String verifyUser(int code) {
    return """
            mutation {
                verifyUser(
                  data:{
                    code:$code
                  }
                ){
                  token
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
    }
        """;
  }
}