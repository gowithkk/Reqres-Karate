function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    apiUrl: 'https://reqres.in/api/'
  }
  if (env == 'dev') {
    config.userEmail = 'eve.holt@reqres.in'
    config.userPwd = 'cityslicka'
  } else if (env == 'qa') {
    config.userEmail = 'eve.holt@reqres.in'
    config.userPwd = 'cityslicka'
  }

  var accessToken = karate.callSingle('classpath:helpers/CreateToken.feature', config).authToken
  karate.configure('headers', {Authorization: 'Token ' + accessToken})

  return config;
}