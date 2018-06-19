# cordova-plugin-navigationhelper
Check And Use Navigation Application

# Install
cordova plugin add https://github.com/lwz467666145/cordova-plugin-navigationhelper.git --variable TENCENT_KEY=TencentKey

# Use

### baiduCheck 验证是否安装了百度地图
```javascript
navigator.navigationHelper.baiduCheck(function (flag) {
    // 验证成功回调方法
    // flag - true: 已安装; false: 未安装
});
```

### baiduAddress 根据地址调起百度地图
```javascript
// address - 查询地址
navigator.navigationHelper.baiduAddress(address, function () {
    // 调起失败回调方法
});
```

### baiduPosition 根据经纬度调起百度地图
```javascript
// longitude - 经度
// latitude  - 纬度
navigator.navigationHelper.baiduPosition(longitude, latitude, function () {
    // 调起失败回调方法
});
```

### gaodeCheck 验证是否安装了高德地图
```javascript
navigator.navigationHelper.gaodeCheck(function (flag) {
    // 验证成功回调方法
    // flag - true: 已安装; false: 未安装
});
```

### gaodeAddress 根据地址调起高德地图
```javascript
// address - 查询地址
navigator.navigationHelper.gaodeAddress(address, function () {
    // 调起失败回调方法
});
```

### gaodePosition 根据经纬度调起高德地图
```javascript
// name      - 地址描述
// longitude - 经度
// latitude  - 纬度
navigator.navigationHelper.gaodePosition(name, longitude, latitude, function () {
    // 调起失败回调方法
});
```

### tencentCheck 验证是否安装了腾讯地图
```javascript
navigator.navigationHelper.tencentCheck(function (flag) {
    // 验证成功回调方法
    // flag - true: 已安装; false: 未安装
});
```

### tencentAddress 根据地址调起腾讯地图
```javascript
// address - 查询地址
navigator.navigationHelper.tencentAddress(address, function () {
    // 调起失败回调方法
});
```

### tencentPosition 根据经纬度调起腾讯地图
```javascript
// longitude - 经度
// latitude  - 纬度
navigator.navigationHelper.tencentPosition(longitude, latitude, function () {
    // 调起失败回调方法
});
```
