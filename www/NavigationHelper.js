var exec = require('cordova/exec');

exports.baiduCheck = function (success) {
    exec(success, null, 'NavigationHelper', 'baiduCheck', []);
};

exports.baiduAddress = function (address, error) {
    exec(null, error, 'NavigationHelper', 'baiduAddress', [address]);
};

exports.baiduPosition = function (longitude, latitude, error) {
    exec(null, error, 'NavigationHelper', 'baiduPosition', [longitude, latitude]);
};

exports.gaodeCheck = function (success) {
    exec(success, null, 'NavigationHelper', 'gaodeCheck', []);
};

exports.gaodeAddress = function (address, error) {
    exec(null, error, 'NavigationHelper', 'gaodeAddress', [address]);
};

exports.gaodePosition = function (name, longitude, latitude, error) {
    exec(null, error, 'NavigationHelper', 'gaodePosition', [name, longitude, latitude]);
};

exports.tencentCheck = function (success) {
    exec(success, null, 'NavigationHelper', 'tencentCheck', []);
};

exports.tencentAddress = function (address, error) {
    exec(null, error, 'NavigationHelper', 'tencentAddress', [address]);
};

exports.tencentPosition = function (longitude, latitude, error) {
    exec(null, error, 'NavigationHelper', 'tencentPosition', [longitude, latitude]);
};
