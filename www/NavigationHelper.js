var exec = require('cordova/exec');

exports.baiduCheck = function (success) {
    exec(success, null, 'NavigationHelper', 'baiduCheck', []);
};

exports.baiduAddress = function (address, success, error) {
    exec(success, error, 'NavigationHelper', 'baiduAddress', [address]);
};

exports.baiduPosition = function (longitude, latitude, success, error) {
    exec(success, error, 'NavigationHelper', 'baiduPosition', [longitude, latitude]);
};

exports.gaodeCheck = function (success) {
    exec(success, null, 'NavigationHelper', 'gaodeCheck', []);
};

exports.gaodeAddress = function (address, success, error) {
    exec(success, error, 'NavigationHelper', 'gaodeAddress', [address]);
};

exports.gaodePosition = function (name, longitude, latitude, success, error) {
    exec(success, error, 'NavigationHelper', 'gaodePosition', [name, longitude, latitude]);
};

exports.tencentCheck = function (success) {
    exec(success, null, 'NavigationHelper', 'tencentCheck', []);
};

exports.tencentAddress = function (address, success, error) {
    exec(success, error, 'NavigationHelper', 'tencentAddress', [address]);
};

exports.tencentPosition = function (longitude, latitude, success, error) {
    exec(success, error, 'NavigationHelper', 'tencentPosition', [longitude, latitude]);
};