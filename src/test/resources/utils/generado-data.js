function(prefix) {
  var randomEmailFn = karate.get('randomEmail');
  var email = karate.properties['email'] || randomEmailFn(prefix);
  var name = 'TestUser_' + Math.floor(Math.random() * 10000);
  var password = 'Pass1234!';

  return {
    nome: name,
    email: email,
    password: password,
    administrador: "false"
  };
}