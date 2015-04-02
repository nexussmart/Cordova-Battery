var exec = require("cordova/exec");
module.exports = {
    getLevel: function(success, failure) {
        var self = this;
        success = success || function() {};
        failure = failure || function() {};

        var succCallback = function(level) {
            if(self.level) {
                success.apply(self, level);
            }
        };

        exec(
            succCallback,
            failure || function() {},
            'Battery',
            'getLevel',
            []
        );
    }
};