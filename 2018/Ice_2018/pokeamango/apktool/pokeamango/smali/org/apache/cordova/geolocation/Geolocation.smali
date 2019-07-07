.class public Lorg/apache/cordova/geolocation/Geolocation;
.super Lorg/apache/cordova/CordovaPlugin;
.source "Geolocation.java"


# instance fields
.field TAG:Ljava/lang/String;

.field context:Lorg/apache/cordova/CallbackContext;

.field permissions:[Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 37
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    .line 39
    const-string v0, "GeolocationPlugin"

    iput-object v0, p0, Lorg/apache/cordova/geolocation/Geolocation;->TAG:Ljava/lang/String;

    .line 42
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "android.permission.ACCESS_COARSE_LOCATION"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "android.permission.ACCESS_FINE_LOCATION"

    aput-object v2, v0, v1

    iput-object v0, p0, Lorg/apache/cordova/geolocation/Geolocation;->permissions:[Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 5
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 46
    iget-object v3, p0, Lorg/apache/cordova/geolocation/Geolocation;->TAG:Ljava/lang/String;

    const-string v4, "We are entering execute"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    iput-object p3, p0, Lorg/apache/cordova/geolocation/Geolocation;->context:Lorg/apache/cordova/CallbackContext;

    .line 48
    const-string v3, "getPermission"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 50
    invoke-virtual {p0}, Lorg/apache/cordova/geolocation/Geolocation;->hasPermisssion()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 52
    new-instance v0, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v0, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 53
    .local v0, "r":Lorg/apache/cordova/PluginResult;
    iget-object v2, p0, Lorg/apache/cordova/geolocation/Geolocation;->context:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v2, v0}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 61
    .end local v0    # "r":Lorg/apache/cordova/PluginResult;
    :goto_0
    return v1

    .line 57
    :cond_0
    iget-object v3, p0, Lorg/apache/cordova/geolocation/Geolocation;->permissions:[Ljava/lang/String;

    invoke-static {p0, v2, v3}, Lorg/apache/cordova/PermissionHelper;->requestPermissions(Lorg/apache/cordova/CordovaPlugin;I[Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    move v1, v2

    .line 61
    goto :goto_0
.end method

.method public hasPermisssion()Z
    .locals 6

    .prologue
    const/4 v1, 0x0

    .line 86
    iget-object v3, p0, Lorg/apache/cordova/geolocation/Geolocation;->permissions:[Ljava/lang/String;

    array-length v4, v3

    move v2, v1

    :goto_0
    if-ge v2, v4, :cond_1

    aget-object v0, v3, v2

    .line 88
    .local v0, "p":Ljava/lang/String;
    invoke-static {p0, v0}, Lorg/apache/cordova/PermissionHelper;->hasPermission(Lorg/apache/cordova/CordovaPlugin;Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 93
    .end local v0    # "p":Ljava/lang/String;
    :goto_1
    return v1

    .line 86
    .restart local v0    # "p":Ljava/lang/String;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 93
    .end local v0    # "p":Ljava/lang/String;
    :cond_1
    const/4 v1, 0x1

    goto :goto_1
.end method

.method public onRequestPermissionResult(I[Ljava/lang/String;[I)V
    .locals 5
    .param p1, "requestCode"    # I
    .param p2, "permissions"    # [Ljava/lang/String;
    .param p3, "grantResults"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 70
    iget-object v2, p0, Lorg/apache/cordova/geolocation/Geolocation;->context:Lorg/apache/cordova/CallbackContext;

    if-eqz v2, :cond_0

    .line 71
    array-length v3, p3

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v3, :cond_2

    aget v0, p3, v2

    .line 72
    .local v0, "r":I
    const/4 v4, -0x1

    if-ne v0, v4, :cond_1

    .line 73
    iget-object v2, p0, Lorg/apache/cordova/geolocation/Geolocation;->TAG:Ljava/lang/String;

    const-string v3, "Permission Denied!"

    invoke-static {v2, v3}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    new-instance v1, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->ILLEGAL_ACCESS_EXCEPTION:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v1, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 75
    .local v1, "result":Lorg/apache/cordova/PluginResult;
    iget-object v2, p0, Lorg/apache/cordova/geolocation/Geolocation;->context:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v2, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 83
    .end local v0    # "r":I
    .end local v1    # "result":Lorg/apache/cordova/PluginResult;
    :cond_0
    :goto_1
    return-void

    .line 71
    .restart local v0    # "r":I
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 80
    .end local v0    # "r":I
    :cond_2
    new-instance v1, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v1, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 81
    .restart local v1    # "result":Lorg/apache/cordova/PluginResult;
    iget-object v2, p0, Lorg/apache/cordova/geolocation/Geolocation;->context:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v2, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_1
.end method

.method public requestPermissions(I)V
    .locals 1
    .param p1, "requestCode"    # I

    .prologue
    .line 103
    iget-object v0, p0, Lorg/apache/cordova/geolocation/Geolocation;->permissions:[Ljava/lang/String;

    invoke-static {p0, p1, v0}, Lorg/apache/cordova/PermissionHelper;->requestPermissions(Lorg/apache/cordova/CordovaPlugin;I[Ljava/lang/String;)V

    .line 104
    return-void
.end method
