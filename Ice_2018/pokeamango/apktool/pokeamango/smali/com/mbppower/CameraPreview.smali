.class public Lcom/mbppower/CameraPreview;
.super Lorg/apache/cordova/CordovaPlugin;
.source "CameraPreview.java"

# interfaces
.implements Lcom/mbppower/CameraActivity$CameraPreviewListener;


# instance fields
.field private final TAG:Ljava/lang/String;

.field private containerViewId:I

.field private fragment:Lcom/mbppower/CameraActivity;

.field private final hideCameraAction:Ljava/lang/String;

.field private final setColorEffectAction:Ljava/lang/String;

.field private final setOnPictureTakenHandlerAction:Ljava/lang/String;

.field private final showCameraAction:Ljava/lang/String;

.field private final startCameraAction:Ljava/lang/String;

.field private final stopCameraAction:Ljava/lang/String;

.field private final switchCameraAction:Ljava/lang/String;

.field private final takePictureAction:Ljava/lang/String;

.field private takePictureCallbackContext:Lorg/apache/cordova/CallbackContext;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 34
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    .line 20
    const-string v0, "CameraPreview"

    iput-object v0, p0, Lcom/mbppower/CameraPreview;->TAG:Ljava/lang/String;

    .line 21
    const-string v0, "setOnPictureTakenHandler"

    iput-object v0, p0, Lcom/mbppower/CameraPreview;->setOnPictureTakenHandlerAction:Ljava/lang/String;

    .line 22
    const-string v0, "setColorEffect"

    iput-object v0, p0, Lcom/mbppower/CameraPreview;->setColorEffectAction:Ljava/lang/String;

    .line 23
    const-string v0, "startCamera"

    iput-object v0, p0, Lcom/mbppower/CameraPreview;->startCameraAction:Ljava/lang/String;

    .line 24
    const-string v0, "stopCamera"

    iput-object v0, p0, Lcom/mbppower/CameraPreview;->stopCameraAction:Ljava/lang/String;

    .line 25
    const-string v0, "switchCamera"

    iput-object v0, p0, Lcom/mbppower/CameraPreview;->switchCameraAction:Ljava/lang/String;

    .line 26
    const-string v0, "takePicture"

    iput-object v0, p0, Lcom/mbppower/CameraPreview;->takePictureAction:Ljava/lang/String;

    .line 27
    const-string v0, "showCamera"

    iput-object v0, p0, Lcom/mbppower/CameraPreview;->showCameraAction:Ljava/lang/String;

    .line 28
    const-string v0, "hideCamera"

    iput-object v0, p0, Lcom/mbppower/CameraPreview;->hideCameraAction:Ljava/lang/String;

    .line 32
    const/4 v0, 0x1

    iput v0, p0, Lcom/mbppower/CameraPreview;->containerViewId:I

    .line 35
    const-string v0, "CameraPreview"

    const-string v1, "Constructing"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    return-void
.end method

.method static synthetic access$000(Lcom/mbppower/CameraPreview;)Lcom/mbppower/CameraActivity;
    .locals 1
    .param p0, "x0"    # Lcom/mbppower/CameraPreview;

    .prologue
    .line 18
    iget-object v0, p0, Lcom/mbppower/CameraPreview;->fragment:Lcom/mbppower/CameraActivity;

    return-object v0
.end method

.method static synthetic access$100(Lcom/mbppower/CameraPreview;)I
    .locals 1
    .param p0, "x0"    # Lcom/mbppower/CameraPreview;

    .prologue
    .line 18
    iget v0, p0, Lcom/mbppower/CameraPreview;->containerViewId:I

    return v0
.end method

.method private hideCamera(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 3
    .param p1, "args"    # Lorg/json/JSONArray;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 226
    iget-object v2, p0, Lcom/mbppower/CameraPreview;->fragment:Lcom/mbppower/CameraActivity;

    if-nez v2, :cond_0

    .line 227
    const/4 v2, 0x0

    .line 235
    :goto_0
    return v2

    .line 230
    :cond_0
    iget-object v2, p0, Lcom/mbppower/CameraPreview;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    .line 231
    .local v0, "fragmentManager":Landroid/app/FragmentManager;
    invoke-virtual {v0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v1

    .line 232
    .local v1, "fragmentTransaction":Landroid/app/FragmentTransaction;
    iget-object v2, p0, Lcom/mbppower/CameraPreview;->fragment:Lcom/mbppower/CameraActivity;

    invoke-virtual {v1, v2}, Landroid/app/FragmentTransaction;->hide(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    .line 233
    invoke-virtual {v1}, Landroid/app/FragmentTransaction;->commit()I

    .line 235
    const/4 v2, 0x1

    goto :goto_0
.end method

.method private setColorEffect(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 7
    .param p1, "args"    # Lorg/json/JSONArray;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 157
    iget-object v6, p0, Lcom/mbppower/CameraPreview;->fragment:Lcom/mbppower/CameraActivity;

    if-nez v6, :cond_0

    .line 195
    :goto_0
    return v4

    .line 161
    :cond_0
    iget-object v6, p0, Lcom/mbppower/CameraPreview;->fragment:Lcom/mbppower/CameraActivity;

    invoke-virtual {v6}, Lcom/mbppower/CameraActivity;->getCamera()Landroid/hardware/Camera;

    move-result-object v0

    .line 162
    .local v0, "camera":Landroid/hardware/Camera;
    if-nez v0, :cond_1

    move v4, v5

    .line 163
    goto :goto_0

    .line 166
    :cond_1
    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v3

    .line 169
    .local v3, "params":Landroid/hardware/Camera$Parameters;
    const/4 v6, 0x0

    :try_start_0
    invoke-virtual {p1, v6}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 171
    .local v2, "effect":Ljava/lang/String;
    const-string v6, "aqua"

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 172
    const-string v6, "aqua"

    invoke-virtual {v3, v6}, Landroid/hardware/Camera$Parameters;->setColorEffect(Ljava/lang/String;)V

    .line 191
    :cond_2
    :goto_1
    iget-object v6, p0, Lcom/mbppower/CameraPreview;->fragment:Lcom/mbppower/CameraActivity;

    invoke-virtual {v6, v3}, Lcom/mbppower/CameraActivity;->setCameraParameters(Landroid/hardware/Camera$Parameters;)V

    move v4, v5

    .line 192
    goto :goto_0

    .line 173
    :cond_3
    const-string v6, "blackboard"

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 174
    const-string v6, "blackboard"

    invoke-virtual {v3, v6}, Landroid/hardware/Camera$Parameters;->setColorEffect(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 193
    .end local v2    # "effect":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 194
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 175
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v2    # "effect":Ljava/lang/String;
    :cond_4
    :try_start_1
    const-string v6, "mono"

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 176
    const-string v6, "mono"

    invoke-virtual {v3, v6}, Landroid/hardware/Camera$Parameters;->setColorEffect(Ljava/lang/String;)V

    goto :goto_1

    .line 177
    :cond_5
    const-string v6, "negative"

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 178
    const-string v6, "negative"

    invoke-virtual {v3, v6}, Landroid/hardware/Camera$Parameters;->setColorEffect(Ljava/lang/String;)V

    goto :goto_1

    .line 179
    :cond_6
    const-string v6, "none"

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 180
    const-string v6, "none"

    invoke-virtual {v3, v6}, Landroid/hardware/Camera$Parameters;->setColorEffect(Ljava/lang/String;)V

    goto :goto_1

    .line 181
    :cond_7
    const-string v6, "posterize"

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_8

    .line 182
    const-string v6, "posterize"

    invoke-virtual {v3, v6}, Landroid/hardware/Camera$Parameters;->setColorEffect(Ljava/lang/String;)V

    goto :goto_1

    .line 183
    :cond_8
    const-string v6, "sepia"

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_9

    .line 184
    const-string v6, "sepia"

    invoke-virtual {v3, v6}, Landroid/hardware/Camera$Parameters;->setColorEffect(Ljava/lang/String;)V

    goto :goto_1

    .line 185
    :cond_9
    const-string v6, "solarize"

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_a

    .line 186
    const-string v6, "solarize"

    invoke-virtual {v3, v6}, Landroid/hardware/Camera$Parameters;->setColorEffect(Ljava/lang/String;)V

    goto :goto_1

    .line 187
    :cond_a
    const-string v6, "whiteboard"

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 188
    const-string v6, "whiteboard"

    invoke-virtual {v3, v6}, Landroid/hardware/Camera$Parameters;->setColorEffect(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method private setOnPictureTakenHandler(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 2
    .param p1, "args"    # Lorg/json/JSONArray;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 246
    const-string v0, "CameraPreview"

    const-string v1, "setOnPictureTakenHandler"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 247
    iput-object p2, p0, Lcom/mbppower/CameraPreview;->takePictureCallbackContext:Lorg/apache/cordova/CallbackContext;

    .line 248
    const/4 v0, 0x1

    return v0
.end method

.method private showCamera(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 3
    .param p1, "args"    # Lorg/json/JSONArray;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 214
    iget-object v2, p0, Lcom/mbppower/CameraPreview;->fragment:Lcom/mbppower/CameraActivity;

    if-nez v2, :cond_0

    .line 215
    const/4 v2, 0x0

    .line 223
    :goto_0
    return v2

    .line 218
    :cond_0
    iget-object v2, p0, Lcom/mbppower/CameraPreview;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    .line 219
    .local v0, "fragmentManager":Landroid/app/FragmentManager;
    invoke-virtual {v0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v1

    .line 220
    .local v1, "fragmentTransaction":Landroid/app/FragmentTransaction;
    iget-object v2, p0, Lcom/mbppower/CameraPreview;->fragment:Lcom/mbppower/CameraActivity;

    invoke-virtual {v1, v2}, Landroid/app/FragmentTransaction;->show(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    .line 221
    invoke-virtual {v1}, Landroid/app/FragmentTransaction;->commit()I

    .line 223
    const/4 v2, 0x1

    goto :goto_0
.end method

.method private startCamera(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 2
    .param p1, "args"    # Lorg/json/JSONArray;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/mbppower/CameraPreview;->fragment:Lcom/mbppower/CameraActivity;

    if-eqz v0, :cond_0

    .line 71
    const/4 v0, 0x0

    .line 127
    :goto_0
    return v0

    .line 73
    :cond_0
    new-instance v0, Lcom/mbppower/CameraActivity;

    invoke-direct {v0}, Lcom/mbppower/CameraActivity;-><init>()V

    iput-object v0, p0, Lcom/mbppower/CameraPreview;->fragment:Lcom/mbppower/CameraActivity;

    .line 74
    iget-object v0, p0, Lcom/mbppower/CameraPreview;->fragment:Lcom/mbppower/CameraActivity;

    invoke-virtual {v0, p0}, Lcom/mbppower/CameraActivity;->setEventListener(Lcom/mbppower/CameraActivity$CameraPreviewListener;)V

    .line 76
    iget-object v0, p0, Lcom/mbppower/CameraPreview;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/mbppower/CameraPreview$1;

    invoke-direct {v1, p0, p1}, Lcom/mbppower/CameraPreview$1;-><init>(Lcom/mbppower/CameraPreview;Lorg/json/JSONArray;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 127
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private stopCamera(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 3
    .param p1, "args"    # Lorg/json/JSONArray;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 200
    iget-object v2, p0, Lcom/mbppower/CameraPreview;->fragment:Lcom/mbppower/CameraActivity;

    if-nez v2, :cond_0

    .line 201
    const/4 v2, 0x0

    .line 210
    :goto_0
    return v2

    .line 204
    :cond_0
    iget-object v2, p0, Lcom/mbppower/CameraPreview;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    .line 205
    .local v0, "fragmentManager":Landroid/app/FragmentManager;
    invoke-virtual {v0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v1

    .line 206
    .local v1, "fragmentTransaction":Landroid/app/FragmentTransaction;
    iget-object v2, p0, Lcom/mbppower/CameraPreview;->fragment:Lcom/mbppower/CameraActivity;

    invoke-virtual {v1, v2}, Landroid/app/FragmentTransaction;->remove(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    .line 207
    invoke-virtual {v1}, Landroid/app/FragmentTransaction;->commit()I

    .line 208
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/mbppower/CameraPreview;->fragment:Lcom/mbppower/CameraActivity;

    .line 210
    const/4 v2, 0x1

    goto :goto_0
.end method

.method private switchCamera(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 1
    .param p1, "args"    # Lorg/json/JSONArray;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 238
    iget-object v0, p0, Lcom/mbppower/CameraPreview;->fragment:Lcom/mbppower/CameraActivity;

    if-nez v0, :cond_0

    .line 239
    const/4 v0, 0x0

    .line 242
    :goto_0
    return v0

    .line 241
    :cond_0
    iget-object v0, p0, Lcom/mbppower/CameraPreview;->fragment:Lcom/mbppower/CameraActivity;

    invoke-virtual {v0}, Lcom/mbppower/CameraActivity;->switchCamera()V

    .line 242
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private takePicture(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 9
    .param p1, "args"    # Lorg/json/JSONArray;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 130
    iget-object v8, p0, Lcom/mbppower/CameraPreview;->fragment:Lcom/mbppower/CameraActivity;

    if-nez v8, :cond_0

    .line 145
    :goto_0
    return v6

    .line 133
    :cond_0
    new-instance v1, Lorg/apache/cordova/PluginResult;

    sget-object v8, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v1, v8}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 134
    .local v1, "pluginResult":Lorg/apache/cordova/PluginResult;
    invoke-virtual {v1, v7}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 135
    invoke-virtual {p2, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 137
    const/4 v8, 0x0

    :try_start_0
    invoke-virtual {p1, v8}, Lorg/json/JSONArray;->getDouble(I)D

    move-result-wide v4

    .line 138
    .local v4, "maxWidth":D
    const/4 v8, 0x1

    invoke-virtual {p1, v8}, Lorg/json/JSONArray;->getDouble(I)D

    move-result-wide v2

    .line 139
    .local v2, "maxHeight":D
    iget-object v8, p0, Lcom/mbppower/CameraPreview;->fragment:Lcom/mbppower/CameraActivity;

    invoke-virtual {v8, v4, v5, v2, v3}, Lcom/mbppower/CameraActivity;->takePicture(DD)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move v6, v7

    .line 145
    goto :goto_0

    .line 141
    .end local v2    # "maxHeight":D
    .end local v4    # "maxWidth":D
    :catch_0
    move-exception v0

    .line 142
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
    .locals 1
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/json/JSONArray;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 41
    const-string v0, "setOnPictureTakenHandler"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 42
    invoke-direct {p0, p2, p3}, Lcom/mbppower/CameraPreview;->setOnPictureTakenHandler(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z

    move-result v0

    .line 66
    :goto_0
    return v0

    .line 44
    :cond_0
    const-string v0, "startCamera"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 45
    invoke-direct {p0, p2, p3}, Lcom/mbppower/CameraPreview;->startCamera(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z

    move-result v0

    goto :goto_0

    .line 47
    :cond_1
    const-string v0, "takePicture"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 48
    invoke-direct {p0, p2, p3}, Lcom/mbppower/CameraPreview;->takePicture(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z

    move-result v0

    goto :goto_0

    .line 50
    :cond_2
    const-string v0, "setColorEffect"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 51
    invoke-direct {p0, p2, p3}, Lcom/mbppower/CameraPreview;->setColorEffect(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z

    move-result v0

    goto :goto_0

    .line 53
    :cond_3
    const-string v0, "stopCamera"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 54
    invoke-direct {p0, p2, p3}, Lcom/mbppower/CameraPreview;->stopCamera(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z

    move-result v0

    goto :goto_0

    .line 56
    :cond_4
    const-string v0, "hideCamera"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 57
    invoke-direct {p0, p2, p3}, Lcom/mbppower/CameraPreview;->hideCamera(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z

    move-result v0

    goto :goto_0

    .line 59
    :cond_5
    const-string v0, "showCamera"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 60
    invoke-direct {p0, p2, p3}, Lcom/mbppower/CameraPreview;->showCamera(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z

    move-result v0

    goto :goto_0

    .line 62
    :cond_6
    const-string v0, "switchCamera"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 63
    invoke-direct {p0, p2, p3}, Lcom/mbppower/CameraPreview;->switchCamera(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z

    move-result v0

    goto :goto_0

    .line 66
    :cond_7
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onPictureTaken(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "originalPicturePath"    # Ljava/lang/String;
    .param p2, "previewPicturePath"    # Ljava/lang/String;

    .prologue
    .line 149
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 150
    .local v0, "data":Lorg/json/JSONArray;
    invoke-virtual {v0, p1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v2

    invoke-virtual {v2, p2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 151
    new-instance v1, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v1, v2, v0}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONArray;)V

    .line 152
    .local v1, "pluginResult":Lorg/apache/cordova/PluginResult;
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 153
    iget-object v2, p0, Lcom/mbppower/CameraPreview;->takePictureCallbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v2, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 154
    return-void
.end method
