function generateUser(prefix) {
  var email = karate.properties['email'] || karate.config.randomEmail(prefix);
  var name = 'TestUser_' + Math.floor(Math.random()*10000);
  var password = 'Pass1234!';
  return { nome: name, email: email, password: password, administrador: "false" };
}