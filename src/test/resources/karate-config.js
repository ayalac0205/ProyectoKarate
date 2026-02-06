function fn() {
  var config = {};
  config.baseUrl = 'https://serverest.dev';
  config.headers = { 'Content-Type': 'application/json' };
  config.randomEmail = function(prefix){
    var valor = new Date().getTime();
    return (prefix||'user') + valor + '@test.com';
  };
  return config;
}
