component {
    this.name = "Showers";

    this.datasources["house"] = {
        class: 'org.postgresql.Driver'
        , bundleName: 'org.postgresql.jdbc42'
        , bundleVersion: '9.4.1212'
        , connectionString: ''
        , username: ''
        , password: ""
        
        // optional settings
        , connectionLimit:100 // default:-1
        , validate:false // default: false
    };

}
