function fn() {

    var env = karate.env; // get system property 'karate.env' karate.log('karate.env system property was:', env);
    if (!env) {
        env = 'dev';
     }

    var config = {
        env: env,
        myVarName: 'hello karate',
        baseUrl: 'https://gorest.co.in',
        tokenID: '80be1a05d72890b1e62fd70bc54246230f683cdad8836bcf85b7a6a83e1a15ea'
    }

    if (env == 'dev') {
        // customize dev path and username etc for authorizations
    } else if (env == 'e2e') {
        // customize
    }

    return config;
}